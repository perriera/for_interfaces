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
