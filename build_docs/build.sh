
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


git checkout -b gh-pages
git branch --set-upstream-to=origin/gh-pages gh-pages
git pull
git fetch origin
git reset --hard origin/gh-pages

VERSION=`cat source/version.txt`
DST_FOLDER=../${VERSION}
LATEST_FOLDER=../latest
SRC_FOLDER=build/html

rm -rf ${DST_FOLDER}/*
mkdir -p ${DST_FOLDER}
cp -r ${SRC_FOLDER}/* ${DST_FOLDER}

python update_html.py ${DST_FOLDER} ${VERSION}

rm -rf ${LATEST_FOLDER}/*
mkdir -p ${LATEST_FOLDER}
cp -r ${SRC_FOLDER}/* ${LATEST_FOLDER}
python update_html.py ${LATEST_FOLDER} ${VERSION}

git add ${LATEST_FOLDER} ${DST_FOLDER} ../versoins.html
git commit -m "update for ${VERSION}"
git push origin gh-pages

