class StaticPagesController < ApplicationController
  skip_before_action :authenticate_user!
  
  def landing_page
    @featured_product = Product.first

    @products = Product.limit(3)
  end

  def thank_you
    @name = params[:name]
    @email = params[:email]
    @message = params[:message]
    ActionMailer::Base.mail(:from => @email,
          :to => '671981@gmail.com',
          :subject => "A new contact form message from #{@name}",
          :body => @message).deliver
  end

end
