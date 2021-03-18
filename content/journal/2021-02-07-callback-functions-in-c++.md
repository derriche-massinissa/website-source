---
title: "Callback Functions in C++"
date: 2021-02-07T09:13:07+01:00
draft: false
categories: ["programming"]
tags: ["c++"]
---

I recently needed to implement a callback function in C++, so I decided to keep some notes here for future reference.

<!--more-->
The first thing we need is to include the `<functional>` library:
```c++
#include <functional>
```

This will let us use the `std::function` class template.  From [CppReference](https://en.cppreference.com/w/cpp/utility/functional/function):
> Class template std::function is a general-purpose polymorphic function wrapper. Instances of std::function can store, copy, and invoke any CopyConstructible Callable target -- functions, lambda expressions, bind expressions, or other function objects, as well as pointers to member functions and pointers to data members. 

Its syntax looks like this:
```c++
function<function_type(param_1_type, param_2_type)> name = functionName;
```

It basically lets you store a function like you would do with a variable, like so:
```c++
void bigFunction (int param)
{
	// Print the parameter
	std::cout << param << std::endl;
}

int main ()
{
	std::function<void(int)> littleFunction = myFunction;

	bigFunction(10);
	littleFunction(10);

	return 0;
}
```

Which will output the following:
```
10
10
```

As you can see, we can then use `littleFunction` just like `bigFunction`. And this works not only with free functions, but also lambda expressions and other function objects, as well as pointers to member functions from classes!

Knowing this, we can easily implement a callback mechanic:
```c++
// Takes in any function with "void" return type that takes a single
// "double" parameter
void activator (std::function<void(double)> callback)
{
	while (1) {
		// Main loop for asynchronous work
		break;
	}

	// Use the received "callback" parameter like a normal function once
	// the function is done
	callback(1.23456);
}

void printer (double param)
{
	std::cout << "Value is: " << param << std::endl;
}

int main ()
{
	// Call "activator" and send "printer" as a parameter
	activator(printer);

	return 0;
}
```

We just sent the `printer` function as a parameter to the `activator` function. It's just as easy as that!
