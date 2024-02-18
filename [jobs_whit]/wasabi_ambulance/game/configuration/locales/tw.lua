-----------------For support, scripts, and more----------------
--------------- https://discord.gg/wasabiscripts  -------------
---------------------------------------------------------------
if Config.Language ~= 'tw' then return end

Strings = {
    get_off_stretcher_ui = '[E] - 離開擔架',
    move = '移動',
    move_desc = '移動擔架',
    put_in_vehicle = '放入車輛',
    stretcher_in_vehicle = '放置擔架',
    put_in_vehicle_desc = '將擔架放入車輛',
    place_on_stretcher = '放置病人',
    place_on_stretcher_desc = '將病人放置於擔架上',
    remove_from_stretcher = '移除病人',
    remove_from_stretcher_desc = '將病人從擔架上移除',
    not_found = '未找到',
    already_occupied_ambulance = '已佔用',
    already_occupied_ambulance_desc = '這輛救護車已經被佔用了！',
    already_occupied_stretcher = '已佔用',
    already_occupied_stretcher_desc = '這個擔架已經被佔用了！',
    vehicle_occupied = '車輛已佔用',
    vehicle_occupied_desc = '進行此操作時，不能有人正在駕駛！',
    not_occupied_stretcher = '未佔用',
    not_occupied_stretcher_desc = '這個擔架未被佔用！',
    stretcher_placement_blocked = '擔架放置受阻',
    stretcher_placement_blocked_desc = '您不能在這裡放置擔架！',
    knocked_out = '被擊倒',
    knocked_out_desc = '你被擊倒了！',
    checkin_cooldown = '簽到冷卻',
    checkin_cooldown_desc = '你嘗試簽到太快，請稍等片刻。',
    checkingin_progress = '正在簽到...',
    remove_dead_target = '移除失去意識的人',
    ply_injury_head = '頭部',
    ply_injury_neck = '頸部',
    ply_injury_spine = '脊椎',
    ply_injury_upper = '上半身',
    ply_injury_lower = '下半身',
    ply_injury_left_arm = '左臂',
    ply_injury_left_leg = '左腿',
    ply_injury_right_arm = '右臂',
    ply_injury_right_leg = '右腿',
    diagnosing_patient_progress = '正在診斷病人...',
    treating_patient_progress = '正在治療病人...',
    recovering_progress = '正在恢復...',
    injury_report = '傷害報告',
    none = '無',
    mild = '輕微',
    moderate = '中等',
    severe = '嚴重',
    deadly = '致命',
    injury_report_locations = '位置',
    injury_report_type = '傷害類型: %s',
    injury_report_severity = '嚴重程度: %s',
    injury_report_bleed = '失血',
    light_injury_title = '輕傷',
    moderate_injury_title = '中度傷害',
    extreme_injury_title = '重度傷害',
    injury_bleed_notify = '傷害和出血警報',
    light_injury_desc = '你的%s受傷了，考慮看醫生！',
    moderate_injury_desc = '你的%s受到嚴重傷害，你需要醫生！',
    extreme_injury_desc = '你的%s受到極度嚴重的傷害。你需要儘快看醫生，以免太遲！',
    injury_msg_one = '你有一個重大傷害。',
    injury_msg_two = '你有一個嚴重傷害。',
    injury_msg_three = '你有一個非常嚴重的傷害。',
    injury_msg_four = '你有一個危急的傷害。',
    bleed_msg_one = '你正在流血。',
    bleed_msg_two = '你的出血很嚴重。需要施加壓力。',
    bleed_msg_three = '你快要失血過多了！',
    fainted_title = '暈倒',
    fainted_so_high_desc = '你因為太高而暈倒。',
    cant_jump_title = '不能跳躍！',
    cant_jump_desc = '你受傷太重，無法嘗試跳躍',
    blackout_title = '失去意識',
    blackout_desc = '你因為%s的傷勢失去了意識！立即尋求醫療幫助！',
    treated_fully_desc = '你已經接受治療，感覺比以往任何時候都好！',
    treated_not_fully_desc = '你已經接受治療，但需要進一步治療。',
    prescription_menu = '處方菜單',
    prescription_menu_desc = '存取和管理處方',
    no_stretcher_detected = '未檢測到擔架',
    no_stretcher_detected_desc = '沒有檢測到活動擔架！',
    cant_run = '不能疾跑',
    cant_run_desc = '你受傷太重，無法疾跑！',
    no_back_seat = '沒有可用座位',
    no_back_seat_desc = '這輛救護車後面沒有座位',
    enter_vehicle_back = '進入救護車（後面）',
    stretcher_already_deployed = '擔架已經部署',
    stretcher_already_deployed_desc = '分配給這輛救護車的擔架已經被移除。',
    send_stretcher_home = '返回車輛',
    ambulance_not_found = '擔架被移除，但沒有找到救護車返回！',
    bleedout = '出血',
    player_injury_critical_desc = '玩家因%s傷口處於危急狀態！',
    gps_active = 'GPS啟動',
    gps_active_desc = '玩家%s啟動了他們的GPS',
    gps_deactive = 'GPS停用',
    gps_deactive_desc = '玩家%s停用了他們的GPS',
    no_wsb = '^0[^3警告^0] wasabi_bridge未在框架之後和/或資源之前啟動: %s',
    spawn_blocked = '車庫阻塞',
    spawn_blocked_desc = '你不能把你的車開出來，因為被阻塞了！',
    menu_remove_crutch = '移除拐杖',
    menu_remove_crutch_desc = '移除附近病人的拐杖',
    menu_remove_chair = '移除輪椅',
    menu_remove_chair_desc = '移除附近病人的輪椅',
    toggle_stretcher = '取擔架',
    toggle_stretcher_desc = '從最近的車輛取擔架',
    no_vehicle_nearby = '車輛',
    no_vehicle_nearby_desc = '附近沒有車輛',
    no_ambulance_nearby_desc = '附近沒有救護車',
    on_duty = '執勤中',
    on_duty_desc = '您剛剛開始執勤！',
    off_duty = '休息中',
    off_duty_desc = '您剛剛休息！',
    amount = '金額',
    mr = '先生',
    mrs = '女士',
    debt_collection = '債務追討',
    db_email =
    '親愛的%s %s，<br /><br />中央司法追討機構（CJCA）向您追討您從警察那邊收到的罰款。<br />您的帳戶中已扣除<strong>$%s</strong>。<br /><br />敬上，<br />Wasabi 先生',
    fine_sent = '已寄出罰單',
    fine_sent_desc = '您已成功寄出罰單，金額為$%s！',
    fine_received = '已收到罰單',
    fine_received_desc = '您已收到一張$%s的罰單',
    log_killed_title = '玩家被殺死',
    log_killed_desc =
    '> *%s [%s] 殺死了 %s [%s]\n\n**兇手資訊：**\n姓名：`%s`\n玩家ID：`%s`\n識別號：`%s`\nSteam：`%s`\nDiscord：`%s`\n許可證：`%s`\n許可證2：`%s`\nXBL：`%s`\nFiveM：`%s`\nIP：||%s||\n\n**受害者資訊：**\n角色名稱：`%s`\n玩家ID：`%s`\n識別號：`%s`\nSteam：`%s`\nDiscord：`%s`\n許可證：`%s`\n許可證2：`%s`\nXBL：`%s`\nFiveM：`%s`\nIP：||%s||\n\n> **死因：** `%s`',
    log_suicide_title = '玩家自殺',
    log_suicide_desc =
    '> %s [%s] 自殺\n\n**玩家資訊：**\n姓名：`%s`\n玩家ID：`%s`\n識別號：`%s`\nSteam：`%s`\nDiscord：`%s`\n許可證：`%s`\n許可證2：`%s`\nXBL：`%s`\nFiveM：`%s`\nIP：||%s||\n\n> **死因：** `%s`',
    unknown = '未知',
    log_admin_revive_title = '管理員復活玩家',
    log_admin_revive_desc =
    '> *%s [%s] 管理員復活了 %s [%s]\n\n**目標資訊：**\n姓名：`%s`\n玩家ID：`%s`\n識別號：`%s`\nSteam：`%s`\nDiscord：`%s`\n許可證：`%s`\n許可證2：`%s`\nXBL：`%s`\nFiveM：`%s`\nIP：||%s||\n\n**管理員資訊：**\n角色名稱：`%s`\n玩家ID：`%s`\n識別號：`%s`\nSteam：`%s`\nDiscord：`%s`\n許可證：`%s`\n許可證2：`%s`\nXBL：`%s`\nFiveM：`%s`\nIP：||%s||',
    log_self_revive_title = '管理員自行復活',
    log_self_revive_desc =
    '> %s [%s] 自行復活\n\n**玩家資訊：**\n姓名：`%s`\n玩家ID：`%s`\n識別號：`%s`\nSteam：`%s`\nDiscord：`%s`\n許可證：`%s`\n許可證2：`%s`\nXBL：`%s`\nFiveM：`%s`\nIP：||%s||',
    log_death_logs = '死亡記錄',
    log_revive_logs = '復活記錄',
    medbag_crutch = '拐杖',
    medbag_crutch_desc = '幫助行走困難的病人的拐杖',
    menu_crutch = '使用拐杖',
    menu_crutch_desc = '給附近的病人使用拐杖',
    medbag_chair = '輪椅',
    medbag_chair_desc = '幫助不能行走的病人的輪椅',
    menu_chair = '使用輪椅',
    menu_chair_desc = '給附近的病人使用輪椅',
    shot = '槍擊',
    stabbed = '刺傷',
    beat = '被打傷',
    burned = '燒傷',
    other = '未知',
    JobMenuTitle = '急救員菜單',
    dispatch = '派遣',
    dispatch_desc = '檢查是否有需要協助的玩家',
    DispatchMenuTitle = '派遣',
    GoBack = '返回',
    key_map_text = '救護車工作菜單',
    assistance_title = '請求協助',
    assistance_desc = '有人請求醫療協助！',
    respawn_available_in = '約 ~r~%s 分鐘 %s 秒~s~ 後可重生\n',
    respawn_bleedout_in = '您將在約 ~r~%s 分鐘 %s 秒~s~ 內失血致死\n',
    respawn_bleedout_prompt = '按住 [~r~E~s~] 重生',
    distress_send = '按 [~r~G~s~] 發送危急求助信號給急救員',
    distress_sent_title = '請求協助',
    distress_sent_desc = '危急求助信號已發送給可用的急救員！',
    route_set_title = '設定路線',
    route_set_desc = '已設定路線前往需要協助的人所在地！',
    diagnose_patient = '診斷',
    diagnose_patient_desc = '診斷最近的受傷病人',
    no_requests = '無正在進行的請求',
    revive_patient = '復活',
    revive_patient_desc = '嘗試復活附近的人',
    heal_patient = '治療',
    heal_patient_desc = '嘗試治療附近的人',
    sedate_patient = '鎮靜',
    sedate_patient_desc = '臨時鎮靜附近的人',
    drag_patient = '拖曳',
    drag_patient_desc = '拖曳附近的受傷病人',
    place_stretcher_target = '添加或移除病人',
    place_patient = '放入/取出車輛',
    place_patient_desc = '將無意識的附近病人放入/取出車輛',
    no_nearby = '找不到',
    no_nearby_desc = '附近似乎沒有人',
    no_injury = '無傷',
    no_injury_desc = '這個人似乎不需要治療',
    no_injury_dead_desc = '病人似乎不需要額外的治療。嘗試使用心臟電擊器，希望能夠好轉！',
    player_injury = '受傷的人',
    player_injury_desc = '這個人似乎有%s傷口',
    player_not_unconcious = '玩家清醒',
    player_not_unconcious_desc = '玩家似乎是清醒的',
    player_unconcious = '玩家昏迷',
    player_unconcious_desc = '病人需要清醒才能進行治療！',
    player_reviving = '復活中',
    player_reviving_desc = '正在復活病人',
    player_noitem = '物品不足',
    player_noitem_desc = '您缺少進行此操作所需的物品！',
    player_successful_revive = '已復活',
    player_successful_revive_reward_desc = '您成功地復活了病人，並獲得了%s美元的獎勵！',
    player_successful_revive_desc = '您成功地復活了病人！',
    player_healing = '治療中',
    player_healing_desc = '正在治療病人',
    player_successful_heal = '已治癒',
    player_successful_heal_desc = '病人已成功治癒！',
    player_healed_desc = '您已成功地被醫生治癒！',
    not_medic = '未經授權',
    not_medic_desc = '您未接受相應培訓，無權使用此功能！',
    target_sedated = '鎮靜',
    target_sedated_desc = '您已被醫療專業人員鎮靜',
    player_successful_sedate_desc = '您成功地鎮靜了病人',
    drop_bag_ui = '[E] - 放下包裹',
    drop_stretch_ui = '[E] - 放下担架',
    pickup_bag_target = '撿起',
    move_target = '移動',
    interact_bag_target = '打開',
    successful = '成功',
    medbag_pickup = '您撿起了醫療包',
    medbag_pickup_civ = '您搜查了包裹並帶走了有用的物品',
    stretcher_pickup = '您將担架送回了它被拉出的救護車',
    medbag = '醫療包',
    medbag_tweezers = '鑷子',
    medbag_tweezers_desc = '用於取出子彈',
    medbag_suture = '縫合包',
    medbag_suture_desc = '用於縫合傷口',
    medbag_icepack = '冰袋',
    medbag_icepack_desc = '用於減輕腫脹',
    medbag_burncream = '燒傷藥膏',
    medbag_burncream_desc = '用於治療燒傷',
    medbag_defib = '心臟電擊器',
    medbag_defib_desc = '用於復活病人',
    medbag_medikit = '急救包',
    medbag_medikit_desc = '用於治療病人',
    medbag_sedative = '鎮定劑',
    medbag_sedative_desc = '用於鎮靜病人',
    medbag_stretcher = '可摺疊担架',
    medbag_stretcher_desc = '用於移動病人',
    item_grab = '您從醫療包中取出了一件工具',
    wrong_equipment = '錯誤的設備！',
    wrong_equipment_desc = '您接受過培訓嗎？',
    player_not_injured = '未受傷',
    player_not_injured_desc = '這個人似乎不需要任何額外的治療，可以使用心臟電擊器',
    player_treated = '已治療',
    player_treated_desc = '您成功地治療了病人',
    revive_command_help = '一個用於復活玩家的管理員命令',
    revive_command_arg = '玩家ID',
    reviveall_command_help = '一個用於復活所有玩家的管理員命令',
    revivearea_command_help = '一個用於復活附近玩家的管理員命令',
    revivearea_command_arg = '用於復活玩家的區域',
    resetdeathcount_command_help = '一個用於重置玩家死亡次數的管理員命令',
    resetdeathcount_command_arg = '玩家ID',
    viewdeathcount_command_help = '一個用於查看您的死亡次數的命令',
    alive_again = '復活',
    alive_again_desc = '您被當地人送到了醫院！',
    request_supplies_target = '醫療用品',
    currency = '元',
    not_enough_funds = '資金不足',
    not_enough_funds_desc = '您沒有足夠的資金！',
    hospital_garage = '醫院車庫',
    used_meditkit = '使用醫療包',
    used_medikit_desc = '你成功地自行處理了傷口',
    action_cancelled = '動作取消',
    action_cancelled_desc = '你取消了上一個動作！',
    healing_self_prog = '正在處理傷口',
    checkin_hospital = '成功',
    checkin_hospital_desc = '你已經成功地接受了醫院的治療',
    max_ems = '有足夠的醫護人員',
    max_ems_desc = '城市中有足夠多的醫護人員！尋求幫助！',
    player_busy = '忙碌中',
    player_busy_desc = '你現在忙碌，無法執行此操作！',
    cloakroom = '更衣室',
    civilian_wear = '平民服裝',
    bill_patient = '給患者開單',
    bill_patient_desc = '給附近的患者發送一張帳單',
    invalid_entry = '無效',
    invalid_entry_desc = '你的輸入無效！',
    medical_services = '醫療服務',
    hospital = '醫院',
    interact_stretcher_ui = '[E] - 互動',
    stretcher_menu_title = '担架互動',
    open_shop_ui = '[E] - 打開藥房'
}
