class Admin::News < ApplicationRecord
  belongs_to :user
  has_and_belongs_to_many :tags, 
                          class_name: 'Admin::Tag', 
                          foreign_key: :admin_news_id, 
                          association_foreign_key: :admin_tag_id
  accepts_nested_attributes_for :tags, reject_if: proc { |id| id.blank? }

  validates :title, :subtitle, :content, presence: true
end
