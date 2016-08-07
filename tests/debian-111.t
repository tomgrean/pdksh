name: debian-111-1
description:
	Check set -e regression
stdin:
	set -e; true; false && true; echo OK
expected-stdout:
	OK
---
name: debian-111-2
description:
	Regression for #387755
stdin:
	set -e
	! true
	! false
	echo OK
expected-stdout:
	OK
---
name: debian-111-3
description:
	Regression for #387755
stdin:
	set -e; (false); echo here
expected-stdout:
expected-fail: yes
---
name: debian-111-4
description:
	Regression for #387755
stdin:
	set +e; (false); echo here
expected-stdout:
	here
---
name: debian-111-5
description:
	Regression for #71256
stdin:
	set -e
	if true; then
		false && echo something
	fi
	echo OK
expected-stdout:
	OK
---
name: debian-111-6
description:
	Regression for #71256
stdin:
	set +e
	if true; then
		false && echo something
	fi
	echo OK
expected-stdout:
	OK
---

