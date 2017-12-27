class Posts < Grape::API
  include ActiveModel::Validations
  include Swagger::Blocks

  resource :posts do
   
    swagger_path '/api/v1/posts' do
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
  
    swagger_path '/api/v1/posts' do
      operation :post do
        key :description, 'Add new Post'
        key :produces, ['application/json']         
        key :tags, ['Posts']

        parameter do
          key :name, :post
          key :in, :body
          key :description, 'Add new Post'
          key :required, true
          schema do
            key :'$ref', :Post
          end
        end

        response 200 do
          key :description, 'Post response'
          schema do
            key :'$ref', :Post
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
      begin
        Post.create!(params)
      rescue Exception => e
        {code: 400, message: e.message}
      end
    end
  end
end