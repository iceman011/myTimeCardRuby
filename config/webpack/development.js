process.env.NODE_ENV = process.env.NODE_ENV || 'development'

const environment = require('./environment')

//module.exports = environment.toWebpackConfig()


const CleanWebpackPlugin = require("clean-webpack-plugin")
const path = require("path")
const environment = require("./environment")

environment.plugins.append(
  "CleanWebpackPlugin",
  new CleanWebpackPlugin(["packs"], {
    root: path.resolve(__dirname, "../../public"),
    verbose: true
  })
)
module.exports = environment.toWebpackConfig()