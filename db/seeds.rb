# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Planet.create(name: 'Earth', size: 'Medium Sized', description: 'Blue and Green planet with life')
Planet.create(name: 'Mars', size: 'Medium Sized', description: 'Red planet with no life')
Planet.create(name: 'Jupiter', size: 'Large', description: 'The fifth planet from the sun and the largest in the solar sytem.')
Planet.create(name: 'Saturn', size: 'Large', description: 'The second largest planet in the solar system. It also has many rings around it.')
Planet.create(name: 'Venus', size: 'Small', description: 'The second closest planet from the sun. It is also the hottest planet in the solar system.')

