
#import <SpriteKit/SpriteKit.h>
#import "GameScene.h"

void set_game_scene(GameScene *scene);

// Functions externed from rust_code.a
void new_game_state(unsigned char count);
void game_update();
void game_touch(float x, float y);
