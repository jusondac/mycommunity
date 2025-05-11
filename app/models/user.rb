class User < ApplicationRecord
  has_secure_password
  belongs_to :role
  delegate :name, to: :role, prefix: true
  has_many :sessions, dependent: :destroy
  has_many :community_members, dependent: :destroy
  has_many :community, through: :community_members, source: :community
  normalizes :email_address, with: ->(e) { e.strip.downcase }

  before_create :set_default_role

  def set_default_role
    self.role ||= Role.find_by(name: "Member")
  end

  def self.ransackable_attributes(auth_object = nil)
    [ "email_address", "username" ]
  end

  def self.ransackable_associations(auth_object = nil)
    []
  end
end
