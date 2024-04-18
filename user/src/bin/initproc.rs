#![no_std]
#![no_main]

#[macro_use]
extern crate user_lib;

use user_lib::{exec, fork, wait, yield_};

#[no_mangle]
fn main() -> i32 {
    if fork() == 0 {
        //这里fork出的子进程,执行一个shell
        exec("user_shell\0");
    } else {
        //这里是initproc任务进程
        loop {
            //wait()的参数是exit_code,
            //如果不是0,则这个会将子进程返回值的地址保存到 exit_code
            //如果是0 则不会保存子进程的返回值
            let mut exit_code: i32 = 0;
            let pid = wait(&mut exit_code);
            //当wait的返回值为-1时,表示你要等待的进程不存在,这里wait等待任意进程,也就是说没有进程需要清理
            if pid == -1 {
                yield_();
                continue;
            }
            println!(
                "[initproc] Released a zombie process, pid={}, exit_code={}",
                pid, exit_code,
            );
        }
    }
    0
}
