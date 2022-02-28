class GardenFacade

  def find_user_by_email(email)
    response = service.get_email(email)
    if response[:message].present?
      nil
    else
      User.new(response[:data])
    end
  end

  def create_user(email, name)
    User.new(service.create_user(email, name)[:data])
  end

  def frost_dates(id)
    service.get_frost_dates(id).map { |data| FrostDate.new(data) }
  end

  def forecast(id)
    service.get_forecast(id)[:daily].map { |data| Forecast.new(data) }
  end

  def find_user(id)
    User.new(service.get_user(id)[:data])
  end

  def service
    GardenService.new
  end
end
