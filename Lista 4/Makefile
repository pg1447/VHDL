VHDL=ghdl
VHDL_FLAGS=

OBJ_DIR=./obj
SRC_DIR=./src
GTKWAVE_DIR=./gtkwave
STOP_TIME=1ms


all: crc8 crc8_tb pack rom

analyze: crc8_tb
	$(VHDL) -r crc8_tb --vcd=$(GTKWAVE_DIR)/crc8_tb.vcd --stop-time=$(STOP_TIME)

crc8: $(SRC_DIR)/crc8.vhdl pack
	$(VHDL) -a --workdir=$(OBJ_DIR) $(SRC_DIR)/$@.vhdl && \
	$(VHDL) -e --workdir=$(OBJ_DIR) $@

crc8_tb: crc8 $(SRC_DIR)/crc8_tb.vhdl rom
	$(VHDL) -a --workdir=$(OBJ_DIR) $(SRC_DIR)/$@.vhdl && \
	$(VHDL) -e --workdir=$(OBJ_DIR) $@

pack: $(SRC_DIR)/pack.vhdl
	$(VHDL) -a --workdir=$(OBJ_DIR) $(SRC_DIR)/$@.vhdl

rom: $(SRC_DIR)/rom.vhdl
	$(VHDL) -a --workdir=$(OBJ_DIR) $(SRC_DIR)/$@.vhdl && \
	$(VHDL) -e --workdir=$(OBJ_DIR) rom_for_crc8

clean:
	rm -f $(OBJ_DIR)/*
	rm -f $(GTKWAVE_DIR)/*
	rm -f e~*
	rm -f crc8
	rm -f crc8_tb
	rm -f rom_for_crc8
