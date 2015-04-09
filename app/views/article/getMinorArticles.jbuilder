json.array! @articles do |article|
    json.title article.title
    json.body article.body
    json.category_name article.category.name
    json.category_short article.category.short
    json.major article.major
    json.display_img url_for(article.display_img(:minor))
    json.caption article.caption
    json.author Author.find(article.author_id)
end