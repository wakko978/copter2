module ApplicationHelper
  def sort_link(title, column, options = {})
    condition = options[:unless] if options.has_key?(:unless)
    tooltip = options.delete(:tooltip) if options.has_key?(:tooltip)
    sort_dir = params[:d] == 'up' ? 'down' : 'up'
    link_to_unless condition, "#{title}<span>#{tooltip}</span>".html_safe,
      request.parameters.merge({:c => column, :d => sort_dir}), options
  end
end
