module CheckboxesHelper
module CheckboxesBuilder

  def collection_check_boxes(collection_name, models, value_method, label_method, html = nil)  
  
    choices = models.map { |model|
      value = model.send value_method
      label = model.send label_method
      [value, label]
    }
    check_boxes(collection_name, choices, html)
  end


  def check_boxes(collection_name, choices, html_options = nil)
    collection_sname = collection_name.to_s.singularize 

    collection_ids = object.send "#{collection_sname}_ids"

    tags = choices.map { |choice|
      value = choice[0]
      label = choice[1]
      id = "#{@object_name}_#{collection_name}_#{value}"
      name = "#{@object_name}[#{collection_sname}_ids][]"
      type = "checkbox"
      checked = collection_ids.include?(value) ? " checked" : ""
      
      "<li><label for=\"#{id}\"><input id=\"#{id}\" name=\"#{name}\" type=\"#{type}\" value=\"#{value}\"#{checked} />&nbsp;#{label}</label></li>"
    }
    html_attrs = html_options.blank? ? "" : html_options.map {|k, v| " #{k}=\"#{v}\"" }.join
    out = "<ul#{html_attrs}>\n" + tags.join("\n") + "\n</ul>"
    out.html_safe
  end
  
end
end
