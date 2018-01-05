<template>
    <div class="columns">

        <div class="column first-column"></div>
        <div class="column is-6">

            <form id="team-form" @submit.prevent="validateBeforeSubmit">
                <p class="control has-icon ">
                    <input
                            name="team"
                            type="text"
                            v-model="team"
                            v-validate="'required'"
                            class="input is-large"
                            placeholder="Team name"
                            :class="{'input': true, 'is-danger': errors.has('team') }"
                    />
                    <i class="fa fa-soccer-ball-o"></i>
                    <span v-show="errors.has('team')" class="help is-danger">{{ errors.first('team') }}</span>
                </p>
                <p class="control has-icon">
                    <input
                            name="company"
                            type="text"
                            v-model="company"
                            v-validate="'required'"
                            class="input is-large"
                            placeholder="Company"
                            :class="{'input': true, 'is-danger': errors.has('company') }"
                    />
                    <i class="fa fa-building-o"></i>
                    <span v-show="errors.has('company')" class="help is-danger">{{ errors.first('company') }}</span>
                </p>
                <p class="control">
                    <textarea
                            name="address"
                            v-model="address"
                            v-validate="'required'"
                            class="textarea is-large"
                            placeholder="Address"
                            rows="2"
                            :class="{'input': true, 'is-danger': errors.has('address') }"
                    ></textarea>
                    <span v-show="errors.has('address')" class="help is-danger">{{ errors.first('address') }}</span>
                </p>
                <div class="has-text-centered">
                    <button class="is-primary button is-large " type="submit" :class="{'is-loading': isLoading}">
                                  <span class="icon">
                                    <i class="fa fa-magic"></i>
                                  </span>
                        <span> Generate</span>
                    </button>
                </div>
            </form>
        </div>
        <div class="column"></div>
    </div>
</template>

<script>
  import Vue from 'vue';
  import VeeValidate from 'vee-validate';
  import { Team, saveTeam } from '../../domain/teams';

  Vue.use(VeeValidate);

  export default {
    data () {
      return {
        team: '',
        company: '',
        address: '',
        isLoading: false
      };
    },
    methods: {
      validateBeforeSubmit () {
        this.$validator.validateAll().then((valid) => {
          if (valid) {
            this.isLoading = true;
            saveTeam(new Team(this.team, this.company, this.address))
              .then((team) => console.log(team)/*here router.push team/{id}/suggested-restaurant if 0 in next redirect to create-restaurant*/)
              .catch(this.processErrorCreatingTeam);
          }
        });
      },
      processErrorCreatingTeam (error) {
        this.isLoading = false;
        this.$modal.alert(
          {
            title: 'Error',
            content: 'It was impossible create your team, some error happened during the request, please try again'
          }
        );
      }
    }
  };
</script>

<style lang="scss">
    @import "../../assets/vars";

    #team-form .button.is-loading:after {
        margin-top: 1px;
    }
</style>
