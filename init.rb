require 'redmine'

Redmine::Plugin.register :redmine_wiki_comment_macro do
  name 'Wiki Comment Macro'
  author 'Eric Davis'
  url 'https://projects.littlestreamsoftware.com/projects/redmine-misc'
  author_url 'http://www.littlestreamsoftware.com'
  description 'Adds a wiki macro for HTML comments'
  version '0.1.0'

  Redmine::WikiFormatting::Macros.register do
    desc "Adds an HTML comment. Examples:\n\n" +
      "  !{{html_comment(We should add a video here)}}\n\n" +
      "  <!-- We should add a video here -->"
    macro :html_comment do |obj, args|
      comment = args[0] || ''

      return "<!-- #{h(comment)} -->"
    end
  end
  
    
end
