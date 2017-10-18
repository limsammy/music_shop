if Rails.env == "development"
  ActiveMerchant::Billing::FirstdataE4Gateway.wiredump_device = File.open(Rails.root.join("log","active_merchant.log"), "a+")
  ActiveMerchant::Billing::FirstdataE4Gateway.wiredump_device.sync = true
  ActiveMerchant::Billing::Base.mode = :test

  login = "PH2337-18"
  password="7uz4v9DEHNnHbJb8XFBpe7b6RDKDVXNl"
elsif Rails.env == "production"
  login = 'PH2337-18'
  password='7uz4v9DEHNnHbJb8XFBpe7b6RDKDVXNl'
end
GATEWAY = ActiveMerchant::Billing::FirstdataE4Gateway.new({
      login: login,
      password: password
})