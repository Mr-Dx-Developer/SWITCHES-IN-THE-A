if um.lang ~= 'tr' then return end

Lang = {}

Lang.UI = {
    main = {
        spawn = 'SEÇ: ',
        last = {
            first = 'Son',
            second = 'Konum',
            words = 'Unutma, nerede doğduğunun önemi yok, önemli olan başarabilmektir.'
        },
        my = '',
        back = 'Geri'
    },
    menu = {
        map = 'Harita',
        apart = {
            title = 'Apartmanlarım',
            desc = 'Buradan apartmanlarınızı görebilir ve yönetebilirsiniz'
        },
        house = {
            title = 'Evlerim',
            desc = 'Buradan evlerinizi görebilir ve yönetebilirsiniz'
        },
        bookmarks = {
            title = 'Kaydettiklerim',
            desc = 'Buradan kaydettiğiniz lokasyonları görebilir ve yönetebilirsiniz'
        },
        cinematic = 'Sinematik'
    },
    rent = {
        title = 'Apartman Seçin',
        button = 'Apartman odası kirala'
    },
}

Lang.Bookmark = {
    input = {
        title = 'Lokasyon Ekle',
        first = {
            name = 'Lokasyon Adı',
            desc = 'Eklediğiniz lokasyonun özel adı'
        },
        second = {
            name = 'Lokasyon Resmi (URL)',
            desc = 'Linki buraya yapıştırın (sadece discord yada imgur)'
        },
    },
    dialog = {
        header = 'Ödeme',
        content = 'Bu lokasyonu %s$ karşılığında kaydetmek istiyormusun?'
    },
    error = {
        title = 'Kaydedilen Lokasyonlar',
        link = 'Sadece discord yada imgur linki girin',
        money = 'Yeterli paraya sahip değilsin'
    }
}