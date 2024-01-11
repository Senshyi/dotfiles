return {
  'ggandor/leap.nvim',
  enabled = true,
  config =function ()
    require('leap').create_default_mappings()
  end
}
