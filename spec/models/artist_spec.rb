require 'spec_helper'

describe Artist do
  it { should have_many(:songs) }  
  it { should validate_presence_of(:name) }
  it { should validate_presence_of(:photo_url) }
end