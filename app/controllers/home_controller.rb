class HomeController < ApplicationController
  def index
    @images = Comfy::Cms::File.all
    @articles = Comfy::Cms::Page.where('label ~* ?', 'news').last(3)
    render cms_layout: 'base', cms_blocks: {
      carousel: { template: '/home/index' },
      news: { partial: '/home/news' }
    }
  end
end
