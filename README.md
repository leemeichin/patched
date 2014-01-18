# Patch

The idea was to see if refinements could be abstracted in such a way that you didn't need to bother with the boilerplate of setting it all up. For example, this is a bit of a pain for one-off patches:

```ruby
module LolRefinement
  refine Array do
    def to_lol
      self.map { "lol" }
    end
  end
end

class Lol
  using LolRefinement
end
```

This, on the other hand, is quite simple, if your use case is very small and specific:

```ruby
class Lol
  patch Array do
    def to_lol
      self.map { "lol" }
    end
  end
end
```

--------------------

Sadly, it doesn't work, because of the way refinements were set up. :( The code in this repo is just an attempt at trying it in Ruby, and an even worse attempt at hacking around it in C.

There's probably a good reason for it...
