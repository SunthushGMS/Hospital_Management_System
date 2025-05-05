/*PopUps*/

	// Function to preview the image
	function previewImage(event) {
	   const file = event.target.files[0];
	   if (file) {
	      const reader = new FileReader();
	      reader.onload = function(e) {
	        document.getElementById('preview').src = e.target.result;
	     }
	     reader.readAsDataURL(file);
	   }
	}

  // popup box functionality
  document.addEventListener('DOMContentLoaded', function() {
    const backgroundbox = document.getElementById('outerbox');
	
    const openPropicBtn = document.getElementById('openProfileModal');
	const openEditusrBtn = document.getElementById('edituser');
	
    const propiccloseBtn = document.getElementById('closeProfileModal');
    const propiccancelBtn = document.getElementById('cancelProfileUpload');
	const editusrcloseBtn = document.getElementById('closeEditBox');
	const editusrcancelBtn = document.getElementById('cancelEdit');
	
	const propiccontainer =	document.getElementById('propiccontainer');
	const userdetailscontainer = document.getElementById('userdetails');
	
	/*PROFILEPIC BOX*/
	
    // Open profilepic box
    openPropicBtn.addEventListener('click', function() {
      backgroundbox.classList.remove('hidden');
	  propiccontainer.classList.remove('hidden');
      document.body.classList.add('overflow-hidden');
    });

    // Close profilepic box
    const closePropicBox = function() {
      backgroundbox.classList.add('hidden');
	  propiccontainer.classList.add('hidden');
      document.body.classList.remove('overflow-hidden');
    };

    propiccloseBtn.addEventListener('click', closePropicBox);
    propiccancelBtn.addEventListener('click', closePropicBox);

    // Close when clicking outside the modal content
    backgroundbox.addEventListener('click', function(e) {
      if (e.target === backgroundbox.children[0]) {
        closePropicBox();
      }
    });

	/*EDIT USER BOX*/
	
	// Open edituser box
	openEditusrBtn.addEventListener('click', function() {
	    backgroundbox.classList.remove('hidden');
		userdetailscontainer.classList.remove('hidden');
	    document.body.classList.add('overflow-hidden');
	 });
	 
	 // Close profilepic box
     const closeEdit = function() {
       backgroundbox.classList.add('hidden');
 	   userdetailscontainer.classList.add('hidden');
       document.body.classList.remove('overflow-hidden');
     };

     editusrcloseBtn.addEventListener('click', closeEdit);
     editusrcancelBtn.addEventListener('click', closeEdit);
	 
	 // Close when clicking outside the modal content
     backgroundbox.addEventListener('click', function(e) {
       if (e.target === backgroundbox.children[0]) {
         closeEdit();
       }
     });
	
  });
  
  
  /*Prompt Box*/
  
    document.querySelector('#dltAccount').addEventListener('click', () => {
      Confirm.open({
        title: 'Delete Account',
        message: 'Are you sure you wish to delete your account? This action cannot be undone.',
        onok: () => {
			window.location.href = "DeleteProfileController";
        }
      })
    });
  