name: debian-112-1
description:
	Check test operator precedence
stdin:
	test \( -f = -f \) && echo OK
expected-stdout:
	OK
---
