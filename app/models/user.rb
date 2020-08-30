class User < ApplicationRecord
  extend Devise::Models
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  enum locale: { pt: 0, es: 1 }

  def rated?(scoreable)
    Admin::Score.where(user_id: id)
      .where(scoreable_id: scoreable.id)
      .where(scoreable_type: scoreable.class.name)
      .present?
  end

  def active_for_authentication?
    super && !deactivated
  end
end
