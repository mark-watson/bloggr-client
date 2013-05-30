# Forked from https://github.com/tildeio/bloggr-client.git

I forked this Ember.js example on May 30, 2013 and added a simple Ruby Sinatra server.

        ruby server.rb

Then open http://localhost:4567

Notice that I moved the index.html, CSS, and JavaScript files to a new directory ./public which is Sinatra's default place to serve static assets from.

I store modified posts server side in the global variable `$posts`
