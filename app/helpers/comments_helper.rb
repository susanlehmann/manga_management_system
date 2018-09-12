module CommentsHelper
  def comments_tree_for comments, manga, comment_new
    safe_join(comments.map do |comment, nested_comments|
      render(comment, manga: manga,
        comment_new: Comment.new) + tree(nested_comments, manga)
    end)
  end

  def tree nested_comments, manga
    unless nested_comments.empty?
      content_tag :div,
        comments_tree_for(nested_comments, manga, Comment.new), class: "replies"
    end
  end
end
