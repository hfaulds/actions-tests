workflow  "Delete Event Payload" {
	on = "delete"
	resolves = "Echo Payload"
}

action "Echo Payload" {
	uses = "docker://alpine"
	runs = "cat $GITHUB_EVENT_PATH"
}
