//
//  main.m
//  STL
//
//  Created by Seoksoon Jang on 2016. 12. 18..
//  Copyright © 2016년 Seoksoon Jang. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <iostream>
#import <vector>
#include <deque>
#include <list>
#include <algorithm>
#include <set>
#include <map>

using namespace std;

int main(int argc, const char * argv[]) {
    
    @autoreleasepool {
        
        /*
        * vector
        */
        
        NSLog(@"*******************");
        NSLog(@"**** STL vector ******");
        NSLog(@"*******************");
        
        vector<int> v(10);
        
        for (int i = 0; i < v.size(); i++) {
            v[i] = i * 10;
        }
        

        for (int i = 0; i<v.size(); i++) {
            cout << v[i] << endl;
        }

        // like isEmpty
        cout << v.empty() << endl;

        v.push_back(-1);
        cout << v[10] << endl;
        
        // vector size reallocation
        v.resize(15);
        
        for (int i = 0 ; i < v.size(); i++) {
            cout << v[i] << endl;
        }
        
        vector<int> v1 = v;

        
        /*
        * deque
        */
        NSLog(@"*******************");
        NSLog(@"**** STL deque ******");
        NSLog(@"*******************");
        
        deque<int> d(5);
        
        for (int i = 0; i < d.size(); i ++) {
            // NSLog(@"deque[%d] : %d", );
            d[i] = i + 1;
        }
        
        d.push_back(10);
        d.push_front(0);
        
        for (int i = 0; i < d.size(); i ++) {
            // NSLog with C++ STL works very well.
            // NSLog(@"deque[%d] : %d", i, d[i]);
            cout << "deque[" << i << "] : " << d[i] << endl;
        }
        
        /*
        * list
        */
        
        NSLog(@"*******************");
        NSLog(@"**** STL list ******");
        NSLog(@"*******************");
        
        list<int> l;
        l.push_back(0);
        
        for (int i = 0; i < 10; i++) {
            l.push_back(i+1);
        }
        
        // #include <algorithm>
        list<int>::iterator itr = find(l.begin(), l.end(), 8);
        l.insert(itr,5);
        
        itr = find(l.begin(), l.end(), 7);
        l.erase(itr);
        
        for (list<int>::iterator itr = l.begin(); itr != l.end(); itr++) {
            cout << *itr << endl;
        }
        
        // list splice
        
        
        /*
        * Set
        */
        
        NSLog(@"*******************");
        NSLog(@"**** STL Set ******");
        NSLog(@"*******************");
        
        set<int> s;
        
        for (int i = 0; i < 10; i++) {
            s.insert(10 - i);
        }
        
        set<int>::iterator set_itr;
        
        set_itr = s.find(2);
        s.erase(set_itr);
        
        // set does NOT store duplicated data.
        s.insert(1);
        
        // set stores ordered data implemented by binary tree.
        for (set<int>::iterator itr = s.begin(); itr != s.end(); itr++) {
            // here, do not use => cout << *set_itr << endl;
            cout << *itr << endl;
        }
        
        
        
        /*
        * Multi-Set
        */
        
        NSLog(@"*******************");
        NSLog(@"**** STL Multi-Set ******");
        NSLog(@"*******************");
        
        
        /*
        * map
        */
        
        NSLog(@"*******************");
        NSLog(@"**** STL map ******");
        NSLog(@"*******************");
        
        // ASCII mapping using STL map.
        pair<char, int> x;
        map<char, int> m;
        
        for (char ch = 'a'; ch <= 'z'; ch++) {
            x.first = ch;
            x.second = (int)ch;
            m.insert(x);
        }
        
        map<char, int>::iterator map_itr = m.begin();
        
        for (map_itr = m.begin(); map_itr != m.end(); map_itr++) {
            cout << (*map_itr).first << " " << (*map_itr).second << endl;
        }
        
        map_itr = m.find('j');
        cout << "m.find('j') : " << (*map_itr).second << endl;
    }
    return 0;
}
