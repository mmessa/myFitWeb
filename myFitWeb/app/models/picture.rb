class Picture < ActiveRecord::Base

  belongs_to :profile
  belongs_to :update

end
