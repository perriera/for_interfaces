Vue.createApp({
    data() {
      return {
        name: 'vuejs: gs-01-migrated-project',
        enteredValue: ''
      };
    },
    methods: {
      addGoal() {
        this.name = this.enteredValue;
        this.enteredValue = '';
      }
    }
  }).mount('#app');
  
  // const buttonEl = document.querySelector('button');
  // const inputEl = document.querySelector('input');
  // const listEl = document.querySelector('ul');
  
  // function addGoal() {
  //   const enteredValue = inputEl.value;
  //   const listItemEl = document.createElement('li');
  //   listItemEl.textContent = enteredValue;
  //   listEl.appendChild(listItemEl);
  //   inputEl.value = '';
  // }
  
  // buttonEl.addEventListener('click', addGoal);