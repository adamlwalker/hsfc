# This migration comes from cms_fortress_engine (originally 5)
class AddCachingInfoToPages < ActiveRecord::Migration
  def change
    add_column :comfy_cms_pages, :cached_timeout, :integer, :default => 0
  end
end
