
pub struct GameState {
    _counter: u8,
}

pub const GAME_STATE_ZERO: GameState = GameState {
    _counter: 0
};


impl GameState {
    pub fn new(count: u8) -> GameState {
        GameState {
            _counter: count
        }
    }

    pub fn update(&mut self) {
        self._counter += 1;
    }

    pub fn get_count(&self) -> u8 {
        self._counter
    }
}
