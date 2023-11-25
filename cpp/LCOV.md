### how to do a LCOV
[LCOV - the LTP GCOV extension](https://ltp.sourceforge.net/coverage/lcov.php)
[C++ using GCOV/LCOV in a CMake project](https://stackoverflow.com/questions/30345686/c-using-gcov-lcov-in-a-cmake-project)
[Code coverage testing of C/C++ projects using Gcov and LCOV](https://medium.com/@xianpeng.shen/use-gcov-and-lcov-to-perform-code-coverage-testing-for-c-c-projects-c85708b91c78#id_token=eyJhbGciOiJSUzI1NiIsImtpZCI6IjBlNzJkYTFkZjUwMWNhNmY3NTZiZjEwM2ZkN2M3MjAyOTQ3NzI1MDYiLCJ0eXAiOiJKV1QifQ.eyJpc3MiOiJodHRwczovL2FjY291bnRzLmdvb2dsZS5jb20iLCJhenAiOiIyMTYyOTYwMzU4MzQtazFrNnFlMDYwczJ0cDJhMmphbTRsamRjbXMwMHN0dGcuYXBwcy5nb29nbGV1c2VyY29udGVudC5jb20iLCJhdWQiOiIyMTYyOTYwMzU4MzQtazFrNnFlMDYwczJ0cDJhMmphbTRsamRjbXMwMHN0dGcuYXBwcy5nb29nbGV1c2VyY29udGVudC5jb20iLCJzdWIiOiIxMTExMDAyNjQxNDk3ODMzMjU0OTgiLCJlbWFpbCI6InBlcnJ5LmFuZGVyc29uQGdtYWlsLmNvbSIsImVtYWlsX3ZlcmlmaWVkIjp0cnVlLCJuYmYiOjE3MDA5MDI5MjMsIm5hbWUiOiJQZXJyeSBBbmRlcnNvbiIsInBpY3R1cmUiOiJodHRwczovL2xoMy5nb29nbGV1c2VyY29udGVudC5jb20vYS9BQ2c4b2NJUHI5UHZYZTQxYU50bHNTZ3ZIWmotOEZHVEJESWZuU29NWWlHcjBvdTJ2c0IyPXM5Ni1jIiwiZ2l2ZW5fbmFtZSI6IlBlcnJ5IiwiZmFtaWx5X25hbWUiOiJBbmRlcnNvbiIsImxvY2FsZSI6ImVuIiwiaWF0IjoxNzAwOTAzMjIzLCJleHAiOjE3MDA5MDY4MjMsImp0aSI6IjE5OTJlZWUyZjcyNjMyMDMxZTJiNTQ5NDk4MmUzM2YyZmM3ZWQ4N2QifQ.BebtlOaaBJb5JoqGuqjm4ijyJQgAn9KvecV8OPiiL7st2F-8jrL79Ew6ldIvx6WmZ--8L5LkTGRaMEUXKvqfsbKGmgIWPP6qniSRGb55EC3Qn5BBJ3aljAiuFoz6MIPnqnztcFMNHv1E2SrNrG5RcblfKIQAyiShiXvlKoIAC77aJUaNe9k8HZJAo02_L2rP1-8h5xNlaaUKJ32qGRj14AH0v0lOVSe0S5JINk8tLNE8e0LJ36CO_-1SPX2XxMfe7E8Ip4nrEs_nkoFIn7tidFS8nEBmM6Rv9-RFmcQPMYSyITIW5cNxZ5JAD4gLab-CNHTMQwNBJNWKEd6goIhkkw)
[CodeCoverage.cmake](https://github.com/bilke/cmake-modules/blob/master/CodeCoverage.cmake)

[Code coverage analysis using CodeCoverage.cmake with multiple targets](https://stackoverflow.com/questions/52255589/code-coverage-analysis-using-codecoverage-cmake-with-multiple-targets)
[Detailed guide on using gcov with CMake/CDash?](https://stackoverflow.com/questions/13116488/detailed-guide-on-using-gcov-with-cmake-cdash)

### steps
```

sudo apt-get install libboost-all-dev

sudo apt install build-essential libssl-dev
wget https://github.com/Kitware/CMake/releases/download/v3.21.0/cmake-3.21.0.tar.gz
tar -zxvf cmake-3.21.0.tar.gz
cd cmake-3.21.0
./bootstrap
make 
sudo make install 


```
