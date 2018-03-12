clean:
	rm *.dylib

hello:
	cobc HELLO.cbl
	cobcrun HELLO
