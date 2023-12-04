# Cmd-bot

# computer Demo


Update computer v0.2 - Support for GPT-4 API

This update introduces the computer.yaml configuration file. In this file, you can specify which OpenAI model you want to query and other settings. The safety switch also moved into this configuration file.

For now, the default model is still gpt-3.5-turbo, but you can update to gpt-4 if you have gotten access already!

computer v0.2 - by @blueraymusic

Usage: 
- computer [-a] list the current directory information
Argument: -a: Prompt the user before running the command (only useful when safety is off)

- computer [-c] generate pre-trained tranformers output
Argument: -c: Prompt the user before running the command (useful when safety is off)
//Important: this argument also takes nlp prompt (.e.g what is a rainbow?)



Current configuration per computer.yaml:
* Model        : gpt-3.5-turbo
* Temperature  : 0
* Max. Tokens  : 500
* Safety       : on
Happy Hacking!

Installation on Linux and macOS

git clone https://github.com/blueraymusic/Cmd-bot
cd Cmd-bot
pip3 install -r requirements.txt
chmod +x computer.py
alias computer=$(pwd)/computer.py
alias yolo=$(pwd)/computer.py #optional

computer show me some funny unicode characters
OpenAI API Key configuration

There are three ways to configure the key on Linux and macOS:

You can either export OPENAI_API_KEY=<yourkey> or have a .env file in the same directory as computer.py with OPENAI_API_KEY="<yourkey>" as a line
Create a file at ~/.openai.apikey with the key in it
Add the key to the computer.yaml configuration file
Aliases

To set the alias, like computer or yolo on each login, add them to .bash_aliases (or .zshrc on macOS) file. Make sure the path is the one you want to use.

echo "alias computer=$(pwd)/computer.py"     >> ~/.bash_aliases
echo "alias yolo=$(pwd)/computer.py" >> ~/.bash_aliases
Installation script

Another option is to run source install.sh after cloning the repo. That does the following:

Copies the necessary files to ~/Cmd-bot/
Creates two aliases computer and yolo pointing to ~/Cmd-bot/computer.py
Adds the aliases to the ~/.bash_aliases or ~/.zshrc file
That's it for Linux and macOS. Now make sure you have an OpenAI API key set.

Windows Installation

On Windows, you can run .\install.bat (or double-click) after cloning the repo. By default, it does the following:

Copies the necessary files to ~\Cmd-bot\
Creates a computer.bat file in ~ that lets you run equivalent to python.exe ~\computer-ai-cmdbot\computer.py
You also have the option to:

Change the location where Cmd-bot\ and computer.bat will be created
Skip creating Cmd-bot\ and use the folder of the cloned repository instead.
Create a .openai.apikey file in your ~ directory
That's it basically.

OpenAI API Key Configuration on Windows

On Windows, export OPENAI_API_KEY=<yourkey> will not work instead:

Run $env:OPENAI_API_KEY="<yourkey>" to set the key for that terminal
Or, Run PowerShell as an administrator and run setx OPENAI_API_KEY "<yourkey>"
Or, Go to Start and search edit environment variables for your account and manually create the variable with the name OPENAI_API_KEY and value <yourkey>
Optionally (since v.0.2), the key can also be stored in computer.yaml.

Running computer on Windows

Windows is less tested; it does work though and will use PowerShell.

python.exe computer.py what is my username
That's it.

computer.bat

If you use install.bat, you should have a computer.bat file in your ~ directory that lets you run the command like so:

.\computer.bat what is my username
You can put the computer.bat file into a $PATH directory (like C:\Windows\System32) to use in any directory like so:

computer what is my username
Have fun.

Disabling the safety switch! Caution!

By default, computer will prompt the user before executing commands.

Since v.0.2, the safety switch setting moved to computer.yaml; the old ~/.computer-safety-off is not used anymore.

To have computer run commands right away when they come ba
