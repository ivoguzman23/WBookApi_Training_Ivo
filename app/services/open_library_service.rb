# frozen_string_literal: true

class OpenLibraryService
  def execute(bibkeys)
    apiurl = Rails.application.secrets.api.freeze
    link = "#{apiurl}?bibkeys=#{bibkeys}&format=json&jscmd=data"
    response = HTTParty.get(link)
    [response.code, response.parsed_response]
  end
end
