CC = gcc
CFLAGS = -std=gnu99 -Wall -pedantic -O3

PROJECT_DIR = $(shell pwd)

IDIR = $(PROJECT_DIR)/include
ODIR = $(PROJECT_DIR)/obj
SDIR = $(PROJECT_DIR)/src

EXEC = coder.out
SRCS = $(wildcard $(SDIR)/*.c)
OBJS = $(SRCS:$(SDIR)/%.c=$(ODIR)/%.o)
DEPS = $(wildcard $(IDIR)/*.h)

LIBS =

all: $(EXEC)

# To obtain object files#
$(ODIR)/%.o: $(SDIR)/%.c $(DEPS)
	$(CC) $(CFLAGS) -c $< -o $@ -I$(IDIR)

# link all together
$(EXEC): $(OBJS)
	$(CC) $(CFLAGS) -L$(LDIR) -I$(IDIR) $(OBJS) $(LIBS) -o $@

clean:
	rm -f $(ODIR)/*
	rm -f $(EXEC)
