import sys, tempfile, os.path, subprocess

GROK_COMMAND = ["java", "-classpath", "src", "ca.uwaterloo.cs.jgrok.Main"]

with tempfile.TemporaryDirectory() as tmpdir:
    ta_file = sys.argv[1]
    list_rels_name = os.path.join(tmpdir, "list_rels.ql")
    with open(list_rels_name, "w") as f:
        f.write(f"""
getta("{ta_file}")
list()
""")
    rels = (subprocess.check_output(GROK_COMMAND + [list_rels_name])
        .decode()
        .split('\n')[2:-1])
    
    dump_rels_name = os.path.join(tmpdir, "dump_rels.ql")
    with open(dump_rels_name, "w") as f:
        f.write(f'getta("{ta_file}")\n')
        for rel in rels:
            f.write(f"""
for domItem in dom {rel} {{
    for rngItem in ({{ domItem }} . {rel}) {{
        print "{rel}####"+domItem+"####"+rngItem
    }}
}}
""")
    triples = (subprocess.check_output(GROK_COMMAND + [dump_rels_name])
        .decode()
        .split('\n')[:-1])
    for triple in triples:
        rel, l, r = triple.split("####")
        rel = rel.replace("$", "").replace("@", "").lower()
        l = l.replace('"', "")
        r = r.replace('"', "")
        print(f'{rel}("{l}", "{r}").')

