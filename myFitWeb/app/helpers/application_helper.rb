module ApplicationHelper

  def nav_link(link_text, link_path, http_method= nil)
    class_name = current_page?(link_path) ? 'active' : ''

    content_tag(:li, class: class_name) do
      if http_method
        link_to(link_text, link_path, method: http_method)
      else
        link_to(link_text, link_path)
      end
    end
  end

  def nav_link_options(link_text, link_path, options=nil)
    class_name = current_page?(link_path) ? 'active' : ''

    content_tag(:li, class: class_name) do
      if options
        link_to(link_text, link_path, options)
      else
        link_to(link_text, link_path)
      end
    end
  end

end
