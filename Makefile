##
## EPITECH PROJECT, 2024
## rush1
## File description:
## Makefile
##

HC := ghc
BUILD_DIR := .build
HCFLAGS := -Wall -Wextra -Werror -O2
HCFLAGS += -outputdir $(BUILD_DIR)

NAME := pushswap_checker

# ↓ Source files
SRC := app/Main.hs
SRC += src/Utils.hs

all: $(NAME)

.PHONY: all

$(NAME):
	$(HC) -o $@ $(SRC) $(HCFLAGS)

.PHONY: $(NAME)

clean:
	$(RM) -r $(BUILD_DIR)

fclean: clean
	$(RM) $(NAME)

.PHONY: clean fclean

re: fclean
	$(MAKE) -C .
