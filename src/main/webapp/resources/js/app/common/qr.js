/**
 * 
 */
document.addEventListener("DOMContentLoaded", function() {

		var video = document.createElement("video");

		var canvasElement = document.getElementById("canvas");

		var canvas = canvasElement.getContext("2d");

		var loadingMessage = document.getElementById("loadingMessage");

		var outputContainer = document.getElementById("output");

		var outputMessage = document.getElementById("outputMessage");

		var outputData = document.getElementById("outputData");

		function drawLine(begin, end, color) {

			canvas.beginPath();

			canvas.moveTo(begin.x, begin.y);

			canvas.lineTo(end.x, end.y);

			canvas.lineWidth = 4;

			canvas.strokeStyle = color;

			canvas.stroke();

		}

		// 카메라 사용시

		navigator.mediaDevices.getUserMedia({
			video : {
				facingMode : "environment"
			}
		}).then(function(stream) {

			video.srcObject = stream;

			video.setAttribute("playsinline", true); // iOS 사용시 전체 화면을 사용하지 않음을 전달

			video.play();

			requestAnimationFrame(tick);

		});

		function tick() {

			loadingMessage.innerText = "⌛ 스캔 기능을 활성화 중입니다."

			if (video.readyState === video.HAVE_ENOUGH_DATA) {

				loadingMessage.hidden = true;

				canvasElement.hidden = false;

				outputContainer.hidden = false;

				// 읽어들이는 비디오 화면의 크기

				canvasElement.height = video.videoHeight;

				canvasElement.width = video.videoWidth;

				canvas.drawImage(video, 0, 0, canvasElement.width,
						canvasElement.height);
						

				var imageData = canvas.getImageData(0, 0, canvasElement.width,
						canvasElement.height);

				var code = jsQR(imageData.data, imageData.width,
						imageData.height, {

							inversionAttempts : "dontInvert",

						});

				// QR코드 인식에 성공한 경우
				let codeTest = null;
				if (code) {

					// 인식한 QR코드의 영역을 감싸는 사용자에게 보여지는 테두리 생성

					drawLine(code.location.topLeftCorner,
							code.location.topRightCorner, "#FF0000");

					drawLine(code.location.topRightCorner,
							code.location.bottomRightCorner, "#FF0000");

					drawLine(code.location.bottomRightCorner,
							code.location.bottomLeftCorner, "#FF0000");

					drawLine(code.location.bottomLeftCorner,
							code.location.topLeftCorner, "#FF0000");

					outputMessage.hidden = true;

					outputData.parentElement.hidden = false;

					// QR코드 메시지 출력

					codeTest = code.data
					outputData.innerHTML = code.data;

					if (codeTest != null) {
						window.location.href=codeTest;						
					}
					
					// return을 써서 함수를 빠져나가면 QR코드 프로그램이 종료된다.

					 return;

				}

				// QR코드 인식에 실패한 경우 

				else {

					outputMessage.hidden = false;

					outputData.parentElement.hidden = true;

				}
				

			}

			requestAnimationFrame(tick);

		}

	});