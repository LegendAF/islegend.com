# If you do not have OpenSSL installed, update
# the following line to use "http://" instead
source 'https://rubygems.org'

# Middleman
gem "middleman", "~> 4.2.1"
gem "middleman-blog", "~> 4.0"
gem "middleman-livereload"
gem 'middleman-autoprefixer'
gem "middleman-scss-lint", github: "middleman/middleman-scss-lint", branch: "master"
gem "middleman-minify-html"
gem 'middleman-pagination', "~>1.2.0", :git => "https://github.com/jc00ke/middleman-pagination.git"

gem "rake", "10.4.2"

# For faster file watcher updates on Windows:
gem "wdm", "~> 0.1.0", :platforms => [:mswin, :mingw]

# Windows does not come with time zone data
gem "tzinfo-data", platforms: [:mswin, :mingw, :jruby]

# Markdwon
#gem 'kramdown'
gem 'redcarpet'

# Linter
gem 'scss_lint', require: false

# Deployment
gem 'middleman-deploy', github: 'middleman-contrib/middleman-deploy', branch: 'master'

group :development do
  gem 'byebug'
end