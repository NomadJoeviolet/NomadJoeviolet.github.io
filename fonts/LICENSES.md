# Self-hosted font notices

All font files in this directory are distributed under the SIL Open Font License 1.1. The corresponding upstream license texts are bundled beside this file.

## Shipped files

| Shipped file | CSS family | Weight | Upstream/version | Source | Size |
| --- | --- | ---: | --- | --- | ---: |
| `barlow-condensed-600.woff2` | Barlow Condensed | 600 | Google Fonts distribution revision v13 | [official WOFF2](https://fonts.gstatic.com/s/barlowcondensed/v13/HTxwL3I-JCGChYJ8VI-L6OO_au7B4873z3bWuQ.woff2) | 22,308 bytes |
| `barlow-condensed-700.woff2` | Barlow Condensed | 700 | Google Fonts distribution revision v13 | [official WOFF2](https://fonts.gstatic.com/s/barlowcondensed/v13/HTxwL3I-JCGChYJ8VI-L6OO_au7B46r2z3bWuQ.woff2) | 22,444 bytes |
| `ibm-plex-mono-400.woff2` | IBM Plex Mono | 400 | Google Fonts distribution revision v20 | [official WOFF2](https://fonts.gstatic.com/s/ibmplexmono/v20/-F63fjptAgt5VM-kVkqdyU8n1i8q1w.woff2) | 14,708 bytes |
| `ibm-plex-mono-500.woff2` | IBM Plex Mono | 500 | Google Fonts distribution revision v20 | [official WOFF2](https://fonts.gstatic.com/s/ibmplexmono/v20/-F6qfjptAgt5VM-kVkqdyU8n3twJwlBFgg.woff2) | 14,888 bytes |
| `nomad-field-sans-cn-subset.woff2` | Nomad Field Sans CN | variable 250–900 | Source Han Sans CN 2.005R | [Adobe source WOFF2](https://raw.githubusercontent.com/adobe-fonts/source-han-sans/2.005R/Variable/WOFF2/OTF/Subset/SourceHanSansCN-VF.otf.woff2) | 376,648 bytes |
| `nomad-field-serif-cn-subset.woff2` | Nomad Field Serif CN | variable 250–900 | Source Han Serif CN 2.003R | [Adobe source WOFF2](https://raw.githubusercontent.com/adobe-fonts/source-han-serif/2.003R/Variable/WOFF2/OTF/Subset/SourceHanSerifCN-VF.otf.woff2) | 477,624 bytes |

The Barlow copyright is held by The Barlow Project Authors. IBM Plex is copyright IBM Corp. and reserves the font name “Plex”. Source Han Sans and Source Han Serif are copyright Adobe and reserve the font name “Source”. See `OFL-Barlow.txt`, `OFL-IBM-Plex.txt`, `OFL-Source-Han-Sans.txt`, and `OFL-Source-Han-Serif.txt` for the complete notices and terms.

## Source Han subset and rename procedure

The two version-pinned Adobe variable WOFF2 sources were subset with fontTools/`pyftsubset` 4.55.3 and Brotli 1.0.9. The character set was assembled from the current `content/`, `layouts/`, `data/`, `i18n/`, and project `assets/` text sources plus `hugo.yaml`, printable ASCII, and common Chinese/technical punctuation. Layout features, name languages, glyph names, symbol/legacy cmaps, `.notdef`, and recommended glyphs were retained; WOFF2/Brotli output was requested. The temporary 7.99 MB and 10.42 MB upstream files were removed after subsetting and are not shipped.

Because subsetting creates a Modified Version and Adobe reserves “Source”, the internal family, full, typographic-family, unique, and PostScript names were rewritten with fontTools to `Nomad Field Sans CN` / `NomadFieldSansCN` and `Nomad Field Serif CN` / `NomadFieldSerifCN`. The final fonts contain 1,807 and 1,805 glyphs respectively and remain under OFL 1.1.

These CJK files intentionally cover the current site rather than every Han character. Future or unsupported glyphs fall through explicitly to installed `Source Han Sans SC`, `Noto Sans CJK SC`, `Source Han Serif SC`, `Noto Serif CJK SC`, and generic system families. Rebuild the subsets when current content gains missing characters; do not remove the system fallback chain.
