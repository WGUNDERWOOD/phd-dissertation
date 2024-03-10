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
	@spell-check *.tex refs.bib

todo:
	@todo-finder *.tex refs.bib notes.org

longlines:
	@long-lines *.tex refs.bib notes.org

diss:
	@tex-build {{DISS}}.tex

warn:
	@tex-check {{DISS}}.log

format:
	@tex-fmt *.tex refs.bib

compress:
	@compress-pdf {{DISS}}.pdf

clean:
	@tex-clean
	@rm -fv *.bak
