puts "making 2 patients"

patient_0= Patient.new(
  location: 'Харків',
  phone_numbers: '+380 63 476 0206'
)
file = URI.open("https://res.cloudinary.com/detwvcqim/image/upload/v1666516486/development/bobo_pctvm4.jpg")
patient_0.photo.attach(io: file, filename: "nes.png", content_type: "image/png")
patient_0.save!

patient_1= Patient.new(
  name: 'Di',
  location: 'Сімферополь',
  phone_numbers: '+380 97 150 7053'
)
file = URI.open("https://res.cloudinary.com/detwvcqim/image/upload/v1666516478/development/didi_wuemlk.jpg")
patient_1.photo.attach(io: file, filename: "nes.png", content_type: "image/png")
patient_1.save!

patient_2= Patient.new(
  name: 'Vitali',
  location: 'Харків',
  phone_numbers: '+380 97 150 7053'
)
file = URI.open("https://res.cloudinary.com/borhan-cloud/image/upload/v1666476465/find/Vitali-Klitschko-780x470_wep1ne.jpg")
patient_2.photo.attach(io: file, filename: "nes.png", content_type: "image/png")
patient_2.save!

patient_3= Patient.new(
  name: 'zelensky',
  location: 'Львів',
  phone_numbers: '+380 97 150 7053'
)
file = URI.open("https://res.cloudinary.com/borhan-cloud/image/upload/v1666476625/find/0x0_he0ykk.jpg")
patient_3.photo.attach(io: file, filename: "nes.png", content_type: "image/png")
patient_3.save!

patient_4= Patient.new(
  location: 'Вінниця',
  phone_numbers: '+380 97 150 7053'
)
file = URI.open("https://res.cloudinary.com/borhan-cloud/image/upload/v1666463246/find/Kamil-Musilek_h1mwsd.jpg")
patient_4.photo.attach(io: file, filename: "nes.png", content_type: "image/png")
patient_4.save!


puts "made #{Patient.count} patients"
