
#import "GameScene.h"
#import "rust_code.h"

GameScene *active_game_scene;
void *game_state;

@implementation GameScene

-(void)didMoveToView:(SKView *)view {
    self.backgroundColor = [SKColor colorWithRed:0.0 green:0.0 blue:0.0 alpha:1.0];
    active_game_scene = self;
    game_state = new_game_state(42);
}

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    for (UITouch *touch in touches) {
        CGPoint location = [touch locationInNode:self];
        game_touch(game_state, location.x, location.y);
    }
}

-(void)update:(CFTimeInterval)currentTime {
    game_update(game_state);
}

@end



extern void app_log(const char *message) {
    NSLog(@"From Rust: %@", [NSString stringWithUTF8String:message]);
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
