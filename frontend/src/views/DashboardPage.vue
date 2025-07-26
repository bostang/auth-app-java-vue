<template>
  <div class="dashboard-container">
    <h2>Dashboard</h2>
    <p v-if="loading">Loading dashboard data...</p>
    <div v-else-if="error" class="error-message">
      <p>Error loading dashboard: {{ error }}</p>
      <button @click="logout">Logout</button>
    </div>
    <div v-else>
      <p>{{ dashboardData.message }}</p>
      <p>Details: {{ dashboardData.data }}</p>
      <button @click="logout">Logout</button>
    </div>
  </div>
</template>

<script>
import axios from 'axios';

export default {
  name: 'DashboardPage',
  data() {
    return {
      dashboardData: null,
      loading: true,
      error: null
    };
  },
  async created() {
    await this.fetchDashboardData();
  },
  methods: {
    async fetchDashboardData() {
      this.loading = true;
      this.error = null;
      try {
        const token = localStorage.getItem('jwt_token');
        if (!token) {
          this.error = 'No authentication token found. Please login.';
          this.logout(); // Redirect to login if no token
          return;
        }

        const response = await axios.get(`${process.env.VUE_APP_API_BASE_URL}/dashboard`, {
          headers: {
            Authorization: `Bearer ${token}` // Send the JWT token in the header
          }
        });
        this.dashboardData = response.data;
      } catch (err) {
        console.error('Error fetching dashboard data:', err);
        if (err.response && err.response.status === 401) {
          this.error = 'Unauthorized. Your session may have expired. Please log in again.';
          this.logout(); // Automatically log out on 401
        } else {
          this.error = 'Failed to load dashboard data.';
        }
      } finally {
        this.loading = false;
      }
    },
    logout() {
      localStorage.removeItem('jwt_token'); // Remove the token
      this.$router.push('/login'); // Redirect to login page
    }
  }
};
</script>

<style scoped>
.dashboard-container {
  max-width: 600px;
  margin: 50px auto;
  padding: 30px;
  border: 1px solid #e0e0e0;
  border-radius: 10px;
  box-shadow: 0 4px 12px rgba(0, 0, 0, 0.08);
  background-color: #f9f9f9;
  text-align: center;
  color: #333;
}

h2 {
  color: #007bff;
  margin-bottom: 25px;
  font-size: 2.2em;
}

p {
  font-size: 1.1em;
  margin-bottom: 15px;
  line-height: 1.6;
}

.error-message {
  color: #dc3545;
  background-color: #f8d7da;
  border: 1px solid #f5c6cb;
  padding: 15px;
  border-radius: 5px;
  margin-bottom: 20px;
}

button {
  background-color: #dc3545;
  color: white;
  padding: 12px 25px;
  border: none;
  border-radius: 5px;
  cursor: pointer;
  font-size: 1.1em;
  transition: background-color 0.3s ease;
}

button:hover {
  background-color: #c82333;
}
</style>