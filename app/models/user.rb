class User < ApplicationRecord
  has_secure_password
  belongs_to :role
  has_many :sessions, dependent: :destroy

  normalizes :email_address, with: ->(e) { e.strip.downcase }

  before_create :set_default_role

  def set_default_role
    self.role ||= Role.find_by(name: "Member")
  end

  def self.ransackable_attributes(auth_object = nil)
    [ "email", "username" ]
  end

  def self.ransackable_associations(auth_object = nil)
    []
  end
end
