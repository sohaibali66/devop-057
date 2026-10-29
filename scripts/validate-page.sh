#!/usr/bin/env sh
set -eu

fail() {
  printf 'FAIL: %s\n' "$1" >&2
  exit 1
}

pass() {
  printf 'PASS: %s\n' "$1"
}

[ -f index.html ] || fail "index.html is missing"
pass "index.html exists"

[ -f style.css ] || fail "style.css is missing"
pass "style.css exists"

grep -Eiq '<title>[[:space:]]*[^<]+[[:space:]]*</title>' index.html ||
  fail "index.html must contain a non-empty title element"
pass "index.html contains a non-empty title"

grep -Fq 'FA23-BAI-057' index.html ||
  fail "registration number FA23-BAI-057 was not found"
pass "registration number is present"

grep -Fq 'sohaib87165@gmail.com' index.html ||
  fail "contact email sohaib87165@gmail.com was not found"
pass "expected contact email is present"

grep -Fq 'https://github.com/sohaibali66' index.html ||
  fail "GitHub profile URL was not found"
pass "expected GitHub profile URL is present"

grep -Eiq '<section[^>]*aria-labelledby="contact-heading"|<h[1-6][^>]*id="contact-heading"' index.html ||
  fail "a Contact section with its labelled heading was not found"
grep -Eiq '>Contact[[:space:]]*</h[1-6]>' index.html ||
  fail "the Contact heading text was not found"
pass "Contact section and heading are present"

grep -Fq 'href="style.css"' index.html ||
  fail "index.html does not link to style.css"
pass "stylesheet reference is present"

if grep -Eiq '<script([[:space:]>])' index.html; then
  fail "script elements are not allowed in this plain HTML/CSS assignment"
fi
pass "page uses no script elements"
