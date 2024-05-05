### recommandations on reading decimals propelry
 - [C++: Parse decimal from stream into uint8_t](https://stackoverflow.com/questions/71710930/c-parse-decimal-from-stream-into-uint8-t)
 ```
 struct read_uint8 {
    std::uint8_t& v;
    read_uint8(std::uint8_t& v) : v(v) {}
};

inline std::istream& operator>>(std::istream& is, read_uint8 v) {
    unsigned short temporary;
    is >> temporary;
    if (is) {
        if (temporary > UINT8_MAX) {
            is.setstate(std::ios_base::failbit);
        } else {
            v.v = std::uint8_t(temporary);
        }
    }
    return is;
}

int main() {
    std::uint8_t actual;
    if (!(std::cin >> read_uint8(actual))) {
        // error
    }
}
 ```
- [std::setprecision](https://en.cppreference.com/w/cpp/io/manip/setprecision)
```
#include <iomanip>
#include <iostream>
#include <limits>
#include <numbers>
 
int main()
{
    constexpr long double pi{std::numbers::pi_v<long double>};
 
    const auto default_precision{std::cout.precision()};
    constexpr auto max_precision{std::numeric_limits<long double>::digits10 + 1}; 
 
    std::cout << "default precision: " << default_precision << '\n'
              << "maximum precision: " << max_precision << "\n\n"
                 "precision: pi:\n";
 
    for (int p{0}; p <= max_precision; ++p)
        std::cout << std::setw(2) << p << "  " << std::setprecision(p) << pi << '\n';
 
    std::cout << std::setprecision(default_precision); // restore defaults
}```
