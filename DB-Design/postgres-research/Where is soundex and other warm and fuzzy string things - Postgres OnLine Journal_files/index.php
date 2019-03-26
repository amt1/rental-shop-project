
/* auto include templates/default/style_fallback.css */

/* The templates/default/style_fallback.css emits CSS statements that all s9y
   themes should have.

   Statements declared in this file are emitted early in the dynamically
   generated stylesheet serendipity.css, so you can override them by declaring
   them again in your theme's style.css or user.css.

   IT IS NOT ADVISED TO CREATE YOUR OWN style_fallback.css FILE! */

/* Images positioned normal/left/right */
.serendipity_image_center {
  border: 0;
  padding-left: 5px;
  padding-right: 5px;
}

.serendipity_image_left {
  float: left;
  border: 0;
  padding-left: 5px;
  padding-right: 5px;
}

.serendipity_image_right {
  float: right;
  border: 0;
  padding-left: 5px;
  padding-right: 5px;
}

/* Images with captions and positioning */
.serendipity_imageComment_center,
.serendipity_imageComment_left,
.serendipity_imageComment_right {
    border: 1px solid #ddd;
    background-color: #efefef;
    margin: 3px;
    padding: 3px;
    text-align: center;
}

.serendipity_imageComment_center {
    margin: auto;
}

.serendipity_imageComment_left {
    float: left;
}

.serendipity_imageComment_right {
    float: right;
}

.serendipity_imageComment_img,
.serendipity_imageComment_img img {
    margin: 0;
    padding: 0;
    text-align: center;
}

.serendipity_imageComment_txt {
    border-top: 1px solid #ddd;
    margin: 0;
    padding: 3px;
    clear: both;
    font-size: 10px;
    text-align: center;
}

/* Lists without bullets or numbers */
.plainList {
    list-style: none;
    margin-left: 0;
    padding-left: 0;
}

/* Messages: centered, important, notice */
.serendipity_center {
    margin-left: auto;
    margin-right: auto;
    text-align: center;
}

.serendipity_msg_important {
    color: red;
}

.serendipity_msg_notice {
    color: green;
}

/* END OF style_fallback.css */

/* auto include templates/postgresqlmag/style.css */

/* HTML Elements */

body {
  color: black;
  background: white;
  font-family: verdana, arial, sans-serif;
}

a,
a:link,
a:visited {
  color: #336666;
  text-decoration: underline;
}

a:active,
a:hover {
  color: #669999;
  text-decoration: underline;
}

img {
  border: 0;
}

h3, h4 {
  margin: 0;
  padding: 0;
}

input[type="text"],
input[type="password"],
input[type="button"],
input[type="submit"],
select,
textarea {
  border: 1px #999 solid;
  background-color: white;
  color: #333;
}

input:focus,    input:hover,
button:focus,   button:hover,
submit:focus,   submit:hover,
select:focus,   select:hover,
textarea:focus, textarea:hover {
  background-color: #eee;
}

input.radio,
input[type="radio"],
input[type="checkbox"] {
  border: none;
}

blockquote {
  border: 1px #999 dashed;
  background-image: url(templates/postgresqlmag/img/quote.gif);
  background-repeat: no-repeat;
  background-position: 0.5em 0.5em;
  padding: 1em;
  margin: 1em;
  margin-right: 0;
}

ul {
  list-style-image: url(templates/postgresqlmag/img/bullet.gif);
  list-style-type: circle;
  padding-left: 1em;
}

::-moz-selection {
  background: #eee;
}

::selection {
  background: #eee;
}
#recommended_books a{color:blue;text-decoration:underline;font-weight:blue}

/* Banner */

#serendipity_banner {
  background-image: url(templates/postgresqlmag/img/pg_idea2.jpg);
  background-repeat: no-repeat;
  height: 150px;
}

#serendipity_banner h1 {
  margin-left: 140px;
  font-size: large;
  font-variant: small-caps;
  padding-top: 1em;
}

#serendipity_banner h2 {
  margin-left: 140px;
  font-size: small;
  border-bottom: 1px #999 dashed;
}

a.homelink1,
a.homelink1:hover,
a.homelink1:link,
a.homelink1:visited {
  color: #52654A;;
  text-decoration: none;
}

a.homelink2,
a.homelink2:hover,
a.homelink2:link,
a.homelink2:visited {
  color: #a62323;
  text-decoration: none;
}

/* Calendar */

table.serendipity_calendar a,
table.serendipity_calendar a:link,
table.serendipity_calendar a:visited {
  font-weight: bold;
  font-style: italic;
}

table.serendipity_calendar a:hover {
  background: #ccc;
  color: #003366;
}

table.serendipity_calendar td {
  font-size: x-small;
  padding: 0.2em;
  text-align: center;
}

td.serendipity_calendarHeader a,
td.serendipity_calendarHeader a:link,
td.serendipity_calendarHeader a:visited,
td.serendipity_calendarHeader a:hover {
  color: #003366;
  font-weight: bold;
  border: 0;
  background: white;
}

TD.serendipity_calendarDay.Today {
  color: white;
  font-weight: bolder;
  border: 0;
  background: #2F3A33;
}

/* Sidebars */

#serendipityLeftSideBar,
#serendipityRightSideBar {
  display: block;
  padding: 10px;
  width: 11em;
  background-color: #E2E7E2;
  vertical-align: top;
}

.serendipitySideBarTitle {
  font-size: x-small;
  color: #2F3A33;
  font-weight: bolder;
  line-height: 140%;
  padding: 0.2em;
  padding-left: 1em;
  letter-spacing: 0.2em;
  padding-bottom: 0;
}

#serendipityRightSideBar * .serendipitySideBarTitle {
  border-left: 1px #666 dashed;
}

#serendipityLeftSideBar * .serendipitySideBarTitle {
  border-right: 1px #666 dashed;
}

div.serendipitySideBarItem {
  margin-bottom: 1em;
  padding-bottom: 1em;
}

.serendipitySideBarContent {
  color: #333;
  border-top: 1px #666 dashed;
  font-size: x-small;
  padding-top: 0.5em;
  padding-left: 1em;
  padding-right: 1em;
}

#serendipityRightSideBar * .serendipitySideBarContent {
  border-right: 1px #666 dashed;
}

#serendipityLeftSideBar * .serendipitySideBarContent {
  border-left: 1px #666 dashed;
}

/* Entries */

div.serendipity_Entry_Date {
  padding-left: 1em;
}

.serendipity_date {
  color: #999;
  font-size: small;
  font-weight: bold;
  text-transform: lowercase;
  margin-bottom: 0.7em;
  border-bottom: 1px #999 dashed;
  text-align: right;

  background-image: url(templates/postgresqlmag/img/clock_face_messy_paint_runs.jpg);
  background-repeat: no-repeat;
  background-position: bottom right;
  height: 21px;
  padding-right: 60px;
  vertical-align: bottom;
}

.serendipity_title,
.serendipity_Admin_title {
  padding-bottom: 0.7em;
  font-size: 1.02em;
  font-weight: bold;
  text-transform: uppercase;
}

.serendipity_title a,
.serendipity_title a:hover,
.serendipity_title a:link,
.serendipity_title a:visited,
.serendipity_Admin_title a,
.serendipity_Admin_title a:hover,
.serendipity_Admin_title a:link,
.serendipity_Admin_title a:visited {
  color: #0263A7;
  text-decoration: none;
}

.serendipity_entry,
.serendipity_admin {
  font-size: small;
  font-weight: normal;
  line-height: 140%;
  padding-left: 1em;
}

div.serendipity_entryFooter {
  padding-top: 1em;
  margin-bottom: 1em;
  clear: both;
  font-size: x-small;
}

/* Comments */

.serendipity_comment {
  border-left: double #999 thick;
  font-size: small;
  margin-left: 10px;
  margin-right: 10px;
  margin-top: 1em;
  padding: 3px;
  padding-bottom: 0;
  overflow: auto;
}

.serendipity_commentBody {
  padding-bottom: 1em;
}

.serendipity_commentsLabel {
  font-size: small;
}

.serendipity_commentsTitle {
  font-size: medium;
  font-weight: bold;
  text-transform: uppercase;
}

/* Admin */

.serendipity_admin td {
}

/* Misc */

#content {
  width: 100%;
}

/** Embedded images with the s9y image manager **/
.serendipity_imageComment_center,
.serendipity_imageComment_left,
.serendipity_imageComment_right {
    border: 1px solid black;
    background-color: #EFEFEF;
    margin: 3px;
}

.serendipity_imageComment_center {
    margin: 0px;
}

.serendipity_imageComment_left {
    float: left;
}

.serendipity_imageComment_right {
    float: right;
}

.serendipity_imageComment_img,
.serendipity_imageComment_img img {
    margin: 0px;
    padding: 0px;
    border: 0px;
    text-align: center;
}

.serendipity_imageComment_txt {
    margin: 0px;
    padding: 3px;
    clear: both;
    font-size: 9pt;
    text-align: center;
}

img.serendipity_entryIcon {
    float: right;
    border: 0px;
    padding: 0.3em;
}

.serendipity_admin_list_item_even {
}

.serendipity_admin_list_item_uneven {
    background-color: #eee;
}

.serendipity_admin_filters {
    border: 1px dashed;
    background-color: #FFFFFF;
    font-size: 10px;
    margin-bottom: 10px;
    padding: 2px;
}

.serendipity_admin_filters_headline {
    border-bottom: 1px solid;
}

.serendipity_admin_sortorder {
    font-size: 10px;
    text-align: center;
}

.serendipity_admin_sortorder input,
.serendipity_admin_sortorder select,
.serendipity_admin_filters input,
.serendipity_admin_filters select {
    font-size: 10px;
}

.serendipity_comments {
}

.serendipity_center {
    margin-left: auto;
    margin-right: auto;
    text-align: center;
}

.serendipity_msg_important {
    color: red;
}

.serendipity_msg_notice {
    color: green;
}

.serendipity_entry_author_self {
}

.serendipity_comment_author_self {
  border-left: double #669999 thick;
  color: #669999;
}




/* nl2br plugin start */

p.whiteline {
    margin-top: 0em;
    margin-bottom: 1em;
}

p.break {
    margin-top: 0em;
    margin-bottom: 0em;
}

/* nl2br plugin end */


/* auto include  */

