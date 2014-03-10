class OrderNofifier < ActionMailer::Base
  default from: 'Zack Fang <pasuya1234@hotmail.com>'
  ADMIN = 'pasuya1234@hotmail.com'

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.order_nofifier.received.subject
  #
  def received(order)
    @order = order
    mail to: order.email, subject: 'Book Orders Check'
  end

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.order_nofifier.shipped.subject
  #
  def shipped(order)
    @order = order
    mail to: order.email, subject: 'Book Orders Check'
  end

  def controller_name
    'OrderNofifier'
  end

  def send_applicatin_error(errors)
    @errors = errors
    mail to: ADMIN, subject: 'Application error raised' do |format|
      format.html
      format.text
    end
  end
end
