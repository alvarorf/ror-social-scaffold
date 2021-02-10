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
end