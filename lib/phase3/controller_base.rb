require_relative '../phase2/controller_base'
require 'active_support'
require 'active_support/core_ext'
require 'erb'
require 'byebug'
module Phase3
  class ControllerBase < Phase2::ControllerBase
    # use ERB and binding to evaluate templates
    # pass the rendered html to render_content
    def render(template_name)
      file = File.open(dir_path = File.dirname(__FILE__) + "/../../views/cats_controller/" + template_name.to_s + ".html.erb", "r")
      contents = file.read
      render_content(contents, "text/html")
    end
  end
end
