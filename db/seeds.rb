User.create!(name:  "Example User",
             email: "example@railstutorial.org",
             password:              "foobar",
             password_confirmation: "foobar",
             admin: true)

9.times do |n|
  name  = Faker::Name.name
  email = "example-#{n+1}@railstutorial.org"
  password = "password"
  User.create!(name:  name,
               email: email,
               password:              password,
               password_confirmation: password)
end
# Following relationships
users = User.all
user  = users.first
following = users[2..10]
followers = users[3..8]
following.each { |followed| user.follow(followed) }
followers.each { |follower| follower.follow(user) }


users = User.order(:created_at).take(6)
50.times do
  content = Faker::Lorem.sentence(5)
  users.each { |user| user.microposts.create!(content: content) }
end



100.times do |n|
  content_jp  = Faker::Lorem.word
  word = Word.create(content_jp: content_jp)
  answer_1 = Faker::Lorem.word
  Answer.create(word_id: word.id, content: answer_1, correct_answer: true)
  3.times do |n|
    answer_1 = Faker::Lorem.word
    Answer.create(word_id: word.id, content: answer_1)
  end
end

