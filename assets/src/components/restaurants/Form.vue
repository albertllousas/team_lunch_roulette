<template>
    <div class="columns">

        <div class="column first-column"></div>
        <div class="column is-6">
            <p class="control ">
                <autocomplete
                        url="/api/maps/places"
                        param="query"
                        anchor="name"
                        :debounce="500"
                        label="formatted_address"
                        :classes="{ input: 'input is-large input'}"
                >
                </autocomplete>
            </p>


            <!--<form id="restaurant-form" @submit.prevent="validateBeforeSubmit">-->
            <!--<p class="control has-icon ">-->
            <!--<input-->
            <!--name="restaurant"-->
            <!--type="text"-->
            <!--v-model="restaurant"-->
            <!--class="input is-large"-->
            <!--placeholder="Name, City, Street, number, country"-->
            <!--/>-->
            <!--&lt;!&ndash;<i class="fa fa-soccer-ball-o"></i>&ndash;&gt;-->
            <!--</p>-->
            <!--<div class="has-text-centered">-->
            <!--<button class="is-primary button is-large " type="submit" :class="{'is-loading': isLoading}">-->
            <!--<span class="icon">-->
            <!--<i class="fa fa-magic"></i>-->
            <!--</span>-->
            <!--<span> Generate</span>-->
            <!--</button>-->
            <!--</div>-->
            <!--</form>-->
        </div>
        <div class="column"></div>
    </div>
</template>

<script>
  import Autocomplete from 'vue2-autocomplete-js';

  export default {

    components: {Autocomplete},

    methods: {
      getData (value) {
        console.log(value);
      }
    }
  };
</script>

<style lang="scss">
    @import "../../assets/vars";
    @import "../../../node_modules/vue2-autocomplete-js/dist/style/vue2-autocomplete.css";

    .autocomplete ul {
        width: 100%;
        font-family: inherit;

        background-color: white;
        border-radius: 6px;
        box-shadow: 0 2px 3px rgba(10, 10, 10, 0.1), 0 0 0 1px rgba(10, 10, 10, 0.1);
        padding-bottom: 0.5rem;
        padding-top: 0.5rem;
    }

    .autocomplete ul:before {
        border: 0px solid transparent;
    }

    .autocomplete ul li a {
        background-color: transparent;
        /*color: #00d1b2;*/
        color:#0AAFC4;
        font-size: 20px;
    }

    .autocomplete ul li a:hover, .autocomplete ul li.focus-list a {
        color: #0AAFC4;
        background: #f2f2f2;
    }

    .autocomplete ul li a:hover .autocomplete-anchor-label, .autocomplete ul li.focus-list a span, .autocomplete ul li a:hover .autocomplete-anchor-label, .autocomplete ul li.focus-list a span {
        color: grey;
    }

    /*.control.has-icon:not(.has-icon-right) .input.is-large {*/
    /*padding-left: 10px;*/
    /*}*/
</style>
