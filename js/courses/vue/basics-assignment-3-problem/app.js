const app = Vue.createApp({
  data() {
    return {
      result: 0,
    };
  },
  computed: {
    status() {
      if (this.result < 37) {
        return "Not there yet";
      } else {
        if (this.result > 37) {
          return "Too much";
        } else return this.result;
      }
    },
  },
  watch: {
    result(value) {
      if (value > 0) {
        const that = this;
        setTimeout(function () {
          that.result = 0;
        }, 5000);
      }
    },
  },
  methods: {
    add(num) {
      this.result += num;
    },
  },
});

app.mount("#assignment");
