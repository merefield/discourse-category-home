# name: discourse-category-home
# about: if someone has a primary group registered and that is permissioned to a single category, redirect to that category as home.
# version: 0.1
# authors: merefield

enabled_site_setting :discourse_category_home_enabled

after_initialize do

  load File.expand_path('../lib/category_home/engine.rb', __FILE__)
  load File.expand_path('../config/routes.rb', __FILE__)
  load File.expand_path('../app/controllers/category_home_controller.rb', __FILE__)
  load File.expand_path('../lib/category_home_lib.rb', __FILE__)

end
