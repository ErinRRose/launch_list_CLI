require_relative 'lib/launch_list_CLI/version'

Gem::Specification.new do |spec|
  spec.name          = "launch_list_CLI"
  spec.version       = LaunchListCLI::VERSION
  spec.authors       = ["your_name"]
  spec.email         = ["your_email@example.com"]

  spec.summary       = "summary"
  spec.description   = "desc"
  spec.homepage      = "http://homepage.com"
  spec.required_ruby_version = Gem::Requirement.new(">= 2.3.0")

  spec.metadata["allowed_push_host"] = "http://homepage.com"

  spec.metadata["homepage_uri"] = "http://homepage.com"
  spec.metadata["source_code_uri"] = "http://homepage.com"
  spec.metadata["changelog_uri"] = "http://homepage.com"

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files         = Dir.chdir(File.expand_path('..', __FILE__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_dependency'httparty'
  spec.add_dependency'pry'
end
