import re
from googletrans import Translator

def translate_po_file(input_file, output_file, target_lang="th"):
    translator = Translator()
    
    with open(input_file, "r", encoding="utf-8") as f:
        po_lines = f.readlines()

    translated_lines = []
    for i, line in enumerate(po_lines):
        match = re.match(r'^msgid "(.*)"$', line)
        if match:
            original_text = match.group(1)
            
            # Skip empty msgid
            if original_text.strip():
                try:
                    translation = translator.translate(original_text, dest=target_lang).text
                    translated_lines.append(line)  # Keep msgid as it is
                    translated_lines.append(f'msgstr "{translation}"\n')  # Add translation
                    print(f"Translated: {original_text} -> {translation}")
                except Exception as e:
                    print(f"Error translating '{original_text}': {e}")
                    translated_lines.append(line)
                    translated_lines.append('msgstr ""\n')  # Keep empty msgstr if translation fails
            else:
                translated_lines.append(line)  # Keep empty msgid
        elif line.startswith("msgstr"):  
            continue  # Skip existing msgstr lines, since we add new ones
        else:
            translated_lines.append(line)

    with open(output_file, "w", encoding="utf-8") as f:
        f.writelines(translated_lines)

    print(f"Translated PO file saved as {output_file}")

# Example usage: Translate to Esperanto
translate_po_file("TMPL.po", "messages_translated.po", "th")

