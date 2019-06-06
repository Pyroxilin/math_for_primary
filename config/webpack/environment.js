const { environment } = require('@rails/webpacker')
const webpack = require('webpack')

environment.plugins.append('Provide', new webpack.ProvidePlugin({
  $: 'jquery',
  jQuery: 'jquery',
  Popper: ['popper.js', 'default']
}))

const CopyPlugin = require('copy-webpack-plugin');
environment.plugins.append('Copy', new CopyPlugin([
  { from: 'node_modules/@fortawesome/fontawesome-free/webfonts', to: './webfonts' },
]))

module.exports = environment
