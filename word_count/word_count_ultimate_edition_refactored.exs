usageMsg = """
Usage: [filename] -[flags]
Flags:
-l    display line count
-c    display character count
-w    display word count (default)

Multiple flags may be used. Example usage to display line and character count:
somefile.txt -lc

"""

filename =
  IO.gets("File to count the words from (h for help):\n")
  |> String.trim()

if filename === "h" do
  IO.puts(usageMsg)
else
  parts = String.split(filename, "-")
  filename = List.first(parts) |> String.trim()
  flags = case Enum.at(parts, 1) do
    # set only "w" flag if none were set
    nil -> ["w"]
    chars -> String.split(chars, "", trim: true)
  end

  content = File.read!(filename)
  lines = String.split(content, ~r{(\r\n|\r|\n)})
  words = String.split(content, ~r{(\\n|[^\w'])+}, trim: true)
  chars =
    String.replace(content, ~r{(\r\n|\r|\n)}, "")
    |> String.split("", trim: true)

  Enum.each(
    flags,
    fn flag ->
      case flag do
        "l" -> IO.puts("Lines: #{Enum.count(lines)}"); IO.inspect(lines)
        "w" -> IO.puts("Words: #{Enum.count(words)}"); IO.inspect(words)
        "c" -> IO.puts("Chars: #{Enum.count(chars)}"); IO.inspect(chars)
        _   -> nil
      end
    end
  )
end
