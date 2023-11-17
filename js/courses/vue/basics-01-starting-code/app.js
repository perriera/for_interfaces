Vue.createApp({
  data() {
    return {
      courseGoalA: "<h4>Finish the course and learn Vue!</h4>",
      courseGoalB: "<h4>Master Vue and building amazing apps!</h4>",
      vueLink: "https:/vuejs.org",
    };
  },
  methods: {
    outputGoal() {
      const randomNumber = Math.random();
      if (randomNumber < 0.5) {
        return this.courseGoalA;
      } else {
        return this.courseGoalB;
      }
    },
  },
}).mount("#user-goal");
