class Profile < ActiveRecord::Base

  has_many :workouts, dependent: :destroy
  has_many :goals, dependent: :destroy
  has_many :pictures, dependent: :destroy
  has_many :supplements, dependent: :destroy

  belongs_to :user


  def height
     feet.to_s + " feet " + inches.to_s + " inches"
  end

end
