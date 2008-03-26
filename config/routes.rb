ActionController::Routing::Routes.draw do |map|
  map.named_route 'words', '/',         :action => 'index',  :conditions => { :method => :get },  :controller => 'words'
  map.named_route 'words', '/',         :action => 'create', :conditions => { :method => :post }, :controller => 'words'
  map.named_route 'word',  '/:letters', :action => 'show',   :conditions => { :method => :get },  :controller => 'words'
end
