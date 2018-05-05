json.extract! user, :id, :country, :currency, :country_code, :currency_code, :created_at, :updated_at
json.url user_url(user, format: :json)
