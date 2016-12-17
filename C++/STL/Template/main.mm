//
//  main.m
//  Template
//
//  Created by Seoksoon Jang on 2016. 12. 17..
//  Copyright © 2016년 Seoksoon Jang. All rights reserved.
//

#import <Foundation/Foundation.h>

#import <iostream>
using namespace std;

// Style 1.

template <typename T>
T Min(T a, T b) {
    return a > b ? b : a;
}

// Style 2.
 // Template Function
template <typename T1, typename T2> const T1& Max(const T1& a, const T2& b) {
    cout << "Max(const T& a, const T& b) 템플릿 버전 사용" << endl;
    return a > b ? a : b;
}

// Template Function specialized.
template <> const double& Max(const double& a, const double& b) {
    cout << "Max(const double& a, const double& b) 전문화 버전 사용" << endl;
    return a > b ? a : b;
}
// type mix in template is required to carefully use this.


// Non-type template
const int EVENT_ADD_HP_VALUE = 50; // 이벤트에 의해 추가 될 HP 값
const int EVENT_ADD_EXP_VALUE = 30; // 이벤트에 의해 추가 될 경험치
const int EVENT_ADD_MONEY_VALUE = 10000; // 이벤트에 의해 추가 될 돈

// 지정된 값맊큼 더해준다.
template <typename T, int VAL> T AddValue( T const& CurValue)
{
    return CurValue + VAL;
}

int main(int argc, const char * argv[]) {
    
    @autoreleasepool {
        
        // insert code here...
        NSLog(@"Hello, World!");
        
        NSNumber* numberA = [NSNumber numberWithInt:1000];
        NSNumber* numberB = [NSNumber numberWithInt:2000];
        
        // works like charm below two all!
        NSLog(@"Objective-C and C++ mix in template, which one is bigger? : %@",  Max(numberA, numberB));
        NSLog(@"Objective-C and C++ mix in template, which one is bigger? : %@",  Max(numberA, numberB).description);
        
        // using C++ in Objective-C++ file.(.mm)
        double char1_mp = 300;
        double char1_sp = 400.25;
        double maxValue1 = Max(char1_mp, char1_sp );
        cout << "which one is bigger between char1_mp, char1_sp? : " << maxValue1 << endl;
        
        int char2_mp = 300;
        double char2_sp = 400.25;
        double maxValue2 = Max( char2_mp, char2_sp );
        cout << "which one is bigger between char2_mp, char2_sp? : " << maxValue2 << endl;
        
        // Style 1.
        int S1 = 300;
        int S2 = 200;
        
        cout << "S1, S2, which one is smaller? : " << Min(S1, S2) << endl;

        // Non-type template
        int Char_HP = 250;
        cout << Char_HP <<"에서 이벤트에 의해" << AddValue<int, EVENT_ADD_HP_VALUE> (Char_HP) << " 로 변경" <<endl;
        float Char_EXP = 378.89f;
        cout << Char_EXP <<"에서 이벤트에 의해" << AddValue<float, EVENT_ADD_EXP_VALUE> (Char_EXP) << " 로 변경" <<endl;
        int64_t Char_MONEY = 34567890;
        cout << Char_MONEY <<"에서 이벤트에 의해" << AddValue<int64_t, EVENT_ADD_MONEY_VALUE> (Char_MONEY) << " 로 변경" <<endl;
        
    }
    
    return 0;
}
