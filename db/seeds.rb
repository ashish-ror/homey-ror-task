# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
User.create(email: 'a@a.com', password: '123456')
User.create(email: 'b@b.com', password: '123456')

Project.create(name: 'Ruby on Rails Task', status: 'New')

['We can make the UI better','Yes','We can use devise gem and other OmniAuth for logging','Yes, Gmail is most significantly used to log in','We can make sure comments can be done in real time by using ActionCable','Yes it would help to us make swift user experience'].each do |content|
	Comment.create(project: Project.first, user: User.first, content: content)
end


