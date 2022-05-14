class Comment < ApplicationRecord
  belongs_to :author, class_name: 'User'
  belongs_to :post

  validates :text, :author_id, :post_id, presence: true
  validates :author_id, :post_id, numericality: { only_integer: true }

  after_save :update_comments_counter

  def update_comments_counter
    post.increment!(:comments_counter)
  end
end
