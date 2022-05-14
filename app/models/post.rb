class Post < ApplicationRecord
  belongs_to :author, class_name: 'User'
  has_many :comments
  has_many :likes

  validates :title, presence: true, length: { maximum: 250 }
  validates :author_id, :comments_counter, :likes_counter, presence: true,
                                               numericality: {only_integer: true, greater_than_or_equal_to: 0 }

  def recent_comments
    comments.order('created_at Desc').limit(5)
  end

  after_save :update_posts_counter

  private

  def update_posts_counter
    author.increment!(:posts_counter)
  end
end
