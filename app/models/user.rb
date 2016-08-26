class User < ActiveRecord::Base
  has_secure_password

  has_many :rides
  has_many :attractions, through: :rides

  validates :password_digest, presence: true

  def mood
    if self.user.nausea && self.user.happiness
      if self.nausea > self.happiness
        "sad"
      else
        "happy"
    end
  end
  end

end
