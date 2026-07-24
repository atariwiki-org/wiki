# Wiki

General information about usage and structure of the Wiki.


# Wiki Consistency
The referential integrity of the Wiki is important.
To find and fix problems, two tools exist.

## [Markdown Checker](https://github.com/john0isaac/markdown-checker)

This is an open-source tool for checking Markdown files written in Python.
You can use the Python package installer as follows:
- `pip install markdown-checker` to install and
- `pip install --upgrade markdown-checker` to update an existing installation.

You can run the tool by executing the scripts in the "/bin" folder.
- `CheckMarkdown-Loop.bat`

## AtariWikiTool

This is a Java-based tool specifically written to support the AtariWiki.
It has the following features:
- Find broken relative file links to articles and attachments.
- Find alternative paths for fixing broken relative links.
- Automatically correct paths if there is only one alternative path.
- Check the presence of the correctly formatted heading in every article.
- Update the link texts for all links pointing to an article based on the heading in the target article.
- Automatically generate a full table of contents based on the folder structure.

Planned features:
- Renaming of article folders.
- Rearrangement of the article folder structure via drag & drop.
