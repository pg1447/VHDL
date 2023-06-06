VHDL=ghdl
VHDL_FLAGS=

OBJ_DIR=./obj
SRC_DIR=./src
GTKWAVE_DIR=./gtkwave
STOP_TIME=1ms

all: clk_div clk_div_tb clk2 clk2_tb

analyze: clk_div_tb
	$(VHDL) -r clk_div_tb --vcd=$(GTKWAVE_DIR)/clk_div_tb.vcd --stop-time=$(STOP_TIME) && \
	$(VHDL) -r clk2_tb --vcd=$(GTKWAVE_DIR)/clk2_tb.vcd --stop-time=$(STOP_TIME)

clk_div: $(SRC_DIR)/clk_div.vhdl
	$(VHDL) -a --workdir=$(OBJ_DIR) $(SRC_DIR)/$@.vhdl && \
	$(VHDL) -e --workdir=$(OBJ_DIR) $@

clk_div_tb: clk_div $(SRC_DIR)/clk_div_tb.vhdl
	$(VHDL) -a --workdir=$(OBJ_DIR) $(SRC_DIR)/$@.vhdl && \
	$(VHDL) -e --workdir=$(OBJ_DIR) $@

clk2: $(SRC_DIR)/clk2.vhdl
	$(VHDL) -a --workdir=$(OBJ_DIR) $(SRC_DIR)/$@.vhdl && \
	$(VHDL) -e --workdir=$(OBJ_DIR) $@

clk2_tb: clk2 $(SRC_DIR)/clk2_tb.vhdl
	$(VHDL) -a --workdir=$(OBJ_DIR) $(SRC_DIR)/$@.vhdl && \
	$(VHDL) -e --workdir=$(OBJ_DIR) $@



clean:
	rm -f $(OBJ_DIR)/*
	rm -f $(GTKWAVE_DIR)/*
	rm -f e~*
	rm -f clk_div
	rm -f clk_div_tb
	rm -f clk2
	rm -f clk2_tb
