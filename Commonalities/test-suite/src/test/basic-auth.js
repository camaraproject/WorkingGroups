// Sample of function used to inject credentials into auth request
// Need to be used in scenario as below
// * header Authorization = call read('../basic-auth.js') credentials
function basicAuth(credentials) {
    var temp = credentials.username + ':' + credentials.password;
    var Base64 = Java.type('java.util.Base64');
    var encoded = Base64.getEncoder().withoutPadding().encodeToString(temp.getBytes());
    return 'Basic ' + encoded;
}