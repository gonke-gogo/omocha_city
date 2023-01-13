10.times do 
  User.create(
    name: Faker::Name.name,
    email: Faker::Internet.email,
    password: 'password',
    password_confirmation: 'password'
  )
end

20.times do |index|
  Post.create(
    user: User.offset(rand(User.count)).first,
    toy_name: "タイトル#{index}",
    content: "本文#{index}"
  )
end