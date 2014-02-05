# Patched

Create one-off refinements for classes, without (most) of the boilerplate.

## Installing

Put this in your Gemfile:

```shell
gem 'patched'
```

Or this in your terminal:

```shell
gem install patched
```

## Usage

Basically, this:

```ruby
using patched(ClassName) {
  # add methods to ClassName here
}
```

The syntax is, unfortunately, quite important.

### Example

```ruby
class LolMaths

  using patched(Fixnum) {
    def to_word
      case self
      when 0 then "zero"
      when 1 then "one"
      when 2 then "two"
      # ...
      end
    end

    def +(other)
      self.to_word + other.to_word
    end
  }

  def add(*numbers)
    numbers.reduce("", &:to_word)
  end

end
```
