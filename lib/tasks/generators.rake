namespace :generators do

  desc "Generate random projects and comments associated with them."
  task :project_and_comments => :environment do
    number_of_projects = ENV['number_of_projects'] ? ENV['number_of_projects'].to_i : 50
    number_of_comments = ENV['number_of_comments'] ? ENV['number_of_comments'].to_i : 10

    number_of_projects.times do
      project = Project.create(title: Faker::Lorem.sentence(10), body: Faker::Lorem.sentence(30))
      number_of_comments.times do
        project.comments.create(body: Faker::Lorem.sentence(12))
      end
    end
    puts "number_of_projects #{number_of_projects} - number_of_comments #{number_of_comments}"

  end

  desc "Generate Default Categories"
  task :generate_default => :environment do
    ["Funny Animals", "Technology", "Sports", "Entertainment", "Travel", 
      "Photography", "Food", "Cars", "Programming", "Design", "Investing", 
      "Real Estate"].each do |category_name|
        Category.create(name: category_name)
      end
  end 
end
