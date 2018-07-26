<h1><img src="./assets/haskell_logo.svg" alt="Haskell Logo" width="70px"/>haskell</h1>
Learning haskell

## Setup

To get started you'll need to download the [Haskell Platform](https://www.haskell.org/platform/) which provides everything you need to run and compile haskell programs.

Once installed you'll be able to run the haskell interactively with `ghci` and compile haskell with `ghc --make FILENAME.hs`

To interactively use a file you can run `ghci`, then once it's started you can type `:l FILENAME`. At this point you'll have all the functions from that file loaded in an interactive way.

The linter used is hlint, it can be found [here](https://hackage.haskell.org/package/hlint). In order to use it you'll need to have [hackage](https://hackage.haskell.org/) installed.

## How to use

There are two ways to use these files. You can follow them in order to build up to a working knowledge of Haskell. If you already know Haskell and need a quick refresher on a topic you can jump to that file to get a reminder about syntax and usage.

## Topics

* [Lists](./lists.hs)
* [Ranges](./ranges.hs)
* [List Comprehensions](./listComprehension.hs)
* [Tuples](./tuples.hs)
* [Types](./types.hs)
* [Main Function](./main-function.hs)
* [Do](./do.hs)
* [Pattern Matching](./patternMatching.hs)

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
