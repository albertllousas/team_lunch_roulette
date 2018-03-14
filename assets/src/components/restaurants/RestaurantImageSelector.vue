<template>
    <modal title="Select an image" :backdrop="false" :show-ok="false" :is-show="showWhen" @close="handleClose">
        <p class="has-text-centered">
            <img v-on:click="selectImage($event)" src="../../assets/img/food-and-drink/svg/hamburguer.svg" class="food-type-selection" width="110"/>
            <img v-on:click="selectImage($event)" src="../../assets/img/food-and-drink/svg/salad.svg" class="food-type-selection" width="110"/>
            <img v-on:click="selectImage($event)" src="../../assets/img/food-and-drink/svg/sangria.svg" class="food-type-selection" width="110"/>
            <img v-on:click="selectImage($event)" src="../../assets/img/food-and-drink/svg/meatballs.svg" class="food-type-selection" width="110"/>
            <img v-on:click="selectImage($event)" src="../../assets/img/food-and-drink/svg/chicken.svg" class="food-type-selection" width="110"/>
            <img v-on:click="selectImage($event)" src="../../assets/img/food-and-drink/svg/dumpling.svg" class="food-type-selection" width="110"/>
            <img v-on:click="selectImage($event)" src="../../assets/img/food-and-drink/svg/egg.svg" class="food-type-selection" width="110"/>
            <img v-on:click="selectImage($event)" src="images/food-and-drink/svg/sushi.svg" class="food-type-selection" width="110"/>
            <img v-on:click="selectImage($event)" src="../../assets/img/food-and-drink/svg/taco.svg" class="food-type-selection" width="110"/>
            <img v-on:click="selectImage($event)" src="../../assets/img/food-and-drink/svg/hot-dog.svg" class="food-type-selection" width="110"/>
            <img v-on:click="selectImage($event)" src="../../assets/img/food-and-drink/svg/steak.svg" class="food-type-selection" width="110"/>
            <img v-on:click="selectImage($event)" src="../../assets/img/food-and-drink/svg/spaguetti.svg" class="food-type-selection" width="110"/>
            <img v-on:click="selectImage($event)" src="../../assets/img/food-and-drink/svg/rice.svg" class="food-type-selection" width="110"/>
            <img v-on:click="selectImage($event)" src="../../assets/img/food-and-drink/svg/ribs.svg" class="food-type-selection" width="110"/>
            <img v-on:click="selectImage($event)" src="../../assets/img/food-and-drink/svg/fries.svg" class="food-type-selection" width="110"/>
            <img v-on:click="selectImage($event)" src="../../assets/img/food-and-drink/svg/pizza.svg" class="food-type-selection" width="110"/>
            <img v-on:click="selectImage($event)" src="../../assets/img/restaurant/svg/spicy-food.svg" class="food-type-selection" width="110"/>
            <img v-on:click="selectImage($event)" src="../../assets/img/restaurant/svg/take-away.svg" class="food-type-selection" width="110"/>
            <img v-on:click="selectImage($event)" src="../../assets/img/restaurant/svg/restaurant-1.svg" class="food-type-selection" width="110"/>
        </p>
    </modal>
</template>

<script>
  export default {
    props: {
      showWhen: Boolean
    },
    methods: {
      handleClose() {
        this.$emit('close');
      },
      selectImage(event) {
        let imagePath = event.currentTarget.getAttribute('src');
        this.$emit('select', imagePath);
      },

    }
  };
</script>

<style lang="scss">

    .food-type-selection {
        cursor: pointer;
        width: 90px;
        transition: all .2s ease-in-out;
        margin: 13px;
    }

    .food-type-selection:hover {
        transform: scale(1.1);
    }
</style>
