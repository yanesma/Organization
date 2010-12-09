require File.dirname(__FILE__) + '/acceptance_helper'
#
##See
##    https://github.com/cavalle/steak
##    https://github.com/jnicklas/capybara
##    https://github.com/thoughtbot/factory_girl
#
#feature "Organization CRUD", %q{
#  As an Admin
#  I want to CRUD organizations
#} do
#
#background {@attrs = Factory.attributes_for(:organisation)}
#
#  describe "When admin, " do
#    background do
#      @admin = Factory(:admin)
#      login_as(@admin)
#    end
#
#    describe "With nothing, " do
#      describe "At list, " do
#        background {visit '/organisations'}
#        scenario "I browse"
#        scenario "I create"
#      end
#    end
#
#    describe "With a record, " do
#      background {@organization = Factory(:organisation)}
#      describe "At list, " do
#        background {visit '/organisations'}
#        scenario "I browse"
#        describe "At show, " do
#          background do
#            within('.collection.organisations .card.organisation') do
#              click_link @organization.name
#            end
#          end
#          scenario "I read"
#          describe "At edit, " do
#            background {find('.edit-link.organisation-link').click}
#            scenario "I update"
#            scenario "I delete"
#          end
#        end
#      end
#    end
#
#  end
#
##   describe "When guest, " do
##   end
#
#end
#
