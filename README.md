<h1><img src="./assets/haskell_logo.svg" alt="Haskell Logo" width="70px"/>haskell</h1>
Learning haskell

## Setup

To get started you'll need to download the [Haskell Platform](https://www.haskell.org/platform/) which provides everything you need to run and compile haskell programs.

Once installed you'll be able to run the haskell interactively with `ghci` and compile haskell with `ghc --make FILENAME.hs`

To interactively use a file you can run `ghci`, then once it's started you can type `:l FILENAME`. At this point you'll have all the functions from that file loaded in an interactive way.

The linter used is hlint, it can be found [here](https://hackage.haskell.org/package/hlint). In order to use it you'll need to have [hackage](https://hackage.haskell.org/) installed.

## How to use

There are two ways to use these files. Option one, you can follow them in order to build up to a working knowledge of Haskell. Option two, if you already know Haskell but need a quick refresher on a topic, you can jump to that file to see syntax and usage.

To run the tests use `runhaskell main.hs`. This will run the main file that imports all the tests defined in the other files. Alternatively you can run a single set of tests with `runhaskell FILE.hs`.

## Topics

* [Lists](./LearningTests/lists.hs)
* [Ranges](./ranges.hs)
* [List Comprehensions](./listComprehension.hs)
* [Tuples](./tuples.hs)
* [Types](./types.hs)
* [Main Function](./main-function.hs)
* [Do](./do.hs)
* [Pattern Matching](./patternMatching.hs)
* [Guards](./guards.hs)

## Resources

* [Haskell Docs](https://www.haskell.org/documentation)
* [Hackage, Package Archive](http://hackage.haskell.org/)
* [Cabal, Package Manager](https://www.haskell.org/cabal/)

### Data Types

* [Int](https://hackage.haskell.org/package/base-4.10.0.0/docs/Data-Int.html)
* [List](https://hackage.haskell.org/package/base-4.10.0.0/docs/Data-List.html)
* [Tuple](https://hackage.haskell.org/package/base-4.10.0.0/docs/Data-Tuple.html)
* [String](https://hackage.haskell.org/package/base-4.10.0.0/docs/Data-String.html)

### Type Classes

* [Eq](https://hackage.haskell.org/package/base-4.10.0.0/docs/Data-Eq.html)
* [Ord](https://hackage.haskell.org/package/base-4.10.0.0/docs/Data-Ord.html)
* [Show](https://hackage.haskell.org/package/base-4.10.0.0/docs/Text-Show.html)
* [Read](https://hackage.haskell.org/package/base-4.10.0.0/docs/Text-Read.html)
* [Numeric](https://hackage.haskell.org/package/base-4.10.0.0/docs/Numeric.html)

The topics and their explanations are summarized in my own words, for the purpose of learning, from the book [Learn You A Haskell](http://learnyouahaskell.com)
