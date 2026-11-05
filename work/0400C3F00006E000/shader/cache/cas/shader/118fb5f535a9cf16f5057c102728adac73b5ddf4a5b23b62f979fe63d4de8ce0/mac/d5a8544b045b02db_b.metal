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
    constant _16* vp_c13 [[id(5)]];
    constant _16* vp_c7 [[id(6)]];
    texture2d<float> vp_t_tcb_24 [[id(7)]];
    sampler vp_t_tcb_24Smplr [[id(8)]];
    texture3d<float> vp_t_tcb_32 [[id(9)]];
    sampler vp_t_tcb_32Smplr [[id(10)]];
    texture3d<float> vp_t_tcb_30 [[id(11)]];
    sampler vp_t_tcb_30Smplr [[id(12)]];
    texture2d<float> vp_t_tcb_1C [[id(13)]];
    sampler vp_t_tcb_1CSmplr [[id(14)]];
    sampler vp_t_tcb_24Smplr_w [[id(15)]];
    sampler vp_t_tcb_32Smplr_w [[id(16)]];
    sampler vp_t_tcb_30Smplr_w [[id(17)]];
    sampler vp_t_tcb_1CSmplr_w [[id(18)]];
    constant dm_border_t* dm_border [[id(19)]];
};

struct main0_out
{
    float4 m_62 [[user(locn0)]];
    float4 m_72 [[user(locn1)]];
    float4 m_78 [[user(locn2)]];
    float4 m_86 [[user(locn3)]];
    float4 m_94 [[user(locn4)]];
    float4 m_51 [[user(locn5)]];
    float4 m_76 [[user(locn6)]];
    float4 m_80 [[user(locn7)]];
    float4 m_82 [[user(locn8)]];
    float4 m_74 [[user(locn9)]];
    float4 m_92 [[user(locn10)]];
    float4 m_88 [[user(locn11)]];
    float4 m_90 [[user(locn12)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_84 [[attribute(0)]];
    float4 m_68 [[attribute(1)]];
    float4 m_64 [[attribute(2)]];
    float4 m_66 [[attribute(3)]];
    float4 m_70 [[attribute(4)]];
    float4 m_48 [[attribute(5)]];
    float4 m_53 [[attribute(6)]];
    float4 m_58 [[attribute(7)]];
    float4 m_60 [[attribute(8)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_62 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_72 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_78 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_86 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_94 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_51 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_76 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_80 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_82 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_74 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_92 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_88 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_90 = float4(0.0, 0.0, 0.0, 1.0);
    bool _4147 = false;
    bool _3338 = false;
    bool _733 = false;
    bool _591 = false;
    bool _403 = false;
    bool _209 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _108 = in.m_48.w;
    float _110 = trunc(_108);
    int _113 = int(_110);
    bool _117 = _113 >= 1;
    float _119 = 0.0;
    if (!_117)
    {
        _119 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _121 = _119;
    float _123 = _121;
    if (!_117)
    {
        out.m_51.x = 0.0;
    }
    int _125 = 0;
    if (!_117)
    {
        float _127 = _121 * 5.0;
        _125 = as_type<int>(_127);
    }
    int _129 = _125;
    int _131 = _129;
    if (!_117)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _4446 = as_type<float>(_129);
        out.gl_Position.z = _4446;
    }
    if (!_117)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _133 = in.m_53.w;
    bool _135 = _133 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _137 = isnan(_133);
    bool _139 = _135 || _137;
    bool _141 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _143 = _139 || _141;
    float _145 = -_133;
    float _147 = _145 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _149 = 0.0;
    float _151 = _147;
    if (_143)
    {
        float _153 = float(_113);
        _149 = _153;
    }
    float _155 = _149;
    bool _157 = _147 >= _155;
    bool _159 = !_143;
    bool _161 = _157 || _159;
    if (_161)
    {
        _123 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _163 = _123;
    if (_161)
    {
        out.m_51.x = 0.0;
    }
    if (_161)
    {
        float _165 = _163 * 5.0;
        _131 = as_type<int>(_165);
    }
    int _167 = _131;
    if (_161)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _4515 = as_type<float>(_167);
        out.gl_Position.z = _4515;
    }
    if (_161)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _169 = as_type<float>(int(gl_VertexIndex));
    bool _171 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    int _173 = as_type<int>(_169) & 1;
    bool _175 = _173 != 0;
    int _177 = as_type<int>(_169) & 2;
    bool _179 = _177 != 0;
    bool _181 = !_175;
    float _183 = _181 ? (-0.5) : 0.5;
    bool _185 = !_179;
    float _187 = _185 ? (-0.5) : 0.5;
    bool _189 = !_171;
    float _207;
    if (!_189)
    {
        float _191 = in.m_58.x;
        float _193 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _195 = _191 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _197 = fma(_195, (*spvDescriptorSet0.vp_c9)._m0[12].x, _147);
        float _199 = _197 * _193;
        float _201 = floor(_199);
        float _203 = -_201;
        float _205 = _199 + _203;
        _207 = _205;
        _209 = true;
    }
    else
    {
        float _211 = float(_113);
        float _213 = 1.0 / _211;
        float _215 = _147 * _213;
        _207 = _215;
    }
    _209 = false;
    float _217 = _207;
    float _219 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _221 = _217 + _219;
    float _223 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _225 = _217 + _223;
    float _227 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _229 = _217 + _227;
    float _231 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _233 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _231;
    float _235 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _237 = _235 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _239 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _241 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _239;
    bool _243 = _217 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _245 = isnan(_217);
    bool _247 = _243 || _245;
    bool _249 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _251 = _247 || _249;
    float _253 = float(_251);
    float _255 = 1.0 / _233;
    bool _257 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _259 = 1.0 / _241;
    float _261 = 1.0 / _237;
    float _263 = _221 * _255;
    bool _265 = _217 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _267 = isnan(_217);
    bool _269 = _265 || _267;
    bool _271 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _273 = _269 || _271;
    float _275 = float(_273);
    float _277 = -_253;
    float _279 = _277 + 1.0;
    float _281 = _275 * _279;
    float _283 = _225 * _259;
    bool _285 = _217 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _287 = isnan(_217);
    bool _289 = _285 || _287;
    bool _291 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _293 = _289 || _291;
    float _295 = float(_293);
    float _297 = -_275;
    float _299 = _297 + 1.0;
    float _301 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _303 = _301 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _305 = _295 * _299;
    float _307 = -_295;
    float _309 = _307 + 1.0;
    float _311 = _229 * _261;
    bool _313 = _217 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _315 = isnan(_217);
    bool _317 = _313 || _315;
    bool _319 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _321 = _317 || _319;
    float _323 = float(_321);
    float _325 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _327 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _325;
    float _329 = fma(_303, _311, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _331 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _333 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _331;
    float _335 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _337 = _335 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _339 = fma(_327, _263, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _341 = _323 * _309;
    float _343 = fma(_333, _263, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _345 = fma(_337, _311, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _347 = -_323;
    float _349 = _347 + 1.0;
    float _351 = _339 * _341;
    float _353 = _343 * _341;
    float _355 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _357 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _355;
    float _359 = fma(_349, (*spvDescriptorSet0.vp_c9)._m0[143].x, _351);
    float _361 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _363 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _361;
    float _365 = fma(_349, (*spvDescriptorSet0.vp_c9)._m0[143].y, _353);
    float _367 = fma(_357, _283, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _369 = fma(_329, _305, _359);
    float _371 = fma(_363, _283, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _373 = fma(_345, _305, _365);
    float _375 = fma(_367, _281, _369);
    float _377 = fma(_371, _281, _373);
    float _379 = fma(_253, (*spvDescriptorSet0.vp_c9)._m0[146].x, _375);
    float _381 = fma(_253, (*spvDescriptorSet0.vp_c9)._m0[146].y, _377);
    bool _383 = !_257;
    float _401;
    if (!_383)
    {
        float _385 = in.m_58.x;
        float _387 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _389 = _385 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _391 = fma(_389, (*spvDescriptorSet0.vp_c9)._m0[11].y, _147);
        float _393 = _391 * _387;
        float _395 = floor(_393);
        float _397 = -_395;
        float _399 = _393 + _397;
        _401 = _399;
        _403 = true;
    }
    else
    {
        float _405 = float(_113);
        float _407 = 1.0 / _405;
        float _409 = _147 * _407;
        _401 = _409;
    }
    _403 = false;
    float _411 = _401;
    float _413 = in.m_60.x;
    float _415 = in.m_60.y;
    float _417 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _419 = _417 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _421 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _423 = _421 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _425 = _411 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _427 = isnan(_411);
    bool _429 = _425 || _427;
    bool _431 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _433 = _429 || _431;
    float _435 = float(_433);
    float _437 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _439 = _437 + (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _441 = _411 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _443 = isnan(_411);
    bool _445 = _441 || _443;
    bool _447 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _449 = _445 || _447;
    float _451 = float(_449);
    float _453 = 1.0 / _419;
    float _455 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _457 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _455;
    float _459 = -_435;
    float _461 = _459 + 1.0;
    bool _463 = _411 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _465 = isnan(_411);
    bool _467 = _463 || _465;
    bool _469 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _471 = _467 || _469;
    float _473 = float(_471);
    bool _475 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _477 = _451 * _461;
    float _479 = -_451;
    float _481 = _479 + 1.0;
    float _483 = 1.0 / _423;
    float _485 = _473 * _481;
    float _487 = -_473;
    float _489 = _487 + 1.0;
    float _491 = _381 * _415;
    float _493 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _495 = _493 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _497 = 1.0 / _439;
    float _499 = _457 * _453;
    float _501 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _503 = _411 + _501;
    float _505 = _379 * _413;
    float _507 = fma(_499, _503, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _509 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _511 = _411 + _509;
    float _513 = _495 * _483;
    bool _515 = _411 >= (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _517 = isnan(_411);
    bool _519 = _515 || _517;
    bool _521 = isnan((*spvDescriptorSet0.vp_c9)._m0[118].w);
    bool _523 = _519 || _521;
    float _525 = float(_523);
    float _527 = -(*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _529 = (*spvDescriptorSet0.vp_c9)._m0[118].x + _527;
    float _531 = _507 * _485;
    float _533 = fma(_513, _511, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _535 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _537 = _411 + _535;
    float _539 = -_525;
    float _541 = _539 + 1.0;
    float _543 = fma(_489, (*spvDescriptorSet0.vp_c9)._m0[115].x, _531);
    float _545 = _529 * _497;
    float _547 = _435 * _541;
    float _549 = fma(_533, _477, _543);
    float _551 = fma(_545, _537, (*spvDescriptorSet0.vp_c9)._m0[117].x);
    float _553 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _555 = fma(_551, _547, _549);
    float _557 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _559 = _553 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _561 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _563 = fma(_525, (*spvDescriptorSet0.vp_c9)._m0[118].x, _555);
    float _565 = _557 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _567 = _561 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _569 = _563 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    bool _571 = !_475;
    float _589;
    if (!_571)
    {
        float _573 = in.m_58.x;
        float _575 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _577 = _573 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _579 = fma(_577, (*spvDescriptorSet0.vp_c9)._m0[11].w, _147);
        float _581 = _579 * _575;
        float _583 = floor(_581);
        float _585 = -_583;
        float _587 = _581 + _585;
        _589 = _587;
        _591 = true;
    }
    else
    {
        float _593 = float(_113);
        float _595 = 1.0 / _593;
        float _597 = _147 * _595;
        _589 = _597;
    }
    _591 = false;
    float _599 = _589;
    float _601 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _603 = _599 + _601;
    float _605 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _607 = _605 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _609 = _599 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _611 = isnan(_599);
    bool _613 = _609 || _611;
    bool _615 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _617 = _613 || _615;
    float _619 = float(_617);
    float _621 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _623 = _621 + (*spvDescriptorSet0.vp_c9)._m0[133].w;
    bool _625 = _599 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _627 = isnan(_599);
    bool _629 = _625 || _627;
    bool _631 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _633 = _629 || _631;
    float _635 = float(_633);
    float _637 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _639 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _637;
    bool _641 = _599 >= (*spvDescriptorSet0.vp_c9)._m0[133].w;
    bool _643 = isnan(_599);
    bool _645 = _641 || _643;
    bool _647 = isnan((*spvDescriptorSet0.vp_c9)._m0[133].w);
    bool _649 = _645 || _647;
    float _651 = float(_649);
    float _653 = 1.0 / _607;
    float _655 = -_619;
    float _657 = _655 + 1.0;
    bool _659 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[14].x;
    float _661 = _635 * _657;
    float _663 = -_635;
    float _665 = _663 + 1.0;
    float _667 = 1.0 / _623;
    float _669 = _639 * _653;
    float _671 = -(*spvDescriptorSet0.vp_c9)._m0[132].x;
    float _673 = _671 + (*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _675 = fma(_669, _603, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    float _677 = _673 * _667;
    float _679 = _675 * _661;
    float _681 = -_651;
    float _683 = _681 + 1.0;
    float _685 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _687 = _599 + _685;
    float _689 = fma(_665, (*spvDescriptorSet0.vp_c9)._m0[131].x, _679);
    float _691 = _619 * _683;
    float _693 = fma(_677, _687, (*spvDescriptorSet0.vp_c9)._m0[132].x);
    float _695 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _697 = fma(_693, _691, _689);
    float _699 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _701 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _703 = fma(_651, (*spvDescriptorSet0.vp_c9)._m0[133].x, _697);
    float _705 = _695 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _707 = _699 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _709 = _701 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _711 = _703 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    bool _713 = !_659;
    float _731;
    if (!_713)
    {
        float _715 = in.m_58.x;
        float _717 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[14].x;
        float _719 = _715 * (*spvDescriptorSet0.vp_c9)._m0[15].x;
        float _721 = fma(_719, (*spvDescriptorSet0.vp_c9)._m0[14].x, _147);
        float _723 = _721 * _717;
        float _725 = floor(_723);
        float _727 = -_725;
        float _729 = _723 + _727;
        _731 = _729;
        _733 = true;
    }
    else
    {
        float _735 = float(_113);
        float _737 = 1.0 / _735;
        float _739 = _147 * _737;
        _731 = _739;
    }
    _733 = false;
    float _741 = _731;
    float _743 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _745 = int(_743);
    out.m_62.x = _565;
    out.m_62.y = _567;
    out.m_62.z = _559;
    out.m_62.w = _569;
    float _747 = float(_113);
    float _749 = _505 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    int _751 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _753 = _751 != 0;
    float _755 = -(*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _757 = _741 + _755;
    float _759 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].y);
    int _761 = int(_759);
    float _763 = -(*spvDescriptorSet0.vp_c9)._m0[159].w;
    float _765 = _763 + (*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _767 = -(*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _769 = _767 + (*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _771 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _773 = int(_771);
    float _775 = float(_745);
    float _777 = 0.0;
    int _779 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z);
    if (_753)
    {
        float _781 = in.m_58.x;
        _777 = _781;
    }
    float _783 = _777;
    float _785 = -(*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _787 = _785 + (*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _789 = _783;
    if (!_753)
    {
        float _791 = in.m_58.y;
        _789 = _791;
    }
    float _793 = _789;
    float _795 = 1.0 / _775;
    float _797 = float(_761);
    float _799 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _801 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _803 = -(*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _805 = _803 + (*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _807 = -(*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _809 = _807 + (*spvDescriptorSet0.vp_c9)._m0[166].w;
    float _811 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].x);
    int _813 = int(_811);
    float _815 = float(uint(_773));
    float _817 = -(*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _819 = _817 + (*spvDescriptorSet0.vp_c9)._m0[162].w;
    int _821 = ~_773;
    int _823 = _821 + 1;
    float _825 = (*spvDescriptorSet0.vp_c10)._m0[5].x * (*spvDescriptorSet0.vp_c10)._m0[5].x;
    bool _827 = _773 == 0;
    float _829 = 1.0 / _797;
    float _831 = _795 * _147;
    float _833 = fma((*spvDescriptorSet0.vp_c10)._m0[4].x, (*spvDescriptorSet0.vp_c10)._m0[4].x, _825);
    float _835 = -(*spvDescriptorSet0.vp_c9)._m0[165].x;
    float _837 = (*spvDescriptorSet0.vp_c9)._m0[166].x + _835;
    float _839 = 1.0 / _815;
    float _841 = float(uint(_813));
    int _843 = ~_813;
    int _845 = _843 + 1;
    float _847 = trunc(_831);
    int _849 = int(_847);
    float _851 = _829 * _147;
    bool _853 = _741 >= (*spvDescriptorSet0.vp_c9)._m0[161].w;
    bool _855 = isnan(_741);
    bool _857 = _853 || _855;
    bool _859 = isnan((*spvDescriptorSet0.vp_c9)._m0[161].w);
    bool _861 = _857 || _859;
    float _863 = float(_861);
    float _865 = fma((*spvDescriptorSet0.vp_c10)._m0[6].x, (*spvDescriptorSet0.vp_c10)._m0[6].x, _833);
    bool _867 = _741 >= (*spvDescriptorSet0.vp_c9)._m0[159].w;
    bool _869 = isnan(_741);
    bool _871 = _867 || _869;
    bool _873 = isnan((*spvDescriptorSet0.vp_c9)._m0[159].w);
    bool _875 = _871 || _873;
    float _877 = float(_875);
    float _879 = 1.0 / _841;
    int _881 = as_type<int>(_839) + (-2);
    float _883 = trunc(_851);
    int _885 = int(_883);
    float _887 = float(uint(_849));
    float _889 = float(_849);
    float _891 = as_type<float>(_881) * _887;
    int _893 = as_type<int>(_879) + (-2);
    float _895 = 1.0 / _747;
    float _897 = float(uint(_885));
    float _899 = trunc(_891);
    float _901 = precise::max(_899, 0.0);
    uint _904 = uint(_901);
    float _906 = as_type<float>(_893) * _897;
    float _908 = in.m_58.x;
    float _910 = in.m_58.y;
    float _912 = in.m_58.z;
    float _914 = in.m_58.w;
    float _916 = trunc(_906);
    float _918 = precise::max(_916, 0.0);
    uint _920 = uint(_918);
    float _922 = _895 * _147;
    int _924 = _823 * int(_904);
    int _926 = _924 + _849;
    float _928 = 1.0 / _765;
    float _930 = float(uint(_926));
    float _932 = as_type<float>(_926);
    float _934 = _799;
    if (_753)
    {
        _932 = 1.0;
    }
    float _936 = _932;
    int _938 = _845 * int(_920);
    int _940 = _938 + _885;
    float _942 = _936;
    float _944 = as_type<float>(_940);
    if (!_753)
    {
        _942 = 1.2345600128173828125;
    }
    float _946 = _942;
    float _948 = as_type<float>(_881) * _930;
    float _950 = 1.0 / _769;
    float _952 = float(uint(_940));
    float _954 = _946 * _793;
    if (_753)
    {
        _944 = 1.0;
    }
    float _956 = _944;
    float _958 = _908 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _960 = _956;
    float _962 = _958;
    if (!_753)
    {
        _960 = 7.345489978790283203125;
    }
    float _964 = _960;
    float _966 = as_type<float>(_893) * _952;
    float _968 = trunc(_948);
    float _970 = precise::max(_968, 0.0);
    uint _972 = uint(_970);
    int _974 = ~_773;
    int _976 = _974 + 1;
    float _978 = _964 * _908;
    float _980 = trunc(_966);
    float _982 = precise::max(_980, 0.0);
    uint _984 = uint(_982);
    float _986 = floor(_978);
    int _988 = int(_904) + int(_972);
    int _990 = ~_813;
    int _992 = _990 + 1;
    float _994 = floor(_954);
    int _996 = _976 * _988;
    int _998 = _996 + _849;
    int _1000 = int(_920) + int(_984);
    float _1002 = float(_773);
    bool _1004 = uint(_998) >= uint(_773);
    float _1006 = -_986;
    float _1008 = _978 + _1006;
    bool _1010 = _889 >= _1002;
    bool _1012 = isnan(_889);
    bool _1014 = _1010 || _1012;
    bool _1016 = isnan(_1002);
    bool _1018 = _1014 || _1016;
    float _1020 = float(_1018);
    int _1022 = _992 * _1000;
    int _1024 = _1022 + _885;
    bool _1026 = !_1004;
    int _1028 = _1026 ? 0 : (-1);
    float _1030 = 1.0 / _787;
    int _1032 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _1034 = _1032 != 0;
    float _1036 = -_994;
    float _1038 = _954 + _1036;
    bool _1040 = uint(_1024) >= uint(_813);
    float _1042 = _1008 * _1002;
    int _1044 = ~_988;
    int _1046 = _1044 + _1028;
    int _1048 = _1046 + 1;
    float _1050 = _1002 * _922;
    float _1052 = trunc(_1020);
    int _1054 = int(_1052);
    float _1056 = float(_813);
    float _1058 = float(_885);
    int _1060 = _773 * _1048;
    int _1062 = _1060 + _849;
    bool _1064 = !_1034;
    int _1066 = _1064 ? 0 : 1;
    float _1068 = trunc(_1050);
    int _1070 = int(_1068);
    bool _1072 = _1058 >= _1056;
    bool _1074 = isnan(_1058);
    bool _1076 = _1072 || _1074;
    bool _1078 = isnan(_1056);
    bool _1080 = _1076 || _1078;
    float _1082 = float(_1080);
    float _1084 = _1056 * _922;
    bool _1086 = !_1040;
    int _1088 = _1086 ? 0 : (-1);
    float _1090 = _1038 * _1056;
    int _1092 = abs(_1066);
    bool _1094 = !_827;
    int _1096 = _1094 ? _1062 : (-1);
    float _1098 = trunc(_1082);
    int _1100 = int(_1098);
    int _1102 = ~_1054;
    int _1104 = _1102 + 1;
    int _1106 = _1104 + 1;
    int _1108 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _1110 = _1108 != 0;
    int _1112 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _1114 = _1112 != 0;
    int _1116 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _1118 = _1116 != 0;
    int _1120 = ~_1000;
    int _1122 = _1120 + _1088;
    int _1124 = _1122 + 1;
    int _1126 = _1096 * _1106;
    bool _1128 = _813 == 0;
    float _1130 = trunc(_1042);
    int _1132 = int(_1130);
    bool _1134 = !_1114;
    int _1136 = _1134 ? 0 : 1;
    int _1138 = _813 * _1124;
    int _1140 = _1138 + _885;
    int _1142 = _773 + (-1);
    int _1144 = abs(_1136);
    bool _1146 = !_1128;
    int _1148 = _1146 ? _1140 : (-1);
    int _1150 = _1054 * _1142;
    int _1152 = _1150 + _1126;
    int _1154 = ~_1100;
    int _1156 = _1154 + 1;
    int _1158 = _1156 + 1;
    float _1160 = trunc(_1090);
    int _1162 = int(_1160);
    int _1164 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8192;
    bool _1166 = _1164 != 0;
    int _1168 = _1152 * _1144;
    int _1170 = _813 + (-1);
    int _1172 = _1148 * _1158;
    bool _1174 = !_1110;
    int _1176 = _1174 ? 0 : 1;
    int _1178 = _1132 * _1092;
    int _1180 = _1178 + _849;
    bool _1182 = !_1166;
    int _1184 = _1182 ? 0 : 1;
    int _1186 = _1100 * _1170;
    int _1188 = _1186 + _1172;
    int _1190 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _1192 = _1190 != 0;
    float _1194 = trunc(_1084);
    int _1196 = int(_1194);
    int _1198 = abs(_1176);
    bool _1200 = !_1118;
    int _1202 = _1200 ? 0 : 1;
    int _1204 = abs(_1184);
    int _1206 = _1070 * _1198;
    int _1208 = _1206 + _1168;
    bool _1210 = !_1192;
    int _1212 = _1210 ? 0 : 1;
    float _1214 = 1.0 / _805;
    int _1216 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 256;
    bool _1218 = _1216 != 0;
    int _1220 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 512;
    bool _1222 = _1220 != 0;
    int _1224 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1024;
    bool _1226 = _1224 != 0;
    int _1228 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2048;
    bool _1230 = _1228 != 0;
    int _1232 = _1162 * _1204;
    int _1234 = _1232 + _885;
    int _1236 = abs(_1202);
    int _1238 = abs(_1212);
    bool _1240 = !_1222;
    int _1242 = _1240 ? 0 : 1;
    float _1244 = 1.0 / _809;
    bool _1246 = !_1218;
    int _1248 = _1246 ? 0 : 1;
    int _1250 = abs(_1242);
    int _1252 = _1180 * _1236;
    int _1254 = _1252 + _1208;
    float _1256 = 1.0 / _819;
    int _1258 = abs(_1248);
    int _1260 = _1132 * _1238;
    int _1262 = _1260 + _1254;
    bool _1264 = !_1226;
    int _1266 = _1264 ? 0 : 1;
    bool _1268 = !_1230;
    int _1270 = _1268 ? 0 : 1;
    int _1272 = _1188 * _1250;
    int _1274 = abs(_1266);
    float _1276 = _837 * _1244;
    float _1278 = float(uint(_1262));
    float _1280 = sqrt(_865);
    int _1282 = abs(_1270);
    float _1284 = as_type<float>(_881) * _1278;
    int _1286 = _1196 * _1258;
    int _1288 = _1286 + _1272;
    float _1290 = trunc(_1284);
    float _1292 = precise::max(_1290, 0.0);
    uint _1294 = uint(_1292);
    float _1296 = float(uint(_1180));
    int _1298 = _1234 * _1274;
    int _1300 = _1298 + _1288;
    float _1302 = float(uint(_1234));
    int _1304 = ~_773;
    int _1306 = _1304 + 1;
    int _1308 = _1162 * _1282;
    int _1310 = _1308 + _1300;
    int _1312 = ~_773;
    int _1314 = _1312 + 1;
    float _1316 = as_type<float>(_881) * _1296;
    int _1318 = ~_813;
    int _1320 = _1318 + 1;
    float _1322 = as_type<float>(_893) * _1302;
    float _1324 = float(uint(_1310));
    int _1326 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _1328 = _1326 != 0;
    bool _1330 = _773 == 0;
    float _1332 = as_type<float>(_893) * _1324;
    int _1334 = _1314 * int(_1294);
    int _1336 = _1334 + _1262;
    bool _1338 = _813 == 0;
    float _1340 = trunc(_1316);
    float _1342 = precise::max(_1340, 0.0);
    uint _1344 = uint(_1342);
    float _1346 = float(uint(_1336));
    if (_1328)
    {
        _779 = 0;
    }
    int _1348 = _779;
    float _1350 = trunc(_1332);
    float _1352 = precise::max(_1350, 0.0);
    uint _1354 = uint(_1352);
    float _1356 = as_type<float>(_881) * _1346;
    int _1358 = _1348;
    if (!_1328)
    {
        _1358 = 1;
    }
    int _1360 = _1358;
    float _1362 = trunc(_1356);
    float _1364 = precise::max(_1362, 0.0);
    uint _1366 = uint(_1364);
    int _1368 = ~_773;
    int _1370 = _1368 + 1;
    int _1372 = _1320 * int(_1354);
    int _1374 = _1372 + _1310;
    float _1376 = trunc(_1322);
    float _1378 = precise::max(_1376, 0.0);
    uint _1380 = uint(_1378);
    float _1382 = float(uint(_1374));
    int _1384 = _1306 * int(_1344);
    int _1386 = _1384 + _1180;
    int _1388 = ~_813;
    int _1390 = _1388 + 1;
    int _1392 = int(_1294) + int(_1366);
    float _1394 = as_type<float>(_893) * _1382;
    float _1396 = float(uint(_1386));
    float _1398 = trunc(_1394);
    float _1400 = precise::max(_1398, 0.0);
    uint _1402 = uint(_1400);
    int _1404 = ~_813;
    int _1406 = _1404 + 1;
    int _1408 = _1370 * _1392;
    int _1410 = _1408 + _1262;
    float _1412 = as_type<float>(_881) * _1396;
    bool _1414 = uint(_1410) >= uint(_773);
    int _1416 = _1390 * int(_1380);
    int _1418 = _1416 + _1234;
    bool _1420 = !_1414;
    int _1422 = _1420 ? 0 : (-1);
    float _1424 = trunc(_1412);
    float _1426 = precise::max(_1424, 0.0);
    uint _1428 = uint(_1426);
    int _1430 = ~_1392;
    int _1432 = _1430 + _1422;
    int _1434 = _1432 + 1;
    int _1436 = int(_1354) + int(_1402);
    int _1438 = _773 * _1434;
    int _1440 = _1438 + _1262;
    float _1442 = float(uint(_1418));
    int _1444 = _1406 * _1436;
    int _1446 = _1444 + _1310;
    bool _1448 = !_1330;
    int _1450 = _1448 ? _1440 : (-1);
    float _1452 = as_type<float>(_893) * _1442;
    int _1454 = ~_773;
    int _1456 = _1454 + 1;
    bool _1458 = uint(_1446) >= uint(_813);
    int _1460 = _1450 & 3;
    bool _1462 = _1460 != 0;
    int _1464 = _1450 & 3;
    bool _1466 = _1464 != 0;
    bool _1468 = _1460 != 3;
    bool _1470 = !_1458;
    int _1472 = _1470 ? 0 : (-1);
    int _1474 = int(_1344) + int(_1428);
    int _1476 = _1466 ? 0 : 1;
    float _1478 = trunc(_1452);
    float _1480 = precise::max(_1478, 0.0);
    uint _1482 = uint(_1480);
    bool _1484 = uint(_1460) > 1u;
    bool _1486 = uint(_1460) >= 2u;
    int _1488 = ~_1436;
    int _1490 = _1488 + _1472;
    int _1492 = _1490 + 1;
    bool _1494 = _1360 != 1;
    int _1496 = _1456 * _1474;
    int _1498 = _1496 + _1180;
    int _1500 = _1486 ? 0 : 1;
    int _1502 = _813 * _1492;
    int _1504 = _1502 + _1310;
    int _1506 = ~_1476;
    int _1508 = _1506 + 1;
    int _1510 = _1508 + 1;
    float _1512 = _908 * 2.0;
    int _1514 = ~_1500;
    int _1516 = _1514 + 1;
    int _1518 = _1516 + 1;
    bool _1520 = uint(_1498) >= uint(_773);
    float _1522 = _910 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    int _1524 = _1518;
    int _1526 = _1510;
    if (_1468)
    {
        int _1528 = ~_1500;
        int _1530 = _1528 + 1;
        _1524 = _1530;
    }
    int _1532 = _1524;
    float _1534 = floor(_1512);
    int _1536 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _1538 = _1536 != 0;
    float _1540 = -_801;
    float _1542 = fma(_958, 2.0, _1540);
    bool _1544 = !_1338;
    int _1546 = _1544 ? _1504 : (-1);
    if (!_1484)
    {
        int _1548 = ~_1476;
        int _1550 = _1548 + 1;
        _1526 = _1550;
    }
    int _1552 = _1526;
    bool _1554 = !_1520;
    int _1556 = _1554 ? 0 : (-1);
    float _1558 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _1560 = log2(_1558);
    bool _1562 = !_1538;
    int _1564 = _1562 ? 0 : 1;
    int _1566 = _1546 & 3;
    bool _1568 = _1566 != 0;
    int _1570 = _1546 & 3;
    bool _1572 = _1570 != 0;
    int _1574 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4194304;
    bool _1576 = _1574 != 0;
    int _1578 = _1568 ? 0 : 1;
    bool _1580 = uint(_1570) > 1u;
    bool _1582 = !_1576;
    int _1584 = _1582 ? 0 : 1;
    int _1586 = int(_1380) + int(_1482);
    float _1588 = fma(_1522, -2.0, _799);
    bool _1590 = uint(_1570) >= 2u;
    float _1592 = _1560 * _147;
    int _1594 = ~_813;
    int _1596 = _1594 + 1;
    float _1598 = fma(_147, (*spvDescriptorSet0.vp_c9)._m0[76].y, _1588);
    int _1600 = _1590 ? 0 : 1;
    bool _1602 = _1570 != 3;
    int _1604 = _1596 * _1586;
    int _1606 = _1604 + _1234;
    int _1608 = ~_1578;
    int _1610 = _1608 + 1;
    int _1612 = _1610 + 1;
    int _1614 = _1612;
    float _1616 = _1592;
    if (!_1580)
    {
        int _1618 = ~_1578;
        int _1620 = _1618 + 1;
        _1614 = _1620;
    }
    int _1622 = _1614;
    bool _1624 = uint(_1606) >= uint(_813);
    float _1626 = exp2(_1592);
    int _1628 = ~_1600;
    int _1630 = _1628 + 1;
    int _1632 = _1630 + 1;
    int _1634 = _1632;
    float _1636 = (*spvDescriptorSet0.vp_c9)._m0[83].z;
    if (_1602)
    {
        int _1638 = ~_1600;
        int _1640 = _1638 + 1;
        _1634 = _1640;
    }
    int _1642 = _1634;
    if (!_1494)
    {
        _962 = _910;
    }
    float _1644 = _962;
    bool _1646 = !_1624;
    int _1648 = _1646 ? 0 : (-1);
    float _1650 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    bool _1652 = _1534 > 0.0;
    bool _1654 = _1534 >= 0.0;
    bool _1656 = isnan(_1534);
    bool _1658 = _1654 || _1656;
    bool _1660 = isnan(0.0);
    bool _1662 = _1658 || _1660;
    float _1664 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _1666 = _1644;
    if (_1494)
    {
        _1666 = _908;
    }
    float _1668 = _1666;
    float _1670 = -_1626;
    float _1672 = _1670 + 1.0;
    if (!_1494)
    {
        _934 = _912;
    }
    float _1674 = _934;
    float _1676 = _1674;
    if (_1494)
    {
        _1676 = _910;
    }
    float _1678 = _1676;
    float _1680 = fma(_1668, (*spvDescriptorSet0.vp_c9)._m0[83].z, _1664);
    if (!_1494)
    {
        _1616 = _912;
    }
    float _1682 = _1616;
    float _1684 = _1682;
    if (_1494)
    {
        _1684 = _910;
    }
    float _1686 = _1684;
    float _1688 = fma(_1678, (*spvDescriptorSet0.vp_c9)._m0[83].w, _1650);
    if (!_1494)
    {
        _1636 = _910;
    }
    float _1690 = _1636;
    float _1692 = _1686 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _1694 = _1690;
    if (_1494)
    {
        _1694 = _908;
    }
    float _1696 = _1694;
    float _1698 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    bool _1700 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1702 = isnan(0.0);
    bool _1704 = _1700 || _1702;
    bool _1706 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1708 = _1704 || _1706;
    float _1710 = _1696 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _1712 = _1708 ? _1672 : 0.0;
    bool _1714 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1716 = isnan(1.0);
    bool _1718 = _1714 || _1716;
    bool _1720 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1722 = _1718 || _1720;
    float _1724 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _1726 = 1.0 + _1724;
    float _1728 = fma(_1692, -2.0, _1698);
    float _1730 = _910 * 2.0;
    float _1732 = 1.0 / _1726;
    int _1734 = ~_1586;
    int _1736 = _1734 + _1648;
    int _1738 = _1736 + 1;
    float _1740 = _912 * 2.0;
    float _1742 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _1744 = fma(_147, (*spvDescriptorSet0.vp_c9)._m0[81].y, _1728);
    int _1746 = ~_1474;
    int _1748 = _1746 + _1556;
    int _1750 = _1748 + 1;
    float _1752 = floor(_1730);
    float _1754 = -_1742;
    float _1756 = fma(_1710, 2.0, _1754);
    float _1758 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _1760 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    int _1762 = _773 * _1750;
    int _1764 = _1762 + _1180;
    float _1766 = -_147;
    float _1768 = fma(_1766, (*spvDescriptorSet0.vp_c9)._m0[76].x, _1542);
    float _1770 = fma(_908, (*spvDescriptorSet0.vp_c9)._m0[78].z, _1758);
    float _1772 = fma(_910, (*spvDescriptorSet0.vp_c9)._m0[78].w, _1760);
    float _1774 = floor(_1740);
    int _1776 = _1662 ? 0 : 1;
    float _1778 = fma(_147, (*spvDescriptorSet0.vp_c9)._m0[77].z, _1770);
    float _1780 = fma(_147, (*spvDescriptorSet0.vp_c9)._m0[77].w, _1772);
    float _1782 = fma(_147, (*spvDescriptorSet0.vp_c9)._m0[82].z, _1680);
    float _1784 = fma(_147, (*spvDescriptorSet0.vp_c9)._m0[82].w, _1688);
    float _1786 = -_147;
    float _1788 = fma(_1786, (*spvDescriptorSet0.vp_c9)._m0[81].x, _1756);
    if (_1722)
    {
        float _1790 = _1712 * _1732;
        _151 = _1790;
    }
    float _1792 = _151;
    int _1794 = _813 * _1738;
    int _1796 = _1794 + _1234;
    int _1798 = ~_1776;
    int _1800 = _1798 + 1;
    int _1802 = _1800 + 1;
    bool _1804 = !_1330;
    int _1806 = _1804 ? _1764 : (-1);
    bool _1808 = _1752 >= 0.0;
    bool _1810 = isnan(_1752);
    bool _1812 = _1808 || _1810;
    bool _1814 = isnan(0.0);
    bool _1816 = _1812 || _1814;
    int _1818 = _1802;
    if (!_1652)
    {
        int _1820 = ~_1776;
        int _1822 = _1820 + 1;
        _1818 = _1822;
    }
    int _1824 = _1818;
    bool _1826 = _914 > 0.5;
    bool _1828 = _1752 > 0.0;
    bool _1830 = _1460 != 3;
    int _1832 = _1816 ? 0 : 1;
    float _1834 = in.m_64.x;
    float _1836 = in.m_64.y;
    float _1838 = in.m_64.z;
    bool _1840 = !_1338;
    int _1842 = _1840 ? _1796 : (-1);
    bool _1844 = !_1572;
    int _1846 = _1844 ? 0 : 1;
    float _1848 = in.m_66.x;
    float _1850 = in.m_66.y;
    float _1852 = in.m_66.z;
    bool _1854 = !_1462;
    int _1856 = _1854 ? 0 : 1;
    int _1858 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _1860 = _1858 != 0;
    int _1862 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _1864 = _1862 != 0;
    int _1866 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _1868 = _1866 != 0;
    bool _1870 = !_1830;
    int _1872 = _1870 ? 0 : (-1);
    float _1874 = in.m_68.x;
    float _1876 = in.m_68.y;
    float _1878 = in.m_68.z;
    bool _1880 = _1774 > 0.0;
    bool _1882 = _1774 >= 0.0;
    bool _1884 = isnan(_1774);
    bool _1886 = _1882 || _1884;
    bool _1888 = isnan(0.0);
    bool _1890 = _1886 || _1888;
    float _1892 = in.m_48.x;
    float _1894 = in.m_48.y;
    float _1896 = in.m_48.z;
    int _1898 = ~_1832;
    int _1900 = _1898 + 1;
    int _1902 = _1900 + 1;
    int _1904 = _1902;
    if (!_1828)
    {
        int _1906 = ~_1832;
        int _1908 = _1906 + 1;
        _1904 = _1908;
    }
    int _1910 = _1904;
    bool _1912 = _1570 != 3;
    int _1914 = _1890 ? 0 : 1;
    int _1916 = ~_1914;
    int _1918 = _1916 + 1;
    int _1920 = _1918 + 1;
    int _1922 = _1920;
    if (!_1880)
    {
        int _1924 = ~_1914;
        int _1926 = _1924 + 1;
        _1922 = _1926;
    }
    int _1928 = _1922;
    float _1930 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _183);
    int _1932 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y);
    bool _1934 = _1932 != 0;
    float _1936 = -(*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _1938 = _1936 + (*spvDescriptorSet0.vp_c9)._m0[164].w;
    bool _1940 = !_1860;
    int _1942 = _1940 ? 0 : 1;
    bool _1944 = _908 > 0.5;
    float _1946 = _1894 * _1876;
    float _1948 = _1894 * _1836;
    float _1950 = _1894 * _1850;
    float _1952 = _749 * _1930;
    float _1954 = _491 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1956 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _187);
    float _1958 = 1.0 / _1938;
    float _1960 = fma(_1892, _1834, _1948);
    float _1962 = _1954 * _1956;
    float _1964 = -(*spvDescriptorSet0.vp_c9)._m0[159].x;
    float _1966 = (*spvDescriptorSet0.vp_c9)._m0[160].x + _1964;
    float _1968 = -(*spvDescriptorSet0.vp_c9)._m0[160].x;
    float _1970 = _1968 + (*spvDescriptorSet0.vp_c9)._m0[161].x;
    float _1972 = -(*spvDescriptorSet0.vp_c9)._m0[161].x;
    float _1974 = (*spvDescriptorSet0.vp_c9)._m0[162].x + _1972;
    float _1976 = -(*spvDescriptorSet0.vp_c9)._m0[162].x;
    float _1978 = _1976 + (*spvDescriptorSet0.vp_c9)._m0[163].x;
    float _1980 = _1966 * _928;
    float _1982 = _1970 * _950;
    float _1984 = _1978 * _1030;
    float _1986 = _908 + _910;
    float _1988 = _1974 * _1256;
    float _1990 = -(*spvDescriptorSet0.vp_c9)._m0[163].x;
    float _1992 = (*spvDescriptorSet0.vp_c9)._m0[164].x + _1990;
    float _1994 = -(*spvDescriptorSet0.vp_c9)._m0[164].x;
    float _1996 = _1994 + (*spvDescriptorSet0.vp_c9)._m0[165].x;
    float _1998 = _1986 + (-1.0);
    bool _2000 = _741 >= (*spvDescriptorSet0.vp_c9)._m0[165].w;
    bool _2002 = isnan(_741);
    bool _2004 = _2000 || _2002;
    bool _2006 = isnan((*spvDescriptorSet0.vp_c9)._m0[165].w);
    bool _2008 = _2004 || _2006;
    float _2010 = float(_2008);
    float _2012 = _1992 * _1958;
    float _2014 = _1996 * _1214;
    float _2016 = _912 + _908;
    float _2018 = _912 + _910;
    float _2020 = fma(_1998, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _2022 = _2016 + (-1.0);
    float _2024 = _2018 + (-1.0);
    float _2026 = -_2010;
    float _2028 = _2026 + 1.0;
    int _2030 = abs(_1942);
    float _2032 = fma(_2022, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _2034 = fma(_2024, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    bool _2036 = _741 >= (*spvDescriptorSet0.vp_c9)._m0[164].w;
    bool _2038 = isnan(_741);
    bool _2040 = _2036 || _2038;
    bool _2042 = isnan((*spvDescriptorSet0.vp_c9)._m0[164].w);
    bool _2044 = _2040 || _2042;
    float _2046 = float(_2044);
    float _2048 = -(*spvDescriptorSet0.vp_c9)._m0[159].w;
    float _2050 = _741 + _2048;
    bool _2052 = _741 >= (*spvDescriptorSet0.vp_c9)._m0[163].w;
    bool _2054 = isnan(_741);
    bool _2056 = _2052 || _2054;
    bool _2058 = isnan((*spvDescriptorSet0.vp_c9)._m0[163].w);
    bool _2060 = _2056 || _2058;
    float _2062 = float(_2060);
    float _2064 = fma(_1892, _1874, _1946);
    float _2066 = fma(_1892, _1848, _1950);
    float _2068 = _2046 * _2028;
    float _2070 = -_2046;
    float _2072 = _2070 + 1.0;
    float _2074 = fma(_1980, _2050, (*spvDescriptorSet0.vp_c9)._m0[159].x);
    float _2076 = -(*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _2078 = _741 + _2076;
    bool _2080 = _741 >= (*spvDescriptorSet0.vp_c9)._m0[162].w;
    bool _2082 = isnan(_741);
    bool _2084 = _2080 || _2082;
    bool _2086 = isnan((*spvDescriptorSet0.vp_c9)._m0[162].w);
    bool _2088 = _2084 || _2086;
    float _2090 = float(_2088);
    float _2092 = -_2062;
    float _2094 = _2092 + 1.0;
    float _2096 = _2062 * _2072;
    float _2098 = fma(_1982, _2078, (*spvDescriptorSet0.vp_c9)._m0[160].x);
    bool _2100 = _741 >= (*spvDescriptorSet0.vp_c9)._m0[160].w;
    bool _2102 = isnan(_741);
    bool _2104 = _2100 || _2102;
    bool _2106 = isnan((*spvDescriptorSet0.vp_c9)._m0[160].w);
    bool _2108 = _2104 || _2106;
    float _2110 = float(_2108);
    float _2112 = _2090 * _2094;
    float _2114 = -_2090;
    float _2116 = _2114 + 1.0;
    int _2118 = _1450 >> 31;
    float _2120 = in.m_70.x;
    float _2122 = in.m_70.y;
    float _2124 = in.m_70.z;
    float _2126 = -_2110;
    float _2128 = _2126 + 1.0;
    float _2130 = _863 * _2116;
    float _2132 = -_863;
    float _2134 = _2132 + 1.0;
    float _2136 = -(*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _2138 = _741 + _2136;
    int _2140 = _2118 & 3;
    float _2142 = fma(_1896, _1838, _1960);
    float _2144 = _2110 * _2134;
    float _2146 = float(_2030);
    float _2148 = fma(_1984, _2138, (*spvDescriptorSet0.vp_c9)._m0[162].x);
    float _2150 = float(_1928);
    float _2152 = fma(_1988, _757, (*spvDescriptorSet0.vp_c9)._m0[161].x);
    bool _2154 = !_1864;
    int _2156 = _2154 ? 0 : 1;
    float _2158 = _877 * _2128;
    float _2160 = _908 + (-0.5);
    float _2162 = _2146 * _2150;
    int _2164 = abs(_2156);
    float _2166 = _2074 * _2158;
    float _2168 = -_877;
    float _2170 = _2168 + 1.0;
    float _2172 = _2162 * (-2.0);
    float _2174 = float(_1824);
    float _2176 = _2142 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    bool _2178 = !_1868;
    int _2180 = _2178 ? 0 : 1;
    float _2182 = fma(_2020, _2172, _2020);
    float _2184 = fma(_2172, _2120, _2120);
    float _2186 = float(_2164);
    float _2188 = fma(_2170, (*spvDescriptorSet0.vp_c9)._m0[159].x, _2166);
    int _2190 = abs(_2180);
    float _2192 = fma(_2160, (*spvDescriptorSet0.vp_c9)._m0[196].x, _2184);
    bool _2194 = _910 > 0.5;
    float _2196 = _2186 * _2174;
    float _2198 = _910 + (-0.5);
    float _2200 = fma(_2182, _1792, _2192);
    float _2202 = float(_1910);
    float _2204 = _2196 * (-2.0);
    float _2206 = float(_2190);
    float _2208 = _2200 * 0.15915493667125701904296875;
    float _2210 = fma(_2098, _2144, _2188);
    float _2212 = fma(_2204, _2122, _2122);
    float _2214 = fma(_2034, _2204, _2034);
    float _2216 = _2206 * _2202;
    float _2218 = -(*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _2220 = _741 + _2218;
    float _2222 = fma(_2198, (*spvDescriptorSet0.vp_c9)._m0[196].y, _2212);
    float _2224 = fma(_2152, _2130, _2210);
    float _2226 = _2208 * 6.283185482025146484375;
    float _2228 = sin(_2226);
    float _2230 = fma(_2012, _2220, (*spvDescriptorSet0.vp_c9)._m0[163].x);
    float _2232 = fma(_2214, _1792, _2222);
    float _2234 = _2216 * (-2.0);
    float _2236 = _912 + (-0.5);
    float _2238 = fma(_2148, _2112, _2224);
    float _2240 = _2232 * 0.15915493667125701904296875;
    float _2242 = fma(_2234, _2124, _2124);
    float _2244 = fma(_2032, _2234, _2032);
    float _2246 = fma(_2230, _2096, _2238);
    float _2248 = -(*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _2250 = _741 + _2248;
    float _2252 = fma(_2236, (*spvDescriptorSet0.vp_c9)._m0[196].z, _2242);
    bool _2254 = _741 >= (*spvDescriptorSet0.vp_c9)._m0[166].w;
    bool _2256 = isnan(_741);
    bool _2258 = _2254 || _2256;
    bool _2260 = isnan((*spvDescriptorSet0.vp_c9)._m0[166].w);
    bool _2262 = _2258 || _2260;
    float _2264 = float(_2262);
    float _2266 = -(*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _2268 = _741 + _2266;
    float _2270 = _2240 * 6.283185482025146484375;
    float _2272 = sin(_2270);
    float _2274 = fma(_2244, _1792, _2252);
    float _2276 = fma(_2014, _2250, (*spvDescriptorSet0.vp_c9)._m0[164].x);
    float _2278 = -_2264;
    float _2280 = _2278 + 1.0;
    float _2282 = fma(_1896, _1878, _2064);
    float _2284 = _2274 * 0.15915493667125701904296875;
    int _2286 = _1546 >> 31;
    float _2288 = _2010 * _2280;
    float _2290 = _2240 * 6.283185482025146484375;
    float _2292 = cos(_2290);
    float _2294 = fma(_1276, _2268, (*spvDescriptorSet0.vp_c9)._m0[165].x);
    float _2296 = fma(_2276, _2068, _2246);
    int _2298 = _2286 & 3;
    float _2300 = _1280 * 50.0;
    int _2302 = _1450 + _2140;
    float _2304 = fma(_2294, _2288, _2296);
    float _2306 = fma(_1896, _1852, _2066);
    float _2308 = _2284 * 6.283185482025146484375;
    float _2310 = cos(_2308);
    int _2312 = _1546 + _2298;
    float _2314 = _2228 * _2272;
    float _2316 = fma(_2264, (*spvDescriptorSet0.vp_c9)._m0[166].x, _2304);
    int _2318 = abs(_1856);
    int _2320 = _2312 >> 2;
    float _2322 = _2316 * _2300;
    float _2324 = _2208 * 6.283185482025146484375;
    float _2326 = cos(_2324);
    int _2328 = abs(_1846);
    int _2330 = _2320 << 4;
    int _2332 = _2330 + 512;
    float _2334 = _2322 * _2322;
    int _2336 = abs(_1532);
    bool _2338 = !_1912;
    int _2340 = _2338 ? 0 : (-1);
    float _2342 = _2284 * 6.283185482025146484375;
    float _2344 = sin(_2342);
    float _2346 = _2228 * _2292;
    float _2348 = _2228 * _2310;
    int _2350 = _2302 >> 2;
    float _2352 = _2272 * _2310;
    float _2354 = _2292 * _2310;
    float _2356 = _2348 * _1962;
    int _2358 = _2350 << 4;
    int _2360 = _2358 + 368;
    float _2362 = _2326 * _2292;
    float _2364 = _2326 * _2272;
    float _2366 = _2326 * _2310;
    float _2368 = rsqrt(_2334);
    uint _2370 = uint(int(uint(_2360) >> uint(2)));
    uint _2372 = uint(int(uint(int(_2370)) >> uint(2)));
    int _2374 = int(_2370) & 3;
    float _2376 = (*spvDescriptorSet0.vp_c9)._m0[int(_2372)][_2374];
    int _2378 = int(_2370) + 1;
    uint _2380 = uint(int(uint(_2378) >> uint(2)));
    int _2382 = _2378 & 3;
    float _2384 = (*spvDescriptorSet0.vp_c9)._m0[int(_2380)][_2382];
    int _2386 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _2388 = _2386 != 0;
    float _2390 = _2366 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2392 = _2366 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2394 = -_2364;
    float _2396 = fma(_2344, _2346, _2394);
    float _2398 = -_2346;
    float _2400 = fma(_2344, _2364, _2398);
    float _2402 = _2366 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2404 = fma(_2344, _2362, _2314);
    float _2406 = fma(_2344, _2314, _2362);
    float _2408 = -_1962;
    float _2410 = _2344 * _2408;
    uint _2412 = uint(int(uint(_2332) >> uint(2)));
    uint _2414 = uint(int(uint(int(_2412)) >> uint(2)));
    int _2416 = int(_2412) & 3;
    float _2418 = (*spvDescriptorSet0.vp_c9)._m0[int(_2414)][_2416];
    int _2420 = int(_2412) + 1;
    uint _2422 = uint(int(uint(_2420) >> uint(2)));
    int _2424 = _2420 & 3;
    float _2426 = (*spvDescriptorSet0.vp_c9)._m0[int(_2422)][_2424];
    float _2428 = _2366 * _1962;
    float _2430 = -_2344;
    float _2432 = fma(_2430, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2402);
    float _2434 = -_2344;
    float _2436 = fma(_2434, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2390);
    float _2438 = -_2344;
    float _2440 = fma(_2438, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2392);
    float _2442 = fma(_2354, _1952, _2410);
    float _2444 = fma(_2348, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2432);
    float _2446 = fma(_2348, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2436);
    int _2448 = _2360 + 8;
    uint _2450 = uint(int(uint(_2448) >> uint(2)));
    uint _2452 = uint(int(uint(int(_2450)) >> uint(2)));
    int _2454 = int(_2450) & 3;
    float _2456 = (*spvDescriptorSet0.vp_c9)._m0[int(_2452)][_2454];
    int _2458 = int(_2450) + 1;
    uint _2460 = uint(int(uint(_2458) >> uint(2)));
    int _2462 = _2458 & 3;
    float _2464 = (*spvDescriptorSet0.vp_c9)._m0[int(_2460)][_2462];
    float _2466 = fma(_2348, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2440);
    float _2468 = _2404 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2470 = _2404 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2472 = _2404 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2474 = fma(_2404, _1952, _2428);
    float _2476 = fma(_2396, _1952, _2356);
    float _2478 = fma(_2354, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2468);
    float _2480 = fma(_2354, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2470);
    float _2482 = fma(_2354, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2472);
    float _2484 = 0.5 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    int _2486 = _2332 + 8;
    uint _2488 = uint(int(uint(_2486) >> uint(2)));
    uint _2490 = uint(int(uint(int(_2488)) >> uint(2)));
    int _2492 = int(_2488) & 3;
    float _2494 = (*spvDescriptorSet0.vp_c9)._m0[int(_2490)][_2492];
    int _2496 = int(_2488) + 1;
    uint _2498 = uint(int(uint(_2496) >> uint(2)));
    int _2500 = _2496 & 3;
    float _2502 = (*spvDescriptorSet0.vp_c9)._m0[int(_2498)][_2500];
    float _2504 = trunc((*spvDescriptorSet0.vp_c9)._m0[80].z);
    int _2506 = int(_2504);
    float _2508 = _2322 * _2368;
    float _2510 = fma(_2400, _2484, _2474);
    float _2512 = fma(_2352, _2484, _2442);
    float _2514 = fma(_2406, _2484, _2476);
    int _2516 = abs(_1552);
    float _2518 = _2510 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2520 = _2510 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2522 = _2510 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2524 = _2400 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2526 = fma(_2512, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2518);
    int _2528 = abs(_1622);
    float _2530 = _2400 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2532 = fma(_2512, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2520);
    int _2534 = ~_2528;
    int _2536 = _2534 + 1;
    int _2538 = _2536 + 1;
    float _2540 = fma(_2512, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2522);
    int _2542 = ~_2516;
    int _2544 = _2542 + 1;
    int _2546 = _2544 + 1;
    float _2548 = fma(_2514, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2532);
    float _2550 = fma(_2352, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2524);
    float _2552 = fma(_2352, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2530);
    int _2554 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _2556 = _2554 != 0;
    int _2558 = _2546 * as_type<int>(_2384);
    int _2560 = ~_2318;
    int _2562 = _2560 + 1;
    int _2564 = _2562 + 1;
    float _2566 = _2548 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    int _2568 = abs(_2506);
    int _2570 = _2564 * as_type<int>(_2376);
    int _2572 = _2570 + _2558;
    float _2574 = fma(_2514, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2526);
    int _2576 = ~_2336;
    int _2578 = _2576 + 1;
    int _2580 = _2578 + 1;
    int _2582 = _2538 * as_type<int>(_2426);
    int _2584 = ~_2328;
    int _2586 = _2584 + 1;
    int _2588 = _2586 + 1;
    float _2590 = trunc((*spvDescriptorSet0.vp_c9)._m0[85].z);
    int _2592 = int(_2590);
    float _2594 = float(uint(_2506));
    float _2596 = fma(_2514, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2540);
    int _2598 = _2580 * as_type<int>(_2456);
    int _2600 = _2598 + _2572;
    int _2602 = abs(_1642);
    int _2604 = _2588 * as_type<int>(_2418);
    int _2606 = _2604 + _2582;
    int _2608 = abs(_1872);
    int _2610 = abs(_2340);
    float _2612 = 1.0 / _2594;
    int _2614 = ~_2602;
    int _2616 = _2614 + 1;
    int _2618 = _2616 + 1;
    int _2620 = abs(_1564);
    int _2622 = _2618 * as_type<int>(_2494);
    int _2624 = _2622 + _2606;
    float _2626 = float(uint(_2592));
    int _2628 = ~_2610;
    int _2630 = _2628 + 1;
    int _2632 = _2630 + 1;
    int _2634 = ~_2608;
    int _2636 = _2634 + 1;
    int _2638 = _2636 + 1;
    float _2640 = float(uint(_2568));
    int _2642 = _2632 * as_type<int>(_2502);
    int _2644 = _2642 + _2624;
    float _2646 = _2574 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _2648 = _2566 * _2566;
    int _2650 = abs(_1584);
    float _2652 = _2596 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _2654 = _2282 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _2656 = fma(_2646, _2646, _2648);
    int _2658 = ~_2620;
    int _2660 = _2658 + 1;
    int _2662 = _2660 + 1;
    int _2664 = _2638 * as_type<int>(_2464);
    int _2666 = _2664 + _2600;
    float _2668 = 1.0 / _2626;
    float _2670 = fma(_2652, _2652, _2656);
    float _2672 = _2654 + _2646;
    int _2674 = _2666 * _2662;
    int _2676 = abs(_2592);
    float _2678 = _2306 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    int _2680 = ~_2592;
    int _2682 = _2680 + 1;
    int _2684 = _1806 * _2620;
    int _2686 = _2684 + _2674;
    float _2688 = 1.0 / _2640;
    float _2690 = float(uint(_2676));
    float _2692 = _2678 + _2652;
    float _2694 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _2696 = _2672 + _2694;
    int _2698 = abs(_2686);
    float _2700 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _2702 = _2692 + _2700;
    float _2704 = _2696 * _2696;
    float _2706 = rsqrt(_2670);
    int _2708 = ~_2650;
    int _2710 = _2708 + 1;
    int _2712 = _2710 + 1;
    float _2714 = _2702 * _2702;
    int _2716 = _2644 * _2712;
    float _2718 = _2704 + _2714;
    float _2720 = sqrt(_2334);
    int _2722 = _1842 * _2650;
    int _2724 = _2722 + _2716;
    int _2726 = as_type<int>(_2612) + (-2);
    float _2728 = _2400 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2730 = float(uint(_2686));
    int _2732 = as_type<int>(_2668) + (-2);
    float _2734 = 1.0 / _2690;
    float _2736 = float(uint(_2724));
    float _2738 = as_type<float>(_2726) * _2730;
    float _2740 = _2566 * _2706;
    float _2742 = fma(_2352, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2728);
    int _2744 = ~_2506;
    int _2746 = _2744 + 1;
    float _2748 = as_type<float>(_2732) * _2736;
    float _2750 = _2508 * _2740;
    float _2752 = trunc(_2738);
    float _2754 = precise::max(_2752, 0.0);
    uint _2756 = uint(_2754);
    int _2758 = abs(_2724);
    float _2760 = _2750 * _2720;
    int _2762 = as_type<int>(_2688) + (-2);
    float _2764 = fma(_2508, _2760, _2566);
    float _2766 = trunc(_2748);
    float _2768 = precise::max(_2766, 0.0);
    uint _2770 = uint(_2768);
    float _2772 = fma(_2406, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2550);
    float _2774 = float(uint(_2698));
    int _2776 = as_type<int>(_2734) + (-2);
    float _2778 = float(uint(_2758));
    float _2780 = sqrt(_2718);
    int _2782 = _2746 * int(_2756);
    int _2784 = _2782 + _2686;
    float _2786 = as_type<float>(_2762) * _2774;
    float _2788 = fma(_2406, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2552);
    float _2790 = as_type<float>(_2776) * _2778;
    float _2792 = fma(_2406, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2742);
    int _2794 = ~_2568;
    int _2796 = _2794 + 1;
    int _2798 = _2682 * int(_2770);
    int _2800 = _2798 + _2724;
    float _2802 = trunc(_2786);
    float _2804 = precise::max(_2802, 0.0);
    uint _2806 = uint(_2804);
    float _2808 = float(uint(_2784));
    float _2810 = -_187;
    int _2812 = _1826 ? as_type<int>(_2810) : as_type<int>(_187);
    float _2814 = float(uint(_2800));
    float _2816 = as_type<float>(_2726) * _2808;
    bool _2818 = _2780 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2820 = trunc(_2790);
    float _2822 = precise::max(_2820, 0.0);
    uint _2824 = uint(_2822);
    float _2826 = _2176 + _2764;
    int _2828 = ~_2676;
    int _2830 = _2828 + 1;
    float _2832 = as_type<float>(_2732) * _2814;
    bool _2834 = _912 > 0.5;
    float _2836 = trunc(_2816);
    float _2838 = precise::max(_2836, 0.0);
    uint _2840 = uint(_2838);
    float _2842 = _2508;
    float _2844 = as_type<float>(_2732);
    float _2846 = _2826;
    float _2848 = _2704;
    float _2850 = _2692;
    float _2852 = _2654;
    float _2854 = _2792;
    if (!_2818)
    {
        _2842 = _2672;
    }
    float _2856 = _2842;
    int _2858 = _2796 * int(_2806);
    int _2860 = _2858 + _2698;
    float _2862 = _2856;
    if (!_2818)
    {
        _2844 = _2714;
    }
    float _2864 = _2844;
    int _2866 = _2830 * int(_2824);
    int _2868 = _2866 + _2758;
    float _2870 = float(uint(_2860));
    float _2872 = float(uint(_2868));
    bool _2874 = !_2818;
    float _2876 = _2864;
    if (!_2874)
    {
        float _2878 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2880 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _2882 = _2780 + _2880;
        float _2884 = _2826 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2886 = rsqrt(_2718);
        float _2888 = _2882 * _2878;
        float _2890 = _2888 * 0.15915493667125701904296875;
        float _2892 = _2890 * 6.283185482025146484375;
        float _2894 = sin(_2892);
        float _2896 = _2890 * 6.283185482025146484375;
        float _2898 = cos(_2896);
        float _2900 = fma(_2894, _2884, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _2902 = _2886 * _2900;
        float _2904 = fma(_2696, _2902, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _2906 = _2898 + (-1.0);
        float _2908 = fma(_2702, _2902, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _2910 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _2912 = _2904 + _2910;
        float _2914 = _2906 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2916 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _2918 = _2908 + _2916;
        float _2920 = _2912 * _2912;
        float _2922 = fma(_2826, _2898, _2914);
        float _2924 = _2918 * _2918;
        _2846 = _2922;
        _2848 = _2920;
        _2876 = _2924;
        _2862 = _2904;
        _2850 = _2908;
    }
    float _2926 = _2846;
    float _2928 = _2848;
    float _2930 = _2876;
    float _2932 = _2862;
    float _2934 = _2850;
    float _2936 = as_type<float>(_2762) * _2870;
    float _2938 = as_type<float>(_2776) * _2872;
    float _2940 = trunc(_2832);
    float _2942 = precise::max(_2940, 0.0);
    uint _2944 = uint(_2942);
    float _2946 = -_187;
    int _2948 = _2194 ? as_type<int>(_2946) : as_type<int>(_187);
    float _2950 = _187 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    int _2952 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _2954 = _2952 != 0;
    float _2956 = fma(_2396, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2478);
    float _2958 = -_183;
    int _2960 = _1944 ? as_type<int>(_2958) : as_type<int>(_183);
    float _2962 = fma(_2396, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2480);
    float _2964 = -_183;
    int _2966 = _2834 ? as_type<int>(_2964) : as_type<int>(_183);
    float _2968 = trunc(_2936);
    float _2970 = precise::max(_2968, 0.0);
    uint _2972 = uint(_2970);
    float _2974 = fma(_2396, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2482);
    bool _2976 = !_2388;
    float _2978 = _2976 ? _187 : as_type<float>(_2812);
    float _2980 = _2950 * _2446;
    bool _2982 = !_2954;
    float _2984 = _2982 ? _187 : as_type<float>(_2948);
    float _2986 = _2950 * _2466;
    bool _2988 = !_1934;
    float _2990 = _2988 ? _183 : as_type<float>(_2960);
    float _2992 = _2950 * _2444;
    float _2994 = trunc(_2938);
    float _2996 = precise::max(_2994, 0.0);
    uint _2998 = uint(_2996);
    bool _3000 = !_2556;
    float _3002 = _3000 ? _183 : as_type<float>(_2966);
    float _3004 = _183 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    int _3006 = int(_2770) + int(_2944);
    float _3008 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _3010 = _2926 + _3008;
    int _3012 = int(_2756) + int(_2840);
    float _3014 = fma(_3004, _2956, _2992);
    float _3016 = fma(_3004, _2962, _2980);
    float _3018 = fma(_3004, _2974, _2986);
    int _3020 = ~_2568;
    int _3022 = _3020 + 1;
    float _3024 = fma(_3010, _3010, _2928);
    int _3026 = int(_2806) + int(_2972);
    float _3028 = -_1778;
    float _3030 = _3028 + 1.0;
    int _3032 = ~_2506;
    int _3034 = _3032 + 1;
    float _3036 = -_1782;
    float _3038 = _3036 + 1.0;
    int _3040 = ~_2592;
    int _3042 = _3040 + 1;
    int _3044 = _3022 * _3026;
    int _3046 = _3044 + _2698;
    int _3048 = int(_2824) + int(_2998);
    int _3050 = _3034 * _3012;
    int _3052 = _3050 + _2686;
    int _3054 = ~_2676;
    int _3056 = _3054 + 1;
    int _3058 = _3042 * _3006;
    int _3060 = _3058 + _2724;
    bool _3062 = uint(_3046) >= uint(_2568);
    float _3064 = _3024 + _2930;
    bool _3066 = uint(_3052) >= uint(_2506);
    float _3068 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    bool _3070 = uint(_3060) >= uint(_2592);
    int _3072 = _3056 * _3048;
    int _3074 = _3072 + _2758;
    bool _3076 = !_3066;
    int _3078 = _3076 ? 0 : (-1);
    float _3080 = -_1780;
    float _3082 = _3080 + 1.0;
    bool _3084 = !_3070;
    int _3086 = _3084 ? 0 : (-1);
    float _3088 = -_1784;
    float _3090 = _3088 + 1.0;
    int _3092 = ~_3012;
    int _3094 = _3092 + _3078;
    int _3096 = _3094 + 1;
    float _3098 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    int _3100 = ~_3006;
    int _3102 = _3100 + _3086;
    int _3104 = _3102 + 1;
    out.m_72.x = _705;
    out.m_72.y = _707;
    out.m_72.z = _709;
    out.m_72.w = _711;
    int _3106 = _2686 ^ _2506;
    bool _3108 = uint(_3074) >= uint(_2676);
    int _3110 = _2506 * _3096;
    int _3112 = _3110 + _2686;
    bool _3114 = !_3062;
    int _3116 = _3114 ? 0 : (-1);
    float _3118 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    uint _3120 = uint(int(uint(_3106) >> uint(31)));
    int _3122 = _2592 * _3104;
    int _3124 = _3122 + _2724;
    bool _3126 = _2506 == 0;
    out.m_74.x = _2956;
    out.m_74.y = _2962;
    out.m_74.z = _2974;
    bool _3128 = _2506 == 0;
    int _3130 = _2724 ^ _2592;
    float _3132 = sqrt(_3064);
    int _3134 = ~_3116;
    int _3136 = _3026 + _3134;
    int _3138 = _3136 + 1;
    int _3140 = ~int(_3120);
    int _3142 = _3140 + 1;
    bool _3144 = !_3108;
    int _3146 = _3144 ? 0 : (-1);
    uint _3148 = uint(int(uint(_3130) >> uint(31)));
    float _3150 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    bool _3152 = !_3126;
    int _3154 = _3152 ? _3112 : (-1);
    float _3156 = _3118 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    bool _3158 = _2592 == 0;
    bool _3160 = _2592 == 0;
    float _3162 = _3068 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    int _3164 = _3138 ^ _3142;
    float _3166 = fma(_2950, _2950, 1.0);
    int _3168 = ~_3146;
    int _3170 = _3048 + _3168;
    int _3172 = _3170 + 1;
    int _3174 = ~int(_3148);
    int _3176 = _3174 + 1;
    float _3178 = float(_3154);
    float _3180 = rsqrt(_3166);
    int _3182 = ~_3142;
    int _3184 = _3182 + _3164;
    int _3186 = _3184 + 1;
    int _3188 = _3172 ^ _3176;
    float _3190 = fma(_3162, _3178, _1768);
    bool _3192 = !_3158;
    int _3194 = _3192 ? _3124 : (-1);
    bool _3196 = !_3128;
    int _3198 = _3196 ? _3186 : (-1);
    int _3200 = ~_3176;
    int _3202 = _3200 + _3188;
    int _3204 = _3202 + 1;
    float _3206 = _2990 + 0.5;
    float _3208 = float(_3194);
    float _3210 = float(_3198);
    float _3212 = _3098 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    bool _3214 = !_3160;
    int _3216 = _3214 ? _3204 : (-1);
    float _3218 = fma(_3162, _3206, _3190);
    float _3220 = fma(_3156, _3208, _1788);
    float _3222 = -_1598;
    float _3224 = fma(_3212, _3210, _3222);
    float _3226 = float(_3216);
    float _3228 = _3002 + 0.5;
    float _3230 = _3150 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _3232 = _2984 + (-0.5);
    bool _3234 = _3132 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _3236 = isnan(_3132);
    bool _3238 = _3234 || _3236;
    bool _3240 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _3242 = _3238 || _3240;
    float _3244 = fma(_3156, _3228, _3220);
    float _3246 = -_1744;
    float _3248 = fma(_3230, _3226, _3246);
    float _3250 = _2950 * _3180;
    float _3252 = -_3212;
    float _3254 = fma(_3252, _3232, _3224);
    float _3256 = _2978 + (-0.5);
    float _3258 = -_2788;
    float _3260 = _3250 * _3258;
    float _3262 = -_2772;
    float _3264 = _3250 * _3262;
    float _3266 = -_2792;
    float _3268 = _3250 * _3266;
    float _3270 = -_3230;
    float _3272 = fma(_3270, _3256, _3248);
    float _3274 = fma(_3180, _2446, _3260);
    float _3276 = _2772 + _3014;
    float _3278 = -_3030;
    float _3280 = fma(_2990, _3278, _3218);
    float _3282 = fma(_3180, _2444, _3264);
    float _3284 = fma(_3180, _2466, _3268);
    float _3286 = _2788 + _3016;
    float _3288 = -_3038;
    float _3290 = fma(_3002, _3288, _3244);
    float _3292 = fma(_2984, _3082, _3254);
    float _3294 = fma(_2978, _3090, _3272);
    float _3296 = _2792 + _3018;
    out.m_76.x = _3282;
    out.m_76.y = _3274;
    out.m_76.z = _3284;
    float _3298 = _3030;
    float _3300 = _3082;
    float _3302 = _3218;
    if (!_3242)
    {
        _3298 = 1.0;
    }
    float _3304 = _3298;
    out.m_78.x = _3280;
    out.m_78.y = _3292;
    out.m_78.z = _3290;
    out.m_78.w = _3294;
    out.m_80.x = _3276;
    out.m_80.y = _3286;
    out.m_80.z = _3296;
    bool _3306 = !_3242;
    float _3308 = _3304;
    if (!_3306)
    {
        bool _3310 = _3132 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _3312 = isnan(_3132);
        bool _3314 = _3310 || _3312;
        bool _3316 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _3318 = _3314 || _3316;
        if (!_3318)
        {
            float _3320 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _3322 = _3132 + _3320;
            float _3324 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _3326 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _3324;
            float _3328 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _3330 = _3328 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _3332 = 1.0 / _3326;
            float _3334 = _3322 * _3332;
            float _3336 = fma(_3334, _3330, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _3308 = _3336;
            _3338 = true;
        }
        else
        {
            bool _3340 = _3132 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _3342 = isnan(_3132);
            bool _3344 = _3340 || _3342;
            bool _3346 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _3348 = _3344 || _3346;
            if (!_3348)
            {
                float _3350 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _3352 = _3132 + _3350;
                float _3354 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _3356 = _3354 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _3358 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _3360 = _3358 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _3362 = 1.0 / _3356;
                float _3364 = _3352 * _3362;
                float _3366 = fma(_3364, _3360, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _3308 = _3366;
                _3338 = true;
            }
            else
            {
                _3308 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _3338 = false;
    float _3368 = _3308;
    float _3370 = _2176 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _3372 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _3374 = _2932 + _3372;
    float _3376 = fma(_2654, (*spvDescriptorSet0.vp_c8)._m0[11].x, _3370);
    float _3378 = _2176 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _3380 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _3382 = _2934 + _3380;
    float _3384 = fma(_2678, (*spvDescriptorSet0.vp_c8)._m0[11].z, _3376);
    bool _3386 = (*spvDescriptorSet0.vp_c15)._m0[660].y >= 0.5;
    bool _3388 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _3390 = _3386 || _3388;
    bool _3392 = isnan(0.5);
    bool _3394 = _3390 || _3392;
    float _3396 = fma(_3374, _3368, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    bool _3398 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _3400 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _3402 = _3398 || _3400;
    bool _3404 = isnan(0.5);
    bool _3406 = _3402 || _3404;
    float _3408 = _3384 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _3410 = fma(_2654, (*spvDescriptorSet0.vp_c8)._m0[10].x, _3378);
    float _3412 = 1.0 / _3408;
    float _3414 = fma(_2678, (*spvDescriptorSet0.vp_c8)._m0[10].z, _3410);
    float _3416 = _3414 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _3418 = (*spvDescriptorSet0.vp_c15)._m0[660].y;
    float _3420 = _3408;
    if (_3406)
    {
        _3418 = 1.0;
    }
    float _3422 = _3418;
    float _3424 = _3416 + _3408;
    float _3426 = _3424 * _3412;
    float _3428 = _3426 * 0.5;
    float _3430 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _3432 = _2926 + _3430;
    float _3434 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _3436 = fma(_3428, (*spvDescriptorSet0.vp_c8)._m0[30].w, _3434);
    float _3438 = fma(_3432, _3368, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _3440 = fma(_3382, _3368, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _3442 = _3432;
    float _3444 = _3428;
    float _3446 = _3422;
    if (_3394)
    {
        _3442 = _3396;
    }
    float _3448 = _3442;
    float _3450 = 1.0 / _3436;
    float _3452 = _3448;
    if (_3394)
    {
        _3444 = _3438;
    }
    float _3454 = _3444;
    float _3456 = _3454;
    if (_3394)
    {
        _3420 = _3440;
    }
    float _3458 = _3420;
    float _3460 = _3458;
    if (!_3394)
    {
        float _3462 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _3464 = _2176 + _3462;
        float _3466 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _3468 = _2654 + _3466;
        float _3470 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _3472 = _3464 * _3464;
        float _3474 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _3476 = _2678 + _3474;
        float _3478 = fma(_3468, _3468, _3472);
        float _3480 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _3482 = fma(_3476, _3476, _3478);
        float _3484 = sqrt(_3482);
        float _3486 = _3470 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _3488 = precise::min(_3484, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _3490 = _3488 * _3480;
        float _3492 = -_2176;
        float _3494 = _3492 + _3438;
        float _3496 = _3486 * _3490;
        float _3498 = -_2654;
        float _3500 = _3498 + _3396;
        float _3502 = -_2678;
        float _3504 = _3502 + _3440;
        float _3506 = fma(_3494, _3496, _2176);
        float _3508 = fma(_3500, _3496, _2654);
        float _3510 = fma(_3504, _3496, _2678);
        _3456 = _3506;
        _3452 = _3508;
        _3460 = _3510;
    }
    float _3512 = _3456;
    float _3514 = _3452;
    float _3516 = _3460;
    float _3518 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _3520 = _3450 * _3518;
    if (!_3406)
    {
        float _3522 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _3524 = _3522 * 0.15915493667125701904296875;
        float _3526 = _3524 * 6.283185482025146484375;
        float _3528 = cos(_3526);
        float _3530 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _3532 = _3530 * 0.15915493667125701904296875;
        float _3534 = _3524 * 6.283185482025146484375;
        float _3536 = sin(_3534);
        float _3538 = 1.0 / _3528;
        float _3540 = _3532 * 6.283185482025146484375;
        float _3542 = cos(_3540);
        float _3544 = _3536 * _3538;
        float _3546 = _3532 * 6.283185482025146484375;
        float _3548 = sin(_3546);
        float _3550 = _3542 * _3544;
        float _3552 = 1.0 / _3550;
        float _3554 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _3556 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _3554;
        float _3558 = 1.0 / _3556;
        float _3560 = _3548 * _3552;
        float _3562 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _3564 = fma(_3520, _3560, _3562);
        float _3566 = _3564 * _3558;
        float _3568 = precise::clamp(_3566, 0.0, 1.0);
        _3300 = _3524;
        _3446 = _3568;
    }
    float _3570 = _3300;
    float _3572 = _3446;
    float _3574 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _3576 = _3512 + _3574;
    float _3578 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _3580 = _3514 + _3578;
    float _3582 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _3584 = _3516 + _3582;
    float _3586 = _3576 * _3576;
    float _3588 = fma(_3580, _3580, _3586);
    float _3590 = fma(_2654, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _3592 = fma(_3584, _3584, _3588);
    float _3594 = rsqrt(_3592);
    float _3596 = _3594 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _3598 = _3580 * _3596;
    float _3600 = _3584 * _3596;
    float _3602 = _3598 * _3598;
    float _3604 = _3600 * _3600;
    float _3606 = _3602 + _3604;
    float _3608 = sqrt(_3606);
    bool _3610 = _3608 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _3612 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _3614 = _3608 + _3612;
    float _3616 = _3584;
    float _3618 = _3586;
    float _3620 = _3614;
    float _3622 = _3576;
    float _3624 = _3570;
    float _3626 = _3606;
    if (_3610)
    {
        float _3628 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _3616 = _3628;
    }
    float _3630 = _3616;
    if (_3610)
    {
        float _3632 = rsqrt(_3606);
        _3618 = _3632;
    }
    float _3634 = _3618;
    float _3636 = _3634;
    if (_3610)
    {
        float _3638 = _3614 * _3630;
        _3620 = _3638;
    }
    float _3640 = _3620;
    if (_3610)
    {
        float _3642 = _3640 * 0.15915493667125701904296875;
        _3302 = _3642;
    }
    float _3644 = _3302;
    float _3646 = _3630;
    if (_3610)
    {
        float _3648 = _3644 * 6.283185482025146484375;
        float _3650 = sin(_3648);
        _3646 = _3650;
    }
    float _3652 = _3646;
    float _3654 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _3656 = precise::max(0.0, _3654);
    float _3658 = _3594;
    float _3660 = _3656;
    if (_3610)
    {
        float _3662 = _3644 * 6.283185482025146484375;
        float _3664 = cos(_3662);
        _3658 = _3664;
    }
    float _3666 = _3658;
    float _3668 = -_3596;
    float _3670 = -_3656;
    float _3672 = fma(_3576, _3668, _3670);
    if (!_3610)
    {
        _3622 = _3602;
    }
    float _3674 = _3622;
    float _3676 = _3674;
    if (_3610)
    {
        float _3678 = _3672 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _3660 = _3678;
    }
    float _3680 = _3660;
    float _3682 = _3680;
    if (!_3610)
    {
        _2852 = _3672;
    }
    float _3684 = _2852;
    float _3686 = _3684;
    if (_3610)
    {
        float _3688 = fma(_3652, _3680, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _3624 = _3688;
    }
    float _3690 = _3624;
    float _3692 = sqrt(_3592);
    float _3694 = _3666;
    if (_3610)
    {
        float _3696 = _3666 + (-1.0);
        _3682 = _3696;
    }
    float _3698 = _3682;
    float _3700 = _3698;
    if (_3610)
    {
        float _3702 = _3634 * _3690;
        _2854 = _3702;
    }
    float _3704 = _2854;
    if (!_3610)
    {
        _3636 = _3598;
    }
    float _3706 = _3636;
    float _3708 = _3706;
    if (_3610)
    {
        float _3710 = _3698 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _3626 = _3710;
    }
    float _3712 = _3626;
    if (_3610)
    {
        float _3714 = _3598 * _3704;
        _3708 = _3714;
    }
    float _3716 = _3708;
    if (!_3610)
    {
        _3700 = _3600;
    }
    float _3718 = _3700;
    float _3720 = _3718;
    if (_3610)
    {
        float _3722 = _3600 * _3704;
        _3720 = _3722;
    }
    float _3724 = _3720;
    if (_3610)
    {
        float _3726 = fma(_3672, _3666, _3712);
        _3686 = _3726;
    }
    float _3728 = _3686;
    if (_3610)
    {
        float _3730 = _3716 * _3716;
        _3676 = _3730;
    }
    float _3732 = _3676;
    float _3734 = _3512 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    if (!_3610)
    {
        _3694 = _3604;
    }
    float _3736 = _3694;
    float _3738 = _3736;
    if (_3610)
    {
        float _3740 = _3724 * _3724;
        _3738 = _3740;
    }
    float _3742 = _3738;
    float _3744 = fma(_3728, _3728, _3732);
    float _3746 = fma(_3514, (*spvDescriptorSet0.vp_c8)._m0[2].x, _3734);
    float _3748 = floor(_3590);
    float _3750 = _3744 + _3742;
    float _3752 = fma(_3516, (*spvDescriptorSet0.vp_c8)._m0[2].z, _3746);
    float _3754 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _3756 = fma(_3692, (*spvDescriptorSet0.vp_c15)._m0[23].w, _3754);
    float _3758 = precise::clamp(_3756, 0.0, 1.0);
    float _3760 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _3762 = _3752 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _3764 = -_3758;
    float _3766 = _3764 + 1.0;
    float _3768 = rsqrt(_3750);
    float _3770 = _3762 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _3772 = fma(_2678, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _3774 = _3512 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _3776 = -_3770;
    float _3778 = fma(_3776, _3760, 1.0);
    float _3780 = _3512 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _3782 = abs(_3766);
    float _3784 = log2(_3782);
    float _3786 = _3512 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _3788 = fma(_3514, (*spvDescriptorSet0.vp_c8)._m0[3].x, _3774);
    float _3790 = fma(_3514, (*spvDescriptorSet0.vp_c8)._m0[0].x, _3780);
    float _3792 = fma(_3514, (*spvDescriptorSet0.vp_c8)._m0[1].x, _3786);
    float _3794 = fma(_3516, (*spvDescriptorSet0.vp_c8)._m0[0].z, _3790);
    float _3796 = _3768 * _3716;
    float _3798 = fma(_3516, (*spvDescriptorSet0.vp_c8)._m0[1].z, _3792);
    float _3800 = _3768 * _3728;
    float _3802 = _3768 * _3724;
    float _3804 = _3796 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _3806 = _3798 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _3808 = _3794 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _3810 = fma(_3516, (*spvDescriptorSet0.vp_c8)._m0[3].z, _3788);
    float _3812 = -_3804;
    float _3814 = fma(_3800, (*spvDescriptorSet0.vp_c15)._m0[21].y, _3812);
    float _3816 = _3806 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _3818 = floor(_3772);
    float _3820 = _3810 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _3822 = -_3802;
    float _3824 = fma(_3822, (*spvDescriptorSet0.vp_c15)._m0[21].z, _3814);
    float _3826 = fma(_3808, (*spvDescriptorSet0.vp_c8)._m0[7].x, _3816);
    float _3828 = _3784 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _3830 = fma(_3824, -0.5, 0.5);
    float _3832 = fma(_3762, (*spvDescriptorSet0.vp_c8)._m0[7].z, _3826);
    float _3834 = log2(_3778);
    float _3836 = _3806 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _3838 = fma(_3820, (*spvDescriptorSet0.vp_c8)._m0[7].w, _3832);
    float _3840 = fma(_3808, (*spvDescriptorSet0.vp_c8)._m0[4].x, _3836);
    float _3842 = exp2(_3828);
    float _3844 = -_3748;
    float _3846 = _3590 + _3844;
    float _3848 = fma(_3824, 0.5, 0.5);
    float _3850 = _3806 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _3852 = -_3818;
    float _3854 = _3772 + _3852;
    float _3856 = fma(_3762, (*spvDescriptorSet0.vp_c8)._m0[4].z, _3840);
    float _3858 = fma(_3808, (*spvDescriptorSet0.vp_c8)._m0[5].x, _3850);
    float _3860 = sqrt(_3830);
    float _3862 = fma(_3848, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _3864 = fma(_3820, (*spvDescriptorSet0.vp_c8)._m0[4].w, _3856);
    float _3866 = fma(_3762, (*spvDescriptorSet0.vp_c8)._m0[5].z, _3858);
    float _3868 = _3834 * 0.693147182464599609375;
    float _3870 = fma(_3848, _3862, -0.212114393711090087890625);
    float _3872 = fma(_3820, (*spvDescriptorSet0.vp_c8)._m0[5].w, _3866);
    float _3874 = 1.0 / _3838;
    float _3876 = _3800 + 1.0;
    float _3878 = fma(_3848, _3870, 1.570728778839111328125);
    float2 _10100 = float2(_3846, _3854);
    float _3880 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_10100, float2(0.0), isnan(_10100)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_10100, float2(0.0), isnan(_10100)), level(0.0)).x;
    float _3882 = -_3800;
    float _3884 = fma(_3842, _3876, _3882);
    float _3886 = _3860 * 0.636619746685028076171875;
    float _3888 = -_3878;
    float _3890 = fma(_3886, _3888, 1.0);
    float _3892 = _3868 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _3894 = fma(_3884, 0.5, 0.5);
    float _3896 = _3864 * _3874;
    float _3898 = _3872 * _3874;
    float _3900 = fma(_3896, 0.5, 0.5);
    float _3902 = fma(_3898, -0.5, 0.5);
    float3 _10141 = float3(_3900, _3902, _3892);
    float _3904 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_10141, float3(0.0), isnan(_10141)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_10141, float3(0.0), isnan(_10141)), level(0.0)).x;
    float3 _10152 = float3(_3900, _3902, _3892);
    float4 _3907 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_10152, float3(0.0), isnan(_10152)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_10152, float3(0.0), isnan(_10152)), level(0.0)).xyzw;
    float _3909 = _3907.x;
    float _3911 = _3907.y;
    float _3913 = _3907.z;
    float _3915 = _3907.w;
    float2 _10168 = float2(_3890, _3894);
    float3 _3919 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_10168, float2(0.0), isnan(_10168)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_10168, float2(0.0), isnan(_10168)), level(0.0)).xyz;
    float _3921 = _3919.x;
    float _3923 = _3919.y;
    float _3925 = _3919.z;
    float _3927 = abs(_3520);
    float _3929 = log2(_3927);
    float _3931 = _3806 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    out.m_82.x = _3514;
    out.m_82.y = _3512;
    out.m_82.z = _3516;
    bool _3933 = _3692 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _3935 = isnan(_3692);
    bool _3937 = _3933 || _3935;
    bool _3939 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _3941 = _3937 || _3939;
    float _3943 = fma(_3808, (*spvDescriptorSet0.vp_c8)._m0[6].x, _3931);
    float _3945 = fma(_3762, (*spvDescriptorSet0.vp_c8)._m0[6].z, _3943);
    float _3947 = in.m_84.x;
    float _3949 = fma(_3820, (*spvDescriptorSet0.vp_c8)._m0[6].w, _3945);
    bool _3951 = _3520 <= 8000.0;
    bool _3953 = isnan(_3520);
    bool _3955 = _3951 || _3953;
    bool _3957 = isnan(8000.0);
    bool _3959 = _3955 || _3957;
    float _3961 = float(_3959);
    float _3963 = _3929 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _3965 = exp2(_3963);
    out.gl_Position.x = _3864;
    out.gl_Position.y = _3872;
    out.gl_Position.z = _3949;
    out.gl_Position.w = _3838;
    float _3967 = _3872;
    float _3969 = _3838;
    float _3971 = _3949;
    if (!_3941)
    {
        _3967 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _3973 = _3967;
    float _3975 = fma(_3965, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _3977 = precise::clamp(_3975, 0.0, 1.0);
    float _3979 = fma(_3977, -2.0, 3.0);
    float _3981 = _3977 * _3977;
    float _3983 = _3981 * _3979;
    float _3985 = _3784 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _3987 = -_3983;
    float _3989 = _3987 + 1.0;
    float _3991 = exp2(_3985);
    float _3993 = fma(_3989, (*spvDescriptorSet0.vp_c15)._m0[654].w, _3983);
    float _3995 = _3949 + _3838;
    float _3997 = _3973;
    float _3999 = _3973;
    if (!_3941)
    {
        _3969 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _4001 = _3969;
    float _4003 = _3961 * _3993;
    float _4005 = _3995 * 0.5;
    float _4007 = _4003 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _4009 = _4001;
    float _4011 = _4001;
    if (!_3941)
    {
        _3971 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _4013 = _3971;
    out.m_86.z = _4005;
    out.m_86.w = _3838;
    float _4015 = -_3991;
    float _4017 = _4015 + 1.0;
    float _4019 = _4017 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _4021 = -_4019;
    float _4023 = _4021 + 1.0;
    float _4025 = -_3880;
    float _4027 = _4025 + 1.0;
    float _4029 = _4027 * _4007;
    float _4031 = precise::clamp(_4029, 0.0, 1.0);
    float _4033 = -_4031;
    float _4035 = fma(_4033, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _4037 = _4035 * _3947;
    float _4039 = _4037 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    out.m_88.x = _4039;
    float _4041 = _4019 * _3904;
    float _4043 = _3915 * _4023;
    float _4045 = _4023;
    float _4047 = _3909;
    float _4049 = _4013;
    float _4051 = _4013;
    if (!_3941)
    {
        _4045 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _4053 = _4045;
    float _4055 = _3915 * _4041;
    float _4057 = _3925 * _4041;
    float _4059 = fma(_3921, _4055, _3909);
    float _4061 = fma(_3923, _4055, _3911);
    float _4063 = fma(_3915, _4057, _3913);
    float _4065 = _3572 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _4067 = _4055;
    float _4069 = _4053;
    float _4071 = _4053;
    if (!_3941)
    {
        _4067 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _4073 = _4067;
    float _4075 = _4073;
    float _4077 = _4073;
    if (!_3941)
    {
        _4047 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _4079 = _4047;
    out.m_90.x = _4059;
    out.m_90.y = _4061;
    out.m_90.z = _4063;
    out.m_90.w = _4043;
    bool _4081 = !_3941;
    float _4083 = _4079;
    float _4085 = _4079;
    if (!_4081)
    {
        bool _4087 = _3692 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _4089 = isnan(_3692);
        bool _4091 = _4087 || _4089;
        bool _4093 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _4095 = _4091 || _4093;
        if (!_4095)
        {
            float _4097 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _4099 = _3692 + _4097;
            float _4101 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _4103 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _4101;
            float _4105 = 1.0 / _4103;
            float _4107 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _4109 = _4107 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _4111 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _4113 = _4111 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _4115 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _4117 = _4115 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _4119 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _4121 = _4119 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _4123 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _4125 = _4123 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _4127 = _4099 * _4105;
            float _4129 = precise::clamp(_4127, 0.0, 1.0);
            float _4131 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _4133 = _4131 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _4135 = fma(_4129, _4109, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _4137 = fma(_4129, _4133, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _4139 = fma(_4129, _4113, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _4141 = fma(_4129, _4117, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _4143 = fma(_4129, _4121, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _4145 = fma(_4129, _4125, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _4085 = _4137;
            _3999 = _4143;
            _4077 = _4135;
            _4051 = _4141;
            _4011 = _4139;
            _4071 = _4145;
            _4147 = true;
        }
        else
        {
            bool _4149 = _3692 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _4151 = isnan(_3692);
            bool _4153 = _4149 || _4151;
            bool _4155 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _4157 = _4153 || _4155;
            if (!_4157)
            {
                _4075 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _4159 = _4075;
            _4077 = _4159;
            if (!_4157)
            {
                _4083 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _4161 = _4083;
            _4085 = _4161;
            if (!_4157)
            {
                _4009 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _4163 = _4009;
            _4011 = _4163;
            if (!_4157)
            {
                _4049 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _4165 = _4049;
            _4051 = _4165;
            if (!_4157)
            {
                _3997 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _4167 = _3997;
            _3999 = _4167;
            if (!_4157)
            {
                _4069 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _4169 = _4069;
            bool _4171 = !_4157;
            _4071 = _4169;
            if (!_4171)
            {
                bool _4173 = _3692 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _4175 = isnan(_3692);
                bool _4177 = _4173 || _4175;
                bool _4179 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _4181 = _4177 || _4179;
                if (!_4181)
                {
                    float _4183 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _4185 = _3692 + _4183;
                    float _4187 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _4189 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _4187;
                    float _4191 = 1.0 / _4189;
                    float _4193 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _4195 = _4193 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _4197 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _4199 = _4197 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _4201 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _4203 = _4201 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _4205 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _4207 = _4205 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _4209 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _4211 = _4209 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _4213 = _4185 * _4191;
                    float _4215 = precise::clamp(_4213, 0.0, 1.0);
                    float _4217 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _4219 = _4217 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _4221 = fma(_4215, _4195, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _4223 = fma(_4215, _4219, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _4225 = fma(_4215, _4199, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _4227 = fma(_4215, _4203, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _4229 = fma(_4215, _4207, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _4231 = fma(_4215, _4211, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _4085 = _4223;
                    _3999 = _4229;
                    _4077 = _4221;
                    _4051 = _4227;
                    _4011 = _4225;
                    _4071 = _4231;
                    _4147 = true;
                }
                else
                {
                    _4085 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _3999 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _4077 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _4051 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _4011 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _4071 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _4147 = false;
    float _4233 = _4085;
    float _4235 = _3999;
    float _4237 = _4077;
    float _4239 = _4051;
    float _4241 = _4011;
    float _4243 = _4071;
    float _4245 = fma(_3286, -0.5, 0.5);
    float _4247 = precise::clamp(_4245, 0.0, 1.0);
    float _4249 = -_4233;
    float _4251 = _4249 + _4235;
    float _4253 = _4065 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _4255 = -_4237;
    float _4257 = _4255 + _4239;
    float _4259 = fma(_4247, _4251, _4233);
    out.m_92.x = 0.0;
    float _4261 = -_4241;
    float _4263 = _4261 + _4243;
    float _4265 = fma(_4247, _4257, _4237);
    float _4267 = _4259 * 0.586610972881317138671875;
    out.m_51.x = _4253;
    bool _4269 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _4271 = fma(_4247, _4263, _4241);
    float _4273 = fma(_4265, 0.298911988735198974609375, _4267);
    bool _4275 = _3572 > 0.0;
    bool _4277 = isnan(_3572);
    bool _4279 = _4275 || _4277;
    bool _4281 = isnan(0.0);
    bool _4283 = _4279 || _4281;
    float _4285 = fma(_4271, 0.114477999508380889892578125, _4273);
    float _4287 = -_4285;
    float _4289 = _4265 + _4287;
    float _4291 = -_4285;
    float _4293 = _4259 + _4291;
    float _4295 = -_4285;
    float _4297 = _4271 + _4295;
    float _4299 = fma(_4289, (*spvDescriptorSet0.vp_c13)._m0[1].z, _4285);
    float _4301 = fma(_4293, (*spvDescriptorSet0.vp_c13)._m0[1].z, _4285);
    float _4303 = fma(_4297, (*spvDescriptorSet0.vp_c13)._m0[1].z, _4285);
    bool _4305 = !_4269;
    if (!_4305)
    {
        float _4307 = -_3512;
        float _4309 = _4307 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _4311 = -_3514;
        float _4313 = _4311 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _4315 = -_3516;
        float _4317 = _4315 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _4319 = _4309 * _4309;
        float _4321 = fma(_4313, _4313, _4319);
        float _4323 = fma(_4317, _4317, _4321);
        float _4325 = sqrt(_4323);
        float _4327 = rsqrt(_4323);
        float _4329 = -_4325;
        float _4331 = _4329 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _4333 = _4331 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _4335 = precise::clamp(_4333, 0.0, 1.0);
        float _4337 = _4313 * _4327;
        float _4339 = _4309 * _4327;
        float _4341 = abs(_4335);
        float _4343 = log2(_4341);
        float _4345 = _4317 * _4327;
        float _4347 = _4337 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _4349 = _3286 * _4339;
        float _4351 = -_4339;
        float _4353 = -_4347;
        float _4355 = fma(_4351, (*spvDescriptorSet0.vp_c15)._m0[656].y, _4353);
        float _4357 = fma(_3276, _4337, _4349);
        float _4359 = -_4345;
        float _4361 = fma(_4359, (*spvDescriptorSet0.vp_c15)._m0[656].z, _4355);
        float _4363 = fma(_3296, _4345, _4357);
        float _4365 = precise::clamp(_4363, 0.0, 1.0);
        float _4367 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _4369 = _4361 + _4367;
        float _4371 = _4343 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _4373 = _4369 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _4375 = precise::clamp(_4373, 0.0, 1.0);
        float _4377 = exp2(_4371);
        float _4379 = _4377 * _4375;
        float _4381 = _4365 * _4379;
        float _4383 = _4381 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _4385 = _4381 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _4387 = _4381 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_92.x = _4383;
        out.m_92.y = _4385;
        out.m_92.z = _4387;
    }
    out.m_94.x = _4299;
    out.m_94.y = _4301;
    out.m_94.z = _4303;
    if (_4283)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    out.m_51.x = 0.0;
    float _4389 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _4389;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_62 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_72 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_78 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_86 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_94 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_51 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_76 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_80 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_82 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_74 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_92 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_88 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_90 = float4(0.0, 0.0, 0.0, 1.0);
    bool _4147 = false;
    bool _3338 = false;
    bool _733 = false;
    bool _591 = false;
    bool _403 = false;
    bool _209 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _108 = in.m_48.w;
    float _110 = trunc(_108);
    int _113 = int(_110);
    bool _117 = _113 >= 1;
    float _119 = 0.0;
    if (!_117)
    {
        _119 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _121 = _119;
    float _123 = _121;
    if (!_117)
    {
        out.m_51.x = 0.0;
    }
    int _125 = 0;
    if (!_117)
    {
        float _127 = _121 * 5.0;
        _125 = as_type<int>(_127);
    }
    int _129 = _125;
    int _131 = _129;
    if (!_117)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _4446 = as_type<float>(_129);
        out.gl_Position.z = _4446;
    }
    if (!_117)
    {
        return out;
    }
    float _133 = in.m_53.w;
    bool _135 = _133 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _137 = isnan(_133);
    bool _139 = _135 || _137;
    bool _141 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _143 = _139 || _141;
    float _145 = -_133;
    float _147 = _145 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _149 = 0.0;
    float _151 = _147;
    if (_143)
    {
        float _153 = float(_113);
        _149 = _153;
    }
    float _155 = _149;
    bool _157 = _147 >= _155;
    bool _159 = !_143;
    bool _161 = _157 || _159;
    if (_161)
    {
        _123 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _163 = _123;
    if (_161)
    {
        out.m_51.x = 0.0;
    }
    if (_161)
    {
        float _165 = _163 * 5.0;
        _131 = as_type<int>(_165);
    }
    int _167 = _131;
    if (_161)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _4515 = as_type<float>(_167);
        out.gl_Position.z = _4515;
    }
    if (_161)
    {
        return out;
    }
    float _169 = as_type<float>(int(gl_VertexIndex));
    bool _171 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    int _173 = as_type<int>(_169) & 1;
    bool _175 = _173 != 0;
    int _177 = as_type<int>(_169) & 2;
    bool _179 = _177 != 0;
    bool _181 = !_175;
    float _183 = _181 ? (-0.5) : 0.5;
    bool _185 = !_179;
    float _187 = _185 ? (-0.5) : 0.5;
    bool _189 = !_171;
    float _207;
    if (!_189)
    {
        float _191 = in.m_58.x;
        float _193 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _195 = _191 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _197 = fma(_195, (*spvDescriptorSet0.vp_c9)._m0[12].x, _147);
        float _199 = _197 * _193;
        float _201 = floor(_199);
        float _203 = -_201;
        float _205 = _199 + _203;
        _207 = _205;
        _209 = true;
    }
    else
    {
        float _211 = float(_113);
        float _213 = 1.0 / _211;
        float _215 = _147 * _213;
        _207 = _215;
    }
    _209 = false;
    float _217 = _207;
    float _219 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _221 = _217 + _219;
    float _223 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _225 = _217 + _223;
    float _227 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _229 = _217 + _227;
    float _231 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _233 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _231;
    float _235 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _237 = _235 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _239 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _241 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _239;
    bool _243 = _217 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _245 = isnan(_217);
    bool _247 = _243 || _245;
    bool _249 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _251 = _247 || _249;
    float _253 = float(_251);
    float _255 = 1.0 / _233;
    bool _257 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _259 = 1.0 / _241;
    float _261 = 1.0 / _237;
    float _263 = _221 * _255;
    bool _265 = _217 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _267 = isnan(_217);
    bool _269 = _265 || _267;
    bool _271 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _273 = _269 || _271;
    float _275 = float(_273);
    float _277 = -_253;
    float _279 = _277 + 1.0;
    float _281 = _275 * _279;
    float _283 = _225 * _259;
    bool _285 = _217 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _287 = isnan(_217);
    bool _289 = _285 || _287;
    bool _291 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _293 = _289 || _291;
    float _295 = float(_293);
    float _297 = -_275;
    float _299 = _297 + 1.0;
    float _301 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _303 = _301 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _305 = _295 * _299;
    float _307 = -_295;
    float _309 = _307 + 1.0;
    float _311 = _229 * _261;
    bool _313 = _217 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _315 = isnan(_217);
    bool _317 = _313 || _315;
    bool _319 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _321 = _317 || _319;
    float _323 = float(_321);
    float _325 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _327 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _325;
    float _329 = fma(_303, _311, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _331 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _333 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _331;
    float _335 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _337 = _335 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _339 = fma(_327, _263, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _341 = _323 * _309;
    float _343 = fma(_333, _263, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _345 = fma(_337, _311, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _347 = -_323;
    float _349 = _347 + 1.0;
    float _351 = _339 * _341;
    float _353 = _343 * _341;
    float _355 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _357 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _355;
    float _359 = fma(_349, (*spvDescriptorSet0.vp_c9)._m0[143].x, _351);
    float _361 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _363 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _361;
    float _365 = fma(_349, (*spvDescriptorSet0.vp_c9)._m0[143].y, _353);
    float _367 = fma(_357, _283, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _369 = fma(_329, _305, _359);
    float _371 = fma(_363, _283, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _373 = fma(_345, _305, _365);
    float _375 = fma(_367, _281, _369);
    float _377 = fma(_371, _281, _373);
    float _379 = fma(_253, (*spvDescriptorSet0.vp_c9)._m0[146].x, _375);
    float _381 = fma(_253, (*spvDescriptorSet0.vp_c9)._m0[146].y, _377);
    bool _383 = !_257;
    float _401;
    if (!_383)
    {
        float _385 = in.m_58.x;
        float _387 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _389 = _385 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _391 = fma(_389, (*spvDescriptorSet0.vp_c9)._m0[11].y, _147);
        float _393 = _391 * _387;
        float _395 = floor(_393);
        float _397 = -_395;
        float _399 = _393 + _397;
        _401 = _399;
        _403 = true;
    }
    else
    {
        float _405 = float(_113);
        float _407 = 1.0 / _405;
        float _409 = _147 * _407;
        _401 = _409;
    }
    _403 = false;
    float _411 = _401;
    float _413 = in.m_60.x;
    float _415 = in.m_60.y;
    float _417 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _419 = _417 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _421 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _423 = _421 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _425 = _411 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _427 = isnan(_411);
    bool _429 = _425 || _427;
    bool _431 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _433 = _429 || _431;
    float _435 = float(_433);
    float _437 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _439 = _437 + (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _441 = _411 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _443 = isnan(_411);
    bool _445 = _441 || _443;
    bool _447 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _449 = _445 || _447;
    float _451 = float(_449);
    float _453 = 1.0 / _419;
    float _455 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _457 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _455;
    float _459 = -_435;
    float _461 = _459 + 1.0;
    bool _463 = _411 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _465 = isnan(_411);
    bool _467 = _463 || _465;
    bool _469 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _471 = _467 || _469;
    float _473 = float(_471);
    bool _475 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _477 = _451 * _461;
    float _479 = -_451;
    float _481 = _479 + 1.0;
    float _483 = 1.0 / _423;
    float _485 = _473 * _481;
    float _487 = -_473;
    float _489 = _487 + 1.0;
    float _491 = _381 * _415;
    float _493 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _495 = _493 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _497 = 1.0 / _439;
    float _499 = _457 * _453;
    float _501 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _503 = _411 + _501;
    float _505 = _379 * _413;
    float _507 = fma(_499, _503, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _509 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _511 = _411 + _509;
    float _513 = _495 * _483;
    bool _515 = _411 >= (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _517 = isnan(_411);
    bool _519 = _515 || _517;
    bool _521 = isnan((*spvDescriptorSet0.vp_c9)._m0[118].w);
    bool _523 = _519 || _521;
    float _525 = float(_523);
    float _527 = -(*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _529 = (*spvDescriptorSet0.vp_c9)._m0[118].x + _527;
    float _531 = _507 * _485;
    float _533 = fma(_513, _511, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _535 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _537 = _411 + _535;
    float _539 = -_525;
    float _541 = _539 + 1.0;
    float _543 = fma(_489, (*spvDescriptorSet0.vp_c9)._m0[115].x, _531);
    float _545 = _529 * _497;
    float _547 = _435 * _541;
    float _549 = fma(_533, _477, _543);
    float _551 = fma(_545, _537, (*spvDescriptorSet0.vp_c9)._m0[117].x);
    float _553 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _555 = fma(_551, _547, _549);
    float _557 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _559 = _553 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _561 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _563 = fma(_525, (*spvDescriptorSet0.vp_c9)._m0[118].x, _555);
    float _565 = _557 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _567 = _561 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _569 = _563 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    bool _571 = !_475;
    float _589;
    if (!_571)
    {
        float _573 = in.m_58.x;
        float _575 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _577 = _573 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _579 = fma(_577, (*spvDescriptorSet0.vp_c9)._m0[11].w, _147);
        float _581 = _579 * _575;
        float _583 = floor(_581);
        float _585 = -_583;
        float _587 = _581 + _585;
        _589 = _587;
        _591 = true;
    }
    else
    {
        float _593 = float(_113);
        float _595 = 1.0 / _593;
        float _597 = _147 * _595;
        _589 = _597;
    }
    _591 = false;
    float _599 = _589;
    float _601 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _603 = _599 + _601;
    float _605 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _607 = _605 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _609 = _599 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _611 = isnan(_599);
    bool _613 = _609 || _611;
    bool _615 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _617 = _613 || _615;
    float _619 = float(_617);
    float _621 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _623 = _621 + (*spvDescriptorSet0.vp_c9)._m0[133].w;
    bool _625 = _599 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _627 = isnan(_599);
    bool _629 = _625 || _627;
    bool _631 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _633 = _629 || _631;
    float _635 = float(_633);
    float _637 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _639 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _637;
    bool _641 = _599 >= (*spvDescriptorSet0.vp_c9)._m0[133].w;
    bool _643 = isnan(_599);
    bool _645 = _641 || _643;
    bool _647 = isnan((*spvDescriptorSet0.vp_c9)._m0[133].w);
    bool _649 = _645 || _647;
    float _651 = float(_649);
    float _653 = 1.0 / _607;
    float _655 = -_619;
    float _657 = _655 + 1.0;
    bool _659 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[14].x;
    float _661 = _635 * _657;
    float _663 = -_635;
    float _665 = _663 + 1.0;
    float _667 = 1.0 / _623;
    float _669 = _639 * _653;
    float _671 = -(*spvDescriptorSet0.vp_c9)._m0[132].x;
    float _673 = _671 + (*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _675 = fma(_669, _603, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    float _677 = _673 * _667;
    float _679 = _675 * _661;
    float _681 = -_651;
    float _683 = _681 + 1.0;
    float _685 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _687 = _599 + _685;
    float _689 = fma(_665, (*spvDescriptorSet0.vp_c9)._m0[131].x, _679);
    float _691 = _619 * _683;
    float _693 = fma(_677, _687, (*spvDescriptorSet0.vp_c9)._m0[132].x);
    float _695 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _697 = fma(_693, _691, _689);
    float _699 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _701 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _703 = fma(_651, (*spvDescriptorSet0.vp_c9)._m0[133].x, _697);
    float _705 = _695 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _707 = _699 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _709 = _701 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _711 = _703 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    bool _713 = !_659;
    float _731;
    if (!_713)
    {
        float _715 = in.m_58.x;
        float _717 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[14].x;
        float _719 = _715 * (*spvDescriptorSet0.vp_c9)._m0[15].x;
        float _721 = fma(_719, (*spvDescriptorSet0.vp_c9)._m0[14].x, _147);
        float _723 = _721 * _717;
        float _725 = floor(_723);
        float _727 = -_725;
        float _729 = _723 + _727;
        _731 = _729;
        _733 = true;
    }
    else
    {
        float _735 = float(_113);
        float _737 = 1.0 / _735;
        float _739 = _147 * _737;
        _731 = _739;
    }
    _733 = false;
    float _741 = _731;
    float _743 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _745 = int(_743);
    out.m_62.x = _565;
    out.m_62.y = _567;
    out.m_62.z = _559;
    out.m_62.w = _569;
    float _747 = float(_113);
    float _749 = _505 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    int _751 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _753 = _751 != 0;
    float _755 = -(*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _757 = _741 + _755;
    float _759 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].y);
    int _761 = int(_759);
    float _763 = -(*spvDescriptorSet0.vp_c9)._m0[159].w;
    float _765 = _763 + (*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _767 = -(*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _769 = _767 + (*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _771 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _773 = int(_771);
    float _775 = float(_745);
    float _777 = 0.0;
    int _779 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z);
    if (_753)
    {
        float _781 = in.m_58.x;
        _777 = _781;
    }
    float _783 = _777;
    float _785 = -(*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _787 = _785 + (*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _789 = _783;
    if (!_753)
    {
        float _791 = in.m_58.y;
        _789 = _791;
    }
    float _793 = _789;
    float _795 = 1.0 / _775;
    float _797 = float(_761);
    float _799 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _801 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _803 = -(*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _805 = _803 + (*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _807 = -(*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _809 = _807 + (*spvDescriptorSet0.vp_c9)._m0[166].w;
    float _811 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].x);
    int _813 = int(_811);
    float _815 = float(uint(_773));
    float _817 = -(*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _819 = _817 + (*spvDescriptorSet0.vp_c9)._m0[162].w;
    int _821 = ~_773;
    int _823 = _821 + 1;
    float _825 = (*spvDescriptorSet0.vp_c10)._m0[5].x * (*spvDescriptorSet0.vp_c10)._m0[5].x;
    bool _827 = _773 == 0;
    float _829 = 1.0 / _797;
    float _831 = _795 * _147;
    float _833 = fma((*spvDescriptorSet0.vp_c10)._m0[4].x, (*spvDescriptorSet0.vp_c10)._m0[4].x, _825);
    float _835 = -(*spvDescriptorSet0.vp_c9)._m0[165].x;
    float _837 = (*spvDescriptorSet0.vp_c9)._m0[166].x + _835;
    float _839 = 1.0 / _815;
    float _841 = float(uint(_813));
    int _843 = ~_813;
    int _845 = _843 + 1;
    float _847 = trunc(_831);
    int _849 = int(_847);
    float _851 = _829 * _147;
    bool _853 = _741 >= (*spvDescriptorSet0.vp_c9)._m0[161].w;
    bool _855 = isnan(_741);
    bool _857 = _853 || _855;
    bool _859 = isnan((*spvDescriptorSet0.vp_c9)._m0[161].w);
    bool _861 = _857 || _859;
    float _863 = float(_861);
    float _865 = fma((*spvDescriptorSet0.vp_c10)._m0[6].x, (*spvDescriptorSet0.vp_c10)._m0[6].x, _833);
    bool _867 = _741 >= (*spvDescriptorSet0.vp_c9)._m0[159].w;
    bool _869 = isnan(_741);
    bool _871 = _867 || _869;
    bool _873 = isnan((*spvDescriptorSet0.vp_c9)._m0[159].w);
    bool _875 = _871 || _873;
    float _877 = float(_875);
    float _879 = 1.0 / _841;
    int _881 = as_type<int>(_839) + (-2);
    float _883 = trunc(_851);
    int _885 = int(_883);
    float _887 = float(uint(_849));
    float _889 = float(_849);
    float _891 = as_type<float>(_881) * _887;
    int _893 = as_type<int>(_879) + (-2);
    float _895 = 1.0 / _747;
    float _897 = float(uint(_885));
    float _899 = trunc(_891);
    float _901 = precise::max(_899, 0.0);
    uint _904 = uint(_901);
    float _906 = as_type<float>(_893) * _897;
    float _908 = in.m_58.x;
    float _910 = in.m_58.y;
    float _912 = in.m_58.z;
    float _914 = in.m_58.w;
    float _916 = trunc(_906);
    float _918 = precise::max(_916, 0.0);
    uint _920 = uint(_918);
    float _922 = _895 * _147;
    int _924 = _823 * int(_904);
    int _926 = _924 + _849;
    float _928 = 1.0 / _765;
    float _930 = float(uint(_926));
    float _932 = as_type<float>(_926);
    float _934 = _799;
    if (_753)
    {
        _932 = 1.0;
    }
    float _936 = _932;
    int _938 = _845 * int(_920);
    int _940 = _938 + _885;
    float _942 = _936;
    float _944 = as_type<float>(_940);
    if (!_753)
    {
        _942 = 1.2345600128173828125;
    }
    float _946 = _942;
    float _948 = as_type<float>(_881) * _930;
    float _950 = 1.0 / _769;
    float _952 = float(uint(_940));
    float _954 = _946 * _793;
    if (_753)
    {
        _944 = 1.0;
    }
    float _956 = _944;
    float _958 = _908 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _960 = _956;
    float _962 = _958;
    if (!_753)
    {
        _960 = 7.345489978790283203125;
    }
    float _964 = _960;
    float _966 = as_type<float>(_893) * _952;
    float _968 = trunc(_948);
    float _970 = precise::max(_968, 0.0);
    uint _972 = uint(_970);
    int _974 = ~_773;
    int _976 = _974 + 1;
    float _978 = _964 * _908;
    float _980 = trunc(_966);
    float _982 = precise::max(_980, 0.0);
    uint _984 = uint(_982);
    float _986 = floor(_978);
    int _988 = int(_904) + int(_972);
    int _990 = ~_813;
    int _992 = _990 + 1;
    float _994 = floor(_954);
    int _996 = _976 * _988;
    int _998 = _996 + _849;
    int _1000 = int(_920) + int(_984);
    float _1002 = float(_773);
    bool _1004 = uint(_998) >= uint(_773);
    float _1006 = -_986;
    float _1008 = _978 + _1006;
    bool _1010 = _889 >= _1002;
    bool _1012 = isnan(_889);
    bool _1014 = _1010 || _1012;
    bool _1016 = isnan(_1002);
    bool _1018 = _1014 || _1016;
    float _1020 = float(_1018);
    int _1022 = _992 * _1000;
    int _1024 = _1022 + _885;
    bool _1026 = !_1004;
    int _1028 = _1026 ? 0 : (-1);
    float _1030 = 1.0 / _787;
    int _1032 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _1034 = _1032 != 0;
    float _1036 = -_994;
    float _1038 = _954 + _1036;
    bool _1040 = uint(_1024) >= uint(_813);
    float _1042 = _1008 * _1002;
    int _1044 = ~_988;
    int _1046 = _1044 + _1028;
    int _1048 = _1046 + 1;
    float _1050 = _1002 * _922;
    float _1052 = trunc(_1020);
    int _1054 = int(_1052);
    float _1056 = float(_813);
    float _1058 = float(_885);
    int _1060 = _773 * _1048;
    int _1062 = _1060 + _849;
    bool _1064 = !_1034;
    int _1066 = _1064 ? 0 : 1;
    float _1068 = trunc(_1050);
    int _1070 = int(_1068);
    bool _1072 = _1058 >= _1056;
    bool _1074 = isnan(_1058);
    bool _1076 = _1072 || _1074;
    bool _1078 = isnan(_1056);
    bool _1080 = _1076 || _1078;
    float _1082 = float(_1080);
    float _1084 = _1056 * _922;
    bool _1086 = !_1040;
    int _1088 = _1086 ? 0 : (-1);
    float _1090 = _1038 * _1056;
    int _1092 = abs(_1066);
    bool _1094 = !_827;
    int _1096 = _1094 ? _1062 : (-1);
    float _1098 = trunc(_1082);
    int _1100 = int(_1098);
    int _1102 = ~_1054;
    int _1104 = _1102 + 1;
    int _1106 = _1104 + 1;
    int _1108 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _1110 = _1108 != 0;
    int _1112 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _1114 = _1112 != 0;
    int _1116 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _1118 = _1116 != 0;
    int _1120 = ~_1000;
    int _1122 = _1120 + _1088;
    int _1124 = _1122 + 1;
    int _1126 = _1096 * _1106;
    bool _1128 = _813 == 0;
    float _1130 = trunc(_1042);
    int _1132 = int(_1130);
    bool _1134 = !_1114;
    int _1136 = _1134 ? 0 : 1;
    int _1138 = _813 * _1124;
    int _1140 = _1138 + _885;
    int _1142 = _773 + (-1);
    int _1144 = abs(_1136);
    bool _1146 = !_1128;
    int _1148 = _1146 ? _1140 : (-1);
    int _1150 = _1054 * _1142;
    int _1152 = _1150 + _1126;
    int _1154 = ~_1100;
    int _1156 = _1154 + 1;
    int _1158 = _1156 + 1;
    float _1160 = trunc(_1090);
    int _1162 = int(_1160);
    int _1164 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8192;
    bool _1166 = _1164 != 0;
    int _1168 = _1152 * _1144;
    int _1170 = _813 + (-1);
    int _1172 = _1148 * _1158;
    bool _1174 = !_1110;
    int _1176 = _1174 ? 0 : 1;
    int _1178 = _1132 * _1092;
    int _1180 = _1178 + _849;
    bool _1182 = !_1166;
    int _1184 = _1182 ? 0 : 1;
    int _1186 = _1100 * _1170;
    int _1188 = _1186 + _1172;
    int _1190 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _1192 = _1190 != 0;
    float _1194 = trunc(_1084);
    int _1196 = int(_1194);
    int _1198 = abs(_1176);
    bool _1200 = !_1118;
    int _1202 = _1200 ? 0 : 1;
    int _1204 = abs(_1184);
    int _1206 = _1070 * _1198;
    int _1208 = _1206 + _1168;
    bool _1210 = !_1192;
    int _1212 = _1210 ? 0 : 1;
    float _1214 = 1.0 / _805;
    int _1216 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 256;
    bool _1218 = _1216 != 0;
    int _1220 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 512;
    bool _1222 = _1220 != 0;
    int _1224 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1024;
    bool _1226 = _1224 != 0;
    int _1228 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2048;
    bool _1230 = _1228 != 0;
    int _1232 = _1162 * _1204;
    int _1234 = _1232 + _885;
    int _1236 = abs(_1202);
    int _1238 = abs(_1212);
    bool _1240 = !_1222;
    int _1242 = _1240 ? 0 : 1;
    float _1244 = 1.0 / _809;
    bool _1246 = !_1218;
    int _1248 = _1246 ? 0 : 1;
    int _1250 = abs(_1242);
    int _1252 = _1180 * _1236;
    int _1254 = _1252 + _1208;
    float _1256 = 1.0 / _819;
    int _1258 = abs(_1248);
    int _1260 = _1132 * _1238;
    int _1262 = _1260 + _1254;
    bool _1264 = !_1226;
    int _1266 = _1264 ? 0 : 1;
    bool _1268 = !_1230;
    int _1270 = _1268 ? 0 : 1;
    int _1272 = _1188 * _1250;
    int _1274 = abs(_1266);
    float _1276 = _837 * _1244;
    float _1278 = float(uint(_1262));
    float _1280 = sqrt(_865);
    int _1282 = abs(_1270);
    float _1284 = as_type<float>(_881) * _1278;
    int _1286 = _1196 * _1258;
    int _1288 = _1286 + _1272;
    float _1290 = trunc(_1284);
    float _1292 = precise::max(_1290, 0.0);
    uint _1294 = uint(_1292);
    float _1296 = float(uint(_1180));
    int _1298 = _1234 * _1274;
    int _1300 = _1298 + _1288;
    float _1302 = float(uint(_1234));
    int _1304 = ~_773;
    int _1306 = _1304 + 1;
    int _1308 = _1162 * _1282;
    int _1310 = _1308 + _1300;
    int _1312 = ~_773;
    int _1314 = _1312 + 1;
    float _1316 = as_type<float>(_881) * _1296;
    int _1318 = ~_813;
    int _1320 = _1318 + 1;
    float _1322 = as_type<float>(_893) * _1302;
    float _1324 = float(uint(_1310));
    int _1326 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _1328 = _1326 != 0;
    bool _1330 = _773 == 0;
    float _1332 = as_type<float>(_893) * _1324;
    int _1334 = _1314 * int(_1294);
    int _1336 = _1334 + _1262;
    bool _1338 = _813 == 0;
    float _1340 = trunc(_1316);
    float _1342 = precise::max(_1340, 0.0);
    uint _1344 = uint(_1342);
    float _1346 = float(uint(_1336));
    if (_1328)
    {
        _779 = 0;
    }
    int _1348 = _779;
    float _1350 = trunc(_1332);
    float _1352 = precise::max(_1350, 0.0);
    uint _1354 = uint(_1352);
    float _1356 = as_type<float>(_881) * _1346;
    int _1358 = _1348;
    if (!_1328)
    {
        _1358 = 1;
    }
    int _1360 = _1358;
    float _1362 = trunc(_1356);
    float _1364 = precise::max(_1362, 0.0);
    uint _1366 = uint(_1364);
    int _1368 = ~_773;
    int _1370 = _1368 + 1;
    int _1372 = _1320 * int(_1354);
    int _1374 = _1372 + _1310;
    float _1376 = trunc(_1322);
    float _1378 = precise::max(_1376, 0.0);
    uint _1380 = uint(_1378);
    float _1382 = float(uint(_1374));
    int _1384 = _1306 * int(_1344);
    int _1386 = _1384 + _1180;
    int _1388 = ~_813;
    int _1390 = _1388 + 1;
    int _1392 = int(_1294) + int(_1366);
    float _1394 = as_type<float>(_893) * _1382;
    float _1396 = float(uint(_1386));
    float _1398 = trunc(_1394);
    float _1400 = precise::max(_1398, 0.0);
    uint _1402 = uint(_1400);
    int _1404 = ~_813;
    int _1406 = _1404 + 1;
    int _1408 = _1370 * _1392;
    int _1410 = _1408 + _1262;
    float _1412 = as_type<float>(_881) * _1396;
    bool _1414 = uint(_1410) >= uint(_773);
    int _1416 = _1390 * int(_1380);
    int _1418 = _1416 + _1234;
    bool _1420 = !_1414;
    int _1422 = _1420 ? 0 : (-1);
    float _1424 = trunc(_1412);
    float _1426 = precise::max(_1424, 0.0);
    uint _1428 = uint(_1426);
    int _1430 = ~_1392;
    int _1432 = _1430 + _1422;
    int _1434 = _1432 + 1;
    int _1436 = int(_1354) + int(_1402);
    int _1438 = _773 * _1434;
    int _1440 = _1438 + _1262;
    float _1442 = float(uint(_1418));
    int _1444 = _1406 * _1436;
    int _1446 = _1444 + _1310;
    bool _1448 = !_1330;
    int _1450 = _1448 ? _1440 : (-1);
    float _1452 = as_type<float>(_893) * _1442;
    int _1454 = ~_773;
    int _1456 = _1454 + 1;
    bool _1458 = uint(_1446) >= uint(_813);
    int _1460 = _1450 & 3;
    bool _1462 = _1460 != 0;
    int _1464 = _1450 & 3;
    bool _1466 = _1464 != 0;
    bool _1468 = _1460 != 3;
    bool _1470 = !_1458;
    int _1472 = _1470 ? 0 : (-1);
    int _1474 = int(_1344) + int(_1428);
    int _1476 = _1466 ? 0 : 1;
    float _1478 = trunc(_1452);
    float _1480 = precise::max(_1478, 0.0);
    uint _1482 = uint(_1480);
    bool _1484 = uint(_1460) > 1u;
    bool _1486 = uint(_1460) >= 2u;
    int _1488 = ~_1436;
    int _1490 = _1488 + _1472;
    int _1492 = _1490 + 1;
    bool _1494 = _1360 != 1;
    int _1496 = _1456 * _1474;
    int _1498 = _1496 + _1180;
    int _1500 = _1486 ? 0 : 1;
    int _1502 = _813 * _1492;
    int _1504 = _1502 + _1310;
    int _1506 = ~_1476;
    int _1508 = _1506 + 1;
    int _1510 = _1508 + 1;
    float _1512 = _908 * 2.0;
    int _1514 = ~_1500;
    int _1516 = _1514 + 1;
    int _1518 = _1516 + 1;
    bool _1520 = uint(_1498) >= uint(_773);
    float _1522 = _910 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    int _1524 = _1518;
    int _1526 = _1510;
    if (_1468)
    {
        int _1528 = ~_1500;
        int _1530 = _1528 + 1;
        _1524 = _1530;
    }
    int _1532 = _1524;
    float _1534 = floor(_1512);
    int _1536 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _1538 = _1536 != 0;
    float _1540 = -_801;
    float _1542 = fma(_958, 2.0, _1540);
    bool _1544 = !_1338;
    int _1546 = _1544 ? _1504 : (-1);
    if (!_1484)
    {
        int _1548 = ~_1476;
        int _1550 = _1548 + 1;
        _1526 = _1550;
    }
    int _1552 = _1526;
    bool _1554 = !_1520;
    int _1556 = _1554 ? 0 : (-1);
    float _1558 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _1560 = log2(_1558);
    bool _1562 = !_1538;
    int _1564 = _1562 ? 0 : 1;
    int _1566 = _1546 & 3;
    bool _1568 = _1566 != 0;
    int _1570 = _1546 & 3;
    bool _1572 = _1570 != 0;
    int _1574 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4194304;
    bool _1576 = _1574 != 0;
    int _1578 = _1568 ? 0 : 1;
    bool _1580 = uint(_1570) > 1u;
    bool _1582 = !_1576;
    int _1584 = _1582 ? 0 : 1;
    int _1586 = int(_1380) + int(_1482);
    float _1588 = fma(_1522, -2.0, _799);
    bool _1590 = uint(_1570) >= 2u;
    float _1592 = _1560 * _147;
    int _1594 = ~_813;
    int _1596 = _1594 + 1;
    float _1598 = fma(_147, (*spvDescriptorSet0.vp_c9)._m0[76].y, _1588);
    int _1600 = _1590 ? 0 : 1;
    bool _1602 = _1570 != 3;
    int _1604 = _1596 * _1586;
    int _1606 = _1604 + _1234;
    int _1608 = ~_1578;
    int _1610 = _1608 + 1;
    int _1612 = _1610 + 1;
    int _1614 = _1612;
    float _1616 = _1592;
    if (!_1580)
    {
        int _1618 = ~_1578;
        int _1620 = _1618 + 1;
        _1614 = _1620;
    }
    int _1622 = _1614;
    bool _1624 = uint(_1606) >= uint(_813);
    float _1626 = exp2(_1592);
    int _1628 = ~_1600;
    int _1630 = _1628 + 1;
    int _1632 = _1630 + 1;
    int _1634 = _1632;
    float _1636 = (*spvDescriptorSet0.vp_c9)._m0[83].z;
    if (_1602)
    {
        int _1638 = ~_1600;
        int _1640 = _1638 + 1;
        _1634 = _1640;
    }
    int _1642 = _1634;
    if (!_1494)
    {
        _962 = _910;
    }
    float _1644 = _962;
    bool _1646 = !_1624;
    int _1648 = _1646 ? 0 : (-1);
    float _1650 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    bool _1652 = _1534 > 0.0;
    bool _1654 = _1534 >= 0.0;
    bool _1656 = isnan(_1534);
    bool _1658 = _1654 || _1656;
    bool _1660 = isnan(0.0);
    bool _1662 = _1658 || _1660;
    float _1664 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _1666 = _1644;
    if (_1494)
    {
        _1666 = _908;
    }
    float _1668 = _1666;
    float _1670 = -_1626;
    float _1672 = _1670 + 1.0;
    if (!_1494)
    {
        _934 = _912;
    }
    float _1674 = _934;
    float _1676 = _1674;
    if (_1494)
    {
        _1676 = _910;
    }
    float _1678 = _1676;
    float _1680 = fma(_1668, (*spvDescriptorSet0.vp_c9)._m0[83].z, _1664);
    if (!_1494)
    {
        _1616 = _912;
    }
    float _1682 = _1616;
    float _1684 = _1682;
    if (_1494)
    {
        _1684 = _910;
    }
    float _1686 = _1684;
    float _1688 = fma(_1678, (*spvDescriptorSet0.vp_c9)._m0[83].w, _1650);
    if (!_1494)
    {
        _1636 = _910;
    }
    float _1690 = _1636;
    float _1692 = _1686 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _1694 = _1690;
    if (_1494)
    {
        _1694 = _908;
    }
    float _1696 = _1694;
    float _1698 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    bool _1700 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1702 = isnan(0.0);
    bool _1704 = _1700 || _1702;
    bool _1706 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1708 = _1704 || _1706;
    float _1710 = _1696 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _1712 = _1708 ? _1672 : 0.0;
    bool _1714 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1716 = isnan(1.0);
    bool _1718 = _1714 || _1716;
    bool _1720 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1722 = _1718 || _1720;
    float _1724 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _1726 = 1.0 + _1724;
    float _1728 = fma(_1692, -2.0, _1698);
    float _1730 = _910 * 2.0;
    float _1732 = 1.0 / _1726;
    int _1734 = ~_1586;
    int _1736 = _1734 + _1648;
    int _1738 = _1736 + 1;
    float _1740 = _912 * 2.0;
    float _1742 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _1744 = fma(_147, (*spvDescriptorSet0.vp_c9)._m0[81].y, _1728);
    int _1746 = ~_1474;
    int _1748 = _1746 + _1556;
    int _1750 = _1748 + 1;
    float _1752 = floor(_1730);
    float _1754 = -_1742;
    float _1756 = fma(_1710, 2.0, _1754);
    float _1758 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _1760 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    int _1762 = _773 * _1750;
    int _1764 = _1762 + _1180;
    float _1766 = -_147;
    float _1768 = fma(_1766, (*spvDescriptorSet0.vp_c9)._m0[76].x, _1542);
    float _1770 = fma(_908, (*spvDescriptorSet0.vp_c9)._m0[78].z, _1758);
    float _1772 = fma(_910, (*spvDescriptorSet0.vp_c9)._m0[78].w, _1760);
    float _1774 = floor(_1740);
    int _1776 = _1662 ? 0 : 1;
    float _1778 = fma(_147, (*spvDescriptorSet0.vp_c9)._m0[77].z, _1770);
    float _1780 = fma(_147, (*spvDescriptorSet0.vp_c9)._m0[77].w, _1772);
    float _1782 = fma(_147, (*spvDescriptorSet0.vp_c9)._m0[82].z, _1680);
    float _1784 = fma(_147, (*spvDescriptorSet0.vp_c9)._m0[82].w, _1688);
    float _1786 = -_147;
    float _1788 = fma(_1786, (*spvDescriptorSet0.vp_c9)._m0[81].x, _1756);
    if (_1722)
    {
        float _1790 = _1712 * _1732;
        _151 = _1790;
    }
    float _1792 = _151;
    int _1794 = _813 * _1738;
    int _1796 = _1794 + _1234;
    int _1798 = ~_1776;
    int _1800 = _1798 + 1;
    int _1802 = _1800 + 1;
    bool _1804 = !_1330;
    int _1806 = _1804 ? _1764 : (-1);
    bool _1808 = _1752 >= 0.0;
    bool _1810 = isnan(_1752);
    bool _1812 = _1808 || _1810;
    bool _1814 = isnan(0.0);
    bool _1816 = _1812 || _1814;
    int _1818 = _1802;
    if (!_1652)
    {
        int _1820 = ~_1776;
        int _1822 = _1820 + 1;
        _1818 = _1822;
    }
    int _1824 = _1818;
    bool _1826 = _914 > 0.5;
    bool _1828 = _1752 > 0.0;
    bool _1830 = _1460 != 3;
    int _1832 = _1816 ? 0 : 1;
    float _1834 = in.m_64.x;
    float _1836 = in.m_64.y;
    float _1838 = in.m_64.z;
    bool _1840 = !_1338;
    int _1842 = _1840 ? _1796 : (-1);
    bool _1844 = !_1572;
    int _1846 = _1844 ? 0 : 1;
    float _1848 = in.m_66.x;
    float _1850 = in.m_66.y;
    float _1852 = in.m_66.z;
    bool _1854 = !_1462;
    int _1856 = _1854 ? 0 : 1;
    int _1858 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _1860 = _1858 != 0;
    int _1862 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _1864 = _1862 != 0;
    int _1866 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _1868 = _1866 != 0;
    bool _1870 = !_1830;
    int _1872 = _1870 ? 0 : (-1);
    float _1874 = in.m_68.x;
    float _1876 = in.m_68.y;
    float _1878 = in.m_68.z;
    bool _1880 = _1774 > 0.0;
    bool _1882 = _1774 >= 0.0;
    bool _1884 = isnan(_1774);
    bool _1886 = _1882 || _1884;
    bool _1888 = isnan(0.0);
    bool _1890 = _1886 || _1888;
    float _1892 = in.m_48.x;
    float _1894 = in.m_48.y;
    float _1896 = in.m_48.z;
    int _1898 = ~_1832;
    int _1900 = _1898 + 1;
    int _1902 = _1900 + 1;
    int _1904 = _1902;
    if (!_1828)
    {
        int _1906 = ~_1832;
        int _1908 = _1906 + 1;
        _1904 = _1908;
    }
    int _1910 = _1904;
    bool _1912 = _1570 != 3;
    int _1914 = _1890 ? 0 : 1;
    int _1916 = ~_1914;
    int _1918 = _1916 + 1;
    int _1920 = _1918 + 1;
    int _1922 = _1920;
    if (!_1880)
    {
        int _1924 = ~_1914;
        int _1926 = _1924 + 1;
        _1922 = _1926;
    }
    int _1928 = _1922;
    float _1930 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _183);
    int _1932 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y);
    bool _1934 = _1932 != 0;
    float _1936 = -(*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _1938 = _1936 + (*spvDescriptorSet0.vp_c9)._m0[164].w;
    bool _1940 = !_1860;
    int _1942 = _1940 ? 0 : 1;
    bool _1944 = _908 > 0.5;
    float _1946 = _1894 * _1876;
    float _1948 = _1894 * _1836;
    float _1950 = _1894 * _1850;
    float _1952 = _749 * _1930;
    float _1954 = _491 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1956 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _187);
    float _1958 = 1.0 / _1938;
    float _1960 = fma(_1892, _1834, _1948);
    float _1962 = _1954 * _1956;
    float _1964 = -(*spvDescriptorSet0.vp_c9)._m0[159].x;
    float _1966 = (*spvDescriptorSet0.vp_c9)._m0[160].x + _1964;
    float _1968 = -(*spvDescriptorSet0.vp_c9)._m0[160].x;
    float _1970 = _1968 + (*spvDescriptorSet0.vp_c9)._m0[161].x;
    float _1972 = -(*spvDescriptorSet0.vp_c9)._m0[161].x;
    float _1974 = (*spvDescriptorSet0.vp_c9)._m0[162].x + _1972;
    float _1976 = -(*spvDescriptorSet0.vp_c9)._m0[162].x;
    float _1978 = _1976 + (*spvDescriptorSet0.vp_c9)._m0[163].x;
    float _1980 = _1966 * _928;
    float _1982 = _1970 * _950;
    float _1984 = _1978 * _1030;
    float _1986 = _908 + _910;
    float _1988 = _1974 * _1256;
    float _1990 = -(*spvDescriptorSet0.vp_c9)._m0[163].x;
    float _1992 = (*spvDescriptorSet0.vp_c9)._m0[164].x + _1990;
    float _1994 = -(*spvDescriptorSet0.vp_c9)._m0[164].x;
    float _1996 = _1994 + (*spvDescriptorSet0.vp_c9)._m0[165].x;
    float _1998 = _1986 + (-1.0);
    bool _2000 = _741 >= (*spvDescriptorSet0.vp_c9)._m0[165].w;
    bool _2002 = isnan(_741);
    bool _2004 = _2000 || _2002;
    bool _2006 = isnan((*spvDescriptorSet0.vp_c9)._m0[165].w);
    bool _2008 = _2004 || _2006;
    float _2010 = float(_2008);
    float _2012 = _1992 * _1958;
    float _2014 = _1996 * _1214;
    float _2016 = _912 + _908;
    float _2018 = _912 + _910;
    float _2020 = fma(_1998, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _2022 = _2016 + (-1.0);
    float _2024 = _2018 + (-1.0);
    float _2026 = -_2010;
    float _2028 = _2026 + 1.0;
    int _2030 = abs(_1942);
    float _2032 = fma(_2022, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _2034 = fma(_2024, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    bool _2036 = _741 >= (*spvDescriptorSet0.vp_c9)._m0[164].w;
    bool _2038 = isnan(_741);
    bool _2040 = _2036 || _2038;
    bool _2042 = isnan((*spvDescriptorSet0.vp_c9)._m0[164].w);
    bool _2044 = _2040 || _2042;
    float _2046 = float(_2044);
    float _2048 = -(*spvDescriptorSet0.vp_c9)._m0[159].w;
    float _2050 = _741 + _2048;
    bool _2052 = _741 >= (*spvDescriptorSet0.vp_c9)._m0[163].w;
    bool _2054 = isnan(_741);
    bool _2056 = _2052 || _2054;
    bool _2058 = isnan((*spvDescriptorSet0.vp_c9)._m0[163].w);
    bool _2060 = _2056 || _2058;
    float _2062 = float(_2060);
    float _2064 = fma(_1892, _1874, _1946);
    float _2066 = fma(_1892, _1848, _1950);
    float _2068 = _2046 * _2028;
    float _2070 = -_2046;
    float _2072 = _2070 + 1.0;
    float _2074 = fma(_1980, _2050, (*spvDescriptorSet0.vp_c9)._m0[159].x);
    float _2076 = -(*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _2078 = _741 + _2076;
    bool _2080 = _741 >= (*spvDescriptorSet0.vp_c9)._m0[162].w;
    bool _2082 = isnan(_741);
    bool _2084 = _2080 || _2082;
    bool _2086 = isnan((*spvDescriptorSet0.vp_c9)._m0[162].w);
    bool _2088 = _2084 || _2086;
    float _2090 = float(_2088);
    float _2092 = -_2062;
    float _2094 = _2092 + 1.0;
    float _2096 = _2062 * _2072;
    float _2098 = fma(_1982, _2078, (*spvDescriptorSet0.vp_c9)._m0[160].x);
    bool _2100 = _741 >= (*spvDescriptorSet0.vp_c9)._m0[160].w;
    bool _2102 = isnan(_741);
    bool _2104 = _2100 || _2102;
    bool _2106 = isnan((*spvDescriptorSet0.vp_c9)._m0[160].w);
    bool _2108 = _2104 || _2106;
    float _2110 = float(_2108);
    float _2112 = _2090 * _2094;
    float _2114 = -_2090;
    float _2116 = _2114 + 1.0;
    int _2118 = _1450 >> 31;
    float _2120 = in.m_70.x;
    float _2122 = in.m_70.y;
    float _2124 = in.m_70.z;
    float _2126 = -_2110;
    float _2128 = _2126 + 1.0;
    float _2130 = _863 * _2116;
    float _2132 = -_863;
    float _2134 = _2132 + 1.0;
    float _2136 = -(*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _2138 = _741 + _2136;
    int _2140 = _2118 & 3;
    float _2142 = fma(_1896, _1838, _1960);
    float _2144 = _2110 * _2134;
    float _2146 = float(_2030);
    float _2148 = fma(_1984, _2138, (*spvDescriptorSet0.vp_c9)._m0[162].x);
    float _2150 = float(_1928);
    float _2152 = fma(_1988, _757, (*spvDescriptorSet0.vp_c9)._m0[161].x);
    bool _2154 = !_1864;
    int _2156 = _2154 ? 0 : 1;
    float _2158 = _877 * _2128;
    float _2160 = _908 + (-0.5);
    float _2162 = _2146 * _2150;
    int _2164 = abs(_2156);
    float _2166 = _2074 * _2158;
    float _2168 = -_877;
    float _2170 = _2168 + 1.0;
    float _2172 = _2162 * (-2.0);
    float _2174 = float(_1824);
    float _2176 = _2142 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    bool _2178 = !_1868;
    int _2180 = _2178 ? 0 : 1;
    float _2182 = fma(_2020, _2172, _2020);
    float _2184 = fma(_2172, _2120, _2120);
    float _2186 = float(_2164);
    float _2188 = fma(_2170, (*spvDescriptorSet0.vp_c9)._m0[159].x, _2166);
    int _2190 = abs(_2180);
    float _2192 = fma(_2160, (*spvDescriptorSet0.vp_c9)._m0[196].x, _2184);
    bool _2194 = _910 > 0.5;
    float _2196 = _2186 * _2174;
    float _2198 = _910 + (-0.5);
    float _2200 = fma(_2182, _1792, _2192);
    float _2202 = float(_1910);
    float _2204 = _2196 * (-2.0);
    float _2206 = float(_2190);
    float _2208 = _2200 * 0.15915493667125701904296875;
    float _2210 = fma(_2098, _2144, _2188);
    float _2212 = fma(_2204, _2122, _2122);
    float _2214 = fma(_2034, _2204, _2034);
    float _2216 = _2206 * _2202;
    float _2218 = -(*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _2220 = _741 + _2218;
    float _2222 = fma(_2198, (*spvDescriptorSet0.vp_c9)._m0[196].y, _2212);
    float _2224 = fma(_2152, _2130, _2210);
    float _2226 = _2208 * 6.283185482025146484375;
    float _2228 = sin(_2226);
    float _2230 = fma(_2012, _2220, (*spvDescriptorSet0.vp_c9)._m0[163].x);
    float _2232 = fma(_2214, _1792, _2222);
    float _2234 = _2216 * (-2.0);
    float _2236 = _912 + (-0.5);
    float _2238 = fma(_2148, _2112, _2224);
    float _2240 = _2232 * 0.15915493667125701904296875;
    float _2242 = fma(_2234, _2124, _2124);
    float _2244 = fma(_2032, _2234, _2032);
    float _2246 = fma(_2230, _2096, _2238);
    float _2248 = -(*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _2250 = _741 + _2248;
    float _2252 = fma(_2236, (*spvDescriptorSet0.vp_c9)._m0[196].z, _2242);
    bool _2254 = _741 >= (*spvDescriptorSet0.vp_c9)._m0[166].w;
    bool _2256 = isnan(_741);
    bool _2258 = _2254 || _2256;
    bool _2260 = isnan((*spvDescriptorSet0.vp_c9)._m0[166].w);
    bool _2262 = _2258 || _2260;
    float _2264 = float(_2262);
    float _2266 = -(*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _2268 = _741 + _2266;
    float _2270 = _2240 * 6.283185482025146484375;
    float _2272 = sin(_2270);
    float _2274 = fma(_2244, _1792, _2252);
    float _2276 = fma(_2014, _2250, (*spvDescriptorSet0.vp_c9)._m0[164].x);
    float _2278 = -_2264;
    float _2280 = _2278 + 1.0;
    float _2282 = fma(_1896, _1878, _2064);
    float _2284 = _2274 * 0.15915493667125701904296875;
    int _2286 = _1546 >> 31;
    float _2288 = _2010 * _2280;
    float _2290 = _2240 * 6.283185482025146484375;
    float _2292 = cos(_2290);
    float _2294 = fma(_1276, _2268, (*spvDescriptorSet0.vp_c9)._m0[165].x);
    float _2296 = fma(_2276, _2068, _2246);
    int _2298 = _2286 & 3;
    float _2300 = _1280 * 50.0;
    int _2302 = _1450 + _2140;
    float _2304 = fma(_2294, _2288, _2296);
    float _2306 = fma(_1896, _1852, _2066);
    float _2308 = _2284 * 6.283185482025146484375;
    float _2310 = cos(_2308);
    int _2312 = _1546 + _2298;
    float _2314 = _2228 * _2272;
    float _2316 = fma(_2264, (*spvDescriptorSet0.vp_c9)._m0[166].x, _2304);
    int _2318 = abs(_1856);
    int _2320 = _2312 >> 2;
    float _2322 = _2316 * _2300;
    float _2324 = _2208 * 6.283185482025146484375;
    float _2326 = cos(_2324);
    int _2328 = abs(_1846);
    int _2330 = _2320 << 4;
    int _2332 = _2330 + 512;
    float _2334 = _2322 * _2322;
    int _2336 = abs(_1532);
    bool _2338 = !_1912;
    int _2340 = _2338 ? 0 : (-1);
    float _2342 = _2284 * 6.283185482025146484375;
    float _2344 = sin(_2342);
    float _2346 = _2228 * _2292;
    float _2348 = _2228 * _2310;
    int _2350 = _2302 >> 2;
    float _2352 = _2272 * _2310;
    float _2354 = _2292 * _2310;
    float _2356 = _2348 * _1962;
    int _2358 = _2350 << 4;
    int _2360 = _2358 + 368;
    float _2362 = _2326 * _2292;
    float _2364 = _2326 * _2272;
    float _2366 = _2326 * _2310;
    float _2368 = rsqrt(_2334);
    uint _2370 = uint(int(uint(_2360) >> uint(2)));
    uint _2372 = uint(int(uint(int(_2370)) >> uint(2)));
    int _2374 = int(_2370) & 3;
    float _2376 = (*spvDescriptorSet0.vp_c9)._m0[int(_2372)][_2374];
    int _2378 = int(_2370) + 1;
    uint _2380 = uint(int(uint(_2378) >> uint(2)));
    int _2382 = _2378 & 3;
    float _2384 = (*spvDescriptorSet0.vp_c9)._m0[int(_2380)][_2382];
    int _2386 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _2388 = _2386 != 0;
    float _2390 = _2366 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2392 = _2366 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2394 = -_2364;
    float _2396 = fma(_2344, _2346, _2394);
    float _2398 = -_2346;
    float _2400 = fma(_2344, _2364, _2398);
    float _2402 = _2366 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2404 = fma(_2344, _2362, _2314);
    float _2406 = fma(_2344, _2314, _2362);
    float _2408 = -_1962;
    float _2410 = _2344 * _2408;
    uint _2412 = uint(int(uint(_2332) >> uint(2)));
    uint _2414 = uint(int(uint(int(_2412)) >> uint(2)));
    int _2416 = int(_2412) & 3;
    float _2418 = (*spvDescriptorSet0.vp_c9)._m0[int(_2414)][_2416];
    int _2420 = int(_2412) + 1;
    uint _2422 = uint(int(uint(_2420) >> uint(2)));
    int _2424 = _2420 & 3;
    float _2426 = (*spvDescriptorSet0.vp_c9)._m0[int(_2422)][_2424];
    float _2428 = _2366 * _1962;
    float _2430 = -_2344;
    float _2432 = fma(_2430, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2402);
    float _2434 = -_2344;
    float _2436 = fma(_2434, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2390);
    float _2438 = -_2344;
    float _2440 = fma(_2438, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2392);
    float _2442 = fma(_2354, _1952, _2410);
    float _2444 = fma(_2348, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2432);
    float _2446 = fma(_2348, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2436);
    int _2448 = _2360 + 8;
    uint _2450 = uint(int(uint(_2448) >> uint(2)));
    uint _2452 = uint(int(uint(int(_2450)) >> uint(2)));
    int _2454 = int(_2450) & 3;
    float _2456 = (*spvDescriptorSet0.vp_c9)._m0[int(_2452)][_2454];
    int _2458 = int(_2450) + 1;
    uint _2460 = uint(int(uint(_2458) >> uint(2)));
    int _2462 = _2458 & 3;
    float _2464 = (*spvDescriptorSet0.vp_c9)._m0[int(_2460)][_2462];
    float _2466 = fma(_2348, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2440);
    float _2468 = _2404 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2470 = _2404 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2472 = _2404 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2474 = fma(_2404, _1952, _2428);
    float _2476 = fma(_2396, _1952, _2356);
    float _2478 = fma(_2354, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2468);
    float _2480 = fma(_2354, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2470);
    float _2482 = fma(_2354, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2472);
    float _2484 = 0.5 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    int _2486 = _2332 + 8;
    uint _2488 = uint(int(uint(_2486) >> uint(2)));
    uint _2490 = uint(int(uint(int(_2488)) >> uint(2)));
    int _2492 = int(_2488) & 3;
    float _2494 = (*spvDescriptorSet0.vp_c9)._m0[int(_2490)][_2492];
    int _2496 = int(_2488) + 1;
    uint _2498 = uint(int(uint(_2496) >> uint(2)));
    int _2500 = _2496 & 3;
    float _2502 = (*spvDescriptorSet0.vp_c9)._m0[int(_2498)][_2500];
    float _2504 = trunc((*spvDescriptorSet0.vp_c9)._m0[80].z);
    int _2506 = int(_2504);
    float _2508 = _2322 * _2368;
    float _2510 = fma(_2400, _2484, _2474);
    float _2512 = fma(_2352, _2484, _2442);
    float _2514 = fma(_2406, _2484, _2476);
    int _2516 = abs(_1552);
    float _2518 = _2510 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2520 = _2510 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2522 = _2510 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2524 = _2400 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2526 = fma(_2512, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2518);
    int _2528 = abs(_1622);
    float _2530 = _2400 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2532 = fma(_2512, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2520);
    int _2534 = ~_2528;
    int _2536 = _2534 + 1;
    int _2538 = _2536 + 1;
    float _2540 = fma(_2512, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2522);
    int _2542 = ~_2516;
    int _2544 = _2542 + 1;
    int _2546 = _2544 + 1;
    float _2548 = fma(_2514, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2532);
    float _2550 = fma(_2352, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2524);
    float _2552 = fma(_2352, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2530);
    int _2554 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _2556 = _2554 != 0;
    int _2558 = _2546 * as_type<int>(_2384);
    int _2560 = ~_2318;
    int _2562 = _2560 + 1;
    int _2564 = _2562 + 1;
    float _2566 = _2548 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    int _2568 = abs(_2506);
    int _2570 = _2564 * as_type<int>(_2376);
    int _2572 = _2570 + _2558;
    float _2574 = fma(_2514, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2526);
    int _2576 = ~_2336;
    int _2578 = _2576 + 1;
    int _2580 = _2578 + 1;
    int _2582 = _2538 * as_type<int>(_2426);
    int _2584 = ~_2328;
    int _2586 = _2584 + 1;
    int _2588 = _2586 + 1;
    float _2590 = trunc((*spvDescriptorSet0.vp_c9)._m0[85].z);
    int _2592 = int(_2590);
    float _2594 = float(uint(_2506));
    float _2596 = fma(_2514, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2540);
    int _2598 = _2580 * as_type<int>(_2456);
    int _2600 = _2598 + _2572;
    int _2602 = abs(_1642);
    int _2604 = _2588 * as_type<int>(_2418);
    int _2606 = _2604 + _2582;
    int _2608 = abs(_1872);
    int _2610 = abs(_2340);
    float _2612 = 1.0 / _2594;
    int _2614 = ~_2602;
    int _2616 = _2614 + 1;
    int _2618 = _2616 + 1;
    int _2620 = abs(_1564);
    int _2622 = _2618 * as_type<int>(_2494);
    int _2624 = _2622 + _2606;
    float _2626 = float(uint(_2592));
    int _2628 = ~_2610;
    int _2630 = _2628 + 1;
    int _2632 = _2630 + 1;
    int _2634 = ~_2608;
    int _2636 = _2634 + 1;
    int _2638 = _2636 + 1;
    float _2640 = float(uint(_2568));
    int _2642 = _2632 * as_type<int>(_2502);
    int _2644 = _2642 + _2624;
    float _2646 = _2574 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _2648 = _2566 * _2566;
    int _2650 = abs(_1584);
    float _2652 = _2596 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _2654 = _2282 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _2656 = fma(_2646, _2646, _2648);
    int _2658 = ~_2620;
    int _2660 = _2658 + 1;
    int _2662 = _2660 + 1;
    int _2664 = _2638 * as_type<int>(_2464);
    int _2666 = _2664 + _2600;
    float _2668 = 1.0 / _2626;
    float _2670 = fma(_2652, _2652, _2656);
    float _2672 = _2654 + _2646;
    int _2674 = _2666 * _2662;
    int _2676 = abs(_2592);
    float _2678 = _2306 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    int _2680 = ~_2592;
    int _2682 = _2680 + 1;
    int _2684 = _1806 * _2620;
    int _2686 = _2684 + _2674;
    float _2688 = 1.0 / _2640;
    float _2690 = float(uint(_2676));
    float _2692 = _2678 + _2652;
    float _2694 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _2696 = _2672 + _2694;
    int _2698 = abs(_2686);
    float _2700 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _2702 = _2692 + _2700;
    float _2704 = _2696 * _2696;
    float _2706 = rsqrt(_2670);
    int _2708 = ~_2650;
    int _2710 = _2708 + 1;
    int _2712 = _2710 + 1;
    float _2714 = _2702 * _2702;
    int _2716 = _2644 * _2712;
    float _2718 = _2704 + _2714;
    float _2720 = sqrt(_2334);
    int _2722 = _1842 * _2650;
    int _2724 = _2722 + _2716;
    int _2726 = as_type<int>(_2612) + (-2);
    float _2728 = _2400 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2730 = float(uint(_2686));
    int _2732 = as_type<int>(_2668) + (-2);
    float _2734 = 1.0 / _2690;
    float _2736 = float(uint(_2724));
    float _2738 = as_type<float>(_2726) * _2730;
    float _2740 = _2566 * _2706;
    float _2742 = fma(_2352, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2728);
    int _2744 = ~_2506;
    int _2746 = _2744 + 1;
    float _2748 = as_type<float>(_2732) * _2736;
    float _2750 = _2508 * _2740;
    float _2752 = trunc(_2738);
    float _2754 = precise::max(_2752, 0.0);
    uint _2756 = uint(_2754);
    int _2758 = abs(_2724);
    float _2760 = _2750 * _2720;
    int _2762 = as_type<int>(_2688) + (-2);
    float _2764 = fma(_2508, _2760, _2566);
    float _2766 = trunc(_2748);
    float _2768 = precise::max(_2766, 0.0);
    uint _2770 = uint(_2768);
    float _2772 = fma(_2406, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2550);
    float _2774 = float(uint(_2698));
    int _2776 = as_type<int>(_2734) + (-2);
    float _2778 = float(uint(_2758));
    float _2780 = sqrt(_2718);
    int _2782 = _2746 * int(_2756);
    int _2784 = _2782 + _2686;
    float _2786 = as_type<float>(_2762) * _2774;
    float _2788 = fma(_2406, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2552);
    float _2790 = as_type<float>(_2776) * _2778;
    float _2792 = fma(_2406, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2742);
    int _2794 = ~_2568;
    int _2796 = _2794 + 1;
    int _2798 = _2682 * int(_2770);
    int _2800 = _2798 + _2724;
    float _2802 = trunc(_2786);
    float _2804 = precise::max(_2802, 0.0);
    uint _2806 = uint(_2804);
    float _2808 = float(uint(_2784));
    float _2810 = -_187;
    int _2812 = _1826 ? as_type<int>(_2810) : as_type<int>(_187);
    float _2814 = float(uint(_2800));
    float _2816 = as_type<float>(_2726) * _2808;
    bool _2818 = _2780 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2820 = trunc(_2790);
    float _2822 = precise::max(_2820, 0.0);
    uint _2824 = uint(_2822);
    float _2826 = _2176 + _2764;
    int _2828 = ~_2676;
    int _2830 = _2828 + 1;
    float _2832 = as_type<float>(_2732) * _2814;
    bool _2834 = _912 > 0.5;
    float _2836 = trunc(_2816);
    float _2838 = precise::max(_2836, 0.0);
    uint _2840 = uint(_2838);
    float _2842 = _2508;
    float _2844 = as_type<float>(_2732);
    float _2846 = _2826;
    float _2848 = _2704;
    float _2850 = _2692;
    float _2852 = _2654;
    float _2854 = _2792;
    if (!_2818)
    {
        _2842 = _2672;
    }
    float _2856 = _2842;
    int _2858 = _2796 * int(_2806);
    int _2860 = _2858 + _2698;
    float _2862 = _2856;
    if (!_2818)
    {
        _2844 = _2714;
    }
    float _2864 = _2844;
    int _2866 = _2830 * int(_2824);
    int _2868 = _2866 + _2758;
    float _2870 = float(uint(_2860));
    float _2872 = float(uint(_2868));
    bool _2874 = !_2818;
    float _2876 = _2864;
    if (!_2874)
    {
        float _2878 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2880 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _2882 = _2780 + _2880;
        float _2884 = _2826 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2886 = rsqrt(_2718);
        float _2888 = _2882 * _2878;
        float _2890 = _2888 * 0.15915493667125701904296875;
        float _2892 = _2890 * 6.283185482025146484375;
        float _2894 = sin(_2892);
        float _2896 = _2890 * 6.283185482025146484375;
        float _2898 = cos(_2896);
        float _2900 = fma(_2894, _2884, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _2902 = _2886 * _2900;
        float _2904 = fma(_2696, _2902, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _2906 = _2898 + (-1.0);
        float _2908 = fma(_2702, _2902, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _2910 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _2912 = _2904 + _2910;
        float _2914 = _2906 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2916 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _2918 = _2908 + _2916;
        float _2920 = _2912 * _2912;
        float _2922 = fma(_2826, _2898, _2914);
        float _2924 = _2918 * _2918;
        _2846 = _2922;
        _2848 = _2920;
        _2876 = _2924;
        _2862 = _2904;
        _2850 = _2908;
    }
    float _2926 = _2846;
    float _2928 = _2848;
    float _2930 = _2876;
    float _2932 = _2862;
    float _2934 = _2850;
    float _2936 = as_type<float>(_2762) * _2870;
    float _2938 = as_type<float>(_2776) * _2872;
    float _2940 = trunc(_2832);
    float _2942 = precise::max(_2940, 0.0);
    uint _2944 = uint(_2942);
    float _2946 = -_187;
    int _2948 = _2194 ? as_type<int>(_2946) : as_type<int>(_187);
    float _2950 = _187 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    int _2952 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _2954 = _2952 != 0;
    float _2956 = fma(_2396, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2478);
    float _2958 = -_183;
    int _2960 = _1944 ? as_type<int>(_2958) : as_type<int>(_183);
    float _2962 = fma(_2396, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2480);
    float _2964 = -_183;
    int _2966 = _2834 ? as_type<int>(_2964) : as_type<int>(_183);
    float _2968 = trunc(_2936);
    float _2970 = precise::max(_2968, 0.0);
    uint _2972 = uint(_2970);
    float _2974 = fma(_2396, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2482);
    bool _2976 = !_2388;
    float _2978 = _2976 ? _187 : as_type<float>(_2812);
    float _2980 = _2950 * _2446;
    bool _2982 = !_2954;
    float _2984 = _2982 ? _187 : as_type<float>(_2948);
    float _2986 = _2950 * _2466;
    bool _2988 = !_1934;
    float _2990 = _2988 ? _183 : as_type<float>(_2960);
    float _2992 = _2950 * _2444;
    float _2994 = trunc(_2938);
    float _2996 = precise::max(_2994, 0.0);
    uint _2998 = uint(_2996);
    bool _3000 = !_2556;
    float _3002 = _3000 ? _183 : as_type<float>(_2966);
    float _3004 = _183 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    int _3006 = int(_2770) + int(_2944);
    float _3008 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _3010 = _2926 + _3008;
    int _3012 = int(_2756) + int(_2840);
    float _3014 = fma(_3004, _2956, _2992);
    float _3016 = fma(_3004, _2962, _2980);
    float _3018 = fma(_3004, _2974, _2986);
    int _3020 = ~_2568;
    int _3022 = _3020 + 1;
    float _3024 = fma(_3010, _3010, _2928);
    int _3026 = int(_2806) + int(_2972);
    float _3028 = -_1778;
    float _3030 = _3028 + 1.0;
    int _3032 = ~_2506;
    int _3034 = _3032 + 1;
    float _3036 = -_1782;
    float _3038 = _3036 + 1.0;
    int _3040 = ~_2592;
    int _3042 = _3040 + 1;
    int _3044 = _3022 * _3026;
    int _3046 = _3044 + _2698;
    int _3048 = int(_2824) + int(_2998);
    int _3050 = _3034 * _3012;
    int _3052 = _3050 + _2686;
    int _3054 = ~_2676;
    int _3056 = _3054 + 1;
    int _3058 = _3042 * _3006;
    int _3060 = _3058 + _2724;
    bool _3062 = uint(_3046) >= uint(_2568);
    float _3064 = _3024 + _2930;
    bool _3066 = uint(_3052) >= uint(_2506);
    float _3068 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    bool _3070 = uint(_3060) >= uint(_2592);
    int _3072 = _3056 * _3048;
    int _3074 = _3072 + _2758;
    bool _3076 = !_3066;
    int _3078 = _3076 ? 0 : (-1);
    float _3080 = -_1780;
    float _3082 = _3080 + 1.0;
    bool _3084 = !_3070;
    int _3086 = _3084 ? 0 : (-1);
    float _3088 = -_1784;
    float _3090 = _3088 + 1.0;
    int _3092 = ~_3012;
    int _3094 = _3092 + _3078;
    int _3096 = _3094 + 1;
    float _3098 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    int _3100 = ~_3006;
    int _3102 = _3100 + _3086;
    int _3104 = _3102 + 1;
    out.m_72.x = _705;
    out.m_72.y = _707;
    out.m_72.z = _709;
    out.m_72.w = _711;
    int _3106 = _2686 ^ _2506;
    bool _3108 = uint(_3074) >= uint(_2676);
    int _3110 = _2506 * _3096;
    int _3112 = _3110 + _2686;
    bool _3114 = !_3062;
    int _3116 = _3114 ? 0 : (-1);
    float _3118 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    uint _3120 = uint(int(uint(_3106) >> uint(31)));
    int _3122 = _2592 * _3104;
    int _3124 = _3122 + _2724;
    bool _3126 = _2506 == 0;
    out.m_74.x = _2956;
    out.m_74.y = _2962;
    out.m_74.z = _2974;
    bool _3128 = _2506 == 0;
    int _3130 = _2724 ^ _2592;
    float _3132 = sqrt(_3064);
    int _3134 = ~_3116;
    int _3136 = _3026 + _3134;
    int _3138 = _3136 + 1;
    int _3140 = ~int(_3120);
    int _3142 = _3140 + 1;
    bool _3144 = !_3108;
    int _3146 = _3144 ? 0 : (-1);
    uint _3148 = uint(int(uint(_3130) >> uint(31)));
    float _3150 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    bool _3152 = !_3126;
    int _3154 = _3152 ? _3112 : (-1);
    float _3156 = _3118 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    bool _3158 = _2592 == 0;
    bool _3160 = _2592 == 0;
    float _3162 = _3068 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    int _3164 = _3138 ^ _3142;
    float _3166 = fma(_2950, _2950, 1.0);
    int _3168 = ~_3146;
    int _3170 = _3048 + _3168;
    int _3172 = _3170 + 1;
    int _3174 = ~int(_3148);
    int _3176 = _3174 + 1;
    float _3178 = float(_3154);
    float _3180 = rsqrt(_3166);
    int _3182 = ~_3142;
    int _3184 = _3182 + _3164;
    int _3186 = _3184 + 1;
    int _3188 = _3172 ^ _3176;
    float _3190 = fma(_3162, _3178, _1768);
    bool _3192 = !_3158;
    int _3194 = _3192 ? _3124 : (-1);
    bool _3196 = !_3128;
    int _3198 = _3196 ? _3186 : (-1);
    int _3200 = ~_3176;
    int _3202 = _3200 + _3188;
    int _3204 = _3202 + 1;
    float _3206 = _2990 + 0.5;
    float _3208 = float(_3194);
    float _3210 = float(_3198);
    float _3212 = _3098 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    bool _3214 = !_3160;
    int _3216 = _3214 ? _3204 : (-1);
    float _3218 = fma(_3162, _3206, _3190);
    float _3220 = fma(_3156, _3208, _1788);
    float _3222 = -_1598;
    float _3224 = fma(_3212, _3210, _3222);
    float _3226 = float(_3216);
    float _3228 = _3002 + 0.5;
    float _3230 = _3150 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _3232 = _2984 + (-0.5);
    bool _3234 = _3132 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _3236 = isnan(_3132);
    bool _3238 = _3234 || _3236;
    bool _3240 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _3242 = _3238 || _3240;
    float _3244 = fma(_3156, _3228, _3220);
    float _3246 = -_1744;
    float _3248 = fma(_3230, _3226, _3246);
    float _3250 = _2950 * _3180;
    float _3252 = -_3212;
    float _3254 = fma(_3252, _3232, _3224);
    float _3256 = _2978 + (-0.5);
    float _3258 = -_2788;
    float _3260 = _3250 * _3258;
    float _3262 = -_2772;
    float _3264 = _3250 * _3262;
    float _3266 = -_2792;
    float _3268 = _3250 * _3266;
    float _3270 = -_3230;
    float _3272 = fma(_3270, _3256, _3248);
    float _3274 = fma(_3180, _2446, _3260);
    float _3276 = _2772 + _3014;
    float _3278 = -_3030;
    float _3280 = fma(_2990, _3278, _3218);
    float _3282 = fma(_3180, _2444, _3264);
    float _3284 = fma(_3180, _2466, _3268);
    float _3286 = _2788 + _3016;
    float _3288 = -_3038;
    float _3290 = fma(_3002, _3288, _3244);
    float _3292 = fma(_2984, _3082, _3254);
    float _3294 = fma(_2978, _3090, _3272);
    float _3296 = _2792 + _3018;
    out.m_76.x = _3282;
    out.m_76.y = _3274;
    out.m_76.z = _3284;
    float _3298 = _3030;
    float _3300 = _3082;
    float _3302 = _3218;
    if (!_3242)
    {
        _3298 = 1.0;
    }
    float _3304 = _3298;
    out.m_78.x = _3280;
    out.m_78.y = _3292;
    out.m_78.z = _3290;
    out.m_78.w = _3294;
    out.m_80.x = _3276;
    out.m_80.y = _3286;
    out.m_80.z = _3296;
    bool _3306 = !_3242;
    float _3308 = _3304;
    if (!_3306)
    {
        bool _3310 = _3132 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _3312 = isnan(_3132);
        bool _3314 = _3310 || _3312;
        bool _3316 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _3318 = _3314 || _3316;
        if (!_3318)
        {
            float _3320 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _3322 = _3132 + _3320;
            float _3324 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _3326 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _3324;
            float _3328 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _3330 = _3328 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _3332 = 1.0 / _3326;
            float _3334 = _3322 * _3332;
            float _3336 = fma(_3334, _3330, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _3308 = _3336;
            _3338 = true;
        }
        else
        {
            bool _3340 = _3132 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _3342 = isnan(_3132);
            bool _3344 = _3340 || _3342;
            bool _3346 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _3348 = _3344 || _3346;
            if (!_3348)
            {
                float _3350 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _3352 = _3132 + _3350;
                float _3354 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _3356 = _3354 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _3358 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _3360 = _3358 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _3362 = 1.0 / _3356;
                float _3364 = _3352 * _3362;
                float _3366 = fma(_3364, _3360, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _3308 = _3366;
                _3338 = true;
            }
            else
            {
                _3308 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _3338 = false;
    float _3368 = _3308;
    float _3370 = _2176 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _3372 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _3374 = _2932 + _3372;
    float _3376 = fma(_2654, (*spvDescriptorSet0.vp_c8)._m0[11].x, _3370);
    float _3378 = _2176 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _3380 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _3382 = _2934 + _3380;
    float _3384 = fma(_2678, (*spvDescriptorSet0.vp_c8)._m0[11].z, _3376);
    bool _3386 = (*spvDescriptorSet0.vp_c15)._m0[660].y >= 0.5;
    bool _3388 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _3390 = _3386 || _3388;
    bool _3392 = isnan(0.5);
    bool _3394 = _3390 || _3392;
    float _3396 = fma(_3374, _3368, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    bool _3398 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _3400 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _3402 = _3398 || _3400;
    bool _3404 = isnan(0.5);
    bool _3406 = _3402 || _3404;
    float _3408 = _3384 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _3410 = fma(_2654, (*spvDescriptorSet0.vp_c8)._m0[10].x, _3378);
    float _3412 = 1.0 / _3408;
    float _3414 = fma(_2678, (*spvDescriptorSet0.vp_c8)._m0[10].z, _3410);
    float _3416 = _3414 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _3418 = (*spvDescriptorSet0.vp_c15)._m0[660].y;
    float _3420 = _3408;
    if (_3406)
    {
        _3418 = 1.0;
    }
    float _3422 = _3418;
    float _3424 = _3416 + _3408;
    float _3426 = _3424 * _3412;
    float _3428 = _3426 * 0.5;
    float _3430 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _3432 = _2926 + _3430;
    float _3434 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _3436 = fma(_3428, (*spvDescriptorSet0.vp_c8)._m0[30].w, _3434);
    float _3438 = fma(_3432, _3368, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _3440 = fma(_3382, _3368, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _3442 = _3432;
    float _3444 = _3428;
    float _3446 = _3422;
    if (_3394)
    {
        _3442 = _3396;
    }
    float _3448 = _3442;
    float _3450 = 1.0 / _3436;
    float _3452 = _3448;
    if (_3394)
    {
        _3444 = _3438;
    }
    float _3454 = _3444;
    float _3456 = _3454;
    if (_3394)
    {
        _3420 = _3440;
    }
    float _3458 = _3420;
    float _3460 = _3458;
    if (!_3394)
    {
        float _3462 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _3464 = _2176 + _3462;
        float _3466 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _3468 = _2654 + _3466;
        float _3470 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _3472 = _3464 * _3464;
        float _3474 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _3476 = _2678 + _3474;
        float _3478 = fma(_3468, _3468, _3472);
        float _3480 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _3482 = fma(_3476, _3476, _3478);
        float _3484 = sqrt(_3482);
        float _3486 = _3470 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _3488 = precise::min(_3484, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _3490 = _3488 * _3480;
        float _3492 = -_2176;
        float _3494 = _3492 + _3438;
        float _3496 = _3486 * _3490;
        float _3498 = -_2654;
        float _3500 = _3498 + _3396;
        float _3502 = -_2678;
        float _3504 = _3502 + _3440;
        float _3506 = fma(_3494, _3496, _2176);
        float _3508 = fma(_3500, _3496, _2654);
        float _3510 = fma(_3504, _3496, _2678);
        _3456 = _3506;
        _3452 = _3508;
        _3460 = _3510;
    }
    float _3512 = _3456;
    float _3514 = _3452;
    float _3516 = _3460;
    float _3518 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _3520 = _3450 * _3518;
    if (!_3406)
    {
        float _3522 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _3524 = _3522 * 0.15915493667125701904296875;
        float _3526 = _3524 * 6.283185482025146484375;
        float _3528 = cos(_3526);
        float _3530 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _3532 = _3530 * 0.15915493667125701904296875;
        float _3534 = _3524 * 6.283185482025146484375;
        float _3536 = sin(_3534);
        float _3538 = 1.0 / _3528;
        float _3540 = _3532 * 6.283185482025146484375;
        float _3542 = cos(_3540);
        float _3544 = _3536 * _3538;
        float _3546 = _3532 * 6.283185482025146484375;
        float _3548 = sin(_3546);
        float _3550 = _3542 * _3544;
        float _3552 = 1.0 / _3550;
        float _3554 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _3556 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _3554;
        float _3558 = 1.0 / _3556;
        float _3560 = _3548 * _3552;
        float _3562 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _3564 = fma(_3520, _3560, _3562);
        float _3566 = _3564 * _3558;
        float _3568 = precise::clamp(_3566, 0.0, 1.0);
        _3300 = _3524;
        _3446 = _3568;
    }
    float _3570 = _3300;
    float _3572 = _3446;
    float _3574 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _3576 = _3512 + _3574;
    float _3578 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _3580 = _3514 + _3578;
    float _3582 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _3584 = _3516 + _3582;
    float _3586 = _3576 * _3576;
    float _3588 = fma(_3580, _3580, _3586);
    float _3590 = fma(_2654, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _3592 = fma(_3584, _3584, _3588);
    float _3594 = rsqrt(_3592);
    float _3596 = _3594 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _3598 = _3580 * _3596;
    float _3600 = _3584 * _3596;
    float _3602 = _3598 * _3598;
    float _3604 = _3600 * _3600;
    float _3606 = _3602 + _3604;
    float _3608 = sqrt(_3606);
    bool _3610 = _3608 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _3612 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _3614 = _3608 + _3612;
    float _3616 = _3584;
    float _3618 = _3586;
    float _3620 = _3614;
    float _3622 = _3576;
    float _3624 = _3570;
    float _3626 = _3606;
    if (_3610)
    {
        float _3628 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _3616 = _3628;
    }
    float _3630 = _3616;
    if (_3610)
    {
        float _3632 = rsqrt(_3606);
        _3618 = _3632;
    }
    float _3634 = _3618;
    float _3636 = _3634;
    if (_3610)
    {
        float _3638 = _3614 * _3630;
        _3620 = _3638;
    }
    float _3640 = _3620;
    if (_3610)
    {
        float _3642 = _3640 * 0.15915493667125701904296875;
        _3302 = _3642;
    }
    float _3644 = _3302;
    float _3646 = _3630;
    if (_3610)
    {
        float _3648 = _3644 * 6.283185482025146484375;
        float _3650 = sin(_3648);
        _3646 = _3650;
    }
    float _3652 = _3646;
    float _3654 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _3656 = precise::max(0.0, _3654);
    float _3658 = _3594;
    float _3660 = _3656;
    if (_3610)
    {
        float _3662 = _3644 * 6.283185482025146484375;
        float _3664 = cos(_3662);
        _3658 = _3664;
    }
    float _3666 = _3658;
    float _3668 = -_3596;
    float _3670 = -_3656;
    float _3672 = fma(_3576, _3668, _3670);
    if (!_3610)
    {
        _3622 = _3602;
    }
    float _3674 = _3622;
    float _3676 = _3674;
    if (_3610)
    {
        float _3678 = _3672 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _3660 = _3678;
    }
    float _3680 = _3660;
    float _3682 = _3680;
    if (!_3610)
    {
        _2852 = _3672;
    }
    float _3684 = _2852;
    float _3686 = _3684;
    if (_3610)
    {
        float _3688 = fma(_3652, _3680, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _3624 = _3688;
    }
    float _3690 = _3624;
    float _3692 = sqrt(_3592);
    float _3694 = _3666;
    if (_3610)
    {
        float _3696 = _3666 + (-1.0);
        _3682 = _3696;
    }
    float _3698 = _3682;
    float _3700 = _3698;
    if (_3610)
    {
        float _3702 = _3634 * _3690;
        _2854 = _3702;
    }
    float _3704 = _2854;
    if (!_3610)
    {
        _3636 = _3598;
    }
    float _3706 = _3636;
    float _3708 = _3706;
    if (_3610)
    {
        float _3710 = _3698 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _3626 = _3710;
    }
    float _3712 = _3626;
    if (_3610)
    {
        float _3714 = _3598 * _3704;
        _3708 = _3714;
    }
    float _3716 = _3708;
    if (!_3610)
    {
        _3700 = _3600;
    }
    float _3718 = _3700;
    float _3720 = _3718;
    if (_3610)
    {
        float _3722 = _3600 * _3704;
        _3720 = _3722;
    }
    float _3724 = _3720;
    if (_3610)
    {
        float _3726 = fma(_3672, _3666, _3712);
        _3686 = _3726;
    }
    float _3728 = _3686;
    if (_3610)
    {
        float _3730 = _3716 * _3716;
        _3676 = _3730;
    }
    float _3732 = _3676;
    float _3734 = _3512 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    if (!_3610)
    {
        _3694 = _3604;
    }
    float _3736 = _3694;
    float _3738 = _3736;
    if (_3610)
    {
        float _3740 = _3724 * _3724;
        _3738 = _3740;
    }
    float _3742 = _3738;
    float _3744 = fma(_3728, _3728, _3732);
    float _3746 = fma(_3514, (*spvDescriptorSet0.vp_c8)._m0[2].x, _3734);
    float _3748 = floor(_3590);
    float _3750 = _3744 + _3742;
    float _3752 = fma(_3516, (*spvDescriptorSet0.vp_c8)._m0[2].z, _3746);
    float _3754 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _3756 = fma(_3692, (*spvDescriptorSet0.vp_c15)._m0[23].w, _3754);
    float _3758 = precise::clamp(_3756, 0.0, 1.0);
    float _3760 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _3762 = _3752 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _3764 = -_3758;
    float _3766 = _3764 + 1.0;
    float _3768 = rsqrt(_3750);
    float _3770 = _3762 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _3772 = fma(_2678, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _3774 = _3512 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _3776 = -_3770;
    float _3778 = fma(_3776, _3760, 1.0);
    float _3780 = _3512 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _3782 = abs(_3766);
    float _3784 = log2(_3782);
    float _3786 = _3512 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _3788 = fma(_3514, (*spvDescriptorSet0.vp_c8)._m0[3].x, _3774);
    float _3790 = fma(_3514, (*spvDescriptorSet0.vp_c8)._m0[0].x, _3780);
    float _3792 = fma(_3514, (*spvDescriptorSet0.vp_c8)._m0[1].x, _3786);
    float _3794 = fma(_3516, (*spvDescriptorSet0.vp_c8)._m0[0].z, _3790);
    float _3796 = _3768 * _3716;
    float _3798 = fma(_3516, (*spvDescriptorSet0.vp_c8)._m0[1].z, _3792);
    float _3800 = _3768 * _3728;
    float _3802 = _3768 * _3724;
    float _3804 = _3796 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _3806 = _3798 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _3808 = _3794 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _3810 = fma(_3516, (*spvDescriptorSet0.vp_c8)._m0[3].z, _3788);
    float _3812 = -_3804;
    float _3814 = fma(_3800, (*spvDescriptorSet0.vp_c15)._m0[21].y, _3812);
    float _3816 = _3806 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _3818 = floor(_3772);
    float _3820 = _3810 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _3822 = -_3802;
    float _3824 = fma(_3822, (*spvDescriptorSet0.vp_c15)._m0[21].z, _3814);
    float _3826 = fma(_3808, (*spvDescriptorSet0.vp_c8)._m0[7].x, _3816);
    float _3828 = _3784 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _3830 = fma(_3824, -0.5, 0.5);
    float _3832 = fma(_3762, (*spvDescriptorSet0.vp_c8)._m0[7].z, _3826);
    float _3834 = log2(_3778);
    float _3836 = _3806 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _3838 = fma(_3820, (*spvDescriptorSet0.vp_c8)._m0[7].w, _3832);
    float _3840 = fma(_3808, (*spvDescriptorSet0.vp_c8)._m0[4].x, _3836);
    float _3842 = exp2(_3828);
    float _3844 = -_3748;
    float _3846 = _3590 + _3844;
    float _3848 = fma(_3824, 0.5, 0.5);
    float _3850 = _3806 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _3852 = -_3818;
    float _3854 = _3772 + _3852;
    float _3856 = fma(_3762, (*spvDescriptorSet0.vp_c8)._m0[4].z, _3840);
    float _3858 = fma(_3808, (*spvDescriptorSet0.vp_c8)._m0[5].x, _3850);
    float _3860 = sqrt(_3830);
    float _3862 = fma(_3848, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _3864 = fma(_3820, (*spvDescriptorSet0.vp_c8)._m0[4].w, _3856);
    float _3866 = fma(_3762, (*spvDescriptorSet0.vp_c8)._m0[5].z, _3858);
    float _3868 = _3834 * 0.693147182464599609375;
    float _3870 = fma(_3848, _3862, -0.212114393711090087890625);
    float _3872 = fma(_3820, (*spvDescriptorSet0.vp_c8)._m0[5].w, _3866);
    float _3874 = 1.0 / _3838;
    float _3876 = _3800 + 1.0;
    float _3878 = fma(_3848, _3870, 1.570728778839111328125);
    float2 _10100 = float2(_3846, _3854);
    float _3880 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_10100, float2(0.0), isnan(_10100)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_10100, float2(0.0), isnan(_10100)), level(0.0)).x;
    float _3882 = -_3800;
    float _3884 = fma(_3842, _3876, _3882);
    float _3886 = _3860 * 0.636619746685028076171875;
    float _3888 = -_3878;
    float _3890 = fma(_3886, _3888, 1.0);
    float _3892 = _3868 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _3894 = fma(_3884, 0.5, 0.5);
    float _3896 = _3864 * _3874;
    float _3898 = _3872 * _3874;
    float _3900 = fma(_3896, 0.5, 0.5);
    float _3902 = fma(_3898, -0.5, 0.5);
    float3 _10141 = float3(_3900, _3902, _3892);
    float _3904 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_10141, float3(0.0), isnan(_10141)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_10141, float3(0.0), isnan(_10141)), level(0.0)).x;
    float3 _10152 = float3(_3900, _3902, _3892);
    float4 _3907 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_10152, float3(0.0), isnan(_10152)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_10152, float3(0.0), isnan(_10152)), level(0.0)).xyzw;
    float _3909 = _3907.x;
    float _3911 = _3907.y;
    float _3913 = _3907.z;
    float _3915 = _3907.w;
    float2 _10168 = float2(_3890, _3894);
    float3 _3919 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_10168, float2(0.0), isnan(_10168)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_10168, float2(0.0), isnan(_10168)), level(0.0)).xyz;
    float _3921 = _3919.x;
    float _3923 = _3919.y;
    float _3925 = _3919.z;
    float _3927 = abs(_3520);
    float _3929 = log2(_3927);
    float _3931 = _3806 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    out.m_82.x = _3514;
    out.m_82.y = _3512;
    out.m_82.z = _3516;
    bool _3933 = _3692 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _3935 = isnan(_3692);
    bool _3937 = _3933 || _3935;
    bool _3939 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _3941 = _3937 || _3939;
    float _3943 = fma(_3808, (*spvDescriptorSet0.vp_c8)._m0[6].x, _3931);
    float _3945 = fma(_3762, (*spvDescriptorSet0.vp_c8)._m0[6].z, _3943);
    float _3947 = in.m_84.x;
    float _3949 = fma(_3820, (*spvDescriptorSet0.vp_c8)._m0[6].w, _3945);
    bool _3951 = _3520 <= 8000.0;
    bool _3953 = isnan(_3520);
    bool _3955 = _3951 || _3953;
    bool _3957 = isnan(8000.0);
    bool _3959 = _3955 || _3957;
    float _3961 = float(_3959);
    float _3963 = _3929 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _3965 = exp2(_3963);
    out.gl_Position.x = _3864;
    out.gl_Position.y = _3872;
    out.gl_Position.z = _3949;
    out.gl_Position.w = _3838;
    float _3967 = _3872;
    float _3969 = _3838;
    float _3971 = _3949;
    if (!_3941)
    {
        _3967 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _3973 = _3967;
    float _3975 = fma(_3965, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _3977 = precise::clamp(_3975, 0.0, 1.0);
    float _3979 = fma(_3977, -2.0, 3.0);
    float _3981 = _3977 * _3977;
    float _3983 = _3981 * _3979;
    float _3985 = _3784 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _3987 = -_3983;
    float _3989 = _3987 + 1.0;
    float _3991 = exp2(_3985);
    float _3993 = fma(_3989, (*spvDescriptorSet0.vp_c15)._m0[654].w, _3983);
    float _3995 = _3949 + _3838;
    float _3997 = _3973;
    float _3999 = _3973;
    if (!_3941)
    {
        _3969 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _4001 = _3969;
    float _4003 = _3961 * _3993;
    float _4005 = _3995 * 0.5;
    float _4007 = _4003 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _4009 = _4001;
    float _4011 = _4001;
    if (!_3941)
    {
        _3971 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _4013 = _3971;
    out.m_86.z = _4005;
    out.m_86.w = _3838;
    float _4015 = -_3991;
    float _4017 = _4015 + 1.0;
    float _4019 = _4017 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _4021 = -_4019;
    float _4023 = _4021 + 1.0;
    float _4025 = -_3880;
    float _4027 = _4025 + 1.0;
    float _4029 = _4027 * _4007;
    float _4031 = precise::clamp(_4029, 0.0, 1.0);
    float _4033 = -_4031;
    float _4035 = fma(_4033, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _4037 = _4035 * _3947;
    float _4039 = _4037 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    out.m_88.x = _4039;
    float _4041 = _4019 * _3904;
    float _4043 = _3915 * _4023;
    float _4045 = _4023;
    float _4047 = _3909;
    float _4049 = _4013;
    float _4051 = _4013;
    if (!_3941)
    {
        _4045 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _4053 = _4045;
    float _4055 = _3915 * _4041;
    float _4057 = _3925 * _4041;
    float _4059 = fma(_3921, _4055, _3909);
    float _4061 = fma(_3923, _4055, _3911);
    float _4063 = fma(_3915, _4057, _3913);
    float _4065 = _3572 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _4067 = _4055;
    float _4069 = _4053;
    float _4071 = _4053;
    if (!_3941)
    {
        _4067 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _4073 = _4067;
    float _4075 = _4073;
    float _4077 = _4073;
    if (!_3941)
    {
        _4047 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _4079 = _4047;
    out.m_90.x = _4059;
    out.m_90.y = _4061;
    out.m_90.z = _4063;
    out.m_90.w = _4043;
    bool _4081 = !_3941;
    float _4083 = _4079;
    float _4085 = _4079;
    if (!_4081)
    {
        bool _4087 = _3692 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _4089 = isnan(_3692);
        bool _4091 = _4087 || _4089;
        bool _4093 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _4095 = _4091 || _4093;
        if (!_4095)
        {
            float _4097 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _4099 = _3692 + _4097;
            float _4101 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _4103 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _4101;
            float _4105 = 1.0 / _4103;
            float _4107 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _4109 = _4107 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _4111 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _4113 = _4111 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _4115 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _4117 = _4115 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _4119 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _4121 = _4119 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _4123 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _4125 = _4123 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _4127 = _4099 * _4105;
            float _4129 = precise::clamp(_4127, 0.0, 1.0);
            float _4131 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _4133 = _4131 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _4135 = fma(_4129, _4109, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _4137 = fma(_4129, _4133, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _4139 = fma(_4129, _4113, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _4141 = fma(_4129, _4117, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _4143 = fma(_4129, _4121, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _4145 = fma(_4129, _4125, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _4085 = _4137;
            _3999 = _4143;
            _4077 = _4135;
            _4051 = _4141;
            _4011 = _4139;
            _4071 = _4145;
            _4147 = true;
        }
        else
        {
            bool _4149 = _3692 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _4151 = isnan(_3692);
            bool _4153 = _4149 || _4151;
            bool _4155 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _4157 = _4153 || _4155;
            if (!_4157)
            {
                _4075 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _4159 = _4075;
            _4077 = _4159;
            if (!_4157)
            {
                _4083 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _4161 = _4083;
            _4085 = _4161;
            if (!_4157)
            {
                _4009 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _4163 = _4009;
            _4011 = _4163;
            if (!_4157)
            {
                _4049 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _4165 = _4049;
            _4051 = _4165;
            if (!_4157)
            {
                _3997 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _4167 = _3997;
            _3999 = _4167;
            if (!_4157)
            {
                _4069 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _4169 = _4069;
            bool _4171 = !_4157;
            _4071 = _4169;
            if (!_4171)
            {
                bool _4173 = _3692 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _4175 = isnan(_3692);
                bool _4177 = _4173 || _4175;
                bool _4179 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _4181 = _4177 || _4179;
                if (!_4181)
                {
                    float _4183 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _4185 = _3692 + _4183;
                    float _4187 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _4189 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _4187;
                    float _4191 = 1.0 / _4189;
                    float _4193 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _4195 = _4193 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _4197 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _4199 = _4197 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _4201 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _4203 = _4201 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _4205 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _4207 = _4205 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _4209 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _4211 = _4209 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _4213 = _4185 * _4191;
                    float _4215 = precise::clamp(_4213, 0.0, 1.0);
                    float _4217 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _4219 = _4217 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _4221 = fma(_4215, _4195, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _4223 = fma(_4215, _4219, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _4225 = fma(_4215, _4199, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _4227 = fma(_4215, _4203, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _4229 = fma(_4215, _4207, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _4231 = fma(_4215, _4211, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _4085 = _4223;
                    _3999 = _4229;
                    _4077 = _4221;
                    _4051 = _4227;
                    _4011 = _4225;
                    _4071 = _4231;
                    _4147 = true;
                }
                else
                {
                    _4085 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _3999 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _4077 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _4051 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _4011 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _4071 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _4147 = false;
    float _4233 = _4085;
    float _4235 = _3999;
    float _4237 = _4077;
    float _4239 = _4051;
    float _4241 = _4011;
    float _4243 = _4071;
    float _4245 = fma(_3286, -0.5, 0.5);
    float _4247 = precise::clamp(_4245, 0.0, 1.0);
    float _4249 = -_4233;
    float _4251 = _4249 + _4235;
    float _4253 = _4065 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _4255 = -_4237;
    float _4257 = _4255 + _4239;
    float _4259 = fma(_4247, _4251, _4233);
    out.m_92.x = 0.0;
    float _4261 = -_4241;
    float _4263 = _4261 + _4243;
    float _4265 = fma(_4247, _4257, _4237);
    float _4267 = _4259 * 0.586610972881317138671875;
    out.m_51.x = _4253;
    bool _4269 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _4271 = fma(_4247, _4263, _4241);
    float _4273 = fma(_4265, 0.298911988735198974609375, _4267);
    bool _4275 = _3572 > 0.0;
    bool _4277 = isnan(_3572);
    bool _4279 = _4275 || _4277;
    bool _4281 = isnan(0.0);
    bool _4283 = _4279 || _4281;
    float _4285 = fma(_4271, 0.114477999508380889892578125, _4273);
    float _4287 = -_4285;
    float _4289 = _4265 + _4287;
    float _4291 = -_4285;
    float _4293 = _4259 + _4291;
    float _4295 = -_4285;
    float _4297 = _4271 + _4295;
    float _4299 = fma(_4289, (*spvDescriptorSet0.vp_c13)._m0[1].z, _4285);
    float _4301 = fma(_4293, (*spvDescriptorSet0.vp_c13)._m0[1].z, _4285);
    float _4303 = fma(_4297, (*spvDescriptorSet0.vp_c13)._m0[1].z, _4285);
    bool _4305 = !_4269;
    if (!_4305)
    {
        float _4307 = -_3512;
        float _4309 = _4307 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _4311 = -_3514;
        float _4313 = _4311 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _4315 = -_3516;
        float _4317 = _4315 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _4319 = _4309 * _4309;
        float _4321 = fma(_4313, _4313, _4319);
        float _4323 = fma(_4317, _4317, _4321);
        float _4325 = sqrt(_4323);
        float _4327 = rsqrt(_4323);
        float _4329 = -_4325;
        float _4331 = _4329 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _4333 = _4331 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _4335 = precise::clamp(_4333, 0.0, 1.0);
        float _4337 = _4313 * _4327;
        float _4339 = _4309 * _4327;
        float _4341 = abs(_4335);
        float _4343 = log2(_4341);
        float _4345 = _4317 * _4327;
        float _4347 = _4337 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _4349 = _3286 * _4339;
        float _4351 = -_4339;
        float _4353 = -_4347;
        float _4355 = fma(_4351, (*spvDescriptorSet0.vp_c15)._m0[656].y, _4353);
        float _4357 = fma(_3276, _4337, _4349);
        float _4359 = -_4345;
        float _4361 = fma(_4359, (*spvDescriptorSet0.vp_c15)._m0[656].z, _4355);
        float _4363 = fma(_3296, _4345, _4357);
        float _4365 = precise::clamp(_4363, 0.0, 1.0);
        float _4367 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _4369 = _4361 + _4367;
        float _4371 = _4343 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _4373 = _4369 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _4375 = precise::clamp(_4373, 0.0, 1.0);
        float _4377 = exp2(_4371);
        float _4379 = _4377 * _4375;
        float _4381 = _4365 * _4379;
        float _4383 = _4381 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _4385 = _4381 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _4387 = _4381 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_92.x = _4383;
        out.m_92.y = _4385;
        out.m_92.z = _4387;
    }
    out.m_94.x = _4299;
    out.m_94.y = _4301;
    out.m_94.z = _4303;
    if (_4283)
    {
        return out;
    }
    out.m_51.x = 0.0;
    float _4389 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _4389;
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
    out.m_62 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_72 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_78 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_86 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_94 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_51 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_76 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_80 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_82 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_74 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_92 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_88 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_90 = float4(0.0, 0.0, 0.0, 1.0);
    bool _4147 = false;
    bool _3338 = false;
    bool _733 = false;
    bool _591 = false;
    bool _403 = false;
    bool _209 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _108 = in.m_48.w;
    float _110 = trunc(_108);
    int _113 = int(_110);
    bool _117 = _113 >= 1;
    float _119 = 0.0;
    if (!_117)
    {
        _119 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _121 = _119;
    float _123 = _121;
    if (!_117)
    {
        out.m_51.x = 0.0;
    }
    int _125 = 0;
    if (!_117)
    {
        float _127 = _121 * 5.0;
        _125 = as_type<int>(_127);
    }
    int _129 = _125;
    int _131 = _129;
    if (!_117)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _4446 = as_type<float>(_129);
        out.gl_Position.z = _4446;
    }
    if (!_117)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_62.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_62.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_62.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_62.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_94.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_94.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_94.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_94.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_92.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_92.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_92.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_92.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_88.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_88.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_88.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_88.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_90.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_90.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_90.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_90.w)); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _133 = in.m_53.w;
    bool _135 = _133 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _137 = isnan(_133);
    bool _139 = _135 || _137;
    bool _141 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _143 = _139 || _141;
    float _145 = -_133;
    float _147 = _145 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _149 = 0.0;
    float _151 = _147;
    if (_143)
    {
        float _153 = float(_113);
        _149 = _153;
    }
    float _155 = _149;
    bool _157 = _147 >= _155;
    bool _159 = !_143;
    bool _161 = _157 || _159;
    if (_161)
    {
        _123 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _163 = _123;
    if (_161)
    {
        out.m_51.x = 0.0;
    }
    if (_161)
    {
        float _165 = _163 * 5.0;
        _131 = as_type<int>(_165);
    }
    int _167 = _131;
    if (_161)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _4515 = as_type<float>(_167);
        out.gl_Position.z = _4515;
    }
    if (_161)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_62.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_62.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_62.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_62.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_94.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_94.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_94.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_94.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_92.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_92.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_92.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_92.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_88.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_88.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_88.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_88.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_90.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_90.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_90.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_90.w)); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _169 = as_type<float>(int(gl_VertexIndex));
    bool _171 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    int _173 = as_type<int>(_169) & 1;
    bool _175 = _173 != 0;
    int _177 = as_type<int>(_169) & 2;
    bool _179 = _177 != 0;
    bool _181 = !_175;
    float _183 = _181 ? (-0.5) : 0.5;
    bool _185 = !_179;
    float _187 = _185 ? (-0.5) : 0.5;
    bool _189 = !_171;
    float _207;
    if (!_189)
    {
        float _191 = in.m_58.x;
        float _193 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _195 = _191 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _197 = fma(_195, (*spvDescriptorSet0.vp_c9)._m0[12].x, _147);
        float _199 = _197 * _193;
        float _201 = floor(_199);
        float _203 = -_201;
        float _205 = _199 + _203;
        _207 = _205;
        _209 = true;
    }
    else
    {
        float _211 = float(_113);
        float _213 = 1.0 / _211;
        float _215 = _147 * _213;
        _207 = _215;
    }
    _209 = false;
    float _217 = _207;
    float _219 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _221 = _217 + _219;
    float _223 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _225 = _217 + _223;
    float _227 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _229 = _217 + _227;
    float _231 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _233 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _231;
    float _235 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _237 = _235 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _239 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _241 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _239;
    bool _243 = _217 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _245 = isnan(_217);
    bool _247 = _243 || _245;
    bool _249 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _251 = _247 || _249;
    float _253 = float(_251);
    float _255 = 1.0 / _233;
    bool _257 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _259 = 1.0 / _241;
    float _261 = 1.0 / _237;
    float _263 = _221 * _255;
    bool _265 = _217 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _267 = isnan(_217);
    bool _269 = _265 || _267;
    bool _271 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _273 = _269 || _271;
    float _275 = float(_273);
    float _277 = -_253;
    float _279 = _277 + 1.0;
    float _281 = _275 * _279;
    float _283 = _225 * _259;
    bool _285 = _217 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _287 = isnan(_217);
    bool _289 = _285 || _287;
    bool _291 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _293 = _289 || _291;
    float _295 = float(_293);
    float _297 = -_275;
    float _299 = _297 + 1.0;
    float _301 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _303 = _301 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _305 = _295 * _299;
    float _307 = -_295;
    float _309 = _307 + 1.0;
    float _311 = _229 * _261;
    bool _313 = _217 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _315 = isnan(_217);
    bool _317 = _313 || _315;
    bool _319 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _321 = _317 || _319;
    float _323 = float(_321);
    float _325 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _327 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _325;
    float _329 = fma(_303, _311, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _331 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _333 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _331;
    float _335 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _337 = _335 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _339 = fma(_327, _263, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _341 = _323 * _309;
    float _343 = fma(_333, _263, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _345 = fma(_337, _311, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _347 = -_323;
    float _349 = _347 + 1.0;
    float _351 = _339 * _341;
    float _353 = _343 * _341;
    float _355 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _357 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _355;
    float _359 = fma(_349, (*spvDescriptorSet0.vp_c9)._m0[143].x, _351);
    float _361 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _363 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _361;
    float _365 = fma(_349, (*spvDescriptorSet0.vp_c9)._m0[143].y, _353);
    float _367 = fma(_357, _283, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _369 = fma(_329, _305, _359);
    float _371 = fma(_363, _283, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _373 = fma(_345, _305, _365);
    float _375 = fma(_367, _281, _369);
    float _377 = fma(_371, _281, _373);
    float _379 = fma(_253, (*spvDescriptorSet0.vp_c9)._m0[146].x, _375);
    float _381 = fma(_253, (*spvDescriptorSet0.vp_c9)._m0[146].y, _377);
    bool _383 = !_257;
    float _401;
    if (!_383)
    {
        float _385 = in.m_58.x;
        float _387 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _389 = _385 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _391 = fma(_389, (*spvDescriptorSet0.vp_c9)._m0[11].y, _147);
        float _393 = _391 * _387;
        float _395 = floor(_393);
        float _397 = -_395;
        float _399 = _393 + _397;
        _401 = _399;
        _403 = true;
    }
    else
    {
        float _405 = float(_113);
        float _407 = 1.0 / _405;
        float _409 = _147 * _407;
        _401 = _409;
    }
    _403 = false;
    float _411 = _401;
    float _413 = in.m_60.x;
    float _415 = in.m_60.y;
    float _417 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _419 = _417 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _421 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _423 = _421 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _425 = _411 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _427 = isnan(_411);
    bool _429 = _425 || _427;
    bool _431 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _433 = _429 || _431;
    float _435 = float(_433);
    float _437 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _439 = _437 + (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _441 = _411 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _443 = isnan(_411);
    bool _445 = _441 || _443;
    bool _447 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _449 = _445 || _447;
    float _451 = float(_449);
    float _453 = 1.0 / _419;
    float _455 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _457 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _455;
    float _459 = -_435;
    float _461 = _459 + 1.0;
    bool _463 = _411 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _465 = isnan(_411);
    bool _467 = _463 || _465;
    bool _469 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _471 = _467 || _469;
    float _473 = float(_471);
    bool _475 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _477 = _451 * _461;
    float _479 = -_451;
    float _481 = _479 + 1.0;
    float _483 = 1.0 / _423;
    float _485 = _473 * _481;
    float _487 = -_473;
    float _489 = _487 + 1.0;
    float _491 = _381 * _415;
    float _493 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _495 = _493 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _497 = 1.0 / _439;
    float _499 = _457 * _453;
    float _501 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _503 = _411 + _501;
    float _505 = _379 * _413;
    float _507 = fma(_499, _503, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _509 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _511 = _411 + _509;
    float _513 = _495 * _483;
    bool _515 = _411 >= (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _517 = isnan(_411);
    bool _519 = _515 || _517;
    bool _521 = isnan((*spvDescriptorSet0.vp_c9)._m0[118].w);
    bool _523 = _519 || _521;
    float _525 = float(_523);
    float _527 = -(*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _529 = (*spvDescriptorSet0.vp_c9)._m0[118].x + _527;
    float _531 = _507 * _485;
    float _533 = fma(_513, _511, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _535 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _537 = _411 + _535;
    float _539 = -_525;
    float _541 = _539 + 1.0;
    float _543 = fma(_489, (*spvDescriptorSet0.vp_c9)._m0[115].x, _531);
    float _545 = _529 * _497;
    float _547 = _435 * _541;
    float _549 = fma(_533, _477, _543);
    float _551 = fma(_545, _537, (*spvDescriptorSet0.vp_c9)._m0[117].x);
    float _553 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _555 = fma(_551, _547, _549);
    float _557 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _559 = _553 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _561 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _563 = fma(_525, (*spvDescriptorSet0.vp_c9)._m0[118].x, _555);
    float _565 = _557 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _567 = _561 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _569 = _563 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    bool _571 = !_475;
    float _589;
    if (!_571)
    {
        float _573 = in.m_58.x;
        float _575 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _577 = _573 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _579 = fma(_577, (*spvDescriptorSet0.vp_c9)._m0[11].w, _147);
        float _581 = _579 * _575;
        float _583 = floor(_581);
        float _585 = -_583;
        float _587 = _581 + _585;
        _589 = _587;
        _591 = true;
    }
    else
    {
        float _593 = float(_113);
        float _595 = 1.0 / _593;
        float _597 = _147 * _595;
        _589 = _597;
    }
    _591 = false;
    float _599 = _589;
    float _601 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _603 = _599 + _601;
    float _605 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _607 = _605 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _609 = _599 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _611 = isnan(_599);
    bool _613 = _609 || _611;
    bool _615 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _617 = _613 || _615;
    float _619 = float(_617);
    float _621 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _623 = _621 + (*spvDescriptorSet0.vp_c9)._m0[133].w;
    bool _625 = _599 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _627 = isnan(_599);
    bool _629 = _625 || _627;
    bool _631 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _633 = _629 || _631;
    float _635 = float(_633);
    float _637 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _639 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _637;
    bool _641 = _599 >= (*spvDescriptorSet0.vp_c9)._m0[133].w;
    bool _643 = isnan(_599);
    bool _645 = _641 || _643;
    bool _647 = isnan((*spvDescriptorSet0.vp_c9)._m0[133].w);
    bool _649 = _645 || _647;
    float _651 = float(_649);
    float _653 = 1.0 / _607;
    float _655 = -_619;
    float _657 = _655 + 1.0;
    bool _659 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[14].x;
    float _661 = _635 * _657;
    float _663 = -_635;
    float _665 = _663 + 1.0;
    float _667 = 1.0 / _623;
    float _669 = _639 * _653;
    float _671 = -(*spvDescriptorSet0.vp_c9)._m0[132].x;
    float _673 = _671 + (*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _675 = fma(_669, _603, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    float _677 = _673 * _667;
    float _679 = _675 * _661;
    float _681 = -_651;
    float _683 = _681 + 1.0;
    float _685 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _687 = _599 + _685;
    float _689 = fma(_665, (*spvDescriptorSet0.vp_c9)._m0[131].x, _679);
    float _691 = _619 * _683;
    float _693 = fma(_677, _687, (*spvDescriptorSet0.vp_c9)._m0[132].x);
    float _695 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _697 = fma(_693, _691, _689);
    float _699 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _701 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _703 = fma(_651, (*spvDescriptorSet0.vp_c9)._m0[133].x, _697);
    float _705 = _695 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _707 = _699 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _709 = _701 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _711 = _703 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    bool _713 = !_659;
    float _731;
    if (!_713)
    {
        float _715 = in.m_58.x;
        float _717 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[14].x;
        float _719 = _715 * (*spvDescriptorSet0.vp_c9)._m0[15].x;
        float _721 = fma(_719, (*spvDescriptorSet0.vp_c9)._m0[14].x, _147);
        float _723 = _721 * _717;
        float _725 = floor(_723);
        float _727 = -_725;
        float _729 = _723 + _727;
        _731 = _729;
        _733 = true;
    }
    else
    {
        float _735 = float(_113);
        float _737 = 1.0 / _735;
        float _739 = _147 * _737;
        _731 = _739;
    }
    _733 = false;
    float _741 = _731;
    float _743 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _745 = int(_743);
    out.m_62.x = _565;
    out.m_62.y = _567;
    out.m_62.z = _559;
    out.m_62.w = _569;
    float _747 = float(_113);
    float _749 = _505 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    int _751 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _753 = _751 != 0;
    float _755 = -(*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _757 = _741 + _755;
    float _759 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].y);
    int _761 = int(_759);
    float _763 = -(*spvDescriptorSet0.vp_c9)._m0[159].w;
    float _765 = _763 + (*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _767 = -(*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _769 = _767 + (*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _771 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _773 = int(_771);
    float _775 = float(_745);
    float _777 = 0.0;
    int _779 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z);
    if (_753)
    {
        float _781 = in.m_58.x;
        _777 = _781;
    }
    float _783 = _777;
    float _785 = -(*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _787 = _785 + (*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _789 = _783;
    if (!_753)
    {
        float _791 = in.m_58.y;
        _789 = _791;
    }
    float _793 = _789;
    float _795 = 1.0 / _775;
    float _797 = float(_761);
    float _799 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _801 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _803 = -(*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _805 = _803 + (*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _807 = -(*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _809 = _807 + (*spvDescriptorSet0.vp_c9)._m0[166].w;
    float _811 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].x);
    int _813 = int(_811);
    float _815 = float(uint(_773));
    float _817 = -(*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _819 = _817 + (*spvDescriptorSet0.vp_c9)._m0[162].w;
    int _821 = ~_773;
    int _823 = _821 + 1;
    float _825 = (*spvDescriptorSet0.vp_c10)._m0[5].x * (*spvDescriptorSet0.vp_c10)._m0[5].x;
    bool _827 = _773 == 0;
    float _829 = 1.0 / _797;
    float _831 = _795 * _147;
    float _833 = fma((*spvDescriptorSet0.vp_c10)._m0[4].x, (*spvDescriptorSet0.vp_c10)._m0[4].x, _825);
    float _835 = -(*spvDescriptorSet0.vp_c9)._m0[165].x;
    float _837 = (*spvDescriptorSet0.vp_c9)._m0[166].x + _835;
    float _839 = 1.0 / _815;
    float _841 = float(uint(_813));
    int _843 = ~_813;
    int _845 = _843 + 1;
    float _847 = trunc(_831);
    int _849 = int(_847);
    float _851 = _829 * _147;
    bool _853 = _741 >= (*spvDescriptorSet0.vp_c9)._m0[161].w;
    bool _855 = isnan(_741);
    bool _857 = _853 || _855;
    bool _859 = isnan((*spvDescriptorSet0.vp_c9)._m0[161].w);
    bool _861 = _857 || _859;
    float _863 = float(_861);
    float _865 = fma((*spvDescriptorSet0.vp_c10)._m0[6].x, (*spvDescriptorSet0.vp_c10)._m0[6].x, _833);
    bool _867 = _741 >= (*spvDescriptorSet0.vp_c9)._m0[159].w;
    bool _869 = isnan(_741);
    bool _871 = _867 || _869;
    bool _873 = isnan((*spvDescriptorSet0.vp_c9)._m0[159].w);
    bool _875 = _871 || _873;
    float _877 = float(_875);
    float _879 = 1.0 / _841;
    int _881 = as_type<int>(_839) + (-2);
    float _883 = trunc(_851);
    int _885 = int(_883);
    float _887 = float(uint(_849));
    float _889 = float(_849);
    float _891 = as_type<float>(_881) * _887;
    int _893 = as_type<int>(_879) + (-2);
    float _895 = 1.0 / _747;
    float _897 = float(uint(_885));
    float _899 = trunc(_891);
    float _901 = precise::max(_899, 0.0);
    uint _904 = uint(_901);
    float _906 = as_type<float>(_893) * _897;
    float _908 = in.m_58.x;
    float _910 = in.m_58.y;
    float _912 = in.m_58.z;
    float _914 = in.m_58.w;
    float _916 = trunc(_906);
    float _918 = precise::max(_916, 0.0);
    uint _920 = uint(_918);
    float _922 = _895 * _147;
    int _924 = _823 * int(_904);
    int _926 = _924 + _849;
    float _928 = 1.0 / _765;
    float _930 = float(uint(_926));
    float _932 = as_type<float>(_926);
    float _934 = _799;
    if (_753)
    {
        _932 = 1.0;
    }
    float _936 = _932;
    int _938 = _845 * int(_920);
    int _940 = _938 + _885;
    float _942 = _936;
    float _944 = as_type<float>(_940);
    if (!_753)
    {
        _942 = 1.2345600128173828125;
    }
    float _946 = _942;
    float _948 = as_type<float>(_881) * _930;
    float _950 = 1.0 / _769;
    float _952 = float(uint(_940));
    float _954 = _946 * _793;
    if (_753)
    {
        _944 = 1.0;
    }
    float _956 = _944;
    float _958 = _908 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _960 = _956;
    float _962 = _958;
    if (!_753)
    {
        _960 = 7.345489978790283203125;
    }
    float _964 = _960;
    float _966 = as_type<float>(_893) * _952;
    float _968 = trunc(_948);
    float _970 = precise::max(_968, 0.0);
    uint _972 = uint(_970);
    int _974 = ~_773;
    int _976 = _974 + 1;
    float _978 = _964 * _908;
    float _980 = trunc(_966);
    float _982 = precise::max(_980, 0.0);
    uint _984 = uint(_982);
    float _986 = floor(_978);
    int _988 = int(_904) + int(_972);
    int _990 = ~_813;
    int _992 = _990 + 1;
    float _994 = floor(_954);
    int _996 = _976 * _988;
    int _998 = _996 + _849;
    int _1000 = int(_920) + int(_984);
    float _1002 = float(_773);
    bool _1004 = uint(_998) >= uint(_773);
    float _1006 = -_986;
    float _1008 = _978 + _1006;
    bool _1010 = _889 >= _1002;
    bool _1012 = isnan(_889);
    bool _1014 = _1010 || _1012;
    bool _1016 = isnan(_1002);
    bool _1018 = _1014 || _1016;
    float _1020 = float(_1018);
    int _1022 = _992 * _1000;
    int _1024 = _1022 + _885;
    bool _1026 = !_1004;
    int _1028 = _1026 ? 0 : (-1);
    float _1030 = 1.0 / _787;
    int _1032 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _1034 = _1032 != 0;
    float _1036 = -_994;
    float _1038 = _954 + _1036;
    bool _1040 = uint(_1024) >= uint(_813);
    float _1042 = _1008 * _1002;
    int _1044 = ~_988;
    int _1046 = _1044 + _1028;
    int _1048 = _1046 + 1;
    float _1050 = _1002 * _922;
    float _1052 = trunc(_1020);
    int _1054 = int(_1052);
    float _1056 = float(_813);
    float _1058 = float(_885);
    int _1060 = _773 * _1048;
    int _1062 = _1060 + _849;
    bool _1064 = !_1034;
    int _1066 = _1064 ? 0 : 1;
    float _1068 = trunc(_1050);
    int _1070 = int(_1068);
    bool _1072 = _1058 >= _1056;
    bool _1074 = isnan(_1058);
    bool _1076 = _1072 || _1074;
    bool _1078 = isnan(_1056);
    bool _1080 = _1076 || _1078;
    float _1082 = float(_1080);
    float _1084 = _1056 * _922;
    bool _1086 = !_1040;
    int _1088 = _1086 ? 0 : (-1);
    float _1090 = _1038 * _1056;
    int _1092 = abs(_1066);
    bool _1094 = !_827;
    int _1096 = _1094 ? _1062 : (-1);
    float _1098 = trunc(_1082);
    int _1100 = int(_1098);
    int _1102 = ~_1054;
    int _1104 = _1102 + 1;
    int _1106 = _1104 + 1;
    int _1108 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _1110 = _1108 != 0;
    int _1112 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _1114 = _1112 != 0;
    int _1116 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _1118 = _1116 != 0;
    int _1120 = ~_1000;
    int _1122 = _1120 + _1088;
    int _1124 = _1122 + 1;
    int _1126 = _1096 * _1106;
    bool _1128 = _813 == 0;
    float _1130 = trunc(_1042);
    int _1132 = int(_1130);
    bool _1134 = !_1114;
    int _1136 = _1134 ? 0 : 1;
    int _1138 = _813 * _1124;
    int _1140 = _1138 + _885;
    int _1142 = _773 + (-1);
    int _1144 = abs(_1136);
    bool _1146 = !_1128;
    int _1148 = _1146 ? _1140 : (-1);
    int _1150 = _1054 * _1142;
    int _1152 = _1150 + _1126;
    int _1154 = ~_1100;
    int _1156 = _1154 + 1;
    int _1158 = _1156 + 1;
    float _1160 = trunc(_1090);
    int _1162 = int(_1160);
    int _1164 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8192;
    bool _1166 = _1164 != 0;
    int _1168 = _1152 * _1144;
    int _1170 = _813 + (-1);
    int _1172 = _1148 * _1158;
    bool _1174 = !_1110;
    int _1176 = _1174 ? 0 : 1;
    int _1178 = _1132 * _1092;
    int _1180 = _1178 + _849;
    bool _1182 = !_1166;
    int _1184 = _1182 ? 0 : 1;
    int _1186 = _1100 * _1170;
    int _1188 = _1186 + _1172;
    int _1190 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _1192 = _1190 != 0;
    float _1194 = trunc(_1084);
    int _1196 = int(_1194);
    int _1198 = abs(_1176);
    bool _1200 = !_1118;
    int _1202 = _1200 ? 0 : 1;
    int _1204 = abs(_1184);
    int _1206 = _1070 * _1198;
    int _1208 = _1206 + _1168;
    bool _1210 = !_1192;
    int _1212 = _1210 ? 0 : 1;
    float _1214 = 1.0 / _805;
    int _1216 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 256;
    bool _1218 = _1216 != 0;
    int _1220 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 512;
    bool _1222 = _1220 != 0;
    int _1224 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1024;
    bool _1226 = _1224 != 0;
    int _1228 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2048;
    bool _1230 = _1228 != 0;
    int _1232 = _1162 * _1204;
    int _1234 = _1232 + _885;
    int _1236 = abs(_1202);
    int _1238 = abs(_1212);
    bool _1240 = !_1222;
    int _1242 = _1240 ? 0 : 1;
    float _1244 = 1.0 / _809;
    bool _1246 = !_1218;
    int _1248 = _1246 ? 0 : 1;
    int _1250 = abs(_1242);
    int _1252 = _1180 * _1236;
    int _1254 = _1252 + _1208;
    float _1256 = 1.0 / _819;
    int _1258 = abs(_1248);
    int _1260 = _1132 * _1238;
    int _1262 = _1260 + _1254;
    bool _1264 = !_1226;
    int _1266 = _1264 ? 0 : 1;
    bool _1268 = !_1230;
    int _1270 = _1268 ? 0 : 1;
    int _1272 = _1188 * _1250;
    int _1274 = abs(_1266);
    float _1276 = _837 * _1244;
    float _1278 = float(uint(_1262));
    float _1280 = sqrt(_865);
    int _1282 = abs(_1270);
    float _1284 = as_type<float>(_881) * _1278;
    int _1286 = _1196 * _1258;
    int _1288 = _1286 + _1272;
    float _1290 = trunc(_1284);
    float _1292 = precise::max(_1290, 0.0);
    uint _1294 = uint(_1292);
    float _1296 = float(uint(_1180));
    int _1298 = _1234 * _1274;
    int _1300 = _1298 + _1288;
    float _1302 = float(uint(_1234));
    int _1304 = ~_773;
    int _1306 = _1304 + 1;
    int _1308 = _1162 * _1282;
    int _1310 = _1308 + _1300;
    int _1312 = ~_773;
    int _1314 = _1312 + 1;
    float _1316 = as_type<float>(_881) * _1296;
    int _1318 = ~_813;
    int _1320 = _1318 + 1;
    float _1322 = as_type<float>(_893) * _1302;
    float _1324 = float(uint(_1310));
    int _1326 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _1328 = _1326 != 0;
    bool _1330 = _773 == 0;
    float _1332 = as_type<float>(_893) * _1324;
    int _1334 = _1314 * int(_1294);
    int _1336 = _1334 + _1262;
    bool _1338 = _813 == 0;
    float _1340 = trunc(_1316);
    float _1342 = precise::max(_1340, 0.0);
    uint _1344 = uint(_1342);
    float _1346 = float(uint(_1336));
    if (_1328)
    {
        _779 = 0;
    }
    int _1348 = _779;
    float _1350 = trunc(_1332);
    float _1352 = precise::max(_1350, 0.0);
    uint _1354 = uint(_1352);
    float _1356 = as_type<float>(_881) * _1346;
    int _1358 = _1348;
    if (!_1328)
    {
        _1358 = 1;
    }
    int _1360 = _1358;
    float _1362 = trunc(_1356);
    float _1364 = precise::max(_1362, 0.0);
    uint _1366 = uint(_1364);
    int _1368 = ~_773;
    int _1370 = _1368 + 1;
    int _1372 = _1320 * int(_1354);
    int _1374 = _1372 + _1310;
    float _1376 = trunc(_1322);
    float _1378 = precise::max(_1376, 0.0);
    uint _1380 = uint(_1378);
    float _1382 = float(uint(_1374));
    int _1384 = _1306 * int(_1344);
    int _1386 = _1384 + _1180;
    int _1388 = ~_813;
    int _1390 = _1388 + 1;
    int _1392 = int(_1294) + int(_1366);
    float _1394 = as_type<float>(_893) * _1382;
    float _1396 = float(uint(_1386));
    float _1398 = trunc(_1394);
    float _1400 = precise::max(_1398, 0.0);
    uint _1402 = uint(_1400);
    int _1404 = ~_813;
    int _1406 = _1404 + 1;
    int _1408 = _1370 * _1392;
    int _1410 = _1408 + _1262;
    float _1412 = as_type<float>(_881) * _1396;
    bool _1414 = uint(_1410) >= uint(_773);
    int _1416 = _1390 * int(_1380);
    int _1418 = _1416 + _1234;
    bool _1420 = !_1414;
    int _1422 = _1420 ? 0 : (-1);
    float _1424 = trunc(_1412);
    float _1426 = precise::max(_1424, 0.0);
    uint _1428 = uint(_1426);
    int _1430 = ~_1392;
    int _1432 = _1430 + _1422;
    int _1434 = _1432 + 1;
    int _1436 = int(_1354) + int(_1402);
    int _1438 = _773 * _1434;
    int _1440 = _1438 + _1262;
    float _1442 = float(uint(_1418));
    int _1444 = _1406 * _1436;
    int _1446 = _1444 + _1310;
    bool _1448 = !_1330;
    int _1450 = _1448 ? _1440 : (-1);
    float _1452 = as_type<float>(_893) * _1442;
    int _1454 = ~_773;
    int _1456 = _1454 + 1;
    bool _1458 = uint(_1446) >= uint(_813);
    int _1460 = _1450 & 3;
    bool _1462 = _1460 != 0;
    int _1464 = _1450 & 3;
    bool _1466 = _1464 != 0;
    bool _1468 = _1460 != 3;
    bool _1470 = !_1458;
    int _1472 = _1470 ? 0 : (-1);
    int _1474 = int(_1344) + int(_1428);
    int _1476 = _1466 ? 0 : 1;
    float _1478 = trunc(_1452);
    float _1480 = precise::max(_1478, 0.0);
    uint _1482 = uint(_1480);
    bool _1484 = uint(_1460) > 1u;
    bool _1486 = uint(_1460) >= 2u;
    int _1488 = ~_1436;
    int _1490 = _1488 + _1472;
    int _1492 = _1490 + 1;
    bool _1494 = _1360 != 1;
    int _1496 = _1456 * _1474;
    int _1498 = _1496 + _1180;
    int _1500 = _1486 ? 0 : 1;
    int _1502 = _813 * _1492;
    int _1504 = _1502 + _1310;
    int _1506 = ~_1476;
    int _1508 = _1506 + 1;
    int _1510 = _1508 + 1;
    float _1512 = _908 * 2.0;
    int _1514 = ~_1500;
    int _1516 = _1514 + 1;
    int _1518 = _1516 + 1;
    bool _1520 = uint(_1498) >= uint(_773);
    float _1522 = _910 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    int _1524 = _1518;
    int _1526 = _1510;
    if (_1468)
    {
        int _1528 = ~_1500;
        int _1530 = _1528 + 1;
        _1524 = _1530;
    }
    int _1532 = _1524;
    float _1534 = floor(_1512);
    int _1536 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _1538 = _1536 != 0;
    float _1540 = -_801;
    float _1542 = fma(_958, 2.0, _1540);
    bool _1544 = !_1338;
    int _1546 = _1544 ? _1504 : (-1);
    if (!_1484)
    {
        int _1548 = ~_1476;
        int _1550 = _1548 + 1;
        _1526 = _1550;
    }
    int _1552 = _1526;
    bool _1554 = !_1520;
    int _1556 = _1554 ? 0 : (-1);
    float _1558 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _1560 = log2(_1558);
    bool _1562 = !_1538;
    int _1564 = _1562 ? 0 : 1;
    int _1566 = _1546 & 3;
    bool _1568 = _1566 != 0;
    int _1570 = _1546 & 3;
    bool _1572 = _1570 != 0;
    int _1574 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4194304;
    bool _1576 = _1574 != 0;
    int _1578 = _1568 ? 0 : 1;
    bool _1580 = uint(_1570) > 1u;
    bool _1582 = !_1576;
    int _1584 = _1582 ? 0 : 1;
    int _1586 = int(_1380) + int(_1482);
    float _1588 = fma(_1522, -2.0, _799);
    bool _1590 = uint(_1570) >= 2u;
    float _1592 = _1560 * _147;
    int _1594 = ~_813;
    int _1596 = _1594 + 1;
    float _1598 = fma(_147, (*spvDescriptorSet0.vp_c9)._m0[76].y, _1588);
    int _1600 = _1590 ? 0 : 1;
    bool _1602 = _1570 != 3;
    int _1604 = _1596 * _1586;
    int _1606 = _1604 + _1234;
    int _1608 = ~_1578;
    int _1610 = _1608 + 1;
    int _1612 = _1610 + 1;
    int _1614 = _1612;
    float _1616 = _1592;
    if (!_1580)
    {
        int _1618 = ~_1578;
        int _1620 = _1618 + 1;
        _1614 = _1620;
    }
    int _1622 = _1614;
    bool _1624 = uint(_1606) >= uint(_813);
    float _1626 = exp2(_1592);
    int _1628 = ~_1600;
    int _1630 = _1628 + 1;
    int _1632 = _1630 + 1;
    int _1634 = _1632;
    float _1636 = (*spvDescriptorSet0.vp_c9)._m0[83].z;
    if (_1602)
    {
        int _1638 = ~_1600;
        int _1640 = _1638 + 1;
        _1634 = _1640;
    }
    int _1642 = _1634;
    if (!_1494)
    {
        _962 = _910;
    }
    float _1644 = _962;
    bool _1646 = !_1624;
    int _1648 = _1646 ? 0 : (-1);
    float _1650 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    bool _1652 = _1534 > 0.0;
    bool _1654 = _1534 >= 0.0;
    bool _1656 = isnan(_1534);
    bool _1658 = _1654 || _1656;
    bool _1660 = isnan(0.0);
    bool _1662 = _1658 || _1660;
    float _1664 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _1666 = _1644;
    if (_1494)
    {
        _1666 = _908;
    }
    float _1668 = _1666;
    float _1670 = -_1626;
    float _1672 = _1670 + 1.0;
    if (!_1494)
    {
        _934 = _912;
    }
    float _1674 = _934;
    float _1676 = _1674;
    if (_1494)
    {
        _1676 = _910;
    }
    float _1678 = _1676;
    float _1680 = fma(_1668, (*spvDescriptorSet0.vp_c9)._m0[83].z, _1664);
    if (!_1494)
    {
        _1616 = _912;
    }
    float _1682 = _1616;
    float _1684 = _1682;
    if (_1494)
    {
        _1684 = _910;
    }
    float _1686 = _1684;
    float _1688 = fma(_1678, (*spvDescriptorSet0.vp_c9)._m0[83].w, _1650);
    if (!_1494)
    {
        _1636 = _910;
    }
    float _1690 = _1636;
    float _1692 = _1686 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _1694 = _1690;
    if (_1494)
    {
        _1694 = _908;
    }
    float _1696 = _1694;
    float _1698 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    bool _1700 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1702 = isnan(0.0);
    bool _1704 = _1700 || _1702;
    bool _1706 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1708 = _1704 || _1706;
    float _1710 = _1696 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _1712 = _1708 ? _1672 : 0.0;
    bool _1714 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1716 = isnan(1.0);
    bool _1718 = _1714 || _1716;
    bool _1720 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1722 = _1718 || _1720;
    float _1724 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _1726 = 1.0 + _1724;
    float _1728 = fma(_1692, -2.0, _1698);
    float _1730 = _910 * 2.0;
    float _1732 = 1.0 / _1726;
    int _1734 = ~_1586;
    int _1736 = _1734 + _1648;
    int _1738 = _1736 + 1;
    float _1740 = _912 * 2.0;
    float _1742 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _1744 = fma(_147, (*spvDescriptorSet0.vp_c9)._m0[81].y, _1728);
    int _1746 = ~_1474;
    int _1748 = _1746 + _1556;
    int _1750 = _1748 + 1;
    float _1752 = floor(_1730);
    float _1754 = -_1742;
    float _1756 = fma(_1710, 2.0, _1754);
    float _1758 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _1760 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    int _1762 = _773 * _1750;
    int _1764 = _1762 + _1180;
    float _1766 = -_147;
    float _1768 = fma(_1766, (*spvDescriptorSet0.vp_c9)._m0[76].x, _1542);
    float _1770 = fma(_908, (*spvDescriptorSet0.vp_c9)._m0[78].z, _1758);
    float _1772 = fma(_910, (*spvDescriptorSet0.vp_c9)._m0[78].w, _1760);
    float _1774 = floor(_1740);
    int _1776 = _1662 ? 0 : 1;
    float _1778 = fma(_147, (*spvDescriptorSet0.vp_c9)._m0[77].z, _1770);
    float _1780 = fma(_147, (*spvDescriptorSet0.vp_c9)._m0[77].w, _1772);
    float _1782 = fma(_147, (*spvDescriptorSet0.vp_c9)._m0[82].z, _1680);
    float _1784 = fma(_147, (*spvDescriptorSet0.vp_c9)._m0[82].w, _1688);
    float _1786 = -_147;
    float _1788 = fma(_1786, (*spvDescriptorSet0.vp_c9)._m0[81].x, _1756);
    if (_1722)
    {
        float _1790 = _1712 * _1732;
        _151 = _1790;
    }
    float _1792 = _151;
    int _1794 = _813 * _1738;
    int _1796 = _1794 + _1234;
    int _1798 = ~_1776;
    int _1800 = _1798 + 1;
    int _1802 = _1800 + 1;
    bool _1804 = !_1330;
    int _1806 = _1804 ? _1764 : (-1);
    bool _1808 = _1752 >= 0.0;
    bool _1810 = isnan(_1752);
    bool _1812 = _1808 || _1810;
    bool _1814 = isnan(0.0);
    bool _1816 = _1812 || _1814;
    int _1818 = _1802;
    if (!_1652)
    {
        int _1820 = ~_1776;
        int _1822 = _1820 + 1;
        _1818 = _1822;
    }
    int _1824 = _1818;
    bool _1826 = _914 > 0.5;
    bool _1828 = _1752 > 0.0;
    bool _1830 = _1460 != 3;
    int _1832 = _1816 ? 0 : 1;
    float _1834 = in.m_64.x;
    float _1836 = in.m_64.y;
    float _1838 = in.m_64.z;
    bool _1840 = !_1338;
    int _1842 = _1840 ? _1796 : (-1);
    bool _1844 = !_1572;
    int _1846 = _1844 ? 0 : 1;
    float _1848 = in.m_66.x;
    float _1850 = in.m_66.y;
    float _1852 = in.m_66.z;
    bool _1854 = !_1462;
    int _1856 = _1854 ? 0 : 1;
    int _1858 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _1860 = _1858 != 0;
    int _1862 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _1864 = _1862 != 0;
    int _1866 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _1868 = _1866 != 0;
    bool _1870 = !_1830;
    int _1872 = _1870 ? 0 : (-1);
    float _1874 = in.m_68.x;
    float _1876 = in.m_68.y;
    float _1878 = in.m_68.z;
    bool _1880 = _1774 > 0.0;
    bool _1882 = _1774 >= 0.0;
    bool _1884 = isnan(_1774);
    bool _1886 = _1882 || _1884;
    bool _1888 = isnan(0.0);
    bool _1890 = _1886 || _1888;
    float _1892 = in.m_48.x;
    float _1894 = in.m_48.y;
    float _1896 = in.m_48.z;
    int _1898 = ~_1832;
    int _1900 = _1898 + 1;
    int _1902 = _1900 + 1;
    int _1904 = _1902;
    if (!_1828)
    {
        int _1906 = ~_1832;
        int _1908 = _1906 + 1;
        _1904 = _1908;
    }
    int _1910 = _1904;
    bool _1912 = _1570 != 3;
    int _1914 = _1890 ? 0 : 1;
    int _1916 = ~_1914;
    int _1918 = _1916 + 1;
    int _1920 = _1918 + 1;
    int _1922 = _1920;
    if (!_1880)
    {
        int _1924 = ~_1914;
        int _1926 = _1924 + 1;
        _1922 = _1926;
    }
    int _1928 = _1922;
    float _1930 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _183);
    int _1932 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y);
    bool _1934 = _1932 != 0;
    float _1936 = -(*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _1938 = _1936 + (*spvDescriptorSet0.vp_c9)._m0[164].w;
    bool _1940 = !_1860;
    int _1942 = _1940 ? 0 : 1;
    bool _1944 = _908 > 0.5;
    float _1946 = _1894 * _1876;
    float _1948 = _1894 * _1836;
    float _1950 = _1894 * _1850;
    float _1952 = _749 * _1930;
    float _1954 = _491 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1956 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _187);
    float _1958 = 1.0 / _1938;
    float _1960 = fma(_1892, _1834, _1948);
    float _1962 = _1954 * _1956;
    float _1964 = -(*spvDescriptorSet0.vp_c9)._m0[159].x;
    float _1966 = (*spvDescriptorSet0.vp_c9)._m0[160].x + _1964;
    float _1968 = -(*spvDescriptorSet0.vp_c9)._m0[160].x;
    float _1970 = _1968 + (*spvDescriptorSet0.vp_c9)._m0[161].x;
    float _1972 = -(*spvDescriptorSet0.vp_c9)._m0[161].x;
    float _1974 = (*spvDescriptorSet0.vp_c9)._m0[162].x + _1972;
    float _1976 = -(*spvDescriptorSet0.vp_c9)._m0[162].x;
    float _1978 = _1976 + (*spvDescriptorSet0.vp_c9)._m0[163].x;
    float _1980 = _1966 * _928;
    float _1982 = _1970 * _950;
    float _1984 = _1978 * _1030;
    float _1986 = _908 + _910;
    float _1988 = _1974 * _1256;
    float _1990 = -(*spvDescriptorSet0.vp_c9)._m0[163].x;
    float _1992 = (*spvDescriptorSet0.vp_c9)._m0[164].x + _1990;
    float _1994 = -(*spvDescriptorSet0.vp_c9)._m0[164].x;
    float _1996 = _1994 + (*spvDescriptorSet0.vp_c9)._m0[165].x;
    float _1998 = _1986 + (-1.0);
    bool _2000 = _741 >= (*spvDescriptorSet0.vp_c9)._m0[165].w;
    bool _2002 = isnan(_741);
    bool _2004 = _2000 || _2002;
    bool _2006 = isnan((*spvDescriptorSet0.vp_c9)._m0[165].w);
    bool _2008 = _2004 || _2006;
    float _2010 = float(_2008);
    float _2012 = _1992 * _1958;
    float _2014 = _1996 * _1214;
    float _2016 = _912 + _908;
    float _2018 = _912 + _910;
    float _2020 = fma(_1998, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _2022 = _2016 + (-1.0);
    float _2024 = _2018 + (-1.0);
    float _2026 = -_2010;
    float _2028 = _2026 + 1.0;
    int _2030 = abs(_1942);
    float _2032 = fma(_2022, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _2034 = fma(_2024, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    bool _2036 = _741 >= (*spvDescriptorSet0.vp_c9)._m0[164].w;
    bool _2038 = isnan(_741);
    bool _2040 = _2036 || _2038;
    bool _2042 = isnan((*spvDescriptorSet0.vp_c9)._m0[164].w);
    bool _2044 = _2040 || _2042;
    float _2046 = float(_2044);
    float _2048 = -(*spvDescriptorSet0.vp_c9)._m0[159].w;
    float _2050 = _741 + _2048;
    bool _2052 = _741 >= (*spvDescriptorSet0.vp_c9)._m0[163].w;
    bool _2054 = isnan(_741);
    bool _2056 = _2052 || _2054;
    bool _2058 = isnan((*spvDescriptorSet0.vp_c9)._m0[163].w);
    bool _2060 = _2056 || _2058;
    float _2062 = float(_2060);
    float _2064 = fma(_1892, _1874, _1946);
    float _2066 = fma(_1892, _1848, _1950);
    float _2068 = _2046 * _2028;
    float _2070 = -_2046;
    float _2072 = _2070 + 1.0;
    float _2074 = fma(_1980, _2050, (*spvDescriptorSet0.vp_c9)._m0[159].x);
    float _2076 = -(*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _2078 = _741 + _2076;
    bool _2080 = _741 >= (*spvDescriptorSet0.vp_c9)._m0[162].w;
    bool _2082 = isnan(_741);
    bool _2084 = _2080 || _2082;
    bool _2086 = isnan((*spvDescriptorSet0.vp_c9)._m0[162].w);
    bool _2088 = _2084 || _2086;
    float _2090 = float(_2088);
    float _2092 = -_2062;
    float _2094 = _2092 + 1.0;
    float _2096 = _2062 * _2072;
    float _2098 = fma(_1982, _2078, (*spvDescriptorSet0.vp_c9)._m0[160].x);
    bool _2100 = _741 >= (*spvDescriptorSet0.vp_c9)._m0[160].w;
    bool _2102 = isnan(_741);
    bool _2104 = _2100 || _2102;
    bool _2106 = isnan((*spvDescriptorSet0.vp_c9)._m0[160].w);
    bool _2108 = _2104 || _2106;
    float _2110 = float(_2108);
    float _2112 = _2090 * _2094;
    float _2114 = -_2090;
    float _2116 = _2114 + 1.0;
    int _2118 = _1450 >> 31;
    float _2120 = in.m_70.x;
    float _2122 = in.m_70.y;
    float _2124 = in.m_70.z;
    float _2126 = -_2110;
    float _2128 = _2126 + 1.0;
    float _2130 = _863 * _2116;
    float _2132 = -_863;
    float _2134 = _2132 + 1.0;
    float _2136 = -(*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _2138 = _741 + _2136;
    int _2140 = _2118 & 3;
    float _2142 = fma(_1896, _1838, _1960);
    float _2144 = _2110 * _2134;
    float _2146 = float(_2030);
    float _2148 = fma(_1984, _2138, (*spvDescriptorSet0.vp_c9)._m0[162].x);
    float _2150 = float(_1928);
    float _2152 = fma(_1988, _757, (*spvDescriptorSet0.vp_c9)._m0[161].x);
    bool _2154 = !_1864;
    int _2156 = _2154 ? 0 : 1;
    float _2158 = _877 * _2128;
    float _2160 = _908 + (-0.5);
    float _2162 = _2146 * _2150;
    int _2164 = abs(_2156);
    float _2166 = _2074 * _2158;
    float _2168 = -_877;
    float _2170 = _2168 + 1.0;
    float _2172 = _2162 * (-2.0);
    float _2174 = float(_1824);
    float _2176 = _2142 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    bool _2178 = !_1868;
    int _2180 = _2178 ? 0 : 1;
    float _2182 = fma(_2020, _2172, _2020);
    float _2184 = fma(_2172, _2120, _2120);
    float _2186 = float(_2164);
    float _2188 = fma(_2170, (*spvDescriptorSet0.vp_c9)._m0[159].x, _2166);
    int _2190 = abs(_2180);
    float _2192 = fma(_2160, (*spvDescriptorSet0.vp_c9)._m0[196].x, _2184);
    bool _2194 = _910 > 0.5;
    float _2196 = _2186 * _2174;
    float _2198 = _910 + (-0.5);
    float _2200 = fma(_2182, _1792, _2192);
    float _2202 = float(_1910);
    float _2204 = _2196 * (-2.0);
    float _2206 = float(_2190);
    float _2208 = _2200 * 0.15915493667125701904296875;
    float _2210 = fma(_2098, _2144, _2188);
    float _2212 = fma(_2204, _2122, _2122);
    float _2214 = fma(_2034, _2204, _2034);
    float _2216 = _2206 * _2202;
    float _2218 = -(*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _2220 = _741 + _2218;
    float _2222 = fma(_2198, (*spvDescriptorSet0.vp_c9)._m0[196].y, _2212);
    float _2224 = fma(_2152, _2130, _2210);
    float _2226 = _2208 * 6.283185482025146484375;
    float _2228 = sin(_2226);
    float _2230 = fma(_2012, _2220, (*spvDescriptorSet0.vp_c9)._m0[163].x);
    float _2232 = fma(_2214, _1792, _2222);
    float _2234 = _2216 * (-2.0);
    float _2236 = _912 + (-0.5);
    float _2238 = fma(_2148, _2112, _2224);
    float _2240 = _2232 * 0.15915493667125701904296875;
    float _2242 = fma(_2234, _2124, _2124);
    float _2244 = fma(_2032, _2234, _2032);
    float _2246 = fma(_2230, _2096, _2238);
    float _2248 = -(*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _2250 = _741 + _2248;
    float _2252 = fma(_2236, (*spvDescriptorSet0.vp_c9)._m0[196].z, _2242);
    bool _2254 = _741 >= (*spvDescriptorSet0.vp_c9)._m0[166].w;
    bool _2256 = isnan(_741);
    bool _2258 = _2254 || _2256;
    bool _2260 = isnan((*spvDescriptorSet0.vp_c9)._m0[166].w);
    bool _2262 = _2258 || _2260;
    float _2264 = float(_2262);
    float _2266 = -(*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _2268 = _741 + _2266;
    float _2270 = _2240 * 6.283185482025146484375;
    float _2272 = sin(_2270);
    float _2274 = fma(_2244, _1792, _2252);
    float _2276 = fma(_2014, _2250, (*spvDescriptorSet0.vp_c9)._m0[164].x);
    float _2278 = -_2264;
    float _2280 = _2278 + 1.0;
    float _2282 = fma(_1896, _1878, _2064);
    float _2284 = _2274 * 0.15915493667125701904296875;
    int _2286 = _1546 >> 31;
    float _2288 = _2010 * _2280;
    float _2290 = _2240 * 6.283185482025146484375;
    float _2292 = cos(_2290);
    float _2294 = fma(_1276, _2268, (*spvDescriptorSet0.vp_c9)._m0[165].x);
    float _2296 = fma(_2276, _2068, _2246);
    int _2298 = _2286 & 3;
    float _2300 = _1280 * 50.0;
    int _2302 = _1450 + _2140;
    float _2304 = fma(_2294, _2288, _2296);
    float _2306 = fma(_1896, _1852, _2066);
    float _2308 = _2284 * 6.283185482025146484375;
    float _2310 = cos(_2308);
    int _2312 = _1546 + _2298;
    float _2314 = _2228 * _2272;
    float _2316 = fma(_2264, (*spvDescriptorSet0.vp_c9)._m0[166].x, _2304);
    int _2318 = abs(_1856);
    int _2320 = _2312 >> 2;
    float _2322 = _2316 * _2300;
    float _2324 = _2208 * 6.283185482025146484375;
    float _2326 = cos(_2324);
    int _2328 = abs(_1846);
    int _2330 = _2320 << 4;
    int _2332 = _2330 + 512;
    float _2334 = _2322 * _2322;
    int _2336 = abs(_1532);
    bool _2338 = !_1912;
    int _2340 = _2338 ? 0 : (-1);
    float _2342 = _2284 * 6.283185482025146484375;
    float _2344 = sin(_2342);
    float _2346 = _2228 * _2292;
    float _2348 = _2228 * _2310;
    int _2350 = _2302 >> 2;
    float _2352 = _2272 * _2310;
    float _2354 = _2292 * _2310;
    float _2356 = _2348 * _1962;
    int _2358 = _2350 << 4;
    int _2360 = _2358 + 368;
    float _2362 = _2326 * _2292;
    float _2364 = _2326 * _2272;
    float _2366 = _2326 * _2310;
    float _2368 = rsqrt(_2334);
    uint _2370 = uint(int(uint(_2360) >> uint(2)));
    uint _2372 = uint(int(uint(int(_2370)) >> uint(2)));
    int _2374 = int(_2370) & 3;
    float _2376 = (*spvDescriptorSet0.vp_c9)._m0[int(_2372)][_2374];
    int _2378 = int(_2370) + 1;
    uint _2380 = uint(int(uint(_2378) >> uint(2)));
    int _2382 = _2378 & 3;
    float _2384 = (*spvDescriptorSet0.vp_c9)._m0[int(_2380)][_2382];
    int _2386 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _2388 = _2386 != 0;
    float _2390 = _2366 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2392 = _2366 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2394 = -_2364;
    float _2396 = fma(_2344, _2346, _2394);
    float _2398 = -_2346;
    float _2400 = fma(_2344, _2364, _2398);
    float _2402 = _2366 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2404 = fma(_2344, _2362, _2314);
    float _2406 = fma(_2344, _2314, _2362);
    float _2408 = -_1962;
    float _2410 = _2344 * _2408;
    uint _2412 = uint(int(uint(_2332) >> uint(2)));
    uint _2414 = uint(int(uint(int(_2412)) >> uint(2)));
    int _2416 = int(_2412) & 3;
    float _2418 = (*spvDescriptorSet0.vp_c9)._m0[int(_2414)][_2416];
    int _2420 = int(_2412) + 1;
    uint _2422 = uint(int(uint(_2420) >> uint(2)));
    int _2424 = _2420 & 3;
    float _2426 = (*spvDescriptorSet0.vp_c9)._m0[int(_2422)][_2424];
    float _2428 = _2366 * _1962;
    float _2430 = -_2344;
    float _2432 = fma(_2430, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2402);
    float _2434 = -_2344;
    float _2436 = fma(_2434, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2390);
    float _2438 = -_2344;
    float _2440 = fma(_2438, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2392);
    float _2442 = fma(_2354, _1952, _2410);
    float _2444 = fma(_2348, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2432);
    float _2446 = fma(_2348, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2436);
    int _2448 = _2360 + 8;
    uint _2450 = uint(int(uint(_2448) >> uint(2)));
    uint _2452 = uint(int(uint(int(_2450)) >> uint(2)));
    int _2454 = int(_2450) & 3;
    float _2456 = (*spvDescriptorSet0.vp_c9)._m0[int(_2452)][_2454];
    int _2458 = int(_2450) + 1;
    uint _2460 = uint(int(uint(_2458) >> uint(2)));
    int _2462 = _2458 & 3;
    float _2464 = (*spvDescriptorSet0.vp_c9)._m0[int(_2460)][_2462];
    float _2466 = fma(_2348, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2440);
    float _2468 = _2404 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2470 = _2404 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2472 = _2404 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2474 = fma(_2404, _1952, _2428);
    float _2476 = fma(_2396, _1952, _2356);
    float _2478 = fma(_2354, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2468);
    float _2480 = fma(_2354, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2470);
    float _2482 = fma(_2354, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2472);
    float _2484 = 0.5 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    int _2486 = _2332 + 8;
    uint _2488 = uint(int(uint(_2486) >> uint(2)));
    uint _2490 = uint(int(uint(int(_2488)) >> uint(2)));
    int _2492 = int(_2488) & 3;
    float _2494 = (*spvDescriptorSet0.vp_c9)._m0[int(_2490)][_2492];
    int _2496 = int(_2488) + 1;
    uint _2498 = uint(int(uint(_2496) >> uint(2)));
    int _2500 = _2496 & 3;
    float _2502 = (*spvDescriptorSet0.vp_c9)._m0[int(_2498)][_2500];
    float _2504 = trunc((*spvDescriptorSet0.vp_c9)._m0[80].z);
    int _2506 = int(_2504);
    float _2508 = _2322 * _2368;
    float _2510 = fma(_2400, _2484, _2474);
    float _2512 = fma(_2352, _2484, _2442);
    float _2514 = fma(_2406, _2484, _2476);
    int _2516 = abs(_1552);
    float _2518 = _2510 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2520 = _2510 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2522 = _2510 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2524 = _2400 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2526 = fma(_2512, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2518);
    int _2528 = abs(_1622);
    float _2530 = _2400 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2532 = fma(_2512, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2520);
    int _2534 = ~_2528;
    int _2536 = _2534 + 1;
    int _2538 = _2536 + 1;
    float _2540 = fma(_2512, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2522);
    int _2542 = ~_2516;
    int _2544 = _2542 + 1;
    int _2546 = _2544 + 1;
    float _2548 = fma(_2514, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2532);
    float _2550 = fma(_2352, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2524);
    float _2552 = fma(_2352, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2530);
    int _2554 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _2556 = _2554 != 0;
    int _2558 = _2546 * as_type<int>(_2384);
    int _2560 = ~_2318;
    int _2562 = _2560 + 1;
    int _2564 = _2562 + 1;
    float _2566 = _2548 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    int _2568 = abs(_2506);
    int _2570 = _2564 * as_type<int>(_2376);
    int _2572 = _2570 + _2558;
    float _2574 = fma(_2514, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2526);
    int _2576 = ~_2336;
    int _2578 = _2576 + 1;
    int _2580 = _2578 + 1;
    int _2582 = _2538 * as_type<int>(_2426);
    int _2584 = ~_2328;
    int _2586 = _2584 + 1;
    int _2588 = _2586 + 1;
    float _2590 = trunc((*spvDescriptorSet0.vp_c9)._m0[85].z);
    int _2592 = int(_2590);
    float _2594 = float(uint(_2506));
    float _2596 = fma(_2514, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2540);
    int _2598 = _2580 * as_type<int>(_2456);
    int _2600 = _2598 + _2572;
    int _2602 = abs(_1642);
    int _2604 = _2588 * as_type<int>(_2418);
    int _2606 = _2604 + _2582;
    int _2608 = abs(_1872);
    int _2610 = abs(_2340);
    float _2612 = 1.0 / _2594;
    int _2614 = ~_2602;
    int _2616 = _2614 + 1;
    int _2618 = _2616 + 1;
    int _2620 = abs(_1564);
    int _2622 = _2618 * as_type<int>(_2494);
    int _2624 = _2622 + _2606;
    float _2626 = float(uint(_2592));
    int _2628 = ~_2610;
    int _2630 = _2628 + 1;
    int _2632 = _2630 + 1;
    int _2634 = ~_2608;
    int _2636 = _2634 + 1;
    int _2638 = _2636 + 1;
    float _2640 = float(uint(_2568));
    int _2642 = _2632 * as_type<int>(_2502);
    int _2644 = _2642 + _2624;
    float _2646 = _2574 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _2648 = _2566 * _2566;
    int _2650 = abs(_1584);
    float _2652 = _2596 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _2654 = _2282 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _2656 = fma(_2646, _2646, _2648);
    int _2658 = ~_2620;
    int _2660 = _2658 + 1;
    int _2662 = _2660 + 1;
    int _2664 = _2638 * as_type<int>(_2464);
    int _2666 = _2664 + _2600;
    float _2668 = 1.0 / _2626;
    float _2670 = fma(_2652, _2652, _2656);
    float _2672 = _2654 + _2646;
    int _2674 = _2666 * _2662;
    int _2676 = abs(_2592);
    float _2678 = _2306 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    int _2680 = ~_2592;
    int _2682 = _2680 + 1;
    int _2684 = _1806 * _2620;
    int _2686 = _2684 + _2674;
    float _2688 = 1.0 / _2640;
    float _2690 = float(uint(_2676));
    float _2692 = _2678 + _2652;
    float _2694 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _2696 = _2672 + _2694;
    int _2698 = abs(_2686);
    float _2700 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _2702 = _2692 + _2700;
    float _2704 = _2696 * _2696;
    float _2706 = rsqrt(_2670);
    int _2708 = ~_2650;
    int _2710 = _2708 + 1;
    int _2712 = _2710 + 1;
    float _2714 = _2702 * _2702;
    int _2716 = _2644 * _2712;
    float _2718 = _2704 + _2714;
    float _2720 = sqrt(_2334);
    int _2722 = _1842 * _2650;
    int _2724 = _2722 + _2716;
    int _2726 = as_type<int>(_2612) + (-2);
    float _2728 = _2400 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2730 = float(uint(_2686));
    int _2732 = as_type<int>(_2668) + (-2);
    float _2734 = 1.0 / _2690;
    float _2736 = float(uint(_2724));
    float _2738 = as_type<float>(_2726) * _2730;
    float _2740 = _2566 * _2706;
    float _2742 = fma(_2352, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2728);
    int _2744 = ~_2506;
    int _2746 = _2744 + 1;
    float _2748 = as_type<float>(_2732) * _2736;
    float _2750 = _2508 * _2740;
    float _2752 = trunc(_2738);
    float _2754 = precise::max(_2752, 0.0);
    uint _2756 = uint(_2754);
    int _2758 = abs(_2724);
    float _2760 = _2750 * _2720;
    int _2762 = as_type<int>(_2688) + (-2);
    float _2764 = fma(_2508, _2760, _2566);
    float _2766 = trunc(_2748);
    float _2768 = precise::max(_2766, 0.0);
    uint _2770 = uint(_2768);
    float _2772 = fma(_2406, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2550);
    float _2774 = float(uint(_2698));
    int _2776 = as_type<int>(_2734) + (-2);
    float _2778 = float(uint(_2758));
    float _2780 = sqrt(_2718);
    int _2782 = _2746 * int(_2756);
    int _2784 = _2782 + _2686;
    float _2786 = as_type<float>(_2762) * _2774;
    float _2788 = fma(_2406, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2552);
    float _2790 = as_type<float>(_2776) * _2778;
    float _2792 = fma(_2406, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2742);
    int _2794 = ~_2568;
    int _2796 = _2794 + 1;
    int _2798 = _2682 * int(_2770);
    int _2800 = _2798 + _2724;
    float _2802 = trunc(_2786);
    float _2804 = precise::max(_2802, 0.0);
    uint _2806 = uint(_2804);
    float _2808 = float(uint(_2784));
    float _2810 = -_187;
    int _2812 = _1826 ? as_type<int>(_2810) : as_type<int>(_187);
    float _2814 = float(uint(_2800));
    float _2816 = as_type<float>(_2726) * _2808;
    bool _2818 = _2780 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2820 = trunc(_2790);
    float _2822 = precise::max(_2820, 0.0);
    uint _2824 = uint(_2822);
    float _2826 = _2176 + _2764;
    int _2828 = ~_2676;
    int _2830 = _2828 + 1;
    float _2832 = as_type<float>(_2732) * _2814;
    bool _2834 = _912 > 0.5;
    float _2836 = trunc(_2816);
    float _2838 = precise::max(_2836, 0.0);
    uint _2840 = uint(_2838);
    float _2842 = _2508;
    float _2844 = as_type<float>(_2732);
    float _2846 = _2826;
    float _2848 = _2704;
    float _2850 = _2692;
    float _2852 = _2654;
    float _2854 = _2792;
    if (!_2818)
    {
        _2842 = _2672;
    }
    float _2856 = _2842;
    int _2858 = _2796 * int(_2806);
    int _2860 = _2858 + _2698;
    float _2862 = _2856;
    if (!_2818)
    {
        _2844 = _2714;
    }
    float _2864 = _2844;
    int _2866 = _2830 * int(_2824);
    int _2868 = _2866 + _2758;
    float _2870 = float(uint(_2860));
    float _2872 = float(uint(_2868));
    bool _2874 = !_2818;
    float _2876 = _2864;
    if (!_2874)
    {
        float _2878 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2880 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _2882 = _2780 + _2880;
        float _2884 = _2826 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2886 = rsqrt(_2718);
        float _2888 = _2882 * _2878;
        float _2890 = _2888 * 0.15915493667125701904296875;
        float _2892 = _2890 * 6.283185482025146484375;
        float _2894 = sin(_2892);
        float _2896 = _2890 * 6.283185482025146484375;
        float _2898 = cos(_2896);
        float _2900 = fma(_2894, _2884, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _2902 = _2886 * _2900;
        float _2904 = fma(_2696, _2902, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _2906 = _2898 + (-1.0);
        float _2908 = fma(_2702, _2902, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _2910 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _2912 = _2904 + _2910;
        float _2914 = _2906 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2916 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _2918 = _2908 + _2916;
        float _2920 = _2912 * _2912;
        float _2922 = fma(_2826, _2898, _2914);
        float _2924 = _2918 * _2918;
        _2846 = _2922;
        _2848 = _2920;
        _2876 = _2924;
        _2862 = _2904;
        _2850 = _2908;
    }
    float _2926 = _2846;
    float _2928 = _2848;
    float _2930 = _2876;
    float _2932 = _2862;
    float _2934 = _2850;
    float _2936 = as_type<float>(_2762) * _2870;
    float _2938 = as_type<float>(_2776) * _2872;
    float _2940 = trunc(_2832);
    float _2942 = precise::max(_2940, 0.0);
    uint _2944 = uint(_2942);
    float _2946 = -_187;
    int _2948 = _2194 ? as_type<int>(_2946) : as_type<int>(_187);
    float _2950 = _187 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    int _2952 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _2954 = _2952 != 0;
    float _2956 = fma(_2396, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2478);
    float _2958 = -_183;
    int _2960 = _1944 ? as_type<int>(_2958) : as_type<int>(_183);
    float _2962 = fma(_2396, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2480);
    float _2964 = -_183;
    int _2966 = _2834 ? as_type<int>(_2964) : as_type<int>(_183);
    float _2968 = trunc(_2936);
    float _2970 = precise::max(_2968, 0.0);
    uint _2972 = uint(_2970);
    float _2974 = fma(_2396, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2482);
    bool _2976 = !_2388;
    float _2978 = _2976 ? _187 : as_type<float>(_2812);
    float _2980 = _2950 * _2446;
    bool _2982 = !_2954;
    float _2984 = _2982 ? _187 : as_type<float>(_2948);
    float _2986 = _2950 * _2466;
    bool _2988 = !_1934;
    float _2990 = _2988 ? _183 : as_type<float>(_2960);
    float _2992 = _2950 * _2444;
    float _2994 = trunc(_2938);
    float _2996 = precise::max(_2994, 0.0);
    uint _2998 = uint(_2996);
    bool _3000 = !_2556;
    float _3002 = _3000 ? _183 : as_type<float>(_2966);
    float _3004 = _183 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    int _3006 = int(_2770) + int(_2944);
    float _3008 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _3010 = _2926 + _3008;
    int _3012 = int(_2756) + int(_2840);
    float _3014 = fma(_3004, _2956, _2992);
    float _3016 = fma(_3004, _2962, _2980);
    float _3018 = fma(_3004, _2974, _2986);
    int _3020 = ~_2568;
    int _3022 = _3020 + 1;
    float _3024 = fma(_3010, _3010, _2928);
    int _3026 = int(_2806) + int(_2972);
    float _3028 = -_1778;
    float _3030 = _3028 + 1.0;
    int _3032 = ~_2506;
    int _3034 = _3032 + 1;
    float _3036 = -_1782;
    float _3038 = _3036 + 1.0;
    int _3040 = ~_2592;
    int _3042 = _3040 + 1;
    int _3044 = _3022 * _3026;
    int _3046 = _3044 + _2698;
    int _3048 = int(_2824) + int(_2998);
    int _3050 = _3034 * _3012;
    int _3052 = _3050 + _2686;
    int _3054 = ~_2676;
    int _3056 = _3054 + 1;
    int _3058 = _3042 * _3006;
    int _3060 = _3058 + _2724;
    bool _3062 = uint(_3046) >= uint(_2568);
    float _3064 = _3024 + _2930;
    bool _3066 = uint(_3052) >= uint(_2506);
    float _3068 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    bool _3070 = uint(_3060) >= uint(_2592);
    int _3072 = _3056 * _3048;
    int _3074 = _3072 + _2758;
    bool _3076 = !_3066;
    int _3078 = _3076 ? 0 : (-1);
    float _3080 = -_1780;
    float _3082 = _3080 + 1.0;
    bool _3084 = !_3070;
    int _3086 = _3084 ? 0 : (-1);
    float _3088 = -_1784;
    float _3090 = _3088 + 1.0;
    int _3092 = ~_3012;
    int _3094 = _3092 + _3078;
    int _3096 = _3094 + 1;
    float _3098 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    int _3100 = ~_3006;
    int _3102 = _3100 + _3086;
    int _3104 = _3102 + 1;
    out.m_72.x = _705;
    out.m_72.y = _707;
    out.m_72.z = _709;
    out.m_72.w = _711;
    int _3106 = _2686 ^ _2506;
    bool _3108 = uint(_3074) >= uint(_2676);
    int _3110 = _2506 * _3096;
    int _3112 = _3110 + _2686;
    bool _3114 = !_3062;
    int _3116 = _3114 ? 0 : (-1);
    float _3118 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    uint _3120 = uint(int(uint(_3106) >> uint(31)));
    int _3122 = _2592 * _3104;
    int _3124 = _3122 + _2724;
    bool _3126 = _2506 == 0;
    out.m_74.x = _2956;
    out.m_74.y = _2962;
    out.m_74.z = _2974;
    bool _3128 = _2506 == 0;
    int _3130 = _2724 ^ _2592;
    float _3132 = sqrt(_3064);
    int _3134 = ~_3116;
    int _3136 = _3026 + _3134;
    int _3138 = _3136 + 1;
    int _3140 = ~int(_3120);
    int _3142 = _3140 + 1;
    bool _3144 = !_3108;
    int _3146 = _3144 ? 0 : (-1);
    uint _3148 = uint(int(uint(_3130) >> uint(31)));
    float _3150 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    bool _3152 = !_3126;
    int _3154 = _3152 ? _3112 : (-1);
    float _3156 = _3118 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    bool _3158 = _2592 == 0;
    bool _3160 = _2592 == 0;
    float _3162 = _3068 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    int _3164 = _3138 ^ _3142;
    float _3166 = fma(_2950, _2950, 1.0);
    int _3168 = ~_3146;
    int _3170 = _3048 + _3168;
    int _3172 = _3170 + 1;
    int _3174 = ~int(_3148);
    int _3176 = _3174 + 1;
    float _3178 = float(_3154);
    float _3180 = rsqrt(_3166);
    int _3182 = ~_3142;
    int _3184 = _3182 + _3164;
    int _3186 = _3184 + 1;
    int _3188 = _3172 ^ _3176;
    float _3190 = fma(_3162, _3178, _1768);
    bool _3192 = !_3158;
    int _3194 = _3192 ? _3124 : (-1);
    bool _3196 = !_3128;
    int _3198 = _3196 ? _3186 : (-1);
    int _3200 = ~_3176;
    int _3202 = _3200 + _3188;
    int _3204 = _3202 + 1;
    float _3206 = _2990 + 0.5;
    float _3208 = float(_3194);
    float _3210 = float(_3198);
    float _3212 = _3098 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    bool _3214 = !_3160;
    int _3216 = _3214 ? _3204 : (-1);
    float _3218 = fma(_3162, _3206, _3190);
    float _3220 = fma(_3156, _3208, _1788);
    float _3222 = -_1598;
    float _3224 = fma(_3212, _3210, _3222);
    float _3226 = float(_3216);
    float _3228 = _3002 + 0.5;
    float _3230 = _3150 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _3232 = _2984 + (-0.5);
    bool _3234 = _3132 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _3236 = isnan(_3132);
    bool _3238 = _3234 || _3236;
    bool _3240 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _3242 = _3238 || _3240;
    float _3244 = fma(_3156, _3228, _3220);
    float _3246 = -_1744;
    float _3248 = fma(_3230, _3226, _3246);
    float _3250 = _2950 * _3180;
    float _3252 = -_3212;
    float _3254 = fma(_3252, _3232, _3224);
    float _3256 = _2978 + (-0.5);
    float _3258 = -_2788;
    float _3260 = _3250 * _3258;
    float _3262 = -_2772;
    float _3264 = _3250 * _3262;
    float _3266 = -_2792;
    float _3268 = _3250 * _3266;
    float _3270 = -_3230;
    float _3272 = fma(_3270, _3256, _3248);
    float _3274 = fma(_3180, _2446, _3260);
    float _3276 = _2772 + _3014;
    float _3278 = -_3030;
    float _3280 = fma(_2990, _3278, _3218);
    float _3282 = fma(_3180, _2444, _3264);
    float _3284 = fma(_3180, _2466, _3268);
    float _3286 = _2788 + _3016;
    float _3288 = -_3038;
    float _3290 = fma(_3002, _3288, _3244);
    float _3292 = fma(_2984, _3082, _3254);
    float _3294 = fma(_2978, _3090, _3272);
    float _3296 = _2792 + _3018;
    out.m_76.x = _3282;
    out.m_76.y = _3274;
    out.m_76.z = _3284;
    float _3298 = _3030;
    float _3300 = _3082;
    float _3302 = _3218;
    if (!_3242)
    {
        _3298 = 1.0;
    }
    float _3304 = _3298;
    out.m_78.x = _3280;
    out.m_78.y = _3292;
    out.m_78.z = _3290;
    out.m_78.w = _3294;
    out.m_80.x = _3276;
    out.m_80.y = _3286;
    out.m_80.z = _3296;
    bool _3306 = !_3242;
    float _3308 = _3304;
    if (!_3306)
    {
        bool _3310 = _3132 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _3312 = isnan(_3132);
        bool _3314 = _3310 || _3312;
        bool _3316 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _3318 = _3314 || _3316;
        if (!_3318)
        {
            float _3320 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _3322 = _3132 + _3320;
            float _3324 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _3326 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _3324;
            float _3328 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _3330 = _3328 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _3332 = 1.0 / _3326;
            float _3334 = _3322 * _3332;
            float _3336 = fma(_3334, _3330, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _3308 = _3336;
            _3338 = true;
        }
        else
        {
            bool _3340 = _3132 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _3342 = isnan(_3132);
            bool _3344 = _3340 || _3342;
            bool _3346 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _3348 = _3344 || _3346;
            if (!_3348)
            {
                float _3350 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _3352 = _3132 + _3350;
                float _3354 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _3356 = _3354 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _3358 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _3360 = _3358 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _3362 = 1.0 / _3356;
                float _3364 = _3352 * _3362;
                float _3366 = fma(_3364, _3360, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _3308 = _3366;
                _3338 = true;
            }
            else
            {
                _3308 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _3338 = false;
    float _3368 = _3308;
    float _3370 = _2176 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _3372 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _3374 = _2932 + _3372;
    float _3376 = fma(_2654, (*spvDescriptorSet0.vp_c8)._m0[11].x, _3370);
    float _3378 = _2176 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _3380 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _3382 = _2934 + _3380;
    float _3384 = fma(_2678, (*spvDescriptorSet0.vp_c8)._m0[11].z, _3376);
    bool _3386 = (*spvDescriptorSet0.vp_c15)._m0[660].y >= 0.5;
    bool _3388 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _3390 = _3386 || _3388;
    bool _3392 = isnan(0.5);
    bool _3394 = _3390 || _3392;
    float _3396 = fma(_3374, _3368, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    bool _3398 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _3400 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _3402 = _3398 || _3400;
    bool _3404 = isnan(0.5);
    bool _3406 = _3402 || _3404;
    float _3408 = _3384 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _3410 = fma(_2654, (*spvDescriptorSet0.vp_c8)._m0[10].x, _3378);
    float _3412 = 1.0 / _3408;
    float _3414 = fma(_2678, (*spvDescriptorSet0.vp_c8)._m0[10].z, _3410);
    float _3416 = _3414 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _3418 = (*spvDescriptorSet0.vp_c15)._m0[660].y;
    float _3420 = _3408;
    if (_3406)
    {
        _3418 = 1.0;
    }
    float _3422 = _3418;
    float _3424 = _3416 + _3408;
    float _3426 = _3424 * _3412;
    float _3428 = _3426 * 0.5;
    float _3430 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _3432 = _2926 + _3430;
    float _3434 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _3436 = fma(_3428, (*spvDescriptorSet0.vp_c8)._m0[30].w, _3434);
    float _3438 = fma(_3432, _3368, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _3440 = fma(_3382, _3368, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _3442 = _3432;
    float _3444 = _3428;
    float _3446 = _3422;
    if (_3394)
    {
        _3442 = _3396;
    }
    float _3448 = _3442;
    float _3450 = 1.0 / _3436;
    float _3452 = _3448;
    if (_3394)
    {
        _3444 = _3438;
    }
    float _3454 = _3444;
    float _3456 = _3454;
    if (_3394)
    {
        _3420 = _3440;
    }
    float _3458 = _3420;
    float _3460 = _3458;
    if (!_3394)
    {
        float _3462 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _3464 = _2176 + _3462;
        float _3466 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _3468 = _2654 + _3466;
        float _3470 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _3472 = _3464 * _3464;
        float _3474 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _3476 = _2678 + _3474;
        float _3478 = fma(_3468, _3468, _3472);
        float _3480 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _3482 = fma(_3476, _3476, _3478);
        float _3484 = sqrt(_3482);
        float _3486 = _3470 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _3488 = precise::min(_3484, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _3490 = _3488 * _3480;
        float _3492 = -_2176;
        float _3494 = _3492 + _3438;
        float _3496 = _3486 * _3490;
        float _3498 = -_2654;
        float _3500 = _3498 + _3396;
        float _3502 = -_2678;
        float _3504 = _3502 + _3440;
        float _3506 = fma(_3494, _3496, _2176);
        float _3508 = fma(_3500, _3496, _2654);
        float _3510 = fma(_3504, _3496, _2678);
        _3456 = _3506;
        _3452 = _3508;
        _3460 = _3510;
    }
    float _3512 = _3456;
    float _3514 = _3452;
    float _3516 = _3460;
    float _3518 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _3520 = _3450 * _3518;
    if (!_3406)
    {
        float _3522 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _3524 = _3522 * 0.15915493667125701904296875;
        float _3526 = _3524 * 6.283185482025146484375;
        float _3528 = cos(_3526);
        float _3530 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _3532 = _3530 * 0.15915493667125701904296875;
        float _3534 = _3524 * 6.283185482025146484375;
        float _3536 = sin(_3534);
        float _3538 = 1.0 / _3528;
        float _3540 = _3532 * 6.283185482025146484375;
        float _3542 = cos(_3540);
        float _3544 = _3536 * _3538;
        float _3546 = _3532 * 6.283185482025146484375;
        float _3548 = sin(_3546);
        float _3550 = _3542 * _3544;
        float _3552 = 1.0 / _3550;
        float _3554 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _3556 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _3554;
        float _3558 = 1.0 / _3556;
        float _3560 = _3548 * _3552;
        float _3562 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _3564 = fma(_3520, _3560, _3562);
        float _3566 = _3564 * _3558;
        float _3568 = precise::clamp(_3566, 0.0, 1.0);
        _3300 = _3524;
        _3446 = _3568;
    }
    float _3570 = _3300;
    float _3572 = _3446;
    float _3574 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _3576 = _3512 + _3574;
    float _3578 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _3580 = _3514 + _3578;
    float _3582 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _3584 = _3516 + _3582;
    float _3586 = _3576 * _3576;
    float _3588 = fma(_3580, _3580, _3586);
    float _3590 = fma(_2654, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _3592 = fma(_3584, _3584, _3588);
    float _3594 = rsqrt(_3592);
    float _3596 = _3594 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _3598 = _3580 * _3596;
    float _3600 = _3584 * _3596;
    float _3602 = _3598 * _3598;
    float _3604 = _3600 * _3600;
    float _3606 = _3602 + _3604;
    float _3608 = sqrt(_3606);
    bool _3610 = _3608 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _3612 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _3614 = _3608 + _3612;
    float _3616 = _3584;
    float _3618 = _3586;
    float _3620 = _3614;
    float _3622 = _3576;
    float _3624 = _3570;
    float _3626 = _3606;
    if (_3610)
    {
        float _3628 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _3616 = _3628;
    }
    float _3630 = _3616;
    if (_3610)
    {
        float _3632 = rsqrt(_3606);
        _3618 = _3632;
    }
    float _3634 = _3618;
    float _3636 = _3634;
    if (_3610)
    {
        float _3638 = _3614 * _3630;
        _3620 = _3638;
    }
    float _3640 = _3620;
    if (_3610)
    {
        float _3642 = _3640 * 0.15915493667125701904296875;
        _3302 = _3642;
    }
    float _3644 = _3302;
    float _3646 = _3630;
    if (_3610)
    {
        float _3648 = _3644 * 6.283185482025146484375;
        float _3650 = sin(_3648);
        _3646 = _3650;
    }
    float _3652 = _3646;
    float _3654 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _3656 = precise::max(0.0, _3654);
    float _3658 = _3594;
    float _3660 = _3656;
    if (_3610)
    {
        float _3662 = _3644 * 6.283185482025146484375;
        float _3664 = cos(_3662);
        _3658 = _3664;
    }
    float _3666 = _3658;
    float _3668 = -_3596;
    float _3670 = -_3656;
    float _3672 = fma(_3576, _3668, _3670);
    if (!_3610)
    {
        _3622 = _3602;
    }
    float _3674 = _3622;
    float _3676 = _3674;
    if (_3610)
    {
        float _3678 = _3672 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _3660 = _3678;
    }
    float _3680 = _3660;
    float _3682 = _3680;
    if (!_3610)
    {
        _2852 = _3672;
    }
    float _3684 = _2852;
    float _3686 = _3684;
    if (_3610)
    {
        float _3688 = fma(_3652, _3680, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _3624 = _3688;
    }
    float _3690 = _3624;
    float _3692 = sqrt(_3592);
    float _3694 = _3666;
    if (_3610)
    {
        float _3696 = _3666 + (-1.0);
        _3682 = _3696;
    }
    float _3698 = _3682;
    float _3700 = _3698;
    if (_3610)
    {
        float _3702 = _3634 * _3690;
        _2854 = _3702;
    }
    float _3704 = _2854;
    if (!_3610)
    {
        _3636 = _3598;
    }
    float _3706 = _3636;
    float _3708 = _3706;
    if (_3610)
    {
        float _3710 = _3698 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _3626 = _3710;
    }
    float _3712 = _3626;
    if (_3610)
    {
        float _3714 = _3598 * _3704;
        _3708 = _3714;
    }
    float _3716 = _3708;
    if (!_3610)
    {
        _3700 = _3600;
    }
    float _3718 = _3700;
    float _3720 = _3718;
    if (_3610)
    {
        float _3722 = _3600 * _3704;
        _3720 = _3722;
    }
    float _3724 = _3720;
    if (_3610)
    {
        float _3726 = fma(_3672, _3666, _3712);
        _3686 = _3726;
    }
    float _3728 = _3686;
    if (_3610)
    {
        float _3730 = _3716 * _3716;
        _3676 = _3730;
    }
    float _3732 = _3676;
    float _3734 = _3512 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    if (!_3610)
    {
        _3694 = _3604;
    }
    float _3736 = _3694;
    float _3738 = _3736;
    if (_3610)
    {
        float _3740 = _3724 * _3724;
        _3738 = _3740;
    }
    float _3742 = _3738;
    float _3744 = fma(_3728, _3728, _3732);
    float _3746 = fma(_3514, (*spvDescriptorSet0.vp_c8)._m0[2].x, _3734);
    float _3748 = floor(_3590);
    float _3750 = _3744 + _3742;
    float _3752 = fma(_3516, (*spvDescriptorSet0.vp_c8)._m0[2].z, _3746);
    float _3754 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _3756 = fma(_3692, (*spvDescriptorSet0.vp_c15)._m0[23].w, _3754);
    float _3758 = precise::clamp(_3756, 0.0, 1.0);
    float _3760 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _3762 = _3752 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _3764 = -_3758;
    float _3766 = _3764 + 1.0;
    float _3768 = rsqrt(_3750);
    float _3770 = _3762 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _3772 = fma(_2678, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _3774 = _3512 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _3776 = -_3770;
    float _3778 = fma(_3776, _3760, 1.0);
    float _3780 = _3512 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _3782 = abs(_3766);
    float _3784 = log2(_3782);
    float _3786 = _3512 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _3788 = fma(_3514, (*spvDescriptorSet0.vp_c8)._m0[3].x, _3774);
    float _3790 = fma(_3514, (*spvDescriptorSet0.vp_c8)._m0[0].x, _3780);
    float _3792 = fma(_3514, (*spvDescriptorSet0.vp_c8)._m0[1].x, _3786);
    float _3794 = fma(_3516, (*spvDescriptorSet0.vp_c8)._m0[0].z, _3790);
    float _3796 = _3768 * _3716;
    float _3798 = fma(_3516, (*spvDescriptorSet0.vp_c8)._m0[1].z, _3792);
    float _3800 = _3768 * _3728;
    float _3802 = _3768 * _3724;
    float _3804 = _3796 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _3806 = _3798 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _3808 = _3794 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _3810 = fma(_3516, (*spvDescriptorSet0.vp_c8)._m0[3].z, _3788);
    float _3812 = -_3804;
    float _3814 = fma(_3800, (*spvDescriptorSet0.vp_c15)._m0[21].y, _3812);
    float _3816 = _3806 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _3818 = floor(_3772);
    float _3820 = _3810 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _3822 = -_3802;
    float _3824 = fma(_3822, (*spvDescriptorSet0.vp_c15)._m0[21].z, _3814);
    float _3826 = fma(_3808, (*spvDescriptorSet0.vp_c8)._m0[7].x, _3816);
    float _3828 = _3784 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _3830 = fma(_3824, -0.5, 0.5);
    float _3832 = fma(_3762, (*spvDescriptorSet0.vp_c8)._m0[7].z, _3826);
    float _3834 = log2(_3778);
    float _3836 = _3806 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _3838 = fma(_3820, (*spvDescriptorSet0.vp_c8)._m0[7].w, _3832);
    float _3840 = fma(_3808, (*spvDescriptorSet0.vp_c8)._m0[4].x, _3836);
    float _3842 = exp2(_3828);
    float _3844 = -_3748;
    float _3846 = _3590 + _3844;
    float _3848 = fma(_3824, 0.5, 0.5);
    float _3850 = _3806 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _3852 = -_3818;
    float _3854 = _3772 + _3852;
    float _3856 = fma(_3762, (*spvDescriptorSet0.vp_c8)._m0[4].z, _3840);
    float _3858 = fma(_3808, (*spvDescriptorSet0.vp_c8)._m0[5].x, _3850);
    float _3860 = sqrt(_3830);
    float _3862 = fma(_3848, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _3864 = fma(_3820, (*spvDescriptorSet0.vp_c8)._m0[4].w, _3856);
    float _3866 = fma(_3762, (*spvDescriptorSet0.vp_c8)._m0[5].z, _3858);
    float _3868 = _3834 * 0.693147182464599609375;
    float _3870 = fma(_3848, _3862, -0.212114393711090087890625);
    float _3872 = fma(_3820, (*spvDescriptorSet0.vp_c8)._m0[5].w, _3866);
    float _3874 = 1.0 / _3838;
    float _3876 = _3800 + 1.0;
    float _3878 = fma(_3848, _3870, 1.570728778839111328125);
    float2 _10100 = float2(_3846, _3854);
    float _3880 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_10100, float2(0.0), isnan(_10100)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_10100, float2(0.0), isnan(_10100)), level(0.0)).x;
    float _3882 = -_3800;
    float _3884 = fma(_3842, _3876, _3882);
    float _3886 = _3860 * 0.636619746685028076171875;
    float _3888 = -_3878;
    float _3890 = fma(_3886, _3888, 1.0);
    float _3892 = _3868 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _3894 = fma(_3884, 0.5, 0.5);
    float _3896 = _3864 * _3874;
    float _3898 = _3872 * _3874;
    float _3900 = fma(_3896, 0.5, 0.5);
    float _3902 = fma(_3898, -0.5, 0.5);
    float3 _10141 = float3(_3900, _3902, _3892);
    float _3904 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_10141, float3(0.0), isnan(_10141)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_10141, float3(0.0), isnan(_10141)), level(0.0)).x;
    float3 _10152 = float3(_3900, _3902, _3892);
    float4 _3907 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_10152, float3(0.0), isnan(_10152)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_10152, float3(0.0), isnan(_10152)), level(0.0)).xyzw;
    float _3909 = _3907.x;
    float _3911 = _3907.y;
    float _3913 = _3907.z;
    float _3915 = _3907.w;
    float2 _10168 = float2(_3890, _3894);
    float3 _3919 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_10168, float2(0.0), isnan(_10168)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_10168, float2(0.0), isnan(_10168)), level(0.0)).xyz;
    float _3921 = _3919.x;
    float _3923 = _3919.y;
    float _3925 = _3919.z;
    float _3927 = abs(_3520);
    float _3929 = log2(_3927);
    float _3931 = _3806 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    out.m_82.x = _3514;
    out.m_82.y = _3512;
    out.m_82.z = _3516;
    bool _3933 = _3692 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _3935 = isnan(_3692);
    bool _3937 = _3933 || _3935;
    bool _3939 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _3941 = _3937 || _3939;
    float _3943 = fma(_3808, (*spvDescriptorSet0.vp_c8)._m0[6].x, _3931);
    float _3945 = fma(_3762, (*spvDescriptorSet0.vp_c8)._m0[6].z, _3943);
    float _3947 = in.m_84.x;
    float _3949 = fma(_3820, (*spvDescriptorSet0.vp_c8)._m0[6].w, _3945);
    bool _3951 = _3520 <= 8000.0;
    bool _3953 = isnan(_3520);
    bool _3955 = _3951 || _3953;
    bool _3957 = isnan(8000.0);
    bool _3959 = _3955 || _3957;
    float _3961 = float(_3959);
    float _3963 = _3929 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _3965 = exp2(_3963);
    out.gl_Position.x = _3864;
    out.gl_Position.y = _3872;
    out.gl_Position.z = _3949;
    out.gl_Position.w = _3838;
    float _3967 = _3872;
    float _3969 = _3838;
    float _3971 = _3949;
    if (!_3941)
    {
        _3967 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _3973 = _3967;
    float _3975 = fma(_3965, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _3977 = precise::clamp(_3975, 0.0, 1.0);
    float _3979 = fma(_3977, -2.0, 3.0);
    float _3981 = _3977 * _3977;
    float _3983 = _3981 * _3979;
    float _3985 = _3784 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _3987 = -_3983;
    float _3989 = _3987 + 1.0;
    float _3991 = exp2(_3985);
    float _3993 = fma(_3989, (*spvDescriptorSet0.vp_c15)._m0[654].w, _3983);
    float _3995 = _3949 + _3838;
    float _3997 = _3973;
    float _3999 = _3973;
    if (!_3941)
    {
        _3969 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _4001 = _3969;
    float _4003 = _3961 * _3993;
    float _4005 = _3995 * 0.5;
    float _4007 = _4003 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _4009 = _4001;
    float _4011 = _4001;
    if (!_3941)
    {
        _3971 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _4013 = _3971;
    out.m_86.z = _4005;
    out.m_86.w = _3838;
    float _4015 = -_3991;
    float _4017 = _4015 + 1.0;
    float _4019 = _4017 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _4021 = -_4019;
    float _4023 = _4021 + 1.0;
    float _4025 = -_3880;
    float _4027 = _4025 + 1.0;
    float _4029 = _4027 * _4007;
    float _4031 = precise::clamp(_4029, 0.0, 1.0);
    float _4033 = -_4031;
    float _4035 = fma(_4033, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _4037 = _4035 * _3947;
    float _4039 = _4037 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    out.m_88.x = _4039;
    float _4041 = _4019 * _3904;
    float _4043 = _3915 * _4023;
    float _4045 = _4023;
    float _4047 = _3909;
    float _4049 = _4013;
    float _4051 = _4013;
    if (!_3941)
    {
        _4045 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _4053 = _4045;
    float _4055 = _3915 * _4041;
    float _4057 = _3925 * _4041;
    float _4059 = fma(_3921, _4055, _3909);
    float _4061 = fma(_3923, _4055, _3911);
    float _4063 = fma(_3915, _4057, _3913);
    float _4065 = _3572 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _4067 = _4055;
    float _4069 = _4053;
    float _4071 = _4053;
    if (!_3941)
    {
        _4067 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _4073 = _4067;
    float _4075 = _4073;
    float _4077 = _4073;
    if (!_3941)
    {
        _4047 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _4079 = _4047;
    out.m_90.x = _4059;
    out.m_90.y = _4061;
    out.m_90.z = _4063;
    out.m_90.w = _4043;
    bool _4081 = !_3941;
    float _4083 = _4079;
    float _4085 = _4079;
    if (!_4081)
    {
        bool _4087 = _3692 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _4089 = isnan(_3692);
        bool _4091 = _4087 || _4089;
        bool _4093 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _4095 = _4091 || _4093;
        if (!_4095)
        {
            float _4097 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _4099 = _3692 + _4097;
            float _4101 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _4103 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _4101;
            float _4105 = 1.0 / _4103;
            float _4107 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _4109 = _4107 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _4111 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _4113 = _4111 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _4115 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _4117 = _4115 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _4119 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _4121 = _4119 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _4123 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _4125 = _4123 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _4127 = _4099 * _4105;
            float _4129 = precise::clamp(_4127, 0.0, 1.0);
            float _4131 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _4133 = _4131 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _4135 = fma(_4129, _4109, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _4137 = fma(_4129, _4133, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _4139 = fma(_4129, _4113, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _4141 = fma(_4129, _4117, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _4143 = fma(_4129, _4121, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _4145 = fma(_4129, _4125, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _4085 = _4137;
            _3999 = _4143;
            _4077 = _4135;
            _4051 = _4141;
            _4011 = _4139;
            _4071 = _4145;
            _4147 = true;
        }
        else
        {
            bool _4149 = _3692 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _4151 = isnan(_3692);
            bool _4153 = _4149 || _4151;
            bool _4155 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _4157 = _4153 || _4155;
            if (!_4157)
            {
                _4075 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _4159 = _4075;
            _4077 = _4159;
            if (!_4157)
            {
                _4083 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _4161 = _4083;
            _4085 = _4161;
            if (!_4157)
            {
                _4009 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _4163 = _4009;
            _4011 = _4163;
            if (!_4157)
            {
                _4049 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _4165 = _4049;
            _4051 = _4165;
            if (!_4157)
            {
                _3997 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _4167 = _3997;
            _3999 = _4167;
            if (!_4157)
            {
                _4069 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _4169 = _4069;
            bool _4171 = !_4157;
            _4071 = _4169;
            if (!_4171)
            {
                bool _4173 = _3692 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _4175 = isnan(_3692);
                bool _4177 = _4173 || _4175;
                bool _4179 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _4181 = _4177 || _4179;
                if (!_4181)
                {
                    float _4183 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _4185 = _3692 + _4183;
                    float _4187 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _4189 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _4187;
                    float _4191 = 1.0 / _4189;
                    float _4193 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _4195 = _4193 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _4197 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _4199 = _4197 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _4201 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _4203 = _4201 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _4205 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _4207 = _4205 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _4209 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _4211 = _4209 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _4213 = _4185 * _4191;
                    float _4215 = precise::clamp(_4213, 0.0, 1.0);
                    float _4217 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _4219 = _4217 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _4221 = fma(_4215, _4195, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _4223 = fma(_4215, _4219, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _4225 = fma(_4215, _4199, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _4227 = fma(_4215, _4203, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _4229 = fma(_4215, _4207, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _4231 = fma(_4215, _4211, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _4085 = _4223;
                    _3999 = _4229;
                    _4077 = _4221;
                    _4051 = _4227;
                    _4011 = _4225;
                    _4071 = _4231;
                    _4147 = true;
                }
                else
                {
                    _4085 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _3999 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _4077 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _4051 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _4011 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _4071 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _4147 = false;
    float _4233 = _4085;
    float _4235 = _3999;
    float _4237 = _4077;
    float _4239 = _4051;
    float _4241 = _4011;
    float _4243 = _4071;
    float _4245 = fma(_3286, -0.5, 0.5);
    float _4247 = precise::clamp(_4245, 0.0, 1.0);
    float _4249 = -_4233;
    float _4251 = _4249 + _4235;
    float _4253 = _4065 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _4255 = -_4237;
    float _4257 = _4255 + _4239;
    float _4259 = fma(_4247, _4251, _4233);
    out.m_92.x = 0.0;
    float _4261 = -_4241;
    float _4263 = _4261 + _4243;
    float _4265 = fma(_4247, _4257, _4237);
    float _4267 = _4259 * 0.586610972881317138671875;
    out.m_51.x = _4253;
    bool _4269 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _4271 = fma(_4247, _4263, _4241);
    float _4273 = fma(_4265, 0.298911988735198974609375, _4267);
    bool _4275 = _3572 > 0.0;
    bool _4277 = isnan(_3572);
    bool _4279 = _4275 || _4277;
    bool _4281 = isnan(0.0);
    bool _4283 = _4279 || _4281;
    float _4285 = fma(_4271, 0.114477999508380889892578125, _4273);
    float _4287 = -_4285;
    float _4289 = _4265 + _4287;
    float _4291 = -_4285;
    float _4293 = _4259 + _4291;
    float _4295 = -_4285;
    float _4297 = _4271 + _4295;
    float _4299 = fma(_4289, (*spvDescriptorSet0.vp_c13)._m0[1].z, _4285);
    float _4301 = fma(_4293, (*spvDescriptorSet0.vp_c13)._m0[1].z, _4285);
    float _4303 = fma(_4297, (*spvDescriptorSet0.vp_c13)._m0[1].z, _4285);
    bool _4305 = !_4269;
    if (!_4305)
    {
        float _4307 = -_3512;
        float _4309 = _4307 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _4311 = -_3514;
        float _4313 = _4311 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _4315 = -_3516;
        float _4317 = _4315 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _4319 = _4309 * _4309;
        float _4321 = fma(_4313, _4313, _4319);
        float _4323 = fma(_4317, _4317, _4321);
        float _4325 = sqrt(_4323);
        float _4327 = rsqrt(_4323);
        float _4329 = -_4325;
        float _4331 = _4329 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _4333 = _4331 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _4335 = precise::clamp(_4333, 0.0, 1.0);
        float _4337 = _4313 * _4327;
        float _4339 = _4309 * _4327;
        float _4341 = abs(_4335);
        float _4343 = log2(_4341);
        float _4345 = _4317 * _4327;
        float _4347 = _4337 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _4349 = _3286 * _4339;
        float _4351 = -_4339;
        float _4353 = -_4347;
        float _4355 = fma(_4351, (*spvDescriptorSet0.vp_c15)._m0[656].y, _4353);
        float _4357 = fma(_3276, _4337, _4349);
        float _4359 = -_4345;
        float _4361 = fma(_4359, (*spvDescriptorSet0.vp_c15)._m0[656].z, _4355);
        float _4363 = fma(_3296, _4345, _4357);
        float _4365 = precise::clamp(_4363, 0.0, 1.0);
        float _4367 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _4369 = _4361 + _4367;
        float _4371 = _4343 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _4373 = _4369 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _4375 = precise::clamp(_4373, 0.0, 1.0);
        float _4377 = exp2(_4371);
        float _4379 = _4377 * _4375;
        float _4381 = _4365 * _4379;
        float _4383 = _4381 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _4385 = _4381 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _4387 = _4381 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_92.x = _4383;
        out.m_92.y = _4385;
        out.m_92.z = _4387;
    }
    out.m_94.x = _4299;
    out.m_94.y = _4301;
    out.m_94.z = _4303;
    if (_4283)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_62.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_62.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_62.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_62.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_94.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_94.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_94.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_94.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_92.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_92.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_92.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_92.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_88.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_88.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_88.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_88.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_90.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_90.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_90.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_90.w)); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    out.m_51.x = 0.0;
    float _4389 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _4389;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_62.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_62.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_62.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_62.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_94.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_94.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_94.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_94.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_92.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_92.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_92.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_92.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_88.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_88.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_88.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_88.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_90.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_90.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_90.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_90.w)); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

