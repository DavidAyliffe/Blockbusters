#!/usr/bin/env python3
"""Generate unique avatar PNGs for all customers using the DiceBear API."""

import csv
import os
import urllib.request
import urllib.parse
import hashlib

AVATAR_SIZE = 256
OUTPUT_DIR = os.path.join(os.path.dirname(os.path.abspath(__file__)), "avatars")
CSV_PATH = "/Users/Dayliffe/Downloads/Untitled.csv"
STYLE = "personas"


def title_case(s):
    return s.strip().capitalize()


def make_seed(first, last, sex):
    """Create a deterministic seed so the same person always gets the same avatar."""
    return hashlib.md5(f"{first}:{last}:{sex}".encode()).hexdigest()[:12]


def download_avatar(first_name, last_name, sex, filepath):
    seed = make_seed(first_name, last_name, sex)

    params = {
        "seed": seed,
        "size": AVATAR_SIZE,
        "backgroundColor": "e8f4f8",
        "radius": 50,
    }

    query = urllib.parse.urlencode(params)
    url = f"https://api.dicebear.com/9.x/{STYLE}/png?{query}"

    req = urllib.request.Request(url, headers={"User-Agent": "Blockbusters-Avatar-Generator/1.0"})
    with urllib.request.urlopen(req, timeout=30) as resp:
        with open(filepath, "wb") as f:
            f.write(resp.read())


def main():
    os.makedirs(OUTPUT_DIR, exist_ok=True)

    with open(CSV_PATH, newline="", encoding="utf-8") as f:
        reader = csv.DictReader(f)
        rows = list(reader)

    total = len(rows)
    print(f"Generating {total} avatars using DiceBear ({STYLE} style)...\n")

    for i, row in enumerate(rows, 1):
        first = row["first_name"].strip()
        last = row["last_name"].strip()
        sex = row["sex"].strip()

        filename = f"{title_case(first)}_{title_case(last)}.png"
        filepath = os.path.join(OUTPUT_DIR, filename)

        # Skip if already generated (resume-friendly)
        if os.path.exists(filepath) and os.path.getsize(filepath) > 0:
            print(f"  [{i}/{total}] {title_case(first)} {title_case(last)} — already exists, skipping")
            continue

        try:
            download_avatar(first, last, sex, filepath)
            print(f"  [{i}/{total}] {title_case(first)} {title_case(last)} ✓")
        except Exception as e:
            print(f"  [{i}/{total}] {title_case(first)} {title_case(last)} ✗ Error: {e}")

    print(f"\nDone! Avatars saved to: {OUTPUT_DIR}")


if __name__ == "__main__":
    main()
