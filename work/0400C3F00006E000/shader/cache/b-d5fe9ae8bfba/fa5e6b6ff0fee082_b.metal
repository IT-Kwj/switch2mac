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
    constant _16* vp_c9 [[id(0)]];
    constant _16* vp_c8 [[id(1)]];
    constant _16* vp_c10 [[id(2)]];
    constant _16* vp_c15 [[id(3)]];
    constant _16* vp_c13 [[id(4)]];
    constant _16* vp_c7 [[id(5)]];
    texture2d<float> vp_t_tcb_24 [[id(6)]];
    sampler vp_t_tcb_24Smplr [[id(7)]];
    texture3d<float> vp_t_tcb_32 [[id(8)]];
    sampler vp_t_tcb_32Smplr [[id(9)]];
    texture3d<float> vp_t_tcb_30 [[id(10)]];
    sampler vp_t_tcb_30Smplr [[id(11)]];
    texture2d<float> vp_t_tcb_1C [[id(12)]];
    sampler vp_t_tcb_1CSmplr [[id(13)]];
    sampler vp_t_tcb_24Smplr_w [[id(14)]];
    sampler vp_t_tcb_32Smplr_w [[id(15)]];
    sampler vp_t_tcb_30Smplr_w [[id(16)]];
    sampler vp_t_tcb_1CSmplr_w [[id(17)]];
    constant dm_border_t* dm_border [[id(18)]];
};

struct main0_out
{
    float4 m_57 [[user(locn0)]];
    float4 m_55 [[user(locn1)]];
    float4 m_49 [[user(locn2)]];
    float4 m_93 [[user(locn3)]];
    float4 m_67 [[user(locn4)]];
    float4 m_75 [[user(locn5)]];
    float4 m_83 [[user(locn6)]];
    float4 m_73 [[user(locn7)]];
    float4 m_85 [[user(locn8)]];
    float4 m_81 [[user(locn9)]];
    float4 m_77 [[user(locn10)]];
    float4 m_91 [[user(locn11)]];
    float4 m_87 [[user(locn12)]];
    float4 m_89 [[user(locn13)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_79 [[attribute(0)]];
    float4 m_61 [[attribute(1)]];
    float4 m_46 [[attribute(2)]];
    float4 m_51 [[attribute(3)]];
    float4 m_71 [[attribute(4)]];
    float4 m_59 [[attribute(5)]];
    float4 m_53 [[attribute(6)]];
    float4 m_63 [[attribute(7)]];
    float4 m_69 [[attribute(8)]];
    float4 m_65 [[attribute(9)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_57 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_55 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_49 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_93 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_67 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_75 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_83 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_73 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_85 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_81 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_77 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_91 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_87 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_89 = float4(0.0, 0.0, 0.0, 1.0);
    bool _2456 = false;
    bool _533 = false;
    bool _190 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _107 = in.m_46.w;
    float _109 = trunc(_107);
    int _112 = int(_109);
    bool _116 = _112 >= 1;
    float _118 = 0.0;
    if (!_116)
    {
        _118 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _120 = _118;
    float _122 = _120;
    if (!_116)
    {
        out.m_49.x = 0.0;
    }
    int _124 = 0;
    if (!_116)
    {
        float _126 = _120 * 5.0;
        _124 = as_type<int>(_126);
    }
    int _128 = _124;
    int _130 = _128;
    if (!_116)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2741 = as_type<float>(_128);
        out.gl_Position.z = _2741;
    }
    if (!_116)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _132 = in.m_51.w;
    bool _134 = _132 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _136 = isnan(_132);
    bool _138 = _134 || _136;
    bool _140 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _142 = _138 || _140;
    float _144 = -_132;
    float _146 = _144 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _148 = 0.0;
    float _150 = _146;
    if (_142)
    {
        float _152 = float(_112);
        _148 = _152;
    }
    float _154 = _148;
    bool _156 = _146 >= _154;
    bool _158 = !_142;
    bool _160 = _156 || _158;
    if (_160)
    {
        _122 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _162 = _122;
    if (_160)
    {
        out.m_49.x = 0.0;
    }
    if (_160)
    {
        float _164 = _162 * 5.0;
        _130 = as_type<int>(_164);
    }
    int _166 = _130;
    if (_160)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2810 = as_type<float>(_166);
        out.gl_Position.z = _2810;
    }
    if (_160)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    bool _168 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    bool _170 = !_168;
    float _188;
    if (!_170)
    {
        float _172 = in.m_53.x;
        float _174 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _176 = _172 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _178 = fma(_176, (*spvDescriptorSet0.vp_c9)._m0[12].x, _146);
        float _180 = _178 * _174;
        float _182 = floor(_180);
        float _184 = -_182;
        float _186 = _180 + _184;
        _188 = _186;
        _190 = true;
    }
    else
    {
        float _192 = float(_112);
        float _194 = 1.0 / _192;
        float _196 = _146 * _194;
        _188 = _196;
    }
    _190 = false;
    float _198 = _188;
    float _200 = in.m_53.x;
    float _202 = float(as_type<int>((*spvDescriptorSet0.vp_c9)._m0[8].x));
    float _204 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _206 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _204;
    float _208 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _210 = _208 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _212 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _214 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _212;
    float _216 = 1.0 / _206;
    float _218 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _220 = _218 + (*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _222 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _224 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _226 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _228 = 1.0 / _214;
    float _230 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _232 = _198 + _230;
    float _234 = (*spvDescriptorSet0.vp_c9)._m0[131].x * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _236 = _222 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _238 = _202 * _200;
    float _240 = _224 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _242 = _226 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _244 = 1.0 / _210;
    float _246 = _232 * _216;
    float _248 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _250 = _198 + _248;
    bool _252 = _198 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _254 = isnan(_198);
    bool _256 = _252 || _254;
    bool _258 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _260 = _256 || _258;
    float _262 = float(_260);
    out.m_55.x = _236;
    out.m_55.y = _240;
    out.m_55.z = _242;
    out.m_55.w = _234;
    float _264 = trunc(_238);
    int _266 = int(_264);
    float _268 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _270 = _198 + _268;
    bool _272 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[14].x;
    float _274 = _270 * _228;
    bool _276 = _198 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _278 = isnan(_198);
    bool _280 = _276 || _278;
    bool _282 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _284 = _280 || _282;
    float _286 = float(_284);
    float _288 = 1.0 / _220;
    float _290 = _250 * _244;
    bool _292 = _198 >= (*spvDescriptorSet0.vp_c9)._m0[147].w;
    bool _294 = isnan(_198);
    bool _296 = _292 || _294;
    bool _298 = isnan((*spvDescriptorSet0.vp_c9)._m0[147].w);
    bool _300 = _296 || _298;
    float _302 = float(_300);
    float _304 = -_286;
    float _306 = _304 + 1.0;
    float _308 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _310 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _308;
    bool _312 = _198 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _314 = isnan(_198);
    bool _316 = _312 || _314;
    bool _318 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _320 = _316 || _318;
    float _322 = float(_320);
    float _324 = -_302;
    float _326 = _324 + 1.0;
    int _328 = _266 << 4;
    int _330 = _328 + 1712;
    float _332 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _334 = _198 + _332;
    float _336 = _262 * _306;
    float _338 = _286 * _326;
    uint _341 = uint(int(uint(_330) >> uint(2)));
    uint _343 = uint(int(uint(int(_341)) >> uint(2)));
    int _345 = int(_341) & 3;
    float _347 = (*spvDescriptorSet0.vp_c9)._m0[int(_343)][_345];
    int _349 = int(_341) + 1;
    uint _351 = uint(int(uint(_349) >> uint(2)));
    int _353 = _349 & 3;
    float _355 = (*spvDescriptorSet0.vp_c9)._m0[int(_351)][_353];
    float _357 = -_262;
    float _359 = _357 + 1.0;
    float _361 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _363 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _361;
    float _365 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _367 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _365;
    float _369 = -_322;
    float _371 = _369 + 1.0;
    float _373 = _334 * _288;
    float _375 = _322 * _359;
    float _377 = fma(_363, _246, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    int _379 = _330 + 8;
    uint _381 = uint(int(uint(_379) >> uint(2)));
    uint _383 = uint(int(uint(int(_381)) >> uint(2)));
    int _385 = int(_381) & 3;
    float _387 = (*spvDescriptorSet0.vp_c9)._m0[int(_383)][_385];
    float _389 = fma(_367, _246, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _391 = fma(_310, _246, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _393 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _395 = _393 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _397 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _399 = _397 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _401 = fma(_395, _290, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    bool _403 = _198 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _405 = isnan(_198);
    bool _407 = _403 || _405;
    bool _409 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _411 = _407 || _409;
    float _413 = float(_411);
    float _415 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _417 = _415 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _419 = fma(_399, _290, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    float _421 = _413 * _371;
    float _423 = fma(_417, _290, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _425 = -_413;
    float _427 = _425 + 1.0;
    float _429 = _391 * _421;
    float _431 = _377 * _421;
    float _433 = _389 * _421;
    float _435 = -(*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _437 = (*spvDescriptorSet0.vp_c9)._m0[146].z + _435;
    float _439 = fma(_427, (*spvDescriptorSet0.vp_c9)._m0[143].z, _429);
    float _441 = fma(_437, _274, (*spvDescriptorSet0.vp_c9)._m0[145].z);
    float _443 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _445 = _347 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _447 = _355 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _449 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _451 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _449;
    float _453 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _455 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _453;
    float _457 = fma(_451, _274, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _459 = fma(_455, _274, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _461 = _387 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _463 = _445 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _465 = _447 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _467 = fma(_427, (*spvDescriptorSet0.vp_c9)._m0[143].x, _431);
    float _469 = _461 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _471 = fma(_427, (*spvDescriptorSet0.vp_c9)._m0[143].y, _433);
    float _473 = -(*spvDescriptorSet0.vp_c9)._m0[146].z;
    float _475 = _473 + (*spvDescriptorSet0.vp_c9)._m0[147].z;
    float _477 = fma(_423, _375, _467);
    float _479 = -(*spvDescriptorSet0.vp_c9)._m0[146].x;
    float _481 = _479 + (*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _483 = fma(_401, _375, _471);
    float _485 = fma(_419, _375, _439);
    float _487 = -(*spvDescriptorSet0.vp_c9)._m0[146].y;
    float _489 = _487 + (*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _491 = fma(_481, _373, (*spvDescriptorSet0.vp_c9)._m0[146].x);
    float _493 = fma(_457, _336, _477);
    float _495 = fma(_459, _336, _483);
    float _497 = fma(_489, _373, (*spvDescriptorSet0.vp_c9)._m0[146].y);
    float _499 = fma(_475, _373, (*spvDescriptorSet0.vp_c9)._m0[146].z);
    float _501 = fma(_441, _336, _485);
    out.m_57.x = _463;
    out.m_57.y = _465;
    out.m_57.z = _469;
    out.m_57.w = _443;
    float _503 = fma(_491, _338, _493);
    float _505 = fma(_499, _338, _501);
    float _507 = fma(_497, _338, _495);
    float _509 = fma(_302, (*spvDescriptorSet0.vp_c9)._m0[147].x, _503);
    float _511 = fma(_302, (*spvDescriptorSet0.vp_c9)._m0[147].z, _505);
    float _513 = fma(_302, (*spvDescriptorSet0.vp_c9)._m0[147].y, _507);
    bool _515 = !_272;
    float _531;
    if (!_515)
    {
        float _517 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[14].x;
        float _519 = _200 * (*spvDescriptorSet0.vp_c9)._m0[15].x;
        float _521 = fma(_519, (*spvDescriptorSet0.vp_c9)._m0[14].x, _146);
        float _523 = _521 * _517;
        float _525 = floor(_523);
        float _527 = -_525;
        float _529 = _523 + _527;
        _531 = _529;
        _533 = true;
    }
    else
    {
        float _535 = float(_112);
        float _537 = 1.0 / _535;
        float _539 = _146 * _537;
        _531 = _539;
    }
    _533 = false;
    float _541 = _531;
    float _543 = _200 * 2.0;
    float _545 = in.m_53.z;
    float _547 = floor(_543);
    int _549 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _551 = _549 != 0;
    float _553 = in.m_53.y;
    float _555 = -(*spvDescriptorSet0.vp_c9)._m0[159].w;
    float _557 = _555 + (*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _559 = in.m_59.x;
    int _561 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _563 = _561 != 0;
    int _565 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _567 = _565 != 0;
    int _569 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _571 = _569 != 0;
    float _573 = 1.0 / _557;
    float _575 = -(*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _577 = _575 + (*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _579 = -(*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _581 = _579 + (*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _583 = 1.0 / _577;
    float _585 = -(*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _587 = _585 + (*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _589 = -(*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _591 = _589 + (*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _593 = 1.0 / _581;
    float _595 = -(*spvDescriptorSet0.vp_c9)._m0[165].x;
    float _597 = (*spvDescriptorSet0.vp_c9)._m0[166].x + _595;
    bool _599 = _547 > 0.0;
    float _601 = -(*spvDescriptorSet0.vp_c9)._m0[163].x;
    float _603 = (*spvDescriptorSet0.vp_c9)._m0[164].x + _601;
    bool _605 = _547 >= 0.0;
    bool _607 = isnan(_547);
    bool _609 = _605 || _607;
    bool _611 = isnan(0.0);
    bool _613 = _609 || _611;
    float _615 = -(*spvDescriptorSet0.vp_c9)._m0[164].x;
    float _617 = _615 + (*spvDescriptorSet0.vp_c9)._m0[165].x;
    float _619 = 1.0 / _587;
    float _621 = -(*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _623 = _621 + (*spvDescriptorSet0.vp_c9)._m0[166].w;
    float _625 = _545 * 2.0;
    bool _627 = _541 >= (*spvDescriptorSet0.vp_c9)._m0[163].w;
    bool _629 = isnan(_541);
    bool _631 = _627 || _629;
    bool _633 = isnan((*spvDescriptorSet0.vp_c9)._m0[163].w);
    bool _635 = _631 || _633;
    float _637 = float(_635);
    int _639 = _613 ? 0 : 1;
    bool _641 = _541 >= (*spvDescriptorSet0.vp_c9)._m0[161].w;
    bool _643 = isnan(_541);
    bool _645 = _641 || _643;
    bool _647 = isnan((*spvDescriptorSet0.vp_c9)._m0[161].w);
    bool _649 = _645 || _647;
    float _651 = float(_649);
    float _653 = 1.0 / _623;
    float _655 = -(*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _657 = _655 + (*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _659 = -(*spvDescriptorSet0.vp_c9)._m0[159].x;
    float _661 = (*spvDescriptorSet0.vp_c9)._m0[160].x + _659;
    float _663 = _603 * _593;
    bool _665 = _541 >= (*spvDescriptorSet0.vp_c9)._m0[164].w;
    bool _667 = isnan(_541);
    bool _669 = _665 || _667;
    bool _671 = isnan((*spvDescriptorSet0.vp_c9)._m0[164].w);
    bool _673 = _669 || _671;
    float _675 = float(_673);
    float _677 = -_637;
    float _679 = _677 + 1.0;
    float _681 = 1.0 / _591;
    float _683 = 1.0 / _657;
    float _685 = _597 * _653;
    float _687 = _553 * 2.0;
    float _689 = _661 * _573;
    float _691 = -(*spvDescriptorSet0.vp_c9)._m0[160].x;
    float _693 = _691 + (*spvDescriptorSet0.vp_c9)._m0[161].x;
    float _695 = -(*spvDescriptorSet0.vp_c9)._m0[161].x;
    float _697 = (*spvDescriptorSet0.vp_c9)._m0[162].x + _695;
    float _699 = -(*spvDescriptorSet0.vp_c9)._m0[162].x;
    float _701 = _699 + (*spvDescriptorSet0.vp_c9)._m0[163].x;
    float _703 = floor(_625);
    float _705 = _697 * _619;
    float _707 = _693 * _583;
    float _709 = _701 * _681;
    float _711 = _200 + _553;
    float _713 = _553 + _545;
    bool _715 = _541 >= (*spvDescriptorSet0.vp_c9)._m0[166].w;
    bool _717 = isnan(_541);
    bool _719 = _715 || _717;
    bool _721 = isnan((*spvDescriptorSet0.vp_c9)._m0[166].w);
    bool _723 = _719 || _721;
    float _725 = float(_723);
    float _727 = floor(_687);
    float _729 = _711 + (-1.0);
    float _731 = _713 + (-1.0);
    float _733 = _617 * _683;
    bool _735 = _541 >= (*spvDescriptorSet0.vp_c9)._m0[165].w;
    bool _737 = isnan(_541);
    bool _739 = _735 || _737;
    bool _741 = isnan((*spvDescriptorSet0.vp_c9)._m0[165].w);
    bool _743 = _739 || _741;
    float _745 = float(_743);
    float _747 = -_725;
    float _749 = _747 + 1.0;
    float _751 = fma(_731, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _753 = fma(_729, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _755 = -(*spvDescriptorSet0.vp_c9)._m0[159].w;
    float _757 = _541 + _755;
    float _759 = _657;
    float _761 = _731;
    float _763 = _553;
    if (_551)
    {
        _759 = _200;
    }
    float _765 = _759;
    float _767 = _745 * _749;
    float _769 = _765;
    if (_551)
    {
        _761 = _553;
    }
    float _771 = _761;
    float _773 = -_745;
    float _775 = _773 + 1.0;
    float _777 = _771;
    if (!_551)
    {
        _769 = _545;
    }
    float _779 = _769;
    if (!_551)
    {
        _777 = _200;
    }
    float _781 = _777;
    float _783 = _675 * _775;
    bool _785 = !_567;
    int _787 = _785 ? 0 : 1;
    float _789 = -_675;
    float _791 = _789 + 1.0;
    bool _793 = _703 > 0.0;
    float _795 = _781 * (*spvDescriptorSet0.vp_c9)._m0[87].y;
    bool _797 = _703 >= 0.0;
    bool _799 = isnan(_703);
    bool _801 = _797 || _799;
    bool _803 = isnan(0.0);
    bool _805 = _801 || _803;
    float _807 = fma(_689, _757, (*spvDescriptorSet0.vp_c9)._m0[159].x);
    bool _809 = _727 > 0.0;
    float _811 = -(*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _813 = _541 + _811;
    bool _815 = _727 >= 0.0;
    bool _817 = isnan(_727);
    bool _819 = _815 || _817;
    bool _821 = isnan(0.0);
    bool _823 = _819 || _821;
    float _825 = -(*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _827 = _541 + _825;
    bool _829 = _541 >= (*spvDescriptorSet0.vp_c9)._m0[162].w;
    bool _831 = isnan(_541);
    bool _833 = _829 || _831;
    bool _835 = isnan((*spvDescriptorSet0.vp_c9)._m0[162].w);
    bool _837 = _833 || _835;
    float _839 = float(_837);
    float _841 = fma(_705, _813, (*spvDescriptorSet0.vp_c9)._m0[161].x);
    float _843 = _637 * _791;
    bool _845 = _541 >= (*spvDescriptorSet0.vp_c9)._m0[160].w;
    bool _847 = isnan(_541);
    bool _849 = _845 || _847;
    bool _851 = isnan((*spvDescriptorSet0.vp_c9)._m0[160].w);
    bool _853 = _849 || _851;
    float _855 = float(_853);
    float _857 = fma(_707, _827, (*spvDescriptorSet0.vp_c9)._m0[160].x);
    float _859 = -_839;
    float _861 = _859 + 1.0;
    float _863 = _839 * _679;
    float _865 = -(*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _867 = _541 + _865;
    float _869 = -(*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _871 = _541 + _869;
    float _873 = _651 * _861;
    float _875 = -_651;
    float _877 = _875 + 1.0;
    float _879 = fma(_663, _867, (*spvDescriptorSet0.vp_c9)._m0[163].x);
    bool _881 = _541 >= (*spvDescriptorSet0.vp_c9)._m0[159].w;
    bool _883 = isnan(_541);
    bool _885 = _881 || _883;
    bool _887 = isnan((*spvDescriptorSet0.vp_c9)._m0[159].w);
    bool _889 = _885 || _887;
    float _891 = float(_889);
    float _893 = -_855;
    float _895 = _893 + 1.0;
    float _897 = _855 * _877;
    float _899 = fma(_709, _871, (*spvDescriptorSet0.vp_c9)._m0[162].x);
    float _901 = _891 * _895;
    float _903 = -(*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _905 = _541 + _903;
    float _907 = -(*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _909 = _541 + _907;
    float _911 = -_891;
    float _913 = _911 + 1.0;
    float _915 = _807 * _901;
    float _917 = _779 * (*spvDescriptorSet0.vp_c9)._m0[87].x;
    float _919 = (*spvDescriptorSet0.vp_c9)._m0[87].x + (*spvDescriptorSet0.vp_c9)._m0[86].z;
    float _921 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _923 = log2(_921);
    float _925 = (*spvDescriptorSet0.vp_c9)._m0[87].y + (*spvDescriptorSet0.vp_c9)._m0[86].w;
    int _927 = ~_639;
    int _929 = _927 + 1;
    int _931 = _929 + 1;
    float _933 = fma(_913, (*spvDescriptorSet0.vp_c9)._m0[159].x, _915);
    int _935 = _931;
    if (!_599)
    {
        int _937 = ~_639;
        int _939 = _937 + 1;
        _935 = _939;
    }
    int _941 = _935;
    float _943 = fma(_795, -2.0, _925);
    int _945 = abs(_787);
    float _947 = fma(_685, _909, (*spvDescriptorSet0.vp_c9)._m0[165].x);
    int _949 = _805 ? 0 : 1;
    float _951 = -_919;
    float _953 = fma(_917, 2.0, _951);
    float _955 = float(_945);
    float _957 = fma(_857, _897, _933);
    float _959 = float(_941);
    float _961 = fma(_733, _905, (*spvDescriptorSet0.vp_c9)._m0[164].x);
    int _963 = ~_949;
    int _965 = _963 + 1;
    int _967 = _965 + 1;
    float _969 = fma(_841, _873, _957);
    int _971 = _967;
    if (!_793)
    {
        int _973 = ~_949;
        int _975 = _973 + 1;
        _971 = _975;
    }
    int _977 = _971;
    float _979 = _923 * _146;
    float _981 = _955 * _959;
    float _983 = in.m_61.x;
    float _985 = in.m_61.y;
    float _987 = in.m_61.z;
    int _989 = _823 ? 0 : 1;
    float _991 = _981 * (-2.0);
    float _993 = exp2(_979);
    float _995 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _997 = 1.0 + _995;
    int _999 = ~_989;
    int _1001 = _999 + 1;
    int _1003 = _1001 + 1;
    float _1005 = in.m_59.z;
    int _1007 = _1003;
    if (!_809)
    {
        int _1009 = ~_989;
        int _1011 = _1009 + 1;
        _1007 = _1011;
    }
    int _1013 = _1007;
    float _1015 = (*spvDescriptorSet0.vp_c9)._m0[88].z + (*spvDescriptorSet0.vp_c9)._m0[88].x;
    float _1017 = 1.0 / _997;
    bool _1019 = !_563;
    int _1021 = _1019 ? 0 : 1;
    float _1023 = fma(_200, (*spvDescriptorSet0.vp_c9)._m0[88].z, _1015);
    bool _1025 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1027 = isnan(1.0);
    bool _1029 = _1025 || _1027;
    bool _1031 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1033 = _1029 || _1031;
    float _1035 = (*spvDescriptorSet0.vp_c9)._m0[88].w + (*spvDescriptorSet0.vp_c9)._m0[88].y;
    int _1037 = abs(_1021);
    float _1039 = _553 + (-0.5);
    bool _1041 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1043 = isnan(0.0);
    bool _1045 = _1041 || _1043;
    bool _1047 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1049 = _1045 || _1047;
    float _1051 = fma(_553, (*spvDescriptorSet0.vp_c9)._m0[88].w, _1035);
    float _1053 = -_993;
    float _1055 = _1053 + 1.0;
    float _1057 = fma(_146, (*spvDescriptorSet0.vp_c9)._m0[87].z, _1023);
    float _1059 = float(_1037);
    float _1061 = -_146;
    float _1063 = fma(_1061, (*spvDescriptorSet0.vp_c9)._m0[86].x, _953);
    float _1065 = float(_977);
    float _1067 = fma(_991, _985, _985);
    bool _1069 = !_571;
    int _1071 = _1069 ? 0 : 1;
    float _1073 = fma(_899, _863, _969);
    float _1075 = _1049 ? _1055 : 0.0;
    float _1077 = _1059 * _1065;
    float _1079 = fma(_146, (*spvDescriptorSet0.vp_c9)._m0[87].w, _1051);
    int _1081 = abs(_1071);
    float _1083 = fma(_146, (*spvDescriptorSet0.vp_c9)._m0[86].y, _943);
    float _1085 = _200 + _545;
    if (_1033)
    {
        float _1087 = _1075 * _1017;
        _150 = _1087;
    }
    float _1089 = _150;
    float _1091 = fma(_751, _991, _751);
    float _1093 = fma(_1039, (*spvDescriptorSet0.vp_c9)._m0[196].y, _1067);
    float _1095 = fma(_879, _843, _1073);
    float _1097 = _1077 * (-2.0);
    float _1099 = _1085 + (-1.0);
    float _1101 = fma(_1091, _1089, _1093);
    float _1103 = float(_1013);
    float _1105 = _200 + (-0.5);
    float _1107 = fma(_1097, _983, _983);
    float _1109 = fma(_961, _783, _1095);
    float _1111 = fma(_1099, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _1113 = fma(_753, _1097, _753);
    float _1115 = fma(_1105, (*spvDescriptorSet0.vp_c9)._m0[196].x, _1107);
    float _1117 = float(_1081);
    float _1119 = fma(_947, _767, _1109);
    float _1121 = _200 + _1005;
    float _1123 = fma(_1113, _1089, _1115);
    float _1125 = (*spvDescriptorSet0.vp_c9)._m0[191].x * (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _1127 = fma(_725, (*spvDescriptorSet0.vp_c9)._m0[166].x, _1119);
    float _1129 = _1117 * _1103;
    float _1131 = in.m_63.x;
    float _1133 = in.m_63.y;
    float _1135 = in.m_63.z;
    float _1137 = _1101 * 0.15915493667125701904296875;
    float _1139 = fma(_1127, _1125, _1121);
    float _1141 = _1129 * (-2.0);
    float _1143 = in.m_59.y;
    float _1145 = _1123 * 0.15915493667125701904296875;
    float _1147 = _1139 * (*spvDescriptorSet0.vp_c9)._m0[191].y;
    float _1149 = fma(_1141, _987, _987);
    float _1151 = _545 + (-0.5);
    float _1153 = fma(_1111, _1141, _1111);
    float _1155 = _1147 * 0.15915493667125701904296875;
    float _1157 = _1137 * 6.283185482025146484375;
    float _1159 = sin(_1157);
    float _1161 = fma(_1151, (*spvDescriptorSet0.vp_c9)._m0[196].z, _1149);
    float _1163 = in.m_46.x;
    float _1165 = in.m_46.y;
    float _1167 = in.m_46.z;
    float _1169 = fma(_1153, _1089, _1161);
    float _1171 = _1155 * 6.283185482025146484375;
    float _1173 = sin(_1171);
    float _1175 = _1169 * 0.15915493667125701904296875;
    bool _1177 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _1179 = isnan(0.5);
    bool _1181 = _1177 || _1179;
    bool _1183 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1185 = _1181 || _1183;
    float _1187 = _511 * _1135;
    float _1189 = _509 * _1131;
    float _1191 = fma(_553, (*spvDescriptorSet0.vp_c9)._m0[191].z, 0.20000000298023223876953125);
    float _1193 = _1137 * 6.283185482025146484375;
    float _1195 = cos(_1193);
    float _1197 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _559);
    float _1199 = _1189 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1201 = _513 * _1133;
    float _1203 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _1005);
    float _1205 = _1187 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _1207 = _1197 * _1199;
    float _1209 = _1201 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1211 = _1145 * 6.283185482025146484375;
    float _1213 = sin(_1211);
    float _1215 = fma(_1173, _1191, _1143);
    float _1217 = _1203 * _1205;
    float _1219 = _1165 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _1221 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _1215);
    float _1223 = fma(_1163, (*spvDescriptorSet0.vp_c10)._m0[6].x, _1219);
    float _1225 = _1145 * 6.283185482025146484375;
    float _1227 = cos(_1225);
    float _1229 = _1221 * _1209;
    float _1231 = fma(_1167, (*spvDescriptorSet0.vp_c10)._m0[6].z, _1223);
    float _1233 = _1175 * 6.283185482025146484375;
    float _1235 = cos(_1233);
    float _1237 = _1213 * _1195;
    float _1239 = _1213 * _1159;
    float _1241 = _1175 * 6.283185482025146484375;
    float _1243 = sin(_1241);
    float _1245 = _1227 * _1159;
    float _1247 = _1227 * _1195;
    float _1249 = _1227 * _1235;
    float _1251 = _1195 * _1235;
    float _1253 = _1213 * _1235;
    float _1255 = _1159 * _1235;
    float _1257 = _1253 * _1229;
    float _1259 = -_1245;
    float _1261 = fma(_1243, _1237, _1259);
    float _1263 = -_1237;
    float _1265 = fma(_1243, _1245, _1263);
    float _1267 = fma(_1243, _1247, _1239);
    float _1269 = _1249 * _1229;
    float _1271 = fma(_1243, _1239, _1247);
    float _1273 = -_1229;
    float _1275 = _1243 * _1273;
    float _1277 = fma(_1261, _1207, _1257);
    float _1279 = fma(_1267, _1207, _1269);
    float _1281 = _1165 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _1283 = fma(_1251, _1207, _1275);
    float _1285 = fma(_1271, _1217, _1277);
    float _1287 = fma(_1265, _1217, _1279);
    float _1289 = fma(_1163, (*spvDescriptorSet0.vp_c10)._m0[4].x, _1281);
    float _1291 = fma(_1255, _1217, _1283);
    float _1293 = _1231 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _1295 = _1287 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _1297 = _1287 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _1299 = fma(_1167, (*spvDescriptorSet0.vp_c10)._m0[4].z, _1289);
    float _1301 = _1165 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _1303 = fma(_1291, (*spvDescriptorSet0.vp_c10)._m0[10].x, _1295);
    float _1305 = fma(_1291, (*spvDescriptorSet0.vp_c10)._m0[8].x, _1297);
    float _1307 = _1299 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _1309 = fma(_1163, (*spvDescriptorSet0.vp_c10)._m0[5].x, _1301);
    float _1311 = fma(_1285, (*spvDescriptorSet0.vp_c10)._m0[10].z, _1303);
    float _1313 = fma(_1285, (*spvDescriptorSet0.vp_c10)._m0[8].z, _1305);
    float _1315 = _1287 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _1317 = fma(_1167, (*spvDescriptorSet0.vp_c10)._m0[5].z, _1309);
    float _1319 = _1293 + _1311;
    float _1321 = _1307 + _1313;
    float _1323 = fma(_1291, (*spvDescriptorSet0.vp_c10)._m0[9].x, _1315);
    float _1325 = _1317 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _1327 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1329 = _1319 + _1327;
    float _1331 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1333 = _1321 + _1331;
    float _1335 = fma(_1285, (*spvDescriptorSet0.vp_c10)._m0[9].z, _1323);
    float _1337 = _1329 * _1329;
    float _1339 = _1325 + _1335;
    float _1341 = fma(_1333, _1333, _1337);
    float _1343 = sqrt(_1341);
    bool _1345 = _1343 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1347 = _1161;
    float _1349 = _1321;
    float _1351 = _1319;
    float _1353 = _1291;
    float _1355 = _1339;
    if (!_1345)
    {
        _1347 = _1339;
    }
    float _1357 = _1347;
    bool _1359 = !_1345;
    float _1361 = _1357;
    if (!_1359)
    {
        float _1363 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1365 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1367 = _1343 + _1365;
        float _1369 = _1339 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1371 = _1367 * _1363;
        float _1373 = rsqrt(_1341);
        float _1375 = _1371 * 0.15915493667125701904296875;
        float _1377 = _1375 * 6.283185482025146484375;
        float _1379 = cos(_1377);
        float _1381 = _1375 * 6.283185482025146484375;
        float _1383 = sin(_1381);
        float _1385 = _1379 + (-1.0);
        float _1387 = _1385 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1389 = fma(_1383, _1369, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1391 = fma(_1339, _1379, _1387);
        float _1393 = _1373 * _1389;
        float _1395 = fma(_1333, _1393, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1397 = fma(_1329, _1393, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1349 = _1395;
        _1351 = _1397;
        _1361 = _1391;
        _1353 = _1375;
    }
    float _1399 = _1349;
    float _1401 = _1351;
    float _1403 = _1361;
    float _1405 = _1353;
    float _1407 = _1403;
    float _1409 = _1399;
    float _1411 = _1401;
    float _1413 = _1405;
    if (!_1185)
    {
        float _1415 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _1417 = _1325 + _1415;
        float _1419 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _1421 = _1307 + _1419;
        float _1423 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1425 = -_1307;
        float _1427 = _1425 + _1399;
        float _1429 = _1417 * _1417;
        float _1431 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _1433 = _1293 + _1431;
        float _1435 = -_1293;
        float _1437 = _1435 + _1401;
        float _1439 = fma(_1421, _1421, _1429);
        float _1441 = fma(_1433, _1433, _1439);
        float _1443 = sqrt(_1441);
        float _1445 = precise::min(_1443, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1447 = _1445 * _1423;
        float _1449 = -_1325;
        float _1451 = _1449 + _1403;
        float _1453 = fma(_1427, _1447, _1307);
        float _1455 = fma(_1451, _1447, _1325);
        float _1457 = fma(_1437, _1447, _1293);
        _1407 = _1455;
        _1409 = _1453;
        _1411 = _1457;
        _1413 = _1451;
    }
    float _1459 = _1407;
    float _1461 = _1409;
    float _1463 = _1411;
    float _1465 = _1413;
    float _1467 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1469 = _1459 + _1467;
    float _1471 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1473 = _1461 + _1471;
    float _1475 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1477 = _1463 + _1475;
    float _1479 = _1459 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1481 = _1469 * _1469;
    float _1483 = fma(_1461, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1479);
    float _1485 = fma(_1473, _1473, _1481);
    float _1487 = fma(_1477, _1477, _1485);
    float _1489 = rsqrt(_1487);
    float _1491 = sqrt(_1487);
    float _1493 = _1489 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1495 = _1473 * _1493;
    float _1497 = _1477 * _1493;
    float _1499 = _1495 * _1495;
    float _1501 = _1497 * _1497;
    float _1503 = _1499 + _1501;
    float _1505 = sqrt(_1503);
    bool _1507 = _1505 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1509 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1511 = _1505 + _1509;
    float _1513 = _1489;
    float _1515 = _1465;
    float _1517 = _1511;
    float _1519 = _1469;
    if (_1507)
    {
        float _1521 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1513 = _1521;
    }
    float _1523 = _1513;
    if (_1507)
    {
        float _1525 = rsqrt(_1503);
        _1515 = _1525;
    }
    float _1527 = _1515;
    if (_1507)
    {
        float _1529 = _1511 * _1523;
        _1517 = _1529;
    }
    float _1531 = _1517;
    float _1533 = _1459 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    if (_1507)
    {
        float _1535 = _1531 * 0.15915493667125701904296875;
        _1355 = _1535;
    }
    float _1537 = _1355;
    float _1539 = fma(_1461, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1533);
    float _1541 = _1477;
    float _1543 = _1537;
    if (_1507)
    {
        float _1545 = _1537 * 6.283185482025146484375;
        float _1547 = sin(_1545);
        _1541 = _1547;
    }
    float _1549 = _1541;
    float _1551 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1553 = fma(_1463, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1539);
    float _1555 = precise::max(0.0, _1551);
    float _1557 = _1523;
    float _1559 = _1555;
    if (_1507)
    {
        float _1561 = _1537 * 6.283185482025146484375;
        float _1563 = cos(_1561);
        _1557 = _1563;
    }
    float _1565 = _1557;
    float _1567 = _1553 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1569 = -_1493;
    float _1571 = -_1555;
    float _1573 = fma(_1469, _1569, _1571);
    float _1575 = _1573;
    if (_1507)
    {
        float _1577 = _1573 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1519 = _1577;
    }
    float _1579 = _1519;
    float _1581 = _1579;
    if (!_1507)
    {
        _1543 = _1499;
    }
    float _1583 = _1543;
    float _1585 = _1549;
    float _1587 = _1583;
    if (_1507)
    {
        float _1589 = fma(_1549, _1579, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1581 = _1589;
    }
    float _1591 = _1581;
    float _1593 = _1591;
    if (!_1507)
    {
        _1585 = _1495;
    }
    float _1595 = _1585;
    float _1597 = _1595;
    float _1599 = _1565;
    if (_1507)
    {
        float _1601 = _1565 + (-1.0);
        _1559 = _1601;
    }
    float _1603 = _1559;
    float _1605 = _1603;
    if (_1507)
    {
        float _1607 = _1527 * _1591;
        _1593 = _1607;
    }
    float _1609 = _1593;
    if (_1507)
    {
        float _1611 = _1603 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1605 = _1611;
    }
    float _1613 = _1605;
    float _1615 = _1613;
    if (_1507)
    {
        float _1617 = _1495 * _1609;
        _1597 = _1617;
    }
    float _1619 = _1597;
    float _1621 = _1459 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1623 = fma(_1307, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    if (_1507)
    {
        float _1625 = fma(_1573, _1565, _1613);
        _1575 = _1625;
    }
    float _1627 = _1575;
    if (!_1507)
    {
        _1599 = _1497;
    }
    float _1629 = _1599;
    float _1631 = _1629;
    if (_1507)
    {
        float _1633 = _1497 * _1609;
        _1631 = _1633;
    }
    float _1635 = _1631;
    if (_1507)
    {
        float _1637 = _1619 * _1619;
        _1587 = _1637;
    }
    float _1639 = _1587;
    if (!_1507)
    {
        _1615 = _1501;
    }
    float _1641 = _1615;
    float _1643 = fma(_1461, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1621);
    float _1645 = _1641;
    if (_1507)
    {
        float _1647 = _1635 * _1635;
        _1645 = _1647;
    }
    float _1649 = _1645;
    float _1651 = fma(_1627, _1627, _1639);
    float _1653 = fma(_1463, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1643);
    float _1655 = floor(_1623);
    float _1657 = _1651 + _1649;
    float _1659 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1661 = fma(_1491, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1659);
    float _1663 = precise::clamp(_1661, 0.0, 1.0);
    float _1665 = _1653 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1667 = -_1663;
    float _1669 = _1667 + 1.0;
    float _1671 = rsqrt(_1657);
    float _1673 = _1665 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1675 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _1677 = fma(_1293, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _1679 = -_1673;
    float _1681 = fma(_1679, _1675, 1.0);
    float _1683 = abs(_1669);
    float _1685 = log2(_1683);
    float _1687 = _1459 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1689 = -_1655;
    float _1691 = _1623 + _1689;
    float _1693 = _1567 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1695 = fma(_1461, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1687);
    float _1697 = _1671 * _1619;
    float _1699 = _1671 * _1627;
    float _1701 = _1671 * _1635;
    float _1703 = fma(_1463, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1695);
    float _1705 = _1697 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1707 = floor(_1677);
    float _1709 = _1699 + 1.0;
    float _1711 = _1703 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1713 = -_1705;
    float _1715 = fma(_1699, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1713);
    float _1717 = _1567 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1719 = _1685 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1721 = fma(_1711, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1693);
    float _1723 = -_1701;
    float _1725 = fma(_1723, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1715);
    float _1727 = fma(_1463, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1483);
    float _1729 = fma(_1711, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1717);
    float _1731 = exp2(_1719);
    float _1733 = fma(_1725, -0.5, 0.5);
    float _1735 = _1727 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1737 = fma(_1665, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1729);
    float _1739 = fma(_1725, 0.5, 0.5);
    float _1741 = _1567 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1743 = -_1707;
    float _1745 = _1677 + _1743;
    float _1747 = fma(_1735, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1737);
    float _1749 = log2(_1681);
    float _1751 = fma(_1711, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1741);
    float _1753 = fma(_1739, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1755 = fma(_1665, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1721);
    float _1757 = fma(_1665, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1751);
    float _1759 = fma(_1739, _1753, -0.212114393711090087890625);
    float _1761 = fma(_1735, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1755);
    float _1763 = 1.0 / _1747;
    float _1765 = fma(_1735, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1757);
    float _1767 = -_1699;
    float _1769 = fma(_1731, _1709, _1767);
    float _1771 = fma(_1739, _1759, 1.570728778839111328125);
    float _1773 = sqrt(_1733);
    float _1775 = _1749 * 0.693147182464599609375;
    float2 _5397 = float2(_1691, _1745);
    float _1777 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_5397, float2(0.0), isnan(_5397)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_5397, float2(0.0), isnan(_5397)), level(0.0)).x;
    float _1779 = _1775 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1781 = _1761 * _1763;
    float _1783 = _1765 * _1763;
    float _1785 = fma(_1769, 0.5, 0.5);
    float _1787 = fma(_1781, 0.5, 0.5);
    float _1789 = fma(_1783, -0.5, 0.5);
    float _1791 = _1773 * 0.636619746685028076171875;
    float3 _5427 = float3(_1787, _1789, _1779);
    float _1793 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_5427, float3(0.0), isnan(_5427)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_5427, float3(0.0), isnan(_5427)), level(0.0)).x;
    float _1795 = -_1771;
    float _1797 = fma(_1791, _1795, 1.0);
    float3 _5443 = float3(_1787, _1789, _1779);
    float4 _1800 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_5443, float3(0.0), isnan(_5443)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_5443, float3(0.0), isnan(_5443)), level(0.0)).xyzw;
    float _1802 = _1800.x;
    float _1804 = _1800.y;
    float _1806 = _1800.z;
    float _1808 = _1800.w;
    float2 _5459 = float2(_1797, _1785);
    float3 _1812 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_5459, float2(0.0), isnan(_5459)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_5459, float2(0.0), isnan(_5459)), level(0.0)).xyz;
    float _1814 = _1812.x;
    float _1816 = _1812.y;
    float _1818 = _1812.z;
    float _1820 = _1325 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    bool _1822 = _553 > 0.5;
    float _1824 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].w;
    float _1826 = fma(_1307, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1820);
    float _1828 = _1325 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    bool _1830 = _545 > 0.5;
    float _1832 = in.m_53.w;
    float _1834 = fma(_1293, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1826);
    float _1836 = fma(_1307, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1828);
    float _1838 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].z;
    float _1840 = _1834 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1842 = fma(_1293, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1836);
    float _1844 = in.m_65.x;
    int _1846 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1848 = _1846 != 0;
    float _1850 = _1842 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1852 = in.m_65.y;
    float _1854 = 1.0 / _1840;
    int _1856 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32;
    bool _1858 = _1856 != 0;
    float _1860 = _1850 + _1840;
    int _1862 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1864 = _1862 != 0;
    int _1866 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _1868 = _1866 != 0;
    bool _1870 = _1832 > 0.5;
    float _1872 = _1860 * _1854;
    float _1874 = _1872 * 0.5;
    int _1876 = 0;
    int _1878 = as_type<int>(_1824);
    float _1880 = _1747;
    if (_1868)
    {
        float _1882 = -_1844;
        float _1884 = _1882 + 1.0;
        _1876 = as_type<int>(_1884);
    }
    int _1886 = _1876;
    float _1888 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1890 = fma(_1874, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1888);
    float _1892 = -_1852;
    float _1894 = _1892 + 1.0;
    float _1896 = 1.0 / _1890;
    float _1898 = _1852;
    if (!_1864)
    {
        _763 = _1844;
    }
    float _1900 = _763;
    int _1902 = _1870 ? as_type<int>(_1894) : as_type<int>(_1852);
    out.m_67.x = 1.0;
    out.m_67.y = 1.0;
    out.m_67.z = 1.0;
    int _1904 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16;
    bool _1906 = _1904 != 0;
    float _1908 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1910 = _1896 * _1908;
    int _1912 = _1822 ? as_type<int>(_1894) : as_type<int>(_1852);
    int _1914 = 0;
    float _1916 = _1900;
    if (_1906)
    {
        float _1918 = -_1844;
        float _1920 = _1918 + 1.0;
        _1914 = as_type<int>(_1920);
    }
    int _1922 = _1914;
    float _1924 = abs(_1910);
    float _1926 = log2(_1924);
    bool _1928 = _1910 <= 8000.0;
    bool _1930 = isnan(_1910);
    bool _1932 = _1928 || _1930;
    bool _1934 = isnan(8000.0);
    bool _1936 = _1932 || _1934;
    float _1938 = float(_1936);
    float _1940 = _1926 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _1942 = _1848 ? as_type<float>(_1912) : _1852;
    float _1944 = in.m_69.x;
    float _1946 = in.m_69.y;
    float _1948 = in.m_69.z;
    float _1950 = in.m_69.w;
    int _1952 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _1954 = _1952 != 0;
    float _1956 = _1838 * (*spvDescriptorSet0.vp_c9)._m0[90].x;
    float _1958 = exp2(_1940);
    float _1960 = _1954 ? as_type<float>(_1902) : _1852;
    bool _1962 = _1954;
    if (_1858)
    {
        float _1964 = _1830 ? _1894 : _1852;
        _1898 = _1964;
    }
    float _1966 = _1898;
    float _1968 = _1824 * (*spvDescriptorSet0.vp_c9)._m0[90].y;
    float _1970 = _1966;
    if (_1864)
    {
        float _1972 = -_1844;
        float _1974 = _1972 + 1.0;
        _1878 = as_type<int>(_1974);
    }
    int _1976 = _1878;
    float _1978 = as_type<float>(_1976);
    if (_1864)
    {
        bool _1980 = _200 > 0.5;
        _1962 = _1980;
    }
    bool _1982 = _1962;
    float _1984 = fma(_1968, _1966, -0.5);
    if (!_1868)
    {
        _1970 = _1844;
    }
    float _1986 = _1970;
    float _1988 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _1990 = _1986;
    if (_1864)
    {
        float _1992 = _1982 ? as_type<float>(_1976) : _1844;
        _1916 = _1992;
    }
    float _1994 = _1916;
    if (!_1906)
    {
        _1978 = _1844;
    }
    float _1996 = _1978;
    float _1998 = _1996;
    if (_1868)
    {
        float _2000 = _1830 ? as_type<float>(_1886) : _1844;
        _1990 = _2000;
    }
    float _2002 = _1990;
    float _2004 = _1942 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    if (_1906)
    {
        float _2006 = _1822 ? as_type<float>(_1922) : _1844;
        _1998 = _2006;
    }
    float _2008 = _1998;
    float _2010 = -_1083;
    float _2012 = fma(_1079, _1984, _2010);
    float _2014 = fma(_1958, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _2016 = precise::clamp(_2014, 0.0, 1.0);
    float _2018 = _1249 * _1946;
    float _2020 = fma(_1956, _2008, -0.5);
    float _2022 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _2024 = fma(_2016, -2.0, 3.0);
    float _2026 = _2016 * _2016;
    float _2028 = -_1946;
    float _2030 = _1243 * _2028;
    float _2032 = fma(_1267, _1944, _2018);
    float _2034 = fma(_1057, _2020, _1063);
    float _2036 = _2026 * _2024;
    float _2038 = fma(_1251, _1944, _2030);
    float _2040 = fma(_1265, _1948, _2032);
    float _2042 = in.m_71.x;
    float _2044 = in.m_71.y;
    float _2046 = in.m_71.z;
    bool _2048 = _1215 != 0.0;
    bool _2050 = isnan(_1215);
    bool _2052 = _2048 || _2050;
    bool _2054 = isnan(0.0);
    bool _2056 = _2052 || _2054;
    float _2058 = fma(_1255, _1948, _2038);
    float _2060 = _2040 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _2062 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _2064 = _2040 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    bool _2066 = _559 == 0.0;
    bool _2068 = !_2056;
    bool _2070 = _2066 && _2068;
    float _2072 = _2040 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _2074 = fma(_2058, (*spvDescriptorSet0.vp_c10)._m0[8].x, _2060);
    float _2076 = fma(_2058, (*spvDescriptorSet0.vp_c10)._m0[9].x, _2064);
    float _2078 = _1253 * _1946;
    bool _2080 = _1005 == 0.0;
    bool _2082 = _2080 && _2070;
    float _2084 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _2086 = fma(_2058, (*spvDescriptorSet0.vp_c10)._m0[10].x, _2072);
    float _2088 = _2004 * _1988;
    float _2090 = _1960 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _2092 = fma(_1261, _1944, _2078);
    float _2094 = _1994 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _2096 = _2002 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _2098 = _2090 * _2022;
    float _2100 = fma(_1271, _1948, _2092);
    float _2102 = _2094 * _2062;
    float _2104 = _2012 + 0.5;
    float _2106 = _2034 + 0.5;
    float _2108 = fma(_2100, (*spvDescriptorSet0.vp_c10)._m0[9].z, _2076);
    float _2110 = _2076;
    float _2112 = _2074;
    float _2114 = _2090;
    float _2116 = _2036;
    float _2118 = _2042;
    if (_2082)
    {
        _2110 = _2042;
    }
    float _2120 = _2110;
    float _2122 = fma(_2100, (*spvDescriptorSet0.vp_c10)._m0[8].z, _2074);
    float _2124 = fma(_2100, (*spvDescriptorSet0.vp_c10)._m0[10].z, _2086);
    float _2126 = _2096 * _2084;
    float _2128 = -_2036;
    float _2130 = _2128 + 1.0;
    float _2132 = _2120;
    float _2134 = _2130;
    if (_2082)
    {
        _2112 = _2044;
    }
    float _2136 = _2112;
    out.m_73.x = _2106;
    out.m_73.y = _2104;
    float _2138 = _2136;
    if (_2082)
    {
        _2114 = _2046;
    }
    float _2140 = _2114;
    float _2142 = fma(_2130, (*spvDescriptorSet0.vp_c15)._m0[654].w, _2036);
    float _2144 = _2140;
    if (_2082)
    {
        _2116 = _2120;
    }
    float _2146 = _2116;
    out.m_75.x = _2102;
    out.m_75.y = _2088;
    out.m_75.z = _2126;
    out.m_75.w = _2098;
    float _2148 = _2146;
    if (!_2082)
    {
        _2132 = _2042;
    }
    float _2150 = _2132;
    if (_2082)
    {
        _2134 = _2136;
    }
    float _2152 = _2134;
    out.m_77.x = _2122;
    out.m_77.y = _2108;
    out.m_77.z = _2124;
    float _2154 = _2152;
    if (!_2082)
    {
        _2138 = _2044;
    }
    float _2156 = _2138;
    if (!_2082)
    {
        float _2158 = fma(_559, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2150);
        _2148 = _2158;
    }
    float _2160 = _2148;
    if (_2082)
    {
        _2118 = _2140;
    }
    float _2162 = _2118;
    float _2164 = in.m_79.x;
    float _2166 = _2162;
    if (!_2082)
    {
        _2144 = _2046;
    }
    float _2168 = _2144;
    float _2170 = _1944 * _2156;
    if (!_2082)
    {
        float _2172 = fma(_1215, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2156);
        _2154 = _2172;
    }
    float _2174 = _2154;
    float _2176 = _1948 * _2150;
    float _2178 = _1946 * _2168;
    float _2180 = -_2170;
    float _2182 = fma(_1946, _2150, _2180);
    float _2184 = _1249 * _2174;
    float _2186 = -_2176;
    float _2188 = fma(_1944, _2168, _2186);
    float _2190 = -_2178;
    float _2192 = fma(_1948, _2156, _2190);
    float _2194 = _1567 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _2196 = -_2174;
    float _2198 = _1243 * _2196;
    float _2200 = _2188 * _1950;
    float _2202 = _2192 * _1950;
    float _2204 = fma(_1267, _2160, _2184);
    float _2206 = _2182 * _1950;
    float _2208 = _1249 * _2200;
    float _2210 = -_2200;
    float _2212 = _1243 * _2210;
    float _2214 = _1685 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _2216 = fma(_1711, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2194);
    float _2218 = fma(_1267, _2202, _2208);
    float _2220 = _1253 * _2174;
    float _2222 = _1253 * _2200;
    float _2224 = fma(_1251, _2202, _2212);
    float _2226 = fma(_1265, _2206, _2218);
    if (!_2082)
    {
        float _2228 = fma(_1005, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2168);
        _2166 = _2228;
    }
    float _2230 = _2166;
    float _2232 = fma(_1665, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2216);
    float _2234 = exp2(_2214);
    float _2236 = fma(_1261, _2202, _2222);
    float _2238 = fma(_1255, _2206, _2224);
    float _2240 = _2226 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _2242 = _2226 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _2244 = fma(_1251, _2160, _2198);
    float _2246 = fma(_1261, _2160, _2220);
    float _2248 = fma(_1265, _2230, _2204);
    float _2250 = fma(_1735, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2232);
    float _2252 = fma(_1271, _2206, _2236);
    float _2254 = fma(_2238, (*spvDescriptorSet0.vp_c10)._m0[8].x, _2240);
    float _2256 = fma(_2238, (*spvDescriptorSet0.vp_c10)._m0[9].x, _2242);
    float _2258 = fma(_1255, _2230, _2244);
    float _2260 = fma(_1271, _2230, _2246);
    float _2262 = _2248 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _2264 = _2250 + _1747;
    float _2266 = _2248 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _2268 = fma(_2252, (*spvDescriptorSet0.vp_c10)._m0[8].z, _2254);
    float _2270 = _2248 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _2272 = fma(_2252, (*spvDescriptorSet0.vp_c10)._m0[9].z, _2256);
    float _2274 = _1938 * _2142;
    float _2276 = fma(_2258, (*spvDescriptorSet0.vp_c10)._m0[8].x, _2262);
    float _2278 = _2264 * 0.5;
    float _2280 = fma(_2258, (*spvDescriptorSet0.vp_c10)._m0[9].x, _2266);
    float _2282 = fma(_2258, (*spvDescriptorSet0.vp_c10)._m0[10].x, _2270);
    float _2284 = fma(_2260, (*spvDescriptorSet0.vp_c10)._m0[8].z, _2276);
    float _2286 = _2274 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _2288 = -_2234;
    float _2290 = _2288 + 1.0;
    float _2292 = fma(_2260, (*spvDescriptorSet0.vp_c10)._m0[9].z, _2280);
    float _2294 = fma(_2260, (*spvDescriptorSet0.vp_c10)._m0[10].z, _2282);
    float _2296 = _2290 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _2298 = _2226 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    out.m_81.x = _2284;
    out.m_81.y = _2292;
    out.m_81.z = _2294;
    bool _2300 = _1491 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _2302 = isnan(_1491);
    bool _2304 = _2300 || _2302;
    bool _2306 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _2308 = _2304 || _2306;
    float _2310 = fma(_2238, (*spvDescriptorSet0.vp_c10)._m0[10].x, _2298);
    out.gl_Position.x = _1761;
    out.gl_Position.y = _1765;
    out.gl_Position.z = _2250;
    out.gl_Position.w = _1747;
    float _2312 = fma(_2252, (*spvDescriptorSet0.vp_c10)._m0[10].z, _2310);
    out.m_83.z = _2278;
    out.m_83.w = _1747;
    out.m_85.x = _2268;
    out.m_85.y = _2272;
    out.m_85.z = _2312;
    float _2314 = -_2296;
    float _2316 = _2314 + 1.0;
    float _2318 = _2250;
    float _2320 = _2272;
    float _2322 = _2268;
    float _2324 = _2316;
    if (!_2308)
    {
        _1880 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _2326 = _1880;
    float _2328 = _2326;
    float _2330 = _2326;
    if (!_2308)
    {
        _2318 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _2332 = _2318;
    float _2334 = _2332;
    float _2336 = _2332;
    if (!_2308)
    {
        _2320 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _2338 = _2320;
    float _2340 = _2338;
    float _2342 = _2338;
    if (!_2308)
    {
        _2322 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _2344 = _2322;
    float _2346 = -_1777;
    float _2348 = _2346 + 1.0;
    float _2350 = _2348 * _2286;
    float _2352 = precise::clamp(_2350, 0.0, 1.0);
    float _2354 = -_2352;
    float _2356 = fma(_2354, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _2358 = _2356 * _2164;
    float _2360 = _2296 * _1793;
    float _2362 = _2358 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _2364 = _1808 * _2360;
    float _2366 = _1808 * _2316;
    out.m_87.x = _2362;
    float _2368 = _2364;
    float _2370 = _2344;
    float _2372 = _2344;
    if (!_2308)
    {
        _2324 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _2374 = _2324;
    float _2376 = _1818 * _2360;
    float _2378 = fma(_1814, _2364, _1802);
    float _2380 = fma(_1816, _2364, _1804);
    float _2382 = _2374;
    float _2384 = _2374;
    if (!_2308)
    {
        _2368 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _2386 = _2368;
    float _2388 = fma(_1808, _2376, _1806);
    out.m_89.x = _2378;
    out.m_89.y = _2380;
    out.m_89.z = _2388;
    out.m_89.w = _2366;
    bool _2390 = !_2308;
    float _2392 = _2386;
    float _2394 = _2386;
    if (!_2390)
    {
        bool _2396 = _1491 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _2398 = isnan(_1491);
        bool _2400 = _2396 || _2398;
        bool _2402 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _2404 = _2400 || _2402;
        if (!_2404)
        {
            float _2406 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2408 = _1491 + _2406;
            float _2410 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2412 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _2410;
            float _2414 = 1.0 / _2412;
            float _2416 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _2418 = _2416 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _2420 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _2422 = _2420 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _2424 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _2426 = _2424 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _2428 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _2430 = _2428 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _2432 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _2434 = _2432 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _2436 = _2408 * _2414;
            float _2438 = precise::clamp(_2436, 0.0, 1.0);
            float _2440 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _2442 = _2440 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _2444 = fma(_2438, _2418, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _2446 = fma(_2438, _2442, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _2448 = fma(_2438, _2422, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _2450 = fma(_2438, _2426, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _2452 = fma(_2438, _2430, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _2454 = fma(_2438, _2434, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _2372 = _2446;
            _2394 = _2452;
            _2342 = _2444;
            _2336 = _2450;
            _2330 = _2448;
            _2384 = _2454;
            _2456 = true;
        }
        else
        {
            bool _2458 = _1491 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _2460 = isnan(_1491);
            bool _2462 = _2458 || _2460;
            bool _2464 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _2466 = _2462 || _2464;
            if (!_2466)
            {
                _2340 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _2468 = _2340;
            _2342 = _2468;
            if (!_2466)
            {
                _2370 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _2470 = _2370;
            _2372 = _2470;
            if (!_2466)
            {
                _2328 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _2472 = _2328;
            _2330 = _2472;
            if (!_2466)
            {
                _2334 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _2474 = _2334;
            _2336 = _2474;
            if (!_2466)
            {
                _2392 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _2476 = _2392;
            _2394 = _2476;
            if (!_2466)
            {
                _2382 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _2478 = _2382;
            bool _2480 = !_2466;
            _2384 = _2478;
            if (!_2480)
            {
                bool _2482 = _1491 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _2484 = isnan(_1491);
                bool _2486 = _2482 || _2484;
                bool _2488 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _2490 = _2486 || _2488;
                if (!_2490)
                {
                    float _2492 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2494 = _1491 + _2492;
                    float _2496 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2498 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _2496;
                    float _2500 = 1.0 / _2498;
                    float _2502 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _2504 = _2502 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _2506 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _2508 = _2506 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _2510 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _2512 = _2510 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _2514 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _2516 = _2514 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _2518 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _2520 = _2518 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _2522 = _2494 * _2500;
                    float _2524 = precise::clamp(_2522, 0.0, 1.0);
                    float _2526 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _2528 = _2526 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _2530 = fma(_2524, _2504, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _2532 = fma(_2524, _2528, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _2534 = fma(_2524, _2508, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _2536 = fma(_2524, _2512, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _2538 = fma(_2524, _2516, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _2540 = fma(_2524, _2520, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _2372 = _2532;
                    _2394 = _2538;
                    _2342 = _2530;
                    _2336 = _2536;
                    _2330 = _2534;
                    _2384 = _2540;
                    _2456 = true;
                }
                else
                {
                    _2372 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _2394 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _2342 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _2336 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _2330 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _2384 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _2456 = false;
    float _2542 = _2372;
    float _2544 = _2394;
    float _2546 = _2342;
    float _2548 = _2336;
    float _2550 = _2330;
    float _2552 = _2384;
    float _2554 = fma(_2292, -0.5, 0.5);
    float _2556 = precise::clamp(_2554, 0.0, 1.0);
    float _2558 = -_2542;
    float _2560 = _2558 + _2544;
    float _2562 = -_2546;
    float _2564 = _2562 + _2548;
    float _2566 = -_2550;
    float _2568 = _2566 + _2552;
    bool _2570 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2572 = fma(_2556, _2560, _2542);
    float _2574 = fma(_2556, _2564, _2546);
    float _2576 = fma(_2556, _2568, _2550);
    float _2578 = _2572 * 0.586610972881317138671875;
    out.m_91.x = 0.0;
    float _2580 = fma(_2574, 0.298911988735198974609375, _2578);
    float _2582 = fma(_2576, 0.114477999508380889892578125, _2580);
    float _2584 = -_2582;
    float _2586 = _2574 + _2584;
    float _2588 = -_2582;
    float _2590 = _2572 + _2588;
    float _2592 = -_2582;
    float _2594 = _2576 + _2592;
    float _2596 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2598 = fma(_2586, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2582);
    float _2600 = fma(_2590, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2582);
    float _2602 = fma(_2594, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2582);
    out.m_49.x = _2596;
    out.m_93.x = _2598;
    out.m_93.y = _2600;
    out.m_93.z = _2602;
    if (!_2570)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _2604 = -_1459;
    float _2606 = _2604 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
    float _2608 = -_1461;
    float _2610 = _2608 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
    float _2612 = -_1463;
    float _2614 = _2612 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
    float _2616 = _2606 * _2606;
    float _2618 = fma(_2610, _2610, _2616);
    float _2620 = fma(_2614, _2614, _2618);
    float _2622 = sqrt(_2620);
    float _2624 = rsqrt(_2620);
    float _2626 = -_2622;
    float _2628 = _2626 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2630 = _2628 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
    float _2632 = precise::clamp(_2630, 0.0, 1.0);
    float _2634 = _2610 * _2624;
    float _2636 = _2606 * _2624;
    float _2638 = abs(_2632);
    float _2640 = log2(_2638);
    float _2642 = _2614 * _2624;
    float _2644 = _2634 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
    float _2646 = _2292 * _2636;
    float _2648 = -_2636;
    float _2650 = -_2644;
    float _2652 = fma(_2648, (*spvDescriptorSet0.vp_c15)._m0[656].y, _2650);
    float _2654 = fma(_2284, _2634, _2646);
    float _2656 = -_2642;
    float _2658 = fma(_2656, (*spvDescriptorSet0.vp_c15)._m0[656].z, _2652);
    float _2660 = fma(_2294, _2642, _2654);
    float _2662 = precise::clamp(_2660, 0.0, 1.0);
    float _2664 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
    float _2666 = _2658 + _2664;
    float _2668 = _2640 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
    float _2670 = _2666 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
    float _2672 = precise::clamp(_2670, 0.0, 1.0);
    float _2674 = exp2(_2668);
    float _2676 = _2674 * _2672;
    float _2678 = _2662 * _2676;
    float _2680 = _2678 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
    float _2682 = _2678 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
    float _2684 = _2678 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
    out.m_91.x = _2680;
    out.m_91.y = _2682;
    out.m_91.z = _2684;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_57 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_55 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_49 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_93 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_67 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_75 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_83 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_73 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_85 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_81 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_77 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_91 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_87 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_89 = float4(0.0, 0.0, 0.0, 1.0);
    bool _2456 = false;
    bool _533 = false;
    bool _190 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _107 = in.m_46.w;
    float _109 = trunc(_107);
    int _112 = int(_109);
    bool _116 = _112 >= 1;
    float _118 = 0.0;
    if (!_116)
    {
        _118 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _120 = _118;
    float _122 = _120;
    if (!_116)
    {
        out.m_49.x = 0.0;
    }
    int _124 = 0;
    if (!_116)
    {
        float _126 = _120 * 5.0;
        _124 = as_type<int>(_126);
    }
    int _128 = _124;
    int _130 = _128;
    if (!_116)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2741 = as_type<float>(_128);
        out.gl_Position.z = _2741;
    }
    if (!_116)
    {
        return out;
    }
    float _132 = in.m_51.w;
    bool _134 = _132 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _136 = isnan(_132);
    bool _138 = _134 || _136;
    bool _140 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _142 = _138 || _140;
    float _144 = -_132;
    float _146 = _144 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _148 = 0.0;
    float _150 = _146;
    if (_142)
    {
        float _152 = float(_112);
        _148 = _152;
    }
    float _154 = _148;
    bool _156 = _146 >= _154;
    bool _158 = !_142;
    bool _160 = _156 || _158;
    if (_160)
    {
        _122 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _162 = _122;
    if (_160)
    {
        out.m_49.x = 0.0;
    }
    if (_160)
    {
        float _164 = _162 * 5.0;
        _130 = as_type<int>(_164);
    }
    int _166 = _130;
    if (_160)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2810 = as_type<float>(_166);
        out.gl_Position.z = _2810;
    }
    if (_160)
    {
        return out;
    }
    bool _168 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    bool _170 = !_168;
    float _188;
    if (!_170)
    {
        float _172 = in.m_53.x;
        float _174 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _176 = _172 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _178 = fma(_176, (*spvDescriptorSet0.vp_c9)._m0[12].x, _146);
        float _180 = _178 * _174;
        float _182 = floor(_180);
        float _184 = -_182;
        float _186 = _180 + _184;
        _188 = _186;
        _190 = true;
    }
    else
    {
        float _192 = float(_112);
        float _194 = 1.0 / _192;
        float _196 = _146 * _194;
        _188 = _196;
    }
    _190 = false;
    float _198 = _188;
    float _200 = in.m_53.x;
    float _202 = float(as_type<int>((*spvDescriptorSet0.vp_c9)._m0[8].x));
    float _204 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _206 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _204;
    float _208 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _210 = _208 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _212 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _214 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _212;
    float _216 = 1.0 / _206;
    float _218 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _220 = _218 + (*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _222 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _224 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _226 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _228 = 1.0 / _214;
    float _230 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _232 = _198 + _230;
    float _234 = (*spvDescriptorSet0.vp_c9)._m0[131].x * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _236 = _222 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _238 = _202 * _200;
    float _240 = _224 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _242 = _226 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _244 = 1.0 / _210;
    float _246 = _232 * _216;
    float _248 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _250 = _198 + _248;
    bool _252 = _198 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _254 = isnan(_198);
    bool _256 = _252 || _254;
    bool _258 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _260 = _256 || _258;
    float _262 = float(_260);
    out.m_55.x = _236;
    out.m_55.y = _240;
    out.m_55.z = _242;
    out.m_55.w = _234;
    float _264 = trunc(_238);
    int _266 = int(_264);
    float _268 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _270 = _198 + _268;
    bool _272 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[14].x;
    float _274 = _270 * _228;
    bool _276 = _198 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _278 = isnan(_198);
    bool _280 = _276 || _278;
    bool _282 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _284 = _280 || _282;
    float _286 = float(_284);
    float _288 = 1.0 / _220;
    float _290 = _250 * _244;
    bool _292 = _198 >= (*spvDescriptorSet0.vp_c9)._m0[147].w;
    bool _294 = isnan(_198);
    bool _296 = _292 || _294;
    bool _298 = isnan((*spvDescriptorSet0.vp_c9)._m0[147].w);
    bool _300 = _296 || _298;
    float _302 = float(_300);
    float _304 = -_286;
    float _306 = _304 + 1.0;
    float _308 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _310 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _308;
    bool _312 = _198 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _314 = isnan(_198);
    bool _316 = _312 || _314;
    bool _318 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _320 = _316 || _318;
    float _322 = float(_320);
    float _324 = -_302;
    float _326 = _324 + 1.0;
    int _328 = _266 << 4;
    int _330 = _328 + 1712;
    float _332 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _334 = _198 + _332;
    float _336 = _262 * _306;
    float _338 = _286 * _326;
    uint _341 = uint(int(uint(_330) >> uint(2)));
    uint _343 = uint(int(uint(int(_341)) >> uint(2)));
    int _345 = int(_341) & 3;
    float _347 = (*spvDescriptorSet0.vp_c9)._m0[int(_343)][_345];
    int _349 = int(_341) + 1;
    uint _351 = uint(int(uint(_349) >> uint(2)));
    int _353 = _349 & 3;
    float _355 = (*spvDescriptorSet0.vp_c9)._m0[int(_351)][_353];
    float _357 = -_262;
    float _359 = _357 + 1.0;
    float _361 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _363 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _361;
    float _365 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _367 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _365;
    float _369 = -_322;
    float _371 = _369 + 1.0;
    float _373 = _334 * _288;
    float _375 = _322 * _359;
    float _377 = fma(_363, _246, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    int _379 = _330 + 8;
    uint _381 = uint(int(uint(_379) >> uint(2)));
    uint _383 = uint(int(uint(int(_381)) >> uint(2)));
    int _385 = int(_381) & 3;
    float _387 = (*spvDescriptorSet0.vp_c9)._m0[int(_383)][_385];
    float _389 = fma(_367, _246, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _391 = fma(_310, _246, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _393 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _395 = _393 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _397 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _399 = _397 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _401 = fma(_395, _290, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    bool _403 = _198 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _405 = isnan(_198);
    bool _407 = _403 || _405;
    bool _409 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _411 = _407 || _409;
    float _413 = float(_411);
    float _415 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _417 = _415 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _419 = fma(_399, _290, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    float _421 = _413 * _371;
    float _423 = fma(_417, _290, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _425 = -_413;
    float _427 = _425 + 1.0;
    float _429 = _391 * _421;
    float _431 = _377 * _421;
    float _433 = _389 * _421;
    float _435 = -(*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _437 = (*spvDescriptorSet0.vp_c9)._m0[146].z + _435;
    float _439 = fma(_427, (*spvDescriptorSet0.vp_c9)._m0[143].z, _429);
    float _441 = fma(_437, _274, (*spvDescriptorSet0.vp_c9)._m0[145].z);
    float _443 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _445 = _347 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _447 = _355 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _449 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _451 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _449;
    float _453 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _455 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _453;
    float _457 = fma(_451, _274, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _459 = fma(_455, _274, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _461 = _387 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _463 = _445 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _465 = _447 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _467 = fma(_427, (*spvDescriptorSet0.vp_c9)._m0[143].x, _431);
    float _469 = _461 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _471 = fma(_427, (*spvDescriptorSet0.vp_c9)._m0[143].y, _433);
    float _473 = -(*spvDescriptorSet0.vp_c9)._m0[146].z;
    float _475 = _473 + (*spvDescriptorSet0.vp_c9)._m0[147].z;
    float _477 = fma(_423, _375, _467);
    float _479 = -(*spvDescriptorSet0.vp_c9)._m0[146].x;
    float _481 = _479 + (*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _483 = fma(_401, _375, _471);
    float _485 = fma(_419, _375, _439);
    float _487 = -(*spvDescriptorSet0.vp_c9)._m0[146].y;
    float _489 = _487 + (*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _491 = fma(_481, _373, (*spvDescriptorSet0.vp_c9)._m0[146].x);
    float _493 = fma(_457, _336, _477);
    float _495 = fma(_459, _336, _483);
    float _497 = fma(_489, _373, (*spvDescriptorSet0.vp_c9)._m0[146].y);
    float _499 = fma(_475, _373, (*spvDescriptorSet0.vp_c9)._m0[146].z);
    float _501 = fma(_441, _336, _485);
    out.m_57.x = _463;
    out.m_57.y = _465;
    out.m_57.z = _469;
    out.m_57.w = _443;
    float _503 = fma(_491, _338, _493);
    float _505 = fma(_499, _338, _501);
    float _507 = fma(_497, _338, _495);
    float _509 = fma(_302, (*spvDescriptorSet0.vp_c9)._m0[147].x, _503);
    float _511 = fma(_302, (*spvDescriptorSet0.vp_c9)._m0[147].z, _505);
    float _513 = fma(_302, (*spvDescriptorSet0.vp_c9)._m0[147].y, _507);
    bool _515 = !_272;
    float _531;
    if (!_515)
    {
        float _517 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[14].x;
        float _519 = _200 * (*spvDescriptorSet0.vp_c9)._m0[15].x;
        float _521 = fma(_519, (*spvDescriptorSet0.vp_c9)._m0[14].x, _146);
        float _523 = _521 * _517;
        float _525 = floor(_523);
        float _527 = -_525;
        float _529 = _523 + _527;
        _531 = _529;
        _533 = true;
    }
    else
    {
        float _535 = float(_112);
        float _537 = 1.0 / _535;
        float _539 = _146 * _537;
        _531 = _539;
    }
    _533 = false;
    float _541 = _531;
    float _543 = _200 * 2.0;
    float _545 = in.m_53.z;
    float _547 = floor(_543);
    int _549 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _551 = _549 != 0;
    float _553 = in.m_53.y;
    float _555 = -(*spvDescriptorSet0.vp_c9)._m0[159].w;
    float _557 = _555 + (*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _559 = in.m_59.x;
    int _561 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _563 = _561 != 0;
    int _565 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _567 = _565 != 0;
    int _569 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _571 = _569 != 0;
    float _573 = 1.0 / _557;
    float _575 = -(*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _577 = _575 + (*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _579 = -(*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _581 = _579 + (*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _583 = 1.0 / _577;
    float _585 = -(*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _587 = _585 + (*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _589 = -(*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _591 = _589 + (*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _593 = 1.0 / _581;
    float _595 = -(*spvDescriptorSet0.vp_c9)._m0[165].x;
    float _597 = (*spvDescriptorSet0.vp_c9)._m0[166].x + _595;
    bool _599 = _547 > 0.0;
    float _601 = -(*spvDescriptorSet0.vp_c9)._m0[163].x;
    float _603 = (*spvDescriptorSet0.vp_c9)._m0[164].x + _601;
    bool _605 = _547 >= 0.0;
    bool _607 = isnan(_547);
    bool _609 = _605 || _607;
    bool _611 = isnan(0.0);
    bool _613 = _609 || _611;
    float _615 = -(*spvDescriptorSet0.vp_c9)._m0[164].x;
    float _617 = _615 + (*spvDescriptorSet0.vp_c9)._m0[165].x;
    float _619 = 1.0 / _587;
    float _621 = -(*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _623 = _621 + (*spvDescriptorSet0.vp_c9)._m0[166].w;
    float _625 = _545 * 2.0;
    bool _627 = _541 >= (*spvDescriptorSet0.vp_c9)._m0[163].w;
    bool _629 = isnan(_541);
    bool _631 = _627 || _629;
    bool _633 = isnan((*spvDescriptorSet0.vp_c9)._m0[163].w);
    bool _635 = _631 || _633;
    float _637 = float(_635);
    int _639 = _613 ? 0 : 1;
    bool _641 = _541 >= (*spvDescriptorSet0.vp_c9)._m0[161].w;
    bool _643 = isnan(_541);
    bool _645 = _641 || _643;
    bool _647 = isnan((*spvDescriptorSet0.vp_c9)._m0[161].w);
    bool _649 = _645 || _647;
    float _651 = float(_649);
    float _653 = 1.0 / _623;
    float _655 = -(*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _657 = _655 + (*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _659 = -(*spvDescriptorSet0.vp_c9)._m0[159].x;
    float _661 = (*spvDescriptorSet0.vp_c9)._m0[160].x + _659;
    float _663 = _603 * _593;
    bool _665 = _541 >= (*spvDescriptorSet0.vp_c9)._m0[164].w;
    bool _667 = isnan(_541);
    bool _669 = _665 || _667;
    bool _671 = isnan((*spvDescriptorSet0.vp_c9)._m0[164].w);
    bool _673 = _669 || _671;
    float _675 = float(_673);
    float _677 = -_637;
    float _679 = _677 + 1.0;
    float _681 = 1.0 / _591;
    float _683 = 1.0 / _657;
    float _685 = _597 * _653;
    float _687 = _553 * 2.0;
    float _689 = _661 * _573;
    float _691 = -(*spvDescriptorSet0.vp_c9)._m0[160].x;
    float _693 = _691 + (*spvDescriptorSet0.vp_c9)._m0[161].x;
    float _695 = -(*spvDescriptorSet0.vp_c9)._m0[161].x;
    float _697 = (*spvDescriptorSet0.vp_c9)._m0[162].x + _695;
    float _699 = -(*spvDescriptorSet0.vp_c9)._m0[162].x;
    float _701 = _699 + (*spvDescriptorSet0.vp_c9)._m0[163].x;
    float _703 = floor(_625);
    float _705 = _697 * _619;
    float _707 = _693 * _583;
    float _709 = _701 * _681;
    float _711 = _200 + _553;
    float _713 = _553 + _545;
    bool _715 = _541 >= (*spvDescriptorSet0.vp_c9)._m0[166].w;
    bool _717 = isnan(_541);
    bool _719 = _715 || _717;
    bool _721 = isnan((*spvDescriptorSet0.vp_c9)._m0[166].w);
    bool _723 = _719 || _721;
    float _725 = float(_723);
    float _727 = floor(_687);
    float _729 = _711 + (-1.0);
    float _731 = _713 + (-1.0);
    float _733 = _617 * _683;
    bool _735 = _541 >= (*spvDescriptorSet0.vp_c9)._m0[165].w;
    bool _737 = isnan(_541);
    bool _739 = _735 || _737;
    bool _741 = isnan((*spvDescriptorSet0.vp_c9)._m0[165].w);
    bool _743 = _739 || _741;
    float _745 = float(_743);
    float _747 = -_725;
    float _749 = _747 + 1.0;
    float _751 = fma(_731, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _753 = fma(_729, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _755 = -(*spvDescriptorSet0.vp_c9)._m0[159].w;
    float _757 = _541 + _755;
    float _759 = _657;
    float _761 = _731;
    float _763 = _553;
    if (_551)
    {
        _759 = _200;
    }
    float _765 = _759;
    float _767 = _745 * _749;
    float _769 = _765;
    if (_551)
    {
        _761 = _553;
    }
    float _771 = _761;
    float _773 = -_745;
    float _775 = _773 + 1.0;
    float _777 = _771;
    if (!_551)
    {
        _769 = _545;
    }
    float _779 = _769;
    if (!_551)
    {
        _777 = _200;
    }
    float _781 = _777;
    float _783 = _675 * _775;
    bool _785 = !_567;
    int _787 = _785 ? 0 : 1;
    float _789 = -_675;
    float _791 = _789 + 1.0;
    bool _793 = _703 > 0.0;
    float _795 = _781 * (*spvDescriptorSet0.vp_c9)._m0[87].y;
    bool _797 = _703 >= 0.0;
    bool _799 = isnan(_703);
    bool _801 = _797 || _799;
    bool _803 = isnan(0.0);
    bool _805 = _801 || _803;
    float _807 = fma(_689, _757, (*spvDescriptorSet0.vp_c9)._m0[159].x);
    bool _809 = _727 > 0.0;
    float _811 = -(*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _813 = _541 + _811;
    bool _815 = _727 >= 0.0;
    bool _817 = isnan(_727);
    bool _819 = _815 || _817;
    bool _821 = isnan(0.0);
    bool _823 = _819 || _821;
    float _825 = -(*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _827 = _541 + _825;
    bool _829 = _541 >= (*spvDescriptorSet0.vp_c9)._m0[162].w;
    bool _831 = isnan(_541);
    bool _833 = _829 || _831;
    bool _835 = isnan((*spvDescriptorSet0.vp_c9)._m0[162].w);
    bool _837 = _833 || _835;
    float _839 = float(_837);
    float _841 = fma(_705, _813, (*spvDescriptorSet0.vp_c9)._m0[161].x);
    float _843 = _637 * _791;
    bool _845 = _541 >= (*spvDescriptorSet0.vp_c9)._m0[160].w;
    bool _847 = isnan(_541);
    bool _849 = _845 || _847;
    bool _851 = isnan((*spvDescriptorSet0.vp_c9)._m0[160].w);
    bool _853 = _849 || _851;
    float _855 = float(_853);
    float _857 = fma(_707, _827, (*spvDescriptorSet0.vp_c9)._m0[160].x);
    float _859 = -_839;
    float _861 = _859 + 1.0;
    float _863 = _839 * _679;
    float _865 = -(*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _867 = _541 + _865;
    float _869 = -(*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _871 = _541 + _869;
    float _873 = _651 * _861;
    float _875 = -_651;
    float _877 = _875 + 1.0;
    float _879 = fma(_663, _867, (*spvDescriptorSet0.vp_c9)._m0[163].x);
    bool _881 = _541 >= (*spvDescriptorSet0.vp_c9)._m0[159].w;
    bool _883 = isnan(_541);
    bool _885 = _881 || _883;
    bool _887 = isnan((*spvDescriptorSet0.vp_c9)._m0[159].w);
    bool _889 = _885 || _887;
    float _891 = float(_889);
    float _893 = -_855;
    float _895 = _893 + 1.0;
    float _897 = _855 * _877;
    float _899 = fma(_709, _871, (*spvDescriptorSet0.vp_c9)._m0[162].x);
    float _901 = _891 * _895;
    float _903 = -(*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _905 = _541 + _903;
    float _907 = -(*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _909 = _541 + _907;
    float _911 = -_891;
    float _913 = _911 + 1.0;
    float _915 = _807 * _901;
    float _917 = _779 * (*spvDescriptorSet0.vp_c9)._m0[87].x;
    float _919 = (*spvDescriptorSet0.vp_c9)._m0[87].x + (*spvDescriptorSet0.vp_c9)._m0[86].z;
    float _921 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _923 = log2(_921);
    float _925 = (*spvDescriptorSet0.vp_c9)._m0[87].y + (*spvDescriptorSet0.vp_c9)._m0[86].w;
    int _927 = ~_639;
    int _929 = _927 + 1;
    int _931 = _929 + 1;
    float _933 = fma(_913, (*spvDescriptorSet0.vp_c9)._m0[159].x, _915);
    int _935 = _931;
    if (!_599)
    {
        int _937 = ~_639;
        int _939 = _937 + 1;
        _935 = _939;
    }
    int _941 = _935;
    float _943 = fma(_795, -2.0, _925);
    int _945 = abs(_787);
    float _947 = fma(_685, _909, (*spvDescriptorSet0.vp_c9)._m0[165].x);
    int _949 = _805 ? 0 : 1;
    float _951 = -_919;
    float _953 = fma(_917, 2.0, _951);
    float _955 = float(_945);
    float _957 = fma(_857, _897, _933);
    float _959 = float(_941);
    float _961 = fma(_733, _905, (*spvDescriptorSet0.vp_c9)._m0[164].x);
    int _963 = ~_949;
    int _965 = _963 + 1;
    int _967 = _965 + 1;
    float _969 = fma(_841, _873, _957);
    int _971 = _967;
    if (!_793)
    {
        int _973 = ~_949;
        int _975 = _973 + 1;
        _971 = _975;
    }
    int _977 = _971;
    float _979 = _923 * _146;
    float _981 = _955 * _959;
    float _983 = in.m_61.x;
    float _985 = in.m_61.y;
    float _987 = in.m_61.z;
    int _989 = _823 ? 0 : 1;
    float _991 = _981 * (-2.0);
    float _993 = exp2(_979);
    float _995 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _997 = 1.0 + _995;
    int _999 = ~_989;
    int _1001 = _999 + 1;
    int _1003 = _1001 + 1;
    float _1005 = in.m_59.z;
    int _1007 = _1003;
    if (!_809)
    {
        int _1009 = ~_989;
        int _1011 = _1009 + 1;
        _1007 = _1011;
    }
    int _1013 = _1007;
    float _1015 = (*spvDescriptorSet0.vp_c9)._m0[88].z + (*spvDescriptorSet0.vp_c9)._m0[88].x;
    float _1017 = 1.0 / _997;
    bool _1019 = !_563;
    int _1021 = _1019 ? 0 : 1;
    float _1023 = fma(_200, (*spvDescriptorSet0.vp_c9)._m0[88].z, _1015);
    bool _1025 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1027 = isnan(1.0);
    bool _1029 = _1025 || _1027;
    bool _1031 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1033 = _1029 || _1031;
    float _1035 = (*spvDescriptorSet0.vp_c9)._m0[88].w + (*spvDescriptorSet0.vp_c9)._m0[88].y;
    int _1037 = abs(_1021);
    float _1039 = _553 + (-0.5);
    bool _1041 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1043 = isnan(0.0);
    bool _1045 = _1041 || _1043;
    bool _1047 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1049 = _1045 || _1047;
    float _1051 = fma(_553, (*spvDescriptorSet0.vp_c9)._m0[88].w, _1035);
    float _1053 = -_993;
    float _1055 = _1053 + 1.0;
    float _1057 = fma(_146, (*spvDescriptorSet0.vp_c9)._m0[87].z, _1023);
    float _1059 = float(_1037);
    float _1061 = -_146;
    float _1063 = fma(_1061, (*spvDescriptorSet0.vp_c9)._m0[86].x, _953);
    float _1065 = float(_977);
    float _1067 = fma(_991, _985, _985);
    bool _1069 = !_571;
    int _1071 = _1069 ? 0 : 1;
    float _1073 = fma(_899, _863, _969);
    float _1075 = _1049 ? _1055 : 0.0;
    float _1077 = _1059 * _1065;
    float _1079 = fma(_146, (*spvDescriptorSet0.vp_c9)._m0[87].w, _1051);
    int _1081 = abs(_1071);
    float _1083 = fma(_146, (*spvDescriptorSet0.vp_c9)._m0[86].y, _943);
    float _1085 = _200 + _545;
    if (_1033)
    {
        float _1087 = _1075 * _1017;
        _150 = _1087;
    }
    float _1089 = _150;
    float _1091 = fma(_751, _991, _751);
    float _1093 = fma(_1039, (*spvDescriptorSet0.vp_c9)._m0[196].y, _1067);
    float _1095 = fma(_879, _843, _1073);
    float _1097 = _1077 * (-2.0);
    float _1099 = _1085 + (-1.0);
    float _1101 = fma(_1091, _1089, _1093);
    float _1103 = float(_1013);
    float _1105 = _200 + (-0.5);
    float _1107 = fma(_1097, _983, _983);
    float _1109 = fma(_961, _783, _1095);
    float _1111 = fma(_1099, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _1113 = fma(_753, _1097, _753);
    float _1115 = fma(_1105, (*spvDescriptorSet0.vp_c9)._m0[196].x, _1107);
    float _1117 = float(_1081);
    float _1119 = fma(_947, _767, _1109);
    float _1121 = _200 + _1005;
    float _1123 = fma(_1113, _1089, _1115);
    float _1125 = (*spvDescriptorSet0.vp_c9)._m0[191].x * (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _1127 = fma(_725, (*spvDescriptorSet0.vp_c9)._m0[166].x, _1119);
    float _1129 = _1117 * _1103;
    float _1131 = in.m_63.x;
    float _1133 = in.m_63.y;
    float _1135 = in.m_63.z;
    float _1137 = _1101 * 0.15915493667125701904296875;
    float _1139 = fma(_1127, _1125, _1121);
    float _1141 = _1129 * (-2.0);
    float _1143 = in.m_59.y;
    float _1145 = _1123 * 0.15915493667125701904296875;
    float _1147 = _1139 * (*spvDescriptorSet0.vp_c9)._m0[191].y;
    float _1149 = fma(_1141, _987, _987);
    float _1151 = _545 + (-0.5);
    float _1153 = fma(_1111, _1141, _1111);
    float _1155 = _1147 * 0.15915493667125701904296875;
    float _1157 = _1137 * 6.283185482025146484375;
    float _1159 = sin(_1157);
    float _1161 = fma(_1151, (*spvDescriptorSet0.vp_c9)._m0[196].z, _1149);
    float _1163 = in.m_46.x;
    float _1165 = in.m_46.y;
    float _1167 = in.m_46.z;
    float _1169 = fma(_1153, _1089, _1161);
    float _1171 = _1155 * 6.283185482025146484375;
    float _1173 = sin(_1171);
    float _1175 = _1169 * 0.15915493667125701904296875;
    bool _1177 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _1179 = isnan(0.5);
    bool _1181 = _1177 || _1179;
    bool _1183 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1185 = _1181 || _1183;
    float _1187 = _511 * _1135;
    float _1189 = _509 * _1131;
    float _1191 = fma(_553, (*spvDescriptorSet0.vp_c9)._m0[191].z, 0.20000000298023223876953125);
    float _1193 = _1137 * 6.283185482025146484375;
    float _1195 = cos(_1193);
    float _1197 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _559);
    float _1199 = _1189 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1201 = _513 * _1133;
    float _1203 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _1005);
    float _1205 = _1187 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _1207 = _1197 * _1199;
    float _1209 = _1201 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1211 = _1145 * 6.283185482025146484375;
    float _1213 = sin(_1211);
    float _1215 = fma(_1173, _1191, _1143);
    float _1217 = _1203 * _1205;
    float _1219 = _1165 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _1221 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _1215);
    float _1223 = fma(_1163, (*spvDescriptorSet0.vp_c10)._m0[6].x, _1219);
    float _1225 = _1145 * 6.283185482025146484375;
    float _1227 = cos(_1225);
    float _1229 = _1221 * _1209;
    float _1231 = fma(_1167, (*spvDescriptorSet0.vp_c10)._m0[6].z, _1223);
    float _1233 = _1175 * 6.283185482025146484375;
    float _1235 = cos(_1233);
    float _1237 = _1213 * _1195;
    float _1239 = _1213 * _1159;
    float _1241 = _1175 * 6.283185482025146484375;
    float _1243 = sin(_1241);
    float _1245 = _1227 * _1159;
    float _1247 = _1227 * _1195;
    float _1249 = _1227 * _1235;
    float _1251 = _1195 * _1235;
    float _1253 = _1213 * _1235;
    float _1255 = _1159 * _1235;
    float _1257 = _1253 * _1229;
    float _1259 = -_1245;
    float _1261 = fma(_1243, _1237, _1259);
    float _1263 = -_1237;
    float _1265 = fma(_1243, _1245, _1263);
    float _1267 = fma(_1243, _1247, _1239);
    float _1269 = _1249 * _1229;
    float _1271 = fma(_1243, _1239, _1247);
    float _1273 = -_1229;
    float _1275 = _1243 * _1273;
    float _1277 = fma(_1261, _1207, _1257);
    float _1279 = fma(_1267, _1207, _1269);
    float _1281 = _1165 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _1283 = fma(_1251, _1207, _1275);
    float _1285 = fma(_1271, _1217, _1277);
    float _1287 = fma(_1265, _1217, _1279);
    float _1289 = fma(_1163, (*spvDescriptorSet0.vp_c10)._m0[4].x, _1281);
    float _1291 = fma(_1255, _1217, _1283);
    float _1293 = _1231 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _1295 = _1287 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _1297 = _1287 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _1299 = fma(_1167, (*spvDescriptorSet0.vp_c10)._m0[4].z, _1289);
    float _1301 = _1165 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _1303 = fma(_1291, (*spvDescriptorSet0.vp_c10)._m0[10].x, _1295);
    float _1305 = fma(_1291, (*spvDescriptorSet0.vp_c10)._m0[8].x, _1297);
    float _1307 = _1299 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _1309 = fma(_1163, (*spvDescriptorSet0.vp_c10)._m0[5].x, _1301);
    float _1311 = fma(_1285, (*spvDescriptorSet0.vp_c10)._m0[10].z, _1303);
    float _1313 = fma(_1285, (*spvDescriptorSet0.vp_c10)._m0[8].z, _1305);
    float _1315 = _1287 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _1317 = fma(_1167, (*spvDescriptorSet0.vp_c10)._m0[5].z, _1309);
    float _1319 = _1293 + _1311;
    float _1321 = _1307 + _1313;
    float _1323 = fma(_1291, (*spvDescriptorSet0.vp_c10)._m0[9].x, _1315);
    float _1325 = _1317 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _1327 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1329 = _1319 + _1327;
    float _1331 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1333 = _1321 + _1331;
    float _1335 = fma(_1285, (*spvDescriptorSet0.vp_c10)._m0[9].z, _1323);
    float _1337 = _1329 * _1329;
    float _1339 = _1325 + _1335;
    float _1341 = fma(_1333, _1333, _1337);
    float _1343 = sqrt(_1341);
    bool _1345 = _1343 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1347 = _1161;
    float _1349 = _1321;
    float _1351 = _1319;
    float _1353 = _1291;
    float _1355 = _1339;
    if (!_1345)
    {
        _1347 = _1339;
    }
    float _1357 = _1347;
    bool _1359 = !_1345;
    float _1361 = _1357;
    if (!_1359)
    {
        float _1363 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1365 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1367 = _1343 + _1365;
        float _1369 = _1339 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1371 = _1367 * _1363;
        float _1373 = rsqrt(_1341);
        float _1375 = _1371 * 0.15915493667125701904296875;
        float _1377 = _1375 * 6.283185482025146484375;
        float _1379 = cos(_1377);
        float _1381 = _1375 * 6.283185482025146484375;
        float _1383 = sin(_1381);
        float _1385 = _1379 + (-1.0);
        float _1387 = _1385 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1389 = fma(_1383, _1369, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1391 = fma(_1339, _1379, _1387);
        float _1393 = _1373 * _1389;
        float _1395 = fma(_1333, _1393, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1397 = fma(_1329, _1393, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1349 = _1395;
        _1351 = _1397;
        _1361 = _1391;
        _1353 = _1375;
    }
    float _1399 = _1349;
    float _1401 = _1351;
    float _1403 = _1361;
    float _1405 = _1353;
    float _1407 = _1403;
    float _1409 = _1399;
    float _1411 = _1401;
    float _1413 = _1405;
    if (!_1185)
    {
        float _1415 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _1417 = _1325 + _1415;
        float _1419 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _1421 = _1307 + _1419;
        float _1423 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1425 = -_1307;
        float _1427 = _1425 + _1399;
        float _1429 = _1417 * _1417;
        float _1431 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _1433 = _1293 + _1431;
        float _1435 = -_1293;
        float _1437 = _1435 + _1401;
        float _1439 = fma(_1421, _1421, _1429);
        float _1441 = fma(_1433, _1433, _1439);
        float _1443 = sqrt(_1441);
        float _1445 = precise::min(_1443, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1447 = _1445 * _1423;
        float _1449 = -_1325;
        float _1451 = _1449 + _1403;
        float _1453 = fma(_1427, _1447, _1307);
        float _1455 = fma(_1451, _1447, _1325);
        float _1457 = fma(_1437, _1447, _1293);
        _1407 = _1455;
        _1409 = _1453;
        _1411 = _1457;
        _1413 = _1451;
    }
    float _1459 = _1407;
    float _1461 = _1409;
    float _1463 = _1411;
    float _1465 = _1413;
    float _1467 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1469 = _1459 + _1467;
    float _1471 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1473 = _1461 + _1471;
    float _1475 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1477 = _1463 + _1475;
    float _1479 = _1459 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1481 = _1469 * _1469;
    float _1483 = fma(_1461, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1479);
    float _1485 = fma(_1473, _1473, _1481);
    float _1487 = fma(_1477, _1477, _1485);
    float _1489 = rsqrt(_1487);
    float _1491 = sqrt(_1487);
    float _1493 = _1489 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1495 = _1473 * _1493;
    float _1497 = _1477 * _1493;
    float _1499 = _1495 * _1495;
    float _1501 = _1497 * _1497;
    float _1503 = _1499 + _1501;
    float _1505 = sqrt(_1503);
    bool _1507 = _1505 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1509 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1511 = _1505 + _1509;
    float _1513 = _1489;
    float _1515 = _1465;
    float _1517 = _1511;
    float _1519 = _1469;
    if (_1507)
    {
        float _1521 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1513 = _1521;
    }
    float _1523 = _1513;
    if (_1507)
    {
        float _1525 = rsqrt(_1503);
        _1515 = _1525;
    }
    float _1527 = _1515;
    if (_1507)
    {
        float _1529 = _1511 * _1523;
        _1517 = _1529;
    }
    float _1531 = _1517;
    float _1533 = _1459 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    if (_1507)
    {
        float _1535 = _1531 * 0.15915493667125701904296875;
        _1355 = _1535;
    }
    float _1537 = _1355;
    float _1539 = fma(_1461, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1533);
    float _1541 = _1477;
    float _1543 = _1537;
    if (_1507)
    {
        float _1545 = _1537 * 6.283185482025146484375;
        float _1547 = sin(_1545);
        _1541 = _1547;
    }
    float _1549 = _1541;
    float _1551 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1553 = fma(_1463, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1539);
    float _1555 = precise::max(0.0, _1551);
    float _1557 = _1523;
    float _1559 = _1555;
    if (_1507)
    {
        float _1561 = _1537 * 6.283185482025146484375;
        float _1563 = cos(_1561);
        _1557 = _1563;
    }
    float _1565 = _1557;
    float _1567 = _1553 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1569 = -_1493;
    float _1571 = -_1555;
    float _1573 = fma(_1469, _1569, _1571);
    float _1575 = _1573;
    if (_1507)
    {
        float _1577 = _1573 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1519 = _1577;
    }
    float _1579 = _1519;
    float _1581 = _1579;
    if (!_1507)
    {
        _1543 = _1499;
    }
    float _1583 = _1543;
    float _1585 = _1549;
    float _1587 = _1583;
    if (_1507)
    {
        float _1589 = fma(_1549, _1579, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1581 = _1589;
    }
    float _1591 = _1581;
    float _1593 = _1591;
    if (!_1507)
    {
        _1585 = _1495;
    }
    float _1595 = _1585;
    float _1597 = _1595;
    float _1599 = _1565;
    if (_1507)
    {
        float _1601 = _1565 + (-1.0);
        _1559 = _1601;
    }
    float _1603 = _1559;
    float _1605 = _1603;
    if (_1507)
    {
        float _1607 = _1527 * _1591;
        _1593 = _1607;
    }
    float _1609 = _1593;
    if (_1507)
    {
        float _1611 = _1603 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1605 = _1611;
    }
    float _1613 = _1605;
    float _1615 = _1613;
    if (_1507)
    {
        float _1617 = _1495 * _1609;
        _1597 = _1617;
    }
    float _1619 = _1597;
    float _1621 = _1459 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1623 = fma(_1307, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    if (_1507)
    {
        float _1625 = fma(_1573, _1565, _1613);
        _1575 = _1625;
    }
    float _1627 = _1575;
    if (!_1507)
    {
        _1599 = _1497;
    }
    float _1629 = _1599;
    float _1631 = _1629;
    if (_1507)
    {
        float _1633 = _1497 * _1609;
        _1631 = _1633;
    }
    float _1635 = _1631;
    if (_1507)
    {
        float _1637 = _1619 * _1619;
        _1587 = _1637;
    }
    float _1639 = _1587;
    if (!_1507)
    {
        _1615 = _1501;
    }
    float _1641 = _1615;
    float _1643 = fma(_1461, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1621);
    float _1645 = _1641;
    if (_1507)
    {
        float _1647 = _1635 * _1635;
        _1645 = _1647;
    }
    float _1649 = _1645;
    float _1651 = fma(_1627, _1627, _1639);
    float _1653 = fma(_1463, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1643);
    float _1655 = floor(_1623);
    float _1657 = _1651 + _1649;
    float _1659 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1661 = fma(_1491, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1659);
    float _1663 = precise::clamp(_1661, 0.0, 1.0);
    float _1665 = _1653 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1667 = -_1663;
    float _1669 = _1667 + 1.0;
    float _1671 = rsqrt(_1657);
    float _1673 = _1665 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1675 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _1677 = fma(_1293, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _1679 = -_1673;
    float _1681 = fma(_1679, _1675, 1.0);
    float _1683 = abs(_1669);
    float _1685 = log2(_1683);
    float _1687 = _1459 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1689 = -_1655;
    float _1691 = _1623 + _1689;
    float _1693 = _1567 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1695 = fma(_1461, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1687);
    float _1697 = _1671 * _1619;
    float _1699 = _1671 * _1627;
    float _1701 = _1671 * _1635;
    float _1703 = fma(_1463, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1695);
    float _1705 = _1697 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1707 = floor(_1677);
    float _1709 = _1699 + 1.0;
    float _1711 = _1703 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1713 = -_1705;
    float _1715 = fma(_1699, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1713);
    float _1717 = _1567 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1719 = _1685 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1721 = fma(_1711, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1693);
    float _1723 = -_1701;
    float _1725 = fma(_1723, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1715);
    float _1727 = fma(_1463, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1483);
    float _1729 = fma(_1711, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1717);
    float _1731 = exp2(_1719);
    float _1733 = fma(_1725, -0.5, 0.5);
    float _1735 = _1727 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1737 = fma(_1665, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1729);
    float _1739 = fma(_1725, 0.5, 0.5);
    float _1741 = _1567 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1743 = -_1707;
    float _1745 = _1677 + _1743;
    float _1747 = fma(_1735, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1737);
    float _1749 = log2(_1681);
    float _1751 = fma(_1711, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1741);
    float _1753 = fma(_1739, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1755 = fma(_1665, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1721);
    float _1757 = fma(_1665, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1751);
    float _1759 = fma(_1739, _1753, -0.212114393711090087890625);
    float _1761 = fma(_1735, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1755);
    float _1763 = 1.0 / _1747;
    float _1765 = fma(_1735, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1757);
    float _1767 = -_1699;
    float _1769 = fma(_1731, _1709, _1767);
    float _1771 = fma(_1739, _1759, 1.570728778839111328125);
    float _1773 = sqrt(_1733);
    float _1775 = _1749 * 0.693147182464599609375;
    float2 _5397 = float2(_1691, _1745);
    float _1777 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_5397, float2(0.0), isnan(_5397)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_5397, float2(0.0), isnan(_5397)), level(0.0)).x;
    float _1779 = _1775 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1781 = _1761 * _1763;
    float _1783 = _1765 * _1763;
    float _1785 = fma(_1769, 0.5, 0.5);
    float _1787 = fma(_1781, 0.5, 0.5);
    float _1789 = fma(_1783, -0.5, 0.5);
    float _1791 = _1773 * 0.636619746685028076171875;
    float3 _5427 = float3(_1787, _1789, _1779);
    float _1793 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_5427, float3(0.0), isnan(_5427)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_5427, float3(0.0), isnan(_5427)), level(0.0)).x;
    float _1795 = -_1771;
    float _1797 = fma(_1791, _1795, 1.0);
    float3 _5443 = float3(_1787, _1789, _1779);
    float4 _1800 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_5443, float3(0.0), isnan(_5443)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_5443, float3(0.0), isnan(_5443)), level(0.0)).xyzw;
    float _1802 = _1800.x;
    float _1804 = _1800.y;
    float _1806 = _1800.z;
    float _1808 = _1800.w;
    float2 _5459 = float2(_1797, _1785);
    float3 _1812 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_5459, float2(0.0), isnan(_5459)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_5459, float2(0.0), isnan(_5459)), level(0.0)).xyz;
    float _1814 = _1812.x;
    float _1816 = _1812.y;
    float _1818 = _1812.z;
    float _1820 = _1325 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    bool _1822 = _553 > 0.5;
    float _1824 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].w;
    float _1826 = fma(_1307, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1820);
    float _1828 = _1325 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    bool _1830 = _545 > 0.5;
    float _1832 = in.m_53.w;
    float _1834 = fma(_1293, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1826);
    float _1836 = fma(_1307, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1828);
    float _1838 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].z;
    float _1840 = _1834 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1842 = fma(_1293, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1836);
    float _1844 = in.m_65.x;
    int _1846 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1848 = _1846 != 0;
    float _1850 = _1842 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1852 = in.m_65.y;
    float _1854 = 1.0 / _1840;
    int _1856 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32;
    bool _1858 = _1856 != 0;
    float _1860 = _1850 + _1840;
    int _1862 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1864 = _1862 != 0;
    int _1866 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _1868 = _1866 != 0;
    bool _1870 = _1832 > 0.5;
    float _1872 = _1860 * _1854;
    float _1874 = _1872 * 0.5;
    int _1876 = 0;
    int _1878 = as_type<int>(_1824);
    float _1880 = _1747;
    if (_1868)
    {
        float _1882 = -_1844;
        float _1884 = _1882 + 1.0;
        _1876 = as_type<int>(_1884);
    }
    int _1886 = _1876;
    float _1888 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1890 = fma(_1874, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1888);
    float _1892 = -_1852;
    float _1894 = _1892 + 1.0;
    float _1896 = 1.0 / _1890;
    float _1898 = _1852;
    if (!_1864)
    {
        _763 = _1844;
    }
    float _1900 = _763;
    int _1902 = _1870 ? as_type<int>(_1894) : as_type<int>(_1852);
    out.m_67.x = 1.0;
    out.m_67.y = 1.0;
    out.m_67.z = 1.0;
    int _1904 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16;
    bool _1906 = _1904 != 0;
    float _1908 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1910 = _1896 * _1908;
    int _1912 = _1822 ? as_type<int>(_1894) : as_type<int>(_1852);
    int _1914 = 0;
    float _1916 = _1900;
    if (_1906)
    {
        float _1918 = -_1844;
        float _1920 = _1918 + 1.0;
        _1914 = as_type<int>(_1920);
    }
    int _1922 = _1914;
    float _1924 = abs(_1910);
    float _1926 = log2(_1924);
    bool _1928 = _1910 <= 8000.0;
    bool _1930 = isnan(_1910);
    bool _1932 = _1928 || _1930;
    bool _1934 = isnan(8000.0);
    bool _1936 = _1932 || _1934;
    float _1938 = float(_1936);
    float _1940 = _1926 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _1942 = _1848 ? as_type<float>(_1912) : _1852;
    float _1944 = in.m_69.x;
    float _1946 = in.m_69.y;
    float _1948 = in.m_69.z;
    float _1950 = in.m_69.w;
    int _1952 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _1954 = _1952 != 0;
    float _1956 = _1838 * (*spvDescriptorSet0.vp_c9)._m0[90].x;
    float _1958 = exp2(_1940);
    float _1960 = _1954 ? as_type<float>(_1902) : _1852;
    bool _1962 = _1954;
    if (_1858)
    {
        float _1964 = _1830 ? _1894 : _1852;
        _1898 = _1964;
    }
    float _1966 = _1898;
    float _1968 = _1824 * (*spvDescriptorSet0.vp_c9)._m0[90].y;
    float _1970 = _1966;
    if (_1864)
    {
        float _1972 = -_1844;
        float _1974 = _1972 + 1.0;
        _1878 = as_type<int>(_1974);
    }
    int _1976 = _1878;
    float _1978 = as_type<float>(_1976);
    if (_1864)
    {
        bool _1980 = _200 > 0.5;
        _1962 = _1980;
    }
    bool _1982 = _1962;
    float _1984 = fma(_1968, _1966, -0.5);
    if (!_1868)
    {
        _1970 = _1844;
    }
    float _1986 = _1970;
    float _1988 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _1990 = _1986;
    if (_1864)
    {
        float _1992 = _1982 ? as_type<float>(_1976) : _1844;
        _1916 = _1992;
    }
    float _1994 = _1916;
    if (!_1906)
    {
        _1978 = _1844;
    }
    float _1996 = _1978;
    float _1998 = _1996;
    if (_1868)
    {
        float _2000 = _1830 ? as_type<float>(_1886) : _1844;
        _1990 = _2000;
    }
    float _2002 = _1990;
    float _2004 = _1942 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    if (_1906)
    {
        float _2006 = _1822 ? as_type<float>(_1922) : _1844;
        _1998 = _2006;
    }
    float _2008 = _1998;
    float _2010 = -_1083;
    float _2012 = fma(_1079, _1984, _2010);
    float _2014 = fma(_1958, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _2016 = precise::clamp(_2014, 0.0, 1.0);
    float _2018 = _1249 * _1946;
    float _2020 = fma(_1956, _2008, -0.5);
    float _2022 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _2024 = fma(_2016, -2.0, 3.0);
    float _2026 = _2016 * _2016;
    float _2028 = -_1946;
    float _2030 = _1243 * _2028;
    float _2032 = fma(_1267, _1944, _2018);
    float _2034 = fma(_1057, _2020, _1063);
    float _2036 = _2026 * _2024;
    float _2038 = fma(_1251, _1944, _2030);
    float _2040 = fma(_1265, _1948, _2032);
    float _2042 = in.m_71.x;
    float _2044 = in.m_71.y;
    float _2046 = in.m_71.z;
    bool _2048 = _1215 != 0.0;
    bool _2050 = isnan(_1215);
    bool _2052 = _2048 || _2050;
    bool _2054 = isnan(0.0);
    bool _2056 = _2052 || _2054;
    float _2058 = fma(_1255, _1948, _2038);
    float _2060 = _2040 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _2062 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _2064 = _2040 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    bool _2066 = _559 == 0.0;
    bool _2068 = !_2056;
    bool _2070 = _2066 && _2068;
    float _2072 = _2040 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _2074 = fma(_2058, (*spvDescriptorSet0.vp_c10)._m0[8].x, _2060);
    float _2076 = fma(_2058, (*spvDescriptorSet0.vp_c10)._m0[9].x, _2064);
    float _2078 = _1253 * _1946;
    bool _2080 = _1005 == 0.0;
    bool _2082 = _2080 && _2070;
    float _2084 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _2086 = fma(_2058, (*spvDescriptorSet0.vp_c10)._m0[10].x, _2072);
    float _2088 = _2004 * _1988;
    float _2090 = _1960 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _2092 = fma(_1261, _1944, _2078);
    float _2094 = _1994 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _2096 = _2002 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _2098 = _2090 * _2022;
    float _2100 = fma(_1271, _1948, _2092);
    float _2102 = _2094 * _2062;
    float _2104 = _2012 + 0.5;
    float _2106 = _2034 + 0.5;
    float _2108 = fma(_2100, (*spvDescriptorSet0.vp_c10)._m0[9].z, _2076);
    float _2110 = _2076;
    float _2112 = _2074;
    float _2114 = _2090;
    float _2116 = _2036;
    float _2118 = _2042;
    if (_2082)
    {
        _2110 = _2042;
    }
    float _2120 = _2110;
    float _2122 = fma(_2100, (*spvDescriptorSet0.vp_c10)._m0[8].z, _2074);
    float _2124 = fma(_2100, (*spvDescriptorSet0.vp_c10)._m0[10].z, _2086);
    float _2126 = _2096 * _2084;
    float _2128 = -_2036;
    float _2130 = _2128 + 1.0;
    float _2132 = _2120;
    float _2134 = _2130;
    if (_2082)
    {
        _2112 = _2044;
    }
    float _2136 = _2112;
    out.m_73.x = _2106;
    out.m_73.y = _2104;
    float _2138 = _2136;
    if (_2082)
    {
        _2114 = _2046;
    }
    float _2140 = _2114;
    float _2142 = fma(_2130, (*spvDescriptorSet0.vp_c15)._m0[654].w, _2036);
    float _2144 = _2140;
    if (_2082)
    {
        _2116 = _2120;
    }
    float _2146 = _2116;
    out.m_75.x = _2102;
    out.m_75.y = _2088;
    out.m_75.z = _2126;
    out.m_75.w = _2098;
    float _2148 = _2146;
    if (!_2082)
    {
        _2132 = _2042;
    }
    float _2150 = _2132;
    if (_2082)
    {
        _2134 = _2136;
    }
    float _2152 = _2134;
    out.m_77.x = _2122;
    out.m_77.y = _2108;
    out.m_77.z = _2124;
    float _2154 = _2152;
    if (!_2082)
    {
        _2138 = _2044;
    }
    float _2156 = _2138;
    if (!_2082)
    {
        float _2158 = fma(_559, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2150);
        _2148 = _2158;
    }
    float _2160 = _2148;
    if (_2082)
    {
        _2118 = _2140;
    }
    float _2162 = _2118;
    float _2164 = in.m_79.x;
    float _2166 = _2162;
    if (!_2082)
    {
        _2144 = _2046;
    }
    float _2168 = _2144;
    float _2170 = _1944 * _2156;
    if (!_2082)
    {
        float _2172 = fma(_1215, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2156);
        _2154 = _2172;
    }
    float _2174 = _2154;
    float _2176 = _1948 * _2150;
    float _2178 = _1946 * _2168;
    float _2180 = -_2170;
    float _2182 = fma(_1946, _2150, _2180);
    float _2184 = _1249 * _2174;
    float _2186 = -_2176;
    float _2188 = fma(_1944, _2168, _2186);
    float _2190 = -_2178;
    float _2192 = fma(_1948, _2156, _2190);
    float _2194 = _1567 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _2196 = -_2174;
    float _2198 = _1243 * _2196;
    float _2200 = _2188 * _1950;
    float _2202 = _2192 * _1950;
    float _2204 = fma(_1267, _2160, _2184);
    float _2206 = _2182 * _1950;
    float _2208 = _1249 * _2200;
    float _2210 = -_2200;
    float _2212 = _1243 * _2210;
    float _2214 = _1685 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _2216 = fma(_1711, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2194);
    float _2218 = fma(_1267, _2202, _2208);
    float _2220 = _1253 * _2174;
    float _2222 = _1253 * _2200;
    float _2224 = fma(_1251, _2202, _2212);
    float _2226 = fma(_1265, _2206, _2218);
    if (!_2082)
    {
        float _2228 = fma(_1005, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2168);
        _2166 = _2228;
    }
    float _2230 = _2166;
    float _2232 = fma(_1665, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2216);
    float _2234 = exp2(_2214);
    float _2236 = fma(_1261, _2202, _2222);
    float _2238 = fma(_1255, _2206, _2224);
    float _2240 = _2226 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _2242 = _2226 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _2244 = fma(_1251, _2160, _2198);
    float _2246 = fma(_1261, _2160, _2220);
    float _2248 = fma(_1265, _2230, _2204);
    float _2250 = fma(_1735, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2232);
    float _2252 = fma(_1271, _2206, _2236);
    float _2254 = fma(_2238, (*spvDescriptorSet0.vp_c10)._m0[8].x, _2240);
    float _2256 = fma(_2238, (*spvDescriptorSet0.vp_c10)._m0[9].x, _2242);
    float _2258 = fma(_1255, _2230, _2244);
    float _2260 = fma(_1271, _2230, _2246);
    float _2262 = _2248 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _2264 = _2250 + _1747;
    float _2266 = _2248 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _2268 = fma(_2252, (*spvDescriptorSet0.vp_c10)._m0[8].z, _2254);
    float _2270 = _2248 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _2272 = fma(_2252, (*spvDescriptorSet0.vp_c10)._m0[9].z, _2256);
    float _2274 = _1938 * _2142;
    float _2276 = fma(_2258, (*spvDescriptorSet0.vp_c10)._m0[8].x, _2262);
    float _2278 = _2264 * 0.5;
    float _2280 = fma(_2258, (*spvDescriptorSet0.vp_c10)._m0[9].x, _2266);
    float _2282 = fma(_2258, (*spvDescriptorSet0.vp_c10)._m0[10].x, _2270);
    float _2284 = fma(_2260, (*spvDescriptorSet0.vp_c10)._m0[8].z, _2276);
    float _2286 = _2274 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _2288 = -_2234;
    float _2290 = _2288 + 1.0;
    float _2292 = fma(_2260, (*spvDescriptorSet0.vp_c10)._m0[9].z, _2280);
    float _2294 = fma(_2260, (*spvDescriptorSet0.vp_c10)._m0[10].z, _2282);
    float _2296 = _2290 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _2298 = _2226 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    out.m_81.x = _2284;
    out.m_81.y = _2292;
    out.m_81.z = _2294;
    bool _2300 = _1491 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _2302 = isnan(_1491);
    bool _2304 = _2300 || _2302;
    bool _2306 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _2308 = _2304 || _2306;
    float _2310 = fma(_2238, (*spvDescriptorSet0.vp_c10)._m0[10].x, _2298);
    out.gl_Position.x = _1761;
    out.gl_Position.y = _1765;
    out.gl_Position.z = _2250;
    out.gl_Position.w = _1747;
    float _2312 = fma(_2252, (*spvDescriptorSet0.vp_c10)._m0[10].z, _2310);
    out.m_83.z = _2278;
    out.m_83.w = _1747;
    out.m_85.x = _2268;
    out.m_85.y = _2272;
    out.m_85.z = _2312;
    float _2314 = -_2296;
    float _2316 = _2314 + 1.0;
    float _2318 = _2250;
    float _2320 = _2272;
    float _2322 = _2268;
    float _2324 = _2316;
    if (!_2308)
    {
        _1880 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _2326 = _1880;
    float _2328 = _2326;
    float _2330 = _2326;
    if (!_2308)
    {
        _2318 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _2332 = _2318;
    float _2334 = _2332;
    float _2336 = _2332;
    if (!_2308)
    {
        _2320 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _2338 = _2320;
    float _2340 = _2338;
    float _2342 = _2338;
    if (!_2308)
    {
        _2322 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _2344 = _2322;
    float _2346 = -_1777;
    float _2348 = _2346 + 1.0;
    float _2350 = _2348 * _2286;
    float _2352 = precise::clamp(_2350, 0.0, 1.0);
    float _2354 = -_2352;
    float _2356 = fma(_2354, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _2358 = _2356 * _2164;
    float _2360 = _2296 * _1793;
    float _2362 = _2358 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _2364 = _1808 * _2360;
    float _2366 = _1808 * _2316;
    out.m_87.x = _2362;
    float _2368 = _2364;
    float _2370 = _2344;
    float _2372 = _2344;
    if (!_2308)
    {
        _2324 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _2374 = _2324;
    float _2376 = _1818 * _2360;
    float _2378 = fma(_1814, _2364, _1802);
    float _2380 = fma(_1816, _2364, _1804);
    float _2382 = _2374;
    float _2384 = _2374;
    if (!_2308)
    {
        _2368 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _2386 = _2368;
    float _2388 = fma(_1808, _2376, _1806);
    out.m_89.x = _2378;
    out.m_89.y = _2380;
    out.m_89.z = _2388;
    out.m_89.w = _2366;
    bool _2390 = !_2308;
    float _2392 = _2386;
    float _2394 = _2386;
    if (!_2390)
    {
        bool _2396 = _1491 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _2398 = isnan(_1491);
        bool _2400 = _2396 || _2398;
        bool _2402 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _2404 = _2400 || _2402;
        if (!_2404)
        {
            float _2406 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2408 = _1491 + _2406;
            float _2410 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2412 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _2410;
            float _2414 = 1.0 / _2412;
            float _2416 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _2418 = _2416 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _2420 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _2422 = _2420 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _2424 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _2426 = _2424 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _2428 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _2430 = _2428 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _2432 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _2434 = _2432 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _2436 = _2408 * _2414;
            float _2438 = precise::clamp(_2436, 0.0, 1.0);
            float _2440 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _2442 = _2440 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _2444 = fma(_2438, _2418, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _2446 = fma(_2438, _2442, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _2448 = fma(_2438, _2422, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _2450 = fma(_2438, _2426, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _2452 = fma(_2438, _2430, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _2454 = fma(_2438, _2434, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _2372 = _2446;
            _2394 = _2452;
            _2342 = _2444;
            _2336 = _2450;
            _2330 = _2448;
            _2384 = _2454;
            _2456 = true;
        }
        else
        {
            bool _2458 = _1491 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _2460 = isnan(_1491);
            bool _2462 = _2458 || _2460;
            bool _2464 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _2466 = _2462 || _2464;
            if (!_2466)
            {
                _2340 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _2468 = _2340;
            _2342 = _2468;
            if (!_2466)
            {
                _2370 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _2470 = _2370;
            _2372 = _2470;
            if (!_2466)
            {
                _2328 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _2472 = _2328;
            _2330 = _2472;
            if (!_2466)
            {
                _2334 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _2474 = _2334;
            _2336 = _2474;
            if (!_2466)
            {
                _2392 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _2476 = _2392;
            _2394 = _2476;
            if (!_2466)
            {
                _2382 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _2478 = _2382;
            bool _2480 = !_2466;
            _2384 = _2478;
            if (!_2480)
            {
                bool _2482 = _1491 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _2484 = isnan(_1491);
                bool _2486 = _2482 || _2484;
                bool _2488 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _2490 = _2486 || _2488;
                if (!_2490)
                {
                    float _2492 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2494 = _1491 + _2492;
                    float _2496 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2498 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _2496;
                    float _2500 = 1.0 / _2498;
                    float _2502 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _2504 = _2502 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _2506 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _2508 = _2506 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _2510 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _2512 = _2510 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _2514 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _2516 = _2514 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _2518 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _2520 = _2518 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _2522 = _2494 * _2500;
                    float _2524 = precise::clamp(_2522, 0.0, 1.0);
                    float _2526 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _2528 = _2526 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _2530 = fma(_2524, _2504, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _2532 = fma(_2524, _2528, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _2534 = fma(_2524, _2508, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _2536 = fma(_2524, _2512, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _2538 = fma(_2524, _2516, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _2540 = fma(_2524, _2520, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _2372 = _2532;
                    _2394 = _2538;
                    _2342 = _2530;
                    _2336 = _2536;
                    _2330 = _2534;
                    _2384 = _2540;
                    _2456 = true;
                }
                else
                {
                    _2372 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _2394 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _2342 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _2336 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _2330 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _2384 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _2456 = false;
    float _2542 = _2372;
    float _2544 = _2394;
    float _2546 = _2342;
    float _2548 = _2336;
    float _2550 = _2330;
    float _2552 = _2384;
    float _2554 = fma(_2292, -0.5, 0.5);
    float _2556 = precise::clamp(_2554, 0.0, 1.0);
    float _2558 = -_2542;
    float _2560 = _2558 + _2544;
    float _2562 = -_2546;
    float _2564 = _2562 + _2548;
    float _2566 = -_2550;
    float _2568 = _2566 + _2552;
    bool _2570 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2572 = fma(_2556, _2560, _2542);
    float _2574 = fma(_2556, _2564, _2546);
    float _2576 = fma(_2556, _2568, _2550);
    float _2578 = _2572 * 0.586610972881317138671875;
    out.m_91.x = 0.0;
    float _2580 = fma(_2574, 0.298911988735198974609375, _2578);
    float _2582 = fma(_2576, 0.114477999508380889892578125, _2580);
    float _2584 = -_2582;
    float _2586 = _2574 + _2584;
    float _2588 = -_2582;
    float _2590 = _2572 + _2588;
    float _2592 = -_2582;
    float _2594 = _2576 + _2592;
    float _2596 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2598 = fma(_2586, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2582);
    float _2600 = fma(_2590, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2582);
    float _2602 = fma(_2594, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2582);
    out.m_49.x = _2596;
    out.m_93.x = _2598;
    out.m_93.y = _2600;
    out.m_93.z = _2602;
    if (!_2570)
    {
        return out;
    }
    float _2604 = -_1459;
    float _2606 = _2604 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
    float _2608 = -_1461;
    float _2610 = _2608 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
    float _2612 = -_1463;
    float _2614 = _2612 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
    float _2616 = _2606 * _2606;
    float _2618 = fma(_2610, _2610, _2616);
    float _2620 = fma(_2614, _2614, _2618);
    float _2622 = sqrt(_2620);
    float _2624 = rsqrt(_2620);
    float _2626 = -_2622;
    float _2628 = _2626 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2630 = _2628 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
    float _2632 = precise::clamp(_2630, 0.0, 1.0);
    float _2634 = _2610 * _2624;
    float _2636 = _2606 * _2624;
    float _2638 = abs(_2632);
    float _2640 = log2(_2638);
    float _2642 = _2614 * _2624;
    float _2644 = _2634 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
    float _2646 = _2292 * _2636;
    float _2648 = -_2636;
    float _2650 = -_2644;
    float _2652 = fma(_2648, (*spvDescriptorSet0.vp_c15)._m0[656].y, _2650);
    float _2654 = fma(_2284, _2634, _2646);
    float _2656 = -_2642;
    float _2658 = fma(_2656, (*spvDescriptorSet0.vp_c15)._m0[656].z, _2652);
    float _2660 = fma(_2294, _2642, _2654);
    float _2662 = precise::clamp(_2660, 0.0, 1.0);
    float _2664 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
    float _2666 = _2658 + _2664;
    float _2668 = _2640 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
    float _2670 = _2666 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
    float _2672 = precise::clamp(_2670, 0.0, 1.0);
    float _2674 = exp2(_2668);
    float _2676 = _2674 * _2672;
    float _2678 = _2662 * _2676;
    float _2680 = _2678 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
    float _2682 = _2678 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
    float _2684 = _2678 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
    out.m_91.x = _2680;
    out.m_91.y = _2682;
    out.m_91.z = _2684;
    return out;
}


struct dm_geometry_capture { device uint* dst; uint4 info; uint stride; short slot[144]; };
static inline void dm_cw(constant dm_geometry_capture& g, device uint* p, uint k, uint v) { short s = g.slot[k]; if (s >= 0) p[s] = v; }
vertex void main0_gs(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint dm_vid [[vertex_id]], uint dm_iid [[instance_id]], constant dm_geometry_capture& dm_gs [[buffer(13)]])
{
    uint4 dm_ci = dm_gs.info; device uint* dm_capture = dm_gs.dst;
    if (dm_vid - dm_ci.x >= dm_ci.y || dm_iid - dm_ci.z >= dm_ci.w) return;
    device uint* dm_p = dm_capture + ((ulong(dm_iid - dm_ci.z) * dm_ci.y + dm_vid - dm_ci.x) * dm_gs.stride);

    main0_out out = {};
    out.m_57 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_55 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_49 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_93 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_67 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_75 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_83 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_73 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_85 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_81 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_77 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_91 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_87 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_89 = float4(0.0, 0.0, 0.0, 1.0);
    bool _2456 = false;
    bool _533 = false;
    bool _190 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _107 = in.m_46.w;
    float _109 = trunc(_107);
    int _112 = int(_109);
    bool _116 = _112 >= 1;
    float _118 = 0.0;
    if (!_116)
    {
        _118 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _120 = _118;
    float _122 = _120;
    if (!_116)
    {
        out.m_49.x = 0.0;
    }
    int _124 = 0;
    if (!_116)
    {
        float _126 = _120 * 5.0;
        _124 = as_type<int>(_126);
    }
    int _128 = _124;
    int _130 = _128;
    if (!_116)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2741 = as_type<float>(_128);
        out.gl_Position.z = _2741;
    }
    if (!_116)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_57.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_57.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_57.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_57.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_55.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_55.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_55.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_55.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_49.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_49.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_49.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_49.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_93.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_93.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_93.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_93.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_91.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_91.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_91.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_91.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _132 = in.m_51.w;
    bool _134 = _132 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _136 = isnan(_132);
    bool _138 = _134 || _136;
    bool _140 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _142 = _138 || _140;
    float _144 = -_132;
    float _146 = _144 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _148 = 0.0;
    float _150 = _146;
    if (_142)
    {
        float _152 = float(_112);
        _148 = _152;
    }
    float _154 = _148;
    bool _156 = _146 >= _154;
    bool _158 = !_142;
    bool _160 = _156 || _158;
    if (_160)
    {
        _122 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _162 = _122;
    if (_160)
    {
        out.m_49.x = 0.0;
    }
    if (_160)
    {
        float _164 = _162 * 5.0;
        _130 = as_type<int>(_164);
    }
    int _166 = _130;
    if (_160)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2810 = as_type<float>(_166);
        out.gl_Position.z = _2810;
    }
    if (_160)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_57.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_57.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_57.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_57.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_55.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_55.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_55.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_55.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_49.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_49.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_49.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_49.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_93.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_93.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_93.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_93.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_91.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_91.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_91.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_91.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    bool _168 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    bool _170 = !_168;
    float _188;
    if (!_170)
    {
        float _172 = in.m_53.x;
        float _174 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _176 = _172 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _178 = fma(_176, (*spvDescriptorSet0.vp_c9)._m0[12].x, _146);
        float _180 = _178 * _174;
        float _182 = floor(_180);
        float _184 = -_182;
        float _186 = _180 + _184;
        _188 = _186;
        _190 = true;
    }
    else
    {
        float _192 = float(_112);
        float _194 = 1.0 / _192;
        float _196 = _146 * _194;
        _188 = _196;
    }
    _190 = false;
    float _198 = _188;
    float _200 = in.m_53.x;
    float _202 = float(as_type<int>((*spvDescriptorSet0.vp_c9)._m0[8].x));
    float _204 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _206 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _204;
    float _208 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _210 = _208 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _212 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _214 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _212;
    float _216 = 1.0 / _206;
    float _218 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _220 = _218 + (*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _222 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _224 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _226 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _228 = 1.0 / _214;
    float _230 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _232 = _198 + _230;
    float _234 = (*spvDescriptorSet0.vp_c9)._m0[131].x * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _236 = _222 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _238 = _202 * _200;
    float _240 = _224 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _242 = _226 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _244 = 1.0 / _210;
    float _246 = _232 * _216;
    float _248 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _250 = _198 + _248;
    bool _252 = _198 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _254 = isnan(_198);
    bool _256 = _252 || _254;
    bool _258 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _260 = _256 || _258;
    float _262 = float(_260);
    out.m_55.x = _236;
    out.m_55.y = _240;
    out.m_55.z = _242;
    out.m_55.w = _234;
    float _264 = trunc(_238);
    int _266 = int(_264);
    float _268 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _270 = _198 + _268;
    bool _272 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[14].x;
    float _274 = _270 * _228;
    bool _276 = _198 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _278 = isnan(_198);
    bool _280 = _276 || _278;
    bool _282 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _284 = _280 || _282;
    float _286 = float(_284);
    float _288 = 1.0 / _220;
    float _290 = _250 * _244;
    bool _292 = _198 >= (*spvDescriptorSet0.vp_c9)._m0[147].w;
    bool _294 = isnan(_198);
    bool _296 = _292 || _294;
    bool _298 = isnan((*spvDescriptorSet0.vp_c9)._m0[147].w);
    bool _300 = _296 || _298;
    float _302 = float(_300);
    float _304 = -_286;
    float _306 = _304 + 1.0;
    float _308 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _310 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _308;
    bool _312 = _198 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _314 = isnan(_198);
    bool _316 = _312 || _314;
    bool _318 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _320 = _316 || _318;
    float _322 = float(_320);
    float _324 = -_302;
    float _326 = _324 + 1.0;
    int _328 = _266 << 4;
    int _330 = _328 + 1712;
    float _332 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _334 = _198 + _332;
    float _336 = _262 * _306;
    float _338 = _286 * _326;
    uint _341 = uint(int(uint(_330) >> uint(2)));
    uint _343 = uint(int(uint(int(_341)) >> uint(2)));
    int _345 = int(_341) & 3;
    float _347 = (*spvDescriptorSet0.vp_c9)._m0[int(_343)][_345];
    int _349 = int(_341) + 1;
    uint _351 = uint(int(uint(_349) >> uint(2)));
    int _353 = _349 & 3;
    float _355 = (*spvDescriptorSet0.vp_c9)._m0[int(_351)][_353];
    float _357 = -_262;
    float _359 = _357 + 1.0;
    float _361 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _363 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _361;
    float _365 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _367 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _365;
    float _369 = -_322;
    float _371 = _369 + 1.0;
    float _373 = _334 * _288;
    float _375 = _322 * _359;
    float _377 = fma(_363, _246, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    int _379 = _330 + 8;
    uint _381 = uint(int(uint(_379) >> uint(2)));
    uint _383 = uint(int(uint(int(_381)) >> uint(2)));
    int _385 = int(_381) & 3;
    float _387 = (*spvDescriptorSet0.vp_c9)._m0[int(_383)][_385];
    float _389 = fma(_367, _246, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _391 = fma(_310, _246, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _393 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _395 = _393 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _397 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _399 = _397 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _401 = fma(_395, _290, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    bool _403 = _198 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _405 = isnan(_198);
    bool _407 = _403 || _405;
    bool _409 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _411 = _407 || _409;
    float _413 = float(_411);
    float _415 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _417 = _415 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _419 = fma(_399, _290, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    float _421 = _413 * _371;
    float _423 = fma(_417, _290, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _425 = -_413;
    float _427 = _425 + 1.0;
    float _429 = _391 * _421;
    float _431 = _377 * _421;
    float _433 = _389 * _421;
    float _435 = -(*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _437 = (*spvDescriptorSet0.vp_c9)._m0[146].z + _435;
    float _439 = fma(_427, (*spvDescriptorSet0.vp_c9)._m0[143].z, _429);
    float _441 = fma(_437, _274, (*spvDescriptorSet0.vp_c9)._m0[145].z);
    float _443 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _445 = _347 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _447 = _355 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _449 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _451 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _449;
    float _453 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _455 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _453;
    float _457 = fma(_451, _274, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _459 = fma(_455, _274, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _461 = _387 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _463 = _445 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _465 = _447 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _467 = fma(_427, (*spvDescriptorSet0.vp_c9)._m0[143].x, _431);
    float _469 = _461 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _471 = fma(_427, (*spvDescriptorSet0.vp_c9)._m0[143].y, _433);
    float _473 = -(*spvDescriptorSet0.vp_c9)._m0[146].z;
    float _475 = _473 + (*spvDescriptorSet0.vp_c9)._m0[147].z;
    float _477 = fma(_423, _375, _467);
    float _479 = -(*spvDescriptorSet0.vp_c9)._m0[146].x;
    float _481 = _479 + (*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _483 = fma(_401, _375, _471);
    float _485 = fma(_419, _375, _439);
    float _487 = -(*spvDescriptorSet0.vp_c9)._m0[146].y;
    float _489 = _487 + (*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _491 = fma(_481, _373, (*spvDescriptorSet0.vp_c9)._m0[146].x);
    float _493 = fma(_457, _336, _477);
    float _495 = fma(_459, _336, _483);
    float _497 = fma(_489, _373, (*spvDescriptorSet0.vp_c9)._m0[146].y);
    float _499 = fma(_475, _373, (*spvDescriptorSet0.vp_c9)._m0[146].z);
    float _501 = fma(_441, _336, _485);
    out.m_57.x = _463;
    out.m_57.y = _465;
    out.m_57.z = _469;
    out.m_57.w = _443;
    float _503 = fma(_491, _338, _493);
    float _505 = fma(_499, _338, _501);
    float _507 = fma(_497, _338, _495);
    float _509 = fma(_302, (*spvDescriptorSet0.vp_c9)._m0[147].x, _503);
    float _511 = fma(_302, (*spvDescriptorSet0.vp_c9)._m0[147].z, _505);
    float _513 = fma(_302, (*spvDescriptorSet0.vp_c9)._m0[147].y, _507);
    bool _515 = !_272;
    float _531;
    if (!_515)
    {
        float _517 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[14].x;
        float _519 = _200 * (*spvDescriptorSet0.vp_c9)._m0[15].x;
        float _521 = fma(_519, (*spvDescriptorSet0.vp_c9)._m0[14].x, _146);
        float _523 = _521 * _517;
        float _525 = floor(_523);
        float _527 = -_525;
        float _529 = _523 + _527;
        _531 = _529;
        _533 = true;
    }
    else
    {
        float _535 = float(_112);
        float _537 = 1.0 / _535;
        float _539 = _146 * _537;
        _531 = _539;
    }
    _533 = false;
    float _541 = _531;
    float _543 = _200 * 2.0;
    float _545 = in.m_53.z;
    float _547 = floor(_543);
    int _549 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _551 = _549 != 0;
    float _553 = in.m_53.y;
    float _555 = -(*spvDescriptorSet0.vp_c9)._m0[159].w;
    float _557 = _555 + (*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _559 = in.m_59.x;
    int _561 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _563 = _561 != 0;
    int _565 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _567 = _565 != 0;
    int _569 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _571 = _569 != 0;
    float _573 = 1.0 / _557;
    float _575 = -(*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _577 = _575 + (*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _579 = -(*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _581 = _579 + (*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _583 = 1.0 / _577;
    float _585 = -(*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _587 = _585 + (*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _589 = -(*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _591 = _589 + (*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _593 = 1.0 / _581;
    float _595 = -(*spvDescriptorSet0.vp_c9)._m0[165].x;
    float _597 = (*spvDescriptorSet0.vp_c9)._m0[166].x + _595;
    bool _599 = _547 > 0.0;
    float _601 = -(*spvDescriptorSet0.vp_c9)._m0[163].x;
    float _603 = (*spvDescriptorSet0.vp_c9)._m0[164].x + _601;
    bool _605 = _547 >= 0.0;
    bool _607 = isnan(_547);
    bool _609 = _605 || _607;
    bool _611 = isnan(0.0);
    bool _613 = _609 || _611;
    float _615 = -(*spvDescriptorSet0.vp_c9)._m0[164].x;
    float _617 = _615 + (*spvDescriptorSet0.vp_c9)._m0[165].x;
    float _619 = 1.0 / _587;
    float _621 = -(*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _623 = _621 + (*spvDescriptorSet0.vp_c9)._m0[166].w;
    float _625 = _545 * 2.0;
    bool _627 = _541 >= (*spvDescriptorSet0.vp_c9)._m0[163].w;
    bool _629 = isnan(_541);
    bool _631 = _627 || _629;
    bool _633 = isnan((*spvDescriptorSet0.vp_c9)._m0[163].w);
    bool _635 = _631 || _633;
    float _637 = float(_635);
    int _639 = _613 ? 0 : 1;
    bool _641 = _541 >= (*spvDescriptorSet0.vp_c9)._m0[161].w;
    bool _643 = isnan(_541);
    bool _645 = _641 || _643;
    bool _647 = isnan((*spvDescriptorSet0.vp_c9)._m0[161].w);
    bool _649 = _645 || _647;
    float _651 = float(_649);
    float _653 = 1.0 / _623;
    float _655 = -(*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _657 = _655 + (*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _659 = -(*spvDescriptorSet0.vp_c9)._m0[159].x;
    float _661 = (*spvDescriptorSet0.vp_c9)._m0[160].x + _659;
    float _663 = _603 * _593;
    bool _665 = _541 >= (*spvDescriptorSet0.vp_c9)._m0[164].w;
    bool _667 = isnan(_541);
    bool _669 = _665 || _667;
    bool _671 = isnan((*spvDescriptorSet0.vp_c9)._m0[164].w);
    bool _673 = _669 || _671;
    float _675 = float(_673);
    float _677 = -_637;
    float _679 = _677 + 1.0;
    float _681 = 1.0 / _591;
    float _683 = 1.0 / _657;
    float _685 = _597 * _653;
    float _687 = _553 * 2.0;
    float _689 = _661 * _573;
    float _691 = -(*spvDescriptorSet0.vp_c9)._m0[160].x;
    float _693 = _691 + (*spvDescriptorSet0.vp_c9)._m0[161].x;
    float _695 = -(*spvDescriptorSet0.vp_c9)._m0[161].x;
    float _697 = (*spvDescriptorSet0.vp_c9)._m0[162].x + _695;
    float _699 = -(*spvDescriptorSet0.vp_c9)._m0[162].x;
    float _701 = _699 + (*spvDescriptorSet0.vp_c9)._m0[163].x;
    float _703 = floor(_625);
    float _705 = _697 * _619;
    float _707 = _693 * _583;
    float _709 = _701 * _681;
    float _711 = _200 + _553;
    float _713 = _553 + _545;
    bool _715 = _541 >= (*spvDescriptorSet0.vp_c9)._m0[166].w;
    bool _717 = isnan(_541);
    bool _719 = _715 || _717;
    bool _721 = isnan((*spvDescriptorSet0.vp_c9)._m0[166].w);
    bool _723 = _719 || _721;
    float _725 = float(_723);
    float _727 = floor(_687);
    float _729 = _711 + (-1.0);
    float _731 = _713 + (-1.0);
    float _733 = _617 * _683;
    bool _735 = _541 >= (*spvDescriptorSet0.vp_c9)._m0[165].w;
    bool _737 = isnan(_541);
    bool _739 = _735 || _737;
    bool _741 = isnan((*spvDescriptorSet0.vp_c9)._m0[165].w);
    bool _743 = _739 || _741;
    float _745 = float(_743);
    float _747 = -_725;
    float _749 = _747 + 1.0;
    float _751 = fma(_731, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _753 = fma(_729, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _755 = -(*spvDescriptorSet0.vp_c9)._m0[159].w;
    float _757 = _541 + _755;
    float _759 = _657;
    float _761 = _731;
    float _763 = _553;
    if (_551)
    {
        _759 = _200;
    }
    float _765 = _759;
    float _767 = _745 * _749;
    float _769 = _765;
    if (_551)
    {
        _761 = _553;
    }
    float _771 = _761;
    float _773 = -_745;
    float _775 = _773 + 1.0;
    float _777 = _771;
    if (!_551)
    {
        _769 = _545;
    }
    float _779 = _769;
    if (!_551)
    {
        _777 = _200;
    }
    float _781 = _777;
    float _783 = _675 * _775;
    bool _785 = !_567;
    int _787 = _785 ? 0 : 1;
    float _789 = -_675;
    float _791 = _789 + 1.0;
    bool _793 = _703 > 0.0;
    float _795 = _781 * (*spvDescriptorSet0.vp_c9)._m0[87].y;
    bool _797 = _703 >= 0.0;
    bool _799 = isnan(_703);
    bool _801 = _797 || _799;
    bool _803 = isnan(0.0);
    bool _805 = _801 || _803;
    float _807 = fma(_689, _757, (*spvDescriptorSet0.vp_c9)._m0[159].x);
    bool _809 = _727 > 0.0;
    float _811 = -(*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _813 = _541 + _811;
    bool _815 = _727 >= 0.0;
    bool _817 = isnan(_727);
    bool _819 = _815 || _817;
    bool _821 = isnan(0.0);
    bool _823 = _819 || _821;
    float _825 = -(*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _827 = _541 + _825;
    bool _829 = _541 >= (*spvDescriptorSet0.vp_c9)._m0[162].w;
    bool _831 = isnan(_541);
    bool _833 = _829 || _831;
    bool _835 = isnan((*spvDescriptorSet0.vp_c9)._m0[162].w);
    bool _837 = _833 || _835;
    float _839 = float(_837);
    float _841 = fma(_705, _813, (*spvDescriptorSet0.vp_c9)._m0[161].x);
    float _843 = _637 * _791;
    bool _845 = _541 >= (*spvDescriptorSet0.vp_c9)._m0[160].w;
    bool _847 = isnan(_541);
    bool _849 = _845 || _847;
    bool _851 = isnan((*spvDescriptorSet0.vp_c9)._m0[160].w);
    bool _853 = _849 || _851;
    float _855 = float(_853);
    float _857 = fma(_707, _827, (*spvDescriptorSet0.vp_c9)._m0[160].x);
    float _859 = -_839;
    float _861 = _859 + 1.0;
    float _863 = _839 * _679;
    float _865 = -(*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _867 = _541 + _865;
    float _869 = -(*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _871 = _541 + _869;
    float _873 = _651 * _861;
    float _875 = -_651;
    float _877 = _875 + 1.0;
    float _879 = fma(_663, _867, (*spvDescriptorSet0.vp_c9)._m0[163].x);
    bool _881 = _541 >= (*spvDescriptorSet0.vp_c9)._m0[159].w;
    bool _883 = isnan(_541);
    bool _885 = _881 || _883;
    bool _887 = isnan((*spvDescriptorSet0.vp_c9)._m0[159].w);
    bool _889 = _885 || _887;
    float _891 = float(_889);
    float _893 = -_855;
    float _895 = _893 + 1.0;
    float _897 = _855 * _877;
    float _899 = fma(_709, _871, (*spvDescriptorSet0.vp_c9)._m0[162].x);
    float _901 = _891 * _895;
    float _903 = -(*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _905 = _541 + _903;
    float _907 = -(*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _909 = _541 + _907;
    float _911 = -_891;
    float _913 = _911 + 1.0;
    float _915 = _807 * _901;
    float _917 = _779 * (*spvDescriptorSet0.vp_c9)._m0[87].x;
    float _919 = (*spvDescriptorSet0.vp_c9)._m0[87].x + (*spvDescriptorSet0.vp_c9)._m0[86].z;
    float _921 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _923 = log2(_921);
    float _925 = (*spvDescriptorSet0.vp_c9)._m0[87].y + (*spvDescriptorSet0.vp_c9)._m0[86].w;
    int _927 = ~_639;
    int _929 = _927 + 1;
    int _931 = _929 + 1;
    float _933 = fma(_913, (*spvDescriptorSet0.vp_c9)._m0[159].x, _915);
    int _935 = _931;
    if (!_599)
    {
        int _937 = ~_639;
        int _939 = _937 + 1;
        _935 = _939;
    }
    int _941 = _935;
    float _943 = fma(_795, -2.0, _925);
    int _945 = abs(_787);
    float _947 = fma(_685, _909, (*spvDescriptorSet0.vp_c9)._m0[165].x);
    int _949 = _805 ? 0 : 1;
    float _951 = -_919;
    float _953 = fma(_917, 2.0, _951);
    float _955 = float(_945);
    float _957 = fma(_857, _897, _933);
    float _959 = float(_941);
    float _961 = fma(_733, _905, (*spvDescriptorSet0.vp_c9)._m0[164].x);
    int _963 = ~_949;
    int _965 = _963 + 1;
    int _967 = _965 + 1;
    float _969 = fma(_841, _873, _957);
    int _971 = _967;
    if (!_793)
    {
        int _973 = ~_949;
        int _975 = _973 + 1;
        _971 = _975;
    }
    int _977 = _971;
    float _979 = _923 * _146;
    float _981 = _955 * _959;
    float _983 = in.m_61.x;
    float _985 = in.m_61.y;
    float _987 = in.m_61.z;
    int _989 = _823 ? 0 : 1;
    float _991 = _981 * (-2.0);
    float _993 = exp2(_979);
    float _995 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _997 = 1.0 + _995;
    int _999 = ~_989;
    int _1001 = _999 + 1;
    int _1003 = _1001 + 1;
    float _1005 = in.m_59.z;
    int _1007 = _1003;
    if (!_809)
    {
        int _1009 = ~_989;
        int _1011 = _1009 + 1;
        _1007 = _1011;
    }
    int _1013 = _1007;
    float _1015 = (*spvDescriptorSet0.vp_c9)._m0[88].z + (*spvDescriptorSet0.vp_c9)._m0[88].x;
    float _1017 = 1.0 / _997;
    bool _1019 = !_563;
    int _1021 = _1019 ? 0 : 1;
    float _1023 = fma(_200, (*spvDescriptorSet0.vp_c9)._m0[88].z, _1015);
    bool _1025 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1027 = isnan(1.0);
    bool _1029 = _1025 || _1027;
    bool _1031 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1033 = _1029 || _1031;
    float _1035 = (*spvDescriptorSet0.vp_c9)._m0[88].w + (*spvDescriptorSet0.vp_c9)._m0[88].y;
    int _1037 = abs(_1021);
    float _1039 = _553 + (-0.5);
    bool _1041 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1043 = isnan(0.0);
    bool _1045 = _1041 || _1043;
    bool _1047 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1049 = _1045 || _1047;
    float _1051 = fma(_553, (*spvDescriptorSet0.vp_c9)._m0[88].w, _1035);
    float _1053 = -_993;
    float _1055 = _1053 + 1.0;
    float _1057 = fma(_146, (*spvDescriptorSet0.vp_c9)._m0[87].z, _1023);
    float _1059 = float(_1037);
    float _1061 = -_146;
    float _1063 = fma(_1061, (*spvDescriptorSet0.vp_c9)._m0[86].x, _953);
    float _1065 = float(_977);
    float _1067 = fma(_991, _985, _985);
    bool _1069 = !_571;
    int _1071 = _1069 ? 0 : 1;
    float _1073 = fma(_899, _863, _969);
    float _1075 = _1049 ? _1055 : 0.0;
    float _1077 = _1059 * _1065;
    float _1079 = fma(_146, (*spvDescriptorSet0.vp_c9)._m0[87].w, _1051);
    int _1081 = abs(_1071);
    float _1083 = fma(_146, (*spvDescriptorSet0.vp_c9)._m0[86].y, _943);
    float _1085 = _200 + _545;
    if (_1033)
    {
        float _1087 = _1075 * _1017;
        _150 = _1087;
    }
    float _1089 = _150;
    float _1091 = fma(_751, _991, _751);
    float _1093 = fma(_1039, (*spvDescriptorSet0.vp_c9)._m0[196].y, _1067);
    float _1095 = fma(_879, _843, _1073);
    float _1097 = _1077 * (-2.0);
    float _1099 = _1085 + (-1.0);
    float _1101 = fma(_1091, _1089, _1093);
    float _1103 = float(_1013);
    float _1105 = _200 + (-0.5);
    float _1107 = fma(_1097, _983, _983);
    float _1109 = fma(_961, _783, _1095);
    float _1111 = fma(_1099, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _1113 = fma(_753, _1097, _753);
    float _1115 = fma(_1105, (*spvDescriptorSet0.vp_c9)._m0[196].x, _1107);
    float _1117 = float(_1081);
    float _1119 = fma(_947, _767, _1109);
    float _1121 = _200 + _1005;
    float _1123 = fma(_1113, _1089, _1115);
    float _1125 = (*spvDescriptorSet0.vp_c9)._m0[191].x * (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _1127 = fma(_725, (*spvDescriptorSet0.vp_c9)._m0[166].x, _1119);
    float _1129 = _1117 * _1103;
    float _1131 = in.m_63.x;
    float _1133 = in.m_63.y;
    float _1135 = in.m_63.z;
    float _1137 = _1101 * 0.15915493667125701904296875;
    float _1139 = fma(_1127, _1125, _1121);
    float _1141 = _1129 * (-2.0);
    float _1143 = in.m_59.y;
    float _1145 = _1123 * 0.15915493667125701904296875;
    float _1147 = _1139 * (*spvDescriptorSet0.vp_c9)._m0[191].y;
    float _1149 = fma(_1141, _987, _987);
    float _1151 = _545 + (-0.5);
    float _1153 = fma(_1111, _1141, _1111);
    float _1155 = _1147 * 0.15915493667125701904296875;
    float _1157 = _1137 * 6.283185482025146484375;
    float _1159 = sin(_1157);
    float _1161 = fma(_1151, (*spvDescriptorSet0.vp_c9)._m0[196].z, _1149);
    float _1163 = in.m_46.x;
    float _1165 = in.m_46.y;
    float _1167 = in.m_46.z;
    float _1169 = fma(_1153, _1089, _1161);
    float _1171 = _1155 * 6.283185482025146484375;
    float _1173 = sin(_1171);
    float _1175 = _1169 * 0.15915493667125701904296875;
    bool _1177 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _1179 = isnan(0.5);
    bool _1181 = _1177 || _1179;
    bool _1183 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1185 = _1181 || _1183;
    float _1187 = _511 * _1135;
    float _1189 = _509 * _1131;
    float _1191 = fma(_553, (*spvDescriptorSet0.vp_c9)._m0[191].z, 0.20000000298023223876953125);
    float _1193 = _1137 * 6.283185482025146484375;
    float _1195 = cos(_1193);
    float _1197 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _559);
    float _1199 = _1189 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1201 = _513 * _1133;
    float _1203 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _1005);
    float _1205 = _1187 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _1207 = _1197 * _1199;
    float _1209 = _1201 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1211 = _1145 * 6.283185482025146484375;
    float _1213 = sin(_1211);
    float _1215 = fma(_1173, _1191, _1143);
    float _1217 = _1203 * _1205;
    float _1219 = _1165 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _1221 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _1215);
    float _1223 = fma(_1163, (*spvDescriptorSet0.vp_c10)._m0[6].x, _1219);
    float _1225 = _1145 * 6.283185482025146484375;
    float _1227 = cos(_1225);
    float _1229 = _1221 * _1209;
    float _1231 = fma(_1167, (*spvDescriptorSet0.vp_c10)._m0[6].z, _1223);
    float _1233 = _1175 * 6.283185482025146484375;
    float _1235 = cos(_1233);
    float _1237 = _1213 * _1195;
    float _1239 = _1213 * _1159;
    float _1241 = _1175 * 6.283185482025146484375;
    float _1243 = sin(_1241);
    float _1245 = _1227 * _1159;
    float _1247 = _1227 * _1195;
    float _1249 = _1227 * _1235;
    float _1251 = _1195 * _1235;
    float _1253 = _1213 * _1235;
    float _1255 = _1159 * _1235;
    float _1257 = _1253 * _1229;
    float _1259 = -_1245;
    float _1261 = fma(_1243, _1237, _1259);
    float _1263 = -_1237;
    float _1265 = fma(_1243, _1245, _1263);
    float _1267 = fma(_1243, _1247, _1239);
    float _1269 = _1249 * _1229;
    float _1271 = fma(_1243, _1239, _1247);
    float _1273 = -_1229;
    float _1275 = _1243 * _1273;
    float _1277 = fma(_1261, _1207, _1257);
    float _1279 = fma(_1267, _1207, _1269);
    float _1281 = _1165 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _1283 = fma(_1251, _1207, _1275);
    float _1285 = fma(_1271, _1217, _1277);
    float _1287 = fma(_1265, _1217, _1279);
    float _1289 = fma(_1163, (*spvDescriptorSet0.vp_c10)._m0[4].x, _1281);
    float _1291 = fma(_1255, _1217, _1283);
    float _1293 = _1231 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _1295 = _1287 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _1297 = _1287 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _1299 = fma(_1167, (*spvDescriptorSet0.vp_c10)._m0[4].z, _1289);
    float _1301 = _1165 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _1303 = fma(_1291, (*spvDescriptorSet0.vp_c10)._m0[10].x, _1295);
    float _1305 = fma(_1291, (*spvDescriptorSet0.vp_c10)._m0[8].x, _1297);
    float _1307 = _1299 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _1309 = fma(_1163, (*spvDescriptorSet0.vp_c10)._m0[5].x, _1301);
    float _1311 = fma(_1285, (*spvDescriptorSet0.vp_c10)._m0[10].z, _1303);
    float _1313 = fma(_1285, (*spvDescriptorSet0.vp_c10)._m0[8].z, _1305);
    float _1315 = _1287 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _1317 = fma(_1167, (*spvDescriptorSet0.vp_c10)._m0[5].z, _1309);
    float _1319 = _1293 + _1311;
    float _1321 = _1307 + _1313;
    float _1323 = fma(_1291, (*spvDescriptorSet0.vp_c10)._m0[9].x, _1315);
    float _1325 = _1317 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _1327 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1329 = _1319 + _1327;
    float _1331 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1333 = _1321 + _1331;
    float _1335 = fma(_1285, (*spvDescriptorSet0.vp_c10)._m0[9].z, _1323);
    float _1337 = _1329 * _1329;
    float _1339 = _1325 + _1335;
    float _1341 = fma(_1333, _1333, _1337);
    float _1343 = sqrt(_1341);
    bool _1345 = _1343 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1347 = _1161;
    float _1349 = _1321;
    float _1351 = _1319;
    float _1353 = _1291;
    float _1355 = _1339;
    if (!_1345)
    {
        _1347 = _1339;
    }
    float _1357 = _1347;
    bool _1359 = !_1345;
    float _1361 = _1357;
    if (!_1359)
    {
        float _1363 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1365 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1367 = _1343 + _1365;
        float _1369 = _1339 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1371 = _1367 * _1363;
        float _1373 = rsqrt(_1341);
        float _1375 = _1371 * 0.15915493667125701904296875;
        float _1377 = _1375 * 6.283185482025146484375;
        float _1379 = cos(_1377);
        float _1381 = _1375 * 6.283185482025146484375;
        float _1383 = sin(_1381);
        float _1385 = _1379 + (-1.0);
        float _1387 = _1385 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1389 = fma(_1383, _1369, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1391 = fma(_1339, _1379, _1387);
        float _1393 = _1373 * _1389;
        float _1395 = fma(_1333, _1393, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1397 = fma(_1329, _1393, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1349 = _1395;
        _1351 = _1397;
        _1361 = _1391;
        _1353 = _1375;
    }
    float _1399 = _1349;
    float _1401 = _1351;
    float _1403 = _1361;
    float _1405 = _1353;
    float _1407 = _1403;
    float _1409 = _1399;
    float _1411 = _1401;
    float _1413 = _1405;
    if (!_1185)
    {
        float _1415 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _1417 = _1325 + _1415;
        float _1419 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _1421 = _1307 + _1419;
        float _1423 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1425 = -_1307;
        float _1427 = _1425 + _1399;
        float _1429 = _1417 * _1417;
        float _1431 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _1433 = _1293 + _1431;
        float _1435 = -_1293;
        float _1437 = _1435 + _1401;
        float _1439 = fma(_1421, _1421, _1429);
        float _1441 = fma(_1433, _1433, _1439);
        float _1443 = sqrt(_1441);
        float _1445 = precise::min(_1443, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1447 = _1445 * _1423;
        float _1449 = -_1325;
        float _1451 = _1449 + _1403;
        float _1453 = fma(_1427, _1447, _1307);
        float _1455 = fma(_1451, _1447, _1325);
        float _1457 = fma(_1437, _1447, _1293);
        _1407 = _1455;
        _1409 = _1453;
        _1411 = _1457;
        _1413 = _1451;
    }
    float _1459 = _1407;
    float _1461 = _1409;
    float _1463 = _1411;
    float _1465 = _1413;
    float _1467 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1469 = _1459 + _1467;
    float _1471 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1473 = _1461 + _1471;
    float _1475 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1477 = _1463 + _1475;
    float _1479 = _1459 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1481 = _1469 * _1469;
    float _1483 = fma(_1461, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1479);
    float _1485 = fma(_1473, _1473, _1481);
    float _1487 = fma(_1477, _1477, _1485);
    float _1489 = rsqrt(_1487);
    float _1491 = sqrt(_1487);
    float _1493 = _1489 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1495 = _1473 * _1493;
    float _1497 = _1477 * _1493;
    float _1499 = _1495 * _1495;
    float _1501 = _1497 * _1497;
    float _1503 = _1499 + _1501;
    float _1505 = sqrt(_1503);
    bool _1507 = _1505 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1509 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1511 = _1505 + _1509;
    float _1513 = _1489;
    float _1515 = _1465;
    float _1517 = _1511;
    float _1519 = _1469;
    if (_1507)
    {
        float _1521 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1513 = _1521;
    }
    float _1523 = _1513;
    if (_1507)
    {
        float _1525 = rsqrt(_1503);
        _1515 = _1525;
    }
    float _1527 = _1515;
    if (_1507)
    {
        float _1529 = _1511 * _1523;
        _1517 = _1529;
    }
    float _1531 = _1517;
    float _1533 = _1459 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    if (_1507)
    {
        float _1535 = _1531 * 0.15915493667125701904296875;
        _1355 = _1535;
    }
    float _1537 = _1355;
    float _1539 = fma(_1461, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1533);
    float _1541 = _1477;
    float _1543 = _1537;
    if (_1507)
    {
        float _1545 = _1537 * 6.283185482025146484375;
        float _1547 = sin(_1545);
        _1541 = _1547;
    }
    float _1549 = _1541;
    float _1551 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1553 = fma(_1463, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1539);
    float _1555 = precise::max(0.0, _1551);
    float _1557 = _1523;
    float _1559 = _1555;
    if (_1507)
    {
        float _1561 = _1537 * 6.283185482025146484375;
        float _1563 = cos(_1561);
        _1557 = _1563;
    }
    float _1565 = _1557;
    float _1567 = _1553 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1569 = -_1493;
    float _1571 = -_1555;
    float _1573 = fma(_1469, _1569, _1571);
    float _1575 = _1573;
    if (_1507)
    {
        float _1577 = _1573 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1519 = _1577;
    }
    float _1579 = _1519;
    float _1581 = _1579;
    if (!_1507)
    {
        _1543 = _1499;
    }
    float _1583 = _1543;
    float _1585 = _1549;
    float _1587 = _1583;
    if (_1507)
    {
        float _1589 = fma(_1549, _1579, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1581 = _1589;
    }
    float _1591 = _1581;
    float _1593 = _1591;
    if (!_1507)
    {
        _1585 = _1495;
    }
    float _1595 = _1585;
    float _1597 = _1595;
    float _1599 = _1565;
    if (_1507)
    {
        float _1601 = _1565 + (-1.0);
        _1559 = _1601;
    }
    float _1603 = _1559;
    float _1605 = _1603;
    if (_1507)
    {
        float _1607 = _1527 * _1591;
        _1593 = _1607;
    }
    float _1609 = _1593;
    if (_1507)
    {
        float _1611 = _1603 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1605 = _1611;
    }
    float _1613 = _1605;
    float _1615 = _1613;
    if (_1507)
    {
        float _1617 = _1495 * _1609;
        _1597 = _1617;
    }
    float _1619 = _1597;
    float _1621 = _1459 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1623 = fma(_1307, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    if (_1507)
    {
        float _1625 = fma(_1573, _1565, _1613);
        _1575 = _1625;
    }
    float _1627 = _1575;
    if (!_1507)
    {
        _1599 = _1497;
    }
    float _1629 = _1599;
    float _1631 = _1629;
    if (_1507)
    {
        float _1633 = _1497 * _1609;
        _1631 = _1633;
    }
    float _1635 = _1631;
    if (_1507)
    {
        float _1637 = _1619 * _1619;
        _1587 = _1637;
    }
    float _1639 = _1587;
    if (!_1507)
    {
        _1615 = _1501;
    }
    float _1641 = _1615;
    float _1643 = fma(_1461, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1621);
    float _1645 = _1641;
    if (_1507)
    {
        float _1647 = _1635 * _1635;
        _1645 = _1647;
    }
    float _1649 = _1645;
    float _1651 = fma(_1627, _1627, _1639);
    float _1653 = fma(_1463, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1643);
    float _1655 = floor(_1623);
    float _1657 = _1651 + _1649;
    float _1659 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1661 = fma(_1491, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1659);
    float _1663 = precise::clamp(_1661, 0.0, 1.0);
    float _1665 = _1653 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1667 = -_1663;
    float _1669 = _1667 + 1.0;
    float _1671 = rsqrt(_1657);
    float _1673 = _1665 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1675 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _1677 = fma(_1293, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _1679 = -_1673;
    float _1681 = fma(_1679, _1675, 1.0);
    float _1683 = abs(_1669);
    float _1685 = log2(_1683);
    float _1687 = _1459 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1689 = -_1655;
    float _1691 = _1623 + _1689;
    float _1693 = _1567 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1695 = fma(_1461, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1687);
    float _1697 = _1671 * _1619;
    float _1699 = _1671 * _1627;
    float _1701 = _1671 * _1635;
    float _1703 = fma(_1463, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1695);
    float _1705 = _1697 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1707 = floor(_1677);
    float _1709 = _1699 + 1.0;
    float _1711 = _1703 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1713 = -_1705;
    float _1715 = fma(_1699, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1713);
    float _1717 = _1567 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1719 = _1685 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1721 = fma(_1711, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1693);
    float _1723 = -_1701;
    float _1725 = fma(_1723, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1715);
    float _1727 = fma(_1463, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1483);
    float _1729 = fma(_1711, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1717);
    float _1731 = exp2(_1719);
    float _1733 = fma(_1725, -0.5, 0.5);
    float _1735 = _1727 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1737 = fma(_1665, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1729);
    float _1739 = fma(_1725, 0.5, 0.5);
    float _1741 = _1567 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1743 = -_1707;
    float _1745 = _1677 + _1743;
    float _1747 = fma(_1735, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1737);
    float _1749 = log2(_1681);
    float _1751 = fma(_1711, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1741);
    float _1753 = fma(_1739, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1755 = fma(_1665, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1721);
    float _1757 = fma(_1665, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1751);
    float _1759 = fma(_1739, _1753, -0.212114393711090087890625);
    float _1761 = fma(_1735, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1755);
    float _1763 = 1.0 / _1747;
    float _1765 = fma(_1735, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1757);
    float _1767 = -_1699;
    float _1769 = fma(_1731, _1709, _1767);
    float _1771 = fma(_1739, _1759, 1.570728778839111328125);
    float _1773 = sqrt(_1733);
    float _1775 = _1749 * 0.693147182464599609375;
    float2 _5397 = float2(_1691, _1745);
    float _1777 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_5397, float2(0.0), isnan(_5397)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_5397, float2(0.0), isnan(_5397)), level(0.0)).x;
    float _1779 = _1775 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1781 = _1761 * _1763;
    float _1783 = _1765 * _1763;
    float _1785 = fma(_1769, 0.5, 0.5);
    float _1787 = fma(_1781, 0.5, 0.5);
    float _1789 = fma(_1783, -0.5, 0.5);
    float _1791 = _1773 * 0.636619746685028076171875;
    float3 _5427 = float3(_1787, _1789, _1779);
    float _1793 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_5427, float3(0.0), isnan(_5427)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_5427, float3(0.0), isnan(_5427)), level(0.0)).x;
    float _1795 = -_1771;
    float _1797 = fma(_1791, _1795, 1.0);
    float3 _5443 = float3(_1787, _1789, _1779);
    float4 _1800 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_5443, float3(0.0), isnan(_5443)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_5443, float3(0.0), isnan(_5443)), level(0.0)).xyzw;
    float _1802 = _1800.x;
    float _1804 = _1800.y;
    float _1806 = _1800.z;
    float _1808 = _1800.w;
    float2 _5459 = float2(_1797, _1785);
    float3 _1812 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_5459, float2(0.0), isnan(_5459)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_5459, float2(0.0), isnan(_5459)), level(0.0)).xyz;
    float _1814 = _1812.x;
    float _1816 = _1812.y;
    float _1818 = _1812.z;
    float _1820 = _1325 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    bool _1822 = _553 > 0.5;
    float _1824 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].w;
    float _1826 = fma(_1307, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1820);
    float _1828 = _1325 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    bool _1830 = _545 > 0.5;
    float _1832 = in.m_53.w;
    float _1834 = fma(_1293, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1826);
    float _1836 = fma(_1307, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1828);
    float _1838 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].z;
    float _1840 = _1834 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1842 = fma(_1293, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1836);
    float _1844 = in.m_65.x;
    int _1846 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1848 = _1846 != 0;
    float _1850 = _1842 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1852 = in.m_65.y;
    float _1854 = 1.0 / _1840;
    int _1856 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32;
    bool _1858 = _1856 != 0;
    float _1860 = _1850 + _1840;
    int _1862 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1864 = _1862 != 0;
    int _1866 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _1868 = _1866 != 0;
    bool _1870 = _1832 > 0.5;
    float _1872 = _1860 * _1854;
    float _1874 = _1872 * 0.5;
    int _1876 = 0;
    int _1878 = as_type<int>(_1824);
    float _1880 = _1747;
    if (_1868)
    {
        float _1882 = -_1844;
        float _1884 = _1882 + 1.0;
        _1876 = as_type<int>(_1884);
    }
    int _1886 = _1876;
    float _1888 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1890 = fma(_1874, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1888);
    float _1892 = -_1852;
    float _1894 = _1892 + 1.0;
    float _1896 = 1.0 / _1890;
    float _1898 = _1852;
    if (!_1864)
    {
        _763 = _1844;
    }
    float _1900 = _763;
    int _1902 = _1870 ? as_type<int>(_1894) : as_type<int>(_1852);
    out.m_67.x = 1.0;
    out.m_67.y = 1.0;
    out.m_67.z = 1.0;
    int _1904 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16;
    bool _1906 = _1904 != 0;
    float _1908 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1910 = _1896 * _1908;
    int _1912 = _1822 ? as_type<int>(_1894) : as_type<int>(_1852);
    int _1914 = 0;
    float _1916 = _1900;
    if (_1906)
    {
        float _1918 = -_1844;
        float _1920 = _1918 + 1.0;
        _1914 = as_type<int>(_1920);
    }
    int _1922 = _1914;
    float _1924 = abs(_1910);
    float _1926 = log2(_1924);
    bool _1928 = _1910 <= 8000.0;
    bool _1930 = isnan(_1910);
    bool _1932 = _1928 || _1930;
    bool _1934 = isnan(8000.0);
    bool _1936 = _1932 || _1934;
    float _1938 = float(_1936);
    float _1940 = _1926 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _1942 = _1848 ? as_type<float>(_1912) : _1852;
    float _1944 = in.m_69.x;
    float _1946 = in.m_69.y;
    float _1948 = in.m_69.z;
    float _1950 = in.m_69.w;
    int _1952 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _1954 = _1952 != 0;
    float _1956 = _1838 * (*spvDescriptorSet0.vp_c9)._m0[90].x;
    float _1958 = exp2(_1940);
    float _1960 = _1954 ? as_type<float>(_1902) : _1852;
    bool _1962 = _1954;
    if (_1858)
    {
        float _1964 = _1830 ? _1894 : _1852;
        _1898 = _1964;
    }
    float _1966 = _1898;
    float _1968 = _1824 * (*spvDescriptorSet0.vp_c9)._m0[90].y;
    float _1970 = _1966;
    if (_1864)
    {
        float _1972 = -_1844;
        float _1974 = _1972 + 1.0;
        _1878 = as_type<int>(_1974);
    }
    int _1976 = _1878;
    float _1978 = as_type<float>(_1976);
    if (_1864)
    {
        bool _1980 = _200 > 0.5;
        _1962 = _1980;
    }
    bool _1982 = _1962;
    float _1984 = fma(_1968, _1966, -0.5);
    if (!_1868)
    {
        _1970 = _1844;
    }
    float _1986 = _1970;
    float _1988 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _1990 = _1986;
    if (_1864)
    {
        float _1992 = _1982 ? as_type<float>(_1976) : _1844;
        _1916 = _1992;
    }
    float _1994 = _1916;
    if (!_1906)
    {
        _1978 = _1844;
    }
    float _1996 = _1978;
    float _1998 = _1996;
    if (_1868)
    {
        float _2000 = _1830 ? as_type<float>(_1886) : _1844;
        _1990 = _2000;
    }
    float _2002 = _1990;
    float _2004 = _1942 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    if (_1906)
    {
        float _2006 = _1822 ? as_type<float>(_1922) : _1844;
        _1998 = _2006;
    }
    float _2008 = _1998;
    float _2010 = -_1083;
    float _2012 = fma(_1079, _1984, _2010);
    float _2014 = fma(_1958, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _2016 = precise::clamp(_2014, 0.0, 1.0);
    float _2018 = _1249 * _1946;
    float _2020 = fma(_1956, _2008, -0.5);
    float _2022 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _2024 = fma(_2016, -2.0, 3.0);
    float _2026 = _2016 * _2016;
    float _2028 = -_1946;
    float _2030 = _1243 * _2028;
    float _2032 = fma(_1267, _1944, _2018);
    float _2034 = fma(_1057, _2020, _1063);
    float _2036 = _2026 * _2024;
    float _2038 = fma(_1251, _1944, _2030);
    float _2040 = fma(_1265, _1948, _2032);
    float _2042 = in.m_71.x;
    float _2044 = in.m_71.y;
    float _2046 = in.m_71.z;
    bool _2048 = _1215 != 0.0;
    bool _2050 = isnan(_1215);
    bool _2052 = _2048 || _2050;
    bool _2054 = isnan(0.0);
    bool _2056 = _2052 || _2054;
    float _2058 = fma(_1255, _1948, _2038);
    float _2060 = _2040 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _2062 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _2064 = _2040 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    bool _2066 = _559 == 0.0;
    bool _2068 = !_2056;
    bool _2070 = _2066 && _2068;
    float _2072 = _2040 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _2074 = fma(_2058, (*spvDescriptorSet0.vp_c10)._m0[8].x, _2060);
    float _2076 = fma(_2058, (*spvDescriptorSet0.vp_c10)._m0[9].x, _2064);
    float _2078 = _1253 * _1946;
    bool _2080 = _1005 == 0.0;
    bool _2082 = _2080 && _2070;
    float _2084 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _2086 = fma(_2058, (*spvDescriptorSet0.vp_c10)._m0[10].x, _2072);
    float _2088 = _2004 * _1988;
    float _2090 = _1960 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _2092 = fma(_1261, _1944, _2078);
    float _2094 = _1994 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _2096 = _2002 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _2098 = _2090 * _2022;
    float _2100 = fma(_1271, _1948, _2092);
    float _2102 = _2094 * _2062;
    float _2104 = _2012 + 0.5;
    float _2106 = _2034 + 0.5;
    float _2108 = fma(_2100, (*spvDescriptorSet0.vp_c10)._m0[9].z, _2076);
    float _2110 = _2076;
    float _2112 = _2074;
    float _2114 = _2090;
    float _2116 = _2036;
    float _2118 = _2042;
    if (_2082)
    {
        _2110 = _2042;
    }
    float _2120 = _2110;
    float _2122 = fma(_2100, (*spvDescriptorSet0.vp_c10)._m0[8].z, _2074);
    float _2124 = fma(_2100, (*spvDescriptorSet0.vp_c10)._m0[10].z, _2086);
    float _2126 = _2096 * _2084;
    float _2128 = -_2036;
    float _2130 = _2128 + 1.0;
    float _2132 = _2120;
    float _2134 = _2130;
    if (_2082)
    {
        _2112 = _2044;
    }
    float _2136 = _2112;
    out.m_73.x = _2106;
    out.m_73.y = _2104;
    float _2138 = _2136;
    if (_2082)
    {
        _2114 = _2046;
    }
    float _2140 = _2114;
    float _2142 = fma(_2130, (*spvDescriptorSet0.vp_c15)._m0[654].w, _2036);
    float _2144 = _2140;
    if (_2082)
    {
        _2116 = _2120;
    }
    float _2146 = _2116;
    out.m_75.x = _2102;
    out.m_75.y = _2088;
    out.m_75.z = _2126;
    out.m_75.w = _2098;
    float _2148 = _2146;
    if (!_2082)
    {
        _2132 = _2042;
    }
    float _2150 = _2132;
    if (_2082)
    {
        _2134 = _2136;
    }
    float _2152 = _2134;
    out.m_77.x = _2122;
    out.m_77.y = _2108;
    out.m_77.z = _2124;
    float _2154 = _2152;
    if (!_2082)
    {
        _2138 = _2044;
    }
    float _2156 = _2138;
    if (!_2082)
    {
        float _2158 = fma(_559, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2150);
        _2148 = _2158;
    }
    float _2160 = _2148;
    if (_2082)
    {
        _2118 = _2140;
    }
    float _2162 = _2118;
    float _2164 = in.m_79.x;
    float _2166 = _2162;
    if (!_2082)
    {
        _2144 = _2046;
    }
    float _2168 = _2144;
    float _2170 = _1944 * _2156;
    if (!_2082)
    {
        float _2172 = fma(_1215, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2156);
        _2154 = _2172;
    }
    float _2174 = _2154;
    float _2176 = _1948 * _2150;
    float _2178 = _1946 * _2168;
    float _2180 = -_2170;
    float _2182 = fma(_1946, _2150, _2180);
    float _2184 = _1249 * _2174;
    float _2186 = -_2176;
    float _2188 = fma(_1944, _2168, _2186);
    float _2190 = -_2178;
    float _2192 = fma(_1948, _2156, _2190);
    float _2194 = _1567 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _2196 = -_2174;
    float _2198 = _1243 * _2196;
    float _2200 = _2188 * _1950;
    float _2202 = _2192 * _1950;
    float _2204 = fma(_1267, _2160, _2184);
    float _2206 = _2182 * _1950;
    float _2208 = _1249 * _2200;
    float _2210 = -_2200;
    float _2212 = _1243 * _2210;
    float _2214 = _1685 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _2216 = fma(_1711, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2194);
    float _2218 = fma(_1267, _2202, _2208);
    float _2220 = _1253 * _2174;
    float _2222 = _1253 * _2200;
    float _2224 = fma(_1251, _2202, _2212);
    float _2226 = fma(_1265, _2206, _2218);
    if (!_2082)
    {
        float _2228 = fma(_1005, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2168);
        _2166 = _2228;
    }
    float _2230 = _2166;
    float _2232 = fma(_1665, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2216);
    float _2234 = exp2(_2214);
    float _2236 = fma(_1261, _2202, _2222);
    float _2238 = fma(_1255, _2206, _2224);
    float _2240 = _2226 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _2242 = _2226 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _2244 = fma(_1251, _2160, _2198);
    float _2246 = fma(_1261, _2160, _2220);
    float _2248 = fma(_1265, _2230, _2204);
    float _2250 = fma(_1735, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2232);
    float _2252 = fma(_1271, _2206, _2236);
    float _2254 = fma(_2238, (*spvDescriptorSet0.vp_c10)._m0[8].x, _2240);
    float _2256 = fma(_2238, (*spvDescriptorSet0.vp_c10)._m0[9].x, _2242);
    float _2258 = fma(_1255, _2230, _2244);
    float _2260 = fma(_1271, _2230, _2246);
    float _2262 = _2248 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _2264 = _2250 + _1747;
    float _2266 = _2248 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _2268 = fma(_2252, (*spvDescriptorSet0.vp_c10)._m0[8].z, _2254);
    float _2270 = _2248 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _2272 = fma(_2252, (*spvDescriptorSet0.vp_c10)._m0[9].z, _2256);
    float _2274 = _1938 * _2142;
    float _2276 = fma(_2258, (*spvDescriptorSet0.vp_c10)._m0[8].x, _2262);
    float _2278 = _2264 * 0.5;
    float _2280 = fma(_2258, (*spvDescriptorSet0.vp_c10)._m0[9].x, _2266);
    float _2282 = fma(_2258, (*spvDescriptorSet0.vp_c10)._m0[10].x, _2270);
    float _2284 = fma(_2260, (*spvDescriptorSet0.vp_c10)._m0[8].z, _2276);
    float _2286 = _2274 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _2288 = -_2234;
    float _2290 = _2288 + 1.0;
    float _2292 = fma(_2260, (*spvDescriptorSet0.vp_c10)._m0[9].z, _2280);
    float _2294 = fma(_2260, (*spvDescriptorSet0.vp_c10)._m0[10].z, _2282);
    float _2296 = _2290 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _2298 = _2226 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    out.m_81.x = _2284;
    out.m_81.y = _2292;
    out.m_81.z = _2294;
    bool _2300 = _1491 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _2302 = isnan(_1491);
    bool _2304 = _2300 || _2302;
    bool _2306 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _2308 = _2304 || _2306;
    float _2310 = fma(_2238, (*spvDescriptorSet0.vp_c10)._m0[10].x, _2298);
    out.gl_Position.x = _1761;
    out.gl_Position.y = _1765;
    out.gl_Position.z = _2250;
    out.gl_Position.w = _1747;
    float _2312 = fma(_2252, (*spvDescriptorSet0.vp_c10)._m0[10].z, _2310);
    out.m_83.z = _2278;
    out.m_83.w = _1747;
    out.m_85.x = _2268;
    out.m_85.y = _2272;
    out.m_85.z = _2312;
    float _2314 = -_2296;
    float _2316 = _2314 + 1.0;
    float _2318 = _2250;
    float _2320 = _2272;
    float _2322 = _2268;
    float _2324 = _2316;
    if (!_2308)
    {
        _1880 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _2326 = _1880;
    float _2328 = _2326;
    float _2330 = _2326;
    if (!_2308)
    {
        _2318 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _2332 = _2318;
    float _2334 = _2332;
    float _2336 = _2332;
    if (!_2308)
    {
        _2320 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _2338 = _2320;
    float _2340 = _2338;
    float _2342 = _2338;
    if (!_2308)
    {
        _2322 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _2344 = _2322;
    float _2346 = -_1777;
    float _2348 = _2346 + 1.0;
    float _2350 = _2348 * _2286;
    float _2352 = precise::clamp(_2350, 0.0, 1.0);
    float _2354 = -_2352;
    float _2356 = fma(_2354, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _2358 = _2356 * _2164;
    float _2360 = _2296 * _1793;
    float _2362 = _2358 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _2364 = _1808 * _2360;
    float _2366 = _1808 * _2316;
    out.m_87.x = _2362;
    float _2368 = _2364;
    float _2370 = _2344;
    float _2372 = _2344;
    if (!_2308)
    {
        _2324 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _2374 = _2324;
    float _2376 = _1818 * _2360;
    float _2378 = fma(_1814, _2364, _1802);
    float _2380 = fma(_1816, _2364, _1804);
    float _2382 = _2374;
    float _2384 = _2374;
    if (!_2308)
    {
        _2368 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _2386 = _2368;
    float _2388 = fma(_1808, _2376, _1806);
    out.m_89.x = _2378;
    out.m_89.y = _2380;
    out.m_89.z = _2388;
    out.m_89.w = _2366;
    bool _2390 = !_2308;
    float _2392 = _2386;
    float _2394 = _2386;
    if (!_2390)
    {
        bool _2396 = _1491 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _2398 = isnan(_1491);
        bool _2400 = _2396 || _2398;
        bool _2402 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _2404 = _2400 || _2402;
        if (!_2404)
        {
            float _2406 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2408 = _1491 + _2406;
            float _2410 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2412 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _2410;
            float _2414 = 1.0 / _2412;
            float _2416 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _2418 = _2416 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _2420 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _2422 = _2420 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _2424 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _2426 = _2424 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _2428 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _2430 = _2428 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _2432 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _2434 = _2432 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _2436 = _2408 * _2414;
            float _2438 = precise::clamp(_2436, 0.0, 1.0);
            float _2440 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _2442 = _2440 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _2444 = fma(_2438, _2418, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _2446 = fma(_2438, _2442, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _2448 = fma(_2438, _2422, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _2450 = fma(_2438, _2426, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _2452 = fma(_2438, _2430, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _2454 = fma(_2438, _2434, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _2372 = _2446;
            _2394 = _2452;
            _2342 = _2444;
            _2336 = _2450;
            _2330 = _2448;
            _2384 = _2454;
            _2456 = true;
        }
        else
        {
            bool _2458 = _1491 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _2460 = isnan(_1491);
            bool _2462 = _2458 || _2460;
            bool _2464 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _2466 = _2462 || _2464;
            if (!_2466)
            {
                _2340 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _2468 = _2340;
            _2342 = _2468;
            if (!_2466)
            {
                _2370 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _2470 = _2370;
            _2372 = _2470;
            if (!_2466)
            {
                _2328 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _2472 = _2328;
            _2330 = _2472;
            if (!_2466)
            {
                _2334 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _2474 = _2334;
            _2336 = _2474;
            if (!_2466)
            {
                _2392 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _2476 = _2392;
            _2394 = _2476;
            if (!_2466)
            {
                _2382 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _2478 = _2382;
            bool _2480 = !_2466;
            _2384 = _2478;
            if (!_2480)
            {
                bool _2482 = _1491 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _2484 = isnan(_1491);
                bool _2486 = _2482 || _2484;
                bool _2488 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _2490 = _2486 || _2488;
                if (!_2490)
                {
                    float _2492 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2494 = _1491 + _2492;
                    float _2496 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2498 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _2496;
                    float _2500 = 1.0 / _2498;
                    float _2502 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _2504 = _2502 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _2506 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _2508 = _2506 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _2510 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _2512 = _2510 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _2514 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _2516 = _2514 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _2518 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _2520 = _2518 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _2522 = _2494 * _2500;
                    float _2524 = precise::clamp(_2522, 0.0, 1.0);
                    float _2526 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _2528 = _2526 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _2530 = fma(_2524, _2504, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _2532 = fma(_2524, _2528, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _2534 = fma(_2524, _2508, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _2536 = fma(_2524, _2512, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _2538 = fma(_2524, _2516, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _2540 = fma(_2524, _2520, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _2372 = _2532;
                    _2394 = _2538;
                    _2342 = _2530;
                    _2336 = _2536;
                    _2330 = _2534;
                    _2384 = _2540;
                    _2456 = true;
                }
                else
                {
                    _2372 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _2394 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _2342 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _2336 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _2330 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _2384 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _2456 = false;
    float _2542 = _2372;
    float _2544 = _2394;
    float _2546 = _2342;
    float _2548 = _2336;
    float _2550 = _2330;
    float _2552 = _2384;
    float _2554 = fma(_2292, -0.5, 0.5);
    float _2556 = precise::clamp(_2554, 0.0, 1.0);
    float _2558 = -_2542;
    float _2560 = _2558 + _2544;
    float _2562 = -_2546;
    float _2564 = _2562 + _2548;
    float _2566 = -_2550;
    float _2568 = _2566 + _2552;
    bool _2570 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2572 = fma(_2556, _2560, _2542);
    float _2574 = fma(_2556, _2564, _2546);
    float _2576 = fma(_2556, _2568, _2550);
    float _2578 = _2572 * 0.586610972881317138671875;
    out.m_91.x = 0.0;
    float _2580 = fma(_2574, 0.298911988735198974609375, _2578);
    float _2582 = fma(_2576, 0.114477999508380889892578125, _2580);
    float _2584 = -_2582;
    float _2586 = _2574 + _2584;
    float _2588 = -_2582;
    float _2590 = _2572 + _2588;
    float _2592 = -_2582;
    float _2594 = _2576 + _2592;
    float _2596 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2598 = fma(_2586, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2582);
    float _2600 = fma(_2590, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2582);
    float _2602 = fma(_2594, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2582);
    out.m_49.x = _2596;
    out.m_93.x = _2598;
    out.m_93.y = _2600;
    out.m_93.z = _2602;
    if (!_2570)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_57.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_57.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_57.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_57.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_55.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_55.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_55.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_55.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_49.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_49.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_49.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_49.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_93.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_93.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_93.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_93.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_91.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_91.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_91.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_91.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _2604 = -_1459;
    float _2606 = _2604 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
    float _2608 = -_1461;
    float _2610 = _2608 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
    float _2612 = -_1463;
    float _2614 = _2612 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
    float _2616 = _2606 * _2606;
    float _2618 = fma(_2610, _2610, _2616);
    float _2620 = fma(_2614, _2614, _2618);
    float _2622 = sqrt(_2620);
    float _2624 = rsqrt(_2620);
    float _2626 = -_2622;
    float _2628 = _2626 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2630 = _2628 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
    float _2632 = precise::clamp(_2630, 0.0, 1.0);
    float _2634 = _2610 * _2624;
    float _2636 = _2606 * _2624;
    float _2638 = abs(_2632);
    float _2640 = log2(_2638);
    float _2642 = _2614 * _2624;
    float _2644 = _2634 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
    float _2646 = _2292 * _2636;
    float _2648 = -_2636;
    float _2650 = -_2644;
    float _2652 = fma(_2648, (*spvDescriptorSet0.vp_c15)._m0[656].y, _2650);
    float _2654 = fma(_2284, _2634, _2646);
    float _2656 = -_2642;
    float _2658 = fma(_2656, (*spvDescriptorSet0.vp_c15)._m0[656].z, _2652);
    float _2660 = fma(_2294, _2642, _2654);
    float _2662 = precise::clamp(_2660, 0.0, 1.0);
    float _2664 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
    float _2666 = _2658 + _2664;
    float _2668 = _2640 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
    float _2670 = _2666 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
    float _2672 = precise::clamp(_2670, 0.0, 1.0);
    float _2674 = exp2(_2668);
    float _2676 = _2674 * _2672;
    float _2678 = _2662 * _2676;
    float _2680 = _2678 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
    float _2682 = _2678 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
    float _2684 = _2678 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
    out.m_91.x = _2680;
    out.m_91.y = _2682;
    out.m_91.z = _2684;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_57.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_57.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_57.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_57.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_55.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_55.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_55.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_55.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_49.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_49.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_49.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_49.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_93.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_93.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_93.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_93.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_91.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_91.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_91.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_91.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

