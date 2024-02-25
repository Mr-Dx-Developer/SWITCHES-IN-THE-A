function GenUUID() {
  const randomBytes = crypto.randomBytes(16);

  // Set version field to 4
  randomBytes[6] = (randomBytes[6] & 0x0f) | 0x40;

  // Set variant field 2
  randomBytes[8] = (randomBytes[8] & 0x3f) | 0x80;

  // Convert byte array to UUID string
  const byteGroups = [
    randomBytes.slice(0, 4),
    randomBytes.slice(4, 6),
    randomBytes.slice(6, 8),
    randomBytes.slice(8, 10),
    randomBytes.slice(10, 16),
  ];

  const uuid = byteGroups.map((group) => group.toString("hex")).join("-");

  return uuid;
}

function randomChar() {
  const chars =
    "0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz";
  return chars.charAt(Math.floor(Math.random() * chars.length));
}

/**
 * @param {number} date
 */
function FormatDate(date) {
  const d = new Date(date);
  const year = d.getFullYear();
  const month = d.getMonth() + 1;
  const day = d.getDate();
  const hour = d.getHours();
  const min = d.getMinutes();
  const sec = d.getSeconds();

  return `${year}-${month}-${day} ${hour}:${min}:${sec}`;
}

exports("randomChar", randomChar);
exports("GenUUID", GenUUID);
exports("FormatDate", FormatDate);
