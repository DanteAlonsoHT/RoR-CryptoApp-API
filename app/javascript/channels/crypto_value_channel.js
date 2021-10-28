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
*/

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

const printJSON = async () => {
  while(true){
    getPricesFromAPI();
    await sleep(5000);
  }
}

consumer.subscriptions.create("CryptoValueChannel", {
  connected() {
    // Called when the subscription is ready for use on the server
    console.log("Conectadooo")
    printJSON();
  },

  disconnected() {
    // Called when the subscription has been terminated by the server
    console.log("Desconectado")
  },

  received(data) {
    // Called when there's incoming data on the websocket for this channel
  }
});
