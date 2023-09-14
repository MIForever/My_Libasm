CC = gcc
NASM = nasm
CFLAGS = -Wall -Wextra -I$(INCLUDE_DIR)
NASMFLAGS = -f elf64

SRC_C_DIR = source_c
SRC_ASM_DIR = source_assembly
INCLUDE_DIR = include
BUILD_DIR = build

SRC_C = $(wildcard $(SRC_C_DIR)/*.c)
SRC_ASM = $(wildcard $(SRC_ASM_DIR)/*.S)
HEADERS = $(wildcard $(INCLUDE_DIR)/*.h)

OBJ_C = $(patsubst $(SRC_C_DIR)/%.c,$(BUILD_DIR)/%.o,$(SRC_C))
OBJ_ASM = $(patsubst $(SRC_ASM_DIR)/%.S,$(BUILD_DIR)/%.o,$(SRC_ASM))

EXECUTABLES = $(patsubst $(SRC_C_DIR)/%.c,%,$(SRC_C))

all: $(BUILD_DIR) $(EXECUTABLES)

$(BUILD_DIR):
	mkdir -p $(BUILD_DIR)

$(EXECUTABLES): % : $(BUILD_DIR)/%.o $(OBJ_ASM)
	$(CC) -o $@ $(BUILD_DIR)/$@.o $(OBJ_ASM)

$(BUILD_DIR)/%.o: $(SRC_C_DIR)/%.c $(HEADERS)
	$(CC) $(CFLAGS) -c $< -o $@

$(BUILD_DIR)/%.o: $(SRC_ASM_DIR)/%.S
	$(NASM) $(NASMFLAGS) $< -o $@

clean:
	rm -f $(OBJ_C) $(OBJ_ASM)

fclean: clean
	rm -rf $(BUILD_DIR) $(EXECUTABLES)

re: fclean all

.PHONY: all clean fclean re
