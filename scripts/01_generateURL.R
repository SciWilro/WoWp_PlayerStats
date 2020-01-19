# Sandbox script to generate url to use based on selected parameters
# This will likely become a single function
# Example of url:
# url.clan.raw <- 'https://clans.worldofwarplanes.com/wowp/1000054054/players/#players&offset=0&limit=25&order=-role&timeframe=all&battle_type='

## Params: order --------------------------------------------------------------
params.order.isRev = FALSE
params.order.types <- c('role', 'name', 'battles_count','wins_percentage', 'exp_per_battle', 'damage_per_battle', 'ground_damage', 'frags_per_battle', 'battles_per_day', 'days')
params.order <- setNames( nm = 'order', object = params.order.types[2] )
# Reverse order: change string 
if (params.order.isRev) params.order  <- paste0('-', params.order)

## Params: timeframe -----------------------------------------------------------
params.timeframe.types <- c('1','7','28','all')
params.timeframe <- setNames( nm = 'timeframe',
                              object = params.timeframe.types[2] )

### Params: offset --------------------------------------------------------------
params.offset <- setNames( nm = 'offset', '0' )
### Params: limit - notWorking --------------------------------------------------
params.limit <- setNames( nm = 'limit', '100' ) # defualt = '25'

### Params: battle_type - Experimental -----------------------------------------------------------
params.battle_type <- setNames( nm = 'battle_type', '' ) # Default ''


## Combine Params-------------------------------------------------------------- #
# What params to use (currently all used)
params.list <- c(params.offset, params.limit, params.order, params.timeframe, params.battle_type)
params.combined <- paste( names(params.list), params.list, sep = '=', collapse = '&' )

# Generate url -----------------------------------------------------------------
url.clan.players.stats <- paste( sep = '&',
          'https://clans.worldofwarplanes.com/wowp/1000054054/players/#players',
          params.combined )
### cleanup--------------------------------------------------------------------
rm(list = ls(pattern = 'params') )

#### Extra ---------
#clipr::write_clip(url.clan.players.stats)
#browseURL(url.clan.players.stats)

(httpcode::http_code( httr::GET(url.clan.players.stats)$status_code ))

