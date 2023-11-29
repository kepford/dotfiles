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
local agenda = function() return {vim.cmd(":r ! gcalcli --nocolor agenda 7am 5pm --nodeclined --no-military --calendar=bkepford@redhat.com | sed '/^$/d' | cut -c 13- | sed 's/^/* /'")} end

-- ${3:`gcalcli --nocolor agenda 7am 5pm --nodeclined --no-military --calendar=bkepford@redhat.com | sed '/^$/d' | cut -c 13- | sed 's/^/* /'`}

ls.add_snippets(nil, {
  all = {
    snip({
      trig = "date",
      namr = "Date",
      dscr = "Date in the form of YYYY-MM-DD",
    }, {
      func(date, {}),
    }),
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
      ""}), func(agenda, {}), text({"",
      ""}), text({"",
      "## Projects"}), text({"",
      ""}), text({"",
      "### RHPT"}), text({"",
      ""}), text({"",
      "- [ ] [Check RHPT Dashboard](https://rhcorporate.splunkcloud.com/en-US/app/search/Product_Trials__General?form.time.earliest=-24h%40h&form.time.latest=now&form.env=production&form.withInsomnia=no)"}), text({"",
      "- [ ] [RHPT: NOT RHEL Failed Download Not Accepted Terms](https://red-hat-it.sentry.io/discover/results/?environment=production&id=22077&project=6728220&statsPeriod=7d)"}), text({"",
      "  * https://red-hat-it.sentry.io/alerts/rules/details/171478/"}), text({"",
      "- [ ] [RHPT: RHEL Failed Download Not Accepted Terms](https://red-hat-it.sentry.io/discover/results/?environment=production&id=24276&project=6728220&statsPeriod=7d)"}), text({"",
      "  * https://red-hat-it.sentry.io/alerts/rules/details/171479/"}), text({"",
      ""}), text({"",
      "### Sentry"}), text({"",
      ""}), text({"",
      "## CE / TIL", ""}),
      insert(0)
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

