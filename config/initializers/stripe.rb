Rails.configuration.stripe = {
  :publishable_key => ENV['pk_test_sumM2XGii4J2bHkbegO3p2Vg'],
  :secret_key      => ENV['sk_test_QK74QgtJV712dOkePnAST9Z3']
}

Stripe.api_key = Rails.configuration.stripe[:secret_key]
