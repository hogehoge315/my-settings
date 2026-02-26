return {
  -- これがルート判定。あなたがやりたい「.venv がある場所」をルートにしたいならこう。
  root_markers = { ".venv" },

  settings = {
    python = {
      venvPath = ".",
      pythonPath = "./.venv/bin/python",
    },
  },
}
