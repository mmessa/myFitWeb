class Profile < ActiveRecord::Base

  has_many :workouts, dependent :destroy
  has_many :goals, dependent :destroy
  has_many :pictures, dependent :destroy
  has_many :supplements, dependent :destroy

  belongs_to :user

end
