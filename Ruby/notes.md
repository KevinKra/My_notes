# Ruby Notes

#### History of Ruby

Ruby was released in 1994 by a developer known as Matz. Matz aimed to create a language that had the power and flexibility of Perl, but was more readable. Ruby's popularity kicked off in Japan and until the year 2000 nearly all of the documentation was written in Japanese. Dave Thomas, a pioneer of agile programming, created the first major form of Ruby documentation.

In the early 2000s, the Ruby community (mostly system admins) leveraged the language to work as a "glue", much like Perl had been used as previously. The first major push towards being adopted towards being a mainstream language occurred when the Danish engineer DHH extracted a web framework out of an application he had built, the focus was on convention over configuration with the aim of making problems easy to solve.

## Instructions & Interpreters

Ruby is an **interpreted language**, that means it cannot run directly on the CPU, rather it needs to be fed to a middleman called the **virtual machine** or VM. The VM compiles the code into a format that the CPU and OS can interpret. The virtual machine essentially allows Ruby to be platform independent since it will be translated into the appropriate machine relevant format.

A Ruby program cannot run on its own, it requires a VM. There are two ways to execute Ruby with the VM: through the **IRB** and through the command line.

#### Command Line

- A durable way to write code. Once written it can be backed up, transferred, added to source control, etc.

```
//Ruby version:
class SayHello
  def hello
    puts "Uh, hello."
  end
end

s = SayHello.new
s.hello

// command line:

ruby my_program_that_says_hello.rb
// Uh, hello.
```

```
//Javascript version:
class SayHello {
  hello() {
    return "Uh, hello."
  }
}

const s = new SayHello;

s.hello()
// Uh, hello.
```

#### IRB (REPL)

Ruby was among the first languages to popularize the REPL, which stands for "Read, Evaluate, Print, Loop". The Repl is great for quickly writing out functionality and experimenting. Many developers have an IRB window open while writing their actual program. With the IRB open they can test small pieces of functionality before implementing said functionality in the proper project.

> IRB can be opened by typing irb in the terminal.

_Summarize the history of Ruby_

- Ruby was initially popularized in Japan during the mid 90s, in the early 2000s the documentation for the language was written in english and it slowly gained popularity in the west. DHH extracted the web-framework format of the language and continued to develop the usability of the language. Ruby is designed to be readable and easy to comprehend.

_What is the relationship between an interpreted language, the VM, and the machine?_

- Ruby (also like Javascript), is a high-level interpreted language. That means it needs to be compiled into lower level languages, like C++ (NodeJS and Chrome's V8 engine compile Javascript into C++), machine code, and then into binary before it can be interpreted by the CPU. The VM, or virtual machine, handles the compiling of Ruby and makes the as a consequence makes the language more-or-less platform independent.

#### Key Technologies:

- Interpreted Language
- VM or Virtual Machine
- IRB (REPL)
- compiling

## Variables

Variables are an abstraction of data, or in other words they abstract away the complexities of remembering the data itself and instead storing that information in a predefined container. In some languages (like Java or C), engineers need to strictly define the type of data held in a variable.

For example, `int a = 5` translates to: "variable `a` must be assigned to an `integer` and must always be an `integer` type" otherwise you will receive an error during the compile phase. In contrast, Ruby is loosely typed (or dynamically typed) which means the type assignment to a variable can be changed at any given time. There are strengths and weaknesses to both paradigms.

Strictly typed:

```
int a = 5;
a = "dog"
// ERROR
```

Loosely typed:

```
Ruby
a = 5
a = "cat"
a
"cat"
```

```
// Javascript (handles both)
let a = 12;
a = "taco"
a
// "taco"

const a = 12;
a = "taco"
// ERROR
```

In some languages (like Javascript, at least if you're using `"use strict"`) you need to _declare_ a variable before assigning a value to it. Ruby does not require you, the developer, to write out your variable declarations. Rather, Ruby automatically creates variables when you assign a value to it.

```
// Javascript:
let a = 12;
a
// 12

// Ruby:
a = 24
a
// 24
```

In both Ruby and Javascript (and probably all other languages for that matter), code is interpreted from right to left. For instance `a = 5 + 2`, would be interpreted as "the sum of 5 + 2 is _assigned_ to a".

In regards to naming variables in the Ruby environment, the VM requires that they must always started with a lowercase letter (or undercase), have no space, and must not contain special characters like `$`, `@`, and `&`. Additionally, Rubyists have a few style conventions: using_snake_case and named after the meaning of their content.

ex: `count`, `dogs_in_park`, `first_purchase`

## Strings

"These are examples of strings:", "Hello", "", "Even an empty string is a still a string type".

**Substrings** allow you to copy parts of a string.

For instance:

```
a = "Dogs run"
a[0...3] --> "Dog"
a[0...-3] --> "Dogs "
```

Useful string methods:

- length
- split
- sub / gsub (find and replace a word, local and global)

The two ways to combine strings in Ruby: concatenation and interpolation.

- Concating strings: "Hello" + " World";
- String Interpolation: puts "Good morning, #{a_variable_you_previously_declared}"

## Symbols

Symbols are essentially "named integers"

## Numbers

There are two kinds of numbers: integers (whole numbers) and floats (numbers with a decimal point)

Javascript:

```
for(var i = 0; i < 5; i++){
  console.log("Hello, World");
}
```

Ruby:

```
5.times do
  puts "Hello, World!"
end
```

## Blocks

## Arrays

## Hashes

## Conditionals

## Nil & Nothingness

## Objects, Attributes, and Methods
