module CommentHelper
  def filter_friends_comments(comment)
    u = User.where('id = ?', Post.where('id = ?', comment.post_id).first.user_id).first
    u.friends.each do |f|
      next unless f.id == comment.user_id || current_user.id == comment.user_id

      a = "<p class=\"comment-data\">Made by: #{User.find_by(id: comment.user_id).name}</p>"
      b = "<p  class=\"comment-data\">#{comment.content}</p>"
      c = "<p class=\"comment-data\"> Made at : #{comment.created_at.strftime('%Y/%m/%d')}</p>"
      d = b + a + c
      return d.html_safe
    end
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
