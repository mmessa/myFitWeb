json.array!(@profiles) do |profile|
  json.extract! profile, :id, :weight, :feet, :inches, :body_fat, :age, :gender, :location, :gym, :user_id
  json.url profile_url(profile, format: :json)
end
