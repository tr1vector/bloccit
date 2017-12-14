require 'random_data'

# Create Topics
15.times do
  Topic.create!(
    name:        RandomData.random_sentence,
    description: RandomData.random_paragraph
  )
end
topics = Topic.all

# Create Posts
50.times do
  Post.create!(
    topic: topics.sample,
    title:  RandomData.random_sentence,
    body:   RandomData.random_paragraph
  )
end
posts = Post.all

# Create Sponsored Posts
10.times do
  SponsoredPost.create!(
    topic: topics.sample,
    title: RandomData.random_sentence,
    body: RandomData.random_paragraph,
    price: RandomData.random_number
  )
end
sponsored_posts = SponsoredPost.all

# Create Comments
100.times do
  Comment.create!(
    post: posts.sample,
    body: RandomData.random_paragraph
  )
end

#DB failed to reset with the following post/comment included - Couldn't find post 51.
#Post.find_or_create_by( title: "The Last of Us 2",
  #body: "Prepare for the biggest game of 2018 with The Last of Us 2!")

#Comment.find_or_create_by( post: Post.find(51), body: 'First Comment about the Last of Us 2!')

# Create Questions
100.times do
	Question.create!(
		title: RandomData.random_sentence,
		body: RandomData.random_paragraph,
		resolved: false
	)
end


 
 puts "Seed finished"
 puts "#{Topic.count} topics created"
 puts "#{Post.count} posts created"
 puts "#{SponsoredPost.count} sponsored posts created"
 puts "#{Comment.count} comments created"
 puts "#{Question.count} questions created"
