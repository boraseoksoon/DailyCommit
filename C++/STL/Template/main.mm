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

/*
 * Struct Template
 */
template <char const *str>
struct X
{
    const char *GetString() const
    {
        return str;
    }
};

char global_string[] = "String";


/*
 * Class Template
 */

template <typename T>
class Test2 {
public:
    T getData(){
        return this->generalData;
    }
    
    void setData(T data) {
        generalData = data;
    }
    
private:
    T generalData;
};


// Class Template Specialized
template <typename T1, typename T2>
class Test {
    public:
    T1 Add(T1 a,T2 b) {
        cout << "일반 템플릿을 사용했습니다." << endl;
        return a + b;
    }
};

template <typename T1>
class Test <T1,float>
{
public:
    T1 Add(T1 a, float b) {
        cout << "부분 전문화 템플릿을 사용했습니다." << endl;
        return a + b;
    }
};

template<typename T, int Size=100>
class Stack {
public:
    explicit Stack( int size ) {
        m_Size = size;
        m_aData = new T[m_Size];
        Clear();
    }
    
    ~Stack() {
        delete[] m_aData;
    }
    // 초기화 한다.
    void Clear() {
        m_Count = 0;
    }
    // 스택에 저장된 개수
    int Count() {
        return m_Count;
    }
    // 저장된 데이터가 없는가?
    bool IsEmpty() {
        return 0 == m_Count ? true : false;
    }
    //데이터를담을수있는최대개수
    int GetStackSize() {
        return m_Size;
    }
    // 데이터를 저장한다.
    bool Push(T data)
    {
        // 저장할 수 있는 개수를 넘는지 조사한다.
        if( m_Count >= m_Size )
        {
            return false;
        }
        //저장후개수를하나늘릮다.
        m_aData[ m_Count ] = data;
        ++m_Count;
        return true;
    }

    // 스택에서 빼낸다.
    T Pop()
    {
        // 저장된 것이 없다면 0을 반환한다.
        if( m_Count  < 1 )
        {
            return 0;
        }
        //개수를하나감소후반환한다.
        --m_Count;
        return m_aData[ m_Count ];
    }
private:
    T* m_aData;
    int m_Count;
    int m_Size;
};

/*
 * Singleton template class
 */

template <typename T>
class Singleton {
private :
    static T* singletonObject;
public :
    Singleton(){  }
    ~Singleton(){}
    
    static T* getSingleton() {
        if (singletonObject == NULL) {
            return new T;
        }
    }
private:
};

template <typename T>
class PlainSingleton {
public:
    PlainSingleton(){}
    virtual ~PlainSingleton(){}
    
    static T* getSingleton() {
        if (_Singleton == NULL) {
            _Singleton = new T;
        }
        
        return (_Singleton);
    }
    
    static void release() {
        delete _Singleton;
        _Singleton = NULL;
    }
    
private:
    static T* _Singleton;
};

template <typename T> T* PlainSingleton<T>::_Singleton = NULL;


// class extends base singleton class for specific reason.
class PlainObject : public PlainSingleton<PlainObject> {

public :
    PlainObject() : _nValue(10) {}
    void setValue(int value) { _nValue = value; }
    int getValue() { return _nValue; }
    
private:
    int _nValue;
};


/*
 * Template function.
 */

namespace TMP_NAMESPACE
{
    template <typename T1, typename T2> T2 Sum(T1 a, T1 b) {
        return a + b;
    }
}

using namespace TMP_NAMESPACE;

// Template Style 1.
template <typename T>
T Min(T a, T b) {
    return a > b ? b : a;
}

// Template Style 1.

template <typename T1, typename T2> const T1& Max(const T1& a, const T2& b) {
    cout << "Max(const T& a, const T& b) Template version used." << endl;
    return a > b ? a : b;
}

// Template Function specialized.
template <> const double& Max(const double& a, const double& b) {
    cout << "Max(const double& a, const double& b) Specialized version used. " << endl;
    return a > b ? a : b;
}
// type mix in template is required to carefully use this.

// Non-type template
const int EVENT_HP_VALUE = 50; // HP to add
const int EVENT_EXP_VALUE = 30; // Expr to add
const int EVENT_MONEY_VALUE = 10000; // Cash to add

// Add specified value to it.
template <typename T, int VAL> T AddValueTo( T const& CurrentValue) {
    return CurrentValue + VAL;
}

int main(int argc, const char * argv[]) {
    
    @autoreleasepool {
        
        // insert code here...
        NSLog(@"Hello, World!");
        
        Test2 <const char*> t2;
        t2.setData("abc");
        cout << t2.getData() << endl;
        
        Test2 <int64_t> t;
        t.setData(1000);
        cout << t.getData() << endl;
        
        X<global_string> x;
        cout << x.GetString();
        
        // Class Template Specialized
        Test<int, int> test1;
        test1.Add(2, 3);
        Test<int, float> test2;
        test2.Add(2, 5.8f);
        
        // Test Stack class using Class Template
        Stack<int> kStack1(64);
        cout << "Stack Size? " << kStack1.GetStackSize() << endl;
        
        
        // Singleton Template Class Test
        PlainObject* plainObj1 = PlainObject::getSingleton(); cout << plainObj1->getValue() << endl;
        PlainObject* plainObj2 = PlainObject::getSingleton();
        plainObj2->setValue(20);
        cout << plainObj1->getValue() << endl;
        cout << plainObj2->getValue() << endl;

        
        NSString* objcStr1 = @"This is";
        NSString* objcStr2 = @"That are ";
        
        
        // Template with namespace
        NSUInteger strCount = TMP_NAMESPACE::Sum<NSUInteger, NSUInteger>(objcStr1.length, objcStr2.length);
        cout << "strCount : "<< strCount << endl;
        
        NSUInteger strCount2 = Sum<NSUInteger, NSUInteger>(objcStr1.length, objcStr2.length);
        cout << "strCount : "<< strCount2 << endl;
        
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
        cout << Char_HP <<"에서 이벤트에 의해" << AddValueTo<int, EVENT_HP_VALUE> (Char_HP) << " 로 변경" <<endl;
        float Char_EXP = 378.89f;
        cout << Char_EXP <<"에서 이벤트에 의해" << AddValueTo<float, EVENT_EXP_VALUE> (Char_EXP) << " 로 변경" <<endl;
        int64_t Char_MONEY = 34567890;
        cout << Char_MONEY <<"에서 이벤트에 의해" << AddValueTo<int64_t, EVENT_MONEY_VALUE> (Char_MONEY) << " 로 변경" <<endl;
    }
    
    return 0;
}
