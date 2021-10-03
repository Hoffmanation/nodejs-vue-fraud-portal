new webpack.optimize.UglifyJsPlugin({
  resolve: {
    alias: {
      'vue$': 'vue/dist/vue.common.js',
      'jquery': 'jquery/src/jquery.js'
    }
  },
    compress:{
      warnings: false,
      drop_debugger: true,
      drop_console: true
    }
  })
