module UserHelper
  def toggle_friend_request(user)
    c = current_user
    return if c == user || user.pending_friends.include?(c)

    return 'Friends' if c.friends.include?(user)

    return 'Pending request' if c.pending_friends.include?(user)

    link_to 'Add as friend',
            user_friendships_path(current_user, confirmed: false,
                                                friendship: { friend_id: user.id }),
            method: :post, class: 'btn-1 green_btn'
  end

  def accept_friend_request(user)
    f = Friendship.find_by(user_id: user.id, friend_id: current_user.id)
    c = current_user
    return if f.nil? || c.friends.include?(user) || f.user_id == c.id

    link_to 'Accept as friend',
            user_friendship_path(user, id: f.id, confirmed: true,
                                       friendship: { friend_id: c.id }),
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

  def reject_friend_request(user)
    f = Friendship.find_by(user_id: user.id, friend_id: current_user.id)
    c = current_user
    return if f.nil? || c.friends.include?(user) || f.user_id == c.id

    link_to 'Reject request',
            user_friendship_path(user, id: f.id,
                                       friendship: { friend_id: c.id, confirmed: true }),
            method: :delete,
            class: 'btn-1 green_btn'
  end
end
