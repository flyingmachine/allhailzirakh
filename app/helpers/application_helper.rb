# Methods added to this helper will be available to all templates in the application.
module ApplicationHelper
  def highlight_keywords(string)
    keyword_regex = Keywords.join("|")
    string.gsub(/(#{keyword_regex})/, "<em>#{h('\1')}</em>")
  end
  
  def full_verb_name(verb)
    s = highlight_keywords(verb.command)
    s += " (#{verb.status})" unless verb.status.blank?
    s
  end
  
  def ajax_spinner(options = {})
    image_tag "spinner.gif", {:class => "spinner"}.merge(options)
  end
end
