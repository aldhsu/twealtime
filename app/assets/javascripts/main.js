$(document).ready(function() {
  if(!Detector.webgl){
      Detector.addGetWebGLMessage();
    } else {
      // setup listener for search
      $('#search-submit').on('click', function(event) {
        event.preventDefault();
        var tag = $('#search-field').val() || 'cat'
      })

      // setup view
      var container = document.getElementById('container');

      var globe = new DAT.Globe(container);
      globe.onWindowResize();
      var i, tweens = [];

      // tweening for animation
      var settime = function(globe, t) {
        return function() {
          new TWEEN.Tween(globe).to({time: t/3},500).easing(TWEEN.Easing.Cubic.EaseOut).start();
        };
      };

      TWEEN.start();

      var dataSanitize = function(loc) {
        loc.latitude = parseInt(loc.latitude);
        loc.longitude = parseInt(loc.longitude);
        return loc;
      }

      var magnitude = .1;

      var getInstaData = function() {
        $.ajax({
          url: '/events/data_insta',
          method: 'get',
          success: function(data) {
            dataStream = [];
            for (var i = 0; i < data.length; i++) {
              var loc = dataSanitize(data[i]);
              dataStream.push(loc.latitude);
              dataStream.push(loc.longitude);
              dataStream.push(magnitude);
            }
            // really crappy hacky way - consider refactoring the draw code use hash
            DAT.dataStream[0][1] = DAT.dataStream[0][1].concat(dataStream);
            // can be used in for loop to add multiple datastreams
            // this will need to be refactored to draw only new points
            globe.addData(DAT.dataStream[0][1], {format: 'magnitude', name: DAT.dataStream[0][0], animated: true});
            globe.createPoints();
            settime(globe,0)();
            document.body.style.backgroundImage = 'none';
          }
        })
      }
      // initial get and begin
      getInstaData();
      globe.animate();
      setInterval(getInstaData, 5000)
    }
})
