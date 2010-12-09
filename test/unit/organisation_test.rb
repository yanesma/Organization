require File.dirname(__FILE__) + '/../test_helper'

class OrganisationTest < ActiveSupport::TestCase
 context "ActiveRecord" do
    setup { Factory(:organization)}
    should validate_uniqueness_of( :name )
  end
  context "An Organization" do
    setup { @organization = Factory(:organization)}
    should "do something"
    should "do anotherthing"
  end
end

