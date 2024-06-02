async function singleJobDialog() {
	return new Promise((resolve, reject) => {
		let div = $(`
        <div class="modal fade" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" role="dialog" style="z-index: 1070;">
            <div class="modal-dialog modal-dialog-centered" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title">${getLocalizedText("menu:jobs_dialog:title")}</h5>
                        <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
                    </div>
                    <div class="modal-body">
                        <div class="input-group">
                            <span class="input-group-text">${getLocalizedText("menu:jobs_dialog:search_job")}</span>
                            <input type="text" class="form-control single-job-search">
                        </div>
        
                        <ul class="list-group mt-2 single-jobs-list scrollbar" style="overflow: auto; max-height: 70vh">
        
                        </ul>
                    </div>
                </div>
            </div>
        </div>
        `)

        // delete the div when the modal is closed
        div.on("hidden.bs.modal", function() {
            div.remove();
        });

        div.modal("show");
	
		div.find(".single-job-search").val("").on("keyup", function() {
            let text = $(this).val().toLowerCase();
        
            div.find(".single-jobs-list li").filter(function() {
              $(this).toggle($(this).text().toLowerCase().indexOf(text) > -1)
            });
        })
		
		$.post(`https://${resName}/getAllJobs`, JSON.stringify({}), function (jobs) {
			let jobsListDiv = div.find(".single-jobs-list");
			jobsListDiv.empty();
	
			for(const[jobName, jobData] of Object.entries(jobs)) {
				let jobDiv = $(`
					<li class="list-group-item list-group-item-action clickable" value=${jobName}>${jobData.label}</li>
				`);
	
				jobDiv.click(function() {
					div.modal("hide");
					resolve(jobName);
				});
	
				jobsListDiv.append(jobDiv);
			}
		});
	})
}