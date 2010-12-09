require File.dirname(__FILE__) + '/../test_helper'

class OrganisationsControllerTest < ActionController::TestCase
   context "Security:  " do
    setup { 
      @organization = Factory(:organisation)
      @attrs = Factory.attributes_for(:organisation) }
    context "Guest" do
      #setup {login_as somebody}
      context "(read_actions)" do
        should "get index" do
          get :index
          assert_response :success
        end
        should "get show" do
          get :show, :id=>@organization.id
          assert_response :success
        end
      end
      context "(edit actions)" do
        should "not get new" do
          get :new
          assert_response :success
          assert_no_tag :tag=>'form'
        end 
        should "not get edit" do
          get :edit, :id=>@organization.id
          assert_response :success
          assert_no_tag :tag=>'form'
        end
      end
      context "(write_actions)" do
        should "not post create" do
          count1 = Organisation.count
          post :create, :organisation => @attrs 
          count2 = Organisation.count
          assert_equal count1, count2, "Nothing created"
          assert_response :forbidden
        end
        should "not put update" do
          put :update, :id=>@organization.id, :organisation => @attrs 
          assert_response :forbidden
        end
        should "not delete" do
          delete :destroy, :id=>@organization.id
          assert_response :forbidden
        end
      end
    end
  end

end
