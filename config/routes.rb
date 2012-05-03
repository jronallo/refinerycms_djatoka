Refinery::Core::Engine.routes.append do
  namespace :admin, :path => 'refinery' do
    resources :djimages, :except => :show do
      get :insert, :on => :collection
      get :djatoka_image, :on => :collection
    end
  end
end