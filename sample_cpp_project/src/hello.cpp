#include <iostream>
#include <format>

void hello(std::string name);

int main(){
  hello("Mavs");
}

void hello(std::string name){
  std::cout << std::format("Hello, {0}!\n", name);
}
