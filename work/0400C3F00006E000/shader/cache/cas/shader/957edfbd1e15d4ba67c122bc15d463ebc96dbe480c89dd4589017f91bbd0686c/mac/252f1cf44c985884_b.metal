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

struct spvDescriptorSetBuffer0
{
    constant _10* support_buffer [[id(0)]];
    constant _16* fp_c9 [[id(1)]];
    constant _16* fp_c8 [[id(2)]];
    texture2d<float> fp_t_tcb_8 [[id(3)]];
    sampler fp_t_tcb_8Smplr [[id(4)]];
    texturecube<float> fp_t_tcb_1E [[id(5)]];
    sampler fp_t_tcb_1ESmplr [[id(6)]];
    texture2d<float> fp_t_tcb_1A [[id(7)]];
    sampler fp_t_tcb_1ASmplr [[id(8)]];
    sampler fp_t_tcb_8Smplr_w [[id(9)]];
    sampler fp_t_tcb_1ESmplr_w [[id(10)]];
    sampler fp_t_tcb_1ASmplr_w [[id(11)]];
    constant dm_border_t* dm_border [[id(12)]];
};

struct main0_out
{
    float4 m_53 [[color(0)]];
};

struct main0_in
{
    float4 m_40 [[user(locn0)]];
    float4 m_44 [[user(locn1)]];
    float4 m_46 [[user(locn2)]];
    float4 m_59 [[user(locn3)]];
    float4 m_42 [[user(locn4)]];
    float4 m_38 [[user(locn5)]];
    float4 m_57 [[user(locn6)]];
    float4 m_50 [[user(locn7)]];
    float4 m_48 [[user(locn8)]];
    float4 m_61 [[user(locn9)]];
    float4 m_55 [[user(locn10)]];
    float4 m_63 [[user(locn11)]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    float _70 = gl_FragCoord.w;
    float _72 = in.m_38.x;
    float _74 = gl_FragCoord.w;
    float _76 = _72 * _74;
    float _78 = in.m_38.y;
    float _80 = gl_FragCoord.w;
    float _82 = _78 * _80;
    float _84 = 1.0 / _70;
    float _86 = _84 * _76;
    float _88 = _84 * _82;
    float2 _733 = float2(_86, _88);
    float4 _91 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_733, float2(0.0), isnan(_733))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_733, float2(0.0), isnan(_733))).xyzw;
    float _93 = _91.x;
    float _95 = _91.y;
    float _97 = _91.z;
    float _99 = _91.w;
    float _101 = in.m_40.w;
    float _103 = gl_FragCoord.w;
    float _105 = _101 * _103;
    float _107 = in.m_42.w;
    float _109 = gl_FragCoord.w;
    float _111 = _107 * _109;
    float _113 = in.m_44.w;
    float _115 = gl_FragCoord.w;
    float _117 = _113 * _115;
    float _119 = in.m_46.x;
    float _121 = gl_FragCoord.w;
    float _123 = _119 * _121;
    float _125 = _84 * _105;
    float _127 = _84 * _111;
    float _129 = _84 * _117;
    float _131 = in.m_48.x;
    float _133 = gl_FragCoord.w;
    float _135 = _131 * _133;
    float _137 = in.m_48.z;
    float _139 = gl_FragCoord.w;
    float _141 = _137 * _139;
    float _143 = in.m_44.x;
    float _145 = gl_FragCoord.w;
    float _147 = _143 * _145;
    float _149 = _84 * _147;
    float _151 = -_125;
    float _153 = fma(_99, _127, _151);
    float _155 = _129 * _153;
    float _157 = precise::clamp(_155, 0.0, 1.0);
    float _159 = _84 * _123;
    float _161 = _157 * (*spvDescriptorSet0.fp_c9)._m0[194].w;
    float _163 = precise::clamp(_161, 0.0, 1.0);
    float _165 = _163 * _159;
    bool _169 = _165 > (*spvDescriptorSet0.fp_c9)._m0[141].z;
    bool _171 = isnan(_165);
    bool _173 = _169 || _171;
    bool _175 = isnan((*spvDescriptorSet0.fp_c9)._m0[141].z);
    bool _177 = _173 || _175;
    float _179 = in.m_50.y;
    float _181 = gl_FragCoord.w;
    float _183 = _179 * _181;
    float _185 = in.m_50.x;
    float _187 = gl_FragCoord.w;
    float _189 = _185 * _187;
    float _191 = in.m_50.z;
    float _193 = gl_FragCoord.w;
    float _195 = _191 * _193;
    if (!_177)
    {
        discard_fragment();
    }
    float _197 = _84 * _183;
    float _199 = _84 * _189;
    float _201 = _84 * _195;
    float _203 = _197 * _197;
    float _205 = in.m_48.y;
    float _207 = gl_FragCoord.w;
    float _209 = _205 * _207;
    float _211 = fma(_199, _199, _203);
    float _213 = fma(_201, _201, _211);
    float _215 = rsqrt(_213);
    float _217 = _197 * _215;
    float _219 = _199 * _215;
    float _221 = _201 * _215;
    float _223 = _84 * _209;
    float _225 = _217 * _217;
    float _227 = _84 * _135;
    float _229 = fma(_219, _219, _225);
    float _231 = -(*spvDescriptorSet0.fp_c8)._m0[29].x;
    float _233 = _227 + _231;
    float _235 = fma(_221, _221, _229);
    float _237 = rsqrt(_235);
    float _239 = _217 * _237;
    float _241 = _219 * _237;
    float _243 = _221 * _237;
    float _245 = -(*spvDescriptorSet0.fp_c8)._m0[29].y;
    float _247 = _223 + _245;
    float _249 = _239 * _239;
    float _251 = _84 * _141;
    float _253 = _247 * _247;
    float _255 = fma(_241, _241, _249);
    float _257 = -(*spvDescriptorSet0.fp_c8)._m0[29].z;
    float _259 = _251 + _257;
    float _261 = fma(_233, _233, _253);
    float _263 = fma(_243, _243, _255);
    float _265 = fma(_259, _259, _261);
    float _267 = rsqrt(_263);
    float _269 = rsqrt(_265);
    float _271 = _243 * _267;
    float _273 = _239 * _267;
    float _275 = _241 * _267;
    float _277 = _271 * 0.577381789684295654296875;
    float _279 = fma(_273, 0.816474258899688720703125, _277);
    float _281 = _233 * _269;
    float _283 = _247 * _269;
    float _285 = -(*spvDescriptorSet0.fp_c9)._m0[194].z;
    float _287 = _285 + 1.0;
    float _289 = 0.0 + _279;
    float _291 = precise::clamp(_289, 0.0, 1.0);
    float _293 = fma(_273, 0.5, 0.5);
    float _295 = _259 * _269;
    float _297 = in.m_44.y;
    float _299 = gl_FragCoord.w;
    float _301 = _297 * _299;
    float _303 = fma(_291, _287, (*spvDescriptorSet0.fp_c9)._m0[194].z);
    float _305 = fma(_293, -0.1500000059604644775390625, 0.5);
    float _307 = fma(_293, 0.1500000059604644775390625, 0.5);
    float _309 = fma(_293, 0.25, 0.5);
    float _311 = fma(_293, -0.25, 0.5);
    float _313 = in.m_44.z;
    float _315 = gl_FragCoord.w;
    float _317 = _313 * _315;
    float _319 = fma(_303, _307, _305);
    float _321 = precise::clamp(_319, 0.0, 1.0);
    float _323 = fma(_293, 0.7000000476837158203125, 0.5);
    float _325 = fma(_293, -0.7000000476837158203125, 0.5);
    float _327 = fma(_303, _311, _309);
    float _329 = precise::clamp(_327, 0.0, 1.0);
    float _331 = _273 * _283;
    float _333 = fma(_279, 0.5, 0.5);
    float _335 = fma(_303, _325, _323);
    float _337 = precise::clamp(_335, 0.0, 1.0);
    float _339 = in.m_40.x;
    float _341 = gl_FragCoord.w;
    float _343 = _339 * _341;
    float _345 = in.m_40.y;
    float _347 = gl_FragCoord.w;
    float _349 = _345 * _347;
    float _351 = in.m_40.z;
    float _353 = gl_FragCoord.w;
    float _355 = _351 * _353;
    float _357 = fma(_275, _281, _331);
    float _359 = -_95;
    float _361 = _359 + 1.0;
    float _363 = fma(_271, _295, _357);
    float _365 = -_97;
    float _367 = _365 + 1.0;
    float _369 = abs(_363);
    float _371 = -_369;
    float _373 = _371 + 1.0;
    float _375 = _373 * _373;
    float _377 = -_93;
    float _379 = _377 + 1.0;
    float _381 = _84 * _301;
    float _383 = _375 * _333;
    float _385 = abs(_219);
    float _387 = abs(_217);
    float _389 = precise::max(_385, _387);
    float _391 = _149 * _379;
    float _393 = _381 * _361;
    float _395 = abs(_221);
    float _397 = precise::max(_395, _389);
    float _399 = _84 * _317;
    float _401 = _399 * _367;
    float _403 = 1.0 / _397;
    float _405 = _84 * _343;
    float _407 = _84 * _349;
    float _409 = _84 * _355;
    float _411 = fma(_93, _405, _391);
    float _413 = fma(_95, _407, _393);
    float _415 = fma(_97, _409, _401);
    float _417 = fma(_411, _383, _411);
    float _419 = precise::clamp(_417, 0.0, 1.0);
    float _421 = fma(_413, _383, _413);
    float _423 = precise::clamp(_421, 0.0, 1.0);
    float _425 = fma(_415, _383, _415);
    float _427 = precise::clamp(_425, 0.0, 1.0);
    float _429 = _321 * _419;
    float _431 = precise::clamp(_429, 0.0, 1.0);
    float _433 = _329 * _423;
    float _435 = precise::clamp(_433, 0.0, 1.0);
    float _437 = _337 * _427;
    float _439 = precise::clamp(_437, 0.0, 1.0);
    float _441 = _219 * _403;
    float _443 = _217 * _403;
    float _445 = -_403;
    float _447 = _221 * _445;
    if (!_177)
    {
        out.m_53.x = _431;
        out.m_53.y = _435;
        out.m_53.z = _439;
        out.m_53.w = _163;
        return out;
    }
    float _449 = in.m_55.w;
    float _451 = gl_FragCoord.w;
    float _453 = _449 * _451;
    float _455 = _84 * _453;
    bool _457 = _455 != 1.0;
    bool _459 = isnan(_455);
    bool _461 = _457 || _459;
    bool _463 = isnan(1.0);
    bool _465 = _461 || _463;
    bool _467 = !_465;
    if (!_467)
    {
        float _469 = gl_FragCoord.x;
        float _471 = (*spvDescriptorSet0.support_buffer)._m5[0].x;
        float _473 = _469 / _471;
        float _475 = gl_FragCoord.y;
        float _477 = (*spvDescriptorSet0.support_buffer)._m5[0].x;
        float _479 = _475 / _477;
        float _481 = _455 * 256.0;
        float _483 = trunc(_481);
        int _486 = int(_483);
        float _488 = trunc(_473);
        int _490 = int(_488);
        float _492 = trunc(_479);
        int _494 = int(_492);
        int _496 = _490 + 2;
        int _498 = _496 >> 1;
        uint _501 = uint(int(uint(_494) >> uint(1)));
        int _503 = _498 ^ int(_501);
        int _505 = _503 << 16;
        int _507 = _505 ^ _498;
        int _509 = 983055 & _507;
        int _511 = _509 << 6;
        int _513 = _511 + _509;
        int _515 = _513 & 13369548;
        uint _517 = uint(int(uint(_515) >> uint(3)));
        int _519 = _515 | int(_517);
        uint _521 = uint(int(uint(_486) >> uint(7)));
        int _523 = int(_521) + _486;
        int _525 = _519 & 5570560;
        int _527 = _519 & 85;
        uint _529 = uint(int(uint(_525) >> uint(15)));
        int _531 = int(_529) + _527;
        bool _533 = uint(_523) > uint(_531);
        if (!_533)
        {
            discard_fragment();
        }
        if (!_533)
        {
            out.m_53.x = _431;
            out.m_53.y = _435;
            out.m_53.z = _439;
            out.m_53.w = _165;
            return out;
        }
    }
    float _535 = in.m_57.w;
    float _537 = gl_FragCoord.w;
    float _539 = _535 * _537;
    float _541 = in.m_57.y;
    float _543 = gl_FragCoord.w;
    float _545 = _541 * _543;
    float _547 = in.m_57.x;
    float _549 = gl_FragCoord.w;
    float _551 = _547 * _549;
    float3 _1410 = float3(_441, _443, _447);
    float3 _555 = dm_bs(spvDescriptorSet0.fp_t_tcb_1E.sample(spvDescriptorSet0.fp_t_tcb_1ESmplr, select(_1410, float3(0.0), isnan(_1410)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_1E, spvDescriptorSet0.fp_t_tcb_1ESmplr_w, select(_1410, float3(0.0), isnan(_1410)), level(0.0)).xyz;
    float _557 = _555.x;
    float _559 = _555.y;
    float _561 = _555.z;
    float _563 = _84 * _539;
    float _565 = _84 * _545;
    float _567 = _84 * _551;
    float _569 = 1.0 / _563;
    float _571 = _565 * _569;
    float _573 = _567 * _569;
    float2 _1443 = float2(_573, _571);
    float4 _575 = dm_bs(spvDescriptorSet0.fp_t_tcb_1A.sample(spvDescriptorSet0.fp_t_tcb_1ASmplr, select(_1443, float2(0.0), isnan(_1443))), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_1A, spvDescriptorSet0.fp_t_tcb_1ASmplr_w, select(_1443, float2(0.0), isnan(_1443))).xyzw;
    float _577 = _575.x;
    float _579 = _575.y;
    float _581 = _575.z;
    float _583 = _575.w;
    float _585 = in.m_59.x;
    float _587 = gl_FragCoord.w;
    float _589 = _585 * _587;
    float _591 = in.m_59.y;
    float _593 = gl_FragCoord.w;
    float _595 = _591 * _593;
    float _597 = in.m_59.z;
    float _599 = gl_FragCoord.w;
    float _601 = _597 * _599;
    float _603 = in.m_61.x;
    float _605 = gl_FragCoord.w;
    float _607 = _603 * _605;
    float _609 = in.m_61.y;
    float _611 = gl_FragCoord.w;
    float _613 = _609 * _611;
    float _615 = in.m_61.z;
    float _617 = gl_FragCoord.w;
    float _619 = _615 * _617;
    float _621 = in.m_63.x;
    float _623 = gl_FragCoord.w;
    float _625 = _621 * _623;
    float _627 = in.m_63.y;
    float _629 = gl_FragCoord.w;
    float _631 = _627 * _629;
    float _633 = in.m_63.z;
    float _635 = gl_FragCoord.w;
    float _637 = _633 * _635;
    float _639 = in.m_63.w;
    float _641 = gl_FragCoord.w;
    float _643 = _639 * _641;
    float _645 = _84 * _589;
    float _647 = _84 * _595;
    float _649 = _84 * _601;
    float _651 = _84 * _625;
    float _653 = fma(_557, 0.20999999344348907470703125, _645);
    float _655 = fma(_559, 0.20999999344348907470703125, _647);
    float _657 = fma(_561, 0.20999999344348907470703125, _649);
    float _659 = _84 * _607;
    float _661 = _84 * _613;
    float _663 = _84 * _619;
    float _665 = _653 + _659;
    float _667 = _655 + _661;
    float _669 = _657 + _663;
    float _671 = _84 * _631;
    float _673 = _84 * _637;
    float _675 = _84 * _643;
    float _677 = _431 * _665;
    float _679 = _439 * _669;
    float _681 = _435 * _667;
    float _683 = fma(_583, _651, _577);
    float _685 = _583 * _675;
    float _687 = fma(_583, _671, _579);
    float _689 = fma(_583, _673, _581);
    float _691 = fma(_677, _685, _683);
    float _693 = fma(_681, _685, _687);
    float _695 = fma(_679, _685, _689);
    float _697 = 0.0 + _165;
    float _699 = precise::clamp(_697, 0.0, 1.0);
    out.m_53.x = _691;
    out.m_53.y = _693;
    out.m_53.z = _695;
    out.m_53.w = _699;
    return out;
}

