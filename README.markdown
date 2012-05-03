RefineryCMS Djatoka
==================

Refinery CMS comes with a simple way to use external images, including uploading
them. The problem is that you have to specify up front the sizes of the images
you want to use. So any time you want a different sized image you have to create
it.

This is a common problem which lead to the development of image servers where
you create a single image and then derive all other access copies from it.
Image servers can size and crop images on the fly. One such image server is
[Djatoka](http://djatoka.sourceforge.net/), which uses JP2 images to derive
JPEGs.

This gem is intended to be an easy interface for content editors to work with 
inserting Djatoka images among text in Refinery CMS.

Installation
============

This is currently more difficult than it should be because of the way that 
Refinery includes Javascript.

0. Create a [RefineryCMS](http://refinerycms.com/) application

1. Add the djatoka and refinerycms_djatoka gems to your Gemfile:

  ```
  gem 'djatoka'
  gem 'refinerycms_djatoka', :git => 'git://github.com/jronallo/refinerycms_djatoka.git'
  ```

2. `bundle install`

3. Add config/initializers/djatoka.rb with your own Djatoka resolver for different
  environments:

  ```
  if Djatoka.respond_to? :resolver
    Djatoka.resolver="http://african.lanl.gov/adore-djatoka/resolver"
  end
  ```

4. Override `app/views/refinery/admin/_javascripts.rb` with:

  `rake refinery:override view=admin/_javascripts`

5. Edit `app/views/refinery/admin/_javascripts.rb` to include this at the very top:

  ```
  <%= javascript_include_tag 'admin_override' -%>
  ```

6. Edit `app/views/refinery/admin/_javascripts.rb` to include this after 'refinery/wymeditor':

  ```
  <%= javascript_include_tag 'wymeditor_en' -%>
  ```

7. Add this line to your config/initializers/refinery/core.rb file:

  `config.register_stylesheet "djatoka_custom", :media => 'screen' `

8. Optional: If you would like the Djatoka image to link to an external page or a page
  within your Refinery project, then you will need to create a Javascript
  function Djimage.url_creator(filename). Here's my simple function:
  
  ```
  Djimage.url_creator = function(filename){
    return 'http://d.lib.ncsu.edu/collections/catalog/' + filename;
  }
  ```
  
  You will place this in `app/assets/javascripts/djimage_url.js` and then edit 
  `app/views/refinery/admin/_javascripts.rb` to include this after 'wymeditor_en':
  
  ```
  <%= javascript_include_tag 'djimage_url' -%>
  ```


9. Give it a try. If you are just trying it out with the lanl.gov resolver, you can use this 
  identifier to test in the filename field: info:lanl-repo/ds/ffbe88c3-ab45-4358-8bc1-a5a742cc1487

  
INSTRUCTIONS
============

TODO

TODO
====

1. Figure out how to do things like include the javascript in a saner way than this!
2. Figure out how to test an extension of WYMeditor for Refinery.


AUTHOR
======

Jason Ronallo


LICENSE
=======

Copyright © 2012 North Carolina State University. See LICENSE for details.