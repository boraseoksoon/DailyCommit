//
//  RunLoop.h
//  NSRunloop
//
//  Created by Seoksoon Jang on 2016. 10. 26..
//  Copyright © 2016년 Seoksoon Jang. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface RunLoop : NSObject
{
    NSThread *thread;
    NSLock   *lock;
    BOOL shouldKeepRunning;
}

- (void)start;
- (void)stop;
- (void)performSelector:(SEL)aSelector target:(id)target withObject:(id)anObject;
- (void) testInvocation;
- (void)doSomething;
- (void) cancelJob;
@end
