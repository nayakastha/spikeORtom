function myfunction() {

    const URL_1 = "https://xcusemaker.herokuapp.com/getx/";
    var request = new XMLHttpRequest();
    request.open('GET', "http://34.121.79.151/getx", true);
    request.setRequestHeader('Access-Control-Allow-Origin', '*');

    request.send();

    request.onreadystatechange = function() {
        alert("leaded");
        // Begin accessing JSON data here
        var data = JSON.parse(this.request);

        if (this.readyState == 4 && this.status == 200) {
            alert(request.responseText);

            // data.forEach((MESSAGE) => {
            //     console.log(MESSAGE);
            //     alert(MESSAGE);


            // })
        } else {
            console.log('error');
        }
    }
};