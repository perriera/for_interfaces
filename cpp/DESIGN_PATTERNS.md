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

#### pc_no2 (same but with semaphores)
```
#include <iostream>
#include <queue>
#include <thread>
#include <semaphore.h>

std::queue<int> buffer;
sem_t emptySlots;
sem_t fullSlots;

void producer() {
    for (int i = 1; i <= 5; ++i) {
        sem_wait(&emptySlots);
        buffer.push(i);
        std::cout << "Produced: " << i << std::endl;
        sem_post(&fullSlots);
        std::this_thread::sleep_for(std::chrono::milliseconds(500));
    }
}

void consumer() {
    while (true) {
        sem_wait(&fullSlots);
        int data = buffer.front();
        buffer.pop();
        std::cout << "Consumed: " << data << std::endl;
        sem_post(&emptySlots);
        std::this_thread::sleep_for(std::chrono::milliseconds(1000));
    }
}

int main() {
    sem_init(&emptySlots, 0, 5);  // Maximum 5 empty slots in the buffer
    sem_init(&fullSlots, 0, 0);   // Initially, no full slots in the buffer

    std::thread producerThread(producer);
    std::thread consumerThread(consumer);

    producerThread.join();
    consumerThread.join();

    sem_destroy(&emptySlots);
    sem_destroy(&fullSlots);

    return 0;
}
```
#### output
```
Produced: 1
Consumed: 1
Produced: 2
Consumed: 2
Produced: 3
Produced: 4
Consumed: 3
Produced: 5
Consumed: 4
Consumed: 5
```

#### output with 'hello' message
```
Produced: 1
Consumed: 1
Produced: 2
hello
Consumed: 2
Produced: 3
Produced: 4
hello
Consumed: 3
Produced: 5
hello
Consumed: 4
hello
Consumed: 5
hello
```
