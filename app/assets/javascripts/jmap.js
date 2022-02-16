/*!
 * Jmap v0.0.1
 * https://github.com/yugokimura
 *
 * Copyright (c) 2020 Yugo Kimura
 * Released under the MIT license
 *
 * Date: 2020-04-01T12:23:34.356Z
 */
;
(function($) {

    // Identifiers
    var identifiers = [];
    var identifier = 0;
    var conf = {
        prefectures: [
            { code: 1, name: "北海道", full: "", alphabet: "Hokkaido", area8: 1, area11: 1, cordinate: { x: 41, y: 1, z: 29 }, size: { x: 14, y: 4 }, radius: [1, 1, 1, 0], box : { cordinate: { x: 32, y: 2 }, size : { x: 12, y: 3}} },
            { code: 2, name: "青森", full: "県", alphabet: "Aomori", area8: 2, area11: 2, cordinate: { x: 41, y: 5, z: 30 }, size: { x: 12, y: 2 }, radius: [0, 0, 0, 0] },
            { code: 3, name: "岩手", full: "県", alphabet: "Iwate", area8: 2, area11: 2, cordinate: { x: 47, y: 7, z: 33 }, size: { x: 6, y: 2 }, radius: [0, 0, 0, 0] },
            { code: 4, name: "宮城", full: "県", alphabet: "Miyagi", area8: 2, area11: 2, cordinate: { x: 47, y: 9, z: 34 }, size: { x: 6, y: 2 }, radius: [0, 0, 0, 0] },
            { code: 5, name: "秋田", full: "県", alphabet: "Akita", area8: 2, area11: 2, cordinate: { x: 41, y: 7, z: 31 }, size: { x: 6, y: 2 }, radius: [0, 0, 0, 0], box : { cordinate: { x: 30, y: 6 }, size : { x: 12, y: 3}} },
            { code: 6, name: "山形", full: "県", alphabet: "Yamagata", area8: 2, area11: 2, cordinate: { x: 41, y: 9, z: 32 }, size: { x: 6, y: 2 }, radius: [0, 0, 0, 0] },
            { code: 7, name: "福島", full: "県", alphabet: "Fukushima", area8: 2, area11: 2, cordinate: { x: 45, y: 11, z: 39 }, size: { x: 8, y: 2 }, radius: [0, 0, 0, 0] },
            { code: 8, name: "茨城", full: "県", alphabet: "Ibaraki", area8: 3, area11: 3, cordinate: { x: 49, y: 13, z: 42 }, size: { x: 4, y: 3 }, radius: [0, 0, 0, 0] },
            { code: 9, name: "栃木", full: "県", alphabet: "Tochigi", area8: 3, area11: 3, cordinate: { x: 45, y: 13, z: 41 }, size: { x: 4, y: 3 }, radius: [0, 0, 0, 0] },
            { code: 10, name: "群馬", full: "県", alphabet: "Gunma", area8: 3, area11: 3, cordinate: { x: 41, y: 13, z: 40 }, size: { x: 4, y: 3 }, radius: [0, 0, 0, 0] },
            { code: 11, name: "埼玉", full: "県", alphabet: "Saitama", area8: 3, area11: 3, cordinate: { x: 41, y: 16, z: 43 }, size: { x: 8, y: 2 }, radius: [0, 0, 0, 0] },
            { code: 12, name: "千葉", full: "県", alphabet: "Chiba", area8: 3, area11: 3, cordinate: { x: 49, y: 16, z: 46 }, size: { x: 4, y: 5 }, radius: [0, 0, 1, 0] },
            { code: 13, name: "東京", full: "都", alphabet: "Tokyo", area8: 3, area11: 3, cordinate: { x: 41, y: 18, z: 44 }, size: { x: 8, y: 2 }, radius: [0, 0, 0, 0] },
            { code: 14, name: "神奈川", full: "県", alphabet: "Kanagawa", area8: 3, area11: 3, cordinate: { x: 41, y: 20, z: 45 }, size: { x: 8, y: 2 }, radius: [0, 0, 1, 0] },
            { code: 15, name: "新潟", full: "県", alphabet: "Niigata", area8: 4, area11: 4, cordinate: { x: 37, y: 11, z: 35 }, size: { x: 8, y: 2 }, radius: [0, 0, 0, 0] },
            { code: 16, name: "富山", full: "県", alphabet: "Toyama", area8: 4, area11: 4, cordinate: { x: 33, y: 11, z: 26 }, size: { x: 4, y: 2 }, radius: [0, 0, 0, 0] },
            { code: 17, name: "石川", full: "県", alphabet: "Ishikawa", area8: 4, area11: 4, cordinate: { x: 29, y: 10, z: 18 }, size: { x: 4, y: 2 }, radius: [1, 1, 0, 0] },
            { code: 18, name: "福井", full: "県", alphabet: "Fukui", area8: 4, area11: 4, cordinate: { x: 27, y: 12, z: 19 }, size: { x: 6, y: 2 }, radius: [1, 0, 0, 0] },
            { code: 19, name: "山梨", full: "県", alphabet: "Yamanashi", area8: 4, area11: 3, cordinate: { x: 37, y: 17, z: 37 }, size: { x: 4, y: 2 }, radius: [0, 0, 0, 0] },
            { code: 20, name: "長野", full: "県", alphabet: "Nagano", area8: 4, area11: 3, cordinate: { x: 37, y: 13, z: 36 }, size: { x: 4, y: 4 }, radius: [0, 0, 0, 0] },
            { code: 21, name: "岐阜", full: "県", alphabet: "Gifu", area8: 4, area11: 5, cordinate: { x: 33, y: 13, z: 27 }, size: { x: 4, y: 4 }, radius: [0, 0, 0, 0] },
            { code: 22, name: "静岡", full: "県", alphabet: "Shizuoka", area8: 4, area11: 5, cordinate: { x: 37, y: 19, z: 38 }, size: { x: 4, y: 3 }, radius: [0, 0, 0, 1] },
            { code: 23, name: "愛知", full: "県", alphabet: "Aichi", area8: 4, area11: 5, cordinate: { x: 33, y: 17, z: 28 }, size: { x: 4, y: 3 }, radius: [0, 0, 0, 0] },
            { code: 24, name: "三重", full: "県", alphabet: "Mie", area8: 5, area11: 5, cordinate: { x: 29, y: 18, z: 24 }, size: { x: 4, y: 2 }, radius: [0, 0, 0, 0] },
            { code: 25, name: "滋賀", full: "県", alphabet: "Shiga", area8: 5, area11: 6, cordinate: { x: 29, y: 14, z: 22 }, size: { x: 4, y: 2 }, radius: [0, 0, 0, 0] },
            { code: 26, name: "京都", full: "府", alphabet: "Kyoto", area8: 5, area11: 6, cordinate: { x: 25, y: 14, z: 20 }, size: { x: 4, y: 3 }, radius: [1, 0, 0, 0] },
            { code: 27, name: "大阪", full: "府", alphabet: "Osaka", area8: 5, area11: 6, cordinate: { x: 25, y: 17, z: 21 }, size: { x: 4, y: 3 }, radius: [0, 0, 0, 0] },
            { code: 28, name: "兵庫", full: "県", alphabet: "Hyogo", area8: 5, area11: 6, cordinate: { x: 21, y: 15, z: 13 }, size: { x: 4, y: 4 }, radius: [0, 0, 0, 0] },
            { code: 29, name: "奈良", full: "県", alphabet: "Nara", area8: 5, area11: 6, cordinate: { x: 29, y: 16, z: 23 }, size: { x: 4, y: 2 }, radius: [0, 0, 0, 0] },
            { code: 30, name: "和歌山", full: "県", alphabet: "Wakayama", area8: 5, area11: 6, cordinate: { x: 25, y: 20, z: 25 }, size: { x: 6, y: 2 }, radius: [0, 0, 1, 1] },
            { code: 31, name: "鳥取", full: "県", alphabet: "Tottori", area8: 6, area11: 7, cordinate: { x: 17, y: 15, z: 11 }, size: { x: 4, y: 2 }, radius: [0, 0, 0, 0] },
            { code: 32, name: "島根", full: "県", alphabet: "Shimane", area8: 6, area11: 7, cordinate: { x: 13, y: 15, z: 9 }, size: { x: 4, y: 2 }, radius: [0, 0, 0, 0] },
            { code: 33, name: "岡山", full: "県", alphabet: "Okayama", area8: 6, area11: 7, cordinate: { x: 17, y: 17, z: 12 }, size: { x: 4, y: 2 }, radius: [0, 0, 0, 0] },
            { code: 34, name: "広島", full: "県", alphabet: "Hiroshima", area8: 6, area11: 7, cordinate: { x: 13, y: 17, z: 10 }, size: { x: 4, y: 2 }, radius: [0, 0, 0, 0] },
            { code: 35, name: "山口", full: "県", alphabet: "Yamaguchi", area8: 6, area11: 9, cordinate: { x: 9, y: 15, z: 8 }, size: { x: 4, y: 4 }, radius: [0, 0, 0, 0] },
            { code: 36, name: "徳島", full: "県", alphabet: "Tokushima", area8: 7, area11: 8, cordinate: { x: 17, y: 21, z: 17 }, size: { x: 6, y: 2 }, radius: [0, 0, 1, 0] },
            { code: 37, name: "香川", full: "県", alphabet: "Kagawa", area8: 7, area11: 8, cordinate: { x: 17, y: 19, z: 16 }, size: { x: 6, y: 2 }, radius: [0, 1, 0, 0] },
            { code: 38, name: "愛媛", full: "県", alphabet: "Ehime", area8: 7, area11: 8, cordinate: { x: 11, y: 19, z: 14 }, size: { x: 6, y: 2 }, radius: [1, 0, 0, 0] },
            { code: 39, name: "高知", full: "県", alphabet: "Kochi", area8: 7, area11: 8, cordinate: { x: 11, y: 21, z: 15 }, size: { x: 6, y: 2 }, radius: [0, 0, 0, 1] },
            { code: 40, name: "福岡", full: "県", alphabet: "Fukuoka", area8: 8, area11: 9, cordinate: { x: 5, y: 15, z: 4 }, size: { x: 4, y: 2 }, radius: [0, 0, 0, 0] },
            { code: 41, name: "佐賀", full: "県", alphabet: "Saga", area8: 8, area11: 9, cordinate: { x: 1, y: 17, z: 2 }, size: { x: 4, y: 2 }, radius: [0, 0, 0, 0] },
            { code: 42, name: "長崎", full: "県", alphabet: "Nagasaki", area8: 8, area11: 9, cordinate: { x: 1, y: 15, z: 1 }, size: { x: 4, y: 2 }, radius: [1, 0, 0, 0] },
            { code: 43, name: "熊本", full: "県", alphabet: "Kumamoto", area8: 8, area11: 9, cordinate: { x: 1, y: 19, z: 3 }, size: { x: 4, y: 2 }, radius: [0, 0, 0, 0] },
            { code: 44, name: "大分", full: "県", alphabet: "Oita", area8: 8, area11: 9, cordinate: { x: 5, y: 17, z: 5 }, size: { x: 4, y: 2 }, radius: [0, 0, 0, 0] },
            { code: 45, name: "宮崎", full: "県", alphabet: "Miyazaki", area8: 8, area11: 10, cordinate: { x: 5, y: 19, z: 6 }, size: { x: 4, y: 2 }, radius: [0, 0, 0, 0] },
            { code: 46, name: "鹿児島", full: "県", alphabet: "Kagoshima", area8: 8, area11: 10, cordinate: { x: 1, y: 21, z: 7 }, size: { x: 8, y: 2 }, radius: [0, 0, 1, 1] },
            { code: 47, name: "沖縄", full: "県", alphabet: "Okinawa", area8: 8, area11: 11, cordinate: { x: 18, y: 11, z: 47 }, size: { x: 4, y: 2, z: 47 }, radius: [1, 1, 1, 1] }
        ],
        infobox: { cordinate: { x: 1, y: 1 }, size: { x: 37, y: 9 } },
        divider: { cordinate: { x: 18, y: 11 }, size: { x: 4, y: 2 } },
        area8: [
            { code: 1, name: "北海道" },
            { code: 2, name: "東北" },
            { code: 3, name: "関東" },
            { code: 4, name: "中部" },
            { code: 5, name: "関西" },
            { code: 6, name: "中国" },
            { code: 7, name: "四国" },
            { code: 8, name: "九州沖縄" }
        ],
        area11: [
            { code: 1, name: "北海道" },
            { code: 2, name: "東北" },
            { code: 3, name: "関東甲信" },
            { code: 4, name: "北陸" },
            { code: 5, name: "東海" },
            { code: 6, name: "近畿" },
            { code: 7, name: "中国" },
            { code: 8, name: "四国" },
            { code: 9, name: "九州北部" },
            { code: 10, name: "九州南部・奄美" },
            { code: 11, name: "沖縄" }
        ],
        heatmap: {
            HRed: ['#bfc7ce', '#fae1e1', '#f19898', '#ee7f7f', '#eb6767', '#e55d5d', '#df5353', '#d94848', '#d23d3d', '#cc3333'],
            HBlue: ['#ffffff', '#f7fbff', '#deebf7', '#c6dbef', '#9ecae1', '#6baed6', '#4292c6', '#2171b5', '#08519c', '#08306b'],
            OrRd: ["#bfc7ce", "#fff7ec", "#fee8c8", "#fdd49e", "#fdbb84", "#fc8d59", "#ef6548", "#d7301f", "#b30000", "#7f0000"],
            PuBu: ["#bfc7ce", "#fff7fb", "#ece7f2", "#d0d1e6", "#a6bddb", "#74a9cf", "#3690c0", "#0570b0", "#045a8d", "#023858"],
            BuPu: ["#bfc7ce", "#f7fcfd", "#e0ecf4", "#bfd3e6", "#9ebcda", "#8c96c6", "#8c6bb1", "#88419d", "#810f7c", "#4d004b"],
            Oranges: ["#bfc7ce", "#fff5eb", "#fee6ce", "#fdd0a2", "#fdae6b", "#fd8d3c", "#f16913", "#d94801", "#a63603", "#7f2704"],
            BuGn: ["#bfc7ce", "#f7fcfd", "#e5f5f9", "#ccece6", "#99d8c9", "#66c2a4", "#41ae76", "#238b45", "#006d2c", "#00441b"],
            YlOrBr: ["#bfc7ce", "#ffffe5", "#fff7bc", "#fee391", "#fec44f", "#fe9929", "#ec7014", "#cc4c02", "#993404", "#662506"],
            YlGn: ["#bfc7ce", "#ffffe5", "#f7fcb9", "#d9f0a3", "#addd8e", "#78c679", "#41ab5d", "#238443", "#006837", "#004529"],
            Reds: ["#bfc7ce", "#fff5f0", "#fee0d2", "#fcbba1", "#fc9272", "#fb6a4a", "#ef3b2c", "#cb181d", "#a50f15", "#67000d"],
            RdPu: ["#bfc7ce", "#fff7f3", "#fde0dd", "#fcc5c0", "#fa9fb5", "#f768a1", "#dd3497", "#ae017e", "#7a0177", "#49006a"],
            Greens: ["#bfc7ce", "#f7fcf5", "#e5f5e0", "#c7e9c0", "#a1d99b", "#74c476", "#41ab5d", "#238b45", "#006d2c", "#00441b"],
            YlGnBu: ["#bfc7ce", "#ffffd9", "#edf8b1", "#c7e9b4", "#7fcdbb", "#41b6c4", "#1d91c0", "#225ea8", "#253494", "#081d58"],
            Purples: ["#bfc7ce", "#fcfbfd", "#efedf5", "#dadaeb", "#bcbddc", "#9e9ac8", "#807dba", "#6a51a3", "#54278f", "#3f007d"],
            GnBu: ["#bfc7ce", "#f7fcf0", "#e0f3db", "#ccebc5", "#a8ddb5", "#7bccc4", "#4eb3d3", "#2b8cbe", "#0868ac", "#084081"],
            Greys: ["#bfc7ce", "#ffffff", "#f0f0f0", "#d9d9d9", "#bdbdbd", "#969696", "#737373", "#525252", "#252525", "#000000"],
            YlOrRd: ["#bfc7ce", "#ffffcc", "#ffeda0", "#fed976", "#feb24c", "#fd8d3c", "#fc4e2a", "#e31a1c", "#bd0026", "#800026"],
            PuRd: ["#bfc7ce", "#f7f4f9", "#e7e1ef", "#d4b9da", "#c994c7", "#df65b0", "#e7298a", "#ce1256", "#980043", "#67001f"],
            Blues: ["#bfc7ce", "#f7fbff", "#deebf7", "#c6dbef", "#9ecae1", "#6baed6", "#4292c6", "#2171b5", "#08519c", "#08306b"],
            PuBuGn: ["#bfc7ce", "#fff7fb", "#ece2f0", "#d0d1e6", "#a6bddb", "#67a9cf", "#3690c0", "#02818a", "#016c59", "#014636"],
            Spectral: ["#bfc7ce", "#9e0142", "#d53e4f", "#f46d43", "#fdae61", "#fee08b", "#ffffbf", "#e6f598", "#abdda4", "#66c2a5", "#3288bd", "#5e4fa2"],
            RdYlGn: ["#bfc7ce", "#a50026", "#d73027", "#f46d43", "#fdae61", "#fee08b", "#ffffbf", "#d9ef8b", "#a6d96a", "#66bd63", "#1a9850", "#006837"],
            RdBu: ["#bfc7ce", "#67001f", "#b2182b", "#d6604d", "#f4a582", "#fddbc7", "#f7f7f7", "#d1e5f0", "#92c5de", "#4393c3", "#2166ac", "#053061"],
            PiYG: ["#bfc7ce", "#8e0152", "#c51b7d", "#de77ae", "#f1b6da", "#fde0ef", "#f7f7f7", "#e6f5d0", "#b8e186", "#7fbc41", "#4d9221", "#276419"],
            PRGn: ["#bfc7ce", "#40004b", "#762a83", "#9970ab", "#c2a5cf", "#e7d4e8", "#f7f7f7", "#d9f0d3", "#a6dba0", "#5aae61", "#1b7837", "#00441b"],
            RdYlBu: ["#bfc7ce", "#a50026", "#d73027", "#f46d43", "#fdae61", "#fee090", "#ffffbf", "#e0f3f8", "#abd9e9", "#74add1", "#4575b4", "#313695"],
            BrBG: ["#bfc7ce", "#543005", "#8c510a", "#bf812d", "#dfc27d", "#f6e8c3", "#f5f5f5", "#c7eae5", "#80cdc1", "#35978f", "#01665e", "#003c30"],
            RdGy: ["#bfc7ce", "#67001f", "#b2182b", "#d6604d", "#f4a582", "#fddbc7", "#ffffff", "#e0e0e0", "#bababa", "#878787", "#4d4d4d", "#1a1a1a"],
            PuOr: ["#bfc7ce", "#7f3b08", "#b35806", "#e08214", "#fdb863", "#fee0b6", "#f7f7f7", "#d8daeb", "#b2abd2", "#8073ac", "#542788", "#2d004b"],
            Set2: ["#bfc7ce", "#66c2a5", "#fc8d62", "#8da0cb", "#e78ac3", "#a6d854", "#ffd92f", "#e5c494", "#b3b3b3"],
            Accent: ["#bfc7ce", "#7fc97f", "#beaed4", "#fdc086", "#ffff99", "#386cb0", "#f0027f", "#bf5b17", "#666666"],
            Set1: ["#bfc7ce", "#e41a1c", "#377eb8", "#4daf4a", "#984ea3", "#ff7f00", "#ffff33", "#a65628", "#f781bf", "#999999"],
            Set3: ["#bfc7ce", "#8dd3c7", "#ffffb3", "#bebada", "#fb8072", "#80b1d3", "#fdb462", "#b3de69", "#fccde5", "#d9d9d9", "#bc80bd", "#ccebc5", "#ffed6f"],
            Dark2: ["#bfc7ce", "#1b9e77", "#d95f02", "#7570b3", "#e7298a", "#66a61e", "#e6ab02", "#a6761d", "#666666"],
            Paired: ["#bfc7ce", "#a6cee3", "#1f78b4", "#b2df8a", "#33a02c", "#fb9a99", "#e31a1c", "#fdbf6f", "#ff7f00", "#cab2d6", "#6a3d9a", "#ffff99", "#b15928"],
            Pastel2: ["#bfc7ce", "#b3e2cd", "#fdcdac", "#cbd5e8", "#f4cae4", "#e6f5c9", "#fff2ae", "#f1e2cc", "#cccccc"],
            Pastel1: ["#bfc7ce", "#fbb4ae", "#b3cde3", "#ccebc5", "#decbe4", "#fed9a6", "#ffffcc", "#e5d8bd", "#fddaec", "#f2f2f2"],
            Font: ["#000", "#000", "#000", "#000", "#000", "#fff", "#fff", "#fff", "#fff", "#fff"]
        },
        colorgroups : {
            'pink': '#ffc0cb', 'lightpink': '#ffb6c1', 'hotpink': '#ff69b4', 'deeppink': '#ff1493', 'palevioletred': '#db7093', 'mediumvioletred': '#c71585', 'lavender': '#e6e6fa',
            'thistle': '#d8bfd8', 'plum': '#dda0dd', 'orchid': '#da70d6', 'violet': '#ee82ee', 'fuchsia': '#ff00ff', 'magenta': '#ff00ff', 'mediumorchid': '#ba55d3', 'darkorchid': '#9932cc',
            'darkviolet': '#9400d3', 'blueviolet': '#8a2be2', 'darkmagenta': '#8b008b', 'purple': '#800080', 'mediumpurple': '#9370db', 'mediumslateblue': '#7b68ee', 'slateblue': '#6a5acd',
            'darkslateblue': '#483d8b', 'rebeccapurple': '#663399', 'indigo ': '#4b0082', 'lightsalmon': '#ffa07a', 'salmon': '#fa8072', 'darksalmon': '#e9967a', 'lightcoral': '#f08080',
            'indianred ': '#cd5c5c', 'crimson': '#dc143c', 'red': '#ff0000', 'firebrick': '#b22222', 'darkred': '#8b0000', 'orange': '#ffa500', 'darkorange': '#ff8c00', 'coral': '#ff7f50',
            'tomato': '#ff6347', 'orangered': '#ff4500', 'gold': '#ffd700', 'yellow': '#ffff00', 'lightyellow': '#ffffe0', 'lemonchiffon': '#fffacd', 'lightgoldenrodyellow': '#fafad2',
            'papayawhip': '#ffefd5', 'moccasin': '#ffe4b5', 'peachpuff': '#ffdab9', 'palegoldenrod': '#eee8aa', 'khaki': '#f0e68c', 'darkkhaki': '#bdb76b', 'greenyellow': '#adff2f',
            'chartreuse': '#7fff00', 'lawngreen': '#7cfc00', 'lime': '#00ff00', 'limegreen': '#32cd32', 'palegreen': '#98fb98', 'lightgreen': '#90ee90', 'mediumspringgreen': '#00fa9a',
            'springgreen': '#00ff7f', 'mediumseagreen': '#3cb371', 'seagreen': '#2e8b57', 'forestgreen': '#228b22', 'green': '#008000', 'darkgreen': '#006400', 'yellowgreen': '#9acd32',
            'olivedrab': '#6b8e23', 'darkolivegreen': '#556b2f', 'mediumaquamarine': '#66cdaa', 'darkseagreen': '#8fbc8f', 'lightseagreen': '#20b2aa', 'darkcyan': '#008b8b', 'teal': '#008080',
            'aqua': '#00ffff', 'cyan': '#00ffff', 'lightcyan': '#e0ffff', 'paleturquoise': '#afeeee', 'aquamarine': '#7fffd4', 'turquoise': '#40e0d0', 'mediumturquoise': '#48d1cc',
            'darkturquoise': '#00ced1', 'cadetblue': '#5f9ea0', 'steelblue': '#4682b4', 'lightsteelblue': '#b0c4de', 'lightblue': '#add8e6', 'powderblue': '#b0e0e6',
            'lightskyblue': '#87cefa', 'skyblue': '#87ceeb', 'cornflowerblue': '#6495ed', 'deepskyblue': '#00bfff', 'dodgerblue': '#1e90ff', 'royalblue': '#4169e1', 'blue': '#0000ff',
            'mediumblue': '#0000cd', 'darkblue': '#00008b', 'navy': '#000080', 'midnightblue': '#191970', 'cornsilk': '#fff8dc', 'blanchedalmond': '#ffebcd', 'bisque': '#ffe4c4',
            'navajowhite': '#ffdead', 'wheat': '#f5deb3', 'burlywood': '#deb887', 'tan': '#d2b48c', 'rosybrown': '#bc8f8f', 'sandybrown': '#f4a460', 'goldenrod': '#daa520',
            'darkgoldenrod': '#b8860b', 'peru': '#cd853f', 'chocolate': '#d2691e', 'olive': '#808000', 'saddlebrown': '#8b4513', 'sienna': '#a0522d', 'brown': '#a52a2a', 'maroon': '#800000',
            'white': '#ffffff', 'snow': '#fffafa', 'honeydew': '#f0fff0', 'mintcream': '#f5fffa', 'azure': '#f0ffff', 'aliceblue': '#f0f8ff', 'ghostwhite': '#f8f8ff', 'whitesmoke': '#f5f5f5',
            'seashell': '#fff5ee', 'beige': '#f5f5dc', 'oldlace': '#fdf5e6', 'floralwhite': '#fffaf0', 'ivory': '#fffff0', 'antiquewhite': '#faebd7', 'linen': '#faf0e6',
            'lavenderblush': '#fff0f5', 'mistyrose': '#ffe4e1', 'gainsboro': '#dcdcdc', 'lightgray': '#d3d3d3', 'silver': '#c0c0c0', 'darkgray': '#a9a9a9', 'dimgray': '#696969', 'gray': '#808080',
            'lightslategray': '#778899', 'slategray': '#708090', 'darkslategray': '#2f4f4f', 'black': '#000000'
        }
    };

    $.fn.jmapHeatLabel = function(options) {
        var heatmapUl = $('<ul>').addClass('jmap-heatlabel').attr('jmap-uniq', options + "-heatlabel")
        for (var index = 0, l = conf.heatmap[options].length; index < l; index++) {
            $('<li>').css({
                'display': 'inline-block',
                'width': '10%',
                'height': '30px',
                'background-color': conf.heatmap[options][index],
            }).appendTo(heatmapUl);
        }

        $(this).append(heatmapUl);

        return this;
    };

    $.fn.jmapBlackOrWhite = function(_hexcolor) {
        
        var hexcolor = _hexcolor.toLowerCase();

        if(hexcolor.length <= 4) {
            var hr = hexcolor.substr( 1, 1 );
            var hg = hexcolor.substr( 2, 1 );
            var hb = hexcolor.substr( 3, 1 );
            hexcolor = "#" + hr + hr + hg + hg + hb + hb;
        } else if(hexcolor.substr(0,3) == 'rgb') {
            hexcolor = hexcolor.replace(' ','');
            hexcolor = hexcolor.replace('rgba(','[');
            hexcolor = hexcolor.replace('rgb(','[');
            hexcolor = hexcolor.replace(')',']');
            hexArray = eval(hexcolor);

            if(hexArray.length >= 4)
                hexArray.pop();

            hexcolor = "#";
            $.each(hexArray, function(index, val) {
                hexcolor += ( "0" + hexArray[index].toString(16) ) .slice( -2 );
            });
        } else if( hexcolor.match(/^a-z/gi) ) {
            hexcolor = conf.colorgroups[hexcolor];
        }

        try {
            var r = parseInt( hexcolor.substr( 1, 2 ), 16 ) ;
            var g = parseInt( hexcolor.substr( 3, 2 ), 16 ) ;
            var b = parseInt( hexcolor.substr( 5, 2 ), 16 ) ;
            return ( ( ( (r * 299) + (g * 587) + (b * 114) ) / 1000 ) < 160 ) ? "#ffffff" : "#000000" ;
        } catch(e) {
            return _hexcolor;
        }

    };

    $.fn.jmap = function(options) {

        if (options == 'update') {
            return this;
        }

        identifier++;
        var uniqClass = 'jmap-' + identifier;
        var stylers = [];
        var stylersPrimal = []; // for hover effect;

        // Default Options
        var params = $.extend({
            id: null,
            width: '100%',
            height: '100%',
            lineColor: 'transparent',
            lineWidth: 0,
            lineStyle: 'solid',
            backgroundColor: 'transparent',
            backgroundRadius: '0',
            backgroundPadding: '0',
            dividerWidth: '1px',
            dividerColor: '#bfbfbf',
            dividerStyle: 'solid',
            fontSize: '12px',
            fontColor: '#fff',
            font: 'inherit',
            textNowrap: false,
            showIslandDivider: true,
            showInfobox: false,
            showPrefectureName: true,
            showTextShadow: false,
            textShadowWidth: '2px',
            textShadowColor: '#000',
            containerClass: 'jmap-container',
            contentClass: 'jmap-content',
            dividerClass: 'jmap-divider',
            infoboxClass: 'jmap-infobox',
            infoboxContent: '',
            infoboxBackgroundColor: 'transparent',
            prefectureNameType: 'short',
            prefectureClass: 'jmap-pref',
            prefectureRadius: '3px',
            prefectureBackgroundColor: '#333',
            prefectureBackgroundHoverColor: '#666',
            prefectureLineY: '0px',
            prefectureLineX: '0px',
            prefectureLineWidth: '1px',
            prefectureLineGap: '1px',
            prefectureLineColor: '#fff',
            prefectureLineHoverColor: '#aa1a00',
            prefectureInnerLineWidth: '0px',
            prefectureInnerLineColor: 'transparent',
            prefectureInnerLineType: 'solid',
            showRoundedPrefecture: false,
            showHeatmap: false,
            showHeatlabel: false,
            heatmapType: 'HRed',
            heatmapColors: [],
            heatmapLabelUnit: '',
            heatmapFontColors: [],
            heatmapConditions: [],
            viewType: 'map',
            gridNumber: 6,
            gridOffset: 1,
            gridTotalRows: 22,
            gridTotalColumns: 54,
            selectable: true,
            cursor: 'pointer',
            skew: '0',
            showTextNoneSkewed: true,
            areas: [],
            onSelect: function(e, data) {},
            onHover: function(e, data) {},
            onMouseout: function(e, data) {},
            onLoad: function(e, data) {},
            onSelectHeatMapLabel: function(e, data) {},
            onHoverHeatMapLabel: function(e, data) {},
            onLoadHeatMapLabel: function(e, data) {}
        }, options);

        var unit = '/px|vw|vh|rem|%|em|ex|ch|vmin|vmax|cm|mm|in|pt|pc/';
        params.width = (String(params.width).match(unit)) ? params.width : parseInt(params.width) + 'px';
        params.height = (String(params.height).match(unit)) ? params.height : parseInt(params.height) + 'px';
        params.lineWidth = (String(params.lineWidth).match(unit)) ? params.lineWidth : parseInt(params.lineWidth) + 'px';
        params.backgroundRadius = (String(params.backgroundRadius).match(unit)) ? params.backgroundRadius : parseInt(params.backgroundRadius) + 'px';
        params.backgroundPadding = (String(params.backgroundPadding).match(unit)) ? params.backgroundPadding : parseInt(params.backgroundPadding) + 'px';
        params.dividerWidth = (String(params.dividerWidth).match(unit)) ? params.dividerWidth : parseInt(params.dividerWidth) + 'px';
        params.fontSize = (String(params.fontSize).match(unit)) ? params.fontSize : parseInt(params.fontSize) + 'px';
        params.prefectureRadius = (String(params.prefectureRadius).match(unit)) ? params.prefectureRadius : parseInt(params.prefectureRadius) + 'px';
        params.prefectureLineGap = (String(params.prefectureLineGap).match(unit)) ? params.prefectureLineGap : parseInt(params.prefectureLineGap) + 'px';
        params.prefectureLineWidth = (String(params.prefectureLineWidth).match(unit)) ? params.prefectureLineWidth : parseInt(params.prefectureLineWidth) + 'px';
        params.prefectureInnerLineWidth = (String(params.prefectureInnerLineWidth).match(unit)) ? params.prefectureInnerLineWidth : parseInt(params.prefectureInnerLineWidth) + 'px';

        params.prefectureLineY = (String(params.prefectureLineY).match(unit)) ? params.prefectureLineY : parseInt(params.prefectureLineY) + 'px';
        params.prefectureLineX = (String(params.prefectureLineX).match(unit)) ? params.prefectureLineX : parseInt(params.prefectureLineX) + 'px';

        if (params.id == null)
            params.id = uniqClass;

        if (params.heatmapColors.length <= 0)
            params.heatmapColors = conf.heatmap[params.heatmapType];

        if( params.heatmapConditions.length > 0)
            params.heatmapConditions = params.heatmapConditions.reverse();

        if (params.showHeatmap && params.showHeatlabel)
            params.showInfobox = true;

        if (!params.selectable)
            params.cursor = 'default';

        // Jmap container
        var containerCss = {
            'display': 'flex',
            'position': 'relative',
            'font-family': params.font,
            'width': params.width,
            'height': params.height,
            'background-color': params.backgroundColor,
            'border-width': params.lineWidth,
            'border-color': params.lineColor,
            'border-style': params.lineStyle,
            'border-radius': params.backgroundRadius,
            'padding': params.backgroundPadding,
            'overflow': 'hidden'
        };
        var containerSelector = 'div[jmap-id="%s1"]'.replace('%s1', uniqClass)
        var containerStyle = JSON.stringify(containerCss).replace(/",/g, '";').replace(/"/g, '');
        stylers.push(containerSelector + containerStyle);

        var containerDiv = $('<div>')
            .attr('jmap-id', params.id)
            .addClass(params.containerClass);

        // Jmap content
        var contentCss = {
            'display': 'grid; display:-ms-grid',
            'position': 'relative',
            'width': '100%',
            'height': '100%',
            'grid-template-rows': Array(params.gridTotalRows + 1).join( (100 / params.gridTotalRows).toFixed(3) + '% ' ),
            'grid-template-columns': Array(params.gridTotalColumns + 1).join( (100 / params.gridTotalColumns).toFixed(3) + '% ' ),
            '-ms-grid-rows': Array(params.gridTotalRows + 1).join( (100 / params.gridTotalRows).toFixed(3) + '% ' ),
            '-ms-grid-columns': Array(params.gridTotalColumns + 1).join( (100 / params.gridTotalColumns).toFixed(3) + '% ' )
        };

        var contentSelector = 'div[jmap-id="%s1"] .%s2 '.replace('%s1', uniqClass).replace('%s2', params.contentClass);
        var contentStyle = JSON.stringify(contentCss).replace(/",/g, '";').replace(/"/g, '');
        stylers.push(contentSelector + contentStyle);

        if (params.viewType == 'grid') {
            var row = Math.ceil((conf.prefectures.length + params.gridOffset) / params.gridNumber);
            var col = params.gridNumber;
            var contentGridCss = {
                'grid-template-rows': Array(row + 1).join((100 / row).toFixed(3) + '% '),
                'grid-template-columns': Array(col + 1).join((100 / col).toFixed(3) + '% '),
                '-ms-grid-rows': Array(row + 1).join((100 / row).toFixed(3) + '% '),
                '-ms-grid-columns': Array(col + 1).join((100 / col).toFixed(3) + '% ')
            };
            var contentGridSelector = 'div[jmap-id="%s1"] .%s2[jmap-view="grid"] '.replace('%s1', uniqClass).replace('%s2', params.contentClass);
            var contentGridStyle = JSON.stringify(contentGridCss).replace(/",/g, '";').replace(/"/g, '');
            stylersPrimal.push(contentGridSelector + contentGridStyle);

        // if (params.viewType == 'grid') {
            params.showInfobox = false;
            params.showHeatlabel = false;
            params.showIslandDivider = false;
        }

        // Jmap Content
        var contentDiv = $('<div>')
            .attr('jmap-view', params.viewType)
            .addClass(params.contentClass);

        if (params.skew != 0) {
            contentDiv.attr('jmap-skew', true);
        }

        // Island divider 
        if (params.showIslandDivider) {

            var divider = conf.divider;
            var dividerCss = {
                'grid-column': '%d1 / %d2'.replace('%d1', divider.cordinate.x).replace('%d2', divider.cordinate.x + divider.size.x),
                '-ms-grid-column': '%d1'.replace('%d1', divider.cordinate.x),
                '-ms-grid-column-span': 'sx'.replace('sx', divider.size.x),
                'grid-row': '%d1 / %d2'.replace('%d1', divider.cordinate.y).replace('%d2', divider.cordinate.y + divider.size.y),
                '-ms-grid-row': '%d1'.replace('%d1', divider.cordinate.y),
                '-ms-grid-row-span': '%d1'.replace('%d1', divider.size.y),
                'transform': 'scale(1.6)',
                'border-right-width': params.dividerWidth,
                'border-right-color': params.dividerColor,
                'border-right-style': params.dividerStyle,
                'border-bottom-width': params.dividerWidth,
                'border-bottom-color': params.dividerColor,
                'border-bottom-style': params.dividerStyle,
            };

            var dividerSelector = 'div[jmap-id="%s1"] .%s2 '.replace('%s1', uniqClass).replace('%s2', params.dividerClass);
            var dividerStyle = JSON.stringify(dividerCss).replace(/",/g, '";').replace(/"/g, '');
            stylers.push(dividerSelector + dividerStyle);

            var dividerDiv = $('<div>')
                .addClass(params.dividerClass)
                .appendTo(contentDiv);
        }


        // Loop prefectures
        var heatmapMax = null;
        var heatmapMin = null;
        if (params.showHeatmap) {
            for (var index in params.areas) {
                var area = params.areas[index];
                if (!area.number)
                    continue;

                if (!heatmapMax)
                    heatmapMax = area.number;
                else if (area.number > heatmapMax)
                    heatmapMax = area.number;

                if (!heatmapMin)
                    heatmapMin = area.number;
                else if (area.number < heatmapMin)
                    heatmapMin = area.number;
            }
        }

        // Infobox 
        var infoboxDiv = null;
        if (params.showInfobox) {

            var infobox = conf.infobox;

            var infoboxCss = {
                'grid-column': '%d1 / %d2'.replace('%d1', infobox.cordinate.x).replace('%d2', infobox.cordinate.x + infobox.size.x),
                '-ms-grid-column': '%d1'.replace('%d1', infobox.cordinate.x),
                '-ms-grid-column-span': 'sx'.replace('sx', infobox.size.x),
                'grid-row': '%d1 / %d2'.replace('%d1', infobox.cordinate.y).replace('%d2', infobox.cordinate.y + infobox.size.y),
                '-ms-grid-row': '%d1'.replace('%d1', infobox.cordinate.y),
                '-ms-grid-row-span': '%d1'.replace('%d1', infobox.size.y),
                'background-color': params.infoboxBackgroundColor,
                'z-index' : '130'
            };
            var infoboxSelector = 'div[jmap-id="%s1"] .%s2 '.replace('%s1', uniqClass).replace('%s2', params.infoboxClass);
            var infoboxStyle = JSON.stringify(infoboxCss).replace(/",/g, '";').replace(/"/g, '');
            stylers.push(infoboxSelector + infoboxStyle);

            infoboxDiv = $(this).find('.jmap-infobox');
            if (infoboxDiv.length > 0) {

                infoboxDiv
                    .addClass(params.infoboxClass)
                    .appendTo(contentDiv);

            } else {

                infoboxDiv = $('<div>')
                    .addClass(params.infoboxClass)
                    .html(params.infoboxContent)
                    .appendTo(contentDiv);

            }

            // Heatmap
            if (params.showHeatmap && params.showHeatlabel) {

                var heatmapCss = {
                    'padding': "0px",
                    'margin': "0px",
                    'max-width': '250px'
                };
                var heatmapSelector = 'div[jmap-id="%s1"] .jmap-heatlabel'.replace('%s1', uniqClass);
                var heatmapStyle = JSON.stringify(heatmapCss).replace(/",/g, '";').replace(/"/g, '');
                stylers.push(heatmapSelector + heatmapStyle);

                // HeatmalLabel Li
                var heatmapLabelLiCss = {
                    'display': 'inline-block',
                    'width': '10%',
                    'height': '30px',
                    'position': 'relative',
                    'box-sizing' : 'border-box'
                };
                var heatmapLabelLiSelector = 'div[jmap-id="%s1"] .jmap-heatlabel  li '.replace('%s1', uniqClass);
                var heatmapLabelLiStyle = JSON.stringify(heatmapLabelLiCss).replace(/",/g, '";').replace(/"/g, '');
                stylers.push(heatmapLabelLiSelector + heatmapLabelLiStyle);

                // HeatmalLabel Li:hover
                var heatmapLabelLiHoverCss = {
                    'opacity': '0.8',
                    'border' : '1px solid #ccc'
                };
                var heatmapLabelLiHoverSelector = 'div[jmap-id="%s1"] .jmap-heatlabel  li:hover '.replace('%s1', uniqClass);
                var heatmapLabelLiHoverStyle = JSON.stringify(heatmapLabelLiHoverCss).replace(/",/g, '";').replace(/"/g, '');
                stylers.push(heatmapLabelLiHoverSelector + heatmapLabelLiHoverStyle);

                // HeatmalLabel Li First Child
                var heatmapLabelLiFirstChildCss = {
                    'border-radius': '3px 0 0 3px'
                };
                var heatmapLabelLiFirstChildSelector = 'div[jmap-id="%s1"] .jmap-heatlabel li:first-child '.replace('%s1', uniqClass);
                var heatmapLabelLiFirstChildStyle = JSON.stringify(heatmapLabelLiFirstChildCss).replace(/",/g, '";').replace(/"/g, '');
                stylers.push(heatmapLabelLiFirstChildSelector + heatmapLabelLiFirstChildStyle);

                // HeatmalLabel Li Last Child
                var heatmapLabelLiLastChildCss = {
                    'border-radius': '0 3px 3px 0'
                };
                var heatmapLabelLiLastChildCssSelector = 'div[jmap-id="%s1"] .jmap-heatlabel li:last-child '.replace('%s1', uniqClass);
                var heatmapLabelLiLastChildCssStyle = JSON.stringify(heatmapLabelLiLastChildCss).replace(/",/g, '";').replace(/"/g, '');
                stylers.push(heatmapLabelLiLastChildCssSelector + heatmapLabelLiLastChildCssStyle);

                // HeatmalLabel Li Span
                var heatmapLabelSpan  = {
                    'display' : 'none',
                    'position' : 'absolute',
                    'top' : '30px',
                    'margin' : '5px',
                    'padding' : '5px 20px',
                    'text-align' : 'center',
                    'opacity': '0',
                    'border': '2px solid #ccc',
                    'box-shadow': '0 0 5px rgba(0,0,0,0.3)',
                    'background-color' : '#ffffff',
                    'border-radius': '5px',
                    'font-size' : '0.8rem',
                    'max-width' : '250px',
                    'white-space' : 'nowrap'
                };
                var heatmapLabelSpanCssSelector = 'div[jmap-id="%s1"] .jmap-heatlabel li span '.replace('%s1', uniqClass);
                var heatmapLabelSpanCssStyle = JSON.stringify(heatmapLabelSpan).replace(/",/g, '";').replace(/"/g, '');
                stylers.push(heatmapLabelSpanCssSelector + heatmapLabelSpanCssStyle);

                // HeatmalLabel Li Span:hover
                var heatmapLabelSpanHover  = {
                    'display' : 'block',
                    'opacity': '1'
                };
                var heatmapLabelSpanHoverCssSelector = 'div[jmap-id="%s1"] .jmap-heatlabel li:hover span'.replace('%s1', uniqClass);
                var heatmapLabelSpanHoverCssStyle = JSON.stringify(heatmapLabelSpanHover).replace(/",/g, '";').replace(/"/g, '');
                stylers.push(heatmapLabelSpanHoverCssSelector + heatmapLabelSpanHoverCssStyle);

                $('body').on('mouseover', heatmapLabelLiSelector, function(e) {
                    var span = $(this).children().get(0);
                    return params.onHoverHeatMapLabel.call(span, e, $(span).data('data'));
                }).on('click', heatmapLabelLiSelector, function(e) {
                    var span = $(this).children().get(0);
                    return params.onSelectHeatMapLabel.call(span, e, $(span).data('data'));
                });

                var heatmapUl = $('<ul>').addClass('jmap-heatlabel');
                var inc    = Math.round( (heatmapMax - heatmapMin) /10);
                for (var index = 0, l = params.heatmapColors.length; index < l; index++) {

                    var value = 0;
                    var text = '';
                    var range = '';
                    if( params.heatmapConditions[params.heatmapConditions.length - 1 - index] ) {
                        var str = (params.heatmapConditions[params.heatmapConditions.length - 1 - index]).replace(' ', '');

                        if( str.match(/>=/) ) range = '以上';
                        if( str.match(/<=/) ) range = '以下';
                        if( range == '') {
                            if( str.match(/>/) ) range = '超';
                            if( str.match(/</) ) range = '未満';
                            if( str.match(/=/) ) range = '等しい';
                        }

                        value = parseInt( str.replace('>=','').replace('<=','').replace('<','').replace('<','') );
                        text = value.toLocaleString() + params.heatmapLabelUnit + range;

                    } else {
                        range = '以上'
                        value = heatmapMin + (inc * index);
                        text = value.toLocaleString() + params.heatmapLabelUnit + range;
                        text += ' ';
                        text += (heatmapMin + (inc * (index + 1))).toLocaleString() + "未満";
                    }
                    
                    var span = $('<span>')
                        .text(text)
                        .data('data', { 'index' : index, 'text' : text, 'value' : value, 'range' : range, 'unit' : params.heatmapLabelUnit })

                    // HeatmalLabel Li Indivisual
                    var heatmapLabelLiIndivisualCss = {
                        'background-color': params.heatmapColors[index]
                    };
                    var heatmapLabelLiIndivisualSelector = 'div[jmap-id="%s1"] .jmap-heatlabel li[jmap-uniq="%s2"]'.replace('%s1', uniqClass).replace('%s2', index)
                    var heatmapLabelLiIndivisualStyle = JSON.stringify(heatmapLabelLiIndivisualCss).replace(/",/g, '";').replace(/"/g, '');
                    stylers.push(heatmapLabelLiIndivisualSelector + heatmapLabelLiIndivisualStyle);

                    $('<li>')
                    .attr('jmap-uniq', index)
                    .append(span).appendTo(heatmapUl);
                }
                infoboxDiv.append(heatmapUl)
                

            }
        }

        // Prefecture Common
        var prefectureCss = {
            'position': 'relative',
            'display': 'flex',
            'cursor': params.cursor,
            'margin': params.prefectureLineGap,
            'box-shadow': '%s1 %s2 0 %s3 %s4'.replace('%s1', params.prefectureLineY).replace('%s2', params.prefectureLineX).replace('%s3', params.prefectureLineWidth).replace('%s4', params.prefectureLineColor),
            'border': '%s1 %s2 %s3'.replace('%s1', params.prefectureInnerLineWidth).replace('%s2', params.prefectureInnerLineType).replace('%s3', params.prefectureInnerLineColor),
            'font-size': params.fontSize,
            'color': params.fontColor,
            'border-radius': params.prefectureRadius,
            'flex-direction': 'column',
            'justify-content': 'center',
            'align-items': 'center',
            'text-align': 'center',
            'box-sizing': 'border-box',
            'transition': 'box-shadow 0.2s',
            'overflow': 'hidden',
            'white-space': (params.textNowrap) ? 'nowrap' : 'normal'
        };

        if (params.showTextShadow) {
            prefectureCss['text-shadow'] = '0 0 %s1 %s2'.replace('%s1', params.textShadowWidth).replace('%s2', params.textShadowColor);
        }

        var prefectureSelector = 'div[jmap-id="%s1"] .%s2 '.replace('%s1', uniqClass).replace('%s2', params.prefectureClass);
        var prefectureStyle = JSON.stringify(prefectureCss).replace(/",/g, '";').replace(/"/g, '');
        stylers.push(prefectureSelector + prefectureStyle);

        // Prefecture Event
        $('body').on('click', prefectureSelector, function(e){
            return params.onSelect.call(this, e, $(this).data('data'));
        }).on('mouseover', prefectureSelector, function(e){
            return params.onHover.call(this, e, $(this).data('data'));
        }).on('mouseout', prefectureSelector, function(e){
            return params.onMouseout.call(this, e, $(this).data('data'));
        });

        // Prefecture Common Hover
        if (params.selectable) {
            var prefectureHoverCss = {
                'background-color': params.prefectureBackgroundHoverColor,
                'box-shadow': '0 0 0 %s1 %s2, 0 0 5px %s3'.replace('%s1', params.prefectureLineWidth).replace('%s2', params.prefectureLineHoverColor).replace('%s3', "#333"),
                'transform': 'scale(1.01)',
                'z-index': '120'
            };
            var prefectureHoverSelector = 'div[jmap-id="%s1"] .%s2:hover '.replace('%s1', uniqClass).replace('%s2', params.prefectureClass);
            var prefectureHoverStyle = JSON.stringify(prefectureHoverCss).replace(/",/g, '";').replace(/"/g, '');
            stylersPrimal.push(prefectureHoverSelector + prefectureHoverStyle);
        }

        // If showTextNoneSkewed are true
        if (params.showTextNoneSkewed && params.skew != 0) {

            // Prefecture Inner Div
            var prefectureInnerDivCss = {
                'transform': 'skew(%d1deg)'.replace('%d1', params.skew)
            };
            var prefectureInnerDivSelector = 'div[jmap-id="%s1"] .%s2 div'.replace('%s1', uniqClass).replace('%s2', params.prefectureClass);
            var prefectureInnerDivStyle = JSON.stringify(prefectureInnerDivCss).replace(/"/g, '').replace(/,/g, ';');
            stylers.push(prefectureInnerDivSelector + prefectureInnerDivStyle);
        }

        var gridRowIndex = 1;
        var gridColIndex = params.gridOffset;
        $.each(conf.prefectures, function(_index, pref) {
            var pref = $.extend({ option: {} }, pref);

            var option = params.areas.filter(function(_pref) {
                return pref.code == _pref.code;
            })[0] || {};
            pref.option = $.extend(pref.option, option);

            for (var index in conf.area8) {
                if (conf.area8[index].code == pref.area8) {
                    pref.area8 = $.extend(pref.area8, conf.area8[index]);
                    break;
                }
            }

            for (var index in conf.area11) {
                if (conf.area11[index].code == pref.area11) {
                    pref.area11 = $.extend(pref.area11, conf.area11[index]);
                    break;
                }
            }

            // Heatmap settings
            if (params.showHeatmap) {

                // if Heatmap Conditions area defined
                if(params.heatmapConditions.length > 0 && option.number) {
 
                    $.each(params.heatmapConditions, function(index, _cond) {
                        
                        _cond = $.isNumeric(_cond)? "==" + _cond : _cond;

                        if( eval(option.number + " " + _cond + "? true: false") ) {
                            option.color = params.heatmapColors[ (params.heatmapColors.length - 1) - index];

                            if( !params.heatmapFontColors[ (params.heatmapColors.length - 1) - index] )
                                option.fontColor = $(this).jmapBlackOrWhite(option.color);
                            else
                                option.fontColor = params.heatmapFontColors[(params.heatmapColors.length - 1) - index];
                            
                            if (option.hoverColor)
                                delete option.hoverColor;

                            return false;
                        }
                    });

                } else if (option.number) { // if Number are defined in item option

                    var index = Math.round((option.number - heatmapMin) / (heatmapMax - heatmapMin) * 10);
                    index = (index >= 10) ? 9 : index;
                    option.color = params.heatmapColors[index];

                    if( !params.heatmapFontColors[index] )
                        option.fontColor = $(this).jmapBlackOrWhite(option.color);
                    else
                        option.fontColor = params.heatmapFontColors[index];

                    if (option.hoverColor)
                        delete option.hoverColor;
                }
            }

            // Prefecture Indivisual
            var prefectureIndivisualCss = {
                'grid-column': '%d1 / %d2'.replace('%d1', pref.cordinate.x).replace('%d2', pref.cordinate.x + pref.size.x),
                '-ms-grid-column': '%d1'.replace('%d1', pref.cordinate.x),
                '-ms-grid-column-span': 'sx'.replace('sx', pref.size.x),
                'grid-row': '%d1 / %d2'.replace('%d1', pref.cordinate.y).replace('%d2', pref.cordinate.y + pref.size.y),
                '-ms-grid-row': '%d1'.replace('%d1', pref.cordinate.y),
                '-ms-grid-row-span': '%d1'.replace('%d1', pref.size.y),
                'background-color': (option.color) ? option.color : params.prefectureBackgroundColor,
                'z-index': pref.cordinate.z
            };

            if (params.showRoundedPrefecture)
                prefectureIndivisualCss = $.extend(prefectureIndivisualCss, { 'border-radius': pref.radius.join(' ').replace(/1/g, params.prefectureRadius) });

            if (option.fontColor)
                prefectureIndivisualCss['color'] = option.fontColor;

            var prefectureIndivisualSelector = 'div[jmap-id="%s1"] .%s2[jmap-uniq="%s3"] '.replace('%s1', uniqClass).replace('%s2', params.prefectureClass).replace('%s3', pref.code);
            var prefectureIndivisualStyle = JSON.stringify(prefectureIndivisualCss).replace(/"/g, '').replace(/,/g, ';');
            stylers.push(prefectureIndivisualSelector + prefectureIndivisualStyle);

            if (params.viewType == 'grid') {

                var prefectureIndivisualGridCss = {
                    'grid-column': '%d1 / %d2'.replace('%d1', gridColIndex).replace('%d2', gridColIndex + 1),
                    '-ms-grid-column': '%d1'.replace('%d1', gridColIndex),
                    '-ms-grid-column-span': 'sx'.replace('sx', 1),
                    'grid-row': '%d1 / %d2'.replace('%d1', gridRowIndex).replace('%d2', gridRowIndex + 1),
                    '-ms-grid-row': '%d1'.replace('%d1', gridRowIndex),
                    '-ms-grid-row-span': '%d1'.replace('%d1', 1)
                };

                var prefectureIndivisualGridSelector = '%s1 .%s2[jmap-uniq="%s3"] '.replace('%s1', contentGridSelector).replace('%s2', params.prefectureClass).replace('%s3', pref.code);
                var prefectureIndivisualGridStyle = JSON.stringify(prefectureIndivisualGridCss).replace(/"/g, '').replace(/,/g, ';');
                stylersPrimal.push(prefectureIndivisualGridSelector + prefectureIndivisualGridStyle);

                if (gridColIndex >= params.gridNumber) {
                    gridColIndex = 0;
                    gridRowIndex += 1;
                }

                gridColIndex++;
            }

            // Prefecture Indivisual Hover
            if (params.selectable) {
                if (option.hoverColor) {

                    var prefectureIndivisualHoverCss = {
                        'background-color': option.hoverColor
                    };
                    var prefectureIndivisualHoverSelector = 'div[jmap-id="%s1"] .%s2[jmap-uniq="%s3"]:hover '.replace('%s1', uniqClass).replace('%s2', params.prefectureClass).replace('%s3', pref.code);
                    var prefectureIndivisualHoverStyle = JSON.stringify(prefectureIndivisualHoverCss).replace(/"/g, '').replace(/,/g, ';');
                    stylersPrimal.push(prefectureIndivisualHoverSelector + prefectureIndivisualHoverStyle);

                } else if (params.showHeatmap && option.number) {

                    var css = {
                        'background-color': option.color,
                        'opacity': '0.8'
                    };
                    var selector = 'div[jmap-id="%s1"] .%s2[jmap-uniq="%s3"]:hover '.replace('%s1', uniqClass).replace('%s2', params.prefectureClass).replace('%s3', pref.code);
                    var style = JSON.stringify(css).replace(/"/g, '').replace(/,/g, ';');
                    stylersPrimal.push(selector + style);

                }
            }

            // Prefecture
            var prefDiv = $('<div>')
                .data('data', pref)
                .addClass(params.prefectureClass)
                .attr('jmap-uniq', pref.code);

            // Prefecture Inner
            if (params.showPrefectureName && !option.name) {
                switch (params.prefectureNameType) {
                    case 'full':
                        prefDiv.html(pref.name + pref.full);
                        break;
                    case 'alphabet':
                        prefDiv.html(pref.alphabet);
                        break;
                    case 'short':
                    default:
                        prefDiv.html(pref.name);
                }
            } else if (params.showPrefectureName && option.name) {
                prefDiv.html(option.name);
            }

            if (params.showTextNoneSkewed && params.skew != 0) {
                var textDiv = $('<div>').html(prefDiv.html());
                prefDiv.html(textDiv);
            }

            contentDiv.append(prefDiv);
            setTimeout(function() {
                params.onLoad.call(prefDiv, null, pref)
            });
        });

        var jmapStyle = $('<style>').attr('type', 'text/css').html(stylers.join("\n") + "\n" + stylersPrimal.join("\n"));
        containerDiv.append(contentDiv)

        $(this).empty().append(jmapStyle).append(containerDiv);

        if (params.skew != 0) {

            // 角度変化による増加した幅
            // ( (height / tan( 90 - Θ ) - width) / 2
            var increasedWidth = ((contentDiv.height() / Math.tan((90 - params.skew) * (Math.PI / 180))) / 2).toFixed(3);
            var conteSkewCss = {
                'padding': '0 ' + increasedWidth + 'px',
                'transform': 'skew(-%d1deg)'.replace('%d1', params.skew)
            };
            var contentSkewSelector = 'div[jmap-id="%s1"] .%s2[jmap-skew="true"] '.replace('%s1', uniqClass).replace('%s2', params.contentClass);
            var contentSkewStyle = JSON.stringify(conteSkewCss).replace(/",/g, '";').replace(/"/g, '');
            stylersPrimal.push(contentSkewSelector + contentSkewStyle);
            jmapStyle.append(contentSkewSelector + contentSkewStyle + "\n");

            if (infoboxDiv) {
                var infoboxSkewCss = {
                    'margin-left': '-%d1'.replace('%d1', increasedWidth / 2 * 3 + 'px'),
                    'transform': 'skew(%d1deg)'.replace('%d1', params.skew)
                };
                var infoboxSkewSelector = '%s1 .%s2'.replace('%s1', contentSkewSelector).replace('%s2', params.infoboxClass);
                var infoboxSkewStyle = JSON.stringify(infoboxSkewCss).replace(/",/g, '";').replace(/"/g, '');
                stylersPrimal.push(infoboxSkewSelector + infoboxSkewStyle);
                jmapStyle.append(infoboxSkewSelector + infoboxSkewStyle + "\n");
            }
        }

        return this;
    };
})(jQuery);