json.array!(@exercises) do |exercise|
  json.extract! exercise, :id, :name, :repetitions, :notes, :workout_id
  json.url exercise_url(exercise, format: :json)
end
