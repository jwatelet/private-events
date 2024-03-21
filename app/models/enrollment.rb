class Enrollment < ApplicationRecord
  validates :event, uniqueness: { score: :user }

  belongs_to :user
  belongs_to :event
end
