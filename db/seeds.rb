# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#

10.times do |i|
  User.where(email: "user#{i+1}@example.org").first_or_create do |user|
    user.first_name = Faker::Name.unique.first_name
    user.last_name = Faker::Name.unique.last_name
    user.password = 'pass123456'
    user.password_confirmation = 'pass123456'
  end
end
