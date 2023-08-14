(function(window) {
  document.addEventListener('DOMContentLoaded', function (){
    const tour = new Shepherd.Tour({
      defaultStepOptions: {
        cancelIcon: {
          enabled: true
        },
        classes: 'class-1 class-2',
        scrollTo: { behavior: 'smooth', block: 'center' },
        when: {
          cancel: function () {
            WemaUtils.saveSessionStorage('wemalytics-tour', 'true');
          }
        }
      },
    });

    tour.addSteps(
        [
      {
        title : `<h4>Navigation Menu</h4>`,
        text: `<p class="mb-0">Navigation to various Applications and Reports from here. Click to view modules under each section. </p>`,
          attachTo: {
            element: '#first-tour',
            on: 'right'
          },
          buttons: [
            {
              action() {
                return this.next();
              },
              text: 'Next'
            },
          ],
          id: 'first-tour'
      },
      {
        title : `<h4>Profile</h4>`,
        text: `<p class="mb-0">Manage your Profile or Log out of Wemalytics from here.</p>`,
          attachTo: {
            element: '#profile-setting',
            on: 'bottom'
          },
          buttons: [
            {
              action() {
                return this.back();
              },
              classes: 'shepherd-button-secondary',
              text: 'Back'
            },
            {
              action() {
                return this.next();
              },
              text: 'Next'
            }
          ],
          id: 'dropdown1'
      },
      {
        title : `<h4>Quick Navigation</h4>`,
        text: `<p class="mb-0">Access top and most frequently used applications or reports from here. Enjoy Wemalytics!</p>`,
          attachTo: {
            element: '#quickNavigation',
            on: 'right'
          },
          buttons: [
            {
              action() {
                return this.back();
              },
              classes: 'shepherd-button-secondary',
              text: 'Back'
            },
            {
              action() {
                WemaUtils.saveSessionStorage('tour', 'true');
                return this.next();
              },
              text: 'Done'
            }
          ],
          id: 'title'
      },
    ]
    )
    // check media screen
    if (window.matchMedia('(min-width: 1198px)').matches) {
      setTimeout(() => {
        const liveCusomizer = WemaUtils.getQueryString('live-customizer')
        if(liveCusomizer != 'open') {
          if(WemaUtils.getSessionStorage('tour') !== 'true') {
            tour.start();
            $('.shepherd-modal-overlay-container').addClass('shepherd-modal-is-visible')
          }
        }
      }, 400)
    }
  })
})(window)
