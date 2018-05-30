class OC_Transpo_API
  def make_api_call(http_methods, route_number, stop_number)
    travel_info = open("https://api.octranspo1.com/v1.2/#{http_methods}?appID=#{APP_ID}&apiKey=#{APP_KEY}&routeNo=#{route_number}&stopNo=#{stop_number}").read
  end

  def split_api_response(response, key)
    if key == TIME_TO_ARRIVAL
      response.split("<Trip>")
    end
  end
end
