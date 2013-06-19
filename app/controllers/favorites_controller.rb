class FavoritesController < ApplicationController
  # GET /favorites
  # GET /favorites.json
  def index
    @favorites = Favorite.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @favorites }
    end
  end

  # GET /favorites/1
  # GET /favorites/1.json
  def show
    @favorite = Favorite.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @favorite }
    end
  end

  # GET /favorites/new
  # GET /favorites/new.json
  def new
    @favorite = Favorite.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @favorite }
    end
  end

  # GET /favorites/1/edit
  def edit
    @favorite = Favorite.find(params[:id])
  end

  # POST /favorites
  # POST /favorites.json
  def create
    @favorite = Favorite.new(params[:favorite])

    respond_to do |format|
      if @favorite.save
        format.html { redirect_to @favorite, notice: 'Favorite was successfully created.' }
        format.json { render json: @favorite, status: :created, location: @favorite }
      else
        format.html { render action: "new" }
        format.json { render json: @favorite.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /favorites/1
  # PUT /favorites/1.json
  def update
    @favorite = Favorite.find(params[:id])

    respond_to do |format|
      if @favorite.update_attributes(params[:favorite])
        format.html { redirect_to @favorite, notice: 'Favorite was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @favorite.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /favorites/1
  # DELETE /favorites/1.json
  def destroy
    @favorite = Favorite.find(params[:id])
    @favorite.destroy

    respond_to do |format|
      format.html { redirect_to favorites_url }
      format.json { head :no_content }
    end
  end

  def reorder
    reorder_favorites(params[:favorites])
    render :json => {}
  end

  def drag_create

      #1) create favorite
      @favorite = Favorite.new
      @favorite.app_id = params[:app].chop.to_i
      @favorite.loginid = @current_user.loginid
      @favorite.position = 1
	
      if (params[:app_type] == "book")
      	@favorite.is_bookmark = true
      else 
	@favorite.is_bookmark = false      
      end
      
      @favorite.save

      #2) correct ordering array to reflect the correct id of the new favorite (initially that field held the app_id info, not the id of the favorite
      ordering = params[:favorites]
      fav_index = params[:favorites].index(params[:app])
      ordering[fav_index] = @favorite.id
   
     #3) trigger reorder code
	reorder_favorites(params[:favorites])
     #4) send new id back to client to update the id attr on the li element 

    render :json => {}
  end


  def reorder_favorites( favorites = [] )
    @favorite_ids = favorites
    n = 0
    ActiveRecord::Base.transaction do
      @favorite_ids.each do |id|
        favorite = Favorite.find(id)
        favorite.position = n
        n += 1
        favorite.save
      end
    end
    render :json => {}
  end
   
end
