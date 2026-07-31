# Wiki

General information about usage and structure of the Wiki.

# Editing

For simple changes, you can use the direct editing in the GitHub web interface.

For local editing you can use any text editor.

| OS | Tool | Comment
|----|------|---------
| All | [Eclipse](https://www.eclipse.org/downloads/packages/release/) with Eclipse Mylyn WikiText | Preview does not render everything correctly in 4.26 and link navigation crashes in 4.40.
| macOS | [MacDown](https://macdown.uranusjr.com/) | 

# Large Media Files

GitHub is suitable for text field and small binary files. It is unsuitable for large binary files.
Therefore, AtariWiki keep such large binary files in a dedicated folder "media" that is no part of the GitHub repository.
This folder is instead synchronized with a shared folder on the [Nextcloud server](http://www.abbuc.social/internet/4443-nextcloud.html) of the [ABBUC](../ABBUC.mD).
The URL of the shared folder "All files \> atariwiki \> media" is [https://cloud.abbuc.social/apps/files/files/337187?dir=/atariwiki/media](https://cloud.abbuc.social/apps/files/files/337187?dir=/atariwiki/media).

- Configure Nextcloud on macOS
  See [Nextcloud unter Apple macOS einrichten](https://www.hosting.de/helpdesk/produkte/nextcloud/einrichtung/nextcloud-desktop-macos/).

# Wiki Consistency

The referential integrity of the Wiki is important.
To find and fix problems, two tools exist.

## [Markdown Checker](https://github.com/john0isaac/markdown-checker)

This is an open-source tool for checking Markdown files written in Python.

- Install Python from https://www.python.org/
- Install pip from https://pip.pypa.io/en/stable/installation/
- In the terminal, run `pip install markdown-checker` to install and
- In the terminal, run `pip install --upgrade markdown-checker` to update an existing installation.

You can run the tool by executing the scripts in the "/bin" folder.

- `CheckMarkdown-Loop.bat`
- `CheckMarkdown.sh`

## [AtariWikiTool](https://github.com/atariwiki-org/wiki-tools)

This is a Java-based tool specifically written to support the AtariWiki.
It has the following features:

- Link
  
    - Find broken relative file links to articles and attachments.
    - Find and list alternative paths to fix broken relative links.
    - Automatically correct paths if there is only one alternative path.
    - Update the link texts for all links pointing to an article based on the heading in the target article.

- Formatting
  
    - Check the presence of the correctly formatted heading `# <Title>` in every article.
    - Format tables headings and table separator lines automatically based on the required column width

- Indexing
  
    - Automatically generate a full table of contents page based on the folder structure.

Planned features:

- Renaming of article folders.
- Check type and size of attachments to move them to the "media" subfolder
- Rearrangement of the article folder structure via drag \& drop.
- Cross-Reference for articles and attachments
- Index of attachments by size
- Detect duplicate attachment files to reduce the overall size
- Take size of the table cell content inthe table body also into account for determination of table column width.
