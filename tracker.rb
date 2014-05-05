require 'faraday'
require 'json'

class Tracker
  def initialize(api_token)
    @api_token = api_token
  end

  def projects
    response = Faraday.get "https://www.pivotaltracker.com/services/v5/projects", {}, 'X-TrackerToken' => @api_token
    tracker_data = JSON.parse(response.body)
    tracker_data.map { |project| {'id' => project['id'], 'name' => project['name']} }
  end

  def stories(project_name)
    id = projects.select {|project| project['name'] == project_name}.first['id']
    response = Faraday.get "https://www.pivotaltracker.com/services/v5/projects/#{id}/stories?date_format=millis&with_state=unstarted", {}, 'X-TrackerToken' => @api_token
    tracker_data = JSON.parse(response.body)
    tracker_data.map {|story|{'id' => story['id'], 'name' => story['name']} }
  end

  def details(project_name, story_name)
    project_id = projects.select {|project| project['name'] == project_name}.first['id']
    story_id = stories(project_name).select {|story| story['name'] == story_name}.first['id']
    response = Faraday.get "https://www.pivotaltracker.com/services/v5/projects/#{project_id}/stories/#{story_id}", {}, 'X-TrackerToken' => @api_token
    tracker_data = JSON.parse(response.body)['description']
  end
end