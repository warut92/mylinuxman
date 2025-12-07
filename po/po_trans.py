import re
import sys
from googletrans import Translator

def translate_po_file(input_file, output_file, target_lang="th"):
    translator = Translator()
    
    with open(input_file, "r", encoding="utf-8") as f:
        po_lines = f.readlines()

    translated_lines = []
    for line in po_lines:
        match = re.match(r'^msgid "(.*)"$', line)
        if match:
            original_text = match.group(1)

            # Skip empty msgid
            if original_text.strip():
                try:
                    translation = translator.translate(original_text, dest=target_lang).text
                    translated_lines.append(line)  # Keep msgid
                    translated_lines.append(f'msgstr "{translation}"\n')
                    print(f"Translated: {original_text} -> {translation}")
                except Exception as e:
                    print(f"Error translating '{original_text}': {e}")
                    translated_lines.append(line)
                    translated_lines.append('msgstr ""\n')
            else:
                translated_lines.append(line)
        elif line.startswith("msgstr"):
            continue
        else:
            translated_lines.append(line)

    with open(output_file, "w", encoding="utf-8") as f:
        f.writelines(translated_lines)

    print(f"Translated PO file saved as: {output_file}")


if __name__ == "__main__":
    # ต้องมี 3 arguments: script + input_file + output_file
    if len(sys.argv) != 3:
        print("Usage: python3 translation.py <input.po> <output.po>")
        sys.exit(1)

    input_path = sys.argv[1]
    output_path = sys.argv[2]

    translate_po_file(input_path, output_path, "th")
