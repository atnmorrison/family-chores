const path = require('path')
module.exports = {

    entry: './src/index.js',
    module: {
      rules: [
        {
          test: /\.(js)$/,
          exclude: /node_modules/,
          use: [
            {
              loader: 'babel-loader',
              options: {
                presets: ['@babel/react']
              }
            }
          ]
        }
      ]
    },
    resolve: {
      extensions: ['*', '.js']
    },    
    
    output: {
      path: path.resolve(__dirname, "./../public/javascript"),
      publicPath: '/javascript/',
      filename: './bundle.js'
    },

    devServer: {
      proxy: {
        '/': 'http://localhost:5000'
      }
    }
    
  };