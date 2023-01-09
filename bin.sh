DIRNAME="$(dirname $(realpath $0))"
OUT=$(pwd)/prebuilds

cd "$DIRNAME"
mkdir -p "$OUT"
make run ARGV="$1 $2" BIND="--bind $OUT:/home/ubuntu/out"
