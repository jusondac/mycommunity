class Community < ApplicationRecord
  has_many :community_members
  has_many :event_communities
  has_one :finance
  has_many :events, through: :event_communities
  has_many :members, through: :community_members, source: :user
  # Validations
  validates :name, presence: true
  validates :descriptions, presence: true


  %i[members events].each do |association|
    define_method("total_#{association}") do
      count = send(association).count
      count >= 10 ? "#{(count / 10) * 10}+" : count.to_s
    end
  end

  def top_three
    members.first(3)
  end

  ## update the ransackable below with column you want to add ransack
  def self.ransackable_attributes(auth_object = nil)
    [ "id" ]
  end

  def self.ransackable_associations(auth_object = nil)
    []
  end
end
