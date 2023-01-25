import consumer from "channels/consumer"

consumer.subscriptions.create("MessageChannel", {
  connected() {
    console.log("we are connected");
  },

  disconnected() {
    console.log("we got disconnected");
  },

  received(data) {
    console.log(`we got a message ~> ${data}`);
  }
});
