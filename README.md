# Globus Export

Globus Media run an ancient brand management system (BMS), since
replaced by BrandWorkz but still in use by some people. We are among
those unfortunates. But we need to get data off it en masse, and that's
where this script comes in.

This script will crawl a BMS to map out the category structure, building
up a list of assets as it goes. It will then download all of the assets
into a folder structure that reflects the category structure on the BMS.

It doesn't make any effort to download any metadata or anything like
that, but it was enough for our needs.

## Installation

1. Clone the repository. I'm not going to make this a gem because it's
   too niche

## Usage

    Commands:
      import crawl [CATEGORY_URL]  # Crawl the given category URL and everything below it.
      import download              # Download all pending assets
      import help [COMMAND]        # Describe available commands or one specific command
    
    Options:
          [--threads=THREADS]
                               # Default: 5
      b, --bms-url=BMS_URL
      u, --username=USERNAME
      p, --password=PASSWORD

First use `bin/import crawl`, passing it the URL of a category on your
BMS, to begin the process. This will crawl through all of the category
pages below the category that you specified, building up a list of
sub-categories and assets within. (You'll need to pass the `-b` option,
containing your BMS URL; the `-u` option containing your username; and
the `-p` option containing your password.)

Then run `bin/import download` to download the assets. Pass an
`--output-dir` option to control where the files will be downloaded to.
