workflow  "Delete Event Payload" {
	on = "delete"
	resolves = "Echo Payload"
}

action "Echo Payload" {
	uses = "docker://alpine"
	runs = "sh"
	args = ["-c", "cat $GITHUB_EVENT_PATH"]
}

action "Filter" {
	uses = "actions/filter"
	runs = "deleted_branch branch"
}

action "Echo" {
	uses = "docker://alpine"
	runs = "echo"
	args = "success"
}
