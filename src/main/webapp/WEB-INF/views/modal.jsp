	<div class="modal fade" id="logout-modal" tabindex="-1" role="dialog"
		aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="exampleModalLabel">Confirm Logout</h5>
					<button type="button" id="close-btn" class="close"
						data-dismiss="modal" aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body">Are you sure you want to log out?</div>
				<div class="modal-footer">
					<button type="button" id="cancel-btn" class="btn btn-secondary"
						data-dismiss="modal">Cancel</button>
					<form action="logout" method="post">
						<input type="hidden" name="${_csrf.parameterName}"
							value="${_csrf.token}" />
						<button type="submit" class="btn btn-primary">Logout</button>
					</form>
				</div>
			</div>
		</div>
	</div>
	<script>
      $(document).ready(() => {
        $("#logout-button").click((event) => {
          event.preventDefault();

          $("#logout-modal").modal("show");
        });

        $("#confirm-logout").click(() => {
          $("#logout-form").submit();
        });

        $("#cancel-btn").click(() => {
          $("#logout-modal").modal("hide");
        });

        $("#close-btn").click(() => {
          $("#logout-modal").modal("hide");
        });
      });
</script>