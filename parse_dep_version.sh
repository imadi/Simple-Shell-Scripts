#!/bin/bash +x

s=@componet@03
echo ${s%@*} ${s##*@}
