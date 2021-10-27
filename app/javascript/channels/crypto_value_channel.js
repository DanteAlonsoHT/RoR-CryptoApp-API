import consumer from "./consumer"

consumer.subscriptions.create({ channel: "CryptoValue" })

const sleep = (milliseconds) => {
  return new Promise(resolve => setTimeout(resolve, milliseconds))
}
/*
const getPricesFromAPI = async () => {
  const bitcoinPrice = document.getElementById("bitcoin-price");
  const ethereumPrice = document.getElementById("ethereum-price");
  const cardanoPrice = document.getElementById("cardano-price");
  await fetch("https://data.messari.io/api/v1/assets?fields=id,slug,symbol,metrics/market_data/price_usd")
    .then(response => response.json())
    .catch(error => console.error("Error: Data was not Found", error))
    .then(data => {
        bitcoinPrice.innerText = data['data'][0]['metrics']['market_data']['price_usd'].toFixed(2);
        ethereumPrice.innerText = data['data'][1]['metrics']['market_data']['price_usd'].toFixed(2);
        cardanoPrice.innerText = data['data'][4]['metrics']['market_data']['price_usd'].toFixed(2);
    });
}

const printJSON = async () => {
  while(true){
    getPricesFromAPI();
    await sleep(5000);
  }
}

printJSON();
*/
consumer.subscriptions.create("CryptoValueChannel", {
  connected() {
    // Called when the subscription is ready for use on the server
    console.log("Conectadooo")
  },

  disconnected() {
    // Called when the subscription has been terminated by the server
    console.log("Desconectado")
  },

  received(data) {
    // Called when there's incoming data on the websocket for this channel
  }
});
