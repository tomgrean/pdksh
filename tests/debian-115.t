name: debian-115-1
description:
	Check if echo does not accept -e in posix mode
stdin:
	set -o posix
	echo -e test
expected-stdout:
	-e test
---
name: debian-115-2
description:
	Check if echo accepts -e in non-posix mode
stdin:
	set +o posix
	echo -e test
expected-stdout:
	test
---
name: debian-115-3
description:
	Check if echo accepts -n in posix mode
stdin:
	set -o posix
	echo -n test
	echo " OK"
expected-stdout:
	test OK
---
name: debian-115-4
description:
	Check if echo accepts -n in non-posix mode
stdin:
	set +o posix
	echo -n test
	echo " OK"
expected-stdout:
	test OK
---
