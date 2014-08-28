class Shop < ActiveRecord::Base
  has_many :bikes
  has_many :buyers, through: :bikes

  def bike_names
    arr = []
    bikes = Bike.select(:name).where(shop_id: self.id)
    bikes.each {|bike| arr << bike.name}
    arr
  end

  def buyers
    arr = []
    buyers = Buyer.joins(:shops).where("shops.id = '#{self.id}'")
    buyers.each {|buyer| arr << buyer.first_name }
    arr
  end
end