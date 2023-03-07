require "spec_helper"
require "rack/test"
require_relative '../../app'

DatabaseConnection.connect

describe Application do
  # This is so we can use rack-test helper methods.
  include Rack::Test::Methods

  # We need to declare the `app` value by instantiating the Application
  # class so our tests work.
  let(:app) { Application.new }

  context "GET /albums" do
    it "gives a link to click through to album details" do
      response = get('/albums')
      expect(response.status).to eq(200)
      expect(response.body).to include("<a href=\"/albums/12\">Ring Ring</a><br />\n")
      expect(response.body).to include("<a href=\"/albums/2\">Surfer Rosa</a><br />\n")
      expect(response.body).to include("<a href=\"/albums/3\">Waterloo</a><br />\n")
    end
  end
  
  context "GET /albums/:id" do
    it "returns content for albu one'" do
      response = get('/albums/2')
      expect(response.status).to eq(200)
      expect(response.body).to include('<h1>Surfer Rosa</h1>')
      expect(response.body).to include('Release year: 1988')
      expect(response.body).to include('Artist: Pixies')
    end
  end
  
  context "GET /artists/:id" do
    it "returns content for artist one'" do
      response = get('/artists/2')
      expect(response.status).to eq(200)
      expect(response.body).to include('<h1>ABBA</h1>')
      expect(response.body).to include('Genre: Pop')
      expect(response.body).to include('ID: 2')
    end
  end
  
  context "GET /artists" do
    it "gives a link to click through to album details" do
      response = get('/artists')
      expect(response.status).to eq(200)
      expect(response.body).to include("<a href=\"/albums/1\">Pixies</a>")
      expect(response.body).to include("<a href=\"/albums/2\">ABBA</a>")
      expect(response.body).to include("<a href=\"/albums/3\">Taylor Swift</a>")
    end
  end

end

#OLD OLD OLD
# context "GET /artists" do
#   it "gets a list of artist names" do
#     response = get('/artists')

#     expected_response = "Pixies, ABBA, Taylor Swift, Nina Simone, Kiasmos"

#     expect(response.status).to eq (200)
#     expect(response.body).to eq (expected_response)
#   end
# end

# context "POST /artists" do
#   it "gets a list of artist names" do
#     response = post('/artists', name: "Elton John", genre: "Pop")
#     response = get('artists')
#     expect(response.status).to eq (200)
#     expect(response.body).to include("Elton John")
#   end
# end