tongo
===

tongo is a ruby template engine based in [Radius](https://github.com/jlong/radius) and [Liquid](https://github.com/tobi/liquid).
I couldn't have done it without the help of [Temple](https://github.com/judofyr/temple), in my opinion, one of the most interesting projects I've ever seen.
Right now the implementation is pretty naïve, I haven't done any kind of optimizations and there are probably bugs sneaking around.

Here comes what you were looking for, an example:


Given a context like this one:

    class CustomContext < Tongo::Context
      tag :shout do
        'ARGH!'
      end
  
      tag :whisper do
        'shhh'
      end
      
      tag :upcase do |content|
        content.upcase
      end
  
      tag :loop do |attrs,content|
        number = (attrs['times'] || 1).to_i
        result = ''
        number.times { result << content }
        result
      end
    end
    
When you use it to handle this template:

    <h1 class="highlight">Header</h1>
    <ul>
      <tng:loop times="3">
        <li>Hello World</li>
      </tng:loop>
    </ul>
    <tng:shout />
    <strong><tng:shout /></strong>
    <em>%{whisper | upcase}, %{shout}</em>
    
You should get this result:


    <h1 class="highlight">Header</h1>
    <ul>
      
        <li>Hello World</li>
      
        <li>Hello World</li>
      
        <li>Hello World</li>
      
    </ul>
    ARGH!
    <strong>ARGH!</strong>
    <em>SHHH, ARGH!</em>
    
So basically, it supports markup tags like <tng:whatever some="attribute">, that can be empty or nested, and text tags like %{whatever | filter}.

Contributing to tongo
---
 
* Check out the latest master to make sure the feature hasn't been implemented or the bug hasn't been fixed yet
* Check out the issue tracker to make sure someone already hasn't requested it and/or contributed it
* Fork the project
* Start a feature/bugfix branch
* Commit and push until you are happy with your contribution
* Make sure to add tests for it. This is important so I don't break it in a future version unintentionally.
* Please try not to mess with the Rakefile, version, or history. If you want to have your own version, or is otherwise necessary, that is fine, but please isolate to its own commit so I can cherry-pick around it.

Copyright
---

Copyright (c) 2011 Rodrigo Alvarez. See LICENSE.txt for
further details.