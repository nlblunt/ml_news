class Article < ActiveRecord::Base
  belongs_to :article_template
  belongs_to :author

  has_attached_file :display_img, :styles => {:major => "800x450", :minor => "450x450"}
  has_attached_file :news_img, :styles => {:major => "1600x900", :minor => "900x900"}

  validates_attachment_content_type :display_img, :news_img, :content_type => /\Aimage\/.*\Z/
  
  validates :name, :author, :article_template_id, :category, presence: true
end
