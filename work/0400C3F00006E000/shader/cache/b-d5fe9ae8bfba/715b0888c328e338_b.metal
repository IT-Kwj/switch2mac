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
    float4 m_91 [[user(locn3)]];
    float4 m_73 [[user(locn4)]];
    float4 m_75 [[user(locn5)]];
    float4 m_81 [[user(locn6)]];
    float4 m_83 [[user(locn7)]];
    float4 m_79 [[user(locn8)]];
    float4 m_71 [[user(locn9)]];
    float4 m_89 [[user(locn10)]];
    float4 m_85 [[user(locn11)]];
    float4 m_87 [[user(locn12)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_77 [[attribute(0)]];
    float4 m_59 [[attribute(1)]];
    float4 m_46 [[attribute(2)]];
    float4 m_51 [[attribute(3)]];
    float4 m_69 [[attribute(4)]];
    float4 m_61 [[attribute(5)]];
    float4 m_53 [[attribute(6)]];
    float4 m_63 [[attribute(7)]];
    float4 m_67 [[attribute(8)]];
    float4 m_65 [[attribute(9)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_57 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_55 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_49 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_91 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_73 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_75 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_81 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_83 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_79 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_71 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_89 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_85 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_87 = float4(0.0, 0.0, 0.0, 1.0);
    bool _2346 = false;
    bool _531 = false;
    bool _188 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _105 = in.m_46.w;
    float _107 = trunc(_105);
    int _110 = int(_107);
    bool _114 = _110 >= 1;
    float _116 = 0.0;
    if (!_114)
    {
        _116 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _118 = _116;
    float _120 = _118;
    if (!_114)
    {
        out.m_49.x = 0.0;
    }
    int _122 = 0;
    if (!_114)
    {
        float _124 = _118 * 5.0;
        _122 = as_type<int>(_124);
    }
    int _126 = _122;
    int _128 = _126;
    if (!_114)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2631 = as_type<float>(_126);
        out.gl_Position.z = _2631;
    }
    if (!_114)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _130 = in.m_51.w;
    bool _132 = _130 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _134 = isnan(_130);
    bool _136 = _132 || _134;
    bool _138 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _140 = _136 || _138;
    float _142 = -_130;
    float _144 = _142 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _146 = 0.0;
    float _148 = _144;
    if (_140)
    {
        float _150 = float(_110);
        _146 = _150;
    }
    float _152 = _146;
    bool _154 = _144 >= _152;
    bool _156 = !_140;
    bool _158 = _154 || _156;
    if (_158)
    {
        _120 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _160 = _120;
    if (_158)
    {
        out.m_49.x = 0.0;
    }
    if (_158)
    {
        float _162 = _160 * 5.0;
        _128 = as_type<int>(_162);
    }
    int _164 = _128;
    if (_158)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2700 = as_type<float>(_164);
        out.gl_Position.z = _2700;
    }
    if (_158)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    bool _166 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    bool _168 = !_166;
    float _186;
    if (!_168)
    {
        float _170 = in.m_53.x;
        float _172 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _174 = _170 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _176 = fma(_174, (*spvDescriptorSet0.vp_c9)._m0[12].x, _144);
        float _178 = _176 * _172;
        float _180 = floor(_178);
        float _182 = -_180;
        float _184 = _178 + _182;
        _186 = _184;
        _188 = true;
    }
    else
    {
        float _190 = float(_110);
        float _192 = 1.0 / _190;
        float _194 = _144 * _192;
        _186 = _194;
    }
    _188 = false;
    float _196 = _186;
    float _198 = in.m_53.x;
    float _200 = float(as_type<int>((*spvDescriptorSet0.vp_c9)._m0[8].x));
    float _202 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _204 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _202;
    float _206 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _208 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _206;
    float _210 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _212 = _210 + (*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _214 = 1.0 / _204;
    float _216 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _218 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _220 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _222 = _216 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _224 = 1.0 / _212;
    float _226 = (*spvDescriptorSet0.vp_c9)._m0[131].x * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _228 = _218 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _230 = _220 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _232 = _200 * _198;
    float _234 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _236 = _234 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _238 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _240 = _196 + _238;
    float _242 = 1.0 / _208;
    out.m_55.x = _222;
    out.m_55.y = _228;
    out.m_55.z = _230;
    out.m_55.w = _226;
    float _244 = _240 * _214;
    float _246 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _248 = _196 + _246;
    bool _250 = _196 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _252 = isnan(_196);
    bool _254 = _250 || _252;
    bool _256 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _258 = _254 || _256;
    float _260 = float(_258);
    float _262 = trunc(_232);
    int _264 = int(_262);
    float _266 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _268 = _196 + _266;
    bool _270 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[14].x;
    float _272 = _268 * _224;
    bool _274 = _196 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _276 = isnan(_196);
    bool _278 = _274 || _276;
    bool _280 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _282 = _278 || _280;
    float _284 = float(_282);
    float _286 = 1.0 / _236;
    bool _288 = _196 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _290 = isnan(_196);
    bool _292 = _288 || _290;
    bool _294 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _296 = _292 || _294;
    float _298 = float(_296);
    float _300 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _302 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _300;
    float _304 = -_284;
    float _306 = _304 + 1.0;
    float _308 = fma(_302, _244, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    int _310 = _264 << 4;
    int _312 = _310 + 1712;
    float _314 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _316 = _196 + _314;
    float _318 = _260 * _306;
    float _320 = -_260;
    float _322 = _320 + 1.0;
    uint _325 = uint(int(uint(_312) >> uint(2)));
    uint _327 = uint(int(uint(int(_325)) >> uint(2)));
    int _329 = int(_325) & 3;
    float _331 = (*spvDescriptorSet0.vp_c9)._m0[int(_327)][_329];
    int _333 = int(_325) + 1;
    uint _335 = uint(int(uint(_333) >> uint(2)));
    int _337 = _333 & 3;
    float _339 = (*spvDescriptorSet0.vp_c9)._m0[int(_335)][_337];
    float _341 = _316 * _242;
    float _343 = -_298;
    float _345 = _343 + 1.0;
    float _347 = _298 * _322;
    float _349 = _248 * _286;
    bool _351 = _196 >= (*spvDescriptorSet0.vp_c9)._m0[147].w;
    bool _353 = isnan(_196);
    bool _355 = _351 || _353;
    bool _357 = isnan((*spvDescriptorSet0.vp_c9)._m0[147].w);
    bool _359 = _355 || _357;
    float _361 = float(_359);
    float _363 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _365 = _363 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    int _367 = _312 + 8;
    uint _369 = uint(int(uint(_367) >> uint(2)));
    uint _371 = uint(int(uint(int(_369)) >> uint(2)));
    int _373 = int(_369) & 3;
    float _375 = (*spvDescriptorSet0.vp_c9)._m0[int(_371)][_373];
    float _377 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _379 = _377 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _381 = -_361;
    float _383 = _381 + 1.0;
    float _385 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _387 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _385;
    float _389 = fma(_379, _349, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    float _391 = _284 * _383;
    float _393 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _395 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _393;
    bool _397 = _196 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _399 = isnan(_196);
    bool _401 = _397 || _399;
    bool _403 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _405 = _401 || _403;
    float _407 = float(_405);
    float _409 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _411 = _409 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _413 = fma(_387, _244, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _415 = fma(_395, _244, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _417 = _407 * _345;
    float _419 = fma(_365, _349, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _421 = fma(_411, _349, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _423 = _415 * _417;
    float _425 = -_407;
    float _427 = _425 + 1.0;
    float _429 = -(*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _431 = (*spvDescriptorSet0.vp_c9)._m0[146].z + _429;
    float _433 = _413 * _417;
    float _435 = _308 * _417;
    float _437 = fma(_431, _341, (*spvDescriptorSet0.vp_c9)._m0[145].z);
    float _439 = fma(_427, (*spvDescriptorSet0.vp_c9)._m0[143].y, _433);
    float _441 = fma(_427, (*spvDescriptorSet0.vp_c9)._m0[143].z, _435);
    float _443 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _445 = fma(_421, _347, _439);
    float _447 = -(*spvDescriptorSet0.vp_c9)._m0[146].x;
    float _449 = _447 + (*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _451 = _331 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _453 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _455 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _453;
    float _457 = _339 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _459 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _461 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _459;
    float _463 = _451 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _465 = fma(_455, _341, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _467 = fma(_427, (*spvDescriptorSet0.vp_c9)._m0[143].x, _423);
    float _469 = fma(_461, _341, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _471 = -(*spvDescriptorSet0.vp_c9)._m0[146].z;
    float _473 = _471 + (*spvDescriptorSet0.vp_c9)._m0[147].z;
    float _475 = _375 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _477 = fma(_419, _347, _467);
    float _479 = -(*spvDescriptorSet0.vp_c9)._m0[146].y;
    float _481 = _479 + (*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _483 = fma(_389, _347, _441);
    float _485 = fma(_469, _318, _445);
    float _487 = fma(_465, _318, _477);
    float _489 = fma(_449, _272, (*spvDescriptorSet0.vp_c9)._m0[146].x);
    float _491 = fma(_481, _272, (*spvDescriptorSet0.vp_c9)._m0[146].y);
    float _493 = fma(_473, _272, (*spvDescriptorSet0.vp_c9)._m0[146].z);
    float _495 = fma(_437, _318, _483);
    float _497 = _457 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _499 = _475 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _501 = fma(_489, _391, _487);
    float _503 = fma(_491, _391, _485);
    float _505 = fma(_493, _391, _495);
    out.m_57.x = _463;
    out.m_57.y = _497;
    out.m_57.z = _499;
    out.m_57.w = _443;
    float _507 = fma(_361, (*spvDescriptorSet0.vp_c9)._m0[147].y, _503);
    float _509 = fma(_361, (*spvDescriptorSet0.vp_c9)._m0[147].z, _505);
    float _511 = fma(_361, (*spvDescriptorSet0.vp_c9)._m0[147].x, _501);
    bool _513 = !_270;
    float _529;
    if (!_513)
    {
        float _515 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[14].x;
        float _517 = _198 * (*spvDescriptorSet0.vp_c9)._m0[15].x;
        float _519 = fma(_517, (*spvDescriptorSet0.vp_c9)._m0[14].x, _144);
        float _521 = _519 * _515;
        float _523 = floor(_521);
        float _525 = -_523;
        float _527 = _521 + _525;
        _529 = _527;
        _531 = true;
    }
    else
    {
        float _533 = float(_110);
        float _535 = 1.0 / _533;
        float _537 = _144 * _535;
        _529 = _537;
    }
    _531 = false;
    float _539 = _529;
    float _541 = _198 * 2.0;
    float _543 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _545 = log2(_543);
    float _547 = in.m_53.y;
    float _549 = -(*spvDescriptorSet0.vp_c9)._m0[159].w;
    float _551 = _549 + (*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _553 = -(*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _555 = _553 + (*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _557 = floor(_541);
    float _559 = -(*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _561 = _559 + (*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _563 = -(*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _565 = _539 + _563;
    int _567 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _569 = _567 != 0;
    int _571 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _573 = _571 != 0;
    int _575 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _577 = _575 != 0;
    float _579 = -(*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _581 = _579 + (*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _583 = 1.0 / _551;
    float _585 = in.m_53.z;
    float _587 = _545 * _144;
    float _589 = -(*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _591 = _589 + (*spvDescriptorSet0.vp_c9)._m0[164].w;
    bool _593 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _595 = isnan(0.0);
    bool _597 = _593 || _595;
    bool _599 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _601 = _597 || _599;
    bool _603 = _539 >= (*spvDescriptorSet0.vp_c9)._m0[159].w;
    bool _605 = isnan(_539);
    bool _607 = _603 || _605;
    bool _609 = isnan((*spvDescriptorSet0.vp_c9)._m0[159].w);
    bool _611 = _607 || _609;
    float _613 = float(_611);
    float _615 = 1.0 / _555;
    float _617 = _547 * 2.0;
    bool _619 = _557 > 0.0;
    bool _621 = _557 >= 0.0;
    bool _623 = isnan(_557);
    bool _625 = _621 || _623;
    bool _627 = isnan(0.0);
    bool _629 = _625 || _627;
    bool _631 = !_573;
    int _633 = _631 ? 0 : 1;
    float _635 = 1.0 / _561;
    float _637 = -(*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _639 = _637 + (*spvDescriptorSet0.vp_c9)._m0[165].w;
    int _641 = _629 ? 0 : 1;
    float _643 = exp2(_587);
    float _645 = -(*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _647 = _645 + (*spvDescriptorSet0.vp_c9)._m0[166].w;
    float _649 = _585 * 2.0;
    float _651 = -(*spvDescriptorSet0.vp_c9)._m0[159].x;
    float _653 = (*spvDescriptorSet0.vp_c9)._m0[160].x + _651;
    float _655 = _653 * _583;
    float _657 = 1.0 / _647;
    float _659 = -(*spvDescriptorSet0.vp_c9)._m0[160].x;
    float _661 = _659 + (*spvDescriptorSet0.vp_c9)._m0[161].x;
    float _663 = _661 * _615;
    float _665 = -(*spvDescriptorSet0.vp_c9)._m0[165].x;
    float _667 = (*spvDescriptorSet0.vp_c9)._m0[166].x + _665;
    float _669 = 1.0 / _581;
    float _671 = -_643;
    float _673 = _671 + 1.0;
    float _675 = 1.0 / _639;
    float _677 = _667 * _657;
    float _679 = floor(_649);
    float _681 = -(*spvDescriptorSet0.vp_c9)._m0[161].x;
    float _683 = (*spvDescriptorSet0.vp_c9)._m0[162].x + _681;
    float _685 = -(*spvDescriptorSet0.vp_c9)._m0[162].x;
    float _687 = _685 + (*spvDescriptorSet0.vp_c9)._m0[163].x;
    float _689 = _683 * _635;
    float _691 = -(*spvDescriptorSet0.vp_c9)._m0[163].x;
    float _693 = (*spvDescriptorSet0.vp_c9)._m0[164].x + _691;
    float _695 = -(*spvDescriptorSet0.vp_c9)._m0[164].x;
    float _697 = _695 + (*spvDescriptorSet0.vp_c9)._m0[165].x;
    float _699 = 1.0 / _591;
    float _701 = _601 ? _673 : 0.0;
    float _703 = _198 + _547;
    float _705 = _697 * _675;
    float _707 = _687 * _669;
    bool _709 = _539 >= (*spvDescriptorSet0.vp_c9)._m0[164].w;
    bool _711 = isnan(_539);
    bool _713 = _709 || _711;
    bool _715 = isnan((*spvDescriptorSet0.vp_c9)._m0[164].w);
    bool _717 = _713 || _715;
    float _719 = float(_717);
    float _721 = _703 + (-1.0);
    float _723 = fma(_689, _565, (*spvDescriptorSet0.vp_c9)._m0[161].x);
    float _725 = floor(_617);
    float _727 = _547 + _585;
    bool _729 = _679 > 0.0;
    bool _731 = _679 >= 0.0;
    bool _733 = isnan(_679);
    bool _735 = _731 || _733;
    bool _737 = isnan(0.0);
    bool _739 = _735 || _737;
    float _741 = _727 + (-1.0);
    bool _743 = _539 >= (*spvDescriptorSet0.vp_c9)._m0[165].w;
    bool _745 = isnan(_539);
    bool _747 = _743 || _745;
    bool _749 = isnan((*spvDescriptorSet0.vp_c9)._m0[165].w);
    bool _751 = _747 || _749;
    float _753 = float(_751);
    float _755 = _693 * _699;
    float _757 = fma(_741, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    bool _759 = _539 >= (*spvDescriptorSet0.vp_c9)._m0[166].w;
    bool _761 = isnan(_539);
    bool _763 = _759 || _761;
    bool _765 = isnan((*spvDescriptorSet0.vp_c9)._m0[166].w);
    bool _767 = _763 || _765;
    float _769 = float(_767);
    float _771 = -_753;
    float _773 = _771 + 1.0;
    float _775 = -(*spvDescriptorSet0.vp_c9)._m0[159].w;
    float _777 = _539 + _775;
    int _779 = _739 ? 0 : 1;
    float _781 = -_769;
    float _783 = _781 + 1.0;
    bool _785 = _725 > 0.0;
    float _787 = fma(_721, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    bool _789 = _539 >= (*spvDescriptorSet0.vp_c9)._m0[163].w;
    bool _791 = isnan(_539);
    bool _793 = _789 || _791;
    bool _795 = isnan((*spvDescriptorSet0.vp_c9)._m0[163].w);
    bool _797 = _793 || _795;
    float _799 = float(_797);
    float _801 = _753 * _783;
    float _803 = _719 * _773;
    float _805 = -_719;
    float _807 = _805 + 1.0;
    bool _809 = _725 >= 0.0;
    bool _811 = isnan(_725);
    bool _813 = _809 || _811;
    bool _815 = isnan(0.0);
    bool _817 = _813 || _815;
    float _819 = fma(_655, _777, (*spvDescriptorSet0.vp_c9)._m0[159].x);
    bool _821 = _539 >= (*spvDescriptorSet0.vp_c9)._m0[162].w;
    bool _823 = isnan(_539);
    bool _825 = _821 || _823;
    bool _827 = isnan((*spvDescriptorSet0.vp_c9)._m0[162].w);
    bool _829 = _825 || _827;
    float _831 = float(_829);
    float _833 = _799 * _807;
    float _835 = -_799;
    float _837 = _835 + 1.0;
    bool _839 = _539 >= (*spvDescriptorSet0.vp_c9)._m0[161].w;
    bool _841 = isnan(_539);
    bool _843 = _839 || _841;
    bool _845 = isnan((*spvDescriptorSet0.vp_c9)._m0[161].w);
    bool _847 = _843 || _845;
    float _849 = float(_847);
    float _851 = -(*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _853 = _539 + _851;
    float _855 = -_831;
    float _857 = _855 + 1.0;
    bool _859 = _539 >= (*spvDescriptorSet0.vp_c9)._m0[160].w;
    bool _861 = isnan(_539);
    bool _863 = _859 || _861;
    bool _865 = isnan((*spvDescriptorSet0.vp_c9)._m0[160].w);
    bool _867 = _863 || _865;
    float _869 = float(_867);
    float _871 = _831 * _837;
    float _873 = fma(_663, _853, (*spvDescriptorSet0.vp_c9)._m0[160].x);
    float _875 = _849 * _857;
    float _877 = -_849;
    float _879 = _877 + 1.0;
    float _881 = -(*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _883 = _539 + _881;
    float _885 = -_869;
    float _887 = _885 + 1.0;
    float _889 = _869 * _879;
    float _891 = fma(_707, _883, (*spvDescriptorSet0.vp_c9)._m0[162].x);
    float _893 = -(*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _895 = _539 + _893;
    float _897 = _613 * _887;
    float _899 = -(*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _901 = _539 + _899;
    float _903 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _905 = 1.0 + _903;
    float _907 = fma(_755, _895, (*spvDescriptorSet0.vp_c9)._m0[163].x);
    float _909 = _819 * _897;
    float _911 = fma(_705, _901, (*spvDescriptorSet0.vp_c9)._m0[164].x);
    float _913 = -(*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _915 = _539 + _913;
    float _917 = in.m_59.x;
    float _919 = in.m_59.y;
    float _921 = in.m_59.z;
    int _923 = abs(_633);
    float _925 = 1.0 / _905;
    int _927 = ~_641;
    int _929 = _927 + 1;
    int _931 = _929 + 1;
    float _933 = fma(_677, _915, (*spvDescriptorSet0.vp_c9)._m0[165].x);
    float _935 = -_613;
    float _937 = _935 + 1.0;
    int _939 = _931;
    int _941 = as_type<int>(_547);
    float _943 = 1.0;
    if (!_619)
    {
        int _945 = ~_641;
        int _947 = _945 + 1;
        _939 = _947;
    }
    int _949 = _939;
    bool _951 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _953 = isnan(1.0);
    bool _955 = _951 || _953;
    bool _957 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _959 = _955 || _957;
    float _961 = fma(_937, (*spvDescriptorSet0.vp_c9)._m0[159].x, _909);
    float _963 = float(_923);
    float _965 = float(_949);
    float _967 = fma(_873, _889, _961);
    bool _969 = !_569;
    int _971 = _969 ? 0 : 1;
    int _973 = ~_779;
    int _975 = _973 + 1;
    int _977 = _975 + 1;
    float _979 = _963 * _965;
    int _981 = _977;
    float _983 = _965;
    bool _985 = _959;
    if (!_729)
    {
        int _987 = ~_779;
        int _989 = _987 + 1;
        _981 = _989;
    }
    int _991 = _981;
    float _993 = fma(_723, _875, _967);
    int _995 = _817 ? 0 : 1;
    float _997 = _979 * (-2.0);
    if (_959)
    {
        float _999 = _701 * _925;
        _148 = _999;
    }
    float _1001 = _148;
    int _1003 = abs(_971);
    float _1005 = _547 + (-0.5);
    float _1007 = fma(_997, _919, _919);
    float _1009 = float(_991);
    float _1011 = fma(_757, _997, _757);
    float _1013 = float(_1003);
    float _1015 = fma(_1005, (*spvDescriptorSet0.vp_c9)._m0[196].y, _1007);
    float _1017 = fma(_891, _871, _993);
    bool _1019 = !_577;
    int _1021 = _1019 ? 0 : 1;
    float _1023 = _1013 * _1009;
    float _1025 = fma(_1011, _1001, _1015);
    int _1027 = ~_995;
    int _1029 = _1027 + 1;
    int _1031 = _1029 + 1;
    float _1033 = in.m_61.z;
    int _1035 = _1031;
    if (!_785)
    {
        int _1037 = ~_995;
        int _1039 = _1037 + 1;
        _1035 = _1039;
    }
    int _1041 = _1035;
    float _1043 = fma(_907, _833, _1017);
    int _1045 = abs(_1021);
    float _1047 = _1023 * (-2.0);
    float _1049 = _198 + _585;
    float _1051 = _1025 * 0.15915493667125701904296875;
    float _1053 = float(_1041);
    float _1055 = _198 + (-0.5);
    float _1057 = fma(_1047, _917, _917);
    float _1059 = _1049 + (-1.0);
    float _1061 = fma(_911, _803, _1043);
    float _1063 = float(_1045);
    float _1065 = fma(_1055, (*spvDescriptorSet0.vp_c9)._m0[196].x, _1057);
    float _1067 = fma(_1059, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _1069 = fma(_933, _801, _1061);
    float _1071 = fma(_787, _1047, _787);
    float _1073 = _1063 * _1053;
    float _1075 = _1051 * 6.283185482025146484375;
    float _1077 = sin(_1075);
    float _1079 = fma(_769, (*spvDescriptorSet0.vp_c9)._m0[166].x, _1069);
    float _1081 = (*spvDescriptorSet0.vp_c9)._m0[191].x * (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _1083 = fma(_1071, _1001, _1065);
    float _1085 = _198 + _1033;
    float _1087 = _1073 * (-2.0);
    float _1089 = in.m_63.x;
    float _1091 = in.m_63.y;
    float _1093 = in.m_63.z;
    float _1095 = _1083 * 0.15915493667125701904296875;
    float _1097 = fma(_1079, _1081, _1085);
    float _1099 = _1051 * 6.283185482025146484375;
    float _1101 = cos(_1099);
    float _1103 = fma(_1087, _921, _921);
    float _1105 = in.m_61.x;
    float _1107 = _1097 * (*spvDescriptorSet0.vp_c9)._m0[191].y;
    float _1109 = _585 + (-0.5);
    float _1111 = fma(_1067, _1087, _1067);
    float _1113 = _1107 * 0.15915493667125701904296875;
    float _1115 = fma(_1109, (*spvDescriptorSet0.vp_c9)._m0[196].z, _1103);
    float _1117 = in.m_61.y;
    float _1119 = _1095 * 6.283185482025146484375;
    float _1121 = sin(_1119);
    bool _1123 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _1125 = isnan(0.5);
    bool _1127 = _1123 || _1125;
    bool _1129 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1131 = _1127 || _1129;
    float _1133 = fma(_1111, _1001, _1115);
    float _1135 = in.m_46.x;
    float _1137 = in.m_46.y;
    float _1139 = in.m_46.z;
    float _1141 = _1133 * 0.15915493667125701904296875;
    float _1143 = _1113 * 6.283185482025146484375;
    float _1145 = sin(_1143);
    float _1147 = _511 * _1089;
    float _1149 = fma(_547, (*spvDescriptorSet0.vp_c9)._m0[191].z, 0.20000000298023223876953125);
    float _1151 = _509 * _1093;
    float _1153 = _507 * _1091;
    float _1155 = _1147 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1157 = _1095 * 6.283185482025146484375;
    float _1159 = cos(_1157);
    float _1161 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _1105);
    float _1163 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _1033);
    float _1165 = _1151 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _1167 = _1121 * _1077;
    float _1169 = _1161 * _1155;
    float _1171 = _1153 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1173 = _1163 * _1165;
    float _1175 = _1141 * 6.283185482025146484375;
    float _1177 = cos(_1175);
    float _1179 = fma(_1145, _1149, _1117);
    float _1181 = _1121 * _1101;
    float _1183 = _1137 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _1185 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _1179);
    float _1187 = _1141 * 6.283185482025146484375;
    float _1189 = sin(_1187);
    float _1191 = _1159 * _1077;
    float _1193 = _1159 * _1101;
    float _1195 = _1185 * _1171;
    float _1197 = fma(_1135, (*spvDescriptorSet0.vp_c10)._m0[6].x, _1183);
    float _1199 = _1159 * _1177;
    float _1201 = _1101 * _1177;
    float _1203 = _1121 * _1177;
    float _1205 = _1077 * _1177;
    float _1207 = fma(_1139, (*spvDescriptorSet0.vp_c10)._m0[6].z, _1197);
    float _1209 = _1203 * _1195;
    float _1211 = -_1191;
    float _1213 = fma(_1189, _1181, _1211);
    float _1215 = -_1181;
    float _1217 = fma(_1189, _1191, _1215);
    float _1219 = fma(_1189, _1193, _1167);
    float _1221 = _1199 * _1195;
    float _1223 = fma(_1189, _1167, _1193);
    float _1225 = -_1195;
    float _1227 = _1189 * _1225;
    float _1229 = fma(_1213, _1169, _1209);
    float _1231 = fma(_1219, _1169, _1221);
    float _1233 = _1137 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _1235 = fma(_1201, _1169, _1227);
    float _1237 = fma(_1223, _1173, _1229);
    float _1239 = fma(_1217, _1173, _1231);
    float _1241 = fma(_1135, (*spvDescriptorSet0.vp_c10)._m0[4].x, _1233);
    float _1243 = fma(_1205, _1173, _1235);
    float _1245 = _1207 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _1247 = _1239 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _1249 = _1239 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _1251 = fma(_1139, (*spvDescriptorSet0.vp_c10)._m0[4].z, _1241);
    float _1253 = _1137 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _1255 = fma(_1243, (*spvDescriptorSet0.vp_c10)._m0[10].x, _1247);
    float _1257 = fma(_1243, (*spvDescriptorSet0.vp_c10)._m0[8].x, _1249);
    float _1259 = _1251 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _1261 = fma(_1135, (*spvDescriptorSet0.vp_c10)._m0[5].x, _1253);
    float _1263 = fma(_1237, (*spvDescriptorSet0.vp_c10)._m0[10].z, _1255);
    float _1265 = fma(_1237, (*spvDescriptorSet0.vp_c10)._m0[8].z, _1257);
    float _1267 = _1239 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _1269 = fma(_1139, (*spvDescriptorSet0.vp_c10)._m0[5].z, _1261);
    float _1271 = _1245 + _1263;
    float _1273 = _1259 + _1265;
    float _1275 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1277 = _1271 + _1275;
    float _1279 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1281 = _1273 + _1279;
    float _1283 = _1277 * _1277;
    float _1285 = fma(_1281, _1281, _1283);
    float _1287 = fma(_1243, (*spvDescriptorSet0.vp_c10)._m0[9].x, _1267);
    float _1289 = _1269 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _1291 = sqrt(_1285);
    float _1293 = fma(_1237, (*spvDescriptorSet0.vp_c10)._m0[9].z, _1287);
    float _1295 = _1289 + _1293;
    bool _1297 = _1291 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1299 = _1273;
    float _1301 = _1271;
    float _1303 = _1291;
    float _1305 = _1243;
    if (!_1297)
    {
        _983 = _1295;
    }
    float _1307 = _983;
    bool _1309 = !_1297;
    float _1311 = _1307;
    if (!_1309)
    {
        float _1313 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1315 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1317 = _1291 + _1315;
        float _1319 = _1295 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1321 = rsqrt(_1285);
        float _1323 = _1317 * _1313;
        float _1325 = _1323 * 0.15915493667125701904296875;
        float _1327 = _1325 * 6.283185482025146484375;
        float _1329 = cos(_1327);
        float _1331 = _1325 * 6.283185482025146484375;
        float _1333 = sin(_1331);
        float _1335 = _1329 + (-1.0);
        float _1337 = _1335 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1339 = fma(_1333, _1319, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1341 = fma(_1295, _1329, _1337);
        float _1343 = _1321 * _1339;
        float _1345 = fma(_1281, _1343, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1347 = fma(_1277, _1343, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1299 = _1345;
        _1311 = _1341;
        _1301 = _1347;
        _1303 = _1317;
        _1305 = _1325;
    }
    float _1349 = _1299;
    float _1351 = _1311;
    float _1353 = _1301;
    float _1355 = _1303;
    float _1357 = _1305;
    float _1359 = _1351;
    float _1361 = _1349;
    float _1363 = _1353;
    float _1365 = _1357;
    float _1367 = _1355;
    if (!_1131)
    {
        float _1369 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _1371 = _1289 + _1369;
        float _1373 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _1375 = _1259 + _1373;
        float _1377 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1379 = -_1259;
        float _1381 = _1379 + _1349;
        float _1383 = _1371 * _1371;
        float _1385 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _1387 = _1245 + _1385;
        float _1389 = fma(_1375, _1375, _1383);
        float _1391 = fma(_1387, _1387, _1389);
        float _1393 = sqrt(_1391);
        float _1395 = precise::min(_1393, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1397 = _1395 * _1377;
        float _1399 = -_1289;
        float _1401 = _1399 + _1351;
        float _1403 = -_1245;
        float _1405 = _1403 + _1353;
        float _1407 = fma(_1381, _1397, _1259);
        float _1409 = fma(_1401, _1397, _1289);
        float _1411 = fma(_1405, _1397, _1245);
        _1359 = _1409;
        _1361 = _1407;
        _1363 = _1411;
        _1365 = _1401;
    }
    float _1413 = _1359;
    float _1415 = _1361;
    float _1417 = _1363;
    float _1419 = _1365;
    float _1421 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1423 = _1413 + _1421;
    float _1425 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1427 = _1415 + _1425;
    float _1429 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1431 = _1417 + _1429;
    float _1433 = _1413 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1435 = _1423 * _1423;
    float _1437 = fma(_1427, _1427, _1435);
    float _1439 = fma(_1431, _1431, _1437);
    float _1441 = rsqrt(_1439);
    float _1443 = sqrt(_1439);
    float _1445 = _1441 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1447 = _1427 * _1445;
    float _1449 = _1431 * _1445;
    float _1451 = _1447 * _1447;
    float _1453 = _1449 * _1449;
    float _1455 = _1451 + _1453;
    float _1457 = sqrt(_1455);
    bool _1459 = _1457 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1461 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1463 = _1457 + _1461;
    float _1465 = _1441;
    float _1467 = _1419;
    float _1469 = _1463;
    float _1471 = _1423;
    float _1473 = _1445;
    int _1475 = as_type<int>(_1433);
    if (_1459)
    {
        float _1477 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1465 = _1477;
    }
    float _1479 = _1465;
    if (_1459)
    {
        float _1481 = rsqrt(_1455);
        _1467 = _1481;
    }
    float _1483 = _1467;
    if (_1459)
    {
        float _1485 = _1463 * _1479;
        _1469 = _1485;
    }
    float _1487 = _1469;
    if (_1459)
    {
        float _1489 = _1487 * 0.15915493667125701904296875;
        _1367 = _1489;
    }
    float _1491 = _1367;
    float _1493 = _1479;
    float _1495 = _1491;
    if (_1459)
    {
        float _1497 = _1491 * 6.283185482025146484375;
        float _1499 = sin(_1497);
        _1493 = _1499;
    }
    float _1501 = _1493;
    float _1503 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1505 = precise::max(0.0, _1503);
    float _1507 = _1431;
    float _1509 = _1505;
    if (_1459)
    {
        float _1511 = _1491 * 6.283185482025146484375;
        float _1513 = cos(_1511);
        _1507 = _1513;
    }
    float _1515 = _1507;
    float _1517 = -_1445;
    float _1519 = -_1505;
    float _1521 = fma(_1423, _1517, _1519);
    float _1523 = _1521;
    if (_1459)
    {
        float _1525 = _1521 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1509 = _1525;
    }
    float _1527 = _1509;
    float _1529 = _1527;
    if (!_1459)
    {
        _1495 = _1451;
    }
    float _1531 = _1495;
    float _1533 = _1501;
    float _1535 = _1531;
    if (_1459)
    {
        float _1537 = fma(_1501, _1527, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1533 = _1537;
    }
    float _1539 = _1533;
    float _1541 = _1539;
    if (!_1459)
    {
        _1529 = _1453;
    }
    float _1543 = _1529;
    float _1545 = _1515;
    float _1547 = _1543;
    if (_1459)
    {
        float _1549 = _1515 + (-1.0);
        _1471 = _1549;
    }
    float _1551 = _1471;
    float _1553 = _1551;
    if (_1459)
    {
        float _1555 = _1483 * _1539;
        _1473 = _1555;
    }
    float _1557 = _1473;
    if (!_1459)
    {
        _1541 = _1447;
    }
    float _1559 = _1541;
    float _1561 = _1559;
    if (_1459)
    {
        float _1563 = _1551 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1553 = _1563;
    }
    float _1565 = _1553;
    if (_1459)
    {
        float _1567 = _1447 * _1557;
        _1561 = _1567;
    }
    float _1569 = _1561;
    float _1571 = _1413 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    if (_1459)
    {
        float _1573 = fma(_1521, _1515, _1565);
        _1523 = _1573;
    }
    float _1575 = _1523;
    if (!_1459)
    {
        _1545 = _1449;
    }
    float _1577 = _1545;
    float _1579 = _1577;
    if (_1459)
    {
        float _1581 = _1449 * _1557;
        _1579 = _1581;
    }
    float _1583 = _1579;
    if (_1459)
    {
        float _1585 = _1569 * _1569;
        _1535 = _1585;
    }
    float _1587 = _1535;
    float _1589 = fma(_1259, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    if (_1459)
    {
        float _1591 = _1583 * _1583;
        _1547 = _1591;
    }
    float _1593 = _1547;
    float _1595 = fma(_1575, _1575, _1587);
    float _1597 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _1599 = floor(_1589);
    float _1601 = _1595 + _1593;
    float _1603 = fma(_1415, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1571);
    float _1605 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1607 = fma(_1443, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1605);
    float _1609 = precise::clamp(_1607, 0.0, 1.0);
    float _1611 = _1413 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1613 = fma(_1417, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1603);
    float _1615 = -_1609;
    float _1617 = _1615 + 1.0;
    float _1619 = rsqrt(_1601);
    float _1621 = _1613 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1623 = _1621 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1625 = abs(_1617);
    float _1627 = log2(_1625);
    float _1629 = _1413 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1631 = -_1623;
    float _1633 = fma(_1631, _1597, 1.0);
    float _1635 = fma(_1415, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1611);
    float _1637 = fma(_1245, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _1639 = -_1599;
    float _1641 = _1589 + _1639;
    float _1643 = fma(_1417, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1635);
    float _1645 = _1619 * _1569;
    float _1647 = fma(_1415, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1629);
    float _1649 = _1619 * _1575;
    float _1651 = _1643 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1653 = _1645 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1655 = fma(_1417, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1647);
    float _1657 = _1619 * _1583;
    float _1659 = fma(_1415, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1433);
    float _1661 = -_1653;
    float _1663 = fma(_1649, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1661);
    float _1665 = _1655 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1667 = _1651 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1669 = floor(_1637);
    float _1671 = -_1657;
    float _1673 = fma(_1671, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1663);
    float _1675 = fma(_1417, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1659);
    float _1677 = fma(_1665, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1667);
    float _1679 = _1627 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1681 = fma(_1673, -0.5, 0.5);
    float _1683 = _1675 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1685 = fma(_1621, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1677);
    float _1687 = exp2(_1679);
    float _1689 = _1651 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1691 = _1651 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1693 = fma(_1683, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1685);
    float _1695 = fma(_1673, 0.5, 0.5);
    float _1697 = fma(_1665, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1689);
    float _1699 = fma(_1665, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1691);
    float _1701 = log2(_1633);
    float _1703 = fma(_1621, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1697);
    float _1705 = fma(_1621, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1699);
    float _1707 = fma(_1683, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1703);
    float _1709 = fma(_1683, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1705);
    float _1711 = 1.0 / _1693;
    float _1713 = -_1669;
    float _1715 = _1637 + _1713;
    float _1717 = fma(_1695, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1719 = _1649 + 1.0;
    float _1721 = fma(_1695, _1717, -0.212114393711090087890625);
    float _1723 = -_1649;
    float _1725 = fma(_1687, _1719, _1723);
    float _1727 = sqrt(_1681);
    float _1729 = _1701 * 0.693147182464599609375;
    float2 _5187 = float2(_1641, _1715);
    float _1731 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_5187, float2(0.0), isnan(_5187)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_5187, float2(0.0), isnan(_5187)), level(0.0)).x;
    float _1733 = fma(_1695, _1721, 1.570728778839111328125);
    float _1735 = fma(_1725, 0.5, 0.5);
    float _1737 = _1707 * _1711;
    float _1739 = _1709 * _1711;
    float _1741 = _1729 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1743 = fma(_1737, 0.5, 0.5);
    float _1745 = fma(_1739, -0.5, 0.5);
    float _1747 = _1727 * 0.636619746685028076171875;
    float3 _5221 = float3(_1743, _1745, _1741);
    float _1749 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_5221, float3(0.0), isnan(_5221)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_5221, float3(0.0), isnan(_5221)), level(0.0)).x;
    float _1751 = -_1733;
    float _1753 = fma(_1747, _1751, 1.0);
    float3 _5237 = float3(_1743, _1745, _1741);
    float4 _1756 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_5237, float3(0.0), isnan(_5237)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_5237, float3(0.0), isnan(_5237)), level(0.0)).xyzw;
    float _1758 = _1756.x;
    float _1760 = _1756.y;
    float _1762 = _1756.z;
    float _1764 = _1756.w;
    float2 _5253 = float2(_1753, _1735);
    float3 _1768 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_5253, float2(0.0), isnan(_5253)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_5253, float2(0.0), isnan(_5253)), level(0.0)).xyz;
    float _1770 = _1768.x;
    float _1772 = _1768.y;
    float _1774 = _1768.z;
    float _1776 = _1289 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1778 = in.m_65.x;
    float _1780 = fma(_1259, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1776);
    float _1782 = _1289 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    int _1784 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1786 = _1784 != 0;
    float _1788 = fma(_1245, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1780);
    float _1790 = fma(_1259, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1782);
    float _1792 = in.m_65.y;
    float _1794 = _1788 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1796 = fma(_1245, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1790);
    int _1798 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _1800 = _1798 != 0;
    float _1802 = in.m_53.w;
    float _1804 = 1.0 / _1794;
    float _1806 = _1796 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    int _1808 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1810 = _1808 != 0;
    bool _1812 = _547 > 0.5;
    float _1814 = _1806 + _1794;
    float _1816 = _1792;
    float _1818 = _1709;
    if (_1786)
    {
        bool _1820 = _198 > 0.5;
        _985 = _1820;
    }
    bool _1822 = _985;
    float _1824 = _1778;
    if (_1786)
    {
        float _1826 = -_1778;
        float _1828 = _1826 + 1.0;
        _941 = as_type<int>(_1828);
    }
    int _1830 = _941;
    int _1832 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _1834 = _1832 != 0;
    if (_1800)
    {
        float _1836 = -_1778;
        float _1838 = _1836 + 1.0;
        _1475 = as_type<int>(_1838);
    }
    int _1840 = _1475;
    float _1842 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _1844 = _1814 * _1804;
    float _1846 = _1844 * 0.5;
    float _1848 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1850 = fma(_1846, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1848);
    float _1852 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _1854 = in.m_67.x;
    float _1856 = in.m_67.y;
    float _1858 = in.m_67.z;
    float _1860 = in.m_67.w;
    bool _1862 = _1802 > 0.5;
    float _1864 = _1802;
    bool _1866 = _1862;
    if (!_1786)
    {
        _1864 = _1778;
    }
    float _1868 = _1864;
    float _1870 = _1868;
    if (_1786)
    {
        float _1872 = _1822 ? as_type<float>(_1830) : _1778;
        _1870 = _1872;
    }
    float _1874 = _1870;
    float _1876 = 1.0 / _1850;
    float _1878 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1880 = _1876 * _1878;
    float _1882 = -_1792;
    float _1884 = _1882 + 1.0;
    float _1886 = abs(_1880);
    float _1888 = log2(_1886);
    int _1890 = _1862 ? as_type<int>(_1884) : as_type<int>(_1792);
    if (_1800)
    {
        bool _1892 = _585 > 0.5;
        _1866 = _1892;
    }
    bool _1894 = _1866;
    float _1896 = _1834 ? as_type<float>(_1890) : _1792;
    if (_1810)
    {
        float _1898 = _1812 ? _1884 : _1792;
        _1816 = _1898;
    }
    float _1900 = _1816;
    float _1902 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    if (_1800)
    {
        float _1904 = _1894 ? as_type<float>(_1840) : _1778;
        _1824 = _1904;
    }
    float _1906 = _1824;
    float _1908 = _1896 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    bool _1910 = _1179 != 0.0;
    bool _1912 = isnan(_1179);
    bool _1914 = _1910 || _1912;
    bool _1916 = isnan(0.0);
    bool _1918 = _1914 || _1916;
    float _1920 = _1888 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    bool _1922 = _1105 == 0.0;
    bool _1924 = !_1918;
    bool _1926 = _1922 && _1924;
    bool _1928 = _1033 == 0.0;
    bool _1930 = _1928 && _1926;
    float _1932 = exp2(_1920);
    float _1934 = _1908 * _1902;
    float _1936 = _1203 * _1856;
    float _1938 = fma(_1213, _1854, _1936);
    float _1940 = fma(_1932, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _1942 = precise::clamp(_1940, 0.0, 1.0);
    float _1944 = _1199 * _1856;
    float _1946 = fma(_1942, -2.0, 3.0);
    float _1948 = -_1856;
    float _1950 = _1189 * _1948;
    float _1952 = fma(_1219, _1854, _1944);
    float _1954 = _1942 * _1942;
    float _1956 = fma(_1201, _1854, _1950);
    float _1958 = fma(_1217, _1858, _1952);
    float _1960 = _1954 * _1946;
    float _1962 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _1964 = in.m_69.x;
    float _1966 = in.m_69.y;
    float _1968 = in.m_69.z;
    float _1970 = fma(_1205, _1858, _1956);
    float _1972 = _1958 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _1974 = _1958 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _1976 = _1958 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _1978 = fma(_1970, (*spvDescriptorSet0.vp_c10)._m0[9].x, _1972);
    float _1980 = _1900 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1982 = fma(_1970, (*spvDescriptorSet0.vp_c10)._m0[8].x, _1974);
    float _1984 = _1906 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _1986 = fma(_1970, (*spvDescriptorSet0.vp_c10)._m0[10].x, _1976);
    float _1988 = fma(_1223, _1858, _1938);
    float _1990 = _1874 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1992 = _1980 * _1852;
    float _1994 = fma(_1988, (*spvDescriptorSet0.vp_c10)._m0[8].z, _1982);
    float _1996 = fma(_1988, (*spvDescriptorSet0.vp_c10)._m0[9].z, _1978);
    float _1998 = fma(_1988, (*spvDescriptorSet0.vp_c10)._m0[10].z, _1986);
    float _2000 = -_1960;
    float _2002 = _2000 + 1.0;
    float _2004 = _1990 * _1842;
    float _2006 = _1984 * _1962;
    float _2008 = fma(_2002, (*spvDescriptorSet0.vp_c15)._m0[654].w, _1960);
    out.m_71.x = _1994;
    out.m_71.y = _1996;
    out.m_71.z = _1998;
    float _2010 = _1938;
    float _2012 = _1960;
    float _2014 = _2002;
    if (_1930)
    {
        _2010 = _1964;
    }
    float _2016 = _2010;
    float _2018 = 0.0;
    float _2020 = _2016;
    if (_1930)
    {
        _2018 = _1966;
    }
    float _2022 = _2018;
    out.m_73.x = 1.0;
    out.m_73.y = 1.0;
    out.m_73.z = 1.0;
    float _2024 = _2022;
    if (_1930)
    {
        _2012 = _2016;
    }
    float _2026 = _2012;
    float _2028 = _2026;
    if (!_1930)
    {
        _2020 = _1964;
    }
    float _2030 = _2020;
    out.m_75.x = _2004;
    out.m_75.y = _1992;
    out.m_75.z = _2006;
    out.m_75.w = _1934;
    if (_1930)
    {
        _2014 = _2022;
    }
    float _2032 = _2014;
    float _2034 = _2032;
    if (!_1930)
    {
        _2024 = _1966;
    }
    float _2036 = _2024;
    float _2038 = _1858 * _2030;
    if (!_1930)
    {
        float _2040 = fma(_1105, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2030);
        _2028 = _2040;
    }
    float _2042 = _2028;
    bool _2044 = _1880 <= 8000.0;
    bool _2046 = isnan(_1880);
    bool _2048 = _2044 || _2046;
    bool _2050 = isnan(8000.0);
    bool _2052 = _2048 || _2050;
    float _2054 = float(_2052);
    float _2056 = _1856 * _1968;
    float _2058 = _1854 * _2036;
    float _2060 = -_2038;
    float _2062 = fma(_1854, _1968, _2060);
    if (!_1930)
    {
        float _2064 = fma(_1179, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2036);
        _2034 = _2064;
    }
    float _2066 = _2034;
    float _2068 = -_2056;
    float _2070 = fma(_1858, _2036, _2068);
    float _2072 = -_2058;
    float _2074 = fma(_1856, _2030, _2072);
    float _2076 = _2062 * _1860;
    float _2078 = _1199 * _2066;
    float _2080 = _2070 * _1860;
    if (_1930)
    {
        _943 = _1968;
    }
    float _2082 = _943;
    float _2084 = _1199 * _2076;
    float _2086 = _2074 * _1860;
    float _2088 = _2082;
    if (!_1930)
    {
        float _2090 = fma(_1033, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1968);
        _2088 = _2090;
    }
    float _2092 = _2088;
    float _2094 = _1651 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _2096 = -_2066;
    float _2098 = _1189 * _2096;
    float _2100 = fma(_1219, _2042, _2078);
    float _2102 = -_2076;
    float _2104 = _1189 * _2102;
    float _2106 = fma(_1219, _2080, _2084);
    float _2108 = fma(_1665, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2094);
    float _2110 = _1627 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _2112 = _1203 * _2066;
    float _2114 = _1203 * _2076;
    float _2116 = fma(_1201, _2080, _2104);
    float _2118 = fma(_1217, _2086, _2106);
    float _2120 = fma(_1621, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2108);
    float _2122 = fma(_1213, _2042, _2112);
    float _2124 = fma(_1213, _2080, _2114);
    float _2126 = fma(_1205, _2086, _2116);
    float _2128 = _2118 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _2130 = exp2(_2110);
    float _2132 = _2118 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _2134 = fma(_1201, _2042, _2098);
    float _2136 = fma(_1217, _2092, _2100);
    float _2138 = fma(_1683, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2120);
    float _2140 = fma(_1223, _2092, _2122);
    float _2142 = fma(_1223, _2086, _2124);
    float _2144 = fma(_2126, (*spvDescriptorSet0.vp_c10)._m0[8].x, _2128);
    float _2146 = fma(_2126, (*spvDescriptorSet0.vp_c10)._m0[9].x, _2132);
    float _2148 = in.m_77.x;
    float _2150 = fma(_1205, _2092, _2134);
    float _2152 = _2136 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _2154 = _2138 + _1693;
    float _2156 = _2136 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _2158 = fma(_2142, (*spvDescriptorSet0.vp_c10)._m0[8].z, _2144);
    float _2160 = _2136 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _2162 = fma(_2142, (*spvDescriptorSet0.vp_c10)._m0[9].z, _2146);
    float _2164 = fma(_2150, (*spvDescriptorSet0.vp_c10)._m0[8].x, _2152);
    float _2166 = _2154 * 0.5;
    float _2168 = fma(_2150, (*spvDescriptorSet0.vp_c10)._m0[9].x, _2156);
    float _2170 = fma(_2150, (*spvDescriptorSet0.vp_c10)._m0[10].x, _2160);
    float _2172 = _2054 * _2008;
    float _2174 = fma(_2140, (*spvDescriptorSet0.vp_c10)._m0[8].z, _2164);
    float _2176 = fma(_2140, (*spvDescriptorSet0.vp_c10)._m0[9].z, _2168);
    float _2178 = fma(_2140, (*spvDescriptorSet0.vp_c10)._m0[10].z, _2170);
    float _2180 = -_2130;
    float _2182 = _2180 + 1.0;
    float _2184 = _2172 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _2186 = _2118 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _2188 = _2182 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    out.m_79.x = _2174;
    out.m_79.y = _2176;
    out.m_79.z = _2178;
    float _2190 = fma(_2126, (*spvDescriptorSet0.vp_c10)._m0[10].x, _2186);
    bool _2192 = _1443 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _2194 = isnan(_1443);
    bool _2196 = _2192 || _2194;
    bool _2198 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _2200 = _2196 || _2198;
    out.gl_Position.x = _1707;
    out.gl_Position.y = _1709;
    out.gl_Position.z = _2138;
    out.gl_Position.w = _1693;
    float _2202 = fma(_2142, (*spvDescriptorSet0.vp_c10)._m0[10].z, _2190);
    out.m_81.z = _2166;
    out.m_81.w = _1693;
    out.m_83.x = _2158;
    out.m_83.y = _2162;
    out.m_83.z = _2202;
    float _2204 = _1707;
    float _2206 = _2202;
    float _2208 = _2162;
    float _2210 = _2158;
    if (!_2200)
    {
        _1818 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _2212 = _1818;
    float _2214 = _2212;
    float _2216 = _2212;
    if (!_2200)
    {
        _2204 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _2218 = _2204;
    float _2220 = _2218;
    float _2222 = _2218;
    if (!_2200)
    {
        _2206 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _2224 = _2206;
    float _2226 = _2224;
    float _2228 = _2224;
    if (!_2200)
    {
        _2208 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _2230 = _2208;
    float _2232 = _2230;
    float _2234 = _2230;
    if (!_2200)
    {
        _2210 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _2236 = _2210;
    float _2238 = -_1731;
    float _2240 = _2238 + 1.0;
    float _2242 = _2240 * _2184;
    float _2244 = precise::clamp(_2242, 0.0, 1.0);
    float _2246 = -_2244;
    float _2248 = fma(_2246, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _2250 = _2248 * _2148;
    float _2252 = _2188 * _1749;
    float _2254 = -_2188;
    float _2256 = _2254 + 1.0;
    float _2258 = _2250 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _2260 = _2250;
    float _2262 = _2236;
    float _2264 = _2236;
    if (!_2200)
    {
        _2260 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _2266 = _2260;
    float _2268 = _1764 * _2252;
    float _2270 = _1764 * _2256;
    out.m_85.x = _2258;
    float _2272 = _1774 * _2252;
    float _2274 = fma(_1770, _2268, _1758);
    float _2276 = fma(_1772, _2268, _1760);
    float _2278 = fma(_1764, _2272, _1762);
    out.m_87.x = _2274;
    out.m_87.y = _2276;
    out.m_87.z = _2278;
    out.m_87.w = _2270;
    bool _2280 = !_2200;
    float _2282 = _2266;
    float _2284 = _2266;
    if (!_2280)
    {
        bool _2286 = _1443 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _2288 = isnan(_1443);
        bool _2290 = _2286 || _2288;
        bool _2292 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _2294 = _2290 || _2292;
        if (!_2294)
        {
            float _2296 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2298 = _1443 + _2296;
            float _2300 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2302 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _2300;
            float _2304 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _2306 = _2304 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _2308 = 1.0 / _2302;
            float _2310 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _2312 = _2310 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _2314 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _2316 = _2314 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _2318 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _2320 = _2318 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _2322 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _2324 = _2322 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _2326 = _2298 * _2308;
            float _2328 = precise::clamp(_2326, 0.0, 1.0);
            float _2330 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _2332 = _2330 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _2334 = fma(_2328, _2306, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _2336 = fma(_2328, _2332, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _2338 = fma(_2328, _2312, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _2340 = fma(_2328, _2316, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _2342 = fma(_2328, _2320, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _2344 = fma(_2328, _2324, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _2222 = _2338;
            _2234 = _2342;
            _2216 = _2334;
            _2228 = _2340;
            _2284 = _2336;
            _2264 = _2344;
            _2346 = true;
        }
        else
        {
            bool _2348 = _1443 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _2350 = isnan(_1443);
            bool _2352 = _2348 || _2350;
            bool _2354 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _2356 = _2352 || _2354;
            if (!_2356)
            {
                _2214 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _2358 = _2214;
            _2216 = _2358;
            if (!_2356)
            {
                _2220 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _2360 = _2220;
            _2222 = _2360;
            if (!_2356)
            {
                _2282 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _2362 = _2282;
            _2284 = _2362;
            if (!_2356)
            {
                _2226 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _2364 = _2226;
            _2228 = _2364;
            if (!_2356)
            {
                _2232 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _2366 = _2232;
            _2234 = _2366;
            if (!_2356)
            {
                _2262 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _2368 = _2262;
            bool _2370 = !_2356;
            _2264 = _2368;
            if (!_2370)
            {
                bool _2372 = _1443 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _2374 = isnan(_1443);
                bool _2376 = _2372 || _2374;
                bool _2378 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _2380 = _2376 || _2378;
                if (!_2380)
                {
                    float _2382 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2384 = _1443 + _2382;
                    float _2386 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2388 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _2386;
                    float _2390 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _2392 = _2390 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _2394 = 1.0 / _2388;
                    float _2396 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _2398 = _2396 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _2400 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _2402 = _2400 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _2404 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _2406 = _2404 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _2408 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _2410 = _2408 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _2412 = _2384 * _2394;
                    float _2414 = precise::clamp(_2412, 0.0, 1.0);
                    float _2416 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _2418 = _2416 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _2420 = fma(_2414, _2392, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _2422 = fma(_2414, _2418, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _2424 = fma(_2414, _2398, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _2426 = fma(_2414, _2402, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _2428 = fma(_2414, _2406, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _2430 = fma(_2414, _2410, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _2222 = _2424;
                    _2234 = _2428;
                    _2216 = _2420;
                    _2228 = _2426;
                    _2284 = _2422;
                    _2264 = _2430;
                    _2346 = true;
                }
                else
                {
                    _2222 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _2234 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _2216 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _2228 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _2284 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _2264 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _2346 = false;
    float _2432 = _2222;
    float _2434 = _2234;
    float _2436 = _2216;
    float _2438 = _2228;
    float _2440 = _2284;
    float _2442 = _2264;
    float _2444 = fma(_2176, -0.5, 0.5);
    float _2446 = precise::clamp(_2444, 0.0, 1.0);
    float _2448 = -_2432;
    float _2450 = _2448 + _2434;
    float _2452 = -_2436;
    float _2454 = _2452 + _2438;
    float _2456 = -_2440;
    float _2458 = _2456 + _2442;
    bool _2460 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2462 = fma(_2446, _2450, _2432);
    float _2464 = fma(_2446, _2454, _2436);
    float _2466 = fma(_2446, _2458, _2440);
    float _2468 = _2462 * 0.586610972881317138671875;
    out.m_89.x = 0.0;
    float _2470 = fma(_2464, 0.298911988735198974609375, _2468);
    float _2472 = fma(_2466, 0.114477999508380889892578125, _2470);
    float _2474 = -_2472;
    float _2476 = _2464 + _2474;
    float _2478 = -_2472;
    float _2480 = _2462 + _2478;
    float _2482 = -_2472;
    float _2484 = _2466 + _2482;
    float _2486 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2488 = fma(_2476, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2472);
    float _2490 = fma(_2480, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2472);
    float _2492 = fma(_2484, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2472);
    out.m_49.x = _2486;
    out.m_91.x = _2488;
    out.m_91.y = _2490;
    out.m_91.z = _2492;
    if (!_2460)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _2494 = -_1413;
    float _2496 = _2494 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
    float _2498 = -_1415;
    float _2500 = _2498 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
    float _2502 = -_1417;
    float _2504 = _2502 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
    float _2506 = _2496 * _2496;
    float _2508 = fma(_2500, _2500, _2506);
    float _2510 = fma(_2504, _2504, _2508);
    float _2512 = sqrt(_2510);
    float _2514 = rsqrt(_2510);
    float _2516 = -_2512;
    float _2518 = _2516 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2520 = _2518 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
    float _2522 = precise::clamp(_2520, 0.0, 1.0);
    float _2524 = _2500 * _2514;
    float _2526 = _2496 * _2514;
    float _2528 = abs(_2522);
    float _2530 = log2(_2528);
    float _2532 = _2504 * _2514;
    float _2534 = _2524 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
    float _2536 = _2176 * _2526;
    float _2538 = -_2526;
    float _2540 = -_2534;
    float _2542 = fma(_2538, (*spvDescriptorSet0.vp_c15)._m0[656].y, _2540);
    float _2544 = fma(_2174, _2524, _2536);
    float _2546 = -_2532;
    float _2548 = fma(_2546, (*spvDescriptorSet0.vp_c15)._m0[656].z, _2542);
    float _2550 = fma(_2178, _2532, _2544);
    float _2552 = precise::clamp(_2550, 0.0, 1.0);
    float _2554 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
    float _2556 = _2548 + _2554;
    float _2558 = _2530 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
    float _2560 = _2556 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
    float _2562 = precise::clamp(_2560, 0.0, 1.0);
    float _2564 = exp2(_2558);
    float _2566 = _2564 * _2562;
    float _2568 = _2552 * _2566;
    float _2570 = _2568 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
    float _2572 = _2568 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
    float _2574 = _2568 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
    out.m_89.x = _2570;
    out.m_89.y = _2572;
    out.m_89.z = _2574;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_57 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_55 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_49 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_91 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_73 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_75 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_81 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_83 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_79 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_71 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_89 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_85 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_87 = float4(0.0, 0.0, 0.0, 1.0);
    bool _2346 = false;
    bool _531 = false;
    bool _188 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _105 = in.m_46.w;
    float _107 = trunc(_105);
    int _110 = int(_107);
    bool _114 = _110 >= 1;
    float _116 = 0.0;
    if (!_114)
    {
        _116 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _118 = _116;
    float _120 = _118;
    if (!_114)
    {
        out.m_49.x = 0.0;
    }
    int _122 = 0;
    if (!_114)
    {
        float _124 = _118 * 5.0;
        _122 = as_type<int>(_124);
    }
    int _126 = _122;
    int _128 = _126;
    if (!_114)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2631 = as_type<float>(_126);
        out.gl_Position.z = _2631;
    }
    if (!_114)
    {
        return out;
    }
    float _130 = in.m_51.w;
    bool _132 = _130 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _134 = isnan(_130);
    bool _136 = _132 || _134;
    bool _138 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _140 = _136 || _138;
    float _142 = -_130;
    float _144 = _142 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _146 = 0.0;
    float _148 = _144;
    if (_140)
    {
        float _150 = float(_110);
        _146 = _150;
    }
    float _152 = _146;
    bool _154 = _144 >= _152;
    bool _156 = !_140;
    bool _158 = _154 || _156;
    if (_158)
    {
        _120 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _160 = _120;
    if (_158)
    {
        out.m_49.x = 0.0;
    }
    if (_158)
    {
        float _162 = _160 * 5.0;
        _128 = as_type<int>(_162);
    }
    int _164 = _128;
    if (_158)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2700 = as_type<float>(_164);
        out.gl_Position.z = _2700;
    }
    if (_158)
    {
        return out;
    }
    bool _166 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    bool _168 = !_166;
    float _186;
    if (!_168)
    {
        float _170 = in.m_53.x;
        float _172 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _174 = _170 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _176 = fma(_174, (*spvDescriptorSet0.vp_c9)._m0[12].x, _144);
        float _178 = _176 * _172;
        float _180 = floor(_178);
        float _182 = -_180;
        float _184 = _178 + _182;
        _186 = _184;
        _188 = true;
    }
    else
    {
        float _190 = float(_110);
        float _192 = 1.0 / _190;
        float _194 = _144 * _192;
        _186 = _194;
    }
    _188 = false;
    float _196 = _186;
    float _198 = in.m_53.x;
    float _200 = float(as_type<int>((*spvDescriptorSet0.vp_c9)._m0[8].x));
    float _202 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _204 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _202;
    float _206 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _208 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _206;
    float _210 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _212 = _210 + (*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _214 = 1.0 / _204;
    float _216 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _218 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _220 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _222 = _216 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _224 = 1.0 / _212;
    float _226 = (*spvDescriptorSet0.vp_c9)._m0[131].x * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _228 = _218 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _230 = _220 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _232 = _200 * _198;
    float _234 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _236 = _234 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _238 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _240 = _196 + _238;
    float _242 = 1.0 / _208;
    out.m_55.x = _222;
    out.m_55.y = _228;
    out.m_55.z = _230;
    out.m_55.w = _226;
    float _244 = _240 * _214;
    float _246 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _248 = _196 + _246;
    bool _250 = _196 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _252 = isnan(_196);
    bool _254 = _250 || _252;
    bool _256 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _258 = _254 || _256;
    float _260 = float(_258);
    float _262 = trunc(_232);
    int _264 = int(_262);
    float _266 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _268 = _196 + _266;
    bool _270 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[14].x;
    float _272 = _268 * _224;
    bool _274 = _196 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _276 = isnan(_196);
    bool _278 = _274 || _276;
    bool _280 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _282 = _278 || _280;
    float _284 = float(_282);
    float _286 = 1.0 / _236;
    bool _288 = _196 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _290 = isnan(_196);
    bool _292 = _288 || _290;
    bool _294 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _296 = _292 || _294;
    float _298 = float(_296);
    float _300 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _302 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _300;
    float _304 = -_284;
    float _306 = _304 + 1.0;
    float _308 = fma(_302, _244, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    int _310 = _264 << 4;
    int _312 = _310 + 1712;
    float _314 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _316 = _196 + _314;
    float _318 = _260 * _306;
    float _320 = -_260;
    float _322 = _320 + 1.0;
    uint _325 = uint(int(uint(_312) >> uint(2)));
    uint _327 = uint(int(uint(int(_325)) >> uint(2)));
    int _329 = int(_325) & 3;
    float _331 = (*spvDescriptorSet0.vp_c9)._m0[int(_327)][_329];
    int _333 = int(_325) + 1;
    uint _335 = uint(int(uint(_333) >> uint(2)));
    int _337 = _333 & 3;
    float _339 = (*spvDescriptorSet0.vp_c9)._m0[int(_335)][_337];
    float _341 = _316 * _242;
    float _343 = -_298;
    float _345 = _343 + 1.0;
    float _347 = _298 * _322;
    float _349 = _248 * _286;
    bool _351 = _196 >= (*spvDescriptorSet0.vp_c9)._m0[147].w;
    bool _353 = isnan(_196);
    bool _355 = _351 || _353;
    bool _357 = isnan((*spvDescriptorSet0.vp_c9)._m0[147].w);
    bool _359 = _355 || _357;
    float _361 = float(_359);
    float _363 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _365 = _363 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    int _367 = _312 + 8;
    uint _369 = uint(int(uint(_367) >> uint(2)));
    uint _371 = uint(int(uint(int(_369)) >> uint(2)));
    int _373 = int(_369) & 3;
    float _375 = (*spvDescriptorSet0.vp_c9)._m0[int(_371)][_373];
    float _377 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _379 = _377 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _381 = -_361;
    float _383 = _381 + 1.0;
    float _385 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _387 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _385;
    float _389 = fma(_379, _349, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    float _391 = _284 * _383;
    float _393 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _395 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _393;
    bool _397 = _196 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _399 = isnan(_196);
    bool _401 = _397 || _399;
    bool _403 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _405 = _401 || _403;
    float _407 = float(_405);
    float _409 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _411 = _409 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _413 = fma(_387, _244, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _415 = fma(_395, _244, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _417 = _407 * _345;
    float _419 = fma(_365, _349, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _421 = fma(_411, _349, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _423 = _415 * _417;
    float _425 = -_407;
    float _427 = _425 + 1.0;
    float _429 = -(*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _431 = (*spvDescriptorSet0.vp_c9)._m0[146].z + _429;
    float _433 = _413 * _417;
    float _435 = _308 * _417;
    float _437 = fma(_431, _341, (*spvDescriptorSet0.vp_c9)._m0[145].z);
    float _439 = fma(_427, (*spvDescriptorSet0.vp_c9)._m0[143].y, _433);
    float _441 = fma(_427, (*spvDescriptorSet0.vp_c9)._m0[143].z, _435);
    float _443 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _445 = fma(_421, _347, _439);
    float _447 = -(*spvDescriptorSet0.vp_c9)._m0[146].x;
    float _449 = _447 + (*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _451 = _331 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _453 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _455 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _453;
    float _457 = _339 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _459 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _461 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _459;
    float _463 = _451 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _465 = fma(_455, _341, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _467 = fma(_427, (*spvDescriptorSet0.vp_c9)._m0[143].x, _423);
    float _469 = fma(_461, _341, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _471 = -(*spvDescriptorSet0.vp_c9)._m0[146].z;
    float _473 = _471 + (*spvDescriptorSet0.vp_c9)._m0[147].z;
    float _475 = _375 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _477 = fma(_419, _347, _467);
    float _479 = -(*spvDescriptorSet0.vp_c9)._m0[146].y;
    float _481 = _479 + (*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _483 = fma(_389, _347, _441);
    float _485 = fma(_469, _318, _445);
    float _487 = fma(_465, _318, _477);
    float _489 = fma(_449, _272, (*spvDescriptorSet0.vp_c9)._m0[146].x);
    float _491 = fma(_481, _272, (*spvDescriptorSet0.vp_c9)._m0[146].y);
    float _493 = fma(_473, _272, (*spvDescriptorSet0.vp_c9)._m0[146].z);
    float _495 = fma(_437, _318, _483);
    float _497 = _457 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _499 = _475 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _501 = fma(_489, _391, _487);
    float _503 = fma(_491, _391, _485);
    float _505 = fma(_493, _391, _495);
    out.m_57.x = _463;
    out.m_57.y = _497;
    out.m_57.z = _499;
    out.m_57.w = _443;
    float _507 = fma(_361, (*spvDescriptorSet0.vp_c9)._m0[147].y, _503);
    float _509 = fma(_361, (*spvDescriptorSet0.vp_c9)._m0[147].z, _505);
    float _511 = fma(_361, (*spvDescriptorSet0.vp_c9)._m0[147].x, _501);
    bool _513 = !_270;
    float _529;
    if (!_513)
    {
        float _515 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[14].x;
        float _517 = _198 * (*spvDescriptorSet0.vp_c9)._m0[15].x;
        float _519 = fma(_517, (*spvDescriptorSet0.vp_c9)._m0[14].x, _144);
        float _521 = _519 * _515;
        float _523 = floor(_521);
        float _525 = -_523;
        float _527 = _521 + _525;
        _529 = _527;
        _531 = true;
    }
    else
    {
        float _533 = float(_110);
        float _535 = 1.0 / _533;
        float _537 = _144 * _535;
        _529 = _537;
    }
    _531 = false;
    float _539 = _529;
    float _541 = _198 * 2.0;
    float _543 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _545 = log2(_543);
    float _547 = in.m_53.y;
    float _549 = -(*spvDescriptorSet0.vp_c9)._m0[159].w;
    float _551 = _549 + (*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _553 = -(*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _555 = _553 + (*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _557 = floor(_541);
    float _559 = -(*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _561 = _559 + (*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _563 = -(*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _565 = _539 + _563;
    int _567 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _569 = _567 != 0;
    int _571 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _573 = _571 != 0;
    int _575 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _577 = _575 != 0;
    float _579 = -(*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _581 = _579 + (*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _583 = 1.0 / _551;
    float _585 = in.m_53.z;
    float _587 = _545 * _144;
    float _589 = -(*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _591 = _589 + (*spvDescriptorSet0.vp_c9)._m0[164].w;
    bool _593 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _595 = isnan(0.0);
    bool _597 = _593 || _595;
    bool _599 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _601 = _597 || _599;
    bool _603 = _539 >= (*spvDescriptorSet0.vp_c9)._m0[159].w;
    bool _605 = isnan(_539);
    bool _607 = _603 || _605;
    bool _609 = isnan((*spvDescriptorSet0.vp_c9)._m0[159].w);
    bool _611 = _607 || _609;
    float _613 = float(_611);
    float _615 = 1.0 / _555;
    float _617 = _547 * 2.0;
    bool _619 = _557 > 0.0;
    bool _621 = _557 >= 0.0;
    bool _623 = isnan(_557);
    bool _625 = _621 || _623;
    bool _627 = isnan(0.0);
    bool _629 = _625 || _627;
    bool _631 = !_573;
    int _633 = _631 ? 0 : 1;
    float _635 = 1.0 / _561;
    float _637 = -(*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _639 = _637 + (*spvDescriptorSet0.vp_c9)._m0[165].w;
    int _641 = _629 ? 0 : 1;
    float _643 = exp2(_587);
    float _645 = -(*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _647 = _645 + (*spvDescriptorSet0.vp_c9)._m0[166].w;
    float _649 = _585 * 2.0;
    float _651 = -(*spvDescriptorSet0.vp_c9)._m0[159].x;
    float _653 = (*spvDescriptorSet0.vp_c9)._m0[160].x + _651;
    float _655 = _653 * _583;
    float _657 = 1.0 / _647;
    float _659 = -(*spvDescriptorSet0.vp_c9)._m0[160].x;
    float _661 = _659 + (*spvDescriptorSet0.vp_c9)._m0[161].x;
    float _663 = _661 * _615;
    float _665 = -(*spvDescriptorSet0.vp_c9)._m0[165].x;
    float _667 = (*spvDescriptorSet0.vp_c9)._m0[166].x + _665;
    float _669 = 1.0 / _581;
    float _671 = -_643;
    float _673 = _671 + 1.0;
    float _675 = 1.0 / _639;
    float _677 = _667 * _657;
    float _679 = floor(_649);
    float _681 = -(*spvDescriptorSet0.vp_c9)._m0[161].x;
    float _683 = (*spvDescriptorSet0.vp_c9)._m0[162].x + _681;
    float _685 = -(*spvDescriptorSet0.vp_c9)._m0[162].x;
    float _687 = _685 + (*spvDescriptorSet0.vp_c9)._m0[163].x;
    float _689 = _683 * _635;
    float _691 = -(*spvDescriptorSet0.vp_c9)._m0[163].x;
    float _693 = (*spvDescriptorSet0.vp_c9)._m0[164].x + _691;
    float _695 = -(*spvDescriptorSet0.vp_c9)._m0[164].x;
    float _697 = _695 + (*spvDescriptorSet0.vp_c9)._m0[165].x;
    float _699 = 1.0 / _591;
    float _701 = _601 ? _673 : 0.0;
    float _703 = _198 + _547;
    float _705 = _697 * _675;
    float _707 = _687 * _669;
    bool _709 = _539 >= (*spvDescriptorSet0.vp_c9)._m0[164].w;
    bool _711 = isnan(_539);
    bool _713 = _709 || _711;
    bool _715 = isnan((*spvDescriptorSet0.vp_c9)._m0[164].w);
    bool _717 = _713 || _715;
    float _719 = float(_717);
    float _721 = _703 + (-1.0);
    float _723 = fma(_689, _565, (*spvDescriptorSet0.vp_c9)._m0[161].x);
    float _725 = floor(_617);
    float _727 = _547 + _585;
    bool _729 = _679 > 0.0;
    bool _731 = _679 >= 0.0;
    bool _733 = isnan(_679);
    bool _735 = _731 || _733;
    bool _737 = isnan(0.0);
    bool _739 = _735 || _737;
    float _741 = _727 + (-1.0);
    bool _743 = _539 >= (*spvDescriptorSet0.vp_c9)._m0[165].w;
    bool _745 = isnan(_539);
    bool _747 = _743 || _745;
    bool _749 = isnan((*spvDescriptorSet0.vp_c9)._m0[165].w);
    bool _751 = _747 || _749;
    float _753 = float(_751);
    float _755 = _693 * _699;
    float _757 = fma(_741, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    bool _759 = _539 >= (*spvDescriptorSet0.vp_c9)._m0[166].w;
    bool _761 = isnan(_539);
    bool _763 = _759 || _761;
    bool _765 = isnan((*spvDescriptorSet0.vp_c9)._m0[166].w);
    bool _767 = _763 || _765;
    float _769 = float(_767);
    float _771 = -_753;
    float _773 = _771 + 1.0;
    float _775 = -(*spvDescriptorSet0.vp_c9)._m0[159].w;
    float _777 = _539 + _775;
    int _779 = _739 ? 0 : 1;
    float _781 = -_769;
    float _783 = _781 + 1.0;
    bool _785 = _725 > 0.0;
    float _787 = fma(_721, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    bool _789 = _539 >= (*spvDescriptorSet0.vp_c9)._m0[163].w;
    bool _791 = isnan(_539);
    bool _793 = _789 || _791;
    bool _795 = isnan((*spvDescriptorSet0.vp_c9)._m0[163].w);
    bool _797 = _793 || _795;
    float _799 = float(_797);
    float _801 = _753 * _783;
    float _803 = _719 * _773;
    float _805 = -_719;
    float _807 = _805 + 1.0;
    bool _809 = _725 >= 0.0;
    bool _811 = isnan(_725);
    bool _813 = _809 || _811;
    bool _815 = isnan(0.0);
    bool _817 = _813 || _815;
    float _819 = fma(_655, _777, (*spvDescriptorSet0.vp_c9)._m0[159].x);
    bool _821 = _539 >= (*spvDescriptorSet0.vp_c9)._m0[162].w;
    bool _823 = isnan(_539);
    bool _825 = _821 || _823;
    bool _827 = isnan((*spvDescriptorSet0.vp_c9)._m0[162].w);
    bool _829 = _825 || _827;
    float _831 = float(_829);
    float _833 = _799 * _807;
    float _835 = -_799;
    float _837 = _835 + 1.0;
    bool _839 = _539 >= (*spvDescriptorSet0.vp_c9)._m0[161].w;
    bool _841 = isnan(_539);
    bool _843 = _839 || _841;
    bool _845 = isnan((*spvDescriptorSet0.vp_c9)._m0[161].w);
    bool _847 = _843 || _845;
    float _849 = float(_847);
    float _851 = -(*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _853 = _539 + _851;
    float _855 = -_831;
    float _857 = _855 + 1.0;
    bool _859 = _539 >= (*spvDescriptorSet0.vp_c9)._m0[160].w;
    bool _861 = isnan(_539);
    bool _863 = _859 || _861;
    bool _865 = isnan((*spvDescriptorSet0.vp_c9)._m0[160].w);
    bool _867 = _863 || _865;
    float _869 = float(_867);
    float _871 = _831 * _837;
    float _873 = fma(_663, _853, (*spvDescriptorSet0.vp_c9)._m0[160].x);
    float _875 = _849 * _857;
    float _877 = -_849;
    float _879 = _877 + 1.0;
    float _881 = -(*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _883 = _539 + _881;
    float _885 = -_869;
    float _887 = _885 + 1.0;
    float _889 = _869 * _879;
    float _891 = fma(_707, _883, (*spvDescriptorSet0.vp_c9)._m0[162].x);
    float _893 = -(*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _895 = _539 + _893;
    float _897 = _613 * _887;
    float _899 = -(*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _901 = _539 + _899;
    float _903 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _905 = 1.0 + _903;
    float _907 = fma(_755, _895, (*spvDescriptorSet0.vp_c9)._m0[163].x);
    float _909 = _819 * _897;
    float _911 = fma(_705, _901, (*spvDescriptorSet0.vp_c9)._m0[164].x);
    float _913 = -(*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _915 = _539 + _913;
    float _917 = in.m_59.x;
    float _919 = in.m_59.y;
    float _921 = in.m_59.z;
    int _923 = abs(_633);
    float _925 = 1.0 / _905;
    int _927 = ~_641;
    int _929 = _927 + 1;
    int _931 = _929 + 1;
    float _933 = fma(_677, _915, (*spvDescriptorSet0.vp_c9)._m0[165].x);
    float _935 = -_613;
    float _937 = _935 + 1.0;
    int _939 = _931;
    int _941 = as_type<int>(_547);
    float _943 = 1.0;
    if (!_619)
    {
        int _945 = ~_641;
        int _947 = _945 + 1;
        _939 = _947;
    }
    int _949 = _939;
    bool _951 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _953 = isnan(1.0);
    bool _955 = _951 || _953;
    bool _957 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _959 = _955 || _957;
    float _961 = fma(_937, (*spvDescriptorSet0.vp_c9)._m0[159].x, _909);
    float _963 = float(_923);
    float _965 = float(_949);
    float _967 = fma(_873, _889, _961);
    bool _969 = !_569;
    int _971 = _969 ? 0 : 1;
    int _973 = ~_779;
    int _975 = _973 + 1;
    int _977 = _975 + 1;
    float _979 = _963 * _965;
    int _981 = _977;
    float _983 = _965;
    bool _985 = _959;
    if (!_729)
    {
        int _987 = ~_779;
        int _989 = _987 + 1;
        _981 = _989;
    }
    int _991 = _981;
    float _993 = fma(_723, _875, _967);
    int _995 = _817 ? 0 : 1;
    float _997 = _979 * (-2.0);
    if (_959)
    {
        float _999 = _701 * _925;
        _148 = _999;
    }
    float _1001 = _148;
    int _1003 = abs(_971);
    float _1005 = _547 + (-0.5);
    float _1007 = fma(_997, _919, _919);
    float _1009 = float(_991);
    float _1011 = fma(_757, _997, _757);
    float _1013 = float(_1003);
    float _1015 = fma(_1005, (*spvDescriptorSet0.vp_c9)._m0[196].y, _1007);
    float _1017 = fma(_891, _871, _993);
    bool _1019 = !_577;
    int _1021 = _1019 ? 0 : 1;
    float _1023 = _1013 * _1009;
    float _1025 = fma(_1011, _1001, _1015);
    int _1027 = ~_995;
    int _1029 = _1027 + 1;
    int _1031 = _1029 + 1;
    float _1033 = in.m_61.z;
    int _1035 = _1031;
    if (!_785)
    {
        int _1037 = ~_995;
        int _1039 = _1037 + 1;
        _1035 = _1039;
    }
    int _1041 = _1035;
    float _1043 = fma(_907, _833, _1017);
    int _1045 = abs(_1021);
    float _1047 = _1023 * (-2.0);
    float _1049 = _198 + _585;
    float _1051 = _1025 * 0.15915493667125701904296875;
    float _1053 = float(_1041);
    float _1055 = _198 + (-0.5);
    float _1057 = fma(_1047, _917, _917);
    float _1059 = _1049 + (-1.0);
    float _1061 = fma(_911, _803, _1043);
    float _1063 = float(_1045);
    float _1065 = fma(_1055, (*spvDescriptorSet0.vp_c9)._m0[196].x, _1057);
    float _1067 = fma(_1059, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _1069 = fma(_933, _801, _1061);
    float _1071 = fma(_787, _1047, _787);
    float _1073 = _1063 * _1053;
    float _1075 = _1051 * 6.283185482025146484375;
    float _1077 = sin(_1075);
    float _1079 = fma(_769, (*spvDescriptorSet0.vp_c9)._m0[166].x, _1069);
    float _1081 = (*spvDescriptorSet0.vp_c9)._m0[191].x * (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _1083 = fma(_1071, _1001, _1065);
    float _1085 = _198 + _1033;
    float _1087 = _1073 * (-2.0);
    float _1089 = in.m_63.x;
    float _1091 = in.m_63.y;
    float _1093 = in.m_63.z;
    float _1095 = _1083 * 0.15915493667125701904296875;
    float _1097 = fma(_1079, _1081, _1085);
    float _1099 = _1051 * 6.283185482025146484375;
    float _1101 = cos(_1099);
    float _1103 = fma(_1087, _921, _921);
    float _1105 = in.m_61.x;
    float _1107 = _1097 * (*spvDescriptorSet0.vp_c9)._m0[191].y;
    float _1109 = _585 + (-0.5);
    float _1111 = fma(_1067, _1087, _1067);
    float _1113 = _1107 * 0.15915493667125701904296875;
    float _1115 = fma(_1109, (*spvDescriptorSet0.vp_c9)._m0[196].z, _1103);
    float _1117 = in.m_61.y;
    float _1119 = _1095 * 6.283185482025146484375;
    float _1121 = sin(_1119);
    bool _1123 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _1125 = isnan(0.5);
    bool _1127 = _1123 || _1125;
    bool _1129 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1131 = _1127 || _1129;
    float _1133 = fma(_1111, _1001, _1115);
    float _1135 = in.m_46.x;
    float _1137 = in.m_46.y;
    float _1139 = in.m_46.z;
    float _1141 = _1133 * 0.15915493667125701904296875;
    float _1143 = _1113 * 6.283185482025146484375;
    float _1145 = sin(_1143);
    float _1147 = _511 * _1089;
    float _1149 = fma(_547, (*spvDescriptorSet0.vp_c9)._m0[191].z, 0.20000000298023223876953125);
    float _1151 = _509 * _1093;
    float _1153 = _507 * _1091;
    float _1155 = _1147 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1157 = _1095 * 6.283185482025146484375;
    float _1159 = cos(_1157);
    float _1161 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _1105);
    float _1163 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _1033);
    float _1165 = _1151 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _1167 = _1121 * _1077;
    float _1169 = _1161 * _1155;
    float _1171 = _1153 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1173 = _1163 * _1165;
    float _1175 = _1141 * 6.283185482025146484375;
    float _1177 = cos(_1175);
    float _1179 = fma(_1145, _1149, _1117);
    float _1181 = _1121 * _1101;
    float _1183 = _1137 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _1185 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _1179);
    float _1187 = _1141 * 6.283185482025146484375;
    float _1189 = sin(_1187);
    float _1191 = _1159 * _1077;
    float _1193 = _1159 * _1101;
    float _1195 = _1185 * _1171;
    float _1197 = fma(_1135, (*spvDescriptorSet0.vp_c10)._m0[6].x, _1183);
    float _1199 = _1159 * _1177;
    float _1201 = _1101 * _1177;
    float _1203 = _1121 * _1177;
    float _1205 = _1077 * _1177;
    float _1207 = fma(_1139, (*spvDescriptorSet0.vp_c10)._m0[6].z, _1197);
    float _1209 = _1203 * _1195;
    float _1211 = -_1191;
    float _1213 = fma(_1189, _1181, _1211);
    float _1215 = -_1181;
    float _1217 = fma(_1189, _1191, _1215);
    float _1219 = fma(_1189, _1193, _1167);
    float _1221 = _1199 * _1195;
    float _1223 = fma(_1189, _1167, _1193);
    float _1225 = -_1195;
    float _1227 = _1189 * _1225;
    float _1229 = fma(_1213, _1169, _1209);
    float _1231 = fma(_1219, _1169, _1221);
    float _1233 = _1137 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _1235 = fma(_1201, _1169, _1227);
    float _1237 = fma(_1223, _1173, _1229);
    float _1239 = fma(_1217, _1173, _1231);
    float _1241 = fma(_1135, (*spvDescriptorSet0.vp_c10)._m0[4].x, _1233);
    float _1243 = fma(_1205, _1173, _1235);
    float _1245 = _1207 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _1247 = _1239 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _1249 = _1239 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _1251 = fma(_1139, (*spvDescriptorSet0.vp_c10)._m0[4].z, _1241);
    float _1253 = _1137 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _1255 = fma(_1243, (*spvDescriptorSet0.vp_c10)._m0[10].x, _1247);
    float _1257 = fma(_1243, (*spvDescriptorSet0.vp_c10)._m0[8].x, _1249);
    float _1259 = _1251 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _1261 = fma(_1135, (*spvDescriptorSet0.vp_c10)._m0[5].x, _1253);
    float _1263 = fma(_1237, (*spvDescriptorSet0.vp_c10)._m0[10].z, _1255);
    float _1265 = fma(_1237, (*spvDescriptorSet0.vp_c10)._m0[8].z, _1257);
    float _1267 = _1239 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _1269 = fma(_1139, (*spvDescriptorSet0.vp_c10)._m0[5].z, _1261);
    float _1271 = _1245 + _1263;
    float _1273 = _1259 + _1265;
    float _1275 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1277 = _1271 + _1275;
    float _1279 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1281 = _1273 + _1279;
    float _1283 = _1277 * _1277;
    float _1285 = fma(_1281, _1281, _1283);
    float _1287 = fma(_1243, (*spvDescriptorSet0.vp_c10)._m0[9].x, _1267);
    float _1289 = _1269 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _1291 = sqrt(_1285);
    float _1293 = fma(_1237, (*spvDescriptorSet0.vp_c10)._m0[9].z, _1287);
    float _1295 = _1289 + _1293;
    bool _1297 = _1291 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1299 = _1273;
    float _1301 = _1271;
    float _1303 = _1291;
    float _1305 = _1243;
    if (!_1297)
    {
        _983 = _1295;
    }
    float _1307 = _983;
    bool _1309 = !_1297;
    float _1311 = _1307;
    if (!_1309)
    {
        float _1313 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1315 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1317 = _1291 + _1315;
        float _1319 = _1295 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1321 = rsqrt(_1285);
        float _1323 = _1317 * _1313;
        float _1325 = _1323 * 0.15915493667125701904296875;
        float _1327 = _1325 * 6.283185482025146484375;
        float _1329 = cos(_1327);
        float _1331 = _1325 * 6.283185482025146484375;
        float _1333 = sin(_1331);
        float _1335 = _1329 + (-1.0);
        float _1337 = _1335 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1339 = fma(_1333, _1319, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1341 = fma(_1295, _1329, _1337);
        float _1343 = _1321 * _1339;
        float _1345 = fma(_1281, _1343, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1347 = fma(_1277, _1343, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1299 = _1345;
        _1311 = _1341;
        _1301 = _1347;
        _1303 = _1317;
        _1305 = _1325;
    }
    float _1349 = _1299;
    float _1351 = _1311;
    float _1353 = _1301;
    float _1355 = _1303;
    float _1357 = _1305;
    float _1359 = _1351;
    float _1361 = _1349;
    float _1363 = _1353;
    float _1365 = _1357;
    float _1367 = _1355;
    if (!_1131)
    {
        float _1369 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _1371 = _1289 + _1369;
        float _1373 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _1375 = _1259 + _1373;
        float _1377 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1379 = -_1259;
        float _1381 = _1379 + _1349;
        float _1383 = _1371 * _1371;
        float _1385 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _1387 = _1245 + _1385;
        float _1389 = fma(_1375, _1375, _1383);
        float _1391 = fma(_1387, _1387, _1389);
        float _1393 = sqrt(_1391);
        float _1395 = precise::min(_1393, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1397 = _1395 * _1377;
        float _1399 = -_1289;
        float _1401 = _1399 + _1351;
        float _1403 = -_1245;
        float _1405 = _1403 + _1353;
        float _1407 = fma(_1381, _1397, _1259);
        float _1409 = fma(_1401, _1397, _1289);
        float _1411 = fma(_1405, _1397, _1245);
        _1359 = _1409;
        _1361 = _1407;
        _1363 = _1411;
        _1365 = _1401;
    }
    float _1413 = _1359;
    float _1415 = _1361;
    float _1417 = _1363;
    float _1419 = _1365;
    float _1421 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1423 = _1413 + _1421;
    float _1425 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1427 = _1415 + _1425;
    float _1429 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1431 = _1417 + _1429;
    float _1433 = _1413 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1435 = _1423 * _1423;
    float _1437 = fma(_1427, _1427, _1435);
    float _1439 = fma(_1431, _1431, _1437);
    float _1441 = rsqrt(_1439);
    float _1443 = sqrt(_1439);
    float _1445 = _1441 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1447 = _1427 * _1445;
    float _1449 = _1431 * _1445;
    float _1451 = _1447 * _1447;
    float _1453 = _1449 * _1449;
    float _1455 = _1451 + _1453;
    float _1457 = sqrt(_1455);
    bool _1459 = _1457 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1461 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1463 = _1457 + _1461;
    float _1465 = _1441;
    float _1467 = _1419;
    float _1469 = _1463;
    float _1471 = _1423;
    float _1473 = _1445;
    int _1475 = as_type<int>(_1433);
    if (_1459)
    {
        float _1477 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1465 = _1477;
    }
    float _1479 = _1465;
    if (_1459)
    {
        float _1481 = rsqrt(_1455);
        _1467 = _1481;
    }
    float _1483 = _1467;
    if (_1459)
    {
        float _1485 = _1463 * _1479;
        _1469 = _1485;
    }
    float _1487 = _1469;
    if (_1459)
    {
        float _1489 = _1487 * 0.15915493667125701904296875;
        _1367 = _1489;
    }
    float _1491 = _1367;
    float _1493 = _1479;
    float _1495 = _1491;
    if (_1459)
    {
        float _1497 = _1491 * 6.283185482025146484375;
        float _1499 = sin(_1497);
        _1493 = _1499;
    }
    float _1501 = _1493;
    float _1503 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1505 = precise::max(0.0, _1503);
    float _1507 = _1431;
    float _1509 = _1505;
    if (_1459)
    {
        float _1511 = _1491 * 6.283185482025146484375;
        float _1513 = cos(_1511);
        _1507 = _1513;
    }
    float _1515 = _1507;
    float _1517 = -_1445;
    float _1519 = -_1505;
    float _1521 = fma(_1423, _1517, _1519);
    float _1523 = _1521;
    if (_1459)
    {
        float _1525 = _1521 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1509 = _1525;
    }
    float _1527 = _1509;
    float _1529 = _1527;
    if (!_1459)
    {
        _1495 = _1451;
    }
    float _1531 = _1495;
    float _1533 = _1501;
    float _1535 = _1531;
    if (_1459)
    {
        float _1537 = fma(_1501, _1527, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1533 = _1537;
    }
    float _1539 = _1533;
    float _1541 = _1539;
    if (!_1459)
    {
        _1529 = _1453;
    }
    float _1543 = _1529;
    float _1545 = _1515;
    float _1547 = _1543;
    if (_1459)
    {
        float _1549 = _1515 + (-1.0);
        _1471 = _1549;
    }
    float _1551 = _1471;
    float _1553 = _1551;
    if (_1459)
    {
        float _1555 = _1483 * _1539;
        _1473 = _1555;
    }
    float _1557 = _1473;
    if (!_1459)
    {
        _1541 = _1447;
    }
    float _1559 = _1541;
    float _1561 = _1559;
    if (_1459)
    {
        float _1563 = _1551 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1553 = _1563;
    }
    float _1565 = _1553;
    if (_1459)
    {
        float _1567 = _1447 * _1557;
        _1561 = _1567;
    }
    float _1569 = _1561;
    float _1571 = _1413 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    if (_1459)
    {
        float _1573 = fma(_1521, _1515, _1565);
        _1523 = _1573;
    }
    float _1575 = _1523;
    if (!_1459)
    {
        _1545 = _1449;
    }
    float _1577 = _1545;
    float _1579 = _1577;
    if (_1459)
    {
        float _1581 = _1449 * _1557;
        _1579 = _1581;
    }
    float _1583 = _1579;
    if (_1459)
    {
        float _1585 = _1569 * _1569;
        _1535 = _1585;
    }
    float _1587 = _1535;
    float _1589 = fma(_1259, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    if (_1459)
    {
        float _1591 = _1583 * _1583;
        _1547 = _1591;
    }
    float _1593 = _1547;
    float _1595 = fma(_1575, _1575, _1587);
    float _1597 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _1599 = floor(_1589);
    float _1601 = _1595 + _1593;
    float _1603 = fma(_1415, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1571);
    float _1605 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1607 = fma(_1443, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1605);
    float _1609 = precise::clamp(_1607, 0.0, 1.0);
    float _1611 = _1413 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1613 = fma(_1417, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1603);
    float _1615 = -_1609;
    float _1617 = _1615 + 1.0;
    float _1619 = rsqrt(_1601);
    float _1621 = _1613 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1623 = _1621 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1625 = abs(_1617);
    float _1627 = log2(_1625);
    float _1629 = _1413 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1631 = -_1623;
    float _1633 = fma(_1631, _1597, 1.0);
    float _1635 = fma(_1415, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1611);
    float _1637 = fma(_1245, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _1639 = -_1599;
    float _1641 = _1589 + _1639;
    float _1643 = fma(_1417, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1635);
    float _1645 = _1619 * _1569;
    float _1647 = fma(_1415, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1629);
    float _1649 = _1619 * _1575;
    float _1651 = _1643 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1653 = _1645 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1655 = fma(_1417, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1647);
    float _1657 = _1619 * _1583;
    float _1659 = fma(_1415, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1433);
    float _1661 = -_1653;
    float _1663 = fma(_1649, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1661);
    float _1665 = _1655 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1667 = _1651 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1669 = floor(_1637);
    float _1671 = -_1657;
    float _1673 = fma(_1671, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1663);
    float _1675 = fma(_1417, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1659);
    float _1677 = fma(_1665, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1667);
    float _1679 = _1627 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1681 = fma(_1673, -0.5, 0.5);
    float _1683 = _1675 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1685 = fma(_1621, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1677);
    float _1687 = exp2(_1679);
    float _1689 = _1651 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1691 = _1651 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1693 = fma(_1683, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1685);
    float _1695 = fma(_1673, 0.5, 0.5);
    float _1697 = fma(_1665, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1689);
    float _1699 = fma(_1665, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1691);
    float _1701 = log2(_1633);
    float _1703 = fma(_1621, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1697);
    float _1705 = fma(_1621, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1699);
    float _1707 = fma(_1683, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1703);
    float _1709 = fma(_1683, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1705);
    float _1711 = 1.0 / _1693;
    float _1713 = -_1669;
    float _1715 = _1637 + _1713;
    float _1717 = fma(_1695, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1719 = _1649 + 1.0;
    float _1721 = fma(_1695, _1717, -0.212114393711090087890625);
    float _1723 = -_1649;
    float _1725 = fma(_1687, _1719, _1723);
    float _1727 = sqrt(_1681);
    float _1729 = _1701 * 0.693147182464599609375;
    float2 _5187 = float2(_1641, _1715);
    float _1731 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_5187, float2(0.0), isnan(_5187)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_5187, float2(0.0), isnan(_5187)), level(0.0)).x;
    float _1733 = fma(_1695, _1721, 1.570728778839111328125);
    float _1735 = fma(_1725, 0.5, 0.5);
    float _1737 = _1707 * _1711;
    float _1739 = _1709 * _1711;
    float _1741 = _1729 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1743 = fma(_1737, 0.5, 0.5);
    float _1745 = fma(_1739, -0.5, 0.5);
    float _1747 = _1727 * 0.636619746685028076171875;
    float3 _5221 = float3(_1743, _1745, _1741);
    float _1749 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_5221, float3(0.0), isnan(_5221)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_5221, float3(0.0), isnan(_5221)), level(0.0)).x;
    float _1751 = -_1733;
    float _1753 = fma(_1747, _1751, 1.0);
    float3 _5237 = float3(_1743, _1745, _1741);
    float4 _1756 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_5237, float3(0.0), isnan(_5237)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_5237, float3(0.0), isnan(_5237)), level(0.0)).xyzw;
    float _1758 = _1756.x;
    float _1760 = _1756.y;
    float _1762 = _1756.z;
    float _1764 = _1756.w;
    float2 _5253 = float2(_1753, _1735);
    float3 _1768 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_5253, float2(0.0), isnan(_5253)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_5253, float2(0.0), isnan(_5253)), level(0.0)).xyz;
    float _1770 = _1768.x;
    float _1772 = _1768.y;
    float _1774 = _1768.z;
    float _1776 = _1289 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1778 = in.m_65.x;
    float _1780 = fma(_1259, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1776);
    float _1782 = _1289 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    int _1784 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1786 = _1784 != 0;
    float _1788 = fma(_1245, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1780);
    float _1790 = fma(_1259, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1782);
    float _1792 = in.m_65.y;
    float _1794 = _1788 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1796 = fma(_1245, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1790);
    int _1798 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _1800 = _1798 != 0;
    float _1802 = in.m_53.w;
    float _1804 = 1.0 / _1794;
    float _1806 = _1796 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    int _1808 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1810 = _1808 != 0;
    bool _1812 = _547 > 0.5;
    float _1814 = _1806 + _1794;
    float _1816 = _1792;
    float _1818 = _1709;
    if (_1786)
    {
        bool _1820 = _198 > 0.5;
        _985 = _1820;
    }
    bool _1822 = _985;
    float _1824 = _1778;
    if (_1786)
    {
        float _1826 = -_1778;
        float _1828 = _1826 + 1.0;
        _941 = as_type<int>(_1828);
    }
    int _1830 = _941;
    int _1832 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _1834 = _1832 != 0;
    if (_1800)
    {
        float _1836 = -_1778;
        float _1838 = _1836 + 1.0;
        _1475 = as_type<int>(_1838);
    }
    int _1840 = _1475;
    float _1842 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _1844 = _1814 * _1804;
    float _1846 = _1844 * 0.5;
    float _1848 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1850 = fma(_1846, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1848);
    float _1852 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _1854 = in.m_67.x;
    float _1856 = in.m_67.y;
    float _1858 = in.m_67.z;
    float _1860 = in.m_67.w;
    bool _1862 = _1802 > 0.5;
    float _1864 = _1802;
    bool _1866 = _1862;
    if (!_1786)
    {
        _1864 = _1778;
    }
    float _1868 = _1864;
    float _1870 = _1868;
    if (_1786)
    {
        float _1872 = _1822 ? as_type<float>(_1830) : _1778;
        _1870 = _1872;
    }
    float _1874 = _1870;
    float _1876 = 1.0 / _1850;
    float _1878 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1880 = _1876 * _1878;
    float _1882 = -_1792;
    float _1884 = _1882 + 1.0;
    float _1886 = abs(_1880);
    float _1888 = log2(_1886);
    int _1890 = _1862 ? as_type<int>(_1884) : as_type<int>(_1792);
    if (_1800)
    {
        bool _1892 = _585 > 0.5;
        _1866 = _1892;
    }
    bool _1894 = _1866;
    float _1896 = _1834 ? as_type<float>(_1890) : _1792;
    if (_1810)
    {
        float _1898 = _1812 ? _1884 : _1792;
        _1816 = _1898;
    }
    float _1900 = _1816;
    float _1902 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    if (_1800)
    {
        float _1904 = _1894 ? as_type<float>(_1840) : _1778;
        _1824 = _1904;
    }
    float _1906 = _1824;
    float _1908 = _1896 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    bool _1910 = _1179 != 0.0;
    bool _1912 = isnan(_1179);
    bool _1914 = _1910 || _1912;
    bool _1916 = isnan(0.0);
    bool _1918 = _1914 || _1916;
    float _1920 = _1888 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    bool _1922 = _1105 == 0.0;
    bool _1924 = !_1918;
    bool _1926 = _1922 && _1924;
    bool _1928 = _1033 == 0.0;
    bool _1930 = _1928 && _1926;
    float _1932 = exp2(_1920);
    float _1934 = _1908 * _1902;
    float _1936 = _1203 * _1856;
    float _1938 = fma(_1213, _1854, _1936);
    float _1940 = fma(_1932, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _1942 = precise::clamp(_1940, 0.0, 1.0);
    float _1944 = _1199 * _1856;
    float _1946 = fma(_1942, -2.0, 3.0);
    float _1948 = -_1856;
    float _1950 = _1189 * _1948;
    float _1952 = fma(_1219, _1854, _1944);
    float _1954 = _1942 * _1942;
    float _1956 = fma(_1201, _1854, _1950);
    float _1958 = fma(_1217, _1858, _1952);
    float _1960 = _1954 * _1946;
    float _1962 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _1964 = in.m_69.x;
    float _1966 = in.m_69.y;
    float _1968 = in.m_69.z;
    float _1970 = fma(_1205, _1858, _1956);
    float _1972 = _1958 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _1974 = _1958 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _1976 = _1958 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _1978 = fma(_1970, (*spvDescriptorSet0.vp_c10)._m0[9].x, _1972);
    float _1980 = _1900 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1982 = fma(_1970, (*spvDescriptorSet0.vp_c10)._m0[8].x, _1974);
    float _1984 = _1906 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _1986 = fma(_1970, (*spvDescriptorSet0.vp_c10)._m0[10].x, _1976);
    float _1988 = fma(_1223, _1858, _1938);
    float _1990 = _1874 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1992 = _1980 * _1852;
    float _1994 = fma(_1988, (*spvDescriptorSet0.vp_c10)._m0[8].z, _1982);
    float _1996 = fma(_1988, (*spvDescriptorSet0.vp_c10)._m0[9].z, _1978);
    float _1998 = fma(_1988, (*spvDescriptorSet0.vp_c10)._m0[10].z, _1986);
    float _2000 = -_1960;
    float _2002 = _2000 + 1.0;
    float _2004 = _1990 * _1842;
    float _2006 = _1984 * _1962;
    float _2008 = fma(_2002, (*spvDescriptorSet0.vp_c15)._m0[654].w, _1960);
    out.m_71.x = _1994;
    out.m_71.y = _1996;
    out.m_71.z = _1998;
    float _2010 = _1938;
    float _2012 = _1960;
    float _2014 = _2002;
    if (_1930)
    {
        _2010 = _1964;
    }
    float _2016 = _2010;
    float _2018 = 0.0;
    float _2020 = _2016;
    if (_1930)
    {
        _2018 = _1966;
    }
    float _2022 = _2018;
    out.m_73.x = 1.0;
    out.m_73.y = 1.0;
    out.m_73.z = 1.0;
    float _2024 = _2022;
    if (_1930)
    {
        _2012 = _2016;
    }
    float _2026 = _2012;
    float _2028 = _2026;
    if (!_1930)
    {
        _2020 = _1964;
    }
    float _2030 = _2020;
    out.m_75.x = _2004;
    out.m_75.y = _1992;
    out.m_75.z = _2006;
    out.m_75.w = _1934;
    if (_1930)
    {
        _2014 = _2022;
    }
    float _2032 = _2014;
    float _2034 = _2032;
    if (!_1930)
    {
        _2024 = _1966;
    }
    float _2036 = _2024;
    float _2038 = _1858 * _2030;
    if (!_1930)
    {
        float _2040 = fma(_1105, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2030);
        _2028 = _2040;
    }
    float _2042 = _2028;
    bool _2044 = _1880 <= 8000.0;
    bool _2046 = isnan(_1880);
    bool _2048 = _2044 || _2046;
    bool _2050 = isnan(8000.0);
    bool _2052 = _2048 || _2050;
    float _2054 = float(_2052);
    float _2056 = _1856 * _1968;
    float _2058 = _1854 * _2036;
    float _2060 = -_2038;
    float _2062 = fma(_1854, _1968, _2060);
    if (!_1930)
    {
        float _2064 = fma(_1179, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2036);
        _2034 = _2064;
    }
    float _2066 = _2034;
    float _2068 = -_2056;
    float _2070 = fma(_1858, _2036, _2068);
    float _2072 = -_2058;
    float _2074 = fma(_1856, _2030, _2072);
    float _2076 = _2062 * _1860;
    float _2078 = _1199 * _2066;
    float _2080 = _2070 * _1860;
    if (_1930)
    {
        _943 = _1968;
    }
    float _2082 = _943;
    float _2084 = _1199 * _2076;
    float _2086 = _2074 * _1860;
    float _2088 = _2082;
    if (!_1930)
    {
        float _2090 = fma(_1033, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1968);
        _2088 = _2090;
    }
    float _2092 = _2088;
    float _2094 = _1651 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _2096 = -_2066;
    float _2098 = _1189 * _2096;
    float _2100 = fma(_1219, _2042, _2078);
    float _2102 = -_2076;
    float _2104 = _1189 * _2102;
    float _2106 = fma(_1219, _2080, _2084);
    float _2108 = fma(_1665, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2094);
    float _2110 = _1627 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _2112 = _1203 * _2066;
    float _2114 = _1203 * _2076;
    float _2116 = fma(_1201, _2080, _2104);
    float _2118 = fma(_1217, _2086, _2106);
    float _2120 = fma(_1621, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2108);
    float _2122 = fma(_1213, _2042, _2112);
    float _2124 = fma(_1213, _2080, _2114);
    float _2126 = fma(_1205, _2086, _2116);
    float _2128 = _2118 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _2130 = exp2(_2110);
    float _2132 = _2118 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _2134 = fma(_1201, _2042, _2098);
    float _2136 = fma(_1217, _2092, _2100);
    float _2138 = fma(_1683, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2120);
    float _2140 = fma(_1223, _2092, _2122);
    float _2142 = fma(_1223, _2086, _2124);
    float _2144 = fma(_2126, (*spvDescriptorSet0.vp_c10)._m0[8].x, _2128);
    float _2146 = fma(_2126, (*spvDescriptorSet0.vp_c10)._m0[9].x, _2132);
    float _2148 = in.m_77.x;
    float _2150 = fma(_1205, _2092, _2134);
    float _2152 = _2136 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _2154 = _2138 + _1693;
    float _2156 = _2136 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _2158 = fma(_2142, (*spvDescriptorSet0.vp_c10)._m0[8].z, _2144);
    float _2160 = _2136 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _2162 = fma(_2142, (*spvDescriptorSet0.vp_c10)._m0[9].z, _2146);
    float _2164 = fma(_2150, (*spvDescriptorSet0.vp_c10)._m0[8].x, _2152);
    float _2166 = _2154 * 0.5;
    float _2168 = fma(_2150, (*spvDescriptorSet0.vp_c10)._m0[9].x, _2156);
    float _2170 = fma(_2150, (*spvDescriptorSet0.vp_c10)._m0[10].x, _2160);
    float _2172 = _2054 * _2008;
    float _2174 = fma(_2140, (*spvDescriptorSet0.vp_c10)._m0[8].z, _2164);
    float _2176 = fma(_2140, (*spvDescriptorSet0.vp_c10)._m0[9].z, _2168);
    float _2178 = fma(_2140, (*spvDescriptorSet0.vp_c10)._m0[10].z, _2170);
    float _2180 = -_2130;
    float _2182 = _2180 + 1.0;
    float _2184 = _2172 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _2186 = _2118 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _2188 = _2182 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    out.m_79.x = _2174;
    out.m_79.y = _2176;
    out.m_79.z = _2178;
    float _2190 = fma(_2126, (*spvDescriptorSet0.vp_c10)._m0[10].x, _2186);
    bool _2192 = _1443 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _2194 = isnan(_1443);
    bool _2196 = _2192 || _2194;
    bool _2198 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _2200 = _2196 || _2198;
    out.gl_Position.x = _1707;
    out.gl_Position.y = _1709;
    out.gl_Position.z = _2138;
    out.gl_Position.w = _1693;
    float _2202 = fma(_2142, (*spvDescriptorSet0.vp_c10)._m0[10].z, _2190);
    out.m_81.z = _2166;
    out.m_81.w = _1693;
    out.m_83.x = _2158;
    out.m_83.y = _2162;
    out.m_83.z = _2202;
    float _2204 = _1707;
    float _2206 = _2202;
    float _2208 = _2162;
    float _2210 = _2158;
    if (!_2200)
    {
        _1818 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _2212 = _1818;
    float _2214 = _2212;
    float _2216 = _2212;
    if (!_2200)
    {
        _2204 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _2218 = _2204;
    float _2220 = _2218;
    float _2222 = _2218;
    if (!_2200)
    {
        _2206 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _2224 = _2206;
    float _2226 = _2224;
    float _2228 = _2224;
    if (!_2200)
    {
        _2208 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _2230 = _2208;
    float _2232 = _2230;
    float _2234 = _2230;
    if (!_2200)
    {
        _2210 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _2236 = _2210;
    float _2238 = -_1731;
    float _2240 = _2238 + 1.0;
    float _2242 = _2240 * _2184;
    float _2244 = precise::clamp(_2242, 0.0, 1.0);
    float _2246 = -_2244;
    float _2248 = fma(_2246, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _2250 = _2248 * _2148;
    float _2252 = _2188 * _1749;
    float _2254 = -_2188;
    float _2256 = _2254 + 1.0;
    float _2258 = _2250 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _2260 = _2250;
    float _2262 = _2236;
    float _2264 = _2236;
    if (!_2200)
    {
        _2260 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _2266 = _2260;
    float _2268 = _1764 * _2252;
    float _2270 = _1764 * _2256;
    out.m_85.x = _2258;
    float _2272 = _1774 * _2252;
    float _2274 = fma(_1770, _2268, _1758);
    float _2276 = fma(_1772, _2268, _1760);
    float _2278 = fma(_1764, _2272, _1762);
    out.m_87.x = _2274;
    out.m_87.y = _2276;
    out.m_87.z = _2278;
    out.m_87.w = _2270;
    bool _2280 = !_2200;
    float _2282 = _2266;
    float _2284 = _2266;
    if (!_2280)
    {
        bool _2286 = _1443 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _2288 = isnan(_1443);
        bool _2290 = _2286 || _2288;
        bool _2292 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _2294 = _2290 || _2292;
        if (!_2294)
        {
            float _2296 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2298 = _1443 + _2296;
            float _2300 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2302 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _2300;
            float _2304 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _2306 = _2304 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _2308 = 1.0 / _2302;
            float _2310 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _2312 = _2310 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _2314 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _2316 = _2314 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _2318 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _2320 = _2318 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _2322 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _2324 = _2322 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _2326 = _2298 * _2308;
            float _2328 = precise::clamp(_2326, 0.0, 1.0);
            float _2330 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _2332 = _2330 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _2334 = fma(_2328, _2306, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _2336 = fma(_2328, _2332, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _2338 = fma(_2328, _2312, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _2340 = fma(_2328, _2316, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _2342 = fma(_2328, _2320, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _2344 = fma(_2328, _2324, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _2222 = _2338;
            _2234 = _2342;
            _2216 = _2334;
            _2228 = _2340;
            _2284 = _2336;
            _2264 = _2344;
            _2346 = true;
        }
        else
        {
            bool _2348 = _1443 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _2350 = isnan(_1443);
            bool _2352 = _2348 || _2350;
            bool _2354 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _2356 = _2352 || _2354;
            if (!_2356)
            {
                _2214 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _2358 = _2214;
            _2216 = _2358;
            if (!_2356)
            {
                _2220 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _2360 = _2220;
            _2222 = _2360;
            if (!_2356)
            {
                _2282 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _2362 = _2282;
            _2284 = _2362;
            if (!_2356)
            {
                _2226 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _2364 = _2226;
            _2228 = _2364;
            if (!_2356)
            {
                _2232 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _2366 = _2232;
            _2234 = _2366;
            if (!_2356)
            {
                _2262 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _2368 = _2262;
            bool _2370 = !_2356;
            _2264 = _2368;
            if (!_2370)
            {
                bool _2372 = _1443 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _2374 = isnan(_1443);
                bool _2376 = _2372 || _2374;
                bool _2378 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _2380 = _2376 || _2378;
                if (!_2380)
                {
                    float _2382 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2384 = _1443 + _2382;
                    float _2386 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2388 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _2386;
                    float _2390 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _2392 = _2390 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _2394 = 1.0 / _2388;
                    float _2396 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _2398 = _2396 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _2400 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _2402 = _2400 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _2404 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _2406 = _2404 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _2408 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _2410 = _2408 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _2412 = _2384 * _2394;
                    float _2414 = precise::clamp(_2412, 0.0, 1.0);
                    float _2416 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _2418 = _2416 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _2420 = fma(_2414, _2392, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _2422 = fma(_2414, _2418, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _2424 = fma(_2414, _2398, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _2426 = fma(_2414, _2402, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _2428 = fma(_2414, _2406, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _2430 = fma(_2414, _2410, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _2222 = _2424;
                    _2234 = _2428;
                    _2216 = _2420;
                    _2228 = _2426;
                    _2284 = _2422;
                    _2264 = _2430;
                    _2346 = true;
                }
                else
                {
                    _2222 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _2234 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _2216 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _2228 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _2284 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _2264 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _2346 = false;
    float _2432 = _2222;
    float _2434 = _2234;
    float _2436 = _2216;
    float _2438 = _2228;
    float _2440 = _2284;
    float _2442 = _2264;
    float _2444 = fma(_2176, -0.5, 0.5);
    float _2446 = precise::clamp(_2444, 0.0, 1.0);
    float _2448 = -_2432;
    float _2450 = _2448 + _2434;
    float _2452 = -_2436;
    float _2454 = _2452 + _2438;
    float _2456 = -_2440;
    float _2458 = _2456 + _2442;
    bool _2460 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2462 = fma(_2446, _2450, _2432);
    float _2464 = fma(_2446, _2454, _2436);
    float _2466 = fma(_2446, _2458, _2440);
    float _2468 = _2462 * 0.586610972881317138671875;
    out.m_89.x = 0.0;
    float _2470 = fma(_2464, 0.298911988735198974609375, _2468);
    float _2472 = fma(_2466, 0.114477999508380889892578125, _2470);
    float _2474 = -_2472;
    float _2476 = _2464 + _2474;
    float _2478 = -_2472;
    float _2480 = _2462 + _2478;
    float _2482 = -_2472;
    float _2484 = _2466 + _2482;
    float _2486 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2488 = fma(_2476, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2472);
    float _2490 = fma(_2480, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2472);
    float _2492 = fma(_2484, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2472);
    out.m_49.x = _2486;
    out.m_91.x = _2488;
    out.m_91.y = _2490;
    out.m_91.z = _2492;
    if (!_2460)
    {
        return out;
    }
    float _2494 = -_1413;
    float _2496 = _2494 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
    float _2498 = -_1415;
    float _2500 = _2498 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
    float _2502 = -_1417;
    float _2504 = _2502 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
    float _2506 = _2496 * _2496;
    float _2508 = fma(_2500, _2500, _2506);
    float _2510 = fma(_2504, _2504, _2508);
    float _2512 = sqrt(_2510);
    float _2514 = rsqrt(_2510);
    float _2516 = -_2512;
    float _2518 = _2516 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2520 = _2518 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
    float _2522 = precise::clamp(_2520, 0.0, 1.0);
    float _2524 = _2500 * _2514;
    float _2526 = _2496 * _2514;
    float _2528 = abs(_2522);
    float _2530 = log2(_2528);
    float _2532 = _2504 * _2514;
    float _2534 = _2524 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
    float _2536 = _2176 * _2526;
    float _2538 = -_2526;
    float _2540 = -_2534;
    float _2542 = fma(_2538, (*spvDescriptorSet0.vp_c15)._m0[656].y, _2540);
    float _2544 = fma(_2174, _2524, _2536);
    float _2546 = -_2532;
    float _2548 = fma(_2546, (*spvDescriptorSet0.vp_c15)._m0[656].z, _2542);
    float _2550 = fma(_2178, _2532, _2544);
    float _2552 = precise::clamp(_2550, 0.0, 1.0);
    float _2554 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
    float _2556 = _2548 + _2554;
    float _2558 = _2530 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
    float _2560 = _2556 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
    float _2562 = precise::clamp(_2560, 0.0, 1.0);
    float _2564 = exp2(_2558);
    float _2566 = _2564 * _2562;
    float _2568 = _2552 * _2566;
    float _2570 = _2568 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
    float _2572 = _2568 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
    float _2574 = _2568 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
    out.m_89.x = _2570;
    out.m_89.y = _2572;
    out.m_89.z = _2574;
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
    out.m_91 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_73 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_75 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_81 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_83 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_79 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_71 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_89 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_85 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_87 = float4(0.0, 0.0, 0.0, 1.0);
    bool _2346 = false;
    bool _531 = false;
    bool _188 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _105 = in.m_46.w;
    float _107 = trunc(_105);
    int _110 = int(_107);
    bool _114 = _110 >= 1;
    float _116 = 0.0;
    if (!_114)
    {
        _116 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _118 = _116;
    float _120 = _118;
    if (!_114)
    {
        out.m_49.x = 0.0;
    }
    int _122 = 0;
    if (!_114)
    {
        float _124 = _118 * 5.0;
        _122 = as_type<int>(_124);
    }
    int _126 = _122;
    int _128 = _126;
    if (!_114)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2631 = as_type<float>(_126);
        out.gl_Position.z = _2631;
    }
    if (!_114)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_57.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_57.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_57.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_57.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_55.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_55.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_55.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_55.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_49.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_49.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_49.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_49.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_91.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_91.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_91.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_91.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _130 = in.m_51.w;
    bool _132 = _130 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _134 = isnan(_130);
    bool _136 = _132 || _134;
    bool _138 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _140 = _136 || _138;
    float _142 = -_130;
    float _144 = _142 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _146 = 0.0;
    float _148 = _144;
    if (_140)
    {
        float _150 = float(_110);
        _146 = _150;
    }
    float _152 = _146;
    bool _154 = _144 >= _152;
    bool _156 = !_140;
    bool _158 = _154 || _156;
    if (_158)
    {
        _120 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _160 = _120;
    if (_158)
    {
        out.m_49.x = 0.0;
    }
    if (_158)
    {
        float _162 = _160 * 5.0;
        _128 = as_type<int>(_162);
    }
    int _164 = _128;
    if (_158)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2700 = as_type<float>(_164);
        out.gl_Position.z = _2700;
    }
    if (_158)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_57.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_57.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_57.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_57.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_55.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_55.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_55.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_55.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_49.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_49.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_49.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_49.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_91.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_91.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_91.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_91.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    bool _166 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    bool _168 = !_166;
    float _186;
    if (!_168)
    {
        float _170 = in.m_53.x;
        float _172 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _174 = _170 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _176 = fma(_174, (*spvDescriptorSet0.vp_c9)._m0[12].x, _144);
        float _178 = _176 * _172;
        float _180 = floor(_178);
        float _182 = -_180;
        float _184 = _178 + _182;
        _186 = _184;
        _188 = true;
    }
    else
    {
        float _190 = float(_110);
        float _192 = 1.0 / _190;
        float _194 = _144 * _192;
        _186 = _194;
    }
    _188 = false;
    float _196 = _186;
    float _198 = in.m_53.x;
    float _200 = float(as_type<int>((*spvDescriptorSet0.vp_c9)._m0[8].x));
    float _202 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _204 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _202;
    float _206 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _208 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _206;
    float _210 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _212 = _210 + (*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _214 = 1.0 / _204;
    float _216 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _218 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _220 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _222 = _216 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _224 = 1.0 / _212;
    float _226 = (*spvDescriptorSet0.vp_c9)._m0[131].x * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _228 = _218 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _230 = _220 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _232 = _200 * _198;
    float _234 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _236 = _234 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _238 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _240 = _196 + _238;
    float _242 = 1.0 / _208;
    out.m_55.x = _222;
    out.m_55.y = _228;
    out.m_55.z = _230;
    out.m_55.w = _226;
    float _244 = _240 * _214;
    float _246 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _248 = _196 + _246;
    bool _250 = _196 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _252 = isnan(_196);
    bool _254 = _250 || _252;
    bool _256 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _258 = _254 || _256;
    float _260 = float(_258);
    float _262 = trunc(_232);
    int _264 = int(_262);
    float _266 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _268 = _196 + _266;
    bool _270 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[14].x;
    float _272 = _268 * _224;
    bool _274 = _196 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _276 = isnan(_196);
    bool _278 = _274 || _276;
    bool _280 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _282 = _278 || _280;
    float _284 = float(_282);
    float _286 = 1.0 / _236;
    bool _288 = _196 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _290 = isnan(_196);
    bool _292 = _288 || _290;
    bool _294 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _296 = _292 || _294;
    float _298 = float(_296);
    float _300 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _302 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _300;
    float _304 = -_284;
    float _306 = _304 + 1.0;
    float _308 = fma(_302, _244, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    int _310 = _264 << 4;
    int _312 = _310 + 1712;
    float _314 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _316 = _196 + _314;
    float _318 = _260 * _306;
    float _320 = -_260;
    float _322 = _320 + 1.0;
    uint _325 = uint(int(uint(_312) >> uint(2)));
    uint _327 = uint(int(uint(int(_325)) >> uint(2)));
    int _329 = int(_325) & 3;
    float _331 = (*spvDescriptorSet0.vp_c9)._m0[int(_327)][_329];
    int _333 = int(_325) + 1;
    uint _335 = uint(int(uint(_333) >> uint(2)));
    int _337 = _333 & 3;
    float _339 = (*spvDescriptorSet0.vp_c9)._m0[int(_335)][_337];
    float _341 = _316 * _242;
    float _343 = -_298;
    float _345 = _343 + 1.0;
    float _347 = _298 * _322;
    float _349 = _248 * _286;
    bool _351 = _196 >= (*spvDescriptorSet0.vp_c9)._m0[147].w;
    bool _353 = isnan(_196);
    bool _355 = _351 || _353;
    bool _357 = isnan((*spvDescriptorSet0.vp_c9)._m0[147].w);
    bool _359 = _355 || _357;
    float _361 = float(_359);
    float _363 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _365 = _363 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    int _367 = _312 + 8;
    uint _369 = uint(int(uint(_367) >> uint(2)));
    uint _371 = uint(int(uint(int(_369)) >> uint(2)));
    int _373 = int(_369) & 3;
    float _375 = (*spvDescriptorSet0.vp_c9)._m0[int(_371)][_373];
    float _377 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _379 = _377 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _381 = -_361;
    float _383 = _381 + 1.0;
    float _385 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _387 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _385;
    float _389 = fma(_379, _349, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    float _391 = _284 * _383;
    float _393 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _395 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _393;
    bool _397 = _196 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _399 = isnan(_196);
    bool _401 = _397 || _399;
    bool _403 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _405 = _401 || _403;
    float _407 = float(_405);
    float _409 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _411 = _409 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _413 = fma(_387, _244, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _415 = fma(_395, _244, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _417 = _407 * _345;
    float _419 = fma(_365, _349, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _421 = fma(_411, _349, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _423 = _415 * _417;
    float _425 = -_407;
    float _427 = _425 + 1.0;
    float _429 = -(*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _431 = (*spvDescriptorSet0.vp_c9)._m0[146].z + _429;
    float _433 = _413 * _417;
    float _435 = _308 * _417;
    float _437 = fma(_431, _341, (*spvDescriptorSet0.vp_c9)._m0[145].z);
    float _439 = fma(_427, (*spvDescriptorSet0.vp_c9)._m0[143].y, _433);
    float _441 = fma(_427, (*spvDescriptorSet0.vp_c9)._m0[143].z, _435);
    float _443 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _445 = fma(_421, _347, _439);
    float _447 = -(*spvDescriptorSet0.vp_c9)._m0[146].x;
    float _449 = _447 + (*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _451 = _331 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _453 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _455 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _453;
    float _457 = _339 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _459 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _461 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _459;
    float _463 = _451 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _465 = fma(_455, _341, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _467 = fma(_427, (*spvDescriptorSet0.vp_c9)._m0[143].x, _423);
    float _469 = fma(_461, _341, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _471 = -(*spvDescriptorSet0.vp_c9)._m0[146].z;
    float _473 = _471 + (*spvDescriptorSet0.vp_c9)._m0[147].z;
    float _475 = _375 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _477 = fma(_419, _347, _467);
    float _479 = -(*spvDescriptorSet0.vp_c9)._m0[146].y;
    float _481 = _479 + (*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _483 = fma(_389, _347, _441);
    float _485 = fma(_469, _318, _445);
    float _487 = fma(_465, _318, _477);
    float _489 = fma(_449, _272, (*spvDescriptorSet0.vp_c9)._m0[146].x);
    float _491 = fma(_481, _272, (*spvDescriptorSet0.vp_c9)._m0[146].y);
    float _493 = fma(_473, _272, (*spvDescriptorSet0.vp_c9)._m0[146].z);
    float _495 = fma(_437, _318, _483);
    float _497 = _457 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _499 = _475 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _501 = fma(_489, _391, _487);
    float _503 = fma(_491, _391, _485);
    float _505 = fma(_493, _391, _495);
    out.m_57.x = _463;
    out.m_57.y = _497;
    out.m_57.z = _499;
    out.m_57.w = _443;
    float _507 = fma(_361, (*spvDescriptorSet0.vp_c9)._m0[147].y, _503);
    float _509 = fma(_361, (*spvDescriptorSet0.vp_c9)._m0[147].z, _505);
    float _511 = fma(_361, (*spvDescriptorSet0.vp_c9)._m0[147].x, _501);
    bool _513 = !_270;
    float _529;
    if (!_513)
    {
        float _515 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[14].x;
        float _517 = _198 * (*spvDescriptorSet0.vp_c9)._m0[15].x;
        float _519 = fma(_517, (*spvDescriptorSet0.vp_c9)._m0[14].x, _144);
        float _521 = _519 * _515;
        float _523 = floor(_521);
        float _525 = -_523;
        float _527 = _521 + _525;
        _529 = _527;
        _531 = true;
    }
    else
    {
        float _533 = float(_110);
        float _535 = 1.0 / _533;
        float _537 = _144 * _535;
        _529 = _537;
    }
    _531 = false;
    float _539 = _529;
    float _541 = _198 * 2.0;
    float _543 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _545 = log2(_543);
    float _547 = in.m_53.y;
    float _549 = -(*spvDescriptorSet0.vp_c9)._m0[159].w;
    float _551 = _549 + (*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _553 = -(*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _555 = _553 + (*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _557 = floor(_541);
    float _559 = -(*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _561 = _559 + (*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _563 = -(*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _565 = _539 + _563;
    int _567 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _569 = _567 != 0;
    int _571 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _573 = _571 != 0;
    int _575 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _577 = _575 != 0;
    float _579 = -(*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _581 = _579 + (*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _583 = 1.0 / _551;
    float _585 = in.m_53.z;
    float _587 = _545 * _144;
    float _589 = -(*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _591 = _589 + (*spvDescriptorSet0.vp_c9)._m0[164].w;
    bool _593 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _595 = isnan(0.0);
    bool _597 = _593 || _595;
    bool _599 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _601 = _597 || _599;
    bool _603 = _539 >= (*spvDescriptorSet0.vp_c9)._m0[159].w;
    bool _605 = isnan(_539);
    bool _607 = _603 || _605;
    bool _609 = isnan((*spvDescriptorSet0.vp_c9)._m0[159].w);
    bool _611 = _607 || _609;
    float _613 = float(_611);
    float _615 = 1.0 / _555;
    float _617 = _547 * 2.0;
    bool _619 = _557 > 0.0;
    bool _621 = _557 >= 0.0;
    bool _623 = isnan(_557);
    bool _625 = _621 || _623;
    bool _627 = isnan(0.0);
    bool _629 = _625 || _627;
    bool _631 = !_573;
    int _633 = _631 ? 0 : 1;
    float _635 = 1.0 / _561;
    float _637 = -(*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _639 = _637 + (*spvDescriptorSet0.vp_c9)._m0[165].w;
    int _641 = _629 ? 0 : 1;
    float _643 = exp2(_587);
    float _645 = -(*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _647 = _645 + (*spvDescriptorSet0.vp_c9)._m0[166].w;
    float _649 = _585 * 2.0;
    float _651 = -(*spvDescriptorSet0.vp_c9)._m0[159].x;
    float _653 = (*spvDescriptorSet0.vp_c9)._m0[160].x + _651;
    float _655 = _653 * _583;
    float _657 = 1.0 / _647;
    float _659 = -(*spvDescriptorSet0.vp_c9)._m0[160].x;
    float _661 = _659 + (*spvDescriptorSet0.vp_c9)._m0[161].x;
    float _663 = _661 * _615;
    float _665 = -(*spvDescriptorSet0.vp_c9)._m0[165].x;
    float _667 = (*spvDescriptorSet0.vp_c9)._m0[166].x + _665;
    float _669 = 1.0 / _581;
    float _671 = -_643;
    float _673 = _671 + 1.0;
    float _675 = 1.0 / _639;
    float _677 = _667 * _657;
    float _679 = floor(_649);
    float _681 = -(*spvDescriptorSet0.vp_c9)._m0[161].x;
    float _683 = (*spvDescriptorSet0.vp_c9)._m0[162].x + _681;
    float _685 = -(*spvDescriptorSet0.vp_c9)._m0[162].x;
    float _687 = _685 + (*spvDescriptorSet0.vp_c9)._m0[163].x;
    float _689 = _683 * _635;
    float _691 = -(*spvDescriptorSet0.vp_c9)._m0[163].x;
    float _693 = (*spvDescriptorSet0.vp_c9)._m0[164].x + _691;
    float _695 = -(*spvDescriptorSet0.vp_c9)._m0[164].x;
    float _697 = _695 + (*spvDescriptorSet0.vp_c9)._m0[165].x;
    float _699 = 1.0 / _591;
    float _701 = _601 ? _673 : 0.0;
    float _703 = _198 + _547;
    float _705 = _697 * _675;
    float _707 = _687 * _669;
    bool _709 = _539 >= (*spvDescriptorSet0.vp_c9)._m0[164].w;
    bool _711 = isnan(_539);
    bool _713 = _709 || _711;
    bool _715 = isnan((*spvDescriptorSet0.vp_c9)._m0[164].w);
    bool _717 = _713 || _715;
    float _719 = float(_717);
    float _721 = _703 + (-1.0);
    float _723 = fma(_689, _565, (*spvDescriptorSet0.vp_c9)._m0[161].x);
    float _725 = floor(_617);
    float _727 = _547 + _585;
    bool _729 = _679 > 0.0;
    bool _731 = _679 >= 0.0;
    bool _733 = isnan(_679);
    bool _735 = _731 || _733;
    bool _737 = isnan(0.0);
    bool _739 = _735 || _737;
    float _741 = _727 + (-1.0);
    bool _743 = _539 >= (*spvDescriptorSet0.vp_c9)._m0[165].w;
    bool _745 = isnan(_539);
    bool _747 = _743 || _745;
    bool _749 = isnan((*spvDescriptorSet0.vp_c9)._m0[165].w);
    bool _751 = _747 || _749;
    float _753 = float(_751);
    float _755 = _693 * _699;
    float _757 = fma(_741, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    bool _759 = _539 >= (*spvDescriptorSet0.vp_c9)._m0[166].w;
    bool _761 = isnan(_539);
    bool _763 = _759 || _761;
    bool _765 = isnan((*spvDescriptorSet0.vp_c9)._m0[166].w);
    bool _767 = _763 || _765;
    float _769 = float(_767);
    float _771 = -_753;
    float _773 = _771 + 1.0;
    float _775 = -(*spvDescriptorSet0.vp_c9)._m0[159].w;
    float _777 = _539 + _775;
    int _779 = _739 ? 0 : 1;
    float _781 = -_769;
    float _783 = _781 + 1.0;
    bool _785 = _725 > 0.0;
    float _787 = fma(_721, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    bool _789 = _539 >= (*spvDescriptorSet0.vp_c9)._m0[163].w;
    bool _791 = isnan(_539);
    bool _793 = _789 || _791;
    bool _795 = isnan((*spvDescriptorSet0.vp_c9)._m0[163].w);
    bool _797 = _793 || _795;
    float _799 = float(_797);
    float _801 = _753 * _783;
    float _803 = _719 * _773;
    float _805 = -_719;
    float _807 = _805 + 1.0;
    bool _809 = _725 >= 0.0;
    bool _811 = isnan(_725);
    bool _813 = _809 || _811;
    bool _815 = isnan(0.0);
    bool _817 = _813 || _815;
    float _819 = fma(_655, _777, (*spvDescriptorSet0.vp_c9)._m0[159].x);
    bool _821 = _539 >= (*spvDescriptorSet0.vp_c9)._m0[162].w;
    bool _823 = isnan(_539);
    bool _825 = _821 || _823;
    bool _827 = isnan((*spvDescriptorSet0.vp_c9)._m0[162].w);
    bool _829 = _825 || _827;
    float _831 = float(_829);
    float _833 = _799 * _807;
    float _835 = -_799;
    float _837 = _835 + 1.0;
    bool _839 = _539 >= (*spvDescriptorSet0.vp_c9)._m0[161].w;
    bool _841 = isnan(_539);
    bool _843 = _839 || _841;
    bool _845 = isnan((*spvDescriptorSet0.vp_c9)._m0[161].w);
    bool _847 = _843 || _845;
    float _849 = float(_847);
    float _851 = -(*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _853 = _539 + _851;
    float _855 = -_831;
    float _857 = _855 + 1.0;
    bool _859 = _539 >= (*spvDescriptorSet0.vp_c9)._m0[160].w;
    bool _861 = isnan(_539);
    bool _863 = _859 || _861;
    bool _865 = isnan((*spvDescriptorSet0.vp_c9)._m0[160].w);
    bool _867 = _863 || _865;
    float _869 = float(_867);
    float _871 = _831 * _837;
    float _873 = fma(_663, _853, (*spvDescriptorSet0.vp_c9)._m0[160].x);
    float _875 = _849 * _857;
    float _877 = -_849;
    float _879 = _877 + 1.0;
    float _881 = -(*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _883 = _539 + _881;
    float _885 = -_869;
    float _887 = _885 + 1.0;
    float _889 = _869 * _879;
    float _891 = fma(_707, _883, (*spvDescriptorSet0.vp_c9)._m0[162].x);
    float _893 = -(*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _895 = _539 + _893;
    float _897 = _613 * _887;
    float _899 = -(*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _901 = _539 + _899;
    float _903 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _905 = 1.0 + _903;
    float _907 = fma(_755, _895, (*spvDescriptorSet0.vp_c9)._m0[163].x);
    float _909 = _819 * _897;
    float _911 = fma(_705, _901, (*spvDescriptorSet0.vp_c9)._m0[164].x);
    float _913 = -(*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _915 = _539 + _913;
    float _917 = in.m_59.x;
    float _919 = in.m_59.y;
    float _921 = in.m_59.z;
    int _923 = abs(_633);
    float _925 = 1.0 / _905;
    int _927 = ~_641;
    int _929 = _927 + 1;
    int _931 = _929 + 1;
    float _933 = fma(_677, _915, (*spvDescriptorSet0.vp_c9)._m0[165].x);
    float _935 = -_613;
    float _937 = _935 + 1.0;
    int _939 = _931;
    int _941 = as_type<int>(_547);
    float _943 = 1.0;
    if (!_619)
    {
        int _945 = ~_641;
        int _947 = _945 + 1;
        _939 = _947;
    }
    int _949 = _939;
    bool _951 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _953 = isnan(1.0);
    bool _955 = _951 || _953;
    bool _957 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _959 = _955 || _957;
    float _961 = fma(_937, (*spvDescriptorSet0.vp_c9)._m0[159].x, _909);
    float _963 = float(_923);
    float _965 = float(_949);
    float _967 = fma(_873, _889, _961);
    bool _969 = !_569;
    int _971 = _969 ? 0 : 1;
    int _973 = ~_779;
    int _975 = _973 + 1;
    int _977 = _975 + 1;
    float _979 = _963 * _965;
    int _981 = _977;
    float _983 = _965;
    bool _985 = _959;
    if (!_729)
    {
        int _987 = ~_779;
        int _989 = _987 + 1;
        _981 = _989;
    }
    int _991 = _981;
    float _993 = fma(_723, _875, _967);
    int _995 = _817 ? 0 : 1;
    float _997 = _979 * (-2.0);
    if (_959)
    {
        float _999 = _701 * _925;
        _148 = _999;
    }
    float _1001 = _148;
    int _1003 = abs(_971);
    float _1005 = _547 + (-0.5);
    float _1007 = fma(_997, _919, _919);
    float _1009 = float(_991);
    float _1011 = fma(_757, _997, _757);
    float _1013 = float(_1003);
    float _1015 = fma(_1005, (*spvDescriptorSet0.vp_c9)._m0[196].y, _1007);
    float _1017 = fma(_891, _871, _993);
    bool _1019 = !_577;
    int _1021 = _1019 ? 0 : 1;
    float _1023 = _1013 * _1009;
    float _1025 = fma(_1011, _1001, _1015);
    int _1027 = ~_995;
    int _1029 = _1027 + 1;
    int _1031 = _1029 + 1;
    float _1033 = in.m_61.z;
    int _1035 = _1031;
    if (!_785)
    {
        int _1037 = ~_995;
        int _1039 = _1037 + 1;
        _1035 = _1039;
    }
    int _1041 = _1035;
    float _1043 = fma(_907, _833, _1017);
    int _1045 = abs(_1021);
    float _1047 = _1023 * (-2.0);
    float _1049 = _198 + _585;
    float _1051 = _1025 * 0.15915493667125701904296875;
    float _1053 = float(_1041);
    float _1055 = _198 + (-0.5);
    float _1057 = fma(_1047, _917, _917);
    float _1059 = _1049 + (-1.0);
    float _1061 = fma(_911, _803, _1043);
    float _1063 = float(_1045);
    float _1065 = fma(_1055, (*spvDescriptorSet0.vp_c9)._m0[196].x, _1057);
    float _1067 = fma(_1059, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _1069 = fma(_933, _801, _1061);
    float _1071 = fma(_787, _1047, _787);
    float _1073 = _1063 * _1053;
    float _1075 = _1051 * 6.283185482025146484375;
    float _1077 = sin(_1075);
    float _1079 = fma(_769, (*spvDescriptorSet0.vp_c9)._m0[166].x, _1069);
    float _1081 = (*spvDescriptorSet0.vp_c9)._m0[191].x * (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _1083 = fma(_1071, _1001, _1065);
    float _1085 = _198 + _1033;
    float _1087 = _1073 * (-2.0);
    float _1089 = in.m_63.x;
    float _1091 = in.m_63.y;
    float _1093 = in.m_63.z;
    float _1095 = _1083 * 0.15915493667125701904296875;
    float _1097 = fma(_1079, _1081, _1085);
    float _1099 = _1051 * 6.283185482025146484375;
    float _1101 = cos(_1099);
    float _1103 = fma(_1087, _921, _921);
    float _1105 = in.m_61.x;
    float _1107 = _1097 * (*spvDescriptorSet0.vp_c9)._m0[191].y;
    float _1109 = _585 + (-0.5);
    float _1111 = fma(_1067, _1087, _1067);
    float _1113 = _1107 * 0.15915493667125701904296875;
    float _1115 = fma(_1109, (*spvDescriptorSet0.vp_c9)._m0[196].z, _1103);
    float _1117 = in.m_61.y;
    float _1119 = _1095 * 6.283185482025146484375;
    float _1121 = sin(_1119);
    bool _1123 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _1125 = isnan(0.5);
    bool _1127 = _1123 || _1125;
    bool _1129 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1131 = _1127 || _1129;
    float _1133 = fma(_1111, _1001, _1115);
    float _1135 = in.m_46.x;
    float _1137 = in.m_46.y;
    float _1139 = in.m_46.z;
    float _1141 = _1133 * 0.15915493667125701904296875;
    float _1143 = _1113 * 6.283185482025146484375;
    float _1145 = sin(_1143);
    float _1147 = _511 * _1089;
    float _1149 = fma(_547, (*spvDescriptorSet0.vp_c9)._m0[191].z, 0.20000000298023223876953125);
    float _1151 = _509 * _1093;
    float _1153 = _507 * _1091;
    float _1155 = _1147 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1157 = _1095 * 6.283185482025146484375;
    float _1159 = cos(_1157);
    float _1161 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _1105);
    float _1163 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _1033);
    float _1165 = _1151 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _1167 = _1121 * _1077;
    float _1169 = _1161 * _1155;
    float _1171 = _1153 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1173 = _1163 * _1165;
    float _1175 = _1141 * 6.283185482025146484375;
    float _1177 = cos(_1175);
    float _1179 = fma(_1145, _1149, _1117);
    float _1181 = _1121 * _1101;
    float _1183 = _1137 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _1185 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _1179);
    float _1187 = _1141 * 6.283185482025146484375;
    float _1189 = sin(_1187);
    float _1191 = _1159 * _1077;
    float _1193 = _1159 * _1101;
    float _1195 = _1185 * _1171;
    float _1197 = fma(_1135, (*spvDescriptorSet0.vp_c10)._m0[6].x, _1183);
    float _1199 = _1159 * _1177;
    float _1201 = _1101 * _1177;
    float _1203 = _1121 * _1177;
    float _1205 = _1077 * _1177;
    float _1207 = fma(_1139, (*spvDescriptorSet0.vp_c10)._m0[6].z, _1197);
    float _1209 = _1203 * _1195;
    float _1211 = -_1191;
    float _1213 = fma(_1189, _1181, _1211);
    float _1215 = -_1181;
    float _1217 = fma(_1189, _1191, _1215);
    float _1219 = fma(_1189, _1193, _1167);
    float _1221 = _1199 * _1195;
    float _1223 = fma(_1189, _1167, _1193);
    float _1225 = -_1195;
    float _1227 = _1189 * _1225;
    float _1229 = fma(_1213, _1169, _1209);
    float _1231 = fma(_1219, _1169, _1221);
    float _1233 = _1137 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _1235 = fma(_1201, _1169, _1227);
    float _1237 = fma(_1223, _1173, _1229);
    float _1239 = fma(_1217, _1173, _1231);
    float _1241 = fma(_1135, (*spvDescriptorSet0.vp_c10)._m0[4].x, _1233);
    float _1243 = fma(_1205, _1173, _1235);
    float _1245 = _1207 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _1247 = _1239 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _1249 = _1239 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _1251 = fma(_1139, (*spvDescriptorSet0.vp_c10)._m0[4].z, _1241);
    float _1253 = _1137 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _1255 = fma(_1243, (*spvDescriptorSet0.vp_c10)._m0[10].x, _1247);
    float _1257 = fma(_1243, (*spvDescriptorSet0.vp_c10)._m0[8].x, _1249);
    float _1259 = _1251 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _1261 = fma(_1135, (*spvDescriptorSet0.vp_c10)._m0[5].x, _1253);
    float _1263 = fma(_1237, (*spvDescriptorSet0.vp_c10)._m0[10].z, _1255);
    float _1265 = fma(_1237, (*spvDescriptorSet0.vp_c10)._m0[8].z, _1257);
    float _1267 = _1239 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _1269 = fma(_1139, (*spvDescriptorSet0.vp_c10)._m0[5].z, _1261);
    float _1271 = _1245 + _1263;
    float _1273 = _1259 + _1265;
    float _1275 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1277 = _1271 + _1275;
    float _1279 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1281 = _1273 + _1279;
    float _1283 = _1277 * _1277;
    float _1285 = fma(_1281, _1281, _1283);
    float _1287 = fma(_1243, (*spvDescriptorSet0.vp_c10)._m0[9].x, _1267);
    float _1289 = _1269 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _1291 = sqrt(_1285);
    float _1293 = fma(_1237, (*spvDescriptorSet0.vp_c10)._m0[9].z, _1287);
    float _1295 = _1289 + _1293;
    bool _1297 = _1291 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1299 = _1273;
    float _1301 = _1271;
    float _1303 = _1291;
    float _1305 = _1243;
    if (!_1297)
    {
        _983 = _1295;
    }
    float _1307 = _983;
    bool _1309 = !_1297;
    float _1311 = _1307;
    if (!_1309)
    {
        float _1313 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1315 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1317 = _1291 + _1315;
        float _1319 = _1295 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1321 = rsqrt(_1285);
        float _1323 = _1317 * _1313;
        float _1325 = _1323 * 0.15915493667125701904296875;
        float _1327 = _1325 * 6.283185482025146484375;
        float _1329 = cos(_1327);
        float _1331 = _1325 * 6.283185482025146484375;
        float _1333 = sin(_1331);
        float _1335 = _1329 + (-1.0);
        float _1337 = _1335 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1339 = fma(_1333, _1319, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1341 = fma(_1295, _1329, _1337);
        float _1343 = _1321 * _1339;
        float _1345 = fma(_1281, _1343, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1347 = fma(_1277, _1343, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1299 = _1345;
        _1311 = _1341;
        _1301 = _1347;
        _1303 = _1317;
        _1305 = _1325;
    }
    float _1349 = _1299;
    float _1351 = _1311;
    float _1353 = _1301;
    float _1355 = _1303;
    float _1357 = _1305;
    float _1359 = _1351;
    float _1361 = _1349;
    float _1363 = _1353;
    float _1365 = _1357;
    float _1367 = _1355;
    if (!_1131)
    {
        float _1369 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _1371 = _1289 + _1369;
        float _1373 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _1375 = _1259 + _1373;
        float _1377 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1379 = -_1259;
        float _1381 = _1379 + _1349;
        float _1383 = _1371 * _1371;
        float _1385 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _1387 = _1245 + _1385;
        float _1389 = fma(_1375, _1375, _1383);
        float _1391 = fma(_1387, _1387, _1389);
        float _1393 = sqrt(_1391);
        float _1395 = precise::min(_1393, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1397 = _1395 * _1377;
        float _1399 = -_1289;
        float _1401 = _1399 + _1351;
        float _1403 = -_1245;
        float _1405 = _1403 + _1353;
        float _1407 = fma(_1381, _1397, _1259);
        float _1409 = fma(_1401, _1397, _1289);
        float _1411 = fma(_1405, _1397, _1245);
        _1359 = _1409;
        _1361 = _1407;
        _1363 = _1411;
        _1365 = _1401;
    }
    float _1413 = _1359;
    float _1415 = _1361;
    float _1417 = _1363;
    float _1419 = _1365;
    float _1421 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1423 = _1413 + _1421;
    float _1425 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1427 = _1415 + _1425;
    float _1429 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1431 = _1417 + _1429;
    float _1433 = _1413 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1435 = _1423 * _1423;
    float _1437 = fma(_1427, _1427, _1435);
    float _1439 = fma(_1431, _1431, _1437);
    float _1441 = rsqrt(_1439);
    float _1443 = sqrt(_1439);
    float _1445 = _1441 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1447 = _1427 * _1445;
    float _1449 = _1431 * _1445;
    float _1451 = _1447 * _1447;
    float _1453 = _1449 * _1449;
    float _1455 = _1451 + _1453;
    float _1457 = sqrt(_1455);
    bool _1459 = _1457 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1461 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1463 = _1457 + _1461;
    float _1465 = _1441;
    float _1467 = _1419;
    float _1469 = _1463;
    float _1471 = _1423;
    float _1473 = _1445;
    int _1475 = as_type<int>(_1433);
    if (_1459)
    {
        float _1477 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1465 = _1477;
    }
    float _1479 = _1465;
    if (_1459)
    {
        float _1481 = rsqrt(_1455);
        _1467 = _1481;
    }
    float _1483 = _1467;
    if (_1459)
    {
        float _1485 = _1463 * _1479;
        _1469 = _1485;
    }
    float _1487 = _1469;
    if (_1459)
    {
        float _1489 = _1487 * 0.15915493667125701904296875;
        _1367 = _1489;
    }
    float _1491 = _1367;
    float _1493 = _1479;
    float _1495 = _1491;
    if (_1459)
    {
        float _1497 = _1491 * 6.283185482025146484375;
        float _1499 = sin(_1497);
        _1493 = _1499;
    }
    float _1501 = _1493;
    float _1503 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1505 = precise::max(0.0, _1503);
    float _1507 = _1431;
    float _1509 = _1505;
    if (_1459)
    {
        float _1511 = _1491 * 6.283185482025146484375;
        float _1513 = cos(_1511);
        _1507 = _1513;
    }
    float _1515 = _1507;
    float _1517 = -_1445;
    float _1519 = -_1505;
    float _1521 = fma(_1423, _1517, _1519);
    float _1523 = _1521;
    if (_1459)
    {
        float _1525 = _1521 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1509 = _1525;
    }
    float _1527 = _1509;
    float _1529 = _1527;
    if (!_1459)
    {
        _1495 = _1451;
    }
    float _1531 = _1495;
    float _1533 = _1501;
    float _1535 = _1531;
    if (_1459)
    {
        float _1537 = fma(_1501, _1527, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1533 = _1537;
    }
    float _1539 = _1533;
    float _1541 = _1539;
    if (!_1459)
    {
        _1529 = _1453;
    }
    float _1543 = _1529;
    float _1545 = _1515;
    float _1547 = _1543;
    if (_1459)
    {
        float _1549 = _1515 + (-1.0);
        _1471 = _1549;
    }
    float _1551 = _1471;
    float _1553 = _1551;
    if (_1459)
    {
        float _1555 = _1483 * _1539;
        _1473 = _1555;
    }
    float _1557 = _1473;
    if (!_1459)
    {
        _1541 = _1447;
    }
    float _1559 = _1541;
    float _1561 = _1559;
    if (_1459)
    {
        float _1563 = _1551 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1553 = _1563;
    }
    float _1565 = _1553;
    if (_1459)
    {
        float _1567 = _1447 * _1557;
        _1561 = _1567;
    }
    float _1569 = _1561;
    float _1571 = _1413 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    if (_1459)
    {
        float _1573 = fma(_1521, _1515, _1565);
        _1523 = _1573;
    }
    float _1575 = _1523;
    if (!_1459)
    {
        _1545 = _1449;
    }
    float _1577 = _1545;
    float _1579 = _1577;
    if (_1459)
    {
        float _1581 = _1449 * _1557;
        _1579 = _1581;
    }
    float _1583 = _1579;
    if (_1459)
    {
        float _1585 = _1569 * _1569;
        _1535 = _1585;
    }
    float _1587 = _1535;
    float _1589 = fma(_1259, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    if (_1459)
    {
        float _1591 = _1583 * _1583;
        _1547 = _1591;
    }
    float _1593 = _1547;
    float _1595 = fma(_1575, _1575, _1587);
    float _1597 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _1599 = floor(_1589);
    float _1601 = _1595 + _1593;
    float _1603 = fma(_1415, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1571);
    float _1605 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1607 = fma(_1443, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1605);
    float _1609 = precise::clamp(_1607, 0.0, 1.0);
    float _1611 = _1413 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1613 = fma(_1417, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1603);
    float _1615 = -_1609;
    float _1617 = _1615 + 1.0;
    float _1619 = rsqrt(_1601);
    float _1621 = _1613 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1623 = _1621 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1625 = abs(_1617);
    float _1627 = log2(_1625);
    float _1629 = _1413 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1631 = -_1623;
    float _1633 = fma(_1631, _1597, 1.0);
    float _1635 = fma(_1415, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1611);
    float _1637 = fma(_1245, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _1639 = -_1599;
    float _1641 = _1589 + _1639;
    float _1643 = fma(_1417, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1635);
    float _1645 = _1619 * _1569;
    float _1647 = fma(_1415, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1629);
    float _1649 = _1619 * _1575;
    float _1651 = _1643 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1653 = _1645 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1655 = fma(_1417, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1647);
    float _1657 = _1619 * _1583;
    float _1659 = fma(_1415, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1433);
    float _1661 = -_1653;
    float _1663 = fma(_1649, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1661);
    float _1665 = _1655 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1667 = _1651 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1669 = floor(_1637);
    float _1671 = -_1657;
    float _1673 = fma(_1671, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1663);
    float _1675 = fma(_1417, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1659);
    float _1677 = fma(_1665, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1667);
    float _1679 = _1627 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1681 = fma(_1673, -0.5, 0.5);
    float _1683 = _1675 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1685 = fma(_1621, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1677);
    float _1687 = exp2(_1679);
    float _1689 = _1651 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1691 = _1651 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1693 = fma(_1683, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1685);
    float _1695 = fma(_1673, 0.5, 0.5);
    float _1697 = fma(_1665, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1689);
    float _1699 = fma(_1665, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1691);
    float _1701 = log2(_1633);
    float _1703 = fma(_1621, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1697);
    float _1705 = fma(_1621, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1699);
    float _1707 = fma(_1683, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1703);
    float _1709 = fma(_1683, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1705);
    float _1711 = 1.0 / _1693;
    float _1713 = -_1669;
    float _1715 = _1637 + _1713;
    float _1717 = fma(_1695, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1719 = _1649 + 1.0;
    float _1721 = fma(_1695, _1717, -0.212114393711090087890625);
    float _1723 = -_1649;
    float _1725 = fma(_1687, _1719, _1723);
    float _1727 = sqrt(_1681);
    float _1729 = _1701 * 0.693147182464599609375;
    float2 _5187 = float2(_1641, _1715);
    float _1731 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_5187, float2(0.0), isnan(_5187)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_5187, float2(0.0), isnan(_5187)), level(0.0)).x;
    float _1733 = fma(_1695, _1721, 1.570728778839111328125);
    float _1735 = fma(_1725, 0.5, 0.5);
    float _1737 = _1707 * _1711;
    float _1739 = _1709 * _1711;
    float _1741 = _1729 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1743 = fma(_1737, 0.5, 0.5);
    float _1745 = fma(_1739, -0.5, 0.5);
    float _1747 = _1727 * 0.636619746685028076171875;
    float3 _5221 = float3(_1743, _1745, _1741);
    float _1749 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_5221, float3(0.0), isnan(_5221)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_5221, float3(0.0), isnan(_5221)), level(0.0)).x;
    float _1751 = -_1733;
    float _1753 = fma(_1747, _1751, 1.0);
    float3 _5237 = float3(_1743, _1745, _1741);
    float4 _1756 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_5237, float3(0.0), isnan(_5237)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_5237, float3(0.0), isnan(_5237)), level(0.0)).xyzw;
    float _1758 = _1756.x;
    float _1760 = _1756.y;
    float _1762 = _1756.z;
    float _1764 = _1756.w;
    float2 _5253 = float2(_1753, _1735);
    float3 _1768 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_5253, float2(0.0), isnan(_5253)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_5253, float2(0.0), isnan(_5253)), level(0.0)).xyz;
    float _1770 = _1768.x;
    float _1772 = _1768.y;
    float _1774 = _1768.z;
    float _1776 = _1289 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1778 = in.m_65.x;
    float _1780 = fma(_1259, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1776);
    float _1782 = _1289 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    int _1784 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1786 = _1784 != 0;
    float _1788 = fma(_1245, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1780);
    float _1790 = fma(_1259, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1782);
    float _1792 = in.m_65.y;
    float _1794 = _1788 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1796 = fma(_1245, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1790);
    int _1798 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _1800 = _1798 != 0;
    float _1802 = in.m_53.w;
    float _1804 = 1.0 / _1794;
    float _1806 = _1796 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    int _1808 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1810 = _1808 != 0;
    bool _1812 = _547 > 0.5;
    float _1814 = _1806 + _1794;
    float _1816 = _1792;
    float _1818 = _1709;
    if (_1786)
    {
        bool _1820 = _198 > 0.5;
        _985 = _1820;
    }
    bool _1822 = _985;
    float _1824 = _1778;
    if (_1786)
    {
        float _1826 = -_1778;
        float _1828 = _1826 + 1.0;
        _941 = as_type<int>(_1828);
    }
    int _1830 = _941;
    int _1832 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _1834 = _1832 != 0;
    if (_1800)
    {
        float _1836 = -_1778;
        float _1838 = _1836 + 1.0;
        _1475 = as_type<int>(_1838);
    }
    int _1840 = _1475;
    float _1842 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _1844 = _1814 * _1804;
    float _1846 = _1844 * 0.5;
    float _1848 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1850 = fma(_1846, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1848);
    float _1852 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _1854 = in.m_67.x;
    float _1856 = in.m_67.y;
    float _1858 = in.m_67.z;
    float _1860 = in.m_67.w;
    bool _1862 = _1802 > 0.5;
    float _1864 = _1802;
    bool _1866 = _1862;
    if (!_1786)
    {
        _1864 = _1778;
    }
    float _1868 = _1864;
    float _1870 = _1868;
    if (_1786)
    {
        float _1872 = _1822 ? as_type<float>(_1830) : _1778;
        _1870 = _1872;
    }
    float _1874 = _1870;
    float _1876 = 1.0 / _1850;
    float _1878 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1880 = _1876 * _1878;
    float _1882 = -_1792;
    float _1884 = _1882 + 1.0;
    float _1886 = abs(_1880);
    float _1888 = log2(_1886);
    int _1890 = _1862 ? as_type<int>(_1884) : as_type<int>(_1792);
    if (_1800)
    {
        bool _1892 = _585 > 0.5;
        _1866 = _1892;
    }
    bool _1894 = _1866;
    float _1896 = _1834 ? as_type<float>(_1890) : _1792;
    if (_1810)
    {
        float _1898 = _1812 ? _1884 : _1792;
        _1816 = _1898;
    }
    float _1900 = _1816;
    float _1902 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    if (_1800)
    {
        float _1904 = _1894 ? as_type<float>(_1840) : _1778;
        _1824 = _1904;
    }
    float _1906 = _1824;
    float _1908 = _1896 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    bool _1910 = _1179 != 0.0;
    bool _1912 = isnan(_1179);
    bool _1914 = _1910 || _1912;
    bool _1916 = isnan(0.0);
    bool _1918 = _1914 || _1916;
    float _1920 = _1888 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    bool _1922 = _1105 == 0.0;
    bool _1924 = !_1918;
    bool _1926 = _1922 && _1924;
    bool _1928 = _1033 == 0.0;
    bool _1930 = _1928 && _1926;
    float _1932 = exp2(_1920);
    float _1934 = _1908 * _1902;
    float _1936 = _1203 * _1856;
    float _1938 = fma(_1213, _1854, _1936);
    float _1940 = fma(_1932, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _1942 = precise::clamp(_1940, 0.0, 1.0);
    float _1944 = _1199 * _1856;
    float _1946 = fma(_1942, -2.0, 3.0);
    float _1948 = -_1856;
    float _1950 = _1189 * _1948;
    float _1952 = fma(_1219, _1854, _1944);
    float _1954 = _1942 * _1942;
    float _1956 = fma(_1201, _1854, _1950);
    float _1958 = fma(_1217, _1858, _1952);
    float _1960 = _1954 * _1946;
    float _1962 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _1964 = in.m_69.x;
    float _1966 = in.m_69.y;
    float _1968 = in.m_69.z;
    float _1970 = fma(_1205, _1858, _1956);
    float _1972 = _1958 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _1974 = _1958 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _1976 = _1958 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _1978 = fma(_1970, (*spvDescriptorSet0.vp_c10)._m0[9].x, _1972);
    float _1980 = _1900 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1982 = fma(_1970, (*spvDescriptorSet0.vp_c10)._m0[8].x, _1974);
    float _1984 = _1906 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _1986 = fma(_1970, (*spvDescriptorSet0.vp_c10)._m0[10].x, _1976);
    float _1988 = fma(_1223, _1858, _1938);
    float _1990 = _1874 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1992 = _1980 * _1852;
    float _1994 = fma(_1988, (*spvDescriptorSet0.vp_c10)._m0[8].z, _1982);
    float _1996 = fma(_1988, (*spvDescriptorSet0.vp_c10)._m0[9].z, _1978);
    float _1998 = fma(_1988, (*spvDescriptorSet0.vp_c10)._m0[10].z, _1986);
    float _2000 = -_1960;
    float _2002 = _2000 + 1.0;
    float _2004 = _1990 * _1842;
    float _2006 = _1984 * _1962;
    float _2008 = fma(_2002, (*spvDescriptorSet0.vp_c15)._m0[654].w, _1960);
    out.m_71.x = _1994;
    out.m_71.y = _1996;
    out.m_71.z = _1998;
    float _2010 = _1938;
    float _2012 = _1960;
    float _2014 = _2002;
    if (_1930)
    {
        _2010 = _1964;
    }
    float _2016 = _2010;
    float _2018 = 0.0;
    float _2020 = _2016;
    if (_1930)
    {
        _2018 = _1966;
    }
    float _2022 = _2018;
    out.m_73.x = 1.0;
    out.m_73.y = 1.0;
    out.m_73.z = 1.0;
    float _2024 = _2022;
    if (_1930)
    {
        _2012 = _2016;
    }
    float _2026 = _2012;
    float _2028 = _2026;
    if (!_1930)
    {
        _2020 = _1964;
    }
    float _2030 = _2020;
    out.m_75.x = _2004;
    out.m_75.y = _1992;
    out.m_75.z = _2006;
    out.m_75.w = _1934;
    if (_1930)
    {
        _2014 = _2022;
    }
    float _2032 = _2014;
    float _2034 = _2032;
    if (!_1930)
    {
        _2024 = _1966;
    }
    float _2036 = _2024;
    float _2038 = _1858 * _2030;
    if (!_1930)
    {
        float _2040 = fma(_1105, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2030);
        _2028 = _2040;
    }
    float _2042 = _2028;
    bool _2044 = _1880 <= 8000.0;
    bool _2046 = isnan(_1880);
    bool _2048 = _2044 || _2046;
    bool _2050 = isnan(8000.0);
    bool _2052 = _2048 || _2050;
    float _2054 = float(_2052);
    float _2056 = _1856 * _1968;
    float _2058 = _1854 * _2036;
    float _2060 = -_2038;
    float _2062 = fma(_1854, _1968, _2060);
    if (!_1930)
    {
        float _2064 = fma(_1179, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2036);
        _2034 = _2064;
    }
    float _2066 = _2034;
    float _2068 = -_2056;
    float _2070 = fma(_1858, _2036, _2068);
    float _2072 = -_2058;
    float _2074 = fma(_1856, _2030, _2072);
    float _2076 = _2062 * _1860;
    float _2078 = _1199 * _2066;
    float _2080 = _2070 * _1860;
    if (_1930)
    {
        _943 = _1968;
    }
    float _2082 = _943;
    float _2084 = _1199 * _2076;
    float _2086 = _2074 * _1860;
    float _2088 = _2082;
    if (!_1930)
    {
        float _2090 = fma(_1033, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1968);
        _2088 = _2090;
    }
    float _2092 = _2088;
    float _2094 = _1651 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _2096 = -_2066;
    float _2098 = _1189 * _2096;
    float _2100 = fma(_1219, _2042, _2078);
    float _2102 = -_2076;
    float _2104 = _1189 * _2102;
    float _2106 = fma(_1219, _2080, _2084);
    float _2108 = fma(_1665, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2094);
    float _2110 = _1627 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _2112 = _1203 * _2066;
    float _2114 = _1203 * _2076;
    float _2116 = fma(_1201, _2080, _2104);
    float _2118 = fma(_1217, _2086, _2106);
    float _2120 = fma(_1621, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2108);
    float _2122 = fma(_1213, _2042, _2112);
    float _2124 = fma(_1213, _2080, _2114);
    float _2126 = fma(_1205, _2086, _2116);
    float _2128 = _2118 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _2130 = exp2(_2110);
    float _2132 = _2118 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _2134 = fma(_1201, _2042, _2098);
    float _2136 = fma(_1217, _2092, _2100);
    float _2138 = fma(_1683, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2120);
    float _2140 = fma(_1223, _2092, _2122);
    float _2142 = fma(_1223, _2086, _2124);
    float _2144 = fma(_2126, (*spvDescriptorSet0.vp_c10)._m0[8].x, _2128);
    float _2146 = fma(_2126, (*spvDescriptorSet0.vp_c10)._m0[9].x, _2132);
    float _2148 = in.m_77.x;
    float _2150 = fma(_1205, _2092, _2134);
    float _2152 = _2136 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _2154 = _2138 + _1693;
    float _2156 = _2136 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _2158 = fma(_2142, (*spvDescriptorSet0.vp_c10)._m0[8].z, _2144);
    float _2160 = _2136 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _2162 = fma(_2142, (*spvDescriptorSet0.vp_c10)._m0[9].z, _2146);
    float _2164 = fma(_2150, (*spvDescriptorSet0.vp_c10)._m0[8].x, _2152);
    float _2166 = _2154 * 0.5;
    float _2168 = fma(_2150, (*spvDescriptorSet0.vp_c10)._m0[9].x, _2156);
    float _2170 = fma(_2150, (*spvDescriptorSet0.vp_c10)._m0[10].x, _2160);
    float _2172 = _2054 * _2008;
    float _2174 = fma(_2140, (*spvDescriptorSet0.vp_c10)._m0[8].z, _2164);
    float _2176 = fma(_2140, (*spvDescriptorSet0.vp_c10)._m0[9].z, _2168);
    float _2178 = fma(_2140, (*spvDescriptorSet0.vp_c10)._m0[10].z, _2170);
    float _2180 = -_2130;
    float _2182 = _2180 + 1.0;
    float _2184 = _2172 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _2186 = _2118 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _2188 = _2182 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    out.m_79.x = _2174;
    out.m_79.y = _2176;
    out.m_79.z = _2178;
    float _2190 = fma(_2126, (*spvDescriptorSet0.vp_c10)._m0[10].x, _2186);
    bool _2192 = _1443 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _2194 = isnan(_1443);
    bool _2196 = _2192 || _2194;
    bool _2198 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _2200 = _2196 || _2198;
    out.gl_Position.x = _1707;
    out.gl_Position.y = _1709;
    out.gl_Position.z = _2138;
    out.gl_Position.w = _1693;
    float _2202 = fma(_2142, (*spvDescriptorSet0.vp_c10)._m0[10].z, _2190);
    out.m_81.z = _2166;
    out.m_81.w = _1693;
    out.m_83.x = _2158;
    out.m_83.y = _2162;
    out.m_83.z = _2202;
    float _2204 = _1707;
    float _2206 = _2202;
    float _2208 = _2162;
    float _2210 = _2158;
    if (!_2200)
    {
        _1818 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _2212 = _1818;
    float _2214 = _2212;
    float _2216 = _2212;
    if (!_2200)
    {
        _2204 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _2218 = _2204;
    float _2220 = _2218;
    float _2222 = _2218;
    if (!_2200)
    {
        _2206 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _2224 = _2206;
    float _2226 = _2224;
    float _2228 = _2224;
    if (!_2200)
    {
        _2208 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _2230 = _2208;
    float _2232 = _2230;
    float _2234 = _2230;
    if (!_2200)
    {
        _2210 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _2236 = _2210;
    float _2238 = -_1731;
    float _2240 = _2238 + 1.0;
    float _2242 = _2240 * _2184;
    float _2244 = precise::clamp(_2242, 0.0, 1.0);
    float _2246 = -_2244;
    float _2248 = fma(_2246, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _2250 = _2248 * _2148;
    float _2252 = _2188 * _1749;
    float _2254 = -_2188;
    float _2256 = _2254 + 1.0;
    float _2258 = _2250 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _2260 = _2250;
    float _2262 = _2236;
    float _2264 = _2236;
    if (!_2200)
    {
        _2260 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _2266 = _2260;
    float _2268 = _1764 * _2252;
    float _2270 = _1764 * _2256;
    out.m_85.x = _2258;
    float _2272 = _1774 * _2252;
    float _2274 = fma(_1770, _2268, _1758);
    float _2276 = fma(_1772, _2268, _1760);
    float _2278 = fma(_1764, _2272, _1762);
    out.m_87.x = _2274;
    out.m_87.y = _2276;
    out.m_87.z = _2278;
    out.m_87.w = _2270;
    bool _2280 = !_2200;
    float _2282 = _2266;
    float _2284 = _2266;
    if (!_2280)
    {
        bool _2286 = _1443 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _2288 = isnan(_1443);
        bool _2290 = _2286 || _2288;
        bool _2292 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _2294 = _2290 || _2292;
        if (!_2294)
        {
            float _2296 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2298 = _1443 + _2296;
            float _2300 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2302 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _2300;
            float _2304 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _2306 = _2304 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _2308 = 1.0 / _2302;
            float _2310 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _2312 = _2310 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _2314 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _2316 = _2314 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _2318 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _2320 = _2318 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _2322 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _2324 = _2322 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _2326 = _2298 * _2308;
            float _2328 = precise::clamp(_2326, 0.0, 1.0);
            float _2330 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _2332 = _2330 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _2334 = fma(_2328, _2306, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _2336 = fma(_2328, _2332, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _2338 = fma(_2328, _2312, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _2340 = fma(_2328, _2316, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _2342 = fma(_2328, _2320, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _2344 = fma(_2328, _2324, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _2222 = _2338;
            _2234 = _2342;
            _2216 = _2334;
            _2228 = _2340;
            _2284 = _2336;
            _2264 = _2344;
            _2346 = true;
        }
        else
        {
            bool _2348 = _1443 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _2350 = isnan(_1443);
            bool _2352 = _2348 || _2350;
            bool _2354 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _2356 = _2352 || _2354;
            if (!_2356)
            {
                _2214 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _2358 = _2214;
            _2216 = _2358;
            if (!_2356)
            {
                _2220 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _2360 = _2220;
            _2222 = _2360;
            if (!_2356)
            {
                _2282 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _2362 = _2282;
            _2284 = _2362;
            if (!_2356)
            {
                _2226 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _2364 = _2226;
            _2228 = _2364;
            if (!_2356)
            {
                _2232 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _2366 = _2232;
            _2234 = _2366;
            if (!_2356)
            {
                _2262 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _2368 = _2262;
            bool _2370 = !_2356;
            _2264 = _2368;
            if (!_2370)
            {
                bool _2372 = _1443 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _2374 = isnan(_1443);
                bool _2376 = _2372 || _2374;
                bool _2378 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _2380 = _2376 || _2378;
                if (!_2380)
                {
                    float _2382 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2384 = _1443 + _2382;
                    float _2386 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2388 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _2386;
                    float _2390 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _2392 = _2390 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _2394 = 1.0 / _2388;
                    float _2396 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _2398 = _2396 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _2400 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _2402 = _2400 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _2404 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _2406 = _2404 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _2408 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _2410 = _2408 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _2412 = _2384 * _2394;
                    float _2414 = precise::clamp(_2412, 0.0, 1.0);
                    float _2416 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _2418 = _2416 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _2420 = fma(_2414, _2392, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _2422 = fma(_2414, _2418, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _2424 = fma(_2414, _2398, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _2426 = fma(_2414, _2402, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _2428 = fma(_2414, _2406, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _2430 = fma(_2414, _2410, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _2222 = _2424;
                    _2234 = _2428;
                    _2216 = _2420;
                    _2228 = _2426;
                    _2284 = _2422;
                    _2264 = _2430;
                    _2346 = true;
                }
                else
                {
                    _2222 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _2234 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _2216 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _2228 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _2284 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _2264 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _2346 = false;
    float _2432 = _2222;
    float _2434 = _2234;
    float _2436 = _2216;
    float _2438 = _2228;
    float _2440 = _2284;
    float _2442 = _2264;
    float _2444 = fma(_2176, -0.5, 0.5);
    float _2446 = precise::clamp(_2444, 0.0, 1.0);
    float _2448 = -_2432;
    float _2450 = _2448 + _2434;
    float _2452 = -_2436;
    float _2454 = _2452 + _2438;
    float _2456 = -_2440;
    float _2458 = _2456 + _2442;
    bool _2460 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2462 = fma(_2446, _2450, _2432);
    float _2464 = fma(_2446, _2454, _2436);
    float _2466 = fma(_2446, _2458, _2440);
    float _2468 = _2462 * 0.586610972881317138671875;
    out.m_89.x = 0.0;
    float _2470 = fma(_2464, 0.298911988735198974609375, _2468);
    float _2472 = fma(_2466, 0.114477999508380889892578125, _2470);
    float _2474 = -_2472;
    float _2476 = _2464 + _2474;
    float _2478 = -_2472;
    float _2480 = _2462 + _2478;
    float _2482 = -_2472;
    float _2484 = _2466 + _2482;
    float _2486 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2488 = fma(_2476, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2472);
    float _2490 = fma(_2480, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2472);
    float _2492 = fma(_2484, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2472);
    out.m_49.x = _2486;
    out.m_91.x = _2488;
    out.m_91.y = _2490;
    out.m_91.z = _2492;
    if (!_2460)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_57.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_57.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_57.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_57.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_55.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_55.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_55.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_55.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_49.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_49.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_49.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_49.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_91.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_91.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_91.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_91.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _2494 = -_1413;
    float _2496 = _2494 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
    float _2498 = -_1415;
    float _2500 = _2498 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
    float _2502 = -_1417;
    float _2504 = _2502 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
    float _2506 = _2496 * _2496;
    float _2508 = fma(_2500, _2500, _2506);
    float _2510 = fma(_2504, _2504, _2508);
    float _2512 = sqrt(_2510);
    float _2514 = rsqrt(_2510);
    float _2516 = -_2512;
    float _2518 = _2516 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2520 = _2518 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
    float _2522 = precise::clamp(_2520, 0.0, 1.0);
    float _2524 = _2500 * _2514;
    float _2526 = _2496 * _2514;
    float _2528 = abs(_2522);
    float _2530 = log2(_2528);
    float _2532 = _2504 * _2514;
    float _2534 = _2524 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
    float _2536 = _2176 * _2526;
    float _2538 = -_2526;
    float _2540 = -_2534;
    float _2542 = fma(_2538, (*spvDescriptorSet0.vp_c15)._m0[656].y, _2540);
    float _2544 = fma(_2174, _2524, _2536);
    float _2546 = -_2532;
    float _2548 = fma(_2546, (*spvDescriptorSet0.vp_c15)._m0[656].z, _2542);
    float _2550 = fma(_2178, _2532, _2544);
    float _2552 = precise::clamp(_2550, 0.0, 1.0);
    float _2554 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
    float _2556 = _2548 + _2554;
    float _2558 = _2530 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
    float _2560 = _2556 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
    float _2562 = precise::clamp(_2560, 0.0, 1.0);
    float _2564 = exp2(_2558);
    float _2566 = _2564 * _2562;
    float _2568 = _2552 * _2566;
    float _2570 = _2568 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
    float _2572 = _2568 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
    float _2574 = _2568 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
    out.m_89.x = _2570;
    out.m_89.y = _2572;
    out.m_89.z = _2574;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_57.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_57.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_57.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_57.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_55.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_55.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_55.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_55.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_49.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_49.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_49.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_49.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_91.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_91.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_91.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_91.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

