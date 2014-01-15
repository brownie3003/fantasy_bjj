class User < ActiveRecord::Base
    has_one :team
    before_save { self.email = email.downcase }
    before_create :create_remember_token
    VALID_USERNAME_REGEX = /\A[a-zA-Z0-9_]*[a-zA-Z][a-zA-Z0-9_]*\z/
    validates :name, presence: true, format: { with: VALID_USERNAME_REGEX }, length: { maximum: 30 }, uniqueness: true
    VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
    validates :email, presence: true, format: { with: VALID_EMAIL_REGEX }, uniqueness: { case_sensitive: false}
    has_secure_password
    validates :password, length: { minimum: 6 }

    def User.new_remember_token
        SecureRandom.urlsafe_base64
    end

    def User.encrypt(token)
        Digest::SHA1.hexdigest(token.to_s)
    end

    private

        def create_remember_token
            self.remember_token = User.encrypt(User.new_remember_token)
        end
end
