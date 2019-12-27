class Product < ApplicationRecord
  before_destroy :not_referenced_by_any_line_item
  belongs_to :user, optional: true
  has_many :line_items

  validates :title, :price, presence: true
  validates :title, length: {maximum: 140, too_long: "%{count} characters is the maximum aloud. "}
  validates :price, length: {maximum: 7}


  private

  def not_refereced_by_any_line_item
    unless line_items.empty?
      errors.add(:base, "Line items present")
      throw :abort
    end
  end
end
