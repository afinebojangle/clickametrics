require 'uri'

class Website < ActiveRecord::Base

  validates :url, presence: true
  validates :url, format: { with: URI::regexp(%w(http https)) }

end
