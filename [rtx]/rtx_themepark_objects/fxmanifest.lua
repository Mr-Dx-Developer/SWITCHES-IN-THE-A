fx_version 'adamant'

game 'gta5'

description 'RTX THEME PARK OBJECTS'

version '1.0'

files {
    'vehicles.meta',
    'carvariations.meta',
    'carcols.meta',
    'handling.meta',
    'vehiclelayouts.meta',
}

this_is_a_map 'yes'

data_file 'DLC_ITYP_REQUEST' 'stream/sempre_delperropier.ytyp'
data_file 'DLC_ITYP_REQUEST' 'stream/sempre_delperropier_bus.ytyp'
data_file 'DLC_ITYP_REQUEST' 'stream/sempre_delperropier_bus_anim.ytyp'
data_file 'DLC_ITYP_REQUEST' 'stream/sempre_delperropier_bus_blue_screen.ytyp'
data_file 'DLC_ITYP_REQUEST' 'stream/sempre_delperropier_bus_red_screen.ytyp'
data_file 'DLC_ITYP_REQUEST' 'stream/sempre_delperropier_bus_target.ytyp'
data_file 'DLC_ITYP_REQUEST' 'stream/sempre_delperropier_boat_anim.ytyp'
data_file 'DLC_ITYP_REQUEST' 'stream/sempre_delperropier_balloon_b.ytyp'
data_file 'DLC_ITYP_REQUEST' 'stream/sempre_delperropier_balloon_g.ytyp'
data_file 'DLC_ITYP_REQUEST' 'stream/sempre_delperropier_balloon_p.ytyp'
data_file 'DLC_ITYP_REQUEST' 'stream/sempre_delperropier_balloon_r.ytyp'
data_file 'DLC_ITYP_REQUEST' 'stream/sempre_delperropier_candycotton_prop.ytyp'
data_file 'DLC_ITYP_REQUEST' 'stream/sempre_delperropier_detonator_anim.ytyp'
data_file 'DLC_ITYP_REQUEST' 'stream/sempre_delperropier_detonator_sedacka_anim.ytyp'
data_file 'DLC_ITYP_REQUEST' 'stream/sempre_delperropier_detonator_zavirani.ytyp'
data_file 'DLC_ITYP_REQUEST' 'stream/sempre_delperropier_gbooster_rameno_anim.ytyp'
data_file 'DLC_ITYP_REQUEST' 'stream/sempre_delperropier_gbooster_sedacka_anim.ytyp'
data_file 'DLC_ITYP_REQUEST' 'stream/sempre_delperropier_gbooster_zakladna_anim.ytyp'
data_file 'DLC_ITYP_REQUEST' 'stream/sempre_delperropier_popcorn_box.ytyp'
data_file 'DLC_ITYP_REQUEST' 'stream/sempre_delperropier_topscan_rameno_2_anim.ytyp'
data_file 'DLC_ITYP_REQUEST' 'stream/sempre_delperropier_topscan_zakladna_anim.ytyp'
data_file 'DLC_ITYP_REQUEST' 'stream/sempre_delperropier_vortex_anim.ytyp'
data_file 'DLC_ITYP_REQUEST' 'stream/sempre_delperropier_vortex_anim_sedacka.ytyp'
data_file 'DLC_ITYP_REQUEST' 'stream/sempre_delperropier_vortex_zavirani.ytyp'
data_file 'DLC_ITYP_REQUEST' 'stream/sempre_delperropier_autodrom_auticko.ytyp'
data_file 'DLC_ITYP_REQUEST' 'stream/sempre_delperropier_autodrom_auticko_g.ytyp'
data_file 'DLC_ITYP_REQUEST' 'stream/sempre_delperropier_autodrom_auticko_b.ytyp'
data_file 'DLC_ITYP_REQUEST' 'stream/sempre_delperropier_autodrom_auticko_p.ytyp'
data_file 'DLC_ITYP_REQUEST' 'stream/sempre_delperropier_control.ytyp'


data_file 'HANDLING_FILE' 'handling.meta'
data_file 'VEHICLE_METADATA_FILE' 'vehicles.meta'
data_file 'VEHICLE_VARIATION_FILE' 'carvariations.meta'

client_script 'vehicle_names.lua'

escrow_ignore {
  'stream/sempre_delperropier.ytd'
}

lua54 'yes'
dependency '/assetpacks'