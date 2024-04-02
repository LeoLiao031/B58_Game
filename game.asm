#####################################################################
#
# CSCB58 Winter 2024 Assembly Final Project
# University of Toronto, Scarborough
#
# Student: Leo Liao, 1009067885, liaoleo, leo.liao@mail.utoronto.ca
#
# Bitmap Display Configuration:
# - Unit width in pixels: 4 (update this as needed)
# - Unit height in pixels: 4 (update this as needed)
# - Display width in pixels: 256 (update this as needed)
# - Display height in pixels: 256 (update this as needed)
# - Base Address for Display: 0x10008000 ($gp)
#
# Which milestoneshave been reached in this submission?
# (See the assignment handout for descriptions of the milestones)
# - Milestone 1/2/3/4 (choose the one the applies)
#
# Which approved features have been implemented for milestone 3?
# (See the assignment handout for the list of additional features)
# 1. (fill in the feature, if any)
# 2. (fill in the feature, if any)
# 3. (fill in the feature, if any)
# ... (add more if necessary)
#
# Link to video demonstration for final submission:
# - (insert YouTube / MyMedia / other URL here). Make sure we can view it!
#
# Are you OK with us sharing the video with people outside course staff?
# - yes / no / yes, and please share this project github link as well!
#
# Any additional information that the TA needs to know:
# - (write here, if any)
#
#####################################################################

# Bitmap display starter code
#
# Bitmap Display Configuration:
# - Unit width in pixels: 4
# - Unit height in pixels: 4
# - Display width in pixels: 512
# - Display height in pixels: 256
# - Base Address for Display: 0x10008000 ($gp)
#
# Equivalences
# Codes will determine what type of block it is
# 0xAARRGGBB
# The AA field will be used to define whether a block is permeable or can damage the play
# 00 - will not damage the user is permeable (air)
# 01 - will not damage the user is not permeable (wall)
# 02 - will damage the user is pearmeable (we want the user to see that they walked into a saw/spike)

.eqv BASE_ADDRESS 0x10008000
.text

# the bits after 0x for colours in the matrix will represent the 
li $t0, BASE_ADDRESS # $t0 stores the base address for display
li $t1, 0x00ff0000 # $t1 stores the red colour code
li $t2, 0x01ff0000 # $t2 stores the green colour code
li $t3, 0x02ff0000
# li $t3, 0x000000ff # $t3 stores the blue colour code
sw $t1, 0($t0) # paint the first (top-left) unit red.
sw $t2, 4($t0) # paint the second unit on the first row green. Why $t0+4?
sw $t3, 512($t0) # paint the first unit on the second row blue. Why +256?
li $v0, 10 # terminate the program gracefully
syscall