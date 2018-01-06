namespace :dev do

  task fake_restaurant: :environment do
    Restaurant.destroy_all

    500.times do |i|
      Restaurant.create!(
        name: FFaker::Name.first_name,
        opening_hours: FFaker::Time.datetime,
        tel: FFaker::PhoneNumber.short_phone_number,
        address: FFaker::Address.street_address,
        description: FFaker::Lorem.paragraph,
        category: Category.all.sample,
        image: File.open(Rails.root.join("seed_img/#{rand(1..30)}.jpg"))
      )
    end
    puts "have created fake restaurants"
    puts "now you have #{Restaurant.count} restaurants data"
  end

  task fake_user: :environment do
    20.times do |i|
     user_name = FFaker::Name.first_name
        User.create!(
        name: user_name,
        email: "#{user_name}@example.com",
        password: "12345678"
        image: File.open(Rails.root.join("seed_img/#{rand(31..45)}.jpg"))
      )
    end
    puts "have created fake users"
    puts "now you have #{User.count} users data"
  end

  task fake_comment: :environment do
     Restaurant.all.each do |restaurant|
       3.times do |i|
         restaurant.comments.create!(
           content: FFaker::Lorem.sentence,
           user: User.all.sample
         )
       end
     end
    puts "have created fake comments"
    puts "now you have #{Comment.count} comments data"
  end

  task fake_all: :enviroment do
    Rake::Task['db:migrate'].execute
    Rake::Task['db:seed'].execute
    Rake::Task['dev:fake_restaurant'].execute
    Rake::Task['dev:fake_user'].execute
    Rake::Task['dev:fake_comment'].execute

  end

end
