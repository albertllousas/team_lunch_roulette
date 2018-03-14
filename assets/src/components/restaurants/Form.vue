<template>
    <div class="columns">

        <div class="column first-column"></div>
        <div class="column is-6">
            <div class="control autocomplete-wrapper">
                <autocomplete
                        placeholder="Please introduce a place ... "
                        url="/api/maps/places"
                        param="query"
                        anchor="name"
                        :debounce="500"
                        label="formatted_address"
                        :classes="{ input: 'input is-large input'}"
                        :onSelect="onSelectPlace"
                        :onAjaxProgress="show"
                >
                </autocomplete>

            </div>
            <div class="control " v-if="showPlaceDetails">

                <div class="has-text-centered type-restaurant-header">
                    <img v-bind:src="typeOfFoodImage" class="type-of-food" v-on:click="selectImage"/>
                </div>
                <div class="box is-feature has-text-centered is-size-4 restaurant-details">
                    <div class="box-header">
                        <h2 class="box-title app-title is-size-2 is-size-3-mobile"> {{ placeName }} </h2>
                    </div>
                    <div class="box-body">

                        <google-map
                                :center="center"
                                :zoom="16"
                                style="width: 100%; height: 300px"
                                :options="{styles: styles}"
                        >
                            <google-marker
                                    :icon="{url: '/images/location.svg', scaledSize: {width:50, height:50}}"
                                    v-for="m in markers"
                                    :position="m.position"
                                    :clickable="true"
                                    :draggable="true"
                                    @click="center=m.position"
                            >
                            </google-marker>
                        </google-map>
                        <p>
                            {{placeAddress}}
                        </p>

                    </div>

                </div>
                <div class="has-text-centered">
                    <button class="is-primary button is-large " type="submit">
                                  <span class="icon">
                                    <i class="fa fa-magic"></i>
                                  </span>
                        <span> Add restaurant</span>
                    </button>
                </div>
            </div>

        </div>
        <div class="column"></div>

        <restaurant-image-selector
                v-bind:show-when="selectImagePopUpIsShown"
                v-on:close="selectImagePopUpIsShown=false"
                v-on:select="changeImage"
        />

    </div>


</template>

<script>
  import Autocomplete from 'vue2-autocomplete-js';
  import Vue from 'vue';
  import * as VueGoogleMaps from 'vue2-google-maps';
  import mapStyles from './map_style.json';
  import RestaurantImageSelector from './RestaurantImageSelector';

  Vue.use(VueGoogleMaps, {
    load: {
      key: 'AIzaSyCsVv5H7PRRu1L1pNt5YNUji5PvNb52XUA'
    },
    // Demonstrating how we can customize the name of the components
    installComponents: false,
  });

  Vue.component('google-map', VueGoogleMaps.Map);
  Vue.component('google-marker', VueGoogleMaps.Marker);

  export default {

    components: {
      RestaurantImageSelector,
      Autocomplete
    },

    data () {
      return {
        selectImagePopUpIsShown: false,
        showPlaceDetails: false,
        placeName: '',
        center: {
          lat: 10.0,
          lng: 10.0
        },
        markers: [{
          position: {
            lat: 10.0,
            lng: 10.0
          }
        }],
        styles: mapStyles,
        typeOfFoodImage: './images/store.svg'
      };
    },
    methods: {
      changeImage (image) {
        this.typeOfFoodImage = image;
        this.selectImagePopUpIsShown = false;
      },
      selectImage () {
        this.selectImagePopUpIsShown = true;
      },

      onSelectPlace (value) {
        console.log(value.geometry.location.lat);
        this.placeName = value.name;
        this.placeAddress = value.formatted_address;
        this.center = {
          lat: value.geometry.location.lat,
          lng: value.geometry.location.lng
        };
        this.markers = [{
          position: {
            lat: value.geometry.location.lat,
            lng: value.geometry.location.lng
          }
        }];
        this.showPlaceDetails = true;
      }
    }
  };
</script>

<style lang="scss">
    @import "../../assets/vars";
    @import "../../../node_modules/vue2-autocomplete-js/dist/style/vue2-autocomplete.css";

    body > div.modal.align-baseline.is-active > div.modal-card {
        font-family: Bariol;
    }

    .type-restaurant-header {
        margin-top: -100px;
        top: 100px;
        position: relative;
        z-index: 1;
        padding-bottom: 20px;
    }

    .type-of-food {
        cursor: pointer;
        width: 120px;
        transition: all .2s ease-in-out;
    }

    .type-of-food:hover {
        transform: scale(1.1);
    }

    .autocomplete-wrapper {
        z-index: 4;
    }

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
        color: #0AAFC4;
        font-size: 20px;

    }

    .autocomplete ul li a:hover, .autocomplete ul li.focus-list a {
        color: #0AAFC4;
        background: #f2f2f2;
    }

    .autocomplete ul li a:hover .autocomplete-anchor-label, .autocomplete ul li.focus-list a span, .autocomplete ul li a:hover .autocomplete-anchor-label, .autocomplete ul li.focus-list a span {
        color: grey;
    }

    .box {

        border-radius: 6px;
        background-color: white;
        margin-left: 0px;
        margin-right: 0px;
        padding: 2rem;
        color: #666;
        transform: translate3d(0, 0, 0);
        transition: 300ms;
    }

    .restaurant-details {
        box-shadow: 5px 8px 20px 0 rgba(219, 219, 219, 0.5);
        margin-top: 30px;
        padding: 0px;
    }

    .restaurant-details p {
        padding: 5px;
    }

    .box-header {
        padding-left: 10px;
        padding-right: 10px;
    }

    .box-title {
        padding-top: 50px;
    }

    select.select-restaurant {
        border: 0;
        color: #666;
        font-size: 15px;
    }

    /*.control.has-icon:not(.has-icon-right) .input.is-large {*/
    /*padding-left: 10px;*/
    /*}*/
</style>
