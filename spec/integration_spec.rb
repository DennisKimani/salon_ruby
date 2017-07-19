require('capybara/rspec')
require('./app')
Capybara.app = Sinatra::Application
set(:show_exceptions, false)

# describe('adding a new stylist', type: :feature) do
#   it('allows a user to click a stylist to see the client and details for it') do
#     visit('/')
#     click_link('Add a new Stylist')
#     fill_in('name', with: 'Jane')
#     click_button('Add Stylist')
#     expect(page).to have_content('Success!')
#   end
# end
#
# describe('viewing all of the stylists', type: :feature) do
#   it('allows a user to see all of the stylists that have been created') do
#     stylist = Stylist.new(name: 'Moringa')
#     stylist.save
#     visit('/')
#     click_link('View All Stylists')
#     expect(page).to have_content(stylist.name)
#   end
# end
#
# describe('seeing details for a single stylist', type: :feature) do
#   it('allows a user to click a stylist to see the clients and details for it') do
#     test_stylist = Stylist.new(name: 'School')
#     test_stylist.save
#     test_client = Client.new(name: 'Fiona', stylist_id: test_stylist.id)
#     test_client.save
#     visit('/stylists')
#     click_link(test_stylist.name)
#     expect(page).to have_content(test_client.name)
#   end
# end
#
# describe('adding clients to a stylist', {:type => :feature}) do
#     it('allows a user to add a client to a stylist') do
#       test_stylist = Stylist.new({:name => 'Rose'})
#       test_stylist.save()
#       visit("/stylists/#{test_stylist.id()}")
#       fill_in("Name", {:with => "John"})
#       click_button("Add client")
#       expect(page).to have_content("Success")
#     end
#   end
