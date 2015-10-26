if Rails.env.production?
  Rails.configuration.stripe = {
    :publishable_key => ENV['STRIPE_PUBLISHABLE_KEY'],
    :secret_key => ENV['STRIPE_SECRET_KEY']
  }
else
  Rails.configuration.stripe = {
    :publishable_key => 'pk_test_6LIXzgbyFSsp48fQxqfOtUxm',
    :secret_key => 'sk_test_gbYWBNDE31N1sxVJSLUrzrto'
  }
end

Stripe.api_key = Rails.configuration.stripe[:secret_key]