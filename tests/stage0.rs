#![cfg(feature = "stage0")]
use std::process::Command;

#[test]
fn test_stage_0() {
    let output = Command::new("./target/debug/oxidar-ls")
        .args(["./test_dir"])
        .output()
        .expect("failed to execute process");

    assert!(output.status.success());
    assert_eq!(
        std::str::from_utf8(&output.stdout).expect("a utf8 string output"),
        "Hola Oxidar!\n"
    )
}
