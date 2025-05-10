class Finance < ApplicationRecord
  belongs_to :community
  # Validations
  validates :description, presence: true
  validates :price, presence: true
  validates :period, presence: true
  validates :balance, presence: true

  ## update the ransackable below with column you want to add ransack
  def self.ransackable_attributes(auth_object = nil)
    ["id"]
  end

  def self.ransackable_associations(auth_object = nil)
    []
  end
end