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
    constant _16* vp_c16 [[id(4)]];
    constant _16* vp_c7 [[id(5)]];
    texture3d<float> vp_t_tcb_32 [[id(6)]];
    sampler vp_t_tcb_32Smplr [[id(7)]];
    texture3d<float> vp_t_tcb_30 [[id(8)]];
    sampler vp_t_tcb_30Smplr [[id(9)]];
    texture2d<float> vp_t_tcb_1C [[id(10)]];
    sampler vp_t_tcb_1CSmplr [[id(11)]];
    sampler vp_t_tcb_32Smplr_w [[id(12)]];
    sampler vp_t_tcb_30Smplr_w [[id(13)]];
    sampler vp_t_tcb_1CSmplr_w [[id(14)]];
    constant dm_border_t* dm_border [[id(15)]];
};

struct main0_out
{
    float4 m_55 [[user(locn0)]];
    float4 m_69 [[user(locn1)]];
    float4 m_67 [[user(locn2)]];
    float4 m_71 [[user(locn3)]];
    float4 m_47 [[user(locn4)]];
    float4 m_65 [[user(locn5)]];
    float4 m_73 [[user(locn7)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_53 [[attribute(2)]];
    float4 m_44 [[attribute(3)]];
    float4 m_49 [[attribute(4)]];
    float4 m_57 [[attribute(6)]];
    float4 m_51 [[attribute(7)]];
    float4 m_59 [[attribute(8)]];
    float4 m_63 [[attribute(10)]];
    float4 m_61 [[attribute(11)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_55 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_69 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_67 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_71 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_47 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_65 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_73 = float4(0.0, 0.0, 0.0, 1.0);
    bool _1407 = false;
    bool _459 = false;
    bool _204 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _87 = in.m_44.w;
    float _89 = trunc(_87);
    int _92 = int(_89);
    bool _96 = _92 >= 1;
    float _98 = 0.0;
    if (!_96)
    {
        _98 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _100 = _98;
    float _102 = _100;
    if (!_96)
    {
        out.m_47.x = 0.0;
    }
    int _104 = 0;
    if (!_96)
    {
        float _106 = _100 * 5.0;
        _104 = as_type<int>(_106);
    }
    int _108 = _104;
    int _110 = _108;
    if (!_96)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1995 = as_type<float>(_108);
        out.gl_Position.z = _1995;
    }
    if (!_96)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _112 = in.m_49.w;
    bool _114 = _112 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _116 = isnan(_112);
    bool _118 = _114 || _116;
    bool _120 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _122 = _118 || _120;
    float _124 = -_112;
    float _126 = _124 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _128 = 0.0;
    if (_122)
    {
        float _130 = float(_92);
        _128 = _130;
    }
    float _132 = _128;
    bool _134 = _126 >= _132;
    bool _136 = !_122;
    bool _138 = _134 || _136;
    if (_138)
    {
        _102 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _140 = _102;
    if (_138)
    {
        out.m_47.x = 0.0;
    }
    if (_138)
    {
        float _142 = _140 * 5.0;
        _110 = as_type<int>(_142);
    }
    int _144 = _110;
    if (_138)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2063 = as_type<float>(_144);
        out.gl_Position.z = _2063;
    }
    if (_138)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _146 = in.m_51.x;
    float _148 = float(as_type<int>((*spvDescriptorSet0.vp_c9)._m0[8].x));
    bool _150 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _152 = in.m_53.x;
    float _154 = in.m_53.y;
    float _156 = in.m_53.z;
    float _158 = _148 * _146;
    float _160 = _154 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _162 = _154 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _164 = trunc(_158);
    int _166 = int(_164);
    float _168 = _154 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _170 = fma(_152, (*spvDescriptorSet0.vp_c10)._m0[4].x, _160);
    float _172 = fma(_152, (*spvDescriptorSet0.vp_c10)._m0[5].x, _162);
    float _174 = fma(_152, (*spvDescriptorSet0.vp_c10)._m0[6].x, _168);
    float _176 = fma(_156, (*spvDescriptorSet0.vp_c10)._m0[4].z, _170);
    float _178 = fma(_156, (*spvDescriptorSet0.vp_c10)._m0[5].z, _172);
    float _180 = fma(_156, (*spvDescriptorSet0.vp_c10)._m0[6].z, _174);
    int _182 = _166 << 4;
    int _184 = _182 + 1712;
    bool _186 = !_150;
    float _202;
    if (!_186)
    {
        float _188 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _190 = _146 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _192 = fma(_190, (*spvDescriptorSet0.vp_c9)._m0[11].y, _126);
        float _194 = _192 * _188;
        float _196 = floor(_194);
        float _198 = -_196;
        float _200 = _194 + _198;
        _202 = _200;
        _204 = true;
    }
    else
    {
        float _206 = float(_92);
        float _208 = 1.0 / _206;
        float _210 = _126 * _208;
        _202 = _210;
    }
    _204 = false;
    float _212 = _202;
    uint _215 = uint(int(uint(_184) >> uint(2)));
    uint _217 = uint(int(uint(int(_215)) >> uint(2)));
    int _219 = int(_215) & 3;
    float _221 = (*spvDescriptorSet0.vp_c9)._m0[int(_217)][_219];
    int _223 = int(_215) + 1;
    uint _225 = uint(int(uint(_223) >> uint(2)));
    int _227 = _223 & 3;
    float _229 = (*spvDescriptorSet0.vp_c9)._m0[int(_225)][_227];
    float _231 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _233 = _231 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _235 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _237 = _235 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _239 = 1.0 / _233;
    int _241 = _184 + 8;
    uint _243 = uint(int(uint(_241) >> uint(2)));
    uint _245 = uint(int(uint(int(_243)) >> uint(2)));
    int _247 = int(_243) & 3;
    float _249 = (*spvDescriptorSet0.vp_c9)._m0[int(_245)][_247];
    float _251 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _253 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _251;
    float _255 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _257 = _255 + (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _259 = _212 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _261 = isnan(_212);
    bool _263 = _259 || _261;
    bool _265 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _267 = _263 || _265;
    float _269 = float(_267);
    bool _271 = _212 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _273 = isnan(_212);
    bool _275 = _271 || _273;
    bool _277 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _279 = _275 || _277;
    float _281 = float(_279);
    float _283 = 1.0 / _237;
    bool _285 = _212 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _287 = isnan(_212);
    bool _289 = _285 || _287;
    bool _291 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _293 = _289 || _291;
    float _295 = float(_293);
    float _297 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _299 = _212 + _297;
    bool _301 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _303 = -_295;
    float _305 = _303 + 1.0;
    float _307 = _253 * _239;
    float _309 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _311 = _212 + _309;
    float _313 = 1.0 / _257;
    float _315 = -(*spvDescriptorSet0.vp_c9)._m0[118].w;
    float _317 = _315 + (*spvDescriptorSet0.vp_c9)._m0[119].w;
    float _319 = _281 * _305;
    float _321 = fma(_307, _311, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _323 = -_269;
    float _325 = _323 + 1.0;
    bool _327 = _212 >= (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _329 = isnan(_212);
    bool _331 = _327 || _329;
    bool _333 = isnan((*spvDescriptorSet0.vp_c9)._m0[118].w);
    bool _335 = _331 || _333;
    float _337 = float(_335);
    float _339 = -_281;
    float _341 = _339 + 1.0;
    float _343 = _321 * _319;
    float _345 = 1.0 / _317;
    float _347 = _295 * _325;
    float _349 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _351 = _349 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _353 = -(*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _355 = (*spvDescriptorSet0.vp_c9)._m0[118].x + _353;
    float _357 = -_337;
    float _359 = _357 + 1.0;
    float _361 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _363 = _212 + _361;
    float _365 = _351 * _283;
    bool _367 = _212 >= (*spvDescriptorSet0.vp_c9)._m0[119].w;
    bool _369 = isnan(_212);
    bool _371 = _367 || _369;
    bool _373 = isnan((*spvDescriptorSet0.vp_c9)._m0[119].w);
    bool _375 = _371 || _373;
    float _377 = float(_375);
    float _379 = _355 * _313;
    float _381 = -(*spvDescriptorSet0.vp_c9)._m0[118].x;
    float _383 = _381 + (*spvDescriptorSet0.vp_c9)._m0[119].x;
    float _385 = fma(_365, _299, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _387 = fma(_341, (*spvDescriptorSet0.vp_c9)._m0[115].x, _343);
    float _389 = _269 * _359;
    float _391 = fma(_379, _363, (*spvDescriptorSet0.vp_c9)._m0[117].x);
    float _393 = -_377;
    float _395 = _393 + 1.0;
    float _397 = -(*spvDescriptorSet0.vp_c9)._m0[118].w;
    float _399 = _212 + _397;
    float _401 = _383 * _345;
    float _403 = fma(_385, _347, _387);
    float _405 = _337 * _395;
    float _407 = _221 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _409 = fma(_401, _399, (*spvDescriptorSet0.vp_c9)._m0[118].x);
    float _411 = fma(_391, _389, _403);
    float _413 = _229 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _415 = _249 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _417 = float(as_type<int>((*spvDescriptorSet0.vp_c9)._m0[8].z));
    float _419 = fma(_409, _405, _411);
    float _421 = _407 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _423 = _413 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _425 = _415 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _427 = fma(_377, (*spvDescriptorSet0.vp_c9)._m0[119].x, _419);
    float _429 = _417 * _146;
    float _431 = _427 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _433 = trunc(_429);
    int _435 = int(_433);
    out.m_55.x = _421;
    out.m_55.y = _423;
    out.m_55.z = _425;
    out.m_55.w = _431;
    int _437 = _435 << 4;
    int _439 = _437 + 1968;
    bool _441 = !_301;
    float _457;
    if (!_441)
    {
        float _443 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _445 = _146 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _447 = fma(_445, (*spvDescriptorSet0.vp_c9)._m0[11].w, _126);
        float _449 = _447 * _443;
        float _451 = floor(_449);
        float _453 = -_451;
        float _455 = _449 + _453;
        _457 = _455;
        _459 = true;
    }
    else
    {
        float _461 = float(_92);
        float _463 = 1.0 / _461;
        float _465 = _126 * _463;
        _457 = _465;
    }
    _459 = false;
    float _467 = _457;
    float _469 = in.m_44.x;
    float _471 = in.m_44.y;
    float _473 = in.m_44.z;
    float _475 = _178 * _178;
    float _477 = in.m_57.x;
    float _479 = in.m_57.y;
    float _481 = in.m_57.z;
    int _483 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _485 = _483 != 0;
    float _487 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    int _489 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _491 = _489 != 0;
    float _493 = in.m_51.w;
    int _495 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _497 = _495 != 0;
    float _499 = -(*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _501 = _499 + (*spvDescriptorSet0.vp_c9)._m0[134].w;
    int _503 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _505 = _503 != 0;
    float _507 = in.m_59.x;
    float _509 = in.m_59.y;
    float _511 = in.m_59.z;
    float _513 = 1.0 / _501;
    float _515 = in.m_51.y;
    int _517 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _519 = _517 != 0;
    float _521 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _523 = _521 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _525 = _249;
    if (_491)
    {
        float _527 = in.m_51.z;
        _525 = _527;
    }
    float _529 = _525;
    float _531 = _487 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _533 = _471 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _535 = _471 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _537 = _471 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _539 = fma(_469, (*spvDescriptorSet0.vp_c10)._m0[4].x, _533);
    float _541 = fma(_469, (*spvDescriptorSet0.vp_c10)._m0[5].x, _535);
    float _543 = fma(_469, (*spvDescriptorSet0.vp_c10)._m0[6].x, _537);
    float _545 = 1.0 / _523;
    float _547 = fma(_473, (*spvDescriptorSet0.vp_c10)._m0[4].z, _539);
    float _549 = fma(_473, (*spvDescriptorSet0.vp_c10)._m0[5].z, _541);
    bool _551 = _493 > 0.5;
    float _553 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _555 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _479);
    float _557 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _481);
    float _559 = _146 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _561 = fma(_473, (*spvDescriptorSet0.vp_c10)._m0[6].z, _543);
    float _563 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _565 = _563 + (*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _567 = -(*spvDescriptorSet0.vp_c9)._m0[136].w;
    float _569 = _567 + (*spvDescriptorSet0.vp_c9)._m0[137].w;
    float _571 = -_553;
    float _573 = fma(_559, 2.0, _571);
    float _575 = 1.0 / _565;
    float _577 = _511 * (*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _579 = _549 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _581 = _509 * (*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _583 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _477);
    float _585 = -(*spvDescriptorSet0.vp_c9)._m0[135].w;
    float _587 = _585 + (*spvDescriptorSet0.vp_c9)._m0[136].w;
    float _589 = 1.0 / _569;
    float _591 = -(*spvDescriptorSet0.vp_c9)._m0[134].w;
    float _593 = _591 + (*spvDescriptorSet0.vp_c9)._m0[135].w;
    float _595 = _547 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _597 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _599 = _579 + _597;
    float _601 = in.m_61.x;
    float _603 = -(*spvDescriptorSet0.vp_c9)._m0[135].x;
    float _605 = (*spvDescriptorSet0.vp_c9)._m0[136].x + _603;
    float _607 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _609 = 1.0 / _593;
    float _611 = _515 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _613 = -(*spvDescriptorSet0.vp_c9)._m0[136].x;
    float _615 = _613 + (*spvDescriptorSet0.vp_c9)._m0[137].x;
    float _617 = _561 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _619 = in.m_63.y;
    float _621 = fma(_611, -2.0, _607);
    bool _623 = false;
    bool _625 = _551;
    float _627 = _617;
    if (_491)
    {
        bool _629 = _529 > 0.5;
        _623 = _629;
    }
    bool _631 = _623;
    float _633 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _635 = _617 + _633;
    float _637 = 1.0 / _587;
    float _639 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _641 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _639;
    float _643 = _615 * _589;
    float _645 = _507 * (*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _647 = _641 * _545;
    float _649 = _599 * _599;
    float _651 = -(*spvDescriptorSet0.vp_c9)._m0[132].x;
    float _653 = _651 + (*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _655 = -(*spvDescriptorSet0.vp_c9)._m0[137].w;
    float _657 = _655 + (*spvDescriptorSet0.vp_c9)._m0[138].w;
    float _659 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _661 = _595 + _659;
    float _663 = _645 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _665 = 1.0 / _657;
    float _667 = fma(_661, _661, _649);
    out.m_65.x = _601;
    float _669 = _653 * _575;
    float _671 = fma(_635, _635, _667);
    float _673 = -(*spvDescriptorSet0.vp_c9)._m0[137].x;
    float _675 = (*spvDescriptorSet0.vp_c9)._m0[138].x + _673;
    float _677 = _605 * _637;
    float _679 = -_619;
    float _681 = _679 + 1.0;
    float _683 = fma(_176, _176, _475);
    float _685 = -(*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _687 = (*spvDescriptorSet0.vp_c9)._m0[134].x + _685;
    float _689 = rsqrt(_671);
    float _691 = -(*spvDescriptorSet0.vp_c9)._m0[134].x;
    float _693 = _691 + (*spvDescriptorSet0.vp_c9)._m0[135].x;
    float _695 = fma(_180, _180, _683);
    float _697 = _663 * (*spvDescriptorSet0.vp_c9)._m0[18].w;
    float _699 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _701 = _693 * _609;
    float _703 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _705 = _467 + _703;
    float _707 = _675 * _665;
    float _709 = rsqrt(_695);
    float _711 = _687 * _513;
    float _713 = fma(_647, _705, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    float _715 = fma(_146, (*spvDescriptorSet0.vp_c9)._m0[78].z, _699);
    float _717 = -(*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _719 = _467 + _717;
    float _721 = _649;
    float _723 = _619;
    if (!_519)
    {
        _721 = _515;
    }
    float _725 = _721;
    float _727 = 0.0;
    float _729 = _725;
    if (!_519)
    {
        float _731 = in.m_51.z;
        _727 = _731;
    }
    float _733 = _727;
    float _735 = _551 ? _681 : _619;
    float _737 = _697 * _689;
    float _739 = _735;
    if (_485)
    {
        bool _741 = _146 > 0.5;
        _625 = _741;
    }
    bool _743 = _625;
    float _745 = fma(_711, _719, (*spvDescriptorSet0.vp_c9)._m0[133].x);
    if (_519)
    {
        _729 = _146;
    }
    float _747 = _729;
    float _749 = _599 * _737;
    float _751 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _753 = _467 + _751;
    float _755 = _661 * _737;
    float _757 = -(*spvDescriptorSet0.vp_c9)._m0[136].w;
    float _759 = _467 + _757;
    float _761 = -_749;
    float _763 = _599 + _761;
    float _765 = fma(_669, _753, (*spvDescriptorSet0.vp_c9)._m0[132].x);
    float _767 = -(*spvDescriptorSet0.vp_c9)._m0[135].w;
    float _769 = _467 + _767;
    float _771 = -_755;
    float _773 = _661 + _771;
    float _775 = _763 * _763;
    float _777 = _180 * _709;
    float _779 = fma(_677, _769, (*spvDescriptorSet0.vp_c9)._m0[135].x);
    float _781 = _178 * _709;
    float _783 = fma(_773, _773, _775);
    float _785 = _176 * _709;
    float _787 = -(*spvDescriptorSet0.vp_c8)._m0[28].x;
    float _789 = _777 * _787;
    float _791 = _635 * _737;
    float _793 = fma(_643, _759, (*spvDescriptorSet0.vp_c9)._m0[136].x);
    float _795 = -(*spvDescriptorSet0.vp_c9)._m0[134].w;
    float _797 = _467 + _795;
    float _799 = -(*spvDescriptorSet0.vp_c8)._m0[28].z;
    float _801 = _781 * _799;
    float _803 = -(*spvDescriptorSet0.vp_c8)._m0[28].z;
    float _805 = -_789;
    float _807 = fma(_785, _803, _805);
    float _809 = -_791;
    float _811 = _635 + _809;
    float _813 = fma(_701, _797, (*spvDescriptorSet0.vp_c9)._m0[134].x);
    float _815 = -(*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _817 = -_801;
    float _819 = fma(_777, _815, _817);
    float _821 = -(*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _823 = _785 * _821;
    float _825 = _807 * _807;
    float _827 = fma(_811, _811, _783);
    float _829 = -(*spvDescriptorSet0.vp_c8)._m0[28].x;
    float _831 = -_823;
    float _833 = fma(_781, _829, _831);
    float _835 = fma(_819, _819, _825);
    float _837 = sqrt(_827);
    float _839 = _497 ? _735 : _619;
    float _841 = _581 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _843 = fma(_833, _833, _835);
    bool _845 = _515 > 0.5;
    float _847 = in.m_63.x;
    float _849 = _835;
    float _851 = _733;
    int _853 = as_type<int>(_747);
    float _855 = _755;
    if (!_519)
    {
        _849 = _733;
    }
    float _857 = _849;
    float _859 = fma(_839, _531, -0.5);
    float _861 = rsqrt(_843);
    float _863 = _857;
    if (_505)
    {
        float _865 = _845 ? _681 : _619;
        _723 = _865;
    }
    float _867 = _723;
    float _869 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    bool _871 = _467 >= (*spvDescriptorSet0.vp_c9)._m0[138].w;
    bool _873 = isnan(_467);
    bool _875 = _871 || _873;
    bool _877 = isnan((*spvDescriptorSet0.vp_c9)._m0[138].w);
    bool _879 = _875 || _877;
    float _881 = float(_879);
    float _883 = fma(_126, (*spvDescriptorSet0.vp_c9)._m0[76].y, _621);
    if (_519)
    {
        _863 = _515;
    }
    float _885 = _863;
    float _887 = fma(_515, (*spvDescriptorSet0.vp_c9)._m0[78].w, _869);
    if (_519)
    {
        _851 = _515;
    }
    float _889 = _851;
    float _891 = -_881;
    float _893 = _891 + 1.0;
    bool _895 = _467 >= (*spvDescriptorSet0.vp_c9)._m0[137].w;
    bool _897 = isnan(_467);
    bool _899 = _895 || _897;
    bool _901 = isnan((*spvDescriptorSet0.vp_c9)._m0[137].w);
    bool _903 = _899 || _901;
    float _905 = float(_903);
    float _907 = _689 * _837;
    bool _909 = _467 >= (*spvDescriptorSet0.vp_c9)._m0[136].w;
    bool _911 = isnan(_467);
    bool _913 = _909 || _911;
    bool _915 = isnan((*spvDescriptorSet0.vp_c9)._m0[136].w);
    bool _917 = _913 || _915;
    float _919 = float(_917);
    float _921 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    bool _923 = _467 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _925 = isnan(_467);
    bool _927 = _923 || _925;
    bool _929 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _931 = _927 || _929;
    float _933 = float(_931);
    float _935 = _905 * _893;
    float _937 = _663 * _907;
    float _939 = -_905;
    float _941 = _939 + 1.0;
    float _943 = _819 * _861;
    float _945 = _807 * _861;
    float _947 = _937 * _583;
    float _949 = _833 * _861;
    bool _951 = _467 >= (*spvDescriptorSet0.vp_c9)._m0[135].w;
    bool _953 = isnan(_467);
    bool _955 = _951 || _953;
    bool _957 = isnan((*spvDescriptorSet0.vp_c9)._m0[135].w);
    bool _959 = _955 || _957;
    float _961 = float(_959);
    float _963 = -_919;
    float _965 = _963 + 1.0;
    float _967 = _919 * _941;
    bool _969 = _467 >= (*spvDescriptorSet0.vp_c9)._m0[134].w;
    bool _971 = isnan(_467);
    bool _973 = _969 || _971;
    bool _975 = isnan((*spvDescriptorSet0.vp_c9)._m0[134].w);
    bool _977 = _973 || _975;
    float _979 = float(_977);
    float _981 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _983 = _961 * _965;
    float _985 = -_961;
    float _987 = _985 + 1.0;
    float _989 = _841 * _907;
    bool _991 = _467 >= (*spvDescriptorSet0.vp_c9)._m0[133].w;
    bool _993 = isnan(_467);
    bool _995 = _991 || _993;
    bool _997 = isnan((*spvDescriptorSet0.vp_c9)._m0[133].w);
    bool _999 = _995 || _997;
    float _1001 = float(_999);
    float _1003 = _577 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _1005 = _979 * _987;
    float _1007 = -_979;
    float _1009 = _1007 + 1.0;
    float _1011 = _989 * _555;
    float _1013 = _1003 * _907;
    float _1015 = -_1001;
    float _1017 = _1015 + 1.0;
    float _1019 = _1001 * _1009;
    bool _1021 = _467 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _1023 = isnan(_467);
    bool _1025 = _1021 || _1023;
    bool _1027 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _1029 = _1025 || _1027;
    float _1031 = float(_1029);
    float _1033 = _1013 * _557;
    float _1035 = _933 * _1017;
    float _1037 = -_933;
    float _1039 = _1037 + 1.0;
    float _1041 = -(*spvDescriptorSet0.vp_c9)._m0[137].w;
    float _1043 = _467 + _1041;
    float _1045 = _781 * _949;
    float _1047 = _1011 * _785;
    float _1049 = _981 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1051 = _1031 * _1039;
    float _1053 = fma(_707, _1043, (*spvDescriptorSet0.vp_c9)._m0[137].x);
    float _1055 = -_1045;
    float _1057 = fma(_777, _945, _1055);
    float _1059 = fma(_947, _943, _1047);
    float _1061 = _713 * _1051;
    float _1063 = fma(_1049, _867, -0.5);
    float _1065 = _785 * _945;
    float _1067 = _1011 * _777;
    float _1069 = fma(_1033, _1057, _1059);
    float _1071 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _1073 = -_1065;
    float _1075 = fma(_781, _943, _1073);
    float _1077 = fma(_947, _949, _1067);
    float _1079 = fma(_747, (*spvDescriptorSet0.vp_c9)._m0[83].z, _1071);
    float _1081 = _747 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _1083 = fma(_1033, _1075, _1077);
    float _1085 = _847;
    if (_485)
    {
        float _1087 = -_847;
        float _1089 = _1087 + 1.0;
        _853 = as_type<int>(_1089);
    }
    int _1091 = _853;
    float _1093 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _1095 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _1097 = _595 + _1069;
    float _1099 = _617 + _1083;
    float _1101 = _1097;
    float _1103 = _1099;
    if (!_485)
    {
        _739 = _847;
    }
    float _1105 = _739;
    float _1107 = -_1093;
    float _1109 = fma(_1081, 2.0, _1107);
    float _1111 = fma(_889, (*spvDescriptorSet0.vp_c9)._m0[83].w, _1095);
    float _1113 = _1105;
    if (_485)
    {
        float _1115 = _743 ? as_type<float>(_1091) : _847;
        _1113 = _1115;
    }
    float _1117 = _1113;
    int _1119 = _439 + 8;
    uint _1121 = uint(int(uint(_1119) >> uint(2)));
    uint _1123 = uint(int(uint(int(_1121)) >> uint(2)));
    int _1125 = int(_1121) & 3;
    float _1127 = (*spvDescriptorSet0.vp_c9)._m0[int(_1123)][_1125];
    float _1129 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1131 = _1097 + _1129;
    float _1133 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1135 = _1099 + _1133;
    float _1137 = -_1031;
    float _1139 = _1137 + 1.0;
    float _1141 = _921 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1143 = _1131 * _1131;
    float _1145 = _1135 * _1135;
    float _1147 = fma(_1139, (*spvDescriptorSet0.vp_c9)._m0[131].x, _1061);
    uint _1149 = uint(int(uint(_439) >> uint(2)));
    uint _1151 = uint(int(uint(int(_1149)) >> uint(2)));
    int _1153 = int(_1149) & 3;
    float _1155 = (*spvDescriptorSet0.vp_c9)._m0[int(_1151)][_1153];
    int _1157 = int(_1149) + 1;
    uint _1159 = uint(int(uint(_1157) >> uint(2)));
    int _1161 = _1157 & 3;
    float _1163 = (*spvDescriptorSet0.vp_c9)._m0[int(_1159)][_1161];
    int _1165 = 0;
    float _1167 = _1143;
    float _1169 = _1145;
    if (_491)
    {
        float _1171 = -_847;
        float _1173 = _1171 + 1.0;
        _1165 = as_type<int>(_1173);
    }
    int _1175 = _1165;
    float _1177 = _1143 + _1145;
    float _1179 = fma(_765, _1035, _1147);
    float _1181 = _885 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _1183 = _1011 * _781;
    float _1185 = sqrt(_1177);
    float _1187 = fma(_745, _1019, _1179);
    float _1189 = fma(_1141, _1117, -0.5);
    float _1191 = in.m_61.z;
    if (_491)
    {
        float _1193 = _631 ? as_type<float>(_1175) : _847;
        _1085 = _1193;
    }
    float _1195 = _1085;
    float _1197 = _777 * _943;
    float _1199 = in.m_61.y;
    float _1201 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _1203 = fma(_126, (*spvDescriptorSet0.vp_c9)._m0[77].w, _887);
    float _1205 = -_1197;
    float _1207 = fma(_785, _949, _1205);
    float _1209 = in.m_61.w;
    float _1211 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _1213 = fma(_947, _945, _1183);
    float _1215 = fma(_813, _1005, _1187);
    float _1217 = fma(_126, (*spvDescriptorSet0.vp_c9)._m0[77].z, _715);
    bool _1219 = _1185 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1221 = fma(_1181, -2.0, _1211);
    float _1223 = fma(_1033, _1207, _1213);
    float _1225 = fma(_779, _983, _1215);
    float _1227 = -_126;
    float _1229 = fma(_1227, (*spvDescriptorSet0.vp_c9)._m0[76].x, _573);
    float _1231 = fma(_126, (*spvDescriptorSet0.vp_c9)._m0[82].z, _1079);
    float _1233 = -_126;
    float _1235 = fma(_1233, (*spvDescriptorSet0.vp_c9)._m0[81].x, _1109);
    float _1237 = fma(_126, (*spvDescriptorSet0.vp_c9)._m0[82].w, _1111);
    float _1239 = _1201 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _1241 = fma(_126, (*spvDescriptorSet0.vp_c9)._m0[81].y, _1221);
    float _1243 = -_883;
    float _1245 = fma(_1203, _1063, _1243);
    float _1247 = fma(_793, _967, _1225);
    float _1249 = fma(_1239, _1195, -0.5);
    float _1251 = _579 + _1223;
    bool _1253 = !_1219;
    float _1255 = _1251;
    if (!_1253)
    {
        float _1257 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1259 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1261 = _1185 + _1259;
        float _1263 = _1251 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1265 = rsqrt(_1177);
        float _1267 = _1261 * _1257;
        float _1269 = _1267 * 0.15915493667125701904296875;
        float _1271 = _1269 * 6.283185482025146484375;
        float _1273 = sin(_1271);
        float _1275 = _1269 * 6.283185482025146484375;
        float _1277 = cos(_1275);
        float _1279 = fma(_1273, _1263, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1281 = _1265 * _1279;
        float _1283 = fma(_1131, _1281, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1285 = _1277 + (-1.0);
        float _1287 = fma(_1135, _1281, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _1289 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _1291 = _1283 + _1289;
        float _1293 = _1285 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1295 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _1297 = _1287 + _1295;
        float _1299 = _1291 * _1291;
        float _1301 = fma(_1251, _1277, _1293);
        float _1303 = _1297 * _1297;
        _1255 = _1301;
        _1167 = _1299;
        _1169 = _1303;
        _1101 = _1283;
        _1103 = _1287;
    }
    float _1305 = _1255;
    float _1307 = _1167;
    float _1309 = _1169;
    float _1311 = _1101;
    float _1313 = _1103;
    float _1315 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _1317 = _1305 + _1315;
    float _1319 = fma(_1053, _935, _1247);
    float _1321 = -_1241;
    float _1323 = fma(_1237, _859, _1321);
    float _1325 = fma(_1217, _1189, _1229);
    float _1327 = fma(_1317, _1317, _1307);
    float _1329 = fma(_1231, _1249, _1235);
    float _1331 = fma(_881, (*spvDescriptorSet0.vp_c9)._m0[138].x, _1319);
    float _1333 = _1155 * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1335 = _1327 + _1309;
    float _1337 = _1163 * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1339 = _1127 * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1341 = _1333 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1343 = _1245 + 0.5;
    float _1345 = _1337 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1347 = sqrt(_1335);
    float _1349 = _1339 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1351 = _1325 + 0.5;
    float _1353 = _1329 + 0.5;
    float _1355 = _1323 + 0.5;
    float _1357 = _1331 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    out.m_65.y = _1199;
    out.m_65.z = _1191;
    out.m_65.w = _1209;
    bool _1359 = _1347 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _1361 = isnan(_1347);
    bool _1363 = _1359 || _1361;
    bool _1365 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _1367 = _1363 || _1365;
    out.m_67.x = _1351;
    out.m_67.y = _1343;
    out.m_67.z = _1353;
    out.m_67.w = _1355;
    out.m_69.x = _1341;
    out.m_69.y = _1345;
    out.m_69.z = _1349;
    out.m_69.w = _1357;
    float _1369 = _1333;
    float _1371 = _1343;
    if (!_1367)
    {
        _1369 = 1.0;
    }
    float _1373 = _1369;
    bool _1375 = !_1367;
    float _1377 = _1373;
    if (!_1375)
    {
        bool _1379 = _1347 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _1381 = isnan(_1347);
        bool _1383 = _1379 || _1381;
        bool _1385 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _1387 = _1383 || _1385;
        if (!_1387)
        {
            float _1389 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1391 = _1347 + _1389;
            float _1393 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1395 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _1393;
            float _1397 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _1399 = _1397 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _1401 = 1.0 / _1395;
            float _1403 = _1391 * _1401;
            float _1405 = fma(_1403, _1399, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _1377 = _1405;
            _1407 = true;
        }
        else
        {
            bool _1409 = _1347 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _1411 = isnan(_1347);
            bool _1413 = _1409 || _1411;
            bool _1415 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _1417 = _1413 || _1415;
            if (!_1417)
            {
                float _1419 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1421 = _1347 + _1419;
                float _1423 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1425 = _1423 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _1427 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _1429 = _1427 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _1431 = 1.0 / _1425;
                float _1433 = _1421 * _1431;
                float _1435 = fma(_1433, _1429, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _1377 = _1435;
                _1407 = true;
            }
            else
            {
                _1377 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _1407 = false;
    float _1437 = _1377;
    float _1439 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _1441 = _1311 + _1439;
    float _1443 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _1445 = _1305 + _1443;
    float _1447 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _1449 = _1313 + _1447;
    bool _1451 = (*spvDescriptorSet0.vp_c15)._m0[660].y >= 0.5;
    bool _1453 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1455 = _1451 || _1453;
    bool _1457 = isnan(0.5);
    bool _1459 = _1455 || _1457;
    float _1461 = fma(_1441, _1437, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _1463 = fma(_1445, _1437, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _1465 = fma(_1449, _1437, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _1467 = -_755;
    float _1469 = _1467 + _1461;
    float _1471 = -_749;
    float _1473 = _1471 + _1463;
    float _1475 = -_791;
    float _1477 = _1475 + _1465;
    float _1479 = _1473;
    float _1481 = _1469;
    float _1483 = _1477;
    if (!_1459)
    {
        float _1485 = -_749;
        float _1487 = _579 + _1485;
        float _1489 = -_755;
        float _1491 = _595 + _1489;
        float _1493 = -_791;
        float _1495 = _617 + _1493;
        float _1497 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1499 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _1501 = _1487 + _1499;
        float _1503 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _1505 = _1491 + _1503;
        float _1507 = -_617;
        float _1509 = _1507 + _1465;
        float _1511 = -_579;
        float _1513 = _1511 + _1463;
        float _1515 = _1501 * _1501;
        float _1517 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _1519 = _1495 + _1517;
        float _1521 = 1.0 / _907;
        float _1523 = fma(_1505, _1505, _1515);
        float _1525 = fma(_1519, _1519, _1523);
        float _1527 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1529 = sqrt(_1525);
        float _1531 = _1527 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1533 = precise::min(_1529, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1535 = _1533 * _1497;
        float _1537 = _1535 * _1521;
        float _1539 = -_595;
        float _1541 = _1539 + _1461;
        float _1543 = _1531 * _1537;
        float _1545 = _1509 * _1537;
        float _1547 = fma(_1541, _1543, _1491);
        float _1549 = fma(_1513, _1543, _1487);
        float _1551 = fma(_1531, _1545, _1495);
        _1479 = _1549;
        _1481 = _1547;
        _1483 = _1551;
        _627 = _1545;
        _855 = _1543;
    }
    float _1553 = _1479;
    float _1555 = _1481;
    float _1557 = _1483;
    float _1559 = _627;
    float _1561 = _855;
    float _1563 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1565 = _1553 + _1563;
    float _1567 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1569 = _1555 + _1567;
    float _1571 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1573 = _1557 + _1571;
    float _1575 = _1565 * _1565;
    float _1577 = fma(_1569, _1569, _1575);
    float _1579 = fma(_1573, _1573, _1577);
    float _1581 = rsqrt(_1579);
    float _1583 = _1581 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1585 = _1569 * _1583;
    float _1587 = _1573 * _1583;
    float _1589 = _1585 * _1585;
    float _1591 = _1587 * _1587;
    float _1593 = _1589 + _1591;
    float _1595 = sqrt(_1593);
    bool _1597 = _1595 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1599 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1601 = _1595 + _1599;
    float _1603 = _1573;
    float _1605 = _1581;
    float _1607 = _1601;
    float _1609 = _1559;
    float _1611 = _1583;
    float _1613 = _1585;
    if (_1597)
    {
        float _1615 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1603 = _1615;
    }
    float _1617 = _1603;
    if (_1597)
    {
        float _1619 = rsqrt(_1593);
        _1605 = _1619;
    }
    float _1621 = _1605;
    float _1623 = _1621;
    if (_1597)
    {
        float _1625 = _1601 * _1617;
        _1607 = _1625;
    }
    float _1627 = _1607;
    if (_1597)
    {
        float _1629 = _1627 * 0.15915493667125701904296875;
        _1609 = _1629;
    }
    float _1631 = _1609;
    float _1633 = _1617;
    if (_1597)
    {
        float _1635 = _1631 * 6.283185482025146484375;
        float _1637 = sin(_1635);
        _1633 = _1637;
    }
    float _1639 = _1633;
    float _1641 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1643 = precise::max(0.0, _1641);
    float _1645 = _1561;
    float _1647 = _1643;
    if (_1597)
    {
        float _1649 = _1631 * 6.283185482025146484375;
        float _1651 = cos(_1649);
        _1645 = _1651;
    }
    float _1653 = _1645;
    float _1655 = -_1583;
    float _1657 = -_1643;
    float _1659 = fma(_1565, _1655, _1657);
    float _1661 = _1659;
    if (_1597)
    {
        float _1663 = _1659 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1647 = _1663;
    }
    float _1665 = _1647;
    float _1667 = sqrt(_1579);
    float _1669 = _1639;
    float _1671 = _1665;
    if (_1597)
    {
        float _1673 = fma(_1639, _1665, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1611 = _1673;
    }
    float _1675 = _1611;
    float _1677 = _1675;
    if (!_1597)
    {
        _1669 = _1587;
    }
    float _1679 = _1669;
    float _1681 = _1679;
    if (_1597)
    {
        float _1683 = _1653 + (-1.0);
        _1671 = _1683;
    }
    float _1685 = _1671;
    float _1687 = _1685;
    if (_1597)
    {
        float _1689 = _1621 * _1675;
        _1371 = _1689;
    }
    float _1691 = _1371;
    if (!_1597)
    {
        _1623 = _1659;
    }
    float _1693 = _1623;
    float _1695 = _1553 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1697 = _1693;
    if (_1597)
    {
        float _1699 = _1685 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1677 = _1699;
    }
    float _1701 = _1677;
    if (_1597)
    {
        float _1703 = _1585 * _1691;
        _1613 = _1703;
    }
    float _1705 = _1613;
    if (!_1597)
    {
        _1687 = _1589;
    }
    float _1707 = _1687;
    float _1709 = _1707;
    if (_1597)
    {
        float _1711 = _1587 * _1691;
        _1681 = _1711;
    }
    float _1713 = _1681;
    if (_1597)
    {
        float _1715 = fma(_1659, _1653, _1701);
        _1697 = _1715;
    }
    float _1717 = _1697;
    if (_1597)
    {
        float _1719 = _1705 * _1705;
        _1709 = _1719;
    }
    float _1721 = _1709;
    if (!_1597)
    {
        _1661 = _1591;
    }
    float _1723 = _1661;
    float _1725 = _1723;
    if (_1597)
    {
        float _1727 = _1713 * _1713;
        _1725 = _1727;
    }
    float _1729 = _1725;
    float _1731 = fma(_1717, _1717, _1721);
    float _1733 = fma(_1555, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1695);
    float _1735 = _1731 + _1729;
    float _1737 = _1553 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1739 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1741 = fma(_1667, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1739);
    float _1743 = precise::clamp(_1741, 0.0, 1.0);
    float _1745 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _1747 = fma(_1555, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1737);
    float _1749 = rsqrt(_1735);
    float _1751 = _1553 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1753 = -_1743;
    float _1755 = _1753 + 1.0;
    float _1757 = fma(_1557, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1747);
    float _1759 = _1553 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1761 = fma(_1555, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1751);
    float _1763 = _1757 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1765 = fma(_1555, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1759);
    float _1767 = fma(_1557, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1761);
    float _1769 = abs(_1755);
    float _1771 = log2(_1769);
    float _1773 = _1763 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1775 = fma(_1557, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1765);
    float _1777 = _1767 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1779 = -_1773;
    float _1781 = fma(_1779, _1745, 1.0);
    float _1783 = _1749 * _1705;
    float _1785 = fma(_1557, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1733);
    float _1787 = _1775 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1789 = _1777 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1791 = _1749 * _1717;
    float _1793 = _1783 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1795 = _1749 * _1713;
    float _1797 = fma(_1787, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1789);
    float _1799 = _1785 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1801 = -_1793;
    float _1803 = fma(_1791, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1801);
    float _1805 = _1771 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1807 = fma(_1763, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1797);
    float _1809 = log2(_1781);
    float _1811 = -_1795;
    float _1813 = fma(_1811, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1803);
    float _1815 = _1777 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1817 = fma(_1799, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1807);
    float _1819 = _1777 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1821 = fma(_1813, -0.5, 0.5);
    float _1823 = fma(_1787, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1815);
    float _1825 = fma(_1813, 0.5, 0.5);
    float _1827 = exp2(_1805);
    float _1829 = fma(_1787, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1819);
    float _1831 = fma(_1763, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1823);
    float _1833 = _1791 + 1.0;
    float _1835 = fma(_1825, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1837 = fma(_1763, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1829);
    float _1839 = fma(_1799, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1831);
    float _1841 = 1.0 / _1817;
    float _1843 = fma(_1799, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1837);
    float _1845 = fma(_1825, _1835, -0.212114393711090087890625);
    float _1847 = _1809 * 0.693147182464599609375;
    float _1849 = fma(_1825, _1845, 1.570728778839111328125);
    float _1851 = _1847 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1853 = sqrt(_1821);
    float _1855 = -_1791;
    float _1857 = fma(_1827, _1833, _1855);
    float _1859 = fma(_1857, 0.5, 0.5);
    float _1861 = _1839 * _1841;
    float _1863 = _1843 * _1841;
    float _1865 = fma(_1861, 0.5, 0.5);
    float _1867 = fma(_1863, -0.5, 0.5);
    float _1869 = _1853 * 0.636619746685028076171875;
    float3 _4874 = float3(_1865, _1867, _1851);
    float _1871 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_4874, float3(0.0), isnan(_4874)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_4874, float3(0.0), isnan(_4874)), level(0.0)).x;
    float _1873 = -_1849;
    float _1875 = fma(_1869, _1873, 1.0);
    float3 _4890 = float3(_1865, _1867, _1851);
    float4 _1878 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_4890, float3(0.0), isnan(_4890)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_4890, float3(0.0), isnan(_4890)), level(0.0)).xyzw;
    float _1880 = _1878.x;
    float _1882 = _1878.y;
    float _1884 = _1878.z;
    float _1886 = _1878.w;
    float2 _4907 = float2(_1875, _1859);
    float3 _1890 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_4907, float2(0.0), isnan(_4907)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_4907, float2(0.0), isnan(_4907)), level(0.0)).xyz;
    float _1892 = _1890.x;
    float _1894 = _1890.y;
    float _1896 = _1890.z;
    float _1898 = _1771 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _1900 = _1777 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1902 = fma(_1787, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1900);
    float _1904 = exp2(_1898);
    float _1906 = fma(_1763, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1902);
    float _1908 = fma(_1799, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1906);
    float _1910 = _1908 + _1817;
    out.gl_Position.x = _1839;
    out.gl_Position.y = _1843;
    out.gl_Position.z = _1908;
    out.gl_Position.w = _1817;
    float _1912 = _1910 * 0.5;
    float _1914 = -_1904;
    float _1916 = _1914 + 1.0;
    float _1918 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _1920 = _1916 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    out.m_71.z = _1912;
    out.m_71.w = _1817;
    out.m_47.x = _1918;
    float _1922 = _1920 * _1871;
    float _1924 = -_1920;
    float _1926 = _1924 + 1.0;
    float _1928 = _1886 * _1922;
    float _1930 = _1886 * _1926;
    float _1932 = _1896 * _1922;
    float _1934 = fma(_1892, _1928, _1880);
    float _1936 = fma(_1894, _1928, _1882);
    float _1938 = fma(_1886, _1932, _1884);
    out.m_73.x = _1934;
    out.m_73.y = _1936;
    out.m_73.z = _1938;
    out.m_73.w = _1930;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_55 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_69 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_67 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_71 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_47 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_65 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_73 = float4(0.0, 0.0, 0.0, 1.0);
    bool _1407 = false;
    bool _459 = false;
    bool _204 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _87 = in.m_44.w;
    float _89 = trunc(_87);
    int _92 = int(_89);
    bool _96 = _92 >= 1;
    float _98 = 0.0;
    if (!_96)
    {
        _98 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _100 = _98;
    float _102 = _100;
    if (!_96)
    {
        out.m_47.x = 0.0;
    }
    int _104 = 0;
    if (!_96)
    {
        float _106 = _100 * 5.0;
        _104 = as_type<int>(_106);
    }
    int _108 = _104;
    int _110 = _108;
    if (!_96)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1995 = as_type<float>(_108);
        out.gl_Position.z = _1995;
    }
    if (!_96)
    {
        return out;
    }
    float _112 = in.m_49.w;
    bool _114 = _112 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _116 = isnan(_112);
    bool _118 = _114 || _116;
    bool _120 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _122 = _118 || _120;
    float _124 = -_112;
    float _126 = _124 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _128 = 0.0;
    if (_122)
    {
        float _130 = float(_92);
        _128 = _130;
    }
    float _132 = _128;
    bool _134 = _126 >= _132;
    bool _136 = !_122;
    bool _138 = _134 || _136;
    if (_138)
    {
        _102 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _140 = _102;
    if (_138)
    {
        out.m_47.x = 0.0;
    }
    if (_138)
    {
        float _142 = _140 * 5.0;
        _110 = as_type<int>(_142);
    }
    int _144 = _110;
    if (_138)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2063 = as_type<float>(_144);
        out.gl_Position.z = _2063;
    }
    if (_138)
    {
        return out;
    }
    float _146 = in.m_51.x;
    float _148 = float(as_type<int>((*spvDescriptorSet0.vp_c9)._m0[8].x));
    bool _150 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _152 = in.m_53.x;
    float _154 = in.m_53.y;
    float _156 = in.m_53.z;
    float _158 = _148 * _146;
    float _160 = _154 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _162 = _154 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _164 = trunc(_158);
    int _166 = int(_164);
    float _168 = _154 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _170 = fma(_152, (*spvDescriptorSet0.vp_c10)._m0[4].x, _160);
    float _172 = fma(_152, (*spvDescriptorSet0.vp_c10)._m0[5].x, _162);
    float _174 = fma(_152, (*spvDescriptorSet0.vp_c10)._m0[6].x, _168);
    float _176 = fma(_156, (*spvDescriptorSet0.vp_c10)._m0[4].z, _170);
    float _178 = fma(_156, (*spvDescriptorSet0.vp_c10)._m0[5].z, _172);
    float _180 = fma(_156, (*spvDescriptorSet0.vp_c10)._m0[6].z, _174);
    int _182 = _166 << 4;
    int _184 = _182 + 1712;
    bool _186 = !_150;
    float _202;
    if (!_186)
    {
        float _188 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _190 = _146 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _192 = fma(_190, (*spvDescriptorSet0.vp_c9)._m0[11].y, _126);
        float _194 = _192 * _188;
        float _196 = floor(_194);
        float _198 = -_196;
        float _200 = _194 + _198;
        _202 = _200;
        _204 = true;
    }
    else
    {
        float _206 = float(_92);
        float _208 = 1.0 / _206;
        float _210 = _126 * _208;
        _202 = _210;
    }
    _204 = false;
    float _212 = _202;
    uint _215 = uint(int(uint(_184) >> uint(2)));
    uint _217 = uint(int(uint(int(_215)) >> uint(2)));
    int _219 = int(_215) & 3;
    float _221 = (*spvDescriptorSet0.vp_c9)._m0[int(_217)][_219];
    int _223 = int(_215) + 1;
    uint _225 = uint(int(uint(_223) >> uint(2)));
    int _227 = _223 & 3;
    float _229 = (*spvDescriptorSet0.vp_c9)._m0[int(_225)][_227];
    float _231 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _233 = _231 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _235 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _237 = _235 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _239 = 1.0 / _233;
    int _241 = _184 + 8;
    uint _243 = uint(int(uint(_241) >> uint(2)));
    uint _245 = uint(int(uint(int(_243)) >> uint(2)));
    int _247 = int(_243) & 3;
    float _249 = (*spvDescriptorSet0.vp_c9)._m0[int(_245)][_247];
    float _251 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _253 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _251;
    float _255 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _257 = _255 + (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _259 = _212 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _261 = isnan(_212);
    bool _263 = _259 || _261;
    bool _265 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _267 = _263 || _265;
    float _269 = float(_267);
    bool _271 = _212 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _273 = isnan(_212);
    bool _275 = _271 || _273;
    bool _277 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _279 = _275 || _277;
    float _281 = float(_279);
    float _283 = 1.0 / _237;
    bool _285 = _212 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _287 = isnan(_212);
    bool _289 = _285 || _287;
    bool _291 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _293 = _289 || _291;
    float _295 = float(_293);
    float _297 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _299 = _212 + _297;
    bool _301 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _303 = -_295;
    float _305 = _303 + 1.0;
    float _307 = _253 * _239;
    float _309 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _311 = _212 + _309;
    float _313 = 1.0 / _257;
    float _315 = -(*spvDescriptorSet0.vp_c9)._m0[118].w;
    float _317 = _315 + (*spvDescriptorSet0.vp_c9)._m0[119].w;
    float _319 = _281 * _305;
    float _321 = fma(_307, _311, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _323 = -_269;
    float _325 = _323 + 1.0;
    bool _327 = _212 >= (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _329 = isnan(_212);
    bool _331 = _327 || _329;
    bool _333 = isnan((*spvDescriptorSet0.vp_c9)._m0[118].w);
    bool _335 = _331 || _333;
    float _337 = float(_335);
    float _339 = -_281;
    float _341 = _339 + 1.0;
    float _343 = _321 * _319;
    float _345 = 1.0 / _317;
    float _347 = _295 * _325;
    float _349 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _351 = _349 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _353 = -(*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _355 = (*spvDescriptorSet0.vp_c9)._m0[118].x + _353;
    float _357 = -_337;
    float _359 = _357 + 1.0;
    float _361 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _363 = _212 + _361;
    float _365 = _351 * _283;
    bool _367 = _212 >= (*spvDescriptorSet0.vp_c9)._m0[119].w;
    bool _369 = isnan(_212);
    bool _371 = _367 || _369;
    bool _373 = isnan((*spvDescriptorSet0.vp_c9)._m0[119].w);
    bool _375 = _371 || _373;
    float _377 = float(_375);
    float _379 = _355 * _313;
    float _381 = -(*spvDescriptorSet0.vp_c9)._m0[118].x;
    float _383 = _381 + (*spvDescriptorSet0.vp_c9)._m0[119].x;
    float _385 = fma(_365, _299, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _387 = fma(_341, (*spvDescriptorSet0.vp_c9)._m0[115].x, _343);
    float _389 = _269 * _359;
    float _391 = fma(_379, _363, (*spvDescriptorSet0.vp_c9)._m0[117].x);
    float _393 = -_377;
    float _395 = _393 + 1.0;
    float _397 = -(*spvDescriptorSet0.vp_c9)._m0[118].w;
    float _399 = _212 + _397;
    float _401 = _383 * _345;
    float _403 = fma(_385, _347, _387);
    float _405 = _337 * _395;
    float _407 = _221 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _409 = fma(_401, _399, (*spvDescriptorSet0.vp_c9)._m0[118].x);
    float _411 = fma(_391, _389, _403);
    float _413 = _229 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _415 = _249 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _417 = float(as_type<int>((*spvDescriptorSet0.vp_c9)._m0[8].z));
    float _419 = fma(_409, _405, _411);
    float _421 = _407 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _423 = _413 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _425 = _415 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _427 = fma(_377, (*spvDescriptorSet0.vp_c9)._m0[119].x, _419);
    float _429 = _417 * _146;
    float _431 = _427 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _433 = trunc(_429);
    int _435 = int(_433);
    out.m_55.x = _421;
    out.m_55.y = _423;
    out.m_55.z = _425;
    out.m_55.w = _431;
    int _437 = _435 << 4;
    int _439 = _437 + 1968;
    bool _441 = !_301;
    float _457;
    if (!_441)
    {
        float _443 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _445 = _146 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _447 = fma(_445, (*spvDescriptorSet0.vp_c9)._m0[11].w, _126);
        float _449 = _447 * _443;
        float _451 = floor(_449);
        float _453 = -_451;
        float _455 = _449 + _453;
        _457 = _455;
        _459 = true;
    }
    else
    {
        float _461 = float(_92);
        float _463 = 1.0 / _461;
        float _465 = _126 * _463;
        _457 = _465;
    }
    _459 = false;
    float _467 = _457;
    float _469 = in.m_44.x;
    float _471 = in.m_44.y;
    float _473 = in.m_44.z;
    float _475 = _178 * _178;
    float _477 = in.m_57.x;
    float _479 = in.m_57.y;
    float _481 = in.m_57.z;
    int _483 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _485 = _483 != 0;
    float _487 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    int _489 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _491 = _489 != 0;
    float _493 = in.m_51.w;
    int _495 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _497 = _495 != 0;
    float _499 = -(*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _501 = _499 + (*spvDescriptorSet0.vp_c9)._m0[134].w;
    int _503 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _505 = _503 != 0;
    float _507 = in.m_59.x;
    float _509 = in.m_59.y;
    float _511 = in.m_59.z;
    float _513 = 1.0 / _501;
    float _515 = in.m_51.y;
    int _517 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _519 = _517 != 0;
    float _521 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _523 = _521 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _525 = _249;
    if (_491)
    {
        float _527 = in.m_51.z;
        _525 = _527;
    }
    float _529 = _525;
    float _531 = _487 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _533 = _471 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _535 = _471 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _537 = _471 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _539 = fma(_469, (*spvDescriptorSet0.vp_c10)._m0[4].x, _533);
    float _541 = fma(_469, (*spvDescriptorSet0.vp_c10)._m0[5].x, _535);
    float _543 = fma(_469, (*spvDescriptorSet0.vp_c10)._m0[6].x, _537);
    float _545 = 1.0 / _523;
    float _547 = fma(_473, (*spvDescriptorSet0.vp_c10)._m0[4].z, _539);
    float _549 = fma(_473, (*spvDescriptorSet0.vp_c10)._m0[5].z, _541);
    bool _551 = _493 > 0.5;
    float _553 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _555 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _479);
    float _557 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _481);
    float _559 = _146 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _561 = fma(_473, (*spvDescriptorSet0.vp_c10)._m0[6].z, _543);
    float _563 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _565 = _563 + (*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _567 = -(*spvDescriptorSet0.vp_c9)._m0[136].w;
    float _569 = _567 + (*spvDescriptorSet0.vp_c9)._m0[137].w;
    float _571 = -_553;
    float _573 = fma(_559, 2.0, _571);
    float _575 = 1.0 / _565;
    float _577 = _511 * (*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _579 = _549 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _581 = _509 * (*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _583 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _477);
    float _585 = -(*spvDescriptorSet0.vp_c9)._m0[135].w;
    float _587 = _585 + (*spvDescriptorSet0.vp_c9)._m0[136].w;
    float _589 = 1.0 / _569;
    float _591 = -(*spvDescriptorSet0.vp_c9)._m0[134].w;
    float _593 = _591 + (*spvDescriptorSet0.vp_c9)._m0[135].w;
    float _595 = _547 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _597 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _599 = _579 + _597;
    float _601 = in.m_61.x;
    float _603 = -(*spvDescriptorSet0.vp_c9)._m0[135].x;
    float _605 = (*spvDescriptorSet0.vp_c9)._m0[136].x + _603;
    float _607 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _609 = 1.0 / _593;
    float _611 = _515 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _613 = -(*spvDescriptorSet0.vp_c9)._m0[136].x;
    float _615 = _613 + (*spvDescriptorSet0.vp_c9)._m0[137].x;
    float _617 = _561 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _619 = in.m_63.y;
    float _621 = fma(_611, -2.0, _607);
    bool _623 = false;
    bool _625 = _551;
    float _627 = _617;
    if (_491)
    {
        bool _629 = _529 > 0.5;
        _623 = _629;
    }
    bool _631 = _623;
    float _633 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _635 = _617 + _633;
    float _637 = 1.0 / _587;
    float _639 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _641 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _639;
    float _643 = _615 * _589;
    float _645 = _507 * (*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _647 = _641 * _545;
    float _649 = _599 * _599;
    float _651 = -(*spvDescriptorSet0.vp_c9)._m0[132].x;
    float _653 = _651 + (*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _655 = -(*spvDescriptorSet0.vp_c9)._m0[137].w;
    float _657 = _655 + (*spvDescriptorSet0.vp_c9)._m0[138].w;
    float _659 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _661 = _595 + _659;
    float _663 = _645 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _665 = 1.0 / _657;
    float _667 = fma(_661, _661, _649);
    out.m_65.x = _601;
    float _669 = _653 * _575;
    float _671 = fma(_635, _635, _667);
    float _673 = -(*spvDescriptorSet0.vp_c9)._m0[137].x;
    float _675 = (*spvDescriptorSet0.vp_c9)._m0[138].x + _673;
    float _677 = _605 * _637;
    float _679 = -_619;
    float _681 = _679 + 1.0;
    float _683 = fma(_176, _176, _475);
    float _685 = -(*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _687 = (*spvDescriptorSet0.vp_c9)._m0[134].x + _685;
    float _689 = rsqrt(_671);
    float _691 = -(*spvDescriptorSet0.vp_c9)._m0[134].x;
    float _693 = _691 + (*spvDescriptorSet0.vp_c9)._m0[135].x;
    float _695 = fma(_180, _180, _683);
    float _697 = _663 * (*spvDescriptorSet0.vp_c9)._m0[18].w;
    float _699 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _701 = _693 * _609;
    float _703 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _705 = _467 + _703;
    float _707 = _675 * _665;
    float _709 = rsqrt(_695);
    float _711 = _687 * _513;
    float _713 = fma(_647, _705, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    float _715 = fma(_146, (*spvDescriptorSet0.vp_c9)._m0[78].z, _699);
    float _717 = -(*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _719 = _467 + _717;
    float _721 = _649;
    float _723 = _619;
    if (!_519)
    {
        _721 = _515;
    }
    float _725 = _721;
    float _727 = 0.0;
    float _729 = _725;
    if (!_519)
    {
        float _731 = in.m_51.z;
        _727 = _731;
    }
    float _733 = _727;
    float _735 = _551 ? _681 : _619;
    float _737 = _697 * _689;
    float _739 = _735;
    if (_485)
    {
        bool _741 = _146 > 0.5;
        _625 = _741;
    }
    bool _743 = _625;
    float _745 = fma(_711, _719, (*spvDescriptorSet0.vp_c9)._m0[133].x);
    if (_519)
    {
        _729 = _146;
    }
    float _747 = _729;
    float _749 = _599 * _737;
    float _751 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _753 = _467 + _751;
    float _755 = _661 * _737;
    float _757 = -(*spvDescriptorSet0.vp_c9)._m0[136].w;
    float _759 = _467 + _757;
    float _761 = -_749;
    float _763 = _599 + _761;
    float _765 = fma(_669, _753, (*spvDescriptorSet0.vp_c9)._m0[132].x);
    float _767 = -(*spvDescriptorSet0.vp_c9)._m0[135].w;
    float _769 = _467 + _767;
    float _771 = -_755;
    float _773 = _661 + _771;
    float _775 = _763 * _763;
    float _777 = _180 * _709;
    float _779 = fma(_677, _769, (*spvDescriptorSet0.vp_c9)._m0[135].x);
    float _781 = _178 * _709;
    float _783 = fma(_773, _773, _775);
    float _785 = _176 * _709;
    float _787 = -(*spvDescriptorSet0.vp_c8)._m0[28].x;
    float _789 = _777 * _787;
    float _791 = _635 * _737;
    float _793 = fma(_643, _759, (*spvDescriptorSet0.vp_c9)._m0[136].x);
    float _795 = -(*spvDescriptorSet0.vp_c9)._m0[134].w;
    float _797 = _467 + _795;
    float _799 = -(*spvDescriptorSet0.vp_c8)._m0[28].z;
    float _801 = _781 * _799;
    float _803 = -(*spvDescriptorSet0.vp_c8)._m0[28].z;
    float _805 = -_789;
    float _807 = fma(_785, _803, _805);
    float _809 = -_791;
    float _811 = _635 + _809;
    float _813 = fma(_701, _797, (*spvDescriptorSet0.vp_c9)._m0[134].x);
    float _815 = -(*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _817 = -_801;
    float _819 = fma(_777, _815, _817);
    float _821 = -(*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _823 = _785 * _821;
    float _825 = _807 * _807;
    float _827 = fma(_811, _811, _783);
    float _829 = -(*spvDescriptorSet0.vp_c8)._m0[28].x;
    float _831 = -_823;
    float _833 = fma(_781, _829, _831);
    float _835 = fma(_819, _819, _825);
    float _837 = sqrt(_827);
    float _839 = _497 ? _735 : _619;
    float _841 = _581 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _843 = fma(_833, _833, _835);
    bool _845 = _515 > 0.5;
    float _847 = in.m_63.x;
    float _849 = _835;
    float _851 = _733;
    int _853 = as_type<int>(_747);
    float _855 = _755;
    if (!_519)
    {
        _849 = _733;
    }
    float _857 = _849;
    float _859 = fma(_839, _531, -0.5);
    float _861 = rsqrt(_843);
    float _863 = _857;
    if (_505)
    {
        float _865 = _845 ? _681 : _619;
        _723 = _865;
    }
    float _867 = _723;
    float _869 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    bool _871 = _467 >= (*spvDescriptorSet0.vp_c9)._m0[138].w;
    bool _873 = isnan(_467);
    bool _875 = _871 || _873;
    bool _877 = isnan((*spvDescriptorSet0.vp_c9)._m0[138].w);
    bool _879 = _875 || _877;
    float _881 = float(_879);
    float _883 = fma(_126, (*spvDescriptorSet0.vp_c9)._m0[76].y, _621);
    if (_519)
    {
        _863 = _515;
    }
    float _885 = _863;
    float _887 = fma(_515, (*spvDescriptorSet0.vp_c9)._m0[78].w, _869);
    if (_519)
    {
        _851 = _515;
    }
    float _889 = _851;
    float _891 = -_881;
    float _893 = _891 + 1.0;
    bool _895 = _467 >= (*spvDescriptorSet0.vp_c9)._m0[137].w;
    bool _897 = isnan(_467);
    bool _899 = _895 || _897;
    bool _901 = isnan((*spvDescriptorSet0.vp_c9)._m0[137].w);
    bool _903 = _899 || _901;
    float _905 = float(_903);
    float _907 = _689 * _837;
    bool _909 = _467 >= (*spvDescriptorSet0.vp_c9)._m0[136].w;
    bool _911 = isnan(_467);
    bool _913 = _909 || _911;
    bool _915 = isnan((*spvDescriptorSet0.vp_c9)._m0[136].w);
    bool _917 = _913 || _915;
    float _919 = float(_917);
    float _921 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    bool _923 = _467 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _925 = isnan(_467);
    bool _927 = _923 || _925;
    bool _929 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _931 = _927 || _929;
    float _933 = float(_931);
    float _935 = _905 * _893;
    float _937 = _663 * _907;
    float _939 = -_905;
    float _941 = _939 + 1.0;
    float _943 = _819 * _861;
    float _945 = _807 * _861;
    float _947 = _937 * _583;
    float _949 = _833 * _861;
    bool _951 = _467 >= (*spvDescriptorSet0.vp_c9)._m0[135].w;
    bool _953 = isnan(_467);
    bool _955 = _951 || _953;
    bool _957 = isnan((*spvDescriptorSet0.vp_c9)._m0[135].w);
    bool _959 = _955 || _957;
    float _961 = float(_959);
    float _963 = -_919;
    float _965 = _963 + 1.0;
    float _967 = _919 * _941;
    bool _969 = _467 >= (*spvDescriptorSet0.vp_c9)._m0[134].w;
    bool _971 = isnan(_467);
    bool _973 = _969 || _971;
    bool _975 = isnan((*spvDescriptorSet0.vp_c9)._m0[134].w);
    bool _977 = _973 || _975;
    float _979 = float(_977);
    float _981 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _983 = _961 * _965;
    float _985 = -_961;
    float _987 = _985 + 1.0;
    float _989 = _841 * _907;
    bool _991 = _467 >= (*spvDescriptorSet0.vp_c9)._m0[133].w;
    bool _993 = isnan(_467);
    bool _995 = _991 || _993;
    bool _997 = isnan((*spvDescriptorSet0.vp_c9)._m0[133].w);
    bool _999 = _995 || _997;
    float _1001 = float(_999);
    float _1003 = _577 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _1005 = _979 * _987;
    float _1007 = -_979;
    float _1009 = _1007 + 1.0;
    float _1011 = _989 * _555;
    float _1013 = _1003 * _907;
    float _1015 = -_1001;
    float _1017 = _1015 + 1.0;
    float _1019 = _1001 * _1009;
    bool _1021 = _467 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _1023 = isnan(_467);
    bool _1025 = _1021 || _1023;
    bool _1027 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _1029 = _1025 || _1027;
    float _1031 = float(_1029);
    float _1033 = _1013 * _557;
    float _1035 = _933 * _1017;
    float _1037 = -_933;
    float _1039 = _1037 + 1.0;
    float _1041 = -(*spvDescriptorSet0.vp_c9)._m0[137].w;
    float _1043 = _467 + _1041;
    float _1045 = _781 * _949;
    float _1047 = _1011 * _785;
    float _1049 = _981 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1051 = _1031 * _1039;
    float _1053 = fma(_707, _1043, (*spvDescriptorSet0.vp_c9)._m0[137].x);
    float _1055 = -_1045;
    float _1057 = fma(_777, _945, _1055);
    float _1059 = fma(_947, _943, _1047);
    float _1061 = _713 * _1051;
    float _1063 = fma(_1049, _867, -0.5);
    float _1065 = _785 * _945;
    float _1067 = _1011 * _777;
    float _1069 = fma(_1033, _1057, _1059);
    float _1071 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _1073 = -_1065;
    float _1075 = fma(_781, _943, _1073);
    float _1077 = fma(_947, _949, _1067);
    float _1079 = fma(_747, (*spvDescriptorSet0.vp_c9)._m0[83].z, _1071);
    float _1081 = _747 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _1083 = fma(_1033, _1075, _1077);
    float _1085 = _847;
    if (_485)
    {
        float _1087 = -_847;
        float _1089 = _1087 + 1.0;
        _853 = as_type<int>(_1089);
    }
    int _1091 = _853;
    float _1093 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _1095 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _1097 = _595 + _1069;
    float _1099 = _617 + _1083;
    float _1101 = _1097;
    float _1103 = _1099;
    if (!_485)
    {
        _739 = _847;
    }
    float _1105 = _739;
    float _1107 = -_1093;
    float _1109 = fma(_1081, 2.0, _1107);
    float _1111 = fma(_889, (*spvDescriptorSet0.vp_c9)._m0[83].w, _1095);
    float _1113 = _1105;
    if (_485)
    {
        float _1115 = _743 ? as_type<float>(_1091) : _847;
        _1113 = _1115;
    }
    float _1117 = _1113;
    int _1119 = _439 + 8;
    uint _1121 = uint(int(uint(_1119) >> uint(2)));
    uint _1123 = uint(int(uint(int(_1121)) >> uint(2)));
    int _1125 = int(_1121) & 3;
    float _1127 = (*spvDescriptorSet0.vp_c9)._m0[int(_1123)][_1125];
    float _1129 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1131 = _1097 + _1129;
    float _1133 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1135 = _1099 + _1133;
    float _1137 = -_1031;
    float _1139 = _1137 + 1.0;
    float _1141 = _921 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1143 = _1131 * _1131;
    float _1145 = _1135 * _1135;
    float _1147 = fma(_1139, (*spvDescriptorSet0.vp_c9)._m0[131].x, _1061);
    uint _1149 = uint(int(uint(_439) >> uint(2)));
    uint _1151 = uint(int(uint(int(_1149)) >> uint(2)));
    int _1153 = int(_1149) & 3;
    float _1155 = (*spvDescriptorSet0.vp_c9)._m0[int(_1151)][_1153];
    int _1157 = int(_1149) + 1;
    uint _1159 = uint(int(uint(_1157) >> uint(2)));
    int _1161 = _1157 & 3;
    float _1163 = (*spvDescriptorSet0.vp_c9)._m0[int(_1159)][_1161];
    int _1165 = 0;
    float _1167 = _1143;
    float _1169 = _1145;
    if (_491)
    {
        float _1171 = -_847;
        float _1173 = _1171 + 1.0;
        _1165 = as_type<int>(_1173);
    }
    int _1175 = _1165;
    float _1177 = _1143 + _1145;
    float _1179 = fma(_765, _1035, _1147);
    float _1181 = _885 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _1183 = _1011 * _781;
    float _1185 = sqrt(_1177);
    float _1187 = fma(_745, _1019, _1179);
    float _1189 = fma(_1141, _1117, -0.5);
    float _1191 = in.m_61.z;
    if (_491)
    {
        float _1193 = _631 ? as_type<float>(_1175) : _847;
        _1085 = _1193;
    }
    float _1195 = _1085;
    float _1197 = _777 * _943;
    float _1199 = in.m_61.y;
    float _1201 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _1203 = fma(_126, (*spvDescriptorSet0.vp_c9)._m0[77].w, _887);
    float _1205 = -_1197;
    float _1207 = fma(_785, _949, _1205);
    float _1209 = in.m_61.w;
    float _1211 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _1213 = fma(_947, _945, _1183);
    float _1215 = fma(_813, _1005, _1187);
    float _1217 = fma(_126, (*spvDescriptorSet0.vp_c9)._m0[77].z, _715);
    bool _1219 = _1185 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1221 = fma(_1181, -2.0, _1211);
    float _1223 = fma(_1033, _1207, _1213);
    float _1225 = fma(_779, _983, _1215);
    float _1227 = -_126;
    float _1229 = fma(_1227, (*spvDescriptorSet0.vp_c9)._m0[76].x, _573);
    float _1231 = fma(_126, (*spvDescriptorSet0.vp_c9)._m0[82].z, _1079);
    float _1233 = -_126;
    float _1235 = fma(_1233, (*spvDescriptorSet0.vp_c9)._m0[81].x, _1109);
    float _1237 = fma(_126, (*spvDescriptorSet0.vp_c9)._m0[82].w, _1111);
    float _1239 = _1201 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _1241 = fma(_126, (*spvDescriptorSet0.vp_c9)._m0[81].y, _1221);
    float _1243 = -_883;
    float _1245 = fma(_1203, _1063, _1243);
    float _1247 = fma(_793, _967, _1225);
    float _1249 = fma(_1239, _1195, -0.5);
    float _1251 = _579 + _1223;
    bool _1253 = !_1219;
    float _1255 = _1251;
    if (!_1253)
    {
        float _1257 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1259 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1261 = _1185 + _1259;
        float _1263 = _1251 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1265 = rsqrt(_1177);
        float _1267 = _1261 * _1257;
        float _1269 = _1267 * 0.15915493667125701904296875;
        float _1271 = _1269 * 6.283185482025146484375;
        float _1273 = sin(_1271);
        float _1275 = _1269 * 6.283185482025146484375;
        float _1277 = cos(_1275);
        float _1279 = fma(_1273, _1263, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1281 = _1265 * _1279;
        float _1283 = fma(_1131, _1281, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1285 = _1277 + (-1.0);
        float _1287 = fma(_1135, _1281, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _1289 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _1291 = _1283 + _1289;
        float _1293 = _1285 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1295 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _1297 = _1287 + _1295;
        float _1299 = _1291 * _1291;
        float _1301 = fma(_1251, _1277, _1293);
        float _1303 = _1297 * _1297;
        _1255 = _1301;
        _1167 = _1299;
        _1169 = _1303;
        _1101 = _1283;
        _1103 = _1287;
    }
    float _1305 = _1255;
    float _1307 = _1167;
    float _1309 = _1169;
    float _1311 = _1101;
    float _1313 = _1103;
    float _1315 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _1317 = _1305 + _1315;
    float _1319 = fma(_1053, _935, _1247);
    float _1321 = -_1241;
    float _1323 = fma(_1237, _859, _1321);
    float _1325 = fma(_1217, _1189, _1229);
    float _1327 = fma(_1317, _1317, _1307);
    float _1329 = fma(_1231, _1249, _1235);
    float _1331 = fma(_881, (*spvDescriptorSet0.vp_c9)._m0[138].x, _1319);
    float _1333 = _1155 * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1335 = _1327 + _1309;
    float _1337 = _1163 * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1339 = _1127 * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1341 = _1333 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1343 = _1245 + 0.5;
    float _1345 = _1337 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1347 = sqrt(_1335);
    float _1349 = _1339 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1351 = _1325 + 0.5;
    float _1353 = _1329 + 0.5;
    float _1355 = _1323 + 0.5;
    float _1357 = _1331 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    out.m_65.y = _1199;
    out.m_65.z = _1191;
    out.m_65.w = _1209;
    bool _1359 = _1347 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _1361 = isnan(_1347);
    bool _1363 = _1359 || _1361;
    bool _1365 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _1367 = _1363 || _1365;
    out.m_67.x = _1351;
    out.m_67.y = _1343;
    out.m_67.z = _1353;
    out.m_67.w = _1355;
    out.m_69.x = _1341;
    out.m_69.y = _1345;
    out.m_69.z = _1349;
    out.m_69.w = _1357;
    float _1369 = _1333;
    float _1371 = _1343;
    if (!_1367)
    {
        _1369 = 1.0;
    }
    float _1373 = _1369;
    bool _1375 = !_1367;
    float _1377 = _1373;
    if (!_1375)
    {
        bool _1379 = _1347 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _1381 = isnan(_1347);
        bool _1383 = _1379 || _1381;
        bool _1385 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _1387 = _1383 || _1385;
        if (!_1387)
        {
            float _1389 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1391 = _1347 + _1389;
            float _1393 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1395 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _1393;
            float _1397 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _1399 = _1397 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _1401 = 1.0 / _1395;
            float _1403 = _1391 * _1401;
            float _1405 = fma(_1403, _1399, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _1377 = _1405;
            _1407 = true;
        }
        else
        {
            bool _1409 = _1347 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _1411 = isnan(_1347);
            bool _1413 = _1409 || _1411;
            bool _1415 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _1417 = _1413 || _1415;
            if (!_1417)
            {
                float _1419 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1421 = _1347 + _1419;
                float _1423 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1425 = _1423 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _1427 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _1429 = _1427 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _1431 = 1.0 / _1425;
                float _1433 = _1421 * _1431;
                float _1435 = fma(_1433, _1429, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _1377 = _1435;
                _1407 = true;
            }
            else
            {
                _1377 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _1407 = false;
    float _1437 = _1377;
    float _1439 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _1441 = _1311 + _1439;
    float _1443 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _1445 = _1305 + _1443;
    float _1447 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _1449 = _1313 + _1447;
    bool _1451 = (*spvDescriptorSet0.vp_c15)._m0[660].y >= 0.5;
    bool _1453 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1455 = _1451 || _1453;
    bool _1457 = isnan(0.5);
    bool _1459 = _1455 || _1457;
    float _1461 = fma(_1441, _1437, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _1463 = fma(_1445, _1437, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _1465 = fma(_1449, _1437, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _1467 = -_755;
    float _1469 = _1467 + _1461;
    float _1471 = -_749;
    float _1473 = _1471 + _1463;
    float _1475 = -_791;
    float _1477 = _1475 + _1465;
    float _1479 = _1473;
    float _1481 = _1469;
    float _1483 = _1477;
    if (!_1459)
    {
        float _1485 = -_749;
        float _1487 = _579 + _1485;
        float _1489 = -_755;
        float _1491 = _595 + _1489;
        float _1493 = -_791;
        float _1495 = _617 + _1493;
        float _1497 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1499 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _1501 = _1487 + _1499;
        float _1503 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _1505 = _1491 + _1503;
        float _1507 = -_617;
        float _1509 = _1507 + _1465;
        float _1511 = -_579;
        float _1513 = _1511 + _1463;
        float _1515 = _1501 * _1501;
        float _1517 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _1519 = _1495 + _1517;
        float _1521 = 1.0 / _907;
        float _1523 = fma(_1505, _1505, _1515);
        float _1525 = fma(_1519, _1519, _1523);
        float _1527 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1529 = sqrt(_1525);
        float _1531 = _1527 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1533 = precise::min(_1529, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1535 = _1533 * _1497;
        float _1537 = _1535 * _1521;
        float _1539 = -_595;
        float _1541 = _1539 + _1461;
        float _1543 = _1531 * _1537;
        float _1545 = _1509 * _1537;
        float _1547 = fma(_1541, _1543, _1491);
        float _1549 = fma(_1513, _1543, _1487);
        float _1551 = fma(_1531, _1545, _1495);
        _1479 = _1549;
        _1481 = _1547;
        _1483 = _1551;
        _627 = _1545;
        _855 = _1543;
    }
    float _1553 = _1479;
    float _1555 = _1481;
    float _1557 = _1483;
    float _1559 = _627;
    float _1561 = _855;
    float _1563 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1565 = _1553 + _1563;
    float _1567 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1569 = _1555 + _1567;
    float _1571 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1573 = _1557 + _1571;
    float _1575 = _1565 * _1565;
    float _1577 = fma(_1569, _1569, _1575);
    float _1579 = fma(_1573, _1573, _1577);
    float _1581 = rsqrt(_1579);
    float _1583 = _1581 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1585 = _1569 * _1583;
    float _1587 = _1573 * _1583;
    float _1589 = _1585 * _1585;
    float _1591 = _1587 * _1587;
    float _1593 = _1589 + _1591;
    float _1595 = sqrt(_1593);
    bool _1597 = _1595 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1599 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1601 = _1595 + _1599;
    float _1603 = _1573;
    float _1605 = _1581;
    float _1607 = _1601;
    float _1609 = _1559;
    float _1611 = _1583;
    float _1613 = _1585;
    if (_1597)
    {
        float _1615 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1603 = _1615;
    }
    float _1617 = _1603;
    if (_1597)
    {
        float _1619 = rsqrt(_1593);
        _1605 = _1619;
    }
    float _1621 = _1605;
    float _1623 = _1621;
    if (_1597)
    {
        float _1625 = _1601 * _1617;
        _1607 = _1625;
    }
    float _1627 = _1607;
    if (_1597)
    {
        float _1629 = _1627 * 0.15915493667125701904296875;
        _1609 = _1629;
    }
    float _1631 = _1609;
    float _1633 = _1617;
    if (_1597)
    {
        float _1635 = _1631 * 6.283185482025146484375;
        float _1637 = sin(_1635);
        _1633 = _1637;
    }
    float _1639 = _1633;
    float _1641 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1643 = precise::max(0.0, _1641);
    float _1645 = _1561;
    float _1647 = _1643;
    if (_1597)
    {
        float _1649 = _1631 * 6.283185482025146484375;
        float _1651 = cos(_1649);
        _1645 = _1651;
    }
    float _1653 = _1645;
    float _1655 = -_1583;
    float _1657 = -_1643;
    float _1659 = fma(_1565, _1655, _1657);
    float _1661 = _1659;
    if (_1597)
    {
        float _1663 = _1659 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1647 = _1663;
    }
    float _1665 = _1647;
    float _1667 = sqrt(_1579);
    float _1669 = _1639;
    float _1671 = _1665;
    if (_1597)
    {
        float _1673 = fma(_1639, _1665, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1611 = _1673;
    }
    float _1675 = _1611;
    float _1677 = _1675;
    if (!_1597)
    {
        _1669 = _1587;
    }
    float _1679 = _1669;
    float _1681 = _1679;
    if (_1597)
    {
        float _1683 = _1653 + (-1.0);
        _1671 = _1683;
    }
    float _1685 = _1671;
    float _1687 = _1685;
    if (_1597)
    {
        float _1689 = _1621 * _1675;
        _1371 = _1689;
    }
    float _1691 = _1371;
    if (!_1597)
    {
        _1623 = _1659;
    }
    float _1693 = _1623;
    float _1695 = _1553 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1697 = _1693;
    if (_1597)
    {
        float _1699 = _1685 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1677 = _1699;
    }
    float _1701 = _1677;
    if (_1597)
    {
        float _1703 = _1585 * _1691;
        _1613 = _1703;
    }
    float _1705 = _1613;
    if (!_1597)
    {
        _1687 = _1589;
    }
    float _1707 = _1687;
    float _1709 = _1707;
    if (_1597)
    {
        float _1711 = _1587 * _1691;
        _1681 = _1711;
    }
    float _1713 = _1681;
    if (_1597)
    {
        float _1715 = fma(_1659, _1653, _1701);
        _1697 = _1715;
    }
    float _1717 = _1697;
    if (_1597)
    {
        float _1719 = _1705 * _1705;
        _1709 = _1719;
    }
    float _1721 = _1709;
    if (!_1597)
    {
        _1661 = _1591;
    }
    float _1723 = _1661;
    float _1725 = _1723;
    if (_1597)
    {
        float _1727 = _1713 * _1713;
        _1725 = _1727;
    }
    float _1729 = _1725;
    float _1731 = fma(_1717, _1717, _1721);
    float _1733 = fma(_1555, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1695);
    float _1735 = _1731 + _1729;
    float _1737 = _1553 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1739 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1741 = fma(_1667, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1739);
    float _1743 = precise::clamp(_1741, 0.0, 1.0);
    float _1745 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _1747 = fma(_1555, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1737);
    float _1749 = rsqrt(_1735);
    float _1751 = _1553 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1753 = -_1743;
    float _1755 = _1753 + 1.0;
    float _1757 = fma(_1557, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1747);
    float _1759 = _1553 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1761 = fma(_1555, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1751);
    float _1763 = _1757 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1765 = fma(_1555, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1759);
    float _1767 = fma(_1557, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1761);
    float _1769 = abs(_1755);
    float _1771 = log2(_1769);
    float _1773 = _1763 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1775 = fma(_1557, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1765);
    float _1777 = _1767 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1779 = -_1773;
    float _1781 = fma(_1779, _1745, 1.0);
    float _1783 = _1749 * _1705;
    float _1785 = fma(_1557, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1733);
    float _1787 = _1775 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1789 = _1777 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1791 = _1749 * _1717;
    float _1793 = _1783 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1795 = _1749 * _1713;
    float _1797 = fma(_1787, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1789);
    float _1799 = _1785 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1801 = -_1793;
    float _1803 = fma(_1791, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1801);
    float _1805 = _1771 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1807 = fma(_1763, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1797);
    float _1809 = log2(_1781);
    float _1811 = -_1795;
    float _1813 = fma(_1811, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1803);
    float _1815 = _1777 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1817 = fma(_1799, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1807);
    float _1819 = _1777 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1821 = fma(_1813, -0.5, 0.5);
    float _1823 = fma(_1787, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1815);
    float _1825 = fma(_1813, 0.5, 0.5);
    float _1827 = exp2(_1805);
    float _1829 = fma(_1787, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1819);
    float _1831 = fma(_1763, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1823);
    float _1833 = _1791 + 1.0;
    float _1835 = fma(_1825, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1837 = fma(_1763, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1829);
    float _1839 = fma(_1799, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1831);
    float _1841 = 1.0 / _1817;
    float _1843 = fma(_1799, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1837);
    float _1845 = fma(_1825, _1835, -0.212114393711090087890625);
    float _1847 = _1809 * 0.693147182464599609375;
    float _1849 = fma(_1825, _1845, 1.570728778839111328125);
    float _1851 = _1847 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1853 = sqrt(_1821);
    float _1855 = -_1791;
    float _1857 = fma(_1827, _1833, _1855);
    float _1859 = fma(_1857, 0.5, 0.5);
    float _1861 = _1839 * _1841;
    float _1863 = _1843 * _1841;
    float _1865 = fma(_1861, 0.5, 0.5);
    float _1867 = fma(_1863, -0.5, 0.5);
    float _1869 = _1853 * 0.636619746685028076171875;
    float3 _4874 = float3(_1865, _1867, _1851);
    float _1871 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_4874, float3(0.0), isnan(_4874)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_4874, float3(0.0), isnan(_4874)), level(0.0)).x;
    float _1873 = -_1849;
    float _1875 = fma(_1869, _1873, 1.0);
    float3 _4890 = float3(_1865, _1867, _1851);
    float4 _1878 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_4890, float3(0.0), isnan(_4890)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_4890, float3(0.0), isnan(_4890)), level(0.0)).xyzw;
    float _1880 = _1878.x;
    float _1882 = _1878.y;
    float _1884 = _1878.z;
    float _1886 = _1878.w;
    float2 _4907 = float2(_1875, _1859);
    float3 _1890 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_4907, float2(0.0), isnan(_4907)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_4907, float2(0.0), isnan(_4907)), level(0.0)).xyz;
    float _1892 = _1890.x;
    float _1894 = _1890.y;
    float _1896 = _1890.z;
    float _1898 = _1771 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _1900 = _1777 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1902 = fma(_1787, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1900);
    float _1904 = exp2(_1898);
    float _1906 = fma(_1763, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1902);
    float _1908 = fma(_1799, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1906);
    float _1910 = _1908 + _1817;
    out.gl_Position.x = _1839;
    out.gl_Position.y = _1843;
    out.gl_Position.z = _1908;
    out.gl_Position.w = _1817;
    float _1912 = _1910 * 0.5;
    float _1914 = -_1904;
    float _1916 = _1914 + 1.0;
    float _1918 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _1920 = _1916 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    out.m_71.z = _1912;
    out.m_71.w = _1817;
    out.m_47.x = _1918;
    float _1922 = _1920 * _1871;
    float _1924 = -_1920;
    float _1926 = _1924 + 1.0;
    float _1928 = _1886 * _1922;
    float _1930 = _1886 * _1926;
    float _1932 = _1896 * _1922;
    float _1934 = fma(_1892, _1928, _1880);
    float _1936 = fma(_1894, _1928, _1882);
    float _1938 = fma(_1886, _1932, _1884);
    out.m_73.x = _1934;
    out.m_73.y = _1936;
    out.m_73.z = _1938;
    out.m_73.w = _1930;
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
    out.m_69 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_67 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_71 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_47 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_65 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_73 = float4(0.0, 0.0, 0.0, 1.0);
    bool _1407 = false;
    bool _459 = false;
    bool _204 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _87 = in.m_44.w;
    float _89 = trunc(_87);
    int _92 = int(_89);
    bool _96 = _92 >= 1;
    float _98 = 0.0;
    if (!_96)
    {
        _98 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _100 = _98;
    float _102 = _100;
    if (!_96)
    {
        out.m_47.x = 0.0;
    }
    int _104 = 0;
    if (!_96)
    {
        float _106 = _100 * 5.0;
        _104 = as_type<int>(_106);
    }
    int _108 = _104;
    int _110 = _108;
    if (!_96)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1995 = as_type<float>(_108);
        out.gl_Position.z = _1995;
    }
    if (!_96)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_55.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_55.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_55.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_55.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _112 = in.m_49.w;
    bool _114 = _112 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _116 = isnan(_112);
    bool _118 = _114 || _116;
    bool _120 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _122 = _118 || _120;
    float _124 = -_112;
    float _126 = _124 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _128 = 0.0;
    if (_122)
    {
        float _130 = float(_92);
        _128 = _130;
    }
    float _132 = _128;
    bool _134 = _126 >= _132;
    bool _136 = !_122;
    bool _138 = _134 || _136;
    if (_138)
    {
        _102 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _140 = _102;
    if (_138)
    {
        out.m_47.x = 0.0;
    }
    if (_138)
    {
        float _142 = _140 * 5.0;
        _110 = as_type<int>(_142);
    }
    int _144 = _110;
    if (_138)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2063 = as_type<float>(_144);
        out.gl_Position.z = _2063;
    }
    if (_138)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_55.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_55.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_55.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_55.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _146 = in.m_51.x;
    float _148 = float(as_type<int>((*spvDescriptorSet0.vp_c9)._m0[8].x));
    bool _150 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _152 = in.m_53.x;
    float _154 = in.m_53.y;
    float _156 = in.m_53.z;
    float _158 = _148 * _146;
    float _160 = _154 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _162 = _154 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _164 = trunc(_158);
    int _166 = int(_164);
    float _168 = _154 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _170 = fma(_152, (*spvDescriptorSet0.vp_c10)._m0[4].x, _160);
    float _172 = fma(_152, (*spvDescriptorSet0.vp_c10)._m0[5].x, _162);
    float _174 = fma(_152, (*spvDescriptorSet0.vp_c10)._m0[6].x, _168);
    float _176 = fma(_156, (*spvDescriptorSet0.vp_c10)._m0[4].z, _170);
    float _178 = fma(_156, (*spvDescriptorSet0.vp_c10)._m0[5].z, _172);
    float _180 = fma(_156, (*spvDescriptorSet0.vp_c10)._m0[6].z, _174);
    int _182 = _166 << 4;
    int _184 = _182 + 1712;
    bool _186 = !_150;
    float _202;
    if (!_186)
    {
        float _188 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _190 = _146 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _192 = fma(_190, (*spvDescriptorSet0.vp_c9)._m0[11].y, _126);
        float _194 = _192 * _188;
        float _196 = floor(_194);
        float _198 = -_196;
        float _200 = _194 + _198;
        _202 = _200;
        _204 = true;
    }
    else
    {
        float _206 = float(_92);
        float _208 = 1.0 / _206;
        float _210 = _126 * _208;
        _202 = _210;
    }
    _204 = false;
    float _212 = _202;
    uint _215 = uint(int(uint(_184) >> uint(2)));
    uint _217 = uint(int(uint(int(_215)) >> uint(2)));
    int _219 = int(_215) & 3;
    float _221 = (*spvDescriptorSet0.vp_c9)._m0[int(_217)][_219];
    int _223 = int(_215) + 1;
    uint _225 = uint(int(uint(_223) >> uint(2)));
    int _227 = _223 & 3;
    float _229 = (*spvDescriptorSet0.vp_c9)._m0[int(_225)][_227];
    float _231 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _233 = _231 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _235 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _237 = _235 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _239 = 1.0 / _233;
    int _241 = _184 + 8;
    uint _243 = uint(int(uint(_241) >> uint(2)));
    uint _245 = uint(int(uint(int(_243)) >> uint(2)));
    int _247 = int(_243) & 3;
    float _249 = (*spvDescriptorSet0.vp_c9)._m0[int(_245)][_247];
    float _251 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _253 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _251;
    float _255 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _257 = _255 + (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _259 = _212 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _261 = isnan(_212);
    bool _263 = _259 || _261;
    bool _265 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _267 = _263 || _265;
    float _269 = float(_267);
    bool _271 = _212 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _273 = isnan(_212);
    bool _275 = _271 || _273;
    bool _277 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _279 = _275 || _277;
    float _281 = float(_279);
    float _283 = 1.0 / _237;
    bool _285 = _212 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _287 = isnan(_212);
    bool _289 = _285 || _287;
    bool _291 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _293 = _289 || _291;
    float _295 = float(_293);
    float _297 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _299 = _212 + _297;
    bool _301 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _303 = -_295;
    float _305 = _303 + 1.0;
    float _307 = _253 * _239;
    float _309 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _311 = _212 + _309;
    float _313 = 1.0 / _257;
    float _315 = -(*spvDescriptorSet0.vp_c9)._m0[118].w;
    float _317 = _315 + (*spvDescriptorSet0.vp_c9)._m0[119].w;
    float _319 = _281 * _305;
    float _321 = fma(_307, _311, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _323 = -_269;
    float _325 = _323 + 1.0;
    bool _327 = _212 >= (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _329 = isnan(_212);
    bool _331 = _327 || _329;
    bool _333 = isnan((*spvDescriptorSet0.vp_c9)._m0[118].w);
    bool _335 = _331 || _333;
    float _337 = float(_335);
    float _339 = -_281;
    float _341 = _339 + 1.0;
    float _343 = _321 * _319;
    float _345 = 1.0 / _317;
    float _347 = _295 * _325;
    float _349 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _351 = _349 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _353 = -(*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _355 = (*spvDescriptorSet0.vp_c9)._m0[118].x + _353;
    float _357 = -_337;
    float _359 = _357 + 1.0;
    float _361 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _363 = _212 + _361;
    float _365 = _351 * _283;
    bool _367 = _212 >= (*spvDescriptorSet0.vp_c9)._m0[119].w;
    bool _369 = isnan(_212);
    bool _371 = _367 || _369;
    bool _373 = isnan((*spvDescriptorSet0.vp_c9)._m0[119].w);
    bool _375 = _371 || _373;
    float _377 = float(_375);
    float _379 = _355 * _313;
    float _381 = -(*spvDescriptorSet0.vp_c9)._m0[118].x;
    float _383 = _381 + (*spvDescriptorSet0.vp_c9)._m0[119].x;
    float _385 = fma(_365, _299, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _387 = fma(_341, (*spvDescriptorSet0.vp_c9)._m0[115].x, _343);
    float _389 = _269 * _359;
    float _391 = fma(_379, _363, (*spvDescriptorSet0.vp_c9)._m0[117].x);
    float _393 = -_377;
    float _395 = _393 + 1.0;
    float _397 = -(*spvDescriptorSet0.vp_c9)._m0[118].w;
    float _399 = _212 + _397;
    float _401 = _383 * _345;
    float _403 = fma(_385, _347, _387);
    float _405 = _337 * _395;
    float _407 = _221 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _409 = fma(_401, _399, (*spvDescriptorSet0.vp_c9)._m0[118].x);
    float _411 = fma(_391, _389, _403);
    float _413 = _229 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _415 = _249 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _417 = float(as_type<int>((*spvDescriptorSet0.vp_c9)._m0[8].z));
    float _419 = fma(_409, _405, _411);
    float _421 = _407 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _423 = _413 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _425 = _415 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _427 = fma(_377, (*spvDescriptorSet0.vp_c9)._m0[119].x, _419);
    float _429 = _417 * _146;
    float _431 = _427 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _433 = trunc(_429);
    int _435 = int(_433);
    out.m_55.x = _421;
    out.m_55.y = _423;
    out.m_55.z = _425;
    out.m_55.w = _431;
    int _437 = _435 << 4;
    int _439 = _437 + 1968;
    bool _441 = !_301;
    float _457;
    if (!_441)
    {
        float _443 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _445 = _146 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _447 = fma(_445, (*spvDescriptorSet0.vp_c9)._m0[11].w, _126);
        float _449 = _447 * _443;
        float _451 = floor(_449);
        float _453 = -_451;
        float _455 = _449 + _453;
        _457 = _455;
        _459 = true;
    }
    else
    {
        float _461 = float(_92);
        float _463 = 1.0 / _461;
        float _465 = _126 * _463;
        _457 = _465;
    }
    _459 = false;
    float _467 = _457;
    float _469 = in.m_44.x;
    float _471 = in.m_44.y;
    float _473 = in.m_44.z;
    float _475 = _178 * _178;
    float _477 = in.m_57.x;
    float _479 = in.m_57.y;
    float _481 = in.m_57.z;
    int _483 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _485 = _483 != 0;
    float _487 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    int _489 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _491 = _489 != 0;
    float _493 = in.m_51.w;
    int _495 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _497 = _495 != 0;
    float _499 = -(*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _501 = _499 + (*spvDescriptorSet0.vp_c9)._m0[134].w;
    int _503 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _505 = _503 != 0;
    float _507 = in.m_59.x;
    float _509 = in.m_59.y;
    float _511 = in.m_59.z;
    float _513 = 1.0 / _501;
    float _515 = in.m_51.y;
    int _517 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _519 = _517 != 0;
    float _521 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _523 = _521 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _525 = _249;
    if (_491)
    {
        float _527 = in.m_51.z;
        _525 = _527;
    }
    float _529 = _525;
    float _531 = _487 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _533 = _471 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _535 = _471 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _537 = _471 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _539 = fma(_469, (*spvDescriptorSet0.vp_c10)._m0[4].x, _533);
    float _541 = fma(_469, (*spvDescriptorSet0.vp_c10)._m0[5].x, _535);
    float _543 = fma(_469, (*spvDescriptorSet0.vp_c10)._m0[6].x, _537);
    float _545 = 1.0 / _523;
    float _547 = fma(_473, (*spvDescriptorSet0.vp_c10)._m0[4].z, _539);
    float _549 = fma(_473, (*spvDescriptorSet0.vp_c10)._m0[5].z, _541);
    bool _551 = _493 > 0.5;
    float _553 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _555 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _479);
    float _557 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _481);
    float _559 = _146 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _561 = fma(_473, (*spvDescriptorSet0.vp_c10)._m0[6].z, _543);
    float _563 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _565 = _563 + (*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _567 = -(*spvDescriptorSet0.vp_c9)._m0[136].w;
    float _569 = _567 + (*spvDescriptorSet0.vp_c9)._m0[137].w;
    float _571 = -_553;
    float _573 = fma(_559, 2.0, _571);
    float _575 = 1.0 / _565;
    float _577 = _511 * (*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _579 = _549 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _581 = _509 * (*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _583 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _477);
    float _585 = -(*spvDescriptorSet0.vp_c9)._m0[135].w;
    float _587 = _585 + (*spvDescriptorSet0.vp_c9)._m0[136].w;
    float _589 = 1.0 / _569;
    float _591 = -(*spvDescriptorSet0.vp_c9)._m0[134].w;
    float _593 = _591 + (*spvDescriptorSet0.vp_c9)._m0[135].w;
    float _595 = _547 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _597 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _599 = _579 + _597;
    float _601 = in.m_61.x;
    float _603 = -(*spvDescriptorSet0.vp_c9)._m0[135].x;
    float _605 = (*spvDescriptorSet0.vp_c9)._m0[136].x + _603;
    float _607 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _609 = 1.0 / _593;
    float _611 = _515 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _613 = -(*spvDescriptorSet0.vp_c9)._m0[136].x;
    float _615 = _613 + (*spvDescriptorSet0.vp_c9)._m0[137].x;
    float _617 = _561 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _619 = in.m_63.y;
    float _621 = fma(_611, -2.0, _607);
    bool _623 = false;
    bool _625 = _551;
    float _627 = _617;
    if (_491)
    {
        bool _629 = _529 > 0.5;
        _623 = _629;
    }
    bool _631 = _623;
    float _633 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _635 = _617 + _633;
    float _637 = 1.0 / _587;
    float _639 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _641 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _639;
    float _643 = _615 * _589;
    float _645 = _507 * (*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _647 = _641 * _545;
    float _649 = _599 * _599;
    float _651 = -(*spvDescriptorSet0.vp_c9)._m0[132].x;
    float _653 = _651 + (*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _655 = -(*spvDescriptorSet0.vp_c9)._m0[137].w;
    float _657 = _655 + (*spvDescriptorSet0.vp_c9)._m0[138].w;
    float _659 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _661 = _595 + _659;
    float _663 = _645 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _665 = 1.0 / _657;
    float _667 = fma(_661, _661, _649);
    out.m_65.x = _601;
    float _669 = _653 * _575;
    float _671 = fma(_635, _635, _667);
    float _673 = -(*spvDescriptorSet0.vp_c9)._m0[137].x;
    float _675 = (*spvDescriptorSet0.vp_c9)._m0[138].x + _673;
    float _677 = _605 * _637;
    float _679 = -_619;
    float _681 = _679 + 1.0;
    float _683 = fma(_176, _176, _475);
    float _685 = -(*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _687 = (*spvDescriptorSet0.vp_c9)._m0[134].x + _685;
    float _689 = rsqrt(_671);
    float _691 = -(*spvDescriptorSet0.vp_c9)._m0[134].x;
    float _693 = _691 + (*spvDescriptorSet0.vp_c9)._m0[135].x;
    float _695 = fma(_180, _180, _683);
    float _697 = _663 * (*spvDescriptorSet0.vp_c9)._m0[18].w;
    float _699 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _701 = _693 * _609;
    float _703 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _705 = _467 + _703;
    float _707 = _675 * _665;
    float _709 = rsqrt(_695);
    float _711 = _687 * _513;
    float _713 = fma(_647, _705, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    float _715 = fma(_146, (*spvDescriptorSet0.vp_c9)._m0[78].z, _699);
    float _717 = -(*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _719 = _467 + _717;
    float _721 = _649;
    float _723 = _619;
    if (!_519)
    {
        _721 = _515;
    }
    float _725 = _721;
    float _727 = 0.0;
    float _729 = _725;
    if (!_519)
    {
        float _731 = in.m_51.z;
        _727 = _731;
    }
    float _733 = _727;
    float _735 = _551 ? _681 : _619;
    float _737 = _697 * _689;
    float _739 = _735;
    if (_485)
    {
        bool _741 = _146 > 0.5;
        _625 = _741;
    }
    bool _743 = _625;
    float _745 = fma(_711, _719, (*spvDescriptorSet0.vp_c9)._m0[133].x);
    if (_519)
    {
        _729 = _146;
    }
    float _747 = _729;
    float _749 = _599 * _737;
    float _751 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _753 = _467 + _751;
    float _755 = _661 * _737;
    float _757 = -(*spvDescriptorSet0.vp_c9)._m0[136].w;
    float _759 = _467 + _757;
    float _761 = -_749;
    float _763 = _599 + _761;
    float _765 = fma(_669, _753, (*spvDescriptorSet0.vp_c9)._m0[132].x);
    float _767 = -(*spvDescriptorSet0.vp_c9)._m0[135].w;
    float _769 = _467 + _767;
    float _771 = -_755;
    float _773 = _661 + _771;
    float _775 = _763 * _763;
    float _777 = _180 * _709;
    float _779 = fma(_677, _769, (*spvDescriptorSet0.vp_c9)._m0[135].x);
    float _781 = _178 * _709;
    float _783 = fma(_773, _773, _775);
    float _785 = _176 * _709;
    float _787 = -(*spvDescriptorSet0.vp_c8)._m0[28].x;
    float _789 = _777 * _787;
    float _791 = _635 * _737;
    float _793 = fma(_643, _759, (*spvDescriptorSet0.vp_c9)._m0[136].x);
    float _795 = -(*spvDescriptorSet0.vp_c9)._m0[134].w;
    float _797 = _467 + _795;
    float _799 = -(*spvDescriptorSet0.vp_c8)._m0[28].z;
    float _801 = _781 * _799;
    float _803 = -(*spvDescriptorSet0.vp_c8)._m0[28].z;
    float _805 = -_789;
    float _807 = fma(_785, _803, _805);
    float _809 = -_791;
    float _811 = _635 + _809;
    float _813 = fma(_701, _797, (*spvDescriptorSet0.vp_c9)._m0[134].x);
    float _815 = -(*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _817 = -_801;
    float _819 = fma(_777, _815, _817);
    float _821 = -(*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _823 = _785 * _821;
    float _825 = _807 * _807;
    float _827 = fma(_811, _811, _783);
    float _829 = -(*spvDescriptorSet0.vp_c8)._m0[28].x;
    float _831 = -_823;
    float _833 = fma(_781, _829, _831);
    float _835 = fma(_819, _819, _825);
    float _837 = sqrt(_827);
    float _839 = _497 ? _735 : _619;
    float _841 = _581 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _843 = fma(_833, _833, _835);
    bool _845 = _515 > 0.5;
    float _847 = in.m_63.x;
    float _849 = _835;
    float _851 = _733;
    int _853 = as_type<int>(_747);
    float _855 = _755;
    if (!_519)
    {
        _849 = _733;
    }
    float _857 = _849;
    float _859 = fma(_839, _531, -0.5);
    float _861 = rsqrt(_843);
    float _863 = _857;
    if (_505)
    {
        float _865 = _845 ? _681 : _619;
        _723 = _865;
    }
    float _867 = _723;
    float _869 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    bool _871 = _467 >= (*spvDescriptorSet0.vp_c9)._m0[138].w;
    bool _873 = isnan(_467);
    bool _875 = _871 || _873;
    bool _877 = isnan((*spvDescriptorSet0.vp_c9)._m0[138].w);
    bool _879 = _875 || _877;
    float _881 = float(_879);
    float _883 = fma(_126, (*spvDescriptorSet0.vp_c9)._m0[76].y, _621);
    if (_519)
    {
        _863 = _515;
    }
    float _885 = _863;
    float _887 = fma(_515, (*spvDescriptorSet0.vp_c9)._m0[78].w, _869);
    if (_519)
    {
        _851 = _515;
    }
    float _889 = _851;
    float _891 = -_881;
    float _893 = _891 + 1.0;
    bool _895 = _467 >= (*spvDescriptorSet0.vp_c9)._m0[137].w;
    bool _897 = isnan(_467);
    bool _899 = _895 || _897;
    bool _901 = isnan((*spvDescriptorSet0.vp_c9)._m0[137].w);
    bool _903 = _899 || _901;
    float _905 = float(_903);
    float _907 = _689 * _837;
    bool _909 = _467 >= (*spvDescriptorSet0.vp_c9)._m0[136].w;
    bool _911 = isnan(_467);
    bool _913 = _909 || _911;
    bool _915 = isnan((*spvDescriptorSet0.vp_c9)._m0[136].w);
    bool _917 = _913 || _915;
    float _919 = float(_917);
    float _921 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    bool _923 = _467 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _925 = isnan(_467);
    bool _927 = _923 || _925;
    bool _929 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _931 = _927 || _929;
    float _933 = float(_931);
    float _935 = _905 * _893;
    float _937 = _663 * _907;
    float _939 = -_905;
    float _941 = _939 + 1.0;
    float _943 = _819 * _861;
    float _945 = _807 * _861;
    float _947 = _937 * _583;
    float _949 = _833 * _861;
    bool _951 = _467 >= (*spvDescriptorSet0.vp_c9)._m0[135].w;
    bool _953 = isnan(_467);
    bool _955 = _951 || _953;
    bool _957 = isnan((*spvDescriptorSet0.vp_c9)._m0[135].w);
    bool _959 = _955 || _957;
    float _961 = float(_959);
    float _963 = -_919;
    float _965 = _963 + 1.0;
    float _967 = _919 * _941;
    bool _969 = _467 >= (*spvDescriptorSet0.vp_c9)._m0[134].w;
    bool _971 = isnan(_467);
    bool _973 = _969 || _971;
    bool _975 = isnan((*spvDescriptorSet0.vp_c9)._m0[134].w);
    bool _977 = _973 || _975;
    float _979 = float(_977);
    float _981 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _983 = _961 * _965;
    float _985 = -_961;
    float _987 = _985 + 1.0;
    float _989 = _841 * _907;
    bool _991 = _467 >= (*spvDescriptorSet0.vp_c9)._m0[133].w;
    bool _993 = isnan(_467);
    bool _995 = _991 || _993;
    bool _997 = isnan((*spvDescriptorSet0.vp_c9)._m0[133].w);
    bool _999 = _995 || _997;
    float _1001 = float(_999);
    float _1003 = _577 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _1005 = _979 * _987;
    float _1007 = -_979;
    float _1009 = _1007 + 1.0;
    float _1011 = _989 * _555;
    float _1013 = _1003 * _907;
    float _1015 = -_1001;
    float _1017 = _1015 + 1.0;
    float _1019 = _1001 * _1009;
    bool _1021 = _467 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _1023 = isnan(_467);
    bool _1025 = _1021 || _1023;
    bool _1027 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _1029 = _1025 || _1027;
    float _1031 = float(_1029);
    float _1033 = _1013 * _557;
    float _1035 = _933 * _1017;
    float _1037 = -_933;
    float _1039 = _1037 + 1.0;
    float _1041 = -(*spvDescriptorSet0.vp_c9)._m0[137].w;
    float _1043 = _467 + _1041;
    float _1045 = _781 * _949;
    float _1047 = _1011 * _785;
    float _1049 = _981 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1051 = _1031 * _1039;
    float _1053 = fma(_707, _1043, (*spvDescriptorSet0.vp_c9)._m0[137].x);
    float _1055 = -_1045;
    float _1057 = fma(_777, _945, _1055);
    float _1059 = fma(_947, _943, _1047);
    float _1061 = _713 * _1051;
    float _1063 = fma(_1049, _867, -0.5);
    float _1065 = _785 * _945;
    float _1067 = _1011 * _777;
    float _1069 = fma(_1033, _1057, _1059);
    float _1071 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _1073 = -_1065;
    float _1075 = fma(_781, _943, _1073);
    float _1077 = fma(_947, _949, _1067);
    float _1079 = fma(_747, (*spvDescriptorSet0.vp_c9)._m0[83].z, _1071);
    float _1081 = _747 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _1083 = fma(_1033, _1075, _1077);
    float _1085 = _847;
    if (_485)
    {
        float _1087 = -_847;
        float _1089 = _1087 + 1.0;
        _853 = as_type<int>(_1089);
    }
    int _1091 = _853;
    float _1093 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _1095 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _1097 = _595 + _1069;
    float _1099 = _617 + _1083;
    float _1101 = _1097;
    float _1103 = _1099;
    if (!_485)
    {
        _739 = _847;
    }
    float _1105 = _739;
    float _1107 = -_1093;
    float _1109 = fma(_1081, 2.0, _1107);
    float _1111 = fma(_889, (*spvDescriptorSet0.vp_c9)._m0[83].w, _1095);
    float _1113 = _1105;
    if (_485)
    {
        float _1115 = _743 ? as_type<float>(_1091) : _847;
        _1113 = _1115;
    }
    float _1117 = _1113;
    int _1119 = _439 + 8;
    uint _1121 = uint(int(uint(_1119) >> uint(2)));
    uint _1123 = uint(int(uint(int(_1121)) >> uint(2)));
    int _1125 = int(_1121) & 3;
    float _1127 = (*spvDescriptorSet0.vp_c9)._m0[int(_1123)][_1125];
    float _1129 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1131 = _1097 + _1129;
    float _1133 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1135 = _1099 + _1133;
    float _1137 = -_1031;
    float _1139 = _1137 + 1.0;
    float _1141 = _921 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1143 = _1131 * _1131;
    float _1145 = _1135 * _1135;
    float _1147 = fma(_1139, (*spvDescriptorSet0.vp_c9)._m0[131].x, _1061);
    uint _1149 = uint(int(uint(_439) >> uint(2)));
    uint _1151 = uint(int(uint(int(_1149)) >> uint(2)));
    int _1153 = int(_1149) & 3;
    float _1155 = (*spvDescriptorSet0.vp_c9)._m0[int(_1151)][_1153];
    int _1157 = int(_1149) + 1;
    uint _1159 = uint(int(uint(_1157) >> uint(2)));
    int _1161 = _1157 & 3;
    float _1163 = (*spvDescriptorSet0.vp_c9)._m0[int(_1159)][_1161];
    int _1165 = 0;
    float _1167 = _1143;
    float _1169 = _1145;
    if (_491)
    {
        float _1171 = -_847;
        float _1173 = _1171 + 1.0;
        _1165 = as_type<int>(_1173);
    }
    int _1175 = _1165;
    float _1177 = _1143 + _1145;
    float _1179 = fma(_765, _1035, _1147);
    float _1181 = _885 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _1183 = _1011 * _781;
    float _1185 = sqrt(_1177);
    float _1187 = fma(_745, _1019, _1179);
    float _1189 = fma(_1141, _1117, -0.5);
    float _1191 = in.m_61.z;
    if (_491)
    {
        float _1193 = _631 ? as_type<float>(_1175) : _847;
        _1085 = _1193;
    }
    float _1195 = _1085;
    float _1197 = _777 * _943;
    float _1199 = in.m_61.y;
    float _1201 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _1203 = fma(_126, (*spvDescriptorSet0.vp_c9)._m0[77].w, _887);
    float _1205 = -_1197;
    float _1207 = fma(_785, _949, _1205);
    float _1209 = in.m_61.w;
    float _1211 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _1213 = fma(_947, _945, _1183);
    float _1215 = fma(_813, _1005, _1187);
    float _1217 = fma(_126, (*spvDescriptorSet0.vp_c9)._m0[77].z, _715);
    bool _1219 = _1185 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1221 = fma(_1181, -2.0, _1211);
    float _1223 = fma(_1033, _1207, _1213);
    float _1225 = fma(_779, _983, _1215);
    float _1227 = -_126;
    float _1229 = fma(_1227, (*spvDescriptorSet0.vp_c9)._m0[76].x, _573);
    float _1231 = fma(_126, (*spvDescriptorSet0.vp_c9)._m0[82].z, _1079);
    float _1233 = -_126;
    float _1235 = fma(_1233, (*spvDescriptorSet0.vp_c9)._m0[81].x, _1109);
    float _1237 = fma(_126, (*spvDescriptorSet0.vp_c9)._m0[82].w, _1111);
    float _1239 = _1201 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _1241 = fma(_126, (*spvDescriptorSet0.vp_c9)._m0[81].y, _1221);
    float _1243 = -_883;
    float _1245 = fma(_1203, _1063, _1243);
    float _1247 = fma(_793, _967, _1225);
    float _1249 = fma(_1239, _1195, -0.5);
    float _1251 = _579 + _1223;
    bool _1253 = !_1219;
    float _1255 = _1251;
    if (!_1253)
    {
        float _1257 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1259 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1261 = _1185 + _1259;
        float _1263 = _1251 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1265 = rsqrt(_1177);
        float _1267 = _1261 * _1257;
        float _1269 = _1267 * 0.15915493667125701904296875;
        float _1271 = _1269 * 6.283185482025146484375;
        float _1273 = sin(_1271);
        float _1275 = _1269 * 6.283185482025146484375;
        float _1277 = cos(_1275);
        float _1279 = fma(_1273, _1263, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1281 = _1265 * _1279;
        float _1283 = fma(_1131, _1281, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1285 = _1277 + (-1.0);
        float _1287 = fma(_1135, _1281, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _1289 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _1291 = _1283 + _1289;
        float _1293 = _1285 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1295 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _1297 = _1287 + _1295;
        float _1299 = _1291 * _1291;
        float _1301 = fma(_1251, _1277, _1293);
        float _1303 = _1297 * _1297;
        _1255 = _1301;
        _1167 = _1299;
        _1169 = _1303;
        _1101 = _1283;
        _1103 = _1287;
    }
    float _1305 = _1255;
    float _1307 = _1167;
    float _1309 = _1169;
    float _1311 = _1101;
    float _1313 = _1103;
    float _1315 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _1317 = _1305 + _1315;
    float _1319 = fma(_1053, _935, _1247);
    float _1321 = -_1241;
    float _1323 = fma(_1237, _859, _1321);
    float _1325 = fma(_1217, _1189, _1229);
    float _1327 = fma(_1317, _1317, _1307);
    float _1329 = fma(_1231, _1249, _1235);
    float _1331 = fma(_881, (*spvDescriptorSet0.vp_c9)._m0[138].x, _1319);
    float _1333 = _1155 * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1335 = _1327 + _1309;
    float _1337 = _1163 * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1339 = _1127 * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1341 = _1333 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1343 = _1245 + 0.5;
    float _1345 = _1337 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1347 = sqrt(_1335);
    float _1349 = _1339 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1351 = _1325 + 0.5;
    float _1353 = _1329 + 0.5;
    float _1355 = _1323 + 0.5;
    float _1357 = _1331 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    out.m_65.y = _1199;
    out.m_65.z = _1191;
    out.m_65.w = _1209;
    bool _1359 = _1347 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _1361 = isnan(_1347);
    bool _1363 = _1359 || _1361;
    bool _1365 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _1367 = _1363 || _1365;
    out.m_67.x = _1351;
    out.m_67.y = _1343;
    out.m_67.z = _1353;
    out.m_67.w = _1355;
    out.m_69.x = _1341;
    out.m_69.y = _1345;
    out.m_69.z = _1349;
    out.m_69.w = _1357;
    float _1369 = _1333;
    float _1371 = _1343;
    if (!_1367)
    {
        _1369 = 1.0;
    }
    float _1373 = _1369;
    bool _1375 = !_1367;
    float _1377 = _1373;
    if (!_1375)
    {
        bool _1379 = _1347 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _1381 = isnan(_1347);
        bool _1383 = _1379 || _1381;
        bool _1385 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _1387 = _1383 || _1385;
        if (!_1387)
        {
            float _1389 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1391 = _1347 + _1389;
            float _1393 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1395 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _1393;
            float _1397 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _1399 = _1397 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _1401 = 1.0 / _1395;
            float _1403 = _1391 * _1401;
            float _1405 = fma(_1403, _1399, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _1377 = _1405;
            _1407 = true;
        }
        else
        {
            bool _1409 = _1347 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _1411 = isnan(_1347);
            bool _1413 = _1409 || _1411;
            bool _1415 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _1417 = _1413 || _1415;
            if (!_1417)
            {
                float _1419 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1421 = _1347 + _1419;
                float _1423 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1425 = _1423 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _1427 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _1429 = _1427 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _1431 = 1.0 / _1425;
                float _1433 = _1421 * _1431;
                float _1435 = fma(_1433, _1429, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _1377 = _1435;
                _1407 = true;
            }
            else
            {
                _1377 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _1407 = false;
    float _1437 = _1377;
    float _1439 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _1441 = _1311 + _1439;
    float _1443 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _1445 = _1305 + _1443;
    float _1447 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _1449 = _1313 + _1447;
    bool _1451 = (*spvDescriptorSet0.vp_c15)._m0[660].y >= 0.5;
    bool _1453 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1455 = _1451 || _1453;
    bool _1457 = isnan(0.5);
    bool _1459 = _1455 || _1457;
    float _1461 = fma(_1441, _1437, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _1463 = fma(_1445, _1437, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _1465 = fma(_1449, _1437, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _1467 = -_755;
    float _1469 = _1467 + _1461;
    float _1471 = -_749;
    float _1473 = _1471 + _1463;
    float _1475 = -_791;
    float _1477 = _1475 + _1465;
    float _1479 = _1473;
    float _1481 = _1469;
    float _1483 = _1477;
    if (!_1459)
    {
        float _1485 = -_749;
        float _1487 = _579 + _1485;
        float _1489 = -_755;
        float _1491 = _595 + _1489;
        float _1493 = -_791;
        float _1495 = _617 + _1493;
        float _1497 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1499 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _1501 = _1487 + _1499;
        float _1503 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _1505 = _1491 + _1503;
        float _1507 = -_617;
        float _1509 = _1507 + _1465;
        float _1511 = -_579;
        float _1513 = _1511 + _1463;
        float _1515 = _1501 * _1501;
        float _1517 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _1519 = _1495 + _1517;
        float _1521 = 1.0 / _907;
        float _1523 = fma(_1505, _1505, _1515);
        float _1525 = fma(_1519, _1519, _1523);
        float _1527 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1529 = sqrt(_1525);
        float _1531 = _1527 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1533 = precise::min(_1529, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1535 = _1533 * _1497;
        float _1537 = _1535 * _1521;
        float _1539 = -_595;
        float _1541 = _1539 + _1461;
        float _1543 = _1531 * _1537;
        float _1545 = _1509 * _1537;
        float _1547 = fma(_1541, _1543, _1491);
        float _1549 = fma(_1513, _1543, _1487);
        float _1551 = fma(_1531, _1545, _1495);
        _1479 = _1549;
        _1481 = _1547;
        _1483 = _1551;
        _627 = _1545;
        _855 = _1543;
    }
    float _1553 = _1479;
    float _1555 = _1481;
    float _1557 = _1483;
    float _1559 = _627;
    float _1561 = _855;
    float _1563 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1565 = _1553 + _1563;
    float _1567 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1569 = _1555 + _1567;
    float _1571 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1573 = _1557 + _1571;
    float _1575 = _1565 * _1565;
    float _1577 = fma(_1569, _1569, _1575);
    float _1579 = fma(_1573, _1573, _1577);
    float _1581 = rsqrt(_1579);
    float _1583 = _1581 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1585 = _1569 * _1583;
    float _1587 = _1573 * _1583;
    float _1589 = _1585 * _1585;
    float _1591 = _1587 * _1587;
    float _1593 = _1589 + _1591;
    float _1595 = sqrt(_1593);
    bool _1597 = _1595 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1599 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1601 = _1595 + _1599;
    float _1603 = _1573;
    float _1605 = _1581;
    float _1607 = _1601;
    float _1609 = _1559;
    float _1611 = _1583;
    float _1613 = _1585;
    if (_1597)
    {
        float _1615 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1603 = _1615;
    }
    float _1617 = _1603;
    if (_1597)
    {
        float _1619 = rsqrt(_1593);
        _1605 = _1619;
    }
    float _1621 = _1605;
    float _1623 = _1621;
    if (_1597)
    {
        float _1625 = _1601 * _1617;
        _1607 = _1625;
    }
    float _1627 = _1607;
    if (_1597)
    {
        float _1629 = _1627 * 0.15915493667125701904296875;
        _1609 = _1629;
    }
    float _1631 = _1609;
    float _1633 = _1617;
    if (_1597)
    {
        float _1635 = _1631 * 6.283185482025146484375;
        float _1637 = sin(_1635);
        _1633 = _1637;
    }
    float _1639 = _1633;
    float _1641 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1643 = precise::max(0.0, _1641);
    float _1645 = _1561;
    float _1647 = _1643;
    if (_1597)
    {
        float _1649 = _1631 * 6.283185482025146484375;
        float _1651 = cos(_1649);
        _1645 = _1651;
    }
    float _1653 = _1645;
    float _1655 = -_1583;
    float _1657 = -_1643;
    float _1659 = fma(_1565, _1655, _1657);
    float _1661 = _1659;
    if (_1597)
    {
        float _1663 = _1659 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1647 = _1663;
    }
    float _1665 = _1647;
    float _1667 = sqrt(_1579);
    float _1669 = _1639;
    float _1671 = _1665;
    if (_1597)
    {
        float _1673 = fma(_1639, _1665, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1611 = _1673;
    }
    float _1675 = _1611;
    float _1677 = _1675;
    if (!_1597)
    {
        _1669 = _1587;
    }
    float _1679 = _1669;
    float _1681 = _1679;
    if (_1597)
    {
        float _1683 = _1653 + (-1.0);
        _1671 = _1683;
    }
    float _1685 = _1671;
    float _1687 = _1685;
    if (_1597)
    {
        float _1689 = _1621 * _1675;
        _1371 = _1689;
    }
    float _1691 = _1371;
    if (!_1597)
    {
        _1623 = _1659;
    }
    float _1693 = _1623;
    float _1695 = _1553 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1697 = _1693;
    if (_1597)
    {
        float _1699 = _1685 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1677 = _1699;
    }
    float _1701 = _1677;
    if (_1597)
    {
        float _1703 = _1585 * _1691;
        _1613 = _1703;
    }
    float _1705 = _1613;
    if (!_1597)
    {
        _1687 = _1589;
    }
    float _1707 = _1687;
    float _1709 = _1707;
    if (_1597)
    {
        float _1711 = _1587 * _1691;
        _1681 = _1711;
    }
    float _1713 = _1681;
    if (_1597)
    {
        float _1715 = fma(_1659, _1653, _1701);
        _1697 = _1715;
    }
    float _1717 = _1697;
    if (_1597)
    {
        float _1719 = _1705 * _1705;
        _1709 = _1719;
    }
    float _1721 = _1709;
    if (!_1597)
    {
        _1661 = _1591;
    }
    float _1723 = _1661;
    float _1725 = _1723;
    if (_1597)
    {
        float _1727 = _1713 * _1713;
        _1725 = _1727;
    }
    float _1729 = _1725;
    float _1731 = fma(_1717, _1717, _1721);
    float _1733 = fma(_1555, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1695);
    float _1735 = _1731 + _1729;
    float _1737 = _1553 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1739 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1741 = fma(_1667, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1739);
    float _1743 = precise::clamp(_1741, 0.0, 1.0);
    float _1745 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _1747 = fma(_1555, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1737);
    float _1749 = rsqrt(_1735);
    float _1751 = _1553 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1753 = -_1743;
    float _1755 = _1753 + 1.0;
    float _1757 = fma(_1557, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1747);
    float _1759 = _1553 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1761 = fma(_1555, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1751);
    float _1763 = _1757 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1765 = fma(_1555, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1759);
    float _1767 = fma(_1557, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1761);
    float _1769 = abs(_1755);
    float _1771 = log2(_1769);
    float _1773 = _1763 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1775 = fma(_1557, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1765);
    float _1777 = _1767 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1779 = -_1773;
    float _1781 = fma(_1779, _1745, 1.0);
    float _1783 = _1749 * _1705;
    float _1785 = fma(_1557, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1733);
    float _1787 = _1775 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1789 = _1777 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1791 = _1749 * _1717;
    float _1793 = _1783 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1795 = _1749 * _1713;
    float _1797 = fma(_1787, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1789);
    float _1799 = _1785 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1801 = -_1793;
    float _1803 = fma(_1791, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1801);
    float _1805 = _1771 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1807 = fma(_1763, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1797);
    float _1809 = log2(_1781);
    float _1811 = -_1795;
    float _1813 = fma(_1811, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1803);
    float _1815 = _1777 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1817 = fma(_1799, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1807);
    float _1819 = _1777 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1821 = fma(_1813, -0.5, 0.5);
    float _1823 = fma(_1787, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1815);
    float _1825 = fma(_1813, 0.5, 0.5);
    float _1827 = exp2(_1805);
    float _1829 = fma(_1787, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1819);
    float _1831 = fma(_1763, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1823);
    float _1833 = _1791 + 1.0;
    float _1835 = fma(_1825, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1837 = fma(_1763, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1829);
    float _1839 = fma(_1799, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1831);
    float _1841 = 1.0 / _1817;
    float _1843 = fma(_1799, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1837);
    float _1845 = fma(_1825, _1835, -0.212114393711090087890625);
    float _1847 = _1809 * 0.693147182464599609375;
    float _1849 = fma(_1825, _1845, 1.570728778839111328125);
    float _1851 = _1847 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1853 = sqrt(_1821);
    float _1855 = -_1791;
    float _1857 = fma(_1827, _1833, _1855);
    float _1859 = fma(_1857, 0.5, 0.5);
    float _1861 = _1839 * _1841;
    float _1863 = _1843 * _1841;
    float _1865 = fma(_1861, 0.5, 0.5);
    float _1867 = fma(_1863, -0.5, 0.5);
    float _1869 = _1853 * 0.636619746685028076171875;
    float3 _4874 = float3(_1865, _1867, _1851);
    float _1871 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_4874, float3(0.0), isnan(_4874)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_4874, float3(0.0), isnan(_4874)), level(0.0)).x;
    float _1873 = -_1849;
    float _1875 = fma(_1869, _1873, 1.0);
    float3 _4890 = float3(_1865, _1867, _1851);
    float4 _1878 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_4890, float3(0.0), isnan(_4890)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_4890, float3(0.0), isnan(_4890)), level(0.0)).xyzw;
    float _1880 = _1878.x;
    float _1882 = _1878.y;
    float _1884 = _1878.z;
    float _1886 = _1878.w;
    float2 _4907 = float2(_1875, _1859);
    float3 _1890 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_4907, float2(0.0), isnan(_4907)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_4907, float2(0.0), isnan(_4907)), level(0.0)).xyz;
    float _1892 = _1890.x;
    float _1894 = _1890.y;
    float _1896 = _1890.z;
    float _1898 = _1771 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _1900 = _1777 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1902 = fma(_1787, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1900);
    float _1904 = exp2(_1898);
    float _1906 = fma(_1763, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1902);
    float _1908 = fma(_1799, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1906);
    float _1910 = _1908 + _1817;
    out.gl_Position.x = _1839;
    out.gl_Position.y = _1843;
    out.gl_Position.z = _1908;
    out.gl_Position.w = _1817;
    float _1912 = _1910 * 0.5;
    float _1914 = -_1904;
    float _1916 = _1914 + 1.0;
    float _1918 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _1920 = _1916 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    out.m_71.z = _1912;
    out.m_71.w = _1817;
    out.m_47.x = _1918;
    float _1922 = _1920 * _1871;
    float _1924 = -_1920;
    float _1926 = _1924 + 1.0;
    float _1928 = _1886 * _1922;
    float _1930 = _1886 * _1926;
    float _1932 = _1896 * _1922;
    float _1934 = fma(_1892, _1928, _1880);
    float _1936 = fma(_1894, _1928, _1882);
    float _1938 = fma(_1886, _1932, _1884);
    out.m_73.x = _1934;
    out.m_73.y = _1936;
    out.m_73.z = _1938;
    out.m_73.w = _1930;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_55.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_55.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_55.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_55.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

