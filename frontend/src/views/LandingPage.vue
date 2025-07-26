<template>
  <div class="landing-container">
    <h1>Welcome to My Authentication App!</h1>
    <p>Please register or log in to access the dashboard.</p>
    <div class="navigation-links">
      <router-link to="/login" class="nav-button login-button">Login</router-link>
      <router-link to="/register" class="nav-button register-button">Register</router-link>
    </div>
  </div>
</template>

<script>
export default {
  name: 'LandingPage',
  // You might want to automatically redirect authenticated users to dashboard
  created() {
    const isAuthenticated = localStorage.getItem('jwt_token');
    if (isAuthenticated) {
      this.$router.push('/dashboard');
    }
  }
};
</script>

<style scoped>
.landing-container {
  max-width: 600px;
  margin: 100px auto;
  padding: 40px;
  border: 1px solid #e0e0e0;
  border-radius: 12px;
  box-shadow: 0 6px 18px rgba(0, 0, 0, 0.1);
  background-color: #ffffff;
  text-align: center;
  color: #333;
}

h1 {
  color: #007bff;
  margin-bottom: 25px;
  font-size: 2.8em;
  font-weight: 700;
}

p {
  font-size: 1.2em;
  margin-bottom: 30px;
  line-height: 1.8;
  color: #555;
}

.navigation-links {
  display: flex;
  justify-content: center;
  gap: 20px; /* Space between buttons */
  margin-top: 30px;
}

.nav-button {
  display: inline-block;
  padding: 15px 30px;
  border-radius: 8px;
  text-decoration: none;
  font-weight: bold;
  font-size: 1.1em;
  transition: all 0.3s ease;
  box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
}

.login-button {
  background-color: #28a745;
  color: white;
  border: 2px solid #28a745;
}

.login-button:hover {
  background-color: #218838;
  transform: translateY(-2px);
  box-shadow: 0 4px 10px rgba(0, 0, 0, 0.2);
}

.register-button {
  background-color: #007bff;
  color: white;
  border: 2px solid #007bff;
}

.register-button:hover {
  background-color: #0056b3;
  transform: translateY(-2px);
  box-shadow: 0 4px 10px rgba(0, 0, 0, 0.2);
}
</style>