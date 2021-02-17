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

  def filter_only_friend_posts(_timeline_posts)
    current_user.friends
  end

  def only_friends_posts(post)
    unless current_user.friends.include?(User.find_by(id: post.user_id)) || post.user_id == current_user.id || post.nil?
      return
    end

    render partial: 'post', locals: { post: post }
  end
end
