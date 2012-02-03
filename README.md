The Future of Presentations
---------------------------


### Making good presentations was never easier before!

- write simple text in your favourite markup language
- compile it to HTML
- **Show off**

### The Goods

- **easy to structure**
  + make of the clean simple style of *markdown* text
  + use your favourite editor with syntax highlighting
- **spread your document to several files**
- get a wonderful, elegant presentation using the outstanding `deck.js` library
- customized by your needs using by applying your CSS stylesheets

### How to use

Simply embed the *slide tag* into your markup:

    #slide:title

    Here starts a new slide
    -----------------------

Compile it to HTML

    ruby md2slide.rb <presentation.md>

### Customize

A simple *#slide* followd by a colon followed by the slide title

You can add custom css classes to the slide tag:

    #slide:title:customclass

This will add `customclass` as a class to the resulting
*<section>* html tag.
You will need to add your custom style sheet to the *template.erb*


### Structure your content

Include other markdown files by using the *include tag*

    #include('intro.md')

Be sure all tags are are on a single new line, with no
indentation!

### Requirements

- ruby
- maruku
- erubis
- [deck.js] [deck]

[deck]: http://imakewebthings.github.com/deck.js/ "deck.js"

