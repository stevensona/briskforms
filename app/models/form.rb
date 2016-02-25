class Form < ActiveRecord::Base

  after_validation :add_url_scheme

  def add_url_scheme
    unless self.success_url[/\Ahttp:\/\//] || self.success_url[/\Ahttps:\/\//]
      self.success_url = "http://#{self.success_url}"
    end
  end

  validates :email, presence: true
  validates :url, presence: true
  validates :success_url, presence: true
  validates :admin_url, presence: true
  validates :confirm_url, presence: true
end
