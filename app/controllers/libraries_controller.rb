class LibrariesController < ApplicationController
  
  def index
    @libraries = Library.all
  end

  def show
    library_id = params[:id]
    @library = Library.find_by_id(library_id)
  end

  def new
    @library = Library.new
  end

  def create
    @library = Library.create(library_params)
    redirect_to libraries_path
  end

  private

  def library_params   
    params.require(:library).permit(:name, :floor_count, :floor_area)
  end

end
