#本文件用于创建游戏内队伍

#创建逃走者team
team add tzz_team_runner
team modify tzz_team_runner color green
team modify tzz_team_runner nametagVisibility never
team modify tzz_team_runner deathMessageVisibility never

#创建追捕者team
team add tzz_team_catcher
team modify tzz_team_catcher color red
team modify tzz_team_catcher nametagVisibility never
team modify tzz_team_catcher deathMessageVisibility never

#创建op管理员team
team add tzz_team_op
team modify tzz_team_op color gold
team modify tzz_team_op nametagVisibility always
team modify tzz_team_op deathMessageVisibility always
