class Event < ActiveRecord::Base
  validates :name, presence: :true
  belongs_to :website
end
