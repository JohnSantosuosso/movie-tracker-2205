require 'rails_helper'

RSpec.describe 'Studios Index Page' do
  it "visits the studios index page and sees see a each studio's name and location" do
    studio_1 = Studio.create(name: "Universal Studios", location: "Hollywood")
    studio_2 = Studio.create(name: "Warner Brothers", location: "Burbank")
    
    visit '/studios'

    within "#studio-#{studio_1.id}" do
      expect(page).to have_content("Universal Studios")
      expect(page).to have_content("Hollywood")
    end

    within "#studio-#{studio_2.id}" do
      expect(page).to have_content("Warner Brothers")
      expect(page).to have_content("Burbank")
    end
  end
end