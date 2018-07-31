# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Pet.create(name: 'Rover', age: 4, bio: "Cute dog needs home", gender: "Male", species: "Dog", breed: "Collie", zip_code: 10003, kill_shelter: true, fosterer: false, adopter: true, shelter_id: 1)
Pet.create(name: 'Buddah', age: 1, bio: "Energetic Puppy", gender: "Male", species: "Dog", breed: "Mix", zip_code: 10001, kill_shelter: false, fosterer: false, adopter: true, shelter_id: 2)
Pet.create(name: 'Sparky', age: 9, bio: "Elderly cat needs a buddy", gender: "Male", species: "Cat", breed: "Long Haired", zip_code: 10022, kill_shelter: true, fosterer: false, adopter: true, shelter_id: 3)
Pet.create(name: 'Russel', age: 2, bio: "Snuggly kitty cat", gender: "Male", species: "Cat", breed: "Calico", zip_code: 10006, kill_shelter: false, fosterer: true, adopter: true, shelter_id: 1)
Pet.create(name: 'Buddy', age: 10, bio: "Cute old man dog, low energy but cuddly", gender: "Male", species: "Dog", breed: "Golden Retriever", zip_code: 10003, kill_shelter: true, fosterer: true, adopter: true, shelter_id: 2)
Pet.create(name: 'Lady', age: 1, bio: "Peppy little pupper", gender: "Female", species: "Dog", breed: "bull dog", zip_code: 10004, kill_shelter: false, fosterer: false, adopter: true, shelter_id: 3)
Pet.create(name: 'Daisy', age: 2, bio: "What a doggo!", gender: "Female", species: "Dog", breed: "pit bull", zip_code: 10020, kill_shelter: false, fosterer: true, adopter: false, shelter_id: 1)
Pet.create(name: 'Sunflower', age: 3, bio: "Loves to chase mice", gender: "Female", species: "Cat", breed: "tabby", zip_code: 10005, kill_shelter: true, fosterer: true, adopter: true, shelter_id: 2)
Pet.create(name: 'Mittens', age: 5, bio: "Will be your companion", gender: "Female", species: "Cat", breed: "siamese", zip_code: 10009, kill_shelter: false, fosterer: true, adopter: true, shelter_id: 3)
Pet.create(name: 'Sunny', age: 1, bio: "Little kitten loves to play", gender: "Female", species: "Cat", breed: "hairless", zip_code: 100010, kill_shelter: false, fosterer: true, adopter: false, shelter_id: 1)

Owner.create(name: "Rick", bio: "First time pet owner", adopter: true, fosterer: true, zip_code: 10003, email: "a@gmail.com", password: "password")
Owner.create(name: "Jennifer", bio: "Love big dogs", adopter: true, fosterer: true, zip_code: 10001, email: "b@gmail.com", password: "password" )
Owner.create(name: "Sara", bio: "Kittens are my thing", adopter: true, fosterer: true, zip_code: 10022, email: "c@gmail.com", password: "password")
Owner.create(name: "Annette", bio: "Who doesn't love to cuddle with animals!?", adopter: true, fosterer: false, zip_code: 10006, email: "d@gmail.com", password: "password")
Owner.create(name: "Scott", bio: "Can't resist a pet in need.", adopter: true, fosterer: false, zip_code: 10003, email: "e@gmail.com", password: "password")
Owner.create(name: "Michael", bio: "Kitty cat!!", adopter: true, fosterer: false, zip_code: 10004, email: "f@gmail.com", password: "password")
Owner.create(name: "Larry", bio: "In search of an elderly pet", adopter: true, fosterer: false, zip_code: 10020, email: "g@gmail.com", password: "password")
Owner.create(name: "Scooter", bio: "Love high energy animals", adopter: true, fosterer: false, zip_code: 10005, email: "h@gmail.com", password: "password")
Owner.create(name: "Lindsay", bio: "Looking for a doggo", adopter: false, fosterer: true, zip_code: 10009, email: "i@gmail.com", password: "password")
Owner.create(name: "Kate", bio: "Looking for a pupper!", adopter: false, fosterer: true, zip_code: 10010, email: "j@gmail.com", password: "password")
Owner.create(name: "Chris", bio: "Just tryna help", adopter: false, fosterer: true, zip_code: 10001, email: "k@gmail.com", password: "password")

Shelter.create(name: "Animal Haven Shelter" , website: "https://www.animalhavenshelter.org/")
Shelter.create(name: "Animal Care Centers of NYC", website: 'https://www.nycacc.org/')
Shelter.create(name: "Badass Brooklyn Animal Rescue" , website: 'http://www.badassbrooklynanimalrescue.com/')

Rescue.create(owner_id: 1, pet_id: 1, story: "We love each other!", adoption: true)
Rescue.create(owner_id: 2, pet_id: 2, story: "My pet rescued me", adoption: true)
Rescue.create(owner_id: 3, pet_id: 3, story: "Who rescued who?", adoption: true)
Rescue.create(owner_id: 4, pet_id: 4, story: "So happy my pet is now a part of my family!", adoption: true)
Rescue.create(owner_id: 5, pet_id: 5, story: "Everyone should rescue a pet", adoption: true)
Rescue.create(owner_id: 10, pet_id: 10, story: "I might have to keep my fostered pet!", adoption: false)
Rescue.create(owner_id: 9, pet_id: 9, story: "My fostered pet brings so much joy to my home", adoption: false)
Rescue.create(owner_id: 8, pet_id: 8, story: "What a cutie pie", adoption: false)
Rescue.create(owner_id: 1, pet_id: 7, story: "PLEASE FOSTER! We have so many animals in need.", adoption: false)
