module HomeHelper
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
