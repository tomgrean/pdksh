name: debian-114-1
description:
	Check if let crashes
stdin:
	let --
	exit 0
expected-stderr-pattern: /\-\- requires lvalue/
---
