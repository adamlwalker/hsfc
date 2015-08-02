class HomeController < ApplicationController
  def index
    @images = Comfy::Cms::File.where(file_content_type: "image/jpeg")
    @articles = Comfy::Cms::Page.where('label ~* ?', 'news').last(3).reverse
    render cms_layout: 'base', cms_blocks: {
      carousel: { template: '/home/index' },
      news: { partial: '/home/news' }
    }
  end
end
