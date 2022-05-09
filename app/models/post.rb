class Post < ApplicationRecord
  belongs_to :author, class_name: "User"
  has_many :comments
  has_many :likes

  def update_posts_counter
    counter = Post.where(author_id: self.author_id).count
    user = User.find_by(id: self.author_id)
    user.update(posts_counter: counter)
  end

  def recent_comments
    Comment.where(post_id: self.id).limit(5).order(created_at: :desc)
  end
end
