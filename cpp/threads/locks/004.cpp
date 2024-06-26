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