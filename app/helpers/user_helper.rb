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
    c = current_user
    if c == user || c.friends.include?(user) || c.pending_friends.include?(user) || user.pending_friends.include?(c)
      return
    end

    link_to 'Add as friend',
            user_friendships_path(current_user,
                                  friendship: { friend_id: user.id,
                                                confirmed: true }), method: :post, class: 'btn-1 green_btn'
  end

  def accept_friend_request(user)
    f = Friendship.find_by(user_id: user.id, friend_id: current_user.id)
    c = current_user
    return if f.nil? || c.friends.include?(user) || f.user_id == c.id

    link_to 'Accept as friend',
            user_friendship_path(user, id: f.id, confirmed: true,
                                       friendship: { friend_id: c.id, confirmed: true }),
            method: :put,
            class: 'btn-1 green_btn'
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
end
