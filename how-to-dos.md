[Home](README.md)
# ? HowToDos

## Edit path enviroment variable
```
rundll32 shell32.dll,Control_RunDLL sysdm.cpl,null,3
```
- Click `Enviroment Variables>User variables>Path>Edit>New`

## Edit registry
```
regedit
```
- Enter registry hive (address of the setting)

## Edit local group policy
```
gpedit.msc
```

## Edit startup apps
Disable/Enable apps: 
- `Settings>Apps>Startup`

Generel startup:
```
shell:common startup
```
User specific startup:
```
shell:startup
```