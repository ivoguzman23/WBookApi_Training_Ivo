class OpenLibraryService
    def execute(bibkeys)
        apiurl = Rails.application.secrets.api.freeze
        #params = {format: 'json', jscmd: 'data'}.to_query
        link = "#{apiurl}?bibkeys=#{bibkeys}&format=json&jscmd=data"
        #puts "***********************" + link
        response = HTTParty.get(link)
        [response.code, response.parsed_response]
    end
end