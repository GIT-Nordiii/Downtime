$(document).ready(function () {

    window.addEventListener("message", function (event) {
        if (event.data.action == "setMoney") {
          setAnzahl(event.data.money);
		    $(".money").show();
  $("money").show();
        };
        if (event.data.action == "setBlackMoney") {
          setAnzahle(event.data.black);
  $(".schwarzmoney").show();
  $("schwarzmoney").show();

        };
		        if (event.data.action == "show") {
  $(".funk").show();
  $(".funke").hide();

        };
				        if (event.data.action == "hide") {
  $(".funk").hide();
  $(".funke").show();

        };
						        if (event.data.action == "weg") {
  $(".funk").hide();
  $(".funke").hide();

        };
				        if (event.data.action == "muted") {
					if (event.data.muted == true) {
					  $(".voice1").hide();
					  $(".voice2").hide();
					  $(".voice3").hide();
					 // $(".voice4").hide();
					  $("voice1").hide();
					  $("voice2").hide();
					  $("voice3").hide();
					  //$("voice4").hide();
					  $("voicemuted").show();
					  $(".voicemuted").show();
						
					}
										if (event.data.muted == false) {
					  $("voicemuted").hide();
					  $(".voicemuted").hide();
						
					}

        };
						        if (event.data.action == "nomuted") {
					  $("voicemuted").hide();
					  $(".voicemuted").hide();
						
					

        };

		        if (event.data.action == "setVoiceLevel") {
					  $(".voice1").hide();
					  $(".voice2").hide();
					  $(".voice3").hide();
					 // $(".voice4").hide();
					  $("voice1").hide();
					  $("voice2").hide();
					  $("voice3").hide();
					  //$("voice4").hide();
  $(".voice" + event.data.level).show();
  $("voice" + event.data.level).show();
        };
        if (event.data.action == "hideBlackMoney") {
  $(".schwarzmoney").hide();
  $("schwarzmoney").hide();

	};

    });
});

function setAnzahl(anzahl) {
    document.getElementsByClassName('money')[0].innerHTML = new Intl.NumberFormat('de-DE').format(anzahl) + " $";

}
function setAnzahle(anzahl) {
    document.getElementsByClassName('schwarzmoney')[0].innerHTML = new Intl.NumberFormat('de-DE').format(anzahl) + " $";

}

