require 'capybara/dsl'

class TempMail
  include Capybara::DSL

  HOMEPAGE_URL = 'https://www.minuteinbox.com/'
  EMAIL_TAG = '#email'

  def visit_minute_inbox
    visit(HOMEPAGE_URL)
    sleep 3
  end

  def get_email
    find(EMAIL_TAG).text
  end
end
