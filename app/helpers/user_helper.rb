module UserHelper
  def show_invite_link(user)
    unless current_user.friends.include? user
      set_new_friend(user)
      link_to 'Send friendship request', new_friendship_path
    end
  end

  #def set_new_friend(user)
  #  @new_friend = user
  #  puts "Hello #{@new_friend}"
  #end
  def check_if_pending(user)
    Friendship.where('user_id = ?', current_user.id)
  end
  def toggle_friend_request(user)
    if current_user != user
      link_to 'Add as friend', user_friendships_path(current_user, friendship: { friend_id: user.id, confirmed: false}), method: :post, class: 'btn-1 green_btn'
    end
  end
end