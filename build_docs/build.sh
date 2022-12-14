
rm -rf ./source/docs
#git checkout ./source
cp -rf ../docs/ ./source

make clean
make html