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
      # File.read(template_name)
      # byebug
      def initialize(req, res)
        super(req, res)
      end
      file = File.open(dir_path = File.dirname(__FILE__) + "/../../views/#{self.class.name.underscore}/" + template_name.to_s + ".html.erb", "r")
      contents = file.read
      erb = ERB.new(contents).result(binding)
      render_content(erb, "text/html")
    end
  end
end
