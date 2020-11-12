require 'watir'
require 'rspec'
require 'pry'
require 'rubygems'
require 'selenium-webdriver'
require 'rspec/expectations'

module XclaimClaimsPage
    include RSpec::Matchers
    include Selenium

  #### VARIABLES ####
	$priceBidAmount = "75"
	$biddingEntityOption = "QA Engineer - QA"
	$contractOption = "XClaim Default Contract"
	$bidConfirmationMessage = "We have notified the claim holder of your bid, and we will email you when we hear back."

	#### METHODS / LOCATORS ####
	def claims_pg_continue_button
		@browser.button(class: 'css-9g2h1a')
	end

	def claims_pg_retract_bid_button
		@browser.button(data_label: 'retract-bid-button')
	end

	def claims_pg_confirmation_message
		@browser.element(css: '.css-l3rx45 > div:nth-child(2) > p:nth-child(1)')
	end

	def claims_pg_place_bid_button
		@browser.button(class: 'css-9x6qun')
	end

	def claims_pg_contract_select
		@browser.div(text: 'Choose contract...')
	end

	def claims_pg_bidding_entity_select
		@browser.div(text: 'Choose entity...')
	end

	def claims_pg_price_bid_field
		@browser.text_field(id: 'bid-price')
	end

	#### VERIFIERS ####
	def verify_claims_pg_bid_placed_text
		sleep(2)
		if (expect(claims_pg_confirmation_message.text).to eq($bidConfirmationMessage)) == true
			claims_pg_confirmation_message.flash(color: ["blue"])
			puts "Bid Placed Message Verified"
		else
			expect { raise StandardError, "Bid Placed Message NOT Verified: Step FAILED"}.to raise_error('PLEASE VERIFY: Bid Placed Message NOT Verified')
		end
	end

	def verify_claims_page_url
		sleep(2)
		current_url = @browser.url
		if (current_url.include? "https://staging.x-claim.com/claims/")
			puts "Claims Page Url IS A Match"
		else
			expect { raise StandardError, "Claims Page Url NOT A Match: Step FAILED"}.to raise_error('PLEASE VERIFY: Claims Page Url NOT A Match')
		end
	end
end
