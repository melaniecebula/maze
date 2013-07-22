//
//  mazeMyScene.m
//  maze
//
//  Created by Melanie Cebula on 7/22/13.
//  Copyright (c) 2013 Melanie Cebula. All rights reserved.
//

#import "mazeMyScene.h"
@interface mazeMyScene () {
 SKSpriteNode *playerCharacter;
}


@end

@implementation mazeMyScene

-(id)initWithSize:(CGSize)size {    
    if (self = [super initWithSize:size]) {
        /* Setup your scene here */
        
        self.backgroundColor = [SKColor colorWithRed:0.15 green:0.15 blue:0.3 alpha:1.0];
        /*
        SKLabelNode *myLabel = [SKLabelNode labelNodeWithFontNamed:@"Chalkduster"];
        
        myLabel.text = @"Hello, World!";
        myLabel.fontSize = 30;
        myLabel.position = CGPointMake(CGRectGetMidX(self.frame),
                                       CGRectGetMidY(self.frame));
         */
        playerCharacter = [SKSpriteNode spriteNodeWithImageNamed:@"Spaceship"];
        
        playerCharacter.size = CGSizeMake(10.0,10.0);
        
        playerCharacter.position = CGPointMake(50.0,50.0);
        [self addChild:playerCharacter];
        //[self addChild:myLabel];
    }
    return self;
}

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    /* Called when a touch begins */
    
    for (UITouch *touch in touches) {
        CGPoint location = [touch locationInNode:self];
        
        playerCharacter.position = location;
        
        SKAction *action = [SKAction moveTo:location duration:1.0];
        
        
    }
}

-(void)update:(CFTimeInterval)currentTime {
    /* Called before each frame is rendered */
}

@end
