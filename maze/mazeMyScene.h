//
//  mazeMyScene.h
//  maze
//

//  Copyright (c) 2013 Melanie Cebula. All rights reserved.
//

#import <SpriteKit/SpriteKit.h>

@interface mazeMyScene : SKScene

typedef enum : uint8_t {
    ColliderTypeHero             = 1,

    ColliderTypeWall             = 8,
};

@end
