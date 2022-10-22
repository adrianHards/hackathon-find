# Create patients
require 'faker'
require 'open-uri'

pat1 = Patient.new(
  name: Faker::Name.name,
  phone_numbers: [ Faker::PhoneNumber.phone_number ],
  location: Faker::Address.city,
  details: "40 years old, 5'8, tattoo on right forearm"
)
file = URI.open("https://images.unsplash.com/photo-1570295999919-56ceb5ecca61?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1780&q=80")
pat1.photo.attach(io: file, filename: "nes.png", content_type: "image/png")
pat1.save

pat2 = Patient.new(
  name: Faker::Name.name,
  phone_numbers: [ Faker::PhoneNumber.phone_number ],
  location: Faker::Address.city,
  details: "40 years old, 5'8, tattoo on right forearm"
)
file = URI.open("https://images.unsplash.com/photo-1573140247632-f8fd74997d5c?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=2070&q=80")
pat2.photo.attach(io: file, filename: "nes.png", content_type: "image/png")
pat2.save