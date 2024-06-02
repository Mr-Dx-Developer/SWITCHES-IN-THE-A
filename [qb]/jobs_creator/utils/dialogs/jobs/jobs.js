function jobsDialog(oldJobs) {
return new Promise(async (resolve, reject) => {
    let div = $(`
    <div class="modal fade" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" role="dialog" style="z-index: 1070; background: rgba(25, 25, 25, 0.7);">
        <div class="modal-dialog modal-dialog-centered" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title">${getLocalizedText("menu:jobs_dialog:title")}</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
                </div>
                <div class="modal-body">

                    <div class="d-flex align-items-center justify-content-center fs-2">
                        <input class="form-check-input me-2 my-auto all-jobs-allowed-checkbox" type="checkbox">
                        <label class="form-label fw-bold mb-0">${getLocalizedText("menu:all_jobs_allowed")}</label>
                    </div>

                    <hr class="my-3">

                    <div class="input-group">
                        <span class="input-group-text">${getLocalizedText("menu:jobs_dialog:search_job")}</span>
                        <input type="text" class="form-control input-job-search">
                    </div>

                    <div class="mt-3 jobs-list" style="max-height: 50vh; overflow-y: auto">

                    </div>
                </div>

                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">${getLocalizedText("menu:close")}</button>
                    <button type="button" class="btn btn-success input-jobs-confirm-btn">${getLocalizedText("menu:confirm")}</button>
                </div>    
            </div>
        </div>
    </div>
    `);

    // delete the div when the modal is closed
    div.on("hidden.bs.modal", function() {
        div.remove();
    });

    div.modal("show");

    div.find(".input-job-search").val("");
    
    const jobs = await $.post(`https://${resName}/getAllJobs`, JSON.stringify({}));

    let jobListDiv = div.find(".jobs-list")
    jobListDiv.empty();

    for(const[jobName, jobData] of Object.entries(jobs)) {
        let jobDiv = $(`
        <div class="form-check fs-3 mb-2 ms-1">
            <input class="form-check-input" data-type="job" type="checkbox" data-job-name="${jobName}">

            <label class="form-check-label fw-bold mb-0">${jobData.label}</label>
            
            <div class="job-grades ms-3">

            </div>
        </div>
        `);

        for(let [grade, gradeData] of Object.entries(jobData.grades)) {
            // QB-Core
            if(gradeData.grade == undefined) {
                gradeData.grade = grade;
                gradeData.label = gradeData.name;
            }

            let rankDiv = $(`
            <div class="rank-div">
                <input class="form-check-input" data-type="job-grade" type="checkbox" data-job-name="${jobName}" data-grade=${gradeData.grade}>
                <label class="form-check-label">
                    ${gradeData.grade} - ${gradeData.label}
                </label>
            </div>
            `);

            jobDiv.find(".job-grades").append(rankDiv);
        }

        jobListDiv.append(jobDiv);
    }

    // Disables and uncheck grades checkbox if the entire job is selected
    jobListDiv.find(`[data-type="job"]`).change(function() {
        let isChecked = $(this).prop("checked");

        if(isChecked) {
            $(this).parent().find(".job-grades").find("input").prop("checked", false).prop("disabled", true);
        } else {
            $(this).parent().find(".job-grades").find("input").prop("disabled", false);
        }
    })

    if(oldJobs) {
        for(let [jobName, allowedGrades] of Object.entries(oldJobs)) {
            if(allowedGrades === true) {
                jobListDiv.find(`[data-type="job"][data-job-name="${jobName}"]`).prop("checked", true).change();
            } else {
                for(let [grade, _] of Object.entries(allowedGrades)) {
                    jobListDiv.find(`[data-type="job-grade"][data-job-name="${jobName}"][data-grade="${grade}"]`).prop("checked", true);
                }
            }
        }
    }

    // Unbinds the button and rebinds it to callback the selected jobs
    div.find(".input-jobs-confirm-btn").unbind().click(function() {
        const allJobsAllowed = div.find(".all-jobs-allowed-checkbox").prop("checked");

        if(allJobsAllowed) {
            resolve(false);
        } else {
            let selectedJobs = {};
    
            jobListDiv.find("input:checked").each(function() {
                let checkBoxType = $(this).data("type");
    
                let jobName = $(this).data("jobName");
    
                switch(checkBoxType) {
                    case "job":
                        selectedJobs[jobName] = true;
                        break;
                    case "job-grade":
                        let grade = $(this).data("grade");
    
                        if(!selectedJobs[jobName]) {
                            selectedJobs[jobName] = {};
                        }
                        
                        selectedJobs[jobName][grade] = true;
                        break;
                    default:
                        console.log("Unknown checkbox type: " + checkBoxType + " in jobs dialog");
                        break;
                }
            });

            resolve(selectedJobs);
        }

        div.modal("hide");
    });

    div.find(".input-job-search").on("keyup", function() {
        let text = $(this).val().toLowerCase();
    
        div.find(".jobs-list .form-check").filter(function() {
            $(this).toggle($(this).text().toLowerCase().indexOf(text) > -1)
        });
    });

    div.find(".all-jobs-allowed-checkbox").change(function() {
        let isChecked = $(this).prop("checked");

        if(isChecked) {
            div.find(".jobs-list input").prop("checked", true).prop("disabled", true);
        } else {
            div.find(".jobs-list input").prop("checked", false).prop("disabled", false);
        }
    });

    // If oldJobs is false (so all jobs are allowed), check the checkbox
    if(oldJobs === false || oldJobs === null || oldJobs === undefined) {
        div.find(".all-jobs-allowed-checkbox").prop("checked", true).change();
    }
});
}