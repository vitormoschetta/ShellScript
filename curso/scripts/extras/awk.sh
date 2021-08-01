#!/bin/bash

USUARIO="Nome:Vitor"

echo "$USUARIO" | awk -F: '{ print $2 }'


