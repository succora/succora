class Pledge < ActiveRecord::Base
	belongs_to :project

	def purchase
    response = GATEWAY.purchase(price_in_cents, credit_card, purchase_options)
    transactions.create!(:action => "purchase", :amount => price_in_cents, :response => response)
    cart.update_attribute(:purchased_at, Time.now) if response.success?
    response.success?
  end
  
  def price_in_cents
    (cart.total_price*100).round
  end

  private
  
  def purchase_options
    {
      :ip => ip_address,
      :billing_address => {
        :name     => "Ryan Bates",
        :address1 => "123 Main St.",
        :city     => "New York",
        :state    => "NY",
        :country  => "US",
        :zip      => "10001"
      }
    }
  end


require 'paypal-sdk-adaptivepayments'
@api = PayPal::SDK::AdaptivePayments::API.new

# Build request object
@pay = @api.build_pay({
  :actionType => "PAY_PRIMARY",
  :cancelUrl => "https://paypal-sdk-samples.herokuapp.com/adaptive_payments/pay",
  :currencyCode => "AUD",
  :feesPayer => "PRIMARYRECEIVER",
  :ipnNotificationUrl => "https://paypal-sdk-samples.herokuapp.com/adaptive_payments/ipn_notify",
  :receiverList => {
    :receiver => [{
      :amount => 1.0,
      :email => "succoranetwork-facilitator@gmail.com",
      :primary => true,
      :paymentType => "SERVICE" }] },
  :senderEmail => "supporter@succora.org",
  :returnUrl => "https://svcs.sandbox.paypal.com/AdaptivePayments/Pay",
  :fundingConstraint => {
    :allowedFundingType => {
      :fundingTypeInfo => [{
        :fundingType => "BALANCE" }] } } })

# Make API call & get response
@pay_response = @api.pay(@pay)

# Access Response
if @pay_response.success?
  @pay_response.payKey
  @pay_response.paymentExecStatus
  @pay_response.payErrorList
  @pay_response.paymentInfoList
  @pay_response.sender
  @pay_response.defaultFundingPlan
  @pay_response.warningDataList
else
  @pay_response.error
end
end