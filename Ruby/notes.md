# Ruby Notes

#### History of Ruby

Ruby was released in 1994 by a developer known as Matz. Matz aimed to create a language that had the power and flexibility of Perl, but was more readable. Ruby's popularity kicked off in Japan and until the year 2000 nearly all of the documentation was written in Japanese. Dave Thomas, a pioneer of agile programming, created the first major form of Ruby documentation. In the early 2000s, the Ruby community (mostly system admins) leveraged the language to work as a "glue", much like Perl had been used as previously. The first major push towards being adopted towards being a mainstream language occurred when the Danish engineer DHH extracted a web framework out of an application he had built, the focus was on convention over configuration with the aim of making problems easy to solve.

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

- Ruby (also like Javascript), are high-level interpreted languages. That means they need to be compiled into lower level languages, like C++ (in some cases), machine code, and then into binary before it can be interpreted by the CPU. The VM, or virtual machine, handles the compiling of Ruby and makes the as a consequence makes the language more-or-less platform independent.

#### Key Technologies:

- Interpreted Language
- VM or Virtual Machine
- IRB (REPL)

## Variables

## Strings

## Symbols

## Numbers

## Blocks

## Arrays

## Hashes

## Conditionals

## Nil & Nothingness

## Objects, Attributes, and Methods
