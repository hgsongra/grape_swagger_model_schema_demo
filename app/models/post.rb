class Post < ApplicationRecord
  include Swagger::Blocks
	
	swagger_schema :Post do
    key :required, [:title]
    property :id do
      key :type, :integer
      key :format, :int64
    end
    property :title do
      key :type, :string
    end
    property :description do
      key :type, :string
    end
  end
end
