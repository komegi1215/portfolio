class ContactMailer < ApplicationMailer

  # default from: 'noreply@example.com'
  # default to: 'admin@example.com'
  # layout 'mailer'

  def send_mail(contact)
    @contact = contact
    mail to: @contact.email, bcc: ENV['MAIL_ADDRESS'], subject: "Thank you for your inquiry!"
  end

  # def contact
  #   contact = Contact.new(title: "Test", first_name: "太郎", last_name: "侍", email: "test@gmail.com", message: "問い合わせメッセージ")

  #   ContactMailer.send_mail(contact)
  # end

end
