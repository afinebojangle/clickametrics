require 'uri'

class Website < ActiveRecord::Base

  validates :url, presence: true, uniqueness:true, format: { with: URI::regexp(%w(http https)) }

  belongs_to :user
  has_many :events, dependent: :destroy

end
