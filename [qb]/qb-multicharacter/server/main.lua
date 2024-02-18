local L0_1, L1_1, L2_1, L3_1
L0_1 = {}
L1_1 = CreateThread
function L2_1()
  local L0_2, L1_2
  L0_2 = Wait
  L1_2 = 1500
  L0_2(L1_2)
  L0_2 = print
  L1_2 = "^5[Mr_Dx Multichar] ^7Loaded successfully"
  L0_2(L1_2)
end
L1_1(L2_1)
function L1_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2, L5_2, L6_2, L7_2
  L2_2 = QBCore
  L2_2 = L2_2.Functions
  L2_2 = L2_2.GetIdentifier
  L3_2 = A0_2
  L4_2 = "license"
  L2_2 = L2_2(L3_2, L4_2)
  L3_2 = {}
  L4_2 = fetchUser
  L5_2 = QBCore
  L5_2 = L5_2.Functions
  L5_2 = L5_2.GetIdentifier
  L6_2 = A0_2
  L7_2 = "discord"
  L5_2 = L5_2(L6_2, L7_2)
  function L6_2(A0_3)
    local L1_3, L2_3, L3_3, L4_3, L5_3
    L2_3 = A0_2
    L1_3 = L0_1
    L3_3 = {}
    L4_3 = A0_3
    L5_3 = "["
    L3_3[1] = L4_3
    L3_3[2] = L5_3
    L1_3[L2_3] = L3_3
    L1_3 = MySQL
    L1_3 = L1_3.Async
    L1_3 = L1_3.fetchAll
    L2_3 = "SELECT * FROM `players` WHERE `license` = ? ORDER BY `cid` ASC"
    L3_3 = {}
    L4_3 = L2_2
    L3_3[1] = L4_3
    function L4_3(A0_4)
      local L1_4, L2_4, L3_4, L4_4, L5_4, L6_4, L7_4, L8_4, L9_4, L10_4, L11_4, L12_4, L13_4
      if nil ~= A0_4 then
        L1_4 = pairs
        L2_4 = A0_4
        L1_4, L2_4, L3_4, L4_4 = L1_4(L2_4)
        for L5_4, L6_4 in L1_4, L2_4, L3_4, L4_4 do
          L7_4 = {}
          L8_4 = json
          L8_4 = L8_4.decode
          L9_4 = L6_4.charinfo
          L8_4 = L8_4(L9_4)
          L9_4 = json
          L9_4 = L9_4.decode
          L10_4 = L6_4.money
          L9_4 = L9_4(L10_4)
          L10_4 = L8_4.firstname
          L11_4 = " "
          L12_4 = L8_4.lastname
          L10_4 = L10_4 .. L11_4 .. L12_4
          L7_4.name = L10_4
          L10_4 = L8_4.nickname
          L7_4.nickname = L10_4
          L10_4 = L6_4.citizenid
          L7_4.citizenid = L10_4
          L10_4 = L6_4.cid
          L7_4.cid = L10_4
          L10_4 = L8_4.gender
          if nil ~= L10_4 then
            L10_4 = L8_4.gender
            if 0 == L10_4 then
              L10_4 = "Male"
              if L10_4 then
                goto lbl_38
              end
            end
          end
          L10_4 = "Female"
          ::lbl_38::
          L7_4.gender = L10_4
          L10_4 = L9_4.cash
          L7_4.cash = L10_4
          L10_4 = L9_4.bank
          L7_4.bank = L10_4
          L10_4 = L8_4.birthday
          L7_4.birth = L10_4
          L10_4 = json
          L10_4 = L10_4.decode
          L11_4 = L6_4.job
          L10_4 = L10_4(L11_4)
          L10_4 = L10_4.label
          L7_4.job = L10_4
          L10_4 = L3_2
          L10_4 = #L10_4
          L11_4 = L10_4 + 1
          L10_4 = L3_2
          L10_4[L11_4] = L7_4
          L11_4 = A0_2
          L10_4 = L0_1
          L10_4 = L10_4[L11_4]
          L12_4 = A0_2
          L11_4 = L0_1
          L11_4 = L11_4[L12_4]
          L11_4 = L11_4[2]
          L12_4 = tostring
          L13_4 = L7_4.cid
          L12_4 = L12_4(L13_4)
          L11_4 = L11_4 .. L12_4
          L10_4[2] = L11_4
        end
        L1_4 = A1_2
        L2_4 = L3_2
        L3_4 = A0_3
        L1_4(L2_4, L3_4)
      else
        L1_4 = A1_2
        L2_4 = false
        L3_4 = A0_3
        L1_4(L2_4, L3_4)
      end
      L2_4 = A0_2
      L1_4 = L0_1
      L1_4 = L1_4[L2_4]
      L3_4 = A0_2
      L2_4 = L0_1
      L2_4 = L2_4[L3_4]
      L2_4 = L2_4[2]
      L3_4 = "n]"
      L2_4 = L2_4 .. L3_4
      L1_4[2] = L2_4
    end
    L1_3(L2_3, L3_3, L4_3)
  end
  L4_2(L5_2, L6_2)
end
get = L1_1
L1_1 = QBCore
L1_1 = L1_1.Functions
L1_1 = L1_1.CreateCallback
L2_1 = "qb-multicharacter:server:get"
function L3_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2, L5_2
  L2_2 = GetPlayerPed
  L3_2 = A0_2
  L2_2 = L2_2(L3_2)
  L3_2 = math
  L3_2 = L3_2.random
  L4_2 = 1
  L5_2 = 999
  L3_2 = L3_2(L4_2, L5_2)
  L2_2 = L2_2 .. L3_2
  L3_2 = SetPlayerRoutingBucket
  L4_2 = A0_2
  L5_2 = L2_2
  L3_2(L4_2, L5_2)
  L3_2 = get
  L4_2 = A0_2
  L5_2 = A1_2
  L3_2(L4_2, L5_2)
end
L1_1(L2_1, L3_1)
L1_1 = RegisterServerEvent
L2_1 = "qb-multicharacter:server:spawnPlayer"
L1_1(L2_1)
L1_1 = AddEventHandler
L2_1 = "qb-multicharacter:server:spawnPlayer"
function L3_1(A0_2)
  local L1_2, L2_2, L3_2, L4_2, L5_2
  L1_2 = source
  L2_2 = QBCore
  L2_2 = L2_2.Player
  L2_2 = L2_2.Login
  L3_2 = L1_2
  L4_2 = A0_2
  L2_2 = L2_2(L3_2, L4_2)
  if L2_2 then
    L2_2 = AfterSpawn
    L3_2 = L1_2
    L4_2 = false
    L5_2 = A0_2
    L2_2(L3_2, L4_2, L5_2)
  end
end
L1_1(L2_1, L3_1)
L1_1 = QBCore
L1_1 = L1_1.Functions
L1_1 = L1_1.CreateCallback
L2_1 = "qb-multicharacter:server:createCharacter"
function L3_1(A0_2, A1_2, A2_2)
  local L3_2, L4_2, L5_2, L6_2, L7_2, L8_2, L9_2, L10_2, L11_2
  L3_2 = A0_2
  L4_2 = CoreConfig
  L4_2 = L4_2.char_english_only
  if L4_2 then
    L4_2 = "[ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz]"
    L5_2 = A2_2.firstname
    L6_2 = L5_2
    L5_2 = L5_2.match
    L7_2 = L4_2
    L5_2 = L5_2(L6_2, L7_2)
    if not L5_2 then
      L5_2 = TriggerClientEvent
      L6_2 = CoreConfig
      L6_2 = L6_2.notify
      L7_2 = L3_2
      L8_2 = "First name can contain English letters only"
      L9_2 = "error"
      L5_2(L6_2, L7_2, L8_2, L9_2)
      L5_2 = A1_2
      L6_2 = false
      return L5_2(L6_2)
    end
    L5_2 = A2_2.lastname
    L6_2 = L5_2
    L5_2 = L5_2.match
    L7_2 = L4_2
    L5_2 = L5_2(L6_2, L7_2)
    if not L5_2 then
      L5_2 = TriggerClientEvent
      L6_2 = CoreConfig
      L6_2 = L6_2.notify
      L7_2 = L3_2
      L8_2 = "Last name can contain English letters only"
      L9_2 = "error"
      L5_2(L6_2, L7_2, L8_2, L9_2)
      L5_2 = A1_2
      L6_2 = false
      return L5_2(L6_2)
    end
  end
  L4_2 = -1
  L5_2 = 1
  L6_2 = L0_1
  L6_2 = L6_2[L3_2]
  L6_2 = L6_2[1]
  L7_2 = 1
  for L8_2 = L5_2, L6_2, L7_2 do
    L9_2 = tostring
    L10_2 = L8_2
    L9_2 = L9_2(L10_2)
    L10_2 = L9_2
    L9_2 = L9_2.match
    L11_2 = L0_1
    L11_2 = L11_2[L3_2]
    L11_2 = L11_2[2]
    L9_2 = L9_2(L10_2, L11_2)
    if not L9_2 then
      L4_2 = L8_2
      break
    end
  end
  if -1 == L4_2 then
    L5_2 = TriggerClientEvent
    L6_2 = CoreConfig
    L6_2 = L6_2.notify
    L7_2 = L3_2
    L8_2 = "You cant open more characters"
    L9_2 = "error"
    L5_2(L6_2, L7_2, L8_2, L9_2)
    L5_2 = A1_2
    L6_2 = false
    return L5_2(L6_2)
  end
  A2_2.cid = L4_2
  L5_2 = QBCore
  L5_2 = L5_2.Player
  L5_2 = L5_2.Login
  L6_2 = L3_2
  L7_2 = false
  L8_2 = {}
  L8_2.charinfo = A2_2
  L9_2 = A2_2.cid
  L8_2.cid = L9_2
  L5_2 = L5_2(L6_2, L7_2, L8_2)
  if L5_2 then
    L5_2 = AfterSpawn
    L6_2 = L3_2
    L7_2 = true
    L8_2 = A2_2.citizenid
    L5_2(L6_2, L7_2, L8_2)
    L5_2 = A1_2
    L6_2 = true
    return L5_2(L6_2)
  end
  L5_2 = TriggerClientEvent
  L6_2 = CoreConfig
  L6_2 = L6_2.notify
  L7_2 = L3_2
  L8_2 = "Unknown error"
  L9_2 = "error"
  L5_2(L6_2, L7_2, L8_2, L9_2)
  L5_2 = A1_2
  L6_2 = false
  return L5_2(L6_2)
end
L1_1(L2_1, L3_1)
L1_1 = QBCore
L1_1 = L1_1.Functions
L1_1 = L1_1.CreateCallback
L2_1 = "qb-multicharacter:server:deleteCharacter"
function L3_1(A0_2, A1_2, A2_2)
  local L3_2, L4_2, L5_2
  L3_2 = QBCore
  L3_2 = L3_2.Player
  L3_2 = L3_2.DeleteCharacter
  L4_2 = A0_2
  L5_2 = A2_2
  L3_2(L4_2, L5_2)
  L3_2 = Wait
  L4_2 = 1000
  L3_2(L4_2)
  L3_2 = get
  L4_2 = A0_2
  L5_2 = A1_2
  L3_2(L4_2, L5_2)
end
L1_1(L2_1, L3_1)
L1_1 = QBCore
L1_1 = L1_1.Functions
L1_1 = L1_1.CreateCallback
L2_1 = "qb-multicharacter:server:getSkin"
function L3_1(A0_2, A1_2, A2_2)
  local L3_2, L4_2, L5_2, L6_2, L7_2
  L3_2 = A0_2
  L4_2 = CoreConfig
  L4_2 = L4_2.clothing_base
  if "qb" == L4_2 then
    L4_2 = getQBClothing
    L5_2 = L3_2
    L6_2 = A1_2
    L7_2 = A2_2
    L4_2(L5_2, L6_2, L7_2)
  else
    L4_2 = CoreConfig
    L4_2 = L4_2.clothing_base
    if "fivem-appearance" == L4_2 then
      L4_2 = getAppearanceClothing
      L5_2 = L3_2
      L6_2 = A1_2
      L7_2 = A2_2
      L4_2(L5_2, L6_2, L7_2)
    else
      L4_2 = CoreConfig
      L4_2 = L4_2.clothing_base
      if "raid" == L4_2 then
        L4_2 = getRaidClothing
        L5_2 = L3_2
        L6_2 = A1_2
        L7_2 = A2_2
        L4_2(L5_2, L6_2, L7_2)
      else
        L4_2 = getOtherClothing
        L5_2 = L3_2
        L6_2 = A1_2
        L7_2 = A2_2
        L4_2(L5_2, L6_2, L7_2)
      end
    end
  end
end
L1_1(L2_1, L3_1)
