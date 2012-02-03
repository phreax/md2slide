#slide:title

The Future of Presentations
===========================


#slide:easy

Keep it Simple
--------------

### Making good presentations was never easier before!

- write simple text in your favourite markup language
- compile it to HTML
- `Show off`

#slide:why

The Goods
---------

- **easy to structure**
  + make of the clean simple style of *markdown* text
  + use your favourite editor with syntax highlighting
- **spread your document to several files**
- get a wonderful, elegant presentation using the outstanding `deck.js` library
- customized by your needs using by applying your CSS stylesheets

#slide:how

How to use
----------

Simply embed the *slide tag* into your markup:

    #slide:title

    Here starts a new slide
    -----------------------

#slide:customize

Customize
---------

A simple *#slide* followd by a colon followed by the slide title

You can add custom css classes to the slide tag:

    #slide:title:customclass

This will add `customclass` as a class to the resulting
*section* html tag.
You will need to add your custom style sheet to the *template.erb*

#slide:structure

Structure your content
----------------------

Include other markdown files by using the *include tag*

    #include('intro.md')

Be sure all tags are are on a single new line, with no
indentation!

#slide:end

Good Luck!
==========

