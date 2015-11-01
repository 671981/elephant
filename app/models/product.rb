class Product < ActiveRecord::Base
  has_many :orders
  has_many :comments
  belongs_to :user

  validates :name, presence: true
  validates :description, presence: true
  validates_format_of :price, :with => /\A\d+(?:\.\d{0,2})?\z/

  #will_paginate global limit
  self.per_page = 10

  def average_rating
    comments.average(:rating).to_f
  end
  
  def cache_key
    "#{super}-#{comments.count}"
  end  

  def number_of_shows
    $redis.incr("product-shows-#{id}").to_i
  rescue Exception => ex
    Rails.logger.error(ex.message)
    Rails.logger.error(ex.backtrace)
    0  
  end  
end

