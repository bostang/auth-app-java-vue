// src/main.js

import { createApp } from 'vue' // This imports the createApp function
import App from './App.vue'     // This imports your root App component
import router from './router'   // This imports the router instance you created

// Create the Vue application instance
const app = createApp(App)

// *** IMPORTANT: Tell Vue to use the router instance ***
app.use(router)

// Mount the application to the DOM element with id 'app'
app.mount('#app')