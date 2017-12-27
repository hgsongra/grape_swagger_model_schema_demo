class ApidocsController < ApplicationController
include Swagger::Blocks

  swagger_root host: 'localhost:3000' do
    key :swagger, '2.0'
    info do
      key :version, '1.0.0'
      key :title, 'Grape Swagger Schema Demo'
      key :description, 'Work in Progress'
    end
    key :host, 'localhost:3000'
    key :basePath, '/'
    key :consumes, ['application/json']
    key :produces, ['application/json']
  end

  # A list of all classes that have swagger_* declarations.
  SWAGGERED_CLASSES = [
    ErrorModel,
    Posts,
    Post,
    self,
  ].freeze

  def index
    render json: Swagger::Blocks.build_root_json(SWAGGERED_CLASSES)
  end
end
