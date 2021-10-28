require 'rails_helper'

RSpec.describe HomeHelper, type: :helper do
  let(:crypto_prices_booleanos) { { bitcoin_price: true, ethereum_price: false, cardano_price: true } }
  let(:crypto_prices_array) { { bitcoin_price: [], ethereum_price: [1, 2], cardano_price: [5] } }
  let(:crypto_prices_strings) { { bitcoin_price: '50500.00', ethereum_price: '3500.00', cardano_price: '1.20' } }
  let(:crypto_prices) { { bitcoin_price: 50_500.54, ethereum_price: 3500.45, cardano_price: 1.25 } }

  describe "Comprobando la validación de datos en el método 'bitcoin_price':" do
    it 'Valor nil no deseado, valor de bitcoin no retornado.' do
      expect(bitcoin_price).to_not eq(crypto_prices[:bitcoin_price])
    end

    it "Valor nil no retornado, 'loading' es retornado en su lugar." do
      expect(bitcoin_price).to eq('loading')
    end

    it 'Valor booleano no deseado, valor de bitcoin no retornado.' do
      expect(bitcoin_price(crypto_prices_booleanos)).to_not eq(crypto_prices_booleanos[:bitcoin_price])
    end

    it "Valor booleano no retornado, 'loading' es retornado en su lugar." do
      expect(bitcoin_price(crypto_prices_booleanos)).to eq('loading')
    end

    it 'Valor cadena de texto no deseado, valor de bitcoin no retornado.' do
      expect(bitcoin_price(crypto_prices_strings)).to_not eq(crypto_prices_strings[:bitcoin_price])
    end

    it "Valor cadena de texto no retornado, 'loading' es retornado en su lugar." do
      expect(bitcoin_price(crypto_prices_strings)).to eq('loading')
    end

    it 'Valor array no deseado, valor de bitcoin no retornado.' do
      expect(bitcoin_price(crypto_prices_array)).to_not eq(crypto_prices_array[:bitcoin_price])
    end

    it "Valor array no retornado, 'loading' es retornado en su lugar." do
      expect(bitcoin_price(crypto_prices_array)).to eq('loading')
    end

    it 'Valor numérico deseado, valor de bitcoin sí retornado.' do
      expect(bitcoin_price(crypto_prices)).to eq(crypto_prices[:bitcoin_price])
    end

    it "Valor numérico retornado, 'loading' no retornado." do
      expect(bitcoin_price(crypto_prices)).to_not eq('loading')
    end
  end

  describe "Comprobando la validación de datos en el método 'ethereum_price':" do
    it 'Valor nil no deseado, valor de ethereum no retornado.' do
      expect(ethereum_price).to_not eq(crypto_prices[:ethereum_price])
    end

    it "Valor nil no retornado, 'loading' es retornado en su lugar." do
      expect(ethereum_price).to eq('loading')
    end

    it 'Valor booleano no deseado, valor de ethereum no retornado.' do
      expect(ethereum_price(crypto_prices_booleanos)).to_not eq(crypto_prices_booleanos[:ethereum_price])
    end

    it "Valor booleano no retornado, 'loading' es retornado en su lugar." do
      expect(ethereum_price(crypto_prices_booleanos)).to eq('loading')
    end

    it 'Valor cadena de texto no deseado, valor de ethereum no retornado.' do
      expect(ethereum_price(crypto_prices_strings)).to_not eq(crypto_prices_strings[:ethereum_price])
    end

    it "Valor cadena de texto no retornado, 'loading' es retornado en su lugar." do
      expect(ethereum_price(crypto_prices_strings)).to eq('loading')
    end

    it 'Valor array no deseado, valor de ethereum no retornado.' do
      expect(ethereum_price(crypto_prices_array)).to_not eq(crypto_prices_array[:ethereum_price])
    end

    it "Valor array no retornado, 'loading' es retornado en su lugar." do
      expect(ethereum_price(crypto_prices_array)).to eq('loading')
    end

    it 'Valor numérico deseado, valor de ethereum sí retornado.' do
      expect(ethereum_price(crypto_prices)).to eq(crypto_prices[:ethereum_price])
    end

    it "Valor numérico retornado, 'loading' no retornado." do
      expect(ethereum_price(crypto_prices)).to_not eq('loading')
    end
  end

  describe "Comprobando la validación de datos en el método 'cardano_price':" do
    it 'Valor nil no deseado, valor de bitcoin no retornado.' do
      expect(cardano_price).to_not eq(crypto_prices[:cardano_price])
    end

    it "Valor nil no retornado, 'loading' es retornado en su lugar." do
      expect(cardano_price).to eq('loading')
    end

    it 'Valor booleano no deseado, valor de bitcoin no retornado.' do
      expect(cardano_price(crypto_prices_booleanos)).to_not eq(crypto_prices_booleanos[:cardano_price])
    end

    it "Valor booleano no retornado, 'loading' es retornado en su lugar." do
      expect(cardano_price(crypto_prices_booleanos)).to eq('loading')
    end

    it 'Valor cadena de texto no deseado, valor de bitcoin no retornado.' do
      expect(cardano_price(crypto_prices_strings)).to_not eq(crypto_prices_strings[:cardano_price])
    end

    it "Valor cadena de texto no retornado, 'loading' es retornado en su lugar." do
      expect(cardano_price(crypto_prices_strings)).to eq('loading')
    end

    it 'Valor array no deseado, valor de bitcoin no retornado.' do
      expect(cardano_price(crypto_prices_array)).to_not eq(crypto_prices_array[:cardano_price])
    end

    it "Valor array no retornado, 'loading' es retornado en su lugar." do
      expect(cardano_price(crypto_prices_array)).to eq('loading')
    end

    it 'Valor numérico deseado, valor de bitcoin sí retornado.' do
      expect(cardano_price(crypto_prices)).to eq(crypto_prices[:cardano_price])
    end

    it "Valor numérico retornado, 'loading' no retornado." do
      expect(cardano_price(crypto_prices)).to_not eq('loading')
    end
  end
end
