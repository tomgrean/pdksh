#include <stdio.h>
#include <stdlib.h>
#include "sh.h"

struct xsiginfo {
	int x_signal;
	char x_name[32];
	char x_mess[128];
};


static struct xsiginfo xsigs[] = {
#include SIGNALIN

	{-1, "",""}
};

int main()
{
	int i, n;
	int max_signal = 0;

	for (i = 0; xsigs[i].x_signal > 0; i++) {
		if (xsigs[i].x_signal > max_signal) {
			max_signal = xsigs[i].x_signal;
		}
	}
	for (n = 1; n < max_signal; n++) {//omit the biggest 'signal'.
		int not_found = 1;
		for (i = 0; xsigs[i].x_signal > 0; i++) {
			if (xsigs[i].x_signal == n) {
				printf("{.signal=%d,.name=\"%s\",.mess=\"%s\"},\n", n, xsigs[i].x_name, xsigs[i].x_mess);
				not_found = 0;
				break;
			}
		}
		if (not_found) {
			printf("{.signal=%d,.name=(char *)0,.mess=\"Signal:%d\"},\n", n, n);
		}
	}
	return 0;
}

