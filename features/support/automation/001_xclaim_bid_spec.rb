=begin
  Feature: xclaim login into app and place a bid on a claim and verify success of bid

  Scenario 1: Place a bid on a claim and retract bid
    Given the user is on the cases page
      And the user Clicks on the first amount more than 1.00
      And the user Sets the text in the Price text field
      And the user Selects entity from Bidding Entity dropdown
			And the user Select Contact from Contact dropdown
      When the user Clicks the Place Bid button
      Then verify the Bid Placed confirmation message is displayed
      And the user can click on the Retract Bid button
      And the user can click on the Continue button in the are you sure modal
=end

require 'watir'
require 'rspec'
require 'pry'
require 'rubygems'
require 'selenium-webdriver'
require 'rspec/expectations'
require_relative '../xclaim_browser_helpers'
require_relative '../xclaim_login_pg_helpers'
require_relative '../xclaim_claims_pg_helpers'
require_relative '../xclaim_cases_pg_helpers'
require_relative '../send_keys_pg_helpers'

RSpec.configure do |c|
  c.include XclaimBrowsers
	c.include XclaimLoginPage
	c.include SendKeys
	c.include XclaimCasesPage
	c.include XclaimClaimsPage
end

<<<<<<< HEAD
RSpec.describe "001: Place a bid on a claim and retracts", xc_test_001: true do
=======
RSpec.describe "001: Place a bid on a claim and retract", xc_test_001: true do
>>>>>>> fed64ea5a9cb477546605a1c0aff7ee6466dc9b6

  begin
  before(:all) do
    puts "001_xclaim_place_a_bid_retract_test"
    launch_xclaim_browser
  end

	it "Verifies the xclaim login page URL" do
		verify_login_page_url
  end

	it "Sets the pre login page password" do
		pre_login_password_field.wait_until(&:present?)
		pre_login_password_field.flash(color: ["blue"]).set($preLoginPassword)
		pre_login_submit_button.flash(color: ["green"]).click
	end

	it "Sets credentials on login page" do
		login_pg_email_field.wait_until(&:present?)
		login_pg_email_field.flash(color: ["blue"]).set($LoginPgEmail)
		login_pg_password_field.flash(color: ["green"]).set($LoginPgPassword)
	end

	it "Clicks on the Sign In button" do
		login_pg_signin_button.flash(color: ["blue"]).click
		login_pg_signin_button.wait_while(&:present?)
	end

	it "Verifies the xclaim cases page URL" do
    verify_cases_page_url
  end

  it "Verifies Xclaim site logo on cases page" do
    cases_pg_logo.wait_until(&:present?)
		verify_xclaim_logo_is_dispalyed
  end

  it "Get data from row 1 in table" do
		#### First row data; we can get debtor name or petition date with this method
		puts "First row text: #{cases_pg_table_row(0).flash(color: ["blue"]).text}"
  end

	it "Clicks on the first row in table" do
		cases_pg_table_row(0).flash(color: ["blue"]).click
	end

	it "Sets the 4 West Holdings, Inc box" do
		cases_pg_first_debtor_checkbox.flash(color: ["green"]).click
	end

	it "Verifies the Claimes page url" do
    verify_claims_page_url
  end

  it "Clicks on the first amount more than 1.00" do
		cases_pg_amount_more_than_zero
  end

  it "Sets the text in the Price text field" do
    claims_pg_price_bid_field.flash(color: ["green"]).click
		claims_pg_price_bid_field.set($priceBidAmount)
  end

  it "Selects entity from Bidding Entity dropdown" do
    claims_pg_bidding_entity_select.flash(color: ["blue"]).click
		send_keys_set_text($biddingEntityOption)
		send_keys_tab
  end

  it "Select Contract from Contract dropdown" do
    claims_pg_contract_select.flash(color: ["green"]).click
		send_keys_set_text($contractOption)
		send_keys_tab
  end

  it "Click Place Bid button" do
    claims_pg_place_bid_button.flash(color: ["blue"]).click
		claims_pg_place_bid_button.wait_while(&:present?)
  end

	it "Verifies the Bid Placed confirmation message" do
		verify_claims_pg_bid_placed_text
	end

	it "Clicks on the Retract Bid button" do
		claims_pg_retract_bid_button.flash(color: ["green"]).click
	end

	it "Clicks on the Continue button in the are you sure modal" do
		claims_pg_continue_button.wait_until(&:present?)
		claims_pg_continue_button.flash(color: ["blue"]).click
		claims_pg_continue_button.wait_while(&:present?)
	end
  ensure
  after(:all) do
    close_browser
    puts "Browser Closed"
  end
  end
end
