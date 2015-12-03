class Profile < ActiveRecord::Base

  has_many :workouts, dependent: :destroy
  has_many :goals, dependent: :destroy
  has_many :supplements, dependent: :destroy
  has_many :updates, dependent: :destroy
  has_many :pictures, through: :updates

  belongs_to :user


  def height
     feet.to_s + " feet " + inches.to_s + " inches"
  end

  def fat_weight
    if self.weight != nil && self.body_fat != nil
      fat_weight = self.weight * (self.body_fat * 0.01)
    end
  end

  def lean_mass
    if self.weight != nil && self.body_fat != nil
      lean_mass = self.weight - self.fat_weight
    end
  end

end
