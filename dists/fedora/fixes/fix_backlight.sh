sudo vim /etc/default/grub 

GRUB_CMDLINE_LINUX="... acpi_backlight=native"

sudo grub2-mkconfig -o /boot/efi/EFI/fedora/grub.cfg

