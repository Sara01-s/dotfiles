GREEN="\033[0;32m"
CLEAR="\033[0m"
YELLOW='\033[0;33m'
CYAN='\033[0;36m'
BOLD='\033[1m'
LIGHT_GRAY='\033[0;37m'
DARK_GRAY='\033[1;30m'

REPS_DIR="$HOME/reps"
DOTFILES_DIR="$HOME/dotfiles"

big_log() {
	echo -e $GREEN$BOLD◼◼◼◼◼◼◼◼◼◼◼◼◼◼◼◼◼◼◼◼◼◼◼◼◼◼◼◼◼◼◼◼◼◼◼◼◼◼
	echo -e $GREEN$BOLD$1
	echo -e $GREEN$BOLD◼◼◼◼◼◼◼◼◼◼◼◼◼◼◼◼◼◼◼◼◼◼◼◼◼◼◼◼◼◼◼◼◼◼◼◼◼◼
	echo -e $CLEAR
}

log() {
	echo -e "$GREEN[INFO] $CLEAR$1"
}

log_desc() {
	echo -e "$LIGHT_GRAY[DESC] $DARK_GRAY$1$CLEAR"
}

#######################################################################################

echo ""
echo -e "$GREEN 
       ┏┓┓   ┓   ┏•┓   
┏┏┓┏┓┏┓┃┫┃  ┏┫┏┓╋╋┓┃┏┓┏
┛┗┻┛ ┗┻┗┛┻  ┗┻┗┛┗┛┗┗┗ ┛

$BOLD Installation started.$CLEAR
"
echo ""

sleep 1

big_log "Creating directories..."

if [ -d "$REPS_DIR" ]; then
	log "Repositories directory already exists."
else
	log "Creating directory for storing repositories..."
	mkdir $REPS_DIR
fi

log "All directories created.\n"
sleep 1

big_log "Installing packages..."

if pacman -Qs yay > /dev/null ; then
	log "yay already installed."
else
	echo "Building yay from source..."
	pacman -S --needed git base-devel
	cd $REPS_DIR
	git clone https://aur.archlinux.org/yay.git
	cd yay
	makepkg -si
	cd DOTFILES_DIR
	log "yay installed."
fi

log_desc "yay is an AUR helper, used for package managing."

install() {
	if yay -Q $1 > /dev/null 2>&1; then
		log "$1 already installed."
	else
		log "Intalling $1..."
		yay -S --noconfirm $1 && log "$1 Installed."
	fi

	log_desc "$2"
}

install stow 		"stow will create symlinks for all dotfiles in the $HOME directory."
install neovim 		"neovim is a modern in-terminal text editor."
install kitty 		"kitty is the default terminal to be used in this dotfiles."
install zoxide 		"zoxide \"remebembers\" common visited directories."
install starship 	"starship is used to format the bash prompt."
install eza 		"eza is a replacement for ls, primarily used for showing icons."
install bat			"bat is a replacement for cat, it shows files in a more organized way."
install firefox		"firefox is a web browser."
install thunar		"thunar is a GUI file explorer."
install viu			"viu is used to view images and gif inside the terminal"
