##### Anchors: `^` and `$`
`^The`: matches any string that starts with The
`end$`: matches a string that ends with end
`^The end$`: exact string match (starts and ends with The end)
`roar`: matches any string that has the text roar in it
##### Quantifiers: `*`, `+`, `?` and `{}`
`abc*`: matches a string that has ab followed by zero or more c
`abc+`: matches a string that has ab followed by one or more c
`abc?`: matches a string that has ab followed by zero or one c
`abc{2}`: matches a string that has ab followed by 2 c
`abc{2,}`: matches a string that has ab followed by 2 or more c
`abc{2,5}`: matches a string that has ab followed by 2 up to 5 c
##### OR Operator: `|` or `[]`
`a(b|c)`: matches a string that has a followed by b or c
`a[bc]`: same as previous