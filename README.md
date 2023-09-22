# Tristan & Sophie's Japan blog
This is a Jekyll blog for our trip to Japan in 2023.

## Prerequisites
To build and run the site, you will need Ruby and Bundler installed. Once installed, 
clone this repository and run:
```bash
bundle install
```

## Build
To build and run the site, run:
```bash
bundle exec jekyll serve
```

## Editing
Open up one of the pages located in the `_posts` directory. To insert an image 
gallery, add the following code to the page:
```html
{% include image-gallery.html folder="/assets/uploads/images/path/to/an/image/folder" %}
```
Then, ensure the folder exists and contains some images. The gallery will be 
automatically generated from the images in the folder.