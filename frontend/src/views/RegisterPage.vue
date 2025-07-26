<template>
  <div class="auth-container">
    <h2>Register</h2>
    <form @submit.prevent="register">
      <div class="form-group">
        <label for="username">Username:</label>
        <input type="text" id="username" v-model="username" required />
      </div>
      <div class="form-group">
        <label for="password">Password:</label>
        <input type="password" id="password" v-model="password" required />
      </div>
      <button type="submit">Register</button>
    </form>
    <p v-if="message" :class="{ 'success': isSuccess, 'error': !isSuccess }">{{ message }}</p>
    <p>Already have an account? <router-link to="/login">Login here</router-link></p>
    <p><router-link to="/" class="back-to-home">Back to Home</router-link></p>
  </div>
</template>

<script>
import axios from 'axios';

export default {
  name: 'RegisterPage',
  data() {
    return {
      username: '',
      password: '',
      message: '',
      isSuccess: false
    };
  },
  methods: {
    async register() {
      try {
        const response = await axios.post(`${process.env.VUE_APP_API_BASE_URL}/auth/register`, {
          username: this.username,
          password: this.password
        });
        this.message = response.data.message;
        this.isSuccess = true;
        this.username = '';
        this.password = '';
        this.$router.push('/login');
      } catch (error) {
        this.message = error.response.data.message || 'Registration failed.';
        this.isSuccess = false;
      }
    }
  }
};
</script>

<style scoped>
/* (Keep your existing styles for RegisterPage.vue here) */
.auth-container {
      max-width: 400px;
      margin: 50px auto;
      padding: 20px;
      border: 1px solid #ddd;
      border-radius: 8px;
      box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
      text-align: center;
    }
    .form-group {
      margin-bottom: 15px;
      text-align: left;
    }
    label {
      display: block;
      margin-bottom: 5px;
      font-weight: bold;
    }
    input[type="text"],
    input[type="password"] {
      width: 100%;
      padding: 10px;
      border: 1px solid #ccc;
      border-radius: 4px;
      box-sizing: border-box; /* Ensures padding doesn't increase width */
    }
    button {
      background-color: #007bff;
      color: white;
      padding: 10px 15px;
      border: none;
      border-radius: 4px;
      cursor: pointer;
      font-size: 16px;
      width: 100%;
    }
    button:hover {
      background-color: #0056b3;
    }
    .success {
      color: green;
      margin-top: 10px;
    }
    .error {
      color: red;
      margin-top: 10px;
    }

/* Gaya baru untuk tombol kembali ke beranda */
.back-to-home {
  display: inline-block;
  margin-top: 20px;
  color: #007bff;
  text-decoration: none;
  font-weight: bold;
}
.back-to-home:hover {
  text-decoration: underline;
}
</style>