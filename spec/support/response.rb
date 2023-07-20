# frozen_string_literal: true

module Response
  def json_response
    JSON.parse(response.body)
  end
end
