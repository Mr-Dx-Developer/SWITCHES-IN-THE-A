TwoNaShared.Types = {}

TwoNaShared.Types.Frameworks = { 
    {
        Name = "ESX",
        ResourceName = "es_extended",
        GetFramework = function() return exports["es_extended"]:getSharedObject() end
    },
    {
        Name = "QBCore",
        ResourceName = "qb-core",
        GetFramework = function() return exports["qb-core"]:GetCoreObject() end
    }
}

TwoNaShared.Types.Databases = { 
    {
        Name = "MYSQL-ASYNC",
        ResourceName = "mysql_async"
    },
    {
        Name = "OXMYSQL",
        ResourceName = "oxmysql"
    }
}

