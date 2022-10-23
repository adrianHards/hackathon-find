puts "making 2 patients"

patient_0= Patient.new(
  location: 'Харків',
  phone_numbers: '+380 63 476 0206'
)
file = URI.open("https://res.cloudinary.com/detwvcqim/image/upload/v1666516486/development/bobo_pctvm4.jpg")
patient_0.photo.attach(io: file, filename: "nes.png", content_type: "image/png")
patient_0.save!

patient_1= Patient.new(
  location: 'Сімферополь',
  phone_numbers: '+380 97 150 7053'
)
file = URI.open("https://res.cloudinary.com/detwvcqim/image/upload/v1666516478/development/didi_wuemlk.jpg")
patient_1.photo.attach(io: file, filename: "nes.png", content_type: "image/png")
patient_1.save!

puts "made #{Patient.count} patients"
