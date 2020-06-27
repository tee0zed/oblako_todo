# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Project.create([
                 { projectname: 'Family'},
                 { projectname: 'Work'}
               ])

Project.find_by(projectname: 'Family')
  .todos.create([
                  { todoname: 'Buy milk', checked: false},
                  { todoname: 'Take shoes to repair', checked: false},
                  { todoname: 'Be a good boy', checked: false}
                ])

Project.find_by(projectname: 'Work')
  .todos.create([
                  { todoname: 'Complete task', checked: false },
                  { todoname: 'Become good programmer lol', checked: false },
                  { todoname: 'Build big fancy app', checked: false }
                ])
