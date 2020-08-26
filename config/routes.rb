Discourse::Application.routes.append do
  mount ::CategoryHome::Engine, at: "categoryhome"
end

CategoryHome::Engine.routes.draw do
  get "home_category" => "category_home#home_category"
end
