#ifndef CODER_H
#define CODER_H

/*
    Author: Michal Kukowski
    email: michal kukowski

    LICENCE: GPL 3.0

    Hamming Correction encode / decode for 4 input - 8 output

    So the frame is:
    CCDCDDDC (code is only on 2^k pos, 0 1 2 4)
*/

#include <stdint.h>

#define DATA_CORRUPTED  (code_t)-1
typedef uint8_t code_t;

/*
    Encode input (4 bits (from right)) to 8 bits frame

    PARAMS
    @IN input - input code (only first 4 bits are used)

    RETURN
    Frame with data from input and calc hamming code
*/
code_t encode(code_t input);

/*
    Decode data (4 bits (from right)) from 8 bits frame

    PARAMS
    @IN input - 8 bits frame

    RETURN
    Decoded data iff success
    DATA_CORRUPTED iff failure
*/
code_t decode(code_t output);

#endif
