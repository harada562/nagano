class Order < ApplicationRecord


	belongs_to :customer
	# has_many :order_details, dependent: :destroy
	has_many :cart_items, dependent: :destroy
	
	# 注文を新規保存・更新するため
	has_many :order_details, dependent: :destroy
	accepts_nested_attributes_for :order_details

	enum payment_method: { クレジットカード:0, 銀行:1 }

	enum status: {
		入金待ち:0,
		入金確認:1,
		制作中:2,
		発送準備中:3,
		発送済み:4
	}

# enum is_active: { 販売停止中:0, 販売中:1 }


end
