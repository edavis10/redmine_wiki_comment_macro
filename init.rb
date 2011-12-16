require 'redmine'

Redmine::Plugin.register :redmine_wiki_comment_macro do
  name 'Wiki Comment Macro'
  author 'Eric Davis'
  url 'https://projects.littlestreamsoftware.com/projects/redmine-misc'
  author_url 'http://www.littlestreamsoftware.com'
  description 'Adds a wiki macro for HTML comments'
  version '0.1.0'

end

class HtmlCommentTag < ChiliProject::Liquid::Tags::Tag
  include ActionView::Helpers::TagHelper

  def initialize(tag_name, markup, tokens)
    @comment = markup
    super
  end

  def render(context)
    return "<!-- #{h(@comment)} -->"
  end
end

ChiliProject::Liquid::Tags.register_tag('html_comment', HtmlCommentTag, :html => true)
