VHDL=ghdl
VHDL_FLAGS=

OBJ_DIR=./obj
SRC_DIR=./src
GTKWAVE_DIR=./gtkwave
STOP_TIME=1ms

all: echo unit unit_tb

analyze: unit_tb
	$(VHDL) -r unit_tb --vcd=$(GTKWAVE_DIR)/unit_tb.vcd --stop-time=$(STOP_TIME)

echo: $(SRC_DIR)/echo.vhdl
	$(VHDL) -a --workdir=$(OBJ_DIR) $(SRC_DIR)/$@.vhdl && \
	$(VHDL) -e --workdir=$(OBJ_DIR) $@

unit: $(SRC_DIR)/unit.vhdl
	$(VHDL) -a --workdir=$(OBJ_DIR) $(SRC_DIR)/$@.vhdl && \
	$(VHDL) -e --workdir=$(OBJ_DIR) $@

unit_tb: unit $(SRC_DIR)/unit_tb.vhdl
	$(VHDL) -a --workdir=$(OBJ_DIR) $(SRC_DIR)/$@.vhdl && \
	$(VHDL) -e --workdir=$(OBJ_DIR) $@

clean:
	rm -f $(OBJ_DIR)/*
	rm -f $(GTKWAVE_DIR)/*
	rm -f e~*
	rm -f echo
	rm -f unit
	rm -f unit_tb
