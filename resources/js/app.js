require('bootstrap');
import { BootstrapVue, IconsPlugin } from 'bootstrap-vue'

window.Vue = require('vue');

Vue.use(BootstrapVue)
Vue.use(IconsPlugin)
Vue.component('item-page', require('./components/Items/ItemPage.vue').default);

const app = new Vue({
    el: '#app',
});
