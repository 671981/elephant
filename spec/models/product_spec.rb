require 'rails_helper'

describe Product do

  context "when the product has comments" do
    
    before do
      #@product = Product.create(:name => "race bike")
      #@user = User.create(:first_name => "Jan", :last_name => "Doe")
      @product = FactoryGirl.create(:product)
      @user = FactoryGirl.create(:user)
      #@product.comments.create(:rating => 1, :user => @user, :body => "Horrible")
      #product.comments.create(:rating => 3, :user => @user, :body => "OK")
      #product.comments.create(:rating => 5, :user => @user, :body => "Amazing")
      @comment = FactoryGirl.create(:comment, rating: "1")
      @comment2 = FactoryGirl.create(:comment, rating: "3")
      @comment3 = FactoryGirl.create(:comment, rating: "5")
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