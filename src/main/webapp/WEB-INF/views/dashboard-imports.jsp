<link rel="stylesheet" href="//code.jquery.com/ui/1.13.2/themes/base/jquery-ui.css">
  <script src="https://code.jquery.com/ui/1.13.2/jquery-ui.js"></script>
  <link rel="stylesheet" href="<c:url value='/css/styles.css'/>">
  <script>
  $(function() {
	  $("#accordion").accordion({
	    collapsible: true,
	    active: false,
	    heightStyle: "content", 
	    create: function(event, ui) {
	      // Add Font Awesome icons to each header
	      $(this)
	        .find(".ui-accordion-header:eq(0)")
	        .prepend('<i class="fa fa-user mx-3"></i>');
	      $(this)
	        .find(".ui-accordion-header:eq(1)")
	        .prepend('<i class="fa fa-shopping-cart mx-3"></i>');
	      // Move the caret icons to the right
	      $(this)
	        .find(".ui-accordion-header .ui-icon-caret-1-e")
	        .addClass("fa-caret-right")
	        .removeClass("ui-icon-caret-1-e")
	        .parent()
	        .addClass("has-caret-icon");
	    },
	    activate: function(event, ui) {
	      // Change the Font Awesome icon for the active header
	      var icon = ui.newHeader.find(".has-caret-icon .fa");
	      if (ui.newHeader.hasClass("ui-state-active")) {
	        icon.removeClass("fa-caret-right").addClass("fa-caret-down");
	      } else {
	        icon.removeClass("fa-caret-down").addClass("fa-caret-right");
	      }
	    }
	  });
	});
  </script>