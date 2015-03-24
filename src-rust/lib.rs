
mod game;

use game::GameState;

extern {
    fn app_log(message: *const u8);
    fn make_ship(x: f32, y: f32);
}

#[no_mangle]
pub extern fn game_touch(state: *mut GameState, x: f32, y: f32) {
    unsafe {
        make_ship(x, y);
    }
}

#[no_mangle]
pub extern fn new_game_state(count: u8) -> *mut GameState {
    let mut game_state = Box::new(GameState::new(count));
    println!("GameState init");
    &mut *game_state
}

#[no_mangle]
pub extern fn game_update(state: *mut GameState) {
    unsafe {
        (*state).update();
        app_log(format!("Counter set to {}", (*state).get_count()).as_ptr());
    }
}

