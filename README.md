# Game of Life Benchmark

Benchmarking different programming languages on Game of Life.

**Warning**: Non-scientific approach. Please look at the code before making any
conclusions.

The goal of this project is to benchmark several programming languages by
implementing Game of Life. Implementations might not be the most efficient in a
given programming language. I'm not experienced in any of those languages except
Ruby.

Also, one of the goals is to check how "nice" a language is for implementing
systems such as Game of Life, so striving for ultimate performance is not the
goal.

## Results

1000 iterations with 100x100 board. VM with 2 cores.

Language | Note | Result (ms)
---------|------|------------
Elixir | Sequential | 169,862
Elixir | Every cell update in a separate process | 2,455,931
Elixir | Every column in a separate process | 158,204
Ruby | | 87,656
