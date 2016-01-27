class Contact < ActiveRecord::Base

  EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i

  validates :name, presence: true
  validates :email, presence: true, format: {with: EMAIL_REGEX}
  validates :body, presence: true

  after_create :send_contact

  def send_contact
    ContactMailer.contacts_mail(self).deliver_now
  end

  
end
