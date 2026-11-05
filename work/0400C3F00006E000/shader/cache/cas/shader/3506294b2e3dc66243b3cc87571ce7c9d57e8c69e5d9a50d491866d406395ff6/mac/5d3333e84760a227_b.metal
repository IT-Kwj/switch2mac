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
    constant _16* fp_c9 [[id(0)]];
    constant _16* fp_c8 [[id(1)]];
    constant _16* fp_c15 [[id(2)]];
    constant _16* fp_c13 [[id(3)]];
    texture2d<float> fp_t_tcb_10 [[id(4)]];
    sampler fp_t_tcb_10Smplr [[id(5)]];
    texture2d_array<float> fp_t_tcb_8 [[id(6)]];
    sampler fp_t_tcb_8Smplr [[id(7)]];
    texturecube<float> fp_t_tcb_1E [[id(8)]];
    sampler fp_t_tcb_1ESmplr [[id(9)]];
    sampler fp_t_tcb_10Smplr_w [[id(10)]];
    sampler fp_t_tcb_8Smplr_w [[id(11)]];
    sampler fp_t_tcb_1ESmplr_w [[id(12)]];
    constant dm_border_t* dm_border [[id(13)]];
};

struct main0_out
{
    float4 m_60 [[color(0)]];
};

struct main0_in
{
    float4 m_53 [[user(locn0)]];
    float4 m_55 [[user(locn1)]];
    float4 m_57 [[user(locn2)]];
    float4 m_68 [[user(locn3)]];
    float4 m_51 [[user(locn4), flat]];
    float4 m_49 [[user(locn5)]];
    float4 m_47 [[user(locn6)]];
    float4 m_45 [[user(locn7), flat]];
    float4 m_62 [[user(locn8)]];
    float4 m_70 [[user(locn9)]];
    float4 m_66 [[user(locn10)]];
    float4 m_64 [[user(locn11)]];
    float4 m_72 [[user(locn12)]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    float _79 = gl_FragCoord.w;
    float _81 = in.m_45.x;
    float _83 = in.m_47.w;
    float _85 = gl_FragCoord.w;
    float _87 = _83 * _85;
    float _89 = 1.0 / (*spvDescriptorSet0.fp_c9)._m0[22].x;
    float _91 = in.m_47.x;
    float _93 = gl_FragCoord.w;
    float _95 = _91 * _93;
    float _97 = in.m_47.y;
    float _99 = gl_FragCoord.w;
    float _101 = _97 * _99;
    float _103 = in.m_49.x;
    float _105 = gl_FragCoord.w;
    float _107 = _103 * _105;
    float _109 = in.m_49.y;
    float _111 = gl_FragCoord.w;
    float _113 = _109 * _111;
    float _115 = 1.0 / _79;
    float _117 = _81 + 1.0;
    float _119 = _117 * _89;
    float _121 = rint(_81);
    float _123 = precise::max(_121, 0.0);
    uint _126 = uint(_123);
    uint _128 = clamp(_126, 0u, 65535u);
    float _130 = floor(_119);
    float _132 = _115 * _87;
    float _134 = _115 * _107;
    float _136 = 1.0 / _132;
    float _138 = -_130;
    float _140 = fma(_138, (*spvDescriptorSet0.fp_c9)._m0[22].x, _117);
    float _142 = _115 * _95;
    float _144 = _115 * _101;
    float _146 = rint(_140);
    float _148 = precise::max(_146, 0.0);
    uint _150 = uint(_148);
    uint _152 = clamp(_150, 0u, 65535u);
    float _154 = _142 * _136;
    float _156 = _144 * _136;
    float _158 = _115 * _113;
    float2 _752 = float2(_154, _156);
    float _160 = dm_bs(spvDescriptorSet0.fp_t_tcb_10.sample(spvDescriptorSet0.fp_t_tcb_10Smplr, select(_752, float2(0.0), isnan(_752))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_10, spvDescriptorSet0.fp_t_tcb_10Smplr_w, select(_752, float2(0.0), isnan(_752))).x;
    float3 _765 = float3(_134, _158, float(int(_128)));
    float3 _769 = select(_765, float3(0.0), isnan(_765));
    float4 _163 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, _769.xy, uint(rint(_769.z))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, _769.xy, uint(rint(_769.z))).xyzw;
    float _165 = _163.x;
    float _167 = _163.y;
    float _169 = _163.z;
    float _171 = _163.w;
    float3 _786 = float3(_134, _158, float(int(_152)));
    float3 _788 = select(_786, float3(0.0), isnan(_786));
    float4 _173 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, _788.xy, uint(rint(_788.z))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, _788.xy, uint(rint(_788.z))).xyzw;
    float _175 = _173.x;
    float _177 = _173.y;
    float _179 = _173.z;
    float _181 = _173.w;
    float _183 = in.m_51.y;
    float _185 = 1.0 / (*spvDescriptorSet0.fp_c9)._m0[22].y;
    float _187 = in.m_47.z;
    float _189 = gl_FragCoord.w;
    float _191 = _187 * _189;
    float _193 = in.m_53.w;
    float _195 = gl_FragCoord.w;
    float _197 = _193 * _195;
    float _199 = in.m_55.w;
    float _201 = gl_FragCoord.w;
    float _203 = _199 * _201;
    float _205 = in.m_57.x;
    float _207 = gl_FragCoord.w;
    float _209 = _205 * _207;
    float _211 = _183 * _185;
    float _213 = _211 * _185;
    float _215 = floor(_213);
    float _217 = _115 * _191;
    float _219 = _217 * _136;
    float _221 = -(*spvDescriptorSet0.fp_c8)._m0[30].y;
    float _223 = fma(_219, (*spvDescriptorSet0.fp_c8)._m0[30].w, _221);
    float _225 = 1.0 / _223;
    float _227 = -_215;
    float _229 = fma(_227, (*spvDescriptorSet0.fp_c9)._m0[22].y, _211);
    float _231 = _229 + 9.9999997473787516355514526367188e-05;
    float _233 = floor(_231);
    float _235 = -_233;
    float _237 = _231 + _235;
    float _239 = 1.0 / (*spvDescriptorSet0.fp_c9)._m0[142].y;
    float _241 = in.m_55.z;
    float _243 = gl_FragCoord.w;
    float _245 = _241 * _243;
    float _247 = -(*spvDescriptorSet0.fp_c8)._m0[30].y;
    float _249 = fma(_160, (*spvDescriptorSet0.fp_c8)._m0[30].w, _247);
    float _251 = 1.0 / _249;
    float _253 = -_171;
    float _255 = _253 + _181;
    float _257 = -(*spvDescriptorSet0.fp_c8)._m0[30].z;
    float _259 = _225 * _257;
    float _261 = fma(_237, _255, _171);
    float _263 = _115 * _197;
    float _265 = _115 * _209;
    float _267 = _261 * _263;
    float _269 = _115 * _203;
    float _271 = -(*spvDescriptorSet0.fp_c8)._m0[30].z;
    float _273 = -_259;
    float _275 = fma(_251, _271, _273);
    float _277 = _269 * _267;
    float _279 = _275 * _239;
    float _281 = precise::clamp(_279, 0.0, 1.0);
    float _283 = 0.0 + _277;
    float _285 = precise::clamp(_283, 0.0, 1.0);
    float _287 = _285 * _281;
    float _289 = _287 * _265;
    bool _293 = _289 > (*spvDescriptorSet0.fp_c9)._m0[141].z;
    bool _295 = isnan(_289);
    bool _297 = _293 || _295;
    bool _299 = isnan((*spvDescriptorSet0.fp_c9)._m0[141].z);
    bool _301 = _297 || _299;
    float _303 = in.m_53.x;
    float _305 = gl_FragCoord.w;
    float _307 = _303 * _305;
    float _309 = in.m_55.x;
    float _311 = gl_FragCoord.w;
    float _313 = _309 * _311;
    float _315 = in.m_53.y;
    float _317 = gl_FragCoord.w;
    float _319 = _315 * _317;
    float _321 = in.m_55.y;
    float _323 = gl_FragCoord.w;
    float _325 = _321 * _323;
    float _327 = in.m_53.z;
    float _329 = gl_FragCoord.w;
    float _331 = _327 * _329;
    float _333 = _259;
    if (!_301)
    {
        discard_fragment();
    }
    float _335 = -_167;
    float _337 = _335 + _177;
    float _339 = -_165;
    float _341 = _339 + _175;
    float _343 = -_169;
    float _345 = _343 + _179;
    float _347 = fma(_237, _337, _167);
    float _349 = fma(_237, _341, _165);
    float _351 = fma(_237, _345, _169);
    float _353 = _115 * _307;
    float _355 = _115 * _313;
    float _357 = _115 * _319;
    float _359 = _115 * _325;
    float _361 = _115 * _331;
    float _363 = _115 * _245;
    float _365 = -_355;
    float _367 = _353 + _365;
    float _369 = -_359;
    float _371 = _357 + _369;
    float _373 = -_363;
    float _375 = _361 + _373;
    float _377 = fma(_349, _367, _355);
    float _379 = fma(_347, _371, _359);
    float _381 = fma(_351, _375, _363);
    if (!_301)
    {
        out.m_60.x = _377;
        out.m_60.y = _379;
        out.m_60.z = _381;
        out.m_60.w = _277;
        return out;
    }
    float _383 = in.m_62.y;
    float _385 = gl_FragCoord.w;
    float _387 = _383 * _385;
    float _389 = in.m_62.x;
    float _391 = gl_FragCoord.w;
    float _393 = _389 * _391;
    float _395 = in.m_62.z;
    float _397 = gl_FragCoord.w;
    float _399 = _395 * _397;
    float _401 = _115 * _387;
    float _403 = _115 * _393;
    float _405 = _115 * _399;
    float _407 = _401 * _401;
    float _409 = in.m_64.x;
    float _411 = gl_FragCoord.w;
    float _413 = _409 * _411;
    float _415 = fma(_403, _403, _407);
    float _417 = fma(_405, _405, _415);
    float _419 = rsqrt(_417);
    float _421 = _403 * _419;
    float _423 = _401 * _419;
    float _425 = _405 * _419;
    float _427 = _115 * _413;
    float _429 = abs(_421);
    float _431 = abs(_423);
    float _433 = precise::max(_429, _431);
    float _435 = precise::min(_427, 1.0);
    float _437 = abs(_425);
    float _439 = precise::max(_437, _433);
    float _441 = 1.0 / _439;
    float _443 = -_441;
    float _445 = _425 * _443;
    float _447 = _421 * _441;
    float _449 = _423 * _441;
    float3 _1184 = float3(_447, _449, _445);
    float3 _453 = dm_bs(spvDescriptorSet0.fp_t_tcb_1E.sample(spvDescriptorSet0.fp_t_tcb_1ESmplr, select(_1184, float3(0.0), isnan(_1184)), level(_435)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_1E, spvDescriptorSet0.fp_t_tcb_1ESmplr_w, select(_1184, float3(0.0), isnan(_1184)), level(_435)).xyz;
    float _455 = _453.x;
    float _457 = _453.y;
    float _459 = _453.z;
    float _461 = in.m_66.x;
    float _463 = gl_FragCoord.w;
    float _465 = _461 * _463;
    float _467 = in.m_66.y;
    float _469 = gl_FragCoord.w;
    float _471 = _467 * _469;
    float _473 = in.m_66.z;
    float _475 = gl_FragCoord.w;
    float _477 = _473 * _475;
    float _479 = in.m_68.x;
    float _481 = gl_FragCoord.w;
    float _483 = _479 * _481;
    float _485 = in.m_68.z;
    float _487 = gl_FragCoord.w;
    float _489 = _485 * _487;
    float _491 = in.m_68.y;
    float _493 = gl_FragCoord.w;
    float _495 = _491 * _493;
    float _497 = in.m_70.z;
    float _499 = gl_FragCoord.w;
    float _501 = _497 * _499;
    float _503 = in.m_70.x;
    float _505 = gl_FragCoord.w;
    float _507 = _503 * _505;
    float _509 = in.m_70.y;
    float _511 = gl_FragCoord.w;
    float _513 = _509 * _511;
    float _515 = in.m_72.x;
    float _517 = gl_FragCoord.w;
    float _519 = _515 * _517;
    float _521 = in.m_72.z;
    float _523 = gl_FragCoord.w;
    float _525 = _521 * _523;
    float _527 = in.m_72.w;
    float _529 = gl_FragCoord.w;
    float _531 = _527 * _529;
    float _533 = in.m_72.y;
    float _535 = gl_FragCoord.w;
    float _537 = _533 * _535;
    bool _539 = (*spvDescriptorSet0.fp_c15)._m0[653].w >= 0.5;
    float _541 = _115 * _465;
    float _543 = -(*spvDescriptorSet0.fp_c13)._m0[0].y;
    float _545 = _543 + 1.0;
    float _547 = _115 * _471;
    float _549 = _115 * _477;
    float _551 = _115 * _483;
    float _553 = fma(_541, (*spvDescriptorSet0.fp_c13)._m0[0].y, _545);
    float _555 = fma(_547, (*spvDescriptorSet0.fp_c13)._m0[0].y, _545);
    float _557 = fma(_549, (*spvDescriptorSet0.fp_c13)._m0[0].y, _545);
    float _559 = _115 * _501;
    float _561 = _115 * _507;
    float _563 = _379 * _555;
    float _565 = precise::clamp(_563, 0.0, 1.0);
    float _567 = _115 * _489;
    float _569 = _381 * _557;
    float _571 = precise::clamp(_569, 0.0, 1.0);
    float _573 = _115 * _513;
    float _575 = _567;
    if (_539)
    {
        float _577 = -(*spvDescriptorSet0.fp_c8)._m0[30].x;
        float _579 = _259 + _577;
        _333 = _579;
    }
    float _581 = _333;
    float _583 = _377 * _553;
    float _585 = precise::clamp(_583, 0.0, 1.0);
    float _587 = _115 * _519;
    float _589 = _115 * _537;
    float _591 = _115 * _525;
    float _593 = fma(_455, 0.20999999344348907470703125, _551);
    float _595 = _115 * _495;
    float _597 = fma(_459, 0.20999999344348907470703125, _567);
    if (_539)
    {
        float _599 = _581 * 8.0;
        float _601 = precise::clamp(_599, 0.0, 1.0);
        _575 = _601;
    }
    float _603 = _575;
    float _605 = _593 + _561;
    float _607 = fma(_457, 0.20999999344348907470703125, _595);
    float _609 = _597 + _559;
    float _611 = 0.0 + _289;
    float _613 = precise::clamp(_611, 0.0, 1.0);
    float _615 = _115 * _531;
    float _617 = _607 + _573;
    float _619 = _585 * _605;
    float _621 = _571 * _609;
    float _623 = _613;
    if (_539)
    {
        float _625 = _613 * _603;
        _623 = _625;
    }
    float _627 = _623;
    float _629 = _565 * _617;
    float _631 = fma(_619, _615, _587);
    float _633 = fma(_621, _615, _591);
    float _635 = 0.0 + _627;
    float _637 = precise::clamp(_635, 0.0, 1.0);
    float _639 = fma(_629, _615, _589);
    out.m_60.x = _631;
    out.m_60.y = _639;
    out.m_60.z = _633;
    out.m_60.w = _637;
    return out;
}

