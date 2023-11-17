const app = Vue.createApp({
  data() {
    return {
      paragraph: "",
      confirmed: "",
    };
  },
  methods: {
    showAlert() {
      alert("Alert");
    },
    setParagraph(event) {
      this.paragraph = event.target.value;
    },
    confirmInput() {
      this.confirmed = this.paragraph;
    },
  },
});

app.mount("#assignment");
