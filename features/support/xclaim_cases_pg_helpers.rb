require 'watir'
require 'rspec'
require 'pry'
require 'rubygems'
require 'selenium-webdriver'
require 'rspec/expectations'

module XclaimCasesPage
    include RSpec::Matchers
    include Selenium

  #### VARIABLES ####

	#### METHODS / LOCATORS ####
	def cases_pg_amount_more_than_zero
		@browser.div(class: 'rt-td').wait_until(&:present?)
		@row1 = @browser.div(class: 'rt-tr -odd', index: 0).div(class: 'rt-td', index: 5).text
		@row2 = @browser.div(class: 'rt-tr -even', index: 0).div(class: 'rt-td', index: 5).text
		@row3 = @browser.div(class: 'rt-tr -odd', index: 1).div(class: 'rt-td', index: 5).text
		@row4 = @browser.div(class: 'rt-tr -even', index: 1).div(class: 'rt-td', index: 5).text
		@row5 = @browser.div(class: 'rt-tr -odd', index: 2).div(class: 'rt-td', index: 5).text

		@row1a = @row1.gsub!(/[$]/,'')
		@row2a = @row2.gsub!(/[$]/,'')
		@row3a = @row3.gsub!(/[$]/,'')
		@row4a = @row4.gsub!(/[$]/,'')
		@row5a = @row5.gsub!(/[$]/,'')

		puts @row1a.to_i
		puts @row2a.to_i
		puts @row3a.to_i
		puts @row4a.to_i
		puts @row5a.to_i

		if (@row1a.to_i) >= 1
			puts "Yes you can use the first number"
			@browser.div(class: 'rt-tr -odd', index: 0).div(class: 'rt-td', index: 5).flash(color: ["green"]).click
		elsif (@row2a.to_i) >= 1
			puts "Yes you can use the second number"
			@browser.div(class: 'rt-tr -even', index: 0).div(class: 'rt-td', index: 5).flash(color: ["blue"]).click
		elsif (@row3a.to_i) >= 1
			puts "Yes you can use the third number"
			@browser.div(class: 'rt-tr -even', index: 0).div(class: 'rt-td', index: 5).flash(color: ["green"]).click
		elsif (@row4a.to_i) >= 1
			puts "Yes you can use the fourth number"
			@browser.div(class: 'rt-tr -even', index: 0).div(class: 'rt-td', index: 5).flash(color: ["blue"]).click
		elsif (@row5a.to_i) >= 1
			puts "Yes you can use the fifth number"
			@browser.div(class: 'rt-tr -even', index: 0).div(class: 'rt-td', index: 5).flash(color: ["green"]).click
		else
			puts "No Amounts over 1.00"
		end
	end

	def cases_pg_first_debtor_checkbox
		@browser.checkbox(name: '4 West Holdings, Inc.')
	end

	def cases_pg_table_row(index)
		@browser.div(class: 'rt-table').div(class: 'rt-tbody').div(class: 'rt-tr-group').span(index: index)
	end

	def cases_pg_logo
		@browser.img(src: '/static/media/logo-white.3f2f7439.png')
	end

	#### VERIFIERS ####
	def verify_cases_page_url
		sleep(2)
		current_url = @browser.url
		if (expect(current_url).to eql("https://staging.x-claim.com/cases?page=1&pageSize=20"))
			puts "Cases Page Url IS A Match"
		else
			expect { raise StandardError, "Cases Page Url NOT A Match: Step FAILED"}.to raise_error('PLEASE VERIFY: Cases Page Url NOT A Match')
		end
	end

	def verify_xclaim_logo_is_dispalyed
		if (cases_pg_logo.present?) == true
      cases_pg_logo.flash(color: ["green"])
      puts "#{true}: Xclaim logo IS displayed"
		else
	    expect { raise StandardError, "Xclaim logo NOT displayed: Step FAILED"}.to raise_error('PLEASE VERIFY: Xclaim logo NOT displayed')
		end
	end
end
