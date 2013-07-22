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
    SKSpriteNode *wallNode;
    
}

@end

@implementation mazeMyScene

-(id)initWithSize:(CGSize)size {    
    if (self = [super initWithSize:size]) {
        /* Setup your scene here */
        
        self.backgroundColor = [SKColor colorWithRed:0.15 green:0.15 blue:0.3 alpha:1.0];

        
        playerCharacter = [SKSpriteNode spriteNodeWithImageNamed:@"Spaceship"];
        
        playerCharacter.size = CGSizeMake(10.0,10.0);
        
        playerCharacter.position = CGPointMake(50.0,50.0);
        
        playerCharacter.physicsBody = [SKPhysicsBody bodyWithRectangleOfSize:CGSizeMake(10.0, 10.)];
        playerCharacter.physicsBody.categoryBitMask = ColliderTypeHero;
        playerCharacter.physicsBody.collisionBitMask = ColliderTypeWall;
        playerCharacter.physicsBody.affectedByGravity = NO;
        playerCharacter.physicsBody.usesPreciseCollisionDetection = YES;
        
        SKAction *action = [SKAction moveByX:0
                                           y:300 duration:3.0];
        [playerCharacter runAction:action];
        
        [self addChild:playerCharacter];
        
        wallNode = [[SKSpriteNode alloc] initWithColor:[SKColor redColor] size:CGSizeMake(100.0, 10.0)];
        
        wallNode.position = CGPointMake(20.0, CGRectGetMidY(self.frame));
        [self addChild:wallNode];


        
        
    }
    return self;
}

/*
-(void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event {
    
    
    for (UITouch *touch in touches) {
        CGPoint location = [touch locationInNode:self];
        
        playerCharacter.position = location;
        
        SKAction *action = [SKAction moveTo:location duration:1.0];
        
        
    }
}

*/

-(void)update:(CFTimeInterval)currentTime {
    /* Called before each frame is rendered */

    wallNode.physicsBody = [SKPhysicsBody bodyWithRectangleOfSize:CGSizeMake(100.0, 10.0)];
    wallNode.physicsBody.dynamic = NO;
    wallNode.physicsBody.categoryBitMask = ColliderTypeWall;
    wallNode.physicsBody.collisionBitMask = ColliderTypeHero | ColliderTypeWall;
    wallNode.physicsBody.affectedByGravity = NO;
    wallNode.physicsBody.usesPreciseCollisionDetection = YES;
    
}

@end
