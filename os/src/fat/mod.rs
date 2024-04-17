use crate::drivers::BLOCK_DEVICE;
use crate::println;
use alloc::string::String;
use alloc::sync::Arc;
use fat32_fs::*;
use lazy_static::*;
use log::info;
use xmas_elf::header;

lazy_static! {
    pub static ref ROOT_INODE: Arc<fat32_fs::VFile> = {
        let efs = FAT32Manager::open(BLOCK_DEVICE.clone());
        let root_inode = efs.get_root_vfile(&efs.clone());
        Arc::new(root_inode)
    };
}
pub fn ls_root_dir() {
    let dir = ROOT_INODE.ls().unwrap();
    if (dir.len() == 0) {
        info!("Find no app");
    }
    info!("Listing root dir for {} file", dir.len());
    for (filename, c) in dir {
        info!("{},{}", filename, c);
    }
}
