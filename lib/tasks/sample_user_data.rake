require 'faker'

namespace :db do
  desc "Fill database with sample data"
  task :populate => :environment do
    Rake::Task['db:reset'].invoke
    admin = User.create!(:name => "Admin", 
                         :email => "admin@test.org",
                         :password => "123456",
                         :password_confirmation => "123456")
    admin.toggle!(:admin)               
          
    99.times do |n|
      name = Faker::Name.name
      email = "sample-#{n+1}@test.org"
      password = '123456'
      User.create!(:name => name[0..15], 
                   :email => email, 
                   :password => password, 
                   :password_confirmation => password)
    end
  end
end