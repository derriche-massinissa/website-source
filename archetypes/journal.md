---
title: "{{ replace (replaceRE "^[0-9]{4}-[0-9]{2}-[0-9]{2}-(.*)" "$1" .Name) "-" " " | title }}"
date: {{ .Date }}
draft: true
categories: ["uncategorized"]
tags: []
---

