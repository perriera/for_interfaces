###
- [looking for html beautifier](https://www.reddit.com/r/commandline/comments/mjkyv0/looking_for_html_beautifier/)
```
curl -s https://startpage.com | lynx --stdin
```
- [html-tidy](https://www.html-tidy.org/)

        sudo apt install tidy

- [HTACG HTML Tidy](https://github.com/htacg/tidy-html5)

        tidy --wrap 72 --indent yes --indent-attributes yes --sort-attributes yes index.html 

```

Config: missing or malformed argument for option: sort-attributes
Config: missing or malformed argument for option: sort-attributes
Document: "yes" is not a file!

Info: Document content looks like HTML5
No warnings or errors were found.

<!DOCTYPE html>
<!--  This site was created in Webflow. https://www.webflow.com  -->
<!--  Last Published: Wed Oct 11 2023 20:29:42 GMT+0000 (Coordinated Universal Time)  -->
<html data-wf-page="64f8e8ba506e743f86982274"
      data-wf-site="64f8e8ba506e743f8698226c">
  <head>
    <meta name="generator"
          content="HTML Tidy for HTML5 for Linux version 5.9.20">
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
      <form id="email-form"
            name="email-form"
            method="get"
            data-name="Email Form"
            data-wf-page-id="64f8e8ba506e743f86982274"
            data-wf-element-id="080f00e3-8276-9be9-a065-26d0c9b4d01c">
        <label for="name">Name</label><input type="text"
              class="w-input"
              maxlength="256"
              name="name"
              placeholder=""
              id="name"
              data-name="Name"
              accept="image/*"><label id="x"
              for="">{{name}}</label><input type="submit"
              value="Submit"
              class="w-button">
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
