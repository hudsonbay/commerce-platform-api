# Script for populating the database. You can run it as:
#
#     mix run priv/repo/seeds.exs
#
# Inside the script, you can read and write to any of your
# repositories directly:
#
#     CommercePlatformApi.Repo.insert!(%CommercePlatformApi.SomeSchema{})
#
# We recommend using the bang functions (`insert!`, `update!`
# and so on) as they will fail if something goes wrong.

# alias CommercePlatformApi.Repo
alias CommercePlatformApi.{Accounts, Products}

Faker.start()

# inserting fake products
for _ <- 0..100 do
  name = Faker.Commerce.En.product_name()
  sale_price = Money.new!(:USD, Faker.random_between(1, 500))
  # weight = Faker.Commerce.price()
  # size = Faker.Commerce.price()
  description = Faker.Lorem.paragraph()
  # thumbnail = Faker.File.file_name(:image)
  # stock = Faker.random_between(1, 25)
  # product_subcategory_id = Faker.random_between(1, 27)

  with {:ok, product} <-
         Products.create_product(%{
           name: name,
           sale_price: sale_price,
           # weight: weight,
           # size: size,
           description: description
           # thumbnail: thumbnail,
           # stock: stock,
           # product_subcategory_id: product_subcategory_id
         }) do
    product
  end
end

# Users
Accounts.register_user(%{
  "email" => "manuelmenendezalfonso@gmail.com",
  "name" => "Manuel Menendez",
  "password" => "123qweasdzxc"
})
