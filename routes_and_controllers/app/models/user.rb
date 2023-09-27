class User < ApplicationRecord
    validates :name, :email, uniqueness: true, presence: true
end