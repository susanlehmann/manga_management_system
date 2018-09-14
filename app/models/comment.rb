class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :manga

  validates :user, presence: true
  validates :content, presence: true

  acts_as_tree order: "created_at ASC"

  after_create_commit {comment_notify}
  def comment_notify
    comment = Comment.last
    if comment.parent_id.present? && comment.user != comment.parent.user
      Event.create(message: "#{user.name} makes a reply to your comment: '#{comment.parent.content}' in #{manga.name}", recipient_id: comment.parent.user.id)
    end
  end
end
