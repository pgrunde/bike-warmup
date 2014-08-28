class Bike < ActiveRecord::Base
  belongs_to :buyer
  belongs_to :shop

  def favorited_by
    customer = Buyer.find_by favorite_brand: self.brand
    "#{customer.first_name} #{customer.last_name}"
  end
end