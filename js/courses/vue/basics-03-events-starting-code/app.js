const app = Vue.createApp({
  data() {
    return {
      counter: 0,
      name: "",
      lastName: "",
      // fullname: "",
    };
  },
  watch: {
    counter(value) {
      if (value > 50) {
        const that = this;
        setTimeout(function () {
          that.counter = 0;
        }, 2000);
      }
    },
    // name(newValue, oldValue) {
    //   console.log("Running again ... ");
    //   if (newValue == "") {
    //     this.fullname = "";
    //   } else {
    //     this.fullname = newValue + " " + this.lastName;
    //   }
    // },
    // lastName(newValue, oldValue) {
    //   console.log("Running again ... ");
    //   if (newValue == "") {
    //     this.fullname = "";
    //   } else {
    //     this.fullname = this.name + " " + newValue;
    //   }
    // },
  },
  computed: {
    // don't use a computed property
    // and a data name at the same time
    fullname() {
      console.log("Running again ... ");
      return this.name + " " + this.lastName;
    },
  },
  methods: {
    outputFullname() {
      console.log("Running again ... ");
      if (this.name === "") {
        return "";
      }
      return this.name + " " + "Anderson";
    },
    setName(event) {
      this.name = event.target.value;
    },
    resetInput() {
      this.name = "";
      this.lastName = "";
    },
    add(num) {
      this.counter += num;
    },
    reduce(event, num) {
      // overrides the standard right-click popup menu
      event.preventDefault();
      this.counter -= num;
    },
  },
});

app.mount("#events");
