<template>
<v-container>
<v-layout column> 
<div class="app">
      <div class="vid-container">
        <!-- <video loop >
          <source src="./video/rain.mp4"  type="video/mp4">
        </video> -->
        </div>
        <div class="time-select">
          <v-btn data-time="10">2 Minutes</v-btn>
          <v-btn data-time="300" class="medium-mins">5 Minutes</v-btn>
          <v-btn data-time="600" class="long-mins">10 Minutes</v-btn>
        </div>
        <div class="player-container">
            <audio class="song">
                <source :src="require('@/assets/audio/rain.mp3')" />
              </audio>
              <v-img :src="require('@/assets/svg/play.svg')" class="play"></v-img>
              <svg class="track-outline" width="453" height="453" viewBox="0 0 453 453" fill="none" xmlns="http://www.w3.org/2000/svg">
                <circle cx="226.5" cy="226.5" r="216.5" stroke="white" stroke-width="20"/>
                </svg>
              <svg class="moving-outline" width="453" height="453" viewBox="0 0 453 453" fill="none" xmlns="http://www.w3.org/2000/svg">
                <circle cx="226.5" cy="226.5" r="216.5" stroke="#018EBA" stroke-width="20"/>
                </svg>
              <!-- <v-img :src="require('@/assets/svg/replay.svg')" class="replay"></v-img> -->
            
                <h3 class="time-display">0:00</h3>      
      </div>
      <div class="sound-picker">
        <v-btn :data-sound="require('@/assets/audio/rain.mp3')"><v-img :src="require('@/assets/svg/rain.svg')" alt=""></v-img></v-btn>
        <v-btn :data-sound="require('@/assets/audio/beach.mp3')"><v-img :src="require('@/assets/svg/beach.svg')" alt="" size="50%"></v-img></v-btn>
      </div>
    </div>

    

</v-layout>
</v-container>
</template>

<script>
  export default {
    name: 'Meditate',

    data: () => ({
    }),

    methods: { 
        meditate: function meditate() {
            const song = document.querySelector(".song");
            const play = document.querySelector(".play");
            const replay = document.querySelector(".replay");
            const outline = document.querySelector(".moving-outline circle");
            const video = document.querySelector(".vid-container video");
            //Sounds
            const sounds = document.querySelectorAll(".sound-picker button");
            //Time Display
            const timeDisplay = document.querySelector(".time-display");
            const outlineLength = outline.getTotalLength();
            //Duration
            const timeSelect = document.querySelectorAll(".time-select button");
            let fakeDuration = 600; 

            outline.style.strokeDashoffset = outlineLength;
            outline.style.strokeDasharray = outlineLength;
            timeDisplay.textContent = `${Math.floor(fakeDuration / 60)}:${Math.floor(
            fakeDuration % 60
            )}`; 

            sounds.forEach(sound => {
            sound.addEventListener("click", function() {
                song.src = this.getAttribute("data-sound");
                video.src = this.getAttribute("data-video");
                checkPlaying(song);
            });
            });

            play.addEventListener("click", function() {
            checkPlaying(song);
            });

            replay.addEventListener("click", function() {
                restartSong(song);
                
            }); 

            const restartSong = song =>{
                // let currentTime = song.currentTime;
                song.currentTime = 0;
                console.log("ciao")

            }

            timeSelect.forEach(option => {
            option.addEventListener("click", function() {
                fakeDuration = this.getAttribute("data-time");
                timeDisplay.textContent = `${Math.floor(fakeDuration / 60)}:${Math.floor(
                fakeDuration % 60
                )}`;
            });
            });

            const checkPlaying = song => {
            if (song.paused) {
                song.play();
                video.play();
                play.src = "@/assets/svg/pause.svg";
            } else {
                song.pause();
                video.pause();
                play.src = "@/assets/svg/play.svg";
            }
            };

            song.ontimeupdate = function() {
            let currentTime = song.currentTime;
            let elapsed = fakeDuration - currentTime;
            let seconds = Math.floor(elapsed % 60);
            let minutes = Math.floor(elapsed / 60);
            timeDisplay.textContent = `${minutes}:${seconds}`;
            let progress = outlineLength - (currentTime / fakeDuration) * outlineLength;
            outline.style.strokeDashoffset = progress;

            if (currentTime >= fakeDuration) {
                song.pause();
                song.currentTime = 0;
                play.src = "@/assets/svg/play.svg";
                video.pause();
            }
            };

        },
    },
  }
</script> 

<style scoped>
* {
  margin: 0;
  padding: 0;
  box-sizing: border-box;
}

.app {
  height: 100vh;
  display: flex;
  justify-content: space-evenly;
  align-items: center;
  /* font-family: "Montserrat", sans-serif; */
}

.sound-picker {
  height: 80%;
  display: flex;
  justify-content: space-evenly;
  align-items: center;
  flex-direction: column;
  flex: 1;  
}

.time-select {
  height: 80%;
  display: flex;
  justify-content: space-evenly;
  align-items: center;
  flex-direction: column;
  flex: 1;
}
.time-select button,
.sound-picker button {
  color: "#3DAF7B";
  width: 30%;
  height: 10%;
  background: none;
  font-size: 20px;
  border-radius: 5px;
  cursor: pointer;
  border: 2px solid white;
  transition: all 0.5s ease;
}

.sound-picker button {
  border: none;
  height: 120px;
  width: 120px;
  padding: 30px;
  border-radius: 50%;
}
.sound-picker button:nth-child(1) {
  background: #4972a1;
}
.sound-picker button:nth-child(2) {
  background: #a14f49;
}
.sound-picker button img {
  height: 100%;
}

.time-select button:hover {
  background: white;
  color: black;
}


.player-container {
  position: relative;
  height: 80%;
  display: flex;
  justify-content: space-evenly;
  align-items: center;
  flex-direction: column;
  flex: 1;
}

.player-container svg {
  position: absolute;
  height: 50%;
  top: 50%;
  left: 50%;
  transform: translate(-50%, -50%) rotate(-90deg);
  pointer-events: none;
}
.player-container svg circle {
  transition: all 0.2s ease-in-out;
}
.time-display {
  color: #000000;
  position: absolute;
  font-size: 50px;
  bottom: 10%;
}

video {
  position: fixed;
  top: 0%;
  left: 0%;
  width: 100%;
  z-index: -10;
}
</style>