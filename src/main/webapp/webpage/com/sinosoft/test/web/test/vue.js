new Vue({
  el: '#app',
  data:{
    counter: 0
  },
  methods:{
    reset(){
      this.counter = 0;
    }
  },
  created(){
	  alert(1);
	  setInterval(()=>this.counter++,1000);
  }
});
