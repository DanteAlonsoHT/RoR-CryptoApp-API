// Se manda a llamar al consumidor que hará la conexión con Action Cable
import consumer from "./consumer"

/*
Se crea una suscripción al canal 'CryptoValue'

@params { Object } channel -> nombre en CamelCase del canal
@return { Function } Suscripción al canal
*/
consumer.subscriptions.create({ channel: "CryptoValueChannel" })

// Se crea función para llamar un delay temporal entre cada petición HTTP
const sleep = (milliseconds) => {
  return new Promise(resolve => setTimeout(resolve, milliseconds))
}

// Función 'getPricesFromAPI' obtiene los valores de la API
//
// @return { Object } Datos provenientes de la API

const getPricesFromAPI = async () => {
  const bitcoinPrice = document.getElementById("bitcoin-price");
  const ethereumPrice = document.getElementById("ethereum-price");
  const cardanoPrice = document.getElementById("cardano-price");
  await fetch("https://data.messari.io/api/v1/assets?fields=id,slug,symbol,metrics/market_data/price_usd")
    .then(response => response.json())
    .catch(error => console.error("Error: Data was not Found", error))
    .then(data => {
        const btcPrice = data['data'][0]['metrics']['market_data']['price_usd'].toFixed(2);
        const ethPrice = data['data'][1]['metrics']['market_data']['price_usd'].toFixed(2);
        const adaPrice = data['data'][4]['metrics']['market_data']['price_usd'].toFixed(2)

        bitcoinPrice.innerText = btcPrice;
        ethereumPrice.innerText = ethPrice;
        cardanoPrice.innerText = adaPrice;

        document.getElementById("btc_price_export").value = btcPrice;
        document.getElementById("eth_price_export").value = ethPrice;
        document.getElementById("ada_price_export").value = adaPrice;;
    });
}

/* SIMULACIÓN DE DATOS PARA NO GASTAR EL LÍMITE DE PETICIONES A LA API

const getPricesFromAPI = () => {
  const btcPrice = (50500.34 + (Math.random()*1000)).toFixed(2);
  const ethPrice = (3500.55 + (Math.random()*200)).toFixed(2);
  const adaPrice = (1.15 + (Math.random()*.10)).toFixed(2);

  document.getElementById("bitcoin-price").innerText = btcPrice;
  document.getElementById("ethereum-price").innerText = ethPrice;
  document.getElementById("cardano-price").innerText = adaPrice;

  document.getElementById("btc_price_export").value = btcPrice;
  document.getElementById("eth_price_export").value = ethPrice;
  document.getElementById("ada_price_export").value = adaPrice;
}
*/

// Función 'printJSON' llama a la API y espera un delay de manera
// asíncrona, la función correra mientras se conecta alguien al
// canal 'CryptoValue'

const printJSON = async (estado) => {
  while(estado){
    getPricesFromAPI();
    await sleep(120000);
  }
}

let conexion = 0;

consumer.subscriptions.create("CryptoValueChannel", {
  connected() {
    // Called when the subscription is ready for use on the server
    //console.log("Conectado")
    conexion += 1;
    if (conexion == 1) {
      printJSON(true);
    }
  },

  disconnected() {
    // Called when the subscription has been terminated by the server
    //console.log("Desconectado")
    conexion -= 1;
    if (conexion == 0){
      printJSON(false);
    }
  },

  received(data) {
    // Called when there's incoming data on the websocket for this channel
  }
});
