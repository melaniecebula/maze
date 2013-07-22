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
        
        self.backgroundColor = [SKColor colorWithRed:0.1 green:0.35 blue:0.1 alpha:1.0];
        playerCharacter = [SKSpriteNode spriteNodeWithImageNamed:@"pokemonTrainer"];
        
        playerCharacter.size = CGSizeMake(30.0,30.0);
        
        playerCharacter.position = CGPointMake(CGRectGetMidX(self.frame),50.0);
        
        playerCharacter.physicsBody = [SKPhysicsBody bodyWithRectangleOfSize:CGSizeMake(30.0, 30.)];
        playerCharacter.physicsBody.categoryBitMask = ColliderTypeHero;
        playerCharacter.physicsBody.collisionBitMask = ColliderTypeWall;
        playerCharacter.physicsBody.affectedByGravity = NO;
        playerCharacter.physicsBody.usesPreciseCollisionDetection = YES;
        
        
        [self addChild:playerCharacter];

        wallNode = [SKSpriteNode spriteNodeWithImageNamed:@"pokemonTree"];
        wallNode.size = CGSizeMake(30.0, 30.0);
        
        wallNode.position = CGPointMake(CGRectGetMidX(self.frame), 80.0);
        [self addChild:wallNode];
        
    [self createTreeWithPosition:(CGPointMake(90.0, 50.0))];
    [self createTreeWithPosition:(CGPointMake(90.0, 80.0))];
    [self createTreeWithPosition:(CGPointMake(90.0, 110.0))];
    
    [self createTreeWithPosition:(CGPointMake(200.0, 50.0))];
    [self createTreeWithPosition:(CGPointMake(30.0, 250.0))];
    [self createTreeWithPosition:(CGPointMake(250.0, 50.0))];
        
    }
    return self;
}


-(void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event {
    
    
    for (UITouch *touch in touches) {
        CGPoint location = [touch locationInNode:self];
        
        playerCharacter.position = location;
        
        SKAction *action = [SKAction moveTo:location duration:1.0];
        [playerCharacter runAction:action];
        
    }
}



-(void)update:(CFTimeInterval)currentTime {
    /* Called before each frame is rendered */

    wallNode.physicsBody = [SKPhysicsBody bodyWithRectangleOfSize:CGSizeMake(30.0, 30.0)];
    wallNode.physicsBody.dynamic = NO;
    wallNode.physicsBody.categoryBitMask = ColliderTypeWall;
    wallNode.physicsBody.collisionBitMask = ColliderTypeHero | ColliderTypeWall;
    wallNode.physicsBody.affectedByGravity = NO;
    wallNode.physicsBody.usesPreciseCollisionDetection = YES;
    
}

-(void)createTreeWithPosition:(CGPoint)p {
    SKSpriteNode *tree = [SKSpriteNode spriteNodeWithImageNamed:@"pokemonTree"];
    tree.size = CGSizeMake(30.0, 30.0);
    tree.position = p;
    
    tree.physicsBody = [SKPhysicsBody bodyWithRectangleOfSize:CGSizeMake(30.0, 30.0)];
    tree.physicsBody.dynamic = NO;
    tree.physicsBody.categoryBitMask = ColliderTypeWall;
    tree.physicsBody.collisionBitMask = ColliderTypeHero | ColliderTypeWall;
    tree.physicsBody.affectedByGravity = NO;
    tree.physicsBody.usesPreciseCollisionDetection = YES;

    [self addChild:tree];
    
}


@end
