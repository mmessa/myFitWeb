class Update < ActiveRecord::Base

  belongs_to :profile
  has_many :pictures

end
