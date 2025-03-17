# About
This is a simple hacked together html side and bash script to print post stamps from "[Deutsche Post](https://shop.deutschepost.de/shop/internetmarke/imConfiguration.jsp#/)", format "Ausdruck 4-spaltig (A4)", in format "Ultragrip 3661" via the browser.  
[example post stamp](!./briefmarken/stamp.0.png)

In short, it converts sth like [briefmarken.pdf](./briefmarken.pdf) into [Ultagrip_3661_70x67_7.pdf](./Ultagrip_3661_70x67_7.pdf) in two steps.

# Usage
- remove the folder with the sample stamps
> rm briefmarken -r
- create separate post stamp images (creates folder via file name)
> ./convertToFormat.sh briefmarken.pdf
- open index.html in browser of choice (only tested in firefox and chrome)
> firefox index.html
- fill the two prompts with relevant infos
- print page in browser (ctrl+p)

# Limits
- max 12 post stamps per usage (script is the limit factor because of hardcoded crop regions, the webpage supports multiple pages)
- only formats specifily for "Ultragrip 3661" (format hardcoded in css)
- only tested with printer brother_hl-2030
