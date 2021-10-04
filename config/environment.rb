# Load the Rails application.
require_relative "application"

# Initialize the Rails application.
Rails.application.initialize!

ActionMailer::Base.smtp_settings = {
  :user_name => 'kthaker17@gmail.com', # This is the string literal 'apikey', NOT the ID of your API key
  :password => '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', # This is the secret sendgrid API key which was issued during API key creation
  :domain => 'heroku.com',
  :address => 'smtp.sendgrid.net',
  :port => 587,
  :authentication => :plain,
  :enable_starttls_auto => true
}