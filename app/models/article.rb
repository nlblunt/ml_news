class Article < ActiveRecord::Base
  belongs_to :author
  belongs_to :category

  has_attached_file :display_img, :styles => {:major => "800x450!", :minor => "450x450!"}
  #has_attached_file :news_img, :styles => {:major => "1600x900", :minor => "900x900"}

  validates_attachment_content_type :display_img, :content_type => /\Aimage\/.*\Z/
  
  validates :title, :body, :author, :category_id, presence: true
end
