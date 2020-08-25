# TF2 Sundays

## Cloud resources (Scaleway)
```
$ terraform apply
```

## Scaleway instance provisioning
```
$ ansible-playbook -i tf2.vjpatel.me, main.yml --user root

```

# Bot Navs
1. change to map
2. `/sm_rcon sv_cheats 1`
3. `/sm_rcon nav_generate`

# TODO
 - [ ] template `custom.cfg.j2` with actual variables
 - [ ] support adding `+sv_setsteamaccount <STEAMTOKEN>` to srcds launch script
 - [ ] support adding sv_password from ansible-vault?
 - [ ] parameterise more things
 - [ ] custom MOTD
 - [ ] `nav_generate` via ansible for all maps

# Credits
 - https://github.com/servers-tf/provisioners
