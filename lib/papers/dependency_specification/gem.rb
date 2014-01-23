module Papers
  class Gem < DependencySpecification
    def pretty_hash
      {
        name: name_without_version,
        license: license,
        license_url: @license_url,
        project_url: @project_url
      }
    end

    def self.introspected
      Bundler.load.specs.map do |spec|
        # bundler versions aren't controlled by the Gemfile
        if spec.name == 'bundler'
          spec.name
        else
          "#{spec.name}-#{spec.version}"
        end
      end
    end

    def self.manifest_key
      "gems"
    end
  end
end
