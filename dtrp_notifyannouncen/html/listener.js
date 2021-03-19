$(function(){
	window.onload = (e) => {
		window.addEventListener('message', (event) => {
			var item = event.data;
			if (item !== undefined && item.type === "message") {
				if (item.display !== true) {
                    $("#message").fadeOut(500);
				} 
				else 
				{
                    $("#message").fadeIn(500);
				}
			}
		});
	};
});



var player = null;
window.addEventListener('message', function(e) {
    if (e.data.message == 'play') {
  		
	  if (player != null) {
		player.pause();
		player.currentTime = 0;
	  }
	  player = new Audio("./sound/"+e.data.sound);
	  player.volume = e.data.volume;

	  player.play();
	}
})
