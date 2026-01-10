# expert_lsp_org

The source code for https://expert-lsp.org.

Built with Tableau.

## Getting Started

```shell
# Setup
$ mix deps.get

# Start dev server on port 4999
$ mix tableau.server

# Build production site
$ MIX_ENV=prod mix build
```

### Nix

If you use Nix and Flakes, you can enter a development shell with `nix develop`.

## Adding pages

Pages can be created using code and templates with `Tableau.Page` or can be static markdown files in the `_pages` directory.

Tableau pages have the most flexibility, but markdown files are the most simple. The path to the markdown file will be used as the permalink if one isn't specified in the front matter.

This site uses [Temple](https://github.com/mhanberg/temple) for templating. It is an Elixir HTML DSL.

## Adding feature videos

Screen recordings for documentation should be converted to optimized MP4 format for web delivery. Place videos in `extra/docs/features/`.

### Recording preferences

For consistency across demo videos, we prefer:

- **Editor**: Visual Studio Code
- **Theme**: Light (Visual Studio) - the default light theme
- **Font size**: 14px (default)
- **Font family**: Default

If a feature can't be clearly demonstrated in VS Code, you may use another editor.

### Converting videos

To convert a screen recording to the correct format:

```shell
ffmpeg -i input_video.mov \
  -c:v libx264 \
  -crf 26 \
  -preset slow \
  -r 30 \
  -an \
  -movflags +faststart \
  output_video.mp4
```

Replace `input_video.mov` with your source file (can be any video format) and `output_video.mp4` with the desired output name.

This produces a web-optimized MP4 with:
- H.264 codec for broad compatibility
- 30fps (sufficient for UI demos)
- No audio track
- Fast-start enabled for web streaming

## Deployment

The site is deployed to Netlify automatically using GitHub Actions and the Netlify CLI.

This is necessary because Netlify build images do not always have the right version of Elixir and Erlang that we want to use, and this provides the most flexibility.

Branches will also deploy a staging deploy.
