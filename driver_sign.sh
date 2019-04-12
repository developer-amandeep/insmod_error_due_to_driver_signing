PROJ_DIR="/local/mnt/workspace/"
TARGET="msm8952"

PUB_KEY=$PROJ_DIR/out/target/product/$TARGET/obj/kernel/msm-4.4/certs/signing_key.x509
PRIV_KEY=$PROJ_DIR/out/target/product/$TARGET/obj/kernel/msm-4.4/certs/signing_key.pem
HASH_ALGO=$(sudo cat $PROJ_DIR/out/target/product/$TARGET/obj/KERNEL_OBJ/.config | grep CONFIG_MODULE_SIG_HASH | cut -d'=' -f2 | sed 's/\"//g')
SCRIPT_FILE=$PROJ_DIR/out/target/product/$TARGET/obj/kernel/msm-4.4/scripts/sign-file

echo "\033[0;32mUsing\033[0m"
echo "\033[0;33mHASH_ALGO\033[0m\t=\t"$HASH_ALGO
echo "\033[0;33mPRIV_KEY\033[0m\t=\t"$PRIV_KEY
echo "\033[0;33mPUB_KEY\033[0m\t\t=\t"$PUB_KEY
echo "\033[0;33mSCRIPT_FILE\033[0m\t=\t"$SCRIPT_FILE
echo "\n"

echo "Signing the module now"
cmd=$SCRIPT_FILE" "$HASH_ALGO" "$PRIV_KEY" "$PUB_KEY" "$1
$cmd
echo "Signing of the file is done"
