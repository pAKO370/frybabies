class ContactMailer < ApplicationMailer
  default from: 'frybabiescontacts@gmail.com'

  def contacts_mail(contact)
    @contact = contact
  
    mail(to: "frybabiescontacts@gmail.com", subject: "Frybabies Contact")
  end


end