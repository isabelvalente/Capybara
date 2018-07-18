require 'capybara'

class BBC_Login
  include Capybara::DSL

  USERNAME = 'username'
  DUMMY_EMAIL = 'claira.hellena@lm0k.com'
  PASSWORD_NAME = 'password'
  DUMMY_PASSWORD = 'Acad3my1'
  PASSWORD_FIELD = 'user-identifier-input'
  EMAIL_FIELD = 'password-input'
  WRONG_EMAIL = 'spartatest@gmail.com'
  WRONG_PASSWORD = 'test12345'
  SHORT_PASSWORD = 'test'
  WRONG_USERNAME = 'rayan.zayem0k'
  WRONG_CHAR_EMAIL = 'rayan.zayem0k@=html.com'


  def successful_login
    page.has_content?('Welcome to the BBC')
  end

  # FILL IN EMAIL/USERNAME FUNCTIONS
  def fill_email
    fill_in USERNAME, with: DUMMY_EMAIL
    sleep 1
  end

  def fill_wrong_email
    fill_in USERNAME, with: WRONG_EMAIL
    sleep 1
  end

  def fill_wrong_char_email
    fill_in USERNAME, with: WRONG_CHAR_EMAIL
    sleep 1
  end

  def fill_wrong_username
    fill_in USERNAME, with: WRONG_USERNAME
    sleep 1
  end

  # FILL IN PASSWORD FUNCTIONS
  def fill_password
    fill_in PASSWORD_NAME, with: DUMMY_PASSWORD
    sleep 1
  end

  def fill_wrong_password
    fill_in PASSWORD_NAME, with: WRONG_PASSWORD
    sleep 1
  end

  def fill_short_password
    fill_in PASSWORD_NAME, with: SHORT_PASSWORD
    sleep 1
  end

  # LOGIN FUNCTIONS
  # CLICK FUNCTIONS
  def click_submit
    click_button 'Sign in'
    sleep 1
  end

  def click_email
    find('#user-identifier-input').click
    sleep 2
  end

  def click_password
    find('#password-input').click
    sleep 1
  end

  # ERROR MESSAGES
  def wrong_email_error
    page.has_content?('Sorry, we can’t find an account with that email. You can ')
  end

  def wrong_password_error
    page.has_content?('Uh oh, that password doesn’t match that account. Please try again.')
  end

  def something_missing_error
    page.has_content?('Something\'s missing')
  end

  def short_password_error
    page.has_content?('password is too short')
  end

  def wrong_user_error
    page.has_content?('Usernames can only include...')
  end

  def wrong_char_error
    page.has_content?('Sorry, that email doesn’t look right.')
  end
end
