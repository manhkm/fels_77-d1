namespace :sample_data do
  desc "TODO"
  task create_admins: :environment do
    User.create!(name:  "Example User",
         email: "example@railstutorial.org",
         password:              "foobar",
         password_confirmation: "foobar",
         admin: true)
  end

  desc "TODO"
  task create_users: :environment do
    20.times do |n|
    name  = Faker::Name.name
    email = "example-#{n+1}@railstutorial.org"
    password = "password"
    User.create!(name:  name,
                 email: email,
                 password:              password,
                 password_confirmation: password)
    end
  end

  desc "TODO"
  task create_courses: :environment do
    5.times do |n|
      name = "Course-#{n+1}"
      description = Faker::Lorem.sentence(5)
      Course.create(name: name, description: description)
    end
  end

  desc "TODO"
  task create_words: :environment do
    courses = Course.all
    courses.each do |course|
      20.times do
        content = Faker::Lorem.word
        course.words.create!(content: content)
      end
    end
  end

  desc "TODO"
  task create_options: :environment do
    words = Word.all
    3.times do
      words.each{|word|
        content = Faker::Lorem.word
        word.options.create!(content: content )
      }
    end
    words.each {|word|
      correct_option = Faker::Lorem.word
      word.options.create!(content: correct_option, correct: true )
    }
  end
end
