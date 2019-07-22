[![CircleCI](https://circleci.com/gh/maxthomas/memento-mori.svg?style=svg)](https://circleci.com/gh/maxthomas/memento-mori)

# memento-mori

> Latin, literally 'remember (that you have) to die'

`memento-mori` is a small Haskell library and executable that helps
one be more cognizant of life (and death). It does this by displaying
your age as a rational number instead of an integer.

Seeing this number increase daily, instead of yearly (as one would do
on traditional birthdays) may motivate you to better take advantage of
what limited, valuable time you have left to live.

So, for example, instead of being 50 years old 180 days after your birthday,
you'd be approximately `50.5` years old.

Inspired by [this Emacs version](https://github.com/lassik/emacs-memento-mori/blob/master/memento-mori.el).

## Building

This project uses [stack][stack].

``` shell
stack setup
stack build
stack install
```

## Use as a command line program

After building:

``` shell
memento-mori yyyy mm dd
```

e.g.

``` shell
memento-mori 1950 10 20
```

## Use in xmobar

In the future, this code will be made into an [xmobar][xmobar] plugin.

For now, you can add the following configuration line to `~/.xmobarrc`
under the `commands` block:

``` haskell
    -- Memento Mori
    , Run Com "memento-mori" ["1955", "10", "20"] "memento" 0
```

Or use `ComX`, etc.

[xmobar]: https://xmobar.org
[stack]: https://docs.haskellstack.org/en/stable/README/
