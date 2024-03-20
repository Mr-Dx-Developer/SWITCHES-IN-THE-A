if um.lang ~= 'es' then return end

Lang = {}

Lang.UI = {
    main = {
        spawn = 'GENERAR',
        last = {
            first = 'Último',
            second = 'Ubicación',
            words = 'Recuerda, no importa dónde hayas nacido, lo importante es tener éxito.'
        },
        my = 'Mi',
        back = 'Atrás'
    },
    menu = {
        map = 'Mapa',
        apart = {
            title = 'Apartamentos',
            desc = 'Aquí puedes ver y gestionar tus apartamentos'
        },
        house = {
            title = 'Casas',
            desc = 'Aquí puedes ver y gestionar tus casas'
        },
        bookmarks = {
            title = 'Marcadores',
            desc = 'Aquí puedes ver y gestionar tus ubicaciones guardadas'
        },
        cinematic = 'Cinematográfico'
    },
    rent = {
        title = 'Seleccionar Apartamentos',
        button = 'Alquilar un apartamento'
    },
}

Lang.Bookmark = {
    input = {
        title = 'Agregar Ubicación',
        first = {
            name = 'Nombre de Ubicación',
            desc = 'Nombre tu ubicación especial'
        },
        second = {
            name = 'Imagen de Ubicación (URL)',
            desc = 'Inserta un enlace de imagen aquí | solo (discord o imgur)'
        },
    },
    dialog = {
        header = 'Pago de marcadores',
        content = '¿Aceptas pagar %s$ para agregar esta ubicación a tus marcadores?'
    },
    error = {
        title = 'Marcadores',
        link = 'Solo enlace de discord o imgur',
        money = 'No tienes suficiente dinero'
    }
}