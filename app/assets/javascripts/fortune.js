window.addEventListener("load", function(){
  let startBtn = document.getElementById("start");
  let stopBtn = document.getElementById("stop");
  let started = false;
  let roulette = document.getElementById("roulette");
  let fortune = "";
  var rotation = -1;
  
  startBtn.addEventListener("click", function(){
    let fortunes = ["大吉です！！", "吉です！", "末吉です", "凶..."]
    started = true;
    startBtn.disabled = true;
    rotation = setInterval(function(){
      if(started == true){
        fortune = fortunes[Math.floor(Math.random() * fortunes.length)];
        roulette.className = "name";
        document.getElementById("result").innerHTML = fortune
      }
    }, 40);
  });

  stopBtn.addEventListener("click", function(){
    clearTimeout(rotation);
    started = false;
    startBtn.disabled = false;  
    if(fortune == ""){
        window.alert("先にスタートボタンを押してください");
    } else {
      roulette.className = "name";
      document.getElementById("result").innerHTML = fortune
    }
  });
})
