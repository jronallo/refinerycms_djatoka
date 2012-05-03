module Refinery
  module Admin
    class DjimagesController < ::Refinery::AdminController
      
      before_filter :init_dialog
      # crudify :djimage,
      #         :title_attribute => 'caption', :xhr_paging => true
      def insert
        @url_override = refinery.admin_images_path(request.query_parameters.merge(:insert => true))
  
        render :action => "insert"
      end
      
      def djatoka_image       
        @djatoka_params = {:id => :djatoka_image}
        @djatoka_params[:title] = params[:title] if !params[:title].blank?
        if params[:scale].blank?
          @djatoka_params[:scale] = 300
        else
          @djatoka_params[:scale] = params[:scale]
        end
        params[:square] ||= false
        params[:position] ||= 'center'
        render :partial => 'djatoka_image'
      end
      
    protected
    
      def init_dialog
        @app_dialog = params[:app_dialog].present?
        @field = params[:field]
        @callback = params[:callback]
        @multiple = params[:multiple]
        @conditions = params[:conditions]
      end
      
      
    end #DjimagesController      
  end
end