<!-- ------------------------------------
Author:     Sabina Gulcikova 
         xgulci00@stud.fit.vutbr.cz
Date:           3/12/21 
------------------------------------- -->

<template>
  <div>
    <v-container>
      <v-layout row justify="center" align="center">
        <v-flex>
          <div class="breathing_circle">
            <div class="cont" id="cont">
              <div class="circle"></div>
              <p id="text">Prepare</p>
              <div class="pointer-container" id="pointer-container">
                <span class="pointer"></span>
              </div>

              <div class="gradient-circle"></div>
            </div>
          </div>
        </v-flex>
      </v-layout>

      <v-layout row justify="center">
        <v-flex>
          <v-btn @click="breathe()" class="breathe-btn">Begin</v-btn>
        </v-flex>
      </v-layout>
    </v-container>
  </div>
</template>

<script>
export default {
  name: "Breathing",

  data: () => ({}),

  methods: {
    breathe: function breathe() {
      function breathAnimation() {
        let totalTime = 7500;
        let breatheTime = (totalTime / 5) * 2;
        let holdTime = totalTime / 5;

        const cont = document.getElementById("cont");
        const text = document.getElementById("text");
        const pointer = document.getElementById("pointer-container");

        text.innerText = "Breathe In";
        cont.className = "cont grow";
        pointer.className = "pointer-container-animate";

        setTimeout(() => {
          text.innerText = "Hold";

          setTimeout(() => {
            text.innerText = "Breathe Out";
            cont.className = "cont shrink";
          }, holdTime);
        }, breatheTime);
      }
      setInterval(breathAnimation, 7500);
    }
  }
};
</script> 

<style>

.breathing_circle {
  padding: 100px;
  justify-content: center;
}

.cont {
  display: flex;
  align-items: center;
  justify-content: center;
  margin: auto;
  height: 300px;
  width: 300px;
  position: relative;
  transform: scale(1);
}

.breathe-btn {
  display: flex;
  align-items: center;
  justify-content: center;
  margin: auto;
  position: relative;
  transform: scale(1);
}

.circle {
  background-color: #e6f7de;
  height: 100%;
  width: 100%;
  border-radius: 50%;
  position: absolute;
  top: 0;
  left: 0;
  z-index: -1;
}

.gradient-circle {
  background: conic-gradient(
    #55b7a4 0%,
    #4ca493 40%,
    #fff 40%,
    #fff 60%,
    #336d62 60%,
    #2a5b52 100%
  );

  height: 320px;
  width: 320px;
  z-index: -2;
  border-radius: 50%;
  position: absolute;
  top: -10px;
  left: -10px;
}

.pointer {
  background-color: #0c722e;
  border-radius: 50%;
  height: 20px;
  width: 20px;
  display: block;
}

.pointer-container {
  position: absolute;
  top: -40px;
  left: 140px;
  width: 20px;
  height: 190px;
  transform-origin: bottom center;
}

.pointer-container-animate {
  animation: rotate 7.5s linear forwards infinite;
  position: absolute;
  top: -40px;
  left: 140px;
  width: 20px;
  height: 190px;
  transform-origin: bottom center;
}

@keyframes rotate {
  from {
    transform: rotate(0deg);
  }

  to {
    transform: rotate(360deg);
  }
}

.cont.grow {
  animation: grow 3s linear forwards;
}

@keyframes grow {
  from {
    transform: scale(1);
  }

  to {
    transform: scale(1.2);
  }
}

.cont.shrink {
  animation: shrink 3s linear forwards;
}

@keyframes shrink {
  from {
    transform: scale(1.2);
  }

  to {
    transform: scale(1);
  }
}
</style>