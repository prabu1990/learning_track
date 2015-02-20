require "selenium-webdriver"
require 'yaml'

class Facebook
	def browser_setup
		@Fbrowser = Selenium::WebDriver.for @browser
		@timeout = Selenium::WebDriver::Wait.new(:timeout => 30)
		@Fbrowser.manage.window.maximize
	end
	def get_url
		@timeout.until{@Fbrowser.get @url}
	end
	def email
		@timeout.until{@Fbrowser.find_element(:xpath, "//input[@id='email']")}.send_keys @email
	end
	def password
		@timeout.until{@Fbrowser.find_element(:xpath, "//input[@id='pass']")}.send_keys @pwd
	end
	def login
		@timeout.until{@Fbrowser.find_element(:xpath, "//input[@id='u_0_n']")}
    end
	def firstname
		@timeout.until{@Fbrowser.find_element(:xpath,"//input[@id='u_0_1']")}.send_keys @firstname
    end
    def lastname
		@timeout.until{@Fbrowser.find_element(:xpath,"//input[@id='u_0_3']")}.send_keys @lastname
	end
	def email_signup
		@timeout.until{@Fbrowser.find_element(:xpath,"//input[@id='u_0_5']")}.send_keys @email_signup
	end	
	def reemail_signup
		@timeout.until{@Fbrowser.find_element(:xpath,"//input[@id='u_0_8']")}.send_keys @email_signup
	end	
	def password_signup
        @timeout.until{@Fbrowser.find_element(:xpath,"//input[@id='u_0_a']")}.send_keys @pwd_signup
	end
	def birthday_text
		@timeout.until{@Fbrowser.find_element(:xpath,"//*[@id='u_0_b']/div[1]")}
	end
	def dob(a,b)
        @timeout.until{@month = @Fbrowser.find_element(:xpath,"//*[@id='#{a}']")}
        @timeout.until{@day = Selenium::WebDriver::Support::Select.new(@month)}
        @timeout.until{@day.select_by(:index, b)}
    end
    def dob_text
    	@timeout.until{@Fbrowser.find_element(:xpath, "//div[@class='_5k_5']/a[@href='#']")}
    end
    def click_okay
    	@timeout.until{@Fbrowser.find_element(:xpath, "//*[contains(text(), 'Okay')]")}
    end
    def select_gender
    	@timeout.until{@Fbrowser.find_element(:xpath, ".//*[@id='u_0_e']")}
    end
    def signup_button
    	@timeout.until{@Fbrowser.find_element(:xpath, ".//*[@id='u_0_i']")}
    end
    def settings
    	@timeout.until{@Fbrowser.find_element(:xpath, ".//*[@id='pageLoginAnchor']")}
    end
    def click_logout
    	@timeout.until{@Fbrowser.find_element(:xpath, ".//*[contains(text(), 'Log Out')]")}
    end
    def profile_page
    	@timeout.until{@Fbrowser.find_element(:xpath, "//a[@class='_2dpe _1ayn']/span[contains(text(), 'Prabu')]")}
    end
    def post_status
    	@timeout.until{@Fbrowser.find_element(:xpath, "//*[@id='u_jsonp_2_x']")}.send_keys @post
    end
    def post_button
    	@timeout.until{@Fbrowser.find_element(:xpath, "//*[@class='_42ft _4jy0 _11b _4jy3 _4jy1 selected _51sy']")}
    end
    # def find_friend
    # 	@timeout.until{@Fbrowser.find_element(:xpath, )}
    # end
    def mouse_hover_more
    	@move_to_more = @timeout.until{@Fbrowser.find_element(:xpath, "//*[@class='_9ry _p']")}
    	@timeout.until{@Fbrowser.action.move_to(@move_to_more).perform}
    end
    def click_more_places
    	@timeout.until{@Fbrowser.find_element(:xpath,"//*[@class= '_54nh']")}
    end
    def input_yml
      @input_hash = YAML.load_file(File.dirname(__FILE__) + '/input.yml')
	  @browser = @input_hash["browser"]
      @url = @input_hash["url"]
	  @email = @input_hash["email"]
      @pwd = @input_hash["pwd"]
      @firstname = @input_hash["firstname"]
      @lastname = @input_hash["lastname"]
      @email_signup = @input_hash["email_signup"]
      @pwd_signup = @input_hash["pwd_signup"]
      @post = @input_hash["post"]
    end

	def close_browser
		@Fbrowser.close
	end
end