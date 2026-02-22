defmodule Mix.Tasks.Site.Gen.Post do
  use Mix.Task

  @shortdoc "Generate a new blog post"
  @moduledoc @shortdoc

  @doc false
  def run(argv) do
    Application.ensure_all_started(:telemetry)

    {opts, args, _invalid} =
      OptionParser.parse(argv,
        strict: [draft: :boolean, kind: :string, title: :string, layout: :string]
      )

    {:ok, opts} = Schematic.unify(options(), opts)

    post_title =
      cond do
        opts[:kind] == "post" ->
          List.first(args) || Mix.shell().prompt("Title:") |> String.trim()

        true ->
          Mix.raise("Unknown post kind")
      end

    post_datetime = DateTime.now!("America/Indiana/Indianapolis")
    formatted_datetime = Calendar.strftime(post_datetime, "%B %d, %Y %I:%M:%S %p %Z")
    unix_datetime = DateTime.to_unix(post_datetime, :millisecond)
    file_name = Slug.slugify(post_title)

    dir =
      cond do
        opts[:draft] -> "_drafts"
        opts[:kind] == "post" -> "_posts"
        true -> Mix.raise("Could not determine post directory based on supplied options")
      end

    file_path = Path.join(dir, "#{unix_datetime}-#{file_name}.md")

    if File.exists?(file_path) do
      Mix.raise("File already exists")
    end

    front_matter_prelude = """
    ---
    layout: #{opts[:layout]}
    title: \"#{post_title}\"
    date: #{formatted_datetime}
    """

    permalink = "permalink: /:title/"
    tags = "tags: []"
    body = ""

    front_matter_postlude = "\n---\n\n"

    front_matter =
      front_matter_prelude <>
        Enum.join([permalink, tags], "\n") <>
        front_matter_postlude <> body

    File.write!(file_path, front_matter)

    Mix.shell().info("Succesfully created #{file_path}!")
  end

  defp options do
    import Schematic

    keyword(%{
      optional(:kind, "post") => oneof(["post"]),
      optional(:draft, false) => bool(),
      optional(:title) => str(),
      optional(:layout, "ExpertLspOrg.PostLayout") => str()
    })
  end
end
