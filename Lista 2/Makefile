VHDL=ghdl
VHDL_FLAGS=

OBJ_DIR=./obj
SRC_DIR=./src
GTKWAVE_DIR=./gtkwave
STOP_TIME=1ms

all: gates multiplexer example example_tb xand selection selection_tb xand_tb

analyze: example_tb selection_tb xand_tb
	$(VHDL) -r example_tb --vcd=$(GTKWAVE_DIR)/example_tb.vcd --stop-time=$(STOP_TIME)
	$(VHDL) -r selection_tb --vcd=$(GTKWAVE_DIR)/selection_tb.vcd --stop-time=$(STOP_TIME)
	$(VHDL) -r xand_tb --vcd=$(GTKWAVE_DIR)/xand_tb.vcd --stop-time=$(STOP_TIME)

gates: $(SRC_DIR)/gates.vhdl
	$(VHDL) -a --workdir=$(OBJ_DIR) $(SRC_DIR)/$@.vhdl
	$(VHDL) -e --workdir=$(OBJ_DIR) gateAND
	$(VHDL) -e --workdir=$(OBJ_DIR) gateOR
	$(VHDL) -e --workdir=$(OBJ_DIR) gateNOT
	$(VHDL) -e --workdir=$(OBJ_DIR) gateXOR

xand: $(SRC_DIR)/xand.vhdl
	$(VHDL) -a --workdir=$(OBJ_DIR) $(SRC_DIR)/$@.vhdl && \
	$(VHDL) -e --workdir=$(OBJ_DIR) $@

xand_tb: xand $(SRC_DIR)/xand_tb.vhdl
	$(VHDL) -a --workdir=$(OBJ_DIR) $(SRC_DIR)/$@.vhdl && \
	$(VHDL) -e --workdir=$(OBJ_DIR) $@

multiplexer: $(SRC_DIR)/multiplexer.vhdl
	$(VHDL) -a --workdir=$(OBJ_DIR) $(SRC_DIR)/$@.vhdl && \
	$(VHDL) -e --workdir=$(OBJ_DIR) $@

example: gates $(SRC_DIR)/example.vhdl
	$(VHDL) -a --workdir=$(OBJ_DIR) $(SRC_DIR)/$@.vhdl && \
	$(VHDL) -e --workdir=$(OBJ_DIR) $@

example_tb: example $(SRC_DIR)/example_tb.vhdl
	$(VHDL) -a --workdir=$(OBJ_DIR) $(SRC_DIR)/$@.vhdl && \
	$(VHDL) -e --workdir=$(OBJ_DIR) $@

selection: $(SRC_DIR)/selection.vhdl
	$(VHDL) -a --workdir=$(OBJ_DIR) $(SRC_DIR)/$@.vhdl && \
	$(VHDL) -e --workdir=$(OBJ_DIR) $@

selection_tb: selection $(SRC_DIR)/selection_tb.vhdl
	$(VHDL) -a --workdir=$(OBJ_DIR) $(SRC_DIR)/$@.vhdl && \
	$(VHDL) -e --workdir=$(OBJ_DIR) $@

clean:
	rm -f $(OBJ_DIR)/*
	rm -f $(GTKWAVE_DIR)/*
	rm -f e~*
	rm -f gates
	rm -f multiplexer
	rm -f example
	rm -f example_tb
	rm -f xand
	rm -f xand_tb
	rm -f gateand gatenot gateor gatexor
	rm -f selection
	rm -f selection_tb
