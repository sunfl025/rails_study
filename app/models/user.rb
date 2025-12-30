class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
 devise :database_authenticatable,
         :registerable,
         :recoverable,
         :rememberable,
         :validatable,
         :trackable,
         :confirmable
        #  :lockable

   enum role: { user: 0, admin: 1 }

   validates :email, presence: true
   validates :username, presence: true, allow_blank: true

    before_validation :set_default_sex
    has_many :projects

  private
  def set_default_sex
    self.sex = false if sex.nil?
  end
end
