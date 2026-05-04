# Firebase Hosting Setup for Account Deletion Page

## Step 1: Initialize Firebase Hosting

```bash
firebase init hosting
```

**Select:**
- What do you want to use as your public directory? → `public`
- Configure as a single-page app? → `No`
- Set up automatic builds? → `No`

## Step 2: Create public folder and copy files

```bash
# Create public folder
mkdir public

# Copy account deletion page
copy docs\account-deletion.html public\account-deletion.html

# Create index.html (optional - redirects to app)
```

## Step 3: Create index.html (Optional)

Create `public/index.html`:

```html
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Ethio Events</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            text-align: center;
            padding: 50px;
        }
        .button {
            display: inline-block;
            background-color: #1976d2;
            color: white;
            padding: 15px 30px;
            text-decoration: none;
            border-radius: 5px;
            margin: 10px;
        }
    </style>
</head>
<body>
    <h1>Ethio Events</h1>
    <p>Your event management platform</p>
    <a href="account-deletion.html" class="button">Account Deletion</a>
</body>
</html>
```

## Step 4: Deploy to Firebase

```bash
firebase deploy --only hosting
```

## Step 5: Get Your URL

After deployment, you'll see:
```
✔  Deploy complete!

Project Console: https://console.firebase.google.com/project/eventhub-d5812/overview
Hosting URL: https://eventhub-d5812.web.app
```

## Your URLs:

- **Main site:** https://eventhub-d5812.web.app
- **Account deletion:** https://eventhub-d5812.web.app/account-deletion.html

## Step 6: Provide to Google Play Store

In the Play Console, enter:
```
https://eventhub-d5812.web.app/account-deletion.html
```

## Troubleshooting

If `firebase` command not found:
```bash
npm install -g firebase-tools
firebase login
```

## Update Later

To update the page:
1. Edit `public/account-deletion.html`
2. Run `firebase deploy --only hosting`
3. Changes live in seconds!
