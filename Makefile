PWD := $(shell pwd)
RM := rm -rf
ECHO := echo

SRC := src
BIN := bin
OBJ := obj
INC := include
ETC := etc

HAD_OBJECTS := obj/pi_2_mmio.o obj/pi_2_dht_read.o obj/common_dht_read.o obj/main.o

CFLAGS := -Wall -g -O2 -c -I$(INC) --std=gnu99
LDFLAGS := -lrt
LIBS := 

default: $(BIN)/dht-read

$(BIN)/dht-read: $(HAD_OBJECTS)
	@$(ECHO) "[Link] $@"
	@mkdir -p $(@D)
	@$(CC) $(HAD_OBJECTS) $(LIBS) $(LDFLAGS) -o $@

$(OBJ)/%.o: $(SRC)/%.c
	@$(ECHO) "[Compile] $<"
	@mkdir -p $(@D)
	$(CC) $(CFLAGS) $< -o $@ 

clean:
	@$(ECHO) "[Cleanup]"
	@$(RM) $(BIN)/*
	@$(RM) $(OBJ)/*
	
install: default
	$(ECHO) "[Install]"
