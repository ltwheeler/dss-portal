
class AppBookmarksController < ApplicationController
  # GET /app_bookmarks
  # GET /app_bookmarks.json
  def index
    @app_bookmarks = AppBookmark.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @app_bookmarks }
    end
  end

  # GET /app_bookmarks/1
  # GET /app_bookmarks/1.json
  def show
    @app_bookmark = AppBookmark.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @app_bookmark }
    end
  end

  # GET /app_bookmarks/new
  # GET /app_bookmarks/new.json
  def new
    @app_bookmark = AppBookmark.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @app_bookmark }
    end
  end

  # GET /app_bookmarks/1/edit
  def edit
    @app_bookmark = AppBookmark.find(params[:id])
  end

  # POST /app_bookmarks
  # POST /app_bookmarks.json
  def create
    @app_bookmark = AppBookmark.new(params[:app_bookmark])

    respond_to do |format|
      if @app_bookmark.save
        format.html { redirect_to @app_bookmark, notice: 'App bookmark was successfully created.' }
        format.json { render json: @app_bookmark, status: :created, location: @app_bookmark }
      else
        format.html { render action: "new" }
        format.json { render json: @app_bookmark.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /app_bookmarks/1
  # PUT /app_bookmarks/1.json
  def update
    @app_bookmark = AppBookmark.find(params[:id])

    respond_to do |format|
      if @app_bookmark.update_attributes(params[:app_bookmark])
        format.html { redirect_to @app_bookmark, notice: 'App bookmark was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @app_bookmark.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /app_bookmarks/1
  # DELETE /app_bookmarks/1.json
  def destroy
    @app_bookmark = AppBookmark.find(params[:id])
    @app_bookmark.destroy

    respond_to do |format|
      format.html { redirect_to app_bookmarks_url }
      format.json { head :no_content }
    end
  end
end
