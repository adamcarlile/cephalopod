# frozen_string_literal: true

require_relative "lib/cephalopod/version"

Gem::Specification.new do |spec|
  spec.name = "cephalopod"
  spec.version = Cephalopod::VERSION
  spec.authors = ["Adam Carlile"]
  spec.email = ["hello@adamcarlile.com"]

  spec.summary = "Gem to connect to the Octopus Energy API"
  spec.homepage = "https://github.com/adamcarlile/cephalopod"
  spec.license = "MIT"
  spec.required_ruby_version = ">= 2.6.0"

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = "https://github.com/adamcarlile/cephalopod"

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files = Dir.chdir(__dir__) do
    `git ls-files -z`.split("\x0").reject do |f|
      (f == __FILE__) || f.match(%r{\A(?:(?:bin|test|spec|features)/|\.(?:git|travis|circleci)|appveyor)})
    end
  end
  spec.bindir = "exe"
  spec.executables = spec.files.grep(%r{\Aexe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_dependency "dry-struct"
  spec.add_dependency "dry-validation"
  spec.add_dependency "faraday"
  spec.add_dependency "activesupport"
  spec.add_dependency "mustermann"

  spec.add_development_dependency "bundler"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "rspec"
  spec.add_development_dependency "pry"

  # For more information and examples about making a new gem, check out our
  # guide at: https://bundler.io/guides/creating_gem.html
end
