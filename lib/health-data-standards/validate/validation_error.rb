class ValidationError
  attr_accessor :message, :location, :file_name, :validator

  def initialize(params={})
    @location = params[:location]
    @message = params[:message]
    @validator = params[:validator]
    @file_name = params[:file_name]
   end
end
