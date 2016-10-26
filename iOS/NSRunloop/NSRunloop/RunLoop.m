//
//  RunLoop.m
//  NSRunloop
//
//  Created by Seoksoon Jang on 2016. 10. 26..
//  Copyright © 2016년 Seoksoon Jang. All rights reserved.
//

#import "RunLoop.h"

@implementation RunLoop

- (id)init
{
    self = [super init];
    
    if (self)
    {
        thread = [[NSThread alloc] initWithTarget:self selector:@selector(main) object:nil];
        lock   = [[NSLock alloc] init];
    }
    
    return self;
}

- (void) main
{
    [lock lock];
    
    [self performSelector:@selector(self) onThread:thread withObject:nil waitUntilDone:NO];
    
    // [[NSRunLoop currentRunLoop] run];
    
    while (![thread isCancelled])
    {
        NSLog(@"runloop running!");
        [[NSRunLoop currentRunLoop] runUntilDate:[NSDate dateWithTimeIntervalSinceNow:1]];
    }
    
    [lock unlock];
}

- (void) cancelJob {
    NSLog(@"cancelJob!");
    [NSObject cancelPreviousPerformRequestsWithTarget:self];
}

- (void) showMeSomething {
    NSLog(@"showMeSomething!!!");
    shouldKeepRunning = NO;
    // CFRunLoopStop(CFRunLoopGetCurrent());
}

- (void) timerTest {
    NSLog(@"timerTest!");
}

- (void)doSomething {
    // NSAutoreleasePool* pool = [[NSAutoreleasePool alloc] init];
    
    // add input source(timer) to runloop.
    /*
    [self performSelector:@selector(showMeSomething) withObject:nil afterDelay:1];
    [self performSelector:@selector(showMeSomething) withObject:nil afterDelay:1];
    [self performSelector:@selector(showMeSomething) withObject:nil afterDelay:1];
    [self performSelector:@selector(showMeSomething) withObject:nil afterDelay:1];
    [self performSelector:@selector(showMeSomething) withObject:nil afterDelay:1];
     */
    
    [self performSelector:@selector(showMeSomething) withObject:nil afterDelay:10];
    NSTimer* timer2 = [NSTimer timerWithTimeInterval:1.0 target:self selector:@selector(timerTest) userInfo:nil repeats:YES];
    
    // add input source(performSelector) to runloop.
    /*
    [[NSRunLoop currentRunLoop] addTimer:[NSTimer timerWithTimeInterval:1.0 target:self selector:@selector(timerTest) userInfo:nil repeats:YES] forMode:NSRunLoopCommonModes];
     */
    
    // runUntilDate
    /*
    NSRunLoop* myRunLoop = [NSRunLoop currentRunLoop];
    [myRunLoop addTimer:timer2 forMode:NSRunLoopCommonModes];
    [myRunLoop runUntilDate:[NSDate dateWithTimeIntervalSinceNow:10]];
     */
    
    // run : permanent running like while loop runloop runUntilDate:
    NSRunLoop* myRunLoop = [NSRunLoop currentRunLoop];
    [myRunLoop addTimer:timer2 forMode:NSRunLoopCommonModes];
    NSLog(@"!!!");
    // running here. However, there is no way to stop it.
    // [myRunLoop run];
    
    // so, if you need to stop, use below instead of this.
    shouldKeepRunning = YES; // global
    
    NSRunLoop* theRL = [NSRunLoop currentRunLoop];
    while (shouldKeepRunning) {
        NSLog(@"shouldKeepRunning");
        [theRL runUntilDate:[NSDate dateWithTimeIntervalSinceNow:1.0]];
    }
    
    // it does not reach this place.
    NSLog(@"???");
}

- (void) myMethod:(id)sender {
    
    while (1) {
        [NSThread sleepForTimeInterval:1.0];
        NSLog(@"testInvocation on myMethod!!!");
    }
}

- (void) testInvocation {
    NSInvocationOperation* op = [[NSInvocationOperation alloc] initWithTarget:self
                                                                     selector:@selector(myMethod:)
                                                                       object:nil];
    
    NSOperationQueue* queue = [[NSOperationQueue alloc] init];
    [queue setMaxConcurrentOperationCount:1];
    [queue addOperation:op];
}

- (void)start
{
    [thread start];
}

- (void)stop
{
    [thread cancel];
    
    [lock lock];
    [lock unlock];
}

- (void)performSelector:(SEL)aSelector target:(id)target withObject:(id)anObject
{
    [target performSelector:aSelector onThread:thread withObject:anObject waitUntilDone:NO];
}

@end
