###
> - [Map in C++ Standard Template Library (STL)](https://www.geeksforgeeks.org/map-associative-containers-the-c-standard-template-library-stl/)
> - [C++ Loop through Map](https://stackoverflow.com/questions/26281979/c-loop-through-map)
> - [How to write an STL compatible container](https://medium.com/@vgasparyan1995/how-to-write-an-stl-compatible-container-fc5b994462c6)
> - [C++ Vectors](https://www.programiz.com/cpp-programming/vectors)
> - [How can I add two vectors in C++? ](https://www.reddit.com/r/cpp_questions/comments/vz261o/how_can_i_add_two_vectors_in_c/?rdt=53979)
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

> - [What is the best way to use a HashMap in C++?](https://stackoverflow.com/questions/3578083/what-is-the-best-way-to-use-a-hashmap-in-c)

```
#include <map>
#include <iostream>
#include <cassert>

int main(int argc, char **argv)
{
  std::map<std::string, int> m;
  m["hello"] = 23;
  // check if key is present
  if (m.find("world") != m.end())
    std::cout << "map contains key world!\n";
  // retrieve
  std::cout << m["hello"] << '\n';
  std::map<std::string, int>::iterator i = m.find("hello");
  assert(i != m.end());
  std::cout << "Key: " << i->first << " Value: " << i->second << '\n';
  return 0;
}
```
