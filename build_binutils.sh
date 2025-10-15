./build-binutils.py \
-B src/binutils* \
-b tmp/binutils \
-t arm aarch64 \
-i /home/binutils \
--show-build-commands

out_dir=$PWD
cd /home
zip -r -9 binutils.zip binutils
cp binutils.zip $out_dir/binutils.zip