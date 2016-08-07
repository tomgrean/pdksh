name: debian-117-1
description:
	Check test - bug#465250
stdin:
	test \( ! -e \) ; echo $?
expected-stdout:
	1
---
name: debian-117-2
description:
	Check test - bug#465250
stdin:
	test \(  -e \) ; echo $?
expected-stdout:
	0
---
name: debian-117-3
description:
	Check test - bug#465250
stdin:
	test ! -e  ; echo $?
expected-stdout:
	1
---
name: debian-117-4
description:
	Check test - bug#465250
stdin:
	test  -e  ; echo $?
expected-stdout:
	0
---
