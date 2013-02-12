Piggybak.config do |config|
  # Config attr_accessors are:
  # shipping_calculators
  # payment_calculators
  # tax_calculators
  # default_country
  # activemerchant_test mode

  # Override the activemerchant billing mode
  config.activemerchant_mode = :test
end
