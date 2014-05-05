require 'rspec'
require_relative '../tracker'
require 'dotenv'

describe Tracker do
  before do
    Dotenv.load
    @tracker = Tracker.new(ENV['TRACKER'])
  end

  it 'displays my tracker projects' do
    expect(@tracker.projects).to eq [{"id"=>1072574, "name"=>"Listen To"}, {"id"=>1069174, "name"=>"Floral Violet: Team CRUD gschool"}, {"id"=>1060100, "name"=>"Bebe's User Authentication"}, {"id"=>1047312, "name"=>"URL 'Shortner'"}, {"id"=>1031130, "name"=>"students.gschool.it"}, {"id"=>966426, "name"=>"gSchoolMarch2014Curriculum"}, {"id"=>1037360, "name"=>"gSchoolScreenHeroRequests"}, {"id"=>1029384, "name"=>"Bebe's Work"}, {"id"=>1047444, "name"=>"URL Shortener - Steve + Bebe"}]
  end
  it 'displays my stories for a project' do
    expect(@tracker.stories("Listen To")).to eq [{"id"=>70610530, "name"=>"General homepage"}, {"id"=>70608174, "name"=>"user sign up"}, {"id"=>70608190, "name"=>"user homepage displays their music"}, {"id"=>70608342, "name"=>"user's songs can be viewed"}, {"id"=>70608376, "name"=>"only valid youtube videos can be added"}, {"id"=>70629310, "name"=>"songs can be edited"}, {"id"=>70629312, "name"=>"songs can be deleted"}, {"id"=>70608892, "name"=>"user's songlist can be sorted"}, {"id"=>70608740, "name"=>"user's current favorite song appears on homepage"}, {"id"=>70608838, "name"=>"users can select thumbnails for their song"}, {"id"=>70608292, "name"=>"user cannot add songs to another person's list"}, {"id"=>70608692, "name"=>"users can view map of where their songs came from"}, {"id"=>70608336, "name"=>"Most viewed song is displayed in chart"}, {"id"=>70608410, "name"=>"users can sign in via google account"}, {"id"=>70608394, "name"=>"User can import their youtube playlists"}, {"id"=>70608466, "name"=>"user can share their lists to fb,"}, {"id"=>70608476, "name"=>"user can share their lists to twitter"}]
  end
  it 'shows the details of a specific story' do
    expect(@tracker.details("Listen To","General homepage")).to eq "user can sign up  or view current userpages"
  end

end