# spec/requests/api/v1/links_spec.rb
require "rails_helper"

RSpec.describe "GET /api/v1/links" do
  xit "returns a list of all links, hottest first" do
    coldest_link = create(:link) 
    hottest_link = create(:link, upvotes: 2)

    get "/api/v1/links" 

    expect(json_body["links"].count).to eq(2)
    hottest_link_json = json_body["links"][0] 
    expect(hottest_link_json).to eq({
      "id" => hottest_link.id, "title" => hottest_link.title,
      "url" => hottest_link.url,
      "upvotes" => hottest_link.upvotes, 
      "downvotes" => hottest_link.downvotes,
    })
  end 
end

# spec/requests/api/v1/links_spec.rb
RSpec.describe "POST /api/v1/links" do 
  xit "creates the link" do
    link_params = attributes_for(:link) # This is a FactoryBot method that returns a hash like: { title: "Testing Rails", url: "http://testingrailsbook.com" }

    post "/api/v1/links", link: link_params

    expect(response.status).to eq 201
    expect(Link.last.title).to eq link_params[:title] 
  end

  context "when there are invalid attributes" do 
    xit "returns a 422, with errors" do
      link_params = attributes_for(:link, :invalid)
      post "/api/v1/links", link: link_params
      expect(response.status).to eq 422
      expect(json_body.fetch("errors")).not_to be_empty 
    end
  end 
end
