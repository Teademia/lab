IMG_NAME =fs.img
IMG_SIZE_MB = 100

run: rootfs
	@cd os && make run
rootfs: apps img
	@sudo mount -o loop fs.img mnt
	@sudo cp user_apps/* mnt
	@sudo umount mnt
apps:
	@cd user && make build
	@cp user/target/riscv64gc-unknown-none-elf/release/* -r ./user_apps
	@find user_apps -depth -mindepth 1 -type d -exec rm -rf {} \;
	@rm user_apps/*.bin
	@rm user_apps/*.d

img:
	@dd if=/dev/zero of=$(IMG_NAME) bs=1M count=$(IMG_SIZE_MB)
	@mkfs.fat -F 32 $(IMG_NAME)

clean:
	@rm fs.img -f
	@cd os && rm target -rf
	@cd user && rm target -rf
	@cd fat32_fs && rm target -rf
	@rm user_apps/* -rf