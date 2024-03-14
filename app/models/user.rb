class User < ApplicationRecord
    has_secure_password
    has_one_attached:image
    has_many:books
    has_many:carts,dependent: :destroy
    validates :username,presence:true,uniqueness: { case_sensitive: false }
    validates :email,presence:true,uniqueness: { case_sensitive: false }
end