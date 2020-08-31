class User < ApplicationRecord
  extend Devise::Models
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :friends, -> { where(accept: true).order(id: :asc) },
                        class_name: 'Admin::Friend', 
                        foreign_key: :user_id
  has_many :wating_friends, -> { where(accept: false).order(created_at: :asc) },
                        class_name: 'Admin::Friend', 
                        foreign_key: :friend_id
  has_many :to_accept_friends, -> { where(accept: false).order(created_at: :asc) },
                        class_name: 'Admin::Friend', 
                        foreign_key: :user_id


  validates :name, presence: true
  
  def has_not_invitation_friend?(friend)
    Admin::Friend.where(user_id: id).where(friend_id: friend.id).empty? && 
      Admin::Friend.where(user_id: friend.id).where(friend_id: id).empty?
  end

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
