module HomeHelper
  ##
  # Método 'bitcoin_price' obtiene el precio de Bitcoin desde el Home Controller
  # usando la API de Messuri.
  #
  # @params { Hash } crypto_prices -> Hash con los valores de las criptomonedas
  #
  # @return { String } Valor de Bitcoin o 'loading'

  def bitcoin_price(crypto_prices = @crypto_prices)
    if (crypto_prices).is_a?(Hash)
      if (crypto_prices[:bitcoin_price].is_a? Numeric) && crypto_prices[:bitcoin_price].to_s.length < 12
        crypto_prices[:bitcoin_price]
      else
        'loading'
      end
    else
      'loading'
    end
  end

  ##
  # Método 'ethereum_price' obtiene el precio de Ethereum desde el Home Controller
  # usando la API de Messuri.
  #
  # @params { Hash } crypto_prices -> Hash con los valores de las criptomonedas
  #
  # @return { String } Valor de Ethereum o 'loading'

  def ethereum_price(crypto_prices = @crypto_prices)
    if (crypto_prices).is_a?(Hash)
      if (crypto_prices[:ethereum_price].is_a? Numeric) && crypto_prices[:ethereum_price].to_s.length < 12
        crypto_prices[:ethereum_price]
      else
        'loading'
      end
    else
      'loading'
    end
  end

  ##
  # Método 'cardano_price' obtiene el precio de Cardano desde el Home Controller
  # usando la API de Messuri.
  #
  # @params { Hash } crypto_prices -> Hash con los valores de las criptomonedas
  #
  # @return { String } Valor de Cardano o 'loading'

  def cardano_price(crypto_prices = @crypto_prices)
    if (crypto_prices).is_a?(Hash)
      if (crypto_prices[:cardano_price].is_a? Numeric) && crypto_prices[:cardano_price].to_s.length < 12
        crypto_prices[:cardano_price]
      else
        'loading'
      end
    else
      'loading'
    end
  end
end
