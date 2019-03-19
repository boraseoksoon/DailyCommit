//
//  Model.h
//  RealmSample
//
//  Created by Seoksoon Jang on 19/03/2019.
//  Copyright © 2019 JSS. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <Realm/Realm.h>

NS_ASSUME_NONNULL_BEGIN

// Define your models like regular Objective‑C classes
@interface Dog : RLMObject
@property NSString *identifier;
@property NSString *name;
@property NSData   *picture;
@property NSInteger age;
@end


NS_ASSUME_NONNULL_END
