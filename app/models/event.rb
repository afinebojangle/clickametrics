class Event < ActiveRecord::Base
  validates :name, presence: :true
  belongs_to :website

  def name_in_caps
    name.upcase
  end

  # @site.events.where(name: "home").data_for_chart
  def self.data_for_chart
    data = {}
    groups = all.group_by {|event| event.created_at.to_date }
    groups.each {|date, events| data[date] = events.count }
    data
  end
end

