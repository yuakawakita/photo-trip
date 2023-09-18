class PhotosController < ApplicationController

  before_action :authenticate_user!, only: [:new, :create]
  
    def index
        @photos = Photo.all

        if params[:tag_ids]
          @photos = []
          params[:tag_ids].each do |key, value|
            if value == "1"
              tag_photos = Tag.find_by(name: key).photos
              @photos = @photos.empty? ? tag_photos : @photos & tag_photos
            end
          end
        end
        if params[:tag]
          Tag.create(name: params[:tag])
        end
    end
    
    
    def new
        @photo = Photo.new
      end
    
      def create
        photo = Photo.new(photo_params)

        photo.user_id=current_user.id

        if photo.save
          redirect_to :action => "index"
        else
          redirect_to :action => "new"
        end
      end

      def show
        @photo = Photo.find(params[:id])
      end

      def edit
        @photo = Photo.find(params[:id])
      end

      def update
        photo = Photo.find(params[:id])
        if photo.update(photo_params)
          redirect_to :action => "show", :id => photo.id
        else
          redirect_to :action => "new"
        end
      end

      def destroy
        photo = Photo.find(params[:id])
        photo.destroy
        redirect_to action: :index
      end
    
      private
      def photo_params
        params.require(:photo).permit(:user_id, :name, :season, :address, :image, tag_ids: [])
      end

end
