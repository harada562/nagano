class OrderDitail < ApplicationRecord
	belongs_to :order
	belongs_to :item

	enum making_status: {
		not_available: 0,
		awaiting_production: 1,
		in_puroduction: 2,
		production_completed: 3,
	}
end
