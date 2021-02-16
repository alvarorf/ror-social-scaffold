module UserHelper
  def show_invite_link(user)
    return if current_user.friends.include? user

    set_new_friend(user)
    link_to 'Send friendship request', new_friendship_path
  end

  def check_if_pending(_user)
    Friendship.where('user_id = ?', current_user.id)
  end

  def toggle_friend_request(user)
    return if current_user == user || current_user.friends.include?(user) || current_user.pending_friends.include?(user) || user.pending_friends.include?(current_user)

    link_to 'Add as friend',
            user_friendships_path(current_user, :confirmed => true,:my_param => 'value'
                                  friendship: { friend_id: user.id}, :action => :update), class: 'btn-1 green_btn'
    #end
  end

  def accept_friend_request(user)
    f = Friendship.find_by(user_id: user.id, friend_id: current_user.id)
    return if f.nil? || current_user.friends.include?(user) || f.user_id == current_user.id

    link_to 'Accept as friend',
            user_friendship_path(user, id: f.id, confirmed: true,
                                  friendship: { friend_id: current_user.id, confirmed: true}), method: :put, class: 'btn-1 green_btn'
  end

  def list_friend_requests(user)
    fr = User.find_by(id: user.id).friend_requests
    a = []
    fr.each do |f|
      a.push f
    end
    a
  end

  def call_accept(id)
    accept_friend_request(id)
  end

  def list_friends(user)
    a = []
    user.friends.each do |f|
      a.push f
    end
    a
  end

  #def show_accept_request(f)
  #  link_to 'Accept as a friend',
  #  user_friendships_path(current_user, :confirmed => true,
  #                        friendship: { friend_id: f.id}), method: :update, class: 'btn-1 green_btn'
  #end
end
