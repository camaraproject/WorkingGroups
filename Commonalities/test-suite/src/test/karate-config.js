function fn() {
    karate.configure('connectTimeout', 5000);
    karate.configure('readTimeout', 5000);
    // karate.configure('abortSuiteOnFailure', true);
    // karate.configure('ssl', true);
    config = {
        demoBaseUrl: 'http://localhost:8080',
        credentials: {
            username: java.lang.System.getenv('KARATE_USER'),
            password: java.lang.System.getenv('KARATE_PASSWORD')
        }
    };
    return config;
}