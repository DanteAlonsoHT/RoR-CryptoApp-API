class HomeController < ApplicationController
  def index
    @crypto_prices = get_data_from_api
  end

  private

  def get_data_from_api
    #url_crypto_values = "https://data.messari.io/api/v1/assets?fields=id,slug,symbol,metrics/market_data/price_usd"
    #response = RestClient.get url_crypto_values
    #result = JSON.parse response.to_s

    bitcoin_price = 30000#result['data'][0]['metrics']['market_data']['price_usd'].round(2)
    ethereum_price = 2000#result['data'][1]['metrics']['market_data']['price_usd'].round(2)
    cardano_price = 100#result['data'][4]['metrics']['market_data']['price_usd'].round(2)

    result = { "bitcoin_price": bitcoin_price, "ethereum_price": ethereum_price, "cardano_price": cardano_price }
    puts result
    result
  end
end
