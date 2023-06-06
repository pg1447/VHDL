#include <stdio.h>
#include <coder.h>
#include <time.h>
#include <stdlib.h>
#include <common.h>

void lossy_channel(code_t *frame)
{
    int decision;
    int bit = -1;
    int bit2;

    decision = rand();

    if (decision & BIT(0))
    {
        bit = rand() & 0x7; /* faster than bit = rand % 8 */
        FLIP_BIT(*frame, bit);
    }

    if (decision & BIT(1))
    {
        do {
            bit2 = rand() & 0x7;
        } while (bit == bit2);

        FLIP_BIT(*frame, bit2);
    }
}

int main(void)
{
    code_t val = 0;
    code_t frame;
    code_t decoded;

    int i;
    srand(time(NULL));

    /* for each value for code_t */
    for (i = 0; i < 15; ++i)
    {
        val = i;
        /* get frome data only first 4bits  */
        frame = encode(val & 0xF);
        lossy_channel(&frame);

        decoded = decode(frame);
        if (decoded != val)
            (void)printf("Data corrupted:\n\tGet:\t\t%#2x\n\tExpected:\t%#2x\n", decoded, val);
    }
    return 0;
}
