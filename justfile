DISS := "dissertation"

alias c := clean

all: spell todo longlines format diss warn compress

spell:
	@echo -e "\e[0;35m\033[1mChecking spelling...\e[0;30m\033[0m"
	@spell-check {{DISS}}.tex refs.bib

todo:
	@echo -e "\e[0;35m\033[1mChecking for todos...\e[0;30m\033[0m"
	@todo-finder {{DISS}}.tex refs.bib notes.org

longlines:
	@echo -e "\e[0;35m\033[1mChecking long lines...\e[0;30m\033[0m"
	@long-lines {{DISS}}.tex refs.bib notes.org

diss:
	@echo -e "\e[0;35m\033[1mBuilding dissertation document...\e[0;30m\033[0m"
	@latexmk -rc-report- -pdf -quiet {{DISS}}.tex | \
		grep -v 'Latexmk: Nothing to do for' | grep '^.' || true

warn:
	@echo -e "\e[0;35m\033[1mChecking for warnings...\e[0;30m\033[0m"
	@tex-check {{DISS}}.log

format:
	@echo -e "\e[0;35m\033[1mFormatting...\e[0;30m\033[0m"
	@latexindent-fast {{DISS}}.tex refs.bib

compress:
	@echo -e "\e[0;35m\033[1mCompressing...\e[0;30m\033[0m"
	@compress-pdf {{DISS}}.pdf

clean:
	@echo -e "\e[0;35m\033[1mCleaning...\e[0;30m\033[0m"
	@tex-clean
	@rm -fv *.bak
