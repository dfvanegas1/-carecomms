TaskComment.delete_all
UserShift.delete_all
Message.delete_all
UserTask.delete_all
Task.delete_all
User.delete_all
Chatroom.delete_all
Shift.delete_all

users = User.create!([
  { email: 'dfvanegas@test.com', password: '123456', password_confirmation: '123456', first_name: 'Daniel', last_name: 'Vanegas' },
  { email: 'frnpcc@test.com', password: '123456', password_confirmation: '123456', first_name: 'Francesca', last_name: 'Correa' },
  { email: 'fmarchal03@test.com', password: '123456', password_confirmation: '123456', first_name: 'Frederic', last_name: 'Marchal' },
  { email: '1567ds@test.com', password: '123456', password_confirmation: '123456', first_name: 'Michalis', last_name: 'Ioannides' },
  { email: 'IsabelLopez@test.com', password: '123456', password_confirmation: '123456', first_name: 'Isabel', last_name: 'Lopez' },
  { email: 'Gonz44@test.com', password: '123456', password_confirmation: '123456', first_name: 'Gonzalo', last_name: 'Guerra' },
  { email: 'emmvs@test.com', password: '123456', password_confirmation: '123456', first_name: 'Emma', last_name: 'Rünzel' },
  { email: 'tamaratgz@test.com', password: '123456', password_confirmation: '123456', first_name: 'Tamara', last_name: 'Torrecillas' },
]).each do |user|
  avatar_filename = "#{user.first_name}.jpg"
  avatar_path = Rails.root.join('app/assets/images', avatar_filename)

  if File.exist?(avatar_path)
    user.avatar.attach(io: File.open(avatar_path), filename: avatar_filename, content_type: 'image/jpg')
    puts "Attached avatar for #{user.first_name} 🦧"
  else
    puts "No avatar image found for #{user.first_name}."
  end
end


tasks = Task.create!([
  { title: 'Administer Medications', description: 'Administer scheduled medications to assigned patients.', deadline: 1.day.from_now, priority: 1, completed: false },
  { title: 'Update Patient Records', description: 'Update the medical records of all assigned patients with the latest vitals and medication information.', deadline: 1.day.from_now, priority: 2, completed: false },
  { title: 'Attend Team Meeting', description: 'Participate in the daily healthcare team meeting to discuss patient care plans.', deadline: 1.day.from_now, priority: 3, completed: false },
  { title: 'Check Emergency Equipment', description: 'Ensure all emergency equipment, such as defibrillators and oxygen tanks, are in working order.', deadline: 2.days.from_now, priority: 1, completed: false },
  { title: 'Complete Incident Reports', description: 'Complete any outstanding incident reports related to patient care or safety issues.', deadline: 3.days.from_now, priority: 2, completed: false },
  { title: 'Conduct Patient Rounds', description: 'Conduct rounds to monitor patient conditions and provide necessary care.', deadline: 1.day.from_now, priority: 3, completed: false },
  { title: 'Prepare Surgical Instruments', description: 'Sterilize and prepare surgical instruments for upcoming procedures.', deadline: 4.days.from_now, priority: 1, completed: false},
  { title: 'Assist with Patient Admissions', description: 'Assist with the admission of new patients to the unit.', deadline: 2.days.from_now, priority: 2, completed: false },
  { title: 'Coordinate Patient Transfers', description: 'Coordinate the transfer of patients to other units or facilities as needed.', deadline: 5.days.from_now, priority: 3, completed: false },
  { title: 'Restock Supplies', description: 'Check and restock nursing stations with necessary supplies.', deadline: 5.days.from_now, priority: 1, completed: false },
  { title: 'Review New Protocols', description: 'Review any new healthcare protocols or procedure updates.', deadline: 7.days.from_now, priority: 2, completed: false },
  { title: 'Schedule Patient Appointments', description: 'Schedule follow-up appointments for patients being discharged.', deadline: 2.days.from_now, priority: 3, completed: false },
  { title: 'Assist with Patient Hygiene', description: 'Assist patients with bathing, oral care, and other hygiene needs.', deadline: 1.day.from_now, priority: 1, completed: false },
  { title: 'Participate in Quality Improvement', description: 'Participate in quality improvement initiatives and projects.', deadline: 10.days.from_now, priority: 2, completed: false },
  { title: 'Attend Training Session', description: 'Attend a mandatory training session on new electronic health record software.', deadline: 14.days.from_now, priority: 3, completed: false },
  { title: 'Perform ECGs', description: 'Perform ECGs on patients with cardiac complaints as ordered by the physician.', deadline: 3.days.from_now, priority: 1, completed: false },
  { title: 'Administer Vaccinations', description: 'Administer flu vaccinations to patients as part of the seasonal flu prevention program.', deadline: 10.days.from_now, priority: 2, completed: false },
  { title: 'Assist with Patient Mobility', description: 'Assist patients with mobility issues in getting to and from the bathroom, participating in physical therapy sessions.', deadline: 1.day.from_now, priority: 3, completed: false },
  { title: 'Prepare Patient Discharge', description: 'Prepare discharge paperwork and instructions for patients scheduled to leave.', deadline: 2.days.from_now, priority: 1, completed: false },
  { title: 'Assist with Patient Nutrition', description: 'Assist patients with meal selection and feeding as needed.', deadline: 1.day.from_now, priority: 2, completed: false },
  { title: 'Perform Respiratory Treatments', description: 'Perform respiratory treatments for patients with chronic lung conditions.', deadline: 3.days.from_now, priority: 3, completed: false },
  { title: 'Assist with Patient Restraints', description: 'Assist with the application of patient restraints as ordered by the physician.', deadline: 1.day.from_now, priority: 1, completed: false },
  { title: 'Provide Emotional Support', description: 'Provide emotional support to patients and their families during difficult times.', deadline: 1.day.from_now, priority: 2, completed: false },
  { title: 'Monitor Vital Signs', description: 'Regularly monitor and record the vital signs of assigned patients.', deadline: 1.day.from_now, priority: 3, completed: false },
  { title: 'Provide Patient Education', description: 'Educate patients and their families about care plans and any necessary post-discharge care.', deadline: 3.days.from_now, priority: 1, completed: false },
  { title: 'Collect Lab Samples', description: 'Collect blood, urine, or other samples from patients as required for lab tests.', deadline: 2.days.from_now, priority: 2, completed: false },
  { title: 'Assist with Patient Dressing Changes', description: 'Assist with the changing of dressings for patients with surgical incisions or wounds.', deadline: 1.day.from_now, priority: 3, completed: false },
  { title: 'Conduct Wound Care', description: 'Provide wound care for patients with surgical incisions or pressure ulcers.', deadline: 1.day.from_now, priority: 1, completed: false },
  { title: 'Assist with Patient Ambulation', description: 'Assist patients with walking and other forms of ambulation as part of their care plan.', deadline: 1.day.from_now, priority: 2, completed: false },
  { title: 'Implement Isolation Protocols', description: 'Implement and maintain isolation protocols for patients with infectious diseases.', deadline: 4.days.from_now, priority: 3, completed: false },
  { title: 'Assist with Patient Comfort Measures', description: 'Assist patients with comfort measures such as repositioning, pain management, and environmental adjustments.', deadline: 1.day.from_now, priority: 1, completed: false },
])

puts "#{Task.count} Tasks were created 🥳"

users.each do |user|
  tasks.sample(5).each do |task|
    UserTask.create!(user: user, task: task)
  end
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

users.each do |user|
  user.shifts << shifts.sample(2)
end

tasks.each_with_index do |task, index|
  TaskComment.create!(task: task, user: users[index % users.size], content: "HEY this is Task: #{index} you are viewing right now!!!")
end

shifts.each_with_index do |shift, index|
  UserShift.create!(shift: shift, user: users[index % users.size])
end

chatrooms.each_with_index do |chatroom, index|
  Message.create!(chatroom: chatroom, user: users[index % users.size], content: "Message #{index} in chatroom.")
end

puts 'Database has been seeded 🏎️ 💨  🥳 🍻'
