class StaticPagesController < ApplicationController
  require 'flickr'

      def index
        @flickr = Flickr.new ENV['FLICKR_API_KEY'], ENV['FLICKR_SHARED_SECRET']
            
            begin
                    unless params[:id].blank?
                          @photos = @flickr.photos.search(user_id: params[:id])
                    else
                          @photos = @flickr.photos.getRecent
                    end
            end
        
      end

end