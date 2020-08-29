class Admin::Video < ApplicationRecord
  belongs_to :user
  has_and_belongs_to_many :tags, 
                          class_name: 'Admin::Tag', 
                          foreign_key: :admin_video_id, 
                          association_foreign_key: :admin_tag_id
  accepts_nested_attributes_for :tags, reject_if: proc { |id| id.blank? }

  validates :title, :url, presence: true
  validate :url_valid

  private
    def url_valid
      if self.url.present?
        url = URI.parse(self.url) rescue false
        unless url.kind_of?(URI::HTTP) || url.kind_of?(URI::HTTPS)
          errors.add(:url, I18n.t('errors.messages.url_invalid'))
        end
      end
    end 
end
