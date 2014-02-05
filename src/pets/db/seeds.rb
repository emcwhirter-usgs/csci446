# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
Animal.delete_all

Animal.create(:name => 'Sparky',
  :age => 2,
  :type_of_animal => 'Dalmation',
  :description =>
    %{
        Sparky little puppy you've been looking for.
        Loves to frolic in the grass and chew on his favorite toys.
        Keep your shoes out of his reach.
      })

Animal.create(:name => 'Diego',
  :age => 4,
  :type_of_animal => 'Cat',
  :description =>
    %{
        Snugly little kitty cat that will not let you sleep until he gets to play.
        Loves strings and pens on the table and staying warm by your
        side at night.
      })

Animal.create(:name => 'Ralph',
  :age => 30,
  :type_of_animal => 'Horse',
  :description =>
    %{
        Old but reliable. Loves carrots, peanut butter and exploring.
      })

Animal.create(:name => 'Geico',
  :age => 2,
  :type_of_animal => 'Gecko',
  :description =>
    %{
        Calm, collected, scaly and loyal. Best friend you ever had.
      })
