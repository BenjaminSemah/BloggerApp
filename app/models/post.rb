class Post < ApplicationRecord
  belongs_to :author, class_name: "User"
  has_many :comments
  has_many :likes

  # def count_posts
  #   counter = Post.where(author_id: id).count
  #   user = user.find_by(id)
  #   user.update(posts_counter: counter)
  # end


  def update_posts_counter
    counter = Post.where(author_id: self.author_id).count
    user = User.find_by(id: self.author_id)
    user.update(posts_counter: counter)
  end
end
