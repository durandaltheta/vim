import glob, os, re, argparse
from datetime import datetime

cfilelist_name = 'cfiles.txt'
sane_ignore = ''

def parseArgs():
    global cfilelist_name
    global sane_ignore 

    parser = argparse.ArgumentParser(description='Script to find c/c++ files and generate tag definitions. Requires terminal program \'ctags\' to be installed and accessible from the terminal for actions that generate ctags. The same is true for terminal program \'cscope\' for actions that generate cscope tags. When neither --f/--get-files nor -g/--generate-ctags are specified the following arguments are internally specifed: --get-files --generate-ctags --sane --clean (which finds files and generates tags).')

    parser.add_argument('-f',
                        '--get-files',
                        action='store_true',
                        default=False,
                        help='Generate file '+cfilelist_name+' containing paths to all C/C++ source and header files in current directory and subdirectories. It is more efficient to generate this file only once so ctags doesn\'t waste time searching for files each time the user wants to update the tags file. The only time this needs to be rerun is when c files are added or removed from the codebase.')

    parser.add_argument('-g',
                        '--generate-ctags',
                        action='store_true',
                        default=False,
                        help='Generate tags file from '+cfilelist_name+' using the ctags terminal utility')

    parser.add_argument('-i',
                        '--ignore',
                        type=str,
                        default='',
                        help='A string of space separated words to be excluded during a --get-files operation')

    parser.add_argument('-s',
                        '--sane',
                        action='store_true',
                        default=False,
                        help='Append the following to the --ignore string: "'+sane_ignore+'"')

    parser.add_argument('-cl',
                        '--clean',
                        action='store_true',
                        default=False,
                        help='Specify if ctags file should be replaced instead of appended to')

    parser.add_argument('-c',
                        '--generate-cscope',
                        action='store_true',
                        default=False,
                        help='Generate cscope tags. These are essentially *much* more detailed ctags, providing additional features like: go to function usages, go to symbol usages, go to text usages, etc.')

    parser.add_argument('-a',
                        '--all',
                        action='store_true',
                        default=False,
                        help='Do everything. Sets the flags: --get-files --sane --generate-ctags --clean --generate-cscope')

    parser.add_argument('-v',
                        '--verbose',
                        action='store_true',
                        default=False,
                        help='Print more information')

    args = parser.parse_args()

    if args.all:
        args.get_files=True
        args.generate_ctags=True
        args.sane=True 
        args.clean=True
        args.generate_cscope=True

    if not args.get_files and not args.generate_ctags and not args.generate_cscope:
        args.get_files=True
        args.generate_ctags=True
        args.sane=True 
        args.clean=True

    if args.sane:
        args.ignore += sane_ignore

    execution_start = datetime.now()

    getFiles(args)
    genCtags(args) 
    genCscope(args)
   
    print "Execution time: " + str(datetime.now() - execution_start)
                        

def getFiles(args):
    if not args.get_files:
        return 

    filenames = []
    ignore = args.ignore.split(' ')
    start_dir = os.getcwd()
    reg = re.compile('.*\.(c|cpp|c\+\+|h|hpp|h\+\+)$')
    for root, dirs, files in os.walk(start_dir):
        if '.svn' not in root:
            for file in files:
                fpath = os.path.join(root,file)

                cont = False
                for i in ignore:
                    if i in fpath:
                        cont = True
                        break 

                if cont == True:
                    continue

                ret = reg.search(file)
                if ret is not None:
                    if args.verbose:
                        print fpath
                    filenames += os.path.join(root,file) + '\n'

    global cfilelist_name

    if os.path.exists(cfilelist_name):
        os.remove(cfilelist_name)

    f = open(cfilelist_name,'w+')

    for file in filenames:
        f.write(file)

    f.close()


def genCtags(args):
    if not args.generate_ctags:
        return 

    global cfilelist_name 

    cmd = 'ctags'

    if args.verbose:
        cmd += ' --verbose'

    if not args.clean:
        cmd += ' --append'

    cmd += ' -L '+cfilelist_name

    if args.verbose:
        print cmd

    os.system(cmd)


def genCscope(args):
    if not args.generate_cscope:
        return 

    global cfilelist_name

    cmd = 'cscope -i '+cfilelist_name+' -b -q'

    if args.verbose:
        cmd += ' -v'

    if args.verbose:
        print cmd

    os.system(cmd)


if __name__ == "__main__":
    parseArgs()
