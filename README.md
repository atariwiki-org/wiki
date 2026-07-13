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
| content/\<topic\>             | Topic folder, use title case, use replacement rules given below|
| content/\<topic\>/attachments | Topic attachments folder, use only for attachments smaller than 5 MB that are not ´*.avi´,´*.flac´,´*.mp3´,´*.mp4´,´*.wav´. |
| media/\<topic\>/attachments | Topic media attachments folder, use for attachments with 5 MB or more and for ´*.avi´,´*.flac´,´*.mp3´,´*.mp4´,´*.wav´. This folder is not part of the repository to keeps the size manageable. |


## Replacement Rules

The topic name become folder names, attachment names become filenames.
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
