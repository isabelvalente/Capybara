require 'capybara/dsl'

class BBC_Registration
  include Capybara::DSL

  #Constants
  DOB_DAY = '#day_input'
  DOB_MONTH = '#month_input'
  DOB_YEAR = '#year_input'
  CONFIRM_BDAY_LINK = '#submit-button'
  REGISTRATION_SUBMIT = '#submit-button'
  CONFIRMED = 'Thanks. You\'re now signed in.'

  def click_13_or_over
    click_link('13 or over')
    sleep 2
  end

  def fill_in_dob
    fill_in('Day', with: '19')
    sleep 1
    fill_in('Month', with: '4')
    sleep 1
    fill_in('Year', with: '1994')
    sleep 2

  end

  def click_dob_button
    click_button 'Continue'
    sleep 1
  end

  def fill_in_email
    fill_in('Email', with: 'rayan.zayed@lm0k.com')
    sleep 2
  end

  def fill_in_password
    fill_in('Password', with: 'Acad3my1')
    sleep 2
  end

  def fill_in_postcode
    fill_in('Postcode', with: 'SE85EQ')
    sleep 1
  end

  def select_gender
    select 'Other', from: 'Gender'
    sleep 1
  end

  def click_dob_button
    find(CONFIRM_BDAY_LINK).click
    sleep 2
  end

  def click_no_thanks
    all('.button__text-wrapper')[1].click
    sleep 1
  end

  def click_register
    find(REGISTRATION_SUBMIT).click
    sleep 2
  end

  def confirm_register
    visit('https://account.bbc.com/register/thanks?context=homepage&isCasso=false&marketingOptIn=off&nonce=PQx1FEib-uAVLZbh82_gyHH9AnfQvNS9-IEE&ptrt=https%3A%2F%2Fwww.bbc.co.uk%2F&userOrigin=homepage')
  end
end
