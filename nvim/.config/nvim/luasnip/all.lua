local ls = require("luasnip")
-- some shorthands...
local snip = ls.snippet
local node = ls.snippet_node
local text = ls.text_node
local insert = ls.insert_node
local func = ls.function_node
local choice = ls.choice_node
local dynamicn = ls.dynamic_node

local date = function() return {os.date('%Y-%m-%d')} end

ls.add_snippets(nil, {
  all = {
    snip({
      trig = "wlt",
      namr = "worklogtemplate",
      dscr = "Worklog template"
    },
    {
      text({"# Work log "}), func(date, {}), text({"",
      ""}), text({"",
      "## General"}), text({"",
      ""}), text({"",
      ""}), insert(0), text({"",
      ""}), text({"",
      "## Projects"}), text({"",
      ""}), text({"",
      "### Legal"}), text({"",
      ""}), text({"",
      "[Jira Board](https://issues.redhat.com/secure/RapidBoard.jspa?rapidView=12488#)"}), text({"",
      ""}), text({"",
      "## CE / TIL", ""}),
    }),
    snip({
      trig = "meta",
      namr = "Metadata",
      dscr = "Yaml metadata format for markdown"
    },
    {
      text({"---",
      "title: "}), insert(1, "note_title"), text({"", 
      "author: "}), insert(2, "author"), text({"", 
      "date: "}), func(date, {}), text({"",
      "categories: ["}), insert(3, ""), text({"]",
      "lastmod: "}), func(date, {}), text({"",
      "tags: ["}), insert(4), text({"]",
      "comments: true",
      "---", ""}),
      insert(0)
    }),
  },
})

