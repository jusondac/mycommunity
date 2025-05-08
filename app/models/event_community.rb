class EventCommunity < ApplicationRecord
  belongs_to :user
  belongs_to :community
  belongs_to :event
  # Validations
  validates :role, presence: true
  validates :title, presence: true

  enum :role, {
    collaborator: 0,
    organizer: 1,
    attendant: 2
  }
  ## update the ransackable below with column you want to add ransack
  # def self.ransackable_attributes(auth_object = nil)
  #   ["id"]
  # end

  # def self.ransackable_associations(auth_object = nil)
  #   []
  # end
end
