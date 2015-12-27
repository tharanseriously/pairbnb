Braintree::Configuration.environment = Rails.env.production? ? :production : :sandbox
Braintree::Configuration.merchant_id = ENV["bt_merchant_id"]
Braintree::Configuration.public_key = ENV["bt_public_key"]
Braintree::Configuration.private_key = ENV["bt_private_key"]