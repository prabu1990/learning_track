require File.dirname(__FILE__) + "/Facebbok.rb"

class SignUp
	describe " Should enter SignUp fields" do

		before(:all) do
		  @instance = Facebook.new
		  @instance.input_yml
		  @instance.browser_setup
		  @instance.get_url
		end

		after(:all) do
       	  @instance.close_browser
        end

		it " should enter details for signup" do
			@instance.firstname
		end


		it " should enter details for signup" do
			@instance.lastname
		end


		it " should enter details for signup" do
			@instance.email_signup
		end


		it " should enter details for signup" do
			@instance.reemail_signup
		end


		it " should enter details for signup" do
			@instance.password_signup
		end

		it "should include birthday text" do
			@birthday = @instance.birthday_text.text
			@birthday.should eq("Birthday")
		end

		it "should select month" do
			@instance.dob("month", 5)
		end

		it "should select day" do
			@instance.dob("day", 6)
		end

		it "should select year" do
			@instance.dob("year", 7)
		end

		it "should give dob text" do
			@instance.dob_text.click
			@instance.click_okay
		end
		it "should select gender" do
			@instance.select_gender.click
		end

		it "should click sign up" do
			@instance.signup_button.click
		end

	end
	
end