class CreateAnimals < ActiveRecord::Migration
  def change
    create_table :animals do |t|
      t.string :name
      t.decimal :age
      t.string :type_of_animal
      t.text :description

      t.timestamps
    end
  end
end
