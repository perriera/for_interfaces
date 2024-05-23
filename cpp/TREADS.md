#### `transaction_safe` and `synchronized`
- [Transactional memory](https://en.cppreference.com/w/cpp/language/transactional_memory)
>Transactional memory
> C++ C++ language Statements 
>	Work in progress This page is under construction
>	Experimental Feature The functionality described on this page is part of the Transactional Memory Technical 
> Specification ISO/IEC TS 19841:2015 (TM TS)

### `synchronized`

```
#include <iostream>
#include <thread>
#include <vector>
 
int f()
{
    static int i = 0;
    synchronized { // begin synchronized block
        std::cout << i << " -> ";
        ++i;       // each call to f() obtains a unique value of i
        std::cout << i << '\n';
        return i;  // end synchronized block
    }
}
 
int main()
{
    std::vector<std::thread> v(10);
    for (auto& t : v)
        t = std::thread([] { for (int n = 0; n < 10; ++n) f(); });
    for (auto& t : v)
        t.join();
}
```
### `transaction_safe`
> A function can be explicitly declared to be transaction-safe by using the keyword transaction_safe in its declaration.

```
extern volatile int * p = 0;
struct S
{
    virtual ~S();
};
int f() transaction_safe
{
    int x = 0;  // ok: not volatile
    p = &x;     // ok: the pointer is not volatile
    int i = *p; // error: read through volatile glvalue
    S s;        // error: invocation of unsafe destructor
}
```
