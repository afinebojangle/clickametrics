require 'rails_helper'

RSpec.describe Website, :type => :model do
  
  it "has a url" do
    website = Website.new url: 'something'
    expect(website.url).to eql 'something'
  end

  it "requires a url" do
    website = Website.new
    expect(website.valid?).to_not eql true
  end

  describe "requires url format" do
    it "no stupid character" do
      website = Website.new url: "1#{$rasdfadsftwe4534}"
      expect(website.valid?).to_not eql true
    end
    it "like google" do
      website = Website.new url: "http://www.google.com"
      expect(website.valid?).to eql true
    end
  end

end
