Gem::Specification.new do |s|
    s.name          = 'gh-new'
    s.version       = IO.read('version.txt')
    s.license       = 'MIT'
    s.summary       = 'Create a new Github repository'
    s.description   = 'Access the Github API to create a new repository'
    s.homepage      = 'https://github.com/karagenit/gh-new'
    s.author        = 'Caleb Smith'
    s.email         = 'karagenit@outlook.com'
    s.require_paths = ['bin/']
    s.executables   << 'gh_new'
    s.platform      = Gem::Platform::RUBY

    s.add_runtime_dependency 'octokit', '~> 4.7'

    s.add_development_dependency 'rubocop',                     '~> 0.49'
    s.add_development_dependency 'rdoc',                        '~> 4.2'
    s.add_development_dependency 'bundler',                     '~> 1.15'
    s.add_development_dependency 'rake',                        '~> 12.0'
    s.add_development_dependency 'test-unit',                   '~> 3.2'
    s.add_development_dependency 'github_changelog_generator',  '~> 1.14'
end
