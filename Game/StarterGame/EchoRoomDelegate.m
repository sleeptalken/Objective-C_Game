//
//  EchoRoomDelegate.m
//  StarterGame
//
//  Created by Student2 on 4/2/13.
//  Copyright (c) 2013 Ringtuple, Inc. All rights reserved.
//

#import "EchoRoomDelegate.h"


@implementation EchoRoomDelegate

-(void)say:(NSString *)word fromRoom:(Room *)room
{
    NSMutableDictionary *userinfo = [[NSMutableDictionary alloc] initWithCapacity:10];
    NSString *echoeWord = [NSString stringWithFormat:@"%@ %@ %@", [word uppercaseString], [word uppercaseString], [word uppercaseString]];
    [userinfo setObject:echoeWord forKey:@"sound"];
    [[NSNotificationCenter defaultCenter] postNotificationName:@"soundFromRoom" object:room userInfo:[userinfo autorelease]];
}

-(BOOL)forceField{
    return YES;
}

-(void)passcode:(NSString *)word
{
    
}

@end
