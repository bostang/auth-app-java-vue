import { createRouter, createWebHistory } from 'vue-router'
import LandingPage from '../views/LandingPage.vue' // Import the new LandingPage
import RegisterPage from '../views/RegisterPage.vue'
import LoginPage from '../views/LoginPage.vue'
import DashboardPage from '../views/DashboardPage.vue'

const routes = [
  {
    path: '/',
    name: 'Landing',
    component: LandingPage // Set the root path to LandingPage
  },
  {
    path: '/register',
    name: 'Register',
    component: RegisterPage
  },
  {
    path: '/login',
    name: 'Login',
    component: LoginPage
  },
  {
    path: '/dashboard',
    name: 'Dashboard',
    component: DashboardPage,
    meta: { requiresAuth: true } // This route requires authentication
  }
]

const router = createRouter({
  history: createWebHistory(process.env.BASE_URL),
  routes
})

// Navigation Guard
router.beforeEach((to, from, next) => {
  const requiresAuth = to.matched.some(record => record.meta.requiresAuth);
  const isAuthenticated = localStorage.getItem('jwt_token'); // Check for the token

  if (requiresAuth && !isAuthenticated) {
    // If route requires auth and not authenticated, redirect to login
    next('/login');
  } else if (isAuthenticated && (to.path === '/login' || to.path === '/register' || to.path === '/')) {
    // If authenticated and trying to go to login, register, or landing page, redirect to dashboard
    next('/dashboard');
  } else {
    // Otherwise, proceed
    next();
  }
});

export default router