class Employee < ApplicationRecord
  belongs_to :dog
  validates :alias, :title, uniqueness: true

  def name
    "#{self.first_name} #{self.last_name}"
  end

  def dog_name
    self.dog.name
  end

  # def self.attributes
  #   [
  #   :first_name,
  #   :last_name,
  #   :alias,
  #   :title,
  #   :office,
  #   :img_url,
  #   :dog_id
  #   ]
  # end
end
