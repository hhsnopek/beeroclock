#!/bin/bash

while read line; do
  test "$line" = $'\r' && break
done

# Time Calculations


beertime() {
  local now=$()
  local day=$(date +"%w")
  case $day in
    [1-4]*) beer_o_clock 17 $hrs $min;; # mon - thurs
    5) beer_o_clock 16 $hrs $min;; # fri
    *) beer_o_clock;; # sat/sun
  esac
}

beer_o_clock() {
  if [[ "$1" == "" ]] && [[ "$2" == "" ]] && [[ "$3" == "" ]]; then
    echo -e "It's the weekend, you must be out of beer.\nGo get some more beer and afterwards reward yourself with two!."
  elif [[ "$(( 10#$2 ))" -ge "$1" ]]; then
    echo -e "Wait... you're not drinking?\nIt's $(date '+%H:%M')!\nGrab a fucking lager, ale or something that isn't water."
  else
    timeUntil $1
    echo -e "T-minus $hrsUntil hour(s) and $minUntil minute(s) until beer o'clock."
  fi

  timeUntil() {
    now=$(date -d 'now' '+%F %T')
    if [[ "$(( 10#2 ))" -
    tmrw=$(date -d "today $1:00:00" '+%F %T')
    hrsUntil=$(( $(diff) / 60 / 60 ))
    tmrw=$(date -d "$now +$hrsUntil hours" '+%F %Tm)
    minUntil=$(( $(diff) / 60 ))
  }

  diffTime() {
    printf '%s' $(( $(date -d "$tmrw" +%s) - $(date -d "$now" +%s)))
  }
}

favicon='data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAEAAAABACAYAAACqaXHeAAAXmElEQVR4Xu17eYxd133ed8499963zHuzkkPOcLiIWkiKlmRVlCXWtqRYdFInUeyiEmDDSW0UUAwXLWAbqGCktf9ICtRACxQB0qJ/uK27IWFiRJa3uvUWW1UEbZW4SOImikMOZzj72+9ylv7u77wHsqnEP/IoOoB7id+cc89cPrzvO99vOeeeEc45/DJfEr/c1/8nQGH4C//4iY9tiScnnpyYmPj05NT0viguwRoDo7PMGLsqBJpCym2BCsfCMAL1ofMUvV4v7XTa8xurKz/Lsuw7vQ39wz86erSNm3gNFQO+8NnHH56anv7i3J69vzm78xZsmZ5BpVKGlApCOAKZQ6oQxhgEMgBgYZ2FUhGctYCUSLpdNJvr2FxbxcrSIlauLD6/trb+Ypr23iQSj2tj3vzDf3905W+MAv7RJ3/rvqg+8pmdO/c89tBHPzY3t3cfpqa2oFKtoFyKIYVEoBTichVZ2oPRBiKQEACEkJBCwBgNwJEF0NZAZzu5bTU20dxYfyDp9R5otjbpvkGEXMZTn//M0+dXu3/v6NGj5heqgM9/+rG/c/sdB7+37+Dd2LFrDyYmp1Ctj6IUxwxSioDABzDWwmqNrNdFVK7A6ByhipFlXVTq4yhUZ2lMBgoQQK/dQqk8Aiccep02BAL0ki7SNEGSZTh/6iROvvzC/JnzZ574o//wzRedc/amE/D3/+6jkwfvvGvxgYePhLt27kF1tE6gQpSqI4Bz0FmKcm2U+3mWUOPYSpUag026HagoZiKDgIgKI+QEUBSKyFLkOkdlpA6SPpNhTY406VJrsbm5jtWVVVx86zQuXTjfXVpctMuLl/7Nv/3j7z51U7LAE4cPl3fN7Tp2972HwqnxUfZzJb3UA+ln0eQZdNrj2XTWslmjGbyQCmEB3jkGrLMMHQJVqAQQiAl4ZWQU1hqOD6QcfsZZQIUhxqemMTM7i4Pvvx8f/MivVg4/9JGRHbtv+Sef/cQju28KAVt2b/3RwbvfPzO7YydG6mOQQYAsSeCMhpAFektjEgnJV0XKSz6MuHVwSHttIJD+3lqIMEBYKkHFMceJ9sYajLPIc8OfLcjiag1lMucAS+RKAYyR6rZMTjIZu3bvgQyix9/zIPjbv/7wkX13Hnhw69ZtKMURpACDCKQEHOjLr0JIICqVQTkNOc2ehEXaTjjINdeueDJMjmp9AiZNPSmpd5NASQISQsCx7PPUIIxKaDc2CoWxYpx1HF+yNOEsEipFZIxjsl7b954T4OCWhI8WLPEElroOQRjyGMcja6GEQBRK2LSN8+fewMlT53Dk0Y9CVQppW4QAA0zSNqdJazXCuFb0mYhua5NaSyY5bRJhXC8ICGidQ+cZZxSTa8BZjFRLGB0b3fdrH/7w9h/8/OfLRKZ5Twj4L9/9i+O/9w9/5zRF59uNmUAUVPyXg2MChElhdIaNjcsoUtfCwmU8f/wUVjfbuG1uBnce+hAy49i/DYEI4zKEA/u4ThJoo/1nGYNAhYhLFbQ2VrjvtEY36UCnGSvBWoM8T/n5Uhhiy/bZw/d+ePbynYcO4cknn5zf2Nh4Pk3Tb37729/+JhNyo+qAxkZjtd3YvD3rTSISDplOkfZI7sZieWUFKxub2Oik6KYaIBBbZnajMtbFK6+/yf5anprjANghXx+d3o5Oq8HxIwgV8qQHoRS7hckSZEIiCEKecV2AFQEHUxXGMFpzVnDaACbFNH3W3N23031KxOQ72+32zqWlpSd27dqVPfbYY1955plnvnZD0uBvf+xD/+Leew4+tXPHLEQQoq0NgTVIjQACRYGxjlptDKP1EYyNT2JsbIxAtnD8xDFsi1IcevCDqEzNwmhLoAxKlTL1qa3WYZ3xaZDMOQEHA53lXDT1Ok0EUQnOGGRZxpVllnTZuhtX0EWErXvvRikKEEURuxKRgMuXL+O1117DCy+88BMqnn5laAW8sdz7Z9vXu0+5eo6xyQnEoxWMqxDj4+MogmO9VkOpXOH8LgNZyJWJqNZG8fZbp/DG8Vcoam9idHI7rJOwsWJFZN0mUlKAZTcAxwrOMN0enACUCpEXvp/n3oxmNwAEE2ZhOE6EYYhKpYJyuYwtW7Zg+/btpI7p4v6Rj3/84888/fTTjw1FwEsvvZR/5QufT2e2zcTbduxiP4UEtm6ZxlaSobGG/ZJnkIs0gUAKqhTHKb/fi1NvHMf3fvwz3Dq7HXfddRcQR8gLOeeaY4IUkgCmyMmtgtBnmizNoK3jGGGdgwPYBQwHwxwoskJjw9cSImbSATAZcRyzIrTWWF1d/c1HH330yA9/+MP/OdRaIJC2VSnHcb1eQUQEGGs5X0MKOAM42EFZASfAY4BAuVTCtpkdOEtKeGV+EfNr67j/4J2YouImiitIGit+5ZjnLHP6bGpTSKUYgHUCxoH7RABXnGmWcG3Q6XVxYX6eZnsKAmDQrCIpWRE7d+5kwk+ePPkHAIYjIE87re7mwlR3OUcqBbJeA250CnV1CHnSgbM5YLRPZdYAZNZqyCJ4XTqF6MX/iHJmcXGzg5Ufl/Ebn3kKU7tuL+TPYOAMB1hNn5v2EkgZMJG5MRAqZgLyLOcCrNVqorG8gBfPLCA7u0ZA53DXwYPYt28faEleqIHJqJFrzs3NYceOHfcfPnx44rnnnlv/axPwl392tHXmO8AH9mbYOw4QZnT2TmLi8a/B9atCJx1gHQSLwa8FEFag5t9A6fxxLphEBiwtAi9969/hwU98DqX6KAW0VZw/+RIW3jqP2++6B5O798OoCP/9T76Osydew6FHP4aDDz4KIxWDv3L5Ip7+0XPPnllsVEcq8d4L59+qp70ezbqPQyMjIwN34Dg1MzNTEPIQgD//axPQameNWgIkPUDOAJEFRJKBk7oKGRz3HcgGRDhIKKi4iuI7VSRQawNiK7B5/hgab52E3LMPx376DH78588wMe+750X81mc+B1fdgjOvPIuNlRQ/+M//CW+8+hIe/I1PoZMbnHrz9Te++f0ff2gA4o477pgi4N+jAHioWq0OhlkJxf0klc9SyvuGIkBGaAYKMBAISuDyNAgsyx7SAZlmEhwYPKtB5IBVNF4BlAArIwqAkSmg2UzRWV9ERJnirdf+EmMjQDwLJI11tC6dhpgGSqHAzHawf7/x3Ot4+cS/dPcfeVi8ffHK/7gWxKlTp1YfeOCBb5w9e/ZQkQFKpRLHAaVUoQJ2hXq9fmDYDZEWBGA1xz2EktrIAibnexsY9lnRs3AlanMHBIALcgjjEFR8YDRjAtVlh9QAWbeF9soSqgEQlYGuLYiWyEnmrryBUuBQV0CoBNanHP7i3GaePvvc/c+eXj723/5qsdZonFhcXMTa2togBXJJTSRwn0jZPTQBEoDWBMYJuBiQMoc1HQRRGYAm0P1sQC20A2IAJuDtMWkBl3nirPUk5kkCS74blSRUDVA9wIZ+NWk6bcSBxVgIKAUIAYxECH9+6spreOdrsdPpgIyzSc51g4EQgtMiucj4UAQIi6ZTQFb0S17SWNNweQcijIDcAJnz7pCSlZwnwkm4roVoA3IEcAX4Glnb8crR9DqQASDLQEbjgQjgrOE9AQQOCL1OhQNKEd51w1Qp1eBM0QdurWUjAtiklNWhtsWNQEM4zm6QEghS/6VdRgQIC8G+oSFjDREaoEemNeCKMYeg2gceeY7EmEWPnmnSjGndQqT7QEMBpzWXu9JpyBAoO8D4+NrCu1y0w+y4VjCGzTk3qAkGRZIdrhACGkyXo74iCwEIwKVdQFsIaSCighDLD8kYsAm1Zc2pLxgD9CogC/VEQEk58ttzVKmdRmC7iBwQZYAtSxgnCFDbC0AKWAGAjLqd66pUCAY9MCKBjca5HYoABGj29cKSjSZ9UBNhDyIwQKKpdezvjloZwS9zcxrTFgEARIBVQFgWiNccVL4EnQEj44CMBYLUwRqB3CoudJTyMcM5MgaI1nXwDwAPCLi2PzwB0qEN6+UvqQ0Cdm/YbgeoaybBJdbv+6linAsCJkXVHKvGBv7/QQDlCjBWgI2BSAKKrKsKHjPMX7qAzdWLmJwAgshnWiuYiO67gbeWdcLy77sCAx/cU18OQwD7nxTcZRAiobYMSHQhQwNnNYTrM2387NuMjO6l0ojGmA8GL6pkxYxHHpjoAsYCYUVAJilaV95GHAOVqkAEoBf4GgLi3QmgNFcXQlwLmPsAOCukadoYigDr0GEXsD74RZGAyQtwCWSg4QSzDBkVsw7ohmWCTK8fOTVQmfZA01VWFKo1wAUcQpBTGzVpTAqICUCE1CcTZUB1gcD673Ad+deVUlwKA7g2ECJJkqLfGyoLSKDhrM/HQnMQ5Ba6x9WRCjVvXEgaDMicNRzNVYXuSwZRRcJ2ANsCAglEdZ/aRObjiYBPrfQYRseAugFKIaBK7PswuJ4C2LYXBQ8Zk0A2mH0mgLLE0lAEQKEHJpfBM3PlLUU/gU01u0BplFrqpxsaUY2AK2qrGtAGQSRozLtBOAbuu7YPqIE3nx1qZAqIRwFVBsIccJFXirtOFojjeA8tgpiAKIogpYemtebiqNvtXhmKAJEjFw4IYwCpT4WOWuESqNCwnztoAkqgR3JIqSFcQUiGsGIALaG7QHnSyx8ZUJkFpPAWgEz4zw01WegzgIgB5bxq4K5LwH5a+DB4pdQg/xe+j1arVbRnhyNAIQe8fEemWcJMgrQZgjCHMBqm7QufsKzhjCfBpGRdS/eKyetedNT38rc9n1GkIguvKktYsrRPTgRAeoVYoHsdAu6gQMjSv7YWIOkX6wQAOD0UAWEKLnHiiPqqz3oNUJWIZ15Ilj0HxKyhoWK/5QVDYypDbdbSGDAyKzC6h/2aLRwHwBmAU55XQ5nLbQYuMk+QIoO7LgH7SPrXFj0cCEn62NzcLPrnhsoCLYV8ynoXUJGXq5CADCVLXQRkXCZaXyNkvg6QSsAkgG73SRsDbMpC4b6IAN0BnPOE5rmffWgy4ZUhNRAGfJu8E4jbbrutfuDAgZnBXuBA/gSa5d9sNovd4teHC4IbyJ2FKZUEz5xOvAsgl4DNOPjlXQ1DJmWOINREloZgl8hRmfRuAwdSCFDbCTjr40hQ9eOmxyAhTF/+g/yfAyoUgHhnAmgn6D5a7xctyA3YwjBkFyD5FwpYfvPNN1tDEdAAjJCwUcn7qor7X7BgGxpB7AHHdW9K+cwgoRFVCndwiCugFohGgGwTKI/7zwl8DPCgAaiqlz08ET5FBqyS/J1A0IbHQ8WuD2UBBj8IhBT4eH+ACDgx9AmRHX4zyMQhQim9n8IAqiSgohzW5hzYAMtg2a9Lrr8cdVCRgNVAdRLIe4AIrl1qe+CS0QMu6wOX/RVn17tegP+XgEceeWTbLbfc8ruzs7O8/3dNGmT505uiwgWeHZqAnwLucbLa+NUA5uBV4Ai8TQ2kcJDKofiXdf06QEoBGfnnsw4QVgEHf6/6QS9tAaqvKqP75FLrcgBJP/PEDqH+v13gyJEj/5T8//f3799f7PzyjjClQpa/cw7r6+tYWFgoiqHvD02Ac8586lahqyNA3vbFTFjzLgBoqED7hG0K0A6VMQedFyT419vxiPOyhp9ZK8gA6ObVBU9Y5noDhhc+vviRfaJqChidriQHH3lkZFpFX9q2depLtNVd27NnD2+BjY6O8uz3XYCLnwsXLmB+fj55/fXXnx+WALZyDBeX+rMovT8rAc73LtCsAG0dA0bJQfbzd572p9z6qC8NYJM+6BiA8pZ2/O+A/ufDrwmUBsYiYPtdf+sbszvurW8dK/HrL9ru5h3ffgHEM6+U4l0hAo4TJ07gypUrf3pDTokJIYIvHoaqVPr+m1PbD4RABmc0jHWw2jIogaIP9n8ZSBhzVeIgUxUGy/eGWtsG4HwwdMarRLi+qyiHWgW4dXJrvbT/ToxVJCbGxlCnWR9E/EH1R4GPwdNLEBw7dqxIf1+9IQQ8fgtGtmwVlUj5CB3wIQlqpYEjE6Hu7wWQicIAFTqYTEAWz8ArIsu8j+su/C5y3wLlXUFYv3gUhaFfGEkgdsDWmoAsXroGKZN6bcWnteaU9/bbb+PVV1/Fyy+/XATAL9H9+RtCQI3UNjHWT33o+yv7quM0KISG1Y5Xb7COx4OCDCeIKAeEPguURgGdXlPeWvC4igcz7vsOZJbv/bMlIM5XkUDCb34WlvOMU7lbpDsGT/m+eE9QSP8LZ86c+dc37KBkWWJfdcSXwhIABjW8tOwCgIEM/NsggFoUjQ+IsAJB5Jg5a/xsx1UvfZcNXMyXw1kCQF/deULRSk+i7Cwi63WgpOb0kCQJl7r0BriQPQe9ixcvztPYJ+klyXM39KSoCvGBkXK/JBUsVwYmBMdyJkAUYJ0nwF8+Cwhnvdxx1bdB5jS3LH2b9uWuru4BMtHsAv4Z1Z7HpfOnEUcBdMbgeeZptrG8vJxRwfOVc+fOfe09OSpbK+FwJQKU8iAAsNyl7DtsoBkMg2Z0gwWJ86mSXcIrR8BLXwY8zH0P9qr5yz/nCitIyHo4e/x5dFCBSdpFgCuKnR7Zv3LO/fPz588n79lZYQL/t5XwALTxe4LGBBDOwbocxhqO3s5aP4OGxgev0qCRt+xAFQxaFD3+0QfoBBMSWA/a9Ftt/AKp2xUcY3oLJzePNyfWQt18TWv9JyT7o+/5YenPfUDct38WZSQOjRWg2+irPJSI6g4CmZ91YRmY7zvfesiwXcOAhMDVqy/1wQ+Te0UoCYjIS986IMs9EZsbwAEx/6ffPnXhyZt6WvxUd/u+Uttgamk5UQmiUglSRSDw0r8rFH4jVCKA4MAIiIGJonWwYYXV4qMaYLVHbw0rhl3F5ZbHjbMwmYNNnVcQDYOGFlwlfD0pve+mH5fvVuaC9a37cWb7eLSsL+l641gwKc+K7QEwUUukKgUIKyGCKIIMJe/KODkgQkLAwmbp1en3Z4kYNLuQIcs0ApFCd1PkiUNHO7vcgFjqbrWL8lazKuaCJeWwFJ0bvekEVKTW26dG6LDyIVmu/2qUJBrN9SU0GxdsuPo2wuZpHeorqqLWdLVkVBhKxLGwcSQQlhUXtU5veufQ/iC10XC9BDbt8qsAkSTQjS6CrphwvXC3yMYPwMzcBjU6E9TDIBjLO4goAyxcPJffdAIuLsyb+vESJupV3HHgIKa3zaJ+2wcQlY9IIRTaraZqLF5Ea3U+WFk6j6S5gKCznrusKa3RUlhC2l3j4ggygrYRoAInopHMqIlYVqnE3LknKE3uEJPjM6I8Og4VSGF0gk5zHetLC7i8PI/5c1TgXL6sbzoBvXZPLFycx/9+4X/hyuIlTG6dLY6pYtvsDkxNb0N9fAJz+/chju8REAGvCdIkjbMkgdGag6BOUw73IgjZLWQQyDCOy6VSmQ9Ma52LpNtGq7GBxuYqAV7B+voa1tdWsbG8iDUi4dKlC8XbZHHTCYBz3V6aodVsYWNtBcZaJASo2W6TOi4TgHDwDh4qivg0tyKggVIMTkDCWMvALb+xsRz8jPHlrM79y4uk10NG99eWuL12i0nZbLWw1szQSm160wlY2Oh8a25q9A/nl9d+t2cQT6YGqQYILZxUfEqUCOCVmTMGmgObhtQBjw92aAclr7OOCQHXENe8yubn/LHYLoHf2GyQAjaxsLTMf1SVNTde+ZVd2T/4hf7V2N4d2z4Sx9EnZ+d2//qOuZ3btu2YA21H8RFVOiM8WJ6yUTYYKGNABAO9ZgXHLQPu9rDZbGOZ6vqF5Q1ytSWS/MWks3T2hVJ6+c9mq53v/tcXem/9jfqzuS9/+cu3Uv39QZLsrwE4RDsyt0RRxBsUtFHJZCil2Oh3ADAAzkYyL4x3bxrtLkl9vdFeX3rJNS/+rKQ3fhRk88e+/qxrDQA8IUSw7VaopbPQR50zN5iA4e2pp56qEaADUsq9dGLrdlLBHG1Vz5ISqrQxOUnjgoC3yVok8yUCvyCEOFu8tKCx43Se96++v2PQKw9D3N6CGIydrsH95CdO/8IIEHTRHygo2pIasGe/+tWv2hsmSyHk49QUwLf8FO8o0V+0ApiE62yguiEJEEN85hAE/BJe/weIHjbh/HF+mwAAAABJRU5ErkJggg=='
resp="<html><head><link rel='shortcut icon' type='image/x-icon' href='$favicon'></head><body style='font-family: monospace;'>$(TZ=America/New_York beertime)</body></html>\n"

# resp
# param: body (String)
resp() {
  echo "HTTP/1.1 200 OK"
  echo "Content-Type: text/html; charset=utf-8"
  echo "Connection: close"
  echo "Content-Length: ${#1}"
  echo ""
  echo -e "$1"
}
