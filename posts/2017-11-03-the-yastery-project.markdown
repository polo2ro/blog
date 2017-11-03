My latest development project is a website linking influencers and brands or agencies.
This is [yastery.com](https://www.yastery.com). With a blank page start, I made some interesting technical choices:

## Full typescript

the frontend is powered by angular 4 so this is a logical choice. to use the same language everywhere i used typescript with nodejs on the backend. Unit tests on the backend are also in typescript with the help of [ava](https://github.com/avajs/ava) for more speed.

For development, there is one config file to compile the project excluding node_modules and for production, another config file exclude the `spec/` subfolder.

I am satisfied with this setup, code get very similar especially for the interfaces, i can copy/paste the fields on update.

## Split front and back in two repositories

frontend code and backend code are stored in separated repositories. This is not very important in everyday life but allows in the future to put different access rights on the repositories for future involved developers.

## websockets everywhere

I made my weapons with websocket on this project, I admit that it's quite powerful. User get notified about new messages in internal messageboard without refreshing the page. A websocket connexion is open after login. This method is made possible by the usage of a single page application.
I literally piped [socket.io](https://socket.io/) client into the [Subject rxjs class](http://reactivex.io/rxjs/class/es6/Subject.js~Subject.html). This technique makes accessible websocket connections everywhere in the application.

More infos on the `Subject` class [here](https://xgrommx.github.io/rx-book/content/getting_started_with_rxjs/subjects.html)
