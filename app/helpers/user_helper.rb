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
    return unless current_user != user && current_user.friends.include?(user)

    link_to 'Add as friend',
            user_friendships_path(current_user,
                                  friendship: { friend_id: user.id,
                                                confirmed: true }), method: :put, class: 'btn-1 green_btn'
  end

  def list_friend_requests(user)
    return if user.friend_requests.nil?

    friends = User.find_by(id: user.id).friend_requests
    a = []
    friends.each do |f|
      a.push f
    end
    a
  end

  def list_friends(user)
    a = []
    user.friends.each do |f|
      a.push f
    end
    a
  end
end
