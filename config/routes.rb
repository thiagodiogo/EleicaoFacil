ActionController::Routing::Routes.draw do |map|
  map.logout '/logout', :controller => 'sessaos', :action => 'destroy'
  map.login '/login', :controller => 'sessaos', :action => 'new'
  map.register '/register', :controller => 'usuarios', :action => 'create'
  map.signup '/signup', :controller => 'usuarios', :action => 'new'
  
  map.resources :usuarios

  map.resource :sessao

  map.resources :registro_de_votos

  map.resources :chapas

  map.resources :locals

  # The priority is based upon order of creation: first created -> highest priority.

  # Sample of regular route:
  #   map.connect 'products/:id', :controller => 'catalog', :action => 'view'
  # Keep in mind you can assign values other than :controller and :action

  # Sample of named route:
  #   map.purchase 'products/:id/purchase', :controller => 'catalog', :action => 'purchase'
  # This route can be invoked with purchase_url(:id => product.id)

  # Sample resource route (maps HTTP verbs to controller actions automatically):
  #   map.resources :products

  # Sample resource route with options:
  #   map.resources :products, :member => { :short => :get, :toggle => :post }, :collection => { :sold => :get }

  # Sample resource route with sub-resources:
  #   map.resources :products, :has_many => [ :comments, :sales ], :has_one => :seller
  
  # Sample resource route with more complex sub-resources
  #   map.resources :products do |products|
  #     products.resources :comments
  #     products.resources :sales, :collection => { :recent => :get }
  #   end

  # Sample resource route within a namespace:
  #   map.namespace :admin do |admin|
  #     # Directs /admin/products/* to Admin::ProductsController (app/controllers/admin/products_controller.rb)
  #     admin.resources :products
  #   end

  map.home 'home', :controller => "home"

  map.connect 'graficos_locais', :controller => "graficos_locais"
  map.connect 'graficos_chapas', :controller => "graficos_chapas"
  map.connect 'graficos_por_categoria', :controller => "graficos_categorias"
  
  map.connect 'graficos/swf_por_local', :controller => "graficos_locais", :action => "swf_por_local"
  map.connect 'graficos/swf_por_chapa', :controller => "graficos_chapas", :action => "swf_por_chapa"
  map.connect 'graficos/swf_por_categoria', :controller => "graficos_categorias", :action => "swf_por_categoria"

  map.connect 'graficos/:action', :controller => "home"

  # You can have the root of your site routed with map.root -- just remember to delete public/index.html.
  #map.root :controller => 'sessaos', :action => 'new'
  map.root :controller => 'home'

  # See how all your routes lay out with "rake routes"

  # Install the default routes as the lowest priority.
  # Note: These default routes make all actions in every controller accessible via GET requests. You should
  # consider removing or commenting them out if you're using named routes and resources.
  map.connect ':controller/:action/:id'
  map.connect ':controller/:action/:id.:format'
end
