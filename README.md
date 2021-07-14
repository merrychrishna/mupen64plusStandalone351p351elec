# mupen64plusStandalone351p351elec
Mupen64plus standalone hack for installing Mupen64plus standalone rice and glide on 351elec on Anbernic rg351p handheld

This is a hacked port because I did not have to compile this. I simply took the mupen64plus standalone with rice and glide from ark os and transferred it to 351elec and made it work.

Things to take note of:
1. If the official Mupen64plus standalone gets updated in the future, I will NOT be able to update my hacked port because I have taken it from ark os and ark os no longer is being updated so Mupen will not be updated on ark os for me to be able to transfer the updated files to 351elec.

2. If in a future release of 351elec the 351elec dev updates the n64 category, you will need to uninstall my mupen hacked port for the changes of the updated n64 category to take effect. This is just until I update my es_sytems_custom1.cfg. At which point you will have to reinstall my updated es_systems_custom1.cfg.  

This hacked port is just to give you more emulation options on the 351p and to tie you over until the 351elec dev releases the new retrorun update.

I have only tested this hacked port on the rg351p.








INSTALLATION INSTRUCTIONS

On Windows,
Extract the ```mupen64plusIPORTEDfromArkOS.zip``` on your PC.

Then log into your 351p with sftp using something like winscp (be sure to enable show hidden files in winscp, just encase)
connect to the same wifi on both your PC and anbernic 351p.
input your IP address of your anbernic 351p.

login info:
```
username: root
password: 351elec
```

Drag the extracted folder called ```mupen64plusINSTALL``` from your PC to the folder called ```STORAGE``` in 351elec

Use Putty to SSH into your anbernic 351p.

Input your IP address of your anbernic 351p.

login info:
```
username: root
password: 351elec
```

Navigate to the mupen install folder by typing this.

```cd mupen64plusINSTALL```


Make the install file executable by typing this.

```chmod +x install.sh```


Run the installer by typing this.

```./install.sh```


Now all you have to do is restart Emulationstation and Mupen64plus stand alone Rice and Glide will show up in your emulator list. 

You're done.


#If you have the Anbernic RG351V, use this instead.

# https://github.com/merrychrishna/mupen64plusStandalone351V351elec
