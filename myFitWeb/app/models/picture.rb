class Picture < ActiveRecord::Base

  def generate_filename
     string = (0...20).map { ('a'..'z').to_a[rand(26)] }.join
     self.name = string + ".jpg"
  end

  belongs_to :update_pic, foreign_key: "update_id", class_name: "Update"

end
