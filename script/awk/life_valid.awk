#!/bin/awk -f

BEGIN {
    FS = "\t"  # 指定字段分隔符为制表符
    valid = 1  # 初始化验证标志为1（有效）
}

NR > 1 {
    # 验证数字列是否包含数字
    if (!($3 == "" || $3 ~ /^[0-9]+$/) || !(($4 == "" || $4 ~ /^[0-9]+(\.[0-9]+)?$/) && ($5 == "" || $5 ~ /^[0-9]+(\.[0-9]+)?$/) && ($6 == "" || $6 ~ /^[0-9]+$/))) {
        print "Data validation failed: Numeric column contains illegal characters at line " NR ": " $3 ", " $4 ", " $5 ", " $6
        valid = 0
        exit 1
    }

    # 验证字符串列是否为字符串
    if (!($1 == "" || $1 ~ /^.+$/) || !($2 == "" || $2 ~ /^.+$/)) {
        print "Data validation failed：String column contains illegal characters at line " NR ": " $1 ", " $2
        valid = 0
        exit 1
    }
}

END {}