# spec/requests/api/v1/links_spec.rb
require "rails_helper"

RSpec.describe "GET /api/v1/links" do
 it "returns a list of all links, hottest first" do
  coldest_link = create(:link) 
  hottest_link = create(:link, upvotes: 2)
  
  get "/api/v1/links" 
  expect(json_body.count).to eq(2)
  hottest_link_json = json_body[0] 
  expect(hottest_link_json).to eq({
   "id" => hottest_link.id, 
   "title" => hottest_link.title,
   "url" => hottest_link.url,
   "upvotes" => hottest_link.upvotes, 
   "downvotes" => hottest_link.downvotes,
    "created_at" => hottest_link.created_at.as_json,
    "updated_at" => hottest_link.updated_at.as_json
  })
 end 
end
