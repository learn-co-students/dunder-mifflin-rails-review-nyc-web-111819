class Employee < ApplicationRecord
    belongs_to :dog

    validates :alias, uniqueness: true
    validates :title, uniqueness: true
    validates :first_name, :last_name, :title, :office, presence: true
end
