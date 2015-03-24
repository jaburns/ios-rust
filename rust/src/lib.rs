
mod game;
mod platform;

use game::GameState;

static mut game_state :GameState = game::GAME_STATE_ZERO;


#[no_mangle]
pub extern fn new_game_state(count: u8) {
    unsafe {
        game_state = GameState::new(count);
    }
}

#[no_mangle]
pub extern fn game_update() {
    unsafe {
        game_state.update();
        platform::app_log(&format!("Counter set to {}", game_state.get_count()));
    }
}

#[no_mangle]
pub extern fn game_touch(x: f32, y: f32) {
    platform::make_ship(x, y);
}
