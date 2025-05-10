class Payment < ApplicationRecord
  # Validations
  validates :amount, presence: true
  validates :payment_method, presence: true
  validates :notes, presence: true
  validates :status, presence: true
  validates :paid_at, presence: true

  ## update the ransackable below with column you want to add ransack
  def self.ransackable_attributes(auth_object = nil)
    ["id"]
  end

  def self.ransackable_associations(auth_object = nil)
    []
  end
end