# Instructions for TouchID compilation

### Generate java class header
````
javac TouchID.java
javac -h . TouchID.java
````

### Compile objective-c++ code
````
g++ -dynamiclib -o libTouchIDNative.dylib \
-I /Users/emir/Library/Java/JavaVirtualMachines/corretto-17.0.12/Contents/Home/include \
-I /Users/emir/Library/Java/JavaVirtualMachines/corretto-17.0.12/Contents/Home/include/darwin \
-framework Foundation -framework LocalAuthentication \
TouchIDNative.mm
````
## To Run program use 
````
java -Djava.library.path=. TouchID
````

# Warning:
## This code is tried on MacOS Sonoma 14.5 java 17 
