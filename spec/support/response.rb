# module Response
#   def json_response(object, status = :ok)
#     render json: object, status: status
#   end
# end

module Response
  def json_response
    JSON.parse(response.body)
  end
end
