# Legu min

Kiel tajpi Esperantajn literojn per la angla klavaranĝo en la Linukso.

Jen estas dosiero xkb por tajpi Esperanton kune kun angla klavaranaĝo. En simpla maniero!

1. git clone <tiu dosiero xkb en tiu ĉi repo>
2. sudo cp ./us_eo_xkb /usr/share/X11/xkb/symbols/
3. setxkbmap -layout 'us_eo_xkb'

defaŭlta agordo
Kiam vi presas 
maldestran ALT+c = ĉ
maldestran ALT+s = ŝ
kaj aliaj...

Aŭ vi povas ŝanĝi laŭ via prefero ĉe la lasta linio `include "level3(lalt_switch)"` al `level3(ralt_switch)` por dekstra ALT aŭ la alia klavo laŭ via prefero!
