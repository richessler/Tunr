require 'spec_helper'

describe "an admin can manage songs" do
  let!(:beyonce) { Artist.create(name: "Beyonce", genre: "Pop", photo_url: "http://www.tickpick.com/DesktopModules/SearchResults/img/performers/beyonce.jpg")}
  let!(:halo) { Song.create( title: "Halo", year: 2009, artist: beyonce)}

  it "can create a new song" do
    visit new_artist_song_path(beyonce)
    fill_in "song_title", with: "Single Ladies"
    fill_in "song_year", with: "2008"
    click_button("submit")
    expect(page).to have_content "Single Ladies"
  end

  it "can view an existing song" do
    visit artist_path(beyonce)
    expect(page).to have_content "Halo"
  end

  it "can update a song" do
    visit edit_song_path(halo)
    fill_in "song_title", with: "Crazy in Love"
    click_button("submit")
    expect(page).to have_content "Crazy in Love"
    expect(page).to_not have_content "Halo"
  end

  it "can destroy a song" do
    visit artist_path(beyonce)
    click_button("delete-song-#{halo.id}")
    expect(page).to_not have_content("Halo")
  end


end

