# frozen_string_literal: true
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

first_user = User.create(email: 'test@email.com', password: 'password', name: 'Tom', photo: 'https://image.shutterstock.com/image-vector/man-character-face-avatar-glasses-600w-542759665.jpg', bio: 'Teacher from Mexico.', posts_counter: 0)
second_user = User.create(email: 'test1@email.com', password: 'password', name: 'Lilly', photo: 'https://image.shutterstock.com/image-vector/female-face-avatar-on-white-600w-562359607.jpg', bio: 'Teacher from Poland.', posts_counter: 0)

first_post = Post.create(user_id: first_user, title: 'Hello', text: 'This is first post', comments_counter: 0, likes_counter: 0)
second_post = Post.create(user_id: first_user, title: 'Hello', text: 'This issecond post', comments_counter: 0, likes_counter: 0)
third_post = Post.create(user_id: second_user, title: 'Hello', text: 'This isthird post', comments_counter: 0, likes_counter: 0)
fourth_post = Post.create(user_id: second_user, title: 'Hello', text: 'This is fourth post', comments_counter: 0, likes_counter: 0)

Comment.create(post_id: first_post, user_id: second_user, text: 'Hi Tom!' )
Comment.create(post_id: first_post, user_id: first_user, text: 'Hi Lilly!' )
Comment.create(post_id: second_post, user_id: second_user, text: 'Hi , this is my first comment' )
Comment.create(post_id: second_post, user_id: second_user, text: 'Hi , this is my second comment' )

Like.create(post_id: first_post, user_id: second_user)
Like.create(post_id: second_post, user_id: first_user)

puts 'Seed data loaded successfully'
