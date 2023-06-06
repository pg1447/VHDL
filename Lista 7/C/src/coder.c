#include <coder.h>
#include <stdio.h>
#include <common.h>

#define CALC_PARITY_BIT(n) \
    (GET_BIT(n, 0) ^ GET_BIT(n, 1) ^  GET_BIT(n, 2) ^GET_BIT(n, 3) ^ GET_BIT(n, 4) ^ GET_BIT(n, 5) ^ GET_BIT(n, 6))

#define SET_PARITY_BIT(n , k) (SET_BIT_VALUE(n, k, CALC_PARITY_BIT(n)))

code_t encode(code_t input)
{
    code_t res = 0;

    /*
        encode FRAME
        DDDD => CCDCDDDP
        C - code
        D - data
        P - parity
    */
    SET_BIT_VALUE(res, 0, GET_BIT(input, 0) ^ GET_BIT(input, 1) ^ GET_BIT(input, 3));
    SET_BIT_VALUE(res, 1, GET_BIT(input, 0) ^ GET_BIT(input, 2) ^ GET_BIT(input, 3));
    SET_BIT_VALUE(res, 2, GET_BIT(input, 0));
    SET_BIT_VALUE(res, 3, GET_BIT(input, 1) ^ GET_BIT(input, 2) ^ GET_BIT(input, 3));
    SET_BIT_VALUE(res, 4, GET_BIT(input, 1));
    SET_BIT_VALUE(res, 5, GET_BIT(input, 2));
    SET_BIT_VALUE(res, 6, GET_BIT(input, 3));
    SET_PARITY_BIT(res, 7);

    return res;
}

code_t decode(code_t input)
{
    code_t res = 0;
    uint8_t error_position = 0;

    /*
        decode FRAME
        CCDCDDDP => DDDD
        C - code
        D - data
        P - parity
    */

    /* decode data */
    SET_BIT_VALUE(res, 0, GET_BIT(input, 2));
    SET_BIT_VALUE(res, 1, GET_BIT(input, 4));
    SET_BIT_VALUE(res, 2, GET_BIT(input, 5));
    SET_BIT_VALUE(res, 3, GET_BIT(input, 6));

    /* chceck errors */
    if (GET_BIT(input, 0) != (GET_BIT(input, 2) ^ GET_BIT(input, 4) ^ GET_BIT(input, 6)))
        ++error_position;

    if (GET_BIT(input, 1) != (GET_BIT(input, 2) ^ GET_BIT(input, 5) ^ GET_BIT(input, 6)))
        error_position += 2;

    if (GET_BIT(input, 3) != (GET_BIT(input, 4) ^ GET_BIT(input, 5) ^ GET_BIT(input, 6)))
        error_position += 4;

    /* Try fix IFF error */
    if (error_position)
    {
        /* error on frame and parity incorrect, fix data */
        if (GET_BIT(input, 7) != CALC_PARITY_BIT(input))
        {
            switch (error_position)
            {
                case 3:
                {
                    FLIP_BIT(res, 0);
                    break;
                }
                case 5:
                {
                    FLIP_BIT(res, 1);
                    break;
                }
                case 6:
                {
                    FLIP_BIT(res, 2);
                    break;
                }
                case 7:
                {
                    FLIP_BIT(res, 3);
                    break;
                }
            }
        }
        else /* error on frame, but parity still correct, return data corrupted  */
            res = DATA_CORRUPTED;
    }

    return res;
}
