Vue.createApp({
  data() {
    return {
      name: "Jack",
      age: 56,
      url: "https://pics.filmaffinity.com/Crazy_Frog_Everyone_Music_Video-997244350-large.jpg",
    };
  },
  methods: {
    ageInFiveYears() {
      return this.age + 5;
    },
    favoriteNumber() {
      return Math.random();
    },
    image() {
      return this.url;
    },
  },
}).mount("#user-goal");
