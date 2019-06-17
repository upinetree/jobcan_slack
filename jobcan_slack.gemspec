lib = File.expand_path("lib", __dir__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "jobcan_slack/version"

Gem::Specification.new do |spec|
  spec.name          = "jobcan_slack"
  spec.version       = JobCanSlack::VERSION
  spec.authors       = ["upinetree"]
  spec.email         = ["upinetree@gmail.com"]

  spec.summary       = %q{A ruby client for JobCan Slack.}
  spec.description   = %q{A ruby client for JobCan Slack.}
  spec.homepage      = "https://github.com/upinetree/jobcan_slack"
  spec.license       = "MIT"

  spec.metadata["allowed_push_host"] = "TODO: Set to 'http://mygemserver.com'"

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = spec.homepage
  spec.metadata["changelog_uri"] = spec.homepage

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files         = Dir.chdir(File.expand_path('..', __FILE__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.required_ruby_version = '>= 2.7.0.preview1'

  spec.add_dependency "slack-ruby-client", "~> 0.14.0"
  spec.add_development_dependency "pry"
  spec.add_development_dependency "bundler", "~> 2.1.a"
  spec.add_development_dependency "rake", "~> 12.0"
end
