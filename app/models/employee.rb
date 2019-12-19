class Employee < ApplicationRecord
  belongs_to :dog
  validates :first_name, :last_name, :title, :office, presence: true
  validates :title, :alias, uniqueness: true, unless: :none
  
  validate :exists

  before_validation :capitalizer

  def to_s
    self.first_name + " " + self.last_name
  end

  def capitalizer
    self.first_name = self.first_name.capitalize 
    self.last_name = self.last_name.capitalize
    self.alias = self.alias.split.map{|w| w.capitalize}.join(" ")
    self.title = self.title.split.map{|w| w.capitalize}.join(" ")
  end

  def exists 
    if self.dog_id && Dog.all.exclude?(self.dog)
      self.errors.add(:dog_id, "- Please Stop playing around with the HTML")
    end
  end


  def none
    self.alias == "None" || self.title == "None"
  end
end
