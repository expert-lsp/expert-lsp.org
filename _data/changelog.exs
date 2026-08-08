if File.exists?("_build/changelog.md") do
  File.read!("_build/changelog.md")
else
  github_api = "https://api.github.com/repos/expert-lsp/expert/tags"
  base_url = "https://raw.githubusercontent.com/expert-lsp/expert/refs"

  %{body: page} =
    with %{body: [object | _]} <- Req.get!(github_api),
         %{"name" => tag} when not is_nil(tag) <- object do
      Req.get!("#{base_url}/tags/#{tag}/CHANGELOG.md")
    else
      _ -> Req.get!("#{base_url}/heads/main/CHANGELOG.md")
    end

  File.write!("_build/changelog.md", page)

  page
end
