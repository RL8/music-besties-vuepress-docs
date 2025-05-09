module.exports = {
  title: 'Music Besties Documentation',
  description: 'Comprehensive documentation for the Music Besties application',
  base: '/music-besties-vuepress-docs/',
  head: [
    ['link', { rel: 'icon', href: '/images/favicon.ico' }]
  ],
  // Use our custom layout
  theme: '@vuepress/theme-default',

  themeConfig: {
    logo: '/images/logo.svg',
    search: false,
    nav: [
      { text: 'Home', link: '/' },
      { text: 'Current State (v1.0)', link: '/current-state/' },
      { text: 'Sprint to Next State (v1.1)', link: '/sprint/' },
      { text: 'Next State (v1.1)', link: '/next-state/' },
      { text: 'Future States', link: '/future-states/' },
      { text: 'Core Functions', link: '/core-functions/' },
    ],
    sidebar: {
      '/current-state/': [
            '/current-state/overview',
            '/current-state/screens',
            {
              title: 'Screens',
              collapsable: true,
              children: [
                '/current-state/screens/',
                '/current-state/screens/dashboard',
                '/current-state/screens/edit-rankings',
                '/current-state/screens/sidebar-panel',
                '/current-state/screens/navigation',
                '/current-state/screens/settings',
              ]
            },
            '/current-state/components',
            '/current-state/user-interactions',
            '/current-state/data-handling',
            '/current-state/user-experience',
            '/current-state/developer-debugger',
      ],
      '/sprint/': [
            '/sprint/sprint-plan',
      ],
      '/next-state/': [
            '/next-state/application-overview',
            '/next-state/screens',
            '/next-state/components',
            '/next-state/interactions',
            '/next-state/technical',
            '/next-state/user-experience',
            '/next-state/developer-guide',
      ],
      '/future-states/': [
            '/future-states/backlog',
            '/future-states/vision',
      ],
      '/core-functions/': [
            '/core-functions/documentation-guide',
            '/core-functions/mermaid-diagram-guide',
            '/core-functions/version-control-guide',
            '/core-functions/security',
            '/core-functions/api-documentation',
            '/core-functions/deployment',
            {
              title: 'Design System',
              collapsable: true,
              children: [
                '/core-functions/design-system/index',
                '/core-functions/design-system/foundations',
                '/core-functions/design-system/components',
                '/core-functions/design-system/patterns',
                '/core-functions/design-system/accessibility',
                '/core-functions/design-system/responsive',
              ]
            },
      ],
    },
    sidebarDepth: 2,
    lastUpdated: 'Last Updated',
    smoothScroll: true,
  },
  plugins: [
    '@vuepress/back-to-top',
    '@vuepress/medium-zoom',
    ['@vuepress/search', {
      searchMaxSuggestions: 10
    }],
    ['mermaidjs', {
      gantt: {
        titleTopMargin: 25,
        barHeight: 20,
        barGap: 4,
        topPadding: 50,
        leftPadding: 75,
        gridLineStartPadding: 35,
        fontSize: 11,
        fontFamily: '"Open-Sans", "sans-serif"',
      }
    }]
  ]
}
