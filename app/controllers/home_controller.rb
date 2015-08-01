class HomeController < ApplicationController
  def index
    @images = Comfy::Cms::File.all
  end
end
