json.array! @authors do |author|
    json.name author.name
    json.email User.find(author.user_id).email
end