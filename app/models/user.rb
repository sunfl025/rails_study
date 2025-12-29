class User < ApplicationRecord
   enum role: { user: 0, admin: 1 }
   validates :email, presence: true
   validates :username, presence: true, uniqueness: true
    before_validation :set_default_sex
    has_many :projects

  private
  def set_default_sex
    self.sex = false if sex.nil?
  end
end
