#### `transaction_safe` and `synchronized`
- [Transactional memory](https://en.cppreference.com/w/cpp/language/transactional_memory)
>Transactional memory
> C++ C++ language Statements 
>	Work in progress This page is under construction
>	Experimental Feature The functionality described on this page is part of the Transactional Memory Technical 
> Specification ISO/IEC TS 19841:2015 (TM TS)

### `timeout` 
- [How to implement timeout for function in c++](https://stackoverflow.com/questions/40550730/how-to-implement-timeout-for-function-in-c)
> I have got function f; I want to throw exception 1s after start f. I can't modify f(). It it possible to do it in c++?
```
try {
   f();
}
catch (TimeoutException& e) {
//timeout
}
```
> You can create a separate thread to run the call itself, and wait on a condition variable back in your main thread which will be signalled by the thread doing the call to f once it returns. The trick is to wait on the condition variable with your 1s timeout, so that if the call takes longer than the timeout you will still wake up, know about it, and be able to throw the exception - all in the main thread. Here is the code ([live demo here](https://coliru.stacked-crooked.com/)):

```
#include <iostream>
#include <chrono>
#include <thread>
#include <mutex>
#include <condition_variable>

using namespace std::chrono_literals;

int f()
{
    std::this_thread::sleep_for(10s); //change value here to less than 1 second to see Success
    return 1;
}

int f_wrapper()
{
    std::mutex m;
    std::condition_variable cv;
    int retValue;

    std::thread t([&cv, &retValue]() 
    {
        retValue = f();
        cv.notify_one();
    });

    t.detach();

    {
        std::unique_lock<std::mutex> l(m);
        if(cv.wait_for(l, 1s) == std::cv_status::timeout) 
            throw std::runtime_error("Timeout");
    }

    return retValue;    
}

int main()
{
    bool timedout = false;
    try {
        f_wrapper();
    }
    catch(std::runtime_error& e) {
        std::cout << e.what() << std::endl;
        timedout = true;
    }

    if(!timedout)
        std::cout << "Success" << std::endl;

    return 0;
}
```

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
