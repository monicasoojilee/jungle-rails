class UserMailer < ApplicationMailer
    def order_receipt(order)
        @order = order
        mail(to: @order.email, subject: "Order Receipt #{@order.id}")
    end
end
