# AutoChatLog

**Automatically enable `/chatlog` every time you log into World of Warcraft: Forever.**

A tiny, zero-configuration addon that turns on the built-in chat logging as soon as you enter the game world. No menus to click, no commands to remember.

---

## What it does

- On `PLAYER_ENTERING_WORLD` (login, UI reload, and zone transitions), it checks whether chat logging is already active.
- If not, it immediately calls `LoggingChat(true)`. There are no timers or startup delays.
- Prints a green confirmation when it turns logging on:
  ```
  Auto Chat Log: Chat logging enabled. Log file: Logs\WoWChatLog.txt
  ```
- The official log is still written by the game itself to:
  ```
  <WoW Forever client>\Logs\WoWChatLog.txt
  ```
  (updated on logout / UI reload).

It does **not** store its own chat history. It only toggles the client’s built-in logger.

---

## Installation

1. Download or clone this repository.
2. Copy the `AutoChatLog` folder into your WoW Forever `Interface\AddOns` directory.

   **Quick way to find the folder:**
   - Open the Battle.net app
   - Select **World of Warcraft: Forever**
   - Click the gear icon next to **Play** → **Show in Explorer**
   - Open the `Interface\AddOns` folder (create `Interface` and `AddOns` if they don’t exist)

3. Restart the game after installing. For updates to an already installed copy, type `/reload`.
4. On the character select screen, make sure **Auto Chat Log** is checked under AddOns.

---

## Slash Commands

| Command | Action |
|---------|--------|
| `/autochatlog` or `/acl` | Force-enable logging |
| `/acl status` | Show whether logging is currently on |

---

## File Structure

```
AutoChatLog/
├── AutoChatLog.toc
└── AutoChatLog.lua
```

---

## Compatibility

- Built for **World of Warcraft: Forever** (Interface 16001 / client 1.60.x).
- Uses only the standard `LoggingChat()` API and basic events.
- No dependencies.

---

## Notes

- Logging only captures messages **after** it is enabled for that session.
- No saved settings or addon database are used.
- To stop automatic logging, disable **Auto Chat Log** in the AddOns list and reload the UI, then use `/chatlog` to turn logging off if it is still active. `/acl` has no off command; any argument other than `status` enables logging.
- The log file is written by the game client to `Logs\WoWChatLog.txt` and is normally flushed on logout.
- If you also use chat addons (Forever Simple Chat, Prat, etc.), they keep their own history separately. This addon only controls the official client log.

---

## License

Public domain / free to use, modify, and redistribute.

---

**Author:** ReneSarjeant  
**Version:** 1.1
