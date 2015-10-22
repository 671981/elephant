require 'rails_helper'

describe Product do

  context "when the product has comments" do
    
    before do
      @product = Product.create(:name => "race bike")
      @user = User.create(:first_name => "John", :last_name => "Doe", :email => "test@test.com", :password => "12345678")
      @product.comments.create(:rating => 1, :user => @user, :body => "Horrible")
      @product.comments.create(:rating => 3, :user => @user, :body => "OK")
      @product.comments.create(:rating => 5, :user => @user, :body => "Amazing")
    end

    it "returns the average rating of all comments" do
      expect(@product.average_rating).to eq 3
    end
  end

  context "product with description but no name" do

    before do
      @product = Product.create(:name => nil, :description => "race bike")
    end

    it "will not pass validation without a name" do
      expect(@product).not_to be_valid
    end
  end
end