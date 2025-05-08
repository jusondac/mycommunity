class EventSchedule < ApplicationRecord
  belongs_to :event
  belongs_to :user
  # Validations
  validates :title, presence: true
  validates :start, presence: true
  validates :finish, presence: true

  ## update the ransackable below with column you want to add ransack
  def self.ransackable_attributes(auth_object = nil)
    ["id"]
  end

  def self.ransackable_associations(auth_object = nil)
    []
  end
end