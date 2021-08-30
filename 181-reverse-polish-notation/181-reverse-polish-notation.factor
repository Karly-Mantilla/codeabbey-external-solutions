USING: kernel math prettyprint ;

! Written in Factor.
! https://factorcode.org

! Note: Factor is a stack language. All we have to do is set
! up some aliases and then run the input.

ALIAS: add +
ALIAS: sub -
ALIAS: mul *
ALIAS: div /

: problem181 ( quot -- ) call >integer . ; inline