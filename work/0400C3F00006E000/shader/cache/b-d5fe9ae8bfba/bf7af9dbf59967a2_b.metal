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
    constant _16* fp_c10 [[id(3)]];
    constant _16* fp_c15 [[id(4)]];
    texture2d<float> fp_t_tcb_8 [[id(5)]];
    sampler fp_t_tcb_8Smplr [[id(6)]];
    texturecube<float> fp_t_tcb_1E [[id(7)]];
    sampler fp_t_tcb_1ESmplr [[id(8)]];
    sampler fp_t_tcb_8Smplr_w [[id(9)]];
    sampler fp_t_tcb_1ESmplr_w [[id(10)]];
    constant dm_border_t* dm_border [[id(11)]];
};

struct main0_out
{
    float4 m_59 [[color(0)]];
};

struct main0_in
{
    float4 m_44 [[user(locn0)]];
    float4 m_56 [[user(locn1)]];
    float4 m_46 [[user(locn2)]];
    float4 m_63 [[user(locn3)]];
    float4 m_42 [[user(locn4)]];
    float4 m_40 [[user(locn5)]];
    float4 m_69 [[user(locn6)]];
    float4 m_48 [[user(locn7)]];
    float4 m_54 [[user(locn8)]];
    float4 m_65 [[user(locn9)]];
    float4 m_61 [[user(locn10)]];
    float4 m_67 [[user(locn11)]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]], bool gl_FrontFacing [[front_facing]])
{
    main0_out out = {};
    float _76 = gl_FragCoord.w;
    float _78 = in.m_40.x;
    float _80 = gl_FragCoord.w;
    float _82 = _78 * _80;
    float _84 = in.m_40.y;
    float _86 = gl_FragCoord.w;
    float _88 = _84 * _86;
    float _90 = 1.0 / _76;
    float _92 = _90 * _82;
    float _94 = _90 * _88;
    float2 _743 = float2(_92, _94);
    float _96 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_743, float2(0.0), isnan(_743))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_743, float2(0.0), isnan(_743))).w;
    float _98 = in.m_42.w;
    float _100 = gl_FragCoord.w;
    float _102 = _98 * _100;
    float _104 = in.m_44.w;
    float _106 = gl_FragCoord.w;
    float _108 = _104 * _106;
    float _110 = in.m_46.x;
    float _112 = gl_FragCoord.w;
    float _114 = _110 * _112;
    float _116 = _90 * _102;
    float _118 = _90 * _108;
    float _120 = -_118;
    float _122 = _120 + 1.0;
    float _124 = -_118;
    float _126 = _124 + 1.00100004673004150390625;
    float _128 = _96 + _116;
    float _130 = _90 * _114;
    float _132 = _128 * 0.5;
    float _134 = precise::max(_122, _132);
    float _136 = precise::min(_126, _134);
    float _138 = -_122;
    float _140 = _138 + _136;
    float _142 = _140 * 999.9532470703125;
    float _144 = 0.0 + _142;
    float _146 = precise::clamp(_144, 0.0, 1.0);
    float _148 = _146 * _130;
    bool _151 = _148 > (*spvDescriptorSet0.fp_c9)._m0[141].z;
    bool _153 = isnan(_148);
    bool _155 = _151 || _153;
    bool _157 = isnan((*spvDescriptorSet0.fp_c9)._m0[141].z);
    bool _159 = _155 || _157;
    float _161 = in.m_48.y;
    float _163 = gl_FragCoord.w;
    float _165 = _161 * _163;
    float _167 = as_type<float>(gl_FrontFacing ? (-1) : 0);
    float _169 = in.m_48.x;
    float _171 = gl_FragCoord.w;
    float _173 = _169 * _171;
    float _175 = in.m_48.z;
    float _177 = gl_FragCoord.w;
    float _179 = _175 * _177;
    if (!_159)
    {
        discard_fragment();
    }
    float _181 = _90 * _165;
    bool _183 = as_type<int>(_167) != 0;
    float _185 = _90 * _173;
    bool _187 = !_183;
    float _189 = -_181;
    float _191 = _187 ? _189 : _181;
    float _193 = _90 * _179;
    bool _195 = !_183;
    float _197 = -_185;
    float _199 = _195 ? _197 : _185;
    float _201 = _191 * _191;
    bool _203 = !_183;
    float _205 = -_193;
    float _207 = _203 ? _205 : _193;
    float _209 = fma(_199, _199, _201);
    float _211 = fma(_207, _207, _209);
    float _213 = rsqrt(_211);
    float _215 = _199 * _213;
    float _217 = _191 * _213;
    float _219 = _207 * _213;
    float _221 = abs(_215);
    float _223 = abs(_217);
    float _225 = precise::max(_221, _223);
    float _227 = abs(_219);
    float _229 = precise::max(_227, _225);
    float _231 = 1.0 / _229;
    float _233 = -_231;
    float _235 = _219 * _233;
    float _237 = _215 * _231;
    float _239 = _217 * _231;
    float3 _952 = float3(_237, _239, _235);
    float3 _243 = dm_bs(spvDescriptorSet0.fp_t_tcb_1E.sample(spvDescriptorSet0.fp_t_tcb_1ESmplr, select(_952, float3(0.0), isnan(_952)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_1E, spvDescriptorSet0.fp_t_tcb_1ESmplr_w, select(_952, float3(0.0), isnan(_952)), level(0.0)).xyz;
    float _245 = _243.x;
    float _247 = _243.y;
    float _249 = _243.z;
    float _251 = in.m_54.y;
    float _253 = gl_FragCoord.w;
    float _255 = _251 * _253;
    float _257 = in.m_54.x;
    float _259 = gl_FragCoord.w;
    float _261 = _257 * _259;
    float _263 = in.m_54.z;
    float _265 = gl_FragCoord.w;
    float _267 = _263 * _265;
    float _269 = in.m_44.x;
    float _271 = gl_FragCoord.w;
    float _273 = _269 * _271;
    float _275 = in.m_56.x;
    float _277 = gl_FragCoord.w;
    float _279 = _275 * _277;
    float _281 = in.m_44.y;
    float _283 = gl_FragCoord.w;
    float _285 = _281 * _283;
    float _287 = in.m_56.y;
    float _289 = gl_FragCoord.w;
    float _291 = _287 * _289;
    float _293 = _90 * _255;
    float _295 = _90 * _261;
    float _297 = _90 * _267;
    float _299 = -(*spvDescriptorSet0.fp_c8)._m0[29].y;
    float _301 = _293 + _299;
    float _303 = -(*spvDescriptorSet0.fp_c8)._m0[29].x;
    float _305 = _295 + _303;
    float _307 = -(*spvDescriptorSet0.fp_c8)._m0[29].z;
    float _309 = _297 + _307;
    float _311 = in.m_44.z;
    float _313 = gl_FragCoord.w;
    float _315 = _311 * _313;
    float _317 = _301 * _301;
    float _319 = fma(_305, _305, _317);
    float _321 = fma(_309, _309, _319);
    float _323 = _217 * _217;
    float _325 = fma(_215, _215, _323);
    float _327 = rsqrt(_321);
    float _329 = fma(_219, _219, _325);
    float _331 = rsqrt(_329);
    float _333 = _301 * _327;
    float _335 = _305 * _327;
    float _337 = _309 * _327;
    float _339 = _333 * _333;
    float _341 = in.m_56.z;
    float _343 = gl_FragCoord.w;
    float _345 = _341 * _343;
    float _347 = fma(_335, _335, _339);
    float _349 = _217 * _331;
    float _351 = fma(_337, _337, _347);
    float _353 = rsqrt(_351);
    float _355 = _333 * _353;
    if (!_159)
    {
        out.m_59.x = 0.006000000052154064178466796875;
        out.m_59.y = 0.00200000009499490261077880859375;
        out.m_59.z = 0.001000000047497451305389404296875;
        out.m_59.w = _142;
        return out;
    }
    float _357 = in.m_61.w;
    float _359 = gl_FragCoord.w;
    float _361 = _357 * _359;
    float _363 = _215 * _331;
    float _365 = _335 * _353;
    float _367 = _349 * _355;
    float _369 = _219 * _331;
    float _371 = _337 * _353;
    float _373 = -(*spvDescriptorSet0.fp_c10)._m0[9].w;
    float _375 = _293 + _373;
    float _377 = fma(_363, _365, _367);
    float _379 = -(*spvDescriptorSet0.fp_c10)._m0[8].w;
    float _381 = _295 + _379;
    float _383 = -(*spvDescriptorSet0.fp_c10)._m0[10].w;
    float _385 = _297 + _383;
    float _387 = _375 * _349;
    float _389 = fma(_369, _371, _377);
    float _391 = _90 * _285;
    float _393 = _90 * _291;
    float _395 = fma(_381, _363, _387);
    float _397 = abs(_389);
    float _399 = _397 + (-1.0);
    float _401 = _90 * _273;
    float _403 = fma(_385, _369, _395);
    float _405 = -_399;
    float _407 = 0.0 + _405;
    float _409 = precise::clamp(_407, 0.0, 1.0);
    float _411 = _90 * _315;
    float _413 = _90 * _345;
    float _415 = -_403;
    float _417 = 0.0 + _415;
    float _419 = precise::clamp(_417, 0.0, 1.0);
    float _421 = fma(_409, -2.0, 3.0);
    float _423 = _409 * _409;
    float _425 = -_393;
    float _427 = _391 + _425;
    float _429 = -_413;
    float _431 = _411 + _429;
    float _433 = fma(_421, _423, _419);
    float _435 = precise::clamp(_433, 0.0, 1.0);
    float _437 = _90 * _279;
    float _439 = _90 * _361;
    float _441 = -_437;
    float _443 = _401 + _441;
    float _445 = fma(_435, _427, _393);
    float _447 = fma(_435, _431, _413);
    bool _449 = _439 != 1.0;
    bool _451 = isnan(_439);
    bool _453 = _449 || _451;
    bool _455 = isnan(1.0);
    bool _457 = _453 || _455;
    float _459 = fma(_435, _443, _437);
    bool _461 = !_457;
    if (!_461)
    {
        float _463 = gl_FragCoord.x;
        float _465 = (*spvDescriptorSet0.support_buffer)._m5[0].x;
        float _467 = _463 / _465;
        float _469 = gl_FragCoord.y;
        float _471 = (*spvDescriptorSet0.support_buffer)._m5[0].x;
        float _473 = _469 / _471;
        float _475 = trunc(_467);
        int _478 = int(_475);
        float _480 = trunc(_473);
        int _482 = int(_480);
        int _484 = _478 + 2;
        int _486 = _484 >> 1;
        uint _489 = uint(int(uint(_482) >> uint(1)));
        int _491 = _486 ^ int(_489);
        int _493 = _491 << 16;
        int _495 = _493 ^ _486;
        int _497 = 983055 & _495;
        float _499 = _439 * 256.0;
        int _501 = _497 << 6;
        int _503 = _501 + _497;
        float _505 = trunc(_499);
        int _507 = int(_505);
        int _509 = _503 & 13369548;
        uint _511 = uint(int(uint(_509) >> uint(3)));
        int _513 = _509 | int(_511);
        int _515 = _513 & 5570560;
        int _517 = _513 & 85;
        uint _519 = uint(int(uint(_507) >> uint(7)));
        int _521 = int(_519) + _507;
        uint _523 = uint(int(uint(_515) >> uint(15)));
        int _525 = int(_523) + _517;
        bool _527 = uint(_521) > uint(_525);
        if (!_527)
        {
            discard_fragment();
        }
        if (!_527)
        {
            out.m_59.x = 0.006000000052154064178466796875;
            out.m_59.y = 0.00200000009499490261077880859375;
            out.m_59.z = 0.001000000047497451305389404296875;
            out.m_59.w = _148;
            return out;
        }
    }
    float _529 = _445 * 0.715200006961822509765625;
    float _531 = in.m_63.y;
    float _533 = gl_FragCoord.w;
    float _535 = _531 * _533;
    float _537 = in.m_63.z;
    float _539 = gl_FragCoord.w;
    float _541 = _537 * _539;
    float _543 = in.m_63.x;
    float _545 = gl_FragCoord.w;
    float _547 = _543 * _545;
    float _549 = fma(_459, 0.2125999927520751953125, _529);
    float _551 = in.m_65.z;
    float _553 = gl_FragCoord.w;
    float _555 = _551 * _553;
    float _557 = in.m_65.x;
    float _559 = gl_FragCoord.w;
    float _561 = _557 * _559;
    float _563 = in.m_65.y;
    float _565 = gl_FragCoord.w;
    float _567 = _563 * _565;
    float _569 = fma(_447, 0.072200000286102294921875, _549);
    float _571 = in.m_67.y;
    float _573 = gl_FragCoord.w;
    float _575 = _571 * _573;
    float _577 = in.m_67.w;
    float _579 = gl_FragCoord.w;
    float _581 = _577 * _579;
    float _583 = in.m_67.z;
    float _585 = gl_FragCoord.w;
    float _587 = _583 * _585;
    float _589 = 1.0 / _569;
    float _591 = in.m_67.x;
    float _593 = gl_FragCoord.w;
    float _595 = _591 * _593;
    float _597 = _589 * (*spvDescriptorSet0.fp_c15)._m0[2].z;
    float _599 = precise::clamp(_597, 0.0, 1.0);
    float _601 = fma(_599, (*spvDescriptorSet0.fp_c15)._m0[2].y, (*spvDescriptorSet0.fp_c15)._m0[2].x);
    float _603 = _90 * _535;
    float _605 = _90 * _541;
    float _607 = _90 * _547;
    float _609 = _459 * _601;
    float _611 = _445 * _601;
    float _613 = fma(_247, 0.20999999344348907470703125, _603);
    float _615 = fma(_249, 0.20999999344348907470703125, _605);
    bool _617 = (*spvDescriptorSet0.fp_c15)._m0[653].w >= 0.5;
    float _619 = _90 * _555;
    float _621 = fma(_245, 0.20999999344348907470703125, _607);
    float _623 = _90 * _561;
    float _625 = _90 * _567;
    float _627 = _447 * _601;
    float _629 = _615 + _619;
    float _631 = _621 + _623;
    float _633 = _613 + _625;
    float _635 = 0.0 + _148;
    float _637 = precise::clamp(_635, 0.0, 1.0);
    float _639 = _90 * _575;
    float _641 = fma(_629, 0.001000000047497451305389404296875, _627);
    float _643 = _90 * _581;
    float _645 = _90 * _587;
    float _647 = fma(_631, 0.006000000052154064178466796875, _609);
    float _649 = fma(_633, 0.00200000009499490261077880859375, _611);
    float _651 = _90 * _595;
    float _653 = fma(_641, _643, _645);
    float _655 = _645;
    if (!_617)
    {
        _655 = _637;
    }
    float _657 = _655;
    float _659 = fma(_649, _643, _639);
    float _661 = fma(_647, _643, _651);
    bool _663 = !_617;
    float _665 = _657;
    if (!_663)
    {
        float _667 = in.m_69.w;
        float _669 = gl_FragCoord.w;
        float _671 = _667 * _669;
        float _673 = in.m_69.z;
        float _675 = gl_FragCoord.w;
        float _677 = _673 * _675;
        float _679 = _90 * _671;
        float _681 = _90 * _677;
        float _683 = 1.0 / _679;
        float _685 = _681 * _683;
        float _687 = -(*spvDescriptorSet0.fp_c8)._m0[30].y;
        float _689 = fma(_685, (*spvDescriptorSet0.fp_c8)._m0[30].w, _687);
        float _691 = 1.0 / _689;
        float _693 = -(*spvDescriptorSet0.fp_c8)._m0[30].z;
        float _695 = -(*spvDescriptorSet0.fp_c8)._m0[30].x;
        float _697 = fma(_691, _693, _695);
        float _699 = _697 * 8.0;
        float _701 = precise::clamp(_699, 0.0, 1.0);
        float _703 = _637 * _701;
        _665 = _703;
    }
    float _705 = _665;
    float _707 = 0.0 + _705;
    float _709 = precise::clamp(_707, 0.0, 1.0);
    out.m_59.x = _661;
    out.m_59.y = _659;
    out.m_59.z = _653;
    out.m_59.w = _709;
    return out;
}

