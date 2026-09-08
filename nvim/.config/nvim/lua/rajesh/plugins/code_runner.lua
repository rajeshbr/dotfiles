return {
  "CRAG666/code_runner.nvim",
  name = "code runner",
  config = function() 
    require("code_runner").setup({
      mode = 'float',
      filetype = {
      java = {
        "cd $dir &&",
        "javac $fileName &&",
        "java $fileNameWithoutExt"
      },
      python = "python3 -u",
      typescript = "deno run",
      rust = {
        "cd $dir &&",
        "rustc $fileName &&",
        "$dir/$fileNameWithoutExt"
      },
      c = "cd $dir && gcc $fileName -o /tmp/$fileNameWithoutExt && /tmp/$fileNameWithoutExt",
      cpp ="cd $dir && clang++ $fileName -o /tmp/$fileNameWithoutExt && /tmp/$fileNameWithoutExt",
    }
    })
  end
}