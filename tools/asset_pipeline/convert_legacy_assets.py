#!/usr/bin/env python3
"""Convert supported legacy image payloads into canonical PNG files."""
from pathlib import Path
import argparse
from PIL import Image


def main():
    parser = argparse.ArgumentParser()
    parser.add_argument('--source', required=True)
    parser.add_argument('--target', required=True)
    args = parser.parse_args()
    source = Path(args.source)
    target = Path(args.target)
    failures = []
    converted = 0
    for path in sorted(source.rglob('*')):
        if not path.is_file() or path.suffix.lower() not in {'.png', '.img', '.jpg', '.jpeg', '.webp'}:
            continue
        output = target / path.relative_to(source).with_suffix('.png')
        output.parent.mkdir(parents=True, exist_ok=True)
        try:
            with Image.open(path) as image:
                image.convert('RGBA').save(output)
            converted += 1
        except Exception as error:
            failures.append(f'{path}: {error}')
    print(f'converted={converted} failed={len(failures)}')
    if failures:
        (target / 'conversion_failures.txt').write_text('\n'.join(failures), encoding='utf-8')


if __name__ == '__main__':
    main()
