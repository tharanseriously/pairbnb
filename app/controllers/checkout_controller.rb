class CheckoutController < ApplicationController
	def new
		@reservation = Reservation.find(params[:reservation_id])
		@listing = Listing.find(@reservation.listing_id)
		@total_price = total_price(@reservation, @listing)
	end

	def create
		@reservation = Reservation.find(params[:reservation_id])
		@listing = Listing.find(@reservation.listing_id)
		@total_price = total_price(@reservation, @listing)

		if current_user.braintree_id?
			customer = Braintree::Customer.find(current_user.braintree_id)
		else
			result = Braintree::Customer.create(
				email: current_user.email,
				payment_method_nonce: params[:payment_method_nonce]
				)
			customer = result.customer
			current_user.update(braintree_id: customer.id)
		end

		result = Braintree::Transaction.sale(
		  :amount => @total_price.to_s,
		  :payment_method_token => customer.payment_methods.find{ |pm| pm.default?}.token,
		  :merchant_account_id => "defaultMerchantAccount",
		  :options => {
		    :submit_for_settlement => true
		  }
		)

		current_user.update(braintree_transaction_id: result.transaction.id)
		@reservation.update(paid?: true)

		redirect_to reservations_path, notice: "You successfully paid RM #{@total_price.to_s}"
	end

	private
	def total_price(reservation, listing)
		(reservation.total_days) * (listing.price).to_i
	end
end