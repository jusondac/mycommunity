class Community < ApplicationRecord
  has_many :community_members
  has_many :members, through: :community_members, source: :user
  # Validations
  validates :name, presence: true
  validates :descriptions, presence: true

  ## update the ransackable below with column you want to add ransack
  def self.ransackable_attributes(auth_object = nil)
    [ "id" ]
  end

  def self.ransackable_associations(auth_object = nil)
    []
  end
end
