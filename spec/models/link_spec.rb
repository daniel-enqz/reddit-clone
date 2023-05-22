require 'rails_helper'

RSpec.describe Link, type: :model do

  describe "validations" do
    it { is_expected.to validate_presence_of(:title) }
    it { is_expected.to validate_presence_of(:url) }
    it { is_expected.to validate_uniqueness_of(:url) }
  end

  describe '.hottest_first' do
    it "should return the links in the correct order" do
      link1 = create(:link, upvotes: 3, downvotes: 3, url: "http://www.yahoo.com")
      link2 = create(:link, upvotes: 8, downvotes: 2, url: "http://www.google.com")
      link3 = create(:link, upvotes: 5, downvotes: 3, url: "http://www.facebook.com")
      expect(Link.hottest_first).to eq([link2, link3, link1])
    end
  end

  describe '#upvote' do
    it "should increase the number of upvotes by one" do
      link = build(:link, upvotes: 1)
      link.upvote
      expect(link.score).to eq(2)
    end
  end

  describe '#score' do
    it "should return the correct score" do
      link = build(:link, upvotes: 5, downvotes: 2)
      expect(link.score).to eq(3)
    end
  end
end
