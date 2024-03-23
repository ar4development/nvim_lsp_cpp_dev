#include <iostream>

void hello(std::string name);

int main(){
  hello("Mavs");
}

void hello(std::string name){
  std::cout << "Hello, " << name << "!\n";
}
