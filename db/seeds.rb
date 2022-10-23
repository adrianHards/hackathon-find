puts "making 2 patients"
patient_0= Patient.new(
  name: ['Diandra'],
  location: 'Харків',
  phone_numbers: '+380 63 476 0206',
  details: '1234567'
)
file = URI.open("https://res.cloudinary.com/detwvcqim/image/upload/v1666516478/development/didi_wuemlk.jpg")
patient_0.photo.attach(io: file, filename: "nes.png", content_type: "image/png")
patient_0.save!
patient_1= Patient.new(
  name: ['bo'],
  location: 'Сімферополь',
  phone_numbers: '+380 97 150 7053'
)
file = URI.open("https://res.cloudinary.com/borhan-cloud/image/upload/v1666535485/find/20220416_224449_dmgamv.jpg")
patient_1.photo.attach(io: file, filename: "nes.png", content_type: "image/png")
patient_1.save!
patient_2= Patient.new(
  name: ['vitali'],
  location: 'Харків',
  phone_numbers: '+380 97 150 7053'
)
file = URI.open("https://res.cloudinary.com/borhan-cloud/image/upload/v1666476465/find/Vitali-Klitschko-780x470_wep1ne.jpg")
patient_2.photo.attach(io: file, filename: "nes.png", content_type: "image/png")
patient_2.save!
patient_3= Patient.new(
  name: ['Zelensky'],
  location: 'Львів',
  phone_numbers: '+380 97 150 7053'
)
file = URI.open("https://res.cloudinary.com/borhan-cloud/image/upload/v1666476625/find/0x0_he0ykk.jpg")
patient_3.photo.attach(io: file, filename: "nes.png", content_type: "image/png")
patient_3.save!
patient_4= Patient.new(
  name: ['Kamil'],
  location: 'Вінниця',
  phone_numbers: '+380 97 150 7053'
)
file = URI.open("https://res.cloudinary.com/borhan-cloud/image/upload/v1666463246/find/Kamil-Musilek_h1mwsd.jpg")
patient_4.photo.attach(io: file, filename: "nes.png", content_type: "image/png")
patient_4.save!
puts "made #{Patient.count} patients"
