require "spec_helper"

describe "an admin can manage artists" do
  let!(:beyonce) { Artist.create(:name => "Beyonce", :genre => "Pop", :photo_url => "http://www.tickpick.com/DesktopModules/SearchResults/img/performers/beyonce.jpg")}
  
  it "can create a new artist" do
    visit new_artist_path
    fill_in "artist_name", with: "Kesha"
    fill_in "artist_genre", with: "garbage"
    fill_in "artist_photo_url", with: "http://www.mardecortesbaja.com/wordpress/wp-content/uploads/bald-clown-cap-64403.jpg"
    click_button("submit")
    expect(page).to have_content "Kesha"
  end

  it "can view an existing artist" do
    visit artist_path(beyonce)
    expect(page).to have_content "Beyonce"
  end

  it "can update an artist" do
    visit edit_artist_path(beyonce)
    save_and_open_page
    fill_in "artist_name", with: "Queen Bey"
    click_button("submit")
    expect(page).to have_content "Queen Bey"
  end

  it "can destroy an artist" do
    visit artist_path(beyonce)
    click_button("destroy")
    expect(page).to_not have_content("Beyonce")
  end

end