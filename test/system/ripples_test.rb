require "application_system_test_case"

class RipplesTest < ApplicationSystemTestCase
  setup do
    @ripple = ripples(:one)
    @url = "https://thenumber#{rand(100)}iscool.com/"
  end

  test "visiting the index" do
    visit ripples_url
    
    assert_selector 'table'
    assert_selector 'tr'
    
    assert_selector 'th', text: 'Name'
    assert_selector 'th', text: 'Message'
    assert_selector 'th', text: 'Posted'
    
    assert_text 'Newest | Previous 10 Ripples | Next 10 Ripples | Oldest | New Ripple'
  end

  test "creating a Ripple" do
    visit ripples_url
    click_on "New Ripple"

    fill_in 'ripple_name', with: @ripple.name
    fill_in 'ripple_url', with: @url
    fill_in 'ripple_message', with: @ripple.message
    
    click_on "Create Ripple"

    assert_selector '#notice', text: 'Ripple was successfully created'

    assert_selector 'td a', text: @ripple.name
    assert_selector 'td', text: @ripple.message
    assert_selector 'td a', text: 'Show'
  end
end
