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
    constant _16* vp_c10 [[id(1)]];
    constant _16* vp_c8 [[id(2)]];
    constant _16* vp_c15 [[id(3)]];
    constant _16* vp_c16 [[id(4)]];
    constant _16* vp_c13 [[id(5)]];
    constant _16* vp_c7 [[id(6)]];
    texture2d<float> vp_t_tcb_20 [[id(7)]];
    sampler vp_t_tcb_20Smplr [[id(8)]];
    texture2d<float> vp_t_tcb_24 [[id(9)]];
    sampler vp_t_tcb_24Smplr [[id(10)]];
    texture3d<float> vp_t_tcb_32 [[id(11)]];
    sampler vp_t_tcb_32Smplr [[id(12)]];
    texture3d<float> vp_t_tcb_30 [[id(13)]];
    sampler vp_t_tcb_30Smplr [[id(14)]];
    texture2d<float> vp_t_tcb_1C [[id(15)]];
    sampler vp_t_tcb_1CSmplr [[id(16)]];
    sampler vp_t_tcb_20Smplr_w [[id(17)]];
    sampler vp_t_tcb_24Smplr_w [[id(18)]];
    sampler vp_t_tcb_32Smplr_w [[id(19)]];
    sampler vp_t_tcb_30Smplr_w [[id(20)]];
    sampler vp_t_tcb_1CSmplr_w [[id(21)]];
    constant dm_border_t* dm_border [[id(22)]];
};

struct main0_out
{
    float4 m_74 [[user(locn0)]];
    float4 m_76 [[user(locn1)]];
    float4 m_57 [[user(locn2)]];
    float4 m_112 [[user(locn3)]];
    float4 m_55 [[user(locn4)]];
    float4 m_86 [[user(locn5)]];
    float4 m_104 [[user(locn6)]];
    float4 m_78 [[user(locn7)]];
    float4 m_84 [[user(locn8)]];
    float4 m_96 [[user(locn9)]];
    float4 m_82 [[user(locn10)]];
    float4 m_94 [[user(locn11)]];
    float4 m_90 [[user(locn12)]];
    float4 m_98 [[user(locn13)]];
    float4 m_100 [[user(locn14)]];
    float4 m_88 [[user(locn15)]];
    float4 m_110 [[user(locn16)]];
    float4 m_92 [[user(locn17)]];
    float4 m_106 [[user(locn18)]];
    float4 m_108 [[user(locn19)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_102 [[attribute(0)]];
    float4 m_64 [[attribute(1)]];
    float4 m_66 [[attribute(2)]];
    float4 m_68 [[attribute(3)]];
    float4 m_80 [[attribute(4)]];
    float4 m_62 [[attribute(5)]];
    float4 m_50 [[attribute(6)]];
    float4 m_52 [[attribute(7)]];
    float4 m_70 [[attribute(8)]];
    float4 m_72 [[attribute(9)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_74 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_76 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_57 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_112 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_55 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_86 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_104 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_78 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_84 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_96 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_82 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_94 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_90 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_98 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_100 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_88 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_110 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_92 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_106 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_108 = float4(0.0, 0.0, 0.0, 1.0);
    bool _5223 = false;
    bool _4302 = false;
    bool _739 = false;
    bool _565 = false;
    bool _459 = false;
    bool _271 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _126 = in.m_50.w;
    float _128 = in.m_52.w;
    float _130 = trunc(_126);
    int _133 = int(_130);
    float _135 = -_128;
    float _137 = _135 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    out.m_55.y = _137;
    bool _141 = _133 >= 1;
    float _143 = 0.0;
    float _145 = _128;
    float _147 = _137;
    if (!_141)
    {
        _143 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _149 = _143;
    if (!_141)
    {
        out.m_57.x = 0.0;
    }
    int _151 = 0;
    if (!_141)
    {
        float _153 = _149 * 5.0;
        _151 = as_type<int>(_153);
    }
    int _155 = _151;
    int _157 = _155;
    if (!_141)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _5533 = as_type<float>(_155);
        out.gl_Position.z = _5533;
    }
    if (!_141)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    bool _159 = _128 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _161 = isnan(_128);
    bool _163 = _159 || _161;
    bool _165 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _167 = _163 || _165;
    float _169 = float(_133);
    bool _171 = _137 >= _169;
    bool _173 = !_167;
    bool _175 = _171 || _173;
    float _177 = 1.0 / _169;
    if (_175)
    {
        _145 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _179 = _145;
    if (_175)
    {
        out.m_57.x = 0.0;
    }
    float _181 = _137 * _177;
    float _183 = _181;
    if (_175)
    {
        float _185 = _179 * 5.0;
        _157 = as_type<int>(_185);
    }
    int _187 = _157;
    out.m_55.x = _181;
    if (_175)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _5596 = as_type<float>(_187);
        out.gl_Position.z = _5596;
    }
    if (_175)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _189 = as_type<float>(int(gl_VertexIndex));
    float _191 = in.m_62.x;
    float _193 = in.m_62.y;
    float _195 = in.m_62.z;
    float _197 = in.m_64.x;
    float _199 = in.m_64.y;
    float _201 = in.m_64.z;
    float _203 = in.m_66.x;
    float _205 = in.m_66.y;
    float _207 = in.m_66.z;
    float _209 = in.m_68.x;
    float _211 = in.m_68.y;
    float _213 = in.m_68.z;
    int _215 = as_type<int>(_189) & 1;
    bool _217 = _215 != 0;
    int _219 = as_type<int>(_189) & 2;
    bool _221 = _219 != 0;
    bool _223 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    bool _225 = !_217;
    float _227 = _225 ? (-0.5) : 0.5;
    bool _229 = !_221;
    float _231 = _229 ? (-0.5) : 0.5;
    float _233 = _193 * _199;
    float _235 = _193 * _205;
    float _237 = fma(_191, _197, _233);
    float _239 = _193 * _211;
    float _241 = fma(_191, _203, _235);
    float _243 = fma(_195, _201, _237);
    float _245 = fma(_191, _209, _239);
    float _247 = fma(_195, _207, _241);
    float _249 = fma(_195, _213, _245);
    bool _251 = !_223;
    float _269;
    if (!_251)
    {
        float _253 = in.m_70.x;
        float _255 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _257 = _253 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _259 = fma(_257, (*spvDescriptorSet0.vp_c9)._m0[12].x, _137);
        float _261 = _259 * _255;
        float _263 = floor(_261);
        float _265 = -_263;
        float _267 = _261 + _265;
        _269 = _267;
        _271 = true;
    }
    else
    {
        _269 = _181;
    }
    _271 = false;
    float _273 = _269;
    float _275 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _277 = _273 + _275;
    float _279 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _281 = _273 + _279;
    float _283 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _285 = _273 + _283;
    float _287 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _289 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _287;
    float _291 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _293 = _291 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _295 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _297 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _295;
    bool _299 = _273 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _301 = isnan(_273);
    bool _303 = _299 || _301;
    bool _305 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _307 = _303 || _305;
    float _309 = float(_307);
    float _311 = 1.0 / _289;
    bool _313 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _315 = 1.0 / _297;
    float _317 = 1.0 / _293;
    float _319 = _277 * _311;
    bool _321 = _273 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _323 = isnan(_273);
    bool _325 = _321 || _323;
    bool _327 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _329 = _325 || _327;
    float _331 = float(_329);
    float _333 = -_309;
    float _335 = _333 + 1.0;
    float _337 = _331 * _335;
    float _339 = _281 * _315;
    bool _341 = _273 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _343 = isnan(_273);
    bool _345 = _341 || _343;
    bool _347 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _349 = _345 || _347;
    float _351 = float(_349);
    float _353 = -_331;
    float _355 = _353 + 1.0;
    float _357 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _359 = _357 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _361 = _351 * _355;
    float _363 = -_351;
    float _365 = _363 + 1.0;
    float _367 = _285 * _317;
    bool _369 = _273 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _371 = isnan(_273);
    bool _373 = _369 || _371;
    bool _375 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _377 = _373 || _375;
    float _379 = float(_377);
    float _381 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _383 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _381;
    float _385 = fma(_359, _367, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _387 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _389 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _387;
    float _391 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _393 = _391 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _395 = fma(_383, _319, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _397 = _379 * _365;
    float _399 = fma(_389, _319, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _401 = fma(_393, _367, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _403 = -_379;
    float _405 = _403 + 1.0;
    float _407 = _395 * _397;
    float _409 = _399 * _397;
    float _411 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _413 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _411;
    float _415 = fma(_405, (*spvDescriptorSet0.vp_c9)._m0[143].x, _407);
    float _417 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _419 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _417;
    float _421 = fma(_405, (*spvDescriptorSet0.vp_c9)._m0[143].y, _409);
    float _423 = fma(_413, _339, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _425 = fma(_385, _361, _415);
    float _427 = fma(_419, _339, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _429 = fma(_401, _361, _421);
    float _431 = fma(_423, _337, _425);
    float _433 = fma(_427, _337, _429);
    float _435 = fma(_309, (*spvDescriptorSet0.vp_c9)._m0[146].x, _431);
    float _437 = fma(_309, (*spvDescriptorSet0.vp_c9)._m0[146].y, _433);
    bool _439 = !_313;
    float _457;
    if (!_439)
    {
        float _441 = in.m_70.x;
        float _443 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _445 = _441 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _447 = fma(_445, (*spvDescriptorSet0.vp_c9)._m0[11].y, _137);
        float _449 = _447 * _443;
        float _451 = floor(_449);
        float _453 = -_451;
        float _455 = _449 + _453;
        _457 = _455;
        _459 = true;
    }
    else
    {
        _457 = _181;
    }
    _459 = false;
    float _461 = _457;
    float _463 = in.m_72.x;
    float _465 = in.m_72.y;
    bool _467 = _461 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _469 = isnan(_461);
    bool _471 = _467 || _469;
    bool _473 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _475 = _471 || _473;
    float _477 = float(_475);
    float _479 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _481 = _479 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _483 = _461 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _485 = isnan(_461);
    bool _487 = _483 || _485;
    bool _489 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _491 = _487 || _489;
    float _493 = float(_491);
    float _495 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _497 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _495;
    float _499 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _501 = _461 + _499;
    float _503 = -_477;
    float _505 = _503 + 1.0;
    bool _507 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _509 = 1.0 / _481;
    float _511 = _493 * _505;
    float _513 = -_493;
    float _515 = _513 + 1.0;
    float _517 = _437 * _465;
    float _519 = _435 * _463;
    float _521 = _497 * _509;
    float _523 = fma(_521, _501, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _525 = _523 * _511;
    float _527 = fma(_515, (*spvDescriptorSet0.vp_c9)._m0[115].x, _525);
    float _529 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _531 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _533 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _535 = fma(_477, (*spvDescriptorSet0.vp_c9)._m0[116].x, _527);
    float _537 = _529 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _539 = _531 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _541 = _533 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _543 = _535 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    out.m_74.x = _537;
    out.m_74.y = _539;
    out.m_74.z = _541;
    out.m_74.w = _543;
    bool _545 = !_507;
    float _563;
    if (!_545)
    {
        float _547 = in.m_70.x;
        float _549 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _551 = _547 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _553 = fma(_551, (*spvDescriptorSet0.vp_c9)._m0[11].w, _137);
        float _555 = _553 * _549;
        float _557 = floor(_555);
        float _559 = -_557;
        float _561 = _555 + _559;
        _563 = _561;
        _565 = true;
    }
    else
    {
        _563 = _181;
    }
    _565 = false;
    float _567 = _563;
    float _569 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _571 = _567 + _569;
    float _573 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _575 = _573 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _577 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _579 = _577 + (*spvDescriptorSet0.vp_c9)._m0[133].w;
    bool _581 = _567 >= (*spvDescriptorSet0.vp_c9)._m0[133].w;
    bool _583 = isnan(_567);
    bool _585 = _581 || _583;
    bool _587 = isnan((*spvDescriptorSet0.vp_c9)._m0[133].w);
    bool _589 = _585 || _587;
    float _591 = float(_589);
    float _593 = -(*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _595 = _593 + (*spvDescriptorSet0.vp_c9)._m0[134].w;
    bool _597 = _567 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _599 = isnan(_567);
    bool _601 = _597 || _599;
    bool _603 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _605 = _601 || _603;
    float _607 = float(_605);
    float _609 = 1.0 / _575;
    float _611 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _613 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _611;
    float _615 = -_591;
    float _617 = _615 + 1.0;
    bool _619 = _567 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _621 = isnan(_567);
    bool _623 = _619 || _621;
    bool _625 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _627 = _623 || _625;
    float _629 = float(_627);
    bool _631 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[14].x;
    float _633 = 1.0 / _579;
    float _635 = 1.0 / _595;
    float _637 = _613 * _609;
    float _639 = -(*spvDescriptorSet0.vp_c9)._m0[132].x;
    float _641 = _639 + (*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _643 = _607 * _617;
    float _645 = -_607;
    float _647 = _645 + 1.0;
    float _649 = fma(_637, _571, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    float _651 = -(*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _653 = (*spvDescriptorSet0.vp_c9)._m0[134].x + _651;
    float _655 = _629 * _647;
    float _657 = _641 * _633;
    bool _659 = _567 >= (*spvDescriptorSet0.vp_c9)._m0[134].w;
    bool _661 = isnan(_567);
    bool _663 = _659 || _661;
    bool _665 = isnan((*spvDescriptorSet0.vp_c9)._m0[134].w);
    bool _667 = _663 || _665;
    float _669 = float(_667);
    float _671 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _673 = _567 + _671;
    float _675 = _649 * _655;
    float _677 = -_629;
    float _679 = _677 + 1.0;
    float _681 = -(*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _683 = _567 + _681;
    float _685 = fma(_657, _673, (*spvDescriptorSet0.vp_c9)._m0[132].x);
    float _687 = _653 * _635;
    float _689 = -_669;
    float _691 = _689 + 1.0;
    float _693 = fma(_679, (*spvDescriptorSet0.vp_c9)._m0[131].x, _675);
    float _695 = fma(_687, _683, (*spvDescriptorSet0.vp_c9)._m0[133].x);
    float _697 = _591 * _691;
    float _699 = fma(_685, _643, _693);
    float _701 = fma(_695, _697, _699);
    float _703 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _705 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _707 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _709 = fma(_669, (*spvDescriptorSet0.vp_c9)._m0[134].x, _701);
    float _711 = _705 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _713 = _703 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _715 = _707 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _717 = _709 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    out.m_76.x = _711;
    out.m_76.y = _713;
    out.m_76.z = _715;
    out.m_76.w = _717;
    bool _719 = !_631;
    float _737;
    if (!_719)
    {
        float _721 = in.m_70.x;
        float _723 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[14].x;
        float _725 = _721 * (*spvDescriptorSet0.vp_c9)._m0[15].x;
        float _727 = fma(_725, (*spvDescriptorSet0.vp_c9)._m0[14].x, _137);
        float _729 = _727 * _723;
        float _731 = floor(_729);
        float _733 = -_731;
        float _735 = _729 + _733;
        _737 = _735;
        _739 = true;
    }
    else
    {
        _737 = _181;
    }
    _739 = false;
    float _741 = _737;
    float _743 = -(*spvDescriptorSet0.vp_c9)._m0[159].w;
    float _745 = _741 + _743;
    bool _747 = _741 >= (*spvDescriptorSet0.vp_c9)._m0[165].w;
    bool _749 = isnan(_741);
    bool _751 = _747 || _749;
    bool _753 = isnan((*spvDescriptorSet0.vp_c9)._m0[165].w);
    bool _755 = _751 || _753;
    float _757 = float(_755);
    float _759 = -(*spvDescriptorSet0.vp_c9)._m0[159].w;
    float _761 = _759 + (*spvDescriptorSet0.vp_c9)._m0[160].w;
    bool _763 = _741 >= (*spvDescriptorSet0.vp_c9)._m0[164].w;
    bool _765 = isnan(_741);
    bool _767 = _763 || _765;
    bool _769 = isnan((*spvDescriptorSet0.vp_c9)._m0[164].w);
    bool _771 = _767 || _769;
    float _773 = float(_771);
    float _775 = -(*spvDescriptorSet0.vp_c9)._m0[159].x;
    float _777 = (*spvDescriptorSet0.vp_c9)._m0[160].x + _775;
    bool _779 = _741 >= (*spvDescriptorSet0.vp_c9)._m0[163].w;
    bool _781 = isnan(_741);
    bool _783 = _779 || _781;
    bool _785 = isnan((*spvDescriptorSet0.vp_c9)._m0[163].w);
    bool _787 = _783 || _785;
    float _789 = float(_787);
    float _791 = -_757;
    float _793 = _791 + 1.0;
    float _795 = 1.0 / _761;
    float _797 = _773 * _793;
    float _799 = -_789;
    float _801 = _799 + 1.0;
    float _803 = -(*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _805 = _803 + (*spvDescriptorSet0.vp_c9)._m0[161].w;
    bool _807 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[14].y;
    float _809 = 1.0 / _805;
    float _811 = _777 * _795;
    float _813 = -_773;
    float _815 = _813 + 1.0;
    bool _817 = _741 >= (*spvDescriptorSet0.vp_c9)._m0[162].w;
    bool _819 = isnan(_741);
    bool _821 = _817 || _819;
    bool _823 = isnan((*spvDescriptorSet0.vp_c9)._m0[162].w);
    bool _825 = _821 || _823;
    float _827 = float(_825);
    float _829 = fma(_811, _745, (*spvDescriptorSet0.vp_c9)._m0[159].x);
    float _831 = _789 * _815;
    bool _833 = _741 >= (*spvDescriptorSet0.vp_c9)._m0[161].w;
    bool _835 = isnan(_741);
    bool _837 = _833 || _835;
    bool _839 = isnan((*spvDescriptorSet0.vp_c9)._m0[161].w);
    bool _841 = _837 || _839;
    float _843 = float(_841);
    float _845 = _827 * _801;
    float _847 = -_827;
    float _849 = _847 + 1.0;
    float _851 = -(*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _853 = _851 + (*spvDescriptorSet0.vp_c9)._m0[162].w;
    bool _855 = _741 >= (*spvDescriptorSet0.vp_c9)._m0[160].w;
    bool _857 = isnan(_741);
    bool _859 = _855 || _857;
    bool _861 = isnan((*spvDescriptorSet0.vp_c9)._m0[160].w);
    bool _863 = _859 || _861;
    float _865 = float(_863);
    float _867 = _843 * _849;
    float _869 = -_843;
    float _871 = _869 + 1.0;
    float _873 = -(*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _875 = _873 + (*spvDescriptorSet0.vp_c9)._m0[163].w;
    bool _877 = _741 >= (*spvDescriptorSet0.vp_c9)._m0[159].w;
    bool _879 = isnan(_741);
    bool _881 = _877 || _879;
    bool _883 = isnan((*spvDescriptorSet0.vp_c9)._m0[159].w);
    bool _885 = _881 || _883;
    float _887 = float(_885);
    float _889 = 1.0 / _853;
    float _891 = _865 * _871;
    float _893 = -_865;
    float _895 = _893 + 1.0;
    float _897 = 1.0 / _875;
    float _899 = -(*spvDescriptorSet0.vp_c9)._m0[160].x;
    float _901 = _899 + (*spvDescriptorSet0.vp_c9)._m0[161].x;
    float _903 = _887 * _895;
    float _905 = -(*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _907 = _905 + (*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _909 = _901 * _809;
    float _911 = _829 * _903;
    float _913 = -_887;
    float _915 = _913 + 1.0;
    float _917 = 1.0 / _907;
    float _919 = -(*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _921 = _919 + (*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _923 = -(*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _925 = _741 + _923;
    float _927 = -(*spvDescriptorSet0.vp_c9)._m0[161].x;
    float _929 = (*spvDescriptorSet0.vp_c9)._m0[162].x + _927;
    float _931 = fma(_915, (*spvDescriptorSet0.vp_c9)._m0[159].x, _911);
    float _933 = -(*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _935 = _933 + (*spvDescriptorSet0.vp_c9)._m0[166].w;
    float _937 = fma(_909, _925, (*spvDescriptorSet0.vp_c9)._m0[160].x);
    float _939 = _929 * _889;
    float _941 = 1.0 / _921;
    float _943 = -(*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _945 = _741 + _943;
    float _947 = -(*spvDescriptorSet0.vp_c9)._m0[162].x;
    float _949 = _947 + (*spvDescriptorSet0.vp_c9)._m0[163].x;
    float _951 = fma(_937, _891, _931);
    float _953 = fma(_939, _945, (*spvDescriptorSet0.vp_c9)._m0[161].x);
    float _955 = -(*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _957 = _741 + _955;
    float _959 = _949 * _897;
    float _961 = 1.0 / _935;
    float _963 = -(*spvDescriptorSet0.vp_c9)._m0[163].x;
    float _965 = (*spvDescriptorSet0.vp_c9)._m0[164].x + _963;
    float _967 = -(*spvDescriptorSet0.vp_c9)._m0[164].x;
    float _969 = _967 + (*spvDescriptorSet0.vp_c9)._m0[165].x;
    float _971 = fma(_953, _867, _951);
    float _973 = _965 * _917;
    float _975 = fma(_959, _957, (*spvDescriptorSet0.vp_c9)._m0[162].x);
    float _977 = -(*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _979 = _741 + _977;
    float _981 = _969 * _941;
    float _983 = -(*spvDescriptorSet0.vp_c9)._m0[165].x;
    float _985 = (*spvDescriptorSet0.vp_c9)._m0[166].x + _983;
    bool _987 = _741 >= (*spvDescriptorSet0.vp_c9)._m0[166].w;
    bool _989 = isnan(_741);
    bool _991 = _987 || _989;
    bool _993 = isnan((*spvDescriptorSet0.vp_c9)._m0[166].w);
    bool _995 = _991 || _993;
    int _997 = _995 ? 1065353216 : 0;
    float _999 = -(*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _1001 = _741 + _999;
    float _1003 = fma(_973, _979, (*spvDescriptorSet0.vp_c9)._m0[163].x);
    float _1005 = fma(_975, _845, _971);
    float _1007 = -(*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _1009 = _741 + _1007;
    float _1011 = fma(_981, _1001, (*spvDescriptorSet0.vp_c9)._m0[164].x);
    float _1013 = _985 * _961;
    float _1015 = -as_type<float>(_997);
    float _1017 = _1015 + 1.0;
    float _1019 = fma(_1003, _831, _1005);
    float _1021 = fma(_1013, _1009, (*spvDescriptorSet0.vp_c9)._m0[165].x);
    float _1023 = _757 * _1017;
    float _1025 = fma(_1011, _797, _1019);
    float _1027 = fma(_1021, _1023, _1025);
    float _1029 = fma(as_type<float>(_997), (*spvDescriptorSet0.vp_c9)._m0[166].x, _1027);
    out.m_78.x = _1029;
    bool _1031 = !_807;
    float _1033 = _1021;
    int _1035 = _997;
    int _1037 = as_type<int>(_981);
    float _1039 = _1029;
    float _1041 = _971;
    float _1043 = _941;
    if (!_1031)
    {
        float _1045 = in.m_70.x;
        float _1047 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[14].y;
        float _1049 = _1045 * (*spvDescriptorSet0.vp_c9)._m0[15].y;
        float _1051 = fma(_1049, (*spvDescriptorSet0.vp_c9)._m0[14].y, _137);
        float _1053 = _1051 * _1047;
        float _1055 = floor(_1053);
        float _1057 = -_1055;
        float _1059 = _1053 + _1057;
        _1033 = _1047;
        _183 = _1059;
    }
    float _1061 = _1033;
    float _1063 = _183;
    float _1065 = in.m_70.z;
    float _1067 = in.m_70.w;
    int _1069 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _1071 = _1069 != 0;
    float _1073 = (*spvDescriptorSet0.vp_c9)._m0[7].z;
    float _1075 = _1061;
    if (_1071)
    {
        float _1077 = in.m_70.x;
        float _1079 = in.m_70.y;
        _1073 = _1077;
        _1075 = _1079;
    }
    float _1081 = _1073;
    float _1083 = _1075;
    float _1085 = 0.0;
    if (_1071)
    {
        _1085 = 1.0;
    }
    float _1087 = _1085;
    float _1089 = 0.0;
    float _1091 = _1087;
    if (_1071)
    {
        _1089 = 1.0;
    }
    float _1093 = _1089;
    float _1095 = _1093;
    if (_1071)
    {
        _1035 = 0;
    }
    int _1097 = _1035;
    float _1099 = _1065 * 2.0;
    int _1101 = _1097;
    if (_1071)
    {
        _1037 = 0;
    }
    int _1103 = _1037;
    float _1105 = floor(_1099);
    float _1107 = 0.0;
    float _1109 = _1083;
    int _1111 = _1103;
    float _1113 = _1081;
    if (_1071)
    {
        _1107 = _1081;
    }
    float _1115 = _1107;
    bool _1117 = _1105 > 0.0;
    bool _1119 = _1105 >= 0.0;
    bool _1121 = isnan(_1105);
    bool _1123 = _1119 || _1121;
    bool _1125 = isnan(0.0);
    bool _1127 = _1123 || _1125;
    float _1129 = _1105;
    float _1131 = _1115;
    if (_1071)
    {
        _1039 = _1115;
    }
    float _1133 = _1039;
    float _1135 = _1127 ? 0.0 : 1.4012984643248170709237295832899e-45;
    float _1137 = _1135;
    float _1139 = _1133;
    if (_1071)
    {
        _1129 = _1115;
    }
    float _1141 = _1129;
    int _1143 = ~as_type<int>(_1135);
    int _1145 = _1143 + 1;
    int _1147 = _1145 + 1;
    int _1149 = _1147;
    float _1151 = _1141;
    if (!_1117)
    {
        int _1153 = ~as_type<int>(_1135);
        int _1155 = _1153 + 1;
        _1149 = _1155;
    }
    int _1157 = _1149;
    if (_1071)
    {
        _1137 = _1083;
    }
    float _1159 = _1137;
    float _1161 = _1159;
    if (!_1071)
    {
        float _1163 = in.m_70.x;
        float _1165 = in.m_70.y;
        float _1167 = in.m_70.z;
        float _1169 = _1163 * 3.1415927410125732421875;
        float _1171 = _1169 * 0.15915493667125701904296875;
        float _1173 = _1165 * 3.1415927410125732421875;
        float _1175 = _1173 * 0.15915493667125701904296875;
        float _1177 = _1171 * 6.283185482025146484375;
        float _1179 = sin(_1177);
        float _1181 = _1175 * 6.283185482025146484375;
        float _1183 = sin(_1181);
        _1109 = _1165;
        _1101 = 1;
        _1111 = 2;
        _1113 = _1163;
        _1139 = _1179;
        _1161 = _1183;
        _1095 = 5.839270114898681640625;
        _1151 = _1167;
        _1091 = 7.345489978790283203125;
        _1131 = _1165;
    }
    float _1185 = _1109;
    int _1187 = _1101;
    int _1189 = _1111;
    float _1191 = _1113;
    float _1193 = _1139;
    float _1195 = _1161;
    float _1197 = _1095;
    float _1199 = _1151;
    float _1201 = _1091;
    float _1203 = _1131;
    float _1205 = _1185 * 2.0;
    bool _1207 = _1187 != 1;
    float _1209 = _1185 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _1211 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _1213 = floor(_1205);
    bool _1215 = _1189 != 2;
    float _1217 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _1219 = fma(_1209, -2.0, _1211);
    float _1221 = _1191 * 2.0;
    float _1223 = (*spvDescriptorSet0.vp_c9)._m0[93].z + (*spvDescriptorSet0.vp_c9)._m0[93].x;
    bool _1225 = _1065 > 0.5;
    float _1227 = floor(_1221);
    float _1229 = _1191 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    int _1231 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _1233 = _1231 != 0;
    int _1235 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16;
    bool _1237 = _1235 != 0;
    int _1239 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32;
    bool _1241 = _1239 != 0;
    float _1243 = _1193 * (*spvDescriptorSet0.vp_c9)._m0[92].x;
    bool _1245 = _1185 > 0.5;
    float _1247 = fma(_1193, (*spvDescriptorSet0.vp_c9)._m0[93].z, _1223);
    float _1249 = -_231;
    float _1251 = _1225 ? _1249 : _231;
    float _1253 = (*spvDescriptorSet0.vp_c9)._m0[92].x + (*spvDescriptorSet0.vp_c9)._m0[91].z;
    float _1255 = -_227;
    int _1257 = _1245 ? as_type<int>(_1255) : as_type<int>(_227);
    float _1259 = -_1217;
    float _1261 = fma(_1229, 2.0, _1259);
    bool _1263 = !_1241;
    float _1265 = _1263 ? _231 : _1251;
    float _1267 = -_1253;
    float _1269 = fma(_1243, 2.0, _1267);
    bool _1271 = !_1237;
    float _1273 = _1271 ? _227 : as_type<float>(_1257);
    float _1275 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _1277 = log2(_1275);
    bool _1279 = _1213 >= 0.0;
    bool _1281 = isnan(_1213);
    bool _1283 = _1279 || _1281;
    bool _1285 = isnan(0.0);
    bool _1287 = _1283 || _1285;
    float _1289 = _1195 * (*spvDescriptorSet0.vp_c9)._m0[92].y;
    bool _1291 = _1227 >= 0.0;
    bool _1293 = isnan(_1227);
    bool _1295 = _1291 || _1293;
    bool _1297 = isnan(0.0);
    bool _1299 = _1295 || _1297;
    float _1301 = _1185 + _1191;
    float _1303 = _177 * _137;
    float _1305 = _1243;
    float _1307 = _1223;
    float _1309 = _1195;
    float _1311 = _1251;
    if (!_1207)
    {
        _1041 = _1065;
    }
    float _1313 = _1041;
    float _1315 = _1301 + (-1.0);
    float _1317 = _1313;
    if (!_1207)
    {
        _1305 = _1065;
    }
    float _1319 = _1305;
    float _1321 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _1323 = int(_1321);
    float _1325 = _1319;
    if (!_1207)
    {
        _1307 = _1185;
    }
    float _1327 = _1307;
    float _1329 = fma(_137, (*spvDescriptorSet0.vp_c9)._m0[92].z, _1247);
    float _1331 = _1327;
    if (!_1207)
    {
        _1043 = _1185;
    }
    float _1333 = _1043;
    float _1335 = -_137;
    float _1337 = fma(_1335, (*spvDescriptorSet0.vp_c9)._m0[76].x, _1261);
    float _1339 = _1277 * _137;
    float _1341 = _1333;
    if (_1207)
    {
        _1317 = _1185;
    }
    float _1343 = _1317;
    float _1345 = -_137;
    float _1347 = fma(_1345, (*spvDescriptorSet0.vp_c9)._m0[91].x, _1269);
    if (_1207)
    {
        _1325 = _1185;
    }
    float _1349 = _1325;
    float _1351 = (*spvDescriptorSet0.vp_c9)._m0[92].y + (*spvDescriptorSet0.vp_c9)._m0[91].w;
    if (_1207)
    {
        _1331 = _1191;
    }
    float _1353 = _1331;
    float _1355 = _1343 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    if (_1207)
    {
        _1341 = _1191;
    }
    float _1357 = _1341;
    float _1359 = fma(_1289, -2.0, _1351);
    int _1361 = _1299 ? 0 : 1;
    float _1363 = exp2(_1339);
    int _1365 = _1287 ? 0 : 1;
    float _1367 = _517 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    int _1369 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _1371 = _1369 != 0;
    int _1373 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _1375 = _1373 != 0;
    int _1377 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _1379 = _1377 != 0;
    float _1381 = _519 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1383 = in.m_64.w;
    bool _1385 = !_1375;
    int _1387 = _1385 ? 0 : 1;
    float _1389 = (*spvDescriptorSet0.vp_c9)._m0[93].w + (*spvDescriptorSet0.vp_c9)._m0[93].y;
    bool _1391 = !_1371;
    int _1393 = _1391 ? 0 : 1;
    float _1395 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    bool _1397 = !_1379;
    int _1399 = _1397 ? 0 : 1;
    float _1401 = fma(_1195, (*spvDescriptorSet0.vp_c9)._m0[93].w, _1389);
    int _1403 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 4096;
    bool _1405 = _1403 != 0;
    int _1407 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 8192;
    bool _1409 = _1407 != 0;
    int _1411 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16384;
    bool _1413 = _1411 != 0;
    float _1415 = fma(_1357, (*spvDescriptorSet0.vp_c9)._m0[83].z, _1395);
    if (_1215)
    {
        _1309 = _1185;
    }
    float _1417 = _1309;
    float _1419 = -_1363;
    float _1421 = _1419 + 1.0;
    float _1423 = _1417;
    if (_1215)
    {
        _1311 = _1191;
    }
    float _1425 = _1311;
    float _1427 = fma(_137, (*spvDescriptorSet0.vp_c9)._m0[92].w, _1401);
    bool _1429 = !_1409;
    int _1431 = _1429 ? 0 : 1;
    bool _1433 = !_1405;
    int _1435 = _1433 ? 0 : 1;
    bool _1437 = !_1413;
    int _1439 = _1437 ? 0 : 1;
    float _1441 = _1425;
    if (!_1215)
    {
        _1441 = _1065;
    }
    float _1443 = _1441;
    if (!_1215)
    {
        _1423 = _1191;
    }
    float _1445 = _1423;
    int _1447 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _1449 = _1447 != 0;
    int _1451 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _1453 = _1451 != 0;
    int _1455 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _1457 = _1455 != 0;
    float _1459 = _1443 * (*spvDescriptorSet0.vp_c9)._m0[87].x;
    bool _1461 = _1227 > 0.0;
    float _1463 = _1353 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _1465 = _1445 * (*spvDescriptorSet0.vp_c9)._m0[87].y;
    float _1467 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    bool _1469 = !_1449;
    int _1471 = _1469 ? 0 : 1;
    float _1473 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _1475 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    bool _1477 = _1213 > 0.0;
    float _1479 = -_1467;
    float _1481 = fma(_1463, 2.0, _1479);
    float _1483 = fma(_1315, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _1485 = fma(_1349, (*spvDescriptorSet0.vp_c9)._m0[83].w, _1473);
    float _1487 = fma(_1355, -2.0, _1475);
    float _1489 = trunc((*spvDescriptorSet0.vp_c9)._m0[40].y);
    int _1491 = int(_1489);
    float _1493 = (*spvDescriptorSet0.vp_c9)._m0[87].x + (*spvDescriptorSet0.vp_c9)._m0[86].z;
    float _1495 = fma(_137, (*spvDescriptorSet0.vp_c9)._m0[76].y, _1219);
    int _1497 = abs(_1471);
    float _1499 = -_1493;
    float _1501 = fma(_1459, 2.0, _1499);
    float _1503 = float(_1323);
    float _1505 = (*spvDescriptorSet0.vp_c9)._m0[87].y + (*spvDescriptorSet0.vp_c9)._m0[86].w;
    float _1507 = trunc((*spvDescriptorSet0.vp_c9)._m0[49].y);
    int _1509 = int(_1507);
    int _1511 = ~_1361;
    int _1513 = _1511 + 1;
    int _1515 = _1513 + 1;
    float _1517 = fma(_1465, -2.0, _1505);
    int _1519 = _1515;
    if (!_1461)
    {
        int _1521 = ~_1361;
        int _1523 = _1521 + 1;
        _1519 = _1523;
    }
    int _1525 = _1519;
    float _1527 = in.m_80.x;
    float _1529 = in.m_80.y;
    float _1531 = in.m_80.z;
    bool _1533 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1535 = isnan(0.0);
    bool _1537 = _1533 || _1535;
    bool _1539 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1541 = _1537 || _1539;
    float _1543 = fma(_137, (*spvDescriptorSet0.vp_c9)._m0[91].y, _1359);
    float _1545 = float(_1491);
    float _1547 = 1.0 / _1503;
    float _1549 = -_137;
    float _1551 = fma(_1549, (*spvDescriptorSet0.vp_c9)._m0[81].x, _1481);
    float _1553 = _1541 ? _1421 : 0.0;
    float _1555 = float(_1509);
    float _1557 = 1.0 / _1545;
    float _1559 = float(_1157);
    float _1561 = float(_1497);
    bool _1563 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1565 = isnan(1.0);
    bool _1567 = _1563 || _1565;
    bool _1569 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1571 = _1567 || _1569;
    float _1573 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _1575 = 1.0 + _1573;
    int _1577 = ~_1365;
    int _1579 = _1577 + 1;
    int _1581 = _1579 + 1;
    float _1583 = 1.0 / _1555;
    int _1585 = _1581;
    if (!_1477)
    {
        int _1587 = ~_1365;
        int _1589 = _1587 + 1;
        _1585 = _1589;
    }
    int _1591 = _1585;
    float _1593 = _1561 * _1559;
    float _1595 = _1547 * _137;
    float _1597 = _1593 * (-2.0);
    float _1599 = 1.0 / _1575;
    float _1601 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    bool _1603 = !_1453;
    int _1605 = _1603 ? 0 : 1;
    float _1607 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _1609 = (*spvDescriptorSet0.vp_c9)._m0[88].z + (*spvDescriptorSet0.vp_c9)._m0[88].x;
    float _1611 = (*spvDescriptorSet0.vp_c9)._m0[88].w + (*spvDescriptorSet0.vp_c9)._m0[88].y;
    float _1613 = fma(_1597, _1527, _1527);
    float _1615 = _1557 * _137;
    float _1617 = fma(_137, (*spvDescriptorSet0.vp_c9)._m0[82].z, _1415);
    float _1619 = fma(_137, (*spvDescriptorSet0.vp_c9)._m0[81].y, _1487);
    int _1621 = abs(_1605);
    float _1623 = _1583 * _137;
    float _1625 = fma(_1185, (*spvDescriptorSet0.vp_c9)._m0[78].w, _1601);
    float _1627 = float(_1525);
    float _1629 = fma(_1191, (*spvDescriptorSet0.vp_c9)._m0[78].z, _1607);
    float _1631 = float(_1621);
    float _1633 = fma(_1191, (*spvDescriptorSet0.vp_c9)._m0[88].z, _1609);
    float _1635 = fma(_1185, (*spvDescriptorSet0.vp_c9)._m0[88].w, _1611);
    float _1637 = _1191 + (-0.5);
    float _1639 = fma(_137, (*spvDescriptorSet0.vp_c9)._m0[77].w, _1625);
    float _1641 = fma(_137, (*spvDescriptorSet0.vp_c9)._m0[82].w, _1485);
    float _1643 = fma(_137, (*spvDescriptorSet0.vp_c9)._m0[77].z, _1629);
    float _1645 = fma(_137, (*spvDescriptorSet0.vp_c9)._m0[87].z, _1633);
    float _1647 = fma(_137, (*spvDescriptorSet0.vp_c9)._m0[87].w, _1635);
    float _1649 = -_137;
    float _1651 = fma(_1649, (*spvDescriptorSet0.vp_c9)._m0[86].x, _1501);
    float _1653 = fma(_137, (*spvDescriptorSet0.vp_c9)._m0[86].y, _1517);
    bool _1655 = !_1457;
    int _1657 = _1655 ? 0 : 1;
    float _1659 = _1631 * _1627;
    if (_1571)
    {
        float _1661 = _1553 * _1599;
        _147 = _1661;
    }
    float _1663 = _147;
    float _1665 = fma(_1483, _1597, _1483);
    float _1667 = fma(_1637, (*spvDescriptorSet0.vp_c9)._m0[196].x, _1613);
    float _1669 = _1185 + _1065;
    int _1671 = abs(_1657);
    float _1673 = in.m_68.w;
    float _1675 = fma(_1665, _1663, _1667);
    float _1677 = _1669 + (-1.0);
    float _1679 = _1659 * (-2.0);
    float _1681 = float(_1591);
    float _1683 = _1675 * 0.15915493667125701904296875;
    float _1685 = float(_1671);
    float _1687 = fma(_1677, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _1689 = _1185 + (-0.5);
    float _1691 = fma(_1679, _1529, _1529);
    float _1693 = _1191 + _1065;
    float _1695 = _1685 * _1681;
    float _1697 = fma(_1687, _1679, _1687);
    float _1699 = fma(_1689, (*spvDescriptorSet0.vp_c9)._m0[196].y, _1691);
    float _1701 = _1693 + (-1.0);
    float _1703 = _1695 * (-2.0);
    float _1705 = fma(_1697, _1663, _1699);
    float _1707 = _1065 + (-0.5);
    float _1709 = fma(_1701, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _1711 = fma(_1703, _1531, _1531);
    float _1713 = _1705 * 0.15915493667125701904296875;
    float _1715 = _1683 * 6.283185482025146484375;
    float _1717 = cos(_1715);
    float _1719 = in.m_50.x;
    float _1721 = in.m_50.y;
    float _1723 = in.m_50.z;
    float _1725 = fma(_1709, _1703, _1709);
    float _1727 = fma(_1707, (*spvDescriptorSet0.vp_c9)._m0[196].z, _1711);
    float _1729 = fma(_1725, _1663, _1727);
    float _1731 = _1713 * 6.283185482025146484375;
    float _1733 = sin(_1731);
    float _1735 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _227);
    float _1737 = _1729 * 0.15915493667125701904296875;
    float _1739 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _231);
    float _1741 = _1713 * 6.283185482025146484375;
    float _1743 = cos(_1741);
    float _1745 = _1367 * _1739;
    float _1747 = _1683 * 6.283185482025146484375;
    float _1749 = sin(_1747);
    float _1751 = _199 * _1721;
    float _1753 = _1717 * _1733;
    float _1755 = _211 * _1721;
    float _1757 = _205 * _1721;
    float _1759 = fma(_197, _1719, _1751);
    float _1761 = fma(_209, _1719, _1755);
    float _1763 = _1737 * 6.283185482025146484375;
    float _1765 = cos(_1763);
    float _1767 = _1717 * _1743;
    float _1769 = _1381 * _1735;
    float _1771 = fma(_201, _1723, _1759);
    float _1773 = fma(_213, _1723, _1761);
    float _1775 = fma(_203, _1719, _1757);
    float _1777 = _1771 + _1383;
    float _1779 = _1737 * 6.283185482025146484375;
    float _1781 = sin(_1779);
    float _1783 = _1749 * _1733;
    float _1785 = _1749 * _1743;
    float _1787 = _1773 + _1673;
    float _1789 = fma(_207, _1723, _1775);
    float _1791 = _1717 * _1765;
    float _1793 = _1749 * _1765;
    float _1795 = _1743 * _1765;
    float _1797 = _1733 * _1765;
    float _1799 = _1791 * _1745;
    float _1801 = 0.5 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _1803 = fma(_1781, _1767, _1783);
    float _1805 = -_1753;
    float _1807 = fma(_1781, _1785, _1805);
    float _1809 = -_1785;
    float _1811 = fma(_1781, _1753, _1809);
    float _1813 = -_1745;
    float _1815 = _1781 * _1813;
    float _1817 = fma(_1803, _1769, _1799);
    float _1819 = _1793 * _1745;
    float _1821 = fma(_1781, _1783, _1767);
    float _1823 = fma(_1795, _1769, _1815);
    float _1825 = fma(_1811, _1801, _1817);
    float _1827 = fma(_1807, _1769, _1819);
    float _1829 = fma(_1797, _1801, _1823);
    float _1831 = _1825 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1833 = _1825 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1835 = fma(_1821, _1801, _1827);
    float _1837 = _1825 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1839 = fma(_1829, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1831);
    float _1841 = fma(_1829, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1833);
    float _1843 = fma(_1829, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1837);
    float _1845 = fma(_1835, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1839);
    float _1847 = fma(_1835, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1841);
    float _1849 = fma(_1835, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1843);
    float _1851 = _1845 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _1853 = _1847 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _1855 = in.m_66.w;
    float _1857 = _1777 + _1851;
    float _1859 = _1787 + _1853;
    float _1861 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1863 = _1857 + _1861;
    float _1865 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1867 = _1859 + _1865;
    float _1869 = _1863 * _1863;
    float _1871 = _1867 * _1867;
    float _1873 = _1869 + _1871;
    float _1875 = sqrt(_1873);
    float _1877 = _1789 + _1855;
    bool _1879 = _1875 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1881 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1883 = _1875 + _1881;
    float _1885 = _201;
    float _1887 = _1829;
    float _1889 = _1857;
    float _1891 = _1789;
    float _1893 = _1883;
    float _1895 = _1721;
    float _1897 = _1869;
    float _1899 = _1871;
    if (_1879)
    {
        float _1901 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1885 = _1901;
    }
    float _1903 = _1885;
    if (!_1879)
    {
        _1887 = _1857;
    }
    float _1905 = _1887;
    float _1907 = _1905;
    if (!_1879)
    {
        _1889 = _1859;
    }
    float _1909 = _1889;
    float _1911 = _1909;
    if (_1879)
    {
        float _1913 = rsqrt(_1873);
        _1891 = _1913;
    }
    float _1915 = _1891;
    if (_1879)
    {
        float _1917 = _1883 * _1903;
        _1893 = _1917;
    }
    float _1919 = _1893;
    if (_1879)
    {
        float _1921 = _1919 * 0.15915493667125701904296875;
        _1895 = _1921;
    }
    float _1923 = _1895;
    float _1925 = _1849 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _1927 = _203;
    float _1929 = _1925;
    float _1931 = _1923;
    if (_1879)
    {
        float _1933 = _1923 * 6.283185482025146484375;
        float _1935 = sin(_1933);
        _1927 = _1935;
    }
    float _1937 = _1927;
    float _1939 = _1877 + _1925;
    float _1941 = _1939;
    if (_1879)
    {
        float _1943 = _1939 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1929 = _1943;
    }
    float _1945 = _1929;
    float _1947 = _1937;
    if (_1879)
    {
        float _1949 = fma(_1937, _1945, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1947 = _1949;
    }
    float _1951 = _1947;
    float _1953 = _1951;
    if (_1879)
    {
        float _1955 = _1915 * _1951;
        _1953 = _1955;
    }
    float _1957 = _1953;
    if (_1879)
    {
        float _1959 = fma(_1863, _1957, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        _1907 = _1959;
    }
    float _1961 = _1907;
    if (_1879)
    {
        float _1963 = fma(_1867, _1957, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1911 = _1963;
    }
    float _1965 = _1911;
    float _1967 = fma(_1961, 6.2500002968590706586837768554688e-05, 0.5);
    float _1969 = fma(_1965, 6.2500002968590706586837768554688e-05, 0.5);
    float2 _8371 = float2(_1967, _1969);
    float3 _1973 = dm_bs(spvDescriptorSet0.vp_t_tcb_20.sample(spvDescriptorSet0.vp_t_tcb_20Smplr, select(_8371, float2(0.0), isnan(_8371)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_20, spvDescriptorSet0.vp_t_tcb_20Smplr_w, select(_8371, float2(0.0), isnan(_8371)), level(0.0)).xyz;
    float _1975 = _1973.x;
    float _1977 = _1973.y;
    float _1979 = _1973.z;
    float _1981 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _1983 = int(_1981);
    int _1985 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 64;
    bool _1987 = _1985 != 0;
    float _1989 = _1197 * _1199;
    float _1991 = _1201 * _1203;
    int _1993 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _1995 = _1993 != 0;
    float _1997 = -_1427;
    float _1999 = _1997 + 1.0;
    int _2001 = abs(_1393);
    float _2003 = -_1643;
    float _2005 = _2003 + 1.0;
    float _2007 = trunc((*spvDescriptorSet0.vp_c9)._m0[40].x);
    int _2009 = int(_2007);
    int _2011 = abs(_1439);
    float _2013 = -_1617;
    float _2015 = _2013 + 1.0;
    float _2017 = -_1641;
    float _2019 = _2017 + 1.0;
    bool _2021 = _1063 >= (*spvDescriptorSet0.vp_c9)._m0[170].w;
    bool _2023 = isnan(_1063);
    bool _2025 = _2021 || _2023;
    bool _2027 = isnan((*spvDescriptorSet0.vp_c9)._m0[170].w);
    bool _2029 = _2025 || _2027;
    float _2031 = float(_2029);
    float _2033 = _1945;
    bool _2035 = _1995;
    if (_1987)
    {
        float _2037 = in.m_70.w;
        _2033 = _2037;
    }
    float _2039 = _2033;
    float _2041 = trunc((*spvDescriptorSet0.vp_c9)._m0[49].x);
    int _2043 = int(_2041);
    float _2045 = float(uint(_1983));
    float _2047 = -_2031;
    float _2049 = _2047 + 1.0;
    int _2051 = ~_1983;
    int _2053 = _2051 + 1;
    float _2055 = -(*spvDescriptorSet0.vp_c9)._m0[172].w;
    float _2057 = _2055 + (*spvDescriptorSet0.vp_c9)._m0[173].w;
    int _2059 = ~_1983;
    int _2061 = _2059 + 1;
    float _2063 = -_1645;
    float _2065 = _2063 + 1.0;
    float _2067 = 1.0 / _2045;
    float _2069 = float(uint(_2009));
    float _2071 = -_1647;
    float _2073 = _2071 + 1.0;
    bool _2075 = _1063 >= (*spvDescriptorSet0.vp_c9)._m0[169].w;
    bool _2077 = isnan(_1063);
    bool _2079 = _2075 || _2077;
    bool _2081 = isnan((*spvDescriptorSet0.vp_c9)._m0[169].w);
    bool _2083 = _2079 || _2081;
    float _2085 = float(_2083);
    float _2087 = trunc(_1595);
    int _2089 = int(_2087);
    float _2091 = float(uint(_2043));
    float _2093 = _2085 * _2049;
    int _2095 = ~_2043;
    int _2097 = _2095 + 1;
    float _2099 = -_2085;
    float _2101 = _2099 + 1.0;
    bool _2103 = _1063 >= (*spvDescriptorSet0.vp_c9)._m0[167].w;
    bool _2105 = isnan(_1063);
    bool _2107 = _2103 || _2105;
    bool _2109 = isnan((*spvDescriptorSet0.vp_c9)._m0[167].w);
    bool _2111 = _2107 || _2109;
    float _2113 = float(_2111);
    float _2115 = _2039;
    if (_1987)
    {
        float _2117 = _2039 * 3.1415927410125732421875;
        _2115 = _2117;
    }
    float _2119 = _2115;
    float _2121 = 1.0 / _2069;
    int _2123 = as_type<int>(_2067) + (-2);
    float _2125 = _2119;
    if (_1987)
    {
        float _2127 = _2119 * 0.15915493667125701904296875;
        _2125 = _2127;
    }
    float _2129 = _2125;
    float _2131 = trunc(_1615);
    int _2133 = int(_2131);
    float _2135 = float(uint(_2089));
    float _2137 = float(_1983);
    float _2139 = float(_2089);
    float _2141 = as_type<float>(_2123) * _2135;
    float _2143 = 1.0 / _2091;
    int _2145 = as_type<int>(_2121) + (-2);
    bool _2147 = _2139 >= _2137;
    bool _2149 = isnan(_2139);
    bool _2151 = _2147 || _2149;
    bool _2153 = isnan(_2137);
    bool _2155 = _2151 || _2153;
    float _2157 = float(_2155);
    float _2159 = trunc(_2141);
    float _2161 = precise::max(_2159, 0.0);
    uint _2164 = uint(_2161);
    float _2166 = float(uint(_2133));
    float _2168 = trunc(_1623);
    int _2170 = int(_2168);
    int _2172 = as_type<int>(_2143) + (-2);
    float _2174 = as_type<float>(_2145) * _2166;
    float _2176 = _1201 * _1191;
    int _2178 = _2053 * int(_2164);
    int _2180 = _2178 + _2089;
    float _2182 = trunc(_2174);
    float _2184 = precise::max(_2182, 0.0);
    uint _2186 = uint(_2184);
    float _2188 = float(uint(_2180));
    float _2190 = float(uint(_2170));
    float _2192 = floor(_2176);
    float _2194 = as_type<float>(_2172) * _2190;
    float _2196 = as_type<float>(_2123) * _2188;
    int _2198 = ~_2009;
    int _2200 = _2198 + 1;
    float _2202 = _2129;
    if (_1987)
    {
        float _2204 = _2129 * 6.283185482025146484375;
        float _2206 = sin(_2204);
        _2202 = _2206;
    }
    float _2208 = _2202;
    int _2210 = _2200 * int(_2186);
    int _2212 = _2210 + _2133;
    float _2214 = trunc(_2196);
    float _2216 = precise::max(_2214, 0.0);
    uint _2218 = uint(_2216);
    float _2220 = -_2192;
    float _2222 = _2176 + _2220;
    float _2224 = float(uint(_2212));
    float _2226 = trunc(_2194);
    float _2228 = precise::max(_2226, 0.0);
    uint _2230 = uint(_2228);
    int _2232 = int(_2164) + int(_2218);
    float _2234 = as_type<float>(_2145) * _2224;
    float _2236 = floor(_1989);
    int _2238 = _2061 * _2232;
    int _2240 = _2238 + _2089;
    int _2242 = _2097 * int(_2230);
    int _2244 = _2242 + _2170;
    float _2246 = _2222 * _2137;
    bool _2248 = uint(_2240) >= uint(_1983);
    float _2250 = floor(_1991);
    bool _2252 = !_1995;
    int _2254 = _2252 ? 0 : 1;
    float _2256 = _2137 * _1303;
    float _2258 = float(uint(_2244));
    bool _2260 = !_2248;
    int _2262 = _2260 ? 0 : (-1);
    int _2264 = abs(_2254);
    float _2266 = trunc(_2234);
    float _2268 = precise::max(_2266, 0.0);
    uint _2270 = uint(_2268);
    float _2272 = as_type<float>(_2172) * _2258;
    int _2274 = ~_2232;
    int _2276 = _2274 + _2262;
    int _2278 = _2276 + 1;
    float _2280 = -_2236;
    float _2282 = _1989 + _2280;
    float _2284 = _2208;
    if (_1987)
    {
        bool _2286 = _2208 > 0.5;
        _2035 = _2286;
    }
    bool _2288 = _2035;
    bool _2290 = _1067 > 0.5;
    float _2292 = trunc(_2157);
    int _2294 = int(_2292);
    float _2296 = -_2250;
    float _2298 = _1991 + _2296;
    int _2300 = ~_2009;
    int _2302 = _2300 + 1;
    int _2304 = _1983 * _2278;
    int _2306 = _2304 + _2089;
    if (!_1987)
    {
        _2284 = _227;
    }
    float _2308 = _2284;
    float _2310 = trunc(_2246);
    int _2312 = int(_2310);
    int _2314 = int(_2186) + int(_2270);
    float _2316 = _2308;
    if (_1987)
    {
        float _2318 = -_227;
        float _2320 = _2288 ? _2318 : _227;
        _2316 = _2320;
    }
    float _2322 = _2316;
    bool _2324 = _1983 == 0;
    int _2326 = _2302 * _2314;
    int _2328 = _2326 + _2133;
    int _2330 = ~_2043;
    int _2332 = _2330 + 1;
    float _2334 = trunc(_2272);
    float _2336 = precise::max(_2334, 0.0);
    uint _2338 = uint(_2336);
    int _2340 = ~_2294;
    int _2342 = _2340 + 1;
    int _2344 = _2342 + 1;
    bool _2346 = !_2324;
    int _2348 = _2346 ? _2306 : (-1);
    bool _2350 = uint(_2328) >= uint(_2009);
    float _2352 = -_231;
    int _2354 = _1245 ? as_type<int>(_2352) : as_type<int>(_231);
    float _2356 = trunc(_2256);
    int _2358 = int(_2356);
    int _2360 = _2312 * _2264;
    int _2362 = _2360 + _2089;
    float _2364 = -(*spvDescriptorSet0.vp_c9)._m0[169].x;
    float _2366 = (*spvDescriptorSet0.vp_c9)._m0[170].x + _2364;
    int _2368 = _2348 * _2344;
    int _2370 = _1983 + (-1);
    float _2372 = -(*spvDescriptorSet0.vp_c9)._m0[170].x;
    float _2374 = _2372 + (*spvDescriptorSet0.vp_c9)._m0[171].x;
    int _2376 = int(_2230) + int(_2338);
    int _2378 = _2294 * _2370;
    int _2380 = _2378 + _2368;
    float _2382 = 1.0 / _2057;
    int _2384 = abs(_1387);
    bool _2386 = !_2350;
    int _2388 = _2386 ? 0 : (-1);
    int _2390 = _2332 * _2376;
    int _2392 = _2390 + _2170;
    float _2394 = float(_2009);
    int _2396 = _2380 * _2384;
    int _2398 = ~_2314;
    int _2400 = _2398 + _2388;
    int _2402 = _2400 + 1;
    float _2404 = _2282 * _2394;
    float _2406 = float(_2133);
    float _2408 = -(*spvDescriptorSet0.vp_c9)._m0[172].x;
    float _2410 = _2408 + (*spvDescriptorSet0.vp_c9)._m0[173].x;
    int _2412 = abs(_1399);
    int _2414 = _2358 * _2001;
    int _2416 = _2414 + _2396;
    bool _2418 = _2406 >= _2394;
    bool _2420 = isnan(_2406);
    bool _2422 = _2418 || _2420;
    bool _2424 = isnan(_2394);
    bool _2426 = _2422 || _2424;
    float _2428 = float(_2426);
    float _2430 = trunc(_2404);
    int _2432 = int(_2430);
    float _2434 = -_231;
    int _2436 = _2290 ? as_type<int>(_2434) : as_type<int>(_231);
    int _2438 = _2362 * _2412;
    int _2440 = _2438 + _2416;
    int _2442 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _2444 = _2442 != 0;
    float _2446 = _2394 * _1303;
    bool _2448 = uint(_2392) >= uint(_2043);
    int _2450 = _2009 * _2402;
    int _2452 = _2450 + _2133;
    bool _2454 = !_2444;
    int _2456 = _2454 ? 0 : 1;
    float _2458 = trunc(_2428);
    int _2460 = int(_2458);
    int _2462 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32768;
    bool _2464 = _2462 != 0;
    float _2466 = -_227;
    int _2468 = _1225 ? as_type<int>(_2466) : as_type<int>(_227);
    bool _2470 = !_2464;
    int _2472 = _2470 ? 0 : 1;
    bool _2474 = _2009 == 0;
    float _2476 = trunc(_2446);
    int _2478 = int(_2476);
    int _2480 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16384;
    bool _2482 = _2480 != 0;
    int _2484 = abs(_2456);
    bool _2486 = !_2474;
    int _2488 = _2486 ? _2452 : (-1);
    bool _2490 = !_2482;
    int _2492 = _2490 ? 0 : 1;
    int _2494 = _2312 * _2484;
    int _2496 = _2494 + _2440;
    int _2498 = ~_2460;
    int _2500 = _2498 + 1;
    int _2502 = _2500 + 1;
    int _2504 = _2009 + (-1);
    int _2506 = abs(_2492);
    int _2508 = _2488 * _2502;
    int _2510 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32768;
    bool _2512 = _2510 != 0;
    bool _2514 = !_1233;
    float _2516 = _2514 ? _231 : as_type<float>(_2436);
    int _2518 = _2460 * _2504;
    int _2520 = _2518 + _2508;
    bool _2522 = !_2512;
    int _2524 = _2522 ? 0 : 1;
    bool _2526 = !_2448;
    int _2528 = _2526 ? 0 : (-1);
    int _2530 = _2432 * _2506;
    int _2532 = _2530 + _2133;
    int _2534 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 65536;
    bool _2536 = _2534 != 0;
    int _2538 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 131072;
    bool _2540 = _2538 != 0;
    int _2542 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 262144;
    bool _2544 = _2542 != 0;
    int _2546 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 524288;
    bool _2548 = _2546 != 0;
    float _2550 = float(uint(_2496));
    int _2552 = abs(_1431);
    int _2554 = abs(_1435);
    float _2556 = as_type<float>(_2123) * _2550;
    float _2558 = float(_2043);
    int _2560 = _2520 * _2552;
    float _2562 = trunc(_2556);
    float _2564 = precise::max(_2562, 0.0);
    uint _2566 = uint(_2564);
    float _2568 = float(_2170);
    float _2570 = _2298 * _2558;
    bool _2572 = !_2540;
    int _2574 = _2572 ? 0 : 1;
    int _2576 = _2478 * _2554;
    int _2578 = _2576 + _2560;
    int _2580 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 128;
    bool _2582 = _2580 != 0;
    float _2584 = _2558 * _1303;
    bool _2586 = _2568 >= _2558;
    bool _2588 = isnan(_2568);
    bool _2590 = _2586 || _2588;
    bool _2592 = isnan(_2558);
    bool _2594 = _2590 || _2592;
    float _2596 = float(_2594);
    float _2598 = trunc(_2596);
    int _2600 = int(_2598);
    int _2602 = ~_1983;
    int _2604 = _2602 + 1;
    int _2606 = _2532 * _2011;
    int _2608 = _2606 + _2578;
    float _2610 = float(uint(_2362));
    float _2612 = as_type<float>(_2484);
    if (_2582)
    {
        float _2614 = in.m_70.x;
        _2612 = _2614;
    }
    float _2616 = _2612;
    int _2618 = ~_2376;
    int _2620 = _2618 + _2528;
    int _2622 = _2620 + 1;
    float _2624 = trunc(_2570);
    int _2626 = int(_2624);
    int _2628 = abs(_2472);
    int _2630 = _2604 * int(_2566);
    int _2632 = _2630 + _2496;
    float _2634 = as_type<float>(_2123) * _2610;
    int _2636 = abs(_2524);
    int _2638 = _2432 * _2628;
    int _2640 = _2638 + _2608;
    bool _2642 = !_2536;
    int _2644 = _2642 ? 0 : 1;
    float _2646 = trunc(_2584);
    int _2648 = int(_2646);
    int _2650 = _2043 * _2622;
    int _2652 = _2650 + _2170;
    float _2654 = float(uint(_2632));
    float _2656 = float(uint(_2640));
    bool _2658 = _2043 == 0;
    float _2660 = as_type<float>(_2123) * _2654;
    float _2662 = trunc(_2634);
    float _2664 = precise::max(_2662, 0.0);
    uint _2666 = uint(_2664);
    float _2668 = as_type<float>(_2145) * _2656;
    int _2670 = ~_2600;
    int _2672 = _2670 + 1;
    int _2674 = _2672 + 1;
    int _2676 = _2626 * _2636;
    int _2678 = _2676 + _2170;
    bool _2680 = !_2658;
    int _2682 = _2680 ? _2652 : (-1);
    int _2684 = _2043 + (-1);
    float _2686 = trunc(_2668);
    float _2688 = precise::max(_2686, 0.0);
    uint _2690 = uint(_2688);
    int _2692 = _2682 * _2674;
    int _2694 = ~_1983;
    int _2696 = _2694 + 1;
    int _2698 = abs(_2574);
    int _2700 = _2600 * _2684;
    int _2702 = _2700 + _2692;
    float _2704 = as_type<float>(_2692);
    if (_2582)
    {
        float _2706 = _2616 * 3.1415927410125732421875;
        _2704 = _2706;
    }
    float _2708 = _2704;
    float _2710 = trunc(_2660);
    float _2712 = precise::max(_2710, 0.0);
    uint _2714 = uint(_2712);
    int _2716 = abs(_2644);
    int _2718 = _2702 * _2698;
    float _2720 = _2708;
    if (_2582)
    {
        float _2722 = _2708 * 0.15915493667125701904296875;
        _2720 = _2722;
    }
    float _2724 = _2720;
    int _2726 = _2696 * int(_2666);
    int _2728 = _2726 + _2362;
    int _2730 = ~_1983;
    int _2732 = _2730 + 1;
    int _2734 = ~_2009;
    int _2736 = _2734 + 1;
    float _2738 = _2724;
    if (_2582)
    {
        float _2740 = _2724 * 6.283185482025146484375;
        float _2742 = sin(_2740);
        _2738 = _2742;
    }
    float _2744 = _2738;
    float _2746 = float(uint(_2728));
    int _2748 = ~_2043;
    int _2750 = _2748 + 1;
    int _2752 = _2736 * int(_2690);
    int _2754 = _2752 + _2640;
    float _2756 = as_type<float>(_2123) * _2746;
    int _2758 = int(_2566) + int(_2714);
    float _2760 = float(uint(_2754));
    int _2762 = _2648 * _2716;
    int _2764 = _2762 + _2718;
    bool _2766 = !_2544;
    int _2768 = _2766 ? 0 : 1;
    int _2770 = _2732 * _2758;
    int _2772 = _2770 + _2496;
    bool _2774 = !_2548;
    int _2776 = _2774 ? 0 : 1;
    float _2778 = as_type<float>(_2145) * _2760;
    int _2780 = abs(_2768);
    float _2782 = trunc(_2756);
    float _2784 = precise::max(_2782, 0.0);
    uint _2786 = uint(_2784);
    int _2788 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _2790 = _2788 != 0;
    bool _2792 = uint(_2772) >= uint(_1983);
    bool _2794 = !_2790;
    float _2796 = _2794 ? _227 : as_type<float>(_2468);
    float _2798 = trunc(_2778);
    float _2800 = precise::max(_2798, 0.0);
    uint _2802 = uint(_2800);
    int _2804 = abs(_2776);
    bool _2806 = !_2792;
    int _2808 = _2806 ? 0 : (-1);
    int _2810 = 2 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y);
    bool _2812 = _2810 != 0;
    int _2814 = _2678 * _2780;
    int _2816 = _2814 + _2764;
    bool _2818 = _2792;
    if (_2582)
    {
        bool _2820 = _2744 > 0.5;
        _2818 = _2820;
    }
    bool _2822 = _2818;
    float _2824 = float(uint(_2532));
    int _2826 = _2626 * _2804;
    int _2828 = _2826 + _2816;
    int _2830 = ~_2758;
    int _2832 = _2830 + _2808;
    int _2834 = _2832 + 1;
    int _2836 = ~_2009;
    int _2838 = _2836 + 1;
    float _2840 = as_type<float>(_2145) * _2824;
    int _2842 = int(_2690) + int(_2802);
    int _2844 = _1983 * _2834;
    int _2846 = _2844 + _2496;
    float _2848 = as_type<float>(_2802);
    if (!_2582)
    {
        _2848 = _231;
    }
    float _2850 = _2848;
    float _2852 = _2850;
    if (_2582)
    {
        float _2854 = -_231;
        float _2856 = _2822 ? _2854 : _231;
        _2852 = _2856;
    }
    float _2858 = _2852;
    float _2860 = trunc(_2840);
    float _2862 = precise::max(_2860, 0.0);
    uint _2864 = uint(_2862);
    bool _2866 = !_2324;
    int _2868 = _2866 ? _2846 : (-1);
    int _2870 = _2838 * _2842;
    int _2872 = _2870 + _2640;
    float _2874 = float(uint(_2678));
    int _2876 = _2868 & 3;
    bool _2878 = _2876 != 0;
    bool _2880 = !_2812;
    float _2882 = _2880 ? _231 : as_type<float>(_2354);
    float _2884 = as_type<float>(_2172) * _2874;
    bool _2886 = uint(_2876) > 1u;
    int _2888 = ~_2009;
    int _2890 = _2888 + 1;
    float _2892 = trunc(_2884);
    float _2894 = precise::max(_2892, 0.0);
    uint _2896 = uint(_2894);
    int _2898 = _2868 & 3;
    bool _2900 = _2898 != 0;
    float _2902 = float(uint(_2828));
    int _2904 = _2890 * int(_2864);
    int _2906 = _2904 + _2532;
    int _2908 = _2900 ? 0 : 1;
    bool _2910 = uint(_2872) >= uint(_2009);
    float _2912 = as_type<float>(_2172) * _2902;
    int _2914 = int(_2666) + int(_2786);
    int _2916 = ~_2908;
    int _2918 = _2916 + 1;
    int _2920 = _2918 + 1;
    float _2922 = trunc(_2912);
    float _2924 = precise::max(_2922, 0.0);
    uint _2926 = uint(_2924);
    int _2928 = ~_1983;
    int _2930 = _2928 + 1;
    int _2932 = _2920;
    if (!_2886)
    {
        int _2934 = ~_2908;
        int _2936 = _2934 + 1;
        _2932 = _2936;
    }
    int _2938 = _2932;
    float _2940 = float(uint(_2906));
    int _2942 = _2930 * _2914;
    int _2944 = _2942 + _2362;
    int _2946 = ~_2043;
    int _2948 = _2946 + 1;
    bool _2950 = !_2910;
    int _2952 = _2950 ? 0 : (-1);
    float _2954 = as_type<float>(_2145) * _2940;
    bool _2956 = uint(_2876) >= 2u;
    int _2958 = _2948 * int(_2896);
    int _2960 = _2958 + _2678;
    int _2962 = ~_2842;
    int _2964 = _2962 + _2952;
    int _2966 = _2964 + 1;
    bool _2968 = _2876 != 3;
    int _2970 = _2956 ? 0 : 1;
    int _2972 = _2009 * _2966;
    int _2974 = _2972 + _2640;
    bool _2976 = uint(_2944) >= uint(_1983);
    float _2978 = float(uint(_2960));
    int _2980 = ~_2043;
    int _2982 = _2980 + 1;
    float _2984 = trunc(_2954);
    float _2986 = precise::max(_2984, 0.0);
    uint _2988 = uint(_2986);
    bool _2990 = !_2474;
    int _2992 = _2990 ? _2974 : (-1);
    float _2994 = as_type<float>(_2172) * _2978;
    int _2996 = ~_2970;
    int _2998 = _2996 + 1;
    int _3000 = _2998 + 1;
    int _3002 = _2982 * int(_2926);
    int _3004 = _3002 + _2828;
    bool _3006 = !_2976;
    int _3008 = _3006 ? 0 : (-1);
    int _3010 = _3000;
    if (_2968)
    {
        int _3012 = ~_2970;
        int _3014 = _3012 + 1;
        _3010 = _3014;
    }
    int _3016 = _3010;
    float _3018 = trunc(_2994);
    float _3020 = precise::max(_3018, 0.0);
    uint _3022 = uint(_3020);
    int _3024 = _2992 & 3;
    bool _3026 = _3024 != 0;
    int _3028 = _2992 & 3;
    bool _3030 = _3028 != 0;
    float _3032 = float(uint(_3004));
    int _3034 = _3026 ? 0 : 1;
    bool _3036 = uint(_3028) > 1u;
    float _3038 = as_type<float>(_2172) * _3032;
    int _3040 = int(_2864) + int(_2988);
    int _3042 = ~_3034;
    int _3044 = _3042 + 1;
    int _3046 = _3044 + 1;
    float _3048 = trunc(_3038);
    float _3050 = precise::max(_3048, 0.0);
    uint _3052 = uint(_3050);
    bool _3054 = !_3030;
    int _3056 = _3054 ? 0 : 1;
    bool _3058 = uint(_3028) >= 2u;
    int _3060 = ~_2009;
    int _3062 = _3060 + 1;
    int _3064 = _3058 ? 0 : 1;
    int _3066 = _3046;
    if (!_3036)
    {
        int _3068 = ~_3034;
        int _3070 = _3068 + 1;
        _3066 = _3070;
    }
    int _3072 = _3066;
    bool _3074 = _3028 != 3;
    bool _3076 = _3028 != 3;
    int _3078 = _3062 * _3040;
    int _3080 = _3078 + _2532;
    int _3082 = int(_2896) + int(_3022);
    int _3084 = int(_2926) + int(_3052);
    int _3086 = ~_2043;
    int _3088 = _3086 + 1;
    int _3090 = _2750 * _3082;
    int _3092 = _3090 + _2678;
    bool _3094 = !_3076;
    int _3096 = _3094 ? 0 : (-1);
    bool _3098 = uint(_3080) >= uint(_2009);
    float _3100 = -(*spvDescriptorSet0.vp_c9)._m0[167].w;
    float _3102 = _3100 + (*spvDescriptorSet0.vp_c9)._m0[168].w;
    int _3104 = ~_3064;
    int _3106 = _3104 + 1;
    int _3108 = _3106 + 1;
    int _3110 = _3108;
    if (_3074)
    {
        int _3112 = ~_3064;
        int _3114 = _3112 + 1;
        _3110 = _3114;
    }
    int _3116 = _3110;
    int _3118 = _3088 * _3084;
    int _3120 = _3118 + _2828;
    float _3122 = 1.0 / _3102;
    float _3124 = -(*spvDescriptorSet0.vp_c9)._m0[168].w;
    float _3126 = _3124 + (*spvDescriptorSet0.vp_c9)._m0[169].w;
    bool _3128 = !_3098;
    int _3130 = _3128 ? 0 : (-1);
    int _3132 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8388608;
    bool _3134 = _3132 != 0;
    float _3136 = -(*spvDescriptorSet0.vp_c9)._m0[170].w;
    float _3138 = _3136 + (*spvDescriptorSet0.vp_c9)._m0[171].w;
    bool _3140 = uint(_3120) >= uint(_2043);
    float _3142 = -(*spvDescriptorSet0.vp_c9)._m0[169].w;
    float _3144 = _3142 + (*spvDescriptorSet0.vp_c9)._m0[170].w;
    float _3146 = 1.0 / _3126;
    bool _3148 = !_3134;
    int _3150 = _3148 ? 0 : 1;
    bool _3152 = !_3140;
    int _3154 = _3152 ? 0 : (-1);
    bool _3156 = _1191 > 0.5;
    bool _3158 = uint(_3092) >= uint(_2043);
    float _3160 = 1.0 / _3138;
    bool _3162 = !_3158;
    int _3164 = _3162 ? 0 : (-1);
    int _3166 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y);
    bool _3168 = _3166 != 0;
    float _3170 = 1.0 / _3144;
    float _3172 = -_227;
    int _3174 = _3156 ? as_type<int>(_3172) : as_type<int>(_227);
    int _3176 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _3178 = _3176 != 0;
    bool _3180 = !_3168;
    float _3182 = _3180 ? _227 : as_type<float>(_3174);
    int _3184 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16777216;
    bool _3186 = _3184 != 0;
    float _3188 = _2374 * _3160;
    float _3190 = -(*spvDescriptorSet0.vp_c9)._m0[167].x;
    float _3192 = (*spvDescriptorSet0.vp_c9)._m0[168].x + _3190;
    float _3194 = -(*spvDescriptorSet0.vp_c9)._m0[168].x;
    float _3196 = _3194 + (*spvDescriptorSet0.vp_c9)._m0[169].x;
    bool _3198 = _1063 >= (*spvDescriptorSet0.vp_c9)._m0[174].w;
    bool _3200 = isnan(_1063);
    bool _3202 = _3198 || _3200;
    bool _3204 = isnan((*spvDescriptorSet0.vp_c9)._m0[174].w);
    bool _3206 = _3202 || _3204;
    float _3208 = float(_3206);
    float _3210 = _3192 * _3122;
    float _3212 = _3196 * _3146;
    bool _3214 = _1063 >= (*spvDescriptorSet0.vp_c9)._m0[173].w;
    bool _3216 = isnan(_1063);
    bool _3218 = _3214 || _3216;
    bool _3220 = isnan((*spvDescriptorSet0.vp_c9)._m0[173].w);
    bool _3222 = _3218 || _3220;
    float _3224 = float(_3222);
    float _3226 = -_3208;
    float _3228 = _3226 + 1.0;
    bool _3230 = _1063 >= (*spvDescriptorSet0.vp_c9)._m0[172].w;
    bool _3232 = isnan(_1063);
    bool _3234 = _3230 || _3232;
    bool _3236 = isnan((*spvDescriptorSet0.vp_c9)._m0[172].w);
    bool _3238 = _3234 || _3236;
    float _3240 = float(_3238);
    float _3242 = -(*spvDescriptorSet0.vp_c9)._m0[171].w;
    float _3244 = _3242 + (*spvDescriptorSet0.vp_c9)._m0[172].w;
    float _3246 = _2366 * _3170;
    float _3248 = _3224 * _3228;
    float _3250 = -_3224;
    float _3252 = _3250 + 1.0;
    float _3254 = 1.0 / _3244;
    bool _3256 = _1063 >= (*spvDescriptorSet0.vp_c9)._m0[171].w;
    bool _3258 = isnan(_1063);
    bool _3260 = _3256 || _3258;
    bool _3262 = isnan((*spvDescriptorSet0.vp_c9)._m0[171].w);
    bool _3264 = _3260 || _3262;
    float _3266 = float(_3264);
    float _3268 = _3240 * _3252;
    float _3270 = -_3240;
    float _3272 = _3270 + 1.0;
    int _3274 = ~_3040;
    int _3276 = _3274 + _3130;
    int _3278 = _3276 + 1;
    float _3280 = -_3266;
    float _3282 = _3280 + 1.0;
    float _3284 = _1811 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _3286 = _3266 * _3272;
    float _3288 = -(*spvDescriptorSet0.vp_c9)._m0[171].x;
    float _3290 = (*spvDescriptorSet0.vp_c9)._m0[172].x + _3288;
    float _3292 = _2031 * _3282;
    bool _3294 = _1063 >= (*spvDescriptorSet0.vp_c9)._m0[168].w;
    bool _3296 = isnan(_1063);
    bool _3298 = _3294 || _3296;
    bool _3300 = isnan((*spvDescriptorSet0.vp_c9)._m0[168].w);
    bool _3302 = _3298 || _3300;
    float _3304 = float(_3302);
    float _3306 = fma(_1797, (*spvDescriptorSet0.vp_c8)._m0[26].x, _3284);
    int _3308 = ~_2914;
    int _3310 = _3308 + _3008;
    int _3312 = _3310 + 1;
    int _3314 = _2009 * _3278;
    int _3316 = _3314 + _2532;
    int _3318 = abs(_3116);
    float _3320 = _3290 * _3254;
    float _3322 = -(*spvDescriptorSet0.vp_c9)._m0[173].w;
    float _3324 = _3322 + (*spvDescriptorSet0.vp_c9)._m0[174].w;
    float _3326 = _3304 * _2101;
    float _3328 = -(*spvDescriptorSet0.vp_c9)._m0[167].w;
    float _3330 = _1063 + _3328;
    float _3332 = -_3304;
    float _3334 = _3332 + 1.0;
    float _3336 = _2410 * _2382;
    float _3338 = -(*spvDescriptorSet0.vp_c9)._m0[169].w;
    float _3340 = _1063 + _3338;
    float _3342 = fma(_3210, _3330, (*spvDescriptorSet0.vp_c9)._m0[167].x);
    float _3344 = _2113 * _3334;
    float _3346 = -(*spvDescriptorSet0.vp_c9)._m0[168].w;
    float _3348 = _1063 + _3346;
    float _3350 = -_2113;
    float _3352 = _3350 + 1.0;
    float _3354 = 1.0 / _3324;
    float _3356 = _3342 * _3344;
    float _3358 = fma(_3212, _3348, (*spvDescriptorSet0.vp_c9)._m0[168].x);
    float _3360 = -(*spvDescriptorSet0.vp_c9)._m0[170].w;
    float _3362 = _1063 + _3360;
    float _3364 = fma(_3246, _3340, (*spvDescriptorSet0.vp_c9)._m0[169].x);
    float _3366 = fma(_3352, (*spvDescriptorSet0.vp_c9)._m0[167].x, _3356);
    float _3368 = -(*spvDescriptorSet0.vp_c9)._m0[173].x;
    float _3370 = (*spvDescriptorSet0.vp_c9)._m0[174].x + _3368;
    float _3372 = fma(_3188, _3362, (*spvDescriptorSet0.vp_c9)._m0[170].x);
    float _3374 = -(*spvDescriptorSet0.vp_c9)._m0[171].w;
    float _3376 = _1063 + _3374;
    float _3378 = fma(_3358, _3326, _3366);
    float _3380 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    int _3382 = ~_3084;
    int _3384 = _3382 + _3154;
    int _3386 = _3384 + 1;
    float _3388 = fma(_3320, _3376, (*spvDescriptorSet0.vp_c9)._m0[171].x);
    float _3390 = fma(_3364, _2093, _3378);
    float _3392 = _2858 + (-0.5);
    int _3394 = ~_3082;
    int _3396 = _3394 + _3164;
    int _3398 = _3396 + 1;
    float _3400 = _3370 * _3354;
    float _3402 = fma(_3372, _3292, _3390);
    float _3404 = _2322 + 0.5;
    float _3406 = -(*spvDescriptorSet0.vp_c9)._m0[172].w;
    float _3408 = _1063 + _3406;
    float _3410 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _3412 = fma(_3388, _3286, _3402);
    float _3414 = fma(_3404, (*spvDescriptorSet0.vp_c9)._m0[95].x, _1347);
    float _3416 = _3182 + 0.5;
    float _3418 = -(*spvDescriptorSet0.vp_c9)._m0[173].w;
    float _3420 = _1063 + _3418;
    float _3422 = fma(_3336, _3408, (*spvDescriptorSet0.vp_c9)._m0[172].x);
    float _3424 = _2882 + (-0.5);
    float _3426 = fma(_3416, (*spvDescriptorSet0.vp_c9)._m0[80].x, _1337);
    int _3428 = _2992 >> 31;
    float _3430 = fma(_3400, _3420, (*spvDescriptorSet0.vp_c9)._m0[173].x);
    float _3432 = fma(_3422, _3268, _3412);
    float _3434 = -_3392;
    float _3436 = -_1543;
    float _3438 = fma(_3434, (*spvDescriptorSet0.vp_c9)._m0[95].y, _3436);
    int _3440 = _3428 & 3;
    float _3442 = -_1329;
    float _3444 = _3442 + 1.0;
    float _3446 = -_3424;
    float _3448 = -_1495;
    float _3450 = fma(_3446, (*spvDescriptorSet0.vp_c9)._m0[80].y, _3448);
    float _3452 = fma(_3430, _3248, _3432);
    int _3454 = _2992 + _3440;
    float _3456 = -_3444;
    float _3458 = fma(_3456, _2322, _3414);
    float _3460 = fma(_1999, _2858, _3438);
    float _3462 = _3380 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _3464 = _2796 + 0.5;
    float _3466 = -_2005;
    float _3468 = fma(_3182, _3466, _3426);
    int _3470 = _3454 >> 2;
    float _3472 = _3410 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _3474 = _2516 + (-0.5);
    float _3476 = fma(_3462, _3464, _1551);
    int _3478 = _3470 << 4;
    int _3480 = _3478 + 656;
    out.m_82.x = _3458;
    out.m_82.y = _3460;
    float _3482 = -_3472;
    float _3484 = -_1619;
    float _3486 = fma(_3482, _3474, _3484);
    float _3488 = -_1639;
    float _3490 = _3488 + 1.0;
    float _3492 = _1791 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _3494 = _1791 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _3496 = _1791 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _3498 = fma(_2882, _3490, _3450);
    float _3500 = fma(_3208, (*spvDescriptorSet0.vp_c9)._m0[174].x, _3452);
    float _3502 = _1811 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _3504 = trunc((*spvDescriptorSet0.vp_c9)._m0[90].z);
    int _3506 = int(_3504);
    float _3508 = -_2015;
    float _3510 = fma(_2796, _3508, _3476);
    float _3512 = fma(_2516, _2019, _3486);
    uint _3514 = uint(int(uint(_3480) >> uint(2)));
    uint _3516 = uint(int(uint(int(_3514)) >> uint(2)));
    int _3518 = int(_3514) & 3;
    float _3520 = (*spvDescriptorSet0.vp_c9)._m0[int(_3516)][_3518];
    int _3522 = int(_3514) + 1;
    uint _3524 = uint(int(uint(_3522) >> uint(2)));
    int _3526 = _3522 & 3;
    float _3528 = (*spvDescriptorSet0.vp_c9)._m0[int(_3524)][_3526];
    float _3530 = -_1781;
    float _3532 = fma(_3530, (*spvDescriptorSet0.vp_c8)._m0[24].x, _3492);
    out.m_84.x = _3500;
    float _3534 = fma(_1797, (*spvDescriptorSet0.vp_c8)._m0[25].x, _3502);
    float _3536 = _227 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _3538 = fma(_1793, (*spvDescriptorSet0.vp_c8)._m0[24].z, _3532);
    out.m_86.x = _3468;
    out.m_86.y = _3498;
    out.m_86.z = _3510;
    out.m_86.w = _3512;
    int _3540 = abs(_3056);
    int _3542 = _3480 + 8;
    uint _3544 = uint(int(uint(_3542) >> uint(2)));
    uint _3546 = uint(int(uint(int(_3544)) >> uint(2)));
    int _3548 = int(_3544) & 3;
    float _3550 = (*spvDescriptorSet0.vp_c9)._m0[int(_3546)][_3548];
    int _3552 = int(_3544) + 1;
    uint _3554 = uint(int(uint(_3552) >> uint(2)));
    int _3556 = _3552 & 3;
    float _3558 = (*spvDescriptorSet0.vp_c9)._m0[int(_3554)][_3556];
    int _3560 = _1983 * _3312;
    int _3562 = _3560 + _2362;
    int _3564 = abs(_3150);
    int _3566 = _2043 * _3398;
    int _3568 = _3566 + _2678;
    int _3570 = ~_3540;
    int _3572 = _3570 + 1;
    int _3574 = _3572 + 1;
    int _3576 = abs(_2938);
    int _3578 = abs(_3072);
    bool _3580 = !_2324;
    int _3582 = _3580 ? _3562 : (-1);
    float _3584 = -_1781;
    float _3586 = fma(_3584, (*spvDescriptorSet0.vp_c8)._m0[25].x, _3494);
    float _3588 = -_1781;
    float _3590 = fma(_3588, (*spvDescriptorSet0.vp_c8)._m0[26].x, _3496);
    float _3592 = _1803 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _3594 = _1803 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _3596 = _1803 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _3598 = fma(_1793, (*spvDescriptorSet0.vp_c8)._m0[26].z, _3590);
    float _3600 = _1811 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _3602 = fma(_1795, (*spvDescriptorSet0.vp_c8)._m0[24].x, _3592);
    float _3604 = fma(_1795, (*spvDescriptorSet0.vp_c8)._m0[25].x, _3594);
    float _3606 = fma(_1795, (*spvDescriptorSet0.vp_c8)._m0[26].x, _3596);
    float _3608 = fma(_1797, (*spvDescriptorSet0.vp_c8)._m0[24].x, _3600);
    float _3610 = _231 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _3612 = fma(_1807, (*spvDescriptorSet0.vp_c8)._m0[24].z, _3602);
    int _3614 = ~_3578;
    int _3616 = _3614 + 1;
    int _3618 = _3616 + 1;
    float _3620 = fma(_1807, (*spvDescriptorSet0.vp_c8)._m0[25].z, _3604);
    float _3622 = fma(_3610, _3610, 1.0);
    float _3624 = fma(_1807, (*spvDescriptorSet0.vp_c8)._m0[26].z, _3606);
    float _3626 = _3610 * _3538;
    int _3628 = _2868 >> 31;
    float _3630 = rsqrt(_3622);
    int _3632 = abs(_3096);
    float _3634 = fma(_3536, _3612, _3626);
    out.m_88.x = _3612;
    out.m_88.y = _3620;
    out.m_88.z = _3624;
    int _3636 = _3628 & 3;
    float _3638 = fma(_1821, (*spvDescriptorSet0.vp_c8)._m0[24].z, _3608);
    float _3640 = fma(_1821, (*spvDescriptorSet0.vp_c8)._m0[25].z, _3534);
    float _3642 = fma(_1793, (*spvDescriptorSet0.vp_c8)._m0[25].z, _3586);
    int _3644 = _2868 + _3636;
    int _3646 = _3618 * as_type<int>(_3528);
    bool _3648 = !_2474;
    int _3650 = _3648 ? _3316 : (-1);
    float _3652 = fma(_1821, (*spvDescriptorSet0.vp_c8)._m0[26].z, _3306);
    bool _3654 = !_2878;
    int _3656 = _3654 ? 0 : 1;
    int _3658 = _3574 * as_type<int>(_3520);
    int _3660 = _3658 + _3646;
    float _3662 = _3610 * _3642;
    int _3664 = _2043 * _3386;
    int _3666 = _3664 + _2828;
    float _3668 = _3610 * _3630;
    int _3670 = abs(_3506);
    int _3672 = ~_3318;
    int _3674 = _3672 + 1;
    int _3676 = _3674 + 1;
    int _3678 = ~_3632;
    int _3680 = _3678 + 1;
    int _3682 = _3680 + 1;
    bool _3684 = !_2658;
    int _3686 = _3684 ? _3666 : (-1);
    int _3688 = _3676 * as_type<int>(_3550);
    int _3690 = _3688 + _3660;
    float _3692 = float(uint(_3506));
    float _3694 = -_3638;
    float _3696 = _3668 * _3694;
    int _3698 = _3686 >> 31;
    int _3700 = _3682 * as_type<int>(_3558);
    int _3702 = _3700 + _3690;
    int _3704 = _3644 >> 2;
    float _3706 = 1.0 / _3692;
    int _3708 = _3698 & 3;
    float _3710 = fma(_3630, _3538, _3696);
    int _3712 = _3704 << 4;
    int _3714 = _3712 + 368;
    float _3716 = float(uint(_3670));
    int _3718 = ~_3564;
    int _3720 = _3718 + 1;
    int _3722 = _3720 + 1;
    int _3724 = _3686 + _3708;
    float _3726 = 1.0 / _3716;
    uint _3728 = uint(int(uint(_3714) >> uint(2)));
    uint _3730 = uint(int(uint(int(_3728)) >> uint(2)));
    int _3732 = int(_3728) & 3;
    float _3734 = (*spvDescriptorSet0.vp_c9)._m0[int(_3730)][_3732];
    int _3736 = int(_3728) + 1;
    uint _3738 = uint(int(uint(_3736) >> uint(2)));
    int _3740 = _3736 & 3;
    float _3742 = (*spvDescriptorSet0.vp_c9)._m0[int(_3738)][_3740];
    int _3744 = _3686 & 3;
    bool _3746 = _3744 != 0;
    int _3748 = _3702 * _3722;
    int _3750 = _3686 & 3;
    bool _3752 = _3750 != 0;
    int _3754 = _3724 >> 2;
    int _3756 = _3650 * _3564;
    int _3758 = _3756 + _3748;
    int _3760 = _3746 ? 0 : 1;
    float _3762 = -_3640;
    float _3764 = _3668 * _3762;
    float _3766 = -_3652;
    float _3768 = _3668 * _3766;
    int _3770 = _3754 << 4;
    int _3772 = _3770 + 800;
    float _3774 = fma(_3630, _3642, _3764);
    float _3776 = _3610 * _3598;
    bool _3778 = uint(_3750) > 1u;
    float _3780 = fma(_3630, _3598, _3768);
    int _3782 = abs(_3758);
    uint _3784 = uint(int(uint(_3772) >> uint(2)));
    uint _3786 = uint(int(uint(int(_3784)) >> uint(2)));
    int _3788 = int(_3784) & 3;
    float _3790 = (*spvDescriptorSet0.vp_c9)._m0[int(_3786)][_3788];
    int _3792 = int(_3784) + 1;
    uint _3794 = uint(int(uint(_3792) >> uint(2)));
    int _3796 = _3792 & 3;
    float _3798 = (*spvDescriptorSet0.vp_c9)._m0[int(_3794)][_3796];
    float _3800 = fma(_3536, _3620, _3662);
    int _3802 = as_type<int>(_3706) + (-2);
    out.m_90.x = _3710;
    out.m_90.y = _3774;
    out.m_90.z = _3780;
    float _3804 = float(uint(_3758));
    float _3806 = fma(_3536, _3624, _3776);
    int _3808 = as_type<int>(_3726) + (-2);
    bool _3810 = !_3752;
    int _3812 = _3810 ? 0 : 1;
    int _3814 = _3772 + 8;
    uint _3816 = uint(int(uint(_3814) >> uint(2)));
    uint _3818 = uint(int(uint(int(_3816)) >> uint(2)));
    int _3820 = int(_3816) & 3;
    float _3822 = (*spvDescriptorSet0.vp_c9)._m0[int(_3818)][_3820];
    int _3824 = int(_3816) + 1;
    uint _3826 = uint(int(uint(_3824) >> uint(2)));
    int _3828 = _3824 & 3;
    float _3830 = (*spvDescriptorSet0.vp_c9)._m0[int(_3826)][_3828];
    bool _3832 = uint(_3750) >= 2u;
    int _3834 = ~_3760;
    int _3836 = _3834 + 1;
    int _3838 = _3836 + 1;
    int _3840 = _3838;
    if (!_3778)
    {
        int _3842 = ~_3760;
        int _3844 = _3842 + 1;
        _3840 = _3844;
    }
    int _3846 = _3840;
    float _3848 = as_type<float>(_3802) * _3804;
    float _3850 = float(uint(_3782));
    int _3852 = _3714 + 8;
    uint _3854 = uint(int(uint(_3852) >> uint(2)));
    uint _3856 = uint(int(uint(int(_3854)) >> uint(2)));
    int _3858 = int(_3854) & 3;
    float _3860 = (*spvDescriptorSet0.vp_c9)._m0[int(_3856)][_3858];
    int _3862 = int(_3854) + 1;
    uint _3864 = uint(int(uint(_3862) >> uint(2)));
    int _3866 = _3862 & 3;
    float _3868 = (*spvDescriptorSet0.vp_c9)._m0[int(_3864)][_3866];
    int _3870 = _3832 ? 0 : 1;
    float _3872 = trunc(_3848);
    float _3874 = precise::max(_3872, 0.0);
    uint _3876 = uint(_3874);
    bool _3878 = _2876 != 3;
    float _3880 = as_type<float>(_3808) * _3850;
    int _3882 = ~_3506;
    int _3884 = _3882 + 1;
    int _3886 = ~_3576;
    int _3888 = _3886 + 1;
    int _3890 = _3888 + 1;
    float _3892 = trunc(_3880);
    float _3894 = precise::max(_3892, 0.0);
    uint _3896 = uint(_3894);
    int _3898 = ~_3670;
    int _3900 = _3898 + 1;
    int _3902 = _3890 * as_type<int>(_3742);
    int _3904 = abs(_3846);
    int _3906 = _3884 * int(_3876);
    int _3908 = _3906 + _3758;
    int _3910 = abs(_3656);
    float _3912 = _3742;
    if (_1879)
    {
        float _3914 = _1923 * 6.283185482025146484375;
        float _3916 = cos(_3914);
        _3912 = _3916;
    }
    float _3918 = _3912;
    int _3920 = ~_3904;
    int _3922 = _3920 + 1;
    int _3924 = _3922 + 1;
    bool _3926 = _3750 != 3;
    int _3928 = _3900 * int(_3896);
    int _3930 = _3928 + _3782;
    float _3932 = float(uint(_3908));
    int _3934 = ~_3870;
    int _3936 = _3934 + 1;
    int _3938 = _3936 + 1;
    float _3940 = float(uint(_3930));
    float _3942 = as_type<float>(_3802) * _3932;
    int _3944 = ~_3910;
    int _3946 = _3944 + 1;
    int _3948 = _3946 + 1;
    int _3950 = _3924 * as_type<int>(_3798);
    int _3952 = abs(_3812);
    float _3954 = as_type<float>(_3808) * _3940;
    int _3956 = _3938;
    float _3958 = _3798;
    if (_1879)
    {
        float _3960 = _3918 + (-1.0);
        _1931 = _3960;
    }
    float _3962 = _1931;
    if (_3926)
    {
        int _3964 = ~_3870;
        int _3966 = _3964 + 1;
        _3956 = _3966;
    }
    int _3968 = _3956;
    int _3970 = _3948 * as_type<int>(_3734);
    int _3972 = _3970 + _3902;
    float _3974 = trunc(_3942);
    float _3976 = precise::max(_3974, 0.0);
    uint _3978 = uint(_3976);
    int _3980 = abs(_3016);
    float _3982 = as_type<float>(_3980);
    if (_1879)
    {
        float _3984 = _3962 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _3958 = _3984;
    }
    float _3986 = _3958;
    int _3988 = ~_3952;
    int _3990 = _3988 + 1;
    int _3992 = _3990 + 1;
    int _3994 = ~_3980;
    int _3996 = _3994 + 1;
    int _3998 = _3996 + 1;
    if (_1879)
    {
        float _4000 = fma(_1939, _3918, _3986);
        _1941 = _4000;
    }
    float _4002 = _1941;
    if (_1879)
    {
        float _4004 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _4006 = _1961 + _4004;
        _3982 = _4006;
    }
    float _4008 = _3982;
    float _4010 = trunc(_3954);
    float _4012 = precise::max(_4010, 0.0);
    uint _4014 = uint(_4012);
    int _4016 = _3992 * as_type<int>(_3790);
    int _4018 = _4016 + _3950;
    int _4020 = abs(_3968);
    int _4022 = _3998 * as_type<int>(_3860);
    int _4024 = _4022 + _3972;
    bool _4026 = !_3878;
    int _4028 = _4026 ? 0 : (-1);
    float _4030 = _4008;
    if (_1879)
    {
        float _4032 = _4008 * _4008;
        _1897 = _4032;
    }
    float _4034 = _1897;
    int _4036 = ~_4020;
    int _4038 = _4036 + 1;
    int _4040 = _4038 + 1;
    if (_1879)
    {
        float _4042 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _4044 = _1965 + _4042;
        _4030 = _4044;
    }
    float _4046 = _4030;
    int _4048 = ~_3670;
    int _4050 = _4048 + 1;
    int _4052 = abs(_4028);
    int _4054 = _4040 * as_type<int>(_3822);
    int _4056 = _4054 + _4018;
    bool _4058 = _3750 != 3;
    if (_1879)
    {
        float _4060 = _4046 * _4046;
        _1899 = _4060;
    }
    float _4062 = _1899;
    int _4064 = ~_3506;
    int _4066 = _4064 + 1;
    float _4068 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].w;
    int _4070 = int(_3896) + int(_4014);
    int _4072 = int(_3876) + int(_3978);
    int _4074 = ~_4052;
    int _4076 = _4074 + 1;
    int _4078 = _4076 + 1;
    int _4080 = _4050 * _4070;
    int _4082 = _4080 + _3782;
    bool _4084 = !_4058;
    int _4086 = _4084 ? 0 : (-1);
    int _4088 = _4066 * _4072;
    int _4090 = _4088 + _3758;
    bool _4092 = !_2658;
    int _4094 = _4092 ? _3568 : (-1);
    int _4096 = _4078 * as_type<int>(_3868);
    int _4098 = _4096 + _4024;
    int _4100 = abs(_4086);
    bool _4102 = uint(_4082) >= uint(_3670);
    float _4104 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _4106 = _4002 + _4104;
    int _4108 = _3758 ^ _3506;
    bool _4110 = uint(_4090) >= uint(_3506);
    float _4112 = fma(_4106, _4106, _4034);
    int _4114 = ~_4100;
    int _4116 = _4114 + 1;
    int _4118 = _4116 + 1;
    float _4120 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].z;
    bool _4122 = !_4102;
    int _4124 = _4122 ? 0 : (-1);
    float _4126 = _4068 * (*spvDescriptorSet0.vp_c9)._m0[90].y;
    uint _4128 = uint(int(uint(_4108) >> uint(31)));
    int _4130 = _4118 * as_type<int>(_3830);
    int _4132 = _4130 + _4056;
    bool _4134 = !_4110;
    int _4136 = _4134 ? 0 : (-1);
    float _4138 = _4112 + _4062;
    bool _4140 = !_3178;
    int _4142 = _4140 ? 0 : 1;
    int _4144 = ~_4124;
    int _4146 = _4070 + _4144;
    int _4148 = _4146 + 1;
    int _4150 = ~int(_4128);
    int _4152 = _4150 + 1;
    float _4154 = sqrt(_4138);
    int _4156 = ~_4072;
    int _4158 = _4156 + _4136;
    int _4160 = _4158 + 1;
    int _4162 = abs(_4142);
    bool _4164 = !_3186;
    int _4166 = _4164 ? 0 : 1;
    int _4168 = _3506 * _4160;
    int _4170 = _4168 + _3758;
    int _4172 = _4148 ^ _4152;
    int _4174 = ~_4162;
    int _4176 = _4174 + 1;
    int _4178 = _4176 + 1;
    int _4180 = abs(_4166);
    bool _4182 = _3506 == 0;
    int _4184 = _4098 * _4178;
    bool _4186 = _3506 == 0;
    int _4188 = ~_4152;
    int _4190 = _4188 + _4172;
    int _4192 = _4190 + 1;
    int _4194 = _3582 * _4162;
    int _4196 = _4194 + _4184;
    int _4198 = ~_4180;
    int _4200 = _4198 + 1;
    int _4202 = _4200 + 1;
    bool _4204 = !_4182;
    int _4206 = _4204 ? _4170 : (-1);
    bool _4208 = !_4186;
    int _4210 = _4208 ? _4192 : (-1);
    int _4212 = _4132 * _4202;
    float _4214 = float(_4206);
    float _4216 = _4120 * (*spvDescriptorSet0.vp_c9)._m0[90].x;
    float _4218 = float(_4210);
    int _4220 = _4094 * _4180;
    int _4222 = _4220 + _4212;
    out.m_92.x = _1975;
    out.m_92.y = _1977;
    out.m_92.z = _1979;
    float _4224 = fma(_4216, _4214, _1651);
    float _4226 = _1273 + 0.5;
    float _4228 = -_1653;
    float _4230 = fma(_4126, _4218, _4228);
    float _4232 = _1265 + (-0.5);
    float _4234 = float(_4222);
    float _4236 = fma(_4216, _4226, _4224);
    float _4238 = _3640 + _3800;
    float _4240 = -_4126;
    float _4242 = fma(_4240, _4232, _4230);
    float _4244 = float(_4196);
    float _4246 = -_2065;
    float _4248 = fma(_1273, _4246, _4236);
    float _4250 = _3638 + _3634;
    float _4252 = fma(_1265, _2073, _4242);
    float _4254 = _3652 + _3806;
    out.m_94.x = _4244;
    bool _4256 = _4154 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _4258 = isnan(_4154);
    bool _4260 = _4256 || _4258;
    bool _4262 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _4264 = _4260 || _4262;
    out.m_94.w = _4234;
    out.m_96.x = _4248;
    out.m_96.y = _4252;
    out.m_98.x = _4250;
    out.m_98.y = _4238;
    out.m_98.z = _4254;
    float _4266 = _4216;
    if (!_4264)
    {
        _4266 = 1.0;
    }
    float _4268 = _4266;
    bool _4270 = !_4264;
    float _4272 = _4268;
    if (!_4270)
    {
        bool _4274 = _4154 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _4276 = isnan(_4154);
        bool _4278 = _4274 || _4276;
        bool _4280 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _4282 = _4278 || _4280;
        if (!_4282)
        {
            float _4284 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _4286 = _4154 + _4284;
            float _4288 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _4290 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _4288;
            float _4292 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _4294 = _4292 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _4296 = 1.0 / _4290;
            float _4298 = _4286 * _4296;
            float _4300 = fma(_4298, _4294, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _4272 = _4300;
            _4302 = true;
        }
        else
        {
            bool _4304 = _4154 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _4306 = isnan(_4154);
            bool _4308 = _4304 || _4306;
            bool _4310 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _4312 = _4308 || _4310;
            if (!_4312)
            {
                float _4314 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _4316 = _4154 + _4314;
                float _4318 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _4320 = _4318 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _4322 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _4324 = _4322 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _4326 = 1.0 / _4320;
                float _4328 = _4316 * _4326;
                float _4330 = fma(_4328, _4324, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _4272 = _4330;
                _4302 = true;
            }
            else
            {
                _4272 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _4302 = false;
    float _4332 = _4272;
    float _4334 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _4336 = _4002 + _4334;
    float _4338 = _1877 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _4340 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _4342 = _1961 + _4340;
    float _4344 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _4346 = _1965 + _4344;
    float _4348 = fma(_4336, _4332, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _4350 = fma(_1777, (*spvDescriptorSet0.vp_c8)._m0[11].x, _4338);
    float _4352 = fma(_4342, _4332, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _4354 = fma(_4346, _4332, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _4356 = -_1877;
    float _4358 = _4356 + _4348;
    float _4360 = fma(_1787, (*spvDescriptorSet0.vp_c8)._m0[11].z, _4350);
    float _4362 = -_1777;
    float _4364 = _4362 + _4352;
    float _4366 = _1877 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _4368 = _4358 * _4358;
    float _4370 = _4360 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _4372 = -_1787;
    float _4374 = _4372 + _4354;
    float _4376 = fma(_1777, (*spvDescriptorSet0.vp_c8)._m0[10].x, _4366);
    float _4378 = fma(_4364, _4364, _4368);
    float _4380 = 1.0 / _4370;
    float _4382 = fma(_1787, (*spvDescriptorSet0.vp_c8)._m0[10].z, _4376);
    float _4384 = fma(_4374, _4374, _4378);
    float _4386 = _4382 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _4388 = sqrt(_4384);
    float _4390 = _4386 + _4370;
    float _4392 = _4390 * _4380;
    float _4394 = _4392 * 0.5;
    bool _4396 = _4388 > 0.0;
    float _4398 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _4400 = fma(_4394, (*spvDescriptorSet0.vp_c8)._m0[30].w, _4398);
    float _4402 = 1.0 / _4400;
    bool _4404 = (*spvDescriptorSet0.vp_c15)._m0[660].y >= 0.5;
    bool _4406 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _4408 = _4404 || _4406;
    bool _4410 = isnan(0.5);
    bool _4412 = _4408 || _4410;
    bool _4414 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _4416 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _4418 = _4414 || _4416;
    bool _4420 = isnan(0.5);
    bool _4422 = _4418 || _4420;
    float _4424 = (*spvDescriptorSet0.vp_c15)._m0[660].y;
    float _4426 = (*spvDescriptorSet0.vp_c15)._m0[653].w;
    float _4428 = _4346;
    float _4430 = _4380;
    float _4432 = _4400;
    float _4434 = _4348;
    if (!_4396)
    {
        _4424 = _4352;
    }
    float _4436 = _4424;
    float _4438 = _4436;
    if (!_4396)
    {
        _4426 = _4348;
    }
    float _4440 = _4426;
    float _4442 = _4440;
    float _4444 = _4440;
    if (!_4396)
    {
        _4428 = _4354;
    }
    float _4446 = _4428;
    bool _4448 = !_4396;
    float _4450 = _4446;
    float _4452 = _4446;
    if (!_4448)
    {
        float _4454 = _247 * _247;
        float _4456 = rsqrt(_4384);
        float _4458 = fma(_243, _243, _4454);
        float _4460 = fma(_249, _249, _4458);
        float _4462 = sqrt(_4460);
        float _4464 = _4364 * _4456;
        float _4466 = _4358 * _4456;
        float _4468 = _4374 * _4456;
        bool _4470 = _4462 > 0.0;
        float _4472 = _4462;
        _4430 = _4464;
        _4432 = _4456;
        if (!_4470)
        {
            _4472 = _4352;
        }
        float _4474 = _4472;
        _4438 = _4474;
        if (!_4470)
        {
            _4442 = _4348;
        }
        float _4476 = _4442;
        _4444 = _4476;
        if (!_4470)
        {
            _4450 = _4354;
        }
        float _4478 = _4450;
        bool _4480 = !_4470;
        _4452 = _4478;
        if (!_4480)
        {
            float _4482 = rsqrt(_4460);
            float _4484 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].z;
            float _4486 = _247 * _4482;
            float _4488 = _243 * _4482;
            float _4490 = _249 * _4482;
            float _4492 = _4466 * _4486;
            float _4494 = fma(_4464, _4488, _4492);
            float _4496 = _4484 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _4498 = fma(_4468, _4490, _4494);
            float _4500 = _4498 * _4496;
            float _4502 = fma(_243, _4500, _4352);
            float _4504 = fma(_247, _4500, _4348);
            float _4506 = fma(_249, _4500, _4354);
            _4444 = _4504;
            _4452 = _4506;
            _4438 = _4502;
            _4432 = _4500;
        }
    }
    float _4508 = _4444;
    float _4510 = _4452;
    float _4512 = _4438;
    float _4514 = _4430;
    float _4516 = _4432;
    float _4518 = _4516;
    float _4520 = _4508;
    float _4522 = _4512;
    float _4524 = _4510;
    float _4526 = _4514;
    if (_4422)
    {
        _4518 = 1.0;
    }
    float _4528 = _4518;
    float _4530 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _4532 = _4402 * _4530;
    float _4534 = _4528;
    if (!_4412)
    {
        float _4536 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _4538 = _1877 + _4536;
        float _4540 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _4542 = _1777 + _4540;
        float _4544 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _4546 = -_1877;
        float _4548 = _4546 + _4508;
        float _4550 = _4538 * _4538;
        float _4552 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _4554 = _1787 + _4552;
        float _4556 = -_1787;
        float _4558 = _4556 + _4510;
        float _4560 = fma(_4542, _4542, _4550);
        float _4562 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _4564 = fma(_4554, _4554, _4560);
        float _4566 = sqrt(_4564);
        float _4568 = _4544 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _4570 = precise::min(_4566, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _4572 = _4570 * _4562;
        float _4574 = _4568 * _4572;
        float _4576 = -_1777;
        float _4578 = _4576 + _4512;
        float _4580 = fma(_4548, _4574, _1877);
        float _4582 = fma(_4578, _4574, _1777);
        float _4584 = fma(_4558, _4574, _1787);
        _4520 = _4580;
        _4522 = _4582;
        _4524 = _4584;
    }
    float _4586 = _4520;
    float _4588 = _4522;
    float _4590 = _4524;
    if (!_4422)
    {
        float _4592 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _4594 = _4592 * 0.15915493667125701904296875;
        float _4596 = _4594 * 6.283185482025146484375;
        float _4598 = cos(_4596);
        float _4600 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _4602 = _4600 * 0.15915493667125701904296875;
        float _4604 = _4594 * 6.283185482025146484375;
        float _4606 = sin(_4604);
        float _4608 = 1.0 / _4598;
        float _4610 = _4602 * 6.283185482025146484375;
        float _4612 = cos(_4610);
        float _4614 = _4606 * _4608;
        float _4616 = _4602 * 6.283185482025146484375;
        float _4618 = sin(_4616);
        float _4620 = _4612 * _4614;
        float _4622 = 1.0 / _4620;
        float _4624 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _4626 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _4624;
        float _4628 = 1.0 / _4626;
        float _4630 = _4618 * _4622;
        float _4632 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _4634 = fma(_4532, _4630, _4632);
        float _4636 = _4634 * _4628;
        float _4638 = precise::clamp(_4636, 0.0, 1.0);
        _4534 = _4638;
    }
    float _4640 = _4534;
    float _4642 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _4644 = _4586 + _4642;
    float _4646 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _4648 = _4588 + _4646;
    float _4650 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _4652 = _4590 + _4650;
    float _4654 = _4644 * _4644;
    float _4656 = fma(_4648, _4648, _4654);
    float _4658 = fma(_1777, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _4660 = fma(_4652, _4652, _4656);
    float _4662 = rsqrt(_4660);
    float _4664 = sqrt(_4660);
    float _4666 = _4662 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _4668 = _4586 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _4670 = _4648 * _4666;
    float _4672 = _4652 * _4666;
    float _4674 = fma(_4588, (*spvDescriptorSet0.vp_c8)._m0[2].x, _4668);
    float _4676 = _4670 * _4670;
    float _4678 = _4672 * _4672;
    float _4680 = fma(_4590, (*spvDescriptorSet0.vp_c8)._m0[2].z, _4674);
    float _4682 = _4676 + _4678;
    float _4684 = _4680 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _4686 = _4586 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _4688 = sqrt(_4682);
    float _4690 = fma(_4588, (*spvDescriptorSet0.vp_c8)._m0[3].x, _4686);
    float _4692 = fma(_4590, (*spvDescriptorSet0.vp_c8)._m0[3].z, _4690);
    float _4694 = _4692 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    bool _4696 = _4688 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _4698 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _4700 = _4688 + _4698;
    float _4702 = _4662;
    float _4704 = _4682;
    float _4706 = _4700;
    float _4708 = _4644;
    float _4710 = (*spvDescriptorSet0.vp_c15)._m0[652].x;
    if (_4696)
    {
        float _4712 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _4702 = _4712;
    }
    float _4714 = _4702;
    if (_4696)
    {
        float _4716 = rsqrt(_4682);
        _4704 = _4716;
    }
    float _4718 = _4704;
    float _4720 = _4718;
    if (_4696)
    {
        float _4722 = _4700 * _4714;
        _4706 = _4722;
    }
    float _4724 = _4706;
    if (_4696)
    {
        float _4726 = _4724 * 0.15915493667125701904296875;
        _4526 = _4726;
    }
    float _4728 = _4526;
    float _4730 = _4652;
    if (_4696)
    {
        float _4732 = _4728 * 6.283185482025146484375;
        float _4734 = sin(_4732);
        _4730 = _4734;
    }
    float _4736 = _4730;
    float _4738 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _4740 = precise::max(0.0, _4738);
    float _4742 = _4714;
    float _4744 = _4740;
    if (_4696)
    {
        float _4746 = _4728 * 6.283185482025146484375;
        float _4748 = cos(_4746);
        _4742 = _4748;
    }
    float _4750 = _4742;
    float _4752 = -_4666;
    float _4754 = -_4740;
    float _4756 = fma(_4644, _4752, _4754);
    if (_4696)
    {
        float _4758 = _4756 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _4708 = _4758;
    }
    float _4760 = _4708;
    float _4762 = floor(_4658);
    float _4764 = _4760;
    float _4766 = _4736;
    if (_4696)
    {
        float _4768 = fma(_4736, _4760, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _4764 = _4768;
    }
    float _4770 = _4764;
    float _4772 = _4770;
    if (!_4696)
    {
        _4766 = _4670;
    }
    float _4774 = _4766;
    float _4776 = _4774;
    float _4778 = _4750;
    if (_4696)
    {
        float _4780 = _4750 + (-1.0);
        _4744 = _4780;
    }
    float _4782 = _4744;
    float _4784 = _4782;
    if (_4696)
    {
        float _4786 = _4718 * _4770;
        _4710 = _4786;
    }
    float _4788 = _4710;
    if (!_4696)
    {
        _4772 = _4756;
    }
    float _4790 = _4772;
    float _4792 = _4790;
    if (_4696)
    {
        float _4794 = _4782 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _4434 = _4794;
    }
    float _4796 = _4434;
    if (_4696)
    {
        float _4798 = _4670 * _4788;
        _4776 = _4798;
    }
    float _4800 = _4776;
    if (!_4696)
    {
        _4784 = _4672;
    }
    float _4802 = _4784;
    float _4804 = _4802;
    if (_4696)
    {
        float _4806 = _4672 * _4788;
        _4804 = _4806;
    }
    float _4808 = _4804;
    if (!_4696)
    {
        _4720 = _4676;
    }
    float _4810 = _4720;
    float _4812 = _4810;
    if (_4696)
    {
        float _4814 = fma(_4756, _4750, _4796);
        _4792 = _4814;
    }
    float _4816 = _4792;
    if (_4696)
    {
        float _4818 = _4800 * _4800;
        _4812 = _4818;
    }
    float _4820 = _4812;
    if (!_4696)
    {
        _4778 = _4678;
    }
    float _4822 = _4778;
    float _4824 = _4822;
    if (_4696)
    {
        float _4826 = _4808 * _4808;
        _4824 = _4826;
    }
    float _4828 = _4824;
    float _4830 = fma(_4816, _4816, _4820);
    float _4832 = -_4762;
    float _4834 = _4658 + _4832;
    float _4836 = _4830 + _4828;
    float _4838 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _4840 = fma(_4664, (*spvDescriptorSet0.vp_c15)._m0[23].w, _4838);
    float _4842 = precise::clamp(_4840, 0.0, 1.0);
    float _4844 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _4846 = rsqrt(_4836);
    float _4848 = -_4842;
    float _4850 = _4848 + 1.0;
    float _4852 = _4684 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _4854 = fma(_1787, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _4856 = _4586 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _4858 = -_4852;
    float _4860 = fma(_4858, _4844, 1.0);
    float _4862 = _4586 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _4864 = fma(_4588, (*spvDescriptorSet0.vp_c8)._m0[1].x, _4856);
    float _4866 = abs(_4850);
    float _4868 = log2(_4866);
    float _4870 = fma(_4588, (*spvDescriptorSet0.vp_c8)._m0[0].x, _4862);
    float _4872 = fma(_4590, (*spvDescriptorSet0.vp_c8)._m0[1].z, _4864);
    float _4874 = fma(_4590, (*spvDescriptorSet0.vp_c8)._m0[0].z, _4870);
    float _4876 = _4846 * _4800;
    float _4878 = _4872 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _4880 = _4846 * _4816;
    float _4882 = _4846 * _4808;
    float _4884 = _4876 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _4886 = _4874 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _4888 = floor(_4854);
    float _4890 = _4878 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _4892 = -_4884;
    float _4894 = fma(_4880, (*spvDescriptorSet0.vp_c15)._m0[21].y, _4892);
    float _4896 = _4878 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _4898 = _4868 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _4900 = fma(_4886, (*spvDescriptorSet0.vp_c8)._m0[5].x, _4890);
    float _4902 = -_4882;
    float _4904 = fma(_4902, (*spvDescriptorSet0.vp_c15)._m0[21].z, _4894);
    float _4906 = fma(_4886, (*spvDescriptorSet0.vp_c8)._m0[7].x, _4896);
    float _4908 = exp2(_4898);
    float _4910 = fma(_4904, -0.5, 0.5);
    float _4912 = fma(_4684, (*spvDescriptorSet0.vp_c8)._m0[7].z, _4906);
    float _4914 = _4878 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _4916 = fma(_4694, (*spvDescriptorSet0.vp_c8)._m0[7].w, _4912);
    float _4918 = log2(_4860);
    float _4920 = -_4888;
    float _4922 = _4854 + _4920;
    float _4924 = fma(_4886, (*spvDescriptorSet0.vp_c8)._m0[4].x, _4914);
    float _4926 = fma(_4684, (*spvDescriptorSet0.vp_c8)._m0[5].z, _4900);
    float _4928 = fma(_4904, 0.5, 0.5);
    float _4930 = _4880 + 1.0;
    float _4932 = fma(_4684, (*spvDescriptorSet0.vp_c8)._m0[4].z, _4924);
    float _4934 = fma(_4694, (*spvDescriptorSet0.vp_c8)._m0[5].w, _4926);
    float _4936 = 1.0 / _4916;
    float _4938 = -_4880;
    float _4940 = fma(_4908, _4930, _4938);
    float _4942 = fma(_4928, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _4944 = fma(_4694, (*spvDescriptorSet0.vp_c8)._m0[4].w, _4932);
    float _4946 = fma(_4940, 0.5, 0.5);
    float _4948 = fma(_4928, _4942, -0.212114393711090087890625);
    float _4950 = sqrt(_4910);
    float _4952 = _4918 * 0.693147182464599609375;
    float _4954 = fma(_4928, _4948, 1.570728778839111328125);
    float _4956 = _4952 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _4958 = _4934 * _4936;
    float _4960 = _4944 * _4936;
    float _4962 = fma(_4958, -0.5, 0.5);
    float _4964 = fma(_4960, 0.5, 0.5);
    float2 _12760 = float2(_4834, _4922);
    float _4966 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_12760, float2(0.0), isnan(_12760)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_12760, float2(0.0), isnan(_12760)), level(0.0)).x;
    float _4968 = _4950 * 0.636619746685028076171875;
    float3 _12772 = float3(_4964, _4962, _4956);
    float _4970 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_12772, float3(0.0), isnan(_12772)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_12772, float3(0.0), isnan(_12772)), level(0.0)).x;
    float3 _12783 = float3(_4964, _4962, _4956);
    float4 _4973 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_12783, float3(0.0), isnan(_12783)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_12783, float3(0.0), isnan(_12783)), level(0.0)).xyzw;
    float _4975 = _4973.x;
    float _4977 = _4973.y;
    float _4979 = _4973.z;
    float _4981 = _4973.w;
    float _4983 = -_4954;
    float _4985 = fma(_4968, _4983, 1.0);
    float2 _12804 = float2(_4985, _4946);
    float3 _4987 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_12804, float2(0.0), isnan(_12804)), level(0.0)), spvDescriptorSet0.dm_border, 4u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_12804, float2(0.0), isnan(_12804)), level(0.0)).xyz;
    float _4989 = _4987.x;
    float _4991 = _4987.y;
    float _4993 = _4987.z;
    float _4995 = abs(_4532);
    float _4997 = log2(_4995);
    float _4999 = _4878 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _5001 = _4868 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    out.m_100.x = _4588;
    out.m_100.y = _4586;
    out.m_100.z = _4590;
    float _5003 = fma(_4886, (*spvDescriptorSet0.vp_c8)._m0[6].x, _4999);
    bool _5005 = _4664 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _5007 = isnan(_4664);
    bool _5009 = _5005 || _5007;
    bool _5011 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _5013 = _5009 || _5011;
    float _5015 = fma(_4684, (*spvDescriptorSet0.vp_c8)._m0[6].z, _5003);
    float _5017 = exp2(_5001);
    bool _5019 = _4532 <= 8000.0;
    bool _5021 = isnan(_4532);
    bool _5023 = _5019 || _5021;
    bool _5025 = isnan(8000.0);
    bool _5027 = _5023 || _5025;
    float _5029 = float(_5027);
    float _5031 = _4944 + _4916;
    float _5033 = fma(_4694, (*spvDescriptorSet0.vp_c8)._m0[6].w, _5015);
    float _5035 = _4997 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _5037 = in.m_102.x;
    out.gl_Position.x = _4944;
    out.gl_Position.y = _4934;
    out.gl_Position.z = _5033;
    out.gl_Position.w = _4916;
    float _5039 = exp2(_5035);
    float _5041 = -_5017;
    float _5043 = _5041 + 1.0;
    float _5045 = _5043 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _5047 = -_5045;
    float _5049 = _5047 + 1.0;
    float _5051 = fma(_5039, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _5053 = precise::clamp(_5051, 0.0, 1.0);
    float _5055 = _4916 * 0.5;
    float _5057 = fma(_5053, -2.0, 3.0);
    float _5059 = _5053 * _5053;
    float _5061 = _5059 * _5057;
    float _5063 = _5033 + _4916;
    float _5065 = -_5061;
    float _5067 = _5065 + 1.0;
    float _5069 = _5063 * 0.5;
    float _5071 = _4916;
    float _5073 = _5033;
    float _5075 = _4934;
    float _5077 = _5049;
    if (!_5013)
    {
        _5071 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _5079 = _5071;
    float _5081 = fma(_5067, (*spvDescriptorSet0.vp_c15)._m0[654].w, _5061);
    float _5083 = fma(_4934, -0.5, _5055);
    float _5085 = _5031 * 0.5;
    float _5087 = _5029 * _5081;
    float _5089 = _5079;
    float _5091 = _5079;
    if (!_5013)
    {
        _5073 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _5093 = _5073;
    out.m_104.x = _5085;
    out.m_104.y = _5083;
    out.m_104.z = _5069;
    out.m_104.w = _4916;
    float _5095 = _5087 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _5097 = _5093;
    float _5099 = _5093;
    if (!_5013)
    {
        _5075 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _5101 = _5075;
    float _5103 = _4640 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _5105 = -_4966;
    float _5107 = _5105 + 1.0;
    float _5109 = _5045 * _4970;
    float _5111 = _5107 * _5095;
    float _5113 = precise::clamp(_5111, 0.0, 1.0);
    float _5115 = _4981 * _5049;
    float _5117 = _5101;
    float _5119 = _5101;
    if (!_5013)
    {
        _5077 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _5121 = _5077;
    float _5123 = -_5113;
    float _5125 = fma(_5123, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _5127 = _4981 * _5109;
    float _5129 = _5125 * _5037;
    float _5131 = _4993 * _5109;
    float _5133 = fma(_4989, _5127, _4975);
    float _5135 = fma(_4991, _5127, _4977);
    float _5137 = _5129 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _5139 = fma(_4981, _5131, _4979);
    float _5141 = _5129;
    float _5143 = _5127;
    float _5145 = _5121;
    float _5147 = _5121;
    if (!_5013)
    {
        _5141 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _5149 = _5141;
    float _5151 = _5149;
    float _5153 = _5149;
    if (!_5013)
    {
        _5143 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _5155 = _5143;
    out.m_106.x = _5137;
    out.m_108.x = _5133;
    out.m_108.y = _5135;
    out.m_108.z = _5139;
    out.m_108.w = _5115;
    bool _5157 = !_5013;
    float _5159 = _5155;
    float _5161 = _5155;
    if (!_5157)
    {
        bool _5163 = _4664 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _5165 = isnan(_4664);
        bool _5167 = _5163 || _5165;
        bool _5169 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _5171 = _5167 || _5169;
        if (!_5171)
        {
            float _5173 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _5175 = _4664 + _5173;
            float _5177 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _5179 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _5177;
            float _5181 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _5183 = _5181 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _5185 = 1.0 / _5179;
            float _5187 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _5189 = _5187 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _5191 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _5193 = _5191 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _5195 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _5197 = _5195 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _5199 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _5201 = _5199 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _5203 = _5175 * _5185;
            float _5205 = precise::clamp(_5203, 0.0, 1.0);
            float _5207 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _5209 = _5207 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _5211 = fma(_5205, _5183, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _5213 = fma(_5205, _5209, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _5215 = fma(_5205, _5189, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _5217 = fma(_5205, _5193, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _5219 = fma(_5205, _5197, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _5221 = fma(_5205, _5201, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _5091 = _5215;
            _5147 = _5219;
            _5153 = _5211;
            _5119 = _5217;
            _5099 = _5213;
            _5161 = _5221;
            _5223 = true;
        }
        else
        {
            bool _5225 = _4664 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _5227 = isnan(_4664);
            bool _5229 = _5225 || _5227;
            bool _5231 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _5233 = _5229 || _5231;
            if (!_5233)
            {
                _5151 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _5235 = _5151;
            _5153 = _5235;
            if (!_5233)
            {
                _5089 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _5237 = _5089;
            _5091 = _5237;
            if (!_5233)
            {
                _5097 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _5239 = _5097;
            _5099 = _5239;
            if (!_5233)
            {
                _5117 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _5241 = _5117;
            _5119 = _5241;
            if (!_5233)
            {
                _5145 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _5243 = _5145;
            _5147 = _5243;
            if (!_5233)
            {
                _5159 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _5245 = _5159;
            bool _5247 = !_5233;
            _5161 = _5245;
            if (!_5247)
            {
                bool _5249 = _4664 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _5251 = isnan(_4664);
                bool _5253 = _5249 || _5251;
                bool _5255 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _5257 = _5253 || _5255;
                if (!_5257)
                {
                    float _5259 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _5261 = _4664 + _5259;
                    float _5263 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _5265 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _5263;
                    float _5267 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _5269 = _5267 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _5271 = 1.0 / _5265;
                    float _5273 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _5275 = _5273 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _5277 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _5279 = _5277 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _5281 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _5283 = _5281 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _5285 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _5287 = _5285 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _5289 = _5261 * _5271;
                    float _5291 = precise::clamp(_5289, 0.0, 1.0);
                    float _5293 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _5295 = _5293 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _5297 = fma(_5291, _5269, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _5299 = fma(_5291, _5295, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _5301 = fma(_5291, _5275, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _5303 = fma(_5291, _5279, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _5305 = fma(_5291, _5283, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _5307 = fma(_5291, _5287, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _5091 = _5301;
                    _5147 = _5305;
                    _5153 = _5297;
                    _5119 = _5303;
                    _5099 = _5299;
                    _5161 = _5307;
                    _5223 = true;
                }
                else
                {
                    _5091 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _5147 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _5153 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _5119 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _5099 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _5161 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _5223 = false;
    float _5309 = _5091;
    float _5311 = _5147;
    float _5313 = _5153;
    float _5315 = _5119;
    float _5317 = _5099;
    float _5319 = _5161;
    float _5321 = fma(_4238, -0.5, 0.5);
    float _5323 = precise::clamp(_5321, 0.0, 1.0);
    float _5325 = -_5309;
    float _5327 = _5325 + _5311;
    float _5329 = _5103 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _5331 = -_5313;
    float _5333 = _5331 + _5315;
    out.m_110.x = 0.0;
    float _5335 = fma(_5323, _5327, _5309);
    float _5337 = fma(_5323, _5333, _5313);
    out.m_57.x = _5329;
    float _5339 = -_5317;
    float _5341 = _5339 + _5319;
    float _5343 = _5335 * 0.586610972881317138671875;
    bool _5345 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _5347 = fma(_5323, _5341, _5317);
    float _5349 = fma(_5337, 0.298911988735198974609375, _5343);
    bool _5351 = _4640 > 0.0;
    bool _5353 = isnan(_4640);
    bool _5355 = _5351 || _5353;
    bool _5357 = isnan(0.0);
    bool _5359 = _5355 || _5357;
    float _5361 = fma(_5347, 0.114477999508380889892578125, _5349);
    float _5363 = -_5361;
    float _5365 = _5337 + _5363;
    float _5367 = -_5361;
    float _5369 = _5335 + _5367;
    float _5371 = -_5361;
    float _5373 = _5347 + _5371;
    float _5375 = fma(_5365, (*spvDescriptorSet0.vp_c13)._m0[1].z, _5361);
    float _5377 = fma(_5369, (*spvDescriptorSet0.vp_c13)._m0[1].z, _5361);
    float _5379 = fma(_5373, (*spvDescriptorSet0.vp_c13)._m0[1].z, _5361);
    bool _5381 = !_5345;
    if (!_5381)
    {
        float _5383 = -_4586;
        float _5385 = _5383 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _5387 = -_4588;
        float _5389 = _5387 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _5391 = -_4590;
        float _5393 = _5391 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _5395 = _5385 * _5385;
        float _5397 = fma(_5389, _5389, _5395);
        float _5399 = fma(_5393, _5393, _5397);
        float _5401 = sqrt(_5399);
        float _5403 = rsqrt(_5399);
        float _5405 = -_5401;
        float _5407 = _5405 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _5409 = _5407 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _5411 = precise::clamp(_5409, 0.0, 1.0);
        float _5413 = _5389 * _5403;
        float _5415 = _5385 * _5403;
        float _5417 = abs(_5411);
        float _5419 = log2(_5417);
        float _5421 = _5393 * _5403;
        float _5423 = _5413 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _5425 = _4238 * _5415;
        float _5427 = -_5415;
        float _5429 = -_5423;
        float _5431 = fma(_5427, (*spvDescriptorSet0.vp_c15)._m0[656].y, _5429);
        float _5433 = fma(_4250, _5413, _5425);
        float _5435 = -_5421;
        float _5437 = fma(_5435, (*spvDescriptorSet0.vp_c15)._m0[656].z, _5431);
        float _5439 = fma(_4254, _5421, _5433);
        float _5441 = precise::clamp(_5439, 0.0, 1.0);
        float _5443 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _5445 = _5437 + _5443;
        float _5447 = _5419 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _5449 = _5445 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _5451 = precise::clamp(_5449, 0.0, 1.0);
        float _5453 = exp2(_5447);
        float _5455 = _5453 * _5451;
        float _5457 = _5441 * _5455;
        float _5459 = _5457 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _5461 = _5457 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _5463 = _5457 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_110.x = _5459;
        out.m_110.y = _5461;
        out.m_110.z = _5463;
    }
    out.m_112.x = _5375;
    out.m_112.y = _5377;
    out.m_112.z = _5379;
    if (_5359)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    out.m_57.x = 0.0;
    float _5465 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _5465;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_74 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_76 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_57 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_112 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_55 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_86 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_104 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_78 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_84 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_96 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_82 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_94 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_90 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_98 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_100 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_88 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_110 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_92 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_106 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_108 = float4(0.0, 0.0, 0.0, 1.0);
    bool _5223 = false;
    bool _4302 = false;
    bool _739 = false;
    bool _565 = false;
    bool _459 = false;
    bool _271 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _126 = in.m_50.w;
    float _128 = in.m_52.w;
    float _130 = trunc(_126);
    int _133 = int(_130);
    float _135 = -_128;
    float _137 = _135 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    out.m_55.y = _137;
    bool _141 = _133 >= 1;
    float _143 = 0.0;
    float _145 = _128;
    float _147 = _137;
    if (!_141)
    {
        _143 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _149 = _143;
    if (!_141)
    {
        out.m_57.x = 0.0;
    }
    int _151 = 0;
    if (!_141)
    {
        float _153 = _149 * 5.0;
        _151 = as_type<int>(_153);
    }
    int _155 = _151;
    int _157 = _155;
    if (!_141)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _5533 = as_type<float>(_155);
        out.gl_Position.z = _5533;
    }
    if (!_141)
    {
        return out;
    }
    bool _159 = _128 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _161 = isnan(_128);
    bool _163 = _159 || _161;
    bool _165 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _167 = _163 || _165;
    float _169 = float(_133);
    bool _171 = _137 >= _169;
    bool _173 = !_167;
    bool _175 = _171 || _173;
    float _177 = 1.0 / _169;
    if (_175)
    {
        _145 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _179 = _145;
    if (_175)
    {
        out.m_57.x = 0.0;
    }
    float _181 = _137 * _177;
    float _183 = _181;
    if (_175)
    {
        float _185 = _179 * 5.0;
        _157 = as_type<int>(_185);
    }
    int _187 = _157;
    out.m_55.x = _181;
    if (_175)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _5596 = as_type<float>(_187);
        out.gl_Position.z = _5596;
    }
    if (_175)
    {
        return out;
    }
    float _189 = as_type<float>(int(gl_VertexIndex));
    float _191 = in.m_62.x;
    float _193 = in.m_62.y;
    float _195 = in.m_62.z;
    float _197 = in.m_64.x;
    float _199 = in.m_64.y;
    float _201 = in.m_64.z;
    float _203 = in.m_66.x;
    float _205 = in.m_66.y;
    float _207 = in.m_66.z;
    float _209 = in.m_68.x;
    float _211 = in.m_68.y;
    float _213 = in.m_68.z;
    int _215 = as_type<int>(_189) & 1;
    bool _217 = _215 != 0;
    int _219 = as_type<int>(_189) & 2;
    bool _221 = _219 != 0;
    bool _223 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    bool _225 = !_217;
    float _227 = _225 ? (-0.5) : 0.5;
    bool _229 = !_221;
    float _231 = _229 ? (-0.5) : 0.5;
    float _233 = _193 * _199;
    float _235 = _193 * _205;
    float _237 = fma(_191, _197, _233);
    float _239 = _193 * _211;
    float _241 = fma(_191, _203, _235);
    float _243 = fma(_195, _201, _237);
    float _245 = fma(_191, _209, _239);
    float _247 = fma(_195, _207, _241);
    float _249 = fma(_195, _213, _245);
    bool _251 = !_223;
    float _269;
    if (!_251)
    {
        float _253 = in.m_70.x;
        float _255 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _257 = _253 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _259 = fma(_257, (*spvDescriptorSet0.vp_c9)._m0[12].x, _137);
        float _261 = _259 * _255;
        float _263 = floor(_261);
        float _265 = -_263;
        float _267 = _261 + _265;
        _269 = _267;
        _271 = true;
    }
    else
    {
        _269 = _181;
    }
    _271 = false;
    float _273 = _269;
    float _275 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _277 = _273 + _275;
    float _279 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _281 = _273 + _279;
    float _283 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _285 = _273 + _283;
    float _287 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _289 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _287;
    float _291 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _293 = _291 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _295 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _297 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _295;
    bool _299 = _273 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _301 = isnan(_273);
    bool _303 = _299 || _301;
    bool _305 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _307 = _303 || _305;
    float _309 = float(_307);
    float _311 = 1.0 / _289;
    bool _313 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _315 = 1.0 / _297;
    float _317 = 1.0 / _293;
    float _319 = _277 * _311;
    bool _321 = _273 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _323 = isnan(_273);
    bool _325 = _321 || _323;
    bool _327 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _329 = _325 || _327;
    float _331 = float(_329);
    float _333 = -_309;
    float _335 = _333 + 1.0;
    float _337 = _331 * _335;
    float _339 = _281 * _315;
    bool _341 = _273 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _343 = isnan(_273);
    bool _345 = _341 || _343;
    bool _347 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _349 = _345 || _347;
    float _351 = float(_349);
    float _353 = -_331;
    float _355 = _353 + 1.0;
    float _357 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _359 = _357 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _361 = _351 * _355;
    float _363 = -_351;
    float _365 = _363 + 1.0;
    float _367 = _285 * _317;
    bool _369 = _273 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _371 = isnan(_273);
    bool _373 = _369 || _371;
    bool _375 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _377 = _373 || _375;
    float _379 = float(_377);
    float _381 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _383 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _381;
    float _385 = fma(_359, _367, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _387 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _389 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _387;
    float _391 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _393 = _391 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _395 = fma(_383, _319, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _397 = _379 * _365;
    float _399 = fma(_389, _319, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _401 = fma(_393, _367, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _403 = -_379;
    float _405 = _403 + 1.0;
    float _407 = _395 * _397;
    float _409 = _399 * _397;
    float _411 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _413 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _411;
    float _415 = fma(_405, (*spvDescriptorSet0.vp_c9)._m0[143].x, _407);
    float _417 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _419 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _417;
    float _421 = fma(_405, (*spvDescriptorSet0.vp_c9)._m0[143].y, _409);
    float _423 = fma(_413, _339, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _425 = fma(_385, _361, _415);
    float _427 = fma(_419, _339, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _429 = fma(_401, _361, _421);
    float _431 = fma(_423, _337, _425);
    float _433 = fma(_427, _337, _429);
    float _435 = fma(_309, (*spvDescriptorSet0.vp_c9)._m0[146].x, _431);
    float _437 = fma(_309, (*spvDescriptorSet0.vp_c9)._m0[146].y, _433);
    bool _439 = !_313;
    float _457;
    if (!_439)
    {
        float _441 = in.m_70.x;
        float _443 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _445 = _441 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _447 = fma(_445, (*spvDescriptorSet0.vp_c9)._m0[11].y, _137);
        float _449 = _447 * _443;
        float _451 = floor(_449);
        float _453 = -_451;
        float _455 = _449 + _453;
        _457 = _455;
        _459 = true;
    }
    else
    {
        _457 = _181;
    }
    _459 = false;
    float _461 = _457;
    float _463 = in.m_72.x;
    float _465 = in.m_72.y;
    bool _467 = _461 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _469 = isnan(_461);
    bool _471 = _467 || _469;
    bool _473 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _475 = _471 || _473;
    float _477 = float(_475);
    float _479 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _481 = _479 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _483 = _461 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _485 = isnan(_461);
    bool _487 = _483 || _485;
    bool _489 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _491 = _487 || _489;
    float _493 = float(_491);
    float _495 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _497 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _495;
    float _499 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _501 = _461 + _499;
    float _503 = -_477;
    float _505 = _503 + 1.0;
    bool _507 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _509 = 1.0 / _481;
    float _511 = _493 * _505;
    float _513 = -_493;
    float _515 = _513 + 1.0;
    float _517 = _437 * _465;
    float _519 = _435 * _463;
    float _521 = _497 * _509;
    float _523 = fma(_521, _501, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _525 = _523 * _511;
    float _527 = fma(_515, (*spvDescriptorSet0.vp_c9)._m0[115].x, _525);
    float _529 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _531 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _533 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _535 = fma(_477, (*spvDescriptorSet0.vp_c9)._m0[116].x, _527);
    float _537 = _529 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _539 = _531 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _541 = _533 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _543 = _535 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    out.m_74.x = _537;
    out.m_74.y = _539;
    out.m_74.z = _541;
    out.m_74.w = _543;
    bool _545 = !_507;
    float _563;
    if (!_545)
    {
        float _547 = in.m_70.x;
        float _549 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _551 = _547 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _553 = fma(_551, (*spvDescriptorSet0.vp_c9)._m0[11].w, _137);
        float _555 = _553 * _549;
        float _557 = floor(_555);
        float _559 = -_557;
        float _561 = _555 + _559;
        _563 = _561;
        _565 = true;
    }
    else
    {
        _563 = _181;
    }
    _565 = false;
    float _567 = _563;
    float _569 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _571 = _567 + _569;
    float _573 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _575 = _573 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _577 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _579 = _577 + (*spvDescriptorSet0.vp_c9)._m0[133].w;
    bool _581 = _567 >= (*spvDescriptorSet0.vp_c9)._m0[133].w;
    bool _583 = isnan(_567);
    bool _585 = _581 || _583;
    bool _587 = isnan((*spvDescriptorSet0.vp_c9)._m0[133].w);
    bool _589 = _585 || _587;
    float _591 = float(_589);
    float _593 = -(*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _595 = _593 + (*spvDescriptorSet0.vp_c9)._m0[134].w;
    bool _597 = _567 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _599 = isnan(_567);
    bool _601 = _597 || _599;
    bool _603 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _605 = _601 || _603;
    float _607 = float(_605);
    float _609 = 1.0 / _575;
    float _611 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _613 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _611;
    float _615 = -_591;
    float _617 = _615 + 1.0;
    bool _619 = _567 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _621 = isnan(_567);
    bool _623 = _619 || _621;
    bool _625 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _627 = _623 || _625;
    float _629 = float(_627);
    bool _631 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[14].x;
    float _633 = 1.0 / _579;
    float _635 = 1.0 / _595;
    float _637 = _613 * _609;
    float _639 = -(*spvDescriptorSet0.vp_c9)._m0[132].x;
    float _641 = _639 + (*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _643 = _607 * _617;
    float _645 = -_607;
    float _647 = _645 + 1.0;
    float _649 = fma(_637, _571, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    float _651 = -(*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _653 = (*spvDescriptorSet0.vp_c9)._m0[134].x + _651;
    float _655 = _629 * _647;
    float _657 = _641 * _633;
    bool _659 = _567 >= (*spvDescriptorSet0.vp_c9)._m0[134].w;
    bool _661 = isnan(_567);
    bool _663 = _659 || _661;
    bool _665 = isnan((*spvDescriptorSet0.vp_c9)._m0[134].w);
    bool _667 = _663 || _665;
    float _669 = float(_667);
    float _671 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _673 = _567 + _671;
    float _675 = _649 * _655;
    float _677 = -_629;
    float _679 = _677 + 1.0;
    float _681 = -(*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _683 = _567 + _681;
    float _685 = fma(_657, _673, (*spvDescriptorSet0.vp_c9)._m0[132].x);
    float _687 = _653 * _635;
    float _689 = -_669;
    float _691 = _689 + 1.0;
    float _693 = fma(_679, (*spvDescriptorSet0.vp_c9)._m0[131].x, _675);
    float _695 = fma(_687, _683, (*spvDescriptorSet0.vp_c9)._m0[133].x);
    float _697 = _591 * _691;
    float _699 = fma(_685, _643, _693);
    float _701 = fma(_695, _697, _699);
    float _703 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _705 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _707 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _709 = fma(_669, (*spvDescriptorSet0.vp_c9)._m0[134].x, _701);
    float _711 = _705 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _713 = _703 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _715 = _707 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _717 = _709 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    out.m_76.x = _711;
    out.m_76.y = _713;
    out.m_76.z = _715;
    out.m_76.w = _717;
    bool _719 = !_631;
    float _737;
    if (!_719)
    {
        float _721 = in.m_70.x;
        float _723 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[14].x;
        float _725 = _721 * (*spvDescriptorSet0.vp_c9)._m0[15].x;
        float _727 = fma(_725, (*spvDescriptorSet0.vp_c9)._m0[14].x, _137);
        float _729 = _727 * _723;
        float _731 = floor(_729);
        float _733 = -_731;
        float _735 = _729 + _733;
        _737 = _735;
        _739 = true;
    }
    else
    {
        _737 = _181;
    }
    _739 = false;
    float _741 = _737;
    float _743 = -(*spvDescriptorSet0.vp_c9)._m0[159].w;
    float _745 = _741 + _743;
    bool _747 = _741 >= (*spvDescriptorSet0.vp_c9)._m0[165].w;
    bool _749 = isnan(_741);
    bool _751 = _747 || _749;
    bool _753 = isnan((*spvDescriptorSet0.vp_c9)._m0[165].w);
    bool _755 = _751 || _753;
    float _757 = float(_755);
    float _759 = -(*spvDescriptorSet0.vp_c9)._m0[159].w;
    float _761 = _759 + (*spvDescriptorSet0.vp_c9)._m0[160].w;
    bool _763 = _741 >= (*spvDescriptorSet0.vp_c9)._m0[164].w;
    bool _765 = isnan(_741);
    bool _767 = _763 || _765;
    bool _769 = isnan((*spvDescriptorSet0.vp_c9)._m0[164].w);
    bool _771 = _767 || _769;
    float _773 = float(_771);
    float _775 = -(*spvDescriptorSet0.vp_c9)._m0[159].x;
    float _777 = (*spvDescriptorSet0.vp_c9)._m0[160].x + _775;
    bool _779 = _741 >= (*spvDescriptorSet0.vp_c9)._m0[163].w;
    bool _781 = isnan(_741);
    bool _783 = _779 || _781;
    bool _785 = isnan((*spvDescriptorSet0.vp_c9)._m0[163].w);
    bool _787 = _783 || _785;
    float _789 = float(_787);
    float _791 = -_757;
    float _793 = _791 + 1.0;
    float _795 = 1.0 / _761;
    float _797 = _773 * _793;
    float _799 = -_789;
    float _801 = _799 + 1.0;
    float _803 = -(*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _805 = _803 + (*spvDescriptorSet0.vp_c9)._m0[161].w;
    bool _807 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[14].y;
    float _809 = 1.0 / _805;
    float _811 = _777 * _795;
    float _813 = -_773;
    float _815 = _813 + 1.0;
    bool _817 = _741 >= (*spvDescriptorSet0.vp_c9)._m0[162].w;
    bool _819 = isnan(_741);
    bool _821 = _817 || _819;
    bool _823 = isnan((*spvDescriptorSet0.vp_c9)._m0[162].w);
    bool _825 = _821 || _823;
    float _827 = float(_825);
    float _829 = fma(_811, _745, (*spvDescriptorSet0.vp_c9)._m0[159].x);
    float _831 = _789 * _815;
    bool _833 = _741 >= (*spvDescriptorSet0.vp_c9)._m0[161].w;
    bool _835 = isnan(_741);
    bool _837 = _833 || _835;
    bool _839 = isnan((*spvDescriptorSet0.vp_c9)._m0[161].w);
    bool _841 = _837 || _839;
    float _843 = float(_841);
    float _845 = _827 * _801;
    float _847 = -_827;
    float _849 = _847 + 1.0;
    float _851 = -(*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _853 = _851 + (*spvDescriptorSet0.vp_c9)._m0[162].w;
    bool _855 = _741 >= (*spvDescriptorSet0.vp_c9)._m0[160].w;
    bool _857 = isnan(_741);
    bool _859 = _855 || _857;
    bool _861 = isnan((*spvDescriptorSet0.vp_c9)._m0[160].w);
    bool _863 = _859 || _861;
    float _865 = float(_863);
    float _867 = _843 * _849;
    float _869 = -_843;
    float _871 = _869 + 1.0;
    float _873 = -(*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _875 = _873 + (*spvDescriptorSet0.vp_c9)._m0[163].w;
    bool _877 = _741 >= (*spvDescriptorSet0.vp_c9)._m0[159].w;
    bool _879 = isnan(_741);
    bool _881 = _877 || _879;
    bool _883 = isnan((*spvDescriptorSet0.vp_c9)._m0[159].w);
    bool _885 = _881 || _883;
    float _887 = float(_885);
    float _889 = 1.0 / _853;
    float _891 = _865 * _871;
    float _893 = -_865;
    float _895 = _893 + 1.0;
    float _897 = 1.0 / _875;
    float _899 = -(*spvDescriptorSet0.vp_c9)._m0[160].x;
    float _901 = _899 + (*spvDescriptorSet0.vp_c9)._m0[161].x;
    float _903 = _887 * _895;
    float _905 = -(*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _907 = _905 + (*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _909 = _901 * _809;
    float _911 = _829 * _903;
    float _913 = -_887;
    float _915 = _913 + 1.0;
    float _917 = 1.0 / _907;
    float _919 = -(*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _921 = _919 + (*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _923 = -(*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _925 = _741 + _923;
    float _927 = -(*spvDescriptorSet0.vp_c9)._m0[161].x;
    float _929 = (*spvDescriptorSet0.vp_c9)._m0[162].x + _927;
    float _931 = fma(_915, (*spvDescriptorSet0.vp_c9)._m0[159].x, _911);
    float _933 = -(*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _935 = _933 + (*spvDescriptorSet0.vp_c9)._m0[166].w;
    float _937 = fma(_909, _925, (*spvDescriptorSet0.vp_c9)._m0[160].x);
    float _939 = _929 * _889;
    float _941 = 1.0 / _921;
    float _943 = -(*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _945 = _741 + _943;
    float _947 = -(*spvDescriptorSet0.vp_c9)._m0[162].x;
    float _949 = _947 + (*spvDescriptorSet0.vp_c9)._m0[163].x;
    float _951 = fma(_937, _891, _931);
    float _953 = fma(_939, _945, (*spvDescriptorSet0.vp_c9)._m0[161].x);
    float _955 = -(*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _957 = _741 + _955;
    float _959 = _949 * _897;
    float _961 = 1.0 / _935;
    float _963 = -(*spvDescriptorSet0.vp_c9)._m0[163].x;
    float _965 = (*spvDescriptorSet0.vp_c9)._m0[164].x + _963;
    float _967 = -(*spvDescriptorSet0.vp_c9)._m0[164].x;
    float _969 = _967 + (*spvDescriptorSet0.vp_c9)._m0[165].x;
    float _971 = fma(_953, _867, _951);
    float _973 = _965 * _917;
    float _975 = fma(_959, _957, (*spvDescriptorSet0.vp_c9)._m0[162].x);
    float _977 = -(*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _979 = _741 + _977;
    float _981 = _969 * _941;
    float _983 = -(*spvDescriptorSet0.vp_c9)._m0[165].x;
    float _985 = (*spvDescriptorSet0.vp_c9)._m0[166].x + _983;
    bool _987 = _741 >= (*spvDescriptorSet0.vp_c9)._m0[166].w;
    bool _989 = isnan(_741);
    bool _991 = _987 || _989;
    bool _993 = isnan((*spvDescriptorSet0.vp_c9)._m0[166].w);
    bool _995 = _991 || _993;
    int _997 = _995 ? 1065353216 : 0;
    float _999 = -(*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _1001 = _741 + _999;
    float _1003 = fma(_973, _979, (*spvDescriptorSet0.vp_c9)._m0[163].x);
    float _1005 = fma(_975, _845, _971);
    float _1007 = -(*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _1009 = _741 + _1007;
    float _1011 = fma(_981, _1001, (*spvDescriptorSet0.vp_c9)._m0[164].x);
    float _1013 = _985 * _961;
    float _1015 = -as_type<float>(_997);
    float _1017 = _1015 + 1.0;
    float _1019 = fma(_1003, _831, _1005);
    float _1021 = fma(_1013, _1009, (*spvDescriptorSet0.vp_c9)._m0[165].x);
    float _1023 = _757 * _1017;
    float _1025 = fma(_1011, _797, _1019);
    float _1027 = fma(_1021, _1023, _1025);
    float _1029 = fma(as_type<float>(_997), (*spvDescriptorSet0.vp_c9)._m0[166].x, _1027);
    out.m_78.x = _1029;
    bool _1031 = !_807;
    float _1033 = _1021;
    int _1035 = _997;
    int _1037 = as_type<int>(_981);
    float _1039 = _1029;
    float _1041 = _971;
    float _1043 = _941;
    if (!_1031)
    {
        float _1045 = in.m_70.x;
        float _1047 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[14].y;
        float _1049 = _1045 * (*spvDescriptorSet0.vp_c9)._m0[15].y;
        float _1051 = fma(_1049, (*spvDescriptorSet0.vp_c9)._m0[14].y, _137);
        float _1053 = _1051 * _1047;
        float _1055 = floor(_1053);
        float _1057 = -_1055;
        float _1059 = _1053 + _1057;
        _1033 = _1047;
        _183 = _1059;
    }
    float _1061 = _1033;
    float _1063 = _183;
    float _1065 = in.m_70.z;
    float _1067 = in.m_70.w;
    int _1069 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _1071 = _1069 != 0;
    float _1073 = (*spvDescriptorSet0.vp_c9)._m0[7].z;
    float _1075 = _1061;
    if (_1071)
    {
        float _1077 = in.m_70.x;
        float _1079 = in.m_70.y;
        _1073 = _1077;
        _1075 = _1079;
    }
    float _1081 = _1073;
    float _1083 = _1075;
    float _1085 = 0.0;
    if (_1071)
    {
        _1085 = 1.0;
    }
    float _1087 = _1085;
    float _1089 = 0.0;
    float _1091 = _1087;
    if (_1071)
    {
        _1089 = 1.0;
    }
    float _1093 = _1089;
    float _1095 = _1093;
    if (_1071)
    {
        _1035 = 0;
    }
    int _1097 = _1035;
    float _1099 = _1065 * 2.0;
    int _1101 = _1097;
    if (_1071)
    {
        _1037 = 0;
    }
    int _1103 = _1037;
    float _1105 = floor(_1099);
    float _1107 = 0.0;
    float _1109 = _1083;
    int _1111 = _1103;
    float _1113 = _1081;
    if (_1071)
    {
        _1107 = _1081;
    }
    float _1115 = _1107;
    bool _1117 = _1105 > 0.0;
    bool _1119 = _1105 >= 0.0;
    bool _1121 = isnan(_1105);
    bool _1123 = _1119 || _1121;
    bool _1125 = isnan(0.0);
    bool _1127 = _1123 || _1125;
    float _1129 = _1105;
    float _1131 = _1115;
    if (_1071)
    {
        _1039 = _1115;
    }
    float _1133 = _1039;
    float _1135 = _1127 ? 0.0 : 1.4012984643248170709237295832899e-45;
    float _1137 = _1135;
    float _1139 = _1133;
    if (_1071)
    {
        _1129 = _1115;
    }
    float _1141 = _1129;
    int _1143 = ~as_type<int>(_1135);
    int _1145 = _1143 + 1;
    int _1147 = _1145 + 1;
    int _1149 = _1147;
    float _1151 = _1141;
    if (!_1117)
    {
        int _1153 = ~as_type<int>(_1135);
        int _1155 = _1153 + 1;
        _1149 = _1155;
    }
    int _1157 = _1149;
    if (_1071)
    {
        _1137 = _1083;
    }
    float _1159 = _1137;
    float _1161 = _1159;
    if (!_1071)
    {
        float _1163 = in.m_70.x;
        float _1165 = in.m_70.y;
        float _1167 = in.m_70.z;
        float _1169 = _1163 * 3.1415927410125732421875;
        float _1171 = _1169 * 0.15915493667125701904296875;
        float _1173 = _1165 * 3.1415927410125732421875;
        float _1175 = _1173 * 0.15915493667125701904296875;
        float _1177 = _1171 * 6.283185482025146484375;
        float _1179 = sin(_1177);
        float _1181 = _1175 * 6.283185482025146484375;
        float _1183 = sin(_1181);
        _1109 = _1165;
        _1101 = 1;
        _1111 = 2;
        _1113 = _1163;
        _1139 = _1179;
        _1161 = _1183;
        _1095 = 5.839270114898681640625;
        _1151 = _1167;
        _1091 = 7.345489978790283203125;
        _1131 = _1165;
    }
    float _1185 = _1109;
    int _1187 = _1101;
    int _1189 = _1111;
    float _1191 = _1113;
    float _1193 = _1139;
    float _1195 = _1161;
    float _1197 = _1095;
    float _1199 = _1151;
    float _1201 = _1091;
    float _1203 = _1131;
    float _1205 = _1185 * 2.0;
    bool _1207 = _1187 != 1;
    float _1209 = _1185 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _1211 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _1213 = floor(_1205);
    bool _1215 = _1189 != 2;
    float _1217 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _1219 = fma(_1209, -2.0, _1211);
    float _1221 = _1191 * 2.0;
    float _1223 = (*spvDescriptorSet0.vp_c9)._m0[93].z + (*spvDescriptorSet0.vp_c9)._m0[93].x;
    bool _1225 = _1065 > 0.5;
    float _1227 = floor(_1221);
    float _1229 = _1191 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    int _1231 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _1233 = _1231 != 0;
    int _1235 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16;
    bool _1237 = _1235 != 0;
    int _1239 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32;
    bool _1241 = _1239 != 0;
    float _1243 = _1193 * (*spvDescriptorSet0.vp_c9)._m0[92].x;
    bool _1245 = _1185 > 0.5;
    float _1247 = fma(_1193, (*spvDescriptorSet0.vp_c9)._m0[93].z, _1223);
    float _1249 = -_231;
    float _1251 = _1225 ? _1249 : _231;
    float _1253 = (*spvDescriptorSet0.vp_c9)._m0[92].x + (*spvDescriptorSet0.vp_c9)._m0[91].z;
    float _1255 = -_227;
    int _1257 = _1245 ? as_type<int>(_1255) : as_type<int>(_227);
    float _1259 = -_1217;
    float _1261 = fma(_1229, 2.0, _1259);
    bool _1263 = !_1241;
    float _1265 = _1263 ? _231 : _1251;
    float _1267 = -_1253;
    float _1269 = fma(_1243, 2.0, _1267);
    bool _1271 = !_1237;
    float _1273 = _1271 ? _227 : as_type<float>(_1257);
    float _1275 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _1277 = log2(_1275);
    bool _1279 = _1213 >= 0.0;
    bool _1281 = isnan(_1213);
    bool _1283 = _1279 || _1281;
    bool _1285 = isnan(0.0);
    bool _1287 = _1283 || _1285;
    float _1289 = _1195 * (*spvDescriptorSet0.vp_c9)._m0[92].y;
    bool _1291 = _1227 >= 0.0;
    bool _1293 = isnan(_1227);
    bool _1295 = _1291 || _1293;
    bool _1297 = isnan(0.0);
    bool _1299 = _1295 || _1297;
    float _1301 = _1185 + _1191;
    float _1303 = _177 * _137;
    float _1305 = _1243;
    float _1307 = _1223;
    float _1309 = _1195;
    float _1311 = _1251;
    if (!_1207)
    {
        _1041 = _1065;
    }
    float _1313 = _1041;
    float _1315 = _1301 + (-1.0);
    float _1317 = _1313;
    if (!_1207)
    {
        _1305 = _1065;
    }
    float _1319 = _1305;
    float _1321 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _1323 = int(_1321);
    float _1325 = _1319;
    if (!_1207)
    {
        _1307 = _1185;
    }
    float _1327 = _1307;
    float _1329 = fma(_137, (*spvDescriptorSet0.vp_c9)._m0[92].z, _1247);
    float _1331 = _1327;
    if (!_1207)
    {
        _1043 = _1185;
    }
    float _1333 = _1043;
    float _1335 = -_137;
    float _1337 = fma(_1335, (*spvDescriptorSet0.vp_c9)._m0[76].x, _1261);
    float _1339 = _1277 * _137;
    float _1341 = _1333;
    if (_1207)
    {
        _1317 = _1185;
    }
    float _1343 = _1317;
    float _1345 = -_137;
    float _1347 = fma(_1345, (*spvDescriptorSet0.vp_c9)._m0[91].x, _1269);
    if (_1207)
    {
        _1325 = _1185;
    }
    float _1349 = _1325;
    float _1351 = (*spvDescriptorSet0.vp_c9)._m0[92].y + (*spvDescriptorSet0.vp_c9)._m0[91].w;
    if (_1207)
    {
        _1331 = _1191;
    }
    float _1353 = _1331;
    float _1355 = _1343 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    if (_1207)
    {
        _1341 = _1191;
    }
    float _1357 = _1341;
    float _1359 = fma(_1289, -2.0, _1351);
    int _1361 = _1299 ? 0 : 1;
    float _1363 = exp2(_1339);
    int _1365 = _1287 ? 0 : 1;
    float _1367 = _517 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    int _1369 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _1371 = _1369 != 0;
    int _1373 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _1375 = _1373 != 0;
    int _1377 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _1379 = _1377 != 0;
    float _1381 = _519 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1383 = in.m_64.w;
    bool _1385 = !_1375;
    int _1387 = _1385 ? 0 : 1;
    float _1389 = (*spvDescriptorSet0.vp_c9)._m0[93].w + (*spvDescriptorSet0.vp_c9)._m0[93].y;
    bool _1391 = !_1371;
    int _1393 = _1391 ? 0 : 1;
    float _1395 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    bool _1397 = !_1379;
    int _1399 = _1397 ? 0 : 1;
    float _1401 = fma(_1195, (*spvDescriptorSet0.vp_c9)._m0[93].w, _1389);
    int _1403 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 4096;
    bool _1405 = _1403 != 0;
    int _1407 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 8192;
    bool _1409 = _1407 != 0;
    int _1411 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16384;
    bool _1413 = _1411 != 0;
    float _1415 = fma(_1357, (*spvDescriptorSet0.vp_c9)._m0[83].z, _1395);
    if (_1215)
    {
        _1309 = _1185;
    }
    float _1417 = _1309;
    float _1419 = -_1363;
    float _1421 = _1419 + 1.0;
    float _1423 = _1417;
    if (_1215)
    {
        _1311 = _1191;
    }
    float _1425 = _1311;
    float _1427 = fma(_137, (*spvDescriptorSet0.vp_c9)._m0[92].w, _1401);
    bool _1429 = !_1409;
    int _1431 = _1429 ? 0 : 1;
    bool _1433 = !_1405;
    int _1435 = _1433 ? 0 : 1;
    bool _1437 = !_1413;
    int _1439 = _1437 ? 0 : 1;
    float _1441 = _1425;
    if (!_1215)
    {
        _1441 = _1065;
    }
    float _1443 = _1441;
    if (!_1215)
    {
        _1423 = _1191;
    }
    float _1445 = _1423;
    int _1447 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _1449 = _1447 != 0;
    int _1451 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _1453 = _1451 != 0;
    int _1455 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _1457 = _1455 != 0;
    float _1459 = _1443 * (*spvDescriptorSet0.vp_c9)._m0[87].x;
    bool _1461 = _1227 > 0.0;
    float _1463 = _1353 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _1465 = _1445 * (*spvDescriptorSet0.vp_c9)._m0[87].y;
    float _1467 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    bool _1469 = !_1449;
    int _1471 = _1469 ? 0 : 1;
    float _1473 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _1475 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    bool _1477 = _1213 > 0.0;
    float _1479 = -_1467;
    float _1481 = fma(_1463, 2.0, _1479);
    float _1483 = fma(_1315, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _1485 = fma(_1349, (*spvDescriptorSet0.vp_c9)._m0[83].w, _1473);
    float _1487 = fma(_1355, -2.0, _1475);
    float _1489 = trunc((*spvDescriptorSet0.vp_c9)._m0[40].y);
    int _1491 = int(_1489);
    float _1493 = (*spvDescriptorSet0.vp_c9)._m0[87].x + (*spvDescriptorSet0.vp_c9)._m0[86].z;
    float _1495 = fma(_137, (*spvDescriptorSet0.vp_c9)._m0[76].y, _1219);
    int _1497 = abs(_1471);
    float _1499 = -_1493;
    float _1501 = fma(_1459, 2.0, _1499);
    float _1503 = float(_1323);
    float _1505 = (*spvDescriptorSet0.vp_c9)._m0[87].y + (*spvDescriptorSet0.vp_c9)._m0[86].w;
    float _1507 = trunc((*spvDescriptorSet0.vp_c9)._m0[49].y);
    int _1509 = int(_1507);
    int _1511 = ~_1361;
    int _1513 = _1511 + 1;
    int _1515 = _1513 + 1;
    float _1517 = fma(_1465, -2.0, _1505);
    int _1519 = _1515;
    if (!_1461)
    {
        int _1521 = ~_1361;
        int _1523 = _1521 + 1;
        _1519 = _1523;
    }
    int _1525 = _1519;
    float _1527 = in.m_80.x;
    float _1529 = in.m_80.y;
    float _1531 = in.m_80.z;
    bool _1533 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1535 = isnan(0.0);
    bool _1537 = _1533 || _1535;
    bool _1539 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1541 = _1537 || _1539;
    float _1543 = fma(_137, (*spvDescriptorSet0.vp_c9)._m0[91].y, _1359);
    float _1545 = float(_1491);
    float _1547 = 1.0 / _1503;
    float _1549 = -_137;
    float _1551 = fma(_1549, (*spvDescriptorSet0.vp_c9)._m0[81].x, _1481);
    float _1553 = _1541 ? _1421 : 0.0;
    float _1555 = float(_1509);
    float _1557 = 1.0 / _1545;
    float _1559 = float(_1157);
    float _1561 = float(_1497);
    bool _1563 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1565 = isnan(1.0);
    bool _1567 = _1563 || _1565;
    bool _1569 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1571 = _1567 || _1569;
    float _1573 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _1575 = 1.0 + _1573;
    int _1577 = ~_1365;
    int _1579 = _1577 + 1;
    int _1581 = _1579 + 1;
    float _1583 = 1.0 / _1555;
    int _1585 = _1581;
    if (!_1477)
    {
        int _1587 = ~_1365;
        int _1589 = _1587 + 1;
        _1585 = _1589;
    }
    int _1591 = _1585;
    float _1593 = _1561 * _1559;
    float _1595 = _1547 * _137;
    float _1597 = _1593 * (-2.0);
    float _1599 = 1.0 / _1575;
    float _1601 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    bool _1603 = !_1453;
    int _1605 = _1603 ? 0 : 1;
    float _1607 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _1609 = (*spvDescriptorSet0.vp_c9)._m0[88].z + (*spvDescriptorSet0.vp_c9)._m0[88].x;
    float _1611 = (*spvDescriptorSet0.vp_c9)._m0[88].w + (*spvDescriptorSet0.vp_c9)._m0[88].y;
    float _1613 = fma(_1597, _1527, _1527);
    float _1615 = _1557 * _137;
    float _1617 = fma(_137, (*spvDescriptorSet0.vp_c9)._m0[82].z, _1415);
    float _1619 = fma(_137, (*spvDescriptorSet0.vp_c9)._m0[81].y, _1487);
    int _1621 = abs(_1605);
    float _1623 = _1583 * _137;
    float _1625 = fma(_1185, (*spvDescriptorSet0.vp_c9)._m0[78].w, _1601);
    float _1627 = float(_1525);
    float _1629 = fma(_1191, (*spvDescriptorSet0.vp_c9)._m0[78].z, _1607);
    float _1631 = float(_1621);
    float _1633 = fma(_1191, (*spvDescriptorSet0.vp_c9)._m0[88].z, _1609);
    float _1635 = fma(_1185, (*spvDescriptorSet0.vp_c9)._m0[88].w, _1611);
    float _1637 = _1191 + (-0.5);
    float _1639 = fma(_137, (*spvDescriptorSet0.vp_c9)._m0[77].w, _1625);
    float _1641 = fma(_137, (*spvDescriptorSet0.vp_c9)._m0[82].w, _1485);
    float _1643 = fma(_137, (*spvDescriptorSet0.vp_c9)._m0[77].z, _1629);
    float _1645 = fma(_137, (*spvDescriptorSet0.vp_c9)._m0[87].z, _1633);
    float _1647 = fma(_137, (*spvDescriptorSet0.vp_c9)._m0[87].w, _1635);
    float _1649 = -_137;
    float _1651 = fma(_1649, (*spvDescriptorSet0.vp_c9)._m0[86].x, _1501);
    float _1653 = fma(_137, (*spvDescriptorSet0.vp_c9)._m0[86].y, _1517);
    bool _1655 = !_1457;
    int _1657 = _1655 ? 0 : 1;
    float _1659 = _1631 * _1627;
    if (_1571)
    {
        float _1661 = _1553 * _1599;
        _147 = _1661;
    }
    float _1663 = _147;
    float _1665 = fma(_1483, _1597, _1483);
    float _1667 = fma(_1637, (*spvDescriptorSet0.vp_c9)._m0[196].x, _1613);
    float _1669 = _1185 + _1065;
    int _1671 = abs(_1657);
    float _1673 = in.m_68.w;
    float _1675 = fma(_1665, _1663, _1667);
    float _1677 = _1669 + (-1.0);
    float _1679 = _1659 * (-2.0);
    float _1681 = float(_1591);
    float _1683 = _1675 * 0.15915493667125701904296875;
    float _1685 = float(_1671);
    float _1687 = fma(_1677, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _1689 = _1185 + (-0.5);
    float _1691 = fma(_1679, _1529, _1529);
    float _1693 = _1191 + _1065;
    float _1695 = _1685 * _1681;
    float _1697 = fma(_1687, _1679, _1687);
    float _1699 = fma(_1689, (*spvDescriptorSet0.vp_c9)._m0[196].y, _1691);
    float _1701 = _1693 + (-1.0);
    float _1703 = _1695 * (-2.0);
    float _1705 = fma(_1697, _1663, _1699);
    float _1707 = _1065 + (-0.5);
    float _1709 = fma(_1701, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _1711 = fma(_1703, _1531, _1531);
    float _1713 = _1705 * 0.15915493667125701904296875;
    float _1715 = _1683 * 6.283185482025146484375;
    float _1717 = cos(_1715);
    float _1719 = in.m_50.x;
    float _1721 = in.m_50.y;
    float _1723 = in.m_50.z;
    float _1725 = fma(_1709, _1703, _1709);
    float _1727 = fma(_1707, (*spvDescriptorSet0.vp_c9)._m0[196].z, _1711);
    float _1729 = fma(_1725, _1663, _1727);
    float _1731 = _1713 * 6.283185482025146484375;
    float _1733 = sin(_1731);
    float _1735 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _227);
    float _1737 = _1729 * 0.15915493667125701904296875;
    float _1739 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _231);
    float _1741 = _1713 * 6.283185482025146484375;
    float _1743 = cos(_1741);
    float _1745 = _1367 * _1739;
    float _1747 = _1683 * 6.283185482025146484375;
    float _1749 = sin(_1747);
    float _1751 = _199 * _1721;
    float _1753 = _1717 * _1733;
    float _1755 = _211 * _1721;
    float _1757 = _205 * _1721;
    float _1759 = fma(_197, _1719, _1751);
    float _1761 = fma(_209, _1719, _1755);
    float _1763 = _1737 * 6.283185482025146484375;
    float _1765 = cos(_1763);
    float _1767 = _1717 * _1743;
    float _1769 = _1381 * _1735;
    float _1771 = fma(_201, _1723, _1759);
    float _1773 = fma(_213, _1723, _1761);
    float _1775 = fma(_203, _1719, _1757);
    float _1777 = _1771 + _1383;
    float _1779 = _1737 * 6.283185482025146484375;
    float _1781 = sin(_1779);
    float _1783 = _1749 * _1733;
    float _1785 = _1749 * _1743;
    float _1787 = _1773 + _1673;
    float _1789 = fma(_207, _1723, _1775);
    float _1791 = _1717 * _1765;
    float _1793 = _1749 * _1765;
    float _1795 = _1743 * _1765;
    float _1797 = _1733 * _1765;
    float _1799 = _1791 * _1745;
    float _1801 = 0.5 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _1803 = fma(_1781, _1767, _1783);
    float _1805 = -_1753;
    float _1807 = fma(_1781, _1785, _1805);
    float _1809 = -_1785;
    float _1811 = fma(_1781, _1753, _1809);
    float _1813 = -_1745;
    float _1815 = _1781 * _1813;
    float _1817 = fma(_1803, _1769, _1799);
    float _1819 = _1793 * _1745;
    float _1821 = fma(_1781, _1783, _1767);
    float _1823 = fma(_1795, _1769, _1815);
    float _1825 = fma(_1811, _1801, _1817);
    float _1827 = fma(_1807, _1769, _1819);
    float _1829 = fma(_1797, _1801, _1823);
    float _1831 = _1825 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1833 = _1825 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1835 = fma(_1821, _1801, _1827);
    float _1837 = _1825 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1839 = fma(_1829, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1831);
    float _1841 = fma(_1829, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1833);
    float _1843 = fma(_1829, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1837);
    float _1845 = fma(_1835, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1839);
    float _1847 = fma(_1835, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1841);
    float _1849 = fma(_1835, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1843);
    float _1851 = _1845 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _1853 = _1847 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _1855 = in.m_66.w;
    float _1857 = _1777 + _1851;
    float _1859 = _1787 + _1853;
    float _1861 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1863 = _1857 + _1861;
    float _1865 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1867 = _1859 + _1865;
    float _1869 = _1863 * _1863;
    float _1871 = _1867 * _1867;
    float _1873 = _1869 + _1871;
    float _1875 = sqrt(_1873);
    float _1877 = _1789 + _1855;
    bool _1879 = _1875 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1881 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1883 = _1875 + _1881;
    float _1885 = _201;
    float _1887 = _1829;
    float _1889 = _1857;
    float _1891 = _1789;
    float _1893 = _1883;
    float _1895 = _1721;
    float _1897 = _1869;
    float _1899 = _1871;
    if (_1879)
    {
        float _1901 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1885 = _1901;
    }
    float _1903 = _1885;
    if (!_1879)
    {
        _1887 = _1857;
    }
    float _1905 = _1887;
    float _1907 = _1905;
    if (!_1879)
    {
        _1889 = _1859;
    }
    float _1909 = _1889;
    float _1911 = _1909;
    if (_1879)
    {
        float _1913 = rsqrt(_1873);
        _1891 = _1913;
    }
    float _1915 = _1891;
    if (_1879)
    {
        float _1917 = _1883 * _1903;
        _1893 = _1917;
    }
    float _1919 = _1893;
    if (_1879)
    {
        float _1921 = _1919 * 0.15915493667125701904296875;
        _1895 = _1921;
    }
    float _1923 = _1895;
    float _1925 = _1849 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _1927 = _203;
    float _1929 = _1925;
    float _1931 = _1923;
    if (_1879)
    {
        float _1933 = _1923 * 6.283185482025146484375;
        float _1935 = sin(_1933);
        _1927 = _1935;
    }
    float _1937 = _1927;
    float _1939 = _1877 + _1925;
    float _1941 = _1939;
    if (_1879)
    {
        float _1943 = _1939 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1929 = _1943;
    }
    float _1945 = _1929;
    float _1947 = _1937;
    if (_1879)
    {
        float _1949 = fma(_1937, _1945, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1947 = _1949;
    }
    float _1951 = _1947;
    float _1953 = _1951;
    if (_1879)
    {
        float _1955 = _1915 * _1951;
        _1953 = _1955;
    }
    float _1957 = _1953;
    if (_1879)
    {
        float _1959 = fma(_1863, _1957, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        _1907 = _1959;
    }
    float _1961 = _1907;
    if (_1879)
    {
        float _1963 = fma(_1867, _1957, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1911 = _1963;
    }
    float _1965 = _1911;
    float _1967 = fma(_1961, 6.2500002968590706586837768554688e-05, 0.5);
    float _1969 = fma(_1965, 6.2500002968590706586837768554688e-05, 0.5);
    float2 _8371 = float2(_1967, _1969);
    float3 _1973 = dm_bs(spvDescriptorSet0.vp_t_tcb_20.sample(spvDescriptorSet0.vp_t_tcb_20Smplr, select(_8371, float2(0.0), isnan(_8371)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_20, spvDescriptorSet0.vp_t_tcb_20Smplr_w, select(_8371, float2(0.0), isnan(_8371)), level(0.0)).xyz;
    float _1975 = _1973.x;
    float _1977 = _1973.y;
    float _1979 = _1973.z;
    float _1981 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _1983 = int(_1981);
    int _1985 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 64;
    bool _1987 = _1985 != 0;
    float _1989 = _1197 * _1199;
    float _1991 = _1201 * _1203;
    int _1993 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _1995 = _1993 != 0;
    float _1997 = -_1427;
    float _1999 = _1997 + 1.0;
    int _2001 = abs(_1393);
    float _2003 = -_1643;
    float _2005 = _2003 + 1.0;
    float _2007 = trunc((*spvDescriptorSet0.vp_c9)._m0[40].x);
    int _2009 = int(_2007);
    int _2011 = abs(_1439);
    float _2013 = -_1617;
    float _2015 = _2013 + 1.0;
    float _2017 = -_1641;
    float _2019 = _2017 + 1.0;
    bool _2021 = _1063 >= (*spvDescriptorSet0.vp_c9)._m0[170].w;
    bool _2023 = isnan(_1063);
    bool _2025 = _2021 || _2023;
    bool _2027 = isnan((*spvDescriptorSet0.vp_c9)._m0[170].w);
    bool _2029 = _2025 || _2027;
    float _2031 = float(_2029);
    float _2033 = _1945;
    bool _2035 = _1995;
    if (_1987)
    {
        float _2037 = in.m_70.w;
        _2033 = _2037;
    }
    float _2039 = _2033;
    float _2041 = trunc((*spvDescriptorSet0.vp_c9)._m0[49].x);
    int _2043 = int(_2041);
    float _2045 = float(uint(_1983));
    float _2047 = -_2031;
    float _2049 = _2047 + 1.0;
    int _2051 = ~_1983;
    int _2053 = _2051 + 1;
    float _2055 = -(*spvDescriptorSet0.vp_c9)._m0[172].w;
    float _2057 = _2055 + (*spvDescriptorSet0.vp_c9)._m0[173].w;
    int _2059 = ~_1983;
    int _2061 = _2059 + 1;
    float _2063 = -_1645;
    float _2065 = _2063 + 1.0;
    float _2067 = 1.0 / _2045;
    float _2069 = float(uint(_2009));
    float _2071 = -_1647;
    float _2073 = _2071 + 1.0;
    bool _2075 = _1063 >= (*spvDescriptorSet0.vp_c9)._m0[169].w;
    bool _2077 = isnan(_1063);
    bool _2079 = _2075 || _2077;
    bool _2081 = isnan((*spvDescriptorSet0.vp_c9)._m0[169].w);
    bool _2083 = _2079 || _2081;
    float _2085 = float(_2083);
    float _2087 = trunc(_1595);
    int _2089 = int(_2087);
    float _2091 = float(uint(_2043));
    float _2093 = _2085 * _2049;
    int _2095 = ~_2043;
    int _2097 = _2095 + 1;
    float _2099 = -_2085;
    float _2101 = _2099 + 1.0;
    bool _2103 = _1063 >= (*spvDescriptorSet0.vp_c9)._m0[167].w;
    bool _2105 = isnan(_1063);
    bool _2107 = _2103 || _2105;
    bool _2109 = isnan((*spvDescriptorSet0.vp_c9)._m0[167].w);
    bool _2111 = _2107 || _2109;
    float _2113 = float(_2111);
    float _2115 = _2039;
    if (_1987)
    {
        float _2117 = _2039 * 3.1415927410125732421875;
        _2115 = _2117;
    }
    float _2119 = _2115;
    float _2121 = 1.0 / _2069;
    int _2123 = as_type<int>(_2067) + (-2);
    float _2125 = _2119;
    if (_1987)
    {
        float _2127 = _2119 * 0.15915493667125701904296875;
        _2125 = _2127;
    }
    float _2129 = _2125;
    float _2131 = trunc(_1615);
    int _2133 = int(_2131);
    float _2135 = float(uint(_2089));
    float _2137 = float(_1983);
    float _2139 = float(_2089);
    float _2141 = as_type<float>(_2123) * _2135;
    float _2143 = 1.0 / _2091;
    int _2145 = as_type<int>(_2121) + (-2);
    bool _2147 = _2139 >= _2137;
    bool _2149 = isnan(_2139);
    bool _2151 = _2147 || _2149;
    bool _2153 = isnan(_2137);
    bool _2155 = _2151 || _2153;
    float _2157 = float(_2155);
    float _2159 = trunc(_2141);
    float _2161 = precise::max(_2159, 0.0);
    uint _2164 = uint(_2161);
    float _2166 = float(uint(_2133));
    float _2168 = trunc(_1623);
    int _2170 = int(_2168);
    int _2172 = as_type<int>(_2143) + (-2);
    float _2174 = as_type<float>(_2145) * _2166;
    float _2176 = _1201 * _1191;
    int _2178 = _2053 * int(_2164);
    int _2180 = _2178 + _2089;
    float _2182 = trunc(_2174);
    float _2184 = precise::max(_2182, 0.0);
    uint _2186 = uint(_2184);
    float _2188 = float(uint(_2180));
    float _2190 = float(uint(_2170));
    float _2192 = floor(_2176);
    float _2194 = as_type<float>(_2172) * _2190;
    float _2196 = as_type<float>(_2123) * _2188;
    int _2198 = ~_2009;
    int _2200 = _2198 + 1;
    float _2202 = _2129;
    if (_1987)
    {
        float _2204 = _2129 * 6.283185482025146484375;
        float _2206 = sin(_2204);
        _2202 = _2206;
    }
    float _2208 = _2202;
    int _2210 = _2200 * int(_2186);
    int _2212 = _2210 + _2133;
    float _2214 = trunc(_2196);
    float _2216 = precise::max(_2214, 0.0);
    uint _2218 = uint(_2216);
    float _2220 = -_2192;
    float _2222 = _2176 + _2220;
    float _2224 = float(uint(_2212));
    float _2226 = trunc(_2194);
    float _2228 = precise::max(_2226, 0.0);
    uint _2230 = uint(_2228);
    int _2232 = int(_2164) + int(_2218);
    float _2234 = as_type<float>(_2145) * _2224;
    float _2236 = floor(_1989);
    int _2238 = _2061 * _2232;
    int _2240 = _2238 + _2089;
    int _2242 = _2097 * int(_2230);
    int _2244 = _2242 + _2170;
    float _2246 = _2222 * _2137;
    bool _2248 = uint(_2240) >= uint(_1983);
    float _2250 = floor(_1991);
    bool _2252 = !_1995;
    int _2254 = _2252 ? 0 : 1;
    float _2256 = _2137 * _1303;
    float _2258 = float(uint(_2244));
    bool _2260 = !_2248;
    int _2262 = _2260 ? 0 : (-1);
    int _2264 = abs(_2254);
    float _2266 = trunc(_2234);
    float _2268 = precise::max(_2266, 0.0);
    uint _2270 = uint(_2268);
    float _2272 = as_type<float>(_2172) * _2258;
    int _2274 = ~_2232;
    int _2276 = _2274 + _2262;
    int _2278 = _2276 + 1;
    float _2280 = -_2236;
    float _2282 = _1989 + _2280;
    float _2284 = _2208;
    if (_1987)
    {
        bool _2286 = _2208 > 0.5;
        _2035 = _2286;
    }
    bool _2288 = _2035;
    bool _2290 = _1067 > 0.5;
    float _2292 = trunc(_2157);
    int _2294 = int(_2292);
    float _2296 = -_2250;
    float _2298 = _1991 + _2296;
    int _2300 = ~_2009;
    int _2302 = _2300 + 1;
    int _2304 = _1983 * _2278;
    int _2306 = _2304 + _2089;
    if (!_1987)
    {
        _2284 = _227;
    }
    float _2308 = _2284;
    float _2310 = trunc(_2246);
    int _2312 = int(_2310);
    int _2314 = int(_2186) + int(_2270);
    float _2316 = _2308;
    if (_1987)
    {
        float _2318 = -_227;
        float _2320 = _2288 ? _2318 : _227;
        _2316 = _2320;
    }
    float _2322 = _2316;
    bool _2324 = _1983 == 0;
    int _2326 = _2302 * _2314;
    int _2328 = _2326 + _2133;
    int _2330 = ~_2043;
    int _2332 = _2330 + 1;
    float _2334 = trunc(_2272);
    float _2336 = precise::max(_2334, 0.0);
    uint _2338 = uint(_2336);
    int _2340 = ~_2294;
    int _2342 = _2340 + 1;
    int _2344 = _2342 + 1;
    bool _2346 = !_2324;
    int _2348 = _2346 ? _2306 : (-1);
    bool _2350 = uint(_2328) >= uint(_2009);
    float _2352 = -_231;
    int _2354 = _1245 ? as_type<int>(_2352) : as_type<int>(_231);
    float _2356 = trunc(_2256);
    int _2358 = int(_2356);
    int _2360 = _2312 * _2264;
    int _2362 = _2360 + _2089;
    float _2364 = -(*spvDescriptorSet0.vp_c9)._m0[169].x;
    float _2366 = (*spvDescriptorSet0.vp_c9)._m0[170].x + _2364;
    int _2368 = _2348 * _2344;
    int _2370 = _1983 + (-1);
    float _2372 = -(*spvDescriptorSet0.vp_c9)._m0[170].x;
    float _2374 = _2372 + (*spvDescriptorSet0.vp_c9)._m0[171].x;
    int _2376 = int(_2230) + int(_2338);
    int _2378 = _2294 * _2370;
    int _2380 = _2378 + _2368;
    float _2382 = 1.0 / _2057;
    int _2384 = abs(_1387);
    bool _2386 = !_2350;
    int _2388 = _2386 ? 0 : (-1);
    int _2390 = _2332 * _2376;
    int _2392 = _2390 + _2170;
    float _2394 = float(_2009);
    int _2396 = _2380 * _2384;
    int _2398 = ~_2314;
    int _2400 = _2398 + _2388;
    int _2402 = _2400 + 1;
    float _2404 = _2282 * _2394;
    float _2406 = float(_2133);
    float _2408 = -(*spvDescriptorSet0.vp_c9)._m0[172].x;
    float _2410 = _2408 + (*spvDescriptorSet0.vp_c9)._m0[173].x;
    int _2412 = abs(_1399);
    int _2414 = _2358 * _2001;
    int _2416 = _2414 + _2396;
    bool _2418 = _2406 >= _2394;
    bool _2420 = isnan(_2406);
    bool _2422 = _2418 || _2420;
    bool _2424 = isnan(_2394);
    bool _2426 = _2422 || _2424;
    float _2428 = float(_2426);
    float _2430 = trunc(_2404);
    int _2432 = int(_2430);
    float _2434 = -_231;
    int _2436 = _2290 ? as_type<int>(_2434) : as_type<int>(_231);
    int _2438 = _2362 * _2412;
    int _2440 = _2438 + _2416;
    int _2442 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _2444 = _2442 != 0;
    float _2446 = _2394 * _1303;
    bool _2448 = uint(_2392) >= uint(_2043);
    int _2450 = _2009 * _2402;
    int _2452 = _2450 + _2133;
    bool _2454 = !_2444;
    int _2456 = _2454 ? 0 : 1;
    float _2458 = trunc(_2428);
    int _2460 = int(_2458);
    int _2462 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32768;
    bool _2464 = _2462 != 0;
    float _2466 = -_227;
    int _2468 = _1225 ? as_type<int>(_2466) : as_type<int>(_227);
    bool _2470 = !_2464;
    int _2472 = _2470 ? 0 : 1;
    bool _2474 = _2009 == 0;
    float _2476 = trunc(_2446);
    int _2478 = int(_2476);
    int _2480 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16384;
    bool _2482 = _2480 != 0;
    int _2484 = abs(_2456);
    bool _2486 = !_2474;
    int _2488 = _2486 ? _2452 : (-1);
    bool _2490 = !_2482;
    int _2492 = _2490 ? 0 : 1;
    int _2494 = _2312 * _2484;
    int _2496 = _2494 + _2440;
    int _2498 = ~_2460;
    int _2500 = _2498 + 1;
    int _2502 = _2500 + 1;
    int _2504 = _2009 + (-1);
    int _2506 = abs(_2492);
    int _2508 = _2488 * _2502;
    int _2510 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32768;
    bool _2512 = _2510 != 0;
    bool _2514 = !_1233;
    float _2516 = _2514 ? _231 : as_type<float>(_2436);
    int _2518 = _2460 * _2504;
    int _2520 = _2518 + _2508;
    bool _2522 = !_2512;
    int _2524 = _2522 ? 0 : 1;
    bool _2526 = !_2448;
    int _2528 = _2526 ? 0 : (-1);
    int _2530 = _2432 * _2506;
    int _2532 = _2530 + _2133;
    int _2534 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 65536;
    bool _2536 = _2534 != 0;
    int _2538 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 131072;
    bool _2540 = _2538 != 0;
    int _2542 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 262144;
    bool _2544 = _2542 != 0;
    int _2546 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 524288;
    bool _2548 = _2546 != 0;
    float _2550 = float(uint(_2496));
    int _2552 = abs(_1431);
    int _2554 = abs(_1435);
    float _2556 = as_type<float>(_2123) * _2550;
    float _2558 = float(_2043);
    int _2560 = _2520 * _2552;
    float _2562 = trunc(_2556);
    float _2564 = precise::max(_2562, 0.0);
    uint _2566 = uint(_2564);
    float _2568 = float(_2170);
    float _2570 = _2298 * _2558;
    bool _2572 = !_2540;
    int _2574 = _2572 ? 0 : 1;
    int _2576 = _2478 * _2554;
    int _2578 = _2576 + _2560;
    int _2580 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 128;
    bool _2582 = _2580 != 0;
    float _2584 = _2558 * _1303;
    bool _2586 = _2568 >= _2558;
    bool _2588 = isnan(_2568);
    bool _2590 = _2586 || _2588;
    bool _2592 = isnan(_2558);
    bool _2594 = _2590 || _2592;
    float _2596 = float(_2594);
    float _2598 = trunc(_2596);
    int _2600 = int(_2598);
    int _2602 = ~_1983;
    int _2604 = _2602 + 1;
    int _2606 = _2532 * _2011;
    int _2608 = _2606 + _2578;
    float _2610 = float(uint(_2362));
    float _2612 = as_type<float>(_2484);
    if (_2582)
    {
        float _2614 = in.m_70.x;
        _2612 = _2614;
    }
    float _2616 = _2612;
    int _2618 = ~_2376;
    int _2620 = _2618 + _2528;
    int _2622 = _2620 + 1;
    float _2624 = trunc(_2570);
    int _2626 = int(_2624);
    int _2628 = abs(_2472);
    int _2630 = _2604 * int(_2566);
    int _2632 = _2630 + _2496;
    float _2634 = as_type<float>(_2123) * _2610;
    int _2636 = abs(_2524);
    int _2638 = _2432 * _2628;
    int _2640 = _2638 + _2608;
    bool _2642 = !_2536;
    int _2644 = _2642 ? 0 : 1;
    float _2646 = trunc(_2584);
    int _2648 = int(_2646);
    int _2650 = _2043 * _2622;
    int _2652 = _2650 + _2170;
    float _2654 = float(uint(_2632));
    float _2656 = float(uint(_2640));
    bool _2658 = _2043 == 0;
    float _2660 = as_type<float>(_2123) * _2654;
    float _2662 = trunc(_2634);
    float _2664 = precise::max(_2662, 0.0);
    uint _2666 = uint(_2664);
    float _2668 = as_type<float>(_2145) * _2656;
    int _2670 = ~_2600;
    int _2672 = _2670 + 1;
    int _2674 = _2672 + 1;
    int _2676 = _2626 * _2636;
    int _2678 = _2676 + _2170;
    bool _2680 = !_2658;
    int _2682 = _2680 ? _2652 : (-1);
    int _2684 = _2043 + (-1);
    float _2686 = trunc(_2668);
    float _2688 = precise::max(_2686, 0.0);
    uint _2690 = uint(_2688);
    int _2692 = _2682 * _2674;
    int _2694 = ~_1983;
    int _2696 = _2694 + 1;
    int _2698 = abs(_2574);
    int _2700 = _2600 * _2684;
    int _2702 = _2700 + _2692;
    float _2704 = as_type<float>(_2692);
    if (_2582)
    {
        float _2706 = _2616 * 3.1415927410125732421875;
        _2704 = _2706;
    }
    float _2708 = _2704;
    float _2710 = trunc(_2660);
    float _2712 = precise::max(_2710, 0.0);
    uint _2714 = uint(_2712);
    int _2716 = abs(_2644);
    int _2718 = _2702 * _2698;
    float _2720 = _2708;
    if (_2582)
    {
        float _2722 = _2708 * 0.15915493667125701904296875;
        _2720 = _2722;
    }
    float _2724 = _2720;
    int _2726 = _2696 * int(_2666);
    int _2728 = _2726 + _2362;
    int _2730 = ~_1983;
    int _2732 = _2730 + 1;
    int _2734 = ~_2009;
    int _2736 = _2734 + 1;
    float _2738 = _2724;
    if (_2582)
    {
        float _2740 = _2724 * 6.283185482025146484375;
        float _2742 = sin(_2740);
        _2738 = _2742;
    }
    float _2744 = _2738;
    float _2746 = float(uint(_2728));
    int _2748 = ~_2043;
    int _2750 = _2748 + 1;
    int _2752 = _2736 * int(_2690);
    int _2754 = _2752 + _2640;
    float _2756 = as_type<float>(_2123) * _2746;
    int _2758 = int(_2566) + int(_2714);
    float _2760 = float(uint(_2754));
    int _2762 = _2648 * _2716;
    int _2764 = _2762 + _2718;
    bool _2766 = !_2544;
    int _2768 = _2766 ? 0 : 1;
    int _2770 = _2732 * _2758;
    int _2772 = _2770 + _2496;
    bool _2774 = !_2548;
    int _2776 = _2774 ? 0 : 1;
    float _2778 = as_type<float>(_2145) * _2760;
    int _2780 = abs(_2768);
    float _2782 = trunc(_2756);
    float _2784 = precise::max(_2782, 0.0);
    uint _2786 = uint(_2784);
    int _2788 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _2790 = _2788 != 0;
    bool _2792 = uint(_2772) >= uint(_1983);
    bool _2794 = !_2790;
    float _2796 = _2794 ? _227 : as_type<float>(_2468);
    float _2798 = trunc(_2778);
    float _2800 = precise::max(_2798, 0.0);
    uint _2802 = uint(_2800);
    int _2804 = abs(_2776);
    bool _2806 = !_2792;
    int _2808 = _2806 ? 0 : (-1);
    int _2810 = 2 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y);
    bool _2812 = _2810 != 0;
    int _2814 = _2678 * _2780;
    int _2816 = _2814 + _2764;
    bool _2818 = _2792;
    if (_2582)
    {
        bool _2820 = _2744 > 0.5;
        _2818 = _2820;
    }
    bool _2822 = _2818;
    float _2824 = float(uint(_2532));
    int _2826 = _2626 * _2804;
    int _2828 = _2826 + _2816;
    int _2830 = ~_2758;
    int _2832 = _2830 + _2808;
    int _2834 = _2832 + 1;
    int _2836 = ~_2009;
    int _2838 = _2836 + 1;
    float _2840 = as_type<float>(_2145) * _2824;
    int _2842 = int(_2690) + int(_2802);
    int _2844 = _1983 * _2834;
    int _2846 = _2844 + _2496;
    float _2848 = as_type<float>(_2802);
    if (!_2582)
    {
        _2848 = _231;
    }
    float _2850 = _2848;
    float _2852 = _2850;
    if (_2582)
    {
        float _2854 = -_231;
        float _2856 = _2822 ? _2854 : _231;
        _2852 = _2856;
    }
    float _2858 = _2852;
    float _2860 = trunc(_2840);
    float _2862 = precise::max(_2860, 0.0);
    uint _2864 = uint(_2862);
    bool _2866 = !_2324;
    int _2868 = _2866 ? _2846 : (-1);
    int _2870 = _2838 * _2842;
    int _2872 = _2870 + _2640;
    float _2874 = float(uint(_2678));
    int _2876 = _2868 & 3;
    bool _2878 = _2876 != 0;
    bool _2880 = !_2812;
    float _2882 = _2880 ? _231 : as_type<float>(_2354);
    float _2884 = as_type<float>(_2172) * _2874;
    bool _2886 = uint(_2876) > 1u;
    int _2888 = ~_2009;
    int _2890 = _2888 + 1;
    float _2892 = trunc(_2884);
    float _2894 = precise::max(_2892, 0.0);
    uint _2896 = uint(_2894);
    int _2898 = _2868 & 3;
    bool _2900 = _2898 != 0;
    float _2902 = float(uint(_2828));
    int _2904 = _2890 * int(_2864);
    int _2906 = _2904 + _2532;
    int _2908 = _2900 ? 0 : 1;
    bool _2910 = uint(_2872) >= uint(_2009);
    float _2912 = as_type<float>(_2172) * _2902;
    int _2914 = int(_2666) + int(_2786);
    int _2916 = ~_2908;
    int _2918 = _2916 + 1;
    int _2920 = _2918 + 1;
    float _2922 = trunc(_2912);
    float _2924 = precise::max(_2922, 0.0);
    uint _2926 = uint(_2924);
    int _2928 = ~_1983;
    int _2930 = _2928 + 1;
    int _2932 = _2920;
    if (!_2886)
    {
        int _2934 = ~_2908;
        int _2936 = _2934 + 1;
        _2932 = _2936;
    }
    int _2938 = _2932;
    float _2940 = float(uint(_2906));
    int _2942 = _2930 * _2914;
    int _2944 = _2942 + _2362;
    int _2946 = ~_2043;
    int _2948 = _2946 + 1;
    bool _2950 = !_2910;
    int _2952 = _2950 ? 0 : (-1);
    float _2954 = as_type<float>(_2145) * _2940;
    bool _2956 = uint(_2876) >= 2u;
    int _2958 = _2948 * int(_2896);
    int _2960 = _2958 + _2678;
    int _2962 = ~_2842;
    int _2964 = _2962 + _2952;
    int _2966 = _2964 + 1;
    bool _2968 = _2876 != 3;
    int _2970 = _2956 ? 0 : 1;
    int _2972 = _2009 * _2966;
    int _2974 = _2972 + _2640;
    bool _2976 = uint(_2944) >= uint(_1983);
    float _2978 = float(uint(_2960));
    int _2980 = ~_2043;
    int _2982 = _2980 + 1;
    float _2984 = trunc(_2954);
    float _2986 = precise::max(_2984, 0.0);
    uint _2988 = uint(_2986);
    bool _2990 = !_2474;
    int _2992 = _2990 ? _2974 : (-1);
    float _2994 = as_type<float>(_2172) * _2978;
    int _2996 = ~_2970;
    int _2998 = _2996 + 1;
    int _3000 = _2998 + 1;
    int _3002 = _2982 * int(_2926);
    int _3004 = _3002 + _2828;
    bool _3006 = !_2976;
    int _3008 = _3006 ? 0 : (-1);
    int _3010 = _3000;
    if (_2968)
    {
        int _3012 = ~_2970;
        int _3014 = _3012 + 1;
        _3010 = _3014;
    }
    int _3016 = _3010;
    float _3018 = trunc(_2994);
    float _3020 = precise::max(_3018, 0.0);
    uint _3022 = uint(_3020);
    int _3024 = _2992 & 3;
    bool _3026 = _3024 != 0;
    int _3028 = _2992 & 3;
    bool _3030 = _3028 != 0;
    float _3032 = float(uint(_3004));
    int _3034 = _3026 ? 0 : 1;
    bool _3036 = uint(_3028) > 1u;
    float _3038 = as_type<float>(_2172) * _3032;
    int _3040 = int(_2864) + int(_2988);
    int _3042 = ~_3034;
    int _3044 = _3042 + 1;
    int _3046 = _3044 + 1;
    float _3048 = trunc(_3038);
    float _3050 = precise::max(_3048, 0.0);
    uint _3052 = uint(_3050);
    bool _3054 = !_3030;
    int _3056 = _3054 ? 0 : 1;
    bool _3058 = uint(_3028) >= 2u;
    int _3060 = ~_2009;
    int _3062 = _3060 + 1;
    int _3064 = _3058 ? 0 : 1;
    int _3066 = _3046;
    if (!_3036)
    {
        int _3068 = ~_3034;
        int _3070 = _3068 + 1;
        _3066 = _3070;
    }
    int _3072 = _3066;
    bool _3074 = _3028 != 3;
    bool _3076 = _3028 != 3;
    int _3078 = _3062 * _3040;
    int _3080 = _3078 + _2532;
    int _3082 = int(_2896) + int(_3022);
    int _3084 = int(_2926) + int(_3052);
    int _3086 = ~_2043;
    int _3088 = _3086 + 1;
    int _3090 = _2750 * _3082;
    int _3092 = _3090 + _2678;
    bool _3094 = !_3076;
    int _3096 = _3094 ? 0 : (-1);
    bool _3098 = uint(_3080) >= uint(_2009);
    float _3100 = -(*spvDescriptorSet0.vp_c9)._m0[167].w;
    float _3102 = _3100 + (*spvDescriptorSet0.vp_c9)._m0[168].w;
    int _3104 = ~_3064;
    int _3106 = _3104 + 1;
    int _3108 = _3106 + 1;
    int _3110 = _3108;
    if (_3074)
    {
        int _3112 = ~_3064;
        int _3114 = _3112 + 1;
        _3110 = _3114;
    }
    int _3116 = _3110;
    int _3118 = _3088 * _3084;
    int _3120 = _3118 + _2828;
    float _3122 = 1.0 / _3102;
    float _3124 = -(*spvDescriptorSet0.vp_c9)._m0[168].w;
    float _3126 = _3124 + (*spvDescriptorSet0.vp_c9)._m0[169].w;
    bool _3128 = !_3098;
    int _3130 = _3128 ? 0 : (-1);
    int _3132 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8388608;
    bool _3134 = _3132 != 0;
    float _3136 = -(*spvDescriptorSet0.vp_c9)._m0[170].w;
    float _3138 = _3136 + (*spvDescriptorSet0.vp_c9)._m0[171].w;
    bool _3140 = uint(_3120) >= uint(_2043);
    float _3142 = -(*spvDescriptorSet0.vp_c9)._m0[169].w;
    float _3144 = _3142 + (*spvDescriptorSet0.vp_c9)._m0[170].w;
    float _3146 = 1.0 / _3126;
    bool _3148 = !_3134;
    int _3150 = _3148 ? 0 : 1;
    bool _3152 = !_3140;
    int _3154 = _3152 ? 0 : (-1);
    bool _3156 = _1191 > 0.5;
    bool _3158 = uint(_3092) >= uint(_2043);
    float _3160 = 1.0 / _3138;
    bool _3162 = !_3158;
    int _3164 = _3162 ? 0 : (-1);
    int _3166 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y);
    bool _3168 = _3166 != 0;
    float _3170 = 1.0 / _3144;
    float _3172 = -_227;
    int _3174 = _3156 ? as_type<int>(_3172) : as_type<int>(_227);
    int _3176 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _3178 = _3176 != 0;
    bool _3180 = !_3168;
    float _3182 = _3180 ? _227 : as_type<float>(_3174);
    int _3184 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16777216;
    bool _3186 = _3184 != 0;
    float _3188 = _2374 * _3160;
    float _3190 = -(*spvDescriptorSet0.vp_c9)._m0[167].x;
    float _3192 = (*spvDescriptorSet0.vp_c9)._m0[168].x + _3190;
    float _3194 = -(*spvDescriptorSet0.vp_c9)._m0[168].x;
    float _3196 = _3194 + (*spvDescriptorSet0.vp_c9)._m0[169].x;
    bool _3198 = _1063 >= (*spvDescriptorSet0.vp_c9)._m0[174].w;
    bool _3200 = isnan(_1063);
    bool _3202 = _3198 || _3200;
    bool _3204 = isnan((*spvDescriptorSet0.vp_c9)._m0[174].w);
    bool _3206 = _3202 || _3204;
    float _3208 = float(_3206);
    float _3210 = _3192 * _3122;
    float _3212 = _3196 * _3146;
    bool _3214 = _1063 >= (*spvDescriptorSet0.vp_c9)._m0[173].w;
    bool _3216 = isnan(_1063);
    bool _3218 = _3214 || _3216;
    bool _3220 = isnan((*spvDescriptorSet0.vp_c9)._m0[173].w);
    bool _3222 = _3218 || _3220;
    float _3224 = float(_3222);
    float _3226 = -_3208;
    float _3228 = _3226 + 1.0;
    bool _3230 = _1063 >= (*spvDescriptorSet0.vp_c9)._m0[172].w;
    bool _3232 = isnan(_1063);
    bool _3234 = _3230 || _3232;
    bool _3236 = isnan((*spvDescriptorSet0.vp_c9)._m0[172].w);
    bool _3238 = _3234 || _3236;
    float _3240 = float(_3238);
    float _3242 = -(*spvDescriptorSet0.vp_c9)._m0[171].w;
    float _3244 = _3242 + (*spvDescriptorSet0.vp_c9)._m0[172].w;
    float _3246 = _2366 * _3170;
    float _3248 = _3224 * _3228;
    float _3250 = -_3224;
    float _3252 = _3250 + 1.0;
    float _3254 = 1.0 / _3244;
    bool _3256 = _1063 >= (*spvDescriptorSet0.vp_c9)._m0[171].w;
    bool _3258 = isnan(_1063);
    bool _3260 = _3256 || _3258;
    bool _3262 = isnan((*spvDescriptorSet0.vp_c9)._m0[171].w);
    bool _3264 = _3260 || _3262;
    float _3266 = float(_3264);
    float _3268 = _3240 * _3252;
    float _3270 = -_3240;
    float _3272 = _3270 + 1.0;
    int _3274 = ~_3040;
    int _3276 = _3274 + _3130;
    int _3278 = _3276 + 1;
    float _3280 = -_3266;
    float _3282 = _3280 + 1.0;
    float _3284 = _1811 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _3286 = _3266 * _3272;
    float _3288 = -(*spvDescriptorSet0.vp_c9)._m0[171].x;
    float _3290 = (*spvDescriptorSet0.vp_c9)._m0[172].x + _3288;
    float _3292 = _2031 * _3282;
    bool _3294 = _1063 >= (*spvDescriptorSet0.vp_c9)._m0[168].w;
    bool _3296 = isnan(_1063);
    bool _3298 = _3294 || _3296;
    bool _3300 = isnan((*spvDescriptorSet0.vp_c9)._m0[168].w);
    bool _3302 = _3298 || _3300;
    float _3304 = float(_3302);
    float _3306 = fma(_1797, (*spvDescriptorSet0.vp_c8)._m0[26].x, _3284);
    int _3308 = ~_2914;
    int _3310 = _3308 + _3008;
    int _3312 = _3310 + 1;
    int _3314 = _2009 * _3278;
    int _3316 = _3314 + _2532;
    int _3318 = abs(_3116);
    float _3320 = _3290 * _3254;
    float _3322 = -(*spvDescriptorSet0.vp_c9)._m0[173].w;
    float _3324 = _3322 + (*spvDescriptorSet0.vp_c9)._m0[174].w;
    float _3326 = _3304 * _2101;
    float _3328 = -(*spvDescriptorSet0.vp_c9)._m0[167].w;
    float _3330 = _1063 + _3328;
    float _3332 = -_3304;
    float _3334 = _3332 + 1.0;
    float _3336 = _2410 * _2382;
    float _3338 = -(*spvDescriptorSet0.vp_c9)._m0[169].w;
    float _3340 = _1063 + _3338;
    float _3342 = fma(_3210, _3330, (*spvDescriptorSet0.vp_c9)._m0[167].x);
    float _3344 = _2113 * _3334;
    float _3346 = -(*spvDescriptorSet0.vp_c9)._m0[168].w;
    float _3348 = _1063 + _3346;
    float _3350 = -_2113;
    float _3352 = _3350 + 1.0;
    float _3354 = 1.0 / _3324;
    float _3356 = _3342 * _3344;
    float _3358 = fma(_3212, _3348, (*spvDescriptorSet0.vp_c9)._m0[168].x);
    float _3360 = -(*spvDescriptorSet0.vp_c9)._m0[170].w;
    float _3362 = _1063 + _3360;
    float _3364 = fma(_3246, _3340, (*spvDescriptorSet0.vp_c9)._m0[169].x);
    float _3366 = fma(_3352, (*spvDescriptorSet0.vp_c9)._m0[167].x, _3356);
    float _3368 = -(*spvDescriptorSet0.vp_c9)._m0[173].x;
    float _3370 = (*spvDescriptorSet0.vp_c9)._m0[174].x + _3368;
    float _3372 = fma(_3188, _3362, (*spvDescriptorSet0.vp_c9)._m0[170].x);
    float _3374 = -(*spvDescriptorSet0.vp_c9)._m0[171].w;
    float _3376 = _1063 + _3374;
    float _3378 = fma(_3358, _3326, _3366);
    float _3380 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    int _3382 = ~_3084;
    int _3384 = _3382 + _3154;
    int _3386 = _3384 + 1;
    float _3388 = fma(_3320, _3376, (*spvDescriptorSet0.vp_c9)._m0[171].x);
    float _3390 = fma(_3364, _2093, _3378);
    float _3392 = _2858 + (-0.5);
    int _3394 = ~_3082;
    int _3396 = _3394 + _3164;
    int _3398 = _3396 + 1;
    float _3400 = _3370 * _3354;
    float _3402 = fma(_3372, _3292, _3390);
    float _3404 = _2322 + 0.5;
    float _3406 = -(*spvDescriptorSet0.vp_c9)._m0[172].w;
    float _3408 = _1063 + _3406;
    float _3410 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _3412 = fma(_3388, _3286, _3402);
    float _3414 = fma(_3404, (*spvDescriptorSet0.vp_c9)._m0[95].x, _1347);
    float _3416 = _3182 + 0.5;
    float _3418 = -(*spvDescriptorSet0.vp_c9)._m0[173].w;
    float _3420 = _1063 + _3418;
    float _3422 = fma(_3336, _3408, (*spvDescriptorSet0.vp_c9)._m0[172].x);
    float _3424 = _2882 + (-0.5);
    float _3426 = fma(_3416, (*spvDescriptorSet0.vp_c9)._m0[80].x, _1337);
    int _3428 = _2992 >> 31;
    float _3430 = fma(_3400, _3420, (*spvDescriptorSet0.vp_c9)._m0[173].x);
    float _3432 = fma(_3422, _3268, _3412);
    float _3434 = -_3392;
    float _3436 = -_1543;
    float _3438 = fma(_3434, (*spvDescriptorSet0.vp_c9)._m0[95].y, _3436);
    int _3440 = _3428 & 3;
    float _3442 = -_1329;
    float _3444 = _3442 + 1.0;
    float _3446 = -_3424;
    float _3448 = -_1495;
    float _3450 = fma(_3446, (*spvDescriptorSet0.vp_c9)._m0[80].y, _3448);
    float _3452 = fma(_3430, _3248, _3432);
    int _3454 = _2992 + _3440;
    float _3456 = -_3444;
    float _3458 = fma(_3456, _2322, _3414);
    float _3460 = fma(_1999, _2858, _3438);
    float _3462 = _3380 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _3464 = _2796 + 0.5;
    float _3466 = -_2005;
    float _3468 = fma(_3182, _3466, _3426);
    int _3470 = _3454 >> 2;
    float _3472 = _3410 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _3474 = _2516 + (-0.5);
    float _3476 = fma(_3462, _3464, _1551);
    int _3478 = _3470 << 4;
    int _3480 = _3478 + 656;
    out.m_82.x = _3458;
    out.m_82.y = _3460;
    float _3482 = -_3472;
    float _3484 = -_1619;
    float _3486 = fma(_3482, _3474, _3484);
    float _3488 = -_1639;
    float _3490 = _3488 + 1.0;
    float _3492 = _1791 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _3494 = _1791 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _3496 = _1791 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _3498 = fma(_2882, _3490, _3450);
    float _3500 = fma(_3208, (*spvDescriptorSet0.vp_c9)._m0[174].x, _3452);
    float _3502 = _1811 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _3504 = trunc((*spvDescriptorSet0.vp_c9)._m0[90].z);
    int _3506 = int(_3504);
    float _3508 = -_2015;
    float _3510 = fma(_2796, _3508, _3476);
    float _3512 = fma(_2516, _2019, _3486);
    uint _3514 = uint(int(uint(_3480) >> uint(2)));
    uint _3516 = uint(int(uint(int(_3514)) >> uint(2)));
    int _3518 = int(_3514) & 3;
    float _3520 = (*spvDescriptorSet0.vp_c9)._m0[int(_3516)][_3518];
    int _3522 = int(_3514) + 1;
    uint _3524 = uint(int(uint(_3522) >> uint(2)));
    int _3526 = _3522 & 3;
    float _3528 = (*spvDescriptorSet0.vp_c9)._m0[int(_3524)][_3526];
    float _3530 = -_1781;
    float _3532 = fma(_3530, (*spvDescriptorSet0.vp_c8)._m0[24].x, _3492);
    out.m_84.x = _3500;
    float _3534 = fma(_1797, (*spvDescriptorSet0.vp_c8)._m0[25].x, _3502);
    float _3536 = _227 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _3538 = fma(_1793, (*spvDescriptorSet0.vp_c8)._m0[24].z, _3532);
    out.m_86.x = _3468;
    out.m_86.y = _3498;
    out.m_86.z = _3510;
    out.m_86.w = _3512;
    int _3540 = abs(_3056);
    int _3542 = _3480 + 8;
    uint _3544 = uint(int(uint(_3542) >> uint(2)));
    uint _3546 = uint(int(uint(int(_3544)) >> uint(2)));
    int _3548 = int(_3544) & 3;
    float _3550 = (*spvDescriptorSet0.vp_c9)._m0[int(_3546)][_3548];
    int _3552 = int(_3544) + 1;
    uint _3554 = uint(int(uint(_3552) >> uint(2)));
    int _3556 = _3552 & 3;
    float _3558 = (*spvDescriptorSet0.vp_c9)._m0[int(_3554)][_3556];
    int _3560 = _1983 * _3312;
    int _3562 = _3560 + _2362;
    int _3564 = abs(_3150);
    int _3566 = _2043 * _3398;
    int _3568 = _3566 + _2678;
    int _3570 = ~_3540;
    int _3572 = _3570 + 1;
    int _3574 = _3572 + 1;
    int _3576 = abs(_2938);
    int _3578 = abs(_3072);
    bool _3580 = !_2324;
    int _3582 = _3580 ? _3562 : (-1);
    float _3584 = -_1781;
    float _3586 = fma(_3584, (*spvDescriptorSet0.vp_c8)._m0[25].x, _3494);
    float _3588 = -_1781;
    float _3590 = fma(_3588, (*spvDescriptorSet0.vp_c8)._m0[26].x, _3496);
    float _3592 = _1803 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _3594 = _1803 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _3596 = _1803 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _3598 = fma(_1793, (*spvDescriptorSet0.vp_c8)._m0[26].z, _3590);
    float _3600 = _1811 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _3602 = fma(_1795, (*spvDescriptorSet0.vp_c8)._m0[24].x, _3592);
    float _3604 = fma(_1795, (*spvDescriptorSet0.vp_c8)._m0[25].x, _3594);
    float _3606 = fma(_1795, (*spvDescriptorSet0.vp_c8)._m0[26].x, _3596);
    float _3608 = fma(_1797, (*spvDescriptorSet0.vp_c8)._m0[24].x, _3600);
    float _3610 = _231 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _3612 = fma(_1807, (*spvDescriptorSet0.vp_c8)._m0[24].z, _3602);
    int _3614 = ~_3578;
    int _3616 = _3614 + 1;
    int _3618 = _3616 + 1;
    float _3620 = fma(_1807, (*spvDescriptorSet0.vp_c8)._m0[25].z, _3604);
    float _3622 = fma(_3610, _3610, 1.0);
    float _3624 = fma(_1807, (*spvDescriptorSet0.vp_c8)._m0[26].z, _3606);
    float _3626 = _3610 * _3538;
    int _3628 = _2868 >> 31;
    float _3630 = rsqrt(_3622);
    int _3632 = abs(_3096);
    float _3634 = fma(_3536, _3612, _3626);
    out.m_88.x = _3612;
    out.m_88.y = _3620;
    out.m_88.z = _3624;
    int _3636 = _3628 & 3;
    float _3638 = fma(_1821, (*spvDescriptorSet0.vp_c8)._m0[24].z, _3608);
    float _3640 = fma(_1821, (*spvDescriptorSet0.vp_c8)._m0[25].z, _3534);
    float _3642 = fma(_1793, (*spvDescriptorSet0.vp_c8)._m0[25].z, _3586);
    int _3644 = _2868 + _3636;
    int _3646 = _3618 * as_type<int>(_3528);
    bool _3648 = !_2474;
    int _3650 = _3648 ? _3316 : (-1);
    float _3652 = fma(_1821, (*spvDescriptorSet0.vp_c8)._m0[26].z, _3306);
    bool _3654 = !_2878;
    int _3656 = _3654 ? 0 : 1;
    int _3658 = _3574 * as_type<int>(_3520);
    int _3660 = _3658 + _3646;
    float _3662 = _3610 * _3642;
    int _3664 = _2043 * _3386;
    int _3666 = _3664 + _2828;
    float _3668 = _3610 * _3630;
    int _3670 = abs(_3506);
    int _3672 = ~_3318;
    int _3674 = _3672 + 1;
    int _3676 = _3674 + 1;
    int _3678 = ~_3632;
    int _3680 = _3678 + 1;
    int _3682 = _3680 + 1;
    bool _3684 = !_2658;
    int _3686 = _3684 ? _3666 : (-1);
    int _3688 = _3676 * as_type<int>(_3550);
    int _3690 = _3688 + _3660;
    float _3692 = float(uint(_3506));
    float _3694 = -_3638;
    float _3696 = _3668 * _3694;
    int _3698 = _3686 >> 31;
    int _3700 = _3682 * as_type<int>(_3558);
    int _3702 = _3700 + _3690;
    int _3704 = _3644 >> 2;
    float _3706 = 1.0 / _3692;
    int _3708 = _3698 & 3;
    float _3710 = fma(_3630, _3538, _3696);
    int _3712 = _3704 << 4;
    int _3714 = _3712 + 368;
    float _3716 = float(uint(_3670));
    int _3718 = ~_3564;
    int _3720 = _3718 + 1;
    int _3722 = _3720 + 1;
    int _3724 = _3686 + _3708;
    float _3726 = 1.0 / _3716;
    uint _3728 = uint(int(uint(_3714) >> uint(2)));
    uint _3730 = uint(int(uint(int(_3728)) >> uint(2)));
    int _3732 = int(_3728) & 3;
    float _3734 = (*spvDescriptorSet0.vp_c9)._m0[int(_3730)][_3732];
    int _3736 = int(_3728) + 1;
    uint _3738 = uint(int(uint(_3736) >> uint(2)));
    int _3740 = _3736 & 3;
    float _3742 = (*spvDescriptorSet0.vp_c9)._m0[int(_3738)][_3740];
    int _3744 = _3686 & 3;
    bool _3746 = _3744 != 0;
    int _3748 = _3702 * _3722;
    int _3750 = _3686 & 3;
    bool _3752 = _3750 != 0;
    int _3754 = _3724 >> 2;
    int _3756 = _3650 * _3564;
    int _3758 = _3756 + _3748;
    int _3760 = _3746 ? 0 : 1;
    float _3762 = -_3640;
    float _3764 = _3668 * _3762;
    float _3766 = -_3652;
    float _3768 = _3668 * _3766;
    int _3770 = _3754 << 4;
    int _3772 = _3770 + 800;
    float _3774 = fma(_3630, _3642, _3764);
    float _3776 = _3610 * _3598;
    bool _3778 = uint(_3750) > 1u;
    float _3780 = fma(_3630, _3598, _3768);
    int _3782 = abs(_3758);
    uint _3784 = uint(int(uint(_3772) >> uint(2)));
    uint _3786 = uint(int(uint(int(_3784)) >> uint(2)));
    int _3788 = int(_3784) & 3;
    float _3790 = (*spvDescriptorSet0.vp_c9)._m0[int(_3786)][_3788];
    int _3792 = int(_3784) + 1;
    uint _3794 = uint(int(uint(_3792) >> uint(2)));
    int _3796 = _3792 & 3;
    float _3798 = (*spvDescriptorSet0.vp_c9)._m0[int(_3794)][_3796];
    float _3800 = fma(_3536, _3620, _3662);
    int _3802 = as_type<int>(_3706) + (-2);
    out.m_90.x = _3710;
    out.m_90.y = _3774;
    out.m_90.z = _3780;
    float _3804 = float(uint(_3758));
    float _3806 = fma(_3536, _3624, _3776);
    int _3808 = as_type<int>(_3726) + (-2);
    bool _3810 = !_3752;
    int _3812 = _3810 ? 0 : 1;
    int _3814 = _3772 + 8;
    uint _3816 = uint(int(uint(_3814) >> uint(2)));
    uint _3818 = uint(int(uint(int(_3816)) >> uint(2)));
    int _3820 = int(_3816) & 3;
    float _3822 = (*spvDescriptorSet0.vp_c9)._m0[int(_3818)][_3820];
    int _3824 = int(_3816) + 1;
    uint _3826 = uint(int(uint(_3824) >> uint(2)));
    int _3828 = _3824 & 3;
    float _3830 = (*spvDescriptorSet0.vp_c9)._m0[int(_3826)][_3828];
    bool _3832 = uint(_3750) >= 2u;
    int _3834 = ~_3760;
    int _3836 = _3834 + 1;
    int _3838 = _3836 + 1;
    int _3840 = _3838;
    if (!_3778)
    {
        int _3842 = ~_3760;
        int _3844 = _3842 + 1;
        _3840 = _3844;
    }
    int _3846 = _3840;
    float _3848 = as_type<float>(_3802) * _3804;
    float _3850 = float(uint(_3782));
    int _3852 = _3714 + 8;
    uint _3854 = uint(int(uint(_3852) >> uint(2)));
    uint _3856 = uint(int(uint(int(_3854)) >> uint(2)));
    int _3858 = int(_3854) & 3;
    float _3860 = (*spvDescriptorSet0.vp_c9)._m0[int(_3856)][_3858];
    int _3862 = int(_3854) + 1;
    uint _3864 = uint(int(uint(_3862) >> uint(2)));
    int _3866 = _3862 & 3;
    float _3868 = (*spvDescriptorSet0.vp_c9)._m0[int(_3864)][_3866];
    int _3870 = _3832 ? 0 : 1;
    float _3872 = trunc(_3848);
    float _3874 = precise::max(_3872, 0.0);
    uint _3876 = uint(_3874);
    bool _3878 = _2876 != 3;
    float _3880 = as_type<float>(_3808) * _3850;
    int _3882 = ~_3506;
    int _3884 = _3882 + 1;
    int _3886 = ~_3576;
    int _3888 = _3886 + 1;
    int _3890 = _3888 + 1;
    float _3892 = trunc(_3880);
    float _3894 = precise::max(_3892, 0.0);
    uint _3896 = uint(_3894);
    int _3898 = ~_3670;
    int _3900 = _3898 + 1;
    int _3902 = _3890 * as_type<int>(_3742);
    int _3904 = abs(_3846);
    int _3906 = _3884 * int(_3876);
    int _3908 = _3906 + _3758;
    int _3910 = abs(_3656);
    float _3912 = _3742;
    if (_1879)
    {
        float _3914 = _1923 * 6.283185482025146484375;
        float _3916 = cos(_3914);
        _3912 = _3916;
    }
    float _3918 = _3912;
    int _3920 = ~_3904;
    int _3922 = _3920 + 1;
    int _3924 = _3922 + 1;
    bool _3926 = _3750 != 3;
    int _3928 = _3900 * int(_3896);
    int _3930 = _3928 + _3782;
    float _3932 = float(uint(_3908));
    int _3934 = ~_3870;
    int _3936 = _3934 + 1;
    int _3938 = _3936 + 1;
    float _3940 = float(uint(_3930));
    float _3942 = as_type<float>(_3802) * _3932;
    int _3944 = ~_3910;
    int _3946 = _3944 + 1;
    int _3948 = _3946 + 1;
    int _3950 = _3924 * as_type<int>(_3798);
    int _3952 = abs(_3812);
    float _3954 = as_type<float>(_3808) * _3940;
    int _3956 = _3938;
    float _3958 = _3798;
    if (_1879)
    {
        float _3960 = _3918 + (-1.0);
        _1931 = _3960;
    }
    float _3962 = _1931;
    if (_3926)
    {
        int _3964 = ~_3870;
        int _3966 = _3964 + 1;
        _3956 = _3966;
    }
    int _3968 = _3956;
    int _3970 = _3948 * as_type<int>(_3734);
    int _3972 = _3970 + _3902;
    float _3974 = trunc(_3942);
    float _3976 = precise::max(_3974, 0.0);
    uint _3978 = uint(_3976);
    int _3980 = abs(_3016);
    float _3982 = as_type<float>(_3980);
    if (_1879)
    {
        float _3984 = _3962 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _3958 = _3984;
    }
    float _3986 = _3958;
    int _3988 = ~_3952;
    int _3990 = _3988 + 1;
    int _3992 = _3990 + 1;
    int _3994 = ~_3980;
    int _3996 = _3994 + 1;
    int _3998 = _3996 + 1;
    if (_1879)
    {
        float _4000 = fma(_1939, _3918, _3986);
        _1941 = _4000;
    }
    float _4002 = _1941;
    if (_1879)
    {
        float _4004 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _4006 = _1961 + _4004;
        _3982 = _4006;
    }
    float _4008 = _3982;
    float _4010 = trunc(_3954);
    float _4012 = precise::max(_4010, 0.0);
    uint _4014 = uint(_4012);
    int _4016 = _3992 * as_type<int>(_3790);
    int _4018 = _4016 + _3950;
    int _4020 = abs(_3968);
    int _4022 = _3998 * as_type<int>(_3860);
    int _4024 = _4022 + _3972;
    bool _4026 = !_3878;
    int _4028 = _4026 ? 0 : (-1);
    float _4030 = _4008;
    if (_1879)
    {
        float _4032 = _4008 * _4008;
        _1897 = _4032;
    }
    float _4034 = _1897;
    int _4036 = ~_4020;
    int _4038 = _4036 + 1;
    int _4040 = _4038 + 1;
    if (_1879)
    {
        float _4042 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _4044 = _1965 + _4042;
        _4030 = _4044;
    }
    float _4046 = _4030;
    int _4048 = ~_3670;
    int _4050 = _4048 + 1;
    int _4052 = abs(_4028);
    int _4054 = _4040 * as_type<int>(_3822);
    int _4056 = _4054 + _4018;
    bool _4058 = _3750 != 3;
    if (_1879)
    {
        float _4060 = _4046 * _4046;
        _1899 = _4060;
    }
    float _4062 = _1899;
    int _4064 = ~_3506;
    int _4066 = _4064 + 1;
    float _4068 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].w;
    int _4070 = int(_3896) + int(_4014);
    int _4072 = int(_3876) + int(_3978);
    int _4074 = ~_4052;
    int _4076 = _4074 + 1;
    int _4078 = _4076 + 1;
    int _4080 = _4050 * _4070;
    int _4082 = _4080 + _3782;
    bool _4084 = !_4058;
    int _4086 = _4084 ? 0 : (-1);
    int _4088 = _4066 * _4072;
    int _4090 = _4088 + _3758;
    bool _4092 = !_2658;
    int _4094 = _4092 ? _3568 : (-1);
    int _4096 = _4078 * as_type<int>(_3868);
    int _4098 = _4096 + _4024;
    int _4100 = abs(_4086);
    bool _4102 = uint(_4082) >= uint(_3670);
    float _4104 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _4106 = _4002 + _4104;
    int _4108 = _3758 ^ _3506;
    bool _4110 = uint(_4090) >= uint(_3506);
    float _4112 = fma(_4106, _4106, _4034);
    int _4114 = ~_4100;
    int _4116 = _4114 + 1;
    int _4118 = _4116 + 1;
    float _4120 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].z;
    bool _4122 = !_4102;
    int _4124 = _4122 ? 0 : (-1);
    float _4126 = _4068 * (*spvDescriptorSet0.vp_c9)._m0[90].y;
    uint _4128 = uint(int(uint(_4108) >> uint(31)));
    int _4130 = _4118 * as_type<int>(_3830);
    int _4132 = _4130 + _4056;
    bool _4134 = !_4110;
    int _4136 = _4134 ? 0 : (-1);
    float _4138 = _4112 + _4062;
    bool _4140 = !_3178;
    int _4142 = _4140 ? 0 : 1;
    int _4144 = ~_4124;
    int _4146 = _4070 + _4144;
    int _4148 = _4146 + 1;
    int _4150 = ~int(_4128);
    int _4152 = _4150 + 1;
    float _4154 = sqrt(_4138);
    int _4156 = ~_4072;
    int _4158 = _4156 + _4136;
    int _4160 = _4158 + 1;
    int _4162 = abs(_4142);
    bool _4164 = !_3186;
    int _4166 = _4164 ? 0 : 1;
    int _4168 = _3506 * _4160;
    int _4170 = _4168 + _3758;
    int _4172 = _4148 ^ _4152;
    int _4174 = ~_4162;
    int _4176 = _4174 + 1;
    int _4178 = _4176 + 1;
    int _4180 = abs(_4166);
    bool _4182 = _3506 == 0;
    int _4184 = _4098 * _4178;
    bool _4186 = _3506 == 0;
    int _4188 = ~_4152;
    int _4190 = _4188 + _4172;
    int _4192 = _4190 + 1;
    int _4194 = _3582 * _4162;
    int _4196 = _4194 + _4184;
    int _4198 = ~_4180;
    int _4200 = _4198 + 1;
    int _4202 = _4200 + 1;
    bool _4204 = !_4182;
    int _4206 = _4204 ? _4170 : (-1);
    bool _4208 = !_4186;
    int _4210 = _4208 ? _4192 : (-1);
    int _4212 = _4132 * _4202;
    float _4214 = float(_4206);
    float _4216 = _4120 * (*spvDescriptorSet0.vp_c9)._m0[90].x;
    float _4218 = float(_4210);
    int _4220 = _4094 * _4180;
    int _4222 = _4220 + _4212;
    out.m_92.x = _1975;
    out.m_92.y = _1977;
    out.m_92.z = _1979;
    float _4224 = fma(_4216, _4214, _1651);
    float _4226 = _1273 + 0.5;
    float _4228 = -_1653;
    float _4230 = fma(_4126, _4218, _4228);
    float _4232 = _1265 + (-0.5);
    float _4234 = float(_4222);
    float _4236 = fma(_4216, _4226, _4224);
    float _4238 = _3640 + _3800;
    float _4240 = -_4126;
    float _4242 = fma(_4240, _4232, _4230);
    float _4244 = float(_4196);
    float _4246 = -_2065;
    float _4248 = fma(_1273, _4246, _4236);
    float _4250 = _3638 + _3634;
    float _4252 = fma(_1265, _2073, _4242);
    float _4254 = _3652 + _3806;
    out.m_94.x = _4244;
    bool _4256 = _4154 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _4258 = isnan(_4154);
    bool _4260 = _4256 || _4258;
    bool _4262 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _4264 = _4260 || _4262;
    out.m_94.w = _4234;
    out.m_96.x = _4248;
    out.m_96.y = _4252;
    out.m_98.x = _4250;
    out.m_98.y = _4238;
    out.m_98.z = _4254;
    float _4266 = _4216;
    if (!_4264)
    {
        _4266 = 1.0;
    }
    float _4268 = _4266;
    bool _4270 = !_4264;
    float _4272 = _4268;
    if (!_4270)
    {
        bool _4274 = _4154 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _4276 = isnan(_4154);
        bool _4278 = _4274 || _4276;
        bool _4280 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _4282 = _4278 || _4280;
        if (!_4282)
        {
            float _4284 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _4286 = _4154 + _4284;
            float _4288 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _4290 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _4288;
            float _4292 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _4294 = _4292 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _4296 = 1.0 / _4290;
            float _4298 = _4286 * _4296;
            float _4300 = fma(_4298, _4294, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _4272 = _4300;
            _4302 = true;
        }
        else
        {
            bool _4304 = _4154 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _4306 = isnan(_4154);
            bool _4308 = _4304 || _4306;
            bool _4310 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _4312 = _4308 || _4310;
            if (!_4312)
            {
                float _4314 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _4316 = _4154 + _4314;
                float _4318 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _4320 = _4318 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _4322 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _4324 = _4322 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _4326 = 1.0 / _4320;
                float _4328 = _4316 * _4326;
                float _4330 = fma(_4328, _4324, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _4272 = _4330;
                _4302 = true;
            }
            else
            {
                _4272 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _4302 = false;
    float _4332 = _4272;
    float _4334 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _4336 = _4002 + _4334;
    float _4338 = _1877 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _4340 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _4342 = _1961 + _4340;
    float _4344 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _4346 = _1965 + _4344;
    float _4348 = fma(_4336, _4332, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _4350 = fma(_1777, (*spvDescriptorSet0.vp_c8)._m0[11].x, _4338);
    float _4352 = fma(_4342, _4332, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _4354 = fma(_4346, _4332, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _4356 = -_1877;
    float _4358 = _4356 + _4348;
    float _4360 = fma(_1787, (*spvDescriptorSet0.vp_c8)._m0[11].z, _4350);
    float _4362 = -_1777;
    float _4364 = _4362 + _4352;
    float _4366 = _1877 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _4368 = _4358 * _4358;
    float _4370 = _4360 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _4372 = -_1787;
    float _4374 = _4372 + _4354;
    float _4376 = fma(_1777, (*spvDescriptorSet0.vp_c8)._m0[10].x, _4366);
    float _4378 = fma(_4364, _4364, _4368);
    float _4380 = 1.0 / _4370;
    float _4382 = fma(_1787, (*spvDescriptorSet0.vp_c8)._m0[10].z, _4376);
    float _4384 = fma(_4374, _4374, _4378);
    float _4386 = _4382 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _4388 = sqrt(_4384);
    float _4390 = _4386 + _4370;
    float _4392 = _4390 * _4380;
    float _4394 = _4392 * 0.5;
    bool _4396 = _4388 > 0.0;
    float _4398 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _4400 = fma(_4394, (*spvDescriptorSet0.vp_c8)._m0[30].w, _4398);
    float _4402 = 1.0 / _4400;
    bool _4404 = (*spvDescriptorSet0.vp_c15)._m0[660].y >= 0.5;
    bool _4406 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _4408 = _4404 || _4406;
    bool _4410 = isnan(0.5);
    bool _4412 = _4408 || _4410;
    bool _4414 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _4416 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _4418 = _4414 || _4416;
    bool _4420 = isnan(0.5);
    bool _4422 = _4418 || _4420;
    float _4424 = (*spvDescriptorSet0.vp_c15)._m0[660].y;
    float _4426 = (*spvDescriptorSet0.vp_c15)._m0[653].w;
    float _4428 = _4346;
    float _4430 = _4380;
    float _4432 = _4400;
    float _4434 = _4348;
    if (!_4396)
    {
        _4424 = _4352;
    }
    float _4436 = _4424;
    float _4438 = _4436;
    if (!_4396)
    {
        _4426 = _4348;
    }
    float _4440 = _4426;
    float _4442 = _4440;
    float _4444 = _4440;
    if (!_4396)
    {
        _4428 = _4354;
    }
    float _4446 = _4428;
    bool _4448 = !_4396;
    float _4450 = _4446;
    float _4452 = _4446;
    if (!_4448)
    {
        float _4454 = _247 * _247;
        float _4456 = rsqrt(_4384);
        float _4458 = fma(_243, _243, _4454);
        float _4460 = fma(_249, _249, _4458);
        float _4462 = sqrt(_4460);
        float _4464 = _4364 * _4456;
        float _4466 = _4358 * _4456;
        float _4468 = _4374 * _4456;
        bool _4470 = _4462 > 0.0;
        float _4472 = _4462;
        _4430 = _4464;
        _4432 = _4456;
        if (!_4470)
        {
            _4472 = _4352;
        }
        float _4474 = _4472;
        _4438 = _4474;
        if (!_4470)
        {
            _4442 = _4348;
        }
        float _4476 = _4442;
        _4444 = _4476;
        if (!_4470)
        {
            _4450 = _4354;
        }
        float _4478 = _4450;
        bool _4480 = !_4470;
        _4452 = _4478;
        if (!_4480)
        {
            float _4482 = rsqrt(_4460);
            float _4484 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].z;
            float _4486 = _247 * _4482;
            float _4488 = _243 * _4482;
            float _4490 = _249 * _4482;
            float _4492 = _4466 * _4486;
            float _4494 = fma(_4464, _4488, _4492);
            float _4496 = _4484 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _4498 = fma(_4468, _4490, _4494);
            float _4500 = _4498 * _4496;
            float _4502 = fma(_243, _4500, _4352);
            float _4504 = fma(_247, _4500, _4348);
            float _4506 = fma(_249, _4500, _4354);
            _4444 = _4504;
            _4452 = _4506;
            _4438 = _4502;
            _4432 = _4500;
        }
    }
    float _4508 = _4444;
    float _4510 = _4452;
    float _4512 = _4438;
    float _4514 = _4430;
    float _4516 = _4432;
    float _4518 = _4516;
    float _4520 = _4508;
    float _4522 = _4512;
    float _4524 = _4510;
    float _4526 = _4514;
    if (_4422)
    {
        _4518 = 1.0;
    }
    float _4528 = _4518;
    float _4530 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _4532 = _4402 * _4530;
    float _4534 = _4528;
    if (!_4412)
    {
        float _4536 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _4538 = _1877 + _4536;
        float _4540 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _4542 = _1777 + _4540;
        float _4544 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _4546 = -_1877;
        float _4548 = _4546 + _4508;
        float _4550 = _4538 * _4538;
        float _4552 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _4554 = _1787 + _4552;
        float _4556 = -_1787;
        float _4558 = _4556 + _4510;
        float _4560 = fma(_4542, _4542, _4550);
        float _4562 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _4564 = fma(_4554, _4554, _4560);
        float _4566 = sqrt(_4564);
        float _4568 = _4544 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _4570 = precise::min(_4566, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _4572 = _4570 * _4562;
        float _4574 = _4568 * _4572;
        float _4576 = -_1777;
        float _4578 = _4576 + _4512;
        float _4580 = fma(_4548, _4574, _1877);
        float _4582 = fma(_4578, _4574, _1777);
        float _4584 = fma(_4558, _4574, _1787);
        _4520 = _4580;
        _4522 = _4582;
        _4524 = _4584;
    }
    float _4586 = _4520;
    float _4588 = _4522;
    float _4590 = _4524;
    if (!_4422)
    {
        float _4592 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _4594 = _4592 * 0.15915493667125701904296875;
        float _4596 = _4594 * 6.283185482025146484375;
        float _4598 = cos(_4596);
        float _4600 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _4602 = _4600 * 0.15915493667125701904296875;
        float _4604 = _4594 * 6.283185482025146484375;
        float _4606 = sin(_4604);
        float _4608 = 1.0 / _4598;
        float _4610 = _4602 * 6.283185482025146484375;
        float _4612 = cos(_4610);
        float _4614 = _4606 * _4608;
        float _4616 = _4602 * 6.283185482025146484375;
        float _4618 = sin(_4616);
        float _4620 = _4612 * _4614;
        float _4622 = 1.0 / _4620;
        float _4624 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _4626 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _4624;
        float _4628 = 1.0 / _4626;
        float _4630 = _4618 * _4622;
        float _4632 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _4634 = fma(_4532, _4630, _4632);
        float _4636 = _4634 * _4628;
        float _4638 = precise::clamp(_4636, 0.0, 1.0);
        _4534 = _4638;
    }
    float _4640 = _4534;
    float _4642 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _4644 = _4586 + _4642;
    float _4646 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _4648 = _4588 + _4646;
    float _4650 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _4652 = _4590 + _4650;
    float _4654 = _4644 * _4644;
    float _4656 = fma(_4648, _4648, _4654);
    float _4658 = fma(_1777, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _4660 = fma(_4652, _4652, _4656);
    float _4662 = rsqrt(_4660);
    float _4664 = sqrt(_4660);
    float _4666 = _4662 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _4668 = _4586 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _4670 = _4648 * _4666;
    float _4672 = _4652 * _4666;
    float _4674 = fma(_4588, (*spvDescriptorSet0.vp_c8)._m0[2].x, _4668);
    float _4676 = _4670 * _4670;
    float _4678 = _4672 * _4672;
    float _4680 = fma(_4590, (*spvDescriptorSet0.vp_c8)._m0[2].z, _4674);
    float _4682 = _4676 + _4678;
    float _4684 = _4680 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _4686 = _4586 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _4688 = sqrt(_4682);
    float _4690 = fma(_4588, (*spvDescriptorSet0.vp_c8)._m0[3].x, _4686);
    float _4692 = fma(_4590, (*spvDescriptorSet0.vp_c8)._m0[3].z, _4690);
    float _4694 = _4692 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    bool _4696 = _4688 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _4698 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _4700 = _4688 + _4698;
    float _4702 = _4662;
    float _4704 = _4682;
    float _4706 = _4700;
    float _4708 = _4644;
    float _4710 = (*spvDescriptorSet0.vp_c15)._m0[652].x;
    if (_4696)
    {
        float _4712 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _4702 = _4712;
    }
    float _4714 = _4702;
    if (_4696)
    {
        float _4716 = rsqrt(_4682);
        _4704 = _4716;
    }
    float _4718 = _4704;
    float _4720 = _4718;
    if (_4696)
    {
        float _4722 = _4700 * _4714;
        _4706 = _4722;
    }
    float _4724 = _4706;
    if (_4696)
    {
        float _4726 = _4724 * 0.15915493667125701904296875;
        _4526 = _4726;
    }
    float _4728 = _4526;
    float _4730 = _4652;
    if (_4696)
    {
        float _4732 = _4728 * 6.283185482025146484375;
        float _4734 = sin(_4732);
        _4730 = _4734;
    }
    float _4736 = _4730;
    float _4738 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _4740 = precise::max(0.0, _4738);
    float _4742 = _4714;
    float _4744 = _4740;
    if (_4696)
    {
        float _4746 = _4728 * 6.283185482025146484375;
        float _4748 = cos(_4746);
        _4742 = _4748;
    }
    float _4750 = _4742;
    float _4752 = -_4666;
    float _4754 = -_4740;
    float _4756 = fma(_4644, _4752, _4754);
    if (_4696)
    {
        float _4758 = _4756 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _4708 = _4758;
    }
    float _4760 = _4708;
    float _4762 = floor(_4658);
    float _4764 = _4760;
    float _4766 = _4736;
    if (_4696)
    {
        float _4768 = fma(_4736, _4760, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _4764 = _4768;
    }
    float _4770 = _4764;
    float _4772 = _4770;
    if (!_4696)
    {
        _4766 = _4670;
    }
    float _4774 = _4766;
    float _4776 = _4774;
    float _4778 = _4750;
    if (_4696)
    {
        float _4780 = _4750 + (-1.0);
        _4744 = _4780;
    }
    float _4782 = _4744;
    float _4784 = _4782;
    if (_4696)
    {
        float _4786 = _4718 * _4770;
        _4710 = _4786;
    }
    float _4788 = _4710;
    if (!_4696)
    {
        _4772 = _4756;
    }
    float _4790 = _4772;
    float _4792 = _4790;
    if (_4696)
    {
        float _4794 = _4782 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _4434 = _4794;
    }
    float _4796 = _4434;
    if (_4696)
    {
        float _4798 = _4670 * _4788;
        _4776 = _4798;
    }
    float _4800 = _4776;
    if (!_4696)
    {
        _4784 = _4672;
    }
    float _4802 = _4784;
    float _4804 = _4802;
    if (_4696)
    {
        float _4806 = _4672 * _4788;
        _4804 = _4806;
    }
    float _4808 = _4804;
    if (!_4696)
    {
        _4720 = _4676;
    }
    float _4810 = _4720;
    float _4812 = _4810;
    if (_4696)
    {
        float _4814 = fma(_4756, _4750, _4796);
        _4792 = _4814;
    }
    float _4816 = _4792;
    if (_4696)
    {
        float _4818 = _4800 * _4800;
        _4812 = _4818;
    }
    float _4820 = _4812;
    if (!_4696)
    {
        _4778 = _4678;
    }
    float _4822 = _4778;
    float _4824 = _4822;
    if (_4696)
    {
        float _4826 = _4808 * _4808;
        _4824 = _4826;
    }
    float _4828 = _4824;
    float _4830 = fma(_4816, _4816, _4820);
    float _4832 = -_4762;
    float _4834 = _4658 + _4832;
    float _4836 = _4830 + _4828;
    float _4838 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _4840 = fma(_4664, (*spvDescriptorSet0.vp_c15)._m0[23].w, _4838);
    float _4842 = precise::clamp(_4840, 0.0, 1.0);
    float _4844 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _4846 = rsqrt(_4836);
    float _4848 = -_4842;
    float _4850 = _4848 + 1.0;
    float _4852 = _4684 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _4854 = fma(_1787, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _4856 = _4586 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _4858 = -_4852;
    float _4860 = fma(_4858, _4844, 1.0);
    float _4862 = _4586 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _4864 = fma(_4588, (*spvDescriptorSet0.vp_c8)._m0[1].x, _4856);
    float _4866 = abs(_4850);
    float _4868 = log2(_4866);
    float _4870 = fma(_4588, (*spvDescriptorSet0.vp_c8)._m0[0].x, _4862);
    float _4872 = fma(_4590, (*spvDescriptorSet0.vp_c8)._m0[1].z, _4864);
    float _4874 = fma(_4590, (*spvDescriptorSet0.vp_c8)._m0[0].z, _4870);
    float _4876 = _4846 * _4800;
    float _4878 = _4872 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _4880 = _4846 * _4816;
    float _4882 = _4846 * _4808;
    float _4884 = _4876 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _4886 = _4874 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _4888 = floor(_4854);
    float _4890 = _4878 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _4892 = -_4884;
    float _4894 = fma(_4880, (*spvDescriptorSet0.vp_c15)._m0[21].y, _4892);
    float _4896 = _4878 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _4898 = _4868 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _4900 = fma(_4886, (*spvDescriptorSet0.vp_c8)._m0[5].x, _4890);
    float _4902 = -_4882;
    float _4904 = fma(_4902, (*spvDescriptorSet0.vp_c15)._m0[21].z, _4894);
    float _4906 = fma(_4886, (*spvDescriptorSet0.vp_c8)._m0[7].x, _4896);
    float _4908 = exp2(_4898);
    float _4910 = fma(_4904, -0.5, 0.5);
    float _4912 = fma(_4684, (*spvDescriptorSet0.vp_c8)._m0[7].z, _4906);
    float _4914 = _4878 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _4916 = fma(_4694, (*spvDescriptorSet0.vp_c8)._m0[7].w, _4912);
    float _4918 = log2(_4860);
    float _4920 = -_4888;
    float _4922 = _4854 + _4920;
    float _4924 = fma(_4886, (*spvDescriptorSet0.vp_c8)._m0[4].x, _4914);
    float _4926 = fma(_4684, (*spvDescriptorSet0.vp_c8)._m0[5].z, _4900);
    float _4928 = fma(_4904, 0.5, 0.5);
    float _4930 = _4880 + 1.0;
    float _4932 = fma(_4684, (*spvDescriptorSet0.vp_c8)._m0[4].z, _4924);
    float _4934 = fma(_4694, (*spvDescriptorSet0.vp_c8)._m0[5].w, _4926);
    float _4936 = 1.0 / _4916;
    float _4938 = -_4880;
    float _4940 = fma(_4908, _4930, _4938);
    float _4942 = fma(_4928, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _4944 = fma(_4694, (*spvDescriptorSet0.vp_c8)._m0[4].w, _4932);
    float _4946 = fma(_4940, 0.5, 0.5);
    float _4948 = fma(_4928, _4942, -0.212114393711090087890625);
    float _4950 = sqrt(_4910);
    float _4952 = _4918 * 0.693147182464599609375;
    float _4954 = fma(_4928, _4948, 1.570728778839111328125);
    float _4956 = _4952 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _4958 = _4934 * _4936;
    float _4960 = _4944 * _4936;
    float _4962 = fma(_4958, -0.5, 0.5);
    float _4964 = fma(_4960, 0.5, 0.5);
    float2 _12760 = float2(_4834, _4922);
    float _4966 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_12760, float2(0.0), isnan(_12760)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_12760, float2(0.0), isnan(_12760)), level(0.0)).x;
    float _4968 = _4950 * 0.636619746685028076171875;
    float3 _12772 = float3(_4964, _4962, _4956);
    float _4970 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_12772, float3(0.0), isnan(_12772)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_12772, float3(0.0), isnan(_12772)), level(0.0)).x;
    float3 _12783 = float3(_4964, _4962, _4956);
    float4 _4973 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_12783, float3(0.0), isnan(_12783)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_12783, float3(0.0), isnan(_12783)), level(0.0)).xyzw;
    float _4975 = _4973.x;
    float _4977 = _4973.y;
    float _4979 = _4973.z;
    float _4981 = _4973.w;
    float _4983 = -_4954;
    float _4985 = fma(_4968, _4983, 1.0);
    float2 _12804 = float2(_4985, _4946);
    float3 _4987 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_12804, float2(0.0), isnan(_12804)), level(0.0)), spvDescriptorSet0.dm_border, 4u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_12804, float2(0.0), isnan(_12804)), level(0.0)).xyz;
    float _4989 = _4987.x;
    float _4991 = _4987.y;
    float _4993 = _4987.z;
    float _4995 = abs(_4532);
    float _4997 = log2(_4995);
    float _4999 = _4878 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _5001 = _4868 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    out.m_100.x = _4588;
    out.m_100.y = _4586;
    out.m_100.z = _4590;
    float _5003 = fma(_4886, (*spvDescriptorSet0.vp_c8)._m0[6].x, _4999);
    bool _5005 = _4664 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _5007 = isnan(_4664);
    bool _5009 = _5005 || _5007;
    bool _5011 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _5013 = _5009 || _5011;
    float _5015 = fma(_4684, (*spvDescriptorSet0.vp_c8)._m0[6].z, _5003);
    float _5017 = exp2(_5001);
    bool _5019 = _4532 <= 8000.0;
    bool _5021 = isnan(_4532);
    bool _5023 = _5019 || _5021;
    bool _5025 = isnan(8000.0);
    bool _5027 = _5023 || _5025;
    float _5029 = float(_5027);
    float _5031 = _4944 + _4916;
    float _5033 = fma(_4694, (*spvDescriptorSet0.vp_c8)._m0[6].w, _5015);
    float _5035 = _4997 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _5037 = in.m_102.x;
    out.gl_Position.x = _4944;
    out.gl_Position.y = _4934;
    out.gl_Position.z = _5033;
    out.gl_Position.w = _4916;
    float _5039 = exp2(_5035);
    float _5041 = -_5017;
    float _5043 = _5041 + 1.0;
    float _5045 = _5043 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _5047 = -_5045;
    float _5049 = _5047 + 1.0;
    float _5051 = fma(_5039, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _5053 = precise::clamp(_5051, 0.0, 1.0);
    float _5055 = _4916 * 0.5;
    float _5057 = fma(_5053, -2.0, 3.0);
    float _5059 = _5053 * _5053;
    float _5061 = _5059 * _5057;
    float _5063 = _5033 + _4916;
    float _5065 = -_5061;
    float _5067 = _5065 + 1.0;
    float _5069 = _5063 * 0.5;
    float _5071 = _4916;
    float _5073 = _5033;
    float _5075 = _4934;
    float _5077 = _5049;
    if (!_5013)
    {
        _5071 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _5079 = _5071;
    float _5081 = fma(_5067, (*spvDescriptorSet0.vp_c15)._m0[654].w, _5061);
    float _5083 = fma(_4934, -0.5, _5055);
    float _5085 = _5031 * 0.5;
    float _5087 = _5029 * _5081;
    float _5089 = _5079;
    float _5091 = _5079;
    if (!_5013)
    {
        _5073 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _5093 = _5073;
    out.m_104.x = _5085;
    out.m_104.y = _5083;
    out.m_104.z = _5069;
    out.m_104.w = _4916;
    float _5095 = _5087 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _5097 = _5093;
    float _5099 = _5093;
    if (!_5013)
    {
        _5075 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _5101 = _5075;
    float _5103 = _4640 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _5105 = -_4966;
    float _5107 = _5105 + 1.0;
    float _5109 = _5045 * _4970;
    float _5111 = _5107 * _5095;
    float _5113 = precise::clamp(_5111, 0.0, 1.0);
    float _5115 = _4981 * _5049;
    float _5117 = _5101;
    float _5119 = _5101;
    if (!_5013)
    {
        _5077 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _5121 = _5077;
    float _5123 = -_5113;
    float _5125 = fma(_5123, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _5127 = _4981 * _5109;
    float _5129 = _5125 * _5037;
    float _5131 = _4993 * _5109;
    float _5133 = fma(_4989, _5127, _4975);
    float _5135 = fma(_4991, _5127, _4977);
    float _5137 = _5129 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _5139 = fma(_4981, _5131, _4979);
    float _5141 = _5129;
    float _5143 = _5127;
    float _5145 = _5121;
    float _5147 = _5121;
    if (!_5013)
    {
        _5141 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _5149 = _5141;
    float _5151 = _5149;
    float _5153 = _5149;
    if (!_5013)
    {
        _5143 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _5155 = _5143;
    out.m_106.x = _5137;
    out.m_108.x = _5133;
    out.m_108.y = _5135;
    out.m_108.z = _5139;
    out.m_108.w = _5115;
    bool _5157 = !_5013;
    float _5159 = _5155;
    float _5161 = _5155;
    if (!_5157)
    {
        bool _5163 = _4664 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _5165 = isnan(_4664);
        bool _5167 = _5163 || _5165;
        bool _5169 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _5171 = _5167 || _5169;
        if (!_5171)
        {
            float _5173 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _5175 = _4664 + _5173;
            float _5177 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _5179 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _5177;
            float _5181 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _5183 = _5181 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _5185 = 1.0 / _5179;
            float _5187 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _5189 = _5187 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _5191 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _5193 = _5191 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _5195 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _5197 = _5195 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _5199 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _5201 = _5199 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _5203 = _5175 * _5185;
            float _5205 = precise::clamp(_5203, 0.0, 1.0);
            float _5207 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _5209 = _5207 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _5211 = fma(_5205, _5183, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _5213 = fma(_5205, _5209, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _5215 = fma(_5205, _5189, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _5217 = fma(_5205, _5193, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _5219 = fma(_5205, _5197, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _5221 = fma(_5205, _5201, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _5091 = _5215;
            _5147 = _5219;
            _5153 = _5211;
            _5119 = _5217;
            _5099 = _5213;
            _5161 = _5221;
            _5223 = true;
        }
        else
        {
            bool _5225 = _4664 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _5227 = isnan(_4664);
            bool _5229 = _5225 || _5227;
            bool _5231 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _5233 = _5229 || _5231;
            if (!_5233)
            {
                _5151 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _5235 = _5151;
            _5153 = _5235;
            if (!_5233)
            {
                _5089 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _5237 = _5089;
            _5091 = _5237;
            if (!_5233)
            {
                _5097 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _5239 = _5097;
            _5099 = _5239;
            if (!_5233)
            {
                _5117 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _5241 = _5117;
            _5119 = _5241;
            if (!_5233)
            {
                _5145 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _5243 = _5145;
            _5147 = _5243;
            if (!_5233)
            {
                _5159 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _5245 = _5159;
            bool _5247 = !_5233;
            _5161 = _5245;
            if (!_5247)
            {
                bool _5249 = _4664 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _5251 = isnan(_4664);
                bool _5253 = _5249 || _5251;
                bool _5255 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _5257 = _5253 || _5255;
                if (!_5257)
                {
                    float _5259 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _5261 = _4664 + _5259;
                    float _5263 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _5265 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _5263;
                    float _5267 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _5269 = _5267 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _5271 = 1.0 / _5265;
                    float _5273 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _5275 = _5273 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _5277 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _5279 = _5277 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _5281 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _5283 = _5281 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _5285 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _5287 = _5285 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _5289 = _5261 * _5271;
                    float _5291 = precise::clamp(_5289, 0.0, 1.0);
                    float _5293 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _5295 = _5293 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _5297 = fma(_5291, _5269, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _5299 = fma(_5291, _5295, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _5301 = fma(_5291, _5275, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _5303 = fma(_5291, _5279, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _5305 = fma(_5291, _5283, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _5307 = fma(_5291, _5287, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _5091 = _5301;
                    _5147 = _5305;
                    _5153 = _5297;
                    _5119 = _5303;
                    _5099 = _5299;
                    _5161 = _5307;
                    _5223 = true;
                }
                else
                {
                    _5091 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _5147 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _5153 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _5119 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _5099 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _5161 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _5223 = false;
    float _5309 = _5091;
    float _5311 = _5147;
    float _5313 = _5153;
    float _5315 = _5119;
    float _5317 = _5099;
    float _5319 = _5161;
    float _5321 = fma(_4238, -0.5, 0.5);
    float _5323 = precise::clamp(_5321, 0.0, 1.0);
    float _5325 = -_5309;
    float _5327 = _5325 + _5311;
    float _5329 = _5103 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _5331 = -_5313;
    float _5333 = _5331 + _5315;
    out.m_110.x = 0.0;
    float _5335 = fma(_5323, _5327, _5309);
    float _5337 = fma(_5323, _5333, _5313);
    out.m_57.x = _5329;
    float _5339 = -_5317;
    float _5341 = _5339 + _5319;
    float _5343 = _5335 * 0.586610972881317138671875;
    bool _5345 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _5347 = fma(_5323, _5341, _5317);
    float _5349 = fma(_5337, 0.298911988735198974609375, _5343);
    bool _5351 = _4640 > 0.0;
    bool _5353 = isnan(_4640);
    bool _5355 = _5351 || _5353;
    bool _5357 = isnan(0.0);
    bool _5359 = _5355 || _5357;
    float _5361 = fma(_5347, 0.114477999508380889892578125, _5349);
    float _5363 = -_5361;
    float _5365 = _5337 + _5363;
    float _5367 = -_5361;
    float _5369 = _5335 + _5367;
    float _5371 = -_5361;
    float _5373 = _5347 + _5371;
    float _5375 = fma(_5365, (*spvDescriptorSet0.vp_c13)._m0[1].z, _5361);
    float _5377 = fma(_5369, (*spvDescriptorSet0.vp_c13)._m0[1].z, _5361);
    float _5379 = fma(_5373, (*spvDescriptorSet0.vp_c13)._m0[1].z, _5361);
    bool _5381 = !_5345;
    if (!_5381)
    {
        float _5383 = -_4586;
        float _5385 = _5383 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _5387 = -_4588;
        float _5389 = _5387 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _5391 = -_4590;
        float _5393 = _5391 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _5395 = _5385 * _5385;
        float _5397 = fma(_5389, _5389, _5395);
        float _5399 = fma(_5393, _5393, _5397);
        float _5401 = sqrt(_5399);
        float _5403 = rsqrt(_5399);
        float _5405 = -_5401;
        float _5407 = _5405 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _5409 = _5407 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _5411 = precise::clamp(_5409, 0.0, 1.0);
        float _5413 = _5389 * _5403;
        float _5415 = _5385 * _5403;
        float _5417 = abs(_5411);
        float _5419 = log2(_5417);
        float _5421 = _5393 * _5403;
        float _5423 = _5413 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _5425 = _4238 * _5415;
        float _5427 = -_5415;
        float _5429 = -_5423;
        float _5431 = fma(_5427, (*spvDescriptorSet0.vp_c15)._m0[656].y, _5429);
        float _5433 = fma(_4250, _5413, _5425);
        float _5435 = -_5421;
        float _5437 = fma(_5435, (*spvDescriptorSet0.vp_c15)._m0[656].z, _5431);
        float _5439 = fma(_4254, _5421, _5433);
        float _5441 = precise::clamp(_5439, 0.0, 1.0);
        float _5443 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _5445 = _5437 + _5443;
        float _5447 = _5419 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _5449 = _5445 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _5451 = precise::clamp(_5449, 0.0, 1.0);
        float _5453 = exp2(_5447);
        float _5455 = _5453 * _5451;
        float _5457 = _5441 * _5455;
        float _5459 = _5457 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _5461 = _5457 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _5463 = _5457 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_110.x = _5459;
        out.m_110.y = _5461;
        out.m_110.z = _5463;
    }
    out.m_112.x = _5375;
    out.m_112.y = _5377;
    out.m_112.z = _5379;
    if (_5359)
    {
        return out;
    }
    out.m_57.x = 0.0;
    float _5465 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _5465;
    return out;
}


struct dm_geometry_capture { device uint* dst; uint4 info; uint stride; short slot[144]; };
static inline void dm_cw(constant dm_geometry_capture& g, device uint* p, uint k, uint v) { short s = g.slot[k]; if (s >= 0) p[s] = v; }
vertex void main0_gs(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]], uint dm_iid [[instance_id]], constant dm_geometry_capture& dm_gs [[buffer(13)]])
{
    uint dm_vid = gl_VertexIndex;
    uint4 dm_ci = dm_gs.info; device uint* dm_capture = dm_gs.dst;
    if (dm_vid - dm_ci.x >= dm_ci.y || dm_iid - dm_ci.z >= dm_ci.w) return;
    device uint* dm_p = dm_capture + ((ulong(dm_iid - dm_ci.z) * dm_ci.y + dm_vid - dm_ci.x) * dm_gs.stride);

    main0_out out = {};
    out.m_74 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_76 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_57 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_112 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_55 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_86 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_104 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_78 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_84 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_96 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_82 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_94 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_90 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_98 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_100 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_88 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_110 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_92 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_106 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_108 = float4(0.0, 0.0, 0.0, 1.0);
    bool _5223 = false;
    bool _4302 = false;
    bool _739 = false;
    bool _565 = false;
    bool _459 = false;
    bool _271 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _126 = in.m_50.w;
    float _128 = in.m_52.w;
    float _130 = trunc(_126);
    int _133 = int(_130);
    float _135 = -_128;
    float _137 = _135 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    out.m_55.y = _137;
    bool _141 = _133 >= 1;
    float _143 = 0.0;
    float _145 = _128;
    float _147 = _137;
    if (!_141)
    {
        _143 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _149 = _143;
    if (!_141)
    {
        out.m_57.x = 0.0;
    }
    int _151 = 0;
    if (!_141)
    {
        float _153 = _149 * 5.0;
        _151 = as_type<int>(_153);
    }
    int _155 = _151;
    int _157 = _155;
    if (!_141)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _5533 = as_type<float>(_155);
        out.gl_Position.z = _5533;
    }
    if (!_141)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_57.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_57.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_57.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_57.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_112.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_112.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_112.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_112.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_55.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_55.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_55.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_55.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_104.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_104.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_104.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_104.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_96.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_96.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_96.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_96.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_94.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_94.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_94.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_94.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_90.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_90.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_90.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_90.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_98.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_98.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_98.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_98.w)); dm_cw(dm_gs, dm_p, 72, as_type<uint>(out.m_100.x)); dm_cw(dm_gs, dm_p, 73, as_type<uint>(out.m_100.y)); dm_cw(dm_gs, dm_p, 74, as_type<uint>(out.m_100.z)); dm_cw(dm_gs, dm_p, 75, as_type<uint>(out.m_100.w)); dm_cw(dm_gs, dm_p, 76, as_type<uint>(out.m_88.x)); dm_cw(dm_gs, dm_p, 77, as_type<uint>(out.m_88.y)); dm_cw(dm_gs, dm_p, 78, as_type<uint>(out.m_88.z)); dm_cw(dm_gs, dm_p, 79, as_type<uint>(out.m_88.w)); dm_cw(dm_gs, dm_p, 80, as_type<uint>(out.m_110.x)); dm_cw(dm_gs, dm_p, 81, as_type<uint>(out.m_110.y)); dm_cw(dm_gs, dm_p, 82, as_type<uint>(out.m_110.z)); dm_cw(dm_gs, dm_p, 83, as_type<uint>(out.m_110.w)); dm_cw(dm_gs, dm_p, 84, as_type<uint>(out.m_92.x)); dm_cw(dm_gs, dm_p, 85, as_type<uint>(out.m_92.y)); dm_cw(dm_gs, dm_p, 86, as_type<uint>(out.m_92.z)); dm_cw(dm_gs, dm_p, 87, as_type<uint>(out.m_92.w)); dm_cw(dm_gs, dm_p, 88, as_type<uint>(out.m_106.x)); dm_cw(dm_gs, dm_p, 89, as_type<uint>(out.m_106.y)); dm_cw(dm_gs, dm_p, 90, as_type<uint>(out.m_106.z)); dm_cw(dm_gs, dm_p, 91, as_type<uint>(out.m_106.w)); dm_cw(dm_gs, dm_p, 92, as_type<uint>(out.m_108.x)); dm_cw(dm_gs, dm_p, 93, as_type<uint>(out.m_108.y)); dm_cw(dm_gs, dm_p, 94, as_type<uint>(out.m_108.z)); dm_cw(dm_gs, dm_p, 95, as_type<uint>(out.m_108.w)); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    bool _159 = _128 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _161 = isnan(_128);
    bool _163 = _159 || _161;
    bool _165 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _167 = _163 || _165;
    float _169 = float(_133);
    bool _171 = _137 >= _169;
    bool _173 = !_167;
    bool _175 = _171 || _173;
    float _177 = 1.0 / _169;
    if (_175)
    {
        _145 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _179 = _145;
    if (_175)
    {
        out.m_57.x = 0.0;
    }
    float _181 = _137 * _177;
    float _183 = _181;
    if (_175)
    {
        float _185 = _179 * 5.0;
        _157 = as_type<int>(_185);
    }
    int _187 = _157;
    out.m_55.x = _181;
    if (_175)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _5596 = as_type<float>(_187);
        out.gl_Position.z = _5596;
    }
    if (_175)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_57.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_57.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_57.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_57.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_112.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_112.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_112.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_112.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_55.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_55.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_55.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_55.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_104.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_104.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_104.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_104.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_96.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_96.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_96.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_96.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_94.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_94.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_94.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_94.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_90.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_90.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_90.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_90.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_98.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_98.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_98.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_98.w)); dm_cw(dm_gs, dm_p, 72, as_type<uint>(out.m_100.x)); dm_cw(dm_gs, dm_p, 73, as_type<uint>(out.m_100.y)); dm_cw(dm_gs, dm_p, 74, as_type<uint>(out.m_100.z)); dm_cw(dm_gs, dm_p, 75, as_type<uint>(out.m_100.w)); dm_cw(dm_gs, dm_p, 76, as_type<uint>(out.m_88.x)); dm_cw(dm_gs, dm_p, 77, as_type<uint>(out.m_88.y)); dm_cw(dm_gs, dm_p, 78, as_type<uint>(out.m_88.z)); dm_cw(dm_gs, dm_p, 79, as_type<uint>(out.m_88.w)); dm_cw(dm_gs, dm_p, 80, as_type<uint>(out.m_110.x)); dm_cw(dm_gs, dm_p, 81, as_type<uint>(out.m_110.y)); dm_cw(dm_gs, dm_p, 82, as_type<uint>(out.m_110.z)); dm_cw(dm_gs, dm_p, 83, as_type<uint>(out.m_110.w)); dm_cw(dm_gs, dm_p, 84, as_type<uint>(out.m_92.x)); dm_cw(dm_gs, dm_p, 85, as_type<uint>(out.m_92.y)); dm_cw(dm_gs, dm_p, 86, as_type<uint>(out.m_92.z)); dm_cw(dm_gs, dm_p, 87, as_type<uint>(out.m_92.w)); dm_cw(dm_gs, dm_p, 88, as_type<uint>(out.m_106.x)); dm_cw(dm_gs, dm_p, 89, as_type<uint>(out.m_106.y)); dm_cw(dm_gs, dm_p, 90, as_type<uint>(out.m_106.z)); dm_cw(dm_gs, dm_p, 91, as_type<uint>(out.m_106.w)); dm_cw(dm_gs, dm_p, 92, as_type<uint>(out.m_108.x)); dm_cw(dm_gs, dm_p, 93, as_type<uint>(out.m_108.y)); dm_cw(dm_gs, dm_p, 94, as_type<uint>(out.m_108.z)); dm_cw(dm_gs, dm_p, 95, as_type<uint>(out.m_108.w)); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _189 = as_type<float>(int(gl_VertexIndex));
    float _191 = in.m_62.x;
    float _193 = in.m_62.y;
    float _195 = in.m_62.z;
    float _197 = in.m_64.x;
    float _199 = in.m_64.y;
    float _201 = in.m_64.z;
    float _203 = in.m_66.x;
    float _205 = in.m_66.y;
    float _207 = in.m_66.z;
    float _209 = in.m_68.x;
    float _211 = in.m_68.y;
    float _213 = in.m_68.z;
    int _215 = as_type<int>(_189) & 1;
    bool _217 = _215 != 0;
    int _219 = as_type<int>(_189) & 2;
    bool _221 = _219 != 0;
    bool _223 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    bool _225 = !_217;
    float _227 = _225 ? (-0.5) : 0.5;
    bool _229 = !_221;
    float _231 = _229 ? (-0.5) : 0.5;
    float _233 = _193 * _199;
    float _235 = _193 * _205;
    float _237 = fma(_191, _197, _233);
    float _239 = _193 * _211;
    float _241 = fma(_191, _203, _235);
    float _243 = fma(_195, _201, _237);
    float _245 = fma(_191, _209, _239);
    float _247 = fma(_195, _207, _241);
    float _249 = fma(_195, _213, _245);
    bool _251 = !_223;
    float _269;
    if (!_251)
    {
        float _253 = in.m_70.x;
        float _255 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _257 = _253 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _259 = fma(_257, (*spvDescriptorSet0.vp_c9)._m0[12].x, _137);
        float _261 = _259 * _255;
        float _263 = floor(_261);
        float _265 = -_263;
        float _267 = _261 + _265;
        _269 = _267;
        _271 = true;
    }
    else
    {
        _269 = _181;
    }
    _271 = false;
    float _273 = _269;
    float _275 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _277 = _273 + _275;
    float _279 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _281 = _273 + _279;
    float _283 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _285 = _273 + _283;
    float _287 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _289 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _287;
    float _291 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _293 = _291 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _295 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _297 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _295;
    bool _299 = _273 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _301 = isnan(_273);
    bool _303 = _299 || _301;
    bool _305 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _307 = _303 || _305;
    float _309 = float(_307);
    float _311 = 1.0 / _289;
    bool _313 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _315 = 1.0 / _297;
    float _317 = 1.0 / _293;
    float _319 = _277 * _311;
    bool _321 = _273 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _323 = isnan(_273);
    bool _325 = _321 || _323;
    bool _327 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _329 = _325 || _327;
    float _331 = float(_329);
    float _333 = -_309;
    float _335 = _333 + 1.0;
    float _337 = _331 * _335;
    float _339 = _281 * _315;
    bool _341 = _273 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _343 = isnan(_273);
    bool _345 = _341 || _343;
    bool _347 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _349 = _345 || _347;
    float _351 = float(_349);
    float _353 = -_331;
    float _355 = _353 + 1.0;
    float _357 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _359 = _357 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _361 = _351 * _355;
    float _363 = -_351;
    float _365 = _363 + 1.0;
    float _367 = _285 * _317;
    bool _369 = _273 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _371 = isnan(_273);
    bool _373 = _369 || _371;
    bool _375 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _377 = _373 || _375;
    float _379 = float(_377);
    float _381 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _383 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _381;
    float _385 = fma(_359, _367, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _387 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _389 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _387;
    float _391 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _393 = _391 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _395 = fma(_383, _319, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _397 = _379 * _365;
    float _399 = fma(_389, _319, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _401 = fma(_393, _367, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _403 = -_379;
    float _405 = _403 + 1.0;
    float _407 = _395 * _397;
    float _409 = _399 * _397;
    float _411 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _413 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _411;
    float _415 = fma(_405, (*spvDescriptorSet0.vp_c9)._m0[143].x, _407);
    float _417 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _419 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _417;
    float _421 = fma(_405, (*spvDescriptorSet0.vp_c9)._m0[143].y, _409);
    float _423 = fma(_413, _339, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _425 = fma(_385, _361, _415);
    float _427 = fma(_419, _339, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _429 = fma(_401, _361, _421);
    float _431 = fma(_423, _337, _425);
    float _433 = fma(_427, _337, _429);
    float _435 = fma(_309, (*spvDescriptorSet0.vp_c9)._m0[146].x, _431);
    float _437 = fma(_309, (*spvDescriptorSet0.vp_c9)._m0[146].y, _433);
    bool _439 = !_313;
    float _457;
    if (!_439)
    {
        float _441 = in.m_70.x;
        float _443 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _445 = _441 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _447 = fma(_445, (*spvDescriptorSet0.vp_c9)._m0[11].y, _137);
        float _449 = _447 * _443;
        float _451 = floor(_449);
        float _453 = -_451;
        float _455 = _449 + _453;
        _457 = _455;
        _459 = true;
    }
    else
    {
        _457 = _181;
    }
    _459 = false;
    float _461 = _457;
    float _463 = in.m_72.x;
    float _465 = in.m_72.y;
    bool _467 = _461 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _469 = isnan(_461);
    bool _471 = _467 || _469;
    bool _473 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _475 = _471 || _473;
    float _477 = float(_475);
    float _479 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _481 = _479 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _483 = _461 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _485 = isnan(_461);
    bool _487 = _483 || _485;
    bool _489 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _491 = _487 || _489;
    float _493 = float(_491);
    float _495 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _497 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _495;
    float _499 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _501 = _461 + _499;
    float _503 = -_477;
    float _505 = _503 + 1.0;
    bool _507 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _509 = 1.0 / _481;
    float _511 = _493 * _505;
    float _513 = -_493;
    float _515 = _513 + 1.0;
    float _517 = _437 * _465;
    float _519 = _435 * _463;
    float _521 = _497 * _509;
    float _523 = fma(_521, _501, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _525 = _523 * _511;
    float _527 = fma(_515, (*spvDescriptorSet0.vp_c9)._m0[115].x, _525);
    float _529 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _531 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _533 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _535 = fma(_477, (*spvDescriptorSet0.vp_c9)._m0[116].x, _527);
    float _537 = _529 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _539 = _531 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _541 = _533 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _543 = _535 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    out.m_74.x = _537;
    out.m_74.y = _539;
    out.m_74.z = _541;
    out.m_74.w = _543;
    bool _545 = !_507;
    float _563;
    if (!_545)
    {
        float _547 = in.m_70.x;
        float _549 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _551 = _547 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _553 = fma(_551, (*spvDescriptorSet0.vp_c9)._m0[11].w, _137);
        float _555 = _553 * _549;
        float _557 = floor(_555);
        float _559 = -_557;
        float _561 = _555 + _559;
        _563 = _561;
        _565 = true;
    }
    else
    {
        _563 = _181;
    }
    _565 = false;
    float _567 = _563;
    float _569 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _571 = _567 + _569;
    float _573 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _575 = _573 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _577 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _579 = _577 + (*spvDescriptorSet0.vp_c9)._m0[133].w;
    bool _581 = _567 >= (*spvDescriptorSet0.vp_c9)._m0[133].w;
    bool _583 = isnan(_567);
    bool _585 = _581 || _583;
    bool _587 = isnan((*spvDescriptorSet0.vp_c9)._m0[133].w);
    bool _589 = _585 || _587;
    float _591 = float(_589);
    float _593 = -(*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _595 = _593 + (*spvDescriptorSet0.vp_c9)._m0[134].w;
    bool _597 = _567 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _599 = isnan(_567);
    bool _601 = _597 || _599;
    bool _603 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _605 = _601 || _603;
    float _607 = float(_605);
    float _609 = 1.0 / _575;
    float _611 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _613 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _611;
    float _615 = -_591;
    float _617 = _615 + 1.0;
    bool _619 = _567 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _621 = isnan(_567);
    bool _623 = _619 || _621;
    bool _625 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _627 = _623 || _625;
    float _629 = float(_627);
    bool _631 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[14].x;
    float _633 = 1.0 / _579;
    float _635 = 1.0 / _595;
    float _637 = _613 * _609;
    float _639 = -(*spvDescriptorSet0.vp_c9)._m0[132].x;
    float _641 = _639 + (*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _643 = _607 * _617;
    float _645 = -_607;
    float _647 = _645 + 1.0;
    float _649 = fma(_637, _571, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    float _651 = -(*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _653 = (*spvDescriptorSet0.vp_c9)._m0[134].x + _651;
    float _655 = _629 * _647;
    float _657 = _641 * _633;
    bool _659 = _567 >= (*spvDescriptorSet0.vp_c9)._m0[134].w;
    bool _661 = isnan(_567);
    bool _663 = _659 || _661;
    bool _665 = isnan((*spvDescriptorSet0.vp_c9)._m0[134].w);
    bool _667 = _663 || _665;
    float _669 = float(_667);
    float _671 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _673 = _567 + _671;
    float _675 = _649 * _655;
    float _677 = -_629;
    float _679 = _677 + 1.0;
    float _681 = -(*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _683 = _567 + _681;
    float _685 = fma(_657, _673, (*spvDescriptorSet0.vp_c9)._m0[132].x);
    float _687 = _653 * _635;
    float _689 = -_669;
    float _691 = _689 + 1.0;
    float _693 = fma(_679, (*spvDescriptorSet0.vp_c9)._m0[131].x, _675);
    float _695 = fma(_687, _683, (*spvDescriptorSet0.vp_c9)._m0[133].x);
    float _697 = _591 * _691;
    float _699 = fma(_685, _643, _693);
    float _701 = fma(_695, _697, _699);
    float _703 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _705 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _707 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _709 = fma(_669, (*spvDescriptorSet0.vp_c9)._m0[134].x, _701);
    float _711 = _705 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _713 = _703 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _715 = _707 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _717 = _709 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    out.m_76.x = _711;
    out.m_76.y = _713;
    out.m_76.z = _715;
    out.m_76.w = _717;
    bool _719 = !_631;
    float _737;
    if (!_719)
    {
        float _721 = in.m_70.x;
        float _723 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[14].x;
        float _725 = _721 * (*spvDescriptorSet0.vp_c9)._m0[15].x;
        float _727 = fma(_725, (*spvDescriptorSet0.vp_c9)._m0[14].x, _137);
        float _729 = _727 * _723;
        float _731 = floor(_729);
        float _733 = -_731;
        float _735 = _729 + _733;
        _737 = _735;
        _739 = true;
    }
    else
    {
        _737 = _181;
    }
    _739 = false;
    float _741 = _737;
    float _743 = -(*spvDescriptorSet0.vp_c9)._m0[159].w;
    float _745 = _741 + _743;
    bool _747 = _741 >= (*spvDescriptorSet0.vp_c9)._m0[165].w;
    bool _749 = isnan(_741);
    bool _751 = _747 || _749;
    bool _753 = isnan((*spvDescriptorSet0.vp_c9)._m0[165].w);
    bool _755 = _751 || _753;
    float _757 = float(_755);
    float _759 = -(*spvDescriptorSet0.vp_c9)._m0[159].w;
    float _761 = _759 + (*spvDescriptorSet0.vp_c9)._m0[160].w;
    bool _763 = _741 >= (*spvDescriptorSet0.vp_c9)._m0[164].w;
    bool _765 = isnan(_741);
    bool _767 = _763 || _765;
    bool _769 = isnan((*spvDescriptorSet0.vp_c9)._m0[164].w);
    bool _771 = _767 || _769;
    float _773 = float(_771);
    float _775 = -(*spvDescriptorSet0.vp_c9)._m0[159].x;
    float _777 = (*spvDescriptorSet0.vp_c9)._m0[160].x + _775;
    bool _779 = _741 >= (*spvDescriptorSet0.vp_c9)._m0[163].w;
    bool _781 = isnan(_741);
    bool _783 = _779 || _781;
    bool _785 = isnan((*spvDescriptorSet0.vp_c9)._m0[163].w);
    bool _787 = _783 || _785;
    float _789 = float(_787);
    float _791 = -_757;
    float _793 = _791 + 1.0;
    float _795 = 1.0 / _761;
    float _797 = _773 * _793;
    float _799 = -_789;
    float _801 = _799 + 1.0;
    float _803 = -(*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _805 = _803 + (*spvDescriptorSet0.vp_c9)._m0[161].w;
    bool _807 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[14].y;
    float _809 = 1.0 / _805;
    float _811 = _777 * _795;
    float _813 = -_773;
    float _815 = _813 + 1.0;
    bool _817 = _741 >= (*spvDescriptorSet0.vp_c9)._m0[162].w;
    bool _819 = isnan(_741);
    bool _821 = _817 || _819;
    bool _823 = isnan((*spvDescriptorSet0.vp_c9)._m0[162].w);
    bool _825 = _821 || _823;
    float _827 = float(_825);
    float _829 = fma(_811, _745, (*spvDescriptorSet0.vp_c9)._m0[159].x);
    float _831 = _789 * _815;
    bool _833 = _741 >= (*spvDescriptorSet0.vp_c9)._m0[161].w;
    bool _835 = isnan(_741);
    bool _837 = _833 || _835;
    bool _839 = isnan((*spvDescriptorSet0.vp_c9)._m0[161].w);
    bool _841 = _837 || _839;
    float _843 = float(_841);
    float _845 = _827 * _801;
    float _847 = -_827;
    float _849 = _847 + 1.0;
    float _851 = -(*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _853 = _851 + (*spvDescriptorSet0.vp_c9)._m0[162].w;
    bool _855 = _741 >= (*spvDescriptorSet0.vp_c9)._m0[160].w;
    bool _857 = isnan(_741);
    bool _859 = _855 || _857;
    bool _861 = isnan((*spvDescriptorSet0.vp_c9)._m0[160].w);
    bool _863 = _859 || _861;
    float _865 = float(_863);
    float _867 = _843 * _849;
    float _869 = -_843;
    float _871 = _869 + 1.0;
    float _873 = -(*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _875 = _873 + (*spvDescriptorSet0.vp_c9)._m0[163].w;
    bool _877 = _741 >= (*spvDescriptorSet0.vp_c9)._m0[159].w;
    bool _879 = isnan(_741);
    bool _881 = _877 || _879;
    bool _883 = isnan((*spvDescriptorSet0.vp_c9)._m0[159].w);
    bool _885 = _881 || _883;
    float _887 = float(_885);
    float _889 = 1.0 / _853;
    float _891 = _865 * _871;
    float _893 = -_865;
    float _895 = _893 + 1.0;
    float _897 = 1.0 / _875;
    float _899 = -(*spvDescriptorSet0.vp_c9)._m0[160].x;
    float _901 = _899 + (*spvDescriptorSet0.vp_c9)._m0[161].x;
    float _903 = _887 * _895;
    float _905 = -(*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _907 = _905 + (*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _909 = _901 * _809;
    float _911 = _829 * _903;
    float _913 = -_887;
    float _915 = _913 + 1.0;
    float _917 = 1.0 / _907;
    float _919 = -(*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _921 = _919 + (*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _923 = -(*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _925 = _741 + _923;
    float _927 = -(*spvDescriptorSet0.vp_c9)._m0[161].x;
    float _929 = (*spvDescriptorSet0.vp_c9)._m0[162].x + _927;
    float _931 = fma(_915, (*spvDescriptorSet0.vp_c9)._m0[159].x, _911);
    float _933 = -(*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _935 = _933 + (*spvDescriptorSet0.vp_c9)._m0[166].w;
    float _937 = fma(_909, _925, (*spvDescriptorSet0.vp_c9)._m0[160].x);
    float _939 = _929 * _889;
    float _941 = 1.0 / _921;
    float _943 = -(*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _945 = _741 + _943;
    float _947 = -(*spvDescriptorSet0.vp_c9)._m0[162].x;
    float _949 = _947 + (*spvDescriptorSet0.vp_c9)._m0[163].x;
    float _951 = fma(_937, _891, _931);
    float _953 = fma(_939, _945, (*spvDescriptorSet0.vp_c9)._m0[161].x);
    float _955 = -(*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _957 = _741 + _955;
    float _959 = _949 * _897;
    float _961 = 1.0 / _935;
    float _963 = -(*spvDescriptorSet0.vp_c9)._m0[163].x;
    float _965 = (*spvDescriptorSet0.vp_c9)._m0[164].x + _963;
    float _967 = -(*spvDescriptorSet0.vp_c9)._m0[164].x;
    float _969 = _967 + (*spvDescriptorSet0.vp_c9)._m0[165].x;
    float _971 = fma(_953, _867, _951);
    float _973 = _965 * _917;
    float _975 = fma(_959, _957, (*spvDescriptorSet0.vp_c9)._m0[162].x);
    float _977 = -(*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _979 = _741 + _977;
    float _981 = _969 * _941;
    float _983 = -(*spvDescriptorSet0.vp_c9)._m0[165].x;
    float _985 = (*spvDescriptorSet0.vp_c9)._m0[166].x + _983;
    bool _987 = _741 >= (*spvDescriptorSet0.vp_c9)._m0[166].w;
    bool _989 = isnan(_741);
    bool _991 = _987 || _989;
    bool _993 = isnan((*spvDescriptorSet0.vp_c9)._m0[166].w);
    bool _995 = _991 || _993;
    int _997 = _995 ? 1065353216 : 0;
    float _999 = -(*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _1001 = _741 + _999;
    float _1003 = fma(_973, _979, (*spvDescriptorSet0.vp_c9)._m0[163].x);
    float _1005 = fma(_975, _845, _971);
    float _1007 = -(*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _1009 = _741 + _1007;
    float _1011 = fma(_981, _1001, (*spvDescriptorSet0.vp_c9)._m0[164].x);
    float _1013 = _985 * _961;
    float _1015 = -as_type<float>(_997);
    float _1017 = _1015 + 1.0;
    float _1019 = fma(_1003, _831, _1005);
    float _1021 = fma(_1013, _1009, (*spvDescriptorSet0.vp_c9)._m0[165].x);
    float _1023 = _757 * _1017;
    float _1025 = fma(_1011, _797, _1019);
    float _1027 = fma(_1021, _1023, _1025);
    float _1029 = fma(as_type<float>(_997), (*spvDescriptorSet0.vp_c9)._m0[166].x, _1027);
    out.m_78.x = _1029;
    bool _1031 = !_807;
    float _1033 = _1021;
    int _1035 = _997;
    int _1037 = as_type<int>(_981);
    float _1039 = _1029;
    float _1041 = _971;
    float _1043 = _941;
    if (!_1031)
    {
        float _1045 = in.m_70.x;
        float _1047 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[14].y;
        float _1049 = _1045 * (*spvDescriptorSet0.vp_c9)._m0[15].y;
        float _1051 = fma(_1049, (*spvDescriptorSet0.vp_c9)._m0[14].y, _137);
        float _1053 = _1051 * _1047;
        float _1055 = floor(_1053);
        float _1057 = -_1055;
        float _1059 = _1053 + _1057;
        _1033 = _1047;
        _183 = _1059;
    }
    float _1061 = _1033;
    float _1063 = _183;
    float _1065 = in.m_70.z;
    float _1067 = in.m_70.w;
    int _1069 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _1071 = _1069 != 0;
    float _1073 = (*spvDescriptorSet0.vp_c9)._m0[7].z;
    float _1075 = _1061;
    if (_1071)
    {
        float _1077 = in.m_70.x;
        float _1079 = in.m_70.y;
        _1073 = _1077;
        _1075 = _1079;
    }
    float _1081 = _1073;
    float _1083 = _1075;
    float _1085 = 0.0;
    if (_1071)
    {
        _1085 = 1.0;
    }
    float _1087 = _1085;
    float _1089 = 0.0;
    float _1091 = _1087;
    if (_1071)
    {
        _1089 = 1.0;
    }
    float _1093 = _1089;
    float _1095 = _1093;
    if (_1071)
    {
        _1035 = 0;
    }
    int _1097 = _1035;
    float _1099 = _1065 * 2.0;
    int _1101 = _1097;
    if (_1071)
    {
        _1037 = 0;
    }
    int _1103 = _1037;
    float _1105 = floor(_1099);
    float _1107 = 0.0;
    float _1109 = _1083;
    int _1111 = _1103;
    float _1113 = _1081;
    if (_1071)
    {
        _1107 = _1081;
    }
    float _1115 = _1107;
    bool _1117 = _1105 > 0.0;
    bool _1119 = _1105 >= 0.0;
    bool _1121 = isnan(_1105);
    bool _1123 = _1119 || _1121;
    bool _1125 = isnan(0.0);
    bool _1127 = _1123 || _1125;
    float _1129 = _1105;
    float _1131 = _1115;
    if (_1071)
    {
        _1039 = _1115;
    }
    float _1133 = _1039;
    float _1135 = _1127 ? 0.0 : 1.4012984643248170709237295832899e-45;
    float _1137 = _1135;
    float _1139 = _1133;
    if (_1071)
    {
        _1129 = _1115;
    }
    float _1141 = _1129;
    int _1143 = ~as_type<int>(_1135);
    int _1145 = _1143 + 1;
    int _1147 = _1145 + 1;
    int _1149 = _1147;
    float _1151 = _1141;
    if (!_1117)
    {
        int _1153 = ~as_type<int>(_1135);
        int _1155 = _1153 + 1;
        _1149 = _1155;
    }
    int _1157 = _1149;
    if (_1071)
    {
        _1137 = _1083;
    }
    float _1159 = _1137;
    float _1161 = _1159;
    if (!_1071)
    {
        float _1163 = in.m_70.x;
        float _1165 = in.m_70.y;
        float _1167 = in.m_70.z;
        float _1169 = _1163 * 3.1415927410125732421875;
        float _1171 = _1169 * 0.15915493667125701904296875;
        float _1173 = _1165 * 3.1415927410125732421875;
        float _1175 = _1173 * 0.15915493667125701904296875;
        float _1177 = _1171 * 6.283185482025146484375;
        float _1179 = sin(_1177);
        float _1181 = _1175 * 6.283185482025146484375;
        float _1183 = sin(_1181);
        _1109 = _1165;
        _1101 = 1;
        _1111 = 2;
        _1113 = _1163;
        _1139 = _1179;
        _1161 = _1183;
        _1095 = 5.839270114898681640625;
        _1151 = _1167;
        _1091 = 7.345489978790283203125;
        _1131 = _1165;
    }
    float _1185 = _1109;
    int _1187 = _1101;
    int _1189 = _1111;
    float _1191 = _1113;
    float _1193 = _1139;
    float _1195 = _1161;
    float _1197 = _1095;
    float _1199 = _1151;
    float _1201 = _1091;
    float _1203 = _1131;
    float _1205 = _1185 * 2.0;
    bool _1207 = _1187 != 1;
    float _1209 = _1185 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _1211 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _1213 = floor(_1205);
    bool _1215 = _1189 != 2;
    float _1217 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _1219 = fma(_1209, -2.0, _1211);
    float _1221 = _1191 * 2.0;
    float _1223 = (*spvDescriptorSet0.vp_c9)._m0[93].z + (*spvDescriptorSet0.vp_c9)._m0[93].x;
    bool _1225 = _1065 > 0.5;
    float _1227 = floor(_1221);
    float _1229 = _1191 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    int _1231 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _1233 = _1231 != 0;
    int _1235 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16;
    bool _1237 = _1235 != 0;
    int _1239 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32;
    bool _1241 = _1239 != 0;
    float _1243 = _1193 * (*spvDescriptorSet0.vp_c9)._m0[92].x;
    bool _1245 = _1185 > 0.5;
    float _1247 = fma(_1193, (*spvDescriptorSet0.vp_c9)._m0[93].z, _1223);
    float _1249 = -_231;
    float _1251 = _1225 ? _1249 : _231;
    float _1253 = (*spvDescriptorSet0.vp_c9)._m0[92].x + (*spvDescriptorSet0.vp_c9)._m0[91].z;
    float _1255 = -_227;
    int _1257 = _1245 ? as_type<int>(_1255) : as_type<int>(_227);
    float _1259 = -_1217;
    float _1261 = fma(_1229, 2.0, _1259);
    bool _1263 = !_1241;
    float _1265 = _1263 ? _231 : _1251;
    float _1267 = -_1253;
    float _1269 = fma(_1243, 2.0, _1267);
    bool _1271 = !_1237;
    float _1273 = _1271 ? _227 : as_type<float>(_1257);
    float _1275 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _1277 = log2(_1275);
    bool _1279 = _1213 >= 0.0;
    bool _1281 = isnan(_1213);
    bool _1283 = _1279 || _1281;
    bool _1285 = isnan(0.0);
    bool _1287 = _1283 || _1285;
    float _1289 = _1195 * (*spvDescriptorSet0.vp_c9)._m0[92].y;
    bool _1291 = _1227 >= 0.0;
    bool _1293 = isnan(_1227);
    bool _1295 = _1291 || _1293;
    bool _1297 = isnan(0.0);
    bool _1299 = _1295 || _1297;
    float _1301 = _1185 + _1191;
    float _1303 = _177 * _137;
    float _1305 = _1243;
    float _1307 = _1223;
    float _1309 = _1195;
    float _1311 = _1251;
    if (!_1207)
    {
        _1041 = _1065;
    }
    float _1313 = _1041;
    float _1315 = _1301 + (-1.0);
    float _1317 = _1313;
    if (!_1207)
    {
        _1305 = _1065;
    }
    float _1319 = _1305;
    float _1321 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _1323 = int(_1321);
    float _1325 = _1319;
    if (!_1207)
    {
        _1307 = _1185;
    }
    float _1327 = _1307;
    float _1329 = fma(_137, (*spvDescriptorSet0.vp_c9)._m0[92].z, _1247);
    float _1331 = _1327;
    if (!_1207)
    {
        _1043 = _1185;
    }
    float _1333 = _1043;
    float _1335 = -_137;
    float _1337 = fma(_1335, (*spvDescriptorSet0.vp_c9)._m0[76].x, _1261);
    float _1339 = _1277 * _137;
    float _1341 = _1333;
    if (_1207)
    {
        _1317 = _1185;
    }
    float _1343 = _1317;
    float _1345 = -_137;
    float _1347 = fma(_1345, (*spvDescriptorSet0.vp_c9)._m0[91].x, _1269);
    if (_1207)
    {
        _1325 = _1185;
    }
    float _1349 = _1325;
    float _1351 = (*spvDescriptorSet0.vp_c9)._m0[92].y + (*spvDescriptorSet0.vp_c9)._m0[91].w;
    if (_1207)
    {
        _1331 = _1191;
    }
    float _1353 = _1331;
    float _1355 = _1343 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    if (_1207)
    {
        _1341 = _1191;
    }
    float _1357 = _1341;
    float _1359 = fma(_1289, -2.0, _1351);
    int _1361 = _1299 ? 0 : 1;
    float _1363 = exp2(_1339);
    int _1365 = _1287 ? 0 : 1;
    float _1367 = _517 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    int _1369 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _1371 = _1369 != 0;
    int _1373 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _1375 = _1373 != 0;
    int _1377 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _1379 = _1377 != 0;
    float _1381 = _519 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1383 = in.m_64.w;
    bool _1385 = !_1375;
    int _1387 = _1385 ? 0 : 1;
    float _1389 = (*spvDescriptorSet0.vp_c9)._m0[93].w + (*spvDescriptorSet0.vp_c9)._m0[93].y;
    bool _1391 = !_1371;
    int _1393 = _1391 ? 0 : 1;
    float _1395 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    bool _1397 = !_1379;
    int _1399 = _1397 ? 0 : 1;
    float _1401 = fma(_1195, (*spvDescriptorSet0.vp_c9)._m0[93].w, _1389);
    int _1403 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 4096;
    bool _1405 = _1403 != 0;
    int _1407 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 8192;
    bool _1409 = _1407 != 0;
    int _1411 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16384;
    bool _1413 = _1411 != 0;
    float _1415 = fma(_1357, (*spvDescriptorSet0.vp_c9)._m0[83].z, _1395);
    if (_1215)
    {
        _1309 = _1185;
    }
    float _1417 = _1309;
    float _1419 = -_1363;
    float _1421 = _1419 + 1.0;
    float _1423 = _1417;
    if (_1215)
    {
        _1311 = _1191;
    }
    float _1425 = _1311;
    float _1427 = fma(_137, (*spvDescriptorSet0.vp_c9)._m0[92].w, _1401);
    bool _1429 = !_1409;
    int _1431 = _1429 ? 0 : 1;
    bool _1433 = !_1405;
    int _1435 = _1433 ? 0 : 1;
    bool _1437 = !_1413;
    int _1439 = _1437 ? 0 : 1;
    float _1441 = _1425;
    if (!_1215)
    {
        _1441 = _1065;
    }
    float _1443 = _1441;
    if (!_1215)
    {
        _1423 = _1191;
    }
    float _1445 = _1423;
    int _1447 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _1449 = _1447 != 0;
    int _1451 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _1453 = _1451 != 0;
    int _1455 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _1457 = _1455 != 0;
    float _1459 = _1443 * (*spvDescriptorSet0.vp_c9)._m0[87].x;
    bool _1461 = _1227 > 0.0;
    float _1463 = _1353 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _1465 = _1445 * (*spvDescriptorSet0.vp_c9)._m0[87].y;
    float _1467 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    bool _1469 = !_1449;
    int _1471 = _1469 ? 0 : 1;
    float _1473 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _1475 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    bool _1477 = _1213 > 0.0;
    float _1479 = -_1467;
    float _1481 = fma(_1463, 2.0, _1479);
    float _1483 = fma(_1315, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _1485 = fma(_1349, (*spvDescriptorSet0.vp_c9)._m0[83].w, _1473);
    float _1487 = fma(_1355, -2.0, _1475);
    float _1489 = trunc((*spvDescriptorSet0.vp_c9)._m0[40].y);
    int _1491 = int(_1489);
    float _1493 = (*spvDescriptorSet0.vp_c9)._m0[87].x + (*spvDescriptorSet0.vp_c9)._m0[86].z;
    float _1495 = fma(_137, (*spvDescriptorSet0.vp_c9)._m0[76].y, _1219);
    int _1497 = abs(_1471);
    float _1499 = -_1493;
    float _1501 = fma(_1459, 2.0, _1499);
    float _1503 = float(_1323);
    float _1505 = (*spvDescriptorSet0.vp_c9)._m0[87].y + (*spvDescriptorSet0.vp_c9)._m0[86].w;
    float _1507 = trunc((*spvDescriptorSet0.vp_c9)._m0[49].y);
    int _1509 = int(_1507);
    int _1511 = ~_1361;
    int _1513 = _1511 + 1;
    int _1515 = _1513 + 1;
    float _1517 = fma(_1465, -2.0, _1505);
    int _1519 = _1515;
    if (!_1461)
    {
        int _1521 = ~_1361;
        int _1523 = _1521 + 1;
        _1519 = _1523;
    }
    int _1525 = _1519;
    float _1527 = in.m_80.x;
    float _1529 = in.m_80.y;
    float _1531 = in.m_80.z;
    bool _1533 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1535 = isnan(0.0);
    bool _1537 = _1533 || _1535;
    bool _1539 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1541 = _1537 || _1539;
    float _1543 = fma(_137, (*spvDescriptorSet0.vp_c9)._m0[91].y, _1359);
    float _1545 = float(_1491);
    float _1547 = 1.0 / _1503;
    float _1549 = -_137;
    float _1551 = fma(_1549, (*spvDescriptorSet0.vp_c9)._m0[81].x, _1481);
    float _1553 = _1541 ? _1421 : 0.0;
    float _1555 = float(_1509);
    float _1557 = 1.0 / _1545;
    float _1559 = float(_1157);
    float _1561 = float(_1497);
    bool _1563 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1565 = isnan(1.0);
    bool _1567 = _1563 || _1565;
    bool _1569 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1571 = _1567 || _1569;
    float _1573 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _1575 = 1.0 + _1573;
    int _1577 = ~_1365;
    int _1579 = _1577 + 1;
    int _1581 = _1579 + 1;
    float _1583 = 1.0 / _1555;
    int _1585 = _1581;
    if (!_1477)
    {
        int _1587 = ~_1365;
        int _1589 = _1587 + 1;
        _1585 = _1589;
    }
    int _1591 = _1585;
    float _1593 = _1561 * _1559;
    float _1595 = _1547 * _137;
    float _1597 = _1593 * (-2.0);
    float _1599 = 1.0 / _1575;
    float _1601 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    bool _1603 = !_1453;
    int _1605 = _1603 ? 0 : 1;
    float _1607 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _1609 = (*spvDescriptorSet0.vp_c9)._m0[88].z + (*spvDescriptorSet0.vp_c9)._m0[88].x;
    float _1611 = (*spvDescriptorSet0.vp_c9)._m0[88].w + (*spvDescriptorSet0.vp_c9)._m0[88].y;
    float _1613 = fma(_1597, _1527, _1527);
    float _1615 = _1557 * _137;
    float _1617 = fma(_137, (*spvDescriptorSet0.vp_c9)._m0[82].z, _1415);
    float _1619 = fma(_137, (*spvDescriptorSet0.vp_c9)._m0[81].y, _1487);
    int _1621 = abs(_1605);
    float _1623 = _1583 * _137;
    float _1625 = fma(_1185, (*spvDescriptorSet0.vp_c9)._m0[78].w, _1601);
    float _1627 = float(_1525);
    float _1629 = fma(_1191, (*spvDescriptorSet0.vp_c9)._m0[78].z, _1607);
    float _1631 = float(_1621);
    float _1633 = fma(_1191, (*spvDescriptorSet0.vp_c9)._m0[88].z, _1609);
    float _1635 = fma(_1185, (*spvDescriptorSet0.vp_c9)._m0[88].w, _1611);
    float _1637 = _1191 + (-0.5);
    float _1639 = fma(_137, (*spvDescriptorSet0.vp_c9)._m0[77].w, _1625);
    float _1641 = fma(_137, (*spvDescriptorSet0.vp_c9)._m0[82].w, _1485);
    float _1643 = fma(_137, (*spvDescriptorSet0.vp_c9)._m0[77].z, _1629);
    float _1645 = fma(_137, (*spvDescriptorSet0.vp_c9)._m0[87].z, _1633);
    float _1647 = fma(_137, (*spvDescriptorSet0.vp_c9)._m0[87].w, _1635);
    float _1649 = -_137;
    float _1651 = fma(_1649, (*spvDescriptorSet0.vp_c9)._m0[86].x, _1501);
    float _1653 = fma(_137, (*spvDescriptorSet0.vp_c9)._m0[86].y, _1517);
    bool _1655 = !_1457;
    int _1657 = _1655 ? 0 : 1;
    float _1659 = _1631 * _1627;
    if (_1571)
    {
        float _1661 = _1553 * _1599;
        _147 = _1661;
    }
    float _1663 = _147;
    float _1665 = fma(_1483, _1597, _1483);
    float _1667 = fma(_1637, (*spvDescriptorSet0.vp_c9)._m0[196].x, _1613);
    float _1669 = _1185 + _1065;
    int _1671 = abs(_1657);
    float _1673 = in.m_68.w;
    float _1675 = fma(_1665, _1663, _1667);
    float _1677 = _1669 + (-1.0);
    float _1679 = _1659 * (-2.0);
    float _1681 = float(_1591);
    float _1683 = _1675 * 0.15915493667125701904296875;
    float _1685 = float(_1671);
    float _1687 = fma(_1677, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _1689 = _1185 + (-0.5);
    float _1691 = fma(_1679, _1529, _1529);
    float _1693 = _1191 + _1065;
    float _1695 = _1685 * _1681;
    float _1697 = fma(_1687, _1679, _1687);
    float _1699 = fma(_1689, (*spvDescriptorSet0.vp_c9)._m0[196].y, _1691);
    float _1701 = _1693 + (-1.0);
    float _1703 = _1695 * (-2.0);
    float _1705 = fma(_1697, _1663, _1699);
    float _1707 = _1065 + (-0.5);
    float _1709 = fma(_1701, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _1711 = fma(_1703, _1531, _1531);
    float _1713 = _1705 * 0.15915493667125701904296875;
    float _1715 = _1683 * 6.283185482025146484375;
    float _1717 = cos(_1715);
    float _1719 = in.m_50.x;
    float _1721 = in.m_50.y;
    float _1723 = in.m_50.z;
    float _1725 = fma(_1709, _1703, _1709);
    float _1727 = fma(_1707, (*spvDescriptorSet0.vp_c9)._m0[196].z, _1711);
    float _1729 = fma(_1725, _1663, _1727);
    float _1731 = _1713 * 6.283185482025146484375;
    float _1733 = sin(_1731);
    float _1735 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _227);
    float _1737 = _1729 * 0.15915493667125701904296875;
    float _1739 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _231);
    float _1741 = _1713 * 6.283185482025146484375;
    float _1743 = cos(_1741);
    float _1745 = _1367 * _1739;
    float _1747 = _1683 * 6.283185482025146484375;
    float _1749 = sin(_1747);
    float _1751 = _199 * _1721;
    float _1753 = _1717 * _1733;
    float _1755 = _211 * _1721;
    float _1757 = _205 * _1721;
    float _1759 = fma(_197, _1719, _1751);
    float _1761 = fma(_209, _1719, _1755);
    float _1763 = _1737 * 6.283185482025146484375;
    float _1765 = cos(_1763);
    float _1767 = _1717 * _1743;
    float _1769 = _1381 * _1735;
    float _1771 = fma(_201, _1723, _1759);
    float _1773 = fma(_213, _1723, _1761);
    float _1775 = fma(_203, _1719, _1757);
    float _1777 = _1771 + _1383;
    float _1779 = _1737 * 6.283185482025146484375;
    float _1781 = sin(_1779);
    float _1783 = _1749 * _1733;
    float _1785 = _1749 * _1743;
    float _1787 = _1773 + _1673;
    float _1789 = fma(_207, _1723, _1775);
    float _1791 = _1717 * _1765;
    float _1793 = _1749 * _1765;
    float _1795 = _1743 * _1765;
    float _1797 = _1733 * _1765;
    float _1799 = _1791 * _1745;
    float _1801 = 0.5 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _1803 = fma(_1781, _1767, _1783);
    float _1805 = -_1753;
    float _1807 = fma(_1781, _1785, _1805);
    float _1809 = -_1785;
    float _1811 = fma(_1781, _1753, _1809);
    float _1813 = -_1745;
    float _1815 = _1781 * _1813;
    float _1817 = fma(_1803, _1769, _1799);
    float _1819 = _1793 * _1745;
    float _1821 = fma(_1781, _1783, _1767);
    float _1823 = fma(_1795, _1769, _1815);
    float _1825 = fma(_1811, _1801, _1817);
    float _1827 = fma(_1807, _1769, _1819);
    float _1829 = fma(_1797, _1801, _1823);
    float _1831 = _1825 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1833 = _1825 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1835 = fma(_1821, _1801, _1827);
    float _1837 = _1825 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1839 = fma(_1829, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1831);
    float _1841 = fma(_1829, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1833);
    float _1843 = fma(_1829, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1837);
    float _1845 = fma(_1835, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1839);
    float _1847 = fma(_1835, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1841);
    float _1849 = fma(_1835, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1843);
    float _1851 = _1845 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _1853 = _1847 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _1855 = in.m_66.w;
    float _1857 = _1777 + _1851;
    float _1859 = _1787 + _1853;
    float _1861 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1863 = _1857 + _1861;
    float _1865 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1867 = _1859 + _1865;
    float _1869 = _1863 * _1863;
    float _1871 = _1867 * _1867;
    float _1873 = _1869 + _1871;
    float _1875 = sqrt(_1873);
    float _1877 = _1789 + _1855;
    bool _1879 = _1875 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1881 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1883 = _1875 + _1881;
    float _1885 = _201;
    float _1887 = _1829;
    float _1889 = _1857;
    float _1891 = _1789;
    float _1893 = _1883;
    float _1895 = _1721;
    float _1897 = _1869;
    float _1899 = _1871;
    if (_1879)
    {
        float _1901 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1885 = _1901;
    }
    float _1903 = _1885;
    if (!_1879)
    {
        _1887 = _1857;
    }
    float _1905 = _1887;
    float _1907 = _1905;
    if (!_1879)
    {
        _1889 = _1859;
    }
    float _1909 = _1889;
    float _1911 = _1909;
    if (_1879)
    {
        float _1913 = rsqrt(_1873);
        _1891 = _1913;
    }
    float _1915 = _1891;
    if (_1879)
    {
        float _1917 = _1883 * _1903;
        _1893 = _1917;
    }
    float _1919 = _1893;
    if (_1879)
    {
        float _1921 = _1919 * 0.15915493667125701904296875;
        _1895 = _1921;
    }
    float _1923 = _1895;
    float _1925 = _1849 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _1927 = _203;
    float _1929 = _1925;
    float _1931 = _1923;
    if (_1879)
    {
        float _1933 = _1923 * 6.283185482025146484375;
        float _1935 = sin(_1933);
        _1927 = _1935;
    }
    float _1937 = _1927;
    float _1939 = _1877 + _1925;
    float _1941 = _1939;
    if (_1879)
    {
        float _1943 = _1939 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1929 = _1943;
    }
    float _1945 = _1929;
    float _1947 = _1937;
    if (_1879)
    {
        float _1949 = fma(_1937, _1945, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1947 = _1949;
    }
    float _1951 = _1947;
    float _1953 = _1951;
    if (_1879)
    {
        float _1955 = _1915 * _1951;
        _1953 = _1955;
    }
    float _1957 = _1953;
    if (_1879)
    {
        float _1959 = fma(_1863, _1957, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        _1907 = _1959;
    }
    float _1961 = _1907;
    if (_1879)
    {
        float _1963 = fma(_1867, _1957, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1911 = _1963;
    }
    float _1965 = _1911;
    float _1967 = fma(_1961, 6.2500002968590706586837768554688e-05, 0.5);
    float _1969 = fma(_1965, 6.2500002968590706586837768554688e-05, 0.5);
    float2 _8371 = float2(_1967, _1969);
    float3 _1973 = dm_bs(spvDescriptorSet0.vp_t_tcb_20.sample(spvDescriptorSet0.vp_t_tcb_20Smplr, select(_8371, float2(0.0), isnan(_8371)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_20, spvDescriptorSet0.vp_t_tcb_20Smplr_w, select(_8371, float2(0.0), isnan(_8371)), level(0.0)).xyz;
    float _1975 = _1973.x;
    float _1977 = _1973.y;
    float _1979 = _1973.z;
    float _1981 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _1983 = int(_1981);
    int _1985 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 64;
    bool _1987 = _1985 != 0;
    float _1989 = _1197 * _1199;
    float _1991 = _1201 * _1203;
    int _1993 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _1995 = _1993 != 0;
    float _1997 = -_1427;
    float _1999 = _1997 + 1.0;
    int _2001 = abs(_1393);
    float _2003 = -_1643;
    float _2005 = _2003 + 1.0;
    float _2007 = trunc((*spvDescriptorSet0.vp_c9)._m0[40].x);
    int _2009 = int(_2007);
    int _2011 = abs(_1439);
    float _2013 = -_1617;
    float _2015 = _2013 + 1.0;
    float _2017 = -_1641;
    float _2019 = _2017 + 1.0;
    bool _2021 = _1063 >= (*spvDescriptorSet0.vp_c9)._m0[170].w;
    bool _2023 = isnan(_1063);
    bool _2025 = _2021 || _2023;
    bool _2027 = isnan((*spvDescriptorSet0.vp_c9)._m0[170].w);
    bool _2029 = _2025 || _2027;
    float _2031 = float(_2029);
    float _2033 = _1945;
    bool _2035 = _1995;
    if (_1987)
    {
        float _2037 = in.m_70.w;
        _2033 = _2037;
    }
    float _2039 = _2033;
    float _2041 = trunc((*spvDescriptorSet0.vp_c9)._m0[49].x);
    int _2043 = int(_2041);
    float _2045 = float(uint(_1983));
    float _2047 = -_2031;
    float _2049 = _2047 + 1.0;
    int _2051 = ~_1983;
    int _2053 = _2051 + 1;
    float _2055 = -(*spvDescriptorSet0.vp_c9)._m0[172].w;
    float _2057 = _2055 + (*spvDescriptorSet0.vp_c9)._m0[173].w;
    int _2059 = ~_1983;
    int _2061 = _2059 + 1;
    float _2063 = -_1645;
    float _2065 = _2063 + 1.0;
    float _2067 = 1.0 / _2045;
    float _2069 = float(uint(_2009));
    float _2071 = -_1647;
    float _2073 = _2071 + 1.0;
    bool _2075 = _1063 >= (*spvDescriptorSet0.vp_c9)._m0[169].w;
    bool _2077 = isnan(_1063);
    bool _2079 = _2075 || _2077;
    bool _2081 = isnan((*spvDescriptorSet0.vp_c9)._m0[169].w);
    bool _2083 = _2079 || _2081;
    float _2085 = float(_2083);
    float _2087 = trunc(_1595);
    int _2089 = int(_2087);
    float _2091 = float(uint(_2043));
    float _2093 = _2085 * _2049;
    int _2095 = ~_2043;
    int _2097 = _2095 + 1;
    float _2099 = -_2085;
    float _2101 = _2099 + 1.0;
    bool _2103 = _1063 >= (*spvDescriptorSet0.vp_c9)._m0[167].w;
    bool _2105 = isnan(_1063);
    bool _2107 = _2103 || _2105;
    bool _2109 = isnan((*spvDescriptorSet0.vp_c9)._m0[167].w);
    bool _2111 = _2107 || _2109;
    float _2113 = float(_2111);
    float _2115 = _2039;
    if (_1987)
    {
        float _2117 = _2039 * 3.1415927410125732421875;
        _2115 = _2117;
    }
    float _2119 = _2115;
    float _2121 = 1.0 / _2069;
    int _2123 = as_type<int>(_2067) + (-2);
    float _2125 = _2119;
    if (_1987)
    {
        float _2127 = _2119 * 0.15915493667125701904296875;
        _2125 = _2127;
    }
    float _2129 = _2125;
    float _2131 = trunc(_1615);
    int _2133 = int(_2131);
    float _2135 = float(uint(_2089));
    float _2137 = float(_1983);
    float _2139 = float(_2089);
    float _2141 = as_type<float>(_2123) * _2135;
    float _2143 = 1.0 / _2091;
    int _2145 = as_type<int>(_2121) + (-2);
    bool _2147 = _2139 >= _2137;
    bool _2149 = isnan(_2139);
    bool _2151 = _2147 || _2149;
    bool _2153 = isnan(_2137);
    bool _2155 = _2151 || _2153;
    float _2157 = float(_2155);
    float _2159 = trunc(_2141);
    float _2161 = precise::max(_2159, 0.0);
    uint _2164 = uint(_2161);
    float _2166 = float(uint(_2133));
    float _2168 = trunc(_1623);
    int _2170 = int(_2168);
    int _2172 = as_type<int>(_2143) + (-2);
    float _2174 = as_type<float>(_2145) * _2166;
    float _2176 = _1201 * _1191;
    int _2178 = _2053 * int(_2164);
    int _2180 = _2178 + _2089;
    float _2182 = trunc(_2174);
    float _2184 = precise::max(_2182, 0.0);
    uint _2186 = uint(_2184);
    float _2188 = float(uint(_2180));
    float _2190 = float(uint(_2170));
    float _2192 = floor(_2176);
    float _2194 = as_type<float>(_2172) * _2190;
    float _2196 = as_type<float>(_2123) * _2188;
    int _2198 = ~_2009;
    int _2200 = _2198 + 1;
    float _2202 = _2129;
    if (_1987)
    {
        float _2204 = _2129 * 6.283185482025146484375;
        float _2206 = sin(_2204);
        _2202 = _2206;
    }
    float _2208 = _2202;
    int _2210 = _2200 * int(_2186);
    int _2212 = _2210 + _2133;
    float _2214 = trunc(_2196);
    float _2216 = precise::max(_2214, 0.0);
    uint _2218 = uint(_2216);
    float _2220 = -_2192;
    float _2222 = _2176 + _2220;
    float _2224 = float(uint(_2212));
    float _2226 = trunc(_2194);
    float _2228 = precise::max(_2226, 0.0);
    uint _2230 = uint(_2228);
    int _2232 = int(_2164) + int(_2218);
    float _2234 = as_type<float>(_2145) * _2224;
    float _2236 = floor(_1989);
    int _2238 = _2061 * _2232;
    int _2240 = _2238 + _2089;
    int _2242 = _2097 * int(_2230);
    int _2244 = _2242 + _2170;
    float _2246 = _2222 * _2137;
    bool _2248 = uint(_2240) >= uint(_1983);
    float _2250 = floor(_1991);
    bool _2252 = !_1995;
    int _2254 = _2252 ? 0 : 1;
    float _2256 = _2137 * _1303;
    float _2258 = float(uint(_2244));
    bool _2260 = !_2248;
    int _2262 = _2260 ? 0 : (-1);
    int _2264 = abs(_2254);
    float _2266 = trunc(_2234);
    float _2268 = precise::max(_2266, 0.0);
    uint _2270 = uint(_2268);
    float _2272 = as_type<float>(_2172) * _2258;
    int _2274 = ~_2232;
    int _2276 = _2274 + _2262;
    int _2278 = _2276 + 1;
    float _2280 = -_2236;
    float _2282 = _1989 + _2280;
    float _2284 = _2208;
    if (_1987)
    {
        bool _2286 = _2208 > 0.5;
        _2035 = _2286;
    }
    bool _2288 = _2035;
    bool _2290 = _1067 > 0.5;
    float _2292 = trunc(_2157);
    int _2294 = int(_2292);
    float _2296 = -_2250;
    float _2298 = _1991 + _2296;
    int _2300 = ~_2009;
    int _2302 = _2300 + 1;
    int _2304 = _1983 * _2278;
    int _2306 = _2304 + _2089;
    if (!_1987)
    {
        _2284 = _227;
    }
    float _2308 = _2284;
    float _2310 = trunc(_2246);
    int _2312 = int(_2310);
    int _2314 = int(_2186) + int(_2270);
    float _2316 = _2308;
    if (_1987)
    {
        float _2318 = -_227;
        float _2320 = _2288 ? _2318 : _227;
        _2316 = _2320;
    }
    float _2322 = _2316;
    bool _2324 = _1983 == 0;
    int _2326 = _2302 * _2314;
    int _2328 = _2326 + _2133;
    int _2330 = ~_2043;
    int _2332 = _2330 + 1;
    float _2334 = trunc(_2272);
    float _2336 = precise::max(_2334, 0.0);
    uint _2338 = uint(_2336);
    int _2340 = ~_2294;
    int _2342 = _2340 + 1;
    int _2344 = _2342 + 1;
    bool _2346 = !_2324;
    int _2348 = _2346 ? _2306 : (-1);
    bool _2350 = uint(_2328) >= uint(_2009);
    float _2352 = -_231;
    int _2354 = _1245 ? as_type<int>(_2352) : as_type<int>(_231);
    float _2356 = trunc(_2256);
    int _2358 = int(_2356);
    int _2360 = _2312 * _2264;
    int _2362 = _2360 + _2089;
    float _2364 = -(*spvDescriptorSet0.vp_c9)._m0[169].x;
    float _2366 = (*spvDescriptorSet0.vp_c9)._m0[170].x + _2364;
    int _2368 = _2348 * _2344;
    int _2370 = _1983 + (-1);
    float _2372 = -(*spvDescriptorSet0.vp_c9)._m0[170].x;
    float _2374 = _2372 + (*spvDescriptorSet0.vp_c9)._m0[171].x;
    int _2376 = int(_2230) + int(_2338);
    int _2378 = _2294 * _2370;
    int _2380 = _2378 + _2368;
    float _2382 = 1.0 / _2057;
    int _2384 = abs(_1387);
    bool _2386 = !_2350;
    int _2388 = _2386 ? 0 : (-1);
    int _2390 = _2332 * _2376;
    int _2392 = _2390 + _2170;
    float _2394 = float(_2009);
    int _2396 = _2380 * _2384;
    int _2398 = ~_2314;
    int _2400 = _2398 + _2388;
    int _2402 = _2400 + 1;
    float _2404 = _2282 * _2394;
    float _2406 = float(_2133);
    float _2408 = -(*spvDescriptorSet0.vp_c9)._m0[172].x;
    float _2410 = _2408 + (*spvDescriptorSet0.vp_c9)._m0[173].x;
    int _2412 = abs(_1399);
    int _2414 = _2358 * _2001;
    int _2416 = _2414 + _2396;
    bool _2418 = _2406 >= _2394;
    bool _2420 = isnan(_2406);
    bool _2422 = _2418 || _2420;
    bool _2424 = isnan(_2394);
    bool _2426 = _2422 || _2424;
    float _2428 = float(_2426);
    float _2430 = trunc(_2404);
    int _2432 = int(_2430);
    float _2434 = -_231;
    int _2436 = _2290 ? as_type<int>(_2434) : as_type<int>(_231);
    int _2438 = _2362 * _2412;
    int _2440 = _2438 + _2416;
    int _2442 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _2444 = _2442 != 0;
    float _2446 = _2394 * _1303;
    bool _2448 = uint(_2392) >= uint(_2043);
    int _2450 = _2009 * _2402;
    int _2452 = _2450 + _2133;
    bool _2454 = !_2444;
    int _2456 = _2454 ? 0 : 1;
    float _2458 = trunc(_2428);
    int _2460 = int(_2458);
    int _2462 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32768;
    bool _2464 = _2462 != 0;
    float _2466 = -_227;
    int _2468 = _1225 ? as_type<int>(_2466) : as_type<int>(_227);
    bool _2470 = !_2464;
    int _2472 = _2470 ? 0 : 1;
    bool _2474 = _2009 == 0;
    float _2476 = trunc(_2446);
    int _2478 = int(_2476);
    int _2480 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16384;
    bool _2482 = _2480 != 0;
    int _2484 = abs(_2456);
    bool _2486 = !_2474;
    int _2488 = _2486 ? _2452 : (-1);
    bool _2490 = !_2482;
    int _2492 = _2490 ? 0 : 1;
    int _2494 = _2312 * _2484;
    int _2496 = _2494 + _2440;
    int _2498 = ~_2460;
    int _2500 = _2498 + 1;
    int _2502 = _2500 + 1;
    int _2504 = _2009 + (-1);
    int _2506 = abs(_2492);
    int _2508 = _2488 * _2502;
    int _2510 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32768;
    bool _2512 = _2510 != 0;
    bool _2514 = !_1233;
    float _2516 = _2514 ? _231 : as_type<float>(_2436);
    int _2518 = _2460 * _2504;
    int _2520 = _2518 + _2508;
    bool _2522 = !_2512;
    int _2524 = _2522 ? 0 : 1;
    bool _2526 = !_2448;
    int _2528 = _2526 ? 0 : (-1);
    int _2530 = _2432 * _2506;
    int _2532 = _2530 + _2133;
    int _2534 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 65536;
    bool _2536 = _2534 != 0;
    int _2538 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 131072;
    bool _2540 = _2538 != 0;
    int _2542 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 262144;
    bool _2544 = _2542 != 0;
    int _2546 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 524288;
    bool _2548 = _2546 != 0;
    float _2550 = float(uint(_2496));
    int _2552 = abs(_1431);
    int _2554 = abs(_1435);
    float _2556 = as_type<float>(_2123) * _2550;
    float _2558 = float(_2043);
    int _2560 = _2520 * _2552;
    float _2562 = trunc(_2556);
    float _2564 = precise::max(_2562, 0.0);
    uint _2566 = uint(_2564);
    float _2568 = float(_2170);
    float _2570 = _2298 * _2558;
    bool _2572 = !_2540;
    int _2574 = _2572 ? 0 : 1;
    int _2576 = _2478 * _2554;
    int _2578 = _2576 + _2560;
    int _2580 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 128;
    bool _2582 = _2580 != 0;
    float _2584 = _2558 * _1303;
    bool _2586 = _2568 >= _2558;
    bool _2588 = isnan(_2568);
    bool _2590 = _2586 || _2588;
    bool _2592 = isnan(_2558);
    bool _2594 = _2590 || _2592;
    float _2596 = float(_2594);
    float _2598 = trunc(_2596);
    int _2600 = int(_2598);
    int _2602 = ~_1983;
    int _2604 = _2602 + 1;
    int _2606 = _2532 * _2011;
    int _2608 = _2606 + _2578;
    float _2610 = float(uint(_2362));
    float _2612 = as_type<float>(_2484);
    if (_2582)
    {
        float _2614 = in.m_70.x;
        _2612 = _2614;
    }
    float _2616 = _2612;
    int _2618 = ~_2376;
    int _2620 = _2618 + _2528;
    int _2622 = _2620 + 1;
    float _2624 = trunc(_2570);
    int _2626 = int(_2624);
    int _2628 = abs(_2472);
    int _2630 = _2604 * int(_2566);
    int _2632 = _2630 + _2496;
    float _2634 = as_type<float>(_2123) * _2610;
    int _2636 = abs(_2524);
    int _2638 = _2432 * _2628;
    int _2640 = _2638 + _2608;
    bool _2642 = !_2536;
    int _2644 = _2642 ? 0 : 1;
    float _2646 = trunc(_2584);
    int _2648 = int(_2646);
    int _2650 = _2043 * _2622;
    int _2652 = _2650 + _2170;
    float _2654 = float(uint(_2632));
    float _2656 = float(uint(_2640));
    bool _2658 = _2043 == 0;
    float _2660 = as_type<float>(_2123) * _2654;
    float _2662 = trunc(_2634);
    float _2664 = precise::max(_2662, 0.0);
    uint _2666 = uint(_2664);
    float _2668 = as_type<float>(_2145) * _2656;
    int _2670 = ~_2600;
    int _2672 = _2670 + 1;
    int _2674 = _2672 + 1;
    int _2676 = _2626 * _2636;
    int _2678 = _2676 + _2170;
    bool _2680 = !_2658;
    int _2682 = _2680 ? _2652 : (-1);
    int _2684 = _2043 + (-1);
    float _2686 = trunc(_2668);
    float _2688 = precise::max(_2686, 0.0);
    uint _2690 = uint(_2688);
    int _2692 = _2682 * _2674;
    int _2694 = ~_1983;
    int _2696 = _2694 + 1;
    int _2698 = abs(_2574);
    int _2700 = _2600 * _2684;
    int _2702 = _2700 + _2692;
    float _2704 = as_type<float>(_2692);
    if (_2582)
    {
        float _2706 = _2616 * 3.1415927410125732421875;
        _2704 = _2706;
    }
    float _2708 = _2704;
    float _2710 = trunc(_2660);
    float _2712 = precise::max(_2710, 0.0);
    uint _2714 = uint(_2712);
    int _2716 = abs(_2644);
    int _2718 = _2702 * _2698;
    float _2720 = _2708;
    if (_2582)
    {
        float _2722 = _2708 * 0.15915493667125701904296875;
        _2720 = _2722;
    }
    float _2724 = _2720;
    int _2726 = _2696 * int(_2666);
    int _2728 = _2726 + _2362;
    int _2730 = ~_1983;
    int _2732 = _2730 + 1;
    int _2734 = ~_2009;
    int _2736 = _2734 + 1;
    float _2738 = _2724;
    if (_2582)
    {
        float _2740 = _2724 * 6.283185482025146484375;
        float _2742 = sin(_2740);
        _2738 = _2742;
    }
    float _2744 = _2738;
    float _2746 = float(uint(_2728));
    int _2748 = ~_2043;
    int _2750 = _2748 + 1;
    int _2752 = _2736 * int(_2690);
    int _2754 = _2752 + _2640;
    float _2756 = as_type<float>(_2123) * _2746;
    int _2758 = int(_2566) + int(_2714);
    float _2760 = float(uint(_2754));
    int _2762 = _2648 * _2716;
    int _2764 = _2762 + _2718;
    bool _2766 = !_2544;
    int _2768 = _2766 ? 0 : 1;
    int _2770 = _2732 * _2758;
    int _2772 = _2770 + _2496;
    bool _2774 = !_2548;
    int _2776 = _2774 ? 0 : 1;
    float _2778 = as_type<float>(_2145) * _2760;
    int _2780 = abs(_2768);
    float _2782 = trunc(_2756);
    float _2784 = precise::max(_2782, 0.0);
    uint _2786 = uint(_2784);
    int _2788 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _2790 = _2788 != 0;
    bool _2792 = uint(_2772) >= uint(_1983);
    bool _2794 = !_2790;
    float _2796 = _2794 ? _227 : as_type<float>(_2468);
    float _2798 = trunc(_2778);
    float _2800 = precise::max(_2798, 0.0);
    uint _2802 = uint(_2800);
    int _2804 = abs(_2776);
    bool _2806 = !_2792;
    int _2808 = _2806 ? 0 : (-1);
    int _2810 = 2 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y);
    bool _2812 = _2810 != 0;
    int _2814 = _2678 * _2780;
    int _2816 = _2814 + _2764;
    bool _2818 = _2792;
    if (_2582)
    {
        bool _2820 = _2744 > 0.5;
        _2818 = _2820;
    }
    bool _2822 = _2818;
    float _2824 = float(uint(_2532));
    int _2826 = _2626 * _2804;
    int _2828 = _2826 + _2816;
    int _2830 = ~_2758;
    int _2832 = _2830 + _2808;
    int _2834 = _2832 + 1;
    int _2836 = ~_2009;
    int _2838 = _2836 + 1;
    float _2840 = as_type<float>(_2145) * _2824;
    int _2842 = int(_2690) + int(_2802);
    int _2844 = _1983 * _2834;
    int _2846 = _2844 + _2496;
    float _2848 = as_type<float>(_2802);
    if (!_2582)
    {
        _2848 = _231;
    }
    float _2850 = _2848;
    float _2852 = _2850;
    if (_2582)
    {
        float _2854 = -_231;
        float _2856 = _2822 ? _2854 : _231;
        _2852 = _2856;
    }
    float _2858 = _2852;
    float _2860 = trunc(_2840);
    float _2862 = precise::max(_2860, 0.0);
    uint _2864 = uint(_2862);
    bool _2866 = !_2324;
    int _2868 = _2866 ? _2846 : (-1);
    int _2870 = _2838 * _2842;
    int _2872 = _2870 + _2640;
    float _2874 = float(uint(_2678));
    int _2876 = _2868 & 3;
    bool _2878 = _2876 != 0;
    bool _2880 = !_2812;
    float _2882 = _2880 ? _231 : as_type<float>(_2354);
    float _2884 = as_type<float>(_2172) * _2874;
    bool _2886 = uint(_2876) > 1u;
    int _2888 = ~_2009;
    int _2890 = _2888 + 1;
    float _2892 = trunc(_2884);
    float _2894 = precise::max(_2892, 0.0);
    uint _2896 = uint(_2894);
    int _2898 = _2868 & 3;
    bool _2900 = _2898 != 0;
    float _2902 = float(uint(_2828));
    int _2904 = _2890 * int(_2864);
    int _2906 = _2904 + _2532;
    int _2908 = _2900 ? 0 : 1;
    bool _2910 = uint(_2872) >= uint(_2009);
    float _2912 = as_type<float>(_2172) * _2902;
    int _2914 = int(_2666) + int(_2786);
    int _2916 = ~_2908;
    int _2918 = _2916 + 1;
    int _2920 = _2918 + 1;
    float _2922 = trunc(_2912);
    float _2924 = precise::max(_2922, 0.0);
    uint _2926 = uint(_2924);
    int _2928 = ~_1983;
    int _2930 = _2928 + 1;
    int _2932 = _2920;
    if (!_2886)
    {
        int _2934 = ~_2908;
        int _2936 = _2934 + 1;
        _2932 = _2936;
    }
    int _2938 = _2932;
    float _2940 = float(uint(_2906));
    int _2942 = _2930 * _2914;
    int _2944 = _2942 + _2362;
    int _2946 = ~_2043;
    int _2948 = _2946 + 1;
    bool _2950 = !_2910;
    int _2952 = _2950 ? 0 : (-1);
    float _2954 = as_type<float>(_2145) * _2940;
    bool _2956 = uint(_2876) >= 2u;
    int _2958 = _2948 * int(_2896);
    int _2960 = _2958 + _2678;
    int _2962 = ~_2842;
    int _2964 = _2962 + _2952;
    int _2966 = _2964 + 1;
    bool _2968 = _2876 != 3;
    int _2970 = _2956 ? 0 : 1;
    int _2972 = _2009 * _2966;
    int _2974 = _2972 + _2640;
    bool _2976 = uint(_2944) >= uint(_1983);
    float _2978 = float(uint(_2960));
    int _2980 = ~_2043;
    int _2982 = _2980 + 1;
    float _2984 = trunc(_2954);
    float _2986 = precise::max(_2984, 0.0);
    uint _2988 = uint(_2986);
    bool _2990 = !_2474;
    int _2992 = _2990 ? _2974 : (-1);
    float _2994 = as_type<float>(_2172) * _2978;
    int _2996 = ~_2970;
    int _2998 = _2996 + 1;
    int _3000 = _2998 + 1;
    int _3002 = _2982 * int(_2926);
    int _3004 = _3002 + _2828;
    bool _3006 = !_2976;
    int _3008 = _3006 ? 0 : (-1);
    int _3010 = _3000;
    if (_2968)
    {
        int _3012 = ~_2970;
        int _3014 = _3012 + 1;
        _3010 = _3014;
    }
    int _3016 = _3010;
    float _3018 = trunc(_2994);
    float _3020 = precise::max(_3018, 0.0);
    uint _3022 = uint(_3020);
    int _3024 = _2992 & 3;
    bool _3026 = _3024 != 0;
    int _3028 = _2992 & 3;
    bool _3030 = _3028 != 0;
    float _3032 = float(uint(_3004));
    int _3034 = _3026 ? 0 : 1;
    bool _3036 = uint(_3028) > 1u;
    float _3038 = as_type<float>(_2172) * _3032;
    int _3040 = int(_2864) + int(_2988);
    int _3042 = ~_3034;
    int _3044 = _3042 + 1;
    int _3046 = _3044 + 1;
    float _3048 = trunc(_3038);
    float _3050 = precise::max(_3048, 0.0);
    uint _3052 = uint(_3050);
    bool _3054 = !_3030;
    int _3056 = _3054 ? 0 : 1;
    bool _3058 = uint(_3028) >= 2u;
    int _3060 = ~_2009;
    int _3062 = _3060 + 1;
    int _3064 = _3058 ? 0 : 1;
    int _3066 = _3046;
    if (!_3036)
    {
        int _3068 = ~_3034;
        int _3070 = _3068 + 1;
        _3066 = _3070;
    }
    int _3072 = _3066;
    bool _3074 = _3028 != 3;
    bool _3076 = _3028 != 3;
    int _3078 = _3062 * _3040;
    int _3080 = _3078 + _2532;
    int _3082 = int(_2896) + int(_3022);
    int _3084 = int(_2926) + int(_3052);
    int _3086 = ~_2043;
    int _3088 = _3086 + 1;
    int _3090 = _2750 * _3082;
    int _3092 = _3090 + _2678;
    bool _3094 = !_3076;
    int _3096 = _3094 ? 0 : (-1);
    bool _3098 = uint(_3080) >= uint(_2009);
    float _3100 = -(*spvDescriptorSet0.vp_c9)._m0[167].w;
    float _3102 = _3100 + (*spvDescriptorSet0.vp_c9)._m0[168].w;
    int _3104 = ~_3064;
    int _3106 = _3104 + 1;
    int _3108 = _3106 + 1;
    int _3110 = _3108;
    if (_3074)
    {
        int _3112 = ~_3064;
        int _3114 = _3112 + 1;
        _3110 = _3114;
    }
    int _3116 = _3110;
    int _3118 = _3088 * _3084;
    int _3120 = _3118 + _2828;
    float _3122 = 1.0 / _3102;
    float _3124 = -(*spvDescriptorSet0.vp_c9)._m0[168].w;
    float _3126 = _3124 + (*spvDescriptorSet0.vp_c9)._m0[169].w;
    bool _3128 = !_3098;
    int _3130 = _3128 ? 0 : (-1);
    int _3132 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8388608;
    bool _3134 = _3132 != 0;
    float _3136 = -(*spvDescriptorSet0.vp_c9)._m0[170].w;
    float _3138 = _3136 + (*spvDescriptorSet0.vp_c9)._m0[171].w;
    bool _3140 = uint(_3120) >= uint(_2043);
    float _3142 = -(*spvDescriptorSet0.vp_c9)._m0[169].w;
    float _3144 = _3142 + (*spvDescriptorSet0.vp_c9)._m0[170].w;
    float _3146 = 1.0 / _3126;
    bool _3148 = !_3134;
    int _3150 = _3148 ? 0 : 1;
    bool _3152 = !_3140;
    int _3154 = _3152 ? 0 : (-1);
    bool _3156 = _1191 > 0.5;
    bool _3158 = uint(_3092) >= uint(_2043);
    float _3160 = 1.0 / _3138;
    bool _3162 = !_3158;
    int _3164 = _3162 ? 0 : (-1);
    int _3166 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y);
    bool _3168 = _3166 != 0;
    float _3170 = 1.0 / _3144;
    float _3172 = -_227;
    int _3174 = _3156 ? as_type<int>(_3172) : as_type<int>(_227);
    int _3176 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _3178 = _3176 != 0;
    bool _3180 = !_3168;
    float _3182 = _3180 ? _227 : as_type<float>(_3174);
    int _3184 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16777216;
    bool _3186 = _3184 != 0;
    float _3188 = _2374 * _3160;
    float _3190 = -(*spvDescriptorSet0.vp_c9)._m0[167].x;
    float _3192 = (*spvDescriptorSet0.vp_c9)._m0[168].x + _3190;
    float _3194 = -(*spvDescriptorSet0.vp_c9)._m0[168].x;
    float _3196 = _3194 + (*spvDescriptorSet0.vp_c9)._m0[169].x;
    bool _3198 = _1063 >= (*spvDescriptorSet0.vp_c9)._m0[174].w;
    bool _3200 = isnan(_1063);
    bool _3202 = _3198 || _3200;
    bool _3204 = isnan((*spvDescriptorSet0.vp_c9)._m0[174].w);
    bool _3206 = _3202 || _3204;
    float _3208 = float(_3206);
    float _3210 = _3192 * _3122;
    float _3212 = _3196 * _3146;
    bool _3214 = _1063 >= (*spvDescriptorSet0.vp_c9)._m0[173].w;
    bool _3216 = isnan(_1063);
    bool _3218 = _3214 || _3216;
    bool _3220 = isnan((*spvDescriptorSet0.vp_c9)._m0[173].w);
    bool _3222 = _3218 || _3220;
    float _3224 = float(_3222);
    float _3226 = -_3208;
    float _3228 = _3226 + 1.0;
    bool _3230 = _1063 >= (*spvDescriptorSet0.vp_c9)._m0[172].w;
    bool _3232 = isnan(_1063);
    bool _3234 = _3230 || _3232;
    bool _3236 = isnan((*spvDescriptorSet0.vp_c9)._m0[172].w);
    bool _3238 = _3234 || _3236;
    float _3240 = float(_3238);
    float _3242 = -(*spvDescriptorSet0.vp_c9)._m0[171].w;
    float _3244 = _3242 + (*spvDescriptorSet0.vp_c9)._m0[172].w;
    float _3246 = _2366 * _3170;
    float _3248 = _3224 * _3228;
    float _3250 = -_3224;
    float _3252 = _3250 + 1.0;
    float _3254 = 1.0 / _3244;
    bool _3256 = _1063 >= (*spvDescriptorSet0.vp_c9)._m0[171].w;
    bool _3258 = isnan(_1063);
    bool _3260 = _3256 || _3258;
    bool _3262 = isnan((*spvDescriptorSet0.vp_c9)._m0[171].w);
    bool _3264 = _3260 || _3262;
    float _3266 = float(_3264);
    float _3268 = _3240 * _3252;
    float _3270 = -_3240;
    float _3272 = _3270 + 1.0;
    int _3274 = ~_3040;
    int _3276 = _3274 + _3130;
    int _3278 = _3276 + 1;
    float _3280 = -_3266;
    float _3282 = _3280 + 1.0;
    float _3284 = _1811 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _3286 = _3266 * _3272;
    float _3288 = -(*spvDescriptorSet0.vp_c9)._m0[171].x;
    float _3290 = (*spvDescriptorSet0.vp_c9)._m0[172].x + _3288;
    float _3292 = _2031 * _3282;
    bool _3294 = _1063 >= (*spvDescriptorSet0.vp_c9)._m0[168].w;
    bool _3296 = isnan(_1063);
    bool _3298 = _3294 || _3296;
    bool _3300 = isnan((*spvDescriptorSet0.vp_c9)._m0[168].w);
    bool _3302 = _3298 || _3300;
    float _3304 = float(_3302);
    float _3306 = fma(_1797, (*spvDescriptorSet0.vp_c8)._m0[26].x, _3284);
    int _3308 = ~_2914;
    int _3310 = _3308 + _3008;
    int _3312 = _3310 + 1;
    int _3314 = _2009 * _3278;
    int _3316 = _3314 + _2532;
    int _3318 = abs(_3116);
    float _3320 = _3290 * _3254;
    float _3322 = -(*spvDescriptorSet0.vp_c9)._m0[173].w;
    float _3324 = _3322 + (*spvDescriptorSet0.vp_c9)._m0[174].w;
    float _3326 = _3304 * _2101;
    float _3328 = -(*spvDescriptorSet0.vp_c9)._m0[167].w;
    float _3330 = _1063 + _3328;
    float _3332 = -_3304;
    float _3334 = _3332 + 1.0;
    float _3336 = _2410 * _2382;
    float _3338 = -(*spvDescriptorSet0.vp_c9)._m0[169].w;
    float _3340 = _1063 + _3338;
    float _3342 = fma(_3210, _3330, (*spvDescriptorSet0.vp_c9)._m0[167].x);
    float _3344 = _2113 * _3334;
    float _3346 = -(*spvDescriptorSet0.vp_c9)._m0[168].w;
    float _3348 = _1063 + _3346;
    float _3350 = -_2113;
    float _3352 = _3350 + 1.0;
    float _3354 = 1.0 / _3324;
    float _3356 = _3342 * _3344;
    float _3358 = fma(_3212, _3348, (*spvDescriptorSet0.vp_c9)._m0[168].x);
    float _3360 = -(*spvDescriptorSet0.vp_c9)._m0[170].w;
    float _3362 = _1063 + _3360;
    float _3364 = fma(_3246, _3340, (*spvDescriptorSet0.vp_c9)._m0[169].x);
    float _3366 = fma(_3352, (*spvDescriptorSet0.vp_c9)._m0[167].x, _3356);
    float _3368 = -(*spvDescriptorSet0.vp_c9)._m0[173].x;
    float _3370 = (*spvDescriptorSet0.vp_c9)._m0[174].x + _3368;
    float _3372 = fma(_3188, _3362, (*spvDescriptorSet0.vp_c9)._m0[170].x);
    float _3374 = -(*spvDescriptorSet0.vp_c9)._m0[171].w;
    float _3376 = _1063 + _3374;
    float _3378 = fma(_3358, _3326, _3366);
    float _3380 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    int _3382 = ~_3084;
    int _3384 = _3382 + _3154;
    int _3386 = _3384 + 1;
    float _3388 = fma(_3320, _3376, (*spvDescriptorSet0.vp_c9)._m0[171].x);
    float _3390 = fma(_3364, _2093, _3378);
    float _3392 = _2858 + (-0.5);
    int _3394 = ~_3082;
    int _3396 = _3394 + _3164;
    int _3398 = _3396 + 1;
    float _3400 = _3370 * _3354;
    float _3402 = fma(_3372, _3292, _3390);
    float _3404 = _2322 + 0.5;
    float _3406 = -(*spvDescriptorSet0.vp_c9)._m0[172].w;
    float _3408 = _1063 + _3406;
    float _3410 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _3412 = fma(_3388, _3286, _3402);
    float _3414 = fma(_3404, (*spvDescriptorSet0.vp_c9)._m0[95].x, _1347);
    float _3416 = _3182 + 0.5;
    float _3418 = -(*spvDescriptorSet0.vp_c9)._m0[173].w;
    float _3420 = _1063 + _3418;
    float _3422 = fma(_3336, _3408, (*spvDescriptorSet0.vp_c9)._m0[172].x);
    float _3424 = _2882 + (-0.5);
    float _3426 = fma(_3416, (*spvDescriptorSet0.vp_c9)._m0[80].x, _1337);
    int _3428 = _2992 >> 31;
    float _3430 = fma(_3400, _3420, (*spvDescriptorSet0.vp_c9)._m0[173].x);
    float _3432 = fma(_3422, _3268, _3412);
    float _3434 = -_3392;
    float _3436 = -_1543;
    float _3438 = fma(_3434, (*spvDescriptorSet0.vp_c9)._m0[95].y, _3436);
    int _3440 = _3428 & 3;
    float _3442 = -_1329;
    float _3444 = _3442 + 1.0;
    float _3446 = -_3424;
    float _3448 = -_1495;
    float _3450 = fma(_3446, (*spvDescriptorSet0.vp_c9)._m0[80].y, _3448);
    float _3452 = fma(_3430, _3248, _3432);
    int _3454 = _2992 + _3440;
    float _3456 = -_3444;
    float _3458 = fma(_3456, _2322, _3414);
    float _3460 = fma(_1999, _2858, _3438);
    float _3462 = _3380 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _3464 = _2796 + 0.5;
    float _3466 = -_2005;
    float _3468 = fma(_3182, _3466, _3426);
    int _3470 = _3454 >> 2;
    float _3472 = _3410 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _3474 = _2516 + (-0.5);
    float _3476 = fma(_3462, _3464, _1551);
    int _3478 = _3470 << 4;
    int _3480 = _3478 + 656;
    out.m_82.x = _3458;
    out.m_82.y = _3460;
    float _3482 = -_3472;
    float _3484 = -_1619;
    float _3486 = fma(_3482, _3474, _3484);
    float _3488 = -_1639;
    float _3490 = _3488 + 1.0;
    float _3492 = _1791 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _3494 = _1791 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _3496 = _1791 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _3498 = fma(_2882, _3490, _3450);
    float _3500 = fma(_3208, (*spvDescriptorSet0.vp_c9)._m0[174].x, _3452);
    float _3502 = _1811 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _3504 = trunc((*spvDescriptorSet0.vp_c9)._m0[90].z);
    int _3506 = int(_3504);
    float _3508 = -_2015;
    float _3510 = fma(_2796, _3508, _3476);
    float _3512 = fma(_2516, _2019, _3486);
    uint _3514 = uint(int(uint(_3480) >> uint(2)));
    uint _3516 = uint(int(uint(int(_3514)) >> uint(2)));
    int _3518 = int(_3514) & 3;
    float _3520 = (*spvDescriptorSet0.vp_c9)._m0[int(_3516)][_3518];
    int _3522 = int(_3514) + 1;
    uint _3524 = uint(int(uint(_3522) >> uint(2)));
    int _3526 = _3522 & 3;
    float _3528 = (*spvDescriptorSet0.vp_c9)._m0[int(_3524)][_3526];
    float _3530 = -_1781;
    float _3532 = fma(_3530, (*spvDescriptorSet0.vp_c8)._m0[24].x, _3492);
    out.m_84.x = _3500;
    float _3534 = fma(_1797, (*spvDescriptorSet0.vp_c8)._m0[25].x, _3502);
    float _3536 = _227 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _3538 = fma(_1793, (*spvDescriptorSet0.vp_c8)._m0[24].z, _3532);
    out.m_86.x = _3468;
    out.m_86.y = _3498;
    out.m_86.z = _3510;
    out.m_86.w = _3512;
    int _3540 = abs(_3056);
    int _3542 = _3480 + 8;
    uint _3544 = uint(int(uint(_3542) >> uint(2)));
    uint _3546 = uint(int(uint(int(_3544)) >> uint(2)));
    int _3548 = int(_3544) & 3;
    float _3550 = (*spvDescriptorSet0.vp_c9)._m0[int(_3546)][_3548];
    int _3552 = int(_3544) + 1;
    uint _3554 = uint(int(uint(_3552) >> uint(2)));
    int _3556 = _3552 & 3;
    float _3558 = (*spvDescriptorSet0.vp_c9)._m0[int(_3554)][_3556];
    int _3560 = _1983 * _3312;
    int _3562 = _3560 + _2362;
    int _3564 = abs(_3150);
    int _3566 = _2043 * _3398;
    int _3568 = _3566 + _2678;
    int _3570 = ~_3540;
    int _3572 = _3570 + 1;
    int _3574 = _3572 + 1;
    int _3576 = abs(_2938);
    int _3578 = abs(_3072);
    bool _3580 = !_2324;
    int _3582 = _3580 ? _3562 : (-1);
    float _3584 = -_1781;
    float _3586 = fma(_3584, (*spvDescriptorSet0.vp_c8)._m0[25].x, _3494);
    float _3588 = -_1781;
    float _3590 = fma(_3588, (*spvDescriptorSet0.vp_c8)._m0[26].x, _3496);
    float _3592 = _1803 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _3594 = _1803 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _3596 = _1803 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _3598 = fma(_1793, (*spvDescriptorSet0.vp_c8)._m0[26].z, _3590);
    float _3600 = _1811 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _3602 = fma(_1795, (*spvDescriptorSet0.vp_c8)._m0[24].x, _3592);
    float _3604 = fma(_1795, (*spvDescriptorSet0.vp_c8)._m0[25].x, _3594);
    float _3606 = fma(_1795, (*spvDescriptorSet0.vp_c8)._m0[26].x, _3596);
    float _3608 = fma(_1797, (*spvDescriptorSet0.vp_c8)._m0[24].x, _3600);
    float _3610 = _231 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _3612 = fma(_1807, (*spvDescriptorSet0.vp_c8)._m0[24].z, _3602);
    int _3614 = ~_3578;
    int _3616 = _3614 + 1;
    int _3618 = _3616 + 1;
    float _3620 = fma(_1807, (*spvDescriptorSet0.vp_c8)._m0[25].z, _3604);
    float _3622 = fma(_3610, _3610, 1.0);
    float _3624 = fma(_1807, (*spvDescriptorSet0.vp_c8)._m0[26].z, _3606);
    float _3626 = _3610 * _3538;
    int _3628 = _2868 >> 31;
    float _3630 = rsqrt(_3622);
    int _3632 = abs(_3096);
    float _3634 = fma(_3536, _3612, _3626);
    out.m_88.x = _3612;
    out.m_88.y = _3620;
    out.m_88.z = _3624;
    int _3636 = _3628 & 3;
    float _3638 = fma(_1821, (*spvDescriptorSet0.vp_c8)._m0[24].z, _3608);
    float _3640 = fma(_1821, (*spvDescriptorSet0.vp_c8)._m0[25].z, _3534);
    float _3642 = fma(_1793, (*spvDescriptorSet0.vp_c8)._m0[25].z, _3586);
    int _3644 = _2868 + _3636;
    int _3646 = _3618 * as_type<int>(_3528);
    bool _3648 = !_2474;
    int _3650 = _3648 ? _3316 : (-1);
    float _3652 = fma(_1821, (*spvDescriptorSet0.vp_c8)._m0[26].z, _3306);
    bool _3654 = !_2878;
    int _3656 = _3654 ? 0 : 1;
    int _3658 = _3574 * as_type<int>(_3520);
    int _3660 = _3658 + _3646;
    float _3662 = _3610 * _3642;
    int _3664 = _2043 * _3386;
    int _3666 = _3664 + _2828;
    float _3668 = _3610 * _3630;
    int _3670 = abs(_3506);
    int _3672 = ~_3318;
    int _3674 = _3672 + 1;
    int _3676 = _3674 + 1;
    int _3678 = ~_3632;
    int _3680 = _3678 + 1;
    int _3682 = _3680 + 1;
    bool _3684 = !_2658;
    int _3686 = _3684 ? _3666 : (-1);
    int _3688 = _3676 * as_type<int>(_3550);
    int _3690 = _3688 + _3660;
    float _3692 = float(uint(_3506));
    float _3694 = -_3638;
    float _3696 = _3668 * _3694;
    int _3698 = _3686 >> 31;
    int _3700 = _3682 * as_type<int>(_3558);
    int _3702 = _3700 + _3690;
    int _3704 = _3644 >> 2;
    float _3706 = 1.0 / _3692;
    int _3708 = _3698 & 3;
    float _3710 = fma(_3630, _3538, _3696);
    int _3712 = _3704 << 4;
    int _3714 = _3712 + 368;
    float _3716 = float(uint(_3670));
    int _3718 = ~_3564;
    int _3720 = _3718 + 1;
    int _3722 = _3720 + 1;
    int _3724 = _3686 + _3708;
    float _3726 = 1.0 / _3716;
    uint _3728 = uint(int(uint(_3714) >> uint(2)));
    uint _3730 = uint(int(uint(int(_3728)) >> uint(2)));
    int _3732 = int(_3728) & 3;
    float _3734 = (*spvDescriptorSet0.vp_c9)._m0[int(_3730)][_3732];
    int _3736 = int(_3728) + 1;
    uint _3738 = uint(int(uint(_3736) >> uint(2)));
    int _3740 = _3736 & 3;
    float _3742 = (*spvDescriptorSet0.vp_c9)._m0[int(_3738)][_3740];
    int _3744 = _3686 & 3;
    bool _3746 = _3744 != 0;
    int _3748 = _3702 * _3722;
    int _3750 = _3686 & 3;
    bool _3752 = _3750 != 0;
    int _3754 = _3724 >> 2;
    int _3756 = _3650 * _3564;
    int _3758 = _3756 + _3748;
    int _3760 = _3746 ? 0 : 1;
    float _3762 = -_3640;
    float _3764 = _3668 * _3762;
    float _3766 = -_3652;
    float _3768 = _3668 * _3766;
    int _3770 = _3754 << 4;
    int _3772 = _3770 + 800;
    float _3774 = fma(_3630, _3642, _3764);
    float _3776 = _3610 * _3598;
    bool _3778 = uint(_3750) > 1u;
    float _3780 = fma(_3630, _3598, _3768);
    int _3782 = abs(_3758);
    uint _3784 = uint(int(uint(_3772) >> uint(2)));
    uint _3786 = uint(int(uint(int(_3784)) >> uint(2)));
    int _3788 = int(_3784) & 3;
    float _3790 = (*spvDescriptorSet0.vp_c9)._m0[int(_3786)][_3788];
    int _3792 = int(_3784) + 1;
    uint _3794 = uint(int(uint(_3792) >> uint(2)));
    int _3796 = _3792 & 3;
    float _3798 = (*spvDescriptorSet0.vp_c9)._m0[int(_3794)][_3796];
    float _3800 = fma(_3536, _3620, _3662);
    int _3802 = as_type<int>(_3706) + (-2);
    out.m_90.x = _3710;
    out.m_90.y = _3774;
    out.m_90.z = _3780;
    float _3804 = float(uint(_3758));
    float _3806 = fma(_3536, _3624, _3776);
    int _3808 = as_type<int>(_3726) + (-2);
    bool _3810 = !_3752;
    int _3812 = _3810 ? 0 : 1;
    int _3814 = _3772 + 8;
    uint _3816 = uint(int(uint(_3814) >> uint(2)));
    uint _3818 = uint(int(uint(int(_3816)) >> uint(2)));
    int _3820 = int(_3816) & 3;
    float _3822 = (*spvDescriptorSet0.vp_c9)._m0[int(_3818)][_3820];
    int _3824 = int(_3816) + 1;
    uint _3826 = uint(int(uint(_3824) >> uint(2)));
    int _3828 = _3824 & 3;
    float _3830 = (*spvDescriptorSet0.vp_c9)._m0[int(_3826)][_3828];
    bool _3832 = uint(_3750) >= 2u;
    int _3834 = ~_3760;
    int _3836 = _3834 + 1;
    int _3838 = _3836 + 1;
    int _3840 = _3838;
    if (!_3778)
    {
        int _3842 = ~_3760;
        int _3844 = _3842 + 1;
        _3840 = _3844;
    }
    int _3846 = _3840;
    float _3848 = as_type<float>(_3802) * _3804;
    float _3850 = float(uint(_3782));
    int _3852 = _3714 + 8;
    uint _3854 = uint(int(uint(_3852) >> uint(2)));
    uint _3856 = uint(int(uint(int(_3854)) >> uint(2)));
    int _3858 = int(_3854) & 3;
    float _3860 = (*spvDescriptorSet0.vp_c9)._m0[int(_3856)][_3858];
    int _3862 = int(_3854) + 1;
    uint _3864 = uint(int(uint(_3862) >> uint(2)));
    int _3866 = _3862 & 3;
    float _3868 = (*spvDescriptorSet0.vp_c9)._m0[int(_3864)][_3866];
    int _3870 = _3832 ? 0 : 1;
    float _3872 = trunc(_3848);
    float _3874 = precise::max(_3872, 0.0);
    uint _3876 = uint(_3874);
    bool _3878 = _2876 != 3;
    float _3880 = as_type<float>(_3808) * _3850;
    int _3882 = ~_3506;
    int _3884 = _3882 + 1;
    int _3886 = ~_3576;
    int _3888 = _3886 + 1;
    int _3890 = _3888 + 1;
    float _3892 = trunc(_3880);
    float _3894 = precise::max(_3892, 0.0);
    uint _3896 = uint(_3894);
    int _3898 = ~_3670;
    int _3900 = _3898 + 1;
    int _3902 = _3890 * as_type<int>(_3742);
    int _3904 = abs(_3846);
    int _3906 = _3884 * int(_3876);
    int _3908 = _3906 + _3758;
    int _3910 = abs(_3656);
    float _3912 = _3742;
    if (_1879)
    {
        float _3914 = _1923 * 6.283185482025146484375;
        float _3916 = cos(_3914);
        _3912 = _3916;
    }
    float _3918 = _3912;
    int _3920 = ~_3904;
    int _3922 = _3920 + 1;
    int _3924 = _3922 + 1;
    bool _3926 = _3750 != 3;
    int _3928 = _3900 * int(_3896);
    int _3930 = _3928 + _3782;
    float _3932 = float(uint(_3908));
    int _3934 = ~_3870;
    int _3936 = _3934 + 1;
    int _3938 = _3936 + 1;
    float _3940 = float(uint(_3930));
    float _3942 = as_type<float>(_3802) * _3932;
    int _3944 = ~_3910;
    int _3946 = _3944 + 1;
    int _3948 = _3946 + 1;
    int _3950 = _3924 * as_type<int>(_3798);
    int _3952 = abs(_3812);
    float _3954 = as_type<float>(_3808) * _3940;
    int _3956 = _3938;
    float _3958 = _3798;
    if (_1879)
    {
        float _3960 = _3918 + (-1.0);
        _1931 = _3960;
    }
    float _3962 = _1931;
    if (_3926)
    {
        int _3964 = ~_3870;
        int _3966 = _3964 + 1;
        _3956 = _3966;
    }
    int _3968 = _3956;
    int _3970 = _3948 * as_type<int>(_3734);
    int _3972 = _3970 + _3902;
    float _3974 = trunc(_3942);
    float _3976 = precise::max(_3974, 0.0);
    uint _3978 = uint(_3976);
    int _3980 = abs(_3016);
    float _3982 = as_type<float>(_3980);
    if (_1879)
    {
        float _3984 = _3962 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _3958 = _3984;
    }
    float _3986 = _3958;
    int _3988 = ~_3952;
    int _3990 = _3988 + 1;
    int _3992 = _3990 + 1;
    int _3994 = ~_3980;
    int _3996 = _3994 + 1;
    int _3998 = _3996 + 1;
    if (_1879)
    {
        float _4000 = fma(_1939, _3918, _3986);
        _1941 = _4000;
    }
    float _4002 = _1941;
    if (_1879)
    {
        float _4004 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _4006 = _1961 + _4004;
        _3982 = _4006;
    }
    float _4008 = _3982;
    float _4010 = trunc(_3954);
    float _4012 = precise::max(_4010, 0.0);
    uint _4014 = uint(_4012);
    int _4016 = _3992 * as_type<int>(_3790);
    int _4018 = _4016 + _3950;
    int _4020 = abs(_3968);
    int _4022 = _3998 * as_type<int>(_3860);
    int _4024 = _4022 + _3972;
    bool _4026 = !_3878;
    int _4028 = _4026 ? 0 : (-1);
    float _4030 = _4008;
    if (_1879)
    {
        float _4032 = _4008 * _4008;
        _1897 = _4032;
    }
    float _4034 = _1897;
    int _4036 = ~_4020;
    int _4038 = _4036 + 1;
    int _4040 = _4038 + 1;
    if (_1879)
    {
        float _4042 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _4044 = _1965 + _4042;
        _4030 = _4044;
    }
    float _4046 = _4030;
    int _4048 = ~_3670;
    int _4050 = _4048 + 1;
    int _4052 = abs(_4028);
    int _4054 = _4040 * as_type<int>(_3822);
    int _4056 = _4054 + _4018;
    bool _4058 = _3750 != 3;
    if (_1879)
    {
        float _4060 = _4046 * _4046;
        _1899 = _4060;
    }
    float _4062 = _1899;
    int _4064 = ~_3506;
    int _4066 = _4064 + 1;
    float _4068 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].w;
    int _4070 = int(_3896) + int(_4014);
    int _4072 = int(_3876) + int(_3978);
    int _4074 = ~_4052;
    int _4076 = _4074 + 1;
    int _4078 = _4076 + 1;
    int _4080 = _4050 * _4070;
    int _4082 = _4080 + _3782;
    bool _4084 = !_4058;
    int _4086 = _4084 ? 0 : (-1);
    int _4088 = _4066 * _4072;
    int _4090 = _4088 + _3758;
    bool _4092 = !_2658;
    int _4094 = _4092 ? _3568 : (-1);
    int _4096 = _4078 * as_type<int>(_3868);
    int _4098 = _4096 + _4024;
    int _4100 = abs(_4086);
    bool _4102 = uint(_4082) >= uint(_3670);
    float _4104 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _4106 = _4002 + _4104;
    int _4108 = _3758 ^ _3506;
    bool _4110 = uint(_4090) >= uint(_3506);
    float _4112 = fma(_4106, _4106, _4034);
    int _4114 = ~_4100;
    int _4116 = _4114 + 1;
    int _4118 = _4116 + 1;
    float _4120 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].z;
    bool _4122 = !_4102;
    int _4124 = _4122 ? 0 : (-1);
    float _4126 = _4068 * (*spvDescriptorSet0.vp_c9)._m0[90].y;
    uint _4128 = uint(int(uint(_4108) >> uint(31)));
    int _4130 = _4118 * as_type<int>(_3830);
    int _4132 = _4130 + _4056;
    bool _4134 = !_4110;
    int _4136 = _4134 ? 0 : (-1);
    float _4138 = _4112 + _4062;
    bool _4140 = !_3178;
    int _4142 = _4140 ? 0 : 1;
    int _4144 = ~_4124;
    int _4146 = _4070 + _4144;
    int _4148 = _4146 + 1;
    int _4150 = ~int(_4128);
    int _4152 = _4150 + 1;
    float _4154 = sqrt(_4138);
    int _4156 = ~_4072;
    int _4158 = _4156 + _4136;
    int _4160 = _4158 + 1;
    int _4162 = abs(_4142);
    bool _4164 = !_3186;
    int _4166 = _4164 ? 0 : 1;
    int _4168 = _3506 * _4160;
    int _4170 = _4168 + _3758;
    int _4172 = _4148 ^ _4152;
    int _4174 = ~_4162;
    int _4176 = _4174 + 1;
    int _4178 = _4176 + 1;
    int _4180 = abs(_4166);
    bool _4182 = _3506 == 0;
    int _4184 = _4098 * _4178;
    bool _4186 = _3506 == 0;
    int _4188 = ~_4152;
    int _4190 = _4188 + _4172;
    int _4192 = _4190 + 1;
    int _4194 = _3582 * _4162;
    int _4196 = _4194 + _4184;
    int _4198 = ~_4180;
    int _4200 = _4198 + 1;
    int _4202 = _4200 + 1;
    bool _4204 = !_4182;
    int _4206 = _4204 ? _4170 : (-1);
    bool _4208 = !_4186;
    int _4210 = _4208 ? _4192 : (-1);
    int _4212 = _4132 * _4202;
    float _4214 = float(_4206);
    float _4216 = _4120 * (*spvDescriptorSet0.vp_c9)._m0[90].x;
    float _4218 = float(_4210);
    int _4220 = _4094 * _4180;
    int _4222 = _4220 + _4212;
    out.m_92.x = _1975;
    out.m_92.y = _1977;
    out.m_92.z = _1979;
    float _4224 = fma(_4216, _4214, _1651);
    float _4226 = _1273 + 0.5;
    float _4228 = -_1653;
    float _4230 = fma(_4126, _4218, _4228);
    float _4232 = _1265 + (-0.5);
    float _4234 = float(_4222);
    float _4236 = fma(_4216, _4226, _4224);
    float _4238 = _3640 + _3800;
    float _4240 = -_4126;
    float _4242 = fma(_4240, _4232, _4230);
    float _4244 = float(_4196);
    float _4246 = -_2065;
    float _4248 = fma(_1273, _4246, _4236);
    float _4250 = _3638 + _3634;
    float _4252 = fma(_1265, _2073, _4242);
    float _4254 = _3652 + _3806;
    out.m_94.x = _4244;
    bool _4256 = _4154 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _4258 = isnan(_4154);
    bool _4260 = _4256 || _4258;
    bool _4262 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _4264 = _4260 || _4262;
    out.m_94.w = _4234;
    out.m_96.x = _4248;
    out.m_96.y = _4252;
    out.m_98.x = _4250;
    out.m_98.y = _4238;
    out.m_98.z = _4254;
    float _4266 = _4216;
    if (!_4264)
    {
        _4266 = 1.0;
    }
    float _4268 = _4266;
    bool _4270 = !_4264;
    float _4272 = _4268;
    if (!_4270)
    {
        bool _4274 = _4154 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _4276 = isnan(_4154);
        bool _4278 = _4274 || _4276;
        bool _4280 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _4282 = _4278 || _4280;
        if (!_4282)
        {
            float _4284 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _4286 = _4154 + _4284;
            float _4288 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _4290 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _4288;
            float _4292 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _4294 = _4292 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _4296 = 1.0 / _4290;
            float _4298 = _4286 * _4296;
            float _4300 = fma(_4298, _4294, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _4272 = _4300;
            _4302 = true;
        }
        else
        {
            bool _4304 = _4154 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _4306 = isnan(_4154);
            bool _4308 = _4304 || _4306;
            bool _4310 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _4312 = _4308 || _4310;
            if (!_4312)
            {
                float _4314 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _4316 = _4154 + _4314;
                float _4318 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _4320 = _4318 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _4322 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _4324 = _4322 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _4326 = 1.0 / _4320;
                float _4328 = _4316 * _4326;
                float _4330 = fma(_4328, _4324, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _4272 = _4330;
                _4302 = true;
            }
            else
            {
                _4272 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _4302 = false;
    float _4332 = _4272;
    float _4334 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _4336 = _4002 + _4334;
    float _4338 = _1877 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _4340 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _4342 = _1961 + _4340;
    float _4344 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _4346 = _1965 + _4344;
    float _4348 = fma(_4336, _4332, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _4350 = fma(_1777, (*spvDescriptorSet0.vp_c8)._m0[11].x, _4338);
    float _4352 = fma(_4342, _4332, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _4354 = fma(_4346, _4332, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _4356 = -_1877;
    float _4358 = _4356 + _4348;
    float _4360 = fma(_1787, (*spvDescriptorSet0.vp_c8)._m0[11].z, _4350);
    float _4362 = -_1777;
    float _4364 = _4362 + _4352;
    float _4366 = _1877 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _4368 = _4358 * _4358;
    float _4370 = _4360 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _4372 = -_1787;
    float _4374 = _4372 + _4354;
    float _4376 = fma(_1777, (*spvDescriptorSet0.vp_c8)._m0[10].x, _4366);
    float _4378 = fma(_4364, _4364, _4368);
    float _4380 = 1.0 / _4370;
    float _4382 = fma(_1787, (*spvDescriptorSet0.vp_c8)._m0[10].z, _4376);
    float _4384 = fma(_4374, _4374, _4378);
    float _4386 = _4382 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _4388 = sqrt(_4384);
    float _4390 = _4386 + _4370;
    float _4392 = _4390 * _4380;
    float _4394 = _4392 * 0.5;
    bool _4396 = _4388 > 0.0;
    float _4398 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _4400 = fma(_4394, (*spvDescriptorSet0.vp_c8)._m0[30].w, _4398);
    float _4402 = 1.0 / _4400;
    bool _4404 = (*spvDescriptorSet0.vp_c15)._m0[660].y >= 0.5;
    bool _4406 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _4408 = _4404 || _4406;
    bool _4410 = isnan(0.5);
    bool _4412 = _4408 || _4410;
    bool _4414 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _4416 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _4418 = _4414 || _4416;
    bool _4420 = isnan(0.5);
    bool _4422 = _4418 || _4420;
    float _4424 = (*spvDescriptorSet0.vp_c15)._m0[660].y;
    float _4426 = (*spvDescriptorSet0.vp_c15)._m0[653].w;
    float _4428 = _4346;
    float _4430 = _4380;
    float _4432 = _4400;
    float _4434 = _4348;
    if (!_4396)
    {
        _4424 = _4352;
    }
    float _4436 = _4424;
    float _4438 = _4436;
    if (!_4396)
    {
        _4426 = _4348;
    }
    float _4440 = _4426;
    float _4442 = _4440;
    float _4444 = _4440;
    if (!_4396)
    {
        _4428 = _4354;
    }
    float _4446 = _4428;
    bool _4448 = !_4396;
    float _4450 = _4446;
    float _4452 = _4446;
    if (!_4448)
    {
        float _4454 = _247 * _247;
        float _4456 = rsqrt(_4384);
        float _4458 = fma(_243, _243, _4454);
        float _4460 = fma(_249, _249, _4458);
        float _4462 = sqrt(_4460);
        float _4464 = _4364 * _4456;
        float _4466 = _4358 * _4456;
        float _4468 = _4374 * _4456;
        bool _4470 = _4462 > 0.0;
        float _4472 = _4462;
        _4430 = _4464;
        _4432 = _4456;
        if (!_4470)
        {
            _4472 = _4352;
        }
        float _4474 = _4472;
        _4438 = _4474;
        if (!_4470)
        {
            _4442 = _4348;
        }
        float _4476 = _4442;
        _4444 = _4476;
        if (!_4470)
        {
            _4450 = _4354;
        }
        float _4478 = _4450;
        bool _4480 = !_4470;
        _4452 = _4478;
        if (!_4480)
        {
            float _4482 = rsqrt(_4460);
            float _4484 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].z;
            float _4486 = _247 * _4482;
            float _4488 = _243 * _4482;
            float _4490 = _249 * _4482;
            float _4492 = _4466 * _4486;
            float _4494 = fma(_4464, _4488, _4492);
            float _4496 = _4484 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _4498 = fma(_4468, _4490, _4494);
            float _4500 = _4498 * _4496;
            float _4502 = fma(_243, _4500, _4352);
            float _4504 = fma(_247, _4500, _4348);
            float _4506 = fma(_249, _4500, _4354);
            _4444 = _4504;
            _4452 = _4506;
            _4438 = _4502;
            _4432 = _4500;
        }
    }
    float _4508 = _4444;
    float _4510 = _4452;
    float _4512 = _4438;
    float _4514 = _4430;
    float _4516 = _4432;
    float _4518 = _4516;
    float _4520 = _4508;
    float _4522 = _4512;
    float _4524 = _4510;
    float _4526 = _4514;
    if (_4422)
    {
        _4518 = 1.0;
    }
    float _4528 = _4518;
    float _4530 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _4532 = _4402 * _4530;
    float _4534 = _4528;
    if (!_4412)
    {
        float _4536 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _4538 = _1877 + _4536;
        float _4540 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _4542 = _1777 + _4540;
        float _4544 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _4546 = -_1877;
        float _4548 = _4546 + _4508;
        float _4550 = _4538 * _4538;
        float _4552 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _4554 = _1787 + _4552;
        float _4556 = -_1787;
        float _4558 = _4556 + _4510;
        float _4560 = fma(_4542, _4542, _4550);
        float _4562 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _4564 = fma(_4554, _4554, _4560);
        float _4566 = sqrt(_4564);
        float _4568 = _4544 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _4570 = precise::min(_4566, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _4572 = _4570 * _4562;
        float _4574 = _4568 * _4572;
        float _4576 = -_1777;
        float _4578 = _4576 + _4512;
        float _4580 = fma(_4548, _4574, _1877);
        float _4582 = fma(_4578, _4574, _1777);
        float _4584 = fma(_4558, _4574, _1787);
        _4520 = _4580;
        _4522 = _4582;
        _4524 = _4584;
    }
    float _4586 = _4520;
    float _4588 = _4522;
    float _4590 = _4524;
    if (!_4422)
    {
        float _4592 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _4594 = _4592 * 0.15915493667125701904296875;
        float _4596 = _4594 * 6.283185482025146484375;
        float _4598 = cos(_4596);
        float _4600 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _4602 = _4600 * 0.15915493667125701904296875;
        float _4604 = _4594 * 6.283185482025146484375;
        float _4606 = sin(_4604);
        float _4608 = 1.0 / _4598;
        float _4610 = _4602 * 6.283185482025146484375;
        float _4612 = cos(_4610);
        float _4614 = _4606 * _4608;
        float _4616 = _4602 * 6.283185482025146484375;
        float _4618 = sin(_4616);
        float _4620 = _4612 * _4614;
        float _4622 = 1.0 / _4620;
        float _4624 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _4626 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _4624;
        float _4628 = 1.0 / _4626;
        float _4630 = _4618 * _4622;
        float _4632 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _4634 = fma(_4532, _4630, _4632);
        float _4636 = _4634 * _4628;
        float _4638 = precise::clamp(_4636, 0.0, 1.0);
        _4534 = _4638;
    }
    float _4640 = _4534;
    float _4642 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _4644 = _4586 + _4642;
    float _4646 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _4648 = _4588 + _4646;
    float _4650 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _4652 = _4590 + _4650;
    float _4654 = _4644 * _4644;
    float _4656 = fma(_4648, _4648, _4654);
    float _4658 = fma(_1777, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _4660 = fma(_4652, _4652, _4656);
    float _4662 = rsqrt(_4660);
    float _4664 = sqrt(_4660);
    float _4666 = _4662 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _4668 = _4586 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _4670 = _4648 * _4666;
    float _4672 = _4652 * _4666;
    float _4674 = fma(_4588, (*spvDescriptorSet0.vp_c8)._m0[2].x, _4668);
    float _4676 = _4670 * _4670;
    float _4678 = _4672 * _4672;
    float _4680 = fma(_4590, (*spvDescriptorSet0.vp_c8)._m0[2].z, _4674);
    float _4682 = _4676 + _4678;
    float _4684 = _4680 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _4686 = _4586 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _4688 = sqrt(_4682);
    float _4690 = fma(_4588, (*spvDescriptorSet0.vp_c8)._m0[3].x, _4686);
    float _4692 = fma(_4590, (*spvDescriptorSet0.vp_c8)._m0[3].z, _4690);
    float _4694 = _4692 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    bool _4696 = _4688 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _4698 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _4700 = _4688 + _4698;
    float _4702 = _4662;
    float _4704 = _4682;
    float _4706 = _4700;
    float _4708 = _4644;
    float _4710 = (*spvDescriptorSet0.vp_c15)._m0[652].x;
    if (_4696)
    {
        float _4712 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _4702 = _4712;
    }
    float _4714 = _4702;
    if (_4696)
    {
        float _4716 = rsqrt(_4682);
        _4704 = _4716;
    }
    float _4718 = _4704;
    float _4720 = _4718;
    if (_4696)
    {
        float _4722 = _4700 * _4714;
        _4706 = _4722;
    }
    float _4724 = _4706;
    if (_4696)
    {
        float _4726 = _4724 * 0.15915493667125701904296875;
        _4526 = _4726;
    }
    float _4728 = _4526;
    float _4730 = _4652;
    if (_4696)
    {
        float _4732 = _4728 * 6.283185482025146484375;
        float _4734 = sin(_4732);
        _4730 = _4734;
    }
    float _4736 = _4730;
    float _4738 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _4740 = precise::max(0.0, _4738);
    float _4742 = _4714;
    float _4744 = _4740;
    if (_4696)
    {
        float _4746 = _4728 * 6.283185482025146484375;
        float _4748 = cos(_4746);
        _4742 = _4748;
    }
    float _4750 = _4742;
    float _4752 = -_4666;
    float _4754 = -_4740;
    float _4756 = fma(_4644, _4752, _4754);
    if (_4696)
    {
        float _4758 = _4756 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _4708 = _4758;
    }
    float _4760 = _4708;
    float _4762 = floor(_4658);
    float _4764 = _4760;
    float _4766 = _4736;
    if (_4696)
    {
        float _4768 = fma(_4736, _4760, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _4764 = _4768;
    }
    float _4770 = _4764;
    float _4772 = _4770;
    if (!_4696)
    {
        _4766 = _4670;
    }
    float _4774 = _4766;
    float _4776 = _4774;
    float _4778 = _4750;
    if (_4696)
    {
        float _4780 = _4750 + (-1.0);
        _4744 = _4780;
    }
    float _4782 = _4744;
    float _4784 = _4782;
    if (_4696)
    {
        float _4786 = _4718 * _4770;
        _4710 = _4786;
    }
    float _4788 = _4710;
    if (!_4696)
    {
        _4772 = _4756;
    }
    float _4790 = _4772;
    float _4792 = _4790;
    if (_4696)
    {
        float _4794 = _4782 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _4434 = _4794;
    }
    float _4796 = _4434;
    if (_4696)
    {
        float _4798 = _4670 * _4788;
        _4776 = _4798;
    }
    float _4800 = _4776;
    if (!_4696)
    {
        _4784 = _4672;
    }
    float _4802 = _4784;
    float _4804 = _4802;
    if (_4696)
    {
        float _4806 = _4672 * _4788;
        _4804 = _4806;
    }
    float _4808 = _4804;
    if (!_4696)
    {
        _4720 = _4676;
    }
    float _4810 = _4720;
    float _4812 = _4810;
    if (_4696)
    {
        float _4814 = fma(_4756, _4750, _4796);
        _4792 = _4814;
    }
    float _4816 = _4792;
    if (_4696)
    {
        float _4818 = _4800 * _4800;
        _4812 = _4818;
    }
    float _4820 = _4812;
    if (!_4696)
    {
        _4778 = _4678;
    }
    float _4822 = _4778;
    float _4824 = _4822;
    if (_4696)
    {
        float _4826 = _4808 * _4808;
        _4824 = _4826;
    }
    float _4828 = _4824;
    float _4830 = fma(_4816, _4816, _4820);
    float _4832 = -_4762;
    float _4834 = _4658 + _4832;
    float _4836 = _4830 + _4828;
    float _4838 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _4840 = fma(_4664, (*spvDescriptorSet0.vp_c15)._m0[23].w, _4838);
    float _4842 = precise::clamp(_4840, 0.0, 1.0);
    float _4844 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _4846 = rsqrt(_4836);
    float _4848 = -_4842;
    float _4850 = _4848 + 1.0;
    float _4852 = _4684 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _4854 = fma(_1787, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _4856 = _4586 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _4858 = -_4852;
    float _4860 = fma(_4858, _4844, 1.0);
    float _4862 = _4586 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _4864 = fma(_4588, (*spvDescriptorSet0.vp_c8)._m0[1].x, _4856);
    float _4866 = abs(_4850);
    float _4868 = log2(_4866);
    float _4870 = fma(_4588, (*spvDescriptorSet0.vp_c8)._m0[0].x, _4862);
    float _4872 = fma(_4590, (*spvDescriptorSet0.vp_c8)._m0[1].z, _4864);
    float _4874 = fma(_4590, (*spvDescriptorSet0.vp_c8)._m0[0].z, _4870);
    float _4876 = _4846 * _4800;
    float _4878 = _4872 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _4880 = _4846 * _4816;
    float _4882 = _4846 * _4808;
    float _4884 = _4876 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _4886 = _4874 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _4888 = floor(_4854);
    float _4890 = _4878 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _4892 = -_4884;
    float _4894 = fma(_4880, (*spvDescriptorSet0.vp_c15)._m0[21].y, _4892);
    float _4896 = _4878 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _4898 = _4868 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _4900 = fma(_4886, (*spvDescriptorSet0.vp_c8)._m0[5].x, _4890);
    float _4902 = -_4882;
    float _4904 = fma(_4902, (*spvDescriptorSet0.vp_c15)._m0[21].z, _4894);
    float _4906 = fma(_4886, (*spvDescriptorSet0.vp_c8)._m0[7].x, _4896);
    float _4908 = exp2(_4898);
    float _4910 = fma(_4904, -0.5, 0.5);
    float _4912 = fma(_4684, (*spvDescriptorSet0.vp_c8)._m0[7].z, _4906);
    float _4914 = _4878 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _4916 = fma(_4694, (*spvDescriptorSet0.vp_c8)._m0[7].w, _4912);
    float _4918 = log2(_4860);
    float _4920 = -_4888;
    float _4922 = _4854 + _4920;
    float _4924 = fma(_4886, (*spvDescriptorSet0.vp_c8)._m0[4].x, _4914);
    float _4926 = fma(_4684, (*spvDescriptorSet0.vp_c8)._m0[5].z, _4900);
    float _4928 = fma(_4904, 0.5, 0.5);
    float _4930 = _4880 + 1.0;
    float _4932 = fma(_4684, (*spvDescriptorSet0.vp_c8)._m0[4].z, _4924);
    float _4934 = fma(_4694, (*spvDescriptorSet0.vp_c8)._m0[5].w, _4926);
    float _4936 = 1.0 / _4916;
    float _4938 = -_4880;
    float _4940 = fma(_4908, _4930, _4938);
    float _4942 = fma(_4928, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _4944 = fma(_4694, (*spvDescriptorSet0.vp_c8)._m0[4].w, _4932);
    float _4946 = fma(_4940, 0.5, 0.5);
    float _4948 = fma(_4928, _4942, -0.212114393711090087890625);
    float _4950 = sqrt(_4910);
    float _4952 = _4918 * 0.693147182464599609375;
    float _4954 = fma(_4928, _4948, 1.570728778839111328125);
    float _4956 = _4952 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _4958 = _4934 * _4936;
    float _4960 = _4944 * _4936;
    float _4962 = fma(_4958, -0.5, 0.5);
    float _4964 = fma(_4960, 0.5, 0.5);
    float2 _12760 = float2(_4834, _4922);
    float _4966 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_12760, float2(0.0), isnan(_12760)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_12760, float2(0.0), isnan(_12760)), level(0.0)).x;
    float _4968 = _4950 * 0.636619746685028076171875;
    float3 _12772 = float3(_4964, _4962, _4956);
    float _4970 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_12772, float3(0.0), isnan(_12772)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_12772, float3(0.0), isnan(_12772)), level(0.0)).x;
    float3 _12783 = float3(_4964, _4962, _4956);
    float4 _4973 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_12783, float3(0.0), isnan(_12783)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_12783, float3(0.0), isnan(_12783)), level(0.0)).xyzw;
    float _4975 = _4973.x;
    float _4977 = _4973.y;
    float _4979 = _4973.z;
    float _4981 = _4973.w;
    float _4983 = -_4954;
    float _4985 = fma(_4968, _4983, 1.0);
    float2 _12804 = float2(_4985, _4946);
    float3 _4987 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_12804, float2(0.0), isnan(_12804)), level(0.0)), spvDescriptorSet0.dm_border, 4u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_12804, float2(0.0), isnan(_12804)), level(0.0)).xyz;
    float _4989 = _4987.x;
    float _4991 = _4987.y;
    float _4993 = _4987.z;
    float _4995 = abs(_4532);
    float _4997 = log2(_4995);
    float _4999 = _4878 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _5001 = _4868 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    out.m_100.x = _4588;
    out.m_100.y = _4586;
    out.m_100.z = _4590;
    float _5003 = fma(_4886, (*spvDescriptorSet0.vp_c8)._m0[6].x, _4999);
    bool _5005 = _4664 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _5007 = isnan(_4664);
    bool _5009 = _5005 || _5007;
    bool _5011 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _5013 = _5009 || _5011;
    float _5015 = fma(_4684, (*spvDescriptorSet0.vp_c8)._m0[6].z, _5003);
    float _5017 = exp2(_5001);
    bool _5019 = _4532 <= 8000.0;
    bool _5021 = isnan(_4532);
    bool _5023 = _5019 || _5021;
    bool _5025 = isnan(8000.0);
    bool _5027 = _5023 || _5025;
    float _5029 = float(_5027);
    float _5031 = _4944 + _4916;
    float _5033 = fma(_4694, (*spvDescriptorSet0.vp_c8)._m0[6].w, _5015);
    float _5035 = _4997 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _5037 = in.m_102.x;
    out.gl_Position.x = _4944;
    out.gl_Position.y = _4934;
    out.gl_Position.z = _5033;
    out.gl_Position.w = _4916;
    float _5039 = exp2(_5035);
    float _5041 = -_5017;
    float _5043 = _5041 + 1.0;
    float _5045 = _5043 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _5047 = -_5045;
    float _5049 = _5047 + 1.0;
    float _5051 = fma(_5039, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _5053 = precise::clamp(_5051, 0.0, 1.0);
    float _5055 = _4916 * 0.5;
    float _5057 = fma(_5053, -2.0, 3.0);
    float _5059 = _5053 * _5053;
    float _5061 = _5059 * _5057;
    float _5063 = _5033 + _4916;
    float _5065 = -_5061;
    float _5067 = _5065 + 1.0;
    float _5069 = _5063 * 0.5;
    float _5071 = _4916;
    float _5073 = _5033;
    float _5075 = _4934;
    float _5077 = _5049;
    if (!_5013)
    {
        _5071 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _5079 = _5071;
    float _5081 = fma(_5067, (*spvDescriptorSet0.vp_c15)._m0[654].w, _5061);
    float _5083 = fma(_4934, -0.5, _5055);
    float _5085 = _5031 * 0.5;
    float _5087 = _5029 * _5081;
    float _5089 = _5079;
    float _5091 = _5079;
    if (!_5013)
    {
        _5073 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _5093 = _5073;
    out.m_104.x = _5085;
    out.m_104.y = _5083;
    out.m_104.z = _5069;
    out.m_104.w = _4916;
    float _5095 = _5087 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _5097 = _5093;
    float _5099 = _5093;
    if (!_5013)
    {
        _5075 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _5101 = _5075;
    float _5103 = _4640 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _5105 = -_4966;
    float _5107 = _5105 + 1.0;
    float _5109 = _5045 * _4970;
    float _5111 = _5107 * _5095;
    float _5113 = precise::clamp(_5111, 0.0, 1.0);
    float _5115 = _4981 * _5049;
    float _5117 = _5101;
    float _5119 = _5101;
    if (!_5013)
    {
        _5077 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _5121 = _5077;
    float _5123 = -_5113;
    float _5125 = fma(_5123, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _5127 = _4981 * _5109;
    float _5129 = _5125 * _5037;
    float _5131 = _4993 * _5109;
    float _5133 = fma(_4989, _5127, _4975);
    float _5135 = fma(_4991, _5127, _4977);
    float _5137 = _5129 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _5139 = fma(_4981, _5131, _4979);
    float _5141 = _5129;
    float _5143 = _5127;
    float _5145 = _5121;
    float _5147 = _5121;
    if (!_5013)
    {
        _5141 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _5149 = _5141;
    float _5151 = _5149;
    float _5153 = _5149;
    if (!_5013)
    {
        _5143 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _5155 = _5143;
    out.m_106.x = _5137;
    out.m_108.x = _5133;
    out.m_108.y = _5135;
    out.m_108.z = _5139;
    out.m_108.w = _5115;
    bool _5157 = !_5013;
    float _5159 = _5155;
    float _5161 = _5155;
    if (!_5157)
    {
        bool _5163 = _4664 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _5165 = isnan(_4664);
        bool _5167 = _5163 || _5165;
        bool _5169 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _5171 = _5167 || _5169;
        if (!_5171)
        {
            float _5173 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _5175 = _4664 + _5173;
            float _5177 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _5179 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _5177;
            float _5181 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _5183 = _5181 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _5185 = 1.0 / _5179;
            float _5187 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _5189 = _5187 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _5191 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _5193 = _5191 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _5195 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _5197 = _5195 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _5199 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _5201 = _5199 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _5203 = _5175 * _5185;
            float _5205 = precise::clamp(_5203, 0.0, 1.0);
            float _5207 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _5209 = _5207 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _5211 = fma(_5205, _5183, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _5213 = fma(_5205, _5209, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _5215 = fma(_5205, _5189, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _5217 = fma(_5205, _5193, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _5219 = fma(_5205, _5197, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _5221 = fma(_5205, _5201, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _5091 = _5215;
            _5147 = _5219;
            _5153 = _5211;
            _5119 = _5217;
            _5099 = _5213;
            _5161 = _5221;
            _5223 = true;
        }
        else
        {
            bool _5225 = _4664 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _5227 = isnan(_4664);
            bool _5229 = _5225 || _5227;
            bool _5231 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _5233 = _5229 || _5231;
            if (!_5233)
            {
                _5151 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _5235 = _5151;
            _5153 = _5235;
            if (!_5233)
            {
                _5089 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _5237 = _5089;
            _5091 = _5237;
            if (!_5233)
            {
                _5097 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _5239 = _5097;
            _5099 = _5239;
            if (!_5233)
            {
                _5117 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _5241 = _5117;
            _5119 = _5241;
            if (!_5233)
            {
                _5145 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _5243 = _5145;
            _5147 = _5243;
            if (!_5233)
            {
                _5159 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _5245 = _5159;
            bool _5247 = !_5233;
            _5161 = _5245;
            if (!_5247)
            {
                bool _5249 = _4664 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _5251 = isnan(_4664);
                bool _5253 = _5249 || _5251;
                bool _5255 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _5257 = _5253 || _5255;
                if (!_5257)
                {
                    float _5259 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _5261 = _4664 + _5259;
                    float _5263 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _5265 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _5263;
                    float _5267 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _5269 = _5267 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _5271 = 1.0 / _5265;
                    float _5273 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _5275 = _5273 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _5277 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _5279 = _5277 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _5281 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _5283 = _5281 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _5285 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _5287 = _5285 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _5289 = _5261 * _5271;
                    float _5291 = precise::clamp(_5289, 0.0, 1.0);
                    float _5293 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _5295 = _5293 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _5297 = fma(_5291, _5269, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _5299 = fma(_5291, _5295, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _5301 = fma(_5291, _5275, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _5303 = fma(_5291, _5279, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _5305 = fma(_5291, _5283, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _5307 = fma(_5291, _5287, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _5091 = _5301;
                    _5147 = _5305;
                    _5153 = _5297;
                    _5119 = _5303;
                    _5099 = _5299;
                    _5161 = _5307;
                    _5223 = true;
                }
                else
                {
                    _5091 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _5147 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _5153 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _5119 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _5099 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _5161 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _5223 = false;
    float _5309 = _5091;
    float _5311 = _5147;
    float _5313 = _5153;
    float _5315 = _5119;
    float _5317 = _5099;
    float _5319 = _5161;
    float _5321 = fma(_4238, -0.5, 0.5);
    float _5323 = precise::clamp(_5321, 0.0, 1.0);
    float _5325 = -_5309;
    float _5327 = _5325 + _5311;
    float _5329 = _5103 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _5331 = -_5313;
    float _5333 = _5331 + _5315;
    out.m_110.x = 0.0;
    float _5335 = fma(_5323, _5327, _5309);
    float _5337 = fma(_5323, _5333, _5313);
    out.m_57.x = _5329;
    float _5339 = -_5317;
    float _5341 = _5339 + _5319;
    float _5343 = _5335 * 0.586610972881317138671875;
    bool _5345 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _5347 = fma(_5323, _5341, _5317);
    float _5349 = fma(_5337, 0.298911988735198974609375, _5343);
    bool _5351 = _4640 > 0.0;
    bool _5353 = isnan(_4640);
    bool _5355 = _5351 || _5353;
    bool _5357 = isnan(0.0);
    bool _5359 = _5355 || _5357;
    float _5361 = fma(_5347, 0.114477999508380889892578125, _5349);
    float _5363 = -_5361;
    float _5365 = _5337 + _5363;
    float _5367 = -_5361;
    float _5369 = _5335 + _5367;
    float _5371 = -_5361;
    float _5373 = _5347 + _5371;
    float _5375 = fma(_5365, (*spvDescriptorSet0.vp_c13)._m0[1].z, _5361);
    float _5377 = fma(_5369, (*spvDescriptorSet0.vp_c13)._m0[1].z, _5361);
    float _5379 = fma(_5373, (*spvDescriptorSet0.vp_c13)._m0[1].z, _5361);
    bool _5381 = !_5345;
    if (!_5381)
    {
        float _5383 = -_4586;
        float _5385 = _5383 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _5387 = -_4588;
        float _5389 = _5387 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _5391 = -_4590;
        float _5393 = _5391 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _5395 = _5385 * _5385;
        float _5397 = fma(_5389, _5389, _5395);
        float _5399 = fma(_5393, _5393, _5397);
        float _5401 = sqrt(_5399);
        float _5403 = rsqrt(_5399);
        float _5405 = -_5401;
        float _5407 = _5405 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _5409 = _5407 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _5411 = precise::clamp(_5409, 0.0, 1.0);
        float _5413 = _5389 * _5403;
        float _5415 = _5385 * _5403;
        float _5417 = abs(_5411);
        float _5419 = log2(_5417);
        float _5421 = _5393 * _5403;
        float _5423 = _5413 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _5425 = _4238 * _5415;
        float _5427 = -_5415;
        float _5429 = -_5423;
        float _5431 = fma(_5427, (*spvDescriptorSet0.vp_c15)._m0[656].y, _5429);
        float _5433 = fma(_4250, _5413, _5425);
        float _5435 = -_5421;
        float _5437 = fma(_5435, (*spvDescriptorSet0.vp_c15)._m0[656].z, _5431);
        float _5439 = fma(_4254, _5421, _5433);
        float _5441 = precise::clamp(_5439, 0.0, 1.0);
        float _5443 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _5445 = _5437 + _5443;
        float _5447 = _5419 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _5449 = _5445 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _5451 = precise::clamp(_5449, 0.0, 1.0);
        float _5453 = exp2(_5447);
        float _5455 = _5453 * _5451;
        float _5457 = _5441 * _5455;
        float _5459 = _5457 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _5461 = _5457 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _5463 = _5457 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_110.x = _5459;
        out.m_110.y = _5461;
        out.m_110.z = _5463;
    }
    out.m_112.x = _5375;
    out.m_112.y = _5377;
    out.m_112.z = _5379;
    if (_5359)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_57.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_57.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_57.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_57.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_112.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_112.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_112.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_112.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_55.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_55.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_55.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_55.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_104.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_104.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_104.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_104.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_96.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_96.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_96.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_96.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_94.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_94.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_94.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_94.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_90.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_90.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_90.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_90.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_98.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_98.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_98.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_98.w)); dm_cw(dm_gs, dm_p, 72, as_type<uint>(out.m_100.x)); dm_cw(dm_gs, dm_p, 73, as_type<uint>(out.m_100.y)); dm_cw(dm_gs, dm_p, 74, as_type<uint>(out.m_100.z)); dm_cw(dm_gs, dm_p, 75, as_type<uint>(out.m_100.w)); dm_cw(dm_gs, dm_p, 76, as_type<uint>(out.m_88.x)); dm_cw(dm_gs, dm_p, 77, as_type<uint>(out.m_88.y)); dm_cw(dm_gs, dm_p, 78, as_type<uint>(out.m_88.z)); dm_cw(dm_gs, dm_p, 79, as_type<uint>(out.m_88.w)); dm_cw(dm_gs, dm_p, 80, as_type<uint>(out.m_110.x)); dm_cw(dm_gs, dm_p, 81, as_type<uint>(out.m_110.y)); dm_cw(dm_gs, dm_p, 82, as_type<uint>(out.m_110.z)); dm_cw(dm_gs, dm_p, 83, as_type<uint>(out.m_110.w)); dm_cw(dm_gs, dm_p, 84, as_type<uint>(out.m_92.x)); dm_cw(dm_gs, dm_p, 85, as_type<uint>(out.m_92.y)); dm_cw(dm_gs, dm_p, 86, as_type<uint>(out.m_92.z)); dm_cw(dm_gs, dm_p, 87, as_type<uint>(out.m_92.w)); dm_cw(dm_gs, dm_p, 88, as_type<uint>(out.m_106.x)); dm_cw(dm_gs, dm_p, 89, as_type<uint>(out.m_106.y)); dm_cw(dm_gs, dm_p, 90, as_type<uint>(out.m_106.z)); dm_cw(dm_gs, dm_p, 91, as_type<uint>(out.m_106.w)); dm_cw(dm_gs, dm_p, 92, as_type<uint>(out.m_108.x)); dm_cw(dm_gs, dm_p, 93, as_type<uint>(out.m_108.y)); dm_cw(dm_gs, dm_p, 94, as_type<uint>(out.m_108.z)); dm_cw(dm_gs, dm_p, 95, as_type<uint>(out.m_108.w)); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    out.m_57.x = 0.0;
    float _5465 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _5465;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_57.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_57.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_57.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_57.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_112.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_112.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_112.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_112.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_55.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_55.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_55.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_55.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_104.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_104.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_104.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_104.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_96.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_96.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_96.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_96.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_94.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_94.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_94.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_94.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_90.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_90.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_90.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_90.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_98.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_98.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_98.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_98.w)); dm_cw(dm_gs, dm_p, 72, as_type<uint>(out.m_100.x)); dm_cw(dm_gs, dm_p, 73, as_type<uint>(out.m_100.y)); dm_cw(dm_gs, dm_p, 74, as_type<uint>(out.m_100.z)); dm_cw(dm_gs, dm_p, 75, as_type<uint>(out.m_100.w)); dm_cw(dm_gs, dm_p, 76, as_type<uint>(out.m_88.x)); dm_cw(dm_gs, dm_p, 77, as_type<uint>(out.m_88.y)); dm_cw(dm_gs, dm_p, 78, as_type<uint>(out.m_88.z)); dm_cw(dm_gs, dm_p, 79, as_type<uint>(out.m_88.w)); dm_cw(dm_gs, dm_p, 80, as_type<uint>(out.m_110.x)); dm_cw(dm_gs, dm_p, 81, as_type<uint>(out.m_110.y)); dm_cw(dm_gs, dm_p, 82, as_type<uint>(out.m_110.z)); dm_cw(dm_gs, dm_p, 83, as_type<uint>(out.m_110.w)); dm_cw(dm_gs, dm_p, 84, as_type<uint>(out.m_92.x)); dm_cw(dm_gs, dm_p, 85, as_type<uint>(out.m_92.y)); dm_cw(dm_gs, dm_p, 86, as_type<uint>(out.m_92.z)); dm_cw(dm_gs, dm_p, 87, as_type<uint>(out.m_92.w)); dm_cw(dm_gs, dm_p, 88, as_type<uint>(out.m_106.x)); dm_cw(dm_gs, dm_p, 89, as_type<uint>(out.m_106.y)); dm_cw(dm_gs, dm_p, 90, as_type<uint>(out.m_106.z)); dm_cw(dm_gs, dm_p, 91, as_type<uint>(out.m_106.w)); dm_cw(dm_gs, dm_p, 92, as_type<uint>(out.m_108.x)); dm_cw(dm_gs, dm_p, 93, as_type<uint>(out.m_108.y)); dm_cw(dm_gs, dm_p, 94, as_type<uint>(out.m_108.z)); dm_cw(dm_gs, dm_p, 95, as_type<uint>(out.m_108.w)); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

