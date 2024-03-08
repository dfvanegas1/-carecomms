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

shift_definitions = [
  { name: "Day", start_hour: 7, duration_hours: 8 },
  { name: "Evening", start_hour: 15, duration_hours: 8 },
  { name: "Night", start_hour: 23, duration_hours: 8 },
]

(0..6).each do |day|
  shift_definitions.each do |shift_def|
    start_date = DateTime.now.beginning_of_day + day.days + shift_def[:start_hour].hours
    end_date = start_date + shift_def[:duration_hours].hours
    Shift.create!(start_date: start_date, end_date: end_date)
  end
end

puts "#{Shift.count} shifts were created ⏰"

users = User.all.to_a

users.each do |user|
  selected_shifts = Shift.order("RANDOM()").limit(5)
  selected_shifts.each do |shift|
    UserShift.create!(user: user, shift: shift)
  end
end

puts "Shift assignments for users are completed."

statement_contents = [
  "Great progress!",
  "Keep it up!",
  "Well done on this task.",
  "This is priority.",
  "Completed as requested.",
  "Successfully implemented the new procedure.",
  "Shift coverage has been arranged.",
  "Patient satisfaction scores have improved.",
  "All medications have been restocked.",
  "Emergency protocols were followed accurately."
]

question_contents = [
  "Any updates on this?",
  "Can someone verify this?",
  "Has this been approved?",
  "Awaiting feedback?",
  "Please review?",
  "Any updates on the patient's lab results?",
  "Can someone verify the medication dosage for room 204?",
  "Has the new treatment protocol been approved by the ethics committee?",
  "Awaiting feedback on my request for leave in December. Any news?",
  "Please review the care plan for the long-term patient in wing B."
]

generic_responses = [
  "Noted, I'll get back to you on that.",
  "I'm on it, will update soon.",
  "Looking into it, will let you know.",
  "Acknowledged, will follow up shortly.",
  "Consider it done, details to follow.",
  "Noted, I'll check the lab results and get back to you shortly.",
  "I'm verifying the medication dosage now. Will update the team soon.",
  "Looking into the treatment protocol approval status. Will inform everyone once I have confirmation.",
  "Acknowledged. I'm following up on the leave requests today and will have an answer for you by tomorrow.",
  "Consider the care plan review done. I'll share the details and any recommendations in our next team meeting."
]

nurse_questions = [
  "Can you please order us more [medical supply] due to increased demand? @[admin_name]",
  "Do you have an update on the protocol for [specific treatment]? @[admin_name]",
  "Is there a staff meeting scheduled for next week, @[admin_name]?",
  "Are we expected to work additional shifts this month, @[admin_name]?",
  "How should we handle documentation for [specific case], @[admin_name]?",
  "Could you confirm when the flu vaccines will be available, @[admin_name]?",
  "Are there any updates on the continuing education requirements, @[admin_name]?",
  "Can we get additional support for the pediatric ward this weekend, @[admin_name]?",
  "What's the protocol for handling suspected infection cases, @[admin_name]?",
  "Is there a revised schedule for the upcoming holiday, @[admin_name]?"
]

admin_responses = [
  "Yes, @[nurse_name], I've approved the order for more supplies. They should arrive soon.",
  "The protocol for [specific treatment] has been updated, @[nurse_name]. Please check the latest guidelines.",
  "The staff meeting is scheduled for Wednesday next week, @[nurse_name]. Agenda items will be sent out soon.",
  "We're reviewing shift schedules, @[nurse_name], but we may need extra coverage. I'll keep everyone posted.",
  "For [specific case], @[nurse_name], please follow the new documentation process outlined in your email.",
  "The flu vaccines are scheduled to arrive next Monday, @[nurse_name]. We'll start administering them immediately.",
  "Continuing education requirements are being updated, @[nurse_name]. Details will be shared by next week.",
  "Additional support for the pediatric ward has been arranged for the weekend, @[nurse_name].",
  "Please refer to the updated infection control protocol sent earlier this week, @[nurse_name]. Let me know if you have any questions.",
  "The holiday schedule has been revised and will be distributed by tomorrow, @[nurse_name]. Please check your email."
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

general_chatroom = Chatroom.find_or_create_by(name: 'General')
users = User.all.to_a

birthday_message_sent = false
service_announcement_made = false

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
  "Who has experience with [specific medical procedure]? Need advice.",
  "Reminder: Equipment check required by end of shift.",
  "Urgent: Running low on [specific medical supply], please restock.",
  "Congratulations to [Name] for 5 years of service! 👏",
  "Training session on [new software] this Friday at 3 PM.",
  "Feedback needed on the new patient intake form.",
  "Shift swap request for this Saturday, anyone available?",
  "Lost and found: a pair of glasses in the staff room.",
  "Health tip: Stay hydrated during long shifts! 💧",
  "Looking for volunteer for community health fair next month."
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
  "I've done [specific medical procedure] before. Let's discuss offline.",
  "Will do the equipment check on my next round.",
  "Noted on the [specific medical supply], I'll place an order now.",
  "Huge congrats to! Thanks for your dedication.",
  "Interested in the [new software] training. Adding it to my calendar.",
  "I'll review the new intake form and send feedback by tomorrow.",
  "I can take your shift this Saturday, no problem.",
  "Those might be mine! I'll check the staff room later.",
  "Good reminder! I'll keep my water bottle handy.",
  "Count me in for the health fair, looking forward to it."
]

def random_past_time
  now = Time.current
  today_beginning = now.beginning_of_day
  random_time = rand(today_beginning..now)
  random_time.change(hour: rand(8..10), min: rand(0..59))
end

def substitute_placeholders(message_content, users)
  if message_content.include?("[Name]")
    mentioned_user = users.sample
    message_content.gsub!("[Name]", "@#{mentioned_user.first_name}")
  end

  if message_content.include?("[specific medical supply]")
    medical_supplies = ["bandages", "gloves", "syringes", "masks"]
    message_content.gsub!("[specific medical supply]", medical_supplies.sample)
  end

  if message_content.include?("[specific medical procedure]")
    medical_procedures = ["angioplasty", "appendectomy", "biopsy", "cesarean section"]
    message_content.gsub!("[specific medical procedure]", medical_procedures.sample)
  end

  if message_content.include?("[new software]")
    software_options = ["EHR System", "Patient Management Software", "Telehealth Platform"]
    message_content.gsub!("[new software]", software_options.sample)
  end

  message_content
end

number_of_messages = 15
last_message_content = nil
recent_messages = []

number_of_messages.times do |i|
  author = users.sample

  current_possible_messages = chatroom_messages.dup
  current_possible_messages.reject! { |msg| msg.include?("Happy birthday") } if birthday_message_sent
  current_possible_messages.reject! { |msg| msg == last_message_content }

  message_content = current_possible_messages.sample
  message_content = substitute_placeholders(message_content, users)
  last_message_content = message_content

  unless recent_messages.include?(message_content)
    created_at_time = random_past_time - 10.minutes
    Message.create!(chatroom: general_chatroom, user: author, content: message_content, created_at: created_at_time)
    recent_messages = (recent_messages + [message_content]).last(10)
  end

  created_at_time = random_past_time

  message = nil
  if message_content.include?("Happy birthday") && !birthday_message_sent
    birthday_user = users.reject { |u| u == author }.sample
    personalized_message_content = "@#{birthday_user.first_name} Happy birthday! 🎉"
    message = Message.create!(chatroom: general_chatroom, user: author, content: personalized_message_content, created_at: created_at_time)
    birthday_message_sent = true
  elsif message_content.include?("Congratulations to") && !service_announcement_made
    message = Message.create!(chatroom: general_chatroom, user: author, content: message_content, created_at: created_at_time)
    service_announcement_made = true
  else
    message = Message.create!(chatroom: general_chatroom, user: author, content: message_content, created_at: created_at_time)
  end

  if rand <= 0.9 && message
    response_index = chatroom_messages.index(message_content)
    if response_index && chatroom_responses[response_index]
      responder = users.reject { |u| u == author }.sample
      response_content = chatroom_responses[response_index]
      response_content = substitute_placeholders(response_content, users)
      Message.create!(chatroom: general_chatroom, user: responder, content: response_content, created_at: created_at_time + 5.minutes)
    end
  end
end

puts "Created chatroom messages 🎉"

puts 'Database has been seeded 🏎️ 💨  🥳 🍻'
