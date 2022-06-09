package main

import (
    "bufio"
    "fmt"
    "os"
)

var num = 100000

func main() {
    filePath := "lu.txt"
    file, err := os.OpenFile(filePath, os.O_WRONLY|os.O_CREATE, 0666)
    if err != nil {
        fmt.Println("文件打开失败", err)
    }
  
    defer file.Close()
 
    write := bufio.NewWriter(file)
    for i := 0; i < num; i++ {
	
        write.WriteString(fmt.Sprintf("{\"name\":\"name%d\",\"length\":128}\n", i) )
    }
   
    write.Flush()
}
