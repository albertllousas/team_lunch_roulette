<template>
    <nav class="navbar">
        <div class="navbar-brand">
            <a class="navbar-item navbar-title" href="/" v-if="$route.path!=='/'">
            Team lunch Roulette
            </a>

            <!-- add this code in vue -->
            <div class="navbar-burger burger" onclick="document.querySelector('.navbar-menu').classList.toggle('is-active');document.querySelector('.navbar-burger').classList.toggle('is-active');">
                <span></span>
                <span></span>
                <span></span>
            </div>
        </div>

        <div  class="navbar-menu">
            <div class="navbar-end">
                <div class="navbar-item">
                    <a class="bd-tw-button button" target="_blank" href="/">
                      <span class="icon">
                        <i class="fa fa-github"></i>
                      </span>
                        <span>
                        Github
                      </span>
                    </a>
                </div>

            </div>
        </div>
    </nav>
</template>

<script>
  export default {

  };
</script>

<style lang="scss">
    @import "../../assets/vars";
</style>
