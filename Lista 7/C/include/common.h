#ifndef COMMON_H
#define COMMON_H

/*
    Set of common useful functions

    Author: Michal Kukowski
    email: michalkukowski10@gmail.com

    LICENCE: GPL 3.0
*/

#include <compiler.h>

/* bits operations */
#define BIT(n)          (1ull << (n))
#define GET_BIT(n ,k)   (((n) & BIT(k)) >> (k))
#define SET_BIT(n, k)   ((n) |= BIT(k))
#define CLEAR_BIT(n, k) ((n) &= ~BIT(k))

#define SET_BIT_VALUE(n, k, val) \
    __extension__ \
    ({ \
        if (val) \
            SET_BIT(n, k); \
        else \
            CLEAR_BIT(n, k); \
    })
    
#define FLIP_BIT(n, k) (SET_BIT_VALUE(n, k, !(GET_BIT(n, k))))

#define GET_FLAG(n, flag)   CAST_TO_BOOL((n) & (flag))
#define SET_FLAG(n, flag)   ((n) |= (flag))
#define CLEAR_FLAG(n, flag) ((n) &= ~(flag))

/* swap a with b IFF types are the same */
#define SWAP(a ,b) \
    do{ \
        (void)type_var_check(a, b); \
        typeof(a) ______temp = (a); \
        (a) = (b); \
        (b) = ______temp; \
    } while (0);

/* free & NULL */
#define FREE(PTR) \
    do { \
        free(PTR); \
        (PTR) = NULL; \
    } while (0);

/* get array size IFF is declared on stack */
#define ARRAY_SIZE(ARR) (sizeof(ARR) / sizeof(ARR[0]))

/* get min IFF types are the same */
#define MIN(a, b) \
    __extension__ \
     ({ \
        typeof(a) ______a = (a); \
        typeof(b) ______b = (b); \
        (void)type_var_check(______a, ______b); \
        ______a < ______b ? ______a : ______b; \
    })

/* get max IFF types are the same */
#define MAX(a, b) \
    __extension__ \
    ({ \
        typeof(a) ______a = (a); \
        typeof(b) ______b = (b); \
        (void)type_var_check(______a, ______b); \
        ______a > ______b ? ______a : ______b; \
    })

#define ABS(x) \
    __extension__ \
    ({ \
        typeof(x) ______x = (x); \
        ______x < 0 ? -______x : ______x; \
    })

#define ODD(x)          ((x) & 1)
#define EVEN(x)         (!((x) & 1))
#define CAST_TO_BOOL(x) (!!(x))

/* hamming weight */
#define HAMM_WEIGHT_int(n)          (number_1_int(n))
#define HAMM_WEIGHT_long(n)         (number_1_long(n))
#define HAMM_WEIGHT_longlong(n)     (number_1_longlong(n))

/* hamming distance */
#define HAMM_DIST_int(n, k)        (number_1_int((n) ^ (k)))
#define HAMM_DIST_long(n, k)       (number_1_long((n) ^ (k)))
#define HAMM_DIST_longlong(n, k)   (number_1_longlong((n) ^ (k)))

/* rly fast way to count log2 of n */
#define LOG2_int(n)             ((sizeof(typeof(n)) << 3) - leading_0_int(n) - 1)
#define LOG2_long(n)            ((sizeof(typeof(n)) << 3) - leading_0_long(n) - 1)
#define LOG2_longlong(n)        ((sizeof(typeof(n)) << 3) - leading_0_longlong(n) - 1)

/* ESCAPE COLORS */
#define COLOR_RESET           "\033[0m"
#define COLOR_BLACK           "\033[30m"
#define COLOR_RED             "\033[31m"
#define COLOR_GREEN           "\033[32m"
#define COLOR_YELLOW          "\033[33m"
#define COLOR_BLUE            "\033[34m"
#define COLOR_MAGENTA         "\033[35m"
#define COLOR_CYAN            "\033[36m"
#define COLOR_WHITE           "\033[37m"
#define COLOR_BOLDBLACK       "\033[1m\033[30m"
#define COLOR_BOLDRED         "\033[1m\033[31m"
#define COLOR_BOLDGREEN       "\033[1m\033[32m"
#define COLOR_BOLDYELLOW      "\033[1m\033[33m"
#define COLOR_BOLDBLUE        "\033[1m\033[34m"
#define COLOR_BOLDMAGENTA     "\033[1m\033[35m"
#define COLOR_BOLDCYAN        "\033[1m\033[36m"
#define COLOR_BOLDWHITE       "\033[1m\033[37m"

/*
    Macro create static function for cmp whole array (type must by simple type)
*/
#define ARRAY_EQUAL(type) \
    static ___unused___ bool concat(array_equal_, type)(type *t1, type *t2, size_t size) \
    { \
        size_t i; \
        \
        if (t1 == NULL || t2 == NULL) \
            return false; \
        \
        for (i = 0; i < size; ++i) \
            if (t1[i] != t2[i]) \
                return false; \
        \
        return true; \
    }

/*
    Macro create static function for reversing whole array (type must by simple type)
*/
#define ARRAY_REVERSE(type) \
    static ___unused___ void concat(array_reverse_, type)(type *t, size_t size) \
    { \
        size_t i; \
        \
        if (t == NULL) \
            return; \
        \
        for (i = 0; i < (size >> 1); ++i) \
            SWAP(t[i], t[size - i - 1]); \
    }

/*
    Macro create static function for cmp 2 vars (type must by simple type)
*/
#define CMP(type) \
    static ___unused___ int concat(cmp_, type)(void *a, void *b) \
    { \
        if (a == NULL || b == NULL) \
            return -10000; \
        \
        if (*(type *)a < *(type *)b) \
            return -1; \
        \
        if (*(type *)a > *(type *)b) \
            return 1; \
        \
        return 0; \
    }

#endif
