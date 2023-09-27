### [Prettify a JSON string in C++ from a .txt file](https://stackoverflow.com/questions/47834320/prettify-a-json-string-in-c-from-a-txt-file)
```
#include <cpprest/http_client.h>
#include <cpprest/filestream.h>
#include <iostream>
#include <sstream>
#include "json.hpp"



using namespace utility;                // string conversion
using namespace web;                    // URI 
using namespace web::http;              // HTTP commands
using namespace web::http::client;      // HTTP Client features
using namespace concurrency::streams;   // Asynch streams, like Node

using json = nlohmann::json;

int main()
{
auto fileStream = std::make_shared<ostream>();

// Open stream to output file.
pplx::task<void> requestTask = fstream::open_ostream(U("results.txt"))

.then([=](ostream outFile)

{
    *fileStream = outFile;

    http_client client //gets the info
    return client.request(methods::GET, stringBuilder.to_string());
})

    .then([=](http_response response)       // set up response handler
{
    printf("Received response status code:%u\n", response.status_code()); 

    return response.body().read_to_end(fileStream->streambuf());

})      

    .then([=](size_t)       // close file stream
{
    return fileStream->close();
})

    .then([=]()
{
    nlohmann::json j;
    std::ifstream i;
    i.open("results.txt"); // ?? <<< === this is where my question is
});

// Wait for all the outstanding I/O to complete, handle exceptions
try
{
    requestTask.wait();
}
catch (const std::exception &e) 
{
    printf("Error exception:%s\n", e.what());
  }


  return 0;
}
```
### SOLUTION
```
.then([=]()
    {

    // read a JSON file
    std::ifstream readFromFile("results.txt");
    if (readFromFile.is_open()) {

    nlohmann::json j;
    readFromFile >> j;

    // write prettified JSON to another file
    std::ofstream writeToFile("pretty.json");
    writeToFile << std::setw(4) << j << std::endl;

    readFromFile.close();
    writeToFile.close();
    }
    else {
        std::cout << "unable to open file";
    }

 });
```
### Choices:
> 1. You have two choices to prettify with nlohmann.
> 2. Uses dump which produces a string
```
int indent = 4;
nlohmann::json data;
data.dump(indent);
```
OR
```
std::ofstream o("pretty.json");
o << std::setw(4) << data << std::endl;
```