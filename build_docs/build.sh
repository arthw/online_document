TEST=0
PUSH_TO=0

WORK_DIR=../build_tmp
rm -rf ${WORK_DIR}
mkdir -p ${WORK_DIR}
cp -rf ./* ${WORK_DIR}

if [ ! -d env_sphinx ]; then
    bash pip_set_env.sh
fi
source env_sphinx/bin/activate

cd ${WORK_DIR}
cp -rf ../docs/ ./source

make clean
make html

if [[ $? -eq 0 ]]; then
  echo "Sphinx build online documents successfully!"
else
  echo "Sphinx build online documents fault!"
  exit 1
fi

if [[ ${TEST} -ne 1 ]]; then
  git config pull.rebase true
  git pull
  git checkout -b gh-pages
  git branch --set-upstream-to=origin/gh-pages gh-pages
  git fetch origin gh-pages
  git reset --hard FETCH_HEAD
  git clean -df

  git fetch origin
  git reset --hard origin/gh-pages
  echo 5
else
  echo "skip pull gh-pages"
fi

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

if [[ ${PUSH_TO} -eq 1 ]]; then
  git add ${LATEST_FOLDER} ${DST_FOLDER} ../versions.html
  git commit -m "update for ${VERSION}"
  git push origin gh-pages
else
  echo "Skip push"	
fi

if [[ $? -eq 0 ]]; then
  echo "push online documents successfully!"
else
  echo "push build online documents fault!"
  exit 1
fi

exit 0
