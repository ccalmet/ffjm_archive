from pathlib import Path
import tomllib
import re

required = [
    "main.typ",
    "meta.toml",
    "enonce.typ",
    "solution.typ",
    "explication.typ",
]

required_tags = [
    "themes",
    "notions",
    "techniques",
    "niveau",
]

allowed_asset_types = [
    "image",
    "cetz",
    "typst",
]

tag_pattern = re.compile(r"^[a-z0-9_]+$")
figure_id_pattern = re.compile(r"^F[ESX][0-9]{2}$")
figure_call_pattern = re.compile(r'#figure\("([A-Z0-9]+)"\)')

base = Path("data/2025/QF")

invalid_exercises = []

print("\nValidation des exercices")

for exo in sorted(base.iterdir()):

    if not exo.is_dir():
        continue

    print(f"\n=== {exo.name} ===")

    ok = True

    for f in required:

        path = exo / f

        if path.exists():
            print(f"OK        {f}")
        else:
            print(f"MISSING   {f}")
            ok = False

    meta_path = exo / "meta.toml"

    if meta_path.exists():

        with open(meta_path, "rb") as file:
            meta = tomllib.load(file)

        print("Tags :")

        for tag_group in required_tags:

            if tag_group in meta["tags"]:

                print(f"OK        {tag_group}")

                values = meta["tags"][tag_group]

                for value in values:

                    if tag_pattern.match(value):
                        print(f"OK        tag '{value}'")
                    else:
                        print(f"INVALID   tag '{value}'")
                        ok = False

            else:
                print(f"MISSING   {tag_group}")
                ok = False

        print("Assets :")

        declared_ids = set()

        if "assets" in meta and "figures" in meta["assets"]:

            ids_seen = set()

            for fig in meta["assets"]["figures"]:

                if "id" not in fig:
                    print("MISSING   figure id")
                    ok = False
                    continue

                fig_id = fig["id"]

                declared_ids.add(fig_id)

                if figure_id_pattern.match(fig_id):
                    print(f"OK        figure id '{fig_id}'")
                else:
                    print(f"INVALID   figure id '{fig_id}'")
                    ok = False

                if fig_id in ids_seen:
                    print(f"DUPLICATE figure id '{fig_id}'")
                    ok = False
                else:
                    ids_seen.add(fig_id)

                if "type" not in fig:
                    print(f"MISSING   type for '{fig_id}'")
                    ok = False
                else:

                    fig_type = fig["type"]

                    if fig_type in allowed_asset_types:
                        print(f"OK        type '{fig_type}'")
                    else:
                        print(f"INVALID   type '{fig_type}'")
                        ok = False

                if "fichier" not in fig:
                    print(f"MISSING   fichier for '{fig_id}'")
                    ok = False
                else:

                    filename = fig["fichier"]

                    asset_path = exo / "assets" / filename

                    if asset_path.exists():
                        print(f"OK        asset '{filename}'")
                    else:
                        print(f"MISSING   asset '{filename}'")
                        ok = False

        print("Figure references :")

        typ_files = [
            "enonce.typ",
            "solution.typ",
            "explication.typ",
        ]

        used_refs = set()

        for typ_file in typ_files:

            path = exo / typ_file

            with open(path, "r", encoding="utf-8") as file:
                lines = file.readlines()

            refs = []

            for line in lines:

                stripped = line.strip()

                if stripped.startswith("//"):
                    continue

                refs.extend(figure_call_pattern.findall(line))

            for ref in refs:

                used_refs.add(ref)

                if ref in declared_ids:
                    print(f"OK        reference '{ref}' in {typ_file}")
                else:
                    print(f"MISSING   reference '{ref}' in TOML")
                    ok = False

        for fig_id in declared_ids:

            if fig_id not in used_refs:
                print(f"UNUSED    figure '{fig_id}' declared in TOML")
                ok = False

    if ok:
        print("VALID")
    else:
        print("INVALID")
        invalid_exercises.append(exo.name)

print("\n====================")

if len(invalid_exercises) == 0:

    print("GLOBAL : VALID")

else:

    print("GLOBAL : INVALID")
    print("\nInvalid exercises :")

    for exo in invalid_exercises:
        print(f"- {exo}")