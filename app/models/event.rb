class Event < ApplicationRecord
  belongs_to :creator, class_name: "User", foreign_key: "user_id"
  has_many :enrollments
  has_many :attendees, through: :enrollments, source: :user

  scope :past, -> { where("date < ?", Time.now) }
  scope :future, -> { where("date > ?", Time.now) }
end
