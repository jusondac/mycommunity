class CommunityFinance < ApplicationRecord
  belongs_to :payment
  belongs_to :community
  # Validations

  ## update the ransackable below with column you want to add ransack
  def self.ransackable_attributes(auth_object = nil)
    ["id"]
  end

  def self.ransackable_associations(auth_object = nil)
    []
  end
end