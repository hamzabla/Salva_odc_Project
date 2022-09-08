const axios = require('axios').default;
function makePostRequest(path, queryObj) {
    axios.post(path, queryObj).then(
        (response) => {
            var result = response.data;
            console.log(result);
        },
        (error) => {
            console.log(error);
        }
    );
}
 
queryObj = { name: 'Chitrank' };
makePostRequest('http://127.0.0.1:3000/test', queryObj);