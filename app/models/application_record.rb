class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true
  default_scope { order(created_at: :desc) }
  
  def created_at_human
    self[:created_at].strftime('%d/%m/%Y %H:%m:%S') rescue nil
  end
end
