class Workout < ActiveRecord::Base

  has_many :exercises, dependent: :destroy

  belongs_to :profile




end
