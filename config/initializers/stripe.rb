


# The application makes use of your publishable and secret API keys
# to interact with Stripe. An initializer is a good place to set
# these values, which will be provided when the application is started.
#
# Add the following to config/initializers/stripe.rb:
#


Rails.configuration.stripe = {
  :publishable_key => ENV['PUBLISHABLE_KEY'],
  :secret_key      => ENV['SECRET_KEY']
}

Stripe.api_key = Rails.configuration.stripe[:secret_key]
