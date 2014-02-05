class Animal < ActiveRecord::Base
  validates :name, :type_of_animal, :description, :presence => true

  validates :age, :numericality => { :greater_than => 0, :less_than_or_equal_to => 500 }

end
