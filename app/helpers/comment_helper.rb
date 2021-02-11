module CommentHelper
  def filter_friends_comment(comment)
    u = User.where('id = ?', Post.where('id = ?', comment.post_id).first.user_id).first
    u.friends.each do |f|
      return comment if f.id == comment.user_id
    end
    nil
  end

  def show_comment(comment)
    return [] if comment.nil?

    a = []
    a.push "#{comment.user.name}: "
    a.push comment.content
    a.push comment.created_at.strftime('%Y/%m/%d')
    a
  end
end
