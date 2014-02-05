require 'test_helper'

class AnimalTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  test "animal attributes must not be empty" do
    animal = Animal.new
    assert animal.invalid?
    assert animal.errors[:name].any?
    assert animal.errors[:age].any?
    assert animal.errors[:type_of_animal].any?
    assert animal.errors[:description].any?
  end

  test "animal age must be reasonable" do
    animal = Animal.new(name:       "My Friend",
                        type_of_animal: "Elephant",
                        description:   "Large & in charge")
    animal.age = -1
    assert animal.invalid?
    assert_equal ["can't be negative"],
      animal.errors[:animal]

    animal.age = 0
    assert animal.invalid?
    assert_equal ["must be greater than 0"],
      animal.errors[:animal]

    animal.age = 9000
    assert animal.invalid?
    assert_equal ["must be less than or equal to 500"],
      animal.errors[:animal]

    animal.age = 1
    assert product.valid?
  end
end
