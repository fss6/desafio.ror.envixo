class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true

  def created_at
    self[:created_at].strftime('%d/%m/%Y %H:%m:%S') rescue nil
  end
end
