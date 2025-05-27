return {
  'saghen/blink.cmp',
  enabled = true,

  version = '1.*',

  opts = {
    completion = {
      documentation = {
        auto_show = true,
        auto_show_delay_ms = 300,
      },
      menu = {
        draw = {
          columns = {
            { 'label' },
            { 'kind' },
            { 'label_description' },
          },
        },
      },
    },
  },
}
