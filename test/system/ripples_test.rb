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

  test "viewing next 10 ripples & then newest" do
    visit ripples_url
    click_link "Next 10 Ripples"

    ripple21 = ripples(:ripple_21)
    assert_selector '.ripple-name', text: ripple21.name
    assert_selector '.ripple-message', text: ripple21.message

    click_link 'Newest'

    last = ripples(:last)
    assert_selector '.ripple-name', text: last.name
    assert_selector '.ripple-message', text: last.message
  end


  test "viewing oldest & then previous 10 ripples" do
    visit ripples_url
    click_link 'Oldest'

    ripple1 = ripples(:ripple_1)
    assert_selector '.ripple-name', text: ripple1.name
    assert_selector '.ripple-message', text: ripple1.message

    click_link 'Previous 10 Ripples'

    ripple11 = ripples(:ripple_11)
    assert_selector '.ripple-name', text: ripple11.name
    assert_selector '.ripple-message', text: ripple11.message
  end
end
