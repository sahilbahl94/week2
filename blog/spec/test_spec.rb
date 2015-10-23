#FOR TESTING
ENV['RACK_ENV'] = 'test'

require_relative '../controller'
require 'rspec'
require 'rack/test'
require 'pry'


describe 'The SongLister' do

#class within class
include Rask::Test::Methods

def app 
	Sinatra::Application
end

def describe...(just like rspec) do 
	get "/new"
	expect last_response.to be_ok
	expect last_response.body to include("Title or something")