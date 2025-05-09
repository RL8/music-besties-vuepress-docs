<template>
  <div class="right-sidebar" v-if="headers.length">
    <div class="right-sidebar-title">On This Page</div>
    <ul class="right-sidebar-links">
      <li v-for="header in headers" :key="header.slug">
        <a :href="'#' + header.slug" 
           :class="{ 'active': activeHash === header.slug }"
           @click.prevent="scrollToHeader(header.slug)">
          {{ header.title }}
        </a>
        <ul v-if="header.children && header.children.length">
          <li v-for="child in header.children" :key="child.slug">
            <a :href="'#' + child.slug" 
               :class="{ 'active': activeHash === child.slug }"
               @click.prevent="scrollToHeader(child.slug)">
              {{ child.title }}
            </a>
          </li>
        </ul>
      </li>
    </ul>
  </div>
</template>

<script>
export default {
  data() {
    return {
      activeHash: '',
      observer: null,
      headers: []
    }
  },
  mounted() {
    this.headers = this.getPageHeaders()
    this.activeHash = this.getCurrentHash()
    
    // Set up scroll spy
    this.setupScrollSpy()
    
    // Listen for hash changes
    window.addEventListener('hashchange', this.onHashChange)
  },
  beforeDestroy() {
    window.removeEventListener('hashchange', this.onHashChange)
    
    // Disconnect observer if it exists
    if (this.observer) {
      this.observer.disconnect()
    }
  },
  methods: {
    getPageHeaders() {
      // Get headers from the current page
      const page = this.$page
      if (page.headers) {
        return this.filterHeaders(page.headers)
      }
      return []
    },
    filterHeaders(headers) {
      // Only include h2 and h3 headers
      return headers.filter(h => h.level === 2).map(h => {
        return {
          ...h,
          children: headers.filter(child => 
            child.level === 3 && 
            child.title.toLowerCase() !== h.title.toLowerCase() &&
            this.isChildHeader(h, child)
          )
        }
      })
    },
    isChildHeader(parent, child) {
      // Check if child header is under parent header
      if (!parent || !child) return false
      
      const headers = this.$page.headers
      if (!headers) return false
      
      const parentIndex = headers.findIndex(h => h.slug === parent.slug)
      const childIndex = headers.findIndex(h => h.slug === child.slug)
      
      if (parentIndex === -1 || childIndex === -1) return false
      if (childIndex <= parentIndex) return false
      
      // Check if there's an h2 between parent and child
      for (let i = parentIndex + 1; i < childIndex; i++) {
        if (headers[i].level === 2) return false
      }
      
      return true
    },
    getCurrentHash() {
      return window.location.hash.slice(1)
    },
    onHashChange() {
      this.activeHash = this.getCurrentHash()
    },
    scrollToHeader(slug) {
      const element = document.getElementById(slug)
      if (element) {
        element.scrollIntoView({ behavior: 'smooth' })
        this.activeHash = slug
        history.pushState(null, null, `#${slug}`)
      }
    },
    setupScrollSpy() {
      // Use Intersection Observer API for scroll spy
      if ('IntersectionObserver' in window) {
        this.observer = new IntersectionObserver(
          (entries) => {
            entries.forEach(entry => {
              if (entry.isIntersecting) {
                this.activeHash = entry.target.id
              }
            })
          },
          {
            rootMargin: '-100px 0px -66%',
            threshold: 0
          }
        )
        
        // Observe all headers
        this.$page.headers.forEach(header => {
          const element = document.getElementById(header.slug)
          if (element) {
            this.observer.observe(element)
          }
        })
      }
    }
  }
}
</script>

<style>
.right-sidebar {
  position: fixed;
  right: 2rem;
  top: 5rem;
  width: 16rem;
  font-size: 0.85rem;
  box-sizing: border-box;
  overflow-y: auto;
  max-height: calc(100vh - 8rem);
}

.right-sidebar-title {
  font-weight: bold;
  margin-bottom: 0.5rem;
  color: #2c3e50;
}

.right-sidebar-links {
  list-style: none;
  padding-left: 0;
  margin: 0;
}

.right-sidebar-links li {
  margin-bottom: 0.35rem;
}

.right-sidebar-links a {
  color: #2c3e50;
  text-decoration: none;
  font-weight: 400;
  display: inline-block;
  padding: 0.25rem 0;
}

.right-sidebar-links a:hover {
  color: #3eaf7c;
}

.right-sidebar-links a.active {
  color: #3eaf7c;
  font-weight: 600;
}

.right-sidebar-links ul {
  list-style: none;
  padding-left: 1rem;
  margin: 0.25rem 0;
}

@media (max-width: 1300px) {
  .right-sidebar {
    display: none;
  }
}
</style>
