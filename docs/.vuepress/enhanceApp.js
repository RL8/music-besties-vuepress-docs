export default ({ Vue, options, router, siteData }) => {
  // Add mermaid script to head
  if (typeof window !== 'undefined') {
    import('mermaid').then(m => {
      m.default.initialize({
        startOnLoad: true,
        theme: 'neutral',
        themeVariables: {
          primaryColor: '#f0f0f0',
          primaryTextColor: '#000',
          primaryBorderColor: '#7C0000',
          lineColor: '#F8B229',
          secondaryColor: '#006100',
          tertiaryColor: '#fff',
          background: '#ffffff',
          mainBkg: '#ffffff',
          nodeBorder: '#000000',
          clusterBkg: '#ffffde',
          clusterBorder: '#888888',
          titleColor: '#000000',
          edgeLabelBackground: '#ffffff'
        },
        flowchart: {
          useMaxWidth: true,
          htmlLabels: true,
          curve: 'basis'
        },
        securityLevel: 'loose'
      });
      
      // Process mermaid code blocks after page load
      router.afterEach(() => {
        // Wait for DOM to be updated
        setTimeout(() => {
          const elements = document.querySelectorAll('.language-mermaid');
          elements.forEach(element => {
            // Skip already processed elements
            if (element.getAttribute('data-processed') === 'true') return;
            
            const content = element.textContent;
            if (content) {
              element.textContent = '';
              element.setAttribute('data-processed', 'true');
              
              try {
                m.default.render(
                  `mermaid-${Date.now()}`,
                  content,
                  svgCode => {
                    element.innerHTML = svgCode;
                  },
                  element
                );
              } catch (error) {
                console.error('Mermaid rendering error:', error);
                element.textContent = content;
              }
            }
          });
        }, 300);
      });
    });
  }
};
