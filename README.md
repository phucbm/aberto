# Jekyll Blog

Complete blog engine powered by [Jekyll](https://jekyllrb.com/).

**Table of content**

- Getting Started
- Folder structure
- Site settings
- Update content
  - Editor
  - Posts
  - Pages


## Getting Started

If you only want to run this on GitHub Pages and updating content
directly on GitHub.

1. Fork this repo
2. Go to [Update Content](#update-content)

Deploy on your local machine:

1. Fork this repo
2. Clone to your local machine
3. Run `bundle exec jekyll serve --livereload`. After all dependencies have been installed,
the terminal should give you a notification like this to access the local site.
    ```text
    ...
    LiveReload address: http://127.0.0.1:35729
    Server address: http://127.0.0.1:4000
    Server running... press ctrl-c to stop.
    LiveReload: Browser connected
    ...
    ```

## Folder structure

### 📂 `/_data/config.yml`

Contains almost configurations for the site and all the translatable texts.

I actually could use the `/_config.yml` which is the one provided by Jekyll,
but this default config file would not be updated on live reload, so yeah, 
why not just create a better one 😎

### 📂 `/_includes`

Here you can find all snippets (pieces of HTML, functions) used in this site.

### 📂 `/_layouts`

- `base.html` contains the full html body: head, header and footer,
- Others contain the main content of each page.

Via the [Front Matter](https://jekyllrb.com/docs/front-matter/), you can set the additional stylesheet, or even load
another header in each layout.

```text
---
layout: base
css:
- "/assets/css/posts.css"
header: "header-home.html"
---
```

### 📂 `/_posts`

Store all of your posts. Read more about [Jekyll Posts](https://jekyllrb.com/docs/posts/).

### 📂 `/assets`

Contains stylesheets, scripts and images.

### 📂 `/tags`

Contains layout for tag pages. Jekyll on GitHub does not provide a tag/category system,
so we have to do this pretty manually.

For each tag you want to use in your posts, you have to create a new markdown file with
the name is the slug version of your tag. And the Front Matter of that file will be like this:

```markdown
---
layout: tag-archive
---
```

### 📄 index.html
### 📄 404.md, about.md, contact.md, typography.md
### 📄 _config.yml

## Site settings

## Update content
### Editor
### Posts
### Tags
### Pages