
#ifndef rustinterface_rust_code_h
#define rustinterface_rust_code_h

void *new_game_state(unsigned char count);
void game_update(void *game_state);
void game_touch(void* game_state, float x, float y);

#endif