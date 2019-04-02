workflow  "Delete Event Payload" {
	on = "delete"
	resolves = "Echo"
}

action "Echo Payload" {
	uses = "docker://alpine"
	runs = "sh"
	args = ["-c", "cat $GITHUB_EVENT_PATH"]
}

action "Filter" {
	needs = "Echo Payload"
	uses = "actions/filter@master"
	runs = "deleted_branch branch"
}

action "Echo" {
	needs = "Filter"
	uses = "docker://alpine"
	runs = "echo"
	args = "success"
}
