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
    current_user.friends # Friendship.where('user_id = ?', current_user.id)
  end

  def only_friends_posts(post)
    # current_user.friends.include?(user)
    return unless current_user.friends.include?(User.find_by(id: post.user_id)) || post.user_id == current_user.id || post.nil?

    render partial: "post", locals: { post: post }
    #"There are no recent posts"
    #a = []
    #post.each do |p|
    #  a << p.id
    #end
    #if is_a_friend_post
        #render timeline_posts
    #else
    #  return nil
    #
    #"<ul class="posts"></ul>".html_safe
    #"<h5>Post created by #{User.find_by(id: post.user_id).name}</h5>
    #<p>#{post.content}</p>".html_safe
    #"Hello".html_safe
    #post
  end
end
