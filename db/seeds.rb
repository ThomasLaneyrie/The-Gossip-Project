# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

City.destroy_all
User.destroy_all
Gossip.destroy_all
Tag.destroy_all
JoinTableGossipTag.destroy_all
PrivateMessage.destroy_all

20.times do |index|
  City.create(
    name:Faker::Address.city, 
    zip_code:Faker::Number.number(digits: 5)
  )
end
  
30.times do |index|
  User.create(
    first_name: Faker::Name.first_name, 
    last_name: Faker::Name.last_name,
    description: Faker::Superhero.name,
    email: "#{["Kachou", "Champion78", "Victime83", "Toto"].sample}@#{["gmail.com", "yahoo.fr" , "lycos.fr", "wanadoo.fr", "laposte.net"].sample}",
    age: rand(5..99),
    city: City.find(rand(City.first.id..City.last.id)),
    password: "salut"
   )
end

#Utilisateur random pour se connecter + moi :
User.create(
  first_name: "Moussaillon", 
  last_name: "THP",
  description: "Gros glandu",
  email: "moussaillon@gmail.com",
  age: 33,
  city: City.find(rand(City.first.id..City.last.id)),
  password: "gossip"
 )

 User.create(
  first_name: "Thomas", 
  last_name: "Toto",
  description: "Moussaillon amoché",
  email: "toto@gmail.com",
  age: 33,
  city: City.find(rand(City.first.id..City.last.id)),
  password: "coucou"
 )

40.times do |index|
   Gossip.create(
    # title: Faker::Lorem.characters(number:10),
    title: Faker::Movie.title,
    content: Faker::Lorem.sentence,
    user: User.find(rand(User.first.id..User.last.id)) 
  ) 

  Tag.create(
    title: Faker::Vehicle.manufacture
  ) 

  JoinTableGossipTag.create(
    gossip: Gossip.find(rand(Gossip.first.id..Gossip.last.id)),
    tag: Tag.find(rand(Tag.first.id..Tag.last.id)) 
  ) 

  PrivateMessage.create(
    content: Faker::Lorem.sentence,
    recipient: User.find(rand(User.first.id..User.last.id)),           
    sender: User.find(rand(User.first.id..User.last.id)) 
  ) 
end

puts "Seeds réalisés avec succès !"

Comment.destroy_all

200.times do |index|
  Comment.create(
    content:Faker::Lorem.sentence,
    gossip: Gossip.find(rand(Gossip.first.id..Gossip.last.id)),
    user:User.find(rand(User.first.id..User.last.id))
  )
end

Like.destroy_all
200.times do |index|
  Like.create(
    user: User.all.sample,
    gossip: Gossip.all.sample
  )
end

puts "Seeds likes réalisés avec succès !"