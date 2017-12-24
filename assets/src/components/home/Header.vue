<template>

    <header class="header has-text-centered ">
        <div class="app-title is-size-1 is-size-3-mobile">Team lunch roulette</div>
        <div class="app-subtitle is-size-1 is-size-4-mobile">
            Helping teams to make the most
            <br/>
            difficult decision every day ...

        </div>
        <div>
            <img v-bind:src="'./images/food-and-drink/svg/' + food + '.svg'" width="150px"
                 class="is-hidden-mobile"/>
            <img v-bind:src="'./images/food-and-drink/svg/' + food + '.svg'" width="100px"
                 class="is-hidden-tablet"/>
        </div>
    </header>
</template>

<script>
  const food = ['pizza', 'hamburguer', 'sushi', 'egg', 'crepe', 'fries', 'meatballs',
    'pork', 'ribs', 'taco', 'spaguetti', 'salad', 'soup', 'chicken','fish','hot-dog',
    'skewer','rice','fish','dumpling'];

  export default {

    data () {
      return {
        food: 'pizza'
      };
    },
    methods: {
      changeFood: function () {
        let v = this;
        setInterval(() => {
          let newFood;
          do {
            newFood = food[Math.floor(Math.random() * food.length)];
          } while (newFood === v.food);
          v.food = newFood;
        }, 1200)
      }
    },
    mounted: function () {
      this.changeFood();
    }
  };
</script>

<style lang="scss">
    @import "../../assets/vars";
</style>
