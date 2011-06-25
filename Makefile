# makefile for tolua hierarchy

all:
	cd src/lib; gcc -c *.c -Iinclude -I../../../install/include -L../../../install/lib -llua
	ar rcsv libtolua++.a src/lib/*.o

	cd src/bin; gcc tolua.c toluabind.c -I../../include -I../../../install/include -L../.. -L../../../install/lib -llua -ltolua++ -lm -o ../../toluapp

install:
	mkdir -p ../install/bin
	cp libtolua++.a ../install/lib/.
	cp include/*.h ../install/include/.
	cp toluapp ../install/bin/.

clean:
	rm libtolua++.a src/lib/*.o toluapp
