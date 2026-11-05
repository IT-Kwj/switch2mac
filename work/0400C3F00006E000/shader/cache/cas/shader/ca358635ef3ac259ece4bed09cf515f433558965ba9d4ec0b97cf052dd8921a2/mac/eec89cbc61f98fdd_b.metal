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
    uint4 _m1[8];
    float4 _m2;
    float4 _m3;
    int _m4;
    float4 _m5[73];
    int4 _m6;
    int _m7;
};

struct _16
{
    float4 _m0[4096];
};

struct _23
{
    uint _m0[1];
};

struct spvDescriptorSetBuffer0
{
    constant _10* support_buffer [[id(0)]];
    constant _16* fp_c3 [[id(1)]];
    const device _23* fp_s0 [[id(2)]];
    texture2d<float> fp_t_tcb_A [[id(3)]];
    sampler fp_t_tcb_ASmplr [[id(4)]];
    texture2d_array<float> fp_t_tcb_8 [[id(5)]];
    sampler fp_t_tcb_8Smplr [[id(6)]];
    sampler fp_t_tcb_ASmplr_w [[id(7)]];
    sampler fp_t_tcb_8Smplr_w [[id(8)]];
    constant dm_border_t* dm_border [[id(9)]];
};

struct main0_out
{
    float4 m_46 [[color(0)]];
};

struct main0_in
{
    float4 m_48 [[user(locn0), flat]];
    float4 m_41 [[user(locn1), flat]];
    float4 m_43 [[user(locn2)]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    float _55 = gl_FragCoord.x;
    float _57 = (*spvDescriptorSet0.support_buffer)._m5[0].x;
    float _59 = _55 / _57;
    float _61 = gl_FragCoord.y;
    float _63 = (*spvDescriptorSet0.support_buffer)._m5[0].x;
    float _65 = _61 / _63;
    float _67 = _59 * (*spvDescriptorSet0.fp_c3)._m0[17].x;
    float _69 = _65 * (*spvDescriptorSet0.fp_c3)._m0[17].y;
    float2 _928 = float2(_67, _69);
    float _71 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_928, float2(0.0), isnan(_928)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_928, float2(0.0), isnan(_928)), level(0.0)).x;
    float _73 = in.m_41.x;
    float _75 = in.m_41.y;
    float _77 = in.m_41.z;
    float _79 = in.m_41.w;
    bool _83 = _73 >= 0.0;
    bool _85 = isnan(_73);
    bool _87 = _83 || _85;
    bool _89 = isnan(0.0);
    bool _91 = _87 || _89;
    if (!_91)
    {
        float _93 = gl_FragCoord.w;
        float _95 = in.m_43.x;
        float _97 = gl_FragCoord.w;
        float _99 = _95 * _97;
        float _101 = in.m_43.y;
        float _103 = gl_FragCoord.w;
        float _105 = _101 * _103;
        float _107 = rint(_79);
        float _109 = precise::max(_107, 0.0);
        uint _112 = uint(_109);
        uint _114 = clamp(_112, 0u, 65535u);
        float _116 = rint(_77);
        float _118 = precise::max(_116, 0.0);
        uint _120 = uint(_118);
        uint _122 = clamp(_120, 0u, 65535u);
        float _124 = 1.0 / _93;
        float _126 = _124 * _99;
        float _128 = _124 * _105;
        float _130 = _126 * 0.5;
        float _132 = _130 + 0.5;
        float _134 = fma(_130, (*spvDescriptorSet0.fp_c3)._m0[18].y, 0.5);
        float3 _1021 = float3(_132, _128, float(int(_114)));
        float3 _1025 = select(_1021, float3(0.0), isnan(_1021));
        float _136 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, _1025.xy, uint(rint(_1025.z))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, _1025.xy, uint(rint(_1025.z))).x;
        float3 _1034 = float3(_134, _128, float(int(_122)));
        float3 _1036 = select(_1034, float3(0.0), isnan(_1034));
        float _138 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, _1036.xy, uint(rint(_1036.z))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, _1036.xy, uint(rint(_1036.z))).x;
        float _140 = in.m_43.z;
        float _142 = gl_FragCoord.w;
        float _144 = _140 * _142;
        float _146 = in.m_43.w;
        float _148 = gl_FragCoord.w;
        float _150 = _146 * _148;
        float _152 = _124 * _144;
        float _154 = _124 * _150;
        float _156 = _152 * 0.5;
        float _158 = fma(_136, 10.0, -4.5);
        float _160 = -_138;
        float _162 = fma(_154, _160, _156);
        float _164 = _152 * _158;
        float _166 = _164 * 0.5;
        float _168 = _162 * 0.5;
        out.m_46.x = 0.0;
        out.m_46.y = _168;
        out.m_46.z = _166;
        out.m_46.w = _156;
        return out;
    }
    float _170 = trunc(_75);
    float _172 = precise::max(_170, 0.0);
    uint _174 = uint(_172);
    float _176 = trunc(_73);
    float _178 = precise::max(_176, 0.0);
    uint _180 = uint(_178);
    int _183 = int(_174) * 48;
    uint _185 = uint(int(uint(_183) >> uint(2)));
    packed_uint3 _dmw0 = *(const device packed_uint3*)&(*spvDescriptorSet0.fp_s0)._m0[int(_185)];
    float _187 = as_type<float>(_dmw0.x);
    int _189 = _183 + 4;
    uint _191 = uint(int(uint(_189) >> uint(2)));
    float _193 = as_type<float>(_dmw0.y);
    int _195 = _183 + 8;
    uint _197 = uint(int(uint(_195) >> uint(2)));
    float _199 = as_type<float>(_dmw0.z);
    int _201 = int(_180) * 48;
    uint _203 = uint(int(uint(_201) >> uint(2)));
    packed_uint3 _dmw3 = *(const device packed_uint3*)&(*spvDescriptorSet0.fp_s0)._m0[int(_203)];
    float _205 = as_type<float>(_dmw3.x);
    int _207 = _201 + 4;
    uint _209 = uint(int(uint(_207) >> uint(2)));
    float _211 = as_type<float>(_dmw3.y);
    int _213 = _201 + 8;
    uint _215 = uint(int(uint(_213) >> uint(2)));
    float _217 = as_type<float>(_dmw3.z);
    int _219 = _201 + 32;
    int _221 = _201 + 16;
    uint _223 = uint(int(uint(_219) >> uint(2)));
    packed_uint3 _dmw5 = *(const device packed_uint3*)&(*spvDescriptorSet0.fp_s0)._m0[int(_223)];
    float _225 = as_type<float>(_dmw5.x);
    int _227 = _219 + 4;
    uint _229 = uint(int(uint(_227) >> uint(2)));
    float _231 = as_type<float>(_dmw5.y);
    int _233 = _219 + 8;
    uint _235 = uint(int(uint(_233) >> uint(2)));
    float _237 = as_type<float>(_dmw5.z);
    uint _239 = uint(int(uint(_221) >> uint(2)));
    packed_uint3 _dmw4 = *(const device packed_uint3*)&(*spvDescriptorSet0.fp_s0)._m0[int(_239)];
    float _241 = as_type<float>(_dmw4.x);
    int _243 = _221 + 4;
    uint _245 = uint(int(uint(_243) >> uint(2)));
    float _247 = as_type<float>(_dmw4.y);
    int _249 = _221 + 8;
    uint _251 = uint(int(uint(_249) >> uint(2)));
    float _253 = as_type<float>(_dmw4.z);
    int _255 = _183 + 16;
    uint _257 = uint(int(uint(_255) >> uint(2)));
    packed_uint3 _dmw1 = *(const device packed_uint3*)&(*spvDescriptorSet0.fp_s0)._m0[int(_257)];
    float _259 = as_type<float>(_dmw1.x);
    int _261 = _255 + 4;
    uint _263 = uint(int(uint(_261) >> uint(2)));
    float _265 = as_type<float>(_dmw1.y);
    int _267 = _255 + 8;
    uint _269 = uint(int(uint(_267) >> uint(2)));
    float _271 = as_type<float>(_dmw1.z);
    int _273 = _183 + 32;
    uint _275 = uint(int(uint(_273) >> uint(2)));
    packed_uint3 _dmw2 = *(const device packed_uint3*)&(*spvDescriptorSet0.fp_s0)._m0[int(_275)];
    float _277 = as_type<float>(_dmw2.x);
    int _279 = _273 + 4;
    uint _281 = uint(int(uint(_279) >> uint(2)));
    float _283 = as_type<float>(_dmw2.y);
    int _285 = _273 + 8;
    uint _287 = uint(int(uint(_285) >> uint(2)));
    float _289 = as_type<float>(_dmw2.z);
    bool _291 = _71 != 1.0;
    bool _293 = isnan(_71);
    bool _295 = _291 || _293;
    bool _297 = isnan(1.0);
    bool _299 = _295 || _297;
    float _301 = -_211;
    float _303 = _193 + _301;
    float _305 = -_205;
    float _307 = _187 + _305;
    float _309 = _303 * _303;
    float _311 = -_217;
    float _313 = _199 + _311;
    float _315 = fma(_307, _307, _309);
    float _317 = fma(_313, _313, _315);
    float _319 = rsqrt(_317);
    float _321 = _231 * _231;
    float _323 = fma(_225, _225, _321);
    float _325 = _313 * _319;
    float _327 = _303 * _319;
    float _329 = _307 * _319;
    float _331 = _325 * _241;
    float _333 = _327 * _253;
    float _335 = fma(_237, _237, _323);
    float _337 = -_331;
    float _339 = fma(_329, _253, _337);
    float _341 = -_333;
    float _343 = fma(_325, _247, _341);
    float _345 = _329 * _247;
    float _347 = _339 * _339;
    float _349 = -_345;
    float _351 = fma(_327, _241, _349);
    float _353 = fma(_343, _343, _347);
    float _355 = rsqrt(_335);
    float _357 = fma(_351, _351, _353);
    float _359 = rsqrt(_357);
    float _361 = _231 * _355;
    float _363 = _237 * _355;
    float _365 = _253 * _361;
    float _367 = _339 * _359;
    float _369 = _225 * _355;
    float _371 = _343 * _359;
    float _373 = -_365;
    float _375 = fma(_247, _363, _373);
    float _377 = _231 * _367;
    float _379 = _241 * _363;
    float _381 = _351 * _359;
    float _383 = fma(_225, _371, _377);
    float _385 = _247 * _369;
    float _387 = -_379;
    float _389 = fma(_253, _369, _387);
    float _391 = _325 * _259;
    float _393 = _327 * _271;
    float _395 = -_71;
    float _397 = fma(_395, (*spvDescriptorSet0.fp_c3)._m0[0].y, 1.0);
    float _399 = -_391;
    float _401 = fma(_329, _271, _399);
    float _403 = -_393;
    float _405 = fma(_325, _265, _403);
    float _407 = _329 * _265;
    float _409 = _401 * _401;
    float _411 = 1.0 / _397;
    float _413 = -_407;
    float _415 = fma(_327, _259, _413);
    float _417 = fma(_405, _405, _409);
    float _419 = fma(_415, _415, _417);
    float _421 = -_385;
    float _423 = fma(_241, _361, _421);
    float _425 = rsqrt(_419);
    float _427 = -_411;
    float _429 = fma(_427, (*spvDescriptorSet0.fp_c3)._m0[0].w, (*spvDescriptorSet0.fp_c3)._m0[0].w);
    float _431 = _299 ? _429 : (-1.0);
    float _433 = -(*spvDescriptorSet0.fp_c3)._m0[0].x;
    float _435 = fma(_431, (*spvDescriptorSet0.fp_c3)._m0[0].z, _433);
    float _437 = _405 * _425;
    float _439 = _69 * _435;
    float _441 = _415 * _425;
    float _443 = _67 * _435;
    float _445 = _283 * _283;
    float _447 = _439 * (*spvDescriptorSet0.fp_c3)._m0[6].y;
    float _449 = fma(_237, _381, _383);
    float _451 = _401 * _425;
    float _453 = _439 * (*spvDescriptorSet0.fp_c3)._m0[5].y;
    float _455 = _439 * (*spvDescriptorSet0.fp_c3)._m0[7].y;
    float _457 = fma(_443, (*spvDescriptorSet0.fp_c3)._m0[6].x, _447);
    float _459 = fma(_277, _277, _445);
    float _461 = fma(_443, (*spvDescriptorSet0.fp_c3)._m0[5].x, _453);
    float _463 = fma(_435, (*spvDescriptorSet0.fp_c3)._m0[6].z, _457);
    float _465 = fma(_289, _289, _459);
    float _467 = fma(_435, (*spvDescriptorSet0.fp_c3)._m0[5].z, _461);
    float _469 = _463 + (*spvDescriptorSet0.fp_c3)._m0[6].w;
    float _471 = rsqrt(_465);
    float _473 = _467 + (*spvDescriptorSet0.fp_c3)._m0[5].w;
    float _475 = -_211;
    float _477 = _469 + _475;
    float _479 = -_205;
    float _481 = _473 + _479;
    float _483 = _477 * _389;
    float _485 = fma(_481, _375, _483);
    float _487 = _283 * _451;
    float _489 = fma(_443, (*spvDescriptorSet0.fp_c3)._m0[7].x, _455);
    float _491 = fma(_277, _437, _487);
    float _493 = _277 * _471;
    float _495 = _283 * _471;
    float _497 = _289 * _471;
    float _499 = fma(_435, (*spvDescriptorSet0.fp_c3)._m0[7].z, _489);
    float _501 = _259 * _497;
    float _503 = _499 + (*spvDescriptorSet0.fp_c3)._m0[7].w;
    float _505 = -_193;
    float _507 = _469 + _505;
    float _509 = fma(_289, _441, _491);
    float _511 = _271 * _495;
    float _513 = -_501;
    float _515 = fma(_271, _493, _513);
    float _517 = -_217;
    float _519 = _503 + _517;
    float _521 = _327 * _477;
    float _523 = -_187;
    float _525 = _473 + _523;
    float _527 = _327 * _507;
    float _529 = -_511;
    float _531 = fma(_265, _497, _529);
    float _533 = _265 * _493;
    float _535 = _507 * _515;
    float _537 = fma(_329, _481, _521);
    float _539 = -_199;
    float _541 = _503 + _539;
    float _543 = fma(_329, _525, _527);
    float _545 = -_533;
    float _547 = fma(_259, _495, _545);
    float _549 = fma(_525, _531, _535);
    float _551 = fma(_325, _519, _537);
    float _553 = fma(_325, _541, _543);
    float _555 = fma(_519, _423, _485);
    float _557 = fma(_541, _547, _549);
    float _559 = -_553;
    float _561 = _551 + _559;
    float _563 = -_557;
    float _565 = _555 + _563;
    float _567 = 1.0 / _449;
    float _569 = _367 * _477;
    float _571 = _451 * _507;
    float _573 = 1.0 / _561;
    float _575 = fma(_371, _481, _569);
    float _577 = 1.0 / _509;
    float _579 = 1.0 / _565;
    float _581 = fma(_437, _525, _571);
    float _583 = fma(_381, _519, _575);
    float _585 = fma(_441, _541, _581);
    float _587 = _583 * _567;
    float _589 = _551 * _573;
    float _591 = -_587;
    float _593 = fma(_585, _577, _591);
    float _595 = _555 * _579;
    float _597 = fma(_589, _593, _587);
    bool _599 = _595 >= 0.0;
    bool _601 = isnan(_595);
    bool _603 = _599 || _601;
    bool _605 = isnan(0.0);
    bool _607 = _603 || _605;
    float _609 = abs(_597);
    bool _611 = _609 > 1.0;
    bool _613 = !_607;
    bool _615 = _611 || _613;
    bool _617 = _595 > 1.0;
    bool _619 = _617 || _615;
    int _621 = _183 + 28;
    int _623 = _201 + 28;
    if (_619)
    {
        discard_fragment();
    }
    uint _625 = uint(int(uint(_623) >> uint(2)));
    float _627 = as_type<float>((*spvDescriptorSet0.fp_s0)._m0[int(_625)]);
    uint _629 = uint(int(uint(_621) >> uint(2)));
    float _631 = as_type<float>((*spvDescriptorSet0.fp_s0)._m0[int(_629)]);
    int _633 = _201 + 12;
    int _635 = _183 + 12;
    int _637 = _201 + 44;
    int _639 = _183 + 44;
    uint _641 = uint(int(uint(_633) >> uint(2)));
    float _643 = as_type<float>((*spvDescriptorSet0.fp_s0)._m0[int(_641)]);
    uint _645 = uint(int(uint(_635) >> uint(2)));
    float _647 = as_type<float>((*spvDescriptorSet0.fp_s0)._m0[int(_645)]);
    uint _649 = uint(int(uint(_637) >> uint(2)));
    float _651 = as_type<float>((*spvDescriptorSet0.fp_s0)._m0[int(_649)]);
    uint _653 = uint(int(uint(_639) >> uint(2)));
    float _655 = as_type<float>((*spvDescriptorSet0.fp_s0)._m0[int(_653)]);
    float _657 = rint(_77);
    float _659 = precise::max(_657, 0.0);
    uint _661 = uint(_659);
    uint _663 = clamp(_661, 0u, 65535u);
    float _665 = _597 * 0.5;
    float _667 = rint(_79);
    float _669 = precise::max(_667, 0.0);
    uint _671 = uint(_669);
    uint _673 = clamp(_671, 0u, 65535u);
    float _675 = _665 + 0.5;
    float _677 = fma(_665, (*spvDescriptorSet0.fp_c3)._m0[18].y, 0.5);
    float _679 = -_627;
    float _681 = _679 + _631;
    float _683 = fma(_595, _681, _627);
    float3 _1906 = float3(_677, _683, float(int(_663)));
    float3 _1908 = select(_1906, float3(0.0), isnan(_1906));
    float _685 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, _1908.xy, uint(rint(_1908.z))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, _1908.xy, uint(rint(_1908.z))).x;
    float3 _1917 = float3(_675, _683, float(int(_673)));
    float3 _1919 = select(_1917, float3(0.0), isnan(_1917));
    float _687 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, _1919.xy, uint(rint(_1919.z))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, _1919.xy, uint(rint(_1919.z))).x;
    float _689 = in.m_48.x;
    float _691 = 1.0 / (*spvDescriptorSet0.fp_c3)._m0[19].x;
    float _693 = _247 * _477;
    float _695 = _265 * _507;
    float _697 = fma(_241, _481, _693);
    float _699 = 1.0 / (*spvDescriptorSet0.fp_c3)._m0[19].x;
    float _701 = fma(_259, _525, _695);
    float _703 = fma(_253, _519, _697);
    float _705 = 1.0 / (*spvDescriptorSet0.fp_c3)._m0[19].y;
    float _707 = fma(_271, _541, _701);
    float _709 = -(*spvDescriptorSet0.fp_c3)._m0[17].z;
    float _711 = (*spvDescriptorSet0.fp_c3)._m0[17].w + _709;
    float _713 = -_703;
    float _715 = _713 + (*spvDescriptorSet0.fp_c3)._m0[17].z;
    float _717 = -_707;
    float _719 = _717 + (*spvDescriptorSet0.fp_c3)._m0[17].z;
    float _721 = _703 + _711;
    float _723 = _715 * _691;
    float _725 = precise::clamp(_723, 0.0, 1.0);
    float _727 = _711 + _707;
    float _729 = _719 * _699;
    float _731 = precise::clamp(_729, 0.0, 1.0);
    float _733 = _725 * _643;
    float _735 = _731 * _647;
    float _737 = _721 * _705;
    float _739 = precise::clamp(_737, 0.0, 1.0);
    float _741 = _727 * _705;
    float _743 = precise::clamp(_741, 0.0, 1.0);
    float _745 = abs(_651);
    float _747 = _745 * _689;
    float _749 = precise::clamp(_747, 0.0, 1.0);
    float _751 = abs(_655);
    float _753 = _689 * _751;
    float _755 = precise::clamp(_753, 0.0, 1.0);
    float _757 = _739 * _733;
    float _759 = _743 * _735;
    float _761 = _757 * _749;
    float _763 = _759 * _755;
    bool _765 = _761 >= 0.5;
    bool _767 = isnan(_761);
    bool _769 = _765 || _767;
    bool _771 = isnan(0.5);
    bool _773 = _769 || _771;
    bool _775 = _763 >= 0.5;
    bool _777 = isnan(_763);
    bool _779 = _775 || _777;
    bool _781 = isnan(0.5);
    bool _783 = _779 || _781;
    float _785 = fma(_761, 2.0, -1.0);
    float _787 = _759;
    float _789 = _733;
    float _791 = _647;
    float _793 = _761;
    float _795 = _715;
    if (!_773)
    {
        float _797 = _761 * (*spvDescriptorSet0.fp_c3)._m0[18].x;
        float _799 = _797 * 2.0;
        _787 = _799;
    }
    float _801 = _787;
    float _803 = _801;
    if (_773)
    {
        float _805 = -(*spvDescriptorSet0.fp_c3)._m0[18].x;
        float _807 = 1.0 + _805;
        _789 = _807;
    }
    float _809 = _789;
    if (_783)
    {
        float _811 = fma(_763, 2.0, -1.0);
        _791 = _811;
    }
    float _813 = _791;
    if (_783)
    {
        float _815 = -(*spvDescriptorSet0.fp_c3)._m0[18].x;
        float _817 = 1.0 + _815;
        _793 = _817;
    }
    float _819 = _793;
    if (!_783)
    {
        float _821 = _763 * (*spvDescriptorSet0.fp_c3)._m0[18].x;
        float _823 = _821 * 2.0;
        _795 = _823;
    }
    float _825 = _795;
    float _827 = _825;
    if (_773)
    {
        float _829 = fma(_809, _785, (*spvDescriptorSet0.fp_c3)._m0[18].x);
        _803 = _829;
    }
    float _831 = _803;
    if (_783)
    {
        float _833 = fma(_813, _819, (*spvDescriptorSet0.fp_c3)._m0[18].x);
        _827 = _833;
    }
    float _835 = _827;
    if (_619)
    {
        out.m_46.x = 0.0;
        out.m_46.y = 0.0;
        out.m_46.z = 0.0;
        out.m_46.w = 0.0;
        return out;
    }
    float _837 = fma(_763, 2.0, -1.0);
    float _839 = precise::clamp(_837, 0.0, 1.0);
    float _841 = 0.0 + _785;
    float _843 = precise::clamp(_841, 0.0, 1.0);
    bool _845 = _677 <= 1.0;
    bool _847 = isnan(_677);
    bool _849 = _845 || _847;
    bool _851 = isnan(1.0);
    bool _853 = _849 || _851;
    float _855 = -_831;
    float _857 = _855 + _835;
    float _859 = -_843;
    float _861 = _859 + _839;
    bool _863 = _677 >= 0.0;
    bool _865 = isnan(_677);
    bool _867 = _863 || _865;
    bool _869 = isnan(0.0);
    bool _871 = _867 || _869;
    bool _873 = _871 && _853;
    float _875 = float(_873);
    float _877 = fma(_595, _857, _831);
    float _879 = fma(_595, _861, _843);
    float _881 = _685 * _875;
    float _883 = _877 * 0.5;
    float _885 = fma(_687, 10.0, -4.5);
    float _887 = -_881;
    float _889 = fma(_887, _879, _883);
    float _891 = _877 * _885;
    float _893 = _891 * 0.5;
    float _895 = _889 * 0.5;
    out.m_46.x = 0.0;
    out.m_46.y = _895;
    out.m_46.z = _893;
    out.m_46.w = _883;
    return out;
}

