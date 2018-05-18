# Traveller

This is a script for an OC Transpo GPS bus scheduler for your MAC OS X menu bar.

# Setup

## BitBar

1. Install [BitBar](https://github.com/matryer/bitbar) on your computer.

2. Make sure that the file `oc-transpo-gps-bus-tracker.rb` is in your BitBar plugin folder.
3. If the script does not run and provides the error: `launch path not accessible`, make sure to run the following in a terminal:

```
chmod +x ~/this/is/an/example/directory/path/to/my/file.rb
```

4. See changes by hitting `command + R` or `⌘R` to refresh all plugins.


## OC Transpo API

1. [Register for the OC Transpo API](https://octranspo-new.3scale.net/signup).

2. Navigate to the [Applications](https://octranspo-new.3scale.net/admin/applications) page.

3. Create a new application.

4. You should now have your own appication ID and key that you can input into the script [here](https://github.com/LauraAubin/Traveller/blob/master/oc-transpo-gps-bus-tracker.rb#L6-L7).

Note that the API is limited to `10,000` calls per day.

## Modifying the script [WIP]

- Correct folder
- Where to put API ID/key
- Bus routes
