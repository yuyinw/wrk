# wrk测试使用
## 静态参数
  参考test.lua
  调用命令
  ```
  ./wrk -t1 -c500 -d10s --latency  -s test.lua  http://ip:port/
  ```
## 动态参数
  1. 第一步，提前生生成动态参数，写入lu.txt ,参考lu.go
  2. 调用命令
  ```
  ./wrk -t1 -c500 -d10s --latency  -s create.lua  http://ip:port/
  ```
