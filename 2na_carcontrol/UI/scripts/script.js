let player;
let playerRuning = false;
let progressInterval = null;
let pausedVideoDuration = null;

function onYouTubeIframeAPIReady() {
  player = new YT.Player("player", {
    height: "1",
    width: "1",
    videoId: "",
    playerVars: {
      playsinline: 1,
    },
    events: {
      onReady: (e) => e.target.playVideo(),
      onStateChange: (e) => {
        if (e.data == YT.PlayerState.PLAYING) {
          playerRuning = true;
          $("#play-btn img").attr("src", "img/pause.svg");
          progressInterval = setInterval(() => {
            const duration = player?.getDuration() || 0;
            const currentTime = player?.getCurrentTime() || 0;
            const percentage = (currentTime / duration) * 100;
            $(".menu-music-preview-progress").css("width", `${percentage}%`);
          }, 1000);
        } else if (e.data == YT.PlayerState.PAUSED) {
          playerRuning = false;
          clearInterval(progressInterval);
        } else if (e.data == YT.PlayerState.CUED) {
          e.target.playVideo();
        } else if (e.data == YT.PlayerState.ENDED) {
          playerRuning = false;
          updateVideoPreview("Nothing to play", "", "");
          clearInterval(progressInterval);
          $(".menu-music-preview-progress").css("width", `0%`);
        }
      },
      onError: (e) => {
        playerRuning = false;
        $("#play-btn img").attr("src", "img/play.svg");
        updateVideoPreview("Nothing to play", "", "");
        clearInterval(progressInterval);
        $(".menu-music-preview-progress").css("width", `0%`);
      },
    },
  });
}

const wait = (ms) => new Promise((resolve) => setTimeout(resolve, ms));

window.addEventListener("message", ({ data }) => {
  if (!data) return;

  switch (data?.action) {
    case "show":
      $(".container").css("opacity", "1");
      break;

    case "hide":
      $(".container").css("opacity", "0");
      break;

    case "playMusic":
      const currentDate = new Date().getTime() / 1000;
      const seekTo = currentDate - data.startedAt;

      if (seekTo >= (player.getDuration() || pausedVideoDuration)) {
        $.post(
          `https://${GetParentResourceName()}/controlMusic`,
          JSON.stringify({ action: "endMusic" })
        );
        return;
      }

      playMusic(data.musicLink, seekTo.toFixed(), data.playerState);
      break;

    case "stopMusic":
      if (player) {
        (async () => {
          for (let i = player.getVolume(); i > 0; i--) {
            player.setVolume(i);
            await wait(10);
          }
          player.seekTo(player.getDuration());
        })();
      }
      break;

    case "pauseMusic":
      pauseVideo();
      break;

    case "resumeMusic":
      resumeVideo();
      break;

    case "endMusic":
      playerRuning = false;
      $("#play-btn img").attr("src", "img/play.svg");
      updateVideoPreview("Nothing to play", "", "");
      clearInterval(progressInterval);
      $(".menu-music-preview-progress").css("width", `0%`);
      break;
  }

  if (data?.vehicle) {
    $("#home-fuel").text(`${(data?.vehicle.fuel || 100)?.toFixed(0)}%`);
    $("#home-enginetemp").text(
      `${data?.vehicle.engineTemperature?.toFixed(0) || 85}°`
    );
    $("#car-name").text(data?.vehicle?.name || "");
    $("#home-mileage").text(
      parseFloat(data?.vehicle?.mileage || 0)?.toFixed(1) || "0"
    );
  }
});

window.addEventListener("keydown", ({ key }) => {
  if (key == "Escape") $.post(`https://${GetParentResourceName()}/exitMenu`);
});

const updateMenuContainer = function () {
  const menuId = $(this).data("id");
  const noPage = $(this).data("nopage");

  if (noPage)
    return $.post(
      `https://${GetParentResourceName()}/${$(this).data("action")}`
    );

  $(".menu-categories")
    .children()
    .each((i, el) => {
      const className = $(el).attr("class").split(" ")[1];

      if (className == `menu-${menuId}`) {
        $(el).removeClass("menu-hidden");
      } else {
        $(el).addClass("menu-hidden");
      }
    });
};

const pauseVideo = () => {
  pausedVideoDuration = player.getDuration();
  player.pauseVideo();
  playerRuning = false;
  $("#play-btn img").attr("src", "img/play.svg");
};

const resumeVideo = () => {
  pausedVideoDuration = null;
  player.playVideo();
  playerRuning = true;
  $("#play-btn img").attr("src", "img/pause.svg");
};

const togglePlayVideo = (forcePlay) => {
  if (playerRuning) {
    pauseVideo();
  } else {
    resumeVideo();
  }
};

const getVideoId = (url) => {
  var regExp =
    /^.*((youtu.be\/)|(v\/)|(\/u\/\w\/)|(embed\/)|(watch\?))\??v?=?([^#&?]*).*/;
  var match = url.match(regExp);
  return match && match[7].length == 11 ? match[7] : false;
};

const getVideoData = async (url) => {
  const data = await fetch(`https://youtube.com/oembed?url=${url}&format=json`)
    .then((res) => (res.ok ? res.json() : null))
    .catch((err) => null);

  if (!data) return null;

  return data;
};

const updateVideoPreview = (title, description, background) => {
  $("#music-preview-title").text(title);
  $("#music-preview-desc").text(description);
  $("#music-preview-background").attr("src", background);
};

const playMusic = async (link, seekTo, playerState) => {
  const musicId = getVideoId(link);

  player?.setVolume($("#music-volume").val());

  player?.loadVideoById(musicId, seekTo);

  if (playerState == "paused") {
    player.pauseVideo();
    $("#play-btn img").attr("src", "img/play.svg");
    const percentage = (seekTo / pausedVideoDuration.toFixed()) * 100;
    $(".menu-music-preview-progress").css("width", `${percentage}%`);
  } else {
    $("#play-btn img").attr("src", "img/pause.svg");
  }

  const videoData = await getVideoData(link);

  if (videoData)
    updateVideoPreview(
      videoData.title,
      videoData.author_name,
      videoData.thumbnail_url
    );

  $("#music-input").val("");
};

const musicInputChange = async () => {
  const link = $("#music-input").val();
  const musicId = getVideoId(link);

  if (!musicId) return;

  $.post(
    `https://${GetParentResourceName()}/controlMusic`,
    JSON.stringify({ action: "playMusic", musicLink: link })
  );
};

const actionButtonClick = (e) => {
  const action = $(e.currentTarget).data("action");
  $.post(`https://${GetParentResourceName()}/${action}`);
};

const doorActionButtionClick = (e) => {
  const doorIndex = $(e.currentTarget).data("index");
  $.post(
    `https://${GetParentResourceName()}/toggleDoor`,
    JSON.stringify(doorIndex)
  );
};

const musicVolumeChange = () => {
  if (player) player?.setVolume($("#music-volume").val());
};

$(document).ready(() => {
  $(".menu-exit").on("click", () =>
    $.post(`https://${GetParentResourceName()}/exitMenu`)
  );
  $(".sidebar-option").on("click", updateMenuContainer);
  $("#play-btn").on("click", () => {
    if (playerRuning) {
      pauseVideo();
    } else {
      resumeVideo();
    }

    $.post(
      `https://${GetParentResourceName()}/controlMusic`,
      JSON.stringify({
        action: !playerRuning ? "pauseMusic" : "resumeMusic",
      })
    );
  });
  $("#music-input").on("input", musicInputChange);
  $(".menu-home-carcontrol-section-button").on("click", actionButtonClick);
  $(".menu-home-carinteraction").on("click", doorActionButtionClick);
  $("#music-volume").on("change", musicVolumeChange);
});
