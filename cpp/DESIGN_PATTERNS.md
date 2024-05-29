### design patterns
- [C++ producer/consumer](https://www.tutorialspoint.com/producer-consumer-problem-and-its-implementation-with-cplusplus#:~:text=The%20producer%20adds%20data%20items,integrity%20of%20the%20shared%20data.) 
```
#include <queue>
#include <thread>
#include <mutex>
#include <condition_variable>

std::queue<int> buffer;
std::mutex mtx;
std::condition_variable cv;

void producer() {
   for (int i = 1; i <= 5; ++i) {
      std::lock_guard<std::mutex> lock(mtx);
      buffer.push(i);
      std::cout << "Produced: " << i << std::endl;
      cv.notify_one();
      std::this_thread::sleep_for(std::chrono::milliseconds(500));
   }
}

void consumer() {
   while (true) {
      std::unique_lock<std::mutex> lock(mtx);
      cv.wait(lock, [] { return !buffer.empty(); });
      int data = buffer.front();
      buffer.pop();
      std::cout << "Consumed: " << data << std::endl;
      lock.unlock();
      std::this_thread::sleep_for(std::chrono::milliseconds(1000));
   }
}

int main() {
   std::thread producerThread(producer);
   std::thread consumerThread(consumer);
    
   producerThread.join();
   consumerThread.join();

   return 0;
}
```
#### output
```
Produced: 1
Produced: 2
Produced: 3
Produced: 4
Produced: 5
Consumed: 1
Consumed: 2
Consumed: 3
Consumed: 4
Consumed: 5
```

