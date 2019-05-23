class UniversitiesController < ApplicationController
  def index
    universities = UniversityResource.all(params)
    respond_with(universities)
  end

  def show
    university = UniversityResource.find(params)
    respond_with(university)
  end

  def create
    university = UniversityResource.build(params)

    if university.save
      render jsonapi: university, status: 201
    else
      render jsonapi_errors: university
    end
  end

  def update
    university = UniversityResource.find(params)

    if university.update_attributes
      render jsonapi: university
    else
      render jsonapi_errors: university
    end
  end

  def destroy
    university = UniversityResource.find(params)

    if university.destroy
      render jsonapi: { meta: {} }, status: 200
    else
      render jsonapi_errors: university
    end
  end
end
