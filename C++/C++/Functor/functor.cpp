#include <iostream>
using namespace std;
 
class AddClass 
{
public:
    // operator overloading.
    int operator()(int a, int b)
    {
        return a + b;
    }
};
 
int main()
{
    AddClass addClass;
 
    cout << "addClass(10, 20) : " << addClass(10, 20) << endl;
    cout << "AddClass()(10,20) : " << AddClass()(10,20) << endl;
    cout << "addClass.operator()(10,20) : " << addClass.operator()(10,20) << endl;
    return 0;
}
