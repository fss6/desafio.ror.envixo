class Admin::Comment < ApplicationRecord
  scope :unchecked, -> { where(verified: false).order(created_at: :asc) }
  belongs_to :user
  belongs_to :commentable, polymorphic: true

  def locale_human
    I18n.t(:language, locale: self[:locale])
  end

  def commentable_translate_by_class_name
    commentable_class_name = commentable.class.name.split('::').last.downcase rescue nil
    I18n.t("activerecord.models.#{commentable_class_name}.one") rescue ''
  end
end
