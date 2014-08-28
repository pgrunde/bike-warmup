class Buyer < ActiveRecord::Base
  has_many :bikes
  has_many :shops, through: :bikes

  def shops_without_favorite
    arr = []
    brand = self.favorite_brand
    shops = Shop.joins(:bikes).select(:name).where("bikes.brand != '#{brand}'")
    shops.each {|shop| arr << shop.name }
    arr.uniq
  end
end