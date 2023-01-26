BITS = 32 64

all: $(BITS:%=%/isattyfix.so)

64/isattyfix.so: isattyfix.c
	@mkdir -p $(@D)
	gcc -m64 -std=gnu99 -shared -fPIC -Wall -Wextra -Werror -o $@ $^

32/isattyfix.so: isattyfix.c
	@mkdir -p $(@D)
	gcc -m32 -std=gnu99 -shared -fPIC -Wall -Wextra -Werror -o $@ $^

clean:
	rm -rf $(BITS)
