survey "Feedback" do

  section "Basic questions" do

q_receipt "Did the company confirm the receipt of application?", :pick => :one
    a_y "Yes"
    a_n "No"

  q_2 "Choose the communication you received next to the closest choice below.", :pick => :any
    a_1 "Equal Opportunity/Affirmative Action survey"
    a_2 "Past work experience questions"
    a_3 "test of skills or personality"
    a_4 :other

    q_denied_1 "Were you denied employment before giving an interview?", :pick => :one
    a_1 "Yes"
    a_2 "No"

    q_denied_2 "How long did you wait to hear before receiving an interview?", :pick => :one
    a_1 "I heard back in less than a week"
    a_2 "I heard back after one week but within two."
    a_3 "I heard back after two weeks but before one month."
    a_4 "I heard back after more than one month."
    dependency :rule => "A"
    condition_A :q_denied_1, "==", :a_2
    
    q_denied_3 "How long did it take them to get back to you?", :pick => :one
    answer "I heard back in less than a week."
    answer "I heard back after one week but within two."
    answer "I heard back after two weeks but before one month."
    answer "I heard back after more than one month."
    dependency :rule => "B"
    condition_B :q_denied_1, "==", :a_1

  q_3 "How did they get in touch?", :pick => :any
    a_1 "Phone"
    a_2 "Email"
    a_3 "Fax"
    a_4 "twitter"
    a_5 "Snail mail"
    a_6 :other

    q_interview_1 "Did you hear back after the interview?", :pick => :one
    a_y "Yes"
    a_n "No"
    dependency :rule => "A"
    condition_A :q_denied_2, "!=", :a_1

    q_interview_2 "After interview how long did it take to hear back?", :pick => :one
    a_1 "A week or less."
    a_2 "More than one week but less than two weeks."
    a_3 "More than two weeks but less than one month."
    a_4 "More than one month but less than three."
    a_5 "More than three months."
    dependency :rule => "A"
    condition_A :q_interview_1, "!=", :a_n


    q_interview_x "How long did you wait before you heard from them after the interview interview?", :pick => :one
    a_1 "A week or less."
    a_2 "More than one week but less than two weeks."
    a_3 "More than two weeks but less than one month."
    a_4 "More than one month but less than three."
    a_5 "More than three months."
    dependency :rule => "A"
    condition_A :q_interview_1, "!=", :a_n


    q_interview_3 "How many interviews were there?", :pick => :one
    a_1 "1"
    a_2 "2"
    a_3 "3"
    a_4 "4"
    a_5 "More than 4"
    dependency :rule => "B"
    condition_B :q_denied_1, "!=", :a_2

    q_time "How long of a response time between interviews was there?", :pick => :one
    a_1 "less than a day"
    a_2 "one day"
    a_3 "2-3 days"
    a_4 "4-5 days"
    a_5 "longer than five days"
    dependency :rule => "B"
    condition_B :q_interview_3, "!=", :a_1

end
end