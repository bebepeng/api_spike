require 'faraday'
require 'json'

class Tracker
  def initialize(api_token)
    @api_token = api_token
  end

  def projects
    get_tracker.map { |project| {'id' => project['id'], 'name' => project['name']} }
  end

  def stories(project_name)
    id = projects.select { |project| project['name'] == project_name }.first['id']
    get_tracker("/#{id}/stories?date_format=millis&with_state=unstarted").map { |story| {'id' => story['id'], 'name' => story['name']} }
  end

  def details(project_name, story_name)
    project_id = projects.select { |project| project['name'] == project_name }.first['id']
    story_id = stories(project_name).select { |story| story['name'] == story_name }.first['id']
    get_tracker("/#{project_id}/stories/#{story_id}")['description']
  end

  private
  def get_tracker(url = "")
    response = Faraday.get "https://www.pivotaltracker.com/services/v5/projects"<<url, {}, 'X-TrackerToken' => @api_token
    JSON.parse(response.body)
  end
end