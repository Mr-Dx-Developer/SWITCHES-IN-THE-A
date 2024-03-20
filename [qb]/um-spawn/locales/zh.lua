if um.lang ~= 'zh' then return end

Lang = {}

Lang.UI = {
    main = {
        spawn = '生成',
        last = {
            first = '最后',
            second = '位置',
            words = '记住，你出生在哪里并不重要，重要的是要成功。'
        },
        my = '我的',
        back = '返回'
    },
    menu = {
        map = '地图',
        apart = {
            title = '公寓',
            desc = '在这里，您可以查看和管理您的公寓'
        },
        house = {
            title = '房屋',
            desc = '在这里，您可以查看和管理您的房屋'
        },
        bookmarks = {
            title = '书签',
            desc = '在这里，您可以查看和管理您的收藏位置'
        },
        cinematic = '电影'
    },
    rent = {
        title = '选择公寓',
        button = '租一个公寓房间'
    },
}

Lang.Bookmark = {
    input = {
        title = '添加位置',
        first = {
            name = '位置名称',
            desc = '命名你的特别位置'
        },
        second = {
            name = '位置图片 (URL)',
            desc = '在这里插入图片链接 | 只限 (discord 或 imgur)'
        },
    },
    dialog = {
        header = '书签支付',
        content = '你同意支付 %s$ 将这个位置添加到你的书签吗？'
    },
    error = {
        title = '书签',
        link = '仅限 discord 或 imgur 链接',
        money = '你的钱不够'
    }
}