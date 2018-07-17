require 'spec_helper'

describe 'Testing the BBC Registration' do

  context 'initial user journey signing up' do

    xit "should take us through the correct registration process with valid details" do
      @bbc_site = BBC_Site.new
      @bbc_site.get_temp_email.visit_minute_inbox
      # @bbc_site.get_temp_email.refresh_email
      email = @bbc_site.get_temp_email.get_email
      # start registration process
      @bbc_site.bbc_homepage.visit_home_page
      @bbc_site.bbc_homepage.click_sign_in_link
      @bbc_site.bbc_homepage.click_go_to_register
      @bbc_site.bbc_registration.click_13_or_over
      @bbc_site.bbc_registration.fill_in_dob
      @bbc_site.bbc_registration.click_dob_button
      # pass in the stored email into method
      @bbc_site.bbc_registration.fill_in_email(email)
      @bbc_site.bbc_registration.fill_in_password
      @bbc_site.bbc_registration.fill_in_postcode
      @bbc_site.bbc_registration.select_gender
      @bbc_site.bbc_registration.click_no_thanks
      @bbc_site.bbc_registration.click_register
      expect(@bbc_site.bbc_registration.confirm_register)
    end

  end
end
