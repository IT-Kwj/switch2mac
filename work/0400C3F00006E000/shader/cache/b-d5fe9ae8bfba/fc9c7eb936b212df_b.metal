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
    constant _16* fp_c8 [[id(0)]];
    constant _16* fp_c9 [[id(1)]];
    constant _16* fp_c15 [[id(2)]];
    texture2d<float> fp_t_tcb_8 [[id(3)]];
    sampler fp_t_tcb_8Smplr [[id(4)]];
    texture2d<float> fp_t_tcb_A [[id(5)]];
    sampler fp_t_tcb_ASmplr [[id(6)]];
    texturecube<float> fp_t_tcb_1E [[id(7)]];
    sampler fp_t_tcb_1ESmplr [[id(8)]];
    sampler fp_t_tcb_8Smplr_w [[id(9)]];
    sampler fp_t_tcb_ASmplr_w [[id(10)]];
    sampler fp_t_tcb_1ESmplr_w [[id(11)]];
    constant dm_border_t* dm_border [[id(12)]];
};

struct main0_out
{
    float4 m_65 [[color(0)]];
};

struct main0_in
{
    float4 m_56 [[user(locn0)]];
    float4 m_62 [[user(locn1)]];
    float4 m_52 [[user(locn2)]];
    float4 m_40 [[user(locn3)]];
    float4 m_73 [[user(locn4)]];
    float4 m_60 [[user(locn5)]];
    float4 m_54 [[user(locn6), flat]];
    float4 m_50 [[user(locn7), flat]];
    float4 m_67 [[user(locn8)]];
    float4 m_58 [[user(locn9)]];
    float4 m_42 [[user(locn10)]];
    float4 m_48 [[user(locn11)]];
    float4 m_69 [[user(locn12)]];
    float4 m_71 [[user(locn13)]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]], bool gl_FrontFacing [[front_facing]])
{
    main0_out out = {};
    float _80 = gl_FragCoord.w;
    float _82 = in.m_40.x;
    float _84 = gl_FragCoord.w;
    float _86 = _82 * _84;
    float _88 = in.m_40.z;
    float _90 = gl_FragCoord.w;
    float _92 = _88 * _90;
    float _94 = in.m_40.y;
    float _96 = gl_FragCoord.w;
    float _98 = _94 * _96;
    float _100 = in.m_40.w;
    float _102 = gl_FragCoord.w;
    float _104 = _100 * _102;
    float _106 = 1.0 / _80;
    float _108 = _106 * _86;
    float _110 = _106 * _92;
    float _112 = _106 * _98;
    float _114 = _106 * _104;
    float2 _724 = float2(_108, _112);
    float _116 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_724, float2(0.0), isnan(_724))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_724, float2(0.0), isnan(_724))).w;
    float2 _735 = float2(_110, _114);
    float _118 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_735, float2(0.0), isnan(_735))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_735, float2(0.0), isnan(_735))).w;
    float _120 = in.m_42.y;
    float _122 = gl_FragCoord.w;
    float _124 = _120 * _122;
    float _126 = as_type<float>(gl_FrontFacing ? (-1) : 0);
    float _128 = in.m_42.x;
    float _130 = gl_FragCoord.w;
    float _132 = _128 * _130;
    float _134 = in.m_42.z;
    float _136 = gl_FragCoord.w;
    float _138 = _134 * _136;
    float _140 = in.m_48.y;
    float _142 = gl_FragCoord.w;
    float _144 = _140 * _142;
    float _146 = in.m_48.x;
    float _148 = gl_FragCoord.w;
    float _150 = _146 * _148;
    float _152 = in.m_48.z;
    float _154 = gl_FragCoord.w;
    float _156 = _152 * _154;
    float _158 = in.m_50.z;
    float _160 = in.m_52.w;
    float _162 = gl_FragCoord.w;
    float _164 = _160 * _162;
    float _166 = _106 * _124;
    bool _169 = as_type<int>(_126) != 0;
    float _171 = _106 * _132;
    float _173 = _106 * _138;
    float _175 = in.m_50.x;
    bool _177 = !_169;
    float _179 = -_166;
    float _181 = _177 ? _179 : _166;
    float _183 = in.m_50.y;
    bool _185 = !_169;
    float _187 = -_171;
    float _189 = _185 ? _187 : _171;
    float _191 = 1.0 / _158;
    bool _193 = !_169;
    float _195 = -_173;
    float _197 = _193 ? _195 : _173;
    float _199 = _181 * _181;
    float _201 = _106 * _144;
    float _203 = fma(_189, _189, _199);
    float _205 = -(*spvDescriptorSet0.fp_c8)._m0[29].y;
    float _207 = _201 + _205;
    float _209 = _106 * _156;
    float _211 = fma(_197, _197, _203);
    float _213 = _106 * _150;
    float _215 = -(*spvDescriptorSet0.fp_c8)._m0[29].z;
    float _217 = _209 + _215;
    float _219 = -(*spvDescriptorSet0.fp_c8)._m0[29].x;
    float _221 = _213 + _219;
    float _223 = rsqrt(_211);
    float _225 = _207 * _207;
    float _227 = fma(_221, _221, _225);
    float _229 = 1.0 / _175;
    float _231 = _181 * _223;
    float _233 = _189 * _223;
    float _235 = fma(_217, _217, _227);
    float _237 = _197 * _223;
    float _239 = _231 * _231;
    float _241 = 1.0 / _183;
    float _243 = fma(_233, _233, _239);
    float _245 = fma(_237, _237, _243);
    float _247 = rsqrt(_235);
    float _249 = rsqrt(_245);
    float _251 = _207 * _247;
    float _253 = _221 * _247;
    float _255 = _217 * _247;
    float _257 = _251 * _251;
    float _259 = _231 * _249;
    float _261 = _233 * _249;
    float _263 = fma(_253, _253, _257);
    float _265 = _237 * _249;
    float _267 = _259 * _241;
    float _269 = in.m_54.x;
    float _271 = _261 * _229;
    float _273 = fma(_255, _255, _263);
    float _275 = _267 * _267;
    float _277 = _265 * _191;
    float _279 = in.m_56.w;
    float _281 = gl_FragCoord.w;
    float _283 = _279 * _281;
    float _285 = rsqrt(_273);
    float _287 = fma(_271, _271, _275);
    float _289 = fma(_277, _277, _287);
    float _291 = (*spvDescriptorSet0.fp_c9)._m0[191].x + 0.0099999904632568359375;
    float _293 = rsqrt(_289);
    float _295 = _251 * _285;
    float _297 = _253 * _285;
    float _299 = _255 * _285;
    float _301 = fma(_269, _291, 0.100000001490116119384765625);
    float _303 = _267 * _293;
    float _305 = in.m_58.y;
    float _307 = gl_FragCoord.w;
    float _309 = _305 * _307;
    float _311 = _271 * _293;
    float _313 = 1.0 / _301;
    float _315 = _303 * _295;
    float _317 = _277 * _293;
    float _319 = fma(_311, _297, _315);
    float _321 = _106 * _283;
    float _323 = fma(_317, _299, _319);
    float _325 = fma(_321, -0.999999940395355224609375, 1.7999999523162841796875);
    float _327 = fma(_321, -0.999999940395355224609375, 2.0);
    float _329 = _106 * _164;
    float _331 = abs(_323);
    float _333 = _331 + (-0.100000001490116119384765625);
    float _335 = in.m_60.x;
    float _337 = gl_FragCoord.w;
    float _339 = _335 * _337;
    float _341 = _333 * _313;
    float _343 = precise::clamp(_341, 0.0, 1.0);
    float _345 = _106 * _309;
    float _347 = _329 * _345;
    float _349 = _116 + _118;
    float _351 = _349 * _329;
    float _353 = fma(_343, -2.0, 3.0);
    float _355 = _343 * _343;
    float _357 = precise::max(_325, _351);
    float _359 = fma(_353, _355, _116);
    float _361 = precise::min(_327, _357);
    float _363 = precise::max(_359, 0.89999997615814208984375);
    float _365 = -_325;
    float _367 = _365 + _361;
    float _369 = precise::min(_363, 1.10000002384185791015625);
    float _371 = _367 * 4.99999904632568359375;
    float _373 = fma(_369, 4.99999904632568359375, -4.49999904632568359375);
    float _375 = _106 * _339;
    float _377 = _371 * _347;
    float _379 = _377 * _373;
    float _381 = 0.0 + _379;
    float _383 = precise::clamp(_381, 0.0, 1.0);
    float _385 = _383 * _375;
    bool _387 = _385 > (*spvDescriptorSet0.fp_c9)._m0[141].z;
    bool _389 = isnan(_385);
    bool _391 = _387 || _389;
    bool _393 = isnan((*spvDescriptorSet0.fp_c9)._m0[141].z);
    bool _395 = _391 || _393;
    float _397 = abs(_233);
    float _399 = abs(_231);
    float _401 = precise::max(_397, _399);
    float _403 = abs(_237);
    float _405 = precise::max(_403, _401);
    if (!_395)
    {
        discard_fragment();
    }
    float _407 = 1.0 / _405;
    float _409 = -_407;
    float _411 = _237 * _409;
    float _413 = _233 * _407;
    float _415 = _231 * _407;
    float3 _1169 = float3(_413, _415, _411);
    float3 _419 = dm_bs(spvDescriptorSet0.fp_t_tcb_1E.sample(spvDescriptorSet0.fp_t_tcb_1ESmplr, select(_1169, float3(0.0), isnan(_1169)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_1E, spvDescriptorSet0.fp_t_tcb_1ESmplr_w, select(_1169, float3(0.0), isnan(_1169)), level(0.0)).xyz;
    float _421 = _419.x;
    float _423 = _419.y;
    float _425 = _419.z;
    float _427 = in.m_62.x;
    float _429 = gl_FragCoord.w;
    float _431 = _427 * _429;
    float _433 = in.m_56.x;
    float _435 = gl_FragCoord.w;
    float _437 = _433 * _435;
    float _439 = in.m_62.y;
    float _441 = gl_FragCoord.w;
    float _443 = _439 * _441;
    float _445 = in.m_56.y;
    float _447 = gl_FragCoord.w;
    float _449 = _445 * _447;
    float _451 = in.m_62.z;
    float _453 = gl_FragCoord.w;
    float _455 = _451 * _453;
    float _457 = in.m_56.z;
    float _459 = gl_FragCoord.w;
    float _461 = _457 * _459;
    float _463 = in.m_62.w;
    float _465 = gl_FragCoord.w;
    float _467 = _463 * _465;
    float _469 = _329 * _377;
    float _471 = _106 * _431;
    float _473 = _106 * _437;
    float _475 = _106 * _443;
    float _477 = _106 * _449;
    float _479 = _106 * _455;
    float _481 = _106 * _461;
    float _483 = -_471;
    float _485 = _483 + _473;
    float _487 = -_475;
    float _489 = _487 + _477;
    float _491 = _106 * _467;
    float _493 = -_479;
    float _495 = _493 + _481;
    float _497 = fma(_469, _485, _471);
    float _499 = fma(_469, _489, _475);
    float _501 = fma(_469, _495, _479);
    float _503 = _491 * _497;
    float _505 = _491 * _499;
    float _507 = _491 * _501;
    if (!_395)
    {
        out.m_65.x = _503;
        out.m_65.y = _505;
        out.m_65.z = _507;
        out.m_65.w = _379;
        return out;
    }
    float _509 = in.m_67.y;
    float _511 = gl_FragCoord.w;
    float _513 = _509 * _511;
    float _515 = in.m_67.x;
    float _517 = gl_FragCoord.w;
    float _519 = _515 * _517;
    float _521 = in.m_67.z;
    float _523 = gl_FragCoord.w;
    float _525 = _521 * _523;
    float _527 = in.m_69.y;
    float _529 = gl_FragCoord.w;
    float _531 = _527 * _529;
    float _533 = in.m_69.x;
    float _535 = gl_FragCoord.w;
    float _537 = _533 * _535;
    float _539 = in.m_69.z;
    float _541 = gl_FragCoord.w;
    float _543 = _539 * _541;
    float _545 = in.m_71.x;
    float _547 = gl_FragCoord.w;
    float _549 = _545 * _547;
    float _551 = in.m_71.w;
    float _553 = gl_FragCoord.w;
    float _555 = _551 * _553;
    float _557 = in.m_71.y;
    float _559 = gl_FragCoord.w;
    float _561 = _557 * _559;
    float _563 = in.m_71.z;
    float _565 = gl_FragCoord.w;
    float _567 = _563 * _565;
    float _569 = _106 * _513;
    float _571 = _106 * _519;
    float _573 = _106 * _525;
    float _575 = fma(_423, 0.20999999344348907470703125, _569);
    float _577 = fma(_421, 0.20999999344348907470703125, _571);
    float _579 = _106 * _531;
    bool _581 = (*spvDescriptorSet0.fp_c15)._m0[653].w >= 0.5;
    float _583 = _106 * _537;
    float _585 = fma(_425, 0.20999999344348907470703125, _573);
    float _587 = _106 * _543;
    float _589 = _575 + _579;
    float _591 = _577 + _583;
    float _593 = _106 * _561;
    float _595 = _585 + _587;
    float _597 = _505 * _589;
    float _599 = _503 * _591;
    float _601 = 0.0 + _385;
    float _603 = precise::clamp(_601, 0.0, 1.0);
    float _605 = _106 * _549;
    float _607 = _106 * _555;
    float _609 = _507 * _595;
    float _611 = _106 * _567;
    float _613 = fma(_599, _607, _605);
    float _615 = fma(_597, _607, _593);
    float _617 = fma(_609, _607, _611);
    float _619 = _605;
    if (!_581)
    {
        _619 = _603;
    }
    float _621 = _619;
    bool _623 = !_581;
    float _625 = _621;
    if (!_623)
    {
        float _627 = in.m_73.w;
        float _629 = gl_FragCoord.w;
        float _631 = _627 * _629;
        float _633 = in.m_73.z;
        float _635 = gl_FragCoord.w;
        float _637 = _633 * _635;
        float _639 = _106 * _631;
        float _641 = _106 * _637;
        float _643 = 1.0 / _639;
        float _645 = _641 * _643;
        float _647 = -(*spvDescriptorSet0.fp_c8)._m0[30].y;
        float _649 = fma(_645, (*spvDescriptorSet0.fp_c8)._m0[30].w, _647);
        float _651 = 1.0 / _649;
        float _653 = -(*spvDescriptorSet0.fp_c8)._m0[30].z;
        float _655 = -(*spvDescriptorSet0.fp_c8)._m0[30].x;
        float _657 = fma(_651, _653, _655);
        float _659 = _657 * 8.0;
        float _661 = precise::clamp(_659, 0.0, 1.0);
        float _663 = _603 * _661;
        _625 = _663;
    }
    float _665 = _625;
    float _667 = 0.0 + _665;
    float _669 = precise::clamp(_667, 0.0, 1.0);
    out.m_65.x = _613;
    out.m_65.y = _615;
    out.m_65.z = _617;
    out.m_65.w = _669;
    return out;
}

