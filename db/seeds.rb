# frozen_string_literal: true

require 'csv'

csv_courses = File.read(Rails.root.join('db/date_csv/courses.csv'))
courses = CSV.parse(csv_courses, headers: true, encoding: 'UTF-8')
courses.each do |row|
  Course.create(
    title: row['title']
  )
end

csv_users = File.read(Rails.root.join('db/date_csv/users.csv'))
users = CSV.parse(csv_users, headers: true, encoding: 'UTF-8')
users.each do |row|
  User.create(
    name: row['name'],
    email: row['email'],
    grade_point_average: 0,
    progress_average: 0
  )
end

csv_enrollments = File.read(Rails.root.join('db/date_csv/enrollments.csv'))
enrollments = CSV.parse(csv_enrollments, headers: true, encoding: 'UTF-8')
enrollments.each do |row|
  Inscription.create(
    course_id: row['course_id'],
    user_id: row['user_id'],
    pass_score: row['pass_score'],
    progress: row['progress'],
    score: row['score'],
    completed: row['progress'].to_i == 100,
    graduate: row['progress'].to_i == 100 && row['score'].to_i > row['pass_score'].to_i
  )
end