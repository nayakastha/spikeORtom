function myfunction()
{var request = new XMLHttpRequest();

request.open('GET', "https://xcusemaker.herokuapp.com/getx/", true);
request.onload = function () {
  // Begin accessing JSON data here
  var data = JSON.parse(this.request);

  if (request.status >= 200 && request.status < 400) {
    data.forEach((MESSAGE) => {
      console.log(MESSAGE);
     
    })
  } else {
    console.log('error');
  }
}
};
