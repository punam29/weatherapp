class HomeController < ApplicationController
  def index

    require "net/http"

    @url="https://www.airnowapi.org/aq/observation/zipCode/current/?format=application/json&zipCode=20001&distance=30&API_KEY=E2BDE2A9-B6E8-4B75-8219-5CA31048834D"
    @uri=URI(@url)
    @response=Net::HTTP.get(@uri)
    @output=JSON.parse(@response)

    if @output.empty?
      @final_output="Invalid Pincode"
      @area="Invalid Area"
      @color="gray"
      @final="Invalid"
    else
      @final_output=@output[1]['AQI']
      @area=@output[1]['ReportingArea']
      if @final_output < 50
         @color="green"
         @final="Good"
      elsif @final_output < 100  
        @color="yellow"
        @final="Moderate"
      elsif @final_output < 200
        @color="blue"
        @final="Poor"
      else
        @color="red" 
        @final="Unhealthy" 
          
      end
    end   
    
      





  end
end
