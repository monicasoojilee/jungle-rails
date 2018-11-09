class UserMailer < ApplicationMailer
    def order_receipt(order)
        mail(to: @order, subject: "Order Receipt ###")
    end
end
