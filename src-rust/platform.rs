
mod ll {
    extern {
        pub fn app_log(message: *const u8);
        pub fn make_ship(x: f32, y: f32);
    }
}

pub fn app_log(message: &str) {
    unsafe { ll::app_log(message.as_ptr()) }
}

pub fn make_ship(x: f32, y: f32) {
    unsafe { ll::make_ship(x, y) }
}
