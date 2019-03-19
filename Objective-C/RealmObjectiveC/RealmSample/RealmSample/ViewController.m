//
//  ViewController.m
//  RealmSample
//
//  Created by Seoksoon Jang on 19/03/2019.
//  Copyright © 2019 JSS. All rights reserved.
//

#import "ViewController.h"
#import "Dog.h"
#import "Person.h"

@interface ViewController () <UITextFieldDelegate>
@property (strong, nonatomic) IBOutlet UITextField *dogIDTextField;
@property (strong, nonatomic) IBOutlet UITextField *dogAgeTextField;
@property (strong, nonatomic) IBOutlet UITextField *dogNameTextField;

@property (strong, nonatomic) IBOutlet UITextField *searchTextField;
@property (strong, nonatomic) IBOutlet UILabel *dogIDLabel;
@property (strong, nonatomic) IBOutlet UILabel *dogAgeLabel;
@property (strong, nonatomic) IBOutlet UILabel *dogNameLabel;
- (IBAction)searchAction:(id)sender;
- (IBAction)deleteAction:(id)sender;
- (IBAction) addToDatabase:(id)sender;
- (IBAction)updateAction:(id)sender;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    self.dogIDTextField.delegate = self;
    self.dogAgeTextField.delegate = self;
    self.dogNameTextField.delegate = self;
    
    self.searchTextField.delegate = self;
    
    NSLog(@"fileURL : %@", [RLMRealmConfiguration defaultConfiguration].fileURL);
}


-(BOOL) textFieldShouldReturn:(UITextField *)textField {
    if ([textField isFirstResponder]) {
        [textField resignFirstResponder];
    }
    return YES;
}

- (IBAction) addToDatabase:(id)sender {
    // Use them like regular Objective‑C objects
    Dog *mydog = [[Dog alloc] init];
    
    mydog.identifier = self.dogIDTextField.text;
    mydog.name = self.dogNameTextField.text;
    mydog.age = self.dogAgeTextField.text.integerValue;
    
    mydog.picture = nil; // properties are nullable
    NSLog(@"Name of dog: %@", mydog.name);
    
    // Query Realm for all dogs less than 2 years old
    RLMResults<Dog *> *puppies = [Dog objectsWhere:@"age < 2"];
    NSLog(@"puppies.count : %ld", puppies.count); // => 0 because no dogs have been added to the Realm yet
    
    // Persist your data easily
    RLMRealm *realm = [RLMRealm defaultRealm];
    [realm transactionWithBlock:^{
        [realm addObject:mydog];
    }];
    
    // Queries are updated in realtime
    // puppies.count; // => 1
    NSLog(@"puppies.count : %ld", puppies.count); // => 0 because no dogs have been added to the Realm yet
}

- (IBAction)updateAction:(id)sender {
    //    // Query and update the result in another thread
    dispatch_async(dispatch_get_main_queue(), ^{
        NSString* updateIDString = self.dogIDTextField.text;
        NSString* updateNameString = self.dogNameTextField.text;
        NSUInteger updateAgeInteger = self.dogAgeTextField.text.integerValue;
        
        NSString* query = [NSString stringWithFormat:@"identifier == %@", self.searchTextField.text];
        
        dispatch_async(dispatch_queue_create("background", 0), ^{
            @autoreleasepool {
                Dog *updateDog = [[Dog objectsWhere:query] firstObject];
                RLMRealm *realm = [RLMRealm defaultRealm];
                [realm beginWriteTransaction];
                updateDog.identifier = updateIDString;
                updateDog.name = updateNameString;
                updateDog.age = updateAgeInteger;
                [realm commitWriteTransaction];
            }
        });
    });
    
}

- (IBAction)deleteAction:(id)sender {
    dispatch_async(dispatch_get_main_queue(), ^{
        NSString* query = [NSString stringWithFormat:@"identifier == %@", self.searchTextField.text];
        
        dispatch_async(dispatch_queue_create("background", 0), ^{
            @autoreleasepool {
                Dog *deleteDog = [[Dog objectsWhere:query] firstObject];
                RLMRealm *realm = [RLMRealm defaultRealm];
                [realm beginWriteTransaction];
                [realm deleteObject:deleteDog];
                 [realm commitWriteTransaction];
            }
        });
    });
    
    

    
    // delete a list
//    NSString* primaryKey = [NSString stringWithFormat:@"%@", self.searchTextField.text];
//    Dog* theDog = [Dog objectForPrimaryKey:primaryKey];
//
//    //Delete all of the items in John's wishlist
//    RLMRealm *realm = [RLMRealm defaultRealm];
//
//    [realm transactionWithBlock:^{
//        [realm deleteObjects:theDog.wishlist];
//    }];
}

- (IBAction)searchAction:(id)sender {
    // Query and update the result in another thread
    dispatch_async(dispatch_queue_create("background", 0), ^{
        @autoreleasepool {
            dispatch_async(dispatch_get_main_queue(), ^{
                [[self view] endEditing:YES];
                
                Dog *theDog = [[Dog objectsWhere:[NSString stringWithFormat:@"identifier == %@", self.searchTextField.text]] firstObject];
                
                self.dogIDLabel.text = theDog.identifier;
                self.dogAgeLabel.text = [NSString stringWithFormat:@"%ld", theDog.age];
                self.dogNameLabel.text = theDog.name;
            });
            
//            RLMRealm *realm = [RLMRealm defaultRealm];
//            [realm beginWriteTransaction];
//            theDog.age = 3;
//            [realm commitWriteTransaction];
        }
    });

}

@end
