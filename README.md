# README

## WARNING this project is WIP and not really for general use

This plugin for neovim allows the mapping of key combinations in insert mode to provide a different character e.g. '..'  => '>'

## Installation

``` lua
use {'Someone-s-out-there/stutter.nvim'}

require('stutter').setup({
    {"{pattern}","{replacement}"},
    })

```

## Usage

if you want a mapping like `;;` => `:` as a sub map of `;;;`=> `:=` 
you should pass it into the setup like the following

``` lua

require('stutter').setup({
    {";;",":"},
    {":;",":="},
    })

```

