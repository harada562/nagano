class Order < ApplicationRecord

	belongs_to :customer
	has_many :order_details, dependent: :destroy

	enum total_payment: {
		credit_card: 0,
		Bank: 1
	}

	enum status: {
		waiting_for_payment: 0,
		payment_check: 1,
		in_puroduction: 2,
		preparation_for_shipment: 3,
		completed_shipping: 4,
	}

end
