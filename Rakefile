require 'opal'
require_relative 'lib/dxopal/version'

desc "Build dxopal.js"
task :build => ["build/dxopal.js"]

desc "Build dxopal.js and dxopal.min.js"
task :build_min => ["build/dxopal.min.js", "starter-kit/dxopal.min.js"]

file "starter-kit/dxopal.min.js" => "build/dxopal.min.js" do |t| cp t.source, t.name end

file "build/dxopal.min.js" => "build/dxopal.js" do |t|
  sh "uglifyjs #{t.source} -o #{t.name}"
end

file "build/dxopal.js" => Dir["opal/**/*.rb"] do |t|
  Opal.append_path("lib")
  js = Opal::Builder.build("dxopal.rb").to_s
  File.write(t.name, js)
end

desc "Rebuild API reference"
task :api do
  sh "yard doc -o doc/api/ opal/**/*.rb"
end

desc "git ci, git tag and git push"
task :release do
  sh "git diff HEAD"
  v = "v#{DXOpal::VERSION}"
  puts "release as #{v}? [y/N]"
  break unless $stdin.gets.chomp == "y"

  sh "rake api"
  sh "rake build_min -B"
  sh "gem build dxopal.gemspec"

  sh "git ci -am '#{v}'"
  sh "git tag '#{v}'"
  sh "git push origin master --tags"
  sh "gem push dxopal-#{DXOpal::VERSION}.gem"

  cd "starter-kit" do
    sh "git status"
    print "ok? [y/n] "
    if $stdin.gets.chomp == "y"
      sh "git ci dxopal.min.js -m 'v#{DXOpal::VERSION}'"
      sh "git tag 'v#{DXOpal::VERSION}'"
      sh "git push origin master --tags"
    end
  end
end
