class Contact < ApplicationRecord
  attr_accessor :name, :email, :content

    validates :first_name, presence: true, length: { maximum: 20 }
    validates :last_name, presence: true, length: { maximum: 20 }
    VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
    validates :email, presence: true, length: { maximum: 30 },
                      format: { with: VALID_EMAIL_REGEX }
    validates :message, presence: true, length: { maximum: 500 }

end
