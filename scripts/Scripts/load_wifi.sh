#!/bin/bash

nmcli device wifi list --rescan yes > /dev/null && nmtui-connect
