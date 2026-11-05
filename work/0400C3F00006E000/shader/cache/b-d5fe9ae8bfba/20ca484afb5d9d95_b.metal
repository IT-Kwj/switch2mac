#include <metal_stdlib>
#include <simd/simd.h>

using namespace metal;

struct dm_border_t { uint mask; float4 k[32]; };
static inline __attribute__((always_inline)) float4 dm_bmix(float4 r, float4 w, float4 k) { return r + (w - r) * k; }
static inline __attribute__((always_inline)) float dm_bmix(float r, float w, float4 k) { return r + (w - r) * k.x; }
template<typename V, typename T, typename... A> static inline __attribute__((always_inline)) V dm_bs(V r, constant dm_border_t* b, uint i, T t, sampler w, A... a)
{
    if (b->mask >> i & 1u) r = dm_bmix(r, t.sample(w, a...), b->k[i]);
    return r;
}

struct _10
{
    uint _m0;
    uint _m1[8];
    float4 _m2;
    float4 _m3;
    int _m4;
    float _m5[73];
    int4 _m6;
    int _m7;
};

struct _16
{
    float4 _m0[4096];
};

struct spvDescriptorSetBuffer0
{
    constant _16* fp_c4 [[id(0)]];
    constant _16* fp_c3 [[id(1)]];
    texture2d<float> fp_t_tcb_8 [[id(2)]];
    sampler fp_t_tcb_8Smplr [[id(3)]];
    texture2d<float> fp_t_tcb_E [[id(4)]];
    sampler fp_t_tcb_ESmplr [[id(5)]];
    texture2d<float> fp_t_tcb_A [[id(6)]];
    sampler fp_t_tcb_ASmplr [[id(7)]];
    texture2d<float> fp_t_tcb_C [[id(8)]];
    sampler fp_t_tcb_CSmplr [[id(9)]];
    sampler fp_t_tcb_8Smplr_w [[id(10)]];
    sampler fp_t_tcb_ESmplr_w [[id(11)]];
    sampler fp_t_tcb_ASmplr_w [[id(12)]];
    sampler fp_t_tcb_CSmplr_w [[id(13)]];
    constant dm_border_t* dm_border [[id(14)]];
};

struct main0_out
{
    float4 m_50 [[color(0)]];
};

struct main0_in
{
    float4 m_39 [[user(locn0)]];
    float4 m_43 [[user(locn1)]];
    float4 m_47 [[user(locn2)]];
    float4 m_41 [[user(locn3), flat]];
    float4 m_37 [[user(locn4)]];
    float4 m_45 [[user(locn5)]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    float _57 = gl_FragCoord.w;
    float _59 = in.m_37.w;
    float _61 = gl_FragCoord.w;
    float _63 = _59 * _61;
    float _65 = in.m_37.x;
    float _67 = gl_FragCoord.w;
    float _69 = _65 * _67;
    float _71 = in.m_37.y;
    float _73 = gl_FragCoord.w;
    float _75 = _71 * _73;
    float _77 = 1.0 / _57;
    float _79 = _77 * _63;
    float _81 = _77 * _69;
    float _83 = _77 * _75;
    float _85 = 1.0 / _79;
    float _87 = _81 * _85;
    float _89 = _83 * _85;
    float _91 = fma(_87, 0.5, 0.5);
    float _93 = fma(_89, -0.5, 0.5);
    float2 _708 = float2(_91, _93);
    float _95 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_708, float2(0.0), isnan(_708))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_708, float2(0.0), isnan(_708))).x;
    float _97 = in.m_39.y;
    float _99 = gl_FragCoord.w;
    float _101 = _97 * _99;
    float _103 = in.m_39.x;
    float _105 = gl_FragCoord.w;
    float _107 = _103 * _105;
    float _109 = in.m_39.z;
    float _111 = gl_FragCoord.w;
    float _113 = _109 * _111;
    float _115 = in.m_41.x;
    float _117 = in.m_43.y;
    float _119 = gl_FragCoord.w;
    float _121 = _117 * _119;
    float _123 = in.m_43.x;
    float _125 = gl_FragCoord.w;
    float _127 = _123 * _125;
    float _129 = _89 * (*spvDescriptorSet0.fp_c3)._m0[7].y;
    float _131 = _77 * _101;
    float _133 = _77 * _107;
    float _135 = in.m_43.z;
    float _137 = gl_FragCoord.w;
    float _139 = _135 * _137;
    float _141 = _77 * _113;
    float _143 = _131 * _131;
    int _146 = as_type<int>(_115) * 96;
    float _148 = _77 * _121;
    float _150 = _77 * _127;
    float _152 = fma(_133, _133, _143);
    int _154 = _146 + 12;
    uint _157 = uint(int(uint(_154) >> uint(2)));
    uint _159 = uint(int(uint(int(_157)) >> uint(2)));
    int _161 = int(_157) & 3;
    float _163 = (*spvDescriptorSet0.fp_c4)._m0[int(_159)][_161];
    float _165 = _148 * _148;
    float _167 = fma(_141, _141, _152);
    float _169 = fma(_150, _150, _165);
    float _171 = rsqrt(_167);
    float _173 = _131 * _171;
    float _175 = _133 * _171;
    float _177 = _77 * _139;
    float _179 = _141 * _171;
    float _181 = _148 * _173;
    float _183 = _173 * _173;
    float _185 = fma(_177, _177, _169);
    float _187 = fma(_150, _175, _181);
    float _189 = fma(_175, _175, _183);
    float _191 = -_163;
    float _193 = fma(_191, _163, _185);
    float _195 = _89 * (*spvDescriptorSet0.fp_c3)._m0[6].y;
    float _197 = fma(_177, _179, _187);
    float _199 = fma(_179, _179, _189);
    float _201 = fma(_87, (*spvDescriptorSet0.fp_c3)._m0[6].x, _195);
    float _203 = _197 * 2.0;
    float _205 = _199 * _193;
    float _207 = _205 * 4.0;
    float _209 = _199 * 2.0;
    float _211 = -_207;
    float _213 = fma(_203, _203, _211);
    int _215 = _146 + 80;
    uint _217 = uint(int(uint(_215) >> uint(2)));
    uint _219 = uint(int(uint(int(_217)) >> uint(2)));
    int _221 = int(_217) & 3;
    float _223 = (*spvDescriptorSet0.fp_c4)._m0[int(_219)][_221];
    int _225 = int(_217) + 1;
    uint _227 = uint(int(uint(_225) >> uint(2)));
    int _229 = _225 & 3;
    float _231 = (*spvDescriptorSet0.fp_c4)._m0[int(_227)][_229];
    float _233 = 1.0 / _209;
    float _235 = sqrt(_213);
    float _237 = -_203;
    float _239 = -_235;
    float _241 = _237 + _239;
    float _243 = -_203;
    float _245 = _243 + _235;
    float _247 = fma(_87, (*spvDescriptorSet0.fp_c3)._m0[7].x, _129);
    int _249 = _146 + 88;
    uint _251 = uint(int(uint(_249) >> uint(2)));
    uint _253 = uint(int(uint(int(_251)) >> uint(2)));
    int _255 = int(_251) & 3;
    float _257 = (*spvDescriptorSet0.fp_c4)._m0[int(_253)][_255];
    int _259 = int(_251) + 1;
    uint _261 = uint(int(uint(_259) >> uint(2)));
    int _263 = _259 & 3;
    float _265 = (*spvDescriptorSet0.fp_c4)._m0[int(_261)][_263];
    float _267 = _241 * _233;
    float _269 = _245 * _233;
    float _271 = precise::max(_267, (*spvDescriptorSet0.fp_c3)._m0[8].w);
    float _273 = precise::max(_269, (*spvDescriptorSet0.fp_c3)._m0[8].w);
    float _275 = fma(_173, _271, _148);
    float _277 = fma(_173, _273, _148);
    float _279 = _275 * _231;
    float _281 = _277 * _231;
    float _283 = fma(_175, _273, _150);
    float _285 = fma(_179, _273, _177);
    float _287 = fma(_283, _223, _281);
    float _289 = fma(_285, _257, _287);
    float _291 = _289 + _265;
    float _293 = fma(_95, 2.0, -1.0);
    float _295 = fma(_175, _271, _150);
    float _297 = fma(_179, _271, _177);
    float _299 = fma(_293, (*spvDescriptorSet0.fp_c3)._m0[7].z, _247);
    float _301 = fma(_295, _223, _279);
    float _303 = fma(_293, (*spvDescriptorSet0.fp_c3)._m0[6].z, _201);
    float _305 = _299 + (*spvDescriptorSet0.fp_c3)._m0[7].w;
    float _307 = fma(_297, _257, _301);
    float _309 = _303 + (*spvDescriptorSet0.fp_c3)._m0[6].w;
    float _311 = _307 + _265;
    float _313 = 1.0 / _305;
    float _315 = _309 * _313;
    bool _319 = _311 >= _315;
    bool _321 = isnan(_311);
    bool _323 = _319 || _321;
    bool _325 = isnan(_315);
    bool _327 = _323 || _325;
    bool _329 = _291 < _315;
    bool _331 = !_327;
    bool _333 = _329 && _331;
    float _335 = in.m_45.x;
    float _337 = gl_FragCoord.w;
    float _339 = _335 * _337;
    float _341 = in.m_45.z;
    float _343 = gl_FragCoord.w;
    float _345 = _341 * _343;
    if (_333)
    {
        discard_fragment();
    }
    float _347 = _77 * _339;
    float _349 = _77 * _345;
    float _351 = fma(_347, 6.2500002968590706586837768554688e-05, 0.5);
    float _353 = fma(_349, 6.2500002968590706586837768554688e-05, 0.5);
    float2 _1123 = float2(_351, _353);
    float3 _357 = dm_bs(spvDescriptorSet0.fp_t_tcb_E.sample(spvDescriptorSet0.fp_t_tcb_ESmplr, select(_1123, float2(0.0), isnan(_1123))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_E, spvDescriptorSet0.fp_t_tcb_ESmplr_w, select(_1123, float2(0.0), isnan(_1123))).xyz;
    float _359 = _357.x;
    float _361 = _357.y;
    float _363 = _357.z;
    float2 _1137 = float2(_351, _353);
    float _365 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_1137, float2(0.0), isnan(_1137))), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_1137, float2(0.0), isnan(_1137))).x;
    float2 _1145 = float2(_351, _353);
    float3 _367 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, select(_1145, float2(0.0), isnan(_1145))), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, select(_1145, float2(0.0), isnan(_1145))).xyz;
    float _369 = _367.x;
    float _371 = _367.y;
    float _373 = _367.z;
    float _375 = 1.0 / _199;
    float _377 = -_150;
    float _379 = -_181;
    float _381 = fma(_377, _175, _379);
    float _383 = in.m_47.y;
    float _385 = gl_FragCoord.w;
    float _387 = _383 * _385;
    float _389 = in.m_47.x;
    float _391 = gl_FragCoord.w;
    float _393 = _389 * _391;
    float _395 = in.m_47.z;
    float _397 = gl_FragCoord.w;
    float _399 = _395 * _397;
    float _401 = -_177;
    float _403 = fma(_401, _179, _381);
    bool _405 = _291 < _315;
    float _407 = 1.0 / _163;
    float _409 = in.m_45.y;
    float _411 = gl_FragCoord.w;
    float _413 = _409 * _411;
    float _415 = _403 * _375;
    float _417 = precise::max(0.0, _415);
    float _419 = fma(_173, _417, _148);
    float _421 = fma(_175, _417, _150);
    float _423 = fma(_179, _417, _177);
    float _425 = _419 * _419;
    float _427 = fma(_421, _421, _425);
    float _429 = _77 * _387;
    float _431 = _77 * _393;
    float _433 = _77 * _399;
    float _435 = fma(_423, _423, _427);
    float _437 = _429 * _429;
    float _439 = _77 * _413;
    float _441 = sqrt(_435);
    float _443 = fma(_431, _431, _437);
    float _445 = fma(_433, _433, _443);
    float _447 = rsqrt(_445);
    float _449 = _441 * _407;
    float _451 = precise::clamp(_449, 0.0, 1.0);
    float _453 = _429 * _447;
    float _455 = fma(_361, 0.07999999821186065673828125, 0.0199999995529651641845703125);
    float _457 = fma(_365, (*spvDescriptorSet0.fp_c3)._m0[9].y, (*spvDescriptorSet0.fp_c3)._m0[9].x);
    float _459 = _455 * 100.0;
    float _461 = _455 * 5115.0;
    float _463 = 1.0 / _455;
    float _465 = exp2(_459);
    float _467 = fma(_465, 512.0, -512.0);
    float _469 = 1.0 / _467;
    float _471 = _461 * _469;
    float _473 = log2(_471);
    if (!_327)
    {
        if (_405)
        {
            out.m_50.x = 0.0;
            out.m_50.y = 0.0;
            out.m_50.z = 0.0;
            out.m_50.w = 0.0;
            return out;
        }
    }
    float _475 = precise::min(_311, _291);
    float _477 = _457 + (*spvDescriptorSet0.fp_c3)._m0[9].z;
    float _479 = precise::max(_311, _291);
    float _481 = fma(_473, _463, 100.0);
    float _483 = precise::max(_315, _475);
    float _485 = -_477;
    float _487 = _485 + _439;
    float _489 = precise::max(_315, _479);
    float _491 = fma(_363, _363, 1.0);
    float _493 = -_451;
    float _495 = _493 + 1.0;
    float _497 = precise::max(0.0, _487);
    float _499 = -_483;
    float _501 = _499 + _489;
    float _503 = fma(_363, -2.0, _491);
    float _505 = fma(_359, -0.99447572231292724609375, 1.0);
    float _507 = _453 * _501;
    float _509 = -_481;
    float _511 = _509 + _497;
    float _513 = abs(_495);
    float _515 = log2(_513);
    float _517 = -_363;
    float _519 = fma(_517, _363, 1.0);
    int _521 = as_type<int>(_115) * 96;
    int _523 = _521 + 28;
    float _525 = abs(_507);
    bool _527 = _525 > 0.00999999977648258209228515625;
    float _529 = _455 * _511;
    int _531 = _523 + (-4);
    uint _533 = uint(int(uint(_531) >> uint(2)));
    uint _535 = uint(int(uint(int(_533)) >> uint(2)));
    int _537 = int(_533) & 3;
    float _539 = (*spvDescriptorSet0.fp_c4)._m0[int(_535)][_537];
    float _541 = _527 ? _507 : 0.00999999977648258209228515625;
    float _543 = abs(_503);
    float _545 = log2(_543);
    float _547 = _455 * _541;
    int _549 = _523 + (-12);
    uint _551 = uint(int(uint(_549) >> uint(2)));
    uint _553 = uint(int(uint(int(_551)) >> uint(2)));
    int _555 = int(_551) & 3;
    float _557 = (*spvDescriptorSet0.fp_c4)._m0[int(_553)][_555];
    float _559 = -_529;
    float _561 = exp2(_559);
    float _563 = precise::max(_547, -127.0);
    float _565 = -_563;
    float _567 = exp2(_565);
    float _569 = _545 * 1.5;
    uint _571 = uint(int(uint(_523) >> uint(2)));
    uint _573 = uint(int(uint(int(_571)) >> uint(2)));
    int _575 = int(_571) & 3;
    float _577 = (*spvDescriptorSet0.fp_c4)._m0[int(_573)][_575];
    float _579 = 1.0 / _563;
    float _581 = log2(_505);
    float _583 = -_567;
    float _585 = _583 + 1.0;
    float _587 = _561 * _585;
    float _589 = exp2(_569);
    float _591 = _587 * _579;
    float _593 = _515 * _577;
    float _595 = _581 * (-0.0199999995529651641845703125);
    float _597 = exp2(_593);
    float _599 = _595 * _591;
    int _601 = _523 + (-8);
    uint _603 = uint(int(uint(_601) >> uint(2)));
    uint _605 = uint(int(uint(int(_603)) >> uint(2)));
    int _607 = int(_603) & 3;
    float _609 = (*spvDescriptorSet0.fp_c4)._m0[int(_605)][_607];
    float _611 = _501 * _599;
    float _613 = _589 * 12.56637096405029296875;
    float _615 = -_611;
    float _617 = exp2(_615);
    float _619 = 0.0 + _597;
    float _621 = precise::clamp(_619, 0.0, 1.0);
    float _623 = _373 * _539;
    float _625 = 1.0 / _613;
    float _627 = -_617;
    float _629 = _627 + 1.0;
    float _631 = _371 * _609;
    float _633 = precise::min(_629, (*spvDescriptorSet0.fp_c3)._m0[9].w);
    float _635 = _519 * _625;
    float _637 = _633 * _635;
    float _639 = _637 * (*spvDescriptorSet0.fp_c3)._m0[10].w;
    float _641 = _369 * _557;
    float _643 = _639 * _621;
    float _645 = _641 * _643;
    float _647 = _631 * _643;
    float _649 = _623 * _643;
    out.m_50.x = _645;
    out.m_50.y = _647;
    out.m_50.z = _649;
    out.m_50.w = 0.0;
    return out;
}

