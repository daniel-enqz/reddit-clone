# spec/views/links/_link.html.erb_spec.rb
require "rails_helper"

RSpec.describe "links/_link.html.erb" do 
 context "if the url is an image" do
   it "renders the image inline" do
    link = build(:link, url: "http://example.com/image.jpg")
    render partial: "links/link", locals: { link: link }
    expect(rendered).to have_selector "img[src='#{link.url}']" 
   end
 end 
end


RSpec.describe "links/show.html.erb" do 
 context "if the url is an image" do 
  it "renders the image inline" do
   link = build(:link, url: "http://example.com/image.jpg") 
   assign(:link, link) # assigns the value of the variable link to the instance variable @link in our rendered view.
   
   render # magically infers the vire to render from the describe
   
   expect(rendered).to have_selector "img[src='#{link.url}']" 
  end
 end 
end
