document.addEventListener('DOMContentLoaded', function() {
  // Scroll animation observer
  const animateOnScroll = () => {
    const elements = document.querySelectorAll('.scroll-animate');
    const windowHeight = window.innerHeight;
    const triggerPoint = windowHeight * 0.75; // Trigger when element is 75% in view
    
    elements.forEach(element => {
      const elementPosition = element.getBoundingClientRect().top;
      
      if (elementPosition < triggerPoint) {
        element.classList.add('active');
      }
    });
  };
  
  // Run once on load
  animateOnScroll();
  
  // Run on scroll with throttling for performance
  let isScrolling;
  window.addEventListener('scroll', function() {
    window.clearTimeout(isScrolling);
    isScrolling = setTimeout(function() {
      animateOnScroll();
    }, 50);
  });

  // Add hover effect to service cards
  const serviceCards = document.querySelectorAll('.service-card');
  serviceCards.forEach(card => {
    card.addEventListener('mouseenter', function() {
      this.style.transform = 'scale(1.05)';
      this.style.boxShadow = '0 10px 25px -5px rgba(0, 0, 0, 0.1), 0 10px 10px -5px rgba(0, 0, 0, 0.04)';
    });
    
    card.addEventListener('mouseleave', function() {
      this.style.transform = 'scale(1)';
      this.style.boxShadow = '0 25px 50px -12px rgba(0, 0, 0, 0.25)';
    });
  });
});