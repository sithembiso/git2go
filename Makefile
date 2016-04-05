default: test

build-openssl:
	./script/build-openssl-static.sh

build-libssh2:
	./script/build-libssh2-static.sh

build-libgit2:
	./script/build-libgit2-static.sh

build-httpparser:
	./script/build-http-parser-static.sh

test: build-libgit2
	go run script/check-MakeGitError-thread-lock.go
	./script/with-static.sh go test ./...

install-all: build-openssl build-httpparser build-libssh2 build-libgit2
	./script/with-static-all.sh go install ./...

install: build-libgit2
	./script/with-static.sh go install ./...
