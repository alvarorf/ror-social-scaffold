module CommentHelper
  def filter_friends_comments(comment)
    u = User.where('id = ?', comment.user_id).first
    return unless current_user.friends.include?(u) || u == current_user

    a = "<p class=\"comment-data\">Made by: #{User.find_by(id: comment.user_id).name}</p>"
    b = "<p  class=\"comment-data\">#{comment.content}</p>"
    c = "<p class=\"comment-data\"> Made at : #{comment.created_at.strftime('%Y/%m/%d')}</p>"
    d = b + a + c
    d.html_safe
  end
end
