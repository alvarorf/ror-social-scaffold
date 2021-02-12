module PostHelper
  def display_errors(post)
    return unless post.errors.full_messages.any?

    content_tag :p, "Post could not be saved. #{post.errors.full_messages.join('. ')}", class: 'errors'
  end
  def filter_friends_posts(post)
    u = User.where('id = ?', Post.where('id = ?', post.id).first.user_id).first
    u.friends.each do |f|
      return post if f.id == current_user.id
    end
    nil
  end

  def filter_only_friend_posts(timeline_posts)
    current_user.friends #Friendship.where('user_id = ?', current_user.id)
  end
end
