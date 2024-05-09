###
> - [Map in C++ Standard Template Library (STL)](https://www.geeksforgeeks.org/map-associative-containers-the-c-standard-template-library-stl/)
> - [C++ Loop through Map](https://stackoverflow.com/questions/26281979/c-loop-through-map)
> - [How to write an STL compatible container](https://medium.com/@vgasparyan1995/how-to-write-an-stl-compatible-container-fc5b994462c6)
> - [C++ Vectors](https://www.programiz.com/cpp-programming/vectors)
> - [How can I add two vectors in C++? ](https://www.reddit.com/r/cpp_questions/comments/vz261o/how_can_i_add_two_vectors_in_c/?rdt=53979)
> - [Why can't I make a vector of references?](https://stackoverflow.com/questions/922360/why-cant-i-make-a-vector-of-references)
```
#include <functional>
#include <string>
#include <vector>
#include <iostream>

int main()
{
    std::string hello = "Hello, ";
    std::string world = "everyone!";
    typedef std::vector<std::reference_wrapper<std::string>> vec_t;
    vec_t vec = {hello, world};
    vec[1].get() = "world!";
    std::cout << hello << world << std::endl;
    return 0;
}
```
> - [Writing containers for abstract types](https://cplusplus.com/forum/beginner/141299/)
```
class placeholder
{
public:
  virtual ~placeholder() {}
  virtual placeholder* clone() const=0;
};

//And this is the wrapper class template:

template<typename ValueType>
class holder : public placeholder
{
public:
  holder(ValueType const & value) : held(value) {}
  virtual placeholder* clone() const 
  {return new holder(held);}

private:
  ValueType held;
};

//The actual type erasing class any is a handle class that holds a pointer to the abstract base class:

class any
{
public:
  any() : content(0) {}

template
any(ValueType const & value) : content(new holder(value)) {}

any(any const & other) : 
  content(other.content ? other.content->clone() : 0) {}

~any() 
{delete content;}

// Implement swap as swapping placeholder pointers, assignment
// as copy and swap.

private:
  placeholder* content;
};
```
> - [Understanding Vector insert() in C++](https://www.digitalocean.com/community/tutorials/vector-insert-in-c-plus-plus)

```
#include <algorithm>
#include <vector>
template<typename T, template<typename> class C>
C<T> operator +(const C<T>& A, const C<T>& B) {
   C<T> result;
   std::transform(std::begin(A), std::end(A), std::begin(B), std::back_inserter(result), std::plus<T>{});

   return result;
}
```

```

// C++ program to illustrate the begin and end iterator
#include <iostream>
#include <map>
#include <string>
using namespace std;
 
int main()
{
    // Create a map of strings to integers
    map<string, int> mp;
 
    // Insert some values into the map
    mp["one"] = 1;
    mp["two"] = 2;
    mp["three"] = 3;
 
    // Get an iterator pointing to the first element in the
    // map
    map<string, int>::iterator it = mp.begin();
 
    // Iterate through the map and print the elements
    while (it != mp.end()) {
        cout << "Key: " << it->first
             << ", Value: " << it->second << endl;
        ++it;
    }
 
    return 0;
}

```