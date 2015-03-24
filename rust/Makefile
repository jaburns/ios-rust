
LIPO=lipo
RUSTC=rustc
LIB_MAIN=src/lib.rs
OUT_DIR=bin


default: all

all: rust_fat_lib.a

out_dir:
	mkdir -p bin


rust_fat_lib.a: lib-x64.a lib-x32.a lib-a64.a lib-a7s.a lib-a7.a
	pushd $(OUT_DIR) && $(LIPO) -create lib-x64.a lib-x32.a lib-a64.a lib-a7s.a lib-a7.a -o $@ && popd


lib-x64.a: src/*.rs out_dir
	$(RUSTC) --target=x86_64-apple-ios $(LIB_MAIN) --crate-type=staticlib -O -o $(OUT_DIR)/$@

lib-x32.a: src/*.rs out_dir
	$(RUSTC) --target=i386-apple-ios $(LIB_MAIN) --crate-type=staticlib -O -o $(OUT_DIR)/$@

lib-a64.a: src/*.rs out_dir
	$(RUSTC) --target=aarch64-apple-ios $(LIB_MAIN) --crate-type=staticlib -O -o $(OUT_DIR)/$@

lib-a7s.a: src/*.rs out_dir
	$(RUSTC) --target=armv7s-apple-ios $(LIB_MAIN) --crate-type=staticlib -O -o $(OUT_DIR)/$@

lib-a7.a: src/*.rs out_dir
	$(RUSTC) --target=armv7-apple-ios $(LIB_MAIN) --crate-type=staticlib -O -o $(OUT_DIR)/$@


clean:
	rm -rf $(OUT_DIR)

