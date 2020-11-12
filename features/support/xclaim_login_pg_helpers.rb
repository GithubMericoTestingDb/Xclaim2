require 'watir'
require 'rspec'
require 'pry'
require 'rubygems'
require 'selenium-webdriver'
require 'rspec/expectations'

module XclaimLoginPage
    include RSpec::Matchers
    include Selenium

  #### VARIABLES ####
  $preLoginPassword = "asdf"
  $LoginPgEmail = "qa@x-claim.com"
  $LoginPgPassword = "password"

  #### METHODS / LOCATORS ####
  def pre_login_submit_button
    @browser.button(text: 'Submit')
  end

	def pre_login_password_field
		@browser.text_field(name: 'password')
	end

	def login_pg_email_field
		@browser.text_field(id: 'email')
	end

	def login_pg_password_field
		@browser.text_field(id: 'password')
	end

	def login_pg_signin_button
		@browser.button(class: 'css-9g2h1a')
	end

	#### VERIFIERS ####
	def verify_login_page_url
		current_url = @browser.url
		if (expect(current_url).to eql(::EnvironmentHelper.base_url))
			puts "Login Page Url IS A Match"
		else
			expect { raise StandardError, "Login Page Url NOT A Match: Step FAILED"}.to raise_error('PLEASE VERIFY: Login Page Url NOT A Match')
		end
	end
end
