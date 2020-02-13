window.addEventListener("load", function(){
  let started = false;
  let fortune = "";
  var rotation = -1;
  
  $(document).on("click", "#start", function(){
    let fortunes = ["大吉です！！", "吉です！", "末吉です", "凶..."]
    started = true;
    rotation = setInterval(function(){
      if(started == true){
        fortune = fortunes[Math.floor(Math.random() * fortunes.length)];
        document.getElementById("result").innerHTML = fortune
      }
    }, 40);
  });

  $(document).on("click", "#stop", function(){
    clearTimeout(rotation);
    if(fortune == ""){
        window.alert("先にスタートボタンを押してください");
    } else {
      document.getElementById("result").innerHTML = fortune
    }
  });
})
