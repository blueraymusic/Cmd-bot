# Simple installer for the cmd bot
echo "Hello. Installing Computer bot..."
echo "- Creating cmd-bot in home directory..."
echo "-----"
echo "Python should be installed --- (!)"

TARGET_DIR=~/cmd-bot
TARGET_FULLPATH=$TARGET_DIR/computer.py
mkdir -p $TARGET_DIR

echo "- Copying files..."
cp computer.py prompt.txt computer.yaml $TARGET_DIR
chmod +x $TARGET_FULLPATH

# Creates two aliases for use
echo "- Creating yolo and computer aliases..."
alias yolo=$TARGET_FULLPATH
alias computer=$TARGET_FULLPATH

# Add the aliases to the logon scripts
# Depends on your shell
if [[ "$SHELL" == "/bin/bash" ]]; then
  echo "- Adding aliases to ~/.bash_aliases"
  [ "$(grep '^alias yolo=' ~/.bash_aliases)" ]     && echo "alias yolo already created"     || echo "alias yolo=$TARGET_FULLPATH"     >> ~/.bash_aliases 
  [ "$(grep '^alias computer=' ~/.bash_aliases)" ] && echo "alias computer already created" || echo "alias computer=$TARGET_FULLPATH" >> ~/.bash_aliases
elif [[ "$SHELL" == "/bin/zsh" ]]; then
  echo "- Adding aliases to ~/.zshrc"
  [ "$(grep '^alias yolo=' ~/.zshrc)" ]     && echo "alias yolo already created"     || echo "alias yolo=$TARGET_FULLPATH"     >> ~/.zshrc 
  [ "$(grep '^alias computer=' ~/.zshrc)" ] && echo "alias computer already created" || echo "alias computer=$TARGET_FULLPATH" >> ~/.zshrc
else
  echo "Note: Shell was not bash or zsh."
  echo "      Consider configuring aliases (like yolo and/or computer) manually by adding them to your login script, e.g:"
  echo "      alias yolo=$TARGET_FULLPATH     >> <your_logon_file>"
fi

echo
echo "Done."
echo
echo "Make sure you have the OpenAI API key set via one of these options:" 
echo "  - environment variable"
echo "  - .env or an ~/.openai.apikey file or in"
echo "  - computer.yaml"
echo
echo "Have fun!"
