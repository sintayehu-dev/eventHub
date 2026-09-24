# Ethio Events: icon list

Every icon the app uses today, grouped by purpose. Variants (outlined, rounded, filled) count as one icon, so you need one custom file per row. Tick each box as you collect the file.

Existing image assets in `assets/`: `logo.png` (launcher icon), `google.png` (Google sign-in button).

## File guidelines

- Format: SVG, 24×24 grid, one consistent stroke width, no fixed colours (the app sets the colour).
- Name: the concept name in the table, for example `home.svg`, `ticket.svg`.
- Navigation icons need two versions, `home.svg` (outline) and `home_filled.svg` (selected).
- Save into `assets/icons/`. The app has no SVG package yet (`flutter_svg` needs adding when the files are ready).

## Navigation bar

| Done | File | Used for |
|---|---|---|
| [ ] | home | Home tab (attendee and organizer) |
| [ ] | search | Search / Explore tab |
| [ ] | event | Events tab (organizer) |
| [ ] | ticket | Tickets tab (attendee) |
| [ ] | insights | Insights tab (organizer) |
| [ ] | person | Profile tab |
| [ ] | qr_scanner | Scan tab (staff) |

## Auth

| Done | File | Used for |
|---|---|---|
| [ ] | mail | Email field |
| [ ] | lock | Password field |
| [ ] | person | Full name field |
| [ ] | eye | Show password |
| [ ] | eye_off | Hide password |
| [ ] | arrow_forward | Button arrow |
| [ ] | arrow_back | Back button |
| [ ] | check | Checkbox, success |
| [ ] | explore | Onboarding page 1 |
| [ ] | qr_code | Onboarding page 2, Show QR |
| [ ] | celebration | Onboarding page 3, event image placeholder |
| [ ] | event_available | Onboarding chip |

## Events and tickets

| Done | File | Used for |
|---|---|---|
| [ ] | calendar | Date |
| [ ] | clock | Time |
| [ ] | location | Venue |
| [ ] | ticket | Ticket |
| [ ] | share | Share |
| [ ] | heart | Favourite (outline and filled) |
| [ ] | bookmark | Save event |
| [ ] | filter | Filters |
| [ ] | search_off | No search results |
| [ ] | event_busy | No events |
| [ ] | price_tag | Price |
| [ ] | payments | Money, revenue |
| [ ] | wallet | Payment method |
| [ ] | phone | Telebirr payment |

## Categories

| Done | File | Used for |
|---|---|---|
| [ ] | music | Music |
| [ ] | computer | Tech |
| [ ] | palette | Arts |
| [ ] | sports | Sports |
| [ ] | grid | All |

## Profile and settings

| Done | File | Used for |
|---|---|---|
| [ ] | edit | Edit |
| [ ] | dark_mode | Switch to dark |
| [ ] | light_mode | Switch to light |
| [ ] | bell | Notifications |
| [ ] | shield | Privacy and security |
| [ ] | privacy | Privacy policy |
| [ ] | document | Terms |
| [ ] | info | About, info |
| [ ] | help | Help and support |
| [ ] | card | Payment methods |
| [ ] | logout | Sign out |
| [ ] | delete | Delete |
| [ ] | chevron_right | List rows |
| [ ] | warning | Warnings |

## Actions and status

| Done | File | Used for |
|---|---|---|
| [ ] | add | Add |
| [ ] | remove | Remove |
| [ ] | close | Close |
| [ ] | refresh | Refresh |
| [ ] | check_circle | Success, confirmed |
| [ ] | cancel | Cancelled |
| [ ] | error | Error |
| [ ] | pending | Pending |
| [ ] | more_vertical | Menu (three dots) |
| [ ] | more_horizontal | Menu (three dots) |
| [ ] | chevron_down | Expand |
| [ ] | chevron_up | Collapse |
| [ ] | copy | Copy |
| [ ] | download | Download |
| [ ] | add_photo | Add banner image |
| [ ] | camera | Take photo |
| [ ] | gallery | Choose photo |
| [ ] | image | Image placeholder |

## Organizer

| Done | File | Used for |
|---|---|---|
| [ ] | analytics | Analytics |
| [ ] | trending_up | Trend up |
| [ ] | trending_down | Trend down |
| [ ] | people | Attendees |
| [ ] | campaign | Broadcast |
| [ ] | pdf | Export PDF |
| [ ] | table | Export table |
| [ ] | grid_view | Export grid |
| [ ] | money_off | Free tickets |
| [ ] | settings | Settings |

## Staff

| Done | File | Used for |
|---|---|---|
| [ ] | badge | Staff badge |
| [ ] | work | Work |
| [ ] | support_agent | Support |
| [ ] | assignment | Assignments |
| [ ] | dashboard | Dashboard |
| [ ] | block | Blocked |
| [ ] | timer | Timer |
| [ ] | chat | Message |
| [ ] | phone | Phone |

## Total

About 100 rows, roughly 70 distinct concepts once repeats are merged. Start with Navigation, Auth and Events and tickets, since those are the most visible.
