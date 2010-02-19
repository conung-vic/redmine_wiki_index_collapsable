require 'redmine'
require 'wiki_index_collapse'
require 'dispatcher'

Dispatcher.to_prepare do
  ActionView::Base.send(:include, WikiIndexCollapse)
end

Redmine::Plugin.register :redmine_wiki_index_collapsable do
  name 'Redmine Wiki Index Collapsable plugin'
  author 'Conung ViC'
  description 'Этот плагин делает оглавление в вики проекта динамическим.'
  version '0.0.4'
end