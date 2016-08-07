name: debian-110-1
description:
	Check if exit -1 is allowed for ! posix
stdin:
	(set +o posix; exit -1); echo A $?
expected-stdout:
	A 255
---
name: debian-110-2
description:
	Check if exit -1 is not allowed for posix
stdin:
	(set -o posix; exit -1); echo A $?
expected-stdout:
	A 1
expected-fail: yes
---
