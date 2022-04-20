class Order < ApplicationRecord
    belongs_to :user
    has_many :items
    belongs_to :address, optional: true

    enum payment_type: ["cash_on_delivery", "online_payment"]

    def calculate_item_total!
        total = 0
        self.items.each do |item|
            total += item.quantity * item.unit_price
        end
        self.item_total = total
        self.save
    end
end
