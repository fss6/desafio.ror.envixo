class Admin::Comment < ApplicationRecord
  scope :unchecked, -> { where(verified: false).order(created_at: :asc) }
  belongs_to :user
  belongs_to :commentable, polymorphic: true

  def locale_human
    I18n.t(:language, locale: self[:locale])
  end
end
