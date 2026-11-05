#pragma clang diagnostic ignored "-Wmissing-prototypes"

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

template<typename T>
[[clang::optnone]] T spvFAdd(T l, T r)
{
    return fma(T(1), l, r);
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

struct _31
{
    uint _m0[1];
};

struct spvDescriptorSetBuffer0
{
    constant _16* fp_c9 [[id(0)]];
    constant _16* fp_c7 [[id(1)]];
    constant _16* fp_c11 [[id(2)]];
    constant _16* fp_c4 [[id(3)]];
    constant _16* fp_c13 [[id(4)]];
    const device _31* fp_s0 [[id(5)]];
    texture2d_array<float> fp_t_tcb_8 [[id(6)]];
    sampler fp_t_tcb_8Smplr [[id(7)]];
    texture2d_array<float> fp_t_tcb_C [[id(8)]];
    sampler fp_t_tcb_CSmplr [[id(9)]];
    texture2d<float> fp_t_tcb_E [[id(10)]];
    sampler fp_t_tcb_ESmplr [[id(11)]];
    texture2d<float> fp_t_tcb_12 [[id(12)]];
    sampler fp_t_tcb_12Smplr [[id(13)]];
    texture2d<float> fp_t_tcb_14 [[id(14)]];
    sampler fp_t_tcb_14Smplr [[id(15)]];
    texture2d<float> fp_t_tcb_16 [[id(16)]];
    sampler fp_t_tcb_16Smplr [[id(17)]];
    texture2d<float> fp_t_tcb_10 [[id(18)]];
    sampler fp_t_tcb_10Smplr [[id(19)]];
    texture2d<float> fp_t_tcb_1A [[id(20)]];
    sampler fp_t_tcb_1ASmplr [[id(21)]];
    texture2d_array<float> fp_t_tcb_18 [[id(22)]];
    sampler fp_t_tcb_18Smplr [[id(23)]];
    sampler fp_t_tcb_8Smplr_w [[id(24)]];
    sampler fp_t_tcb_CSmplr_w [[id(25)]];
    sampler fp_t_tcb_ESmplr_w [[id(26)]];
    sampler fp_t_tcb_12Smplr_w [[id(27)]];
    sampler fp_t_tcb_14Smplr_w [[id(28)]];
    sampler fp_t_tcb_16Smplr_w [[id(29)]];
    sampler fp_t_tcb_10Smplr_w [[id(30)]];
    sampler fp_t_tcb_1ASmplr_w [[id(31)]];
    sampler fp_t_tcb_18Smplr_w [[id(32)]];
    constant dm_border_t* dm_border [[id(33)]];
};

struct main0_out
{
    float4 m_76 [[color(0)]];
    float4 m_78 [[color(1)]];
};

struct main0_in
{
    float4 m_65 [[user(locn0)]];
    float4 m_63 [[user(locn4)]];
    float4 m_71 [[user(locn5)]];
    float4 m_69 [[user(locn6)]];
    float4 m_67 [[user(locn7)]];
    float4 m_73 [[user(locn8)]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    int _85 = as_type<int>((*spvDescriptorSet0.fp_c7)._m0[11].z) * as_type<int>((*spvDescriptorSet0.fp_c11)._m0[33].z);
    int _87 = _85 + as_type<int>((*spvDescriptorSet0.fp_c11)._m0[33].w);
    int _89 = _87 * 96;
    int _91 = _89 + 80;
    uint _94 = uint(int(uint(_89) >> uint(2)));
    packed_uint4 _dmw0 = *(const device packed_uint4*)&(*spvDescriptorSet0.fp_s0)._m0[int(_94)];
    float _97 = as_type<float>(_dmw0.x);
    int _99 = _89 + 4;
    uint _101 = uint(int(uint(_99) >> uint(2)));
    float _103 = as_type<float>(_dmw0.y);
    uint _105 = uint(int(uint(_91) >> uint(2)));
    float _107 = as_type<float>((*spvDescriptorSet0.fp_s0)._m0[int(_105)]);
    int _109 = _89 + 8;
    int _111 = _89 + 16;
    int _113 = _89 + 24;
    uint _115 = uint(int(uint(_109) >> uint(2)));
    float _117 = as_type<float>(_dmw0.z);
    int _119 = _109 + 4;
    uint _121 = uint(int(uint(_119) >> uint(2)));
    float _123 = as_type<float>(_dmw0.w);
    uint _125 = uint(int(uint(_111) >> uint(2)));
    packed_uint4 _dmw1 = *(const device packed_uint4*)&(*spvDescriptorSet0.fp_s0)._m0[int(_125)];
    float _127 = as_type<float>(_dmw1.x);
    int _129 = _111 + 4;
    uint _131 = uint(int(uint(_129) >> uint(2)));
    float _133 = as_type<float>(_dmw1.y);
    uint _135 = uint(int(uint(_113) >> uint(2)));
    float _137 = as_type<float>(_dmw1.z);
    int _139 = _113 + 4;
    uint _141 = uint(int(uint(_139) >> uint(2)));
    float _143 = as_type<float>(_dmw1.w);
    float _145 = gl_FragCoord.w;
    float _147 = in.m_63.z;
    float _149 = gl_FragCoord.w;
    float _151 = _147 * _149;
    float _153 = in.m_63.w;
    float _155 = gl_FragCoord.w;
    float _157 = _153 * _155;
    float _159 = in.m_65.x;
    float _161 = gl_FragCoord.w;
    float _163 = _159 * _161;
    float _165 = in.m_65.y;
    float _167 = gl_FragCoord.w;
    float _169 = _165 * _167;
    float _171 = (*spvDescriptorSet0.fp_c9)._m0[983].y * 0.0625;
    float _173 = 1.0 / _145;
    float _175 = _173 * _151;
    float _177 = _173 * _157;
    float _179 = _173 * _163;
    float _181 = _173 * _169;
    float _183 = _179 + _171;
    float _185 = -_171;
    float _187 = fma(_179, 0.75, _185);
    float _189 = _181 + _171;
    float _191 = -_171;
    float _193 = fma(_181, 0.75, _191);
    int _195 = as_type<int>(_107) << 6;
    int _197 = _195 + 25920;
    uint _199 = uint(int(uint(_197) >> uint(2)));
    uint _201 = uint(int(uint(int(_199)) >> uint(2)));
    int _203 = int(_199) & 3;
    float _205 = (*spvDescriptorSet0.fp_c9)._m0[int(_201)][_203];
    int _207 = int(_199) + 1;
    uint _209 = uint(int(uint(_207) >> uint(2)));
    int _211 = _207 & 3;
    float _213 = (*spvDescriptorSet0.fp_c9)._m0[int(_209)][_211];
    int _215 = _195 + 25904;
    uint _217 = uint(int(uint(_215) >> uint(2)));
    uint _219 = uint(int(uint(int(_217)) >> uint(2)));
    int _221 = int(_217) & 3;
    float _223 = (*spvDescriptorSet0.fp_c9)._m0[int(_219)][_221];
    int _225 = int(_217) + 1;
    uint _227 = uint(int(uint(_225) >> uint(2)));
    int _229 = _225 & 3;
    float _231 = (*spvDescriptorSet0.fp_c9)._m0[int(_227)][_229];
    float _233 = fma(_175, _97, _117);
    float _235 = fma(_175, _127, _137);
    float _237 = fma(_177, _133, _143);
    float _239 = fma(_177, _103, _123);
    float _241 = _235 * _205;
    float _243 = (*spvDescriptorSet0.fp_c9)._m0[983].y * 0.75;
    float _245 = _237 * _213;
    float _247 = -_243;
    float _249 = fma(_247, (*spvDescriptorSet0.fp_c11)._m0[40].z, _193);
    float _251 = _233 * _223;
    float _253 = _239 * _231;
    float _255 = _235 * _223;
    float _257 = _237 * _231;
    float _259 = -_243;
    float _261 = fma(_259, (*spvDescriptorSet0.fp_c11)._m0[40].z, _189);
    float2 _2107;
    _2107.x = spvDescriptorSet0.fp_t_tcb_8.calculate_clamped_lod(spvDescriptorSet0.fp_t_tcb_8Smplr, float2(_255, _257));
    _2107.y = spvDescriptorSet0.fp_t_tcb_8.calculate_unclamped_lod(spvDescriptorSet0.fp_t_tcb_8Smplr, float2(_255, _257));
    float _263 = _2107.x;
    float _265 = _263 * 256.0;
    int _267 = int(_265);
    float2 _2118;
    _2118.x = spvDescriptorSet0.fp_t_tcb_8.calculate_clamped_lod(spvDescriptorSet0.fp_t_tcb_8Smplr, float2(_251, _253));
    _2118.y = spvDescriptorSet0.fp_t_tcb_8.calculate_unclamped_lod(spvDescriptorSet0.fp_t_tcb_8Smplr, float2(_251, _253));
    float _269 = _2118.x;
    float _271 = _269 * 256.0;
    int _273 = int(_271);
    float2 _2128;
    _2128.x = spvDescriptorSet0.fp_t_tcb_C.calculate_clamped_lod(spvDescriptorSet0.fp_t_tcb_CSmplr, float2(_241, _245));
    _2128.y = spvDescriptorSet0.fp_t_tcb_C.calculate_unclamped_lod(spvDescriptorSet0.fp_t_tcb_CSmplr, float2(_241, _245));
    float _275 = _2128.x;
    float _277 = _275 * 256.0;
    int _279 = int(_277);
    float2 _2137 = float2(_183, _261);
    float2 _283 = dm_bs(spvDescriptorSet0.fp_t_tcb_E.sample(spvDescriptorSet0.fp_t_tcb_ESmplr, select(_2137, float2(0.0), isnan(_2137))), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_E, spvDescriptorSet0.fp_t_tcb_ESmplr_w, select(_2137, float2(0.0), isnan(_2137))).xy;
    float _285 = _283.x;
    float _287 = _283.y;
    float2 _2152 = float2(_187, _249);
    float2 _289 = dm_bs(spvDescriptorSet0.fp_t_tcb_12.sample(spvDescriptorSet0.fp_t_tcb_12Smplr, select(_2152, float2(0.0), isnan(_2152))), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.fp_t_tcb_12, spvDescriptorSet0.fp_t_tcb_12Smplr_w, select(_2152, float2(0.0), isnan(_2152))).xy;
    float _291 = _289.x;
    float _293 = _289.y;
    float _295 = in.m_67.z;
    float _297 = gl_FragCoord.w;
    float _299 = _295 * _297;
    float _301 = in.m_67.x;
    float _303 = gl_FragCoord.w;
    float _305 = _301 * _303;
    int _307 = _89 + 64;
    int _309 = _89 + 68;
    uint _311 = uint(int(uint(_307) >> uint(2)));
    packed_uint2 _dmw2 = *(const device packed_uint2*)&(*spvDescriptorSet0.fp_s0)._m0[int(_311)];
    float _313 = as_type<float>(_dmw2.x);
    uint _315 = uint(int(uint(_309) >> uint(2)));
    float _317 = as_type<float>(_dmw2.y);
    float _319 = _173 * _299;
    float _321 = _173 * _305;
    float _323 = -(*spvDescriptorSet0.fp_c9)._m0[26].z;
    float _325 = _319 + _323;
    float _327 = -(*spvDescriptorSet0.fp_c9)._m0[26].x;
    float _329 = _321 + _327;
    float _331 = _325 * _325;
    float _333 = fma(_329, _329, _331);
    float _335 = sqrt(_333);
    bool _339 = _335 > (*spvDescriptorSet0.fp_c9)._m0[42].y;
    float _341 = in.m_67.y;
    float _343 = gl_FragCoord.w;
    float _345 = _341 * _343;
    float _347 = _235;
    float _349 = _171;
    if (_339)
    {
        float _351 = 1.0 / (*spvDescriptorSet0.fp_c9)._m0[42].z;
        _347 = _351;
    }
    float _353 = _347;
    float _355 = -(*spvDescriptorSet0.fp_c9)._m0[42].y;
    float _357 = _335 + _355;
    float _359 = _357;
    float _361 = _353;
    if (_339)
    {
        float _363 = _357 * _353;
        _359 = _363;
    }
    float _365 = _359;
    float _367 = 0.0;
    if (_339)
    {
        float _369 = _365 * 0.15915493667125701904296875;
        _367 = _369;
    }
    float _371 = _367;
    float _373 = 0.0;
    float _375 = _371;
    if (_339)
    {
        float _377 = _371 * 6.283185482025146484375;
        float _379 = cos(_377);
        _373 = _379;
    }
    float _381 = _373;
    float _383 = _365;
    if (_339)
    {
        float _385 = _371 * 6.283185482025146484375;
        float _387 = sin(_385);
        _383 = _387;
    }
    float _389 = _383;
    float _391 = _173 * _345;
    float _393 = _187;
    float _395 = _345;
    if (_339)
    {
        float _397 = rsqrt(_333);
        _393 = _397;
    }
    float _399 = _393;
    if (_339)
    {
        float _401 = _391 + (*spvDescriptorSet0.fp_c9)._m0[42].z;
        _361 = _401;
    }
    float _403 = _361;
    float _405 = _403;
    if (_339)
    {
        float _407 = _381 + (-1.0);
        _349 = _407;
    }
    float _409 = _349;
    float _411 = _409;
    if (_339)
    {
        float _413 = _409 * (*spvDescriptorSet0.fp_c9)._m0[42].z;
        _395 = _413;
    }
    float _415 = _395;
    float _417 = 0.0;
    float _419 = _389;
    if (_339)
    {
        float _421 = fma(_389, _403, (*spvDescriptorSet0.fp_c9)._m0[42].y);
        _417 = _421;
    }
    float _423 = _417;
    float _425 = _423;
    if (!_339)
    {
        _405 = _391;
    }
    float _427 = _405;
    float _429 = _427;
    if (_339)
    {
        float _431 = fma(_391, _381, _415);
        _429 = _431;
    }
    float _433 = _429;
    if (!_339)
    {
        _411 = _321;
    }
    float _435 = _411;
    float _437 = _435;
    if (_339)
    {
        float _439 = _399 * _423;
        _425 = _439;
    }
    float _441 = _425;
    float _443 = -(*spvDescriptorSet0.fp_c9)._m0[26].y;
    float _445 = _433 + _443;
    float _447 = _441;
    float _449 = _445;
    if (!_339)
    {
        _419 = _319;
    }
    float _451 = _419;
    float _453 = _451;
    if (_339)
    {
        float _455 = fma(_329, _441, (*spvDescriptorSet0.fp_c9)._m0[26].x);
        _437 = _455;
    }
    float _457 = _437;
    if (_339)
    {
        float _459 = fma(_325, _441, (*spvDescriptorSet0.fp_c9)._m0[26].z);
        _453 = _459;
    }
    float _461 = _453;
    float _463 = _445 * _445;
    float _465 = -(*spvDescriptorSet0.fp_c9)._m0[26].x;
    float _467 = _457 + _465;
    float _469 = -(*spvDescriptorSet0.fp_c9)._m0[26].z;
    float _471 = _461 + _469;
    float _473 = fma(_467, _467, _463);
    float _475 = fma(_471, _471, _473);
    float _477 = rsqrt(_475);
    float _479 = _477 * (*spvDescriptorSet0.fp_c9)._m0[26].w;
    float _481 = _467 * _479;
    float _483 = _471 * _479;
    float _485 = _481 * _481;
    float _487 = _483 * _483;
    float _489 = _485 + _487;
    float _491 = sqrt(_489);
    bool _493 = _491 > (*spvDescriptorSet0.fp_c9)._m0[42].y;
    float _495 = -(*spvDescriptorSet0.fp_c9)._m0[42].y;
    float _497 = _491 + _495;
    float _499 = _381;
    float _501 = _477;
    float _503 = _481;
    float _505 = _483;
    float _507 = _485;
    float _509 = _487;
    if (_493)
    {
        float _511 = 1.0 / (*spvDescriptorSet0.fp_c9)._m0[42].z;
        _499 = _511;
    }
    float _513 = _499;
    if (_493)
    {
        float _515 = _497 * _513;
        _501 = _515;
    }
    float _517 = _501;
    if (_493)
    {
        float _519 = _517 * 0.15915493667125701904296875;
        _447 = _519;
    }
    float _521 = _447;
    float _523 = _497;
    if (_493)
    {
        float _525 = _521 * 6.283185482025146484375;
        float _527 = sin(_525);
        _523 = _527;
    }
    float _529 = _523;
    float _531 = (*spvDescriptorSet0.fp_c9)._m0[26].y + (-220.0);
    float _533 = precise::max(0.0, _531);
    float _535 = _513;
    float _537 = _533;
    if (_493)
    {
        float _539 = _521 * 6.283185482025146484375;
        float _541 = cos(_539);
        _535 = _541;
    }
    float _543 = _535;
    float _545 = -_479;
    float _547 = -_533;
    float _549 = fma(_445, _545, _547);
    float _551 = _489;
    if (_493)
    {
        float _553 = rsqrt(_489);
        _551 = _553;
    }
    float _555 = _551;
    if (_493)
    {
        float _557 = _549 + (*spvDescriptorSet0.fp_c9)._m0[42].z;
        _537 = _557;
    }
    float _559 = _537;
    float _561 = 0.0;
    float _563 = _529;
    if (_493)
    {
        float _565 = fma(_529, _559, (*spvDescriptorSet0.fp_c9)._m0[42].y);
        _561 = _565;
    }
    float _567 = _561;
    float _569 = -(*spvDescriptorSet0.fp_c4)._m0[12].w;
    float _571 = _391 + _569;
    float _573 = _567;
    if (_493)
    {
        float _575 = _543 + (-1.0);
        _449 = _575;
    }
    float _577 = _449;
    float _579 = -(*spvDescriptorSet0.fp_c4)._m0[11].w;
    float _581 = _321 + _579;
    if (_493)
    {
        float _583 = _577 * (*spvDescriptorSet0.fp_c9)._m0[42].z;
        _375 = _583;
    }
    float _585 = _375;
    if (_493)
    {
        float _587 = _555 * _567;
        _573 = _587;
    }
    float _589 = _573;
    float _591 = _571 * _571;
    if (_493)
    {
        float _593 = _481 * _589;
        _503 = _593;
    }
    float _595 = _503;
    if (!_493)
    {
        _563 = _549;
    }
    float _597 = _563;
    float _599 = _597;
    if (_493)
    {
        float _601 = fma(_549, _543, _585);
        _599 = _601;
    }
    float _603 = _599;
    if (_493)
    {
        float _605 = _483 * _589;
        _505 = _605;
    }
    float _607 = _505;
    if (_493)
    {
        float _609 = _595 * _595;
        _507 = _609;
    }
    float _611 = _507;
    float _613 = -(*spvDescriptorSet0.fp_c4)._m0[13].w;
    float _615 = _319 + _613;
    float _617 = fma(_581, _581, _591);
    if (_493)
    {
        float _619 = _607 * _607;
        _509 = _619;
    }
    float _621 = _509;
    float _623 = fma(_603, _603, _611);
    float _625 = fma(_615, _615, _617);
    float _627 = _623 + _621;
    float _629 = sqrt(_625);
    float _631 = rsqrt(_627);
    float _633 = -(*spvDescriptorSet0.fp_c9)._m0[63].y;
    float _635 = fma(_629, (*spvDescriptorSet0.fp_c9)._m0[63].x, _633);
    float _637 = precise::clamp(_635, 0.0, 1.0);
    float _639 = -_637;
    float _641 = _639 + 1.0;
    float _643 = _631 * _595;
    float _645 = _631 * _603;
    float _647 = _643 * (*spvDescriptorSet0.fp_c9)._m0[69].x;
    float _649 = _631 * _607;
    float _651 = abs(_641);
    float _653 = log2(_651);
    int _655 = _195 + 25952;
    uint _657 = uint(int(uint(_655) >> uint(2)));
    uint _659 = uint(int(uint(int(_657)) >> uint(2)));
    int _661 = int(_657) & 3;
    float _663 = (*spvDescriptorSet0.fp_c9)._m0[int(_659)][_661];
    float _665 = -_647;
    float _667 = fma(_645, (*spvDescriptorSet0.fp_c9)._m0[69].y, _665);
    float _669 = in.m_63.x;
    float _671 = gl_FragCoord.w;
    float _673 = _669 * _671;
    float _675 = -_649;
    float _677 = fma(_675, (*spvDescriptorSet0.fp_c9)._m0[69].z, _667);
    float _679 = in.m_63.y;
    float _681 = gl_FragCoord.w;
    float _683 = _679 * _681;
    float _685 = in.m_65.w;
    float _687 = gl_FragCoord.w;
    float _689 = _685 * _687;
    int _691 = _195 + 25936;
    uint _693 = uint(int(uint(_691) >> uint(2)));
    uint _695 = uint(int(uint(int(_693)) >> uint(2)));
    int _697 = int(_693) & 3;
    float _699 = (*spvDescriptorSet0.fp_c9)._m0[int(_695)][_697];
    float _701 = fma(_677, -0.5, 0.5);
    float _703 = in.m_65.z;
    float _705 = gl_FragCoord.w;
    float _707 = _703 * _705;
    int _709 = _195 + 25944;
    uint _711 = uint(int(uint(_709) >> uint(2)));
    uint _713 = uint(int(uint(int(_711)) >> uint(2)));
    int _715 = int(_711) & 3;
    float _717 = (*spvDescriptorSet0.fp_c9)._m0[int(_713)][_715];
    float _719 = sqrt(_701);
    float _721 = _653 * (*spvDescriptorSet0.fp_c9)._m0[64].x;
    float _723 = fma(_677, 0.5, 0.5);
    float _725 = float(uint(_267));
    float _727 = exp2(_721);
    float _729 = fma(_723, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _731 = float(uint(_273));
    float _733 = fma(_723, _729, -0.212114393711090087890625);
    float _735 = rint(_663);
    float _737 = precise::max(_735, 0.0);
    uint _739 = uint(_737);
    uint _741 = clamp(_739, 0u, 65535u);
    float _743 = _719 * 0.636619746685028076171875;
    float _745 = _725 * 0.00390625;
    float _747 = fma(_723, _733, 1.570728778839111328125);
    float _749 = precise::max(_317, _699);
    float _751 = _731 * 0.00390625;
    float _753 = precise::max(_313, _699);
    float _755 = _645 + 1.0;
    float _757 = precise::max(_317, _717);
    float _759 = float(uint(_279));
    float _761 = precise::max(_749, _745);
    float _763 = -_645;
    float _765 = fma(_727, _755, _763);
    float _767 = precise::max(_753, _751);
    float _769 = _173 * _673;
    float _771 = _173 * _683;
    float _773 = -_747;
    float _775 = fma(_743, _773, 1.0);
    float _777 = _173 * _689;
    float _779 = _759 * 0.00390625;
    float _781 = _173 * _707;
    float _783 = fma(_765, 0.5, 0.5);
    float2 _2902 = float2(_769, _771);
    float _785 = dm_bs(spvDescriptorSet0.fp_t_tcb_14.sample(spvDescriptorSet0.fp_t_tcb_14Smplr, select(_2902, float2(0.0), isnan(_2902))), spvDescriptorSet0.dm_border, 4u, spvDescriptorSet0.fp_t_tcb_14, spvDescriptorSet0.fp_t_tcb_14Smplr_w, select(_2902, float2(0.0), isnan(_2902))).x;
    float2 _2910 = float2(_769, _771);
    float _787 = dm_bs(spvDescriptorSet0.fp_t_tcb_16.sample(spvDescriptorSet0.fp_t_tcb_16Smplr, select(_2910, float2(0.0), isnan(_2910))), spvDescriptorSet0.dm_border, 5u, spvDescriptorSet0.fp_t_tcb_16, spvDescriptorSet0.fp_t_tcb_16Smplr_w, select(_2910, float2(0.0), isnan(_2910))).x;
    float _789 = precise::max(_757, _779);
    float2 _2921 = float2(_781, _777);
    float3 _793 = dm_bs(spvDescriptorSet0.fp_t_tcb_10.sample(spvDescriptorSet0.fp_t_tcb_10Smplr, select(_2921, float2(0.0), isnan(_2921))), spvDescriptorSet0.dm_border, 6u, spvDescriptorSet0.fp_t_tcb_10, spvDescriptorSet0.fp_t_tcb_10Smplr_w, select(_2921, float2(0.0), isnan(_2921))).xyz;
    float _795 = _793.x;
    float _797 = _793.y;
    float _799 = _793.z;
    float2 _2935 = float2(_775, _783);
    float3 _801 = dm_bs(spvDescriptorSet0.fp_t_tcb_1A.sample(spvDescriptorSet0.fp_t_tcb_1ASmplr, select(_2935, float2(0.0), isnan(_2935))), spvDescriptorSet0.dm_border, 7u, spvDescriptorSet0.fp_t_tcb_1A, spvDescriptorSet0.fp_t_tcb_1ASmplr_w, select(_2935, float2(0.0), isnan(_2935))).xyz;
    float _803 = _801.x;
    float _805 = _801.y;
    float _807 = _801.z;
    float3 _2952 = float3(_255, _257, float(int(_741)));
    float3 _2956 = select(_2952, float3(0.0), isnan(_2952));
    float _809 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, _2956.xy, uint(rint(_2956.z)), level(_761)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, _2956.xy, uint(rint(_2956.z)), level(_761)).z;
    float3 _2966 = float3(_251, _253, float(int(_741)));
    float3 _2968 = select(_2966, float3(0.0), isnan(_2966));
    float _811 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, _2968.xy, uint(rint(_2968.z)), level(_767)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, _2968.xy, uint(rint(_2968.z)), level(_767)).x;
    float3 _2978 = float3(_241, _245, float(int(_741)));
    float3 _2980 = select(_2978, float3(0.0), isnan(_2978));
    float3 _813 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, _2980.xy, uint(rint(_2980.z)), level(_789)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, _2980.xy, uint(rint(_2980.z)), level(_789)).xyz;
    float _815 = _813.x;
    float _817 = _813.y;
    float _819 = _813.z;
    float _821 = in.m_69.y;
    float _823 = gl_FragCoord.w;
    float _825 = _821 * _823;
    float _827 = in.m_69.x;
    float _829 = gl_FragCoord.w;
    float _831 = _827 * _829;
    float _833 = in.m_71.y;
    float _835 = gl_FragCoord.w;
    float _837 = _833 * _835;
    float _839 = in.m_69.z;
    float _841 = gl_FragCoord.w;
    float _843 = _839 * _841;
    float _845 = in.m_71.x;
    float _847 = gl_FragCoord.w;
    float _849 = _845 * _847;
    float _851 = in.m_71.z;
    float _853 = gl_FragCoord.w;
    float _855 = _851 * _853;
    float _857 = in.m_71.w;
    float _859 = gl_FragCoord.w;
    float _861 = _857 * _859;
    float _863 = _173 * _825;
    float _865 = _173 * _831;
    float _867 = _173 * _837;
    float _869 = _863 * _863;
    float _871 = _173 * _843;
    float _873 = _173 * _849;
    float _875 = fma(_865, _865, _869);
    float _877 = _867 * _867;
    float _879 = _173 * _855;
    float _881 = fma(_871, _871, _875);
    float _883 = fma(_873, _873, _877);
    float _885 = rsqrt(_881);
    float _887 = fma(_879, _879, _883);
    float _889 = rsqrt(_887);
    bool _891 = _285 >= 0.5;
    bool _893 = isnan(_285);
    bool _895 = _891 || _893;
    bool _897 = isnan(0.5);
    bool _899 = _895 || _897;
    bool _901 = _287 >= 0.5;
    bool _903 = isnan(_287);
    bool _905 = _901 || _903;
    bool _907 = isnan(0.5);
    bool _909 = _905 || _907;
    float _911 = _865 * _885;
    float _913 = _863 * _885;
    float _915 = -_291;
    float _917 = _915 + 1.0;
    float _919 = -_285;
    float _921 = _919 + 1.0;
    float _923 = _285 * _291;
    float _925 = _923 * 2.0;
    float _927 = -_287;
    float _929 = _927 + 1.0;
    float _931 = _871 * _885;
    float _933 = _287 * _293;
    float _935 = _933 * 2.0;
    float _937 = _867 * _889;
    float _939 = -_293;
    float _941 = _939 + 1.0;
    float _943 = _879 * _889;
    float _945 = _921 * _917;
    float _947 = _929 * _941;
    float _949 = _873 * _889;
    float _951 = _911 * _943;
    float _953 = _931 * _937;
    float _955 = _925;
    float _957 = _935;
    if (_899)
    {
        float _959 = fma(_945, -2.0, 1.0);
        _955 = _959;
    }
    float _961 = _955;
    float _963 = _173 * _861;
    float _965 = -_951;
    float _967 = fma(_931, _949, _965);
    if (_909)
    {
        float _969 = fma(_947, -2.0, 1.0);
        _957 = _969;
    }
    float _971 = _957;
    float _973 = _913 * _949;
    float _975 = -_953;
    float _977 = fma(_913, _943, _975);
    float _979 = _963 * _967;
    float _981 = -_973;
    float _983 = fma(_911, _937, _981);
    float _985 = _963 * _977;
    float _987 = _979 * _979;
    float _989 = _963 * _983;
    float _991 = fma(_985, _985, _987);
    float _993 = fma(_989, _989, _991);
    float _995 = rsqrt(_993);
    float _997 = fma(2.007874011993408203125, _971, -1.007874011993408203125);
    float _999 = fma(2.007874011993408203125, _961, -1.007874011993408203125);
    float _1001 = _995 * _997;
    float _1003 = _985 * _1001;
    float _1005 = _997 * _997;
    float _1007 = _979 * _1001;
    float _1009 = _989 * _1001;
    float _1011 = spvFAdd(_629, 9.9999997473787516355514526367188e-06);
    float _1013 = _391 * (*spvDescriptorSet0.fp_c9)._m0[1117].y;
    float _1015 = fma(_999, _999, _1005);
    float _1017 = _391 * (*spvDescriptorSet0.fp_c9)._m0[1118].y;
    float _1019 = fma(_949, _999, _1003);
    float _1021 = fma(_937, _999, _1007);
    float _1023 = 1.0 / _1011;
    float _1025 = fma(_321, (*spvDescriptorSet0.fp_c9)._m0[1117].x, _1013);
    float _1027 = -_1015;
    float _1029 = _1027 + 1.0;
    float _1031 = precise::clamp(_1029, 0.0, 1.0);
    float _1033 = fma(_321, (*spvDescriptorSet0.fp_c9)._m0[1118].x, _1017);
    float _1035 = abs(_571);
    bool _1037 = _1035 > 0.00999999977648258209228515625;
    float _1039 = fma(_943, _999, _1009);
    float _1041 = fma(_319, (*spvDescriptorSet0.fp_c9)._m0[1117].z, _1025);
    float _1043 = fma(_319, (*spvDescriptorSet0.fp_c9)._m0[1118].z, _1033);
    float _1045 = sqrt(_1031);
    float _1047 = _1037 ? _571 : 0.00999999977648258209228515625;
    float _1049 = _1041 + (*spvDescriptorSet0.fp_c9)._m0[1117].w;
    float _1051 = _1043 + (*spvDescriptorSet0.fp_c9)._m0[1118].w;
    float _1053 = _1047 * (*spvDescriptorSet0.fp_c9)._m0[66].x;
    float _1055 = trunc(_1049);
    int _1057 = int(_1055);
    float _1059 = _571 * _1023;
    float _1061 = trunc(_1051);
    int _1063 = int(_1061);
    float _1065 = _581 * _1023;
    float _1067 = _1059 * (*spvDescriptorSet0.fp_c9)._m0[69].y;
    float _1069 = fma(_911, _1045, _1019);
    float _1071 = in.m_73.w;
    float _1073 = gl_FragCoord.w;
    float _1075 = _1071 * _1073;
    float _1077 = _615 * _1023;
    float _1079 = fma(_1065, (*spvDescriptorSet0.fp_c9)._m0[69].x, _1067);
    float _1081 = fma(_913, _1045, _1021);
    float _1083 = precise::max(_1053, -127.0);
    float _1085 = fma(_931, _1045, _1039);
    float _1087 = (*spvDescriptorSet0.fp_c9)._m0[66].x * (*spvDescriptorSet0.fp_c9)._m0[66].y;
    float _1089 = fma(_1077, (*spvDescriptorSet0.fp_c9)._m0[69].z, _1079);
    int _1091 = ~as_type<int>((*spvDescriptorSet0.fp_c9)._m0[1116].y);
    int _1093 = _1057 + _1091;
    int _1095 = _1093 + 1;
    float _1097 = _1081 * _1081;
    int _1099 = ~as_type<int>((*spvDescriptorSet0.fp_c9)._m0[1116].z);
    int _1101 = _1063 + _1099;
    int _1103 = _1101 + 1;
    float _1105 = -_1083;
    float _1107 = exp2(_1105);
    float _1109 = fma(_1089, 2.0, (*spvDescriptorSet0.fp_c9)._m0[66].z);
    bool _1111 = _1095 >= as_type<int>((*spvDescriptorSet0.fp_c9)._m0[1116].x);
    float _1113 = fma(_1069, _1069, _1097);
    int _1115 = _1095 | _1103;
    float _1117 = fma(_1109, (*spvDescriptorSet0.fp_c9)._m0[66].z, 1.0);
    float _1119 = -_1087;
    float _1121 = exp2(_1119);
    bool _1123 = _1115 < 0;
    bool _1125 = _1123 || _1111;
    float _1127 = fma(_1085, _1085, _1113);
    bool _1129 = _1103 >= as_type<int>((*spvDescriptorSet0.fp_c9)._m0[1116].x);
    bool _1131 = _1129 || _1125;
    float _1133 = 1.0 / _1083;
    float _1135 = -_1107;
    float _1137 = _1135 + 1.0;
    float _1139 = abs(_1117);
    float _1141 = log2(_1139);
    float _1143 = _1121 * _1137;
    float _1145 = rsqrt(_1127);
    float _1147 = _629 + (-250.0);
    float _1149 = _1143 * _1133;
    float _1151 = _173 * _1075;
    float _1153 = _1143;
    if (_1131)
    {
        _1153 = (*spvDescriptorSet0.fp_c9)._m0[42].x;
    }
    float _1155 = _1153;
    float _1157 = precise::max(0.0, _1147);
    float _1159 = _1155;
    if (!_1131)
    {
        int _1161 = _1103 * as_type<int>((*spvDescriptorSet0.fp_c9)._m0[1116].x);
        int _1163 = _1161 + _1095;
        int _1165 = _1163 << 2;
        int _1167 = _1163 >> 2;
        int _1169 = 12 & _1165;
        int _1171 = _1167 << 4;
        int _1173 = _1171 + _1169;
        float _1175 = floor(_1049);
        int _1177 = _1173 + 16256;
        uint _1179 = uint(int(uint(_1177) >> uint(2)));
        uint _1181 = uint(int(uint(int(_1179)) >> uint(2)));
        int _1183 = int(_1179) & 3;
        float _1185 = (*spvDescriptorSet0.fp_c9)._m0[int(_1181)][_1183];
        float _1187 = floor(_1051);
        float _1189 = -_1175;
        float _1191 = _1049 + _1189;
        float _1193 = -_1187;
        float _1195 = _1051 + _1193;
        float _1197 = rint(_1185);
        float _1199 = precise::max(_1197, 0.0);
        uint _1201 = uint(_1199);
        uint _1203 = clamp(_1201, 0u, 65535u);
        float3 _3553 = float3(_1191, _1195, float(int(_1203)));
        float3 _3555 = select(_3553, float3(0.0), isnan(_3553));
        float _1205 = dm_bs(spvDescriptorSet0.fp_t_tcb_18.sample(spvDescriptorSet0.fp_t_tcb_18Smplr, _3555.xy, uint(rint(_3555.z))), spvDescriptorSet0.dm_border, 8u, spvDescriptorSet0.fp_t_tcb_18, spvDescriptorSet0.fp_t_tcb_18Smplr_w, _3555.xy, uint(rint(_3555.z))).x;
        int _1207 = _1163 << 4;
        int _1209 = _1207 + 17904;
        int _1211 = _1173 + 24304;
        uint _1213 = uint(int(uint(_1211) >> uint(2)));
        uint _1215 = uint(int(uint(int(_1213)) >> uint(2)));
        int _1217 = int(_1213) & 3;
        float _1219 = (*spvDescriptorSet0.fp_c9)._m0[int(_1215)][_1217];
        uint _1221 = uint(int(uint(_1209) >> uint(2)));
        uint _1223 = uint(int(uint(int(_1221)) >> uint(2)));
        int _1225 = int(_1221) & 3;
        float _1227 = (*spvDescriptorSet0.fp_c9)._m0[int(_1223)][_1225];
        int _1229 = int(_1221) + 1;
        uint _1231 = uint(int(uint(_1229) >> uint(2)));
        int _1233 = _1229 & 3;
        float _1235 = (*spvDescriptorSet0.fp_c9)._m0[int(_1231)][_1233];
        int _1237 = _1209 + 8;
        uint _1239 = uint(int(uint(_1237) >> uint(2)));
        uint _1241 = uint(int(uint(int(_1239)) >> uint(2)));
        int _1243 = int(_1239) & 3;
        float _1245 = (*spvDescriptorSet0.fp_c9)._m0[int(_1241)][_1243];
        int _1247 = int(_1239) + 1;
        uint _1249 = uint(int(uint(_1247) >> uint(2)));
        int _1251 = _1247 & 3;
        float _1253 = (*spvDescriptorSet0.fp_c9)._m0[int(_1249)][_1251];
        float _1255 = _391 * _1235;
        float _1257 = fma(_321, _1227, _1255);
        float _1259 = 1.0 / _1219;
        float _1261 = fma(_319, _1245, _1257);
        float _1263 = _1261 + _1253;
        float _1265 = precise::clamp(_1263, 0.0, 1.0);
        float _1267 = -_1265;
        float _1269 = _1267 + _1205;
        float _1271 = _1219 * (*spvDescriptorSet0.fp_c13)._m0[4].z;
        float _1273 = fma(_1259, (*spvDescriptorSet0.fp_c13)._m0[4].w, _1269);
        float _1275 = _1271 * _1273;
        float _1277 = exp2(_1275);
        float _1279 = 0.0 + _1277;
        float _1281 = precise::clamp(_1279, 0.0, 1.0);
        float _1283 = precise::min(_1281, (*spvDescriptorSet0.fp_c9)._m0[42].x);
        _1159 = _1283;
    }
    float _1285 = _1159;
    float _1287 = _1141 * 1.5;
    float _1289 = -_1151;
    float _1291 = -(*spvDescriptorSet0.fp_c9)._m0[41].z;
    float _1293 = _1289 + _1291;
    float _1295 = -_1285;
    float _1297 = _1295 + 1.0;
    float _1299 = _1069 * _1145;
    float _1301 = _1081 * _1145;
    float _1303 = _1293 * (*spvDescriptorSet0.fp_c9)._m0[41].w;
    float _1305 = precise::clamp(_1303, 0.0, 1.0);
    float _1307 = exp2(_1287);
    float _1309 = _1157 * 0.001000000047497451305389404296875;
    float _1311 = precise::clamp(_1309, 0.0, 1.0);
    float _1313 = fma(_1305, _1297, _1285);
    float _1315 = _1085 * _1145;
    float _1317 = _1065 * _1299;
    float _1319 = _629 * (*spvDescriptorSet0.fp_c9)._m0[65].w;
    float _1321 = _653 * (*spvDescriptorSet0.fp_c9)._m0[64].y;
    float _1323 = fma(_1311, 0.20000000298023223876953125, 0.00999999977648258209228515625);
    float _1325 = -_1059;
    float _1327 = -_1317;
    float _1329 = fma(_1325, _1301, _1327);
    float _1331 = fma(_1311, -0.20000000298023223876953125, 0.9900000095367431640625);
    float _1333 = _1149 * _1319;
    float _1335 = -_1077;
    float _1337 = fma(_1335, _1315, _1329);
    float _1339 = precise::clamp(_1337, 0.0, 1.0);
    float _1341 = -_1333;
    float _1343 = exp2(_1341);
    float _1345 = _1307 * 12.56637096405029296875;
    float _1347 = -(*spvDescriptorSet0.fp_c9)._m0[1007].y;
    float _1349 = _1347 + (*spvDescriptorSet0.fp_c9)._m0[1006].y;
    float _1351 = fma(_1301, 0.5, 0.5);
    float _1353 = _1339 * (-9.27999973297119140625);
    float _1355 = fma(_1059, _1301, _1317);
    float _1357 = -(*spvDescriptorSet0.fp_c9)._m0[1007].x;
    float _1359 = _1357 + (*spvDescriptorSet0.fp_c9)._m0[1006].x;
    float _1361 = 1.0 / _1345;
    float _1363 = -(*spvDescriptorSet0.fp_c9)._m0[1007].z;
    float _1365 = _1363 + (*spvDescriptorSet0.fp_c9)._m0[1006].z;
    float _1367 = fma(_1351, _1349, (*spvDescriptorSet0.fp_c9)._m0[1007].y);
    float _1369 = fma(_1077, _1315, _1355);
    float _1371 = fma(_1351, _1359, (*spvDescriptorSet0.fp_c9)._m0[1007].x);
    float _1373 = fma(_1351, _1365, (*spvDescriptorSet0.fp_c9)._m0[1007].z);
    float _1375 = _1367 * 0.715200006961822509765625;
    float _1377 = _1369 * _1369;
    float _1379 = exp2(_1353);
    float _1381 = fma(_1371, 0.2125999927520751953125, _1375);
    float _1383 = -(*spvDescriptorSet0.fp_c9)._m0[66].z;
    float _1385 = fma(_1383, (*spvDescriptorSet0.fp_c9)._m0[66].z, 1.0);
    float _1387 = _785 + (*spvDescriptorSet0.fp_c9)._m0[983].y;
    float _1389 = _1331 * _1331;
    float _1391 = fma(_1373, 0.072200000286102294921875, _1381);
    float _1393 = _1387 * (*spvDescriptorSet0.fp_c11)._m0[40].w;
    float _1395 = _1059 * 0.75187969207763671875;
    float _1397 = fma(_1377, 0.565323054790496826171875, 0.434676945209503173828125);
    float _1399 = _1385 * _1361;
    float _1401 = -_1343;
    float _1403 = _1401 + 1.0;
    float _1405 = 1.0 / _1391;
    float _1407 = fma(_1323, -0.0274999998509883880615234375, 0.0425000004470348358154296875);
    float _1409 = _1065 * 0.75187969207763671875;
    bool _1411 = _1397 >= 0.0;
    bool _1413 = isnan(_1397);
    bool _1415 = _1411 || _1413;
    bool _1417 = isnan(0.0);
    bool _1419 = _1415 || _1417;
    float _1421 = _1077 * 0.75187969207763671875;
    float _1423 = precise::min(_1389, _1379);
    float _1425 = _817 * 0.4774648249149322509765625;
    float _1427 = sqrt(_1397);
    float _1429 = _1393 * 0.15915493667125701904296875;
    float _1431 = _1403 * _1399;
    float _1433 = fma(_1331, _1423, _1407);
    float _1435 = fma(_1323, -0.572000026702880859375, 1.03999996185302734375);
    float _1437 = _815 * 0.4774648249149322509765625;
    float _1439 = _1429 * 6.283185482025146484375;
    float _1441 = sin(_1439);
    float _1443 = fma(_1323, 0.02199999988079071044921875, -0.039999999105930328369140625);
    float _1445 = fma(_1369, 0.75187969207763671875, _1427);
    float _1447 = _1405 * (*spvDescriptorSet0.fp_c9)._m0[39].z;
    float _1449 = precise::clamp(_1447, 0.0, 1.0);
    float _1451 = exp2(_1321);
    float _1453 = fma(_1433, -1.03999996185302734375, _1435);
    float _1455 = precise::clamp(_1453, 0.0, 1.0);
    float _1457 = -_1395;
    float _1459 = fma(_1301, _1445, _1457);
    float _1461 = -_1409;
    float _1463 = fma(_1299, _1445, _1461);
    float _1465 = fma(_1449, (*spvDescriptorSet0.fp_c9)._m0[39].y, (*spvDescriptorSet0.fp_c9)._m0[39].x);
    float _1467 = -_1421;
    float _1469 = fma(_1315, _1445, _1467);
    float _1471 = fma(_1441, 0.5, 0.5);
    float _1473 = _1419 ? _1459 : (-0.0);
    float _1475 = _1465 * 0.31830990314483642578125;
    float _1477 = _1419 ? _1463 : (-0.0);
    float _1479 = _1471 * _1471;
    float _1481 = _1419 ? _1469 : (-0.0);
    float _1483 = _1473 * (*spvDescriptorSet0.fp_c9)._m0[69].y;
    float _1485 = _787 * _1479;
    float _1487 = in.m_73.x;
    float _1489 = gl_FragCoord.w;
    float _1491 = _1487 * _1489;
    float _1493 = fma(_1477, (*spvDescriptorSet0.fp_c9)._m0[69].x, _1483);
    float _1495 = -_1451;
    float _1497 = _1495 + 1.0;
    float _1499 = fma(_1485, (*spvDescriptorSet0.fp_c11)._m0[18].y, _797);
    float _1501 = fma((*spvDescriptorSet0.fp_c11)._m0[15].w, (*spvDescriptorSet0.fp_c11)._m0[15].w, 1.0);
    float _1503 = fma(_1481, (*spvDescriptorSet0.fp_c9)._m0[69].z, _1493);
    float _1505 = (*spvDescriptorSet0.fp_c11)._m0[15].w * 2.0;
    float _1507 = fma(_1485, (*spvDescriptorSet0.fp_c11)._m0[18].x, _795);
    float _1509 = _1499 * 0.715200006961822509765625;
    float _1511 = fma(_1485, (*spvDescriptorSet0.fp_c11)._m0[18].z, _799);
    float _1513 = -_1505;
    float _1515 = fma(_1503, _1513, _1501);
    float _1517 = _1497 * (*spvDescriptorSet0.fp_c9)._m0[64].z;
    float _1519 = fma(_1507, 0.2125999927520751953125, _1509);
    float _1521 = precise::min(_1313, (*spvDescriptorSet0.fp_c9)._m0[62].x);
    float _1523 = (*spvDescriptorSet0.fp_c9)._m0[39].y + (*spvDescriptorSet0.fp_c9)._m0[39].x;
    float _1525 = in.m_73.z;
    float _1527 = gl_FragCoord.w;
    float _1529 = _1525 * _1527;
    float _1531 = fma(_1511, 0.072200000286102294921875, _1519);
    float _1533 = abs(_1515);
    float _1535 = log2(_1533);
    float _1537 = _1521 * _1431;
    float _1539 = fma(_1433, 1.03999996185302734375, _1443);
    float _1541 = precise::clamp(_1539, 0.0, 1.0);
    float _1543 = _1371 * _1475;
    float _1545 = _1367 * _1475;
    float _1547 = _1373 * _1475;
    float _1549 = 1.0 / _1531;
    float _1551 = _1425 * (*spvDescriptorSet0.fp_c9)._m0[68].y;
    float _1553 = _1437 * (*spvDescriptorSet0.fp_c9)._m0[68].x;
    float _1555 = _819 * 0.4774648249149322509765625;
    float _1557 = 0.2820948064327239990234375 * (*spvDescriptorSet0.fp_c9)._m0[991].z;
    float _1559 = fma(_1455, 0.02005931176245212554931640625, _1541);
    float _1561 = precise::max(_1551, _1545);
    float _1563 = _1555 * (*spvDescriptorSet0.fp_c9)._m0[68].z;
    float _1565 = _1535 * 1.5;
    float _1567 = -_1541;
    float _1569 = _1567 + 1.0;
    float _1571 = precise::max(_1553, _1543);
    float _1573 = fma(_809, _1557, _1563);
    float _1575 = _1517 * _1343;
    float _1577 = _1569 * 3.1415927410125732421875;
    float _1579 = exp2(_1565);
    float _1581 = -_1517;
    float _1583 = _1581 + 1.0;
    float _1585 = _1549 * (*spvDescriptorSet0.fp_c9)._m0[39].z;
    float _1587 = in.m_73.y;
    float _1589 = gl_FragCoord.w;
    float _1591 = _1587 * _1589;
    float _1593 = _1343 * _1583;
    float _1595 = _1523 * _1585;
    float _1597 = precise::clamp(_1595, 0.0, 1.0);
    float _1599 = fma(_1597, (*spvDescriptorSet0.fp_c9)._m0[37].w, (*spvDescriptorSet0.fp_c9)._m0[37].z);
    float _1601 = 0.2820948064327239990234375 * (*spvDescriptorSet0.fp_c9)._m0[991].y;
    float _1603 = precise::min(_1585, _1599);
    float _1605 = _1579 * 12.56637096405029296875;
    float _1607 = fma(_809, _1601, _1561);
    float _1609 = 1.0 / _1605;
    float _1611 = _1603 * (*spvDescriptorSet0.fp_c9)._m0[39].y;
    float _1613 = fma(_1599, (*spvDescriptorSet0.fp_c9)._m0[39].x, _1611);
    float _1615 = -(*spvDescriptorSet0.fp_c11)._m0[15].w;
    float _1617 = fma(_1615, (*spvDescriptorSet0.fp_c11)._m0[15].w, 1.0);
    float _1619 = 0.2820948064327239990234375 * (*spvDescriptorSet0.fp_c9)._m0[991].x;
    float _1621 = fma(_809, _1601, _1551);
    float _1623 = fma(_809, _1619, _1571);
    float _1625 = _1621 * 0.586610972881317138671875;
    float _1627 = _173 * _1591;
    float _1629 = _1617 * _1609;
    float _1631 = _173 * _1491;
    float _1633 = _173 * _1529;
    float _1635 = _1627 * 0.18672408163547515869140625;
    float _1637 = fma(_1631, 0.095146648585796356201171875, _1635);
    float _1639 = fma(_1633, 0.0364394821226596832275390625, _1637);
    float _1641 = precise::max(_1639, 0.00999999977648258209228515625);
    float _1643 = fma(_809, _1619, _1553);
    float _1645 = 1.0 / _1641;
    float _1647 = fma(_1643, 0.298911988735198974609375, _1625);
    float _1649 = fma(_1573, 0.114477999508380889892578125, _1647);
    float _1651 = precise::max(_1563, _1547);
    float _1653 = (*spvDescriptorSet0.fp_c11)._m0[40].y + (*spvDescriptorSet0.fp_c11)._m0[15].y;
    float _1655 = (*spvDescriptorSet0.fp_c11)._m0[40].y + (*spvDescriptorSet0.fp_c11)._m0[15].x;
    float _1657 = fma(_809, _1557, _1651);
    float _1659 = (*spvDescriptorSet0.fp_c11)._m0[40].y + (*spvDescriptorSet0.fp_c11)._m0[15].z;
    float _1661 = _1607 * _1577;
    float _1663 = _1623 * _1577;
    float _1665 = 1.0 / _1653;
    float _1667 = _1649 * _1645;
    float _1669 = _1657 * _1577;
    float _1671 = _811 * (*spvDescriptorSet0.fp_c9)._m0[70].y;
    float _1673 = _1661 * (*spvDescriptorSet0.fp_c11)._m0[17].y;
    float _1675 = _811 * (*spvDescriptorSet0.fp_c9)._m0[70].x;
    float _1677 = _1663 * (*spvDescriptorSet0.fp_c11)._m0[17].x;
    float _1679 = precise::min(_1667, (*spvDescriptorSet0.fp_c9)._m0[27].w);
    float _1681 = 1.0 / _1655;
    float _1683 = _811 * (*spvDescriptorSet0.fp_c9)._m0[70].z;
    float _1685 = _1671 * (*spvDescriptorSet0.fp_c11)._m0[17].y;
    float _1687 = _1669 * (*spvDescriptorSet0.fp_c11)._m0[17].z;
    float _1689 = _1673 * 0.079577468335628509521484375;
    float _1691 = _1675 * (*spvDescriptorSet0.fp_c11)._m0[17].x;
    float _1693 = _1677 * 0.079577468335628509521484375;
    float _1695 = _1679 * 0.31830990314483642578125;
    float _1697 = 1.0 / _1659;
    float _1699 = _1683 * (*spvDescriptorSet0.fp_c11)._m0[17].z;
    float _1701 = _1687 * 0.079577468335628509521484375;
    float _1703 = fma(_1629, _1685, _1689);
    float _1705 = fma(_1629, _1691, _1693);
    float _1707 = _1559 * _1695;
    float _1709 = fma(_1629, _1699, _1701);
    float _1711 = _1703 * (*spvDescriptorSet0.fp_c11)._m0[40].y;
    float _1713 = _1705 * (*spvDescriptorSet0.fp_c11)._m0[40].y;
    float _1715 = _1709 * (*spvDescriptorSet0.fp_c11)._m0[40].y;
    float _1717 = _1711 * _1665;
    float _1719 = _1713 * _1681;
    float _1721 = _1613 * (*spvDescriptorSet0.fp_c11)._m0[35].x;
    float _1723 = fma(_1627, _1707, _1717);
    float _1725 = _1715 * _1697;
    float _1727 = _1537 * (*spvDescriptorSet0.fp_c9)._m0[70].x;
    float _1729 = fma(_1631, _1707, _1719);
    float _1731 = _1499 * _1721;
    float _1733 = fma(_1633, _1707, _1725);
    float _1735 = _1507 * _1721;
    float _1737 = fma(_803, _1575, _1727);
    float _1739 = _1537 * (*spvDescriptorSet0.fp_c9)._m0[70].y;
    float _1741 = _1537 * (*spvDescriptorSet0.fp_c9)._m0[70].z;
    float _1743 = precise::max(0.0, _1729);
    float _1745 = _1511 * _1721;
    float _1747 = fma(_805, _1575, _1739);
    float _1749 = fma(_807, _1575, _1741);
    float _1751 = precise::max(0.0, _1735);
    float _1753 = -(*spvDescriptorSet0.fp_c9)._m0[48].x;
    float _1755 = _629 + _1753;
    float _1757 = precise::max(0.0, _1723);
    float _1759 = fma(_1593, _1743, _1737);
    float _1761 = -(*spvDescriptorSet0.fp_c9)._m0[48].z;
    float _1763 = _629 + _1761;
    float _1765 = precise::max(0.0, _1731);
    float _1767 = _1755 * (*spvDescriptorSet0.fp_c9)._m0[48].y;
    float _1769 = precise::clamp(_1767, 0.0, 1.0);
    float _1771 = precise::max(0.0, _1745);
    float _1773 = _1593 * _1751;
    float _1775 = precise::max(0.0, _1733);
    float _1777 = _1763 * (*spvDescriptorSet0.fp_c9)._m0[48].w;
    float _1779 = precise::clamp(_1777, 0.0, 1.0);
    float _1781 = fma(_1593, _1757, _1747);
    float _1783 = _1593 * _1765;
    float _1785 = _1593 * _1771;
    float _1787 = fma(_1593, _1775, _1749);
    float _1789 = fma(_1769, _1773, _1759);
    float _1791 = fma(_1779, _1773, _1759);
    float _1793 = fma(_1769, _1783, _1781);
    float _1795 = fma(_1779, _1783, _1781);
    float _1797 = fma(_1769, _1785, _1787);
    float _1799 = fma(_1779, _1785, _1787);
    out.m_76.x = _1789;
    out.m_76.y = _1793;
    out.m_76.z = _1797;
    out.m_76.w = 1.0;
    out.m_78.x = _1791;
    out.m_78.y = _1795;
    out.m_78.z = _1799;
    out.m_78.w = 1.0;
    return out;
}

