require 'rails_helper'

describe UsersController, :type => :controller do

  before do
    @user = User.create(email: "671981@gmail.com", password: "amsterdam")
  end

  describe "GET #show" do
     context "User is logged in" do
      before do
          sign_in @user
     end

     it "Loads correct user details" do
          get :show, id: @user.id
          expect(response).to have_http_status(200)
          expect(assigns(:user)).to eq @user
        end
      end

     context "No user is logged in" do
       it "redirects to login" do
         get :show, id: @user.id
         expect(response).to redirect_to(new_user_session_url) 
         # new_user_session_path is "/users/sign_in"
         # new_user_session_url  is "http://www.whatever.com/users/sign_in"
       end
     end
  end

end

# 1. before_action :authenticate_user!
#    which needs to be in the applicaiton controller , so that all of your pages are protected by the login form
# 2. If you want some pages to be public, then you need to do
#    skip_before_action :authenticate_user!, only: [.....]
#    inside the controllers that deal with the public pages. Inside the only array you have to specify
#    the actions that render the corresponding public pages. If all actions of the controller need to render
#    public pages, then only array is not needed. You can just give:
#    skip_before_action :authenticate_user!
# 3. rake db:drop .....destroys completely the database. So, we are very careful to not run this on production.
#    rake db:drop RAILS_ENV=test .....drops the test database
#    rake db:create RAILS_ENV=test .... creates the test database but not the structure inside
#    rake db:migrate RAILS_ENV=test .... runs all the schema migrations and creates the structure inside the test databse.
#    heroku run <.....command ...>
#    e.g. 
#       heroku run rake db:migrate 
   