# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

sexes = ['M', 'F']

15.times do
  u = User.create(
    user_name: Faker::StarWars.character.split(' ').first.to_s,
    password: 'password'
  )

  rand(20).times do
    Cat.create(
      name: Faker::Superhero.name,
      birth_date: Faker::Date.backward(2000),
      sex: sexes.sample,
      color: Cat::CAT_COLORS.sample,
      description: Faker::Superhero.power,
      user_id: u.id
      )
  end

end

User.all.each do |u|
  rand(5).times do
    c = Cat.all.where.not(user_id: u.id).sample
    start_d = Faker::Date.backward(500)
    end_d = Faker::Date.forward(500)

    CatRentalRequest.create(cat_id: c.id, start_date: start_d, end_date: end_d, user_id: u.id, status: "PENDING")
  end
end
