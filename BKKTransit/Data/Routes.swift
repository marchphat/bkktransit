//
//  Routes.swift
//  BKKTransit
//
//  Created by Nantanat Thongthep on 24/3/2567 BE.
//

import Foundation

let routes: [[String]] = [
    // east bts
    ["CEN", "E1"], ["E1", "E2"], ["E2", "E3"], ["E3", "E4"], ["E4", "E5"],
    ["E5", "E6"], ["E6", "E7"], ["E7", "E8"], ["E8", "E9"], ["E9", "E10"],
    ["E10", "E11"], ["E11", "E12"], ["E12", "E13"], ["E13", "E14"], ["E14", "E15"],
    ["E15", "E16"], ["E16", "E17"], ["E17", "E18"], ["E18", "E19"], ["E19", "E20"],
    ["E20", "E21"], ["E21", "E22"], ["E22", "E23"],
    // north bts
    ["CEN", "N1"], ["N1", "N2"], ["N2", "N3"], ["N3", "N4"], ["N4", "N5"],
    ["N5", "N7"], ["N7", "N8"], ["N8", "N9"], ["N9", "N10"], ["N10", "N11"],
    ["N11", "N12"], ["N12", "N13"], ["N13", "N14"], ["N14", "N15"], ["N15", "N16"],
    ["N16", "N17"], ["N17", "N18"], ["N18", "N19"], ["N19", "N20"], ["N20", "N21"],
    ["N21", "N22"], ["N22", "N23"], ["N23", "N24"],
    // south bts
    ["CEN", "S1"], ["S1", "S2"], ["S2", "S3"], ["S3", "S4"], ["S4", "S5"],
    ["S5", "S6"], ["S6", "S7"], ["S7", "S8"], ["S8", "S9"], ["S9", "S10"],
    ["S10", "S11"], ["S11", "S12"],
    // west bts
    ["CEN", "W1"],
    // blue mrt
    ["BL01", "BL02"], ["BL02", "BL03"], ["BL03", "BL04"], ["BL04", "BL05"],
    ["BL05", "BL06"], ["BL06", "BL07"], ["BL07", "BL08"], ["BL08", "BL09"],
    ["BL09", "BL10"], ["BL10", "BL11"], ["BL11", "BL12"], ["BL12", "BL13"],
    ["BL13", "BL14"], ["BL14", "BL15"], ["BL15", "BL16"], ["BL16", "BL17"],
    ["BL17", "BL18"], ["BL18", "BL19"], ["BL19", "BL20"], ["BL20", "BL21"],
    ["BL21", "BL22"], ["BL22", "BL23"], ["BL23", "BL24"], ["BL24", "BL25"],
    ["BL25", "BL26"], ["BL26", "BL27"], ["BL27", "BL28"], ["BL28", "BL29"],
    ["BL29", "BL30"], ["BL30", "BL31"], ["BL31", "BL32"],
    ["BL32", "BL01"], ["BL33", "BL01"], ["BL33", "BL34"], ["BL34", "BL35"],
    ["BL35", "BL36"], ["BL36", "BL37"],
    ["BL37", "BL38"],
    // purple mrt
    ["PP01", "PP02"], ["PP02", "PP03"], ["PP03", "PP04"], ["PP04", "PP05"],
    ["PP05", "PP06"], ["PP06", "PP07"], ["PP07", "PP08"], ["PP08", "PP09"],
    ["PP09", "PP10"], ["PP10", "PP11"], ["PP11", "PP12"], ["PP12", "PP13"],
    ["PP13", "PP14"], ["PP14", "PP15"], ["PP15", "PP16"],
    // arl
    ["A1", "A2"], ["A2", "A3"], ["A3", "A4"], ["A4", "A5"], ["A5", "A6"],
    ["A6", "A7"], ["A7", "A8"],
    // intersect
    ["E4", "BL22"], ["A6", "BL21"], ["S2", "BL26"], ["N8", "BL13"],
    ["N9", "BL14"], ["PP16", "BL10"], ["S12", "BL34"], ["N2", "A8"],
    // gold bts
    ["G1", "G2"], ["G2", "G3"],
    // yellow mrt
    ["YL01", "YL02"], ["YL02", "YL03"], ["YL03", "YL04"], ["YL04", "YL05"],
    ["YL05", "YL06"], ["YL06", "YL07"], ["YL07", "YL08"], ["YL08", "YL09"],
    ["YL09", "YL10"], ["YL10", "YL11"], ["YL11", "YL12"], ["YL12", "YL13"],
    ["YL13", "YL14"], ["YL14", "YL15"], ["YL15", "YL16"], ["YL16", "YL17"],
    ["YL17", "YL18"], ["YL18", "YL19"], ["YL19", "YL20"], ["YL20", "YL21"],
    ["YL21", "YL22"], ["YL22", "YL23"],
    // pink mrt
    ["PK01", "PK02"], ["PK02", "PK03"], ["PK03", "PK04"], ["PK04", "PK05"],
    ["PK05", "PK06"], ["PK06", "PK07"], ["PK07", "PK08"], ["PK08", "PK09"],
    ["PK09", "PK10"], ["PK10", "PK11"], ["PK11", "PK12"], ["PK12", "PK13"],
    ["PK13", "PK14"], ["PK14", "PK15"], ["PK15", "PK16"], ["PK16", "PK17"],
    ["PK17", "PK18"], ["PK18", "PK19"],
    ["PK19", "PK20"], ["PK20", "PK21"], ["PK21", "PK22"], ["PK22", "PK23"],
    ["PK23", "PK24"], ["PK24", "PK25"], ["PK25", "PK26"], ["PK26", "PK27"],
    ["PK27", "PK28"], ["PK28", "PK29"], ["PK29", "PK30"],
    // darkred srt
    ["RCEN", "RN01"], ["RN01", "RN02"], ["RN02", "RN03"], ["RN03", "RN04"],
    ["RN04", "RN05"], ["RN05", "RN06"], ["RN06", "RN07"], ["RN07", "RN08"],
    ["RN08", "RN09"],
    // lightred srt
    ["RCEN", "RL01"], ["RL01", "RL02"], ["RL02", "RL03"],
    // new intersect
    ["E15", "YL23"], ["A4", "YL11"], ["BL15", "YL01"], ["S7", "G1"],
    ["BL11", "RCEN"], ["RL01", "PP15"], ["PP11", "PK01"], ["PK14", "RN05"],
    ["PK16", "N17"]
]


var stationLineColors: [String: String] = [
    // east bts
    "CEN": "lightgreen", "E1": "lightgreen", "E2": "lightgreen", "E3": "lightgreen", "E4": "lightgreen",
    "E5": "lightgreen", "E6": "lightgreen", "E7": "lightgreen", "E8": "lightgreen", "E9": "lightgreen",
    "E10": "lightgreen", "E11": "lightgreen", "E12": "lightgreen", "E13": "lightgreen", "E14": "lightgreen",
    "E15": "lightgreen", "E16": "lightgreen", "E17": "lightgreen", "E18": "lightgreen", "E19": "lightgreen",
    "E20": "lightgreen", "E21": "lightgreen", "E22": "lightgreen", "E23": "lightgreen",
    // north bts
    "N1": "lightgreen", "N2": "lightgreen", "N3": "lightgreen", "N4": "lightgreen", "N5": "lightgreen",
    "N7": "lightgreen", "N8": "lightgreen", "N9": "lightgreen", "N10": "lightgreen", "N11": "lightgreen",
    "N12": "lightgreen", "N13": "lightgreen", "N14": "lightgreen", "N15": "lightgreen", "N16": "lightgreen",
    "N17": "lightgreen", "N18": "lightgreen", "N19": "lightgreen", "N20": "lightgreen", "N21": "lightgreen",
    "N22": "lightgreen", "N23": "lightgreen", "N24": "lightgreen",
    // south bts
    "S1": "darkgreen", "S2": "darkgreen", "S3": "darkgreen", "S4": "darkgreen", "S5": "darkgreen",
    "S6": "darkgreen", "S7": "darkgreen", "S8": "darkgreen", "S9": "darkgreen", "S10": "darkgreen",
    "S11": "darkgreen", "S12": "darkgreen",
    // west bts
    "W1": "darkgreen",
    // blue mrt
    "BL01": "blue", "BL02": "blue", "BL03": "blue", "BL04": "blue",
    "BL05": "blue", "BL06": "blue", "BL07": "blue", "BL08": "blue",
    "BL09": "blue", "BL10": "blue", "BL11": "blue", "BL12": "blue",
    "BL13": "blue", "BL14": "blue", "BL15": "blue", "BL16": "blue",
    "BL17": "blue", "BL18": "blue", "BL19": "blue", "BL20": "blue",
    "BL21": "blue", "BL22": "blue", "BL23": "blue", "BL24": "blue",
    "BL25": "blue", "BL26": "blue", "BL27": "blue", "BL28": "blue",
    "BL29": "blue", "BL30": "blue", "BL31": "blue", "BL32": "blue",
    "BL33": "blue", "BL34": "blue", "BL35": "blue", "BL36": "blue",
    "BL37": "blue", "BL38": "blue",
    // purple mrt
    "PP01": "purple", "PP02": "purple", "PP03": "purple", "PP04": "purple",
    "PP05": "purple", "PP06": "purple", "PP07": "purple", "PP08": "purple",
    "PP09": "purple", "PP10": "purple", "PP11": "purple", "PP12": "purple",
    "PP13": "purple", "PP14": "purple", "PP15": "purple", "PP16": "purple",
    // arl
    "A1": "red", "A2": "red", "A3": "red", "A4": "red",
    "A5": "red", "A6": "red", "A7": "red", "A8": "red",
    // gold bts
    "G1": "gold", "G2": "gold", "G3": "gold",
    // yellow mrt
    "YL01": "yellow", "YL02": "yellow", "YL03": "yellow", "YL04": "yellow",
    "YL05": "yellow", "YL06": "yellow", "YL07": "yellow", "YL08": "yellow",
    "YL09": "yellow", "YL10": "yellow",
    "YL11": "yellow", "YL12": "yellow", "YL13": "yellow", "YL14": "yellow",
    "YL15": "yellow", "YL16": "yellow", "YL17": "yellow", "YL18": "yellow",
    "YL19": "yellow", "YL20": "yellow", "YL21": "yellow", "YL22": "yellow",
    "YL23": "yellow",
    // pink mrt
    "PK01": "pink", "PK02": "pink", "PK03": "pink", "PK04": "pink",
    "PK05": "pink", "PK06": "pink", "PK07": "pink", "PK08": "pink",
    "PK09": "pink", "PK10": "pink", "PK11": "pink", "PK12": "pink",
    "PK13": "pink", "PK14": "pink", "PK15": "pink", "PK16": "pink",
    "PK17": "pink", "PK18": "pink", "PK19": "pink", "PK20": "pink",
    "PK21": "pink", "PK22": "pink", "PK23": "pink", "PK24": "pink",
    "PK25": "pink", "PK26": "pink", "PK27": "pink", "PK28": "pink",
    "PK29": "pink", "PK30": "pink",
    // darkred srt
    "RCEN": "darkred", "RN01": "darkred", "RN02": "darkred", "RN03": "darkred",
    "RN04": "darkred", "RN05": "darkred", "RN06": "darkred", "RN07": "darkred",
    "RN08": "darkred", "RN09": "darkred",
    // lightred srt
    "RL01": "lightred", "RL02": "lightred", "RL03": "lightred"
]
