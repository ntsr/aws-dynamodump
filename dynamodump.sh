#!/bin/bash

. ./conf
echo '-r' ${AWS_REGION}
echo '--accessKey' ${AWS_ACCESS_KEY_ID}
echo '--secretKey' ${AWS_SECRET_ACCESS_KEY}
echo '-s' "${SRCTABLE}"

DESTDIR='./dump'
rm -rf ${DESTDIR}
mkdir ${DESTDIR}

docker run --rm -v $(pwd)/dump:/dump -t dynamodump:latest \
python dynamodump.py \
-m backup \
-r ${AWS_REGION} \
--accessKey ${AWS_ACCESS_KEY_ID} \
--secretKey ${AWS_SECRET_ACCESS_KEY} \
-s "${SRCTABLE}"

date=`date '+%Y%m%d_%H%M%S'`
tar zcvf dump_${date}.tar.gz ./dump
