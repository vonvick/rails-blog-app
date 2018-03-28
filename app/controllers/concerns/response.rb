# app/controllers/concerns/response.rb
module Response
  def json_response(object, status = :ok)
    render json: object, except: [:password_digest], status: status
  end
end