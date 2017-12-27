class Post < ApplicationRecord
  include Swagger::Blocks

  validates_presence_of :title
  validates_uniqueness_of :title

	swagger_schema :Post do
    key :required, [:title]
    property :title do
      key :type, :string
    end
    property :description do
      key :type, :string
    end
  end
end
