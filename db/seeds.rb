# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Task.create!([
  {
    name: "Learn Rails basics",
    description: "Study MVC, routes, controller, model, view",
    position: 1,
    completed: false,
    user_id: 8
  },
  {
    name: "Create Task CRUD",
    description: "Build CRUD for Task model",
    position: 2,
    completed: false,
    user_id: 8
  },
  {
    name: "Add validations",
    description: "Add validations for Task model",
    position: 3,
    completed: true,
    user_id: 8
  },
  {
    name: "Practice ActiveRecord",
    description: "Use where, order, limit",
    position: 4,
    completed: false,
    user_id: 13
  }
])
