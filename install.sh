current_dir=$(pwd)

sudo apt install make g++ python3 cmake -y

wget https://www.nsnam.org/releases/ns-allinone-3.42.tar.bz2
tar xfj ns-allinone-3.42.tar.bz2
cd ns-allinone-3.42/ns-3.42

echo -e "\n\n compiling NS3 using all available CPUs  ... \n"
./ns3 configure --build-profile=debug --enable-sudo --enable-examples --enable-tests
./ns3 build --jobs $(nproc)
mkdir -p ./testpy-output/
sudo chmod 777 ./testpy-output/
./test.py
./ns3 run first