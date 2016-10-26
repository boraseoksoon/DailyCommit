//
//  main.m
//  NSRunloop
//
//  Created by Seoksoon Jang on 2016. 10. 26..
//  Copyright © 2016년 Seoksoon Jang. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "RunLoop.h"

static int count = 0;
static int count2 = 0;
int main(int argc, const char * argv[]) {
    @autoreleasepool {
        // insert code here...
        
        /*
        RunLoop* runloop = [[RunLoop alloc] init];
        [runloop testInvocation];
        */
        
        [NSThread detachNewThreadWithBlock:^{
            RunLoop* runloop3 = [[RunLoop alloc] init];
            [runloop3 doSomething];
        }];
        
        RunLoop* runloop2 = [[RunLoop alloc] init];
        [runloop2 start];
        NSLog(@"check test");
        
        while (1) {
            count+=1;
            if (count > 10) {
                [runloop2 stop];
                break;
            }
            
            [NSThread sleepForTimeInterval:1.0];
        }
        
        NSLog(@"end of the main function");
    }
    return 0;
}
