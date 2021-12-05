<!-- ------------------------------------
Author:     Sabina Gulcikova 
         xgulci00@stud.fit.vutbr.cz
Date:           3/12/21 
------------------------------------- -->
<template>
  <v-container>
    <v-layout column>
      <div class="app">
        <div class="time-select">
          <v-btn style="padding: 0 4em;" @click="medTimeChanged(120)" id="timer-btn-1">2 Minutes</v-btn>
          <v-btn style="padding: 0 4em;" @click="medTimeChanged(300)" id="timer-btn-2">5 Minutes</v-btn>
          <v-btn style="padding: 0 4em;" @click="medTimeChanged(600)" id="timer-btn-3">10 Minutes</v-btn>
        </div>
        <div class="player-container">
          <audio class="song">
            <source :src="require('@/assets/audio/rain.mp3')" />
          </audio>
          <v-btn
            @click="playClicked()"
            icon
            color="primary"
            elevation="16"
            x-large
            min-width="100"
            min-height="100"
            style="top: 15%"
            id="btn-play"
          >
            <v-icon>mdi-play-circle-outline</v-icon>
          </v-btn>
          <svg
            class="track-outline"
            width="453"
            height="453"
            viewBox="0 0 453 453"
            fill="none"
            xmlns="http://www.w3.org/2000/svg"
          >
            <circle cx="226.5" cy="226.5" r="216.5" stroke="white" stroke-width="20" />
          </svg>
          <svg
            class="moving-outline"
            width="453"
            height="453"
            viewBox="0 0 453 453"
            fill="none"
            xmlns="http://www.w3.org/2000/svg"
          >
            <circle cx="226.5" cy="226.5" r="216.5" stroke="#018EBA" stroke-width="20" />
          </svg>

          <h3 id="time-display">2:00</h3>
        </div>

        <div class="sound-picker">
          <v-btn @click="playSound(0)" color="#BF9E74" min-width="100" min-height="120">
            <v-icon color="white" x-large>mdi-beach</v-icon>
          </v-btn>
          <v-btn @click="playSound(1)" color="#597078" min-width="100" min-height="120">
            <v-icon color="white" x-large>mdi-weather-lightning-rainy</v-icon>
          </v-btn>
        </div>
      </div>
    </v-layout>
  </v-container>
</template>

<script>
import soundBeach from "@/assets/audio/beach.mp3";
import soundRain from "@/assets/audio/rain.mp3";
export default {
  name: "Meditate",

  data: () => ({
    secs: 120,
    passedSecs: 0,

    audioBeach: new Audio(soundBeach),
    audioRain: new Audio(soundRain)
  }),

  beforeDestroy() {
    this.audioRain.pause();
    this.audioRain.currentTime = 0;

    this.audioBeach.pause();
    this.audioBeach.currentTime = 0;
  },

  methods: {
    playSound: function playSound(type) {
      if (type === 0) {
        this.audioBeach.play();
        this.audioRain.pause();
        this.audioRain.currentTime = 0;
      } else {
        this.audioRain.play();
        this.audioBeach.pause();
        this.audioBeach.currentTime = 0;
      }
    },

    medTimeChanged: function medTimeChanged(newVal) {
      this.secs = newVal;

      let el = document.getElementById("time-display");

      if (newVal == 120) {
        el.textContent = "2:00";
      }

      if (newVal == 300) {
        el.textContent = "5:00";
      }

      if (newVal == 600) {
        el.textContent = "10:00";
      }
    },

    startTime: function startTimer(duration, display) {
      let btn1 = document.getElementById("timer-btn-1");
      let btn2 = document.getElementById("timer-btn-2");
      let btn3 = document.getElementById("timer-btn-3");
      let btnPlay = document.getElementById("btn-play");

      let countDown = document.getElementById("time-display");

      btn1.style.display = "none";
      btn2.style.display = "none";
      btn3.style.display = "none";
      btnPlay.style.display = "none";

      countDown.style.fontSize = "80px";
      var timer = duration,
        minutes,
        seconds;

      const outline = document.querySelector(".moving-outline circle");
      const outlineLength = outline.getTotalLength();
      outline.style.strokeDashoffset = outlineLength;
      outline.style.strokeDasharray = outlineLength;

      setInterval(() => {
        let progress =
          outlineLength - (this.passedSecs / this.secs) * outlineLength;
        outline.style.strokeDashoffset = progress;

        minutes = parseInt(timer / 60, 10);
        seconds = parseInt(timer % 60, 10);

        minutes = minutes < 10 ? "0" + minutes : minutes;
        seconds = seconds < 10 ? "0" + seconds : seconds;

        display.textContent = minutes + ":" + seconds;

        if (--timer < 0) {
          timer = duration;
        }

        this.passedSecs += 1;
        console.log(this.passedSecs);
      }, 1000);
    },

    playClicked: function playClicked() {
      let el = document.getElementById("time-display");
      this.startTime(this.secs - 1, el);
    },

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

      const restartSong = song => {
        song.currentTime = 0;
        console.log("ciao");
      };

      timeSelect.forEach(option => {
        option.addEventListener("click", function() {
          fakeDuration = this.getAttribute("data-time");
          timeDisplay.textContent = `${Math.floor(
            fakeDuration / 60
          )}:${Math.floor(fakeDuration % 60)}`;
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
        let progress =
          outlineLength - (currentTime / fakeDuration) * outlineLength;
        outline.style.strokeDashoffset = progress;

        if (currentTime >= fakeDuration) {
          song.pause();
          song.currentTime = 0;
          play.src = "@/assets/svg/play.svg";
          video.pause();
        }
      };
    }
  }
};
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