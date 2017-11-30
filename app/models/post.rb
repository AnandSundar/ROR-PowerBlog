class Post < ApplicationRecord
  belongs_to :category
  belongs_to :user, optional: true #optional is added to prevent user exists error
  has_many :comments

  validates :title, presence: true
  validates :category_id, presence: true
  validates :body, presence: true

  #code to take care of image upload and validating if its a image file
  has_attached_file :image, :default_url => ":style/rails.jpg"
  validates_attachment_content_type :image, :content_type => /\Aimage\/.*\Z/

  #this will take care of search bars functionality
  def self.search(query)
    where("title like ? OR body like ?", "%#{query}%", "%#{query}%")
  end
end
