#Quick and nasty linux shell rebuild all

#Make transcc
echo "building transcc"
g++ -O3 -DNDEBUG -o ../bin/transcc_linux transcc/transcc.build/cpptool/main.cpp -lpthread

#Make makedocs
echo "building makedocs"
../bin/transcc_linux -target=C++_Tool -builddir=makedocs.build  -clean -config=release +CPP_GC_MODE=0 makedocs/makedocs.monkey
mv makedocs/makedocs.build/cpptool/main_linux ../bin/makedocs_linux
rm -rf makedocs/makedocs.build

#Make mserver
echo "building mserver"
../bin/transcc_linux "-target=Desktop_Game_(Glfw3)" -builddir=mserver.build -clean -config=release +CPP_GC_MODE=1 mserver/mserver.monkey
mv mserver/mserver.build/glfw3/gcc_linux/Release/MonkeyGame ../bin/mserver_linux
rm -rf mserver/mserver.build

#Make launcher
echo "building launcher"
../bin/transcc_linux -target=C++_Tool -builddir=launcher.build -clean -config=release +CPP_GC_MODE=0 launcher/launcher.monkey
mv launcher/launcher.build/cpptool/main_linux ../Monkey
rm -rf launcher/launcher.build

#Make ted
echo "building ted"
rm -rf build-ted-Desktop-Release
mkdir build-ted-Desktop-Release
cd build-ted-Desktop-Release
qmake ../ted/ted.pro
make
cd ..
rm -rf build-ted-Desktop-Release
