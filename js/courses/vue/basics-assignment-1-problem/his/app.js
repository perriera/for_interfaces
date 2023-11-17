Vue.createApp({
  data() {
    return {
      name: "Maximilian",
      age: 31,
      imageUrl:
        "https://pics.filmaffinity.com/Crazy_Frog_Everyone_Music_Video-997244350-large.jpg",
    };
  },
  methods: {
    calculateAge() {
      return this.age + 5;
    },
    calculateRandom() {
      return Math.random();
    },
    image() {
      return this.imageUrl;
    },
  },
}).mount("#assignment");
