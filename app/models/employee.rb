class Employee < ApplicationRecord
    belongs_to :dog

    validates :title, :alias, presence: true
end
