function fn() {    
  var env = karate.env; // get system property 'karate.env'
  karate.log('karate.env system property was:', env);
  if (!env) {
    env = 'dev';
  }
  var config = {
    env: env,
	 apiUrl: 'https://test.salesforce.com/'
  }
  if (env == 'dev') {
    // customize
    // e.g. config.foo = 'bar';
  } else if (env == 'prod') {
    apiUrl: 'https://login.salesforce.com'
  }
  return config;
}