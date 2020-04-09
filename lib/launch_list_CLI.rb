require 'pry'
require 'httparty'

require_relative "launch_list_CLI/version"
require_relative "launch_list_CLI/api"
require_relative "launch_list_CLI/cli"
require_relative "launch_list_CLI/launch"


module LaunchListCLI
  class Error < StandardError; end
  # Your code goes here...
end
