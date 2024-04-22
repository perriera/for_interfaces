### tidy-html

- [html-tidy](https://www.html-tidy.org/)

        sudo apt install tidy

### macOS/Linux/Unix

~~~
    cd build/cmake
    cmake ../.. -DCMAKE_BUILD_TYPE=Release [-DCMAKE_INSTALL_PREFIX=/path/for/install]
    make
    [sudo] make install
~~~

- [HTACG HTML Tidy](https://github.com/htacg/tidy-html5)

        tidy --wrap 72 --indent yes --indent-attributes yes --sort-attributes alpha --quiet yes index.html

```

Info: Document content looks like HTML5
No warnings or errors were found.

<!DOCTYPE html>
<!--  This site was created in Webflow. https://www.webflow.com  -->
<!--  Last Published: Wed Oct 11 2023 20:29:42 GMT+0000 (Coordinated Universal Time)  -->
<html data-wf-page="64f8e8ba506e743f86982274"
      data-wf-site="64f8e8ba506e743f8698226c">
  <head>
    <meta content="HTML Tidy for HTML5 for Linux version 5.9.20"
          name="generator">
    <meta charset="utf-8">
    <title>
      my-first-app
    </title>
    <meta content="width=device-width, initial-scale=1"
          name="viewport">
    <meta content="Webflow"
          name="generator">
    <link href="css/normalize.css"
          rel="stylesheet"
          type="text/css">
    <link href="css/webflow.css"
          rel="stylesheet"
          type="text/css">
    <link href="css/my-first-app-48429e.webflow.css"
          rel="stylesheet"
          type="text/css">
    <script type="text/javascript">
      !(function (o, c) {
        var n = c.documentElement,
          t = " w-mod-";
        (n.className += t + "js"),
          ("ontouchstart" in o ||
            (o.DocumentTouch && c instanceof DocumentTouch)) &&
            (n.className += t + "touch");
      })(window, document);
    </script>
    <link href="images/favicon.ico"
          rel="shortcut icon"
          type="image/x-icon">
    <link href="images/webclip.png"
          rel="apple-touch-icon">
  </head>
  <body>
    <div class="w-form">
      <form data-name="Email Form"
            data-wf-element-id="080f00e3-8276-9be9-a065-26d0c9b4d01c"
            data-wf-page-id="64f8e8ba506e743f86982274"
            id="email-form"
            method="get"
            name="email-form">
        <label for="name">Name</label><input accept="image/*"
              class="w-input"
              data-name="Name"
              id="name"
              maxlength="256"
              name="name"
              placeholder=""
              type="text"><label for=""
              id="x">{{name}}</label><input class="w-button"
              type="submit"
              value="Submit">
      </form>
    </div>
  </body>
</html>

About HTML Tidy: https://github.com/htacg/tidy-html5
Bug reports and comments: https://github.com/htacg/tidy-html5/issues
Official mailing list: https://lists.w3.org/Archives/Public/public-htacg/
Latest HTML specification: https://html.spec.whatwg.org/multipage/
Validate your HTML documents: https://validator.w3.org/nu/
Lobby your company to join the W3C: https://www.w3.org/Consortium

Do you speak a language other than English, or a different variant of 
English? Consider helping us to localize HTML Tidy. For details please see 
https://github.com/htacg/tidy-html5/blob/master/README/LOCALIZE.md


```

        tidy -help-config


HTML Tidy Configuration Settings

Within a file, use the form:

wrap: 72
indent: no

When specified on the command line, use the form:

--wrap 72 --indent no

Name                        Type       Allowable values                        
=========================== =========  ========================================
accessibility-check         Enum       0 (Tidy Classic), 1 (Priority 1 Checks),
                                       2 (Priority 2 Checks), 3 (Priority 3    
                                       Checks)                                 
add-meta-charset            Boolean    no, yes                                 
add-xml-decl                Boolean    no, yes                                 
add-xml-space               Boolean    no, yes                                 
alt-text                    String     -                                       
anchor-as-name              Boolean    no, yes                                 
ascii-chars                 Boolean    no, yes                                 
assume-xml-procins          Boolean    no, yes                                 
bare                        Boolean    no, yes                                 
break-before-br             Boolean    no, yes                                 
char-encoding               Encoding   raw, ascii, latin0, latin1, utf8,       
                                       iso2022, mac, win1252, ibm858, utf16le, 
                                       utf16be, utf16, big5, shiftjis          
clean                       Boolean    no, yes                                 
coerce-endtags              Boolean    no, yes                                 
css-prefix                  String     -                                       
custom-tags                 Enum       no, blocklevel, empty, inline, pre      
decorate-inferred-ul        Boolean    no, yes                                 
doctype                     String     -                                       
drop-empty-elements         Boolean    no, yes                                 
drop-empty-paras            Boolean    no, yes                                 
drop-proprietary-attributes Boolean    no, yes                                 
enclose-block-text          Boolean    no, yes                                 
enclose-text                Boolean    no, yes                                 
error-file                  String     -                                       
escape-cdata                Boolean    no, yes                                 
escape-scripts              Boolean    no, yes                                 
fix-backslash               Boolean    no, yes                                 
fix-bad-comments            Enum       no, yes, auto                           
fix-style-tags              Boolean    no, yes                                 
fix-uri                     Boolean    no, yes                                 
force-output                Boolean    no, yes                                 
gdoc                        Boolean    no, yes                                 
gnu-emacs                   Boolean    no, yes                                 
hide-comments               Boolean    no, yes                                 
indent                      Enum       no, yes, auto                           
indent-attributes           Boolean    no, yes                                 
indent-cdata                Boolean    no, yes                                 
indent-spaces               Integer    0, 1, 2, ...                            
indent-with-tabs            Boolean    no, yes                                 
input-encoding              Encoding   raw, ascii, latin0, latin1, utf8,       
                                       iso2022, mac, win1252, ibm858, utf16le, 
                                       utf16be, utf16, big5, shiftjis          
input-xml                   Boolean    no, yes                                 
join-classes                Boolean    no, yes                                 
join-styles                 Boolean    no, yes                                 
keep-tabs                   Boolean    no, yes                                 
keep-time                   Boolean    no, yes                                 
literal-attributes          Boolean    no, yes                                 
logical-emphasis            Boolean    no, yes                                 
lower-literals              Boolean    no, yes                                 
markup                      Boolean    no, yes                                 
merge-divs                  Enum       no, yes, auto                           
merge-emphasis              Boolean    no, yes                                 
merge-spans                 Enum       no, yes, auto                           
mute                        String     -                                       
mute-id                     Boolean    no, yes                                 
ncr                         Boolean    no, yes                                 
new-blocklevel-tags         Tag Names  tagX, tagY, ...                         
new-empty-tags              Tag Names  tagX, tagY, ...                         
new-inline-tags             Tag Names  tagX, tagY, ...                         
new-pre-tags                Tag Names  tagX, tagY, ...                         
newline                     Enum       LF, CRLF, CR                            
numeric-entities            Boolean    no, yes                                 
omit-optional-tags          Boolean    no, yes                                 
output-bom                  Enum       no, yes, auto                           
output-encoding             Encoding   raw, ascii, latin0, latin1, utf8,       
                                       iso2022, mac, win1252, ibm858, utf16le, 
                                       utf16be, utf16, big5, shiftjis          
output-file                 String     -                                       
output-html                 Boolean    no, yes                                 
output-xhtml                Boolean    no, yes                                 
output-xml                  Boolean    no, yes                                 
preserve-entities           Boolean    no, yes                                 
priority-attributes         Attribute  attributeX, attributeY, ...             
                            s Names                                            
punctuation-wrap            Boolean    no, yes                                 
quiet                       Boolean    no, yes                                 
quote-ampersand             Boolean    no, yes                                 
quote-marks                 Boolean    no, yes                                 
quote-nbsp                  Boolean    no, yes                                 
repeated-attributes         Enum       keep-first, keep-last                   
replace-color               Boolean    no, yes                                 
show-body-only              Enum       no, yes, auto                           
show-errors                 Integer    0, 1, 2, ...                            
show-filename               Boolean    no, yes                                 
show-info                   Boolean    no, yes                                 
show-meta-change            Boolean    no, yes                                 
show-warnings               Boolean    no, yes                                 
skip-nested                 Boolean    no, yes                                 
sort-attributes             Enum       none, alpha                             
strict-tags-attributes      Boolean    no, yes                                 
tab-size                    Integer    0, 1, 2, ...                            
tidy-mark                   Boolean    no, yes                                 
uppercase-attributes        Enum       no, yes, preserve                       
uppercase-tags              Boolean    no, yes                                 
vertical-space              Enum       no, yes, auto                           
warn-proprietary-attributes Boolean    no, yes                                 
word-2000                   Boolean    no, yes                                 
wrap                        Integer    0 (no wrapping), 1, 2, ...              
wrap-asp                    Boolean    no, yes                                 
wrap-attributes             Boolean    no, yes                                 
wrap-jste                   Boolean    no, yes                                 
wrap-php                    Boolean    no, yes                                 
wrap-script-literals        Boolean    no, yes                                 
wrap-sections               Boolean    no, yes                                 
write-back                  Boolean    no, yes                      