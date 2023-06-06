VHDL=ghdl
VHDL_FLAGS=

OBJ_DIR=./obj
SRC_DIR=./src
GTKWAVE_DIR=./gtkwave
STOP_TIME=1ms


all: vhdl_txt statemachine statemachine_tb sm
analyze: statemachine_tb
	$(VHDL) -r statemachine_tb --vcd=$(GTKWAVE_DIR)/statemachine_tb.vcd --stop-time=$(STOP_TIME)

vhdl_txt: $(SRC_DIR)/vhdl_txt.vhdl
	$(VHDL) -a --workdir=$(OBJ_DIR) $(SRC_DIR)/$@.vhdl

statemachine: vhdl_txt $(SRC_DIR)/statemachine.vhdl
	$(VHDL) -a --workdir=$(OBJ_DIR) $(SRC_DIR)/$@.vhdl && \
	$(VHDL) -e --workdir=$(OBJ_DIR) $@

statemachine_tb: statemachine $(SRC_DIR)/statemachine_tb.vhdl
	$(VHDL) -a --workdir=$(OBJ_DIR) $(SRC_DIR)/$@.vhdl && \
	$(VHDL) -e --workdir=$(OBJ_DIR) $@

sm: vhdl_txt $(SRC_DIR)/sm.vhdl
	$(VHDL) -a --workdir=$(OBJ_DIR) $(SRC_DIR)/$@.vhdl && \
	$(VHDL) -e --workdir=$(OBJ_DIR) $@

clean:
	rm -f $(OBJ_DIR)/*
	rm -f $(GTKWAVE_DIR)/*
	rm -f e~*
	rm -f statemachine
	rm -f statemachine_tb
	rm -f sm
