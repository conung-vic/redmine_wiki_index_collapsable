# To change this template, choose Tools | Templates
# and open the template in the editor.


module WikiIndexCollapse
  def self.included(base) # :nodoc:
    base.send(:include, InstanceMethods)
  end

  module InstanceMethods
    def render_page_hierarchy_ext(pages, node=nil, first=nil)
      content = ''
      if pages[node]
        if first
          css_class = "open"
        else
          css_class = "close"
        end
        content << "<ul class=\""+css_class+"_list\" onClick=\"Check();\">\n"
        pages[node].each do |page|
          js = ""
          if pages[page.id]
            css_class = "close"
            js = "onClick=\"do_some(this, event);\""
            content << "<li class=\""+css_class+"_item\""+js+" >\n"
            content << h(page.pretty_title)+"&nbsp;"
            content << link_to("<b>=><img src=\"/images/external.png\"></b>", {:controller => 'wiki', :action => 'index', :id => page.project, :page => page.title},
                        :title => (page.respond_to?(:updated_on) ? l(:label_updated_time, distance_of_time_in_words(Time.now, page.updated_on)) : nil))
            content << "\n"+render_page_hierarchy_ext(pages, page.id)
          else
            css_class = "list"
            content << "<li class=\""+css_class+"_item\""+js+" >\n"
            content << link_to(h(page.pretty_title)+"&nbsp;", {:controller => 'wiki', :action => 'index', :id => page.project, :page => page.title},
                        :title => (page.respond_to?(:updated_on) ? l(:label_updated_time, distance_of_time_in_words(Time.now, page.updated_on)) : nil))
          end
          content << "</li> \n"
        end
        content << "</ul> \n"
      end
      content
    end
  end
end