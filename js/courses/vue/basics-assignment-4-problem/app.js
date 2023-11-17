const app = Vue.createApp({
  data() {
    return {
      style: "",
    };
  },
  computed: {
    user1() {
      return { active: this.user1 };
    },
    user2() {
      return { active: this.user2 };
    },
    boxCClasses() {
      return { active: this.boxCSelected };
    },
  },
  methods: {
    add(num) {
      this.result += num;
    },
  },
});

app.mount("#assignment");
