class API < Grape::API
  prefix 'api'
	format :json
	version 'v1', using: :path

	before do
    header['Access-Control-Allow-Origin'] = '*'
    header['Access-Control-Request-Method'] = '*'
    headers['Access-Control-Allow-Headers'] = '*'
	end

	mount Posts

  add_swagger_documentation	api_version: 'v1'
end