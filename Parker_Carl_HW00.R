# 
# Carl Parker
# carljparker@gmail.com
# 206.388.6677
#
# Data 567: Applied Statistics and Experimental Design
# 
# Homework <homework number>
# 

#
# Template for this file is located at:
#
#   ~/git/gtdev/R-language/templates
#

#
# Add an initial @knitr section
#

## @knitr Prolog 
#
# Need to set directory for this @knitr section to do the `source()`
# below.
#
setwd( "/Users/carljparker/git/dss/data-sci/opioid-deaths-king-county" )
getwd()


#
# --- Sourced Files ---
#
source( "code/preamble.R" )


#
# --- Library Dependencies ---
#


#
# --- Function Definitions ---
#


#
# If I run this in RStudio or in vimR, interactive()
# will return TRUE.
#
# If I run this with my "rr" shell function, interactive() 
# will return FALSE.
#
if ( interactive() ) {

 #
 # Set the working directory. Only need to do this for RStudio or RMarkdown.
 #
 # For RMarkdown, need to do this for each chunk.
 #
 setwd( "/Users/carljparker/git/dss/data-sci/opioid-deaths-king-county" )
 getwd()

}  # if interactive


#
# Set repeatable random seed using my zip code.
#
set.seed(98122)


#
# Initialize logging functionality
#
logger.init()


## @knitr q0a 
#
# Set working directory for this knitr chunk
#
setwd( "/Users/carljparker/git/dss/data-sci/opioid-deaths-king-county" )


#
# --- Get the data ---
#
logdebug( "Read data from CSV." )


#
# Update the following line with the name of the CSV file to read.
#
csv.data.file.ch <- "data/opioid.txt"
                                    
csv.data.df <- read.csv( 
                         csv.data.file.ch, 
                         header = TRUE, 
                         quote="\"",
                         sep = ",", 
                         na.strings = c( "NA", "-" ),
                         allowEscapes = TRUE,
                         strip.white  = TRUE,
                         stringsAsFactors = TRUE,
                         comment.char="#" 
                       )

#
# --- Explore the data ---
#

#
# The following line is a nice way to set off 
# data exploration code inside a production
# context.
#

# -*- -*- -*- #

dex.dataframe( csv.data.df )

# -*- -*- -*- #


## @knitr q1a
#
# Set working directory for this knitr chunk
#
setwd( "/Users/carljparker/git/dss/data-sci/opioid-deaths-king-county" )

#
# Guidance on plotting symbols from the following website:
#
#   http://www.sthda.com/english/wiki/r-plot-pch-symbols-the-different-point-shapes-available-in-r
#
png( "viz/opioid-only-deaths.png", 
      width = 500, height = 375, 
      units = "px", pointsize = 9, 
      bg = rgb( 248, 245, 236, maxColorValue = 255 ) 
)

par( 
    cex.main = 3, cex.axis = 1.75, cex.lab = 2,
    # margins: bottom, left, top and right
    par( mar = c( 6, 7, 4, 4 ) + 0.1 )  
)

plot( 
     csv.data.df$year, csv.data.df$opioid.only,
     ylim = c( 100, 200 ),
     main = "Opioid-only deaths by year",
     xlab="Year", ylab="Number of deaths", 
     pch = 24, cex=3, col="blue", bg="red", lwd=2
)

abline( h = c( 134, 156 ), col = "blue" )

dev.off()


## @knitr q1b 


## @knitr q1c 


## @knitr q1d 



## @knitr q2a 
#
# Set working directory for this knitr chunk
#
setwd( "/Users/carljparker/git/dss/data-sci/opioid-deaths-king-county" )


## @knitr q2b 


## @knitr q2c 


## @knitr q2d 


## @knitr Epilog
#
# Set working directory for this knitr chunk
#
setwd( "/Users/carljparker/git/dss/data-sci/opioid-deaths-king-county" )

logdebug( "Program complete." )


# --- END --- #

