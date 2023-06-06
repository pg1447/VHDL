VHDL=ghdl
VHDL_FLAGS=

OBJ_DIR=./obj
SRC_DIR=./src
GTKWAVE_DIR=./gtkwave
STOP_TIME=1ms

all: lfsr lossy_channel lossy_channel_tb hamming hamming_tb

analyze: hamming_tb lossy_channel_tb
	$(VHDL) -r hamming_tb --vcd=$(GTKWAVE_DIR)/hamming_tb.vcd --stop-time=$(STOP_TIME) && \
	$(VHDL) -r lossy_channel_tb --vcd=$(GTKWAVE_DIR)/lossy_channel_tb.vcd --stop-time=$(STOP_TIME)

lfsr: $(SRC_DIR)/lfsr.vhdl
	$(VHDL) -a --workdir=$(OBJ_DIR) $(SRC_DIR)/$@.vhdl && \
	$(VHDL) -e --workdir=$(OBJ_DIR) $@

lossy_channel: lfsr $(SRC_DIR)/lossy_channel.vhdl
	$(VHDL) -a --workdir=$(OBJ_DIR) $(SRC_DIR)/$@.vhdl && \
	$(VHDL) -e --workdir=$(OBJ_DIR) $@

lossy_channel_tb: lossy_channel $(SRC_DIR)/lossy_channel_tb.vhdl
	$(VHDL) -a --workdir=$(OBJ_DIR) $(SRC_DIR)/$@.vhdl && \
	$(VHDL) -e --workdir=$(OBJ_DIR) $@

hamming: $(SRC_DIR)/hamming.vhdl
	$(VHDL) -a --workdir=$(OBJ_DIR) $(SRC_DIR)/$@.vhdl

hamming_tb: lossy_channel hamming $(SRC_DIR)/hamming_tb.vhdl
	$(VHDL) -a --workdir=$(OBJ_DIR) $(SRC_DIR)/$@.vhdl && \
	$(VHDL) -e --workdir=$(OBJ_DIR) $@

clean:
	rm -f $(OBJ_DIR)/*
	rm -f $(GTKWAVE_DIR)/*
	rm -f e~*
	rm -f lfsr
	rm -f lossy_channel
	rm -f lossy_channel_tb
	rm -f hamming
	rm -f hamming_tb
