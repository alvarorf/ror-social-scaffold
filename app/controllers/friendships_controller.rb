class FriendshipsController < ApplicationController
  before_action :set_friendship, only: %i[show edit update destroy]

  # GET /friendships
  # GET /friendships.json
  def index
    @friendships = Friendship.all
  end

  # GET /friendships/1
  # GET /friendships/1.json
  def show; end

  # GET /friendships/new
  def new
    @friendship = Friendship.new
    # @new_friend = User.find(params[:new_friend])
  end

  # GET /friendships/1/edit
  def edit; end

  # POST /friendships
  # POST /friendships.json
  def create
    @friendship = current_user.friendships.build(friendship_params)
    @friendship.confirmed = params[:confirmed]

    if @friendship.save
      flash[:notice] = 'Friendship was saved correctly.'
      redirect_back(fallback_location: new_user_friendship_path)
    else
      render :new
    end
  end

  # PATCH/PUT /friendships/1
  # PATCH/PUT /friendships/1.json
  def update
    @friendship.confirmed = params[:confirmed]
    respond_to do |format|
      if @friendship.update(friendship_params)
        @friendship.confirmed = true
        format.html { redirect_to users_path, notice: 'Friendship was successfully updated.' }
      else
        format.html { render :edit }
      end
    end
  end

  # DELETE /friendships/1
  # DELETE /friendships/1.json
  def destroy
    @friendship.destroy
    respond_to do |format|
      format.html { redirect_to friendships_url, notice: 'Friendship was successfully destroyed.' }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_friendship
    @friendship = Friendship.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def friendship_params
    params.require(:friendship).permit(:friend_id, :confirmed)
  end
end
