function myfunction()
{var request = new XMLHttpRequest();
var txtOutput = document.getElementById("txtOutput");

request.open('GET', "http://34.72.142.129/getx/", true);
request.onload = function () {
  // Begin accessing JSON data here
  var data = JSON.parse(this.request);

  if (request.status >= 200 && request.status < 400) {
    data.forEach((MESSAGE) => {
      /*console.log(MESSAGE);*/
      txtOutput.value = MESSAGE; 
     
    })
  } else {
    console.log('error');
  }
}
};
function myyfunction()
{var request = new XMLHttpRequest();
var txtOutput = document.getElementById("txtOutput");

request.open('GET', "http://34.72.142.129/excuse/gen", true);
request.onload = function () {
  // Begin accessing JSON data here
  var data = JSON.parse(this.request);

  if (request.status >= 200 && request.status < 400) {
    data.forEach((MESSAGE) => {
      /*console.log(MESSAGE);*/
      txtOutput.value = MESSAGE; 
     
    })
  } else {
    console.log('error');
  }
}
};
