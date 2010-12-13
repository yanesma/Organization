require File.dirname(__FILE__) + '/acceptance_helper'

#See
#    https://github.com/cavalle/steak
#    https://github.com/jnicklas/capybara
#    https://github.com/thoughtbot/factory_girl

feature "Organization CRUD", %q{
  As an Admin
  I want to CRUD organizations
} do

background {@attrs = Factory.attributes_for(:organisation)}

  describe "When admin, " do
    background do
      @admin = Factory(:admin)
      login_as(@admin)
    end

    describe "With nothing, " do
      describe "At list, " do
        background {visit '/organisations'}
        scenario("I browse") do
           page.should_not have_content('.collection.organisations')
           page.should have_link('New Organisation')
         end
        scenario "I create" do
          click_link('New Organisation')
        end
      end
    end

    describe "With a record, " do
      background {@organization = Factory(:organisation)}
      describe "At list, " do
        background {visit '/organisations'}
        scenario "I browse" do
          page.should have_content(@organization.name)
          click_link @organization.name
          page.should have_content(@organization.name)
        end

        describe "At show, " do
          background do
            within('.collection.organisations .card.organisation') do
              click_link @organization.name
            end
          end
          scenario "I read" do
            page.should have_content(@organization.name)
          end
          describe "At edit, " do
            background {find('.edit-link.organisation-link').click}
            scenario "I update" do
              fill_in 'organisation_name', :with => 'example.com'
              click_button('Save')
              visit '/organisations'
              page.should have_content('example.com')
            end

            scenario "I delete" do
              click_button('Remove This Organisation')
              visit '/organisations'
              page.should_not have_content(@organization.name)
            end
          end
        end
      end
    end

  end

#  describe "When guest, " do
#     background do
#      @guest = Factory(:guest)
#      login_as(@guest)
#    end
#
#    describe "With nothing, " do
#      describe "At list, " do
#        background {visit '/organisations'}
#        scenario("I browse") do
#           page.should_not have_content('collection organisations')
#           find('#navigation').should have_button('New Organisation')
#
#         end
#        scenario "I create" do
#          click_link('New Organisation')
#        end
#      end
#    end
#
#    describe "With a record, " do
#      background {@organization = Factory(:organisation)}
#      describe "At list, " do
#        background {visit '/organisations'}
#        scenario "I browse" do
#          page.should have_content(@organization.name)
#          click_link @organization.name
#          page.should have_content(@organization.name)
#        end
#
#        describe "At show, " do
#          background do
#            within('.collection.organisations .card.organisation') do
#              click_link @organization.name
#            end
#          end
#          scenario "I read" do
#            page.should have_content(@organization.name)
#          end
#          describe "At edit, " do
#            background {find('.edit-link.organisation-link').click}
#            scenario "I update" do
#              fill_in 'organisation_name', :with => 'example.com'
#              click_button('Save')
#              visit '/organisations'
#              page.should have_content('example.com')
#            end
#
#            scenario "I delete" do
#              click_button('Remove This Organisation')
#              visit '/organisations'
#              page.should_not have_content(@organization.name)
#            end
#          end
#        end
#      end
#    end
#
#  end

end
