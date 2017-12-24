<template>

    <div id="app">
        <nav-bar/>
        <section class="section main-section">
            <home-header/>
            <home-form/>
        </section>

        <div class="footer">
            <div class="container">
                <div class="content has-text-centered ">
                    <p>
                        Vectors&nbsp;graphics designed by <a title="Freepik" href="http://www.freepik.com">Freepik</a>
                        from <a title="Flaticon" href="http://www.flaticon.com">www.flaticon.com</a>
                    </p>
                </div>
            </div>
        </div>

    </div>

</template>

<script>
  import NavBar from './components/common/NavBar.vue';
  import HomeHeader from './components/home/Header.vue';
  import HomeForm from './components/home/Form.vue';

  export default {
    name: 'app',
    components: {
      HomeHeader, HomeForm, NavBar
    }
  };
</script>

<style lang="scss">
    @import "assets/vars";

    @font-face {
        font-family: Bariol;
        src: url('assets/fonts/bariol_regular-webfont.woff2');
    }

    #app .section {
        padding: 1em;

    }

    @media screen and (min-height: 768px) {
        #app .first-column {
            padding-bottom: 0px;
        }
    }

    html {
        background-color: white;
    }

    .content a:not(.button):visited {
        color: #E8980C;
    }

    .content a:not(.button) {
        border-bottom: 0px;
    }

    .app-title, a.navbar-title {
        color: #f28b90;
        font-weight: bold;
    }

    .app-subtitle {
        color: #666;
    }

    #app .control {
        margin-bottom: 15px;
    }

    .is-primary {
        background-color: #0AAFC4 !important;

    }

    input, textarea {
        opacity: 0.9;
        font-family: Bariol;
    }

    #app {
        font-family: Bariol, -apple-system, BlinkMacSystemFont, "Segoe UI", "Roboto", "Oxygen", "Ubuntu", "Cantarell", "Fira Sans", "Droid Sans", "Helvetica Neue", "Helvetica", "Arial", sans-serif;
    }

    #app .footer {
        background-color: transparent;
        padding: 140px 10px 60px;
    }

</style>
