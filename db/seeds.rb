require 'random_data'

# Create Posts
50.times do
# #1
Post.create!(
 # #2
    title:  RandomData.random_sentence,
    body:   RandomData.random_paragraph
    )
end

 posts = Post.all
 
 # Create Comments
 # #3
 100.times do
   Comment.create!(
 # #4
     post: posts.sample,
     body: RandomData.random_paragraph
   )
 end

Post.find_or_create_by( title: "The Last of Us 2",
  body: "Prepare for the biggest game of 2018 with The Last of Us 2!")

Comment.find_or_create_by( post: Post.find(51), body: 'First Comment about the Last of Us 2!')
 
 puts "Seed finished"
 puts "#{Post.count} posts created"
 puts "#{Comment.count} comments created"
