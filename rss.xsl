<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet
    version="1.0"
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:atom="http://www.w3.org/2005/Atom"
    exclude-result-prefixes="atom"
>
    <xsl:output method="html" encoding="UTF-8" doctype-system="about:legacy-compat" />

    <xsl:template match="/">
        <html lang="zh-CN">
            <head>
                <meta charset="UTF-8" />
                <meta name="viewport" content="width=device-width, initial-scale=1" />
                <meta name="color-scheme" content="dark light" />
                <title><xsl:value-of select="rss/channel/title" /> · RSS</title>
                <style>
                    @font-face {
                        font-family: "Nomad Field Serif CN";
                        src: url("fonts/nomad-field-serif-cn-subset.woff2") format("woff2");
                        font-display: swap;
                    }

                    @font-face {
                        font-family: "Nomad Field Sans CN";
                        src: url("fonts/nomad-field-sans-cn-subset.woff2") format("woff2");
                        font-display: swap;
                    }

                    @font-face {
                        font-family: "Barlow Condensed";
                        src: url("fonts/barlow-condensed-600.woff2") format("woff2");
                        font-style: normal;
                        font-weight: 600;
                        font-display: swap;
                    }

                    @font-face {
                        font-family: "IBM Plex Mono";
                        src: url("fonts/ibm-plex-mono-400.woff2") format("woff2");
                        font-style: normal;
                        font-weight: 400;
                        font-display: swap;
                    }

                    :root {
                        color-scheme: dark light;
                        --canvas: #0b0c0e;
                        --surface: #17191c;
                        --text: #e8e3d9;
                        --muted: #8a8d91;
                        --red: #b64035;
                        --brass: #b29a60;
                        --rule: rgba(232, 227, 217, 0.19);
                        --rule-strong: rgba(232, 227, 217, 0.34);
                    }

                    * {
                        box-sizing: border-box;
                    }

                    html {
                        min-width: 20rem;
                        background: var(--canvas);
                    }

                    body {
                        margin: 0;
                        background: var(--canvas);
                        color: var(--text);
                        font-family: "Nomad Field Sans CN", system-ui, sans-serif;
                        line-height: 1.75;
                        text-rendering: optimizeLegibility;
                    }

                    a {
                        color: inherit;
                    }

                    a:focus-visible {
                        outline: 1px solid var(--brass);
                        outline-offset: 0.35rem;
                    }

                    .feed-shell {
                        width: min(100% - 3rem, 72rem);
                        margin-inline: auto;
                        padding-block: 1.25rem 6rem;
                    }

                    .site-rail {
                        display: flex;
                        align-items: center;
                        justify-content: space-between;
                        min-height: 3.5rem;
                        border-bottom: 1px solid var(--rule);
                        font-family: "IBM Plex Mono", monospace;
                        font-size: 0.72rem;
                        letter-spacing: 0.16em;
                        text-transform: uppercase;
                    }

                    .site-rail__identity {
                        color: var(--text);
                    }

                    .site-rail__state {
                        color: var(--muted);
                    }

                    .feed-header {
                        display: grid;
                        grid-template-columns: minmax(0, 7fr) minmax(17rem, 4fr);
                        gap: clamp(3rem, 8vw, 8rem);
                        padding-block: clamp(4.5rem, 10vw, 8rem) clamp(4rem, 8vw, 6.5rem);
                    }

                    .eyebrow,
                    .feed-header__count,
                    .record__folio,
                    .record__date,
                    .feed-address__label {
                        font-family: "IBM Plex Mono", monospace;
                        text-transform: uppercase;
                    }

                    .eyebrow {
                        margin: 0 0 1.3rem;
                        color: var(--brass);
                        font-size: 0.72rem;
                        letter-spacing: 0.19em;
                    }

                    h1 {
                        max-width: 8ch;
                        margin: 0;
                        font-family: "Nomad Field Serif CN", serif;
                        font-size: clamp(4.5rem, 10vw, 8rem);
                        font-weight: 400;
                        letter-spacing: -0.055em;
                        line-height: 0.92;
                    }

                    .feed-header__statement {
                        max-width: 19rem;
                        margin: 1.75rem 0 0;
                        color: var(--muted);
                        font-family: "Barlow Condensed", sans-serif;
                        font-size: clamp(1.1rem, 2vw, 1.35rem);
                        letter-spacing: 0.1em;
                        line-height: 1.3;
                        text-transform: uppercase;
                    }

                    .feed-header__guide {
                        align-self: end;
                    }

                    .feed-header__guide p {
                        margin: 0;
                        color: var(--muted);
                        font-size: 0.98rem;
                    }

                    .feed-header__count {
                        display: block;
                        margin-bottom: 1.35rem;
                        color: var(--text);
                        font-size: 0.76rem;
                        letter-spacing: 0.12em;
                    }

                    .feed-address {
                        margin-top: 1.6rem;
                        padding-top: 1rem;
                        border-top: 1px solid var(--rule);
                    }

                    .feed-address__label {
                        display: block;
                        margin-bottom: 0.45rem;
                        color: var(--brass);
                        font-size: 0.66rem;
                        letter-spacing: 0.12em;
                    }

                    .feed-address code {
                        display: block;
                        overflow-wrap: anywhere;
                        color: var(--text);
                        font-family: "IBM Plex Mono", monospace;
                        font-size: 0.75rem;
                        line-height: 1.55;
                    }

                    .feed-address__return {
                        display: inline-block;
                        margin-top: 1.2rem;
                        color: var(--text);
                        font-family: "IBM Plex Mono", monospace;
                        font-size: 0.74rem;
                        letter-spacing: 0.07em;
                        text-decoration-color: var(--red);
                        text-decoration-thickness: 1px;
                        text-underline-offset: 0.35rem;
                    }

                    .records {
                        position: relative;
                        margin: 0;
                        padding: 0;
                        border-top: 1px solid var(--rule-strong);
                        list-style: none;
                    }

                    .records::before {
                        position: absolute;
                        top: -1px;
                        left: 0;
                        width: 3.25rem;
                        height: 1px;
                        background: var(--red);
                        content: "";
                    }

                    .record {
                        display: grid;
                        grid-template-columns: 4rem minmax(9rem, 2.2fr) minmax(0, 7fr);
                        gap: clamp(1rem, 3vw, 3rem);
                        align-items: baseline;
                        padding-block: clamp(1.75rem, 4vw, 2.8rem);
                        border-bottom: 1px solid var(--rule);
                    }

                    .record__folio {
                        color: var(--muted);
                        font-family: "Barlow Condensed", sans-serif;
                        font-size: 1.15rem;
                        font-weight: 600;
                        letter-spacing: 0.05em;
                    }

                    .record__date {
                        color: var(--brass);
                        font-size: 0.72rem;
                        letter-spacing: 0.08em;
                    }

                    .record__title {
                        margin: 0;
                        font-family: "Nomad Field Serif CN", serif;
                        font-size: clamp(1.35rem, 2.5vw, 2rem);
                        font-weight: 400;
                        line-height: 1.35;
                    }

                    .record__title a {
                        text-decoration: none;
                        text-decoration-thickness: 1px;
                        text-underline-offset: 0.35rem;
                    }

                    .record__title a:hover {
                        color: var(--text);
                        text-decoration: underline;
                        text-decoration-color: var(--red);
                    }

                    .feed-footer {
                        display: flex;
                        justify-content: space-between;
                        gap: 2rem;
                        padding-top: 2rem;
                        color: var(--muted);
                        font-family: "IBM Plex Mono", monospace;
                        font-size: 0.68rem;
                        letter-spacing: 0.08em;
                        text-transform: uppercase;
                    }

                    @media (prefers-color-scheme: light) {
                        :root {
                            --canvas: #e8e3d9;
                            --surface: #d8d2c7;
                            --text: #17191c;
                            --muted: #5e6063;
                            --red: #9d3028;
                            --brass: #725f30;
                            --rule: rgba(23, 25, 28, 0.2);
                            --rule-strong: rgba(23, 25, 28, 0.36);
                        }
                    }

                    @media (max-width: 48rem) {
                        .feed-shell {
                            width: min(100% - 2rem, 42rem);
                            padding-bottom: 4rem;
                        }

                        .feed-header {
                            grid-template-columns: 1fr;
                            gap: 3.25rem;
                            padding-block: 4rem 3.75rem;
                        }

                        h1 {
                            font-size: clamp(4rem, 23vw, 6.5rem);
                        }

                        .feed-header__guide {
                            max-width: 32rem;
                        }

                        .record {
                            grid-template-columns: 3rem minmax(0, 1fr);
                            gap: 0.45rem 1rem;
                            padding-block: 1.75rem;
                        }

                        .record__date {
                            align-self: center;
                        }

                        .record__title {
                            grid-column: 1 / -1;
                            margin-top: 0.65rem;
                            font-size: clamp(1.35rem, 7vw, 1.8rem);
                        }

                        .feed-footer {
                            flex-direction: column;
                            gap: 0.45rem;
                        }
                    }

                    @media (prefers-reduced-motion: reduce) {
                        *,
                        *::before,
                        *::after {
                            scroll-behavior: auto !important;
                        }
                    }
                </style>
            </head>
            <body>
                <main class="feed-shell">
                    <header class="site-rail">
                        <span class="site-rail__identity">NJ / FIELD NOTES</span>
                        <span class="site-rail__state">RSS 2.0</span>
                    </header>

                    <section class="feed-header" aria-labelledby="feed-title">
                        <div>
                            <p class="eyebrow">FIELD TRANSMISSION / RSS</p>
                            <h1 id="feed-title">订阅源</h1>
                            <p class="feed-header__statement">FIELD NOTES FROM THE LONG ASCENT</p>
                        </div>
                        <div class="feed-header__guide">
                            <span class="feed-header__count">
                                <xsl:value-of select="format-number(count(rss/channel/item), '00')" /> FIELD RECORDS
                            </span>
                            <p>这是 NomadJoe 的 RSS 订阅源。将下方地址添加到你的 RSS 阅读器，即可持续接收新的现场笔记。</p>
                            <div class="feed-address">
                                <span class="feed-address__label">FEED ADDRESS</span>
                                <code><xsl:value-of select="rss/channel/atom:link/@href" /></code>
                                <a class="feed-address__return" href="{rss/channel/link}">返回网站 ↗</a>
                            </div>
                        </div>
                    </section>

                    <ol class="records" aria-label="最新订阅条目">
                        <xsl:for-each select="rss/channel/item">
                            <li class="record">
                                <span class="record__folio"><xsl:value-of select="format-number(position(), '00')" /></span>
                                <time class="record__date"><xsl:value-of select="substring(pubDate, 6, 11)" /></time>
                                <h2 class="record__title">
                                    <a href="{link}"><xsl:value-of select="title" /></a>
                                </h2>
                            </li>
                        </xsl:for-each>
                    </ol>

                    <footer class="feed-footer">
                        <span><xsl:value-of select="rss/channel/title" /></span>
                        <span>XML / SYNDICATION CHANNEL</span>
                    </footer>
                </main>
            </body>
        </html>
    </xsl:template>
</xsl:stylesheet>
