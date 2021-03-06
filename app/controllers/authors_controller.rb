class AuthorsController < ApplicationController
  def index
    authors = AuthorResource.all(params)
    respond_with(authors)
  end

  def show
    author = AuthorResource.find(params)
    respond_with(author)
  end

  def create
    author = AuthorResource.build(params)

    if author.save
      render jsonapi: author, status: 201
    else
      render jsonapi_errors: author
    end
  end

  def update
    author = AuthorResource.find(params)

    if author.update_attributes
      render jsonapi: author
    else
      render jsonapi_errors: author
    end
  end

  def destroy
    author = AuthorResource.find(params)

    if author.destroy
      render jsonapi: { meta: {} }, status: 200
    else
      render jsonapi_errors: author
    end
  end
end
