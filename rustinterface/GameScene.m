
#import "GameScene.h"
#import "rust_interop.h"


@implementation GameScene

-(void)didMoveToView:(SKView *)view {
    self.backgroundColor = [SKColor colorWithRed:0.0 green:0.0 blue:0.0 alpha:1.0];
    
    set_game_scene(self);
    new_game_state(42);
}

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    for (UITouch *touch in touches) {
        CGPoint location = [touch locationInNode:self];
        game_touch(location.x, location.y);
    }
}

-(void)update:(CFTimeInterval)currentTime {
    game_update();
}

@end



