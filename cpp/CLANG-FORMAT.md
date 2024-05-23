#### CLang
- [Clang 17.0.0git documentation](https://clang.llvm.org/docs/ClangFormatStyleOptions.html)
- [clang-format configurator](https://zed0.co.uk/clang-format-configurator/)

### Date & Time
- [C++ Date and Time](https://www.tutorialspoint.com/cplusplus/cpp_date_time.htm)
- [Date and Time Parsing in C++](https://www.geeksforgeeks.org/date-and-time-parsing-in-cpp/)
```
#include <iostream>
#include <ctime>

using namespace std;

int main() {
   // current date/time based on current system
   time_t now = time(0);
   
   // convert now to string form
   char* dt = ctime(&now);

   cout << "The local date and time is: " << dt << endl;

   // convert now to tm struct for UTC
   tm *gmtm = gmtime(&now);
   dt = asctime(gmtm);
   cout << "The UTC date and time is:"<< dt << endl;
}
```
### output
```
#include <iostream>
#include <ctime>

using namespace std;

int main() {
   // current date/time based on current system
   time_t now = time(0);

   cout << "Number of sec since January 1,1970 is:: " << now << endl;

   tm *ltm = localtime(&now);

   // print various components of tm structure.
   cout << "Year:" << 1900 + ltm->tm_year<<endl;
   cout << "Month: "<< 1 + ltm->tm_mon<< endl;
   cout << "Day: "<< ltm->tm_mday << endl;
   cout << "Time: "<< 5+ltm->tm_hour << ":";
   cout << 30+ltm->tm_min << ":";
   cout << ltm->tm_sec << endl;
}
```
### parsing time format
- [strftime](https://cplusplus.com/reference/ctime/strftime/#google_vignette)