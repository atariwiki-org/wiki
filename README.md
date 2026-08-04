# AtariWiki

This is the new AtariWiki, the successor to [https://atariwiki.org/wiki](https://atariwiki.org/wiki).
See the [Table of Contents](content/README.md) for all articles.

&copy; 2010-2026 AtariWiki
All content in the Wiki is licensed under [Creative Commons Share Alike License](https://creativecommons.org/licenses/by-sa/2.5/), unless otherwise noted.  


See [Basic writing and formatting syntax](https://docs.github.com/en/get-started/writing-on-github/getting-started-with-writing-and-formatting-on-github/basic-writing-and-formatting-syntax) and [GitHub Flavored Markdown Spec](https://github.github.com/gfm/) for the Markdown (.md) syntax.

## Folder Structure

| Folder                      | Description |
|-----------------------------|-------------|
| bin/                        | Tools for checking the consistency |
| content/                    | Content root folder                |
| content/\<article\>             | Article folder, use title case, use replacement rules given below|
| content/\<article\>/attachments | Article attachments folder, use only for attachments smaller than 5 MB that are not ´*.avi´,´*.flac´,´*.mp3´,´*.mp4´,´*.wav´. |
| media/\<article\>/attachments | Topic media attachments folder, use for attachments with 5 MB or more and for ´*.avi´,´*.flac´,´*.mp3´,´*.mp4´,´*.wav´. This folder is not part of the repository to keep its size manageable. |
| results/ | Result of check runs via the tools in the "bin" folder. This folder is not part of the repository, but is created automatically locally if required.

## Replacement Rules

The topic names become folder names, attachment names become filenames.
Therefore, no special characters shall be used in topic and attachment names.
The following replacement rules apply. 

| Character | Replacement |
|-----------|-------------|
| Space     | ´_´         |
| ´!´       | Omit        |
| ´&´       | ´and´       |
| ´+´       | ´Plus´      |
| ´:´       |  Omit       |
| ´?´       |  Omit       |

## Article Formatting

- The title is of type "heading 1"
- The copyright follows, separated by a single empty line.
- If Part-numbers are known, they are given in parentheses, with comma-separated numbers
- Do not add colons at the end of a heading line.

````
# Example Title (CX1235, TX23456)

Copyright (C) <year> <company>.

<Description>

## ATR Files
- [Example.atr](attachments/Example.atr)

````

## Article Wording

The aim of the AtariWiki is to provide information in an accurate and well-readable form. It is not a pure historic archive and does not  reproduce old content 1:1 if it has typos or errors. Therefore, also original documents that are converted into articles will contains such corrections without further indictation.


## Attachments

- Use the article's folder name also as prefix for the attachment file name. This way attachment file names are unique with the Wiki and references can be automatically adapted by the AtariWikiTool
- Use lower-case file extension, e.g. ".atr", not ".ATR"
- Upload attachments as individual files if possible, and not a one large ZIP archive with many files.

