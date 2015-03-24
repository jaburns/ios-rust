
#import "rust_interop.h"


GameScene *active_game_scene;


void set_game_scene(GameScene *scene) {
    active_game_scene = scene;
}

extern void app_log(const char *message) {
    NSLog(@"From Rust: %@  ", [NSString stringWithUTF8String:message]);
}

extern void make_ship(float x, float y) {
    SKSpriteNode *sprite = [SKSpriteNode spriteNodeWithImageNamed:@"Spaceship"];
    sprite.xScale = 0.2;
    sprite.yScale = 0.2;
    sprite.position = CGPointMake(x, y);
    
    SKAction *action = [SKAction rotateByAngle:M_PI duration:1];
    [sprite runAction:[SKAction repeatActionForever:action]];
    [active_game_scene addChild:sprite];
}