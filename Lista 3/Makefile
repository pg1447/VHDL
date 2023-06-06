VHDL=ghdl
VHDL_FLAGS=

CC=gcc
CFLAGS= -std=gnu99 -Wall -pedantic -Werror -O3

OBJ_DIR=./obj
SRC_DIR=./src
GTKWAVE_DIR=./gtkwave
STOP_TIME=1ms

all: simple simple_tb twoway twoway_tb lfsr_tb

analyze: simple_tb twoway_tb
	$(VHDL) -r simple_tb --vcd=$(GTKWAVE_DIR)/simple_tb.vcd --stop-time=$(STOP_TIME)
	$(VHDL) -r twoway_tb --vcd=$(GTKWAVE_DIR)/twoway_tb.vcd --stop-time=$(STOP_TIME)

simple: $(SRC_DIR)/simple.vhdl
	$(VHDL) -a --workdir=$(OBJ_DIR) $(SRC_DIR)/$@.vhdl && \
	$(VHDL) -e --workdir=$(OBJ_DIR) $@

simple_tb: simple $(SRC_DIR)/simple_tb.vhdl
	$(VHDL) -a --workdir=$(OBJ_DIR) $(SRC_DIR)/$@.vhdl && \
	$(VHDL) -e --workdir=$(OBJ_DIR) $@

twoway: $(SRC_DIR)/twoway.vhdl
	$(VHDL) -a --workdir=$(OBJ_DIR) $(SRC_DIR)/$@.vhdl && \
	$(VHDL) -e --workdir=$(OBJ_DIR) $@

twoway_tb: twoway $(SRC_DIR)/twoway_tb.vhdl
	$(VHDL) -a --workdir=$(OBJ_DIR) $(SRC_DIR)/$@.vhdl && \
	$(VHDL) -e --workdir=$(OBJ_DIR) $@

lfsr: $(SRC_DIR)/lfsr.vhdl
	$(VHDL) -a --workdir=$(OBJ_DIR) $(SRC_DIR)/$@.vhdl && \
	$(VHDL) -e --workdir=$(OBJ_DIR) $@

lfsr_tb: lfsr $(SRC_DIR)/lfsr_tb.vhdl $(SRC_DIR)/lfsr.c $(SRC_DIR)/lfsr_tb.c
	$(CC) $(CFLAGS) $(SRC_DIR)/*.c -o $@.out
	$(VHDL) -a --workdir=$(OBJ_DIR) $(SRC_DIR)/$@.vhdl && \
	$(VHDL) -e --workdir=$(OBJ_DIR) $@


clean:
	rm -f $(OBJ_DIR)/*
	rm -f $(GTKWAVE_DIR)/*
	rm -f e~*
	rm -f simple
	rm -f simple_tb
	rm -f twoway
	rm -f twoway_tb
	rm -f lfsr_tb.out
	rm -f lfsr_tb
	rm -f lfsr
