lib = File.expand_path("lib", __dir__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "cg_foundation_client/version"

Gem::Specification.new do |spec|
  spec.name          = "cg-foundation-client"
  spec.version       = CgFoundationClient::VERSION
  spec.authors       = ["Antony Falegkos"]
  spec.email         = ["falegk1@gmail.com"]

  spec.summary       = %q{A Ruby client gem for [cg_foundation](https://github.com/clonesec/cg_foundation) service API}
  spec.description   = %q{A Ruby client gem for [cg_foundation](https://github.com/clonesec/cg_foundation) service API}
  spec.homepage      = "https://github.com/clonesec/cg-foundation-client"
  spec.license       = "MIT"

  # spec.metadata["allowed_push_host"] = "TODO: Set to 'http://mygemserver.com'"

  if spec.respond_to?(:metadata)
    spec.metadata["homepage_uri"] = spec.homepage
    spec.metadata["source_code_uri"] = spec.homepage
    spec.metadata["changelog_uri"] = "https://github.com/clonesec/cg-foundation-client/CHANGELOG.md"
  else
    raise "RubyGems 2.0 or newer is required to protect against " \
      "public gem pushes."
  end

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files         = Dir.chdir(File.expand_path('..', __FILE__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 2.0", ">= 1.16"
  spec.add_development_dependency "rake", ">= 12.3.3"
  spec.add_development_dependency "rspec", "~> 3.0"
  spec.add_development_dependency "vcr", '~> 4.0', '>= 4.0.0'

  spec.add_runtime_dependency 'faraday', '~> 1.0', '>= 1.0.1', '< 2.0.0'
  spec.add_runtime_dependency 'faraday_middleware', '~> 1.0.0', '>= 1.0.0', '< 2.0.0'
end
