#include <dlfcn.h>
#include <unistd.h>
#include <errno.h>

int
isatty(int fildes)
{
	static int (*real_isatty)(int) = NULL;
	int r;

	if (real_isatty == NULL) {
		real_isatty = dlsym(RTLD_NEXT, "isatty");
	}

	int e = errno;
	errno = 0;

	if ((r = real_isatty(fildes)) == 0) {
		if (errno == 0) {
			errno = ENOTTY;
		}
	} else {
		errno = e;
	}

	return (r);
}
