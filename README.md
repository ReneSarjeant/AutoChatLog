# AutoChatLog

**Automatically enable `/chatlog` every time you log into World of Warcraft: Forever.**

A tiny, zero-configuration addon that turns on the built-in chat logging as soon as you enter the game world. No menus to click, no commands to remember.

---

## What it does

- On `PLAYER_LOGIN` / `PLAYER_ENTERING_WORLD` it checks whether chat logging is already active.
- If not, it calls `LoggingChat(true)` after a short 1-second delay (so the chat system is ready).
- Prints a green confirmation in chat:
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

3. Restart the game (or type `/reload` if already in-game).
4. On the character select screen, make sure **Auto Chat Log** is checked under AddOns.

---

## Slash Commands

| Command | Action |
|---------|--------|
| `/autochatlog` or `/acl` | Force-enable logging |
| `/acl off` | Disable logging |
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
- The log file is written by the game client to `Logs\WoWChatLog.txt` and is normally flushed on logout.
- If you also use chat addons (Forever Simple Chat, Prat, etc.), they keep their own history separately. This addon only controls the official client log.

---

## License

Public domain / free to use, modify, and redistribute.

---

**Author:** ReneSarjeant  
**Version:** 1.0
