class Employee < ApplicationRecord
    has_one :dogs
    validates :first_name, uniqueness: true
    validates :last_name, uniqueness: true
    validates :title, uniqueness: true
end
