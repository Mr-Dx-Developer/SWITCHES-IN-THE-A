let timer = false;
let complatebar = false;
let count = 0;

const scoreList = (result) => {
  for (i = 0; i < result.length; i++) {
    const defaultNameId = "#name";
    const defaultScoreId = "#score";
    const nameId = defaultNameId.concat(i);
    const scoreId = defaultScoreId.concat(i);
    $(nameId).html(result[i].name);
    $(scoreId).html(result[i].score);
  }
}

const miniGame = (type) => {
  Timer(type)
  const maxCount = 50;
  const maxmright = 36;
  let mright = 0;
  let keydown = false;
  let oneletter = Math.random().toString(36).slice(2, 3);
  let newWidth;
  $('#key').html(oneletter)
  document.onkeydown = (e) => {
    if (count === maxCount) {
      complatebar = true
    }
    if (e.key == oneletter && count != maxCount && !timer && !keydown) {
      keydown = true;
      count = count === maxCount ? maxCount : count + 1;
      mright = mright === maxmright ? maxmright : count + 1;
      newWidth = (count / maxCount) * 100 + "%";
      $('#progressbar').css('width', newWidth)
      if (newWidth === '30%') {
        $('#progressbar').css('background-color', '#f98813')
      }
      if (newWidth === '80%') {
        $('#progressbar').css('background-color', '#6eff6e')
      }
      $('img').css('margin-left', mright + 'vh')
      $('#key').css('border-color', 'rgb(129 126 126)')
      $('#key').css('color', 'rgb(22 22 22)')
      $('#key').removeClass(' animate__heartBeat animation__slow animate__repeat-2')
      $('#key').addClass('animate__tada animate__faster')
      $('#progressbar').addClass('animate__shakeX animate__slow')
    }
    document.onkeyup = () => {
      $('#key').css('border-color', '#4a4a4a')
      $('#key').css('color', '#fff')
      $('#key').removeClass('animate__tada animate__faster')
      $('#progressbar').removeClass('animate__shakeX animate__slow')
      keydown = false;
    };
  };
}

const increment = (score, finalVal) => {
  let currVal = parseInt($('#score').html(), 10);
  if (currVal < finalVal) {
    currVal++;
    $('#score').html(currVal);
    setTimeout(() => {
      increment(score, finalVal);
    }, 5)
  } else {
    setTimeout(() => {
      postFetch('escape')
      $('.totalscore').css('display', 'none');
      location.reload();
    }, 2000)
  }
};

const Timer = (type) => {
  let timeleft = 0;
  let minibarscore = 0;
  switch (type) {
    case 'Easy':
      timeleft = 55
      break;
    case 'Normal':
      timeleft = 45
      break;
    case 'Hard':
      timeleft = 35
      break;
  }
  const downloadTimer = setInterval(() => {
    if (timeleft < 0) {
      timer = true
      clearInterval(downloadTimer);
      minibarscore = count * 20
      postFetch(`getscore`, minibarscore)
      $('.minigame').css('display', 'none')
    } else if (complatebar) {
      clearInterval(downloadTimer);
      minibarscore = 999
      postFetch(`getscore`, minibarscore)
      $('.minigame').css('display', 'none')
    } else {
      $('#time').html('<i class="fa-regular fa-clock"></i> ' + timeleft)
    }
    timeleft -= 1;
  }, 100);
}

document.onkeyup = (event) => {
  event = event || window.event;
  var charCode = event.keyCode || event.which;
  if (charCode == 27) { 
    postFetch('escape')
    location.reload();
  }
};

const postFetch = (callback, load) => {
  $.post(`https://punchmachine/${callback}`, JSON.stringify({load}));
}

window.addEventListener('message', (e) => {
  const d = e.data
  switch (d.status) {
    case 'totalscore':
      $('.totalscore').css('display', 'block')
      increment(100, d.score);
      break;
    case 'minigame':
      $('.minigame').css('display', 'block')
      miniGame(d.type)
      break;
    case 'scorelist':
      $('.scorelist').css('display', 'block')
      scoreList(d.result)
      break;
  }
});