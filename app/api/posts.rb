class Posts < Grape::API
  include ActiveModel::Validations
  include Swagger::Blocks

  resource :posts do
   
    swagger_path 'api/v1/posts' do
      operation :get do
        key :description, 'Return all Posts'
        key :produces, ['application/json']         
        key :tags, ['Posts']

        response 200 do
          key :description, 'Post response'
          schema do
            key :type, :array
            items do
              key :'$ref', :Post
            end
          end
        end

        response :default do
          key :description, 'unexpected error'
          schema do
            key :'$ref', :ErrorModel
          end
        end
      end
    end

    get do
      Post.all
    end
  
    swagger_path 'api/v1/posts' do
      operation :get do
        key :description, 'Return all Posts'
        key :produces, ['application/json']         
        key :tags, ['Posts']

        response 200 do
          key :description, 'Post response'
          schema do
            key :type, :array
            items do
              key :'$ref', :Post
            end
          end
        end

        response :default do
          key :description, 'unexpected error'
          schema do
            key :'$ref', :ErrorModel
          end
        end
      end
    end
  
    post do
      Post.create!(params)
    end
  end
end