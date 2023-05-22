require 'rails_helper'

RSpec.describe LinksHelper, type: :helper do
  describe "#formatted_score_for" do
    it "returns a formatted score for a link" do
      link = build_stubbed(:link, upvotes: 5, downvotes: 3)
      expect(helper.formatted_score_for(link)).to eq("2 (+5, -3)")
    end
  end
end
