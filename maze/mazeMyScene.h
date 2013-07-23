//
//  mazeMyScene.h
//  maze
//

//  Copyright (c) 2013 Melanie Cebula. All rights reserved.
//

#import <SpriteKit/SpriteKit.h>

@interface mazeMyScene : SKScene <SKPhysicsContactDelegate>

typedef enum : uint8_t {
    ColliderTypeHero             = 1,
    ColliderTypePokemon          = 2,
    ColliderTypeWall             = 8,
};


@end
