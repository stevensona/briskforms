# Brisk Forms

Free HTML form submission service for static sites. Keep your email address private. Hosted at [briskforms.com](http://briskforms.com/).

Submit your form to our URL and we'll forward the contents to your email. No database, no scripting, no cost! Ideal for people wishing to implement a contact form without exposing your email address on static sites such as those created with Jekyll, Pelican, or Hakyll.

## Why?

Similar services all have the same problem: Your email address is exposed to would-be spammers, unless you pay them. Brisk Forms side steps this issue by providing you with a unique and secure URL to use in place of your email address. You can even stop emails at any time with a click of a button.

## How?

Visit [briskforms.com](http://briskforms.com/new) and fill in the fields. Source URL is the URL of your page containing your form. It works best if you include just the base URL (for example 'mystaticsite.com' instead of 'http://www.mystaticsite.com/pages/contactme') The response email is the email address at which you'd like to receive responses and the address the confirmation email will be sent to. Submit Success URL is the URL your users will be forwarded to upon successful submission of your form and failure is similar. After clicking the Create button, you are provided with an Action URL. Just click the link in the confirmation email and copy the Action URL into your form's action attribute and you're off to the races. Make sure your form's elements 'name' attributes are specified as well. Example:

```
<form method="post" action="http://briskforms.com/go/<random unique code>">
  <label for="Name">Name:</label>
  <input type="text" name="Name" id="Name"/>
  <label for="Email">Email:</label>
  <input type="text" name="Email" id="Email" />
  <label for="Message">Message:</label><br />
  <textarea name="Message" rows="20" cols="20" id="Message"></textarea>
  <input type="submit" name="submit" value="Submit" class="submit-button" />
</form>
```
When the form is completed and submitted, the results of the form will be emailed to you, and your user will be forwarded to wherever you'd like.

## To host Brisk Forms yourself
Brisk Forms uses ENV variables to store credentials for Postgres (in production) and SendGrid.
```
git clone https://github.com/stevensona/briskforms
bundle install --without production
rake db:migrate
rails s
```
