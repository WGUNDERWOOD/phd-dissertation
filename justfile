DISS := "dissertation"

alias c := clean
alias d := diss
alias s := spell
alias t := todo
alias l := longlines
alias f := format
alias w := warn

all: spell todo longlines format diss warn

spell:
	@echo -e "\e[0;35m\033[1mChecking spelling...\e[0;30m\033[0m"
	@spell-check *.tex refs.bib

todo:
	@echo -e "\e[0;35m\033[1mChecking for todos...\e[0;30m\033[0m"
	@todo-finder *.tex refs.bib notes.org

longlines:
	@echo -e "\e[0;35m\033[1mChecking long lines...\e[0;30m\033[0m"
	@long-lines *.tex refs.bib notes.org

diss:
	@echo -e "\e[0;35m\033[1mBuilding dissertation document...\e[0;30m\033[0m"
	@tex-build {{DISS}}.tex

warn:
	@echo -e "\e[0;35m\033[1mChecking for warnings...\e[0;30m\033[0m"
	@tex-check {{DISS}}.log

format:
	@echo -e "\e[0;35m\033[1mFormatting...\e[0;30m\033[0m"
	@tex-fmt *.tex refs.bib

compress:
	@echo -e "\e[0;35m\033[1mCompressing...\e[0;30m\033[0m"
	@compress-pdf {{DISS}}.pdf

clean:
	@echo -e "\e[0;35m\033[1mCleaning...\e[0;30m\033[0m"
	@tex-clean
	@rm -fv *.bak
