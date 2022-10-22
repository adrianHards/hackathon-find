puts "making 2 patients"

patient_1= Patient.new(
  location: 'Харків',
  phone_numbers: '+380 63 476 0206'
)
file = URI.open("https://res.cloudinary.com/detwvcqim/image/upload/v1666449758/development/v27sf24hlntxsl6xjczlygho7iay.jpg")
patient_1.photo.attach(io: file, filename: "nes.png", content_type: "image/png")
patient_1.save!

patient_2= Patient.new(
  location: 'Сімферополь',
  phone_numbers: '+380 97 150 7053'
)
file = URI.open("https://res.cloudinary.com/detwvcqim/image/upload/v1666449759/development/p741nusme1tcrjnv9srvyjgjqxoa.jpg")
patient_2.photo.attach(io: file, filename: "nes.png", content_type: "image/png")
patient_2.save!

puts "made #{Patient.count} patients"
