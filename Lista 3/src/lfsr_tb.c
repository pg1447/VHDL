#include <stdio.h>
#include <stdlib.h> /* exit */
#include <inttypes.h>

/* from shift_lfsr.c */
extern unsigned int shift_lfsr(unsigned int);

#define ERROR(msg) \
	__extension__ \
	({ \
		perror(msg); \
		exit(1); \
	})

#define CAST_TO_BOOL(x)	(!!(x))
#define BIT(n)			(1ull << (n))
#define CYCLE			BIT(4)
#define CAN_PRINT(val)	!(CAST_TO_BOOL(val & (CYCLE - 1)))

int main(void)
{
	uint16_t init;
	uint16_t val;
	uint64_t steps = 0;

	if (scanf("%" SCNu16, &init) != 1)
		ERROR("scanf error\n");

	val = init;
 	do {
    	val = shift_lfsr(val);
		++steps;

		if (CAN_PRINT(val))
			(void)printf("%" PRIu16 "\t%#x\n", val, val);

  	} while (val != init);

	(void)printf("%" PRIu16 "\t%#x\n", val, val);
	(void)printf("\nSTEPS = %" PRIu64 "\n", steps);

	return 0;
}
