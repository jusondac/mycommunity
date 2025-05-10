require "application_system_test_case"

class FinancesTest < ApplicationSystemTestCase
  setup do
    @finance = finances(:one)
  end

  test "visiting the index" do
    visit finances_url
    assert_selector "h1", text: "Finances"
  end

  test "should create finance" do
    visit finances_url
    click_on "New finance"

    fill_in "Balance", with: @finance.balance
    fill_in "Community", with: @finance.community_id
    fill_in "Description", with: @finance.description
    fill_in "Period", with: @finance.period
    fill_in "Price", with: @finance.price
    click_on "Create Finance"

    assert_text "Finance was successfully created"
    click_on "Back"
  end

  test "should update Finance" do
    visit finance_url(@finance)
    click_on "Edit this finance", match: :first

    fill_in "Balance", with: @finance.balance
    fill_in "Community", with: @finance.community_id
    fill_in "Description", with: @finance.description
    fill_in "Period", with: @finance.period
    fill_in "Price", with: @finance.price
    click_on "Update Finance"

    assert_text "Finance was successfully updated"
    click_on "Back"
  end

  test "should destroy Finance" do
    visit finance_url(@finance)
    accept_confirm { click_on "Destroy this finance", match: :first }

    assert_text "Finance was successfully destroyed"
  end
end
