import importTemplate from "../../utils/importTemplate.js";
import inlinesvg from "../../utils/inlineSvg.js";
function displayTextWidth(text, font) {
  let canvas =
    displayTextWidth.canvas ||
    (displayTextWidth.canvas = document.createElement("canvas"));
  let context = canvas.getContext("2d");
  context.font = font;
  let metrics = context.measureText(text);
  return metrics.width;
}

const Hud = {
  data() {
    return {
      countryCode: "en-US",
      formattedDate: "",
      interval: false,
      waterMarkInformations: {
        logo: "https://i.imgur.com/rgEwnd4.png",
        servername: "",
        discordlink: "discord.gg/codem",
      },
      progressBar: false,
      secondJobInterval: false,
      showSecondJob: false,
      playersAmount: 0,
      moneyChange: {
        cash: {
          timeout: false,
          amount: false,
          minus: null,
        },

        vip_money: {
          timeout: false,
          amount: false,
          minus: null,
        },
        black_money: {
          timeout: false,
          amount: false,
          minus: null,
        },
        bank: {
          timeout: false,
          amount: false,
          minus: null,
        },
        boss_money: {
          timeout: false,
          amount: false,
          minus: null,
        },
      },
    };
  },
  watch: {
    enableSecondJob(val) {
      if (val) {
        if (!this.progressBar) {
          this.progressBar = new ProgressBar.Circle("#timer", {
            strokeWidth: 8,
            easing: "easeInOut",
            duration: 10000,
            color: "white",
            trailColor: "#ffffff3d",
            trailWidth: 8,
            svgStyle: null,
          });
          this.progressBar.set(0.0);
          this.progressBar.animate(1.0);
          if (!this.secondJobInterval) {
            this.secondJobInterval = setInterval(() => {
              this.showSecondJob = !this.showSecondJob;
              this.progressBar.set(0.0);
              this.progressBar.animate(1.0);
            }, 10000);
          }
        }
      } else {
        if (this.progressBar) {
          this.progressBar.destroy();
          this.progressBar = false;
          if (this.secondJobInterval) {
            clearInterval(this.secondJobInterval);
            this.secondJobInterval = false;
          }
        }
      }
    },
  },
  methods: {
    numberWithSpaces(x) {
      return x.toString().replace(/\B(?=(\d{3})+(?!\d))/g, " ");
    },

    messageHandler(event) {
      switch (event.data.action) {
        case "SET_COUNTRY_CODE":
          this.countryCode = event.data.payload;
          this.formattedDate = this.getDate();
          break;
        case "SET_WATERMARK_INFORMATIONS":
          this.waterMarkInformations = event.data.payload;
          break;
        case "SET_PLAYERS_AMOUNT":
          this.playersAmount = event.data.payload;
          break;
        case "MONEY_CHANGE":
          if (this.moneyChange[event.data.payload.moneyType].timeout) {
            clearTimeout(
              this.moneyChange[event.data.payload.moneyType].timeout
            );
          }
          this.moneyChange[event.data.payload.moneyType].minus =
            event.data.payload.minus;
          this.moneyChange[event.data.payload.moneyType].amount =
            event.data.payload.amount;
          this.moneyChange[event.data.payload.moneyType].timeout = setTimeout(
            () => {
              this.moneyChange[event.data.payload.moneyType].amount = false;
            },
            1500
          );
          break;
        default:
          break;
      }
    },
    getDate() {
      let date = new Date().toLocaleDateString(this.countryCode, {
        month: "short",
        day: "numeric",
        hour: "numeric",
        minute: "numeric",
      });
      return date;
    },
  },
  components: {
    inlinesvg,
  },
  mounted() {
    window.addEventListener("message", this.messageHandler);
    this.formattedDate = this.getDate();
    this.interval = setInterval(() => {
      this.formattedDate = this.getDate();
    }, 30000);
  },
  computed: {
    ...Vuex.mapState({
      accounts: (state) => state.info.accounts,
      job: (state) => state.info.job,
      player_name: (state) => state.info.player_name,
      id: (state) => state.info.id,
      selectedSettingsElement: (state) => state.hud.selectedSettingsElement,
      hoveredSettingsElement: (state) => state.hud.hoveredSettingsElement,
      hudSettings: (state) => state.hud.hudSettings,
      forceAccountsVisibility: (state) => state.info.forceAccountsVisibility,
      enableSecondJob: (state) => state.info.enableSecondJob,
      second_job: (state) => state.info.second_job,
    }),
    FormatJob() {
      if (this.enableSecondJob) {
        if (this.showSecondJob) {
          return `${this.second_job.job_label} - ${this.second_job.job_grade_label}`;
        } else {
          return `${this.job.job_label} - ${this.job.job_grade_label}`;
        }
      }
      return `${this.job.job_label} - ${this.job.job_grade_label}`;
    },

    getMaxWidth() {
      let second_job = `${this.second_job.job_label} - ${this.second_job.job_grade_label}`;
      let first_job = `${this.job.job_label} - ${this.job.job_grade_label}`;
      let name = `${this.player_name} - ${
        this.hudSettings.streamerMode && !this.hudSettings.showMyPlayerId
          ? "**"
          : this.id
      }`;
      const jobs = [
        displayTextWidth(second_job, "5px Gilroy"),
        displayTextWidth(first_job, "5px Gilroy"),
        displayTextWidth(name, "8px Gilroy"),
      ];
      const widths = [
        ...jobs,
        displayTextWidth(this.waterMarkInformations.servername, "6px Gilroy"),
        displayTextWidth(this.accounts.bank.toString(), "18px Gilroy"),
        displayTextWidth(this.accounts.cash.toString(), "18px Gilroy"),
        displayTextWidth(this.accounts.black_money.toString(), "15px Gilroy"),
        displayTextWidth(this.accounts.vip_money.toString(), "15px Gilroy"),
        displayTextWidth(this.accounts.boss_money.toString(), "15px Gilroy"),
      ];

      let val = Math.max(...widths);
      return (val + 100) * 1.9;
    },
    getNameBoxStyle() {
      if (
        this.hudSettings.nameBoxPosition.left &&
        this.hudSettings.nameBoxPosition.top
      ) {
        return {
          left: this.hudSettings.nameBoxPosition.left + "px",
          top: this.hudSettings.nameBoxPosition.top + "px",
          position: "absolute",
        };
      }

      return {};
    },
    getBankBoxStyle() {
      if (
        this.hudSettings.bankBoxPosition.left &&
        this.hudSettings.bankBoxPosition.top
      ) {
        return {
          left: this.hudSettings.bankBoxPosition.left + "px",
          top: this.hudSettings.bankBoxPosition.top + "px",
          position: "absolute",
        };
      }

      return {};
    },
    getServerInfoBoxStyle() {
      if (
        this.hudSettings.serverInfoBoxPosition.left &&
        this.hudSettings.serverInfoBoxPosition.top
      ) {
        return {
          left: this.hudSettings.serverInfoBoxPosition.left + "px",
          top: this.hudSettings.serverInfoBoxPosition.top + "px",
          position: "absolute",
        };
      }

      return {};
    },
    getCashBoxStyle() {
      if (
        this.hudSettings.cashBoxPosition.left &&
        this.hudSettings.cashBoxPosition.top
      ) {
        return {
          left: this.hudSettings.cashBoxPosition.left + "px",
          top: this.hudSettings.cashBoxPosition.top + "px",
          position: "absolute",
        };
      }

      return {};
    },
    getBossMoneyBoxStyle() {
      if (
        this.hudSettings.bossMoneyBoxPosition.left &&
        this.hudSettings.bossMoneyBoxPosition.top
      ) {
        return {
          left: this.hudSettings.bossMoneyBoxPosition.left + "px",
          top: this.hudSettings.bossMoneyBoxPosition.top + "px",
          position: "absolute",
        };
      }

      return {};
    },
    getBlackMoneyBoxStyle() {
      if (
        this.hudSettings.blackMoneyBoxPosition.left &&
        this.hudSettings.blackMoneyBoxPosition.top
      ) {
        return {
          left: this.hudSettings.blackMoneyBoxPosition.left + "px",
          top: this.hudSettings.blackMoneyBoxPosition.top + "px",
          position: "absolute",
        };
      }
      return {};
    },
    getVipMoneyBoxStyle() {
      if (
        this.hudSettings.vipMoneyBoxPosition.left &&
        this.hudSettings.vipMoneyBoxPosition.top
      ) {
        return {
          left: this.hudSettings.vipMoneyBoxPosition.left + "px",
          top: this.hudSettings.vipMoneyBoxPosition.top + "px",
          position: "absolute",
        };
      }
      return {};
    },
  },
  beforeDestroy() {
    window.removeEventListener("message", this.messageHandler);
    clearInterval(this.interval);
  },
  template: await importTemplate("./app/pages/info/index.html"),
};
export default Hud;
