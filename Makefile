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
	- $(RM) -r test/
	- $(RM) -r .stack-work
	- $(RM) -r dist-newstyle

tests_run:
	stack test --coverage
	mkdir -p test/coverage/
	stack hpc report --all --destdir test/coverage/

.PHONY: clean fclean tests_run

re: fclean
	$(MAKE) -C .
