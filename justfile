DISS := "phd_dissertation"

alias c := clean
alias b := build
alias s := spell
alias t := todo
alias l := longlines
alias f := format
alias w := warn

all: spell todo longlines format build warn compress

spell:
	@spell-check -a *.tex refs.bib

todo:
	@todo-finder *.tex refs.bib notes.org

longlines:
	@long-lines *.tex refs.bib notes.org

count:
    @texcount -brief -inc {{DISS}}.tex

build:
	@tex-build -l {{DISS}}.tex

warn:
	@tex-check {{DISS}}.log

format:
	@tex-fmt *.tex refs.bib

compress:
	@compress-pdf {{DISS}}.pdf

clean:
	@tex-clean
	@rm -fv *.bak
