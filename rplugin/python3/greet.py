import pynvim


@pynvim.plugin
class Greeting(object):
    def __init__(self, vim):
        self.vim = vim

    @pynvim.command("Greet", range="", nargs="*", sync=True)
    def command_handler(self, args, range):
        self.vim.command('echo "Hello, World!"')
