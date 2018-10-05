require 'redcarpet'
require 'active_support/core_ext/integer/inflections'

Time.zone = "Eastern Time (US & Canada)"

activate :autoprefixer, browsers: [
  'last 2 versions'
]

set :css_dir, 'assets/css'
set :js_dir, 'assets/js'
set :images_dir, 'assets/images'
set :redcarpet, :autolink => true, :no_intra_emphasis => true, :fenced_code_blocks => true, :strikethrough => true

proxy '_redirects', 'netlify-redirects', ignore: true

# Per-page layout changes:
page '/*.xml', layout: false
page '/*.json', layout: false
page '/*.txt', layout: false
page '/feed.xml', layout: false

activate :blog do |blog|
  blog.name                   = 'blog'
  blog.prefix                 = 'blog'
  blog.layout                 = 'blog/default'
  blog.paginate               = true
  blog.page_link              = "{num}"
  blog.per_page               = 6
  blog.permalink              = "{category}/{title}.html"
  blog.new_article_template   = "source/blog/templates/post.html.erb"
  blog.taglink                = "tag/{tag}.html"
  blog.tag_template           = "blog/templates/tag.html"

  blog.custom_collections = {
    category: {
      link: '{category}.html',
      template: 'blog/templates/category.html'
    }
  }
end

activate :directory_indexes #needs to be after blog

# Reload the browser automatically whenever files change
configure :development do
  activate :livereload
end

configure :build do
  # Minify files on build
  activate :minify_html
  activate :minify_css
  activate :minify_javascript
  # Use relative URLs
  activate :relative_assets 
  # relative links
  config[:relative_links] = true
end

configure :server do
  ready do
    files.on_change :source do |changed|
      changed_js = changed.select do |f|
        f[:full_path].extname === '.js' && !f[:full_path].to_s.include?('.tmp')
      end

      if changed_js.length > 0
        puts "== Linting Javascript"

        changed_js.each do |file|
          puts `./node_modules/eslint/bin/eslint.js #{file[:full_path]}`
        end
      end
    end
  end
end