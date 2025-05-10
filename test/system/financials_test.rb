require "application_system_test_case"

class FinancialsTest < ApplicationSystemTestCase
  setup do
    @financial = financials(:one)
  end

  test "visiting the index" do
    visit financials_url
    assert_selector "h1", text: "Financials"
  end

  test "should create financial" do
    visit financials_url
    click_on "New financial"

    fill_in "Community", with: @financial.community_id
    fill_in "Description", with: @financial.description
    fill_in "Period", with: @financial.period
    fill_in "Price", with: @financial.price
    click_on "Create Financial"

    assert_text "Financial was successfully created"
    click_on "Back"
  end

  test "should update Financial" do
    visit financial_url(@financial)
    click_on "Edit this financial", match: :first

    fill_in "Community", with: @financial.community_id
    fill_in "Description", with: @financial.description
    fill_in "Period", with: @financial.period
    fill_in "Price", with: @financial.price
    click_on "Update Financial"

    assert_text "Financial was successfully updated"
    click_on "Back"
  end

  test "should destroy Financial" do
    visit financial_url(@financial)
    accept_confirm { click_on "Destroy this financial", match: :first }

    assert_text "Financial was successfully destroyed"
  end
end
