./build-binutils.py \
-B src/binutils* \
-b tmp/binutils \
-t arm aarch64 \
-i /root/binutils \
--show-build-commands

out_dir=$PWD
cd /root
zip -r -9 binutils.zip binutils
cp binutils.zip $out_dir/binutils.zip