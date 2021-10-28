##
# Libreria time es requerida a dar formato al nombre de los archivos a exportar.

require 'time'

class HomeController < ApplicationController
  ##
  # Método 'index' contiene variable @crypto_prices para almacenar un hash con los precios
  # de las criptomonedas (BTC, ETH, ADA).
  #
  # @return { Hash } Precios de las criptomonedas al momento.

  def index
    @crypto_prices = read_data_from_api
  end

  ##
  # Método 'export' contiene la lógica para exportar archivos en formato (xls, csv, json)
  # usando métodos privados.

  def export
    puts "PARAMS: #{params}"

    ##
    # En caso de no incluir el valor 'Exportar' en el parámetro 'commit', la función no
    # continuará, en caso de incluirlo, entonces las demás funciones continuarán.

    return unless params[:commit].include? 'Exportar'

    btc_price = params['btc_price_export']
    eth_price = params['eth_price_export']
    ada_price = params['ada_price_export']
    crypto_prices = { btc_price: btc_price, eth_price: eth_price, ada_price: ada_price }

    ##
    # De acuerdo a los 3 posibles valores del parámtro 'commit' se usarán las funciones
    # para crear archivo csv, xls o json.

    case params[:commit]
    when 'Exportar EXCEL'
      csv_file = make_content("\t", crypto_prices)
      export_file(csv_file, 'xls')
    when 'Exportar CSV'
      csv_file = make_content(',', crypto_prices)
      export_file(csv_file, 'csv')
    when 'Exportar JSON'
      csv_file = make_content_json(crypto_prices)
      export_file(csv_file, 'json')
    end
  end

  ##
  # Comienzan los métodos privados, métodos ocultos.

  private

  ##
  # Método 'read_data_from_api' retorna los datos de interés usando Messari API y las gemas
  # 'rest-client' & 'json'.

  def read_data_from_api
    # url_crypto_values = 'https://data.messari.io/api/v1/assets?fields=id,slug,symbol,metrics/market_data/price_usd'

    ##
    # Clase RestClient usa método get y el único parámetro es una URL
    #
    # @param { String } URL -> Es la URL usada por el método HTTP

    # response = RestClient.get url_crypto_values

    ##
    # Clase JSON usa método parse y el único parámetro es una respuesta HTTP
    # en formato String.
    #
    # @param { String } respuestHTTP -> Se le pasará traducirá de JSON a Hash.

    # result = JSON.parse response.to_s

    bitcoin_price = 30_000 # result['data'][0]['metrics']['market_data']['price_usd'].round(2)
    ethereum_price = 2000 # result['data'][1]['metrics']['market_data']['price_usd'].round(2)
    cardano_price = 100 # result['data'][4]['metrics']['market_data']['price_usd'].round(2)

    { bitcoin_price: bitcoin_price, ethereum_price: ethereum_price, cardano_price: cardano_price }
  end

  ##
  # Método 'export_file' descarga un archivo en la computadora local de un usuario.
  #
  # @param { String } file -> El contenido del archivo a exportar.
  # @param { String } formato -> El tipo de formato a exportar.
  #
  # @return { Function } -> Descargar un archivo [De la tabla de precios de criptomonedas]

  def export_file(file, formato)
    time_now = Time.now
    segundos = time_now.strftime('%s')[0..1]

    ##
    # Variable 'time_now' usa método adicional 'strftime' para dar formato a la fecha
    # retornada por Time.now
    #
    # @param { String } formato -> El orden y el contenido del formato.
    # [ %H -> Hora, %M -> Minutos, %s -> Segundos, %d -> Día, %h -> Mes, %Y -> Año ]
    #
    # @return { String } Fecha con formato, ejemplo: "12_45_55_28-oct-2021_UTC-0"

    time_now_formated = time_now.strftime("%H_%M_#{segundos}_%d-%h-%Y_UTC-0")

    ##
    # Método 'send_data' descarga archivos al usuario.
    #
    # @param { String } file -> Contenido a exportar.
    # @param { String } type -> Tipo de Archivo.
    # @param { String } disposition -> Adjuntar contenido a un archivo generado.
    # @param { String } filename -> Nombre de Archivo.
    #
    # @return { Function } Descarga un archivo

    send_data(file,
              type: "text/#{formato}", disposition: 'attachment',
              filename: "crypto_prices_#{time_now_formated}.#{formato}")
  end

  ##
  # Método 'make_file' genera contenido para archivos xls o csv.
  #
  # @param { String } symbol -> Símbolo para separar los datos.
  # @param { Hash } crypto_prices -> Hash con los valores de criptomonedas.
  # @return { String } Contenido del archivo.

  def make_content(symbol, crypto_prices)
    "##{symbol}ASSET#{symbol}PRICE(USD)
    1#{symbol}Bitcoin - BTC#{symbol}#{crypto_prices[:btc_price]}
    2#{symbol}Ethereum - ETH#{symbol}#{crypto_prices[:eth_price]}
    3#{symbol}Cardano - ADA#{symbol}#{crypto_prices[:ada_price]}"
  end

  ##
  # Método 'make_content_json' genera contenido para archivos json.
  #
  # @param { Hash } crypto_prices -> Hash con los valores de criptomonedas.
  # @return { String } Contenido del archivo.

  def make_content_json(crypto_prices)
    '{"data":
    [
      {
        "#":1,
        "ASSET":"Bitcoin - BTC",
        "PRICE(USD)":' + (crypto_prices[:btc_price]).to_s + '
      },
      {
        "#":2,
        "ASSET":"Ethereum - ETH",
        "RICE(USD)":' + (crypto_prices[:eth_price]).to_s + '
      },
      {
        "#":3,
        "ASSET":"Cardano - ADA",
        "PRICE(USD)":' + (crypto_prices[:ada_price]).to_s + '
      }
    ]
  }'
  end
end
