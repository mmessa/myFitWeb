class Picture < ActiveRecord::Base

  def generate_filename
     string = (0...20).map { ('a'..'z').to_a[rand(26)] }.join
     self.filename = string + ".jpg"
  end

  belongs_to :profile
  belongs_to :update

end
