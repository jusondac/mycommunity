class Event < ApplicationRecord
  has_many :event_communities
  has_one :event_detail
  has_many :event_schedules
  has_many :communities, through: :event_communities
  has_many :event_users, through: :event_communities, source: :user
  belongs_to :community
  # Validations
  validates :name, presence: true
  validates :date, presence: true

  enum :status, %i[upcoming ongoing completed], default: :upcoming

  def event_communities_by_role(role)
    event_communities.where(role: role)
  end

  ## update the ransackable below with column you want to add ransack
  def self.ransackable_attributes(auth_object = nil)
    [ "id", "name" ]
  end

  def self.ransackable_associations(auth_object = nil)
    []
  end
end
