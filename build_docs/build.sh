
rm -rf ./source/docs
#git checkout ./source
cp -rf ../docs/ ./source

make clean
make html

if [[ $? -eq 0 ]]; then
  echo "Sphinx build online documents successfully!"
else
  echo "Sphinx build online documents fault!"
  exit 1
fi

GH_PAGE_FOLDER=../gh_pages
rm -rf ${GH_PAGE_FOLDER}
mkdir -p ${GH_PAGE_FOLDER}
cd ${GH_PAGE_FOLDER}
git


