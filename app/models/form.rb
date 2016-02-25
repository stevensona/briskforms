class Form < ActiveRecord::Base
  validates :email, presence: true
  validates :url, presence: true
  validates :success_url, presence: true
  validates :admin_url, presence: true
  validates :confirm_url, presence: true
end
