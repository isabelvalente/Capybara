require 'spec_helper'


describe 'Testing the BBC' do

  context 'testing login' do

    it 'should respond with success when we login with a valid email and password' do
      @bbc_site = BBC_Site.new
      @bbc_site.bbc_homepage.visit_home_page
      @bbc_site.bbc_homepage.click_sign_in_link
      @bbc_site.bbc_login.fill_email
      @bbc_site.bbc_login.fill_password
      @bbc_site.bbc_login.click_submit
      expect(@bbc_site.bbc_login.successful_login).to be true
    end

    # CLICKING PASSWORD BEFORE ENTERING EMAIL
    it "should respond with error message if email field is empty and password field is clicked" do
      @bbc_site = BBC_Site.new
      @bbc_site.bbc_homepage.visit_home_page
      @bbc_site.bbc_homepage.click_sign_in_link
      @bbc_site.bbc_login.click_email
      @bbc_site.bbc_login.click_password
      expect(@bbc_site.bbc_login.something_missing_error).to be true
    end

    # NOT ENTERING PASSWORD
    it "should respond with error message if password field is empty" do
      @bbc_site = BBC_Site.new
      @bbc_site.bbc_homepage.visit_home_page
      @bbc_site.bbc_homepage.click_sign_in_link
      @bbc_site.bbc_login.fill_email
      @bbc_site.bbc_login.click_submit
      expect(@bbc_site.bbc_login.something_missing_error).to be true
    end

    # NOT ENTERING EMAIL OR PASSWORD
    it "should respond with error message if email and password are empty" do
      @bbc_site = BBC_Site.new
      @bbc_site.bbc_homepage.visit_home_page
      @bbc_site.bbc_homepage.click_sign_in_link
      @bbc_site.bbc_login.click_submit
      expect(@bbc_site.bbc_login.something_missing_error).to be true
    end

    # EMAIL IS NOT REGISTERED
    it "should respond with error message if email is not registered" do
      @bbc_site = BBC_Site.new
      @bbc_site.bbc_homepage.visit_home_page
      @bbc_site.bbc_homepage.click_sign_in_link
      @bbc_site.bbc_login.fill_wrong_email
      @bbc_site.bbc_login.fill_password
      @bbc_site.bbc_login.click_submit
      expect(@bbc_site.bbc_login.wrong_email_error).to be true
    end

    # PASSWORD IS INCORRECT
    it "should respond with error message if password is incorrect" do
      @bbc_site = BBC_Site.new
      @bbc_site.bbc_homepage.visit_home_page
      @bbc_site.bbc_homepage.click_sign_in_link
      @bbc_site.bbc_login.fill_email
      @bbc_site.bbc_login.fill_wrong_password
      @bbc_site.bbc_login.click_submit
      expect(@bbc_site.bbc_login.wrong_password_error).to be true

    end

    # PASSWORD IS TOO SHORT
    it "should respond with error message if password is too short" do
      @bbc_site = BBC_Site.new
      @bbc_site.bbc_homepage.visit_home_page
      @bbc_site.bbc_homepage.click_sign_in_link
      @bbc_site.bbc_login.fill_email
      @bbc_site.bbc_login.fill_short_password
      @bbc_site.bbc_login.click_submit
      expect(@bbc_site.bbc_login.short_password_error).to be true
    end

    # WRONG CHARACTER IN USERNAME
    it "should respond with error message if username has a full stop" do
      @bbc_site = BBC_Site.new
      @bbc_site.bbc_homepage.visit_home_page
      @bbc_site.bbc_homepage.click_sign_in_link
      @bbc_site.bbc_login.fill_wrong_username
      @bbc_site.bbc_login.click_password
      expect(@bbc_site.bbc_login.wrong_user_error).to be true
    end

    # WRONG CHARACTER IN EMAIL
    it "should respond with error message if email has a wrong character" do
      @bbc_site = BBC_Site.new
      @bbc_site.bbc_homepage.visit_home_page
      @bbc_site.bbc_homepage.click_sign_in_link
      @bbc_site.bbc_login.fill_wrong_char_email
      @bbc_site.bbc_login.click_password
      expect(@bbc_site.bbc_login.wrong_char_error).to be true
    end


  end

end
