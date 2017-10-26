task :default => [:clean, :build, :install, :test]

task :build do
    sh "bundle install"
    sh "gem build .gemspec"
    system "rdoc lib/"
end

task :install do
    sh "gem install gh-new-" + IO.read('version.txt') + ".gem" 
end

task :clean do
    system "gem uninstall gh-new" 
    system "rm *.gem"
end

task :test do
    sh "rubocop bin/gh_new" 
end

task :publish do
    puts "Current Version: " + IO.read('version.txt')
    print "New Version: "
    vers = STDIN.gets.chomp
    IO.write('version.txt', vers)
    sh "rake build"
    system "github_changelog_generator"
    system "git commit -am \"Update Version\""
    system "git tag -a v" + vers + " -m \"\""
    system "git push origin master"
    system "git push origin v" + IO.read('version.txt')
    system "gem push gh-new-" + IO.read('version.txt') + ".gem" 
end
