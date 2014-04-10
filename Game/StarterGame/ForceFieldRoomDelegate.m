//
//  ForceFieldRoomDelegate.m
//  StarterGame
//
//  Created by Student1 on 4/4/13.
//  Copyright (c) 2013 Ringtuple, Inc. All rights reserved.
//

#import "ForceFieldRoomDelegate.h"
#import "RoomDelegate.h"

@implementation ForceFieldRoomDelegate;

@synthesize magicWord;

-(id)init{
    self = [super init];
    if (self != nil){
    state = YES;
    magicWord = nil;
    }
    return self;
}

-(void)say:(NSString *)word fromRoom:(Room *)room{
    NSMutableDictionary *userinfo = [[NSMutableDictionary alloc] initWithCapacity:10];
    [userinfo setObject:word forKey:@"sound"];
    [[NSNotificationCenter defaultCenter] postNotificationName:@"soundFromRoom" object:self userInfo:[userinfo autorelease]];
}

-(BOOL)forceField{
    return state;
}

-(void)passcode:(NSString *)word{
    NSComparisonResult result = [magicWord compare:word];
    if (result == NSOrderedSame){
        state = !state;
    }
    
}


@end
