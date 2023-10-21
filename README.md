# Instructions

Simply have to add the following line on .rtorrent.rc file

`method.set_key = event.download.finished, archiving,"execute={/path/copydl.sh,$d.name=,$d.base_path=}"`

# For using with telegram-upload command without the API method

`pip3 install telegram-upload`

Then need to configure teleram-upload with telegram api id, api hash and authentication token.
