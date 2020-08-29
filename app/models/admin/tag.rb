class Admin::Tag < ApplicationRecord
  scope :by_locale, -> (locale) { where(locale: locale).order(:name) }
  before_destroy :clear_associations

  belongs_to :user
  has_and_belongs_to_many :videos,
                          class_name: 'Admin::Video', 
                          foreign_key: :admin_tag_id, 
                          association_foreign_key: :admin_video_id
  has_and_belongs_to_many :news,
                          class_name: 'Admin::News', 
                          foreign_key: :admin_tag_id, 
                          association_foreign_key: :admin_news_id

  validates :name, :locale, presence: true
  validates :name, uniqueness: { 
                        scope: :locale, 
                        case_sensitive: false  
                      }

  def clear_associations
    videos.clear
    news.clear
  end

  def locale_human
    I18n.t(:language, locale: self[:locale])
  end
end
