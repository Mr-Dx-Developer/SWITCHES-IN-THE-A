-----------------For support, scripts, and more----------------
--------------- https://discord.gg/wasabiscripts  -------------
---------------------------------------------------------------
if Config.Language ~= 'cn' then return end

Strings = {
    possible_cause = '可能原因',

    full_name = '名字',
    pulse = '脉搏',
    bpm = 'BPM: %s',
    bleed_rate = '出血速率',
    bleed_rate_low = '低',
    bleed_rate_medium = '中',
    bleed_rate_high = '高',
    no_name = '无名',
    injuries = '当前伤情',


    get_off_stretcher_ui = '[E] - 下车担架',
    move = '移动',
    move_desc = '移动担架',
    put_in_vehicle = '放入车辆',
    stretcher_in_vehicle = '存放担架',
    put_in_vehicle_desc = '将担架放入车辆',
    place_on_stretcher = '放置病人',
    place_on_stretcher_desc = '将病人放置在担架上',
    remove_from_stretcher = '移除病人',
    remove_from_stretcher_desc = '从担架上移除病人',
    not_found = '未找到',
    already_occupied_ambulance = '已被占用',
    already_occupied_ambulance_desc = '这辆救护车已被占用！',
    already_occupied_stretcher = '已被占用',
    already_occupied_stretcher_desc = '这个担架已被占用！',
    vehicle_occupied = '车辆被占用',
    vehicle_occupied_desc = '进行此操作时，不能有人驾驶车辆！',
    not_occupied_stretcher = '未被占用',
    not_occupied_stretcher_desc = '这个担架未被占用！',
    stretcher_placement_blocked = '放置受阻',
    stretcher_placement_blocked_desc = '你不能在这里放置担架！',
    knocked_out = '击倒了',
    knocked_out_desc = '你被击倒了！',
    checkin_cooldown = '签到冷却',
    checkin_cooldown_desc = '你尝试签到太快，请稍等。',
    checkingin_progress = '正在签到...',
    remove_dead_target = '移除无意识的人',
    ply_injury_head = '头部',
    ply_injury_neck = '颈部',
    ply_injury_spine = '脊椎',
    ply_injury_upper = '上半身',
    ply_injury_lower = '下半身',
    ply_injury_left_arm = '左臂',
    ply_injury_left_leg = '左腿',
    ply_injury_right_arm = '右臂',
    ply_injury_right_leg = '右腿',
    diagnosing_patient_progress = '正在诊断病人...',
    treating_patient_progress = '正在治疗病人...',
    recovering_progress = '正在恢复...',
    injury_report = '伤害报告',
    none = '无',
    mild = '轻微',
    moderate = '中等',
    severe = '严重',
    deadly = '致命',
    injury_report_locations = '位置',
    injury_report_type = '伤害类型: %s',
    injury_report_severity = '严重程度: %s',
    injury_report_bleed = '失血',
    light_injury_title = '轻伤',
    moderate_injury_title = '中等伤害',
    extreme_injury_title = '极度伤害',
    injury_bleed_notify = '伤害与出血警告',
    light_injury_desc = '你的%s受伤了，考虑去看医生！',
    moderate_injury_desc = '你的%s受了很重的伤，你需要医生！',
    extreme_injury_desc = '你的%s受了极重的伤。你需要尽快看医生，否则就太晚了！',
    injury_msg_one = '你有一处重要伤害。',
    injury_msg_two = '你有一处严重伤害。',
    injury_msg_three = '你有一处非常严重的伤害。',
    injury_msg_four = '你有一处危急的伤害。',
    bleed_msg_one = '你在流血。',
    bleed_msg_two = '你流血很严重。需要施加压力。',
    bleed_msg_three = '你快要流血过多了！',
    fainted_title = '昏倒',
    fainted_so_high_desc = '你因为太高而昏倒。',
    cant_jump_title = '不能跳跃！',
    cant_jump_desc = '你受伤太重，不能尝试跳跃',
    blackout_title = '失去意识',
    blackout_desc = '你因为%s的伤害失去了意识！立即寻求医疗救助！',
    treated_fully_desc = '你已经得到治疗，感觉比以往任何时候都要好！',
    treated_not_fully_desc = '你已经得到治疗，但需要额外的治疗。',
    prescription_menu = '处方菜单',
    prescription_menu_desc = '访问和管理处方',
    no_stretcher_detected = '没有担架',
    no_stretcher_detected_desc = '没有检测到活动担架！',
    cant_run = '不能疾跑',
    cant_run_desc = '你受伤太重，无法疾跑！',
    no_back_seat = '没有可用座位',
    no_back_seat_desc = '这辆救护车后面没有座位',
    enter_vehicle_back = '进入救护车（后面）',
    stretcher_already_deployed = '担架已经部署',
    stretcher_already_deployed_desc = '分配给这辆救护车的担架已经被移除。',
    send_stretcher_home = '返回到车辆',
    ambulance_not_found = '担架被移除，但没有找到救护车返回！',
    bleedout = '流血',
    player_injury_critical_desc = '玩家因%s伤口处于危急状态！',
    gps_active = 'GPS已激活',
    gps_active_desc = '玩家%s激活了他们的GPS',
    gps_deactive = 'GPS已停用',
    gps_deactive_desc = '玩家%s停用了他们的GPS',
    no_wsb = '^0[^3警告^0] wasabi_bridge未在框架之后和/或资源之前启动: %s',
    spawn_blocked = '车库堵塞',
    spawn_blocked_desc = '你不能把你的车开出来，因为被堵住了！',
    menu_remove_crutch = '移除拐杖',
    menu_remove_crutch_desc = '给附近的病人拿掉拐杖',
    menu_remove_chair = '拿走轮椅',
    menu_remove_chair_desc = '给附近的病人拿走轮椅',
    toggle_stretcher = '取担架',
    toggle_stretcher_desc = '从最近的车辆取担架',
    no_vehicle_nearby = '车辆',
    no_vehicle_nearby_desc = '附近没有车辆',
    no_ambulance_nearby_desc = '附近没有救护车',
    on_duty = '值班中',
    on_duty_desc = '你刚刚切换到值班状态！',
    off_duty = '下班',
    off_duty_desc = '你刚刚切换到下班状态！',
    amount = '金额',
    mr = '先生',
    mrs = '女士',
    debt_collection = '债务收集',
    db_email =
    '亲爱的%s %s，<br /><br />中央司法催收机构（CJCA）已经收取了你从警察那里收到的罚款。<br />你的账户已经扣除<strong>$%s</strong>。<br /><br />此致敬礼，<br />Wasabi先生',
    fine_sent = '罚款已发送',
    fine_sent_desc = '你已成功发送$%s的罚款！',
    fine_received = '收到罚款',
    fine_received_desc = '你收到了$%s的罚款',
    log_killed_title = '玩家被杀',
    log_killed_desc =
    '> *%s [%s] 杀死了 %s [%s]\n\n**杀手信息：**\n姓名: `%s`\n玩家ID: `%s`\n标识符: `%s`\nSteam: `%s`\nDiscord: `%s`\n许可证: `%s`\n许可证2: `%s`\nXBL: `%s`\nFiveM: `%s`\nIP: ||%s||\n\n**受害者信息：**\n角色名: `%s`\n玩家ID: `%s`\n标识符: `%s`\nSteam: `%s`\nDiscord: `%s`\n许可证: `%s`\n许可证2: `%s`\nXBL: `%s`\nFiveM: `%s`\nIP: ||%s||\n\n> **死亡原因：** `%s`',
    log_suicide_title = '玩家自杀',
    log_suicide_desc =
    '> %s [%s] 自杀了\n\n**玩家信息：**\n姓名: `%s`\n玩家ID: `%s`\n标识符: `%s`\nSteam: `%s`\nDiscord: `%s`\n许可证: `%s`\n许可证2: `%s`\nXBL: `%s`\nFiveM: `%s`\nIP: ||%s||\n\n> **死亡原因：** `%s`',
    unknown = '未知',
    log_admin_revive_title = '玩家被管理员复活',
    log_admin_revive_desc =
    '> *%s [%s] 管理员复活了 %s [%s]\n\n**目标信息：**\n姓名: `%s`\n玩家ID: `%s`\n标识符: `%s`\nSteam: `%s`\nDiscord: `%s`\n许可证: `%s`\n许可证2: `%s`\nXBL: `%s`\nFiveM: `%s`\nIP: ||%s||\n\n**管理员信息：**\n角色名: `%s`\n玩家ID: `%s`\n标识符: `%s`\nSteam: `%s`\nDiscord: `%s`\n许可证: `%s`\n许可证2: `%s`\nXBL: `%s`\nFiveM: `%s`\nIP: ||%s||',
    log_self_revive_title = '管理员自行复活',
    log_self_revive_desc =
    '> %s [%s] 自行复活了\n\n**玩家信息：**\n姓名: `%s`\n玩家ID: `%s`\n标识符: `%s`\nSteam: `%s`\nDiscord: `%s`\n许可证: `%s`\n许可证2: `%s`\nXBL: `%s`\nFiveM: `%s`\nIP: ||%s||',
    log_death_logs = '死亡日志',
    log_revive_logs = '复活日志',
    medbag_crutch = '拐杖',
    medbag_crutch_desc = '帮助病人行走的拐杖',
    menu_crutch = '应用拐杖',
    menu_crutch_desc = '给附近的病人添加拐杖',
    medbag_chair = '轮椅',
    medbag_chair_desc = '帮助不能行走的病人的轮椅',
    menu_chair = '应用轮椅',
    menu_chair_desc = '给附近的病人添加轮椅',
    shot = '枪击',
    stabbed = '刺伤',
    beat = '钝器伤',
    burned = '烧伤',
    other = '未知',
    JobMenuTitle = '急救菜单',
    dispatch = '派遣',
    dispatch_desc = '检查需要帮助的玩家',
    DispatchMenuTitle = '派遣',
    GoBack = '返回',
    key_map_text = '救护车工作菜单',
    assistance_title = '请求援助',
    assistance_desc = '有人请求医疗援助！',
    respawn_available_in = '可重生时间在 ~r~%s分钟%s秒~s~\n',
    respawn_bleedout_in = '你将在 ~r~%s分钟%s秒~s~ 内流血致死\n',
    respawn_bleedout_prompt = '按住 [~r~E~s~] 重生',
    distress_send = '按 [~r~G~s~] 向EMS发送求救信号',
    distress_sent_title = '请求援助',
    distress_sent_desc = '已向可用单位发送求救信号！',
    route_set_title = '路线设置',
    route_set_desc = '已为受困者设置路线！',
    diagnose_patient = '诊断',
    diagnose_patient_desc = '诊断最近的受伤人员',
    no_requests = '没有活跃请求',
    revive_patient = '复活',
    revive_patient_desc = '尝试复活附近的人',
    heal_patient = '治愈',
    heal_patient_desc = '尝试治愈附近的人',
    sedate_patient = '镇静',
    sedate_patient_desc = '临时镇静附近的人',
    drag_patient = '拖拽',
    drag_patient_desc = '拖拽附近的受伤人员',
    place_stretcher_target = '添加或移除病人',
    place_patient = '放置/取出车辆',
    place_patient_desc = '将附近昏迷的人放置进/从车辆中取出',
    no_nearby = '未找到',
    no_nearby_desc = '周围似乎没有人',
    no_injury = '无伤',
    no_injury_desc = '此人似乎不需要任何治疗',
    no_injury_dead_desc = '患者似乎不需要额外的治疗。尝试使用除颤器，并祈祷一切顺利！',
    player_injury = '人员受伤',
    player_injury_desc = '此人似乎有%s伤口',
    player_not_unconscious = '玩家清醒',
    player_not_unconscious_desc = '玩家似乎是清醒的',
    player_unconscious = '玩家昏迷',
    player_unconscious_desc = '此治疗需要患者清醒！',
    player_reviving = '复活中',
    player_reviving_desc = '正在进行患者复活',
    player_noitem = '物品缺失',
    player_noitem_desc = '您缺少进行此操作所需的物品！',
    player_successful_revive = '复活成功',
    player_successful_revive_reward_desc = '您已成功复活患者，并获得了%s美元的奖励！',
    player_successful_revive_desc = '您已成功复活患者！',
    player_healing = '治疗中',
    player_healing_desc = '正在进行患者治疗',
    player_successful_heal = '治愈成功',
    player_successful_heal_desc = '患者成功治愈！',
    player_healed_desc = '医护人员成功为您治疗！',
    not_medic = '未授权',
    not_medic_desc = '您未经培训，无权使用此功能！',
    target_sedated = '麻醉',
    target_sedated_desc = '您已被医护人员麻醉',
    player_successful_sedate_desc = '您已成功麻醉患者',
    drop_bag_ui = '[E] - 放下医疗包',
    drop_stretch_ui = '[E] - 放置担架',
    pickup_bag_target = '拾取',
    move_target = '移动',
    interact_bag_target = '打开',
    successful = '成功',
    medbag_pickup = '您拾取了医疗包',
    medbag_pickup_civ = '您搜查了包并拿走了有用的东西',
    stretcher_pickup = '您将担架送回了它所属的救护车',
    medbag = '医疗包',
    medbag_tweezers = '镊子',
    medbag_tweezers_desc = '用于取出子弹',
    medbag_suture = '缝合包',
    medbag_suture_desc = '用于缝合伤口',
    medbag_icepack = '冰袋',
    medbag_icepack_desc = '用于减轻肿胀',
    medbag_burncream = '烧伤膏',
    medbag_burncream_desc = '用于治疗烧伤',
    medbag_defib = '除颤器',
    medbag_defib_desc = '用于复活患者',
    medbag_medikit = '医疗包',
    medbag_medikit_desc = '用于治疗患者',
    medbag_sedative = '镇静剂',
    medbag_sedative_desc = '用于麻醉患者',
    medbag_stretcher = '可折叠担架',
    medbag_stretcher_desc = '用于移动患者',
    item_grab = '您从医疗包中取出了一个工具',
    wrong_equipment = '错误的设备！',
    wrong_equipment_desc = '您接受过培训吗？',
    player_not_injured = '未受伤',
    player_not_injured_desc = '此人似乎不需要任何额外的治疗，可以使用除颤器',
    player_treated = '已治疗',
    player_treated_desc = '您已成功治疗了患者',
    revive_command_help = '管理员命令，用于复活玩家',
    revive_command_arg = '玩家ID',
    reviveall_command_help = '管理员命令，复活所有玩家',
    revivearea_command_help = '管理员命令，复活附近的玩家',
    revivearea_command_arg = '用于复活玩家的区域',
    resetdeathcount_command_help = '管理员命令，重置玩家的死亡计数',
    resetdeathcount_command_arg = '玩家ID',
    viewdeathcount_command_help = '查看您的死亡计数的命令',
    alive_again = '复活',
    alive_again_desc = '您被当地人送到了医院！',
    request_supplies_target = '医疗用品',
    currency = '美元',
    not_enough_funds = '资金不足',
    not_enough_funds_desc = '您没有足够的资金！',
    hospital_garage = '医院车库',
    used_meditkit = '使用医疗包',
    used_medikit_desc = '你成功地给自己处理了伤口',
    action_cancelled = '操作取消',
    action_cancelled_desc = '你取消了上次的操作！',
    healing_self_prog = '治疗伤口',
    checkin_hospital = '成功',
    checkin_hospital_desc = '你已成功接受医院工作人员的治疗',
    max_ems = '医护人员充足',
    max_ems_desc = '城市里有很多医护人员！发出求助信号寻求帮助！',
    player_busy = '忙碌中',
    player_busy_desc = '你目前太忙，无法执行此操作！',
    cloakroom = '更衣室',
    civilian_wear = '普通服装',
    bill_patient = '给患者开发票',
    bill_patient_desc = '向附近的患者发送发票',
    invalid_entry = '无效',
    invalid_entry_desc = '你的输入无效！',
    medical_services = '医疗服务',
    hospital = '医院',
    interact_stretcher_ui = '[E] - 互动',
    stretcher_menu_title = '担架互动',
    open_shop_ui = '[E] - 打开药房'
}

UIStrings = {
    player_dying = "你正在垂死",
    player_passed = "你已经过世",
    ems_on_the_way = "紧急服务正在前往!",
    press_ems_services = "寻求紧急服务",
    press_for_light = "看到光明",
    hold = "把持",
    time_to_respawn = "重生剩余时间",
    press = "按",
    player_hurt_critical = "危急情况！",
    player_hurt_severe = "你受了严重的伤",
    player_hurt_unconscious = "无意识",
    player_hurt_unconscious_direct = "你失去了意识",
    player_hurt_find_help_or_ems = "按 <span class='color'>G</span> 键请求紧急服务",
    player_hurt_time_to_live = "正在流血",
    player_hurt_auto_respawn = "生命体征减弱",
    player_hurt_respawn = "按 E 键去见光"
}
