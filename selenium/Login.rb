require File.dirname(__FILE__) + "/Facebbok.rb"

class Email
	describe " Should open browser" do

		before(:all) do
		  @instance = Facebook.new
		  @instance.input_yml
		end

      it " should include fields change" do
    	@instance.browser_setup
    	@instance.get_url
    	@instance.email
    	@instance.password
    	@instance.login.click
      @instance.profile_page.click
      # @instance.mouse_hover_more
      # @instance.click_more_places.click
      # @instance.post_status
      # @instance.post_button.click
      # @instance.settings.click
      # @instance.click_logout.click
       end

       after(:all) do
       		@instance.close_browser  
       end
	end
end