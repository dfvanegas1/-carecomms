MentionComment.delete_all
TaskComment.delete_all
UserShift.delete_all
MentionMessage.delete_all
Message.delete_all
UserTask.delete_all
Task.delete_all
User.delete_all
Chatroom.delete_all
Shift.delete_all

puts "Deleted previous Seed 🗑️"

users = User.create!([
  { email: 'dfvanegas@test.com', password: '123456', password_confirmation: '123456', first_name: 'Daniel', last_name: 'Vanegas', admin: true },
  { email: 'frnpcc@test.com', password: '123456', password_confirmation: '123456', first_name: 'Francesca', last_name: 'Correa', admin: true },
  { email: 'fmarchal03@test.com', password: '123456', password_confirmation: '123456', first_name: 'Frederic', last_name: 'Marchal', admin: true },
  { email: '1567ds@test.com', password: '123456', password_confirmation: '123456', first_name: 'Michalis', last_name: 'Ioannides', admin: false },
  { email: 'IsabelLopez@test.com', password: '123456', password_confirmation: '123456', first_name: 'Isabel', last_name: 'Lopez', admin: false },
  { email: 'Gonz44@test.com', password: '123456', password_confirmation: '123456', first_name: 'Gonzalo', last_name: 'Guerra', admin: false },
  { email: 'emmvs@test.com', password: '123456', password_confirmation: '123456', first_name: 'Emma', last_name: 'Rünzel', admin: false },
  { email: 'tamaratgz@test.com', password: '123456', password_confirmation: '123456', first_name: 'Tamara', last_name: 'Torrecillas', admin: false },
]).each do |user|
  avatar_filename = "#{user.first_name}.jpg"
  avatar_path = Rails.root.join('app/assets/images', avatar_filename)

  if File.exist?(avatar_path)
    user.avatar.attach(io: File.open(avatar_path), filename: avatar_filename, content_type: 'image/jpg')
    puts "Attached avatar for #{user.first_name} 🖼️"
  else
    puts "No avatar image found for #{user.first_name} ❌"
  end
end

puts "Created users 🎉"

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

puts "#{Task.count} Tasks were created 🎯"

users.each do |user|
  tasks.sample(10).each do |task|
    UserTask.create!(user: user, task: task)
  end
end

shifts = Shift.create!([
  { start_date: DateTime.now.beginning_of_day, end_date: DateTime.now.end_of_day },
  { start_date: 2.days.from_now.beginning_of_day, end_date: 2.days.from_now.end_of_day },
  { start_date: 4.days.from_now.beginning_of_day, end_date: 4.days.from_now.end_of_day }
])

puts "#{Shift.count} shifts were created ⏰"

shifts.each_with_index do |shift, index|
  UserShift.create!(shift: shift, user: users[index % users.size])
end

users.each do |user|
  user.shifts << shifts.sample(2)
end

statement_contents = [
  "Great progress!",
  "Keep it up!",
  "Well done on this task.",
  "This is priority.",
  "Completed as requested."
]

question_contents = [
  "Any updates on this?",
  "Can someone verify this?",
  "Has this been approved?",
  "Awaiting feedback?",
  "Please review?"
]

generic_responses = [
  "Noted, I'll get back to you on that.",
  "I'm on it, will update soon.",
  "Looking into it, will let you know.",
  "Acknowledged, will follow up shortly.",
  "Consider it done, details to follow."
]

nurse_questions = [
  "Can you please order us more [medical supply] due to increased demand? @[admin_name]",
  "Do you have an update on the protocol for [specific treatment]? @[admin_name]",
  "Is there a staff meeting scheduled for next week, @[admin_name]?",
  "Are we expected to work additional shifts this month, @[admin_name]?",
  "How should we handle documentation for [specific case], @[admin_name]?"
]

admin_responses = [
  "Yes, @[nurse_name], I've approved the order for more supplies. They should arrive soon.",
  "The protocol for [specific treatment] has been updated, @[nurse_name]. Please check the latest guidelines.",
  "The staff meeting is scheduled for Wednesday next week, @[nurse_name]. Agenda items will be sent out soon.",
  "We're reviewing shift schedules, @[nurse_name], but we may need extra coverage. I'll keep everyone posted.",
  "For [specific case], @[nurse_name], please follow the new documentation process outlined in your email."
]

question_response_mapping = nurse_questions.zip(admin_responses).to_h

admins = User.where(admin: true)
non_admins = User.where(admin: false)

min_comments_per_task = 2
max_comments_per_task = 5

Task.all.each do |task|
  num_comments = rand(min_comments_per_task..max_comments_per_task)
  selected_users = User.all.sample(num_comments)

  selected_users.each do |user|
    is_statement = rand < 0.7
    if is_statement
      content = statement_contents.sample
      TaskComment.create!(task: task, user: user, content: content)
    else
      if user.admin?
        mentioned_non_admin = non_admins.sample
        question = question_contents.sample + " @#{mentioned_non_admin.first_name}"
        TaskComment.create!(task: task, user: user, content: question)

        response = generic_responses.sample + " @#{user.first_name}"
        TaskComment.create!(task: task, user: mentioned_non_admin, content: response)
      else
        selected_admin = admins.sample
        question_template = nurse_questions.sample

        question = question_template
          .gsub("[admin_name]", "#{selected_admin.first_name}")
          .gsub("[medical supply]", "gloves")
          .gsub("[specific treatment]", "CPR")
          .gsub("[specific case]", "patient transfers")

        TaskComment.create!(task: task, user: user, content: question)

        response_template = question_response_mapping[question_template]
        response = response_template
          .gsub("[nurse_name]", "#{user.first_name}")
          .gsub("[medical supply]", "gloves")
          .gsub("[specific treatment]", "CPR")
          .gsub("[specific case]", "patient transfers")

        TaskComment.create!(task: task, user: selected_admin, content: response)
      end
    end
  end
end

puts "Created Tasks comments 📝"

def random_past_time
  now = Time.current
  today_beginning = now.beginning_of_day
  random_time = rand(today_beginning..now)
  random_time.change(hour: rand(8..10), min: rand(0..59))
end

general_chatroom = Chatroom.find_or_create_by(name: 'General')
users = User.all.to_a

birthday_message_sent = false

special_message = "Lunch order will be placed at 11 AM. Preferences?"

chatroom_messages = [
  "Did anyone check the inventory today?",
  "Reminder: Staff meeting tomorrow at 10 AM.",
  "Can someone assist in Room 204?",
  "Happy birthday! 🎉",
  "Urgent: Need help with the upcoming audit documentation.",
  "Does anyone have the new protocol manual?",
  "Meeting rescheduled to 2 PM.",
  "System maintenance tonight at 8 PM.",
  "Who's on call this weekend?",
  special_message
]

chatroom_responses = [
  "Yes, inventory checked and all good.",
  "Got it, I'll be there for the meeting.",
  "I'm on my way to Room 204 now.",
  "Enjoy your day! 🎂",
  "I can help with the audit docs after lunch.",
  "Yes, I'll bring it to you.",
  "Noted, thanks for the heads up.",
  "Thanks for the reminder, I'll log off in time.",
  "I am, got it covered.",
  "Salad for me, please."
]

special_message_time = random_past_time
number_of_messages = 15
last_message_content = nil

number_of_messages.times do |i|
  author = users.sample

  current_possible_messages = birthday_message_sent ? chatroom_messages.reject { |msg| msg.include?("Happy birthday") } : chatroom_messages

  current_possible_messages = current_possible_messages.reject { |msg| msg == last_message_content }

  message_content = current_possible_messages.sample
  last_message_content = message_content

  created_at_time = random_past_time

  if message_content.include?("Happy birthday") && !birthday_message_sent
    birthday_user = users.reject { |u| u == author }.sample
    personalized_message_content = "@#{birthday_user.first_name} Happy birthday! 🎉"

    message = Message.create!(chatroom: general_chatroom, user: author, content: personalized_message_content, created_at: created_at_time)

    MentionMessage.create!(user: birthday_user, message: message)

    personalized_response_content = "Thanks, everyone! Feeling blessed 🙏"
    Message.create!(chatroom: general_chatroom, user: birthday_user, content: personalized_response_content, created_at: created_at_time + 5.minutes)

    birthday_message_sent = true
  elsif message_content == special_message
    Message.create!(chatroom: general_chatroom, user: author, content: message_content, created_at: special_message_time)
  else
    message = Message.create!(chatroom: general_chatroom, user: author, content: message_content, created_at: created_at_time)

    response_index = chatroom_messages.index(message_content)
    if response_index && chatroom_responses[response_index]
      responder = users.reject { |u| u == author }.sample
      response_content = chatroom_responses[response_index]
      Message.create!(chatroom: general_chatroom, user: responder, content: response_content, created_at: created_at_time + 5.minutes)
    end
  end
end
puts "Created chatroom messages 🎉"

puts 'Database has been seeded 🏎️ 💨  🥳 🍻'
