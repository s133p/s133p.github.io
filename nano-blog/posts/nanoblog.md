# Vim NanoBlog

![test](images/nano-blog.png)

- `<pitch>`

        Minimalist markdown powered blog/notebook, all from within vim!!


## Basics ###

Vim NanoBlog is based around running a shell script each time 
a `markdown` file is saved in the nano-blog/posts folder. 
The script composites all of the markdown files in that folder, along 
with a header, footer & wrapping for each "post". The markdown is 
compiled into html using daring-fireball's markdown program. 

The header file is used to add styling and correct surrounding HTML 
to the generated file.

## Output ###

NanoBlog generates an index.html in the nano-blog folder

## todo ###
- Sorting based on creation date, not edit date

