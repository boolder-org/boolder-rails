process.env.NODE_ENV = process.env.NODE_ENV || 'production'

const environment = require('./environment')

module.exports = = async function (env, argv) {
  const config = await environment.toWebpackConfig()

  // Customize the config before returning it.
  config.output.hashFunction = 'xxhash64';
  return config;
};

