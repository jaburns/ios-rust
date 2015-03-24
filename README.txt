
pushd $SOMEWHERE
    git clone --depth 1 git@github.com:rust-lang/rust
    cd rust
    ./configure --target=x86_64-apple-darwin,armv7-apple-ios,armv7s-apple-ios,i386-apple-ios,aarch64-apple-ios,x86_64-apple-ios
    make && make install
popd

pushd $THIS_REPO/rust
    make
popd

xcodebuild
