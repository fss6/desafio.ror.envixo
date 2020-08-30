class Admin::News < ApplicationRecord
  belongs_to :user
  has_and_belongs_to_many :tags, 
                          class_name: 'Admin::Tag', 
                          foreign_key: :admin_news_id, 
                          association_foreign_key: :admin_tag_id
  accepts_nested_attributes_for :tags, reject_if: proc { |id| id.blank? }
  has_many :comments, as: :commentable
  accepts_nested_attributes_for :comments, allow_destroy: true
  has_many :scores, as: :scoreable
  accepts_nested_attributes_for :scores, allow_destroy: true

  validates :title, :subtitle, :content, presence: true

  def verified_comments(locale)
    comments.where(verified: true, locale: locale).order(created_at: :asc) 
  end

  def points
    total_values = self.scores.sum(:value)
    total_evaluations = scores.count
    total_evaluations.zero? ? 0 : (total_values / total_evaluations.to_f).round
  end 
end