module HomeHelper
    def bitcoin_price
        @crypto_prices ? @crypto_prices[:bitcoin_price] : "loading"
    end

    def ethereum_price
        @crypto_prices ? @crypto_prices[:ethereum_price] : "loading"
    end

    def cardano_price
        @crypto_prices ? @crypto_prices[:cardano_price] : "loading"
    end
end
