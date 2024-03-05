var musicManagementButton = null;
var musicStateButton = null;

var lastUpdateAvailable = 0;
var currentMusicIndex = 1;
var currentTime = '0:00';
var totalTime = '0:00';
var lastSeconds = -1;
var lastUpdate = 0;
var progress = 0;
var count = 0;

var isNextPreviousClicked = false;
var isMusicWidgetVisible = false;
var updatesMenuOpened = false;
var musicWidgetOpened = false;
var canOpenMusicWidget = true;
var staffMenuOpened = false;
var closeMusicWidget = true;
var draggingMouse = false;
var canImageSlide = true;
var isAlternate = false;
var musicMuted = false;
var isClicked = false;
var colorSet = false;
var muted = false;

var musics = Config.Music;
var progressPercentage;
var progressbarmusic;
var lastMusicID;
var video;
var music;
var player;

var videotag = document.createElement('script');
var music = new Audio('music/' + musics[currentMusicIndex].filename);
music.volume = Config.MusicVolume;

$('#song-name-header').html(Config.Music[currentMusicIndex].title);

videotag.src = "https://www.youtube.com/iframe_api";
var firstVideoTag = document.getElementsByTagName('script')[0];
firstVideoTag.parentNode.insertBefore(videotag, firstVideoTag);
function onYouTubeIframeAPIReady() {
    player = new YT.Player("youtube-player", {
      events: {
          'onReady': onPlayerReady
      }
  });
}

function onPlayerReady() {
  player.setVolume(0);
}

const originalContent = $("#music-management").html();

function startImageCarousel() {
  const folderPath = 'img/slide/';
  const filePrefix = 'background';
  const fileextension = '.jpg';
  let currentIndex = 1;

  changeImage();

  setInterval(changeImage, Config.UpdateCarouselTime * 1000);

  function changeImage() {
    if (!canImageSlide) return;
    const imagePath = folderPath + filePrefix + currentIndex + fileextension;
  
    checkImageExistence(imagePath, function (exists) {
      const newImage = $('<img>', { src: imagePath, class: 'vid', alt: 'Image', });

      if (exists) {
        $('#video-foreground img').hide();
        $('#video-foreground').append(newImage);
        newImage.hide().fadeIn(1000);
      } else {
        currentIndex = 1;
        $('#video-foreground img').hide();
        newImage.attr('src', folderPath + filePrefix + currentIndex + fileextension);
        $('#video-foreground').append(newImage);
        newImage.hide().fadeIn(1000);
      }
    });
  
    currentIndex++;
  }

  function checkImageExistence(url, callback) {
    var img = new Image();
    img.onload = function () {
      callback(true);
    };
    img.onerror = function () {
      callback(false);
    };
    img.src = url;
  }
}

$(document).ready(function() {
  var row = '';
  for (let socialMedia in Config.SocialMedia) {
    if (Config.SocialMedia[socialMedia].link != '') {
      row += `
      <div class="social"><i class="fa-brands fa-${socialMedia}" onClick="openLinkInNewTab('${Config.SocialMedia[socialMedia].link}')"></i></div>`;
    }
  }
  row += `<div id="follow-for-updates" class="social-text"></div>`;
  $('#social-media').html(row);

  if (Config.BackgroundVideo) {
    if (Config.UseYoutubeVideo) {
      $('#video-foreground').html(`
      <iframe id="youtube-player" class="vid" src="https://www.youtube.com/embed/${Config.YoutubeVideoID}?enablejsapi=1&autoplay=1&loop=1&playlist=${Config.YoutubeVideoID}" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture;" allowfullscreen></iframe>
      `);
      document.getElementById('youtube-player').style.transform = 'scale(1.5)';
    } else {
      $('#video-foreground').html(`
      <video loop muted autoplay id="backgroundvideo" class="vid">
        <source src="img/video/loaading.mkv" type="video/webm">
      </video>`);
    }

  } else {
    startImageCarousel();

  }

  $(':root').css('--main-color', Config.Color);
  $(':root').css('--main-color-hover', Config.Color + 'BF');

  // LOCALES

  $("#whats-new").html(Locales[Config.Locale]['whatsnew']);
  $("#updates-added").html(Locales[Config.Locale]['updatesadded']);
  $("#follow-for-updates").html(Locales[Config.Locale]['followforupdates']);
  $("#staff-title").html(Locales[Config.Locale]['stafftitle'] + '&nbsp' + '<span id="staff-quantity" class="staff-quantity">' + count + '</span>');
  $("#all").html(Locales[Config.Locale]['all']);
  $("#mods").html(Locales[Config.Locale]['moderator']);
  $("#admins").html(Locales[Config.Locale]['administrator']);
  $("#now-playing").html(Locales[Config.Locale]['nowplaying']);
  $("#previous").html(Locales[Config.Locale]['previous']);
  $("#next").html(Locales[Config.Locale]['next']);
  
  // STAFF LIST

  var row = '';
  var count = 0;
  var firstInitial;
  var secondInitial;
  for (const staffMemberId in Config.StaffMembers) {
    if (Config.StaffMembers.hasOwnProperty(staffMemberId)) {
        const staffMember = Config.StaffMembers[staffMemberId];
        const nameAbreviation = staffMember.name.split(' ');
        if (nameAbreviation.length >= 2) {
          firstInitial = nameAbreviation[0].charAt(0);
          secondInitial = nameAbreviation[1].charAt(0);
        } else if (nameAbreviation.length == 1) {
          firstInitial = nameAbreviation[0].charAt(0);
          secondInitial = nameAbreviation[0].charAt(1).toUpperCase();
        }
        count += 1;
        if (!staffMember.image) {
          row += `
          <div class="staff-member">
            <div class="staff-image">${firstInitial}${secondInitial}</div>
              <div class="staff-info-div">
                  <div class="staff-name">${staffMember.name}</div>
                  <div class="staff-rank">${Locales[Config.Locale][staffMember.rank]}</div>
              </div>
          </div>
          `;
        } else {
          if (staffMember.image.startsWith('https://')) {
            row += `
            <div class="staff-member">
              <div class="staff-image">
                <img src="${staffMember.image}" class="staff-image image">
                </div>
                <div class="staff-info-div">
                    <div class="staff-name">${staffMember.name}</div>
                    <div class="staff-rank">${Locales[Config.Locale][staffMember.rank]}</div>
                </div>
            </div>
            `;
          } else {
            row += `
            <div class="staff-member">
              <div class="staff-image">
                <img src="img/avatars/${staffMember.image}" class="staff-image image">
                </div>
                <div class="staff-info-div">
                    <div class="staff-name">${staffMember.name}</div>
                    <div class="staff-rank">${Locales[Config.Locale][staffMember.rank]}</div>
                </div>
            </div>
            `;
          }
        }
      }
  }
  $('.staff-quantity').html('(' + count + ')');
  $('#staff-list').html(row);

  // UPDATE LIST

  const updateIds = Object.keys(Config.UpdateList).reverse();

  for (const updateId of updateIds) {
    if (Config.UpdateList.hasOwnProperty(updateId)) {
      var row = '';
      lastUpdate += 1;
      lastUpdateAvailable = lastUpdate;
      if (lastUpdate == 1) {
        row = `<div class="slide-dot slide-dot-selected"></div>`;
      } else {
        row = `<div class="slide-dot" onClick="nextUpdate(${updateId})"></div>`;
      }
    }
    $('#patch-notes-slide').append(row);
  }
  $('.patch-notes-banner').css('background-image', 'url(img/patchnotes/' + Config.UpdateList[lastUpdate].image + ')');
  $('#patch-notes-banner-title').html(Config.UpdateList[lastUpdate].title);
  $('#patch-notes-title').html(Config.UpdateList[lastUpdate].subtitle);
  $('#patch-notes-description').html(Config.UpdateList[lastUpdate].description);
  $('#updates-banner').attr('src', 'img/patchnotes/' + Config.UpdateList[lastUpdate].image);
  $('#updates-date').html(Config.UpdateList[lastUpdate].date);
  $('#updates-title').html(Config.UpdateList[lastUpdate].title);
  
  // VIDEO BUTTONS

  var buttonContainer = $('#buttonContainer').get(0);

  var isAlternate = false;
  var video = $('#backgroundvideo').get(0);

  buttonContainer.addEventListener('click', function () {
    if (Config.BackgroundVideo) {
      if (Config.UseYoutubeVideo) {
        if (isAlternate) {
          buttonContainer.innerHTML = '<i class="fa-solid fa-video button-i2"></i>';
          player.playVideo();
        } else {
          buttonContainer.innerHTML = '<i class="fa-solid fa-video-slash button-i2"></i>';
          player.pauseVideo();
        }
        isAlternate = !isAlternate;
      } else {
        if (isAlternate) {
          buttonContainer.innerHTML = '<i class="fa-solid fa-video button-i2"></i>';
          video.play();
        } else {
          buttonContainer.innerHTML = '<i class="fa-solid fa-video-slash button-i2"></i>';
          video.pause();
        }
        isAlternate = !isAlternate;
      }
    } else {
      if (isAlternate) {
        buttonContainer.innerHTML = '<i class="fa-solid fa-video button-i2"></i>';
        canImageSlide = true;
      } else {
        buttonContainer.innerHTML = '<i class="fa-solid fa-video-slash button-i2"></i>';
        canImageSlide = false;
      }
      isAlternate = !isAlternate;
    }
  });

  for (const key in Config.Music) {
    if (Config.Music.hasOwnProperty(key) && /^\d+$/.test(key)) {
      const number = parseInt(key, 10);
      if (number > lastMusicID || lastMusicID === undefined) {
        lastMusicID = number;
      }
    }
  }
});

function toggleStaffMenu(button) {
  if (button == 'closeStaff') {
    var slideMenu = $('#staffMenu').get(0);
    slideMenu.style.transform = 'translateX(100%)';
    staffMenuOpened = false;
    return;
  }
  if (!staffMenuOpened) {
    var slideMenu = $('#staffMenu').get(0);
    if (slideMenu.style.transform === 'translateX(0%)') {
      slideMenu.style.transform = 'translateX(100%)';
    } else {
      slideMenu.style.transform = 'translateX(0%)';
      staffMenuOpened = true;
    }
  }
}

function toggleUpdatesMenu(button) {
  var row = '';
  for (const updateListId in Config.UpdateList[lastUpdate].updateList) {
    if (row == '') {
      row += `
        <li>${Config.UpdateList[lastUpdate].updateList[updateListId].description}</li>
      `;
    } else {
      row += `
        <li class="mt-1">${Config.UpdateList[lastUpdate].updateList[updateListId].description}</li>
      `;
    }
  } 
  $('#update-list').html(row);
  row = '';
  if (button == 'closeUpdates') {
    var slideMenu = $('#updatesMenu').get(0);
    slideMenu.style.transform = 'translateX(-100%)';
    updatesMenuOpened = false;
    return;
  }
  if (!updatesMenuOpened) {
    var slideMenu = $('#updatesMenu').get(0);
    if (slideMenu.style.transform === 'translateX(0%)') {
      slideMenu.style.transform = 'translateX(-100%)';
    } else {
      slideMenu.style.transform = 'translateX(0%)';
      updatesMenuOpened = true;
    }
  }
}

function allStaff() {
  if ($("#admins").hasClass('staff-selected')) {
    $("#admins").removeClass('staff-selected');
  }
  if ($("#mods").hasClass('staff-selected')) {
    $("#mods").removeClass('staff-selected');
  }
  
  $("#all").addClass('staff-selected');
  var row = '';
  var firstInitial;
  var secondInitial;
  for (const staffMemberId in Config.StaffMembers) {
    if (Config.StaffMembers.hasOwnProperty(staffMemberId)) {
        const staffMember = Config.StaffMembers[staffMemberId];
        const nameAbreviation = staffMember.name.split(' ');
        if (nameAbreviation.length >= 2) {
          firstInitial = nameAbreviation[0].charAt(0);
          secondInitial = nameAbreviation[1].charAt(0);
        } else if (nameAbreviation.length == 1) {
          firstInitial = nameAbreviation[0].charAt(0);
          secondInitial = nameAbreviation[0].charAt(1).toUpperCase();
        }
        if (!staffMember.image) {
          row += `
          <div class="staff-member">
            <div class="staff-image">${firstInitial}${secondInitial}</div>
              <div class="staff-info-div">
                  <div class="staff-name">${staffMember.name}</div>
                  <div class="staff-rank">${Locales[Config.Locale][staffMember.rank]}</div>
              </div>
          </div>
          `;
        } else {
          if (staffMember.image.startsWith('https://')) {
            row += `
            <div class="staff-member">
              <div class="staff-image">
                <img src="${staffMember.image}" class="staff-image image">
                </div>
                <div class="staff-info-div">
                    <div class="staff-name">${staffMember.name}</div>
                    <div class="staff-rank">${Locales[Config.Locale][staffMember.rank]}</div>
                </div>
            </div>
            `;
          } else {
            row += `
            <div class="staff-member">
              <div class="staff-image">
                <img src="img/avatars/${staffMember.image}" class="staff-image image">
                </div>
                <div class="staff-info-div">
                    <div class="staff-name">${staffMember.name}</div>
                    <div class="staff-rank">${Locales[Config.Locale][staffMember.rank]}</div>
                </div>
            </div>
            `;
          }
        }
      }
  }
  $('#staff-list').html(row);
}

function onlyAdministrators() { 
  if ($('#all').hasClass('staff-selected')) {
    $('#all').removeClass('staff-selected');
  }
  if ($('#mods').hasClass('staff-selected')) {
    $('#mods').removeClass('staff-selected');
  }

  $('#admins').addClass('staff-selected');

  var row = '';
  var firstInitial;
  var secondInitial;
  for (const staffMemberId in Config.StaffMembers) {
    if (Config.StaffMembers.hasOwnProperty(staffMemberId)) {
        const staffMember = Config.StaffMembers[staffMemberId];
        const nameAbreviation = staffMember.name.split(' ');
        if (nameAbreviation.length >= 2) {
          firstInitial = nameAbreviation[0].charAt(0);
          secondInitial = nameAbreviation[1].charAt(0);
        } else if (nameAbreviation.length == 1) {
          firstInitial = nameAbreviation[0].charAt(0);
          secondInitial = nameAbreviation[0].charAt(1).toUpperCase();
        }
        if (staffMember.rank == 'administrator') {
          if (!staffMember.image) {
            row += `
            <div class="staff-member">
              <div class="staff-image">${firstInitial}${secondInitial}</div>
                <div class="staff-info-div">
                    <div class="staff-name">${staffMember.name}</div>
                    <div class="staff-rank">${Locales[Config.Locale][staffMember.rank]}</div>
                </div>
            </div>
            `;
          } else {
            if (staffMember.image.startsWith('https://')) {
              row += `
              <div class="staff-member">
                <div class="staff-image">
                  <img src="${staffMember.image}" class="staff-image image">
                  </div>
                  <div class="staff-info-div">
                      <div class="staff-name">${staffMember.name}</div>
                      <div class="staff-rank">${Locales[Config.Locale][staffMember.rank]}</div>
                  </div>
              </div>
              `;
            } else {
              row += `
              <div class="staff-member">
                <div class="staff-image">
                  <img src="img/avatars/${staffMember.image}" class="staff-image image">
                  </div>
                  <div class="staff-info-div">
                      <div class="staff-name">${staffMember.name}</div>
                      <div class="staff-rank">${Locales[Config.Locale][staffMember.rank]}</div>
                  </div>
              </div>
              `;
            }
          }
        }
      }
    }
    $('#staff-list').html(row);
}

function onlyModerators() {
  if ($('#all').hasClass('staff-selected')) {
    $('#all').removeClass('staff-selected');
  }
  if ($('#admins').hasClass('staff-selected')) {
    $('#admins').removeClass('staff-selected');
  }
  $('#mods').addClass('staff-selected');

  $('#staff-list').html('');

  var row = '';
  var firstInitial;
  var secondInitial;
  for (const staffMemberId in Config.StaffMembers) {
    if (Config.StaffMembers.hasOwnProperty(staffMemberId)) {
        const staffMember = Config.StaffMembers[staffMemberId];
        const nameAbreviation = staffMember.name.split(' ');
        if (nameAbreviation.length >= 2) {
          firstInitial = nameAbreviation[0].charAt(0);
          secondInitial = nameAbreviation[1].charAt(0);
        } else if (nameAbreviation.length == 1) {
          firstInitial = nameAbreviation[0].charAt(0);
          secondInitial = nameAbreviation[0].charAt(1).toUpperCase();
        }
        if (staffMember.rank == 'moderator') {
          if (!staffMember.image) {
            row += `
            <div class="staff-member">
              <div class="staff-image">${firstInitial}${secondInitial}</div>
                <div class="staff-info-div">
                    <div class="staff-name">${staffMember.name}</div>
                    <div class="staff-rank">${Locales[Config.Locale][staffMember.rank]}</div>
                </div>
            </div>
            `;
          } else {
            if (staffMember.image.startsWith('https://')) {
              row += `
              <div class="staff-member">
                <div class="staff-image">
                  <img src="${staffMember.image}" class="staff-image image">
                  </div>
                  <div class="staff-info-div">
                      <div class="staff-name">${staffMember.name}</div>
                      <div class="staff-rank">${Locales[Config.Locale][staffMember.rank]}</div>
                  </div>
              </div>
              `;
            } else {
              row += `
              <div class="staff-member">
                <div class="staff-image">
                  <img src="img/avatars/${staffMember.image}" class="staff-image image">
                  </div>
                  <div class="staff-info-div">
                      <div class="staff-name">${staffMember.name}</div>
                      <div class="staff-rank">${Locales[Config.Locale][staffMember.rank]}</div>
                  </div>
              </div>
              `;
            }
          }
        }
      }
    }
    $('#staff-list').html(row);
}

function toggleMusicWidget(event) {
  if (!canOpenMusicWidget) return;
  if (!musicWidgetOpened) {
    var musicManagement = $('#music-management').get(0);

    if (isMusicWidgetVisible) {

      setTimeout(() => {
        musicManagement.innerHTML = originalContent;
      }, 1000);
      
    } else {
      musicManagement.innerHTML = `
        <div class="music-widget">
          <div class="music-fr">
              <div>
                  <div id="music-name" class="music-name">
                      
                  </div>
                  <div id="music-artist" class="music-artist">
                      
                  </div>
              </div>
              <div id="music-controls" class="music-controls">
              </div>
          </div>
          <div class="music-time">
              <div id="music-current-time" class="music-current-time">
                 
              </div>
              <div id="music-progress-bar" class="music-progress-bar">

              </div>
              <div id="music-total-time" class="music-total-time">
              
              </div>
          </div>
        </div>
      `;
      $('.music-current-time, .music-total-time').css('animation', 'moveUp 0.65s ease-in-out');
      $('.music-name, .music-artist, .music-progress-bar, .music-controls').css('animation', 'moveLeft 0.65s ease-in-out');        
      
      var musicWidget = musicManagement.querySelector('.music-widget');
      musicWidget.style.width = '0';
      musicWidget.style.height = '0';

      setTimeout(() => {
        musicWidget.style.height = '4.265rem';
      }, 10);

      setTimeout(() => {
        musicWidget.style.width = '20rem';
      }, 10);
    }
    setTimeout(() => {
      $('#music-name').html(Config.Music[currentMusicIndex].title);
      $('#music-artist').html(Config.Music[currentMusicIndex].artist);
    }, 150);
    setTimeout(() => {
      $('#music-current-time').html(currentTime || '0:00');
      $('#music-total-time').html(totalTime || '0:00');
      $('#music-progress-bar').html(`
        <div id="progress-music-time" class="pbm-top"></div>
        <div class="pbm-bottom"></div>`
      );
      progressbarmusic = $('.pbm-top').get(0);

      var container = $('#music-progress-bar').get(0);
      var progressBar = $('#progress-music-time').get(0);

      var musicTime = music.currentTime;
      progressBar.style.width = (musicTime / music.duration) * 100 + "%";
      
      container.addEventListener("mousedown", function (e) {
        draggingMouse = true;
        var offsetX = e.clientX - container.getBoundingClientRect().left;
        var newProgress = (offsetX / container.offsetWidth) * 100;
        progressBar.style.width = newProgress + "%";

        function handleMouseMove(moveEvent) {
          var moveX = moveEvent.clientX - container.getBoundingClientRect().left;
          newProgress = (moveX / container.offsetWidth) * 100;
          newProgress = Math.max(0, Math.min(100, newProgress));
          progressBar.style.width = newProgress + "%";
        }
        function handleMouseUp() {
          draggingMouse = false;
          var newTime = (newProgress / 100) * music.duration;
          music.currentTime = newTime;
          var musicStateButton = $('#music-state');
          musicStateButton.innerHTML = '<i id="pauseMusic" class="fa-solid fa-pause"></i>';
          $(document).off("mousemove", handleMouseMove);
          $(document).off("mouseup", handleMouseUp);
        }
      
        $(document).on("mousemove", handleMouseMove);
        $(document).on("mouseup", handleMouseUp);
      });
    }, 150);
    if (isAlternate) {
      setTimeout(() => {
        $('#music-controls').html(`
        <div class="backward" onClick="previousMusic()">
          <i class="fa-solid fa-backward-step"></i>
        </div>
        <div class="music-state" id="music-state" onClick="changeButtonPlay(event)">
          <i id="playMusic" class="fa-solid fa-play"></i>
        </div>
        <div class="forward" onClick="nextMusic()">
          <i class="fa-solid fa-forward-step"></i>
        </div>
      `);
      }, 250);
    } else {
      music.play();
      setTimeout(() => {
        $('#music-controls').html(`
        <div class="backward" onClick="previousMusic()">
          <i class="fa-solid fa-backward-step"></i>
        </div>
        <div class="music-state" id="music-state" onClick="changeButtonPlay(event)">
          <i id="pauseMusic" class="fa-solid fa-pause"></i>
        </div>
        <div class="forward" onClick="nextMusic()">
          <i class="fa-solid fa-forward-step"></i>
        </div>
      `);
      }, 250);
    }

    musicWidgetOpened = true;
    isMusicWidgetVisible = !isMusicWidgetVisible;
    event.stopPropagation();
  }
}


$(document).on('click', function(event) {
  if (!canOpenMusicWidget) { return; }
  canOpenMusicWidget = false;
  var musicManagement = $("#music-management").get(0);
  var staffMenu = $("#staffMenu").get(0);
  var openStaffButton = $("#openStaffButton").get(0);
  var updatesMenu = $("#updatesMenu").get(0);
  var openUpdatesButton = $("#openUpdatesButton").get(0);
  if (event.target !== musicManagement && !musicManagement.contains(event.target)) {
    if (isMusicWidgetVisible) {
      $('.music-progress-bar').css('animation', 'moveDown 0.65s ease-in-out');
      var musicManagement = $("#music-management").get(0);
      var musicWidget = musicManagement.querySelector('.music-widget');
      $('.music-current-time, .music-total-time').css('animation', 'moveDown 0.25s ease-in-out');
      $('.music-name, .music-artist, .music-progress-bar, .music-controls').css('animation', 'moveRight 0.25s ease-in-out');      
      
      musicWidget.style.width = '20rem';
      musicWidget.style.height = '4.265rem';

      setTimeout(() => {
        musicWidget.style.width = '0';
      }, 10);

      setTimeout(() => {
        musicWidget.style.height = '0.515rem';
      }, 10);

      setTimeout(() => {
        $('#music-name, #music-artist, #music-current-time, #music-total-time, #music-progress-bar, #music-controls').html('');

      }, 250);
      setTimeout(() => {
        $('#music-name, #music-artist').html('');
      }, 100);

      setTimeout(() => {
        musicManagement.innerHTML = originalContent;
      }, 400);

      isMusicWidgetVisible = !isMusicWidgetVisible;
      musicWidgetOpened = false;
    }
  }

  if (event.target !== openStaffButton && !openStaffButton.contains(event.target) &&  event.target !== staffMenu && !staffMenu.contains(event.target) && staffMenuOpened) {
    staffMenuOpened = false;
    toggleStaffMenu();
  }

  if (event.target !== openUpdatesButton && !openUpdatesButton.contains(event.target) &&  event.target !== updatesMenu && !updatesMenu.contains(event.target) && updatesMenuOpened) {
    updatesMenuOpened = false;
    toggleUpdatesMenu();
  }
  setTimeout(() => {
    canOpenMusicWidget = true;
  }, 400);
});


// UPDATES

$(document).ready(function() {
	document.onkeyup = function(data) {
		if (data.which == 68) {
      isNextPreviousClicked = true;
			nextUpdate();
		} else if (data.which == 65) {
      isNextPreviousClicked = true;
      previousUpdate();
    } else if (data.which == 77) {
      if (!musicMuted) {
        music.volume = 0;
        musicMuted = true;
      } else {
        music.volume = Config.MusicVolume;
        musicMuted = false;
      }
    }
	};
});

function previousUpdate() {
  const previousUpdateId = lastUpdate + 1;

  if (Config.UpdateList[previousUpdateId]) {
      lastUpdate += 1;
  } else {
      lastUpdate = 1;
  }
  var row = '';
  var dots = '';
  $('#patch-notes-slide').html('');

  for (let i = lastUpdateAvailable; i >= 1; i--) {
      if (i === lastUpdate) {
          dots += `<div class="slide-dot slide-dot-selected"></div>`;
      } else {
          dots += `<div class="slide-dot" onClick="nextUpdate(${i})"></div>`;
      }
  }
  $('#patch-notes-slide').html(dots);
  setTimeout(() => {
    $('.patch-notes-banner-title, .patch-notes-title, .patch-notes-description, .patch-notes-banner')
    .css('animation', 'moveLeft 0.65s ease-in-out');
  
    $('.patch-notes-banner').css('background-image', 'url(img/patchnotes/' + Config.UpdateList[lastUpdate].image + ')');
  $('#patch-notes-banner-title').html(Config.UpdateList[lastUpdate].title);
  $('#patch-notes-title').html(Config.UpdateList[lastUpdate].subtitle);
  $('#patch-notes-description').html(Config.UpdateList[lastUpdate].description);
  $('#updates-banner').attr('src', 'img/patchnotes/' + Config.UpdateList[lastUpdate].image);
  $('#updates-date').html(Config.UpdateList[lastUpdate].date);
  $('#updates-title').html(Config.UpdateList[lastUpdate].title);
  
    for (const updateListId in Config.UpdateList[lastUpdate].updateList) {
      if (row == '') {
        row += `
          <li>${Config.UpdateList[lastUpdate].updateList[updateListId].description}</li>
        `;
      } else {
        row += `
          <li class="mt-1">${Config.UpdateList[lastUpdate].updateList[updateListId].description}</li>
        `;
      }
    }   
    $('#update-list').html(row);
    row = '';
  }, 100);
  $('.patch-notes-banner-title, .patch-notes-title, .patch-notes-description, .patch-notes-banner').css('animation', '');

}

function nextUpdate(num) {
  if (!num) {
      const nextUpdateId = lastUpdate - 1;

      if (Config.UpdateList[nextUpdateId]) {
          lastUpdate -= 1;
      } else {
          lastUpdate = lastUpdateAvailable;
      }
  } else {
      lastUpdate = num;
  }
  var row = '';
  var dots = '';
  $('#patch-notes-slide').html('');

  for (let i = lastUpdateAvailable; i >= 1; i--) {
      if (i === lastUpdate) {
          dots += `<div class="slide-dot slide-dot-selected"></div>`;
      } else {
          dots += `<div class="slide-dot" onClick="nextUpdate(${i})"></div>`;
      }
  }
  $('#patch-notes-slide').append(dots);
  setTimeout(() => {
  $('.patch-notes-banner-title, .patch-notes-title, .patch-notes-description, .patch-notes-banner').css('animation', 'moveLeft 0.65s ease-in-out');
  
  $('.patch-notes-banner').css('background-image', 'url(img/patchnotes/' + Config.UpdateList[lastUpdate].image + ')');
  $('#patch-notes-banner-title').html(Config.UpdateList[lastUpdate].title);
  $('#patch-notes-title').html(Config.UpdateList[lastUpdate].subtitle);
  $('#patch-notes-description').html(Config.UpdateList[lastUpdate].description);
  $('#updates-banner').attr('src', 'img/patchnotes/' + Config.UpdateList[lastUpdate].image);
  $('#updates-date').html(Config.UpdateList[lastUpdate].date);
  $('#updates-title').html(Config.UpdateList[lastUpdate].title);
  
    for (const updateListId in Config.UpdateList[lastUpdate].updateList) {
      if (row == '') {
        row += `
          <li>${Config.UpdateList[lastUpdate].updateList[updateListId].description}</li>
        `;
      } else {
        row += `
          <li class="mt-1">${Config.UpdateList[lastUpdate].updateList[updateListId].description}</li>
        `;
      }
    }
    $('#update-list').html(row);
    row = '';
  }, 100);
  $('.patch-notes-banner-title, .patch-notes-title, .patch-notes-description, .patch-notes-banner').css('animation', '');
}


// MUSIC

function changeButtonPlay(event) {
  closeMusicWidget = false;

  var musicStateButton = $('#music-state').get(0);

  if (isAlternate) {
    musicStateButton.innerHTML = '<i id="pauseMusic" class="fa-solid fa-pause"></i>';
    isAlternate = false;
    closeMusicWidget = false;
    music.play();
    
  } else {
    musicStateButton.innerHTML = '<i id="playMusic" class="fa-solid fa-play"></i>';
    isAlternate = true;
    closeMusicWidget = false;
    music.pause();
  }

event.stopPropagation();
}

function playCurrentMusic() {
  music.src = 'music/' + musics[currentMusicIndex].filename;
  music.play();
  updateTime();
}

function nextMusic() {
  isAlternate = false;
  if (currentMusicIndex == lastMusicID) {
    currentMusicIndex = 1;
  } else {
    currentMusicIndex += 1;
  }

  if (musicWidgetOpened) {
    $('#music-state').html('<i id="pauseMusic" class="fa-solid fa-pause"></i>');
    $('#music-name').html(Config.Music[currentMusicIndex].title);
    $('#music-artist').html(Config.Music[currentMusicIndex].artist);
    $('#music-current-time').text('0:00');
    $('#music-total-time').text('0:00');
    progressbarmusic.style.width = '0%';
  }
  $('#song-name-header').html(Config.Music[currentMusicIndex].title);
  
  playCurrentMusic();
}

function previousMusic() {
  isAlternate = false;
  if (currentMusicIndex == 1) {
    currentMusicIndex = lastMusicID;
  } else {
    currentMusicIndex -= 1;
  }
  if (musicWidgetOpened) {
    $('#music-state').html('<i id="pauseMusic" class="fa-solid fa-pause"></i>');
    $('#music-name').html(Config.Music[currentMusicIndex].title);
    $('#music-artist').html(Config.Music[currentMusicIndex].artist);
    $('#song-name-header').html(Config.Music[currentMusicIndex].title);
    $('#music-current-time').text('0:00');
    $('#music-total-time').text('0:00');
    progressbarmusic.style.width = '0%';
  }
  
  playCurrentMusic();
}

function updateTime() {
  currentTime = formatTime(music.currentTime);
  totalTime = formatTime(music.duration);
  var currentSeconds = Math.floor(music.currentTime % 60);

  if (currentSeconds !== lastSeconds) {
    progressPercentage = (music.currentTime / music.duration) * 100;
    if (!draggingMouse && musicWidgetOpened) {
      progressbarmusic.style.width = progressPercentage + '%';
    }
    lastSeconds = currentSeconds;
  }

  if (totalTime == 'NaN:NaN') {
    totalTime = '0:00';
  }

  if (musicWidgetOpened) {
    $('#music-current-time').text(currentTime);
    $('#music-total-time').text(totalTime);
  }

  if (music.currentTime == music.duration) {
    nextMusic();
  }
}

function formatTime(time) {
  var minutes = Math.floor(time / 60);
  var seconds = Math.floor(time % 60);
  return minutes + ':' + (seconds < 10 ? '0' : '') + seconds;
}

setInterval(updateTime, 100);

playCurrentMusic();


// SOCIAL MEDIA

function openLinkInNewTab(socialMedia) {
  const socialMediaData = Config.SocialMedia[socialMedia];
  if (socialMediaData) {
    const link = socialMediaData.link;
    if (typeof window.invokeNative === 'function') {
      window.invokeNative('openUrl', link);
    } else {
      window.open(link, '_blank');
    }
  }
}

function skipUpdateTimer() {
    setInterval(function() {
      if (!isNextPreviousClicked) {
        if (!updatesMenuOpened) {
          nextUpdate();
        }
      } else {
        setTimeout(function() {
          isNextPreviousClicked = false;
        }, (Config.UpdateCarouselTime * 1000) * 2);
      }
    }, (Config.UpdateCarouselTime * 1000));
  
}

skipUpdateTimer();


// PROGRESS BAR

const handlers = {
    startInitFunctionOrder(data) {
        count = data.count;
        updateProgress();
    },

    initFunctionInvoking(data) {
        progress += 25;
        updateProgress();
    },

    startDataFileEntries(data) {
        count = data.count;
        updateProgress();
    },

    performMapLoadFunction(data) {
        progress = 100;
        updateProgress();
    },
};

function updateProgress() {
    const normalizedProgress = Math.min(progress / 47.5, 100);
    $('#progressbar').css('width', normalizedProgress + '%');
}

window.addEventListener('message', function (e) {
    (handlers[e.data.eventName] || function () { })(e.data);
});