<h1><img src="./assets/haskell_logo.svg" alt="Haskell Logo" width="70px"/>haskell</h1>
Learning haskell

## Topics

* [Lists](./lists.hs)
* [Ranges](./ranges.hs)
* [List Comprehensions](./listComprehension.hs)
* [Tuples](./tuples.hs)
* [Types](./types.hs)
* [Main Function](./main-function.hs)
* [Do](./do.hs)
* [Pattern Matching](./patternMatching.hs)

## Setup

To get started you'll need to download the [Haskell Platform](https://www.haskell.org/platform/) which provides everything you need to run and compile haskell programs.

Once installed you'll be able to run the haskell interactively with `ghci` and compile haskell with `ghc -- make FILENAME.hs`

To interactively use a file you can run `ghci`, then once it's started you can type `:l FILENAME`. At this point you'll have all the functions from that file loaded in an interactive way.

The linter used is hlint, it can be found [here](https://hackage.haskell.org/package/hlint). In order to use it you'll need to have [hackage](https://hackage.haskell.org/) installed.