# -*-mic2-options-*- -f loop --save-kernel -*-mic2-options-*-

# 
# Do not Edit! Generated by:
# kickstarter.py
# 

lang en_US.UTF-8
keyboard us
timezone --utc America/Los_Angeles
part / --size 1700 --ondisk sda --fstype=ext3
rootpw meego 
bootloader  --timeout=0  --append="quiet"   

user --name meego  --groups audio,video --password meego 

#repo --name=oss --baseurl=http://repo.meego.com/MeeGo/builds/trunk/@BUILD_ID@/repos/oss/ia32/packages/ --save --debuginfo --source --gpgkey=file:///etc/pki/rpm-gpg/RPM-GPG-KEY-meego
#repo --name=non-oss --baseurl=http://repo.meego.com/MeeGo/builds/trunk/@BUILD_ID@/repos/non-oss/ia32/packages/ --save --debuginfo --source --gpgkey=file:///etc/pki/rpm-gpg/RPM-GPG-KEY-meego

repo --name=oss --baseurl=http://repo.meego.com/MeeGo/builds/trunk/latest/repos/oss/ia32/packages/ --save --debuginfo --source --gpgkey=file:///etc/pki/rpm-gpg/RPM-GPG-KEY-meego
repo --name=non-oss --baseurl=http://repo.meego.com/MeeGo/builds/trunk/latest/repos/non-oss/ia32/packages/ --save --debuginfo --source --gpgkey=file:///etc/pki/rpm-gpg/RPM-GPG-KEY-meego

%packages

@Compliance
@Core
@Common User Interface
@Console Tools
@Pinetrail Support

kernel

%end

%post
# save a little bit of space at least...
rm -f /boot/initrd*

rm -f /var/lib/rpm/__db*
rpm --rebuilddb

# Prelink can reduce boot time
if [ -x /usr/sbin/prelink ]; then
    /usr/sbin/prelink -aRqm
fi


%end

%post --nochroot
if [ -n "$IMG_NAME" ]; then
    echo "BUILD: $IMG_NAME" >> $INSTALL_ROOT/etc/meego-release
fi


%end
