class NewsController < ApplicationController
  def index
    @articles = Comfy::Cms::Page.where('label ~* ?', 'news').reverse_order
  end
end
