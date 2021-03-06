class Product < ActiveRecord::Base
  has_many :reviews
  ratyrate_rateable "price"

  has_attached_file :avatar, :styles => { :medium => "450x450>", :thumb => "100x100>" }, :default_url => "/images/:style/missing.png"
  validates_attachment_content_type :avatar, :content_type => /\Aimage\/.*\Z/

  has_many :product_pictures
  accepts_nested_attributes_for :product_pictures, :reject_if => lambda { |t| t['product_pictures'].nil? }
end
