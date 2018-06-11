//
//  main.swift
//  AES
//  All rights reserved.
//

import Foundation

func getSymbol(str: String) -> Array<Int> {
// конвертация Unicod в Int
    var newArr = [Int]()
    let countStr = str.count
    for i in 0...countStr-1 {
        let index = str.index(str.startIndex, offsetBy: i)
        let s = String(str[index]).unicodeScalars
        print("!!\(s[s.startIndex].value)")
        newArr.append(Int(s[s.startIndex].value))
    }
    return newArr
}

let input_bytes = [0x00, 0x11, 0x22, 0x33, 0x44, 0x55, 0x66, 0x77,
                   0x88, 0x99, 0xaa, 0xbb, 0xcc, 0xdd, 0xee, 0xff]
let sbox = [0x63, 0x7C, 0x77, 0x7B, 0xF2, 0x6B, 0x6F, 0xC5, 0x30, 0x01, 0x67, 0x2B, 0xFE, 0xD7, 0xAB, 0x76,
            0xCA, 0x82, 0xC9, 0x7D, 0xFA, 0x59, 0x47, 0xF0, 0xAD, 0xD4, 0xA2, 0xAF, 0x9C, 0xA4, 0x72, 0xC0,
            0xB7, 0xFD, 0x93, 0x26, 0x36, 0x3F, 0xF7, 0xCC, 0x34, 0xA5, 0xE5, 0xF1, 0x71, 0xD8, 0x31, 0x15,
            0x04, 0xC7, 0x23, 0xC3, 0x18, 0x96, 0x05, 0x9A, 0x07, 0x12, 0x80, 0xE2, 0xEB, 0x27, 0xB2, 0x75,
            0x09, 0x83, 0x2C, 0x1A, 0x1B, 0x6E, 0x5A, 0xA0, 0x52, 0x3B, 0xD6, 0xB3, 0x29, 0xE3, 0x2F, 0x84,
            0x53, 0xD1, 0x00, 0xED, 0x20, 0xFC, 0xB1, 0x5B, 0x6A, 0xCB, 0xBE, 0x39, 0x4A, 0x4C, 0x58, 0xCF,
            0xD0, 0xEF, 0xAA, 0xFB, 0x43, 0x4D, 0x33, 0x85, 0x45, 0xF9, 0x02, 0x7F, 0x50, 0x3C, 0x9F, 0xA8,
            0x51, 0xA3, 0x40, 0x8F, 0x92, 0x9D, 0x38, 0xF5, 0xBC, 0xB6, 0xDA, 0x21, 0x10, 0xFF, 0xF3, 0xD2,
            0xCD, 0x0C, 0x13, 0xEC, 0x5F, 0x97, 0x44, 0x17, 0xC4, 0xA7, 0x7E, 0x3D, 0x64, 0x5D, 0x19, 0x73,
            0x60, 0x81, 0x4F, 0xDC, 0x22, 0x2A, 0x90, 0x88, 0x46, 0xEE, 0xB8, 0x14, 0xDE, 0x5E, 0x0B, 0xDB,
            0xE0, 0x32, 0x3A, 0x0A, 0x49, 0x06, 0x24, 0x5C, 0xC2, 0xD3, 0xAC, 0x62, 0x91, 0x95, 0xE4, 0x79,
            0xE7, 0xC8, 0x37, 0x6D, 0x8D, 0xD5, 0x4E, 0xA9, 0x6C, 0x56, 0xF4, 0xEA, 0x65, 0x7A, 0xAE, 0x08,
            0xBA, 0x78, 0x25, 0x2E, 0x1C, 0xA6, 0xB4, 0xC6, 0xE8, 0xDD, 0x74, 0x1F, 0x4B, 0xBD, 0x8B, 0x8A,
            0x70, 0x3E, 0xB5, 0x66, 0x48, 0x03, 0xF6, 0x0E, 0x61, 0x35, 0x57, 0xB9, 0x86, 0xC1, 0x1D, 0x9E,
            0xE1, 0xF8, 0x98, 0x11, 0x69, 0xD9, 0x8E, 0x94, 0x9B, 0x1E, 0x87, 0xE9, 0xCE, 0x55, 0x28, 0xDF,
            0x8C, 0xA1, 0x89, 0x0D, 0xBF, 0xE6, 0x42, 0x68, 0x41, 0x99, 0x2D, 0x0F, 0xB0, 0x54, 0xBB, 0x16]
let inv_sbox = [0x52, 0x09, 0x6A, 0xD5, 0x30, 0x36, 0xA5, 0x38, 0xBF, 0x40, 0xA3, 0x9E, 0x81, 0xF3, 0xD7, 0xFB,
                0x7C, 0xE3, 0x39, 0x82, 0x9B, 0x2F, 0xFF, 0x87, 0x34, 0x8E, 0x43, 0x44, 0xC4, 0xDE, 0xE9, 0xCB,
                0x54, 0x7B, 0x94, 0x32, 0xA6, 0xC2, 0x23, 0x3D, 0xEE, 0x4C, 0x95, 0x0B, 0x42, 0xFA, 0xC3, 0x4E,
                0x08, 0x2E, 0xA1, 0x66, 0x28, 0xD9, 0x24, 0xB2, 0x76, 0x5B, 0xA2, 0x49, 0x6D, 0x8B, 0xD1, 0x25,
                0x72, 0xF8, 0xF6, 0x64, 0x86, 0x68, 0x98, 0x16, 0xD4, 0xA4, 0x5C, 0xCC, 0x5D, 0x65, 0xB6, 0x92,
                0x6C, 0x70, 0x48, 0x50, 0xFD, 0xED, 0xB9, 0xDA, 0x5E, 0x15, 0x46, 0x57, 0xA7, 0x8D, 0x9D, 0x84,
                0x90, 0xD8, 0xAB, 0x00, 0x8C, 0xBC, 0xD3, 0x0A, 0xF7, 0xE4, 0x58, 0x05, 0xB8, 0xB3, 0x45, 0x06,
                0xD0, 0x2C, 0x1E, 0x8F, 0xCA, 0x3F, 0x0F, 0x02, 0xC1, 0xAF, 0xBD, 0x03, 0x01, 0x13, 0x8A, 0x6B,
                0x3A, 0x91, 0x11, 0x41, 0x4F, 0x67, 0xDC, 0xEA, 0x97, 0xF2, 0xCF, 0xCE, 0xF0, 0xB4, 0xE6, 0x73,
                0x96, 0xAC, 0x74, 0x22, 0xE7, 0xAD, 0x35, 0x85, 0xE2, 0xF9, 0x37, 0xE8, 0x1C, 0x75, 0xDF, 0x6E,
                0x47, 0xF1, 0x1A, 0x71, 0x1D, 0x29, 0xC5, 0x89, 0x6F, 0xB7, 0x62, 0x0E, 0xAA, 0x18, 0xBE, 0x1B,
                0xFC, 0x56, 0x3E, 0x4B, 0xC6, 0xD2, 0x79, 0x20, 0x9A, 0xDB, 0xC0, 0xFE, 0x78, 0xCD, 0x5A, 0xF4,
                0x1F, 0xDD, 0xA8, 0x33, 0x88, 0x07, 0xC7, 0x31, 0xB1, 0x12, 0x10, 0x59, 0x27, 0x80, 0xEC, 0x5F,
                0x60, 0x51, 0x7F, 0xA9, 0x19, 0xB5, 0x4A, 0x0D, 0x2D, 0xE5, 0x7A, 0x9F, 0x93, 0xC9, 0x9C, 0xEF,
                0xA0, 0xE0, 0x3B, 0x4D, 0xAE, 0x2A, 0xF5, 0xB0, 0xC8, 0xEB, 0xBB, 0x3C, 0x83, 0x53, 0x99, 0x61,
                0x17, 0x2B, 0x04, 0x7E, 0xBA, 0x77, 0xD6, 0x26, 0xE1, 0x69, 0x14, 0x63, 0x55, 0x21, 0x0C, 0x7D]

//let rcon = [[0x8d, 0x01, 0x02, 0x04, 0x08, 0x10, 0x20, 0x40, 0x80, 0x1b, 0x36, 0x6c, 0xd8, 0xab, 0x4d, 0x9a],
//            [0x2f, 0x5e, 0xbc, 0x63, 0xc6, 0x97, 0x35, 0x6a, 0xd4, 0xb3, 0x7d, 0xfa, 0xef, 0xc5, 0x91, 0x39],
//            [0x72, 0xe4, 0xd3, 0xbd, 0x61, 0xc2, 0x9f, 0x25, 0x4a, 0x94, 0x33, 0x66, 0xcc, 0x83, 0x1d, 0x3a],
//            [0x74, 0xe8, 0xcb, 0x8d, 0x01, 0x02, 0x04, 0x08, 0x10, 0x20, 0x40, 0x80, 0x1b, 0x36, 0x6c, 0xd8],
//            [0xab, 0x4d, 0x9a, 0x2f, 0x5e, 0xbc, 0x63, 0xc6, 0x97, 0x35, 0x6a, 0xd4, 0xb3, 0x7d, 0xfa, 0xef],
//            [0xc5, 0x91, 0x39, 0x72, 0xe4, 0xd3, 0xbd, 0x61, 0xc2, 0x9f, 0x25, 0x4a, 0x94, 0x33, 0x66, 0xcc],
//            [0x83, 0x1d, 0x3a, 0x74, 0xe8, 0xcb, 0x8d, 0x01, 0x02, 0x04, 0x08, 0x10, 0x20, 0x40, 0x80, 0x1b],
//            [0x36, 0x6c, 0xd8, 0xab, 0x4d, 0x9a, 0x2f, 0x5e, 0xbc, 0x63, 0xc6, 0x97, 0x35, 0x6a, 0xd4, 0xb3],
//            [0x7d, 0xfa, 0xef, 0xc5, 0x91, 0x39, 0x72, 0xe4, 0xd3, 0xbd, 0x61, 0xc2, 0x9f, 0x25, 0x4a, 0x94],
//            [0x33, 0x66, 0xcc, 0x83, 0x1d, 0x3a, 0x74, 0xe8, 0xcb, 0x8d, 0x01, 0x02, 0x04, 0x08, 0x10, 0x20],
//            [0x40, 0x80, 0x1b, 0x36, 0x6c, 0xd8, 0xab, 0x4d, 0x9a, 0x2f, 0x5e, 0xbc, 0x63, 0xc6, 0x97, 0x35],
//            [0x6a, 0xd4, 0xb3, 0x7d, 0xfa, 0xef, 0xc5, 0x91, 0x39, 0x72, 0xe4, 0xd3, 0xbd, 0x61, 0xc2, 0x9f],
//            [0x25, 0x4a, 0x94, 0x33, 0x66, 0xcc, 0x83, 0x1d, 0x3a, 0x74, 0xe8, 0xcb, 0x8d, 0x01, 0x02, 0x04],
//            [0x08, 0x10, 0x20, 0x40, 0x80, 0x1b, 0x36, 0x6c, 0xd8, 0xab, 0x4d, 0x9a, 0x2f, 0x5e, 0xbc, 0x63],
//            [0xc6, 0x97, 0x35, 0x6a, 0xd4, 0xb3, 0x7d, 0xfa, 0xef, 0xc5, 0x91, 0x39, 0x72, 0xe4, 0xd3, 0xbd],
//            [0x61, 0xc2, 0x9f, 0x25, 0x4a, 0x94, 0x33, 0x66, 0xcc, 0x83, 0x1d, 0x3a, 0x74, 0xe8, 0xcb, 0x8d]]
let rcon = [ [0x01, 0x02, 0x04, 0x08, 0x10, 0x20, 0x40, 0x80, 0x1b, 0x36],
        [0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00],
        [0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00],
        [0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00] ]
let nb = 4
let nr = 10
let nk = 4

func key_expansion(key: [Int]) -> Array<Array<Int>> {
    // дополним ключ с "0x01", если он не 128 бит
    var full_k = [Int]()
    full_k = key
    //var key_symbols = getSymbol(str: key) // unicode
    if (key.count < 4*nk) {
        for i in key.count...(4*nk - 1) {
            full_k.append(0x01)
        }
    }
    print("Ключ: \n\(full_k)")
    
    var key_schedule = [[Int]](repeating: [Int](repeating: 0, count: 4), count: 4)
    for r in 0...3 {
        for c in 0...nk-1 {
            key_schedule[r][c] = full_k[r + 4*c] // KeySchedule[r][c] = SecretKey[r + 4c], r = 0,1...4; c = 0,1..Nk.
        }
    }

    var tmp = [Int](repeating: 0, count: 4)
    //продолжаем заполнять KeySchedule
    for col in nk...nb*(nr + 1)-1 { //# col - column number
        if col % nk == 0 {
            //shifted (col - 1)th column...
            for row in 0...3 {
                tmp[row] = key_schedule[row][col-1] //tmp
            }
            tmp.append(key_schedule[0][col-1])
            //SubWords с использованием Sbox-table как в SubBytes
            for j in 0...tmp.count-1 {
                let sbox_row = Int(tmp[j] / 0x10) // !!?
                let sbox_col = tmp[j] % 0x10
                let sbox_elem =  sbox[16*sbox_row + sbox_col]
                tmp[j] = sbox_elem
            }
            // XOR of 3 columns
            for row in 0...3 {
                let s = key_schedule[row][col - 4]^tmp[row]^rcon[row][col/nk - 1]
                key_schedule[row].append(s)
            }
        }
        else {
            //XOR of 2 columns
            for row in 0...3 {
                let s = key_schedule[row][col - 4]^key_schedule[row][col - 1]
                key_schedule[row].append(s)
            }
        }
    }
    print("Расширение: \n\(key_schedule)")
    return key_schedule
}

func sub_bytes(state: [[Int]], inv: Bool) -> Array<Array<Int>> {
    var box = [Int]()
    var new_state = [[Int]](repeating: [Int](repeating: 0, count: 4), count: 4)
    
    if (inv == false) { // encrypt
        box = sbox
    }
    else {   // decrypt
        box = inv_sbox
    }
    
    for i in 0...3 {
        for j in 0...3 {
            let row = (state[i][j] / 0x10)
            let col = (state[i][j] % 0x10)
            
//            # Our Sbox is a flat array, not a bable. So, we use this trich to find elem:
            let box_elem = box[16*row + col]
            new_state[i][j] = box_elem
        }
    }
    return new_state
}

func add_round_key(state: [[Int]], key_schedule: [[Int]], round: Int) -> Array<Array<Int>> {
    var s0,s1,s2,s3: Int
    var new_state = [[Int]](repeating: [Int](repeating: 0, count: 4), count: 4)
    for col in 0...(nk-1)
        //    # nb*round is a shift which indicates start of a part of the KeySchedule
    {
        s0 = state[0][col]^key_schedule[0][nb*round + col]
        s1 = state[1][col]^key_schedule[1][nb*round + col]
        s2 = state[2][col]^key_schedule[2][nb*round + col]
        s3 = state[3][col]^key_schedule[3][nb*round + col]
        
        new_state[0][col] = s0
        new_state[1][col] = s1
        new_state[2][col] = s2
        new_state[3][col] = s3
    }
    return new_state
}

func left_shift(array: [Int], line: Int) -> Array<Int> {
    var res = [Int](repeating: 0, count: 4 )
    
    let temp = array
    switch line {
    case 1:
        for i in 1...3 {
            res[i-1] = array[i]
        }
        res[3] = temp[0]
    case 2:
        for i in 2...3 {
            res[i-2] = array[i]
        }
        res[2] = temp[0]
        res[3] = temp[1]
    case 3: // for row 4
        res[0] = temp[3]
        res[1] = temp[0]
        res[2] = temp[1]
        res[3] = temp[2]
    default:
        res = temp
    }
    return res
}
func right_shift(array: [Int], line: Int) -> Array<Int> {
    var res = [Int](repeating: 0, count: 4 )
    let temp = array
    switch line {
    case 1:
        for i in 0...2 {
            res[i+1] = array[i]
        }
        res[0] = temp[3]
    case 2:
        for i in 0...1 {
            res[i+2] = array[i]
        }
        res[0] = temp[2]
        res[1] = temp[3]
    case 3: // for row 4
        res[0] = temp[1]
        res[1] = temp[2]
        res[2] = temp[3]
        res[3] = temp[0]
    default:
        res = temp
    }
    return res
}

func shift_rows(state: [[Int]], inv: Bool) -> Array<Array<Int>> {
    var new_state = [[Int]](repeating: [Int](repeating: 0, count: 4), count: 4)
    var count = 1
    if (inv == false) {// encrypt
        for i in 0...(nb-1) {
            new_state[i] = left_shift(array: state[i], line: i)
            count += 1
        }
    }
    else {// decrypt
        for i in 0...(nb-1) {
            new_state[i] = right_shift(array: state[i], line: i)
            count += 1
        }
    }
    return new_state
}

func mul_by_02(num: Int) -> Int {
    var res: Int
    if (num < 0x80) {
        res =  (num << 1)
    }
    else
    {
        res =  (num << 1)^0x1b
    }
    return res % 0x100
}
func mul_by_03(num: Int) -> Int {
    return mul_by_02(num: num)^num
}
func mul_by_09(num: Int) -> Int {
    return mul_by_02(num: mul_by_02(num: mul_by_02(num: num)))^num //    #return mul_by_03(num)^mul_by_03(num)^mul_by_03(num)
}

func mul_by_0b(num: Int) -> Int {
    return mul_by_02(num: mul_by_02(num: mul_by_02(num: num)))^mul_by_02(num: num)^num //    #return mul_by_09(num)^mul_by_02(num)
}

func mul_by_0d(num: Int) -> Int {
    return mul_by_02(num: mul_by_02(num: mul_by_02(num: num)))^mul_by_02(num: mul_by_02(num: num))^num //    #return mul_by_0b(num)^mul_by_02(num)
}
func mul_by_0e(num: Int) -> Int {
    return mul_by_02(num: mul_by_02(num:mul_by_02(num: num)))^mul_by_02(num:mul_by_02(num: num))^mul_by_02(num: num) //    #return mul_by_0d(num)^num
}

func mix_columns(state:[[Int]], inv: Bool) -> Array<Array<Int>> {
    var s0,s1,s2,s3: Int
    var new_state = [[Int]](repeating: [Int](repeating: 0, count: 4), count: 4)
    for i in 0...nb-1 {
        if (inv == false) {
            s0 = mul_by_02(num: state[0][i])^mul_by_03(num: state[1][i])^state[2][i]^state[3][i]
            s1 = state[0][i]^mul_by_02(num: state[1][i])^mul_by_03(num: state[2][i])^state[3][i]
            s2 = state[0][i]^state[1][i]^mul_by_02(num: state[2][i])^mul_by_03(num: state[3][i])
            s3 = mul_by_03(num: state[0][i])^state[1][i]^state[2][i]^mul_by_02(num: state[3][i])
        }
        else { // decryption
            s0 = mul_by_0e(num: state[0][i])^mul_by_0b(num: state[1][i])^mul_by_0d(num: state[2][i])^mul_by_09(num: state[3][i])
            s1 = mul_by_09(num: state[0][i])^mul_by_0e(num: state[1][i])^mul_by_0b(num: state[2][i])^mul_by_0d(num: state[3][i])
            s2 = mul_by_0d(num: state[0][i])^mul_by_09(num: state[1][i])^mul_by_0e(num: state[2][i])^mul_by_0b(num: state[3][i])
            s3 = mul_by_0b(num: state[0][i])^mul_by_0d(num: state[1][i])^mul_by_09(num: state[2][i])^mul_by_0e(num: state[3][i])
        }
        new_state[0][i] = s0
        new_state[1][i] = s1
        new_state[2][i] = s2
        new_state[3][i] = s3
    }
    return new_state
}

// ФУНКЦИЯ ШИФРОВАНИЯ //
func encrypt(input_bytes: [Int], key: [Int]) -> Array<Int> {
    //# let's prepare our input data: State array and KeySchedule
    var state = [[Int]](repeating: [Int](repeating: 0, count: 4), count: 4)
    for r in 0...3 {
        for c in 0...(nb-1) {
            state[r][c] = input_bytes[r + 4*c]
        }
    }
    let key_schedule = key_expansion(key: k)
    state = add_round_key(state: state, key_schedule: key_schedule, round: 0)
    var rnd = 0
    for rnd in 0...nr-1 {
        state = sub_bytes(state: state, inv: false)
        state = shift_rows(state: state, inv: false)
        state = mix_columns(state: state, inv: false)
        state = add_round_key(state: state, key_schedule: key_schedule, round: rnd)
    }
    // последний раунд
    state = sub_bytes(state: state, inv: false)
    state = shift_rows(state: state, inv: false)
    state = add_round_key(state: state, key_schedule: key_schedule, round: rnd)

    var output = [Int]( repeating: 0, count: (4*nb) )//None for i in range(4*nb)
    for r in 0...3 {
        for c in 0...(nb-1) {
            output[r + 4*c] = state[r][c]
            print("[hex]\t|plain: \(String(input_bytes[r + 4*c], radix: 16)) \t|cipher: \(String(output[r + 4*c], radix: 16))")
        }
    }
    return output
}
// ФУНКЦИЯ РАСШИФРОВКИ //
func decrypt(cipher: [Int], key: [Int]) -> Array<Int> {
    var state = [[Int]](repeating: [Int](repeating: 0, count: nb), count: 4)
    for r in 0...3 {
        for c in 0...nb-1 {
            state[r].append(cipher[r + 4 * c])
        }
    }
    let key_schedule = key_expansion(key: k)
    
    state = add_round_key(state: state, key_schedule: key_schedule, round: nr)
    
    var rnd = nr - 1
    while rnd >= 1 {
        state = shift_rows(state: state, inv: true)
        state = sub_bytes(state: state, inv: true)
        state = add_round_key(state: state, key_schedule: key_schedule, round: rnd)
        state = mix_columns(state: state, inv: true)
        
        rnd -= 1
    }
    state = shift_rows(state: state, inv: true)
    state = sub_bytes(state: state, inv: true)
    state = add_round_key(state: state, key_schedule: key_schedule, round: rnd)
    
    var output = [Int]( repeating: 0, count: (4*nb) )//None for i in range(4*nb)
    for r in 0...3 {
        for c in 0...(nb-1) {
            output[r + 4 * c] = state[r][c]
            print("[hex]\t|cipher: \(String(cipher[r + 4*c], radix: 16)) \t|plain: \(String(output[r + 4*c], radix: 16))")
        }
    }
    return output
}


// "square" property //
func square_encrypt(input_bytes: [Int], key: [Int]) -> Array<Int> {
    //# let's prepare our input data: State array and KeySchedule
    var state = [[Int]](repeating: [Int](repeating: 0, count: 4), count: 4)
    for r in 0...3 {
        for c in 0...(nb-1) {
            state[r][c] = input_bytes[r + 4*c]
        }
    }
    let key_schedule = key_expansion(key: k)
    state = add_round_key(state: state, key_schedule: key_schedule, round: 0)
    for rnd in 0...3 {
        state = sub_bytes(state: state, inv: false)
        state = shift_rows(state: state, inv: false)
        state = mix_columns(state: state, inv: false)
        state = add_round_key(state: state, key_schedule: key_schedule, round: rnd)
    }
    
    var output = [Int]( repeating: 0, count: (4*nb) )//None for i in range(4*nb)
    for r in 0...3 {
        for c in 0...(nb-1) {
            output[r + 4*c] = state[r][c]
            print("[hex]\t|plain: \(String(input_bytes[r + 4*c], radix: 16)) \t|cipher: \(String(output[r + 4*c], radix: 16))")
        }
    }
    return output
}

/// Тест ///
let k = [0x24, 0x75, 0xA2, 0xB3, 0x34, 0x75, 0x56, 0x88,
         0x31, 0xE2, 0x12, 0x00, 0x13, 0xAA]//, 0x54, 0x87] // 32 Байта //// пример Паши

var user_state = [[Int]](repeating: [Int](repeating: 0, count: 4), count: 4)
for r in 1...3 {
    for c in 1...nb-1 {
        user_state[r][c] = input_bytes[r + 4*c]
    }
}
print("\n\t\t_____Полный цикл шифр./расш._____")
let cipherText = encrypt(input_bytes: input_bytes, key: k)
let decryptCipherText = decrypt(cipher: cipherText, key: k) // расшифровка
print("\n\t\t_____Square_____")
let square_cipherText = square_encrypt(input_bytes: input_bytes, key: k)

print("\n[decimal] \nKey: \(k) \nPlaintext: \(input_bytes)\nCiphertext: \(cipherText)")

