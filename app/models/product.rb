class Product < ActiveRecord::Base
  belongs_to :brand
  belongs_to :category

  has_many :line_items
  before_destroy :ensure_not_referenced_by_any_line_items

  has_attached_file :avatar, styles: { medium: "300x300>", thumb: "100x100>" }, default_url: ":style_missing.png"
  validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\Z/

#By validating brand and category without "_id", we are making sure that they not only have a interger in the brand_id/category_id fields but that those keys refer to real brand and vatergories that currently exist
  validates_presence_of :name, :current_price, :quantity, :description, :brand, :category

validates_numericality_of :current_price, greater_than_or_equal_to: 0.01

validates_numericality_of :quantity, greater_than_or_equal_to: 0

end

private

# TODO: make sure this works
def ensure_not_referenced_by_any_line_items
  if line_items.empty?
    return true
  else
    errors.add(:base, "Cannote delete because line items are present")
    return false
  end

end


