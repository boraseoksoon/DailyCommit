//
//  Person.h
//  RealmSample
//
//  Created by Seoksoon Jang on 19/03/2019.
//  Copyright © 2019 JSS. All rights reserved.
//

#import "Dog.h"

#import <Foundation/Foundation.h>
#import <Realm/Realm.h>

NS_ASSUME_NONNULL_BEGIN

RLM_ARRAY_TYPE(Dog)
@interface Person : RLMObject
@property NSString             *name;
@property RLMArray<Dog *><Dog> *dogs;
@end

NS_ASSUME_NONNULL_END
