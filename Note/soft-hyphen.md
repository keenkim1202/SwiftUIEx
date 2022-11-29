# Soft-Hyphen

----

[Wiki](https://en.wikipedia.org/wiki/Soft_hyphen)

----

In computing and typesetting,   
- a soft hyphen (ISO 8859: 0xAD, Unicode U+00AD SOFT HYPHEN, HTML: &#xAD; or &#173; or &shy;)
- syllable hyphen (EBCDIC: 0xCA)
- abbreviated SHY
is a code point reserved in some coded character sets for the purpose of breaking words across lines by inserting visible hyphens.

Two alternative ways of using the soft hyphen character for this purpose have emerged,     
depending on whether the encoded text will be broken into lines by its recipient,  
or has already been preformatted by its originator.


### There is some issue in iOS 15.
- [In iOS 15, Soft hyphen is not working properly when using unicode character in UILabel
](https://stackoverflow.com/questions/69312990/in-ios-15-soft-hyphen-is-not-working-properly-when-using-unicode-character-in-u)


### Someone got response from Apple about this issue:

> Before iOS 15,   
> we strictly followed soft hyphen,   
> while in iOS 15 we now only consider those as hyphenation opportunities.  
> That is the design, and there are no plans to change it.   
> The app should be able to use languageIdentifier attribute to influence the hyphenation with the attributed string   
> so that it should follow German hyphenation even when system language is English.  
> [languageidentifier](https://developer.apple.com/documentation/foundation/attributescopes/foundationattributes/3802173-languageidentifier)

