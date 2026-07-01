import re

path = r"E:\VFP\ERP_2\Forms\quotes.sc2"
with open(path, "r", encoding="cp1252", errors="replace") as f:
    text = f.read()

text = re.sub(
    r"(ADD OBJECT 'QUOTES\.chkTN' AS checkbox WITH ;.*?BackStyle = 1, ;\s+)Caption = \"[^\"]*\", ;",
    r'\1Caption = "", ;',
    text,
    count=1,
    flags=re.DOTALL,
)
text = re.sub(
    r"(Name = \"chkTN\", ;\s+SpecialEffect = 0, ;\s+Style = 1, ;\s+TabIndex = 46, ;\s+TabStop = \.F\., ;\s+)ToolTipText = \"[^\"]*\", ;",
    r'\1ToolTipText = "Use Trademark symbol - blue ring when True", ;',
    text,
    count=1,
)

needle = (
    '\t\tThisForm.cmdAutoName.Picture = "graphics\\strikthr.bmp"\n'
    "\t\tENDIF\n"
    "\t\t\n"
    "\t\t\n"
    '\t\tIF gcSalesP  = "*"'
)
repl = (
    '\t\tThisForm.cmdAutoName.Picture = "graphics\\strikthr.bmp"\n'
    "\t\tENDIF\n"
    "\t\t\n"
    "\t\tThis.chkTN.Caption = CHR(153)\n"
    '\t\tThis.chkTN.ToolTipText = "Use Trademark symbol "+CHR(153)+" - blue ring when True"\n'
    "\t\t\n"
    '\t\tIF gcSalesP  = "*"'
)
if needle not in text:
    raise SystemExit("Init insertion point not found")
text = text.replace(needle, repl, 1)

with open(path, "w", encoding="cp1252", newline="\r\n") as f:
    f.write(text)
print("quotes.sc2 chkTN fixed")
