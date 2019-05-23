class LibrariesController < ApplicationController
  def index
    libraries = LibraryResource.all(params)
    respond_with(libraries)
  end

  def show
    library = LibraryResource.find(params)
    respond_with(library)
  end

  def create
    library = LibraryResource.build(params)

    if library.save
      render jsonapi: library, status: 201
    else
      render jsonapi_errors: library
    end
  end

  def update
    library = LibraryResource.find(params)

    if library.update_attributes
      render jsonapi: library
    else
      render jsonapi_errors: library
    end
  end

  def destroy
    library = LibraryResource.find(params)

    if library.destroy
      render jsonapi: { meta: {} }, status: 200
    else
      render jsonapi_errors: library
    end
  end
end
