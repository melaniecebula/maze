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
        playerCharacter.physicsBody.allowsRotation = NO;
        
        [self addChild:playerCharacter];

        wallNode = [SKSpriteNode spriteNodeWithImageNamed:@"pokemonTree"];
        wallNode.size = CGSizeMake(30.0, 30.0);
        
        wallNode.position = CGPointMake(CGRectGetMidX(self.frame), 80.0);
        [self addChild:wallNode];
        
        //bottom left corner:
        [self createTreeWithPosition:(CGPointMake(0.0, 30.0))];
        [self createTreeWithPosition:(CGPointMake(30.0, 0.0))];
        
        //vertical column left of middle:
        [self createTreeWithPosition:(CGPointMake(90.0, 50.0))];
        [self createTreeWithPosition:(CGPointMake(90.0, 80.0))];
        [self createTreeWithPosition:(CGPointMake(90.0, 110.0))];
        [self createTreeWithPosition:(CGPointMake(90.0, 140.0))];
        [self createTreeWithPosition:(CGPointMake(90.0, 170.0))];
        [self createTreeWithPosition:(CGPointMake(90.0, 200.0))];
        [self createTreeWithPosition:(CGPointMake(60.0, 200.0))];
        [self createTreeWithPosition:(CGPointMake(60.0, 230.0))];
        [self createTreeWithPosition:(CGPointMake(60.0, 260.0))];
        [self createTreeWithPosition:(CGPointMake(30.0, 260.0))];
        [self createTreeWithPosition:(CGPointMake(0.0, 260.0))];
        [self createTreeWithPosition:(CGPointMake(30.0, 140.0))];
  
 
        //second bottom left corner row:
        [self createTreeWithPosition:(CGPointMake(30.0, 90.0))];
        [self createTreeWithPosition:(CGPointMake(0.0, 90.0))];
        [self createTreeWithPosition:(CGPointMake(00.0, 120.0))];
        
        [self createTreeWithPosition:(CGPointMake(190.0, 50.0))];
        [self createTreeWithPosition:(CGPointMake(190.0, 80.0))];
        [self createTreeWithPosition:(CGPointMake(190.0, 20.0))];
        [self createTreeWithPosition:(CGPointMake(220.0, 50.0))];
        
        //right top of mid:
        [self createTreeWithPosition:(CGPointMake(130.0, 175.0))];
        [self createTreeWithPosition:(CGPointMake(190.0, 145))];
        [self createTreeWithPosition:(CGPointMake(160.0, 145))];
        [self createTreeWithPosition:(CGPointMake(220.0, 145))];
        [self createTreeWithPosition:(CGPointMake(220.0, 175))];
        [self createTreeWithPosition:(CGPointMake(250, 145))];
        
        //right second from bottom corner:
        [self createTreeWithPosition:(CGPointMake(300.0, 90.0))];
        [self createTreeWithPosition:(CGPointMake(300.0, 60.0))];
        [self createTreeWithPosition:(CGPointMake(300.0, 190.0))];
        [self createTreeWithPosition:(CGPointMake(300.0, 220.0))];
        [self createTreeWithPosition:(CGPointMake(270.0, 230.0))];
        [self createTreeWithPosition:(CGPointMake(270.0, 260.0))];
        
        //center trees
        [self createTreeWithPosition:(CGPointMake(195.0, 195.0))];
        [self createTreeWithPosition:(CGPointMake(195.0, 225.0))];
        [self createTreeWithPosition:(CGPointMake(165.0, 225.0))];
        [self createTreeWithPosition:(CGPointMake(165.0, 255.0))];
        [self createTreeWithPosition:(CGPointMake(135.0, 255.0))];
        [self createTreeWithPosition:(CGPointMake(135.0, 285.0))];
        [self createTreeWithPosition:(CGPointMake(135.0, 315.0))];
        
        //top center
        [self createTreeWithPosition:(CGPointMake(135.0, 380.0))];
        [self createTreeWithPosition:(CGPointMake(165.0, 380.0))];
        [self createTreeWithPosition:(CGPointMake(195.0, 360.0))];
        [self createTreeWithPosition:(CGPointMake(135.0, 410.0))];
        [self createTreeWithPosition:(CGPointMake(105.0, 410.0))];
        [self createTreeWithPosition:(CGPointMake(220.0, 460.0))];
        [self createTreeWithPosition:(CGPointMake(190.0, 450.0))];
        
        //top left
        [self createTreeWithPosition:(CGPointMake(60.0, 390.0))];
        [self createTreeWithPosition:(CGPointMake(60.0, 360.0))];
        [self createTreeWithPosition:(CGPointMake(30.0, 360.0))];
        [self createTreeWithPosition:(CGPointMake(30.0, 330.0))];
        [self createTreeWithPosition:(CGPointMake(30.0, 450.0))];
        [self createTreeWithPosition:(CGPointMake(0.0, 370.0))];
        
        //top right
        [self createTreeWithPosition:(CGPointMake(300.0, 300.0))];
        [self createTreeWithPosition:(CGPointMake(300.0, 360.0))];
        [self createTreeWithPosition:(CGPointMake(270.0, 390.0))];
        [self createTreeWithPosition:(CGPointMake(270.0, 420.0))];
        [self createTreeWithPosition:(CGPointMake(300.0, 450.0))];
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
    //TODO:  make sure NONE of the trees can be yolo'd through
    
    wallNode.physicsBody = [SKPhysicsBody bodyWithRectangleOfSize:CGSizeMake(30.0, 30.0)];
    wallNode.physicsBody.dynamic = NO;
    wallNode.physicsBody.categoryBitMask = ColliderTypeWall;
    wallNode.physicsBody.collisionBitMask = ColliderTypeHero | ColliderTypeWall;
    wallNode.physicsBody.affectedByGravity = NO;
    wallNode.physicsBody.usesPreciseCollisionDetection = YES;
    wallNode.physicsBody.allowsRotation = NO;
    
    
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
    tree.physicsBody.allowsRotation = NO;
    
    [self addChild:tree];
    
}


@end
