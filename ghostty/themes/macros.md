# Macros

The macros below were loaded into registers a, q, and z respectively and
used to generate the Ghostty themes from the the itermcolors files.

## Copy Color Components

Copy the iterm color components for a single color e.g. Cursor Color into
the r, g, and b registers.
`a: 5jf>l"byt<04jf>l"gyt<02jf>l"ryt<02j`

## Print Color Components

Print the color components in the format printf('#%02X%02X%02X', r, g, b)
`z: f#v7lcprintf('#%02X%02X%02X', float2nr(0.25490197539329529 *255), float2nr(0.30196079611778259 * 255), float2nr(0.34509804844856262 * 255))`

## Convert Color Components

Convert the color components to a hex string
`q: fpv$hc`
