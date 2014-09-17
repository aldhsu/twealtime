$(document).ready(function() {
  if(!Detector.webgl){
  Detector.addGetWebGLMessage();
  } else {

    var container = $('#container')[0];
    var globe = new DAT.Globe(container);

    var i, tweens = [];

    var settime = function(globe, t) {
      return function() {
        new TWEEN.Tween(globe).to({time: 5},500).easing(TWEEN.Easing.Cubic.EaseOut).start();
      };
    };

    var xhr;
    TWEEN.start();

    // helpers
    // var dataSanitize = function(loc) {
    //   loc.latitude = parseInt(loc.latitude);
    //   loc.longitude = parseInt(loc.longitude);
    //   return loc;
    // }
    // var magnitude = 10000000000;
    // $.ajax({
    //   url: '/events/data_insta',
    //   method: 'get',
    //   success: function(data) {
    //     tag = 'cat';
    //     dataStream = [tag,[]];
    //     for (var i = 0; i < data.length; i++) {
    //       var loc = dataSanitize(data[i]);
    //       dataStream[1].push(loc.latitude);
    //       dataStream[1].push(loc.longitude);
    //       dataStream[1].push(magnitude);
    //     }
    //     DAT.dataStream.push(dataStream);
    //     // can be used in for loop to add multiple datastreams
    //     globe.addData(DAT.dataStream[0][1], {format: 'magnitude', name: data[0][0], animated: true})
    //     // settime(globe,0)();
    //     globe.animate();
    //     document.body.style.backgroundImage = 'none'; // remove loading
    //   }
    // })

    xhr = new XMLHttpRequest();
    xhr.open('GET', 'population909500.json', true);
    xhr.onreadystatechange = function(e) {
      if (xhr.readyState === 4) {
        if (xhr.status === 200) {
          var data = JSON.parse(xhr.responseText);
          window.data = data;
          for (i=0;i<data.length;i++) {
            globe.addData(data[i][1], {format: 'magnitude', name: data[i][0], animated: true});
          }
          globe.createPoints();
          settime(globe,0)();
          globe.animate();
          document.body.style.backgroundImage = 'none'; // remove loading
        }
      }
    };
    xhr.send(null);
}
})