# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

TaskComment.delete_all
UserShift.delete_all
Message.delete_all
UserTask.delete_all
Task.delete_all
User.delete_all
Chatroom.delete_all
Shift.delete_all

users = User.create!([
  { email: 'dfvangeas@test.com', password: '123456', password_confirmation: '123456', first_name: 'Daniel', last_name: 'Vanegas' },
  { email: 'frnpcc@test.com', password: '123456', password_confirmation: '123456', first_name: 'Franchesca', last_name: 'Correa' },
  { email: 'fmarchal03@test.com', password: '123456', password_confirmation: '123456', first_name: 'Frederic', last_name: 'Marchal' }
])

tasks = Task.create!([
  { title: 'Finish project', description: 'Need to finish the Rails project by next week.', deadline: 7.days.from_now },
  { title: 'Call XY', description: 'Important call to Mr. XY', deadline: 2.days.from_now },
  { title: 'Renew Subscription', description: 'Renew the annual subscription for the service.', deadline: 30.days.from_now }
])

users.each do |user|
  user.tasks << tasks.sample(2)
end

chatrooms = Chatroom.create!([
  { name: 'General' },
  { name: 'Random' },
  { name: 'Development' }
])


shifts = Shift.create!([
  { start_date: DateTime.now.beginning_of_day, end_date: DateTime.now.end_of_day },
  { start_date: 2.days.from_now.beginning_of_day, end_date: 2.days.from_now.end_of_day },
  { start_date: 4.days.from_now.beginning_of_day, end_date: 4.days.from_now.end_of_day }
])


tasks.each_with_index do |task, index|
  TaskComment.create!(task: task, user: users[index % users.size], content: "Comment #{index} for task.")
end

shifts.each_with_index do |shift, index|
  UserShift.create!(shift: shift, user: users[index % users.size])
end

chatrooms.each_with_index do |chatroom, index|
  Message.create!(chatroom: chatroom, user: users[index % users.size], content: "Message #{index} in chatroom.")
end

puts 'Database has been seeded.'
