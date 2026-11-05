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
    float4 m_55 [[user(locn0)]];
    float4 m_57 [[user(locn1)]];
    float4 m_49 [[user(locn2)]];
    float4 m_93 [[user(locn3)]];
    float4 m_67 [[user(locn4)]];
    float4 m_75 [[user(locn5)]];
    float4 m_83 [[user(locn6)]];
    float4 m_77 [[user(locn7)]];
    float4 m_85 [[user(locn8)]];
    float4 m_81 [[user(locn9)]];
    float4 m_73 [[user(locn10)]];
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
    out.m_55 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_57 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_49 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_93 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_67 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_75 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_83 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_77 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_85 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_81 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_73 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_91 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_87 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_89 = float4(0.0, 0.0, 0.0, 1.0);
    bool _2474 = false;
    bool _463 = false;
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
        float _2773 = as_type<float>(_128);
        out.gl_Position.z = _2773;
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
        float _2842 = as_type<float>(_166);
        out.gl_Position.z = _2842;
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
    float _212 = 1.0 / _206;
    bool _214 = _198 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _216 = isnan(_198);
    bool _218 = _214 || _216;
    bool _220 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _222 = _218 || _220;
    float _224 = float(_222);
    bool _226 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[14].x;
    float _228 = 1.0 / _210;
    float _230 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _232 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _230;
    float _234 = _202 * _200;
    float _236 = float(as_type<int>((*spvDescriptorSet0.vp_c9)._m0[8].z));
    float _238 = _236 * _200;
    float _240 = trunc(_234);
    int _242 = int(_240);
    float _244 = trunc(_238);
    int _246 = int(_244);
    int _248 = _242 << 4;
    int _250 = _248 + 1712;
    float _252 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _254 = _198 + _252;
    uint _257 = uint(int(uint(_250) >> uint(2)));
    uint _259 = uint(int(uint(int(_257)) >> uint(2)));
    int _261 = int(_257) & 3;
    float _263 = (*spvDescriptorSet0.vp_c9)._m0[int(_259)][_261];
    int _265 = int(_257) + 1;
    uint _267 = uint(int(uint(_265) >> uint(2)));
    int _269 = _265 & 3;
    float _271 = (*spvDescriptorSet0.vp_c9)._m0[int(_267)][_269];
    float _273 = _254 * _212;
    float _275 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _277 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _275;
    int _279 = _246 << 4;
    int _281 = _279 + 1968;
    float _283 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _285 = _198 + _283;
    float _287 = fma(_232, _273, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    bool _289 = _198 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _291 = isnan(_198);
    bool _293 = _289 || _291;
    bool _295 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _297 = _293 || _295;
    float _299 = float(_297);
    int _301 = _250 + 8;
    uint _303 = uint(int(uint(_301) >> uint(2)));
    uint _305 = uint(int(uint(int(_303)) >> uint(2)));
    int _307 = int(_303) & 3;
    float _309 = (*spvDescriptorSet0.vp_c9)._m0[int(_305)][_307];
    float _311 = _285 * _228;
    float _313 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _315 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _313;
    float _317 = fma(_277, _273, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _319 = fma(_315, _273, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _321 = -_224;
    float _323 = _321 + 1.0;
    uint _325 = uint(int(uint(_281) >> uint(2)));
    uint _327 = uint(int(uint(int(_325)) >> uint(2)));
    int _329 = int(_325) & 3;
    float _331 = (*spvDescriptorSet0.vp_c9)._m0[int(_327)][_329];
    int _333 = int(_325) + 1;
    uint _335 = uint(int(uint(_333) >> uint(2)));
    int _337 = _333 & 3;
    float _339 = (*spvDescriptorSet0.vp_c9)._m0[int(_335)][_337];
    bool _341 = _198 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _343 = isnan(_198);
    bool _345 = _341 || _343;
    bool _347 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _349 = _345 || _347;
    float _351 = float(_349);
    float _353 = _299 * _323;
    float _355 = -_299;
    float _357 = _355 + 1.0;
    int _359 = _281 + 8;
    uint _361 = uint(int(uint(_359) >> uint(2)));
    uint _363 = uint(int(uint(int(_361)) >> uint(2)));
    int _365 = int(_361) & 3;
    float _367 = (*spvDescriptorSet0.vp_c9)._m0[int(_363)][_365];
    float _369 = _351 * _357;
    float _371 = -_351;
    float _373 = _371 + 1.0;
    float _375 = _319 * _369;
    float _377 = fma(_373, (*spvDescriptorSet0.vp_c9)._m0[143].z, _375);
    float _379 = _263 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _381 = _271 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _383 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _385 = _309 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _387 = _331 * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _389 = _339 * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _391 = _379 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _393 = _385 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _395 = _387 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _397 = _389 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _399 = _317 * _369;
    float _401 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _403 = _401 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _405 = _367 * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _407 = _287 * _369;
    float _409 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _411 = _409 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _413 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _415 = _413 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _417 = _381 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _419 = _405 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _421 = fma(_411, _311, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _423 = fma(_403, _311, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _425 = fma(_373, (*spvDescriptorSet0.vp_c9)._m0[143].x, _399);
    float _427 = fma(_415, _311, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    float _429 = fma(_373, (*spvDescriptorSet0.vp_c9)._m0[143].y, _407);
    out.m_55.x = _391;
    out.m_55.y = _417;
    out.m_55.z = _393;
    out.m_55.w = _383;
    float _431 = fma(_421, _353, _425);
    float _433 = fma(_427, _353, _377);
    float _435 = fma(_423, _353, _429);
    out.m_57.x = _395;
    out.m_57.y = _397;
    out.m_57.z = _419;
    float _437 = fma(_224, (*spvDescriptorSet0.vp_c9)._m0[145].x, _431);
    float _439 = fma(_224, (*spvDescriptorSet0.vp_c9)._m0[145].y, _435);
    float _441 = fma(_224, (*spvDescriptorSet0.vp_c9)._m0[145].z, _433);
    bool _443 = !_226;
    float _445 = _431;
    float _461;
    if (!_443)
    {
        float _447 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[14].x;
        float _449 = _200 * (*spvDescriptorSet0.vp_c9)._m0[15].x;
        float _451 = fma(_449, (*spvDescriptorSet0.vp_c9)._m0[14].x, _146);
        float _453 = _451 * _447;
        float _455 = floor(_453);
        float _457 = -_455;
        float _459 = _453 + _457;
        _461 = _459;
        _463 = true;
    }
    else
    {
        float _465 = float(_112);
        float _467 = 1.0 / _465;
        float _469 = _146 * _467;
        _461 = _469;
    }
    _463 = false;
    float _471 = _461;
    float _473 = _200 * 2.0;
    float _475 = in.m_53.y;
    float _477 = -(*spvDescriptorSet0.vp_c9)._m0[159].w;
    float _479 = _477 + (*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _481 = floor(_473);
    float _483 = -(*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _485 = _483 + (*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _487 = -(*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _489 = _487 + (*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _491 = in.m_59.z;
    float _493 = -(*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _495 = _493 + (*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _497 = 1.0 / _479;
    float _499 = in.m_53.z;
    float _501 = -(*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _503 = _501 + (*spvDescriptorSet0.vp_c9)._m0[164].w;
    int _505 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _507 = _505 != 0;
    float _509 = in.m_59.x;
    float _511 = 1.0 / _485;
    int _513 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _515 = _513 != 0;
    int _517 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _519 = _517 != 0;
    int _521 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _523 = _521 != 0;
    float _525 = -(*spvDescriptorSet0.vp_c9)._m0[165].x;
    float _527 = (*spvDescriptorSet0.vp_c9)._m0[166].x + _525;
    bool _529 = _481 > 0.0;
    float _531 = _475 * 2.0;
    bool _533 = _481 >= 0.0;
    bool _535 = isnan(_481);
    bool _537 = _533 || _535;
    bool _539 = isnan(0.0);
    bool _541 = _537 || _539;
    float _543 = 1.0 / _489;
    if (_507)
    {
        _445 = _200;
    }
    float _545 = _445;
    bool _547 = _471 >= (*spvDescriptorSet0.vp_c9)._m0[163].w;
    bool _549 = isnan(_471);
    bool _551 = _547 || _549;
    bool _553 = isnan((*spvDescriptorSet0.vp_c9)._m0[163].w);
    bool _555 = _551 || _553;
    float _557 = float(_555);
    float _559 = 1.0 / _495;
    float _561 = -(*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _563 = _561 + (*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _565 = -(*spvDescriptorSet0.vp_c9)._m0[159].x;
    float _567 = (*spvDescriptorSet0.vp_c9)._m0[160].x + _565;
    float _569 = -(*spvDescriptorSet0.vp_c9)._m0[163].x;
    float _571 = (*spvDescriptorSet0.vp_c9)._m0[164].x + _569;
    float _573 = -(*spvDescriptorSet0.vp_c9)._m0[164].x;
    float _575 = _573 + (*spvDescriptorSet0.vp_c9)._m0[165].x;
    float _577 = _545;
    if (!_507)
    {
        _577 = _499;
    }
    float _579 = _577;
    float _581 = _567 * _497;
    float _583 = -(*spvDescriptorSet0.vp_c9)._m0[160].x;
    float _585 = _583 + (*spvDescriptorSet0.vp_c9)._m0[161].x;
    float _587 = 1.0 / _503;
    float _589 = _585 * _511;
    float _591 = -(*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _593 = _591 + (*spvDescriptorSet0.vp_c9)._m0[166].w;
    bool _595 = _471 >= (*spvDescriptorSet0.vp_c9)._m0[162].w;
    bool _597 = isnan(_471);
    bool _599 = _595 || _597;
    bool _601 = isnan((*spvDescriptorSet0.vp_c9)._m0[162].w);
    bool _603 = _599 || _601;
    float _605 = float(_603);
    float _607 = floor(_531);
    bool _609 = _471 >= (*spvDescriptorSet0.vp_c9)._m0[161].w;
    bool _611 = isnan(_471);
    bool _613 = _609 || _611;
    bool _615 = isnan((*spvDescriptorSet0.vp_c9)._m0[161].w);
    bool _617 = _613 || _615;
    float _619 = float(_617);
    float _621 = -_605;
    float _623 = _621 + 1.0;
    float _625 = -(*spvDescriptorSet0.vp_c9)._m0[161].x;
    float _627 = (*spvDescriptorSet0.vp_c9)._m0[162].x + _625;
    float _629 = -(*spvDescriptorSet0.vp_c9)._m0[162].x;
    float _631 = _629 + (*spvDescriptorSet0.vp_c9)._m0[163].x;
    float _633 = 1.0 / _593;
    float _635 = _571 * _587;
    float _637 = _627 * _543;
    float _639 = _499 * 2.0;
    float _641 = _631 * _559;
    float _643 = _475 + _499;
    bool _645 = _471 >= (*spvDescriptorSet0.vp_c9)._m0[165].w;
    bool _647 = isnan(_471);
    bool _649 = _645 || _647;
    bool _651 = isnan((*spvDescriptorSet0.vp_c9)._m0[165].w);
    bool _653 = _649 || _651;
    float _655 = float(_653);
    float _657 = -_619;
    float _659 = _657 + 1.0;
    float _661 = 1.0 / _563;
    float _663 = _643 + (-1.0);
    float _665 = -_655;
    float _667 = _665 + 1.0;
    float _669 = floor(_639);
    float _671 = _527 * _633;
    float _673 = fma(_663, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _675 = _200 + _475;
    int _677 = _541 ? 0 : 1;
    float _679 = _675 + (-1.0);
    float _681 = _575 * _661;
    bool _683 = _471 >= (*spvDescriptorSet0.vp_c9)._m0[164].w;
    bool _685 = isnan(_471);
    bool _687 = _683 || _685;
    bool _689 = isnan((*spvDescriptorSet0.vp_c9)._m0[164].w);
    bool _691 = _687 || _689;
    float _693 = float(_691);
    float _695 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _697 = log2(_695);
    int _699 = ~_677;
    int _701 = _699 + 1;
    int _703 = _701 + 1;
    int _705 = _703;
    float _707 = (*spvDescriptorSet0.vp_c9)._m0[198].x;
    if (!_529)
    {
        int _709 = ~_677;
        int _711 = _709 + 1;
        _705 = _711;
    }
    int _713 = _705;
    bool _715 = _607 > 0.0;
    bool _717 = _669 > 0.0;
    bool _719 = _669 >= 0.0;
    bool _721 = isnan(_669);
    bool _723 = _719 || _721;
    bool _725 = isnan(0.0);
    bool _727 = _723 || _725;
    float _729 = fma(_679, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    bool _731 = _471 >= (*spvDescriptorSet0.vp_c9)._m0[166].w;
    bool _733 = isnan(_471);
    bool _735 = _731 || _733;
    bool _737 = isnan((*spvDescriptorSet0.vp_c9)._m0[166].w);
    bool _739 = _735 || _737;
    float _741 = float(_739);
    if (_507)
    {
        _707 = _475;
    }
    float _743 = _707;
    float _745 = _743;
    if (!_507)
    {
        _745 = _200;
    }
    float _747 = _745;
    float _749 = -_741;
    float _751 = _749 + 1.0;
    bool _753 = _607 >= 0.0;
    bool _755 = isnan(_607);
    bool _757 = _753 || _755;
    bool _759 = isnan(0.0);
    bool _761 = _757 || _759;
    float _763 = -(*spvDescriptorSet0.vp_c9)._m0[159].w;
    float _765 = _471 + _763;
    float _767 = _697 * _146;
    float _769 = _655 * _751;
    float _771 = _747 * (*spvDescriptorSet0.vp_c9)._m0[87].y;
    float _773 = fma(_581, _765, (*spvDescriptorSet0.vp_c9)._m0[159].x);
    float _775 = -(*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _777 = _471 + _775;
    float _779 = _693 * _667;
    float _781 = -_693;
    float _783 = _781 + 1.0;
    bool _785 = _471 >= (*spvDescriptorSet0.vp_c9)._m0[160].w;
    bool _787 = isnan(_471);
    bool _789 = _785 || _787;
    bool _791 = isnan((*spvDescriptorSet0.vp_c9)._m0[160].w);
    bool _793 = _789 || _791;
    float _795 = float(_793);
    float _797 = fma(_589, _777, (*spvDescriptorSet0.vp_c9)._m0[160].x);
    float _799 = -(*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _801 = _471 + _799;
    float _803 = _557 * _783;
    float _805 = -_557;
    float _807 = _805 + 1.0;
    float _809 = _795 * _659;
    float _811 = fma(_637, _801, (*spvDescriptorSet0.vp_c9)._m0[161].x);
    float _813 = -(*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _815 = _471 + _813;
    float _817 = _605 * _807;
    float _819 = -(*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _821 = _471 + _819;
    float _823 = -_795;
    float _825 = _823 + 1.0;
    float _827 = fma(_641, _815, (*spvDescriptorSet0.vp_c9)._m0[162].x);
    float _829 = _619 * _623;
    float _831 = fma(_635, _821, (*spvDescriptorSet0.vp_c9)._m0[163].x);
    bool _833 = _471 >= (*spvDescriptorSet0.vp_c9)._m0[159].w;
    bool _835 = isnan(_471);
    bool _837 = _833 || _835;
    bool _839 = isnan((*spvDescriptorSet0.vp_c9)._m0[159].w);
    bool _841 = _837 || _839;
    float _843 = float(_841);
    float _845 = -(*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _847 = _471 + _845;
    float _849 = -(*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _851 = _471 + _849;
    float _853 = exp2(_767);
    float _855 = fma(_681, _847, (*spvDescriptorSet0.vp_c9)._m0[164].x);
    float _857 = _843 * _825;
    float _859 = fma(_671, _851, (*spvDescriptorSet0.vp_c9)._m0[165].x);
    float _861 = -_843;
    float _863 = _861 + 1.0;
    float _865 = _773 * _857;
    float _867 = _579 * (*spvDescriptorSet0.vp_c9)._m0[87].x;
    float _869 = (*spvDescriptorSet0.vp_c9)._m0[87].x + (*spvDescriptorSet0.vp_c9)._m0[86].z;
    bool _871 = !_519;
    int _873 = _871 ? 0 : 1;
    float _875 = fma(_863, (*spvDescriptorSet0.vp_c9)._m0[159].x, _865);
    float _877 = (*spvDescriptorSet0.vp_c9)._m0[87].y + (*spvDescriptorSet0.vp_c9)._m0[86].w;
    float _879 = -_869;
    float _881 = fma(_867, 2.0, _879);
    int _883 = abs(_873);
    float _885 = fma(_797, _809, _875);
    int _887 = _727 ? 0 : 1;
    float _889 = fma(_771, -2.0, _877);
    float _891 = fma(_811, _829, _885);
    int _893 = ~_887;
    int _895 = _893 + 1;
    int _897 = _895 + 1;
    float _899 = -_853;
    float _901 = _899 + 1.0;
    int _903 = _897;
    if (!_717)
    {
        int _905 = ~_887;
        int _907 = _905 + 1;
        _903 = _907;
    }
    int _909 = _903;
    float _911 = fma(_827, _817, _891);
    float _913 = in.m_61.x;
    float _915 = in.m_61.y;
    float _917 = in.m_61.z;
    float _919 = float(_883);
    float _921 = float(_713);
    float _923 = fma(_831, _803, _911);
    bool _925 = !_515;
    int _927 = _925 ? 0 : 1;
    float _929 = _919 * _921;
    float _931 = (*spvDescriptorSet0.vp_c9)._m0[88].z + (*spvDescriptorSet0.vp_c9)._m0[88].x;
    float _933 = fma(_855, _779, _923);
    int _935 = _761 ? 0 : 1;
    float _937 = (*spvDescriptorSet0.vp_c9)._m0[88].w + (*spvDescriptorSet0.vp_c9)._m0[88].y;
    float _939 = fma(_200, (*spvDescriptorSet0.vp_c9)._m0[88].z, _931);
    int _941 = abs(_927);
    float _943 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _945 = 1.0 + _943;
    float _947 = fma(_475, (*spvDescriptorSet0.vp_c9)._m0[88].w, _937);
    int _949 = ~_935;
    int _951 = _949 + 1;
    int _953 = _951 + 1;
    float _955 = fma(_859, _769, _933);
    float _957 = 1.0 / _945;
    float _959 = fma(_146, (*spvDescriptorSet0.vp_c9)._m0[87].z, _939);
    float _961 = -_146;
    float _963 = fma(_961, (*spvDescriptorSet0.vp_c9)._m0[86].x, _881);
    float _965 = _929 * (-2.0);
    int _967 = _953;
    if (!_715)
    {
        int _969 = ~_935;
        int _971 = _969 + 1;
        _967 = _971;
    }
    int _973 = _967;
    float _975 = fma(_146, (*spvDescriptorSet0.vp_c9)._m0[87].w, _947);
    bool _977 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _979 = isnan(1.0);
    bool _981 = _977 || _979;
    bool _983 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _985 = _981 || _983;
    float _987 = fma(_965, _915, _915);
    float _989 = float(_909);
    float _991 = fma(_673, _965, _673);
    float _993 = float(_941);
    float _995 = _475 + (-0.5);
    bool _997 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _999 = isnan(0.0);
    bool _1001 = _997 || _999;
    bool _1003 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1005 = _1001 || _1003;
    float _1007 = fma(_146, (*spvDescriptorSet0.vp_c9)._m0[86].y, _889);
    bool _1009 = !_523;
    int _1011 = _1009 ? 0 : 1;
    float _1013 = _993 * _989;
    float _1015 = _1005 ? _901 : 0.0;
    float _1017 = fma(_995, (*spvDescriptorSet0.vp_c9)._m0[196].y, _987);
    int _1019 = abs(_1011);
    float _1021 = _1013 * (-2.0);
    float _1023 = float(_973);
    float _1025 = _1017;
    if (_985)
    {
        float _1027 = _1015 * _957;
        _150 = _1027;
    }
    float _1029 = _150;
    float _1031 = fma(_729, _1021, _729);
    float _1033 = fma(_1021, _913, _913);
    float _1035 = _200 + (-0.5);
    float _1037 = float(_1019);
    float _1039 = fma(_991, _1029, _1017);
    float _1041 = fma(_1035, (*spvDescriptorSet0.vp_c9)._m0[196].x, _1033);
    float _1043 = fma(_741, (*spvDescriptorSet0.vp_c9)._m0[166].x, _955);
    float _1045 = _1037 * _1023;
    float _1047 = _1039 * 0.15915493667125701904296875;
    float _1049 = (*spvDescriptorSet0.vp_c9)._m0[191].x * (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _1051 = _200 + _491;
    float _1053 = in.m_63.x;
    float _1055 = in.m_63.y;
    float _1057 = in.m_63.z;
    float _1059 = fma(_1031, _1029, _1041);
    float _1061 = _200 + _499;
    float _1063 = fma(_1043, _1049, _1051);
    float _1065 = in.m_46.x;
    float _1067 = in.m_46.y;
    float _1069 = in.m_46.z;
    float _1071 = _1061 + (-1.0);
    float _1073 = _1045 * (-2.0);
    float _1075 = _1063 * (*spvDescriptorSet0.vp_c9)._m0[191].y;
    float _1077 = _1047 * 6.283185482025146484375;
    float _1079 = sin(_1077);
    float _1081 = fma(_1071, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _1083 = fma(_1073, _917, _917);
    float _1085 = _1075 * 0.15915493667125701904296875;
    float _1087 = _499 + (-0.5);
    float _1089 = in.m_59.y;
    float _1091 = fma(_1081, _1073, _1081);
    float _1093 = _1059 * 0.15915493667125701904296875;
    float _1095 = fma(_1087, (*spvDescriptorSet0.vp_c9)._m0[196].z, _1083);
    float _1097 = _1085 * 6.283185482025146484375;
    float _1099 = sin(_1097);
    float _1101 = fma(_1091, _1029, _1095);
    float _1103 = _441 * _1057;
    float _1105 = _437 * _1053;
    float _1107 = _1047 * 6.283185482025146484375;
    float _1109 = cos(_1107);
    float _1111 = _439 * _1055;
    float _1113 = _1067 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _1115 = _1067 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _1117 = _1067 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _1119 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _509);
    float _1121 = fma(_1065, (*spvDescriptorSet0.vp_c10)._m0[4].x, _1113);
    float _1123 = fma(_1065, (*spvDescriptorSet0.vp_c10)._m0[5].x, _1115);
    float _1125 = _1093 * 6.283185482025146484375;
    float _1127 = cos(_1125);
    float _1129 = _1101 * 0.15915493667125701904296875;
    float _1131 = fma(_1065, (*spvDescriptorSet0.vp_c10)._m0[6].x, _1117);
    float _1133 = fma(_475, (*spvDescriptorSet0.vp_c9)._m0[191].z, 0.20000000298023223876953125);
    float _1135 = _1105 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1137 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _491);
    float _1139 = _1103 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _1141 = fma(_1099, _1133, _1089);
    float _1143 = _1093 * 6.283185482025146484375;
    float _1145 = sin(_1143);
    float _1147 = _1119 * _1135;
    float _1149 = _1137 * _1139;
    float _1151 = _1111 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1153 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _1141);
    float _1155 = fma(_1069, (*spvDescriptorSet0.vp_c10)._m0[5].z, _1123);
    float _1157 = fma(_1069, (*spvDescriptorSet0.vp_c10)._m0[4].z, _1121);
    float _1159 = fma(_1069, (*spvDescriptorSet0.vp_c10)._m0[6].z, _1131);
    float _1161 = _1129 * 6.283185482025146484375;
    float _1163 = cos(_1161);
    float _1165 = _1127 * _1109;
    float _1167 = _1127 * _1079;
    float _1169 = _1153 * _1151;
    float _1171 = _1155 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _1173 = _1159 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _1175 = _1129 * 6.283185482025146484375;
    float _1177 = sin(_1175);
    float _1179 = _1145 * _1079;
    float _1181 = _1145 * _1109;
    bool _1183 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _1185 = isnan(0.5);
    bool _1187 = _1183 || _1185;
    bool _1189 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1191 = _1187 || _1189;
    bool _1193 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _1195 = isnan(0.5);
    bool _1197 = _1193 || _1195;
    bool _1199 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1201 = _1197 || _1199;
    float _1203 = _1127 * _1163;
    float _1205 = _1145 * _1163;
    float _1207 = _1109 * _1163;
    float _1209 = _1079 * _1163;
    float _1211 = _1203 * _1169;
    float _1213 = _1205 * _1169;
    float _1215 = fma(_1177, _1165, _1179);
    float _1217 = -_1167;
    float _1219 = fma(_1177, _1181, _1217);
    float _1221 = -_1181;
    float _1223 = fma(_1177, _1167, _1221);
    float _1225 = -_1169;
    float _1227 = _1177 * _1225;
    float _1229 = fma(_1215, _1147, _1211);
    float _1231 = fma(_1177, _1179, _1165);
    float _1233 = fma(_1219, _1147, _1213);
    float _1235 = fma(_1207, _1147, _1227);
    float _1237 = fma(_1223, _1149, _1229);
    float _1239 = _1171 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1241 = fma(_1231, _1149, _1233);
    float _1243 = fma(_1209, _1149, _1235);
    float _1245 = _1237 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _1247 = _1157 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _1249 = _1237 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _1251 = fma(_1243, (*spvDescriptorSet0.vp_c10)._m0[10].x, _1245);
    float _1253 = fma(_1247, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1239);
    float _1255 = fma(_1243, (*spvDescriptorSet0.vp_c10)._m0[8].x, _1249);
    float _1257 = _1171 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1259 = fma(_1241, (*spvDescriptorSet0.vp_c10)._m0[10].z, _1251);
    float _1261 = fma(_1173, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1253);
    float _1263 = fma(_1241, (*spvDescriptorSet0.vp_c10)._m0[8].z, _1255);
    float _1265 = _1173 + _1259;
    float _1267 = _1261 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1269 = _1247 + _1263;
    float _1271 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1273 = _1265 + _1271;
    float _1275 = 1.0 / _1267;
    float _1277 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1279 = _1269 + _1277;
    float _1281 = _1273 * _1273;
    float _1283 = fma(_1279, _1279, _1281);
    float _1285 = fma(_1247, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1257);
    float _1287 = _1237 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _1289 = sqrt(_1283);
    float _1291 = fma(_1173, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1285);
    float _1293 = fma(_1243, (*spvDescriptorSet0.vp_c10)._m0[9].x, _1287);
    float _1295 = _1291 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1297 = fma(_1241, (*spvDescriptorSet0.vp_c10)._m0[9].z, _1293);
    float _1299 = _1295 + _1267;
    float _1301 = _1171 + _1297;
    float _1303 = _1299 * _1275;
    float _1305 = _1303 * 0.5;
    bool _1307 = _1289 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1309 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1311 = fma(_1305, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1309);
    float _1313 = 1.0 / _1311;
    float _1315 = _1275;
    float _1317 = _1265;
    float _1319 = _1241;
    float _1321 = _1289;
    float _1323 = _1301;
    float _1325 = _1247;
    float _1327 = _1073;
    if (!_1307)
    {
        _1315 = _1269;
    }
    float _1329 = _1315;
    float _1331 = _1329;
    if (!_1307)
    {
        _1025 = _1301;
    }
    float _1333 = _1025;
    bool _1335 = !_1307;
    float _1337 = _1333;
    if (!_1335)
    {
        float _1339 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1341 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1343 = _1289 + _1341;
        float _1345 = _1301 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1347 = _1343 * _1339;
        float _1349 = rsqrt(_1283);
        float _1351 = _1347 * 0.15915493667125701904296875;
        float _1353 = _1351 * 6.283185482025146484375;
        float _1355 = cos(_1353);
        float _1357 = _1351 * 6.283185482025146484375;
        float _1359 = sin(_1357);
        float _1361 = _1355 + (-1.0);
        float _1363 = _1361 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1365 = fma(_1359, _1345, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1367 = fma(_1301, _1355, _1363);
        float _1369 = _1349 * _1365;
        float _1371 = fma(_1279, _1369, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1373 = fma(_1273, _1369, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1337 = _1367;
        _1331 = _1371;
        _1317 = _1373;
        _1319 = _1351;
        _1321 = _1349;
    }
    float _1375 = _1337;
    float _1377 = _1331;
    float _1379 = _1317;
    float _1381 = _1319;
    float _1383 = _1321;
    float _1385 = _1383;
    float _1387 = _1375;
    float _1389 = _1377;
    float _1391 = _1379;
    float _1393 = _1381;
    if (_1201)
    {
        _1385 = 1.0;
    }
    float _1395 = _1385;
    float _1397 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1399 = _1313 * _1397;
    float _1401 = _1395;
    if (!_1191)
    {
        float _1403 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _1405 = _1171 + _1403;
        float _1407 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _1409 = _1247 + _1407;
        float _1411 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1413 = -_1171;
        float _1415 = _1413 + _1375;
        float _1417 = _1405 * _1405;
        float _1419 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _1421 = _1173 + _1419;
        float _1423 = -_1247;
        float _1425 = _1423 + _1377;
        float _1427 = -_1173;
        float _1429 = _1427 + _1379;
        float _1431 = fma(_1409, _1409, _1417);
        float _1433 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1435 = fma(_1421, _1421, _1431);
        float _1437 = sqrt(_1435);
        float _1439 = _1411 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1441 = precise::min(_1437, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1443 = _1441 * _1433;
        float _1445 = _1439 * _1443;
        float _1447 = fma(_1415, _1445, _1171);
        float _1449 = fma(_1425, _1445, _1247);
        float _1451 = fma(_1429, _1445, _1173);
        _1387 = _1447;
        _1389 = _1449;
        _1391 = _1451;
        _1393 = _1433;
    }
    float _1453 = _1387;
    float _1455 = _1389;
    float _1457 = _1391;
    float _1459 = _1393;
    float _1461 = _1459;
    if (!_1201)
    {
        float _1463 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1465 = _1463 * 0.15915493667125701904296875;
        float _1467 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1469 = _1465 * 6.283185482025146484375;
        float _1471 = cos(_1469);
        float _1473 = _1467 * 0.15915493667125701904296875;
        float _1475 = _1465 * 6.283185482025146484375;
        float _1477 = sin(_1475);
        float _1479 = 1.0 / _1471;
        float _1481 = _1473 * 6.283185482025146484375;
        float _1483 = cos(_1481);
        float _1485 = _1477 * _1479;
        float _1487 = _1473 * 6.283185482025146484375;
        float _1489 = sin(_1487);
        float _1491 = _1483 * _1485;
        float _1493 = 1.0 / _1491;
        float _1495 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1497 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _1495;
        float _1499 = 1.0 / _1497;
        float _1501 = _1489 * _1493;
        float _1503 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1505 = fma(_1399, _1501, _1503);
        float _1507 = _1505 * _1499;
        float _1509 = precise::clamp(_1507, 0.0, 1.0);
        _1401 = _1509;
    }
    float _1511 = _1401;
    float _1513 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1515 = _1453 + _1513;
    float _1517 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1519 = _1455 + _1517;
    float _1521 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1523 = _1457 + _1521;
    float _1525 = _1515 * _1515;
    float _1527 = fma(_1519, _1519, _1525);
    float _1529 = fma(_1523, _1523, _1527);
    float _1531 = rsqrt(_1529);
    float _1533 = sqrt(_1529);
    float _1535 = _1531 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1537 = _1519 * _1535;
    float _1539 = _1523 * _1535;
    float _1541 = _1537 * _1537;
    float _1543 = _1539 * _1539;
    float _1545 = _1541 + _1543;
    float _1547 = sqrt(_1545);
    bool _1549 = _1547 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1551 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1553 = _1547 + _1551;
    float _1555 = _1523;
    float _1557 = _1525;
    float _1559 = _1553;
    if (_1549)
    {
        float _1561 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1555 = _1561;
    }
    float _1563 = _1555;
    if (_1549)
    {
        float _1565 = rsqrt(_1545);
        _1557 = _1565;
    }
    float _1567 = _1557;
    float _1569 = _1567;
    if (_1549)
    {
        float _1571 = _1553 * _1563;
        _1559 = _1571;
    }
    float _1573 = _1559;
    if (_1549)
    {
        float _1575 = _1573 * 0.15915493667125701904296875;
        _1323 = _1575;
    }
    float _1577 = _1323;
    float _1579 = _1563;
    float _1581 = _1577;
    if (_1549)
    {
        float _1583 = _1577 * 6.283185482025146484375;
        float _1585 = sin(_1583);
        _1579 = _1585;
    }
    float _1587 = _1579;
    float _1589 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1591 = precise::max(0.0, _1589);
    float _1593 = _1531;
    float _1595 = _1591;
    if (_1549)
    {
        float _1597 = _1577 * 6.283185482025146484375;
        float _1599 = cos(_1597);
        _1593 = _1599;
    }
    float _1601 = _1593;
    float _1603 = -_1535;
    float _1605 = -_1591;
    float _1607 = fma(_1515, _1603, _1605);
    if (_1549)
    {
        float _1609 = _1607 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1595 = _1609;
    }
    float _1611 = _1595;
    float _1613 = fma(_1247, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _1615 = _1611;
    if (!_1549)
    {
        _1325 = _1539;
    }
    float _1617 = _1325;
    float _1619 = _1587;
    float _1621 = _1617;
    if (_1549)
    {
        float _1623 = fma(_1587, _1611, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1461 = _1623;
    }
    float _1625 = _1461;
    if (!_1549)
    {
        _1619 = _1607;
    }
    float _1627 = _1619;
    float _1629 = floor(_1613);
    float _1631 = _1627;
    float _1633 = _1601;
    if (_1549)
    {
        float _1635 = _1601 + (-1.0);
        _1615 = _1635;
    }
    float _1637 = _1615;
    float _1639 = _1637;
    if (_1549)
    {
        float _1641 = _1567 * _1625;
        _1327 = _1641;
    }
    float _1643 = _1327;
    if (!_1549)
    {
        _1569 = _1537;
    }
    float _1645 = _1569;
    float _1647 = _1645;
    if (_1549)
    {
        float _1649 = _1637 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1581 = _1649;
    }
    float _1651 = _1581;
    if (_1549)
    {
        float _1653 = _1537 * _1643;
        _1647 = _1653;
    }
    float _1655 = _1647;
    if (!_1549)
    {
        _1639 = _1541;
    }
    float _1657 = _1639;
    float _1659 = _1657;
    if (_1549)
    {
        float _1661 = _1539 * _1643;
        _1621 = _1661;
    }
    float _1663 = _1621;
    if (_1549)
    {
        float _1665 = fma(_1607, _1601, _1651);
        _1631 = _1665;
    }
    float _1667 = _1631;
    if (_1549)
    {
        float _1669 = _1655 * _1655;
        _1659 = _1669;
    }
    float _1671 = _1659;
    if (!_1549)
    {
        _1633 = _1543;
    }
    float _1673 = _1633;
    float _1675 = _1673;
    if (_1549)
    {
        float _1677 = _1663 * _1663;
        _1675 = _1677;
    }
    float _1679 = _1675;
    float _1681 = fma(_1667, _1667, _1671);
    float _1683 = _1453 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1685 = _1453 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1687 = -_1629;
    float _1689 = _1613 + _1687;
    float _1691 = _1681 + _1679;
    float _1693 = fma(_1455, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1683);
    float _1695 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1697 = fma(_1533, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1695);
    float _1699 = precise::clamp(_1697, 0.0, 1.0);
    float _1701 = rsqrt(_1691);
    float _1703 = fma(_1457, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1693);
    float _1705 = -_1699;
    float _1707 = _1705 + 1.0;
    float _1709 = fma(_1173, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _1711 = _1703 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1713 = _1453 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1715 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _1717 = fma(_1455, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1685);
    float _1719 = _1711 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1721 = _1453 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1723 = fma(_1455, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1713);
    float _1725 = abs(_1707);
    float _1727 = log2(_1725);
    float _1729 = -_1719;
    float _1731 = fma(_1729, _1715, 1.0);
    float _1733 = fma(_1455, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1721);
    float _1735 = fma(_1457, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1723);
    float _1737 = _1701 * _1655;
    float _1739 = _1701 * _1667;
    float _1741 = fma(_1457, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1733);
    float _1743 = _1735 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1745 = _1737 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1747 = _1701 * _1663;
    float _1749 = _1741 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1751 = _1743 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1753 = -_1745;
    float _1755 = fma(_1739, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1753);
    float _1757 = floor(_1709);
    float _1759 = _1739 + 1.0;
    float _1761 = fma(_1749, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1751);
    float _1763 = -_1747;
    float _1765 = fma(_1763, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1755);
    float _1767 = fma(_1457, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1717);
    float _1769 = _1727 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1771 = fma(_1711, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1761);
    float _1773 = fma(_1765, -0.5, 0.5);
    float _1775 = _1767 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1777 = log2(_1731);
    float _1779 = fma(_1765, 0.5, 0.5);
    float _1781 = fma(_1775, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1771);
    float _1783 = _1743 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1785 = _1743 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1787 = -_1757;
    float _1789 = _1709 + _1787;
    float _1791 = fma(_1779, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1793 = exp2(_1769);
    float _1795 = fma(_1749, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1783);
    float _1797 = fma(_1749, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1785);
    float _1799 = fma(_1779, _1791, -0.212114393711090087890625);
    float _1801 = fma(_1711, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1795);
    float _1803 = fma(_1711, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1797);
    float _1805 = 1.0 / _1781;
    float _1807 = fma(_1775, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1801);
    float _1809 = fma(_1775, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1803);
    float _1811 = sqrt(_1773);
    float _1813 = -_1739;
    float _1815 = fma(_1793, _1759, _1813);
    float _1817 = _1777 * 0.693147182464599609375;
    float2 _5470 = float2(_1689, _1789);
    float _1819 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_5470, float2(0.0), isnan(_5470)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_5470, float2(0.0), isnan(_5470)), level(0.0)).x;
    float _1821 = fma(_1779, _1799, 1.570728778839111328125);
    float _1823 = fma(_1815, 0.5, 0.5);
    float _1825 = _1817 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1827 = _1807 * _1805;
    float _1829 = _1809 * _1805;
    float _1831 = fma(_1827, 0.5, 0.5);
    float _1833 = fma(_1829, -0.5, 0.5);
    float _1835 = _1811 * 0.636619746685028076171875;
    float3 _5504 = float3(_1831, _1833, _1825);
    float _1837 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_5504, float3(0.0), isnan(_5504)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_5504, float3(0.0), isnan(_5504)), level(0.0)).x;
    float _1839 = -_1821;
    float _1841 = fma(_1835, _1839, 1.0);
    float3 _5520 = float3(_1831, _1833, _1825);
    float4 _1844 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_5520, float3(0.0), isnan(_5520)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_5520, float3(0.0), isnan(_5520)), level(0.0)).xyzw;
    float _1846 = _1844.x;
    float _1848 = _1844.y;
    float _1850 = _1844.z;
    float _1852 = _1844.w;
    float2 _5536 = float2(_1841, _1823);
    float3 _1856 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_5536, float2(0.0), isnan(_5536)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_5536, float2(0.0), isnan(_5536)), level(0.0)).xyz;
    float _1858 = _1856.x;
    float _1860 = _1856.y;
    float _1862 = _1856.z;
    float _1864 = in.m_65.y;
    float _1866 = abs(_1399);
    float _1868 = log2(_1866);
    bool _1870 = _475 > 0.5;
    float _1872 = in.m_53.w;
    int _1874 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1876 = _1874 != 0;
    int _1878 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32;
    bool _1880 = _1878 != 0;
    float _1882 = in.m_65.x;
    bool _1884 = _499 > 0.5;
    float _1886 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].w;
    int _1888 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1890 = _1888 != 0;
    int _1892 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _1894 = _1892 != 0;
    float _1896 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].z;
    float _1898 = -_1864;
    float _1900 = _1898 + 1.0;
    float _1902 = _1868 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    out.m_67.x = 1.0;
    out.m_67.y = 1.0;
    out.m_67.z = 1.0;
    bool _1904 = _1399 <= 8000.0;
    bool _1906 = isnan(_1399);
    bool _1908 = _1904 || _1906;
    bool _1910 = isnan(8000.0);
    bool _1912 = _1908 || _1910;
    float _1914 = float(_1912);
    bool _1916 = _1872 > 0.5;
    int _1918 = _1870 ? as_type<int>(_1900) : as_type<int>(_1864);
    float _1920 = exp2(_1902);
    float _1922 = _1833;
    float _1924 = _1868;
    float _1926 = _1864;
    int _1928 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y);
    float _1930 = _1886;
    float _1932 = _1781;
    float _1934 = _1809;
    if (!_1876)
    {
        _1922 = _1882;
    }
    float _1936 = _1922;
    int _1938 = _1916 ? as_type<int>(_1900) : as_type<int>(_1864);
    float _1940 = _1890 ? as_type<float>(_1918) : _1864;
    int _1942 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16;
    bool _1944 = _1942 != 0;
    float _1946 = in.m_69.x;
    float _1948 = in.m_69.y;
    float _1950 = in.m_69.z;
    float _1952 = in.m_69.w;
    int _1954 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _1956 = _1954 != 0;
    float _1958 = _1936;
    bool _1960 = _1956;
    if (!_1876)
    {
        _1924 = _1936;
    }
    float _1962 = _1924;
    float _1964 = _1962;
    if (_1876)
    {
        _1958 = _1882;
    }
    float _1966 = _1958;
    float _1968 = _1956 ? as_type<float>(_1938) : _1864;
    float _1970 = fma(_1920, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _1972 = precise::clamp(_1970, 0.0, 1.0);
    float _1974 = _1966;
    if (_1880)
    {
        float _1976 = _1884 ? _1900 : _1864;
        _1926 = _1976;
    }
    float _1978 = _1926;
    float _1980 = _1886 * (*spvDescriptorSet0.vp_c9)._m0[90].y;
    int _1982 = as_type<int>(_1978);
    if (_1876)
    {
        float _1984 = -_1966;
        float _1986 = _1984 + 1.0;
        _1928 = as_type<int>(_1986);
    }
    int _1988 = _1928;
    int _1990 = _1988;
    if (_1876)
    {
        bool _1992 = _200 > 0.5;
        _1960 = _1992;
    }
    bool _1994 = _1960;
    float _1996 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _1998 = fma(_1980, _1978, -0.5);
    if (_1894)
    {
        float _2000 = -_1966;
        float _2002 = _2000 + 1.0;
        _1982 = as_type<int>(_2002);
    }
    int _2004 = _1982;
    if (_1876)
    {
        float _2006 = _1994 ? as_type<float>(_1988) : _1966;
        _1964 = _2006;
    }
    float _2008 = _1964;
    if (_1944)
    {
        float _2010 = -_1966;
        float _2012 = _2010 + 1.0;
        _1990 = as_type<int>(_2012);
    }
    int _2014 = _1990;
    if (!_1894)
    {
        _1930 = _1966;
    }
    float _2016 = _1930;
    float _2018 = _2016;
    if (_1894)
    {
        float _2020 = _1884 ? as_type<float>(_2004) : _1966;
        _2018 = _2020;
    }
    float _2022 = _2018;
    float _2024 = _1896 * (*spvDescriptorSet0.vp_c9)._m0[90].x;
    if (_1944)
    {
        float _2026 = _1870 ? as_type<float>(_2014) : _1966;
        _1974 = _2026;
    }
    float _2028 = _1974;
    float _2030 = -_1007;
    float _2032 = fma(_975, _1998, _2030);
    float _2034 = _1203 * _1948;
    float _2036 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _2038 = fma(_2024, _2028, -0.5);
    float _2040 = _1972 * _1972;
    float _2042 = fma(_1972, -2.0, 3.0);
    float _2044 = -_1948;
    float _2046 = _1177 * _2044;
    float _2048 = fma(_1215, _1946, _2034);
    float _2050 = fma(_959, _2038, _963);
    bool _2052 = _1141 != 0.0;
    bool _2054 = isnan(_1141);
    bool _2056 = _2052 || _2054;
    bool _2058 = isnan(0.0);
    bool _2060 = _2056 || _2058;
    float _2062 = fma(_1207, _1946, _2046);
    float _2064 = fma(_1223, _1950, _2048);
    float _2066 = in.m_71.x;
    float _2068 = in.m_71.y;
    float _2070 = in.m_71.z;
    float _2072 = _2040 * _2042;
    float _2074 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _2076 = fma(_1209, _1950, _2062);
    float _2078 = _2064 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    bool _2080 = _509 == 0.0;
    bool _2082 = !_2060;
    bool _2084 = _2080 && _2082;
    float _2086 = _2064 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _2088 = _2064 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _2090 = fma(_2076, (*spvDescriptorSet0.vp_c10)._m0[8].x, _2078);
    float _2092 = _1205 * _1948;
    float _2094 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    bool _2096 = _491 == 0.0;
    bool _2098 = _2096 && _2084;
    float _2100 = _1940 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _2102 = fma(_2076, (*spvDescriptorSet0.vp_c10)._m0[9].x, _2086);
    float _2104 = fma(_2076, (*spvDescriptorSet0.vp_c10)._m0[10].x, _2088);
    float _2106 = fma(_1219, _1946, _2092);
    float _2108 = _2100 * _2036;
    float _2110 = _1968 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _2112 = _2008 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _2114 = fma(_1231, _1950, _2106);
    float _2116 = _2022 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _2118 = -_2072;
    float _2120 = _2118 + 1.0;
    float _2122 = _2032 + 0.5;
    float _2124 = fma(_2114, (*spvDescriptorSet0.vp_c10)._m0[8].z, _2090);
    float _2126 = fma(_2114, (*spvDescriptorSet0.vp_c10)._m0[10].z, _2104);
    float _2128 = fma(_2120, (*spvDescriptorSet0.vp_c15)._m0[654].w, _2072);
    float _2130 = _2110 * _2094;
    float _2132 = _2112 * _2074;
    float _2134 = fma(_2114, (*spvDescriptorSet0.vp_c10)._m0[9].z, _2102);
    float _2136 = _2102;
    float _2138 = _2050;
    float _2140 = _2072;
    float _2142 = _2114;
    float _2144 = _2120;
    float _2146 = _2066;
    if (_2098)
    {
        _2136 = _2066;
    }
    float _2148 = _2136;
    float _2150 = _2116 * _1996;
    float _2152 = _2050 + 0.5;
    float _2154 = _2148;
    if (_2098)
    {
        _2138 = _2068;
    }
    float _2156 = _2138;
    out.m_73.x = _2124;
    out.m_73.y = _2134;
    out.m_73.z = _2126;
    float _2158 = _2156;
    if (_2098)
    {
        _2140 = _2148;
    }
    float _2160 = _2140;
    float _2162 = _2160;
    if (_2098)
    {
        _2142 = _2070;
    }
    float _2164 = _2142;
    out.m_75.x = _2132;
    out.m_75.y = _2108;
    out.m_75.z = _2150;
    out.m_75.w = _2130;
    float _2166 = _2164;
    if (!_2098)
    {
        _2154 = _2066;
    }
    float _2168 = _2154;
    if (_2098)
    {
        _2144 = _2156;
    }
    float _2170 = _2144;
    out.m_77.x = _2152;
    out.m_77.y = _2122;
    float _2172 = _2170;
    if (!_2098)
    {
        _2158 = _2068;
    }
    float _2174 = _2158;
    if (!_2098)
    {
        float _2176 = fma(_509, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2168);
        _2162 = _2176;
    }
    float _2178 = _2162;
    if (_2098)
    {
        _2146 = _2164;
    }
    float _2180 = _2146;
    float _2182 = _1727 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _2184 = _2180;
    if (!_2098)
    {
        _2166 = _2070;
    }
    float _2186 = _2166;
    float _2188 = _1946 * _2174;
    if (!_2098)
    {
        float _2190 = fma(_1141, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2174);
        _2172 = _2190;
    }
    float _2192 = _2172;
    float _2194 = _1950 * _2168;
    float _2196 = _1948 * _2186;
    float _2198 = -_2188;
    float _2200 = fma(_1948, _2168, _2198);
    float _2202 = _1203 * _2192;
    float _2204 = -_2194;
    float _2206 = fma(_1946, _2186, _2204);
    float _2208 = -_2196;
    float _2210 = fma(_1950, _2174, _2208);
    float _2212 = _1743 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _2214 = -_2192;
    float _2216 = _1177 * _2214;
    float _2218 = _2206 * _1952;
    float _2220 = _2210 * _1952;
    float _2222 = fma(_1215, _2178, _2202);
    float _2224 = _2200 * _1952;
    float _2226 = _1203 * _2218;
    float _2228 = -_2218;
    float _2230 = _1177 * _2228;
    float _2232 = fma(_1749, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2212);
    float _2234 = _1205 * _2192;
    float _2236 = fma(_1215, _2220, _2226);
    float _2238 = _1205 * _2218;
    float _2240 = fma(_1207, _2220, _2230);
    if (!_2098)
    {
        float _2242 = fma(_491, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2186);
        _2184 = _2242;
    }
    float _2244 = _2184;
    float _2246 = fma(_1223, _2224, _2236);
    float _2248 = fma(_1711, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2232);
    float _2250 = fma(_1219, _2178, _2234);
    float _2252 = fma(_1219, _2220, _2238);
    float _2254 = fma(_1209, _2224, _2240);
    float _2256 = _2246 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _2258 = exp2(_2182);
    float _2260 = _2246 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _2262 = fma(_1207, _2178, _2216);
    float _2264 = fma(_1223, _2244, _2222);
    float _2266 = fma(_1775, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2248);
    float _2268 = fma(_1231, _2244, _2250);
    float _2270 = fma(_1231, _2224, _2252);
    float _2272 = fma(_2254, (*spvDescriptorSet0.vp_c10)._m0[8].x, _2256);
    float _2274 = fma(_2254, (*spvDescriptorSet0.vp_c10)._m0[9].x, _2260);
    float _2276 = in.m_79.x;
    float _2278 = fma(_1209, _2244, _2262);
    float _2280 = _2264 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _2282 = _2266 + _1781;
    float _2284 = _2264 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _2286 = fma(_2270, (*spvDescriptorSet0.vp_c10)._m0[8].z, _2272);
    float _2288 = _2264 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _2290 = fma(_2270, (*spvDescriptorSet0.vp_c10)._m0[9].z, _2274);
    float _2292 = fma(_2278, (*spvDescriptorSet0.vp_c10)._m0[8].x, _2280);
    float _2294 = _2282 * 0.5;
    float _2296 = fma(_2278, (*spvDescriptorSet0.vp_c10)._m0[9].x, _2284);
    float _2298 = fma(_2278, (*spvDescriptorSet0.vp_c10)._m0[10].x, _2288);
    float _2300 = _1914 * _2128;
    float _2302 = fma(_2268, (*spvDescriptorSet0.vp_c10)._m0[8].z, _2292);
    float _2304 = fma(_2268, (*spvDescriptorSet0.vp_c10)._m0[9].z, _2296);
    float _2306 = fma(_2268, (*spvDescriptorSet0.vp_c10)._m0[10].z, _2298);
    float _2308 = -_2258;
    float _2310 = _2308 + 1.0;
    float _2312 = _2300 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _2314 = _2246 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _2316 = _2310 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    out.m_81.x = _2302;
    out.m_81.y = _2304;
    out.m_81.z = _2306;
    float _2318 = fma(_2254, (*spvDescriptorSet0.vp_c10)._m0[10].x, _2314);
    bool _2320 = _1533 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _2322 = isnan(_1533);
    bool _2324 = _2320 || _2322;
    bool _2326 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _2328 = _2324 || _2326;
    out.gl_Position.x = _1807;
    out.gl_Position.y = _1809;
    out.gl_Position.z = _2266;
    out.gl_Position.w = _1781;
    float _2330 = _1511 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _2332 = fma(_2270, (*spvDescriptorSet0.vp_c10)._m0[10].z, _2318);
    out.m_83.z = _2294;
    out.m_83.w = _1781;
    out.m_85.x = _2286;
    out.m_85.y = _2290;
    out.m_85.z = _2332;
    float _2334 = _2266;
    float _2336 = _2290;
    float _2338 = _2286;
    if (!_2328)
    {
        _1932 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _2340 = _1932;
    float _2342 = _2340;
    float _2344 = _2340;
    if (!_2328)
    {
        _2334 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _2346 = _2334;
    float _2348 = _2346;
    float _2350 = _2346;
    if (!_2328)
    {
        _1934 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _2352 = _1934;
    float _2354 = _2352;
    float _2356 = _2352;
    if (!_2328)
    {
        _2336 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _2358 = _2336;
    float _2360 = _2358;
    float _2362 = _2358;
    if (!_2328)
    {
        _2338 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _2364 = _2338;
    float _2366 = -_1819;
    float _2368 = _2366 + 1.0;
    float _2370 = _2368 * _2312;
    float _2372 = precise::clamp(_2370, 0.0, 1.0);
    float _2374 = -_2372;
    float _2376 = fma(_2374, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _2378 = _2376 * _2276;
    float _2380 = _2316 * _1837;
    float _2382 = -_2316;
    float _2384 = _2382 + 1.0;
    float _2386 = _2378 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _2388 = _1852 * _2380;
    out.m_87.x = _2386;
    float _2390 = _1862 * _2380;
    float _2392 = fma(_1858, _2388, _1846);
    float _2394 = fma(_1860, _2388, _1848);
    float _2396 = _1852 * _2384;
    float _2398 = fma(_1852, _2390, _1850);
    float _2400 = _2388;
    float _2402 = _2364;
    float _2404 = _2364;
    if (!_2328)
    {
        _2400 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _2406 = _2400;
    out.m_89.x = _2392;
    out.m_89.y = _2394;
    out.m_89.z = _2398;
    out.m_89.w = _2396;
    bool _2408 = !_2328;
    float _2410 = _2406;
    float _2412 = _2406;
    if (!_2408)
    {
        bool _2414 = _1533 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _2416 = isnan(_1533);
        bool _2418 = _2414 || _2416;
        bool _2420 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _2422 = _2418 || _2420;
        if (!_2422)
        {
            float _2424 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2426 = _1533 + _2424;
            float _2428 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2430 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _2428;
            float _2432 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _2434 = _2432 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _2436 = 1.0 / _2430;
            float _2438 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _2440 = _2438 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _2442 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _2444 = _2442 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _2446 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _2448 = _2446 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _2450 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _2452 = _2450 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _2454 = _2426 * _2436;
            float _2456 = precise::clamp(_2454, 0.0, 1.0);
            float _2458 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _2460 = _2458 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _2462 = fma(_2456, _2434, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _2464 = fma(_2456, _2460, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _2466 = fma(_2456, _2440, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _2468 = fma(_2456, _2444, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _2470 = fma(_2456, _2448, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _2472 = fma(_2456, _2452, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _2404 = _2466;
            _2356 = _2470;
            _2362 = _2462;
            _2350 = _2468;
            _2344 = _2464;
            _2412 = _2472;
            _2474 = true;
        }
        else
        {
            bool _2476 = _1533 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _2478 = isnan(_1533);
            bool _2480 = _2476 || _2478;
            bool _2482 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _2484 = _2480 || _2482;
            if (!_2484)
            {
                _2360 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _2486 = _2360;
            _2362 = _2486;
            if (!_2484)
            {
                _2402 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _2488 = _2402;
            _2404 = _2488;
            if (!_2484)
            {
                _2342 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _2490 = _2342;
            _2344 = _2490;
            if (!_2484)
            {
                _2348 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _2492 = _2348;
            _2350 = _2492;
            if (!_2484)
            {
                _2354 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _2494 = _2354;
            _2356 = _2494;
            if (!_2484)
            {
                _2410 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _2496 = _2410;
            bool _2498 = !_2484;
            _2412 = _2496;
            if (!_2498)
            {
                bool _2500 = _1533 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _2502 = isnan(_1533);
                bool _2504 = _2500 || _2502;
                bool _2506 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _2508 = _2504 || _2506;
                if (!_2508)
                {
                    float _2510 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2512 = _1533 + _2510;
                    float _2514 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2516 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _2514;
                    float _2518 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _2520 = _2518 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _2522 = 1.0 / _2516;
                    float _2524 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _2526 = _2524 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _2528 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _2530 = _2528 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _2532 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _2534 = _2532 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _2536 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _2538 = _2536 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _2540 = _2512 * _2522;
                    float _2542 = precise::clamp(_2540, 0.0, 1.0);
                    float _2544 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _2546 = _2544 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _2548 = fma(_2542, _2520, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _2550 = fma(_2542, _2546, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _2552 = fma(_2542, _2526, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _2554 = fma(_2542, _2530, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _2556 = fma(_2542, _2534, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _2558 = fma(_2542, _2538, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _2404 = _2552;
                    _2356 = _2556;
                    _2362 = _2548;
                    _2350 = _2554;
                    _2344 = _2550;
                    _2412 = _2558;
                    _2474 = true;
                }
                else
                {
                    _2404 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _2356 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _2362 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _2350 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _2344 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _2412 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _2474 = false;
    float _2560 = _2404;
    float _2562 = _2356;
    float _2564 = _2362;
    float _2566 = _2350;
    float _2568 = _2344;
    float _2570 = _2412;
    float _2572 = fma(_2304, -0.5, 0.5);
    float _2574 = precise::clamp(_2572, 0.0, 1.0);
    float _2576 = -_2560;
    float _2578 = _2576 + _2562;
    float _2580 = -_2564;
    float _2582 = _2580 + _2566;
    out.m_91.x = 0.0;
    float _2584 = fma(_2574, _2578, _2560);
    float _2586 = -_2568;
    float _2588 = _2586 + _2570;
    float _2590 = fma(_2574, _2582, _2564);
    float _2592 = _2584 * 0.586610972881317138671875;
    bool _2594 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2596 = fma(_2574, _2588, _2568);
    float _2598 = _2330 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2600 = fma(_2590, 0.298911988735198974609375, _2592);
    bool _2602 = _1511 > 0.0;
    bool _2604 = isnan(_1511);
    bool _2606 = _2602 || _2604;
    bool _2608 = isnan(0.0);
    bool _2610 = _2606 || _2608;
    float _2612 = fma(_2596, 0.114477999508380889892578125, _2600);
    out.m_49.x = _2598;
    float _2614 = -_2612;
    float _2616 = _2590 + _2614;
    float _2618 = -_2612;
    float _2620 = _2584 + _2618;
    float _2622 = -_2612;
    float _2624 = _2596 + _2622;
    float _2626 = fma(_2616, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2612);
    float _2628 = fma(_2620, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2612);
    float _2630 = fma(_2624, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2612);
    bool _2632 = !_2594;
    if (!_2632)
    {
        float _2634 = -_1453;
        float _2636 = _2634 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _2638 = -_1455;
        float _2640 = _2638 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _2642 = -_1457;
        float _2644 = _2642 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _2646 = _2636 * _2636;
        float _2648 = fma(_2640, _2640, _2646);
        float _2650 = fma(_2644, _2644, _2648);
        float _2652 = sqrt(_2650);
        float _2654 = rsqrt(_2650);
        float _2656 = -_2652;
        float _2658 = _2656 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _2660 = _2658 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _2662 = precise::clamp(_2660, 0.0, 1.0);
        float _2664 = _2640 * _2654;
        float _2666 = _2636 * _2654;
        float _2668 = abs(_2662);
        float _2670 = log2(_2668);
        float _2672 = _2644 * _2654;
        float _2674 = _2664 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _2676 = _2304 * _2666;
        float _2678 = -_2666;
        float _2680 = -_2674;
        float _2682 = fma(_2678, (*spvDescriptorSet0.vp_c15)._m0[656].y, _2680);
        float _2684 = fma(_2302, _2664, _2676);
        float _2686 = -_2672;
        float _2688 = fma(_2686, (*spvDescriptorSet0.vp_c15)._m0[656].z, _2682);
        float _2690 = fma(_2306, _2672, _2684);
        float _2692 = precise::clamp(_2690, 0.0, 1.0);
        float _2694 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _2696 = _2688 + _2694;
        float _2698 = _2670 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _2700 = _2696 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _2702 = precise::clamp(_2700, 0.0, 1.0);
        float _2704 = exp2(_2698);
        float _2706 = _2704 * _2702;
        float _2708 = _2692 * _2706;
        float _2710 = _2708 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _2712 = _2708 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _2714 = _2708 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_91.x = _2710;
        out.m_91.y = _2712;
        out.m_91.z = _2714;
    }
    out.m_93.x = _2626;
    out.m_93.y = _2628;
    out.m_93.z = _2630;
    if (_2610)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    out.m_49.x = 0.0;
    float _2716 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _2716;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_55 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_57 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_49 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_93 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_67 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_75 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_83 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_77 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_85 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_81 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_73 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_91 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_87 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_89 = float4(0.0, 0.0, 0.0, 1.0);
    bool _2474 = false;
    bool _463 = false;
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
        float _2773 = as_type<float>(_128);
        out.gl_Position.z = _2773;
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
        float _2842 = as_type<float>(_166);
        out.gl_Position.z = _2842;
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
    float _212 = 1.0 / _206;
    bool _214 = _198 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _216 = isnan(_198);
    bool _218 = _214 || _216;
    bool _220 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _222 = _218 || _220;
    float _224 = float(_222);
    bool _226 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[14].x;
    float _228 = 1.0 / _210;
    float _230 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _232 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _230;
    float _234 = _202 * _200;
    float _236 = float(as_type<int>((*spvDescriptorSet0.vp_c9)._m0[8].z));
    float _238 = _236 * _200;
    float _240 = trunc(_234);
    int _242 = int(_240);
    float _244 = trunc(_238);
    int _246 = int(_244);
    int _248 = _242 << 4;
    int _250 = _248 + 1712;
    float _252 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _254 = _198 + _252;
    uint _257 = uint(int(uint(_250) >> uint(2)));
    uint _259 = uint(int(uint(int(_257)) >> uint(2)));
    int _261 = int(_257) & 3;
    float _263 = (*spvDescriptorSet0.vp_c9)._m0[int(_259)][_261];
    int _265 = int(_257) + 1;
    uint _267 = uint(int(uint(_265) >> uint(2)));
    int _269 = _265 & 3;
    float _271 = (*spvDescriptorSet0.vp_c9)._m0[int(_267)][_269];
    float _273 = _254 * _212;
    float _275 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _277 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _275;
    int _279 = _246 << 4;
    int _281 = _279 + 1968;
    float _283 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _285 = _198 + _283;
    float _287 = fma(_232, _273, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    bool _289 = _198 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _291 = isnan(_198);
    bool _293 = _289 || _291;
    bool _295 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _297 = _293 || _295;
    float _299 = float(_297);
    int _301 = _250 + 8;
    uint _303 = uint(int(uint(_301) >> uint(2)));
    uint _305 = uint(int(uint(int(_303)) >> uint(2)));
    int _307 = int(_303) & 3;
    float _309 = (*spvDescriptorSet0.vp_c9)._m0[int(_305)][_307];
    float _311 = _285 * _228;
    float _313 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _315 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _313;
    float _317 = fma(_277, _273, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _319 = fma(_315, _273, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _321 = -_224;
    float _323 = _321 + 1.0;
    uint _325 = uint(int(uint(_281) >> uint(2)));
    uint _327 = uint(int(uint(int(_325)) >> uint(2)));
    int _329 = int(_325) & 3;
    float _331 = (*spvDescriptorSet0.vp_c9)._m0[int(_327)][_329];
    int _333 = int(_325) + 1;
    uint _335 = uint(int(uint(_333) >> uint(2)));
    int _337 = _333 & 3;
    float _339 = (*spvDescriptorSet0.vp_c9)._m0[int(_335)][_337];
    bool _341 = _198 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _343 = isnan(_198);
    bool _345 = _341 || _343;
    bool _347 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _349 = _345 || _347;
    float _351 = float(_349);
    float _353 = _299 * _323;
    float _355 = -_299;
    float _357 = _355 + 1.0;
    int _359 = _281 + 8;
    uint _361 = uint(int(uint(_359) >> uint(2)));
    uint _363 = uint(int(uint(int(_361)) >> uint(2)));
    int _365 = int(_361) & 3;
    float _367 = (*spvDescriptorSet0.vp_c9)._m0[int(_363)][_365];
    float _369 = _351 * _357;
    float _371 = -_351;
    float _373 = _371 + 1.0;
    float _375 = _319 * _369;
    float _377 = fma(_373, (*spvDescriptorSet0.vp_c9)._m0[143].z, _375);
    float _379 = _263 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _381 = _271 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _383 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _385 = _309 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _387 = _331 * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _389 = _339 * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _391 = _379 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _393 = _385 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _395 = _387 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _397 = _389 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _399 = _317 * _369;
    float _401 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _403 = _401 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _405 = _367 * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _407 = _287 * _369;
    float _409 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _411 = _409 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _413 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _415 = _413 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _417 = _381 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _419 = _405 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _421 = fma(_411, _311, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _423 = fma(_403, _311, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _425 = fma(_373, (*spvDescriptorSet0.vp_c9)._m0[143].x, _399);
    float _427 = fma(_415, _311, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    float _429 = fma(_373, (*spvDescriptorSet0.vp_c9)._m0[143].y, _407);
    out.m_55.x = _391;
    out.m_55.y = _417;
    out.m_55.z = _393;
    out.m_55.w = _383;
    float _431 = fma(_421, _353, _425);
    float _433 = fma(_427, _353, _377);
    float _435 = fma(_423, _353, _429);
    out.m_57.x = _395;
    out.m_57.y = _397;
    out.m_57.z = _419;
    float _437 = fma(_224, (*spvDescriptorSet0.vp_c9)._m0[145].x, _431);
    float _439 = fma(_224, (*spvDescriptorSet0.vp_c9)._m0[145].y, _435);
    float _441 = fma(_224, (*spvDescriptorSet0.vp_c9)._m0[145].z, _433);
    bool _443 = !_226;
    float _445 = _431;
    float _461;
    if (!_443)
    {
        float _447 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[14].x;
        float _449 = _200 * (*spvDescriptorSet0.vp_c9)._m0[15].x;
        float _451 = fma(_449, (*spvDescriptorSet0.vp_c9)._m0[14].x, _146);
        float _453 = _451 * _447;
        float _455 = floor(_453);
        float _457 = -_455;
        float _459 = _453 + _457;
        _461 = _459;
        _463 = true;
    }
    else
    {
        float _465 = float(_112);
        float _467 = 1.0 / _465;
        float _469 = _146 * _467;
        _461 = _469;
    }
    _463 = false;
    float _471 = _461;
    float _473 = _200 * 2.0;
    float _475 = in.m_53.y;
    float _477 = -(*spvDescriptorSet0.vp_c9)._m0[159].w;
    float _479 = _477 + (*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _481 = floor(_473);
    float _483 = -(*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _485 = _483 + (*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _487 = -(*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _489 = _487 + (*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _491 = in.m_59.z;
    float _493 = -(*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _495 = _493 + (*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _497 = 1.0 / _479;
    float _499 = in.m_53.z;
    float _501 = -(*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _503 = _501 + (*spvDescriptorSet0.vp_c9)._m0[164].w;
    int _505 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _507 = _505 != 0;
    float _509 = in.m_59.x;
    float _511 = 1.0 / _485;
    int _513 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _515 = _513 != 0;
    int _517 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _519 = _517 != 0;
    int _521 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _523 = _521 != 0;
    float _525 = -(*spvDescriptorSet0.vp_c9)._m0[165].x;
    float _527 = (*spvDescriptorSet0.vp_c9)._m0[166].x + _525;
    bool _529 = _481 > 0.0;
    float _531 = _475 * 2.0;
    bool _533 = _481 >= 0.0;
    bool _535 = isnan(_481);
    bool _537 = _533 || _535;
    bool _539 = isnan(0.0);
    bool _541 = _537 || _539;
    float _543 = 1.0 / _489;
    if (_507)
    {
        _445 = _200;
    }
    float _545 = _445;
    bool _547 = _471 >= (*spvDescriptorSet0.vp_c9)._m0[163].w;
    bool _549 = isnan(_471);
    bool _551 = _547 || _549;
    bool _553 = isnan((*spvDescriptorSet0.vp_c9)._m0[163].w);
    bool _555 = _551 || _553;
    float _557 = float(_555);
    float _559 = 1.0 / _495;
    float _561 = -(*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _563 = _561 + (*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _565 = -(*spvDescriptorSet0.vp_c9)._m0[159].x;
    float _567 = (*spvDescriptorSet0.vp_c9)._m0[160].x + _565;
    float _569 = -(*spvDescriptorSet0.vp_c9)._m0[163].x;
    float _571 = (*spvDescriptorSet0.vp_c9)._m0[164].x + _569;
    float _573 = -(*spvDescriptorSet0.vp_c9)._m0[164].x;
    float _575 = _573 + (*spvDescriptorSet0.vp_c9)._m0[165].x;
    float _577 = _545;
    if (!_507)
    {
        _577 = _499;
    }
    float _579 = _577;
    float _581 = _567 * _497;
    float _583 = -(*spvDescriptorSet0.vp_c9)._m0[160].x;
    float _585 = _583 + (*spvDescriptorSet0.vp_c9)._m0[161].x;
    float _587 = 1.0 / _503;
    float _589 = _585 * _511;
    float _591 = -(*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _593 = _591 + (*spvDescriptorSet0.vp_c9)._m0[166].w;
    bool _595 = _471 >= (*spvDescriptorSet0.vp_c9)._m0[162].w;
    bool _597 = isnan(_471);
    bool _599 = _595 || _597;
    bool _601 = isnan((*spvDescriptorSet0.vp_c9)._m0[162].w);
    bool _603 = _599 || _601;
    float _605 = float(_603);
    float _607 = floor(_531);
    bool _609 = _471 >= (*spvDescriptorSet0.vp_c9)._m0[161].w;
    bool _611 = isnan(_471);
    bool _613 = _609 || _611;
    bool _615 = isnan((*spvDescriptorSet0.vp_c9)._m0[161].w);
    bool _617 = _613 || _615;
    float _619 = float(_617);
    float _621 = -_605;
    float _623 = _621 + 1.0;
    float _625 = -(*spvDescriptorSet0.vp_c9)._m0[161].x;
    float _627 = (*spvDescriptorSet0.vp_c9)._m0[162].x + _625;
    float _629 = -(*spvDescriptorSet0.vp_c9)._m0[162].x;
    float _631 = _629 + (*spvDescriptorSet0.vp_c9)._m0[163].x;
    float _633 = 1.0 / _593;
    float _635 = _571 * _587;
    float _637 = _627 * _543;
    float _639 = _499 * 2.0;
    float _641 = _631 * _559;
    float _643 = _475 + _499;
    bool _645 = _471 >= (*spvDescriptorSet0.vp_c9)._m0[165].w;
    bool _647 = isnan(_471);
    bool _649 = _645 || _647;
    bool _651 = isnan((*spvDescriptorSet0.vp_c9)._m0[165].w);
    bool _653 = _649 || _651;
    float _655 = float(_653);
    float _657 = -_619;
    float _659 = _657 + 1.0;
    float _661 = 1.0 / _563;
    float _663 = _643 + (-1.0);
    float _665 = -_655;
    float _667 = _665 + 1.0;
    float _669 = floor(_639);
    float _671 = _527 * _633;
    float _673 = fma(_663, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _675 = _200 + _475;
    int _677 = _541 ? 0 : 1;
    float _679 = _675 + (-1.0);
    float _681 = _575 * _661;
    bool _683 = _471 >= (*spvDescriptorSet0.vp_c9)._m0[164].w;
    bool _685 = isnan(_471);
    bool _687 = _683 || _685;
    bool _689 = isnan((*spvDescriptorSet0.vp_c9)._m0[164].w);
    bool _691 = _687 || _689;
    float _693 = float(_691);
    float _695 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _697 = log2(_695);
    int _699 = ~_677;
    int _701 = _699 + 1;
    int _703 = _701 + 1;
    int _705 = _703;
    float _707 = (*spvDescriptorSet0.vp_c9)._m0[198].x;
    if (!_529)
    {
        int _709 = ~_677;
        int _711 = _709 + 1;
        _705 = _711;
    }
    int _713 = _705;
    bool _715 = _607 > 0.0;
    bool _717 = _669 > 0.0;
    bool _719 = _669 >= 0.0;
    bool _721 = isnan(_669);
    bool _723 = _719 || _721;
    bool _725 = isnan(0.0);
    bool _727 = _723 || _725;
    float _729 = fma(_679, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    bool _731 = _471 >= (*spvDescriptorSet0.vp_c9)._m0[166].w;
    bool _733 = isnan(_471);
    bool _735 = _731 || _733;
    bool _737 = isnan((*spvDescriptorSet0.vp_c9)._m0[166].w);
    bool _739 = _735 || _737;
    float _741 = float(_739);
    if (_507)
    {
        _707 = _475;
    }
    float _743 = _707;
    float _745 = _743;
    if (!_507)
    {
        _745 = _200;
    }
    float _747 = _745;
    float _749 = -_741;
    float _751 = _749 + 1.0;
    bool _753 = _607 >= 0.0;
    bool _755 = isnan(_607);
    bool _757 = _753 || _755;
    bool _759 = isnan(0.0);
    bool _761 = _757 || _759;
    float _763 = -(*spvDescriptorSet0.vp_c9)._m0[159].w;
    float _765 = _471 + _763;
    float _767 = _697 * _146;
    float _769 = _655 * _751;
    float _771 = _747 * (*spvDescriptorSet0.vp_c9)._m0[87].y;
    float _773 = fma(_581, _765, (*spvDescriptorSet0.vp_c9)._m0[159].x);
    float _775 = -(*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _777 = _471 + _775;
    float _779 = _693 * _667;
    float _781 = -_693;
    float _783 = _781 + 1.0;
    bool _785 = _471 >= (*spvDescriptorSet0.vp_c9)._m0[160].w;
    bool _787 = isnan(_471);
    bool _789 = _785 || _787;
    bool _791 = isnan((*spvDescriptorSet0.vp_c9)._m0[160].w);
    bool _793 = _789 || _791;
    float _795 = float(_793);
    float _797 = fma(_589, _777, (*spvDescriptorSet0.vp_c9)._m0[160].x);
    float _799 = -(*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _801 = _471 + _799;
    float _803 = _557 * _783;
    float _805 = -_557;
    float _807 = _805 + 1.0;
    float _809 = _795 * _659;
    float _811 = fma(_637, _801, (*spvDescriptorSet0.vp_c9)._m0[161].x);
    float _813 = -(*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _815 = _471 + _813;
    float _817 = _605 * _807;
    float _819 = -(*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _821 = _471 + _819;
    float _823 = -_795;
    float _825 = _823 + 1.0;
    float _827 = fma(_641, _815, (*spvDescriptorSet0.vp_c9)._m0[162].x);
    float _829 = _619 * _623;
    float _831 = fma(_635, _821, (*spvDescriptorSet0.vp_c9)._m0[163].x);
    bool _833 = _471 >= (*spvDescriptorSet0.vp_c9)._m0[159].w;
    bool _835 = isnan(_471);
    bool _837 = _833 || _835;
    bool _839 = isnan((*spvDescriptorSet0.vp_c9)._m0[159].w);
    bool _841 = _837 || _839;
    float _843 = float(_841);
    float _845 = -(*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _847 = _471 + _845;
    float _849 = -(*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _851 = _471 + _849;
    float _853 = exp2(_767);
    float _855 = fma(_681, _847, (*spvDescriptorSet0.vp_c9)._m0[164].x);
    float _857 = _843 * _825;
    float _859 = fma(_671, _851, (*spvDescriptorSet0.vp_c9)._m0[165].x);
    float _861 = -_843;
    float _863 = _861 + 1.0;
    float _865 = _773 * _857;
    float _867 = _579 * (*spvDescriptorSet0.vp_c9)._m0[87].x;
    float _869 = (*spvDescriptorSet0.vp_c9)._m0[87].x + (*spvDescriptorSet0.vp_c9)._m0[86].z;
    bool _871 = !_519;
    int _873 = _871 ? 0 : 1;
    float _875 = fma(_863, (*spvDescriptorSet0.vp_c9)._m0[159].x, _865);
    float _877 = (*spvDescriptorSet0.vp_c9)._m0[87].y + (*spvDescriptorSet0.vp_c9)._m0[86].w;
    float _879 = -_869;
    float _881 = fma(_867, 2.0, _879);
    int _883 = abs(_873);
    float _885 = fma(_797, _809, _875);
    int _887 = _727 ? 0 : 1;
    float _889 = fma(_771, -2.0, _877);
    float _891 = fma(_811, _829, _885);
    int _893 = ~_887;
    int _895 = _893 + 1;
    int _897 = _895 + 1;
    float _899 = -_853;
    float _901 = _899 + 1.0;
    int _903 = _897;
    if (!_717)
    {
        int _905 = ~_887;
        int _907 = _905 + 1;
        _903 = _907;
    }
    int _909 = _903;
    float _911 = fma(_827, _817, _891);
    float _913 = in.m_61.x;
    float _915 = in.m_61.y;
    float _917 = in.m_61.z;
    float _919 = float(_883);
    float _921 = float(_713);
    float _923 = fma(_831, _803, _911);
    bool _925 = !_515;
    int _927 = _925 ? 0 : 1;
    float _929 = _919 * _921;
    float _931 = (*spvDescriptorSet0.vp_c9)._m0[88].z + (*spvDescriptorSet0.vp_c9)._m0[88].x;
    float _933 = fma(_855, _779, _923);
    int _935 = _761 ? 0 : 1;
    float _937 = (*spvDescriptorSet0.vp_c9)._m0[88].w + (*spvDescriptorSet0.vp_c9)._m0[88].y;
    float _939 = fma(_200, (*spvDescriptorSet0.vp_c9)._m0[88].z, _931);
    int _941 = abs(_927);
    float _943 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _945 = 1.0 + _943;
    float _947 = fma(_475, (*spvDescriptorSet0.vp_c9)._m0[88].w, _937);
    int _949 = ~_935;
    int _951 = _949 + 1;
    int _953 = _951 + 1;
    float _955 = fma(_859, _769, _933);
    float _957 = 1.0 / _945;
    float _959 = fma(_146, (*spvDescriptorSet0.vp_c9)._m0[87].z, _939);
    float _961 = -_146;
    float _963 = fma(_961, (*spvDescriptorSet0.vp_c9)._m0[86].x, _881);
    float _965 = _929 * (-2.0);
    int _967 = _953;
    if (!_715)
    {
        int _969 = ~_935;
        int _971 = _969 + 1;
        _967 = _971;
    }
    int _973 = _967;
    float _975 = fma(_146, (*spvDescriptorSet0.vp_c9)._m0[87].w, _947);
    bool _977 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _979 = isnan(1.0);
    bool _981 = _977 || _979;
    bool _983 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _985 = _981 || _983;
    float _987 = fma(_965, _915, _915);
    float _989 = float(_909);
    float _991 = fma(_673, _965, _673);
    float _993 = float(_941);
    float _995 = _475 + (-0.5);
    bool _997 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _999 = isnan(0.0);
    bool _1001 = _997 || _999;
    bool _1003 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1005 = _1001 || _1003;
    float _1007 = fma(_146, (*spvDescriptorSet0.vp_c9)._m0[86].y, _889);
    bool _1009 = !_523;
    int _1011 = _1009 ? 0 : 1;
    float _1013 = _993 * _989;
    float _1015 = _1005 ? _901 : 0.0;
    float _1017 = fma(_995, (*spvDescriptorSet0.vp_c9)._m0[196].y, _987);
    int _1019 = abs(_1011);
    float _1021 = _1013 * (-2.0);
    float _1023 = float(_973);
    float _1025 = _1017;
    if (_985)
    {
        float _1027 = _1015 * _957;
        _150 = _1027;
    }
    float _1029 = _150;
    float _1031 = fma(_729, _1021, _729);
    float _1033 = fma(_1021, _913, _913);
    float _1035 = _200 + (-0.5);
    float _1037 = float(_1019);
    float _1039 = fma(_991, _1029, _1017);
    float _1041 = fma(_1035, (*spvDescriptorSet0.vp_c9)._m0[196].x, _1033);
    float _1043 = fma(_741, (*spvDescriptorSet0.vp_c9)._m0[166].x, _955);
    float _1045 = _1037 * _1023;
    float _1047 = _1039 * 0.15915493667125701904296875;
    float _1049 = (*spvDescriptorSet0.vp_c9)._m0[191].x * (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _1051 = _200 + _491;
    float _1053 = in.m_63.x;
    float _1055 = in.m_63.y;
    float _1057 = in.m_63.z;
    float _1059 = fma(_1031, _1029, _1041);
    float _1061 = _200 + _499;
    float _1063 = fma(_1043, _1049, _1051);
    float _1065 = in.m_46.x;
    float _1067 = in.m_46.y;
    float _1069 = in.m_46.z;
    float _1071 = _1061 + (-1.0);
    float _1073 = _1045 * (-2.0);
    float _1075 = _1063 * (*spvDescriptorSet0.vp_c9)._m0[191].y;
    float _1077 = _1047 * 6.283185482025146484375;
    float _1079 = sin(_1077);
    float _1081 = fma(_1071, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _1083 = fma(_1073, _917, _917);
    float _1085 = _1075 * 0.15915493667125701904296875;
    float _1087 = _499 + (-0.5);
    float _1089 = in.m_59.y;
    float _1091 = fma(_1081, _1073, _1081);
    float _1093 = _1059 * 0.15915493667125701904296875;
    float _1095 = fma(_1087, (*spvDescriptorSet0.vp_c9)._m0[196].z, _1083);
    float _1097 = _1085 * 6.283185482025146484375;
    float _1099 = sin(_1097);
    float _1101 = fma(_1091, _1029, _1095);
    float _1103 = _441 * _1057;
    float _1105 = _437 * _1053;
    float _1107 = _1047 * 6.283185482025146484375;
    float _1109 = cos(_1107);
    float _1111 = _439 * _1055;
    float _1113 = _1067 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _1115 = _1067 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _1117 = _1067 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _1119 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _509);
    float _1121 = fma(_1065, (*spvDescriptorSet0.vp_c10)._m0[4].x, _1113);
    float _1123 = fma(_1065, (*spvDescriptorSet0.vp_c10)._m0[5].x, _1115);
    float _1125 = _1093 * 6.283185482025146484375;
    float _1127 = cos(_1125);
    float _1129 = _1101 * 0.15915493667125701904296875;
    float _1131 = fma(_1065, (*spvDescriptorSet0.vp_c10)._m0[6].x, _1117);
    float _1133 = fma(_475, (*spvDescriptorSet0.vp_c9)._m0[191].z, 0.20000000298023223876953125);
    float _1135 = _1105 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1137 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _491);
    float _1139 = _1103 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _1141 = fma(_1099, _1133, _1089);
    float _1143 = _1093 * 6.283185482025146484375;
    float _1145 = sin(_1143);
    float _1147 = _1119 * _1135;
    float _1149 = _1137 * _1139;
    float _1151 = _1111 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1153 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _1141);
    float _1155 = fma(_1069, (*spvDescriptorSet0.vp_c10)._m0[5].z, _1123);
    float _1157 = fma(_1069, (*spvDescriptorSet0.vp_c10)._m0[4].z, _1121);
    float _1159 = fma(_1069, (*spvDescriptorSet0.vp_c10)._m0[6].z, _1131);
    float _1161 = _1129 * 6.283185482025146484375;
    float _1163 = cos(_1161);
    float _1165 = _1127 * _1109;
    float _1167 = _1127 * _1079;
    float _1169 = _1153 * _1151;
    float _1171 = _1155 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _1173 = _1159 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _1175 = _1129 * 6.283185482025146484375;
    float _1177 = sin(_1175);
    float _1179 = _1145 * _1079;
    float _1181 = _1145 * _1109;
    bool _1183 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _1185 = isnan(0.5);
    bool _1187 = _1183 || _1185;
    bool _1189 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1191 = _1187 || _1189;
    bool _1193 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _1195 = isnan(0.5);
    bool _1197 = _1193 || _1195;
    bool _1199 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1201 = _1197 || _1199;
    float _1203 = _1127 * _1163;
    float _1205 = _1145 * _1163;
    float _1207 = _1109 * _1163;
    float _1209 = _1079 * _1163;
    float _1211 = _1203 * _1169;
    float _1213 = _1205 * _1169;
    float _1215 = fma(_1177, _1165, _1179);
    float _1217 = -_1167;
    float _1219 = fma(_1177, _1181, _1217);
    float _1221 = -_1181;
    float _1223 = fma(_1177, _1167, _1221);
    float _1225 = -_1169;
    float _1227 = _1177 * _1225;
    float _1229 = fma(_1215, _1147, _1211);
    float _1231 = fma(_1177, _1179, _1165);
    float _1233 = fma(_1219, _1147, _1213);
    float _1235 = fma(_1207, _1147, _1227);
    float _1237 = fma(_1223, _1149, _1229);
    float _1239 = _1171 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1241 = fma(_1231, _1149, _1233);
    float _1243 = fma(_1209, _1149, _1235);
    float _1245 = _1237 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _1247 = _1157 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _1249 = _1237 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _1251 = fma(_1243, (*spvDescriptorSet0.vp_c10)._m0[10].x, _1245);
    float _1253 = fma(_1247, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1239);
    float _1255 = fma(_1243, (*spvDescriptorSet0.vp_c10)._m0[8].x, _1249);
    float _1257 = _1171 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1259 = fma(_1241, (*spvDescriptorSet0.vp_c10)._m0[10].z, _1251);
    float _1261 = fma(_1173, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1253);
    float _1263 = fma(_1241, (*spvDescriptorSet0.vp_c10)._m0[8].z, _1255);
    float _1265 = _1173 + _1259;
    float _1267 = _1261 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1269 = _1247 + _1263;
    float _1271 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1273 = _1265 + _1271;
    float _1275 = 1.0 / _1267;
    float _1277 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1279 = _1269 + _1277;
    float _1281 = _1273 * _1273;
    float _1283 = fma(_1279, _1279, _1281);
    float _1285 = fma(_1247, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1257);
    float _1287 = _1237 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _1289 = sqrt(_1283);
    float _1291 = fma(_1173, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1285);
    float _1293 = fma(_1243, (*spvDescriptorSet0.vp_c10)._m0[9].x, _1287);
    float _1295 = _1291 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1297 = fma(_1241, (*spvDescriptorSet0.vp_c10)._m0[9].z, _1293);
    float _1299 = _1295 + _1267;
    float _1301 = _1171 + _1297;
    float _1303 = _1299 * _1275;
    float _1305 = _1303 * 0.5;
    bool _1307 = _1289 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1309 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1311 = fma(_1305, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1309);
    float _1313 = 1.0 / _1311;
    float _1315 = _1275;
    float _1317 = _1265;
    float _1319 = _1241;
    float _1321 = _1289;
    float _1323 = _1301;
    float _1325 = _1247;
    float _1327 = _1073;
    if (!_1307)
    {
        _1315 = _1269;
    }
    float _1329 = _1315;
    float _1331 = _1329;
    if (!_1307)
    {
        _1025 = _1301;
    }
    float _1333 = _1025;
    bool _1335 = !_1307;
    float _1337 = _1333;
    if (!_1335)
    {
        float _1339 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1341 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1343 = _1289 + _1341;
        float _1345 = _1301 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1347 = _1343 * _1339;
        float _1349 = rsqrt(_1283);
        float _1351 = _1347 * 0.15915493667125701904296875;
        float _1353 = _1351 * 6.283185482025146484375;
        float _1355 = cos(_1353);
        float _1357 = _1351 * 6.283185482025146484375;
        float _1359 = sin(_1357);
        float _1361 = _1355 + (-1.0);
        float _1363 = _1361 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1365 = fma(_1359, _1345, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1367 = fma(_1301, _1355, _1363);
        float _1369 = _1349 * _1365;
        float _1371 = fma(_1279, _1369, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1373 = fma(_1273, _1369, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1337 = _1367;
        _1331 = _1371;
        _1317 = _1373;
        _1319 = _1351;
        _1321 = _1349;
    }
    float _1375 = _1337;
    float _1377 = _1331;
    float _1379 = _1317;
    float _1381 = _1319;
    float _1383 = _1321;
    float _1385 = _1383;
    float _1387 = _1375;
    float _1389 = _1377;
    float _1391 = _1379;
    float _1393 = _1381;
    if (_1201)
    {
        _1385 = 1.0;
    }
    float _1395 = _1385;
    float _1397 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1399 = _1313 * _1397;
    float _1401 = _1395;
    if (!_1191)
    {
        float _1403 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _1405 = _1171 + _1403;
        float _1407 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _1409 = _1247 + _1407;
        float _1411 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1413 = -_1171;
        float _1415 = _1413 + _1375;
        float _1417 = _1405 * _1405;
        float _1419 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _1421 = _1173 + _1419;
        float _1423 = -_1247;
        float _1425 = _1423 + _1377;
        float _1427 = -_1173;
        float _1429 = _1427 + _1379;
        float _1431 = fma(_1409, _1409, _1417);
        float _1433 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1435 = fma(_1421, _1421, _1431);
        float _1437 = sqrt(_1435);
        float _1439 = _1411 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1441 = precise::min(_1437, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1443 = _1441 * _1433;
        float _1445 = _1439 * _1443;
        float _1447 = fma(_1415, _1445, _1171);
        float _1449 = fma(_1425, _1445, _1247);
        float _1451 = fma(_1429, _1445, _1173);
        _1387 = _1447;
        _1389 = _1449;
        _1391 = _1451;
        _1393 = _1433;
    }
    float _1453 = _1387;
    float _1455 = _1389;
    float _1457 = _1391;
    float _1459 = _1393;
    float _1461 = _1459;
    if (!_1201)
    {
        float _1463 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1465 = _1463 * 0.15915493667125701904296875;
        float _1467 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1469 = _1465 * 6.283185482025146484375;
        float _1471 = cos(_1469);
        float _1473 = _1467 * 0.15915493667125701904296875;
        float _1475 = _1465 * 6.283185482025146484375;
        float _1477 = sin(_1475);
        float _1479 = 1.0 / _1471;
        float _1481 = _1473 * 6.283185482025146484375;
        float _1483 = cos(_1481);
        float _1485 = _1477 * _1479;
        float _1487 = _1473 * 6.283185482025146484375;
        float _1489 = sin(_1487);
        float _1491 = _1483 * _1485;
        float _1493 = 1.0 / _1491;
        float _1495 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1497 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _1495;
        float _1499 = 1.0 / _1497;
        float _1501 = _1489 * _1493;
        float _1503 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1505 = fma(_1399, _1501, _1503);
        float _1507 = _1505 * _1499;
        float _1509 = precise::clamp(_1507, 0.0, 1.0);
        _1401 = _1509;
    }
    float _1511 = _1401;
    float _1513 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1515 = _1453 + _1513;
    float _1517 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1519 = _1455 + _1517;
    float _1521 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1523 = _1457 + _1521;
    float _1525 = _1515 * _1515;
    float _1527 = fma(_1519, _1519, _1525);
    float _1529 = fma(_1523, _1523, _1527);
    float _1531 = rsqrt(_1529);
    float _1533 = sqrt(_1529);
    float _1535 = _1531 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1537 = _1519 * _1535;
    float _1539 = _1523 * _1535;
    float _1541 = _1537 * _1537;
    float _1543 = _1539 * _1539;
    float _1545 = _1541 + _1543;
    float _1547 = sqrt(_1545);
    bool _1549 = _1547 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1551 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1553 = _1547 + _1551;
    float _1555 = _1523;
    float _1557 = _1525;
    float _1559 = _1553;
    if (_1549)
    {
        float _1561 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1555 = _1561;
    }
    float _1563 = _1555;
    if (_1549)
    {
        float _1565 = rsqrt(_1545);
        _1557 = _1565;
    }
    float _1567 = _1557;
    float _1569 = _1567;
    if (_1549)
    {
        float _1571 = _1553 * _1563;
        _1559 = _1571;
    }
    float _1573 = _1559;
    if (_1549)
    {
        float _1575 = _1573 * 0.15915493667125701904296875;
        _1323 = _1575;
    }
    float _1577 = _1323;
    float _1579 = _1563;
    float _1581 = _1577;
    if (_1549)
    {
        float _1583 = _1577 * 6.283185482025146484375;
        float _1585 = sin(_1583);
        _1579 = _1585;
    }
    float _1587 = _1579;
    float _1589 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1591 = precise::max(0.0, _1589);
    float _1593 = _1531;
    float _1595 = _1591;
    if (_1549)
    {
        float _1597 = _1577 * 6.283185482025146484375;
        float _1599 = cos(_1597);
        _1593 = _1599;
    }
    float _1601 = _1593;
    float _1603 = -_1535;
    float _1605 = -_1591;
    float _1607 = fma(_1515, _1603, _1605);
    if (_1549)
    {
        float _1609 = _1607 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1595 = _1609;
    }
    float _1611 = _1595;
    float _1613 = fma(_1247, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _1615 = _1611;
    if (!_1549)
    {
        _1325 = _1539;
    }
    float _1617 = _1325;
    float _1619 = _1587;
    float _1621 = _1617;
    if (_1549)
    {
        float _1623 = fma(_1587, _1611, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1461 = _1623;
    }
    float _1625 = _1461;
    if (!_1549)
    {
        _1619 = _1607;
    }
    float _1627 = _1619;
    float _1629 = floor(_1613);
    float _1631 = _1627;
    float _1633 = _1601;
    if (_1549)
    {
        float _1635 = _1601 + (-1.0);
        _1615 = _1635;
    }
    float _1637 = _1615;
    float _1639 = _1637;
    if (_1549)
    {
        float _1641 = _1567 * _1625;
        _1327 = _1641;
    }
    float _1643 = _1327;
    if (!_1549)
    {
        _1569 = _1537;
    }
    float _1645 = _1569;
    float _1647 = _1645;
    if (_1549)
    {
        float _1649 = _1637 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1581 = _1649;
    }
    float _1651 = _1581;
    if (_1549)
    {
        float _1653 = _1537 * _1643;
        _1647 = _1653;
    }
    float _1655 = _1647;
    if (!_1549)
    {
        _1639 = _1541;
    }
    float _1657 = _1639;
    float _1659 = _1657;
    if (_1549)
    {
        float _1661 = _1539 * _1643;
        _1621 = _1661;
    }
    float _1663 = _1621;
    if (_1549)
    {
        float _1665 = fma(_1607, _1601, _1651);
        _1631 = _1665;
    }
    float _1667 = _1631;
    if (_1549)
    {
        float _1669 = _1655 * _1655;
        _1659 = _1669;
    }
    float _1671 = _1659;
    if (!_1549)
    {
        _1633 = _1543;
    }
    float _1673 = _1633;
    float _1675 = _1673;
    if (_1549)
    {
        float _1677 = _1663 * _1663;
        _1675 = _1677;
    }
    float _1679 = _1675;
    float _1681 = fma(_1667, _1667, _1671);
    float _1683 = _1453 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1685 = _1453 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1687 = -_1629;
    float _1689 = _1613 + _1687;
    float _1691 = _1681 + _1679;
    float _1693 = fma(_1455, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1683);
    float _1695 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1697 = fma(_1533, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1695);
    float _1699 = precise::clamp(_1697, 0.0, 1.0);
    float _1701 = rsqrt(_1691);
    float _1703 = fma(_1457, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1693);
    float _1705 = -_1699;
    float _1707 = _1705 + 1.0;
    float _1709 = fma(_1173, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _1711 = _1703 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1713 = _1453 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1715 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _1717 = fma(_1455, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1685);
    float _1719 = _1711 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1721 = _1453 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1723 = fma(_1455, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1713);
    float _1725 = abs(_1707);
    float _1727 = log2(_1725);
    float _1729 = -_1719;
    float _1731 = fma(_1729, _1715, 1.0);
    float _1733 = fma(_1455, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1721);
    float _1735 = fma(_1457, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1723);
    float _1737 = _1701 * _1655;
    float _1739 = _1701 * _1667;
    float _1741 = fma(_1457, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1733);
    float _1743 = _1735 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1745 = _1737 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1747 = _1701 * _1663;
    float _1749 = _1741 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1751 = _1743 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1753 = -_1745;
    float _1755 = fma(_1739, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1753);
    float _1757 = floor(_1709);
    float _1759 = _1739 + 1.0;
    float _1761 = fma(_1749, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1751);
    float _1763 = -_1747;
    float _1765 = fma(_1763, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1755);
    float _1767 = fma(_1457, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1717);
    float _1769 = _1727 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1771 = fma(_1711, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1761);
    float _1773 = fma(_1765, -0.5, 0.5);
    float _1775 = _1767 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1777 = log2(_1731);
    float _1779 = fma(_1765, 0.5, 0.5);
    float _1781 = fma(_1775, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1771);
    float _1783 = _1743 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1785 = _1743 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1787 = -_1757;
    float _1789 = _1709 + _1787;
    float _1791 = fma(_1779, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1793 = exp2(_1769);
    float _1795 = fma(_1749, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1783);
    float _1797 = fma(_1749, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1785);
    float _1799 = fma(_1779, _1791, -0.212114393711090087890625);
    float _1801 = fma(_1711, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1795);
    float _1803 = fma(_1711, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1797);
    float _1805 = 1.0 / _1781;
    float _1807 = fma(_1775, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1801);
    float _1809 = fma(_1775, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1803);
    float _1811 = sqrt(_1773);
    float _1813 = -_1739;
    float _1815 = fma(_1793, _1759, _1813);
    float _1817 = _1777 * 0.693147182464599609375;
    float2 _5470 = float2(_1689, _1789);
    float _1819 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_5470, float2(0.0), isnan(_5470)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_5470, float2(0.0), isnan(_5470)), level(0.0)).x;
    float _1821 = fma(_1779, _1799, 1.570728778839111328125);
    float _1823 = fma(_1815, 0.5, 0.5);
    float _1825 = _1817 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1827 = _1807 * _1805;
    float _1829 = _1809 * _1805;
    float _1831 = fma(_1827, 0.5, 0.5);
    float _1833 = fma(_1829, -0.5, 0.5);
    float _1835 = _1811 * 0.636619746685028076171875;
    float3 _5504 = float3(_1831, _1833, _1825);
    float _1837 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_5504, float3(0.0), isnan(_5504)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_5504, float3(0.0), isnan(_5504)), level(0.0)).x;
    float _1839 = -_1821;
    float _1841 = fma(_1835, _1839, 1.0);
    float3 _5520 = float3(_1831, _1833, _1825);
    float4 _1844 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_5520, float3(0.0), isnan(_5520)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_5520, float3(0.0), isnan(_5520)), level(0.0)).xyzw;
    float _1846 = _1844.x;
    float _1848 = _1844.y;
    float _1850 = _1844.z;
    float _1852 = _1844.w;
    float2 _5536 = float2(_1841, _1823);
    float3 _1856 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_5536, float2(0.0), isnan(_5536)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_5536, float2(0.0), isnan(_5536)), level(0.0)).xyz;
    float _1858 = _1856.x;
    float _1860 = _1856.y;
    float _1862 = _1856.z;
    float _1864 = in.m_65.y;
    float _1866 = abs(_1399);
    float _1868 = log2(_1866);
    bool _1870 = _475 > 0.5;
    float _1872 = in.m_53.w;
    int _1874 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1876 = _1874 != 0;
    int _1878 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32;
    bool _1880 = _1878 != 0;
    float _1882 = in.m_65.x;
    bool _1884 = _499 > 0.5;
    float _1886 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].w;
    int _1888 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1890 = _1888 != 0;
    int _1892 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _1894 = _1892 != 0;
    float _1896 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].z;
    float _1898 = -_1864;
    float _1900 = _1898 + 1.0;
    float _1902 = _1868 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    out.m_67.x = 1.0;
    out.m_67.y = 1.0;
    out.m_67.z = 1.0;
    bool _1904 = _1399 <= 8000.0;
    bool _1906 = isnan(_1399);
    bool _1908 = _1904 || _1906;
    bool _1910 = isnan(8000.0);
    bool _1912 = _1908 || _1910;
    float _1914 = float(_1912);
    bool _1916 = _1872 > 0.5;
    int _1918 = _1870 ? as_type<int>(_1900) : as_type<int>(_1864);
    float _1920 = exp2(_1902);
    float _1922 = _1833;
    float _1924 = _1868;
    float _1926 = _1864;
    int _1928 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y);
    float _1930 = _1886;
    float _1932 = _1781;
    float _1934 = _1809;
    if (!_1876)
    {
        _1922 = _1882;
    }
    float _1936 = _1922;
    int _1938 = _1916 ? as_type<int>(_1900) : as_type<int>(_1864);
    float _1940 = _1890 ? as_type<float>(_1918) : _1864;
    int _1942 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16;
    bool _1944 = _1942 != 0;
    float _1946 = in.m_69.x;
    float _1948 = in.m_69.y;
    float _1950 = in.m_69.z;
    float _1952 = in.m_69.w;
    int _1954 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _1956 = _1954 != 0;
    float _1958 = _1936;
    bool _1960 = _1956;
    if (!_1876)
    {
        _1924 = _1936;
    }
    float _1962 = _1924;
    float _1964 = _1962;
    if (_1876)
    {
        _1958 = _1882;
    }
    float _1966 = _1958;
    float _1968 = _1956 ? as_type<float>(_1938) : _1864;
    float _1970 = fma(_1920, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _1972 = precise::clamp(_1970, 0.0, 1.0);
    float _1974 = _1966;
    if (_1880)
    {
        float _1976 = _1884 ? _1900 : _1864;
        _1926 = _1976;
    }
    float _1978 = _1926;
    float _1980 = _1886 * (*spvDescriptorSet0.vp_c9)._m0[90].y;
    int _1982 = as_type<int>(_1978);
    if (_1876)
    {
        float _1984 = -_1966;
        float _1986 = _1984 + 1.0;
        _1928 = as_type<int>(_1986);
    }
    int _1988 = _1928;
    int _1990 = _1988;
    if (_1876)
    {
        bool _1992 = _200 > 0.5;
        _1960 = _1992;
    }
    bool _1994 = _1960;
    float _1996 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _1998 = fma(_1980, _1978, -0.5);
    if (_1894)
    {
        float _2000 = -_1966;
        float _2002 = _2000 + 1.0;
        _1982 = as_type<int>(_2002);
    }
    int _2004 = _1982;
    if (_1876)
    {
        float _2006 = _1994 ? as_type<float>(_1988) : _1966;
        _1964 = _2006;
    }
    float _2008 = _1964;
    if (_1944)
    {
        float _2010 = -_1966;
        float _2012 = _2010 + 1.0;
        _1990 = as_type<int>(_2012);
    }
    int _2014 = _1990;
    if (!_1894)
    {
        _1930 = _1966;
    }
    float _2016 = _1930;
    float _2018 = _2016;
    if (_1894)
    {
        float _2020 = _1884 ? as_type<float>(_2004) : _1966;
        _2018 = _2020;
    }
    float _2022 = _2018;
    float _2024 = _1896 * (*spvDescriptorSet0.vp_c9)._m0[90].x;
    if (_1944)
    {
        float _2026 = _1870 ? as_type<float>(_2014) : _1966;
        _1974 = _2026;
    }
    float _2028 = _1974;
    float _2030 = -_1007;
    float _2032 = fma(_975, _1998, _2030);
    float _2034 = _1203 * _1948;
    float _2036 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _2038 = fma(_2024, _2028, -0.5);
    float _2040 = _1972 * _1972;
    float _2042 = fma(_1972, -2.0, 3.0);
    float _2044 = -_1948;
    float _2046 = _1177 * _2044;
    float _2048 = fma(_1215, _1946, _2034);
    float _2050 = fma(_959, _2038, _963);
    bool _2052 = _1141 != 0.0;
    bool _2054 = isnan(_1141);
    bool _2056 = _2052 || _2054;
    bool _2058 = isnan(0.0);
    bool _2060 = _2056 || _2058;
    float _2062 = fma(_1207, _1946, _2046);
    float _2064 = fma(_1223, _1950, _2048);
    float _2066 = in.m_71.x;
    float _2068 = in.m_71.y;
    float _2070 = in.m_71.z;
    float _2072 = _2040 * _2042;
    float _2074 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _2076 = fma(_1209, _1950, _2062);
    float _2078 = _2064 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    bool _2080 = _509 == 0.0;
    bool _2082 = !_2060;
    bool _2084 = _2080 && _2082;
    float _2086 = _2064 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _2088 = _2064 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _2090 = fma(_2076, (*spvDescriptorSet0.vp_c10)._m0[8].x, _2078);
    float _2092 = _1205 * _1948;
    float _2094 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    bool _2096 = _491 == 0.0;
    bool _2098 = _2096 && _2084;
    float _2100 = _1940 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _2102 = fma(_2076, (*spvDescriptorSet0.vp_c10)._m0[9].x, _2086);
    float _2104 = fma(_2076, (*spvDescriptorSet0.vp_c10)._m0[10].x, _2088);
    float _2106 = fma(_1219, _1946, _2092);
    float _2108 = _2100 * _2036;
    float _2110 = _1968 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _2112 = _2008 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _2114 = fma(_1231, _1950, _2106);
    float _2116 = _2022 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _2118 = -_2072;
    float _2120 = _2118 + 1.0;
    float _2122 = _2032 + 0.5;
    float _2124 = fma(_2114, (*spvDescriptorSet0.vp_c10)._m0[8].z, _2090);
    float _2126 = fma(_2114, (*spvDescriptorSet0.vp_c10)._m0[10].z, _2104);
    float _2128 = fma(_2120, (*spvDescriptorSet0.vp_c15)._m0[654].w, _2072);
    float _2130 = _2110 * _2094;
    float _2132 = _2112 * _2074;
    float _2134 = fma(_2114, (*spvDescriptorSet0.vp_c10)._m0[9].z, _2102);
    float _2136 = _2102;
    float _2138 = _2050;
    float _2140 = _2072;
    float _2142 = _2114;
    float _2144 = _2120;
    float _2146 = _2066;
    if (_2098)
    {
        _2136 = _2066;
    }
    float _2148 = _2136;
    float _2150 = _2116 * _1996;
    float _2152 = _2050 + 0.5;
    float _2154 = _2148;
    if (_2098)
    {
        _2138 = _2068;
    }
    float _2156 = _2138;
    out.m_73.x = _2124;
    out.m_73.y = _2134;
    out.m_73.z = _2126;
    float _2158 = _2156;
    if (_2098)
    {
        _2140 = _2148;
    }
    float _2160 = _2140;
    float _2162 = _2160;
    if (_2098)
    {
        _2142 = _2070;
    }
    float _2164 = _2142;
    out.m_75.x = _2132;
    out.m_75.y = _2108;
    out.m_75.z = _2150;
    out.m_75.w = _2130;
    float _2166 = _2164;
    if (!_2098)
    {
        _2154 = _2066;
    }
    float _2168 = _2154;
    if (_2098)
    {
        _2144 = _2156;
    }
    float _2170 = _2144;
    out.m_77.x = _2152;
    out.m_77.y = _2122;
    float _2172 = _2170;
    if (!_2098)
    {
        _2158 = _2068;
    }
    float _2174 = _2158;
    if (!_2098)
    {
        float _2176 = fma(_509, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2168);
        _2162 = _2176;
    }
    float _2178 = _2162;
    if (_2098)
    {
        _2146 = _2164;
    }
    float _2180 = _2146;
    float _2182 = _1727 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _2184 = _2180;
    if (!_2098)
    {
        _2166 = _2070;
    }
    float _2186 = _2166;
    float _2188 = _1946 * _2174;
    if (!_2098)
    {
        float _2190 = fma(_1141, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2174);
        _2172 = _2190;
    }
    float _2192 = _2172;
    float _2194 = _1950 * _2168;
    float _2196 = _1948 * _2186;
    float _2198 = -_2188;
    float _2200 = fma(_1948, _2168, _2198);
    float _2202 = _1203 * _2192;
    float _2204 = -_2194;
    float _2206 = fma(_1946, _2186, _2204);
    float _2208 = -_2196;
    float _2210 = fma(_1950, _2174, _2208);
    float _2212 = _1743 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _2214 = -_2192;
    float _2216 = _1177 * _2214;
    float _2218 = _2206 * _1952;
    float _2220 = _2210 * _1952;
    float _2222 = fma(_1215, _2178, _2202);
    float _2224 = _2200 * _1952;
    float _2226 = _1203 * _2218;
    float _2228 = -_2218;
    float _2230 = _1177 * _2228;
    float _2232 = fma(_1749, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2212);
    float _2234 = _1205 * _2192;
    float _2236 = fma(_1215, _2220, _2226);
    float _2238 = _1205 * _2218;
    float _2240 = fma(_1207, _2220, _2230);
    if (!_2098)
    {
        float _2242 = fma(_491, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2186);
        _2184 = _2242;
    }
    float _2244 = _2184;
    float _2246 = fma(_1223, _2224, _2236);
    float _2248 = fma(_1711, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2232);
    float _2250 = fma(_1219, _2178, _2234);
    float _2252 = fma(_1219, _2220, _2238);
    float _2254 = fma(_1209, _2224, _2240);
    float _2256 = _2246 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _2258 = exp2(_2182);
    float _2260 = _2246 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _2262 = fma(_1207, _2178, _2216);
    float _2264 = fma(_1223, _2244, _2222);
    float _2266 = fma(_1775, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2248);
    float _2268 = fma(_1231, _2244, _2250);
    float _2270 = fma(_1231, _2224, _2252);
    float _2272 = fma(_2254, (*spvDescriptorSet0.vp_c10)._m0[8].x, _2256);
    float _2274 = fma(_2254, (*spvDescriptorSet0.vp_c10)._m0[9].x, _2260);
    float _2276 = in.m_79.x;
    float _2278 = fma(_1209, _2244, _2262);
    float _2280 = _2264 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _2282 = _2266 + _1781;
    float _2284 = _2264 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _2286 = fma(_2270, (*spvDescriptorSet0.vp_c10)._m0[8].z, _2272);
    float _2288 = _2264 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _2290 = fma(_2270, (*spvDescriptorSet0.vp_c10)._m0[9].z, _2274);
    float _2292 = fma(_2278, (*spvDescriptorSet0.vp_c10)._m0[8].x, _2280);
    float _2294 = _2282 * 0.5;
    float _2296 = fma(_2278, (*spvDescriptorSet0.vp_c10)._m0[9].x, _2284);
    float _2298 = fma(_2278, (*spvDescriptorSet0.vp_c10)._m0[10].x, _2288);
    float _2300 = _1914 * _2128;
    float _2302 = fma(_2268, (*spvDescriptorSet0.vp_c10)._m0[8].z, _2292);
    float _2304 = fma(_2268, (*spvDescriptorSet0.vp_c10)._m0[9].z, _2296);
    float _2306 = fma(_2268, (*spvDescriptorSet0.vp_c10)._m0[10].z, _2298);
    float _2308 = -_2258;
    float _2310 = _2308 + 1.0;
    float _2312 = _2300 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _2314 = _2246 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _2316 = _2310 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    out.m_81.x = _2302;
    out.m_81.y = _2304;
    out.m_81.z = _2306;
    float _2318 = fma(_2254, (*spvDescriptorSet0.vp_c10)._m0[10].x, _2314);
    bool _2320 = _1533 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _2322 = isnan(_1533);
    bool _2324 = _2320 || _2322;
    bool _2326 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _2328 = _2324 || _2326;
    out.gl_Position.x = _1807;
    out.gl_Position.y = _1809;
    out.gl_Position.z = _2266;
    out.gl_Position.w = _1781;
    float _2330 = _1511 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _2332 = fma(_2270, (*spvDescriptorSet0.vp_c10)._m0[10].z, _2318);
    out.m_83.z = _2294;
    out.m_83.w = _1781;
    out.m_85.x = _2286;
    out.m_85.y = _2290;
    out.m_85.z = _2332;
    float _2334 = _2266;
    float _2336 = _2290;
    float _2338 = _2286;
    if (!_2328)
    {
        _1932 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _2340 = _1932;
    float _2342 = _2340;
    float _2344 = _2340;
    if (!_2328)
    {
        _2334 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _2346 = _2334;
    float _2348 = _2346;
    float _2350 = _2346;
    if (!_2328)
    {
        _1934 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _2352 = _1934;
    float _2354 = _2352;
    float _2356 = _2352;
    if (!_2328)
    {
        _2336 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _2358 = _2336;
    float _2360 = _2358;
    float _2362 = _2358;
    if (!_2328)
    {
        _2338 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _2364 = _2338;
    float _2366 = -_1819;
    float _2368 = _2366 + 1.0;
    float _2370 = _2368 * _2312;
    float _2372 = precise::clamp(_2370, 0.0, 1.0);
    float _2374 = -_2372;
    float _2376 = fma(_2374, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _2378 = _2376 * _2276;
    float _2380 = _2316 * _1837;
    float _2382 = -_2316;
    float _2384 = _2382 + 1.0;
    float _2386 = _2378 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _2388 = _1852 * _2380;
    out.m_87.x = _2386;
    float _2390 = _1862 * _2380;
    float _2392 = fma(_1858, _2388, _1846);
    float _2394 = fma(_1860, _2388, _1848);
    float _2396 = _1852 * _2384;
    float _2398 = fma(_1852, _2390, _1850);
    float _2400 = _2388;
    float _2402 = _2364;
    float _2404 = _2364;
    if (!_2328)
    {
        _2400 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _2406 = _2400;
    out.m_89.x = _2392;
    out.m_89.y = _2394;
    out.m_89.z = _2398;
    out.m_89.w = _2396;
    bool _2408 = !_2328;
    float _2410 = _2406;
    float _2412 = _2406;
    if (!_2408)
    {
        bool _2414 = _1533 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _2416 = isnan(_1533);
        bool _2418 = _2414 || _2416;
        bool _2420 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _2422 = _2418 || _2420;
        if (!_2422)
        {
            float _2424 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2426 = _1533 + _2424;
            float _2428 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2430 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _2428;
            float _2432 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _2434 = _2432 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _2436 = 1.0 / _2430;
            float _2438 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _2440 = _2438 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _2442 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _2444 = _2442 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _2446 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _2448 = _2446 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _2450 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _2452 = _2450 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _2454 = _2426 * _2436;
            float _2456 = precise::clamp(_2454, 0.0, 1.0);
            float _2458 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _2460 = _2458 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _2462 = fma(_2456, _2434, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _2464 = fma(_2456, _2460, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _2466 = fma(_2456, _2440, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _2468 = fma(_2456, _2444, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _2470 = fma(_2456, _2448, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _2472 = fma(_2456, _2452, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _2404 = _2466;
            _2356 = _2470;
            _2362 = _2462;
            _2350 = _2468;
            _2344 = _2464;
            _2412 = _2472;
            _2474 = true;
        }
        else
        {
            bool _2476 = _1533 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _2478 = isnan(_1533);
            bool _2480 = _2476 || _2478;
            bool _2482 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _2484 = _2480 || _2482;
            if (!_2484)
            {
                _2360 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _2486 = _2360;
            _2362 = _2486;
            if (!_2484)
            {
                _2402 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _2488 = _2402;
            _2404 = _2488;
            if (!_2484)
            {
                _2342 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _2490 = _2342;
            _2344 = _2490;
            if (!_2484)
            {
                _2348 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _2492 = _2348;
            _2350 = _2492;
            if (!_2484)
            {
                _2354 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _2494 = _2354;
            _2356 = _2494;
            if (!_2484)
            {
                _2410 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _2496 = _2410;
            bool _2498 = !_2484;
            _2412 = _2496;
            if (!_2498)
            {
                bool _2500 = _1533 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _2502 = isnan(_1533);
                bool _2504 = _2500 || _2502;
                bool _2506 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _2508 = _2504 || _2506;
                if (!_2508)
                {
                    float _2510 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2512 = _1533 + _2510;
                    float _2514 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2516 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _2514;
                    float _2518 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _2520 = _2518 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _2522 = 1.0 / _2516;
                    float _2524 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _2526 = _2524 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _2528 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _2530 = _2528 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _2532 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _2534 = _2532 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _2536 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _2538 = _2536 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _2540 = _2512 * _2522;
                    float _2542 = precise::clamp(_2540, 0.0, 1.0);
                    float _2544 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _2546 = _2544 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _2548 = fma(_2542, _2520, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _2550 = fma(_2542, _2546, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _2552 = fma(_2542, _2526, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _2554 = fma(_2542, _2530, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _2556 = fma(_2542, _2534, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _2558 = fma(_2542, _2538, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _2404 = _2552;
                    _2356 = _2556;
                    _2362 = _2548;
                    _2350 = _2554;
                    _2344 = _2550;
                    _2412 = _2558;
                    _2474 = true;
                }
                else
                {
                    _2404 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _2356 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _2362 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _2350 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _2344 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _2412 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _2474 = false;
    float _2560 = _2404;
    float _2562 = _2356;
    float _2564 = _2362;
    float _2566 = _2350;
    float _2568 = _2344;
    float _2570 = _2412;
    float _2572 = fma(_2304, -0.5, 0.5);
    float _2574 = precise::clamp(_2572, 0.0, 1.0);
    float _2576 = -_2560;
    float _2578 = _2576 + _2562;
    float _2580 = -_2564;
    float _2582 = _2580 + _2566;
    out.m_91.x = 0.0;
    float _2584 = fma(_2574, _2578, _2560);
    float _2586 = -_2568;
    float _2588 = _2586 + _2570;
    float _2590 = fma(_2574, _2582, _2564);
    float _2592 = _2584 * 0.586610972881317138671875;
    bool _2594 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2596 = fma(_2574, _2588, _2568);
    float _2598 = _2330 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2600 = fma(_2590, 0.298911988735198974609375, _2592);
    bool _2602 = _1511 > 0.0;
    bool _2604 = isnan(_1511);
    bool _2606 = _2602 || _2604;
    bool _2608 = isnan(0.0);
    bool _2610 = _2606 || _2608;
    float _2612 = fma(_2596, 0.114477999508380889892578125, _2600);
    out.m_49.x = _2598;
    float _2614 = -_2612;
    float _2616 = _2590 + _2614;
    float _2618 = -_2612;
    float _2620 = _2584 + _2618;
    float _2622 = -_2612;
    float _2624 = _2596 + _2622;
    float _2626 = fma(_2616, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2612);
    float _2628 = fma(_2620, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2612);
    float _2630 = fma(_2624, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2612);
    bool _2632 = !_2594;
    if (!_2632)
    {
        float _2634 = -_1453;
        float _2636 = _2634 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _2638 = -_1455;
        float _2640 = _2638 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _2642 = -_1457;
        float _2644 = _2642 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _2646 = _2636 * _2636;
        float _2648 = fma(_2640, _2640, _2646);
        float _2650 = fma(_2644, _2644, _2648);
        float _2652 = sqrt(_2650);
        float _2654 = rsqrt(_2650);
        float _2656 = -_2652;
        float _2658 = _2656 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _2660 = _2658 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _2662 = precise::clamp(_2660, 0.0, 1.0);
        float _2664 = _2640 * _2654;
        float _2666 = _2636 * _2654;
        float _2668 = abs(_2662);
        float _2670 = log2(_2668);
        float _2672 = _2644 * _2654;
        float _2674 = _2664 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _2676 = _2304 * _2666;
        float _2678 = -_2666;
        float _2680 = -_2674;
        float _2682 = fma(_2678, (*spvDescriptorSet0.vp_c15)._m0[656].y, _2680);
        float _2684 = fma(_2302, _2664, _2676);
        float _2686 = -_2672;
        float _2688 = fma(_2686, (*spvDescriptorSet0.vp_c15)._m0[656].z, _2682);
        float _2690 = fma(_2306, _2672, _2684);
        float _2692 = precise::clamp(_2690, 0.0, 1.0);
        float _2694 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _2696 = _2688 + _2694;
        float _2698 = _2670 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _2700 = _2696 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _2702 = precise::clamp(_2700, 0.0, 1.0);
        float _2704 = exp2(_2698);
        float _2706 = _2704 * _2702;
        float _2708 = _2692 * _2706;
        float _2710 = _2708 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _2712 = _2708 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _2714 = _2708 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_91.x = _2710;
        out.m_91.y = _2712;
        out.m_91.z = _2714;
    }
    out.m_93.x = _2626;
    out.m_93.y = _2628;
    out.m_93.z = _2630;
    if (_2610)
    {
        return out;
    }
    out.m_49.x = 0.0;
    float _2716 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _2716;
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
    out.m_55 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_57 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_49 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_93 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_67 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_75 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_83 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_77 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_85 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_81 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_73 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_91 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_87 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_89 = float4(0.0, 0.0, 0.0, 1.0);
    bool _2474 = false;
    bool _463 = false;
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
        float _2773 = as_type<float>(_128);
        out.gl_Position.z = _2773;
    }
    if (!_116)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_55.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_55.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_55.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_55.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_57.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_57.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_57.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_57.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_49.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_49.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_49.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_49.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_93.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_93.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_93.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_93.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_91.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_91.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_91.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_91.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
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
        float _2842 = as_type<float>(_166);
        out.gl_Position.z = _2842;
    }
    if (_160)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_55.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_55.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_55.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_55.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_57.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_57.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_57.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_57.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_49.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_49.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_49.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_49.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_93.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_93.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_93.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_93.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_91.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_91.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_91.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_91.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
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
    float _212 = 1.0 / _206;
    bool _214 = _198 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _216 = isnan(_198);
    bool _218 = _214 || _216;
    bool _220 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _222 = _218 || _220;
    float _224 = float(_222);
    bool _226 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[14].x;
    float _228 = 1.0 / _210;
    float _230 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _232 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _230;
    float _234 = _202 * _200;
    float _236 = float(as_type<int>((*spvDescriptorSet0.vp_c9)._m0[8].z));
    float _238 = _236 * _200;
    float _240 = trunc(_234);
    int _242 = int(_240);
    float _244 = trunc(_238);
    int _246 = int(_244);
    int _248 = _242 << 4;
    int _250 = _248 + 1712;
    float _252 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _254 = _198 + _252;
    uint _257 = uint(int(uint(_250) >> uint(2)));
    uint _259 = uint(int(uint(int(_257)) >> uint(2)));
    int _261 = int(_257) & 3;
    float _263 = (*spvDescriptorSet0.vp_c9)._m0[int(_259)][_261];
    int _265 = int(_257) + 1;
    uint _267 = uint(int(uint(_265) >> uint(2)));
    int _269 = _265 & 3;
    float _271 = (*spvDescriptorSet0.vp_c9)._m0[int(_267)][_269];
    float _273 = _254 * _212;
    float _275 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _277 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _275;
    int _279 = _246 << 4;
    int _281 = _279 + 1968;
    float _283 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _285 = _198 + _283;
    float _287 = fma(_232, _273, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    bool _289 = _198 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _291 = isnan(_198);
    bool _293 = _289 || _291;
    bool _295 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _297 = _293 || _295;
    float _299 = float(_297);
    int _301 = _250 + 8;
    uint _303 = uint(int(uint(_301) >> uint(2)));
    uint _305 = uint(int(uint(int(_303)) >> uint(2)));
    int _307 = int(_303) & 3;
    float _309 = (*spvDescriptorSet0.vp_c9)._m0[int(_305)][_307];
    float _311 = _285 * _228;
    float _313 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _315 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _313;
    float _317 = fma(_277, _273, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _319 = fma(_315, _273, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _321 = -_224;
    float _323 = _321 + 1.0;
    uint _325 = uint(int(uint(_281) >> uint(2)));
    uint _327 = uint(int(uint(int(_325)) >> uint(2)));
    int _329 = int(_325) & 3;
    float _331 = (*spvDescriptorSet0.vp_c9)._m0[int(_327)][_329];
    int _333 = int(_325) + 1;
    uint _335 = uint(int(uint(_333) >> uint(2)));
    int _337 = _333 & 3;
    float _339 = (*spvDescriptorSet0.vp_c9)._m0[int(_335)][_337];
    bool _341 = _198 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _343 = isnan(_198);
    bool _345 = _341 || _343;
    bool _347 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _349 = _345 || _347;
    float _351 = float(_349);
    float _353 = _299 * _323;
    float _355 = -_299;
    float _357 = _355 + 1.0;
    int _359 = _281 + 8;
    uint _361 = uint(int(uint(_359) >> uint(2)));
    uint _363 = uint(int(uint(int(_361)) >> uint(2)));
    int _365 = int(_361) & 3;
    float _367 = (*spvDescriptorSet0.vp_c9)._m0[int(_363)][_365];
    float _369 = _351 * _357;
    float _371 = -_351;
    float _373 = _371 + 1.0;
    float _375 = _319 * _369;
    float _377 = fma(_373, (*spvDescriptorSet0.vp_c9)._m0[143].z, _375);
    float _379 = _263 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _381 = _271 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _383 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _385 = _309 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _387 = _331 * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _389 = _339 * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _391 = _379 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _393 = _385 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _395 = _387 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _397 = _389 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _399 = _317 * _369;
    float _401 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _403 = _401 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _405 = _367 * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _407 = _287 * _369;
    float _409 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _411 = _409 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _413 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _415 = _413 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _417 = _381 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _419 = _405 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _421 = fma(_411, _311, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _423 = fma(_403, _311, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _425 = fma(_373, (*spvDescriptorSet0.vp_c9)._m0[143].x, _399);
    float _427 = fma(_415, _311, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    float _429 = fma(_373, (*spvDescriptorSet0.vp_c9)._m0[143].y, _407);
    out.m_55.x = _391;
    out.m_55.y = _417;
    out.m_55.z = _393;
    out.m_55.w = _383;
    float _431 = fma(_421, _353, _425);
    float _433 = fma(_427, _353, _377);
    float _435 = fma(_423, _353, _429);
    out.m_57.x = _395;
    out.m_57.y = _397;
    out.m_57.z = _419;
    float _437 = fma(_224, (*spvDescriptorSet0.vp_c9)._m0[145].x, _431);
    float _439 = fma(_224, (*spvDescriptorSet0.vp_c9)._m0[145].y, _435);
    float _441 = fma(_224, (*spvDescriptorSet0.vp_c9)._m0[145].z, _433);
    bool _443 = !_226;
    float _445 = _431;
    float _461;
    if (!_443)
    {
        float _447 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[14].x;
        float _449 = _200 * (*spvDescriptorSet0.vp_c9)._m0[15].x;
        float _451 = fma(_449, (*spvDescriptorSet0.vp_c9)._m0[14].x, _146);
        float _453 = _451 * _447;
        float _455 = floor(_453);
        float _457 = -_455;
        float _459 = _453 + _457;
        _461 = _459;
        _463 = true;
    }
    else
    {
        float _465 = float(_112);
        float _467 = 1.0 / _465;
        float _469 = _146 * _467;
        _461 = _469;
    }
    _463 = false;
    float _471 = _461;
    float _473 = _200 * 2.0;
    float _475 = in.m_53.y;
    float _477 = -(*spvDescriptorSet0.vp_c9)._m0[159].w;
    float _479 = _477 + (*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _481 = floor(_473);
    float _483 = -(*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _485 = _483 + (*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _487 = -(*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _489 = _487 + (*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _491 = in.m_59.z;
    float _493 = -(*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _495 = _493 + (*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _497 = 1.0 / _479;
    float _499 = in.m_53.z;
    float _501 = -(*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _503 = _501 + (*spvDescriptorSet0.vp_c9)._m0[164].w;
    int _505 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _507 = _505 != 0;
    float _509 = in.m_59.x;
    float _511 = 1.0 / _485;
    int _513 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _515 = _513 != 0;
    int _517 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _519 = _517 != 0;
    int _521 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _523 = _521 != 0;
    float _525 = -(*spvDescriptorSet0.vp_c9)._m0[165].x;
    float _527 = (*spvDescriptorSet0.vp_c9)._m0[166].x + _525;
    bool _529 = _481 > 0.0;
    float _531 = _475 * 2.0;
    bool _533 = _481 >= 0.0;
    bool _535 = isnan(_481);
    bool _537 = _533 || _535;
    bool _539 = isnan(0.0);
    bool _541 = _537 || _539;
    float _543 = 1.0 / _489;
    if (_507)
    {
        _445 = _200;
    }
    float _545 = _445;
    bool _547 = _471 >= (*spvDescriptorSet0.vp_c9)._m0[163].w;
    bool _549 = isnan(_471);
    bool _551 = _547 || _549;
    bool _553 = isnan((*spvDescriptorSet0.vp_c9)._m0[163].w);
    bool _555 = _551 || _553;
    float _557 = float(_555);
    float _559 = 1.0 / _495;
    float _561 = -(*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _563 = _561 + (*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _565 = -(*spvDescriptorSet0.vp_c9)._m0[159].x;
    float _567 = (*spvDescriptorSet0.vp_c9)._m0[160].x + _565;
    float _569 = -(*spvDescriptorSet0.vp_c9)._m0[163].x;
    float _571 = (*spvDescriptorSet0.vp_c9)._m0[164].x + _569;
    float _573 = -(*spvDescriptorSet0.vp_c9)._m0[164].x;
    float _575 = _573 + (*spvDescriptorSet0.vp_c9)._m0[165].x;
    float _577 = _545;
    if (!_507)
    {
        _577 = _499;
    }
    float _579 = _577;
    float _581 = _567 * _497;
    float _583 = -(*spvDescriptorSet0.vp_c9)._m0[160].x;
    float _585 = _583 + (*spvDescriptorSet0.vp_c9)._m0[161].x;
    float _587 = 1.0 / _503;
    float _589 = _585 * _511;
    float _591 = -(*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _593 = _591 + (*spvDescriptorSet0.vp_c9)._m0[166].w;
    bool _595 = _471 >= (*spvDescriptorSet0.vp_c9)._m0[162].w;
    bool _597 = isnan(_471);
    bool _599 = _595 || _597;
    bool _601 = isnan((*spvDescriptorSet0.vp_c9)._m0[162].w);
    bool _603 = _599 || _601;
    float _605 = float(_603);
    float _607 = floor(_531);
    bool _609 = _471 >= (*spvDescriptorSet0.vp_c9)._m0[161].w;
    bool _611 = isnan(_471);
    bool _613 = _609 || _611;
    bool _615 = isnan((*spvDescriptorSet0.vp_c9)._m0[161].w);
    bool _617 = _613 || _615;
    float _619 = float(_617);
    float _621 = -_605;
    float _623 = _621 + 1.0;
    float _625 = -(*spvDescriptorSet0.vp_c9)._m0[161].x;
    float _627 = (*spvDescriptorSet0.vp_c9)._m0[162].x + _625;
    float _629 = -(*spvDescriptorSet0.vp_c9)._m0[162].x;
    float _631 = _629 + (*spvDescriptorSet0.vp_c9)._m0[163].x;
    float _633 = 1.0 / _593;
    float _635 = _571 * _587;
    float _637 = _627 * _543;
    float _639 = _499 * 2.0;
    float _641 = _631 * _559;
    float _643 = _475 + _499;
    bool _645 = _471 >= (*spvDescriptorSet0.vp_c9)._m0[165].w;
    bool _647 = isnan(_471);
    bool _649 = _645 || _647;
    bool _651 = isnan((*spvDescriptorSet0.vp_c9)._m0[165].w);
    bool _653 = _649 || _651;
    float _655 = float(_653);
    float _657 = -_619;
    float _659 = _657 + 1.0;
    float _661 = 1.0 / _563;
    float _663 = _643 + (-1.0);
    float _665 = -_655;
    float _667 = _665 + 1.0;
    float _669 = floor(_639);
    float _671 = _527 * _633;
    float _673 = fma(_663, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _675 = _200 + _475;
    int _677 = _541 ? 0 : 1;
    float _679 = _675 + (-1.0);
    float _681 = _575 * _661;
    bool _683 = _471 >= (*spvDescriptorSet0.vp_c9)._m0[164].w;
    bool _685 = isnan(_471);
    bool _687 = _683 || _685;
    bool _689 = isnan((*spvDescriptorSet0.vp_c9)._m0[164].w);
    bool _691 = _687 || _689;
    float _693 = float(_691);
    float _695 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _697 = log2(_695);
    int _699 = ~_677;
    int _701 = _699 + 1;
    int _703 = _701 + 1;
    int _705 = _703;
    float _707 = (*spvDescriptorSet0.vp_c9)._m0[198].x;
    if (!_529)
    {
        int _709 = ~_677;
        int _711 = _709 + 1;
        _705 = _711;
    }
    int _713 = _705;
    bool _715 = _607 > 0.0;
    bool _717 = _669 > 0.0;
    bool _719 = _669 >= 0.0;
    bool _721 = isnan(_669);
    bool _723 = _719 || _721;
    bool _725 = isnan(0.0);
    bool _727 = _723 || _725;
    float _729 = fma(_679, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    bool _731 = _471 >= (*spvDescriptorSet0.vp_c9)._m0[166].w;
    bool _733 = isnan(_471);
    bool _735 = _731 || _733;
    bool _737 = isnan((*spvDescriptorSet0.vp_c9)._m0[166].w);
    bool _739 = _735 || _737;
    float _741 = float(_739);
    if (_507)
    {
        _707 = _475;
    }
    float _743 = _707;
    float _745 = _743;
    if (!_507)
    {
        _745 = _200;
    }
    float _747 = _745;
    float _749 = -_741;
    float _751 = _749 + 1.0;
    bool _753 = _607 >= 0.0;
    bool _755 = isnan(_607);
    bool _757 = _753 || _755;
    bool _759 = isnan(0.0);
    bool _761 = _757 || _759;
    float _763 = -(*spvDescriptorSet0.vp_c9)._m0[159].w;
    float _765 = _471 + _763;
    float _767 = _697 * _146;
    float _769 = _655 * _751;
    float _771 = _747 * (*spvDescriptorSet0.vp_c9)._m0[87].y;
    float _773 = fma(_581, _765, (*spvDescriptorSet0.vp_c9)._m0[159].x);
    float _775 = -(*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _777 = _471 + _775;
    float _779 = _693 * _667;
    float _781 = -_693;
    float _783 = _781 + 1.0;
    bool _785 = _471 >= (*spvDescriptorSet0.vp_c9)._m0[160].w;
    bool _787 = isnan(_471);
    bool _789 = _785 || _787;
    bool _791 = isnan((*spvDescriptorSet0.vp_c9)._m0[160].w);
    bool _793 = _789 || _791;
    float _795 = float(_793);
    float _797 = fma(_589, _777, (*spvDescriptorSet0.vp_c9)._m0[160].x);
    float _799 = -(*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _801 = _471 + _799;
    float _803 = _557 * _783;
    float _805 = -_557;
    float _807 = _805 + 1.0;
    float _809 = _795 * _659;
    float _811 = fma(_637, _801, (*spvDescriptorSet0.vp_c9)._m0[161].x);
    float _813 = -(*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _815 = _471 + _813;
    float _817 = _605 * _807;
    float _819 = -(*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _821 = _471 + _819;
    float _823 = -_795;
    float _825 = _823 + 1.0;
    float _827 = fma(_641, _815, (*spvDescriptorSet0.vp_c9)._m0[162].x);
    float _829 = _619 * _623;
    float _831 = fma(_635, _821, (*spvDescriptorSet0.vp_c9)._m0[163].x);
    bool _833 = _471 >= (*spvDescriptorSet0.vp_c9)._m0[159].w;
    bool _835 = isnan(_471);
    bool _837 = _833 || _835;
    bool _839 = isnan((*spvDescriptorSet0.vp_c9)._m0[159].w);
    bool _841 = _837 || _839;
    float _843 = float(_841);
    float _845 = -(*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _847 = _471 + _845;
    float _849 = -(*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _851 = _471 + _849;
    float _853 = exp2(_767);
    float _855 = fma(_681, _847, (*spvDescriptorSet0.vp_c9)._m0[164].x);
    float _857 = _843 * _825;
    float _859 = fma(_671, _851, (*spvDescriptorSet0.vp_c9)._m0[165].x);
    float _861 = -_843;
    float _863 = _861 + 1.0;
    float _865 = _773 * _857;
    float _867 = _579 * (*spvDescriptorSet0.vp_c9)._m0[87].x;
    float _869 = (*spvDescriptorSet0.vp_c9)._m0[87].x + (*spvDescriptorSet0.vp_c9)._m0[86].z;
    bool _871 = !_519;
    int _873 = _871 ? 0 : 1;
    float _875 = fma(_863, (*spvDescriptorSet0.vp_c9)._m0[159].x, _865);
    float _877 = (*spvDescriptorSet0.vp_c9)._m0[87].y + (*spvDescriptorSet0.vp_c9)._m0[86].w;
    float _879 = -_869;
    float _881 = fma(_867, 2.0, _879);
    int _883 = abs(_873);
    float _885 = fma(_797, _809, _875);
    int _887 = _727 ? 0 : 1;
    float _889 = fma(_771, -2.0, _877);
    float _891 = fma(_811, _829, _885);
    int _893 = ~_887;
    int _895 = _893 + 1;
    int _897 = _895 + 1;
    float _899 = -_853;
    float _901 = _899 + 1.0;
    int _903 = _897;
    if (!_717)
    {
        int _905 = ~_887;
        int _907 = _905 + 1;
        _903 = _907;
    }
    int _909 = _903;
    float _911 = fma(_827, _817, _891);
    float _913 = in.m_61.x;
    float _915 = in.m_61.y;
    float _917 = in.m_61.z;
    float _919 = float(_883);
    float _921 = float(_713);
    float _923 = fma(_831, _803, _911);
    bool _925 = !_515;
    int _927 = _925 ? 0 : 1;
    float _929 = _919 * _921;
    float _931 = (*spvDescriptorSet0.vp_c9)._m0[88].z + (*spvDescriptorSet0.vp_c9)._m0[88].x;
    float _933 = fma(_855, _779, _923);
    int _935 = _761 ? 0 : 1;
    float _937 = (*spvDescriptorSet0.vp_c9)._m0[88].w + (*spvDescriptorSet0.vp_c9)._m0[88].y;
    float _939 = fma(_200, (*spvDescriptorSet0.vp_c9)._m0[88].z, _931);
    int _941 = abs(_927);
    float _943 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _945 = 1.0 + _943;
    float _947 = fma(_475, (*spvDescriptorSet0.vp_c9)._m0[88].w, _937);
    int _949 = ~_935;
    int _951 = _949 + 1;
    int _953 = _951 + 1;
    float _955 = fma(_859, _769, _933);
    float _957 = 1.0 / _945;
    float _959 = fma(_146, (*spvDescriptorSet0.vp_c9)._m0[87].z, _939);
    float _961 = -_146;
    float _963 = fma(_961, (*spvDescriptorSet0.vp_c9)._m0[86].x, _881);
    float _965 = _929 * (-2.0);
    int _967 = _953;
    if (!_715)
    {
        int _969 = ~_935;
        int _971 = _969 + 1;
        _967 = _971;
    }
    int _973 = _967;
    float _975 = fma(_146, (*spvDescriptorSet0.vp_c9)._m0[87].w, _947);
    bool _977 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _979 = isnan(1.0);
    bool _981 = _977 || _979;
    bool _983 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _985 = _981 || _983;
    float _987 = fma(_965, _915, _915);
    float _989 = float(_909);
    float _991 = fma(_673, _965, _673);
    float _993 = float(_941);
    float _995 = _475 + (-0.5);
    bool _997 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _999 = isnan(0.0);
    bool _1001 = _997 || _999;
    bool _1003 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1005 = _1001 || _1003;
    float _1007 = fma(_146, (*spvDescriptorSet0.vp_c9)._m0[86].y, _889);
    bool _1009 = !_523;
    int _1011 = _1009 ? 0 : 1;
    float _1013 = _993 * _989;
    float _1015 = _1005 ? _901 : 0.0;
    float _1017 = fma(_995, (*spvDescriptorSet0.vp_c9)._m0[196].y, _987);
    int _1019 = abs(_1011);
    float _1021 = _1013 * (-2.0);
    float _1023 = float(_973);
    float _1025 = _1017;
    if (_985)
    {
        float _1027 = _1015 * _957;
        _150 = _1027;
    }
    float _1029 = _150;
    float _1031 = fma(_729, _1021, _729);
    float _1033 = fma(_1021, _913, _913);
    float _1035 = _200 + (-0.5);
    float _1037 = float(_1019);
    float _1039 = fma(_991, _1029, _1017);
    float _1041 = fma(_1035, (*spvDescriptorSet0.vp_c9)._m0[196].x, _1033);
    float _1043 = fma(_741, (*spvDescriptorSet0.vp_c9)._m0[166].x, _955);
    float _1045 = _1037 * _1023;
    float _1047 = _1039 * 0.15915493667125701904296875;
    float _1049 = (*spvDescriptorSet0.vp_c9)._m0[191].x * (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _1051 = _200 + _491;
    float _1053 = in.m_63.x;
    float _1055 = in.m_63.y;
    float _1057 = in.m_63.z;
    float _1059 = fma(_1031, _1029, _1041);
    float _1061 = _200 + _499;
    float _1063 = fma(_1043, _1049, _1051);
    float _1065 = in.m_46.x;
    float _1067 = in.m_46.y;
    float _1069 = in.m_46.z;
    float _1071 = _1061 + (-1.0);
    float _1073 = _1045 * (-2.0);
    float _1075 = _1063 * (*spvDescriptorSet0.vp_c9)._m0[191].y;
    float _1077 = _1047 * 6.283185482025146484375;
    float _1079 = sin(_1077);
    float _1081 = fma(_1071, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _1083 = fma(_1073, _917, _917);
    float _1085 = _1075 * 0.15915493667125701904296875;
    float _1087 = _499 + (-0.5);
    float _1089 = in.m_59.y;
    float _1091 = fma(_1081, _1073, _1081);
    float _1093 = _1059 * 0.15915493667125701904296875;
    float _1095 = fma(_1087, (*spvDescriptorSet0.vp_c9)._m0[196].z, _1083);
    float _1097 = _1085 * 6.283185482025146484375;
    float _1099 = sin(_1097);
    float _1101 = fma(_1091, _1029, _1095);
    float _1103 = _441 * _1057;
    float _1105 = _437 * _1053;
    float _1107 = _1047 * 6.283185482025146484375;
    float _1109 = cos(_1107);
    float _1111 = _439 * _1055;
    float _1113 = _1067 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _1115 = _1067 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _1117 = _1067 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _1119 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _509);
    float _1121 = fma(_1065, (*spvDescriptorSet0.vp_c10)._m0[4].x, _1113);
    float _1123 = fma(_1065, (*spvDescriptorSet0.vp_c10)._m0[5].x, _1115);
    float _1125 = _1093 * 6.283185482025146484375;
    float _1127 = cos(_1125);
    float _1129 = _1101 * 0.15915493667125701904296875;
    float _1131 = fma(_1065, (*spvDescriptorSet0.vp_c10)._m0[6].x, _1117);
    float _1133 = fma(_475, (*spvDescriptorSet0.vp_c9)._m0[191].z, 0.20000000298023223876953125);
    float _1135 = _1105 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1137 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _491);
    float _1139 = _1103 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _1141 = fma(_1099, _1133, _1089);
    float _1143 = _1093 * 6.283185482025146484375;
    float _1145 = sin(_1143);
    float _1147 = _1119 * _1135;
    float _1149 = _1137 * _1139;
    float _1151 = _1111 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1153 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _1141);
    float _1155 = fma(_1069, (*spvDescriptorSet0.vp_c10)._m0[5].z, _1123);
    float _1157 = fma(_1069, (*spvDescriptorSet0.vp_c10)._m0[4].z, _1121);
    float _1159 = fma(_1069, (*spvDescriptorSet0.vp_c10)._m0[6].z, _1131);
    float _1161 = _1129 * 6.283185482025146484375;
    float _1163 = cos(_1161);
    float _1165 = _1127 * _1109;
    float _1167 = _1127 * _1079;
    float _1169 = _1153 * _1151;
    float _1171 = _1155 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _1173 = _1159 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _1175 = _1129 * 6.283185482025146484375;
    float _1177 = sin(_1175);
    float _1179 = _1145 * _1079;
    float _1181 = _1145 * _1109;
    bool _1183 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _1185 = isnan(0.5);
    bool _1187 = _1183 || _1185;
    bool _1189 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1191 = _1187 || _1189;
    bool _1193 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _1195 = isnan(0.5);
    bool _1197 = _1193 || _1195;
    bool _1199 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1201 = _1197 || _1199;
    float _1203 = _1127 * _1163;
    float _1205 = _1145 * _1163;
    float _1207 = _1109 * _1163;
    float _1209 = _1079 * _1163;
    float _1211 = _1203 * _1169;
    float _1213 = _1205 * _1169;
    float _1215 = fma(_1177, _1165, _1179);
    float _1217 = -_1167;
    float _1219 = fma(_1177, _1181, _1217);
    float _1221 = -_1181;
    float _1223 = fma(_1177, _1167, _1221);
    float _1225 = -_1169;
    float _1227 = _1177 * _1225;
    float _1229 = fma(_1215, _1147, _1211);
    float _1231 = fma(_1177, _1179, _1165);
    float _1233 = fma(_1219, _1147, _1213);
    float _1235 = fma(_1207, _1147, _1227);
    float _1237 = fma(_1223, _1149, _1229);
    float _1239 = _1171 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1241 = fma(_1231, _1149, _1233);
    float _1243 = fma(_1209, _1149, _1235);
    float _1245 = _1237 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _1247 = _1157 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _1249 = _1237 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _1251 = fma(_1243, (*spvDescriptorSet0.vp_c10)._m0[10].x, _1245);
    float _1253 = fma(_1247, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1239);
    float _1255 = fma(_1243, (*spvDescriptorSet0.vp_c10)._m0[8].x, _1249);
    float _1257 = _1171 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1259 = fma(_1241, (*spvDescriptorSet0.vp_c10)._m0[10].z, _1251);
    float _1261 = fma(_1173, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1253);
    float _1263 = fma(_1241, (*spvDescriptorSet0.vp_c10)._m0[8].z, _1255);
    float _1265 = _1173 + _1259;
    float _1267 = _1261 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1269 = _1247 + _1263;
    float _1271 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1273 = _1265 + _1271;
    float _1275 = 1.0 / _1267;
    float _1277 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1279 = _1269 + _1277;
    float _1281 = _1273 * _1273;
    float _1283 = fma(_1279, _1279, _1281);
    float _1285 = fma(_1247, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1257);
    float _1287 = _1237 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _1289 = sqrt(_1283);
    float _1291 = fma(_1173, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1285);
    float _1293 = fma(_1243, (*spvDescriptorSet0.vp_c10)._m0[9].x, _1287);
    float _1295 = _1291 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1297 = fma(_1241, (*spvDescriptorSet0.vp_c10)._m0[9].z, _1293);
    float _1299 = _1295 + _1267;
    float _1301 = _1171 + _1297;
    float _1303 = _1299 * _1275;
    float _1305 = _1303 * 0.5;
    bool _1307 = _1289 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1309 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1311 = fma(_1305, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1309);
    float _1313 = 1.0 / _1311;
    float _1315 = _1275;
    float _1317 = _1265;
    float _1319 = _1241;
    float _1321 = _1289;
    float _1323 = _1301;
    float _1325 = _1247;
    float _1327 = _1073;
    if (!_1307)
    {
        _1315 = _1269;
    }
    float _1329 = _1315;
    float _1331 = _1329;
    if (!_1307)
    {
        _1025 = _1301;
    }
    float _1333 = _1025;
    bool _1335 = !_1307;
    float _1337 = _1333;
    if (!_1335)
    {
        float _1339 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1341 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1343 = _1289 + _1341;
        float _1345 = _1301 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1347 = _1343 * _1339;
        float _1349 = rsqrt(_1283);
        float _1351 = _1347 * 0.15915493667125701904296875;
        float _1353 = _1351 * 6.283185482025146484375;
        float _1355 = cos(_1353);
        float _1357 = _1351 * 6.283185482025146484375;
        float _1359 = sin(_1357);
        float _1361 = _1355 + (-1.0);
        float _1363 = _1361 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1365 = fma(_1359, _1345, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1367 = fma(_1301, _1355, _1363);
        float _1369 = _1349 * _1365;
        float _1371 = fma(_1279, _1369, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1373 = fma(_1273, _1369, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1337 = _1367;
        _1331 = _1371;
        _1317 = _1373;
        _1319 = _1351;
        _1321 = _1349;
    }
    float _1375 = _1337;
    float _1377 = _1331;
    float _1379 = _1317;
    float _1381 = _1319;
    float _1383 = _1321;
    float _1385 = _1383;
    float _1387 = _1375;
    float _1389 = _1377;
    float _1391 = _1379;
    float _1393 = _1381;
    if (_1201)
    {
        _1385 = 1.0;
    }
    float _1395 = _1385;
    float _1397 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1399 = _1313 * _1397;
    float _1401 = _1395;
    if (!_1191)
    {
        float _1403 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _1405 = _1171 + _1403;
        float _1407 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _1409 = _1247 + _1407;
        float _1411 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1413 = -_1171;
        float _1415 = _1413 + _1375;
        float _1417 = _1405 * _1405;
        float _1419 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _1421 = _1173 + _1419;
        float _1423 = -_1247;
        float _1425 = _1423 + _1377;
        float _1427 = -_1173;
        float _1429 = _1427 + _1379;
        float _1431 = fma(_1409, _1409, _1417);
        float _1433 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1435 = fma(_1421, _1421, _1431);
        float _1437 = sqrt(_1435);
        float _1439 = _1411 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1441 = precise::min(_1437, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1443 = _1441 * _1433;
        float _1445 = _1439 * _1443;
        float _1447 = fma(_1415, _1445, _1171);
        float _1449 = fma(_1425, _1445, _1247);
        float _1451 = fma(_1429, _1445, _1173);
        _1387 = _1447;
        _1389 = _1449;
        _1391 = _1451;
        _1393 = _1433;
    }
    float _1453 = _1387;
    float _1455 = _1389;
    float _1457 = _1391;
    float _1459 = _1393;
    float _1461 = _1459;
    if (!_1201)
    {
        float _1463 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1465 = _1463 * 0.15915493667125701904296875;
        float _1467 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1469 = _1465 * 6.283185482025146484375;
        float _1471 = cos(_1469);
        float _1473 = _1467 * 0.15915493667125701904296875;
        float _1475 = _1465 * 6.283185482025146484375;
        float _1477 = sin(_1475);
        float _1479 = 1.0 / _1471;
        float _1481 = _1473 * 6.283185482025146484375;
        float _1483 = cos(_1481);
        float _1485 = _1477 * _1479;
        float _1487 = _1473 * 6.283185482025146484375;
        float _1489 = sin(_1487);
        float _1491 = _1483 * _1485;
        float _1493 = 1.0 / _1491;
        float _1495 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1497 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _1495;
        float _1499 = 1.0 / _1497;
        float _1501 = _1489 * _1493;
        float _1503 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1505 = fma(_1399, _1501, _1503);
        float _1507 = _1505 * _1499;
        float _1509 = precise::clamp(_1507, 0.0, 1.0);
        _1401 = _1509;
    }
    float _1511 = _1401;
    float _1513 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1515 = _1453 + _1513;
    float _1517 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1519 = _1455 + _1517;
    float _1521 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1523 = _1457 + _1521;
    float _1525 = _1515 * _1515;
    float _1527 = fma(_1519, _1519, _1525);
    float _1529 = fma(_1523, _1523, _1527);
    float _1531 = rsqrt(_1529);
    float _1533 = sqrt(_1529);
    float _1535 = _1531 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1537 = _1519 * _1535;
    float _1539 = _1523 * _1535;
    float _1541 = _1537 * _1537;
    float _1543 = _1539 * _1539;
    float _1545 = _1541 + _1543;
    float _1547 = sqrt(_1545);
    bool _1549 = _1547 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1551 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1553 = _1547 + _1551;
    float _1555 = _1523;
    float _1557 = _1525;
    float _1559 = _1553;
    if (_1549)
    {
        float _1561 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1555 = _1561;
    }
    float _1563 = _1555;
    if (_1549)
    {
        float _1565 = rsqrt(_1545);
        _1557 = _1565;
    }
    float _1567 = _1557;
    float _1569 = _1567;
    if (_1549)
    {
        float _1571 = _1553 * _1563;
        _1559 = _1571;
    }
    float _1573 = _1559;
    if (_1549)
    {
        float _1575 = _1573 * 0.15915493667125701904296875;
        _1323 = _1575;
    }
    float _1577 = _1323;
    float _1579 = _1563;
    float _1581 = _1577;
    if (_1549)
    {
        float _1583 = _1577 * 6.283185482025146484375;
        float _1585 = sin(_1583);
        _1579 = _1585;
    }
    float _1587 = _1579;
    float _1589 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1591 = precise::max(0.0, _1589);
    float _1593 = _1531;
    float _1595 = _1591;
    if (_1549)
    {
        float _1597 = _1577 * 6.283185482025146484375;
        float _1599 = cos(_1597);
        _1593 = _1599;
    }
    float _1601 = _1593;
    float _1603 = -_1535;
    float _1605 = -_1591;
    float _1607 = fma(_1515, _1603, _1605);
    if (_1549)
    {
        float _1609 = _1607 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1595 = _1609;
    }
    float _1611 = _1595;
    float _1613 = fma(_1247, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _1615 = _1611;
    if (!_1549)
    {
        _1325 = _1539;
    }
    float _1617 = _1325;
    float _1619 = _1587;
    float _1621 = _1617;
    if (_1549)
    {
        float _1623 = fma(_1587, _1611, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1461 = _1623;
    }
    float _1625 = _1461;
    if (!_1549)
    {
        _1619 = _1607;
    }
    float _1627 = _1619;
    float _1629 = floor(_1613);
    float _1631 = _1627;
    float _1633 = _1601;
    if (_1549)
    {
        float _1635 = _1601 + (-1.0);
        _1615 = _1635;
    }
    float _1637 = _1615;
    float _1639 = _1637;
    if (_1549)
    {
        float _1641 = _1567 * _1625;
        _1327 = _1641;
    }
    float _1643 = _1327;
    if (!_1549)
    {
        _1569 = _1537;
    }
    float _1645 = _1569;
    float _1647 = _1645;
    if (_1549)
    {
        float _1649 = _1637 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1581 = _1649;
    }
    float _1651 = _1581;
    if (_1549)
    {
        float _1653 = _1537 * _1643;
        _1647 = _1653;
    }
    float _1655 = _1647;
    if (!_1549)
    {
        _1639 = _1541;
    }
    float _1657 = _1639;
    float _1659 = _1657;
    if (_1549)
    {
        float _1661 = _1539 * _1643;
        _1621 = _1661;
    }
    float _1663 = _1621;
    if (_1549)
    {
        float _1665 = fma(_1607, _1601, _1651);
        _1631 = _1665;
    }
    float _1667 = _1631;
    if (_1549)
    {
        float _1669 = _1655 * _1655;
        _1659 = _1669;
    }
    float _1671 = _1659;
    if (!_1549)
    {
        _1633 = _1543;
    }
    float _1673 = _1633;
    float _1675 = _1673;
    if (_1549)
    {
        float _1677 = _1663 * _1663;
        _1675 = _1677;
    }
    float _1679 = _1675;
    float _1681 = fma(_1667, _1667, _1671);
    float _1683 = _1453 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1685 = _1453 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1687 = -_1629;
    float _1689 = _1613 + _1687;
    float _1691 = _1681 + _1679;
    float _1693 = fma(_1455, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1683);
    float _1695 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1697 = fma(_1533, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1695);
    float _1699 = precise::clamp(_1697, 0.0, 1.0);
    float _1701 = rsqrt(_1691);
    float _1703 = fma(_1457, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1693);
    float _1705 = -_1699;
    float _1707 = _1705 + 1.0;
    float _1709 = fma(_1173, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _1711 = _1703 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1713 = _1453 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1715 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _1717 = fma(_1455, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1685);
    float _1719 = _1711 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1721 = _1453 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1723 = fma(_1455, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1713);
    float _1725 = abs(_1707);
    float _1727 = log2(_1725);
    float _1729 = -_1719;
    float _1731 = fma(_1729, _1715, 1.0);
    float _1733 = fma(_1455, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1721);
    float _1735 = fma(_1457, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1723);
    float _1737 = _1701 * _1655;
    float _1739 = _1701 * _1667;
    float _1741 = fma(_1457, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1733);
    float _1743 = _1735 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1745 = _1737 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1747 = _1701 * _1663;
    float _1749 = _1741 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1751 = _1743 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1753 = -_1745;
    float _1755 = fma(_1739, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1753);
    float _1757 = floor(_1709);
    float _1759 = _1739 + 1.0;
    float _1761 = fma(_1749, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1751);
    float _1763 = -_1747;
    float _1765 = fma(_1763, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1755);
    float _1767 = fma(_1457, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1717);
    float _1769 = _1727 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1771 = fma(_1711, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1761);
    float _1773 = fma(_1765, -0.5, 0.5);
    float _1775 = _1767 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1777 = log2(_1731);
    float _1779 = fma(_1765, 0.5, 0.5);
    float _1781 = fma(_1775, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1771);
    float _1783 = _1743 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1785 = _1743 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1787 = -_1757;
    float _1789 = _1709 + _1787;
    float _1791 = fma(_1779, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1793 = exp2(_1769);
    float _1795 = fma(_1749, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1783);
    float _1797 = fma(_1749, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1785);
    float _1799 = fma(_1779, _1791, -0.212114393711090087890625);
    float _1801 = fma(_1711, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1795);
    float _1803 = fma(_1711, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1797);
    float _1805 = 1.0 / _1781;
    float _1807 = fma(_1775, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1801);
    float _1809 = fma(_1775, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1803);
    float _1811 = sqrt(_1773);
    float _1813 = -_1739;
    float _1815 = fma(_1793, _1759, _1813);
    float _1817 = _1777 * 0.693147182464599609375;
    float2 _5470 = float2(_1689, _1789);
    float _1819 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_5470, float2(0.0), isnan(_5470)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_5470, float2(0.0), isnan(_5470)), level(0.0)).x;
    float _1821 = fma(_1779, _1799, 1.570728778839111328125);
    float _1823 = fma(_1815, 0.5, 0.5);
    float _1825 = _1817 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1827 = _1807 * _1805;
    float _1829 = _1809 * _1805;
    float _1831 = fma(_1827, 0.5, 0.5);
    float _1833 = fma(_1829, -0.5, 0.5);
    float _1835 = _1811 * 0.636619746685028076171875;
    float3 _5504 = float3(_1831, _1833, _1825);
    float _1837 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_5504, float3(0.0), isnan(_5504)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_5504, float3(0.0), isnan(_5504)), level(0.0)).x;
    float _1839 = -_1821;
    float _1841 = fma(_1835, _1839, 1.0);
    float3 _5520 = float3(_1831, _1833, _1825);
    float4 _1844 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_5520, float3(0.0), isnan(_5520)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_5520, float3(0.0), isnan(_5520)), level(0.0)).xyzw;
    float _1846 = _1844.x;
    float _1848 = _1844.y;
    float _1850 = _1844.z;
    float _1852 = _1844.w;
    float2 _5536 = float2(_1841, _1823);
    float3 _1856 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_5536, float2(0.0), isnan(_5536)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_5536, float2(0.0), isnan(_5536)), level(0.0)).xyz;
    float _1858 = _1856.x;
    float _1860 = _1856.y;
    float _1862 = _1856.z;
    float _1864 = in.m_65.y;
    float _1866 = abs(_1399);
    float _1868 = log2(_1866);
    bool _1870 = _475 > 0.5;
    float _1872 = in.m_53.w;
    int _1874 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1876 = _1874 != 0;
    int _1878 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32;
    bool _1880 = _1878 != 0;
    float _1882 = in.m_65.x;
    bool _1884 = _499 > 0.5;
    float _1886 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].w;
    int _1888 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1890 = _1888 != 0;
    int _1892 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _1894 = _1892 != 0;
    float _1896 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].z;
    float _1898 = -_1864;
    float _1900 = _1898 + 1.0;
    float _1902 = _1868 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    out.m_67.x = 1.0;
    out.m_67.y = 1.0;
    out.m_67.z = 1.0;
    bool _1904 = _1399 <= 8000.0;
    bool _1906 = isnan(_1399);
    bool _1908 = _1904 || _1906;
    bool _1910 = isnan(8000.0);
    bool _1912 = _1908 || _1910;
    float _1914 = float(_1912);
    bool _1916 = _1872 > 0.5;
    int _1918 = _1870 ? as_type<int>(_1900) : as_type<int>(_1864);
    float _1920 = exp2(_1902);
    float _1922 = _1833;
    float _1924 = _1868;
    float _1926 = _1864;
    int _1928 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y);
    float _1930 = _1886;
    float _1932 = _1781;
    float _1934 = _1809;
    if (!_1876)
    {
        _1922 = _1882;
    }
    float _1936 = _1922;
    int _1938 = _1916 ? as_type<int>(_1900) : as_type<int>(_1864);
    float _1940 = _1890 ? as_type<float>(_1918) : _1864;
    int _1942 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16;
    bool _1944 = _1942 != 0;
    float _1946 = in.m_69.x;
    float _1948 = in.m_69.y;
    float _1950 = in.m_69.z;
    float _1952 = in.m_69.w;
    int _1954 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _1956 = _1954 != 0;
    float _1958 = _1936;
    bool _1960 = _1956;
    if (!_1876)
    {
        _1924 = _1936;
    }
    float _1962 = _1924;
    float _1964 = _1962;
    if (_1876)
    {
        _1958 = _1882;
    }
    float _1966 = _1958;
    float _1968 = _1956 ? as_type<float>(_1938) : _1864;
    float _1970 = fma(_1920, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _1972 = precise::clamp(_1970, 0.0, 1.0);
    float _1974 = _1966;
    if (_1880)
    {
        float _1976 = _1884 ? _1900 : _1864;
        _1926 = _1976;
    }
    float _1978 = _1926;
    float _1980 = _1886 * (*spvDescriptorSet0.vp_c9)._m0[90].y;
    int _1982 = as_type<int>(_1978);
    if (_1876)
    {
        float _1984 = -_1966;
        float _1986 = _1984 + 1.0;
        _1928 = as_type<int>(_1986);
    }
    int _1988 = _1928;
    int _1990 = _1988;
    if (_1876)
    {
        bool _1992 = _200 > 0.5;
        _1960 = _1992;
    }
    bool _1994 = _1960;
    float _1996 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _1998 = fma(_1980, _1978, -0.5);
    if (_1894)
    {
        float _2000 = -_1966;
        float _2002 = _2000 + 1.0;
        _1982 = as_type<int>(_2002);
    }
    int _2004 = _1982;
    if (_1876)
    {
        float _2006 = _1994 ? as_type<float>(_1988) : _1966;
        _1964 = _2006;
    }
    float _2008 = _1964;
    if (_1944)
    {
        float _2010 = -_1966;
        float _2012 = _2010 + 1.0;
        _1990 = as_type<int>(_2012);
    }
    int _2014 = _1990;
    if (!_1894)
    {
        _1930 = _1966;
    }
    float _2016 = _1930;
    float _2018 = _2016;
    if (_1894)
    {
        float _2020 = _1884 ? as_type<float>(_2004) : _1966;
        _2018 = _2020;
    }
    float _2022 = _2018;
    float _2024 = _1896 * (*spvDescriptorSet0.vp_c9)._m0[90].x;
    if (_1944)
    {
        float _2026 = _1870 ? as_type<float>(_2014) : _1966;
        _1974 = _2026;
    }
    float _2028 = _1974;
    float _2030 = -_1007;
    float _2032 = fma(_975, _1998, _2030);
    float _2034 = _1203 * _1948;
    float _2036 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _2038 = fma(_2024, _2028, -0.5);
    float _2040 = _1972 * _1972;
    float _2042 = fma(_1972, -2.0, 3.0);
    float _2044 = -_1948;
    float _2046 = _1177 * _2044;
    float _2048 = fma(_1215, _1946, _2034);
    float _2050 = fma(_959, _2038, _963);
    bool _2052 = _1141 != 0.0;
    bool _2054 = isnan(_1141);
    bool _2056 = _2052 || _2054;
    bool _2058 = isnan(0.0);
    bool _2060 = _2056 || _2058;
    float _2062 = fma(_1207, _1946, _2046);
    float _2064 = fma(_1223, _1950, _2048);
    float _2066 = in.m_71.x;
    float _2068 = in.m_71.y;
    float _2070 = in.m_71.z;
    float _2072 = _2040 * _2042;
    float _2074 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _2076 = fma(_1209, _1950, _2062);
    float _2078 = _2064 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    bool _2080 = _509 == 0.0;
    bool _2082 = !_2060;
    bool _2084 = _2080 && _2082;
    float _2086 = _2064 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _2088 = _2064 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _2090 = fma(_2076, (*spvDescriptorSet0.vp_c10)._m0[8].x, _2078);
    float _2092 = _1205 * _1948;
    float _2094 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    bool _2096 = _491 == 0.0;
    bool _2098 = _2096 && _2084;
    float _2100 = _1940 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _2102 = fma(_2076, (*spvDescriptorSet0.vp_c10)._m0[9].x, _2086);
    float _2104 = fma(_2076, (*spvDescriptorSet0.vp_c10)._m0[10].x, _2088);
    float _2106 = fma(_1219, _1946, _2092);
    float _2108 = _2100 * _2036;
    float _2110 = _1968 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _2112 = _2008 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _2114 = fma(_1231, _1950, _2106);
    float _2116 = _2022 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _2118 = -_2072;
    float _2120 = _2118 + 1.0;
    float _2122 = _2032 + 0.5;
    float _2124 = fma(_2114, (*spvDescriptorSet0.vp_c10)._m0[8].z, _2090);
    float _2126 = fma(_2114, (*spvDescriptorSet0.vp_c10)._m0[10].z, _2104);
    float _2128 = fma(_2120, (*spvDescriptorSet0.vp_c15)._m0[654].w, _2072);
    float _2130 = _2110 * _2094;
    float _2132 = _2112 * _2074;
    float _2134 = fma(_2114, (*spvDescriptorSet0.vp_c10)._m0[9].z, _2102);
    float _2136 = _2102;
    float _2138 = _2050;
    float _2140 = _2072;
    float _2142 = _2114;
    float _2144 = _2120;
    float _2146 = _2066;
    if (_2098)
    {
        _2136 = _2066;
    }
    float _2148 = _2136;
    float _2150 = _2116 * _1996;
    float _2152 = _2050 + 0.5;
    float _2154 = _2148;
    if (_2098)
    {
        _2138 = _2068;
    }
    float _2156 = _2138;
    out.m_73.x = _2124;
    out.m_73.y = _2134;
    out.m_73.z = _2126;
    float _2158 = _2156;
    if (_2098)
    {
        _2140 = _2148;
    }
    float _2160 = _2140;
    float _2162 = _2160;
    if (_2098)
    {
        _2142 = _2070;
    }
    float _2164 = _2142;
    out.m_75.x = _2132;
    out.m_75.y = _2108;
    out.m_75.z = _2150;
    out.m_75.w = _2130;
    float _2166 = _2164;
    if (!_2098)
    {
        _2154 = _2066;
    }
    float _2168 = _2154;
    if (_2098)
    {
        _2144 = _2156;
    }
    float _2170 = _2144;
    out.m_77.x = _2152;
    out.m_77.y = _2122;
    float _2172 = _2170;
    if (!_2098)
    {
        _2158 = _2068;
    }
    float _2174 = _2158;
    if (!_2098)
    {
        float _2176 = fma(_509, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2168);
        _2162 = _2176;
    }
    float _2178 = _2162;
    if (_2098)
    {
        _2146 = _2164;
    }
    float _2180 = _2146;
    float _2182 = _1727 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _2184 = _2180;
    if (!_2098)
    {
        _2166 = _2070;
    }
    float _2186 = _2166;
    float _2188 = _1946 * _2174;
    if (!_2098)
    {
        float _2190 = fma(_1141, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2174);
        _2172 = _2190;
    }
    float _2192 = _2172;
    float _2194 = _1950 * _2168;
    float _2196 = _1948 * _2186;
    float _2198 = -_2188;
    float _2200 = fma(_1948, _2168, _2198);
    float _2202 = _1203 * _2192;
    float _2204 = -_2194;
    float _2206 = fma(_1946, _2186, _2204);
    float _2208 = -_2196;
    float _2210 = fma(_1950, _2174, _2208);
    float _2212 = _1743 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _2214 = -_2192;
    float _2216 = _1177 * _2214;
    float _2218 = _2206 * _1952;
    float _2220 = _2210 * _1952;
    float _2222 = fma(_1215, _2178, _2202);
    float _2224 = _2200 * _1952;
    float _2226 = _1203 * _2218;
    float _2228 = -_2218;
    float _2230 = _1177 * _2228;
    float _2232 = fma(_1749, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2212);
    float _2234 = _1205 * _2192;
    float _2236 = fma(_1215, _2220, _2226);
    float _2238 = _1205 * _2218;
    float _2240 = fma(_1207, _2220, _2230);
    if (!_2098)
    {
        float _2242 = fma(_491, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2186);
        _2184 = _2242;
    }
    float _2244 = _2184;
    float _2246 = fma(_1223, _2224, _2236);
    float _2248 = fma(_1711, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2232);
    float _2250 = fma(_1219, _2178, _2234);
    float _2252 = fma(_1219, _2220, _2238);
    float _2254 = fma(_1209, _2224, _2240);
    float _2256 = _2246 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _2258 = exp2(_2182);
    float _2260 = _2246 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _2262 = fma(_1207, _2178, _2216);
    float _2264 = fma(_1223, _2244, _2222);
    float _2266 = fma(_1775, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2248);
    float _2268 = fma(_1231, _2244, _2250);
    float _2270 = fma(_1231, _2224, _2252);
    float _2272 = fma(_2254, (*spvDescriptorSet0.vp_c10)._m0[8].x, _2256);
    float _2274 = fma(_2254, (*spvDescriptorSet0.vp_c10)._m0[9].x, _2260);
    float _2276 = in.m_79.x;
    float _2278 = fma(_1209, _2244, _2262);
    float _2280 = _2264 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _2282 = _2266 + _1781;
    float _2284 = _2264 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _2286 = fma(_2270, (*spvDescriptorSet0.vp_c10)._m0[8].z, _2272);
    float _2288 = _2264 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _2290 = fma(_2270, (*spvDescriptorSet0.vp_c10)._m0[9].z, _2274);
    float _2292 = fma(_2278, (*spvDescriptorSet0.vp_c10)._m0[8].x, _2280);
    float _2294 = _2282 * 0.5;
    float _2296 = fma(_2278, (*spvDescriptorSet0.vp_c10)._m0[9].x, _2284);
    float _2298 = fma(_2278, (*spvDescriptorSet0.vp_c10)._m0[10].x, _2288);
    float _2300 = _1914 * _2128;
    float _2302 = fma(_2268, (*spvDescriptorSet0.vp_c10)._m0[8].z, _2292);
    float _2304 = fma(_2268, (*spvDescriptorSet0.vp_c10)._m0[9].z, _2296);
    float _2306 = fma(_2268, (*spvDescriptorSet0.vp_c10)._m0[10].z, _2298);
    float _2308 = -_2258;
    float _2310 = _2308 + 1.0;
    float _2312 = _2300 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _2314 = _2246 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _2316 = _2310 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    out.m_81.x = _2302;
    out.m_81.y = _2304;
    out.m_81.z = _2306;
    float _2318 = fma(_2254, (*spvDescriptorSet0.vp_c10)._m0[10].x, _2314);
    bool _2320 = _1533 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _2322 = isnan(_1533);
    bool _2324 = _2320 || _2322;
    bool _2326 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _2328 = _2324 || _2326;
    out.gl_Position.x = _1807;
    out.gl_Position.y = _1809;
    out.gl_Position.z = _2266;
    out.gl_Position.w = _1781;
    float _2330 = _1511 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _2332 = fma(_2270, (*spvDescriptorSet0.vp_c10)._m0[10].z, _2318);
    out.m_83.z = _2294;
    out.m_83.w = _1781;
    out.m_85.x = _2286;
    out.m_85.y = _2290;
    out.m_85.z = _2332;
    float _2334 = _2266;
    float _2336 = _2290;
    float _2338 = _2286;
    if (!_2328)
    {
        _1932 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _2340 = _1932;
    float _2342 = _2340;
    float _2344 = _2340;
    if (!_2328)
    {
        _2334 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _2346 = _2334;
    float _2348 = _2346;
    float _2350 = _2346;
    if (!_2328)
    {
        _1934 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _2352 = _1934;
    float _2354 = _2352;
    float _2356 = _2352;
    if (!_2328)
    {
        _2336 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _2358 = _2336;
    float _2360 = _2358;
    float _2362 = _2358;
    if (!_2328)
    {
        _2338 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _2364 = _2338;
    float _2366 = -_1819;
    float _2368 = _2366 + 1.0;
    float _2370 = _2368 * _2312;
    float _2372 = precise::clamp(_2370, 0.0, 1.0);
    float _2374 = -_2372;
    float _2376 = fma(_2374, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _2378 = _2376 * _2276;
    float _2380 = _2316 * _1837;
    float _2382 = -_2316;
    float _2384 = _2382 + 1.0;
    float _2386 = _2378 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _2388 = _1852 * _2380;
    out.m_87.x = _2386;
    float _2390 = _1862 * _2380;
    float _2392 = fma(_1858, _2388, _1846);
    float _2394 = fma(_1860, _2388, _1848);
    float _2396 = _1852 * _2384;
    float _2398 = fma(_1852, _2390, _1850);
    float _2400 = _2388;
    float _2402 = _2364;
    float _2404 = _2364;
    if (!_2328)
    {
        _2400 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _2406 = _2400;
    out.m_89.x = _2392;
    out.m_89.y = _2394;
    out.m_89.z = _2398;
    out.m_89.w = _2396;
    bool _2408 = !_2328;
    float _2410 = _2406;
    float _2412 = _2406;
    if (!_2408)
    {
        bool _2414 = _1533 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _2416 = isnan(_1533);
        bool _2418 = _2414 || _2416;
        bool _2420 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _2422 = _2418 || _2420;
        if (!_2422)
        {
            float _2424 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2426 = _1533 + _2424;
            float _2428 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2430 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _2428;
            float _2432 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _2434 = _2432 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _2436 = 1.0 / _2430;
            float _2438 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _2440 = _2438 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _2442 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _2444 = _2442 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _2446 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _2448 = _2446 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _2450 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _2452 = _2450 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _2454 = _2426 * _2436;
            float _2456 = precise::clamp(_2454, 0.0, 1.0);
            float _2458 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _2460 = _2458 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _2462 = fma(_2456, _2434, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _2464 = fma(_2456, _2460, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _2466 = fma(_2456, _2440, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _2468 = fma(_2456, _2444, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _2470 = fma(_2456, _2448, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _2472 = fma(_2456, _2452, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _2404 = _2466;
            _2356 = _2470;
            _2362 = _2462;
            _2350 = _2468;
            _2344 = _2464;
            _2412 = _2472;
            _2474 = true;
        }
        else
        {
            bool _2476 = _1533 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _2478 = isnan(_1533);
            bool _2480 = _2476 || _2478;
            bool _2482 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _2484 = _2480 || _2482;
            if (!_2484)
            {
                _2360 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _2486 = _2360;
            _2362 = _2486;
            if (!_2484)
            {
                _2402 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _2488 = _2402;
            _2404 = _2488;
            if (!_2484)
            {
                _2342 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _2490 = _2342;
            _2344 = _2490;
            if (!_2484)
            {
                _2348 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _2492 = _2348;
            _2350 = _2492;
            if (!_2484)
            {
                _2354 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _2494 = _2354;
            _2356 = _2494;
            if (!_2484)
            {
                _2410 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _2496 = _2410;
            bool _2498 = !_2484;
            _2412 = _2496;
            if (!_2498)
            {
                bool _2500 = _1533 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _2502 = isnan(_1533);
                bool _2504 = _2500 || _2502;
                bool _2506 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _2508 = _2504 || _2506;
                if (!_2508)
                {
                    float _2510 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2512 = _1533 + _2510;
                    float _2514 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2516 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _2514;
                    float _2518 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _2520 = _2518 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _2522 = 1.0 / _2516;
                    float _2524 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _2526 = _2524 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _2528 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _2530 = _2528 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _2532 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _2534 = _2532 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _2536 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _2538 = _2536 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _2540 = _2512 * _2522;
                    float _2542 = precise::clamp(_2540, 0.0, 1.0);
                    float _2544 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _2546 = _2544 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _2548 = fma(_2542, _2520, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _2550 = fma(_2542, _2546, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _2552 = fma(_2542, _2526, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _2554 = fma(_2542, _2530, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _2556 = fma(_2542, _2534, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _2558 = fma(_2542, _2538, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _2404 = _2552;
                    _2356 = _2556;
                    _2362 = _2548;
                    _2350 = _2554;
                    _2344 = _2550;
                    _2412 = _2558;
                    _2474 = true;
                }
                else
                {
                    _2404 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _2356 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _2362 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _2350 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _2344 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _2412 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _2474 = false;
    float _2560 = _2404;
    float _2562 = _2356;
    float _2564 = _2362;
    float _2566 = _2350;
    float _2568 = _2344;
    float _2570 = _2412;
    float _2572 = fma(_2304, -0.5, 0.5);
    float _2574 = precise::clamp(_2572, 0.0, 1.0);
    float _2576 = -_2560;
    float _2578 = _2576 + _2562;
    float _2580 = -_2564;
    float _2582 = _2580 + _2566;
    out.m_91.x = 0.0;
    float _2584 = fma(_2574, _2578, _2560);
    float _2586 = -_2568;
    float _2588 = _2586 + _2570;
    float _2590 = fma(_2574, _2582, _2564);
    float _2592 = _2584 * 0.586610972881317138671875;
    bool _2594 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2596 = fma(_2574, _2588, _2568);
    float _2598 = _2330 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2600 = fma(_2590, 0.298911988735198974609375, _2592);
    bool _2602 = _1511 > 0.0;
    bool _2604 = isnan(_1511);
    bool _2606 = _2602 || _2604;
    bool _2608 = isnan(0.0);
    bool _2610 = _2606 || _2608;
    float _2612 = fma(_2596, 0.114477999508380889892578125, _2600);
    out.m_49.x = _2598;
    float _2614 = -_2612;
    float _2616 = _2590 + _2614;
    float _2618 = -_2612;
    float _2620 = _2584 + _2618;
    float _2622 = -_2612;
    float _2624 = _2596 + _2622;
    float _2626 = fma(_2616, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2612);
    float _2628 = fma(_2620, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2612);
    float _2630 = fma(_2624, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2612);
    bool _2632 = !_2594;
    if (!_2632)
    {
        float _2634 = -_1453;
        float _2636 = _2634 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _2638 = -_1455;
        float _2640 = _2638 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _2642 = -_1457;
        float _2644 = _2642 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _2646 = _2636 * _2636;
        float _2648 = fma(_2640, _2640, _2646);
        float _2650 = fma(_2644, _2644, _2648);
        float _2652 = sqrt(_2650);
        float _2654 = rsqrt(_2650);
        float _2656 = -_2652;
        float _2658 = _2656 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _2660 = _2658 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _2662 = precise::clamp(_2660, 0.0, 1.0);
        float _2664 = _2640 * _2654;
        float _2666 = _2636 * _2654;
        float _2668 = abs(_2662);
        float _2670 = log2(_2668);
        float _2672 = _2644 * _2654;
        float _2674 = _2664 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _2676 = _2304 * _2666;
        float _2678 = -_2666;
        float _2680 = -_2674;
        float _2682 = fma(_2678, (*spvDescriptorSet0.vp_c15)._m0[656].y, _2680);
        float _2684 = fma(_2302, _2664, _2676);
        float _2686 = -_2672;
        float _2688 = fma(_2686, (*spvDescriptorSet0.vp_c15)._m0[656].z, _2682);
        float _2690 = fma(_2306, _2672, _2684);
        float _2692 = precise::clamp(_2690, 0.0, 1.0);
        float _2694 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _2696 = _2688 + _2694;
        float _2698 = _2670 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _2700 = _2696 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _2702 = precise::clamp(_2700, 0.0, 1.0);
        float _2704 = exp2(_2698);
        float _2706 = _2704 * _2702;
        float _2708 = _2692 * _2706;
        float _2710 = _2708 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _2712 = _2708 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _2714 = _2708 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_91.x = _2710;
        out.m_91.y = _2712;
        out.m_91.z = _2714;
    }
    out.m_93.x = _2626;
    out.m_93.y = _2628;
    out.m_93.z = _2630;
    if (_2610)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_55.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_55.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_55.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_55.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_57.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_57.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_57.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_57.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_49.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_49.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_49.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_49.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_93.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_93.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_93.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_93.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_91.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_91.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_91.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_91.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    out.m_49.x = 0.0;
    float _2716 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _2716;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_55.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_55.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_55.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_55.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_57.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_57.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_57.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_57.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_49.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_49.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_49.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_49.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_93.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_93.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_93.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_93.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_91.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_91.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_91.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_91.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

