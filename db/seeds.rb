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
    content: "本文#{index}",
    netshop_link: "https://item.rakuten.co.jp/netbaby/4904810128465/",
    rakuten_toyname: "はじめて英語 くまのプーさんと絵本でおしゃべり！ゆびさき知育いっぱいできた(1個)【タカラトミー】[おもちゃ 玩具 知育 ゆびさき プーさん]",
    rakuten_toyimage: "https://thumbnail.image.rakuten.co.jp/@0_mall/netbaby/cabinet/465/4904810128465.jpg?_ex=128x128">,
  )
end