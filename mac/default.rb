# TODO: installation of Homebrew and oh-my-zsh is manual

# TODO: use https://github.com/k0kubun/itamae-plugin-resource-cask ?
define :cask do
  cask_name = params[:name]
  execute "install #{cask_name}" do
    command "brew install --cask '#{cask_name}'"
    not_if "test -e $(brew --prefix)/Caskroom/#{cask_name}"
  end
end

define :vscode_exentsion do
  extension = params[:name]
  execute "installing vscode extension #{extension}" do
    command "code --install-extension #{extension}"
    not_if "code --list-extensions | grep #{extension}"
  end
end

USER = run_command('whoami').stdout.chomp
MAC_DIR = File.expand_path(File.dirname(__FILE__))

PACKAGES = ['awscli',
            'bat',
            'cloc',
            'docker-compose',
            'docker',
            'git',
            'go',
            'graphviz',
            'htop',
            'ispell',
            'jq',
            'kubernetes-cli',
            'node',
            'openjdk',
            'postgresql',
            'postgresql@16',
            'python',
            'ruby',
            'shellcheck',
            'the_silver_searcher',
            'tree'].freeze

CASKS = ['caffeine',
         'ghostty',
         'licecap',
         'visual-studio-code'].freeze

VSCODE_EXENTSIONS = ['golang.go',
                     'lfs.vscode-emacs-friendly',
                     'ms-python.vscode-pylance',
                     'timonwong.shellcheck'].freeze

execute 'disable homebrew analytics' do
  command 'brew analytics off'
  not_if 'brew analytics state | grep disabled'
end

PACKAGES.each { |package_name| package package_name }
CASKS.each { |cask_name| cask cask_name }
VSCODE_EXENTSIONS.each { |extension_name| vscode_exentsion extension_name }

link "/Users/#{USER}/.pryrc" do
  to "#{MAC_DIR}/files/.pryrc"
  force true
end

link "/Users/#{USER}/.pgpass" do
  to "#{MAC_DIR}/files/.pgpass"
  force true
end

link "/Users/#{USER}/.psqlrc" do
  to "#{MAC_DIR}/files/.psqlrc"
  force true
end

link "/Users/#{USER}/.vimrc" do
  to "#{MAC_DIR}/files/.vimrc"
  force true
end

link "/Users/#{USER}/Library/Application Support/Code/User/settings.json" do
  to "#{MAC_DIR}/files/settings.json"
  force true
end

link "/Users/#{USER}/Library/Application Support/Code/User/keybindings.json" do
  to "#{MAC_DIR}/files/keybindings.json"
  force true
end

link "/Users/#{USER}/.zshrc" do
  to "#{MAC_DIR}/files/.zshrc"
  force true
end
