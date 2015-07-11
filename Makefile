.PHONY: default server client deps fmt clean all release-all
export GOPATH:=$(shell pwd)

BUILDTAGS=debug
default: all

server:
	go install -tags '$(BUILDTAGS)' cfs/main/cfsd

fmt:
	go fmt cfs/...

cfsmount:
	go install -tags '$(BUILDTAGS)' cfs/main/cfsmount

cfsget:
	go install -tags '$(BUILDTAGS)' cfs/main/cfsget

cfsput:
	go install -tags '$(BUILDTAGS)' cfs/main/cfsput

cfstool:
	go install -tags '$(BUILDTAGS)' cfs/main/cfstool

client: cfsmount cfsget cfsput cfstool cfsmount

all: fmt client server

clean:
	go clean -i -r cfs/...