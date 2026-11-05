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
    float4 m_66 [[user(locn0)]];
    float4 m_68 [[user(locn1)]];
    float4 m_55 [[user(locn2)]];
    float4 m_98 [[user(locn3)]];
    float4 m_53 [[user(locn4)]];
    float4 m_72 [[user(locn5)]];
    float4 m_90 [[user(locn6)]];
    float4 m_70 [[user(locn7)]];
    float4 m_80 [[user(locn8)]];
    float4 m_74 [[user(locn9)]];
    float4 m_78 [[user(locn10)]];
    float4 m_84 [[user(locn11)]];
    float4 m_86 [[user(locn12)]];
    float4 m_82 [[user(locn13)]];
    float4 m_96 [[user(locn14)]];
    float4 m_92 [[user(locn15)]];
    float4 m_94 [[user(locn16)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_88 [[attribute(0)]];
    float4 m_76 [[attribute(1)]];
    float4 m_60 [[attribute(2)]];
    float4 m_48 [[attribute(3)]];
    float4 m_50 [[attribute(4)]];
    float4 m_62 [[attribute(5)]];
    float4 m_64 [[attribute(6)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_66 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_68 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_55 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_98 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_53 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_72 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_90 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_70 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_80 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_74 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_78 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_84 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_86 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_82 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_96 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_92 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_94 = float4(0.0, 0.0, 0.0, 1.0);
    bool _4875 = false;
    bool _4078 = false;
    bool _663 = false;
    bool _519 = false;
    bool _239 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _112 = in.m_48.w;
    float _114 = in.m_50.w;
    float _116 = trunc(_112);
    int _119 = int(_116);
    float _121 = -_114;
    float _123 = _121 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    out.m_53.y = _123;
    bool _127 = _119 >= 1;
    float _129 = 0.0;
    float _131 = as_type<float>(_119);
    float _133 = _123;
    if (!_127)
    {
        _129 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _135 = _129;
    if (!_127)
    {
        out.m_55.x = 0.0;
    }
    int _137 = 0;
    if (!_127)
    {
        float _139 = _135 * 5.0;
        _137 = as_type<int>(_139);
    }
    int _141 = _137;
    int _143 = _141;
    if (!_127)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _5172 = as_type<float>(_141);
        out.gl_Position.z = _5172;
    }
    if (!_127)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    bool _145 = _114 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _147 = isnan(_114);
    bool _149 = _145 || _147;
    bool _151 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _153 = _149 || _151;
    float _155 = float(_119);
    bool _157 = _123 >= _155;
    bool _159 = !_153;
    bool _161 = _157 || _159;
    float _163 = 1.0 / _155;
    if (_161)
    {
        _131 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _165 = _131;
    if (_161)
    {
        out.m_55.x = 0.0;
    }
    float _167 = _123 * _163;
    float _169 = _167;
    if (_161)
    {
        float _171 = _165 * 5.0;
        _143 = as_type<int>(_171);
    }
    int _173 = _143;
    out.m_53.x = _167;
    if (_161)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _5235 = as_type<float>(_173);
        out.gl_Position.z = _5235;
    }
    if (_161)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _175 = as_type<float>(int(gl_VertexIndex));
    float _177 = in.m_60.x;
    float _179 = in.m_60.y;
    float _181 = in.m_60.z;
    int _183 = as_type<int>(_175) & 1;
    bool _185 = _183 != 0;
    int _187 = as_type<int>(_175) & 2;
    bool _189 = _187 != 0;
    bool _191 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _193 = _179 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _195 = _179 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _197 = _179 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    bool _199 = !_185;
    float _201 = _199 ? (-0.5) : 0.5;
    float _203 = fma(_177, (*spvDescriptorSet0.vp_c10)._m0[4].x, _193);
    float _205 = fma(_177, (*spvDescriptorSet0.vp_c10)._m0[5].x, _195);
    float _207 = fma(_177, (*spvDescriptorSet0.vp_c10)._m0[6].x, _197);
    bool _209 = !_189;
    float _211 = _209 ? (-0.5) : 0.5;
    float _213 = fma(_181, (*spvDescriptorSet0.vp_c10)._m0[4].z, _203);
    float _215 = fma(_181, (*spvDescriptorSet0.vp_c10)._m0[5].z, _205);
    float _217 = fma(_181, (*spvDescriptorSet0.vp_c10)._m0[6].z, _207);
    bool _219 = !_191;
    float _237;
    if (!_219)
    {
        float _221 = in.m_62.x;
        float _223 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _225 = _221 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _227 = fma(_225, (*spvDescriptorSet0.vp_c9)._m0[12].x, _123);
        float _229 = _227 * _223;
        float _231 = floor(_229);
        float _233 = -_231;
        float _235 = _229 + _233;
        _237 = _235;
        _239 = true;
    }
    else
    {
        _237 = _167;
    }
    _239 = false;
    float _241 = _237;
    float _243 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _245 = _241 + _243;
    float _247 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _249 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _247;
    float _251 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _253 = _251 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _255 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _257 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _255;
    float _259 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _261 = _259 + (*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _263 = 1.0 / _249;
    float _265 = -(*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _267 = (*spvDescriptorSet0.vp_c9)._m0[148].w + _265;
    bool _269 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _271 = 1.0 / _253;
    float _273 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _275 = _241 + _273;
    float _277 = 1.0 / _257;
    float _279 = _275 * _263;
    float _281 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _283 = _241 + _281;
    float _285 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _287 = _241 + _285;
    bool _289 = _241 >= (*spvDescriptorSet0.vp_c9)._m0[148].w;
    bool _291 = isnan(_241);
    bool _293 = _289 || _291;
    bool _295 = isnan((*spvDescriptorSet0.vp_c9)._m0[148].w);
    bool _297 = _293 || _295;
    float _299 = float(_297);
    float _301 = 1.0 / _267;
    float _303 = _245 * _271;
    float _305 = -(*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _307 = _241 + _305;
    bool _309 = _241 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _311 = isnan(_241);
    bool _313 = _309 || _311;
    bool _315 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _317 = _313 || _315;
    float _319 = float(_317);
    float _321 = 1.0 / _261;
    float _323 = _283 * _277;
    bool _325 = _241 >= (*spvDescriptorSet0.vp_c9)._m0[147].w;
    bool _327 = isnan(_241);
    bool _329 = _325 || _327;
    bool _331 = isnan((*spvDescriptorSet0.vp_c9)._m0[147].w);
    bool _333 = _329 || _331;
    float _335 = float(_333);
    float _337 = _307 * _301;
    float _339 = -_335;
    float _341 = _339 + 1.0;
    bool _343 = _241 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _345 = isnan(_241);
    bool _347 = _343 || _345;
    bool _349 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _351 = _347 || _349;
    float _353 = float(_351);
    float _355 = -_319;
    float _357 = _355 + 1.0;
    float _359 = _319 * _341;
    bool _361 = _241 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _363 = isnan(_241);
    bool _365 = _361 || _363;
    bool _367 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _369 = _365 || _367;
    float _371 = float(_369);
    float _373 = _353 * _357;
    float _375 = _287 * _321;
    float _377 = -_299;
    float _379 = _377 + 1.0;
    float _381 = -_353;
    float _383 = _381 + 1.0;
    bool _385 = _241 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _387 = isnan(_241);
    bool _389 = _385 || _387;
    bool _391 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _393 = _389 || _391;
    float _395 = float(_393);
    float _397 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _399 = _397 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _401 = _335 * _379;
    float _403 = _371 * _383;
    float _405 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _407 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _405;
    float _409 = -_371;
    float _411 = _409 + 1.0;
    float _413 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _415 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _413;
    float _417 = -_395;
    float _419 = _417 + 1.0;
    float _421 = fma(_407, _279, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _423 = _395 * _411;
    float _425 = fma(_415, _279, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _427 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _429 = _427 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _431 = fma(_399, _303, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _433 = _421 * _423;
    float _435 = _425 * _423;
    float _437 = fma(_429, _303, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _439 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _441 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _439;
    float _443 = fma(_419, (*spvDescriptorSet0.vp_c9)._m0[143].x, _433);
    float _445 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _447 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _445;
    float _449 = fma(_419, (*spvDescriptorSet0.vp_c9)._m0[143].y, _435);
    float _451 = -(*spvDescriptorSet0.vp_c9)._m0[146].x;
    float _453 = _451 + (*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _455 = fma(_441, _323, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _457 = fma(_447, _323, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _459 = -(*spvDescriptorSet0.vp_c9)._m0[146].y;
    float _461 = _459 + (*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _463 = fma(_431, _403, _443);
    float _465 = fma(_437, _403, _449);
    float _467 = fma(_453, _375, (*spvDescriptorSet0.vp_c9)._m0[146].x);
    float _469 = fma(_461, _375, (*spvDescriptorSet0.vp_c9)._m0[146].y);
    float _471 = -(*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _473 = (*spvDescriptorSet0.vp_c9)._m0[148].x + _471;
    float _475 = -(*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _477 = (*spvDescriptorSet0.vp_c9)._m0[148].y + _475;
    float _479 = fma(_455, _373, _463);
    float _481 = fma(_457, _373, _465);
    float _483 = fma(_473, _337, (*spvDescriptorSet0.vp_c9)._m0[147].x);
    float _485 = fma(_477, _337, (*spvDescriptorSet0.vp_c9)._m0[147].y);
    float _487 = fma(_467, _359, _479);
    float _489 = fma(_469, _359, _481);
    float _491 = fma(_483, _401, _487);
    float _493 = fma(_485, _401, _489);
    float _495 = fma(_299, (*spvDescriptorSet0.vp_c9)._m0[148].x, _491);
    float _497 = fma(_299, (*spvDescriptorSet0.vp_c9)._m0[148].y, _493);
    bool _499 = !_269;
    float _517;
    if (!_499)
    {
        float _501 = in.m_62.x;
        float _503 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _505 = _501 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _507 = fma(_505, (*spvDescriptorSet0.vp_c9)._m0[11].y, _123);
        float _509 = _507 * _503;
        float _511 = floor(_509);
        float _513 = -_511;
        float _515 = _509 + _513;
        _517 = _515;
        _519 = true;
    }
    else
    {
        _517 = _167;
    }
    _519 = false;
    float _521 = _517;
    float _523 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _525 = _521 + _523;
    float _527 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _529 = _527 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _531 = _521 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _533 = isnan(_521);
    bool _535 = _531 || _533;
    bool _537 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _539 = _535 || _537;
    float _541 = float(_539);
    float _543 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _545 = _543 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _547 = _521 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _549 = isnan(_521);
    bool _551 = _547 || _549;
    bool _553 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _555 = _551 || _553;
    float _557 = float(_555);
    float _559 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _561 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _559;
    bool _563 = _521 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _565 = isnan(_521);
    bool _567 = _563 || _565;
    bool _569 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _571 = _567 || _569;
    float _573 = float(_571);
    float _575 = 1.0 / _529;
    float _577 = -_541;
    float _579 = _577 + 1.0;
    bool _581 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _583 = 1.0 / _545;
    float _585 = _561 * _575;
    float _587 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _589 = _587 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _591 = -_573;
    float _593 = _591 + 1.0;
    float _595 = fma(_585, _525, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _597 = _557 * _579;
    float _599 = -_557;
    float _601 = _599 + 1.0;
    float _603 = _541 * _593;
    float _605 = _589 * _583;
    float _607 = _595 * _597;
    float _609 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _611 = _521 + _609;
    float _613 = fma(_601, (*spvDescriptorSet0.vp_c9)._m0[115].x, _607);
    float _615 = fma(_605, _611, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _617 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _619 = fma(_615, _603, _613);
    float _621 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _623 = _617 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _625 = fma(_573, (*spvDescriptorSet0.vp_c9)._m0[117].x, _619);
    float _627 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _629 = _621 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _631 = in.m_64.x;
    float _633 = in.m_64.y;
    float _635 = _625 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _637 = _627 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    out.m_66.x = _623;
    out.m_66.y = _629;
    out.m_66.z = _637;
    out.m_66.w = _635;
    float _639 = _497 * _633;
    float _641 = _495 * _631;
    bool _643 = !_581;
    float _661;
    if (!_643)
    {
        float _645 = in.m_62.x;
        float _647 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _649 = _645 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _651 = fma(_649, (*spvDescriptorSet0.vp_c9)._m0[11].w, _123);
        float _653 = _651 * _647;
        float _655 = floor(_653);
        float _657 = -_655;
        float _659 = _653 + _657;
        _661 = _659;
        _663 = true;
    }
    else
    {
        _661 = _167;
    }
    _663 = false;
    float _665 = _661;
    float _667 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _669 = _665 + _667;
    float _671 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _673 = _671 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _675 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _677 = _675 + (*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _679 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _681 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _679;
    bool _683 = _665 >= (*spvDescriptorSet0.vp_c9)._m0[133].w;
    bool _685 = isnan(_665);
    bool _687 = _683 || _685;
    bool _689 = isnan((*spvDescriptorSet0.vp_c9)._m0[133].w);
    bool _691 = _687 || _689;
    float _693 = float(_691);
    float _695 = 1.0 / _673;
    float _697 = -(*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _699 = _697 + (*spvDescriptorSet0.vp_c9)._m0[134].w;
    float _701 = -(*spvDescriptorSet0.vp_c9)._m0[134].w;
    float _703 = _701 + (*spvDescriptorSet0.vp_c9)._m0[135].w;
    bool _705 = _665 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _707 = isnan(_665);
    bool _709 = _705 || _707;
    bool _711 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _713 = _709 || _711;
    float _715 = float(_713);
    bool _717 = _665 >= (*spvDescriptorSet0.vp_c9)._m0[134].w;
    bool _719 = isnan(_665);
    bool _721 = _717 || _719;
    bool _723 = isnan((*spvDescriptorSet0.vp_c9)._m0[134].w);
    bool _725 = _721 || _723;
    float _727 = float(_725);
    float _729 = 1.0 / _677;
    bool _731 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[14].x;
    float _733 = _681 * _695;
    bool _735 = _665 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _737 = isnan(_665);
    bool _739 = _735 || _737;
    bool _741 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _743 = _739 || _741;
    float _745 = float(_743);
    float _747 = 1.0 / _699;
    float _749 = -_693;
    float _751 = _749 + 1.0;
    float _753 = fma(_733, _669, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    float _755 = -(*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _757 = (*spvDescriptorSet0.vp_c9)._m0[134].x + _755;
    float _759 = -_745;
    float _761 = _759 + 1.0;
    float _763 = _745 * _751;
    float _765 = -(*spvDescriptorSet0.vp_c9)._m0[132].x;
    float _767 = _765 + (*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _769 = -_727;
    float _771 = _769 + 1.0;
    float _773 = 1.0 / _703;
    float _775 = _715 * _761;
    float _777 = _767 * _729;
    float _779 = -_715;
    float _781 = _779 + 1.0;
    float _783 = _693 * _771;
    float _785 = _753 * _775;
    float _787 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _789 = _665 + _787;
    float _791 = -(*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _793 = _665 + _791;
    float _795 = _757 * _747;
    bool _797 = _665 >= (*spvDescriptorSet0.vp_c9)._m0[135].w;
    bool _799 = isnan(_665);
    bool _801 = _797 || _799;
    bool _803 = isnan((*spvDescriptorSet0.vp_c9)._m0[135].w);
    bool _805 = _801 || _803;
    float _807 = float(_805);
    float _809 = -(*spvDescriptorSet0.vp_c9)._m0[134].x;
    float _811 = _809 + (*spvDescriptorSet0.vp_c9)._m0[135].x;
    float _813 = fma(_777, _789, (*spvDescriptorSet0.vp_c9)._m0[132].x);
    float _815 = fma(_781, (*spvDescriptorSet0.vp_c9)._m0[131].x, _785);
    float _817 = fma(_795, _793, (*spvDescriptorSet0.vp_c9)._m0[133].x);
    float _819 = -_807;
    float _821 = _819 + 1.0;
    float _823 = -(*spvDescriptorSet0.vp_c9)._m0[134].w;
    float _825 = _665 + _823;
    float _827 = _811 * _773;
    float _829 = fma(_813, _763, _815);
    float _831 = _727 * _821;
    float _833 = fma(_827, _825, (*spvDescriptorSet0.vp_c9)._m0[134].x);
    float _835 = fma(_817, _783, _829);
    float _837 = fma(_833, _831, _835);
    float _839 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _841 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _843 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _845 = fma(_807, (*spvDescriptorSet0.vp_c9)._m0[135].x, _837);
    float _847 = _839 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _849 = _841 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _851 = _843 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _853 = _845 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    out.m_68.x = _847;
    out.m_68.y = _849;
    out.m_68.z = _851;
    out.m_68.w = _853;
    bool _855 = !_731;
    float _857 = _851;
    float _859 = _849;
    if (!_855)
    {
        float _861 = in.m_62.x;
        float _863 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[14].x;
        float _865 = _861 * (*spvDescriptorSet0.vp_c9)._m0[15].x;
        float _867 = fma(_865, (*spvDescriptorSet0.vp_c9)._m0[14].x, _123);
        float _869 = _867 * _863;
        float _871 = floor(_869);
        float _873 = -_871;
        float _875 = _869 + _873;
        _169 = _875;
    }
    float _877 = _169;
    float _879 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _881 = int(_879);
    int _883 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _885 = _883 != 0;
    float _887 = trunc((*spvDescriptorSet0.vp_c9)._m0[40].y);
    int _889 = int(_887);
    float _891 = float(_881);
    float _893 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _895 = int(_893);
    float _897 = (*spvDescriptorSet0.vp_c9)._m0[7].z;
    if (_885)
    {
        _857 = 1.0;
    }
    float _899 = _857;
    float _901 = _899;
    if (_885)
    {
        _897 = 1.0;
    }
    float _903 = _897;
    float _905 = float(_889);
    float _907 = trunc((*spvDescriptorSet0.vp_c9)._m0[49].y);
    int _909 = int(_907);
    float _911 = 1.0 / _891;
    float _913 = float(uint(_895));
    int _915 = ~_895;
    int _917 = _915 + 1;
    float _919 = trunc((*spvDescriptorSet0.vp_c9)._m0[40].x);
    int _921 = int(_919);
    float _923 = float(_909);
    float _925 = 1.0 / _905;
    float _927 = _911 * _123;
    float _929 = float(uint(_921));
    float _931 = 1.0 / _913;
    float _933 = _925 * _123;
    float _935 = trunc(_927);
    int _937 = int(_935);
    float _939 = _891;
    float _941 = _925;
    float _943 = _903;
    if (_885)
    {
        float _945 = in.m_62.x;
        float _947 = in.m_62.y;
        _939 = _945;
        _941 = _947;
    }
    float _949 = _939;
    float _951 = _941;
    float _953 = 1.0 / _923;
    int _955 = as_type<int>(_931) + (-2);
    int _957 = as_type<int>(_931);
    if (_885)
    {
        _957 = 0;
    }
    int _959 = _957;
    float _961 = 1.0 / _929;
    float _963 = float(uint(_937));
    float _965 = as_type<float>(_955) * _963;
    float _967 = trunc(_933);
    int _969 = int(_967);
    float _971 = _953 * _123;
    float _973 = _965;
    float _975 = _949;
    float _977 = _951;
    int _979 = _959;
    if (_885)
    {
        _859 = _949;
    }
    float _981 = _859;
    float _983 = trunc((*spvDescriptorSet0.vp_c9)._m0[49].x);
    int _985 = int(_983);
    int _987 = as_type<int>(_961) + (-2);
    float _989 = float(uint(_969));
    float _991 = trunc(_965);
    float _993 = precise::max(_991, 0.0);
    uint _996 = uint(_993);
    float _998 = as_type<float>(_987) * _989;
    float _1000 = _989;
    float _1002 = _981;
    if (_885)
    {
        _1000 = _981;
    }
    float _1004 = _1000;
    float _1006 = float(uint(_985));
    float _1008 = trunc(_971);
    int _1010 = int(_1008);
    float _1012 = _1006;
    float _1014 = _1004;
    if (_885)
    {
        _973 = _951;
    }
    float _1016 = _973;
    float _1018 = trunc(_998);
    float _1020 = precise::max(_1018, 0.0);
    uint _1022 = uint(_1020);
    int _1024 = _917 * int(_996);
    int _1026 = _1024 + _937;
    float _1028 = 1.0 / _1006;
    float _1030 = _1016;
    if (_885)
    {
        _1012 = _981;
    }
    float _1032 = _1012;
    float _1034 = _1032;
    if (!_885)
    {
        float _1036 = in.m_62.x;
        float _1038 = in.m_62.y;
        float _1040 = in.m_62.z;
        float _1042 = _1036 * 3.1415927410125732421875;
        float _1044 = _1042 * 0.15915493667125701904296875;
        float _1046 = _1038 * 3.1415927410125732421875;
        float _1048 = _1046 * 0.15915493667125701904296875;
        float _1050 = _1044 * 6.283185482025146484375;
        float _1052 = sin(_1050);
        float _1054 = _1048 * 6.283185482025146484375;
        float _1056 = sin(_1054);
        _901 = 7.345489978790283203125;
        _975 = _1036;
        _977 = _1038;
        _943 = 5.839270114898681640625;
        _1014 = _1040;
        _1002 = _1038;
        _1030 = _1056;
        _1034 = _1052;
        _979 = 2;
    }
    float _1058 = _901;
    float _1060 = _975;
    float _1062 = _977;
    float _1064 = _943;
    float _1066 = _1014;
    float _1068 = _1002;
    float _1070 = _1030;
    float _1072 = _1034;
    int _1074 = _979;
    float _1076 = float(uint(_1026));
    float _1078 = _1058 * _1060;
    float _1080 = float(uint(_1010));
    float _1082 = _1060 * 2.0;
    int _1084 = ~_921;
    int _1086 = _1084 + 1;
    float _1088 = as_type<float>(_955) * _1076;
    float _1090 = floor(_1078);
    int _1092 = as_type<int>(_1028) + (-2);
    int _1094 = ~_985;
    int _1096 = _1094 + 1;
    float _1098 = as_type<float>(_1092) * _1080;
    bool _1100 = _1062 > 0.5;
    float _1102 = trunc(_1088);
    float _1104 = precise::max(_1102, 0.0);
    uint _1106 = uint(_1104);
    int _1108 = _1086 * int(_1022);
    int _1110 = _1108 + _969;
    float _1112 = _1064 * _1066;
    int _1114 = ~_985;
    int _1116 = _1114 + 1;
    float _1118 = float(uint(_1110));
    float _1120 = trunc(_1098);
    float _1122 = precise::max(_1120, 0.0);
    uint _1124 = uint(_1122);
    float _1126 = -_1090;
    float _1128 = _1078 + _1126;
    int _1130 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _1132 = _1130 != 0;
    float _1134 = in.m_62.z;
    float _1136 = as_type<float>(_987) * _1118;
    int _1138 = int(_1132);
    int _1140 = _1100 ? 2 : 0;
    int _1142 = _1138 | _1140;
    int _1144 = _191 ? 4 : 0;
    int _1146 = _1142 | _1144;
    int _1148 = false ? 8 : 0;
    int _1150 = _1146 | _1148;
    int _1152 = false ? 16 : 0;
    int _1154 = _1150 | _1152;
    int _1156 = false ? 32 : 0;
    int _1158 = _1154 | _1156;
    int _1160 = false ? 64 : 0;
    int _1162 = _1158 | _1160;
    int _1164 = _1162 & 2;
    bool _1166 = !_1132;
    int _1168 = _1166 ? 0 : 1;
    float _1170 = trunc(_1136);
    float _1172 = precise::max(_1170, 0.0);
    uint _1174 = uint(_1172);
    int _1176 = int(_996) + int(_1106);
    int _1178 = ~_895;
    int _1180 = _1178 + 1;
    float _1182 = float(_895);
    int _1184 = abs(_1168);
    int _1186 = _1180 * _1176;
    int _1188 = _1186 + _937;
    float _1190 = floor(_1112);
    float _1192 = _1128 * _1182;
    int _1194 = _1096 * int(_1124);
    int _1196 = _1194 + _1010;
    float _1198 = _1058 * _1068;
    bool _1200 = uint(_1188) >= uint(_895);
    float _1202 = float(_937);
    float _1204 = trunc(_1192);
    int _1206 = int(_1204);
    float _1208 = float(uint(_1196));
    bool _1210 = _1202 >= _1182;
    bool _1212 = isnan(_1202);
    bool _1214 = _1210 || _1212;
    bool _1216 = isnan(_1182);
    bool _1218 = _1214 || _1216;
    float _1220 = float(_1218);
    bool _1222 = !_1200;
    int _1224 = _1222 ? 0 : (-1);
    float _1226 = as_type<float>(_1092) * _1208;
    bool _1228 = _1134 > 0.5;
    float _1230 = trunc(_1220);
    int _1232 = int(_1230);
    int _1234 = ~_1176;
    int _1236 = _1234 + _1224;
    int _1238 = _1236 + 1;
    float _1240 = -_1190;
    float _1242 = _1112 + _1240;
    int _1244 = int(_1022) + int(_1174);
    int _1246 = ~_921;
    int _1248 = _1246 + 1;
    int _1250 = _895 * _1238;
    int _1252 = _1250 + _937;
    int _1254 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16;
    bool _1256 = _1254 != 0;
    int _1258 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32;
    bool _1260 = _1258 != 0;
    float _1262 = trunc(_1226);
    float _1264 = precise::max(_1262, 0.0);
    uint _1266 = uint(_1264);
    int _1268 = _1206 * _1184;
    int _1270 = _1268 + _937;
    float _1272 = _163 * _123;
    float _1274 = -_211;
    int _1276 = _1228 ? as_type<int>(_1274) : as_type<int>(_211);
    int _1278 = _1248 * _1244;
    int _1280 = _1278 + _969;
    float _1282 = -_201;
    int _1284 = _1100 ? as_type<int>(_1282) : as_type<int>(_201);
    float _1286 = floor(_1198);
    bool _1288 = _895 == 0;
    bool _1290 = !_1260;
    float _1292 = _1290 ? _211 : as_type<float>(_1276);
    float _1294 = _1182 * _1272;
    bool _1296 = !_1256;
    float _1298 = _1296 ? _201 : as_type<float>(_1284);
    int _1300 = ~_1232;
    int _1302 = _1300 + 1;
    int _1304 = _1302 + 1;
    float _1306 = floor(_1082);
    bool _1308 = !_1288;
    int _1310 = _1308 ? _1252 : (-1);
    int _1312 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _1314 = _1312 != 0;
    int _1316 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _1318 = _1316 != 0;
    int _1320 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _1322 = _1320 != 0;
    bool _1324 = uint(_1280) >= uint(_921);
    int _1326 = _1310 * _1304;
    int _1328 = int(_1124) + int(_1266);
    float _1330 = trunc(_1294);
    int _1332 = int(_1330);
    bool _1334 = !_1314;
    int _1336 = _1334 ? 0 : 1;
    float _1338 = -_1286;
    float _1340 = _1198 + _1338;
    bool _1342 = !_1318;
    int _1344 = _1342 ? 0 : 1;
    int _1346 = _1116 * _1328;
    int _1348 = _1346 + _1010;
    float _1350 = float(_921);
    float _1352 = float(_969);
    float _1354 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _1356 = log2(_1354);
    int _1358 = _895 + (-1);
    float _1360 = _1242 * _1350;
    int _1362 = abs(_1336);
    int _1364 = abs(_1344);
    int _1366 = _1232 * _1358;
    int _1368 = _1366 + _1326;
    bool _1370 = _1352 >= _1350;
    bool _1372 = isnan(_1352);
    bool _1374 = _1370 || _1372;
    bool _1376 = isnan(_1350);
    bool _1378 = _1374 || _1376;
    float _1380 = float(_1378);
    float _1382 = _1350 * _1272;
    float _1384 = trunc(_1360);
    int _1386 = int(_1384);
    bool _1388 = !_1324;
    int _1390 = _1388 ? 0 : (-1);
    int _1392 = _1368 * _1364;
    int _1394 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _1396 = _1394 != 0;
    float _1398 = _1356 * _123;
    int _1400 = ~_1244;
    int _1402 = _1400 + _1390;
    int _1404 = _1402 + 1;
    float _1406 = trunc(_1380);
    int _1408 = int(_1406);
    bool _1410 = !_1322;
    int _1412 = _1410 ? 0 : 1;
    int _1414 = _1332 * _1362;
    int _1416 = _1414 + _1392;
    int _1418 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 4096;
    bool _1420 = _1418 != 0;
    int _1422 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 8192;
    bool _1424 = _1422 != 0;
    int _1426 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16384;
    bool _1428 = _1426 != 0;
    int _1430 = _921 * _1404;
    int _1432 = _1430 + _969;
    bool _1434 = !_1396;
    int _1436 = _1434 ? 0 : 1;
    float _1438 = float(_985);
    float _1440 = trunc(_1382);
    int _1442 = int(_1440);
    float _1444 = float(_1010);
    bool _1446 = !_1424;
    int _1448 = _1446 ? 0 : 1;
    float _1450 = _1438 * _1272;
    int _1452 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16384;
    bool _1454 = _1452 != 0;
    float _1456 = _1340 * _1438;
    bool _1458 = _921 == 0;
    int _1460 = abs(_1412);
    float _1462 = trunc(_1450);
    int _1464 = int(_1462);
    bool _1466 = _1444 >= _1438;
    bool _1468 = isnan(_1444);
    bool _1470 = _1466 || _1468;
    bool _1472 = isnan(_1438);
    bool _1474 = _1470 || _1472;
    float _1476 = float(_1474);
    int _1478 = ~_1408;
    int _1480 = _1478 + 1;
    int _1482 = _1480 + 1;
    bool _1484 = !_1458;
    int _1486 = _1484 ? _1432 : (-1);
    bool _1488 = !_1454;
    int _1490 = _1488 ? 0 : 1;
    float _1492 = trunc(_1456);
    int _1494 = int(_1492);
    bool _1496 = uint(_1348) >= uint(_985);
    int _1498 = _1486 * _1482;
    int _1500 = abs(_1436);
    int _1502 = _1270 * _1460;
    int _1504 = _1502 + _1416;
    bool _1506 = !_1496;
    int _1508 = _1506 ? 0 : (-1);
    float _1510 = trunc(_1476);
    int _1512 = int(_1510);
    int _1514 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32768;
    bool _1516 = _1514 != 0;
    int _1518 = ~_1328;
    int _1520 = _1518 + _1508;
    int _1522 = _1520 + 1;
    int _1524 = _1206 * _1500;
    int _1526 = _1524 + _1504;
    int _1528 = abs(_1490);
    bool _1530 = !_1420;
    int _1532 = _1530 ? 0 : 1;
    int _1534 = _985 * _1522;
    int _1536 = _1534 + _1010;
    float _1538 = float(uint(_1526));
    bool _1540 = !_1516;
    int _1542 = _1540 ? 0 : 1;
    int _1544 = abs(_1448);
    int _1546 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32768;
    bool _1548 = _1546 != 0;
    bool _1550 = _1164 != 0;
    int _1552 = abs(_1532);
    float _1554 = as_type<float>(_955) * _1538;
    int _1556 = _921 + (-1);
    int _1558 = _1386 * _1528;
    int _1560 = _1558 + _969;
    bool _1562 = !_1548;
    int _1564 = _1562 ? 0 : 1;
    int _1566 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 65536;
    bool _1568 = _1566 != 0;
    int _1570 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 131072;
    bool _1572 = _1570 != 0;
    int _1574 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 262144;
    bool _1576 = _1574 != 0;
    int _1578 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 524288;
    bool _1580 = _1578 != 0;
    float _1582 = trunc(_1554);
    float _1584 = precise::max(_1582, 0.0);
    uint _1586 = uint(_1584);
    int _1588 = _1408 * _1556;
    int _1590 = _1588 + _1498;
    int _1592 = ~_1512;
    int _1594 = _1592 + 1;
    int _1596 = _1594 + 1;
    bool _1598 = !_1572;
    int _1600 = _1598 ? 0 : 1;
    int _1602 = _1590 * _1544;
    bool _1604 = _985 == 0;
    bool _1606 = !_1428;
    int _1608 = _1606 ? 0 : 1;
    int _1610 = _1442 * _1552;
    int _1612 = _1610 + _1602;
    bool _1614 = !_1604;
    int _1616 = _1614 ? _1536 : (-1);
    int _1618 = ~_895;
    int _1620 = _1618 + 1;
    int _1622 = abs(_1542);
    int _1624 = _1616 * _1596;
    int _1626 = abs(_1608);
    int _1628 = _1620 * int(_1586);
    int _1630 = _1628 + _1526;
    bool _1632 = !_1568;
    int _1634 = _1632 ? 0 : 1;
    int _1636 = _1560 * _1626;
    int _1638 = _1636 + _1612;
    int _1640 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 64;
    bool _1642 = _1640 != 0;
    int _1644 = _985 + (-1);
    int _1646 = _1386 * _1622;
    int _1648 = _1646 + _1638;
    int _1650 = abs(_1564);
    float _1652 = float(uint(_1630));
    int _1654 = _1512 * _1644;
    int _1656 = _1654 + _1624;
    float _1658 = float(uint(_1648));
    int _1660 = _1494 * _1650;
    int _1662 = _1660 + _1010;
    int _1664 = abs(_1600);
    float _1666 = as_type<float>(_955) * _1652;
    int _1668 = abs(_1634);
    float _1670 = as_type<float>(_1612);
    float _1672 = as_type<float>(_1074);
    if (_1642)
    {
        float _1674 = in.m_62.w;
        _1670 = _1674;
    }
    float _1676 = _1670;
    float _1678 = as_type<float>(_987) * _1658;
    bool _1680 = !_1576;
    int _1682 = _1680 ? 0 : 1;
    int _1684 = _1656 * _1664;
    float _1686 = trunc(_1678);
    float _1688 = precise::max(_1686, 0.0);
    uint _1690 = uint(_1688);
    int _1692 = abs(_1682);
    float _1694 = float(uint(_1270));
    int _1696 = _1464 * _1668;
    int _1698 = _1696 + _1684;
    int _1700 = ~_921;
    int _1702 = _1700 + 1;
    float _1704 = trunc(_1666);
    float _1706 = precise::max(_1704, 0.0);
    uint _1708 = uint(_1706);
    float _1710 = as_type<float>(_955) * _1694;
    int _1712 = _1662 * _1692;
    int _1714 = _1712 + _1698;
    bool _1716 = !_1580;
    int _1718 = _1716 ? 0 : 1;
    int _1720 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 128;
    bool _1722 = _1720 != 0;
    int _1724 = _1702 * int(_1690);
    int _1726 = _1724 + _1648;
    int _1728 = ~_895;
    int _1730 = _1728 + 1;
    float _1732 = trunc(_1710);
    float _1734 = precise::max(_1732, 0.0);
    uint _1736 = uint(_1734);
    float _1738 = _1694;
    if (_1642)
    {
        float _1740 = _1676 * 3.1415927410125732421875;
        _1738 = _1740;
    }
    float _1742 = _1738;
    int _1744 = abs(_1718);
    float _1746 = float(uint(_1726));
    float _1748 = _1742;
    if (_1642)
    {
        float _1750 = _1742 * 0.15915493667125701904296875;
        _1748 = _1750;
    }
    float _1752 = _1748;
    int _1754 = int(_1586) + int(_1708);
    int _1756 = ~_895;
    int _1758 = _1756 + 1;
    float _1760 = as_type<float>(_987) * _1746;
    int _1762 = _1494 * _1744;
    int _1764 = _1762 + _1714;
    float _1766 = as_type<float>(_1708);
    if (_1722)
    {
        float _1768 = in.m_62.x;
        _1766 = _1768;
    }
    float _1770 = _1766;
    int _1772 = _1730 * _1754;
    int _1774 = _1772 + _1526;
    float _1776 = _1752;
    if (_1642)
    {
        float _1778 = _1752 * 6.283185482025146484375;
        float _1780 = sin(_1778);
        _1776 = _1780;
    }
    float _1782 = _1776;
    float _1784 = float(uint(_1764));
    bool _1786 = uint(_1774) >= uint(_895);
    int _1788 = _1758 * int(_1736);
    int _1790 = _1788 + _1270;
    bool _1792 = _895 == 0;
    float _1794 = trunc(_1760);
    float _1796 = precise::max(_1794, 0.0);
    uint _1798 = uint(_1796);
    bool _1800 = !_1786;
    int _1802 = _1800 ? 0 : (-1);
    float _1804 = as_type<float>(_1092) * _1784;
    float _1806 = float(uint(_1790));
    int _1808 = ~_1754;
    int _1810 = _1808 + _1802;
    int _1812 = _1810 + 1;
    float _1814 = 0.0;
    bool _1816 = _1786;
    if (!_1642)
    {
        _1814 = _201;
    }
    float _1818 = _1814;
    float _1820 = trunc(_1804);
    float _1822 = precise::max(_1820, 0.0);
    uint _1824 = uint(_1822);
    float _1826 = _1818;
    float _1828 = _1782;
    if (_1642)
    {
        bool _1830 = _1782 > 0.5;
        _1816 = _1830;
    }
    bool _1832 = _1816;
    int _1834 = _895 * _1812;
    int _1836 = _1834 + _1526;
    float _1838 = float(uint(_1560));
    float _1840 = as_type<float>(_955) * _1806;
    if (_1642)
    {
        float _1842 = -_201;
        float _1844 = _1832 ? _1842 : _201;
        _1826 = _1844;
    }
    float _1846 = _1826;
    if (_1722)
    {
        float _1848 = _1770 * 3.1415927410125732421875;
        _1828 = _1848;
    }
    float _1850 = _1828;
    bool _1852 = !_1792;
    int _1854 = _1852 ? _1836 : (-1);
    float _1856 = as_type<float>(_987) * _1838;
    int _1858 = int(_1690) + int(_1798);
    float _1860 = _1850;
    if (_1722)
    {
        float _1862 = _1850 * 0.15915493667125701904296875;
        _1860 = _1862;
    }
    float _1864 = _1860;
    int _1866 = _1854 & 3;
    bool _1868 = _1866 != 0;
    float _1870 = trunc(_1856);
    float _1872 = precise::max(_1870, 0.0);
    uint _1874 = uint(_1872);
    int _1876 = ~_985;
    int _1878 = _1876 + 1;
    int _1880 = _1854 & 3;
    bool _1882 = _1880 != 0;
    int _1884 = _1868 ? 0 : 1;
    int _1886 = _1878 * int(_1824);
    int _1888 = _1886 + _1764;
    int _1890 = ~_921;
    int _1892 = _1890 + 1;
    float _1894 = _1864;
    if (_1722)
    {
        float _1896 = _1864 * 6.283185482025146484375;
        float _1898 = sin(_1896);
        _1894 = _1898;
    }
    float _1900 = _1894;
    bool _1902 = uint(_1880) > 1u;
    float _1904 = float(uint(_1888));
    int _1906 = _1892 * _1858;
    int _1908 = _1906 + _1648;
    float _1910 = -_211;
    int _1912 = _1550 ? as_type<int>(_1910) : as_type<int>(_211);
    int _1914 = ~_921;
    int _1916 = _1914 + 1;
    float _1918 = as_type<float>(_1092) * _1904;
    bool _1920 = uint(_1908) >= uint(_921);
    float _1922 = trunc(_1840);
    float _1924 = precise::max(_1922, 0.0);
    uint _1926 = uint(_1924);
    int _1928 = ~_1884;
    int _1930 = _1928 + 1;
    int _1932 = _1930 + 1;
    int _1934 = _1916 * int(_1874);
    int _1936 = _1934 + _1560;
    float _1938 = 0.0;
    int _1940 = _1932;
    if (!_1722)
    {
        _1938 = _211;
    }
    float _1942 = _1938;
    float _1944 = _1942;
    if (!_1902)
    {
        int _1946 = ~_1884;
        int _1948 = _1946 + 1;
        _1940 = _1948;
    }
    int _1950 = _1940;
    bool _1952 = !_1920;
    int _1954 = _1952 ? 0 : (-1);
    float _1956 = trunc(_1918);
    float _1958 = precise::max(_1956, 0.0);
    uint _1960 = uint(_1958);
    bool _1962 = _1880 != 3;
    bool _1964 = uint(_1880) >= 2u;
    int _1966 = ~_1858;
    int _1968 = _1966 + _1954;
    int _1970 = _1968 + 1;
    int _1972 = _1964 ? 0 : 1;
    bool _1974 = _1964;
    if (_1722)
    {
        bool _1976 = _1900 > 0.5;
        _1974 = _1976;
    }
    bool _1978 = _1974;
    int _1980 = _921 * _1970;
    int _1982 = _1980 + _1648;
    float _1984 = float(uint(_1936));
    if (_1722)
    {
        float _1986 = -_211;
        float _1988 = _1978 ? _1986 : _211;
        _1944 = _1988;
    }
    float _1990 = _1944;
    bool _1992 = !_1458;
    int _1994 = _1992 ? _1982 : (-1);
    float _1996 = as_type<float>(_987) * _1984;
    int _1998 = ~_1972;
    int _2000 = _1998 + 1;
    int _2002 = _2000 + 1;
    int _2004 = _2002;
    if (_1962)
    {
        int _2006 = ~_1972;
        int _2008 = _2006 + 1;
        _2004 = _2008;
    }
    int _2010 = _2004;
    int _2012 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _2014 = _2012 != 0;
    float _2016 = trunc(_1996);
    float _2018 = precise::max(_2016, 0.0);
    uint _2020 = uint(_2018);
    int _2022 = _1994 & 3;
    bool _2024 = _2022 != 0;
    bool _2026 = !_2014;
    float _2028 = _2026 ? _211 : as_type<float>(_1912);
    int _2030 = int(_1736) + int(_1926);
    int _2032 = ~_895;
    int _2034 = _2032 + 1;
    bool _2036 = uint(_2022) > 1u;
    int _2038 = int(_1824) + int(_1960);
    int _2040 = ~_985;
    int _2042 = _2040 + 1;
    int _2044 = _1994 & 3;
    bool _2046 = _2044 != 0;
    int _2048 = _2042 * _2038;
    int _2050 = _2048 + _1764;
    int _2052 = _2046 ? 0 : 1;
    int _2054 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _2056 = _2054 != 0;
    int _2058 = _2034 * _2030;
    int _2060 = _2058 + _1270;
    float _2062 = float(uint(_1662));
    bool _2064 = !_2056;
    int _2066 = _2064 ? 0 : 1;
    bool _2068 = uint(_2050) >= uint(_985);
    float _2070 = as_type<float>(_1092) * _2062;
    int _2072 = ~_2052;
    int _2074 = _2072 + 1;
    int _2076 = _2074 + 1;
    int _2078 = _2076;
    if (!_2036)
    {
        int _2080 = ~_2052;
        int _2082 = _2080 + 1;
        _2078 = _2082;
    }
    int _2084 = _2078;
    float _2086 = trunc(_2070);
    float _2088 = precise::max(_2086, 0.0);
    uint _2090 = uint(_2088);
    bool _2092 = uint(_2060) >= uint(_895);
    bool _2094 = !_2068;
    int _2096 = _2094 ? 0 : (-1);
    bool _2098 = _2022 != 3;
    bool _2100 = !_2092;
    int _2102 = _2100 ? 0 : (-1);
    bool _2104 = uint(_2022) >= 2u;
    int _2106 = ~_2038;
    int _2108 = _2106 + _2096;
    int _2110 = _2108 + 1;
    int _2112 = ~_921;
    int _2114 = _2112 + 1;
    int _2116 = int(_1874) + int(_2020);
    int _2118 = _985 * _2110;
    int _2120 = _2118 + _1764;
    int _2122 = ~_985;
    int _2124 = _2122 + 1;
    float _2126 = _1062 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    int _2128 = _2104 ? 0 : 1;
    int _2130 = _2114 * _2116;
    int _2132 = _2130 + _1560;
    int _2134 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8388608;
    bool _2136 = _2134 != 0;
    int _2138 = ~_2128;
    int _2140 = _2138 + 1;
    int _2142 = _2140 + 1;
    int _2144 = _2142;
    if (_2098)
    {
        int _2146 = ~_2128;
        int _2148 = _2146 + 1;
        _2144 = _2148;
    }
    int _2150 = _2144;
    int _2152 = _2124 * int(_2090);
    int _2154 = _2152 + _1662;
    int _2156 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16777216;
    bool _2158 = _2156 != 0;
    bool _2160 = !_2136;
    int _2162 = _2160 ? 0 : 1;
    bool _2164 = uint(_2132) >= uint(_921);
    bool _2166 = !_1604;
    int _2168 = _2166 ? _2120 : (-1);
    bool _2170 = !_2158;
    int _2172 = _2170 ? 0 : 1;
    bool _2174 = !_2164;
    int _2176 = _2174 ? 0 : (-1);
    int _2178 = _2168 & 3;
    bool _2180 = _2178 != 0;
    int _2182 = _2168 & 3;
    bool _2184 = _2182 != 0;
    float _2186 = float(uint(_2154));
    int _2188 = _2180 ? 0 : 1;
    bool _2190 = uint(_2182) > 1u;
    float _2192 = as_type<float>(_1092) * _2186;
    int _2194 = ~_2188;
    int _2196 = _2194 + 1;
    int _2198 = _2196 + 1;
    float _2200 = trunc(_2192);
    float _2202 = precise::max(_2200, 0.0);
    uint _2204 = uint(_2202);
    float _2206 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _2208 = (*spvDescriptorSet0.vp_c9)._m0[93].w + (*spvDescriptorSet0.vp_c9)._m0[93].y;
    int _2210 = _2198;
    float _2212 = _2192;
    if (!_2190)
    {
        int _2214 = ~_2188;
        int _2216 = _2214 + 1;
        _2210 = _2216;
    }
    int _2218 = _2210;
    float _2220 = fma(_1070, (*spvDescriptorSet0.vp_c9)._m0[93].w, _2208);
    bool _2222 = uint(_2182) >= 2u;
    float _2224 = _1070 * (*spvDescriptorSet0.vp_c9)._m0[92].y;
    int _2226 = ~_985;
    int _2228 = _2226 + 1;
    float _2230 = (*spvDescriptorSet0.vp_c9)._m0[92].x + (*spvDescriptorSet0.vp_c9)._m0[91].z;
    int _2232 = _2222 ? 0 : 1;
    float _2234 = (*spvDescriptorSet0.vp_c9)._m0[87].x + (*spvDescriptorSet0.vp_c9)._m0[86].z;
    bool _2236 = _2182 != 3;
    float _2238 = fma(_123, (*spvDescriptorSet0.vp_c9)._m0[92].w, _2220);
    int _2240 = int(_2090) + int(_2204);
    int _2242 = ~_2232;
    int _2244 = _2242 + 1;
    int _2246 = _2244 + 1;
    int _2248 = _2228 * _2240;
    int _2250 = _2248 + _1662;
    float _2252 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    int _2254 = _2246;
    if (_2236)
    {
        int _2256 = ~_2232;
        int _2258 = _2256 + 1;
        _2254 = _2258;
    }
    int _2260 = _2254;
    float _2262 = (*spvDescriptorSet0.vp_c9)._m0[87].y + (*spvDescriptorSet0.vp_c9)._m0[86].w;
    bool _2264 = uint(_2250) >= uint(_985);
    float _2266 = _1060 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _2268 = (*spvDescriptorSet0.vp_c9)._m0[88].z + (*spvDescriptorSet0.vp_c9)._m0[88].x;
    float _2270 = -_2206;
    float _2272 = fma(_2266, 2.0, _2270);
    float _2274 = fma(_1060, (*spvDescriptorSet0.vp_c9)._m0[88].z, _2268);
    bool _2276 = !_2264;
    int _2278 = _2276 ? 0 : (-1);
    float _2280 = -_123;
    float _2282 = fma(_2280, (*spvDescriptorSet0.vp_c9)._m0[76].x, _2272);
    bool _2284 = _1060 > 0.5;
    float _2286 = (*spvDescriptorSet0.vp_c9)._m0[93].z + (*spvDescriptorSet0.vp_c9)._m0[93].x;
    float _2288 = -(*spvDescriptorSet0.vp_c9)._m0[159].w;
    float _2290 = _2288 + (*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _2292 = -_201;
    int _2294 = _2284 ? as_type<int>(_2292) : as_type<int>(_201);
    float _2296 = fma(_1072, (*spvDescriptorSet0.vp_c9)._m0[93].z, _2286);
    bool _2298 = _1074 != 2;
    float _2300 = _1072 * (*spvDescriptorSet0.vp_c9)._m0[92].x;
    float _2302 = -(*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _2304 = _2302 + (*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _2306 = exp2(_1398);
    float _2308 = fma(_123, (*spvDescriptorSet0.vp_c9)._m0[92].z, _2296);
    float _2310 = -_2230;
    float _2312 = fma(_2300, 2.0, _2310);
    float _2314 = -_123;
    float _2316 = fma(_2314, (*spvDescriptorSet0.vp_c9)._m0[91].x, _2312);
    float _2318 = (*spvDescriptorSet0.vp_c9)._m0[88].w + (*spvDescriptorSet0.vp_c9)._m0[88].y;
    float _2320 = 1.0 / _2290;
    if (_2298)
    {
        _2212 = _1060;
    }
    float _2322 = _2212;
    float _2324 = fma(_1062, (*spvDescriptorSet0.vp_c9)._m0[88].w, _2318);
    float _2326 = _2322;
    if (_2298)
    {
        _1672 = _1062;
    }
    float _2328 = _1672;
    float _2330 = -(*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _2332 = _2330 + (*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _2334 = _2328;
    if (!_2298)
    {
        _2326 = _1134;
    }
    float _2336 = _2326;
    float _2338 = -_2306;
    float _2340 = _2338 + 1.0;
    if (!_2298)
    {
        _2334 = _1060;
    }
    float _2342 = _2334;
    float _2344 = 1.0 / _2304;
    int _2346 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _2348 = _2346 != 0;
    float _2350 = fma(_2126, -2.0, _2252);
    float _2352 = _2342 * (*spvDescriptorSet0.vp_c9)._m0[87].y;
    bool _2354 = !_2348;
    float _2356 = _2354 ? _201 : as_type<float>(_2294);
    float _2358 = fma(_123, (*spvDescriptorSet0.vp_c9)._m0[76].y, _2350);
    bool _2360 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _2362 = isnan(0.0);
    bool _2364 = _2360 || _2362;
    bool _2366 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _2368 = _2364 || _2366;
    float _2370 = (*spvDescriptorSet0.vp_c9)._m0[92].y + (*spvDescriptorSet0.vp_c9)._m0[91].w;
    float _2372 = fma(_2352, -2.0, _2262);
    float _2374 = _2368 ? _2340 : 0.0;
    float _2376 = fma(_2224, -2.0, _2370);
    bool _2378 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _2380 = isnan(1.0);
    bool _2382 = _2378 || _2380;
    bool _2384 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _2386 = _2382 || _2384;
    float _2388 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _2390 = 1.0 + _2388;
    float _2392 = _2336 * (*spvDescriptorSet0.vp_c9)._m0[87].x;
    float _2394 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _2396 = 1.0 / _2390;
    float _2398 = -_2234;
    float _2400 = fma(_2392, 2.0, _2398);
    float _2402 = fma(_123, (*spvDescriptorSet0.vp_c9)._m0[91].y, _2376);
    float _2404 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _2406 = in.m_48.x;
    float _2408 = in.m_48.y;
    float _2410 = in.m_48.z;
    float _2412 = fma(_1062, (*spvDescriptorSet0.vp_c9)._m0[78].w, _2394);
    float _2414 = fma(_123, (*spvDescriptorSet0.vp_c9)._m0[87].w, _2324);
    float _2416 = fma(_1060, (*spvDescriptorSet0.vp_c9)._m0[78].z, _2404);
    float _2418 = -_123;
    float _2420 = fma(_2418, (*spvDescriptorSet0.vp_c9)._m0[86].x, _2400);
    float _2422 = fma(_123, (*spvDescriptorSet0.vp_c9)._m0[77].w, _2412);
    float _2424 = fma(_123, (*spvDescriptorSet0.vp_c9)._m0[86].y, _2372);
    float _2426 = fma(_123, (*spvDescriptorSet0.vp_c9)._m0[77].z, _2416);
    float _2428 = fma(_123, (*spvDescriptorSet0.vp_c9)._m0[87].z, _2274);
    float _2430 = _1062 * 2.0;
    float _2432 = 1.0 / _2332;
    if (_2386)
    {
        float _2434 = _2374 * _2396;
        _133 = _2434;
    }
    float _2436 = _133;
    bool _2438 = _1306 >= 0.0;
    bool _2440 = isnan(_1306);
    bool _2442 = _2438 || _2440;
    bool _2444 = isnan(0.0);
    bool _2446 = _2442 || _2444;
    float _2448 = -(*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _2450 = _2448 + (*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _2452 = -(*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _2454 = _2452 + (*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _2456 = -(*spvDescriptorSet0.vp_c9)._m0[159].x;
    float _2458 = (*spvDescriptorSet0.vp_c9)._m0[160].x + _2456;
    int _2460 = _2446 ? 0 : 1;
    float _2462 = floor(_2430);
    bool _2464 = _1306 > 0.0;
    float _2466 = -(*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _2468 = _2466 + (*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _2470 = _2458 * _2320;
    float _2472 = _2408 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _2474 = _2408 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _2476 = _2408 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _2478 = 1.0 / _2454;
    int _2480 = ~_2460;
    int _2482 = _2480 + 1;
    int _2484 = _2482 + 1;
    float _2486 = fma(_2406, (*spvDescriptorSet0.vp_c10)._m0[4].x, _2472);
    float _2488 = fma(_2406, (*spvDescriptorSet0.vp_c10)._m0[5].x, _2474);
    float _2490 = fma(_2406, (*spvDescriptorSet0.vp_c10)._m0[6].x, _2476);
    float _2492 = -(*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _2494 = _2492 + (*spvDescriptorSet0.vp_c9)._m0[166].w;
    int _2496 = _2484;
    if (!_2464)
    {
        int _2498 = ~_2460;
        int _2500 = _2498 + 1;
        _2496 = _2500;
    }
    int _2502 = _2496;
    float _2504 = -(*spvDescriptorSet0.vp_c9)._m0[160].x;
    float _2506 = _2504 + (*spvDescriptorSet0.vp_c9)._m0[161].x;
    float _2508 = 1.0 / _2468;
    bool _2510 = _2462 >= 0.0;
    bool _2512 = isnan(_2462);
    bool _2514 = _2510 || _2512;
    bool _2516 = isnan(0.0);
    bool _2518 = _2514 || _2516;
    float _2520 = -_2308;
    float _2522 = _2520 + 1.0;
    float _2524 = _2506 * _2344;
    int _2526 = _2518 ? 0 : 1;
    float _2528 = -_2422;
    float _2530 = _2528 + 1.0;
    bool _2532 = _2462 > 0.0;
    float _2534 = 1.0 / _2450;
    float _2536 = -_2428;
    float _2538 = _2536 + 1.0;
    bool _2540 = _877 >= (*spvDescriptorSet0.vp_c9)._m0[166].w;
    bool _2542 = isnan(_877);
    bool _2544 = _2540 || _2542;
    bool _2546 = isnan((*spvDescriptorSet0.vp_c9)._m0[166].w);
    bool _2548 = _2544 || _2546;
    float _2550 = float(_2548);
    float _2552 = -_2414;
    float _2554 = _2552 + 1.0;
    bool _2556 = _877 >= (*spvDescriptorSet0.vp_c9)._m0[163].w;
    bool _2558 = isnan(_877);
    bool _2560 = _2556 || _2558;
    bool _2562 = isnan((*spvDescriptorSet0.vp_c9)._m0[163].w);
    bool _2564 = _2560 || _2562;
    float _2566 = float(_2564);
    float _2568 = -(*spvDescriptorSet0.vp_c9)._m0[161].x;
    float _2570 = (*spvDescriptorSet0.vp_c9)._m0[162].x + _2568;
    float _2572 = -(*spvDescriptorSet0.vp_c9)._m0[162].x;
    float _2574 = _2572 + (*spvDescriptorSet0.vp_c9)._m0[163].x;
    float _2576 = 1.0 / _2494;
    int _2578 = ~_2030;
    int _2580 = _2578 + _2102;
    int _2582 = _2580 + 1;
    float _2584 = _2570 * _2478;
    float _2586 = _1134 * 2.0;
    float _2588 = _2574 * _2432;
    int _2590 = ~_2116;
    int _2592 = _2590 + _2176;
    int _2594 = _2592 + 1;
    float _2596 = -(*spvDescriptorSet0.vp_c9)._m0[163].x;
    float _2598 = (*spvDescriptorSet0.vp_c9)._m0[164].x + _2596;
    int _2600 = ~_2526;
    int _2602 = _2600 + 1;
    int _2604 = _2602 + 1;
    float _2606 = floor(_2586);
    int _2608 = _2604;
    if (!_2532)
    {
        int _2610 = ~_2526;
        int _2612 = _2610 + 1;
        _2608 = _2612;
    }
    int _2614 = _2608;
    int _2616 = _921 * _2594;
    int _2618 = _2616 + _1560;
    float _2620 = _2598 * _2508;
    float _2622 = -(*spvDescriptorSet0.vp_c9)._m0[164].x;
    float _2624 = _2622 + (*spvDescriptorSet0.vp_c9)._m0[165].x;
    bool _2626 = _877 >= (*spvDescriptorSet0.vp_c9)._m0[164].w;
    bool _2628 = isnan(_877);
    bool _2630 = _2626 || _2628;
    bool _2632 = isnan((*spvDescriptorSet0.vp_c9)._m0[164].w);
    bool _2634 = _2630 || _2632;
    float _2636 = float(_2634);
    int _2638 = _895 * _2582;
    int _2640 = _2638 + _1270;
    bool _2642 = !_1458;
    int _2644 = _2642 ? _2618 : (-1);
    float _2646 = -(*spvDescriptorSet0.vp_c9)._m0[165].x;
    float _2648 = (*spvDescriptorSet0.vp_c9)._m0[166].x + _2646;
    int _2650 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _2652 = _2650 != 0;
    int _2654 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _2656 = _2654 != 0;
    int _2658 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _2660 = _2658 != 0;
    float _2662 = _2624 * _2534;
    bool _2664 = _877 >= (*spvDescriptorSet0.vp_c9)._m0[165].w;
    bool _2666 = isnan(_877);
    bool _2668 = _2664 || _2666;
    bool _2670 = isnan((*spvDescriptorSet0.vp_c9)._m0[165].w);
    bool _2672 = _2668 || _2670;
    float _2674 = float(_2672);
    float _2676 = -_2550;
    float _2678 = _2676 + 1.0;
    bool _2680 = !_1882;
    int _2682 = _2680 ? 0 : 1;
    float _2684 = fma(_2410, (*spvDescriptorSet0.vp_c10)._m0[6].z, _2490);
    bool _2686 = _2606 >= 0.0;
    bool _2688 = isnan(_2606);
    bool _2690 = _2686 || _2688;
    bool _2692 = isnan(0.0);
    bool _2694 = _2690 || _2692;
    float _2696 = _2648 * _2576;
    int _2698 = _1994 >> 31;
    float _2700 = -_2674;
    float _2702 = _2700 + 1.0;
    float _2704 = _2674 * _2678;
    int _2706 = _2694 ? 0 : 1;
    float _2708 = -(*spvDescriptorSet0.vp_c9)._m0[159].w;
    float _2710 = _877 + _2708;
    bool _2712 = _2606 > 0.0;
    float _2714 = -_2636;
    float _2716 = _2714 + 1.0;
    bool _2718 = _877 >= (*spvDescriptorSet0.vp_c9)._m0[162].w;
    bool _2720 = isnan(_877);
    bool _2722 = _2718 || _2720;
    bool _2724 = isnan((*spvDescriptorSet0.vp_c9)._m0[162].w);
    bool _2726 = _2722 || _2724;
    float _2728 = float(_2726);
    float _2730 = _2636 * _2702;
    int _2732 = _2698 & 3;
    float _2734 = fma(_2410, (*spvDescriptorSet0.vp_c10)._m0[4].z, _2486);
    float _2736 = fma(_2410, (*spvDescriptorSet0.vp_c10)._m0[5].z, _2488);
    float _2738 = fma(_2470, _2710, (*spvDescriptorSet0.vp_c9)._m0[159].x);
    float _2740 = _2566 * _2716;
    float _2742 = -_2566;
    float _2744 = _2742 + 1.0;
    bool _2746 = _877 >= (*spvDescriptorSet0.vp_c9)._m0[161].w;
    bool _2748 = isnan(_877);
    bool _2750 = _2746 || _2748;
    bool _2752 = isnan((*spvDescriptorSet0.vp_c9)._m0[161].w);
    bool _2754 = _2750 || _2752;
    float _2756 = float(_2754);
    float _2758 = -(*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _2760 = _877 + _2758;
    int _2762 = _1994 + _2732;
    float _2764 = -_2728;
    float _2766 = _2764 + 1.0;
    float _2768 = _2728 * _2744;
    float _2770 = fma(_2524, _2760, (*spvDescriptorSet0.vp_c9)._m0[160].x);
    int _2772 = _2762 >> 2;
    float _2774 = _2756 * _2766;
    bool _2776 = _877 >= (*spvDescriptorSet0.vp_c9)._m0[160].w;
    bool _2778 = isnan(_877);
    bool _2780 = _2776 || _2778;
    bool _2782 = isnan((*spvDescriptorSet0.vp_c9)._m0[160].w);
    bool _2784 = _2780 || _2782;
    float _2786 = float(_2784);
    float _2788 = -_2756;
    float _2790 = _2788 + 1.0;
    float _2792 = -(*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _2794 = _877 + _2792;
    float _2796 = -(*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _2798 = _877 + _2796;
    int _2800 = _2772 << 4;
    int _2802 = _2800 + 656;
    float _2804 = _2786 * _2790;
    bool _2806 = _877 >= (*spvDescriptorSet0.vp_c9)._m0[159].w;
    bool _2808 = isnan(_877);
    bool _2810 = _2806 || _2808;
    bool _2812 = isnan((*spvDescriptorSet0.vp_c9)._m0[159].w);
    bool _2814 = _2810 || _2812;
    float _2816 = float(_2814);
    float _2818 = -_2786;
    float _2820 = _2818 + 1.0;
    float _2822 = fma(_2584, _2794, (*spvDescriptorSet0.vp_c9)._m0[161].x);
    float _2824 = fma(_2588, _2798, (*spvDescriptorSet0.vp_c9)._m0[162].x);
    float _2826 = -(*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _2828 = _877 + _2826;
    uint _2830 = uint(int(uint(_2802) >> uint(2)));
    uint _2832 = uint(int(uint(int(_2830)) >> uint(2)));
    int _2834 = int(_2830) & 3;
    float _2836 = (*spvDescriptorSet0.vp_c9)._m0[int(_2832)][_2834];
    int _2838 = int(_2830) + 1;
    uint _2840 = uint(int(uint(_2838) >> uint(2)));
    int _2842 = _2838 & 3;
    float _2844 = (*spvDescriptorSet0.vp_c9)._m0[int(_2840)][_2842];
    float _2846 = _2816 * _2820;
    float _2848 = -(*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _2850 = _877 + _2848;
    float _2852 = -_2816;
    float _2854 = _2852 + 1.0;
    float _2856 = -(*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _2858 = _877 + _2856;
    float _2860 = _2738 * _2846;
    float _2862 = fma(_2620, _2828, (*spvDescriptorSet0.vp_c9)._m0[163].x);
    float _2864 = _2734 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    int _2866 = _2802 + 8;
    uint _2868 = uint(int(uint(_2866) >> uint(2)));
    uint _2870 = uint(int(uint(int(_2868)) >> uint(2)));
    int _2872 = int(_2868) & 3;
    float _2874 = (*spvDescriptorSet0.vp_c9)._m0[int(_2870)][_2872];
    int _2876 = int(_2868) + 1;
    uint _2878 = uint(int(uint(_2876) >> uint(2)));
    int _2880 = _2876 & 3;
    float _2882 = (*spvDescriptorSet0.vp_c9)._m0[int(_2878)][_2880];
    float _2884 = fma(_2854, (*spvDescriptorSet0.vp_c9)._m0[159].x, _2860);
    float _2886 = fma(_2696, _2858, (*spvDescriptorSet0.vp_c9)._m0[165].x);
    float _2888 = _2736 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    int _2890 = ~_2706;
    int _2892 = _2890 + 1;
    int _2894 = _2892 + 1;
    float _2896 = fma(_2770, _2804, _2884);
    int _2898 = _2894;
    if (!_2712)
    {
        int _2900 = ~_2706;
        int _2902 = _2900 + 1;
        _2898 = _2902;
    }
    int _2904 = _2898;
    float _2906 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2908 = _2888 + _2906;
    float _2910 = fma(_2662, _2850, (*spvDescriptorSet0.vp_c9)._m0[164].x);
    float _2912 = fma(_2822, _2774, _2896);
    float _2914 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2916 = _2864 + _2914;
    float _2918 = _2908 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _2920 = _1062 + _1060;
    bool _2922 = !_2024;
    int _2924 = _2922 ? 0 : 1;
    float _2926 = _1060 + _1134;
    bool _2928 = _2022 != 3;
    float _2930 = fma(_2916, (*spvDescriptorSet0.vp_c8)._m0[28].x, _2918);
    float _2932 = _1060 + (-0.5);
    float _2934 = _2920 + (-1.0);
    float _2936 = fma(_2824, _2768, _2912);
    float _2938 = _1062 + _1134;
    float _2940 = _1062 + (-0.5);
    float _2942 = fma(_2934, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _2944 = _1846 + 0.5;
    float _2946 = fma(_2862, _2740, _2936);
    int _2948 = abs(_2084);
    float _2950 = _2684 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _2952 = fma(_2944, (*spvDescriptorSet0.vp_c9)._m0[95].x, _2316);
    int _2954 = abs(_2150);
    float _2956 = fma(_2910, _2730, _2946);
    float _2958 = trunc((*spvDescriptorSet0.vp_c9)._m0[90].z);
    int _2960 = int(_2958);
    bool _2962 = !_2928;
    int _2964 = _2962 ? 0 : (-1);
    float _2966 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2968 = _2950 + _2966;
    int _2970 = abs(_2924);
    int _2972 = ~_2948;
    int _2974 = _2972 + 1;
    int _2976 = _2974 + 1;
    float _2978 = fma(_2968, (*spvDescriptorSet0.vp_c8)._m0[28].z, _2930);
    int _2980 = abs(_2964);
    int _2982 = ~_2970;
    int _2984 = _2982 + 1;
    int _2986 = _2984 + 1;
    int _2988 = _2976 * as_type<int>(_2844);
    float _2990 = _1990 + (-0.5);
    bool _2992 = _2978 >= 0.0;
    int _2994 = _2986 * as_type<int>(_2836);
    int _2996 = _2994 + _2988;
    int _2998 = ~_2954;
    int _3000 = _2998 + 1;
    int _3002 = _3000 + 1;
    float _3004 = -_2990;
    float _3006 = -_2402;
    float _3008 = fma(_3004, (*spvDescriptorSet0.vp_c9)._m0[95].y, _3006);
    int _3010 = abs(_2162);
    float _3012 = _2356 + 0.5;
    float _3014 = float(uint(_2960));
    int _3016 = _3002 * as_type<int>(_2874);
    int _3018 = _3016 + _2996;
    int _3020 = ~_2980;
    int _3022 = _3020 + 1;
    int _3024 = _3022 + 1;
    float _3026 = _2028 + (-0.5);
    int _3028 = ~_3010;
    int _3030 = _3028 + 1;
    int _3032 = _3030 + 1;
    float _3034 = fma(_3012, (*spvDescriptorSet0.vp_c9)._m0[80].x, _2282);
    float _3036 = 1.0 / _3014;
    int _3038 = _3024 * as_type<int>(_2882);
    int _3040 = _3038 + _3018;
    int _3042 = abs(_2960);
    float _3044 = -_3026;
    float _3046 = -_2358;
    float _3048 = fma(_3044, (*spvDescriptorSet0.vp_c9)._m0[80].y, _3046);
    int _3050 = _1854 >> 31;
    int _3052 = _3040 * _3032;
    int _3054 = _3050 & 3;
    int _3056 = _2644 * _3010;
    int _3058 = _3056 + _3052;
    float _3060 = float(uint(_3042));
    float _3062 = fma(_2028, _2530, _3048);
    float _3064 = _3012;
    if (_2992)
    {
        _3064 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _3066 = _3064;
    float _3068 = fma(_2886, _2704, _2956);
    int _3070 = _1854 + _3054;
    int _3072 = as_type<int>(_3066);
    if (_2992)
    {
        out.m_55.x = 0.0;
    }
    int _3074 = as_type<int>(_3036) + (-2);
    if (_2992)
    {
        float _3076 = _3066 * 5.0;
        _3072 = as_type<int>(_3076);
    }
    int _3078 = _3072;
    float _3080 = float(uint(_3058));
    float _3082 = 1.0 / _3060;
    int _3084 = _2168 >> 31;
    float _3086 = fma(_2550, (*spvDescriptorSet0.vp_c9)._m0[166].x, _3068);
    if (_2992)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _9486 = as_type<float>(_3078);
        out.gl_Position.z = _9486;
    }
    float _3088 = as_type<float>(_3074) * _3080;
    int _3090 = _3084 & 3;
    float _3092 = _2908 * _2908;
    bool _3094 = !_2652;
    int _3096 = _3094 ? 0 : 1;
    out.m_70.x = _3086;
    int _3098 = _2168 + _3090;
    int _3100 = _3070 >> 2;
    int _3102 = ~_2240;
    int _3104 = _3102 + _2278;
    int _3106 = _3104 + 1;
    float _3108 = -_2522;
    float _3110 = fma(_3108, _1846, _2952);
    float _3112 = -_2426;
    float _3114 = _3112 + 1.0;
    float _3116 = trunc(_3088);
    float _3118 = precise::max(_3116, 0.0);
    uint _3120 = uint(_3118);
    float _3122 = -_2238;
    float _3124 = _3122 + 1.0;
    int _3126 = ~_2960;
    int _3128 = _3126 + 1;
    float _3130 = -_3114;
    float _3132 = fma(_2356, _3130, _3034);
    int _3134 = abs(_3058);
    float _3136 = fma(_3124, _1990, _3008);
    int _3138 = as_type<int>(_3082) + (-2);
    float _3140 = fma(_2916, _2916, _3092);
    float _3142 = float(uint(_3134));
    out.m_72.x = _3132;
    out.m_72.y = _3062;
    int _3144 = _3098 >> 2;
    float _3146 = fma(_2968, _2968, _3140);
    int _3148 = _3100 << 4;
    int _3150 = _3148 + 368;
    float _3152 = as_type<float>(_3138) * _3142;
    int _3154 = _3144 << 4;
    int _3156 = _3154 + 800;
    out.m_74.x = _3110;
    out.m_74.y = _3136;
    int _3158 = _3128 * int(_3120);
    int _3160 = _3158 + _3058;
    uint _3162 = uint(int(uint(_3150) >> uint(2)));
    uint _3164 = uint(int(uint(int(_3162)) >> uint(2)));
    int _3166 = int(_3162) & 3;
    float _3168 = (*spvDescriptorSet0.vp_c9)._m0[int(_3164)][_3166];
    int _3170 = int(_3162) + 1;
    uint _3172 = uint(int(uint(_3170) >> uint(2)));
    int _3174 = _3170 & 3;
    float _3176 = (*spvDescriptorSet0.vp_c9)._m0[int(_3172)][_3174];
    int _3178 = _985 * _3106;
    int _3180 = _3178 + _1662;
    float _3182 = trunc(_3152);
    float _3184 = precise::max(_3182, 0.0);
    uint _3186 = uint(_3184);
    int _3188 = abs(_1950);
    float _3190 = float(uint(_3160));
    int _3192 = abs(_2218);
    uint _3194 = uint(int(uint(_3156) >> uint(2)));
    uint _3196 = uint(int(uint(int(_3194)) >> uint(2)));
    int _3198 = int(_3194) & 3;
    float _3200 = (*spvDescriptorSet0.vp_c9)._m0[int(_3196)][_3198];
    int _3202 = int(_3194) + 1;
    uint _3204 = uint(int(uint(_3202) >> uint(2)));
    int _3206 = _3202 & 3;
    float _3208 = (*spvDescriptorSet0.vp_c9)._m0[int(_3204)][_3206];
    int _3210 = abs(_3096);
    float _3212 = as_type<float>(_3074) * _3190;
    int _3214 = ~_3042;
    int _3216 = _3214 + 1;
    float _3218 = rsqrt(_3146);
    float _3220 = float(_2904);
    float _3222 = float(_3210);
    int _3224 = ~_3188;
    int _3226 = _3224 + 1;
    int _3228 = _3226 + 1;
    int _3230 = _3216 * int(_3186);
    int _3232 = _3230 + _3134;
    float _3234 = trunc(_3212);
    float _3236 = precise::max(_3234, 0.0);
    uint _3238 = uint(_3236);
    float _3240 = _3222 * _3220;
    int _3242 = ~_3192;
    int _3244 = _3242 + 1;
    int _3246 = _3244 + 1;
    int _3248 = _3150 + 8;
    uint _3250 = uint(int(uint(_3248) >> uint(2)));
    uint _3252 = uint(int(uint(int(_3250)) >> uint(2)));
    int _3254 = int(_3250) & 3;
    float _3256 = (*spvDescriptorSet0.vp_c9)._m0[int(_3252)][_3254];
    int _3258 = int(_3250) + 1;
    uint _3260 = uint(int(uint(_3258) >> uint(2)));
    int _3262 = _3258 & 3;
    float _3264 = (*spvDescriptorSet0.vp_c9)._m0[int(_3260)][_3262];
    float _3266 = float(uint(_3232));
    bool _3268 = !_2184;
    int _3270 = _3268 ? 0 : 1;
    float _3272 = _2908 * _3218;
    bool _3274 = _1880 != 3;
    float _3276 = as_type<float>(_3138) * _3266;
    int _3278 = abs(_3270);
    int _3280 = _3156 + 8;
    uint _3282 = uint(int(uint(_3280) >> uint(2)));
    uint _3284 = uint(int(uint(int(_3282)) >> uint(2)));
    int _3286 = int(_3282) & 3;
    float _3288 = (*spvDescriptorSet0.vp_c9)._m0[int(_3284)][_3286];
    int _3290 = int(_3282) + 1;
    uint _3292 = uint(int(uint(_3290) >> uint(2)));
    int _3294 = _3290 & 3;
    float _3296 = (*spvDescriptorSet0.vp_c9)._m0[int(_3292)][_3294];
    int _3298 = ~_3042;
    int _3300 = _3298 + 1;
    float _3302 = _2916 * _3218;
    int _3304 = ~_3278;
    int _3306 = _3304 + 1;
    int _3308 = _3306 + 1;
    float _3310 = trunc(_3276);
    float _3312 = precise::max(_3310, 0.0);
    uint _3314 = uint(_3312);
    int _3316 = int(_3120) + int(_3238);
    float _3318 = -_3272;
    float _3320 = fma(_3318, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2908);
    int _3322 = ~_2960;
    int _3324 = _3322 + 1;
    float _3326 = -_3302;
    float _3328 = fma(_3326, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2916);
    bool _3330 = _895 == 0;
    float _3332 = _3320 * _3320;
    bool _3334 = !_1604;
    int _3336 = _3334 ? _3180 : (-1);
    int _3338 = _3324 * _3316;
    int _3340 = _3338 + _3058;
    bool _3342 = !_3330;
    int _3344 = _3342 ? _2640 : (-1);
    float _3346 = fma(_3328, _3328, _3332);
    int _3348 = _3228 * as_type<int>(_3176);
    int _3350 = abs(_2682);
    int _3352 = int(_3186) + int(_3314);
    int _3354 = ~_3350;
    int _3356 = _3354 + 1;
    int _3358 = _3356 + 1;
    int _3360 = _3246 * as_type<int>(_3208);
    bool _3362 = !_3274;
    int _3364 = _3362 ? 0 : (-1);
    int _3366 = _3300 * _3352;
    int _3368 = _3366 + _3134;
    bool _3370 = uint(_3340) >= uint(_2960);
    int _3372 = _3358 * as_type<int>(_3168);
    int _3374 = _3372 + _3348;
    int _3376 = abs(_2010);
    int _3378 = _3308 * as_type<int>(_3200);
    int _3380 = _3378 + _3360;
    bool _3382 = !_3370;
    int _3384 = _3382 ? 0 : (-1);
    bool _3386 = _2182 != 3;
    int _3388 = ~_3316;
    int _3390 = _3388 + _3384;
    int _3392 = _3390 + 1;
    bool _3394 = !_3386;
    int _3396 = _3394 ? 0 : (-1);
    bool _3398 = uint(_3368) >= uint(_3042);
    int _3400 = ~_3376;
    int _3402 = _3400 + 1;
    int _3404 = _3402 + 1;
    int _3406 = abs(_3364);
    int _3408 = _2960 * _3392;
    int _3410 = _3408 + _3058;
    bool _3412 = !_3398;
    int _3414 = _3412 ? 0 : (-1);
    int _3416 = _3404 * as_type<int>(_3256);
    int _3418 = _3416 + _3374;
    bool _3420 = _2960 == 0;
    int _3422 = abs(_2260);
    bool _3424 = !_3420;
    int _3426 = _3424 ? _3410 : (-1);
    bool _3428 = _2960 == 0;
    int _3430 = ~_3422;
    int _3432 = _3430 + 1;
    int _3434 = _3432 + 1;
    int _3436 = _3058 ^ _2960;
    float _3438 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].z;
    int _3440 = ~_3406;
    int _3442 = _3440 + 1;
    int _3444 = _3442 + 1;
    int _3446 = _3434 * as_type<int>(_3288);
    int _3448 = _3446 + _3380;
    int _3450 = abs(_3396);
    uint _3452 = uint(int(uint(_3436) >> uint(31)));
    int _3454 = _3444 * as_type<int>(_3264);
    int _3456 = _3454 + _3418;
    float _3458 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].w;
    int _3460 = ~_3414;
    int _3462 = _3352 + _3460;
    int _3464 = _3462 + 1;
    int _3466 = ~int(_3452);
    int _3468 = _3466 + 1;
    int _3470 = abs(_2066);
    int _3472 = ~_3450;
    int _3474 = _3472 + 1;
    int _3476 = _3474 + 1;
    float _3478 = _3438 * (*spvDescriptorSet0.vp_c9)._m0[90].x;
    int _3480 = _3464 ^ _3468;
    int _3482 = ~_3470;
    int _3484 = _3482 + 1;
    int _3486 = _3484 + 1;
    int _3488 = _3476 * as_type<int>(_3296);
    int _3490 = _3488 + _3448;
    int _3492 = abs(_2172);
    float _3494 = in.m_76.x;
    float _3496 = in.m_76.y;
    float _3498 = in.m_76.z;
    int _3500 = ~_3468;
    int _3502 = _3500 + _3480;
    int _3504 = _3502 + 1;
    int _3506 = _3456 * _3486;
    float _3508 = float(_3426);
    int _3510 = ~_3492;
    int _3512 = _3510 + 1;
    int _3514 = _3512 + 1;
    int _3516 = _3344 * _3470;
    int _3518 = _3516 + _3506;
    bool _3520 = !_3428;
    int _3522 = _3520 ? _3504 : (-1);
    float _3524 = fma(_3478, _3508, _2420);
    float _3526 = _1298 + 0.5;
    int _3528 = _3490 * _3514;
    float _3530 = float(_3522);
    float _3532 = _3458 * (*spvDescriptorSet0.vp_c9)._m0[90].y;
    float _3534 = fma(_3478, _3526, _3524);
    int _3536 = _3336 * _3492;
    int _3538 = _3536 + _3528;
    float _3540 = float(_3518);
    float _3542 = -_2424;
    float _3544 = fma(_3532, _3530, _3542);
    float _3546 = _1292 + (-0.5);
    float _3548 = -_2538;
    float _3550 = fma(_1298, _3548, _3534);
    float _3552 = _3240 * (-2.0);
    out.m_78.x = _3540;
    float _3554 = -_3532;
    float _3556 = fma(_3554, _3546, _3544);
    float _3558 = float(_3538);
    float _3560 = _2968 * _3218;
    float _3562 = fma(_2942, _3552, _2942);
    float _3564 = fma(_1292, _2554, _3556);
    float _3566 = fma(_3552, _3494, _3494);
    bool _3568 = !_2656;
    int _3570 = _3568 ? 0 : 1;
    out.m_78.w = _3558;
    float _3572 = -_3560;
    float _3574 = fma(_3572, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2968);
    bool _3576 = !_2660;
    int _3578 = _3576 ? 0 : 1;
    out.m_80.x = _3550;
    out.m_80.y = _3564;
    int _3580 = abs(_3570);
    float _3582 = _3498;
    if (_2992)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _3584 = -_3272;
    float _3586 = fma(_3584, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2888);
    float _3588 = -_3302;
    float _3590 = fma(_3588, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2864);
    float _3592 = float(_2502);
    float _3594 = fma(_2932, (*spvDescriptorSet0.vp_c9)._m0[196].x, _3566);
    float _3596 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _3598 = _3586 + _3596;
    float _3600 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _3602 = _3590 + _3600;
    float _3604 = float(_3580);
    float _3606 = fma(_3562, _2436, _3594);
    float _3608 = _3598 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _3610 = _2938 + (-1.0);
    float _3612 = _3604 * _3592;
    float _3614 = fma(_3602, (*spvDescriptorSet0.vp_c8)._m0[28].x, _3608);
    float _3616 = -_3560;
    float _3618 = fma(_3616, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2950);
    int _3620 = abs(_3578);
    float _3622 = _3612 * (-2.0);
    float _3624 = fma(_3610, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _3626 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _3628 = _3618 + _3626;
    float _3630 = float(_2614);
    float _3632 = fma(_3574, _3574, _3346);
    float _3634 = float(_3620);
    float _3636 = fma(_3628, (*spvDescriptorSet0.vp_c8)._m0[28].z, _3614);
    float _3638 = fma(_3622, _3496, _3496);
    float _3640 = fma(_3624, _3622, _3624);
    float _3642 = _3606 * 0.15915493667125701904296875;
    float _3644 = _3634 * _3630;
    bool _3646 = _3636 >= 0.0;
    float _3648 = fma(_2940, (*spvDescriptorSet0.vp_c9)._m0[196].y, _3638);
    float _3650 = _3644 * (-2.0);
    float _3652 = _2926 + (-1.0);
    float _3654 = fma(_3640, _2436, _3648);
    float _3656 = _1134 + (-0.5);
    float _3658 = fma(_3650, _3498, _3498);
    float _3660 = sqrt(_3632);
    float _3662 = _3654 * 0.15915493667125701904296875;
    float _3664 = fma(_3652, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _3666 = fma(_3656, (*spvDescriptorSet0.vp_c9)._m0[196].z, _3658);
    if (_3646)
    {
        _3582 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _3668 = _3582;
    float _3670 = fma(_3664, _3650, _3664);
    float _3672 = _3642 * 6.283185482025146484375;
    float _3674 = sin(_3672);
    int _3676 = as_type<int>(_3668);
    if (_3646)
    {
        out.m_55.x = 0.0;
    }
    if (_3646)
    {
        float _3678 = _3668 * 5.0;
        _3676 = as_type<int>(_3678);
    }
    int _3680 = _3676;
    float _3682 = fma(_3670, _2436, _3666);
    if (_3646)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _10360 = as_type<float>(_3680);
        out.gl_Position.z = _10360;
    }
    float _3684 = _3642 * 6.283185482025146484375;
    float _3686 = cos(_3684);
    float _3688 = _3682 * 0.15915493667125701904296875;
    float _3690 = _3662 * 6.283185482025146484375;
    float _3692 = sin(_3690);
    float _3694 = _3662 * 6.283185482025146484375;
    float _3696 = cos(_3694);
    if (_3646)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _3698 = _3688 * 6.283185482025146484375;
    float _3700 = cos(_3698);
    float _3702 = _3218 * _3660;
    float _3704 = _639 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _3706 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _211);
    float _3708 = _3686 * _3696;
    float _3710 = _3686 * _3692;
    float _3712 = _3702 * _3704;
    float _3714 = _3674 * _3696;
    float _3716 = _3688 * 6.283185482025146484375;
    float _3718 = sin(_3716);
    float _3720 = _211 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _3722 = _3706 * _3712;
    float _3724 = _641 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _3726 = _3674 * _3692;
    float _3728 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _201);
    float _3730 = _3702 * _3724;
    float _3732 = _3686 * _3700;
    float _3734 = _3696 * _3700;
    float _3736 = _3674 * _3700;
    float _3738 = _3728 * _3730;
    float _3740 = _3732 * _3722;
    float _3742 = _3692 * _3700;
    float _3744 = _3702 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _3746 = _3744 * 0.5;
    float _3748 = fma(_3718, _3708, _3726);
    float _3750 = -_3714;
    float _3752 = fma(_3718, _3710, _3750);
    float _3754 = -_3722;
    float _3756 = _3718 * _3754;
    float _3758 = -_3710;
    float _3760 = fma(_3718, _3714, _3758);
    float _3762 = fma(_3748, _3738, _3740);
    float _3764 = _3736 * _3722;
    float _3766 = fma(_3734, _3738, _3756);
    float _3768 = fma(_3718, _3726, _3708);
    float _3770 = fma(_3752, _3746, _3762);
    float _3772 = fma(_3760, _3738, _3764);
    float _3774 = fma(_3742, _3746, _3766);
    float _3776 = _3748 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _3778 = _3770 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _3780 = _3770 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _3782 = fma(_3768, _3746, _3772);
    float _3784 = _3770 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _3786 = fma(_3774, (*spvDescriptorSet0.vp_c8)._m0[24].x, _3778);
    float _3788 = fma(_3774, (*spvDescriptorSet0.vp_c8)._m0[26].x, _3780);
    float _3790 = fma(_3734, (*spvDescriptorSet0.vp_c8)._m0[26].x, _3776);
    float _3792 = fma(_3774, (*spvDescriptorSet0.vp_c8)._m0[25].x, _3784);
    float _3794 = fma(_3782, (*spvDescriptorSet0.vp_c8)._m0[24].z, _3786);
    float _3796 = fma(_3782, (*spvDescriptorSet0.vp_c8)._m0[26].z, _3788);
    float _3798 = _3752 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _3800 = fma(_3782, (*spvDescriptorSet0.vp_c8)._m0[25].z, _3792);
    float _3802 = _3794 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _3804 = _3796 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _3806 = _3748 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _3808 = _3800 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _3810 = _2864 + _3802;
    float _3812 = _2950 + _3804;
    float _3814 = fma(_3734, (*spvDescriptorSet0.vp_c8)._m0[25].x, _3806);
    float _3816 = _3732 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _3818 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _3820 = _3810 + _3818;
    float _3822 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _3824 = _3812 + _3822;
    float _3826 = _3732 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _3828 = _3748 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _3830 = _3820 * _3820;
    float _3832 = _3824 * _3824;
    float _3834 = _3732 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _3836 = -_3718;
    float _3838 = fma(_3836, (*spvDescriptorSet0.vp_c8)._m0[24].x, _3816);
    float _3840 = -_3718;
    float _3842 = fma(_3840, (*spvDescriptorSet0.vp_c8)._m0[25].x, _3826);
    float _3844 = _3830 + _3832;
    float _3846 = fma(_3734, (*spvDescriptorSet0.vp_c8)._m0[24].x, _3828);
    float _3848 = -_3718;
    float _3850 = fma(_3848, (*spvDescriptorSet0.vp_c8)._m0[26].x, _3834);
    float _3852 = fma(_3720, _3720, 1.0);
    float _3854 = sqrt(_3844);
    float _3856 = _3752 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _3858 = _3752 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _3860 = _2888 + _3808;
    float _3862 = fma(_3742, (*spvDescriptorSet0.vp_c8)._m0[26].x, _3798);
    float _3864 = fma(_3742, (*spvDescriptorSet0.vp_c8)._m0[24].x, _3856);
    float _3866 = fma(_3742, (*spvDescriptorSet0.vp_c8)._m0[25].x, _3858);
    float _3868 = rsqrt(_3852);
    bool _3870 = _3854 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _3872 = _3742;
    float _3874 = _3856;
    float _3876 = _3826;
    float _3878 = _3852;
    float _3880 = _3858;
    if (!_3870)
    {
        _3872 = _3832;
    }
    float _3882 = _3872;
    float _3884 = _3882;
    if (!_3870)
    {
        _3874 = _3830;
    }
    float _3886 = _3874;
    float _3888 = _3886;
    if (!_3870)
    {
        _3876 = _3810;
    }
    float _3890 = _3876;
    float _3892 = _3890;
    if (!_3870)
    {
        _3878 = _3812;
    }
    float _3894 = _3878;
    float _3896 = _3894;
    if (!_3870)
    {
        _3880 = _3860;
    }
    float _3898 = _3880;
    bool _3900 = !_3870;
    float _3902 = _3898;
    if (!_3900)
    {
        float _3904 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _3906 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _3908 = _3854 + _3906;
        float _3910 = rsqrt(_3844);
        float _3912 = _3908 * _3904;
        float _3914 = _3860 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _3916 = _3912 * 0.15915493667125701904296875;
        float _3918 = _3916 * 6.283185482025146484375;
        float _3920 = sin(_3918);
        float _3922 = _3916 * 6.283185482025146484375;
        float _3924 = cos(_3922);
        float _3926 = fma(_3920, _3914, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _3928 = _3910 * _3926;
        float _3930 = _3924 + (-1.0);
        float _3932 = fma(_3820, _3928, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _3934 = fma(_3824, _3928, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _3936 = _3930 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _3938 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _3940 = _3932 + _3938;
        float _3942 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _3944 = _3934 + _3942;
        float _3946 = fma(_3860, _3924, _3936);
        float _3948 = _3940 * _3940;
        float _3950 = _3944 * _3944;
        _3902 = _3946;
        _3888 = _3948;
        _3884 = _3950;
        _3892 = _3932;
        _3896 = _3934;
    }
    float _3952 = _3902;
    float _3954 = _3888;
    float _3956 = _3884;
    float _3958 = _3892;
    float _3960 = _3896;
    float _3962 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _3964 = _3952 + _3962;
    float _3966 = fma(_3736, (*spvDescriptorSet0.vp_c8)._m0[24].z, _3838);
    float _3968 = fma(_3736, (*spvDescriptorSet0.vp_c8)._m0[25].z, _3842);
    float _3970 = fma(_3736, (*spvDescriptorSet0.vp_c8)._m0[26].z, _3850);
    float _3972 = fma(_3964, _3964, _3954);
    float _3974 = fma(_3768, (*spvDescriptorSet0.vp_c8)._m0[24].z, _3864);
    float _3976 = fma(_3768, (*spvDescriptorSet0.vp_c8)._m0[25].z, _3866);
    float _3978 = fma(_3768, (*spvDescriptorSet0.vp_c8)._m0[26].z, _3862);
    float _3980 = _3972 + _3956;
    float _3982 = _3720 * _3868;
    float _3984 = fma(_3760, (*spvDescriptorSet0.vp_c8)._m0[24].z, _3846);
    float _3986 = _201 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _3988 = _3720 * _3966;
    float _3990 = fma(_3760, (*spvDescriptorSet0.vp_c8)._m0[25].z, _3814);
    float _3992 = _3720 * _3968;
    float _3994 = fma(_3760, (*spvDescriptorSet0.vp_c8)._m0[26].z, _3790);
    float _3996 = _3720 * _3970;
    float _3998 = -_3974;
    float _4000 = _3982 * _3998;
    float _4002 = -_3976;
    float _4004 = _3982 * _4002;
    float _4006 = -_3978;
    float _4008 = _3982 * _4006;
    float _4010 = fma(_3986, _3984, _3988);
    float _4012 = sqrt(_3980);
    float _4014 = fma(_3986, _3990, _3992);
    float _4016 = fma(_3986, _3994, _3996);
    float _4018 = fma(_3868, _3966, _4000);
    float _4020 = fma(_3868, _3968, _4004);
    float _4022 = _3976 + _4014;
    float _4024 = fma(_3868, _3970, _4008);
    float _4026 = _3974 + _4010;
    float _4028 = _3978 + _4016;
    out.m_82.x = _3984;
    out.m_82.y = _3990;
    out.m_82.z = _3994;
    out.m_84.x = _4018;
    out.m_84.y = _4020;
    out.m_84.z = _4024;
    bool _4030 = _4012 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _4032 = isnan(_4012);
    bool _4034 = _4030 || _4032;
    bool _4036 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _4038 = _4034 || _4036;
    out.m_86.x = _4026;
    out.m_86.y = _4022;
    out.m_86.z = _4028;
    float _4040 = _3980;
    float _4042 = _3986;
    if (!_4038)
    {
        _4040 = 1.0;
    }
    float _4044 = _4040;
    bool _4046 = !_4038;
    float _4048 = _4044;
    if (!_4046)
    {
        bool _4050 = _4012 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _4052 = isnan(_4012);
        bool _4054 = _4050 || _4052;
        bool _4056 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _4058 = _4054 || _4056;
        if (!_4058)
        {
            float _4060 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _4062 = _4012 + _4060;
            float _4064 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _4066 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _4064;
            float _4068 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _4070 = _4068 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _4072 = 1.0 / _4066;
            float _4074 = _4062 * _4072;
            float _4076 = fma(_4074, _4070, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _4048 = _4076;
            _4042 = _4066;
            _4078 = true;
        }
        else
        {
            bool _4080 = _4012 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _4082 = isnan(_4012);
            bool _4084 = _4080 || _4082;
            bool _4086 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _4088 = _4084 || _4086;
            if (!_4088)
            {
                float _4090 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _4092 = _4012 + _4090;
                float _4094 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _4096 = _4094 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _4098 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _4100 = _4098 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _4102 = 1.0 / _4096;
                float _4104 = _4092 * _4102;
                float _4106 = fma(_4104, _4100, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _4048 = _4106;
                _4042 = _4096;
                _4078 = true;
            }
            else
            {
                _4048 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _4078 = false;
    float _4108 = _4048;
    float _4110 = _4042;
    float _4112 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _4114 = _3952 + _4112;
    float _4116 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _4118 = _3958 + _4116;
    float _4120 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _4122 = _3960 + _4120;
    float _4124 = fma(_4114, _4108, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _4126 = fma(_4118, _4108, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _4128 = fma(_4122, _4108, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _4130 = -_2888;
    float _4132 = _4130 + _4124;
    float _4134 = -_2864;
    float _4136 = _4134 + _4126;
    float _4138 = -_2950;
    float _4140 = _4138 + _4128;
    float _4142 = _4132 * _4132;
    float _4144 = fma(_4136, _4136, _4142);
    float _4146 = fma(_4140, _4140, _4144);
    float _4148 = sqrt(_4146);
    bool _4150 = _4148 > 0.0;
    float _4152 = _4122;
    float _4154 = _4110;
    float _4156 = _4148;
    float _4158 = _4118;
    float _4160 = _4140;
    if (!_4150)
    {
        _4152 = _4126;
    }
    float _4162 = _4152;
    float _4164 = _4162;
    if (!_4150)
    {
        _4154 = _4124;
    }
    float _4166 = _4154;
    float _4168 = _4166;
    float _4170 = _4166;
    if (!_4150)
    {
        _4156 = _4128;
    }
    float _4172 = _4156;
    bool _4174 = !_4150;
    float _4176 = _4172;
    if (!_4174)
    {
        float _4178 = _215 * _215;
        float _4180 = fma(_213, _213, _4178);
        float _4182 = fma(_217, _217, _4180);
        float _4184 = rsqrt(_4146);
        float _4186 = sqrt(_4182);
        float _4188 = _4136 * _4184;
        float _4190 = _4132 * _4184;
        float _4192 = _4140 * _4184;
        bool _4194 = _4186 > 0.0;
        float _4196 = _4186;
        float _4198 = _4184;
        _4158 = _4182;
        _4160 = _4192;
        if (!_4194)
        {
            _4196 = _4126;
        }
        float _4200 = _4196;
        _4164 = _4200;
        if (!_4194)
        {
            _4168 = _4124;
        }
        float _4202 = _4168;
        _4170 = _4202;
        if (!_4194)
        {
            _4198 = _4128;
        }
        float _4204 = _4198;
        bool _4206 = !_4194;
        _4176 = _4204;
        if (!_4206)
        {
            float _4208 = rsqrt(_4182);
            float _4210 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].z;
            float _4212 = _215 * _4208;
            float _4214 = _213 * _4208;
            float _4216 = _4190 * _4212;
            float _4218 = _217 * _4208;
            float _4220 = fma(_4188, _4214, _4216);
            float _4222 = _4210 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _4224 = fma(_4192, _4218, _4220);
            float _4226 = _4224 * _4222;
            float _4228 = fma(_213, _4226, _4126);
            float _4230 = fma(_215, _4226, _4124);
            float _4232 = fma(_217, _4226, _4128);
            _4170 = _4230;
            _4164 = _4228;
            _4176 = _4232;
            _4158 = _4208;
        }
    }
    float _4234 = _4170;
    float _4236 = _4164;
    float _4238 = _4176;
    float _4240 = _4158;
    float _4242 = _4160;
    float _4244 = -_3272;
    float _4246 = fma(_4244, (*spvDescriptorSet0.vp_c9)._m0[18].w, _4234);
    float _4248 = -_3302;
    float _4250 = fma(_4248, (*spvDescriptorSet0.vp_c9)._m0[18].w, _4236);
    float _4252 = -_3560;
    float _4254 = fma(_4252, (*spvDescriptorSet0.vp_c9)._m0[18].w, _4238);
    float _4256 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _4258 = _4246 + _4256;
    float _4260 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _4262 = _4250 + _4260;
    float _4264 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _4266 = _4254 + _4264;
    float _4268 = _4258 * _4258;
    float _4270 = fma(_4262, _4262, _4268);
    float _4272 = fma(_4266, _4266, _4270);
    float _4274 = rsqrt(_4272);
    float _4276 = sqrt(_4272);
    float _4278 = _4274 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _4280 = _4262 * _4278;
    float _4282 = _4266 * _4278;
    float _4284 = _4280 * _4280;
    float _4286 = _4282 * _4282;
    float _4288 = _4284 + _4286;
    float _4290 = sqrt(_4288);
    bool _4292 = _4290 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _4294 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _4296 = _4290 + _4294;
    float _4298 = _4266;
    float _4300 = _4234;
    float _4302 = _4296;
    float _4304 = _4240;
    float _4306 = _4258;
    float _4308 = _4242;
    if (_4292)
    {
        float _4310 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _4298 = _4310;
    }
    float _4312 = _4298;
    if (_4292)
    {
        float _4314 = rsqrt(_4288);
        _4300 = _4314;
    }
    float _4316 = _4300;
    if (_4292)
    {
        float _4318 = _4296 * _4312;
        _4302 = _4318;
    }
    float _4320 = _4302;
    if (_4292)
    {
        float _4322 = _4320 * 0.15915493667125701904296875;
        _4304 = _4322;
    }
    float _4324 = _4304;
    float _4326 = _4270;
    if (_4292)
    {
        float _4328 = _4324 * 6.283185482025146484375;
        float _4330 = sin(_4328);
        _4326 = _4330;
    }
    float _4332 = _4326;
    float _4334 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _4336 = precise::max(0.0, _4334);
    float _4338 = _4274;
    float _4340 = _4336;
    float _4342 = _4334;
    if (_4292)
    {
        float _4344 = _4324 * 6.283185482025146484375;
        float _4346 = cos(_4344);
        _4338 = _4346;
    }
    float _4348 = _4338;
    float _4350 = -_4278;
    float _4352 = -_4336;
    float _4354 = fma(_4258, _4350, _4352);
    if (!_4292)
    {
        _4306 = _4280;
    }
    float _4356 = _4306;
    float _4358 = _4356;
    if (_4292)
    {
        float _4360 = _4354 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _4340 = _4360;
    }
    float _4362 = _4340;
    float _4364 = _4332;
    float _4366 = _4362;
    if (_4292)
    {
        float _4368 = fma(_4332, _4362, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _4364 = _4368;
    }
    float _4370 = _4364;
    float _4372 = _4370;
    if (!_4292)
    {
        _4366 = _4354;
    }
    float _4374 = _4366;
    float _4376 = _4374;
    float _4378 = _4348;
    if (_4292)
    {
        float _4380 = _4348 + (-1.0);
        _4342 = _4380;
    }
    float _4382 = _4342;
    float _4384 = _4382;
    if (_4292)
    {
        float _4386 = _4316 * _4370;
        _4308 = _4386;
    }
    float _4388 = _4308;
    if (!_4292)
    {
        _4372 = _4284;
    }
    float _4390 = _4372;
    float _4392 = _4390;
    if (_4292)
    {
        float _4394 = _4382 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _4384 = _4394;
    }
    float _4396 = _4384;
    float _4398 = _4396;
    if (_4292)
    {
        float _4400 = _4280 * _4388;
        _4358 = _4400;
    }
    float _4402 = _4358;
    if (_4292)
    {
        float _4404 = fma(_4354, _4348, _4396);
        _4376 = _4404;
    }
    float _4406 = _4376;
    if (!_4292)
    {
        _4398 = _4282;
    }
    float _4408 = _4398;
    float _4410 = _4408;
    if (_4292)
    {
        float _4412 = _4282 * _4388;
        _4410 = _4412;
    }
    float _4414 = _4410;
    if (_4292)
    {
        float _4416 = _4402 * _4402;
        _4392 = _4416;
    }
    float _4418 = _4392;
    if (!_4292)
    {
        _4378 = _4286;
    }
    float _4420 = _4378;
    float _4422 = _4246 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _4424 = _4420;
    if (_4292)
    {
        float _4426 = _4414 * _4414;
        _4424 = _4426;
    }
    float _4428 = _4424;
    float _4430 = fma(_4406, _4406, _4418);
    float _4432 = _4246 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _4434 = fma(_3590, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _4436 = _4430 + _4428;
    float _4438 = fma(_4250, (*spvDescriptorSet0.vp_c8)._m0[2].x, _4432);
    float _4440 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _4442 = fma(_4276, (*spvDescriptorSet0.vp_c15)._m0[23].w, _4440);
    float _4444 = precise::clamp(_4442, 0.0, 1.0);
    float _4446 = fma(_4254, (*spvDescriptorSet0.vp_c8)._m0[2].z, _4438);
    float _4448 = rsqrt(_4436);
    float _4450 = -_4444;
    float _4452 = _4450 + 1.0;
    float _4454 = _4446 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _4456 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _4458 = fma(_3618, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _4460 = _4246 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _4462 = _4454 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _4464 = abs(_4452);
    float _4466 = log2(_4464);
    float _4468 = fma(_4250, (*spvDescriptorSet0.vp_c8)._m0[1].x, _4460);
    float _4470 = -_4462;
    float _4472 = fma(_4470, _4456, 1.0);
    float _4474 = _4246 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _4476 = fma(_4254, (*spvDescriptorSet0.vp_c8)._m0[1].z, _4468);
    float _4478 = _4448 * _4402;
    float _4480 = _4448 * _4406;
    float _4482 = fma(_4250, (*spvDescriptorSet0.vp_c8)._m0[0].x, _4474);
    float _4484 = _4448 * _4414;
    float _4486 = fma(_4250, (*spvDescriptorSet0.vp_c8)._m0[3].x, _4422);
    float _4488 = _4478 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _4490 = fma(_4254, (*spvDescriptorSet0.vp_c8)._m0[0].z, _4482);
    float _4492 = _4476 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _4494 = floor(_4434);
    float _4496 = -_4488;
    float _4498 = fma(_4480, (*spvDescriptorSet0.vp_c15)._m0[21].y, _4496);
    float _4500 = _4490 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _4502 = _4492 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _4504 = fma(_4254, (*spvDescriptorSet0.vp_c8)._m0[3].z, _4486);
    float _4506 = -_4484;
    float _4508 = fma(_4506, (*spvDescriptorSet0.vp_c15)._m0[21].z, _4498);
    float _4510 = _4466 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _4512 = fma(_4500, (*spvDescriptorSet0.vp_c8)._m0[7].x, _4502);
    float _4514 = _4504 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _4516 = floor(_4458);
    float _4518 = fma(_4508, -0.5, 0.5);
    float _4520 = fma(_4454, (*spvDescriptorSet0.vp_c8)._m0[7].z, _4512);
    float _4522 = fma(_4508, 0.5, 0.5);
    float _4524 = _4480 + 1.0;
    float _4526 = fma(_4514, (*spvDescriptorSet0.vp_c8)._m0[7].w, _4520);
    float _4528 = _4492 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _4530 = log2(_4472);
    float _4532 = -_4494;
    float _4534 = _4434 + _4532;
    float _4536 = fma(_4500, (*spvDescriptorSet0.vp_c8)._m0[4].x, _4528);
    float _4538 = fma(_4454, (*spvDescriptorSet0.vp_c8)._m0[4].z, _4536);
    float _4540 = 1.0 / _4526;
    float _4542 = _4492 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _4544 = fma(_4522, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _4546 = -_4516;
    float _4548 = _4458 + _4546;
    float _4550 = fma(_4500, (*spvDescriptorSet0.vp_c8)._m0[5].x, _4542);
    float _4552 = fma(_4522, _4544, -0.212114393711090087890625);
    float _4554 = sqrt(_4518);
    float _4556 = fma(_4454, (*spvDescriptorSet0.vp_c8)._m0[5].z, _4550);
    float _4558 = _4530 * 0.693147182464599609375;
    float _4560 = exp2(_4510);
    float _4562 = fma(_4514, (*spvDescriptorSet0.vp_c8)._m0[4].w, _4538);
    float _4564 = fma(_4514, (*spvDescriptorSet0.vp_c8)._m0[5].w, _4556);
    float2 _11850 = float2(_4534, _4548);
    float _4566 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_11850, float2(0.0), isnan(_11850)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_11850, float2(0.0), isnan(_11850)), level(0.0)).x;
    float _4568 = fma(_4522, _4552, 1.570728778839111328125);
    float _4570 = _4562 * _4540;
    float _4572 = _4564 * _4540;
    float _4574 = _4558 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _4576 = _4554 * 0.636619746685028076171875;
    float _4578 = fma(_4570, 0.5, 0.5);
    float _4580 = fma(_4572, -0.5, 0.5);
    float _4582 = -_4568;
    float _4584 = fma(_4576, _4582, 1.0);
    float _4586 = -_4480;
    float _4588 = fma(_4560, _4524, _4586);
    float3 _11893 = float3(_4578, _4580, _4574);
    float _4590 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_11893, float3(0.0), isnan(_11893)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_11893, float3(0.0), isnan(_11893)), level(0.0)).x;
    float3 _11904 = float3(_4578, _4580, _4574);
    float4 _4593 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_11904, float3(0.0), isnan(_11904)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_11904, float3(0.0), isnan(_11904)), level(0.0)).xyzw;
    float _4595 = _4593.x;
    float _4597 = _4593.y;
    float _4599 = _4593.z;
    float _4601 = _4593.w;
    float _4603 = fma(_4588, 0.5, 0.5);
    float2 _11922 = float2(_4584, _4603);
    float3 _4607 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_11922, float2(0.0), isnan(_11922)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_11922, float2(0.0), isnan(_11922)), level(0.0)).xyz;
    float _4609 = _4607.x;
    float _4611 = _4607.y;
    float _4613 = _4607.z;
    float _4615 = _3586 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _4617 = _3586 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _4619 = _4466 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _4621 = _4492 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _4623 = fma(_3590, (*spvDescriptorSet0.vp_c8)._m0[11].x, _4615);
    float _4625 = fma(_3590, (*spvDescriptorSet0.vp_c8)._m0[10].x, _4617);
    float _4627 = in.m_88.x;
    float _4629 = fma(_3618, (*spvDescriptorSet0.vp_c8)._m0[11].z, _4623);
    float _4631 = fma(_3618, (*spvDescriptorSet0.vp_c8)._m0[10].z, _4625);
    float _4633 = exp2(_4619);
    float _4635 = _4629 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _4637 = _4631 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _4639 = fma(_4500, (*spvDescriptorSet0.vp_c8)._m0[6].x, _4621);
    bool _4641 = _4276 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _4643 = isnan(_4276);
    bool _4645 = _4641 || _4643;
    bool _4647 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _4649 = _4645 || _4647;
    float _4651 = _4637 + _4635;
    float _4653 = 1.0 / _4635;
    float _4655 = fma(_4454, (*spvDescriptorSet0.vp_c8)._m0[6].z, _4639);
    float _4657 = fma(_4514, (*spvDescriptorSet0.vp_c8)._m0[6].w, _4655);
    float _4659 = -_4633;
    float _4661 = _4659 + 1.0;
    float _4663 = _4657 + _4526;
    out.gl_Position.x = _4562;
    out.gl_Position.y = _4564;
    out.gl_Position.z = _4657;
    out.gl_Position.w = _4526;
    float _4665 = _4661 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _4667 = _4663 * 0.5;
    float _4669 = _4651 * _4653;
    float _4671 = _4669 * 0.5;
    float _4673 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _4675 = fma(_4671, (*spvDescriptorSet0.vp_c8)._m0[30].w, _4673);
    float _4677 = 1.0 / _4675;
    float _4679 = -_4665;
    float _4681 = _4679 + 1.0;
    float _4683 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _4685 = _4677 * _4683;
    float _4687 = abs(_4685);
    float _4689 = log2(_4687);
    float _4691 = _4689 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _4693 = exp2(_4691);
    float _4695 = fma(_4693, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _4697 = precise::clamp(_4695, 0.0, 1.0);
    bool _4699 = _4685 <= 8000.0;
    bool _4701 = isnan(_4685);
    bool _4703 = _4699 || _4701;
    bool _4705 = isnan(8000.0);
    bool _4707 = _4703 || _4705;
    float _4709 = float(_4707);
    float _4711 = _4562 + _4526;
    float _4713 = fma(_4697, -2.0, 3.0);
    float _4715 = _4697 * _4697;
    float _4717 = _4711 * 0.5;
    float _4719 = _4715 * _4713;
    float _4721 = -_4719;
    float _4723 = _4721 + 1.0;
    float _4725 = fma(_4723, (*spvDescriptorSet0.vp_c15)._m0[654].w, _4719);
    float _4727 = _4526 * 0.5;
    float _4729 = _4709 * _4725;
    float _4731 = fma(_4564, -0.5, _4727);
    float _4733 = _4729 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _4735 = _4729;
    if (!_4649)
    {
        _4735 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _4737 = _4735;
    out.m_90.x = _4717;
    out.m_90.y = _4731;
    out.m_90.z = _4667;
    out.m_90.w = _4526;
    float _4739 = -_4566;
    float _4741 = _4739 + 1.0;
    float _4743 = _4741 * _4733;
    float _4745 = precise::clamp(_4743, 0.0, 1.0);
    float _4747 = -_4745;
    float _4749 = fma(_4747, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _4751 = _4749 * _4627;
    float _4753 = _4665 * _4590;
    float _4755 = _4751 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _4757 = _4601 * _4681;
    float _4759 = _4751;
    float _4761 = _4597;
    float _4763 = _4599;
    float _4765 = _4595;
    float _4767 = _4737;
    float _4769 = _4737;
    if (!_4649)
    {
        _4759 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _4771 = _4759;
    float _4773 = _4601 * _4753;
    out.m_92.x = _4755;
    float _4775 = _4613 * _4753;
    float _4777 = fma(_4609, _4773, _4595);
    float _4779 = fma(_4611, _4773, _4597);
    float _4781 = _4773;
    float _4783 = _4771;
    float _4785 = _4771;
    if (!_4649)
    {
        _4761 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _4787 = _4761;
    float _4789 = fma(_4601, _4775, _4599);
    float _4791 = _4787;
    float _4793 = _4787;
    if (!_4649)
    {
        _4763 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _4795 = _4763;
    float _4797 = _4795;
    float _4799 = _4795;
    if (!_4649)
    {
        _4765 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _4801 = _4765;
    out.m_94.x = _4777;
    out.m_94.y = _4779;
    out.m_94.z = _4789;
    out.m_94.w = _4757;
    float _4803 = _4801;
    float _4805 = _4801;
    if (!_4649)
    {
        _4781 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _4807 = _4781;
    bool _4809 = !_4649;
    float _4811 = _4807;
    float _4813 = _4807;
    if (!_4809)
    {
        bool _4815 = _4276 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _4817 = isnan(_4276);
        bool _4819 = _4815 || _4817;
        bool _4821 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _4823 = _4819 || _4821;
        if (!_4823)
        {
            float _4825 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _4827 = _4276 + _4825;
            float _4829 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _4831 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _4829;
            float _4833 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _4835 = _4833 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _4837 = 1.0 / _4831;
            float _4839 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _4841 = _4839 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _4843 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _4845 = _4843 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _4847 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _4849 = _4847 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _4851 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _4853 = _4851 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _4855 = _4827 * _4837;
            float _4857 = precise::clamp(_4855, 0.0, 1.0);
            float _4859 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _4861 = _4859 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _4863 = fma(_4857, _4835, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _4865 = fma(_4857, _4861, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _4867 = fma(_4857, _4841, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _4869 = fma(_4857, _4845, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _4871 = fma(_4857, _4849, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _4873 = fma(_4857, _4853, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _4793 = _4867;
            _4785 = _4871;
            _4799 = _4863;
            _4769 = _4869;
            _4805 = _4865;
            _4813 = _4873;
            _4875 = true;
        }
        else
        {
            bool _4877 = _4276 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _4879 = isnan(_4276);
            bool _4881 = _4877 || _4879;
            bool _4883 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _4885 = _4881 || _4883;
            if (!_4885)
            {
                _4797 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _4887 = _4797;
            _4799 = _4887;
            if (!_4885)
            {
                _4791 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _4889 = _4791;
            _4793 = _4889;
            if (!_4885)
            {
                _4803 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _4891 = _4803;
            _4805 = _4891;
            if (!_4885)
            {
                _4767 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _4893 = _4767;
            _4769 = _4893;
            if (!_4885)
            {
                _4783 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _4895 = _4783;
            _4785 = _4895;
            if (!_4885)
            {
                _4811 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _4897 = _4811;
            bool _4899 = !_4885;
            _4813 = _4897;
            if (!_4899)
            {
                bool _4901 = _4276 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _4903 = isnan(_4276);
                bool _4905 = _4901 || _4903;
                bool _4907 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _4909 = _4905 || _4907;
                if (!_4909)
                {
                    float _4911 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _4913 = _4276 + _4911;
                    float _4915 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _4917 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _4915;
                    float _4919 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _4921 = _4919 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _4923 = 1.0 / _4917;
                    float _4925 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _4927 = _4925 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _4929 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _4931 = _4929 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _4933 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _4935 = _4933 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _4937 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _4939 = _4937 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _4941 = _4913 * _4923;
                    float _4943 = precise::clamp(_4941, 0.0, 1.0);
                    float _4945 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _4947 = _4945 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _4949 = fma(_4943, _4921, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _4951 = fma(_4943, _4947, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _4953 = fma(_4943, _4927, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _4955 = fma(_4943, _4931, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _4957 = fma(_4943, _4935, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _4959 = fma(_4943, _4939, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _4793 = _4953;
                    _4785 = _4957;
                    _4799 = _4949;
                    _4769 = _4955;
                    _4805 = _4951;
                    _4813 = _4959;
                    _4875 = true;
                }
                else
                {
                    _4793 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _4785 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _4799 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _4769 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _4805 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _4813 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _4875 = false;
    float _4961 = _4793;
    float _4963 = _4785;
    float _4965 = _4799;
    float _4967 = _4769;
    float _4969 = _4805;
    float _4971 = _4813;
    float _4973 = fma(_4022, -0.5, 0.5);
    float _4975 = precise::clamp(_4973, 0.0, 1.0);
    float _4977 = -_4961;
    float _4979 = _4977 + _4963;
    float _4981 = -_4965;
    float _4983 = _4981 + _4967;
    float _4985 = -_4969;
    float _4987 = _4985 + _4971;
    bool _4989 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _4991 = fma(_4975, _4979, _4961);
    float _4993 = fma(_4975, _4983, _4965);
    float _4995 = fma(_4975, _4987, _4969);
    float _4997 = _4991 * 0.586610972881317138671875;
    out.m_96.x = 0.0;
    float _4999 = fma(_4993, 0.298911988735198974609375, _4997);
    float _5001 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _5003 = fma(_4995, 0.114477999508380889892578125, _4999);
    out.m_55.x = _5001;
    float _5005 = -_5003;
    float _5007 = _4993 + _5005;
    float _5009 = -_5003;
    float _5011 = _4991 + _5009;
    float _5013 = -_5003;
    float _5015 = _4995 + _5013;
    float _5017 = fma(_5007, (*spvDescriptorSet0.vp_c13)._m0[1].z, _5003);
    float _5019 = fma(_5011, (*spvDescriptorSet0.vp_c13)._m0[1].z, _5003);
    float _5021 = fma(_5015, (*spvDescriptorSet0.vp_c13)._m0[1].z, _5003);
    out.m_98.x = _5017;
    out.m_98.y = _5019;
    out.m_98.z = _5021;
    if (!_4989)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _5023 = -_4246;
    float _5025 = _5023 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
    float _5027 = -_4250;
    float _5029 = _5027 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
    float _5031 = -_4254;
    float _5033 = _5031 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
    float _5035 = _5025 * _5025;
    float _5037 = fma(_5029, _5029, _5035);
    float _5039 = fma(_5033, _5033, _5037);
    float _5041 = sqrt(_5039);
    float _5043 = rsqrt(_5039);
    float _5045 = -_5041;
    float _5047 = _5045 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _5049 = _5047 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
    float _5051 = precise::clamp(_5049, 0.0, 1.0);
    float _5053 = _5029 * _5043;
    float _5055 = _5025 * _5043;
    float _5057 = abs(_5051);
    float _5059 = log2(_5057);
    float _5061 = _5033 * _5043;
    float _5063 = _5053 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
    float _5065 = _4022 * _5055;
    float _5067 = -_5055;
    float _5069 = -_5063;
    float _5071 = fma(_5067, (*spvDescriptorSet0.vp_c15)._m0[656].y, _5069);
    float _5073 = fma(_4026, _5053, _5065);
    float _5075 = -_5061;
    float _5077 = fma(_5075, (*spvDescriptorSet0.vp_c15)._m0[656].z, _5071);
    float _5079 = fma(_4028, _5061, _5073);
    float _5081 = precise::clamp(_5079, 0.0, 1.0);
    float _5083 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
    float _5085 = _5077 + _5083;
    float _5087 = _5059 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
    float _5089 = _5085 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
    float _5091 = precise::clamp(_5089, 0.0, 1.0);
    float _5093 = exp2(_5087);
    float _5095 = _5093 * _5091;
    float _5097 = _5081 * _5095;
    float _5099 = _5097 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
    float _5101 = _5097 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
    float _5103 = _5097 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
    out.m_96.x = _5099;
    out.m_96.y = _5101;
    out.m_96.z = _5103;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_66 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_68 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_55 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_98 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_53 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_72 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_90 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_70 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_80 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_74 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_78 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_84 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_86 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_82 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_96 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_92 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_94 = float4(0.0, 0.0, 0.0, 1.0);
    bool _4875 = false;
    bool _4078 = false;
    bool _663 = false;
    bool _519 = false;
    bool _239 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _112 = in.m_48.w;
    float _114 = in.m_50.w;
    float _116 = trunc(_112);
    int _119 = int(_116);
    float _121 = -_114;
    float _123 = _121 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    out.m_53.y = _123;
    bool _127 = _119 >= 1;
    float _129 = 0.0;
    float _131 = as_type<float>(_119);
    float _133 = _123;
    if (!_127)
    {
        _129 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _135 = _129;
    if (!_127)
    {
        out.m_55.x = 0.0;
    }
    int _137 = 0;
    if (!_127)
    {
        float _139 = _135 * 5.0;
        _137 = as_type<int>(_139);
    }
    int _141 = _137;
    int _143 = _141;
    if (!_127)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _5172 = as_type<float>(_141);
        out.gl_Position.z = _5172;
    }
    if (!_127)
    {
        return out;
    }
    bool _145 = _114 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _147 = isnan(_114);
    bool _149 = _145 || _147;
    bool _151 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _153 = _149 || _151;
    float _155 = float(_119);
    bool _157 = _123 >= _155;
    bool _159 = !_153;
    bool _161 = _157 || _159;
    float _163 = 1.0 / _155;
    if (_161)
    {
        _131 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _165 = _131;
    if (_161)
    {
        out.m_55.x = 0.0;
    }
    float _167 = _123 * _163;
    float _169 = _167;
    if (_161)
    {
        float _171 = _165 * 5.0;
        _143 = as_type<int>(_171);
    }
    int _173 = _143;
    out.m_53.x = _167;
    if (_161)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _5235 = as_type<float>(_173);
        out.gl_Position.z = _5235;
    }
    if (_161)
    {
        return out;
    }
    float _175 = as_type<float>(int(gl_VertexIndex));
    float _177 = in.m_60.x;
    float _179 = in.m_60.y;
    float _181 = in.m_60.z;
    int _183 = as_type<int>(_175) & 1;
    bool _185 = _183 != 0;
    int _187 = as_type<int>(_175) & 2;
    bool _189 = _187 != 0;
    bool _191 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _193 = _179 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _195 = _179 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _197 = _179 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    bool _199 = !_185;
    float _201 = _199 ? (-0.5) : 0.5;
    float _203 = fma(_177, (*spvDescriptorSet0.vp_c10)._m0[4].x, _193);
    float _205 = fma(_177, (*spvDescriptorSet0.vp_c10)._m0[5].x, _195);
    float _207 = fma(_177, (*spvDescriptorSet0.vp_c10)._m0[6].x, _197);
    bool _209 = !_189;
    float _211 = _209 ? (-0.5) : 0.5;
    float _213 = fma(_181, (*spvDescriptorSet0.vp_c10)._m0[4].z, _203);
    float _215 = fma(_181, (*spvDescriptorSet0.vp_c10)._m0[5].z, _205);
    float _217 = fma(_181, (*spvDescriptorSet0.vp_c10)._m0[6].z, _207);
    bool _219 = !_191;
    float _237;
    if (!_219)
    {
        float _221 = in.m_62.x;
        float _223 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _225 = _221 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _227 = fma(_225, (*spvDescriptorSet0.vp_c9)._m0[12].x, _123);
        float _229 = _227 * _223;
        float _231 = floor(_229);
        float _233 = -_231;
        float _235 = _229 + _233;
        _237 = _235;
        _239 = true;
    }
    else
    {
        _237 = _167;
    }
    _239 = false;
    float _241 = _237;
    float _243 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _245 = _241 + _243;
    float _247 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _249 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _247;
    float _251 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _253 = _251 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _255 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _257 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _255;
    float _259 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _261 = _259 + (*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _263 = 1.0 / _249;
    float _265 = -(*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _267 = (*spvDescriptorSet0.vp_c9)._m0[148].w + _265;
    bool _269 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _271 = 1.0 / _253;
    float _273 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _275 = _241 + _273;
    float _277 = 1.0 / _257;
    float _279 = _275 * _263;
    float _281 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _283 = _241 + _281;
    float _285 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _287 = _241 + _285;
    bool _289 = _241 >= (*spvDescriptorSet0.vp_c9)._m0[148].w;
    bool _291 = isnan(_241);
    bool _293 = _289 || _291;
    bool _295 = isnan((*spvDescriptorSet0.vp_c9)._m0[148].w);
    bool _297 = _293 || _295;
    float _299 = float(_297);
    float _301 = 1.0 / _267;
    float _303 = _245 * _271;
    float _305 = -(*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _307 = _241 + _305;
    bool _309 = _241 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _311 = isnan(_241);
    bool _313 = _309 || _311;
    bool _315 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _317 = _313 || _315;
    float _319 = float(_317);
    float _321 = 1.0 / _261;
    float _323 = _283 * _277;
    bool _325 = _241 >= (*spvDescriptorSet0.vp_c9)._m0[147].w;
    bool _327 = isnan(_241);
    bool _329 = _325 || _327;
    bool _331 = isnan((*spvDescriptorSet0.vp_c9)._m0[147].w);
    bool _333 = _329 || _331;
    float _335 = float(_333);
    float _337 = _307 * _301;
    float _339 = -_335;
    float _341 = _339 + 1.0;
    bool _343 = _241 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _345 = isnan(_241);
    bool _347 = _343 || _345;
    bool _349 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _351 = _347 || _349;
    float _353 = float(_351);
    float _355 = -_319;
    float _357 = _355 + 1.0;
    float _359 = _319 * _341;
    bool _361 = _241 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _363 = isnan(_241);
    bool _365 = _361 || _363;
    bool _367 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _369 = _365 || _367;
    float _371 = float(_369);
    float _373 = _353 * _357;
    float _375 = _287 * _321;
    float _377 = -_299;
    float _379 = _377 + 1.0;
    float _381 = -_353;
    float _383 = _381 + 1.0;
    bool _385 = _241 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _387 = isnan(_241);
    bool _389 = _385 || _387;
    bool _391 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _393 = _389 || _391;
    float _395 = float(_393);
    float _397 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _399 = _397 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _401 = _335 * _379;
    float _403 = _371 * _383;
    float _405 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _407 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _405;
    float _409 = -_371;
    float _411 = _409 + 1.0;
    float _413 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _415 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _413;
    float _417 = -_395;
    float _419 = _417 + 1.0;
    float _421 = fma(_407, _279, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _423 = _395 * _411;
    float _425 = fma(_415, _279, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _427 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _429 = _427 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _431 = fma(_399, _303, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _433 = _421 * _423;
    float _435 = _425 * _423;
    float _437 = fma(_429, _303, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _439 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _441 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _439;
    float _443 = fma(_419, (*spvDescriptorSet0.vp_c9)._m0[143].x, _433);
    float _445 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _447 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _445;
    float _449 = fma(_419, (*spvDescriptorSet0.vp_c9)._m0[143].y, _435);
    float _451 = -(*spvDescriptorSet0.vp_c9)._m0[146].x;
    float _453 = _451 + (*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _455 = fma(_441, _323, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _457 = fma(_447, _323, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _459 = -(*spvDescriptorSet0.vp_c9)._m0[146].y;
    float _461 = _459 + (*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _463 = fma(_431, _403, _443);
    float _465 = fma(_437, _403, _449);
    float _467 = fma(_453, _375, (*spvDescriptorSet0.vp_c9)._m0[146].x);
    float _469 = fma(_461, _375, (*spvDescriptorSet0.vp_c9)._m0[146].y);
    float _471 = -(*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _473 = (*spvDescriptorSet0.vp_c9)._m0[148].x + _471;
    float _475 = -(*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _477 = (*spvDescriptorSet0.vp_c9)._m0[148].y + _475;
    float _479 = fma(_455, _373, _463);
    float _481 = fma(_457, _373, _465);
    float _483 = fma(_473, _337, (*spvDescriptorSet0.vp_c9)._m0[147].x);
    float _485 = fma(_477, _337, (*spvDescriptorSet0.vp_c9)._m0[147].y);
    float _487 = fma(_467, _359, _479);
    float _489 = fma(_469, _359, _481);
    float _491 = fma(_483, _401, _487);
    float _493 = fma(_485, _401, _489);
    float _495 = fma(_299, (*spvDescriptorSet0.vp_c9)._m0[148].x, _491);
    float _497 = fma(_299, (*spvDescriptorSet0.vp_c9)._m0[148].y, _493);
    bool _499 = !_269;
    float _517;
    if (!_499)
    {
        float _501 = in.m_62.x;
        float _503 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _505 = _501 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _507 = fma(_505, (*spvDescriptorSet0.vp_c9)._m0[11].y, _123);
        float _509 = _507 * _503;
        float _511 = floor(_509);
        float _513 = -_511;
        float _515 = _509 + _513;
        _517 = _515;
        _519 = true;
    }
    else
    {
        _517 = _167;
    }
    _519 = false;
    float _521 = _517;
    float _523 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _525 = _521 + _523;
    float _527 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _529 = _527 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _531 = _521 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _533 = isnan(_521);
    bool _535 = _531 || _533;
    bool _537 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _539 = _535 || _537;
    float _541 = float(_539);
    float _543 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _545 = _543 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _547 = _521 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _549 = isnan(_521);
    bool _551 = _547 || _549;
    bool _553 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _555 = _551 || _553;
    float _557 = float(_555);
    float _559 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _561 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _559;
    bool _563 = _521 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _565 = isnan(_521);
    bool _567 = _563 || _565;
    bool _569 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _571 = _567 || _569;
    float _573 = float(_571);
    float _575 = 1.0 / _529;
    float _577 = -_541;
    float _579 = _577 + 1.0;
    bool _581 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _583 = 1.0 / _545;
    float _585 = _561 * _575;
    float _587 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _589 = _587 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _591 = -_573;
    float _593 = _591 + 1.0;
    float _595 = fma(_585, _525, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _597 = _557 * _579;
    float _599 = -_557;
    float _601 = _599 + 1.0;
    float _603 = _541 * _593;
    float _605 = _589 * _583;
    float _607 = _595 * _597;
    float _609 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _611 = _521 + _609;
    float _613 = fma(_601, (*spvDescriptorSet0.vp_c9)._m0[115].x, _607);
    float _615 = fma(_605, _611, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _617 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _619 = fma(_615, _603, _613);
    float _621 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _623 = _617 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _625 = fma(_573, (*spvDescriptorSet0.vp_c9)._m0[117].x, _619);
    float _627 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _629 = _621 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _631 = in.m_64.x;
    float _633 = in.m_64.y;
    float _635 = _625 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _637 = _627 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    out.m_66.x = _623;
    out.m_66.y = _629;
    out.m_66.z = _637;
    out.m_66.w = _635;
    float _639 = _497 * _633;
    float _641 = _495 * _631;
    bool _643 = !_581;
    float _661;
    if (!_643)
    {
        float _645 = in.m_62.x;
        float _647 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _649 = _645 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _651 = fma(_649, (*spvDescriptorSet0.vp_c9)._m0[11].w, _123);
        float _653 = _651 * _647;
        float _655 = floor(_653);
        float _657 = -_655;
        float _659 = _653 + _657;
        _661 = _659;
        _663 = true;
    }
    else
    {
        _661 = _167;
    }
    _663 = false;
    float _665 = _661;
    float _667 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _669 = _665 + _667;
    float _671 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _673 = _671 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _675 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _677 = _675 + (*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _679 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _681 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _679;
    bool _683 = _665 >= (*spvDescriptorSet0.vp_c9)._m0[133].w;
    bool _685 = isnan(_665);
    bool _687 = _683 || _685;
    bool _689 = isnan((*spvDescriptorSet0.vp_c9)._m0[133].w);
    bool _691 = _687 || _689;
    float _693 = float(_691);
    float _695 = 1.0 / _673;
    float _697 = -(*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _699 = _697 + (*spvDescriptorSet0.vp_c9)._m0[134].w;
    float _701 = -(*spvDescriptorSet0.vp_c9)._m0[134].w;
    float _703 = _701 + (*spvDescriptorSet0.vp_c9)._m0[135].w;
    bool _705 = _665 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _707 = isnan(_665);
    bool _709 = _705 || _707;
    bool _711 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _713 = _709 || _711;
    float _715 = float(_713);
    bool _717 = _665 >= (*spvDescriptorSet0.vp_c9)._m0[134].w;
    bool _719 = isnan(_665);
    bool _721 = _717 || _719;
    bool _723 = isnan((*spvDescriptorSet0.vp_c9)._m0[134].w);
    bool _725 = _721 || _723;
    float _727 = float(_725);
    float _729 = 1.0 / _677;
    bool _731 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[14].x;
    float _733 = _681 * _695;
    bool _735 = _665 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _737 = isnan(_665);
    bool _739 = _735 || _737;
    bool _741 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _743 = _739 || _741;
    float _745 = float(_743);
    float _747 = 1.0 / _699;
    float _749 = -_693;
    float _751 = _749 + 1.0;
    float _753 = fma(_733, _669, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    float _755 = -(*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _757 = (*spvDescriptorSet0.vp_c9)._m0[134].x + _755;
    float _759 = -_745;
    float _761 = _759 + 1.0;
    float _763 = _745 * _751;
    float _765 = -(*spvDescriptorSet0.vp_c9)._m0[132].x;
    float _767 = _765 + (*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _769 = -_727;
    float _771 = _769 + 1.0;
    float _773 = 1.0 / _703;
    float _775 = _715 * _761;
    float _777 = _767 * _729;
    float _779 = -_715;
    float _781 = _779 + 1.0;
    float _783 = _693 * _771;
    float _785 = _753 * _775;
    float _787 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _789 = _665 + _787;
    float _791 = -(*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _793 = _665 + _791;
    float _795 = _757 * _747;
    bool _797 = _665 >= (*spvDescriptorSet0.vp_c9)._m0[135].w;
    bool _799 = isnan(_665);
    bool _801 = _797 || _799;
    bool _803 = isnan((*spvDescriptorSet0.vp_c9)._m0[135].w);
    bool _805 = _801 || _803;
    float _807 = float(_805);
    float _809 = -(*spvDescriptorSet0.vp_c9)._m0[134].x;
    float _811 = _809 + (*spvDescriptorSet0.vp_c9)._m0[135].x;
    float _813 = fma(_777, _789, (*spvDescriptorSet0.vp_c9)._m0[132].x);
    float _815 = fma(_781, (*spvDescriptorSet0.vp_c9)._m0[131].x, _785);
    float _817 = fma(_795, _793, (*spvDescriptorSet0.vp_c9)._m0[133].x);
    float _819 = -_807;
    float _821 = _819 + 1.0;
    float _823 = -(*spvDescriptorSet0.vp_c9)._m0[134].w;
    float _825 = _665 + _823;
    float _827 = _811 * _773;
    float _829 = fma(_813, _763, _815);
    float _831 = _727 * _821;
    float _833 = fma(_827, _825, (*spvDescriptorSet0.vp_c9)._m0[134].x);
    float _835 = fma(_817, _783, _829);
    float _837 = fma(_833, _831, _835);
    float _839 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _841 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _843 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _845 = fma(_807, (*spvDescriptorSet0.vp_c9)._m0[135].x, _837);
    float _847 = _839 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _849 = _841 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _851 = _843 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _853 = _845 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    out.m_68.x = _847;
    out.m_68.y = _849;
    out.m_68.z = _851;
    out.m_68.w = _853;
    bool _855 = !_731;
    float _857 = _851;
    float _859 = _849;
    if (!_855)
    {
        float _861 = in.m_62.x;
        float _863 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[14].x;
        float _865 = _861 * (*spvDescriptorSet0.vp_c9)._m0[15].x;
        float _867 = fma(_865, (*spvDescriptorSet0.vp_c9)._m0[14].x, _123);
        float _869 = _867 * _863;
        float _871 = floor(_869);
        float _873 = -_871;
        float _875 = _869 + _873;
        _169 = _875;
    }
    float _877 = _169;
    float _879 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _881 = int(_879);
    int _883 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _885 = _883 != 0;
    float _887 = trunc((*spvDescriptorSet0.vp_c9)._m0[40].y);
    int _889 = int(_887);
    float _891 = float(_881);
    float _893 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _895 = int(_893);
    float _897 = (*spvDescriptorSet0.vp_c9)._m0[7].z;
    if (_885)
    {
        _857 = 1.0;
    }
    float _899 = _857;
    float _901 = _899;
    if (_885)
    {
        _897 = 1.0;
    }
    float _903 = _897;
    float _905 = float(_889);
    float _907 = trunc((*spvDescriptorSet0.vp_c9)._m0[49].y);
    int _909 = int(_907);
    float _911 = 1.0 / _891;
    float _913 = float(uint(_895));
    int _915 = ~_895;
    int _917 = _915 + 1;
    float _919 = trunc((*spvDescriptorSet0.vp_c9)._m0[40].x);
    int _921 = int(_919);
    float _923 = float(_909);
    float _925 = 1.0 / _905;
    float _927 = _911 * _123;
    float _929 = float(uint(_921));
    float _931 = 1.0 / _913;
    float _933 = _925 * _123;
    float _935 = trunc(_927);
    int _937 = int(_935);
    float _939 = _891;
    float _941 = _925;
    float _943 = _903;
    if (_885)
    {
        float _945 = in.m_62.x;
        float _947 = in.m_62.y;
        _939 = _945;
        _941 = _947;
    }
    float _949 = _939;
    float _951 = _941;
    float _953 = 1.0 / _923;
    int _955 = as_type<int>(_931) + (-2);
    int _957 = as_type<int>(_931);
    if (_885)
    {
        _957 = 0;
    }
    int _959 = _957;
    float _961 = 1.0 / _929;
    float _963 = float(uint(_937));
    float _965 = as_type<float>(_955) * _963;
    float _967 = trunc(_933);
    int _969 = int(_967);
    float _971 = _953 * _123;
    float _973 = _965;
    float _975 = _949;
    float _977 = _951;
    int _979 = _959;
    if (_885)
    {
        _859 = _949;
    }
    float _981 = _859;
    float _983 = trunc((*spvDescriptorSet0.vp_c9)._m0[49].x);
    int _985 = int(_983);
    int _987 = as_type<int>(_961) + (-2);
    float _989 = float(uint(_969));
    float _991 = trunc(_965);
    float _993 = precise::max(_991, 0.0);
    uint _996 = uint(_993);
    float _998 = as_type<float>(_987) * _989;
    float _1000 = _989;
    float _1002 = _981;
    if (_885)
    {
        _1000 = _981;
    }
    float _1004 = _1000;
    float _1006 = float(uint(_985));
    float _1008 = trunc(_971);
    int _1010 = int(_1008);
    float _1012 = _1006;
    float _1014 = _1004;
    if (_885)
    {
        _973 = _951;
    }
    float _1016 = _973;
    float _1018 = trunc(_998);
    float _1020 = precise::max(_1018, 0.0);
    uint _1022 = uint(_1020);
    int _1024 = _917 * int(_996);
    int _1026 = _1024 + _937;
    float _1028 = 1.0 / _1006;
    float _1030 = _1016;
    if (_885)
    {
        _1012 = _981;
    }
    float _1032 = _1012;
    float _1034 = _1032;
    if (!_885)
    {
        float _1036 = in.m_62.x;
        float _1038 = in.m_62.y;
        float _1040 = in.m_62.z;
        float _1042 = _1036 * 3.1415927410125732421875;
        float _1044 = _1042 * 0.15915493667125701904296875;
        float _1046 = _1038 * 3.1415927410125732421875;
        float _1048 = _1046 * 0.15915493667125701904296875;
        float _1050 = _1044 * 6.283185482025146484375;
        float _1052 = sin(_1050);
        float _1054 = _1048 * 6.283185482025146484375;
        float _1056 = sin(_1054);
        _901 = 7.345489978790283203125;
        _975 = _1036;
        _977 = _1038;
        _943 = 5.839270114898681640625;
        _1014 = _1040;
        _1002 = _1038;
        _1030 = _1056;
        _1034 = _1052;
        _979 = 2;
    }
    float _1058 = _901;
    float _1060 = _975;
    float _1062 = _977;
    float _1064 = _943;
    float _1066 = _1014;
    float _1068 = _1002;
    float _1070 = _1030;
    float _1072 = _1034;
    int _1074 = _979;
    float _1076 = float(uint(_1026));
    float _1078 = _1058 * _1060;
    float _1080 = float(uint(_1010));
    float _1082 = _1060 * 2.0;
    int _1084 = ~_921;
    int _1086 = _1084 + 1;
    float _1088 = as_type<float>(_955) * _1076;
    float _1090 = floor(_1078);
    int _1092 = as_type<int>(_1028) + (-2);
    int _1094 = ~_985;
    int _1096 = _1094 + 1;
    float _1098 = as_type<float>(_1092) * _1080;
    bool _1100 = _1062 > 0.5;
    float _1102 = trunc(_1088);
    float _1104 = precise::max(_1102, 0.0);
    uint _1106 = uint(_1104);
    int _1108 = _1086 * int(_1022);
    int _1110 = _1108 + _969;
    float _1112 = _1064 * _1066;
    int _1114 = ~_985;
    int _1116 = _1114 + 1;
    float _1118 = float(uint(_1110));
    float _1120 = trunc(_1098);
    float _1122 = precise::max(_1120, 0.0);
    uint _1124 = uint(_1122);
    float _1126 = -_1090;
    float _1128 = _1078 + _1126;
    int _1130 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _1132 = _1130 != 0;
    float _1134 = in.m_62.z;
    float _1136 = as_type<float>(_987) * _1118;
    int _1138 = int(_1132);
    int _1140 = _1100 ? 2 : 0;
    int _1142 = _1138 | _1140;
    int _1144 = _191 ? 4 : 0;
    int _1146 = _1142 | _1144;
    int _1148 = false ? 8 : 0;
    int _1150 = _1146 | _1148;
    int _1152 = false ? 16 : 0;
    int _1154 = _1150 | _1152;
    int _1156 = false ? 32 : 0;
    int _1158 = _1154 | _1156;
    int _1160 = false ? 64 : 0;
    int _1162 = _1158 | _1160;
    int _1164 = _1162 & 2;
    bool _1166 = !_1132;
    int _1168 = _1166 ? 0 : 1;
    float _1170 = trunc(_1136);
    float _1172 = precise::max(_1170, 0.0);
    uint _1174 = uint(_1172);
    int _1176 = int(_996) + int(_1106);
    int _1178 = ~_895;
    int _1180 = _1178 + 1;
    float _1182 = float(_895);
    int _1184 = abs(_1168);
    int _1186 = _1180 * _1176;
    int _1188 = _1186 + _937;
    float _1190 = floor(_1112);
    float _1192 = _1128 * _1182;
    int _1194 = _1096 * int(_1124);
    int _1196 = _1194 + _1010;
    float _1198 = _1058 * _1068;
    bool _1200 = uint(_1188) >= uint(_895);
    float _1202 = float(_937);
    float _1204 = trunc(_1192);
    int _1206 = int(_1204);
    float _1208 = float(uint(_1196));
    bool _1210 = _1202 >= _1182;
    bool _1212 = isnan(_1202);
    bool _1214 = _1210 || _1212;
    bool _1216 = isnan(_1182);
    bool _1218 = _1214 || _1216;
    float _1220 = float(_1218);
    bool _1222 = !_1200;
    int _1224 = _1222 ? 0 : (-1);
    float _1226 = as_type<float>(_1092) * _1208;
    bool _1228 = _1134 > 0.5;
    float _1230 = trunc(_1220);
    int _1232 = int(_1230);
    int _1234 = ~_1176;
    int _1236 = _1234 + _1224;
    int _1238 = _1236 + 1;
    float _1240 = -_1190;
    float _1242 = _1112 + _1240;
    int _1244 = int(_1022) + int(_1174);
    int _1246 = ~_921;
    int _1248 = _1246 + 1;
    int _1250 = _895 * _1238;
    int _1252 = _1250 + _937;
    int _1254 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16;
    bool _1256 = _1254 != 0;
    int _1258 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32;
    bool _1260 = _1258 != 0;
    float _1262 = trunc(_1226);
    float _1264 = precise::max(_1262, 0.0);
    uint _1266 = uint(_1264);
    int _1268 = _1206 * _1184;
    int _1270 = _1268 + _937;
    float _1272 = _163 * _123;
    float _1274 = -_211;
    int _1276 = _1228 ? as_type<int>(_1274) : as_type<int>(_211);
    int _1278 = _1248 * _1244;
    int _1280 = _1278 + _969;
    float _1282 = -_201;
    int _1284 = _1100 ? as_type<int>(_1282) : as_type<int>(_201);
    float _1286 = floor(_1198);
    bool _1288 = _895 == 0;
    bool _1290 = !_1260;
    float _1292 = _1290 ? _211 : as_type<float>(_1276);
    float _1294 = _1182 * _1272;
    bool _1296 = !_1256;
    float _1298 = _1296 ? _201 : as_type<float>(_1284);
    int _1300 = ~_1232;
    int _1302 = _1300 + 1;
    int _1304 = _1302 + 1;
    float _1306 = floor(_1082);
    bool _1308 = !_1288;
    int _1310 = _1308 ? _1252 : (-1);
    int _1312 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _1314 = _1312 != 0;
    int _1316 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _1318 = _1316 != 0;
    int _1320 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _1322 = _1320 != 0;
    bool _1324 = uint(_1280) >= uint(_921);
    int _1326 = _1310 * _1304;
    int _1328 = int(_1124) + int(_1266);
    float _1330 = trunc(_1294);
    int _1332 = int(_1330);
    bool _1334 = !_1314;
    int _1336 = _1334 ? 0 : 1;
    float _1338 = -_1286;
    float _1340 = _1198 + _1338;
    bool _1342 = !_1318;
    int _1344 = _1342 ? 0 : 1;
    int _1346 = _1116 * _1328;
    int _1348 = _1346 + _1010;
    float _1350 = float(_921);
    float _1352 = float(_969);
    float _1354 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _1356 = log2(_1354);
    int _1358 = _895 + (-1);
    float _1360 = _1242 * _1350;
    int _1362 = abs(_1336);
    int _1364 = abs(_1344);
    int _1366 = _1232 * _1358;
    int _1368 = _1366 + _1326;
    bool _1370 = _1352 >= _1350;
    bool _1372 = isnan(_1352);
    bool _1374 = _1370 || _1372;
    bool _1376 = isnan(_1350);
    bool _1378 = _1374 || _1376;
    float _1380 = float(_1378);
    float _1382 = _1350 * _1272;
    float _1384 = trunc(_1360);
    int _1386 = int(_1384);
    bool _1388 = !_1324;
    int _1390 = _1388 ? 0 : (-1);
    int _1392 = _1368 * _1364;
    int _1394 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _1396 = _1394 != 0;
    float _1398 = _1356 * _123;
    int _1400 = ~_1244;
    int _1402 = _1400 + _1390;
    int _1404 = _1402 + 1;
    float _1406 = trunc(_1380);
    int _1408 = int(_1406);
    bool _1410 = !_1322;
    int _1412 = _1410 ? 0 : 1;
    int _1414 = _1332 * _1362;
    int _1416 = _1414 + _1392;
    int _1418 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 4096;
    bool _1420 = _1418 != 0;
    int _1422 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 8192;
    bool _1424 = _1422 != 0;
    int _1426 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16384;
    bool _1428 = _1426 != 0;
    int _1430 = _921 * _1404;
    int _1432 = _1430 + _969;
    bool _1434 = !_1396;
    int _1436 = _1434 ? 0 : 1;
    float _1438 = float(_985);
    float _1440 = trunc(_1382);
    int _1442 = int(_1440);
    float _1444 = float(_1010);
    bool _1446 = !_1424;
    int _1448 = _1446 ? 0 : 1;
    float _1450 = _1438 * _1272;
    int _1452 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16384;
    bool _1454 = _1452 != 0;
    float _1456 = _1340 * _1438;
    bool _1458 = _921 == 0;
    int _1460 = abs(_1412);
    float _1462 = trunc(_1450);
    int _1464 = int(_1462);
    bool _1466 = _1444 >= _1438;
    bool _1468 = isnan(_1444);
    bool _1470 = _1466 || _1468;
    bool _1472 = isnan(_1438);
    bool _1474 = _1470 || _1472;
    float _1476 = float(_1474);
    int _1478 = ~_1408;
    int _1480 = _1478 + 1;
    int _1482 = _1480 + 1;
    bool _1484 = !_1458;
    int _1486 = _1484 ? _1432 : (-1);
    bool _1488 = !_1454;
    int _1490 = _1488 ? 0 : 1;
    float _1492 = trunc(_1456);
    int _1494 = int(_1492);
    bool _1496 = uint(_1348) >= uint(_985);
    int _1498 = _1486 * _1482;
    int _1500 = abs(_1436);
    int _1502 = _1270 * _1460;
    int _1504 = _1502 + _1416;
    bool _1506 = !_1496;
    int _1508 = _1506 ? 0 : (-1);
    float _1510 = trunc(_1476);
    int _1512 = int(_1510);
    int _1514 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32768;
    bool _1516 = _1514 != 0;
    int _1518 = ~_1328;
    int _1520 = _1518 + _1508;
    int _1522 = _1520 + 1;
    int _1524 = _1206 * _1500;
    int _1526 = _1524 + _1504;
    int _1528 = abs(_1490);
    bool _1530 = !_1420;
    int _1532 = _1530 ? 0 : 1;
    int _1534 = _985 * _1522;
    int _1536 = _1534 + _1010;
    float _1538 = float(uint(_1526));
    bool _1540 = !_1516;
    int _1542 = _1540 ? 0 : 1;
    int _1544 = abs(_1448);
    int _1546 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32768;
    bool _1548 = _1546 != 0;
    bool _1550 = _1164 != 0;
    int _1552 = abs(_1532);
    float _1554 = as_type<float>(_955) * _1538;
    int _1556 = _921 + (-1);
    int _1558 = _1386 * _1528;
    int _1560 = _1558 + _969;
    bool _1562 = !_1548;
    int _1564 = _1562 ? 0 : 1;
    int _1566 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 65536;
    bool _1568 = _1566 != 0;
    int _1570 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 131072;
    bool _1572 = _1570 != 0;
    int _1574 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 262144;
    bool _1576 = _1574 != 0;
    int _1578 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 524288;
    bool _1580 = _1578 != 0;
    float _1582 = trunc(_1554);
    float _1584 = precise::max(_1582, 0.0);
    uint _1586 = uint(_1584);
    int _1588 = _1408 * _1556;
    int _1590 = _1588 + _1498;
    int _1592 = ~_1512;
    int _1594 = _1592 + 1;
    int _1596 = _1594 + 1;
    bool _1598 = !_1572;
    int _1600 = _1598 ? 0 : 1;
    int _1602 = _1590 * _1544;
    bool _1604 = _985 == 0;
    bool _1606 = !_1428;
    int _1608 = _1606 ? 0 : 1;
    int _1610 = _1442 * _1552;
    int _1612 = _1610 + _1602;
    bool _1614 = !_1604;
    int _1616 = _1614 ? _1536 : (-1);
    int _1618 = ~_895;
    int _1620 = _1618 + 1;
    int _1622 = abs(_1542);
    int _1624 = _1616 * _1596;
    int _1626 = abs(_1608);
    int _1628 = _1620 * int(_1586);
    int _1630 = _1628 + _1526;
    bool _1632 = !_1568;
    int _1634 = _1632 ? 0 : 1;
    int _1636 = _1560 * _1626;
    int _1638 = _1636 + _1612;
    int _1640 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 64;
    bool _1642 = _1640 != 0;
    int _1644 = _985 + (-1);
    int _1646 = _1386 * _1622;
    int _1648 = _1646 + _1638;
    int _1650 = abs(_1564);
    float _1652 = float(uint(_1630));
    int _1654 = _1512 * _1644;
    int _1656 = _1654 + _1624;
    float _1658 = float(uint(_1648));
    int _1660 = _1494 * _1650;
    int _1662 = _1660 + _1010;
    int _1664 = abs(_1600);
    float _1666 = as_type<float>(_955) * _1652;
    int _1668 = abs(_1634);
    float _1670 = as_type<float>(_1612);
    float _1672 = as_type<float>(_1074);
    if (_1642)
    {
        float _1674 = in.m_62.w;
        _1670 = _1674;
    }
    float _1676 = _1670;
    float _1678 = as_type<float>(_987) * _1658;
    bool _1680 = !_1576;
    int _1682 = _1680 ? 0 : 1;
    int _1684 = _1656 * _1664;
    float _1686 = trunc(_1678);
    float _1688 = precise::max(_1686, 0.0);
    uint _1690 = uint(_1688);
    int _1692 = abs(_1682);
    float _1694 = float(uint(_1270));
    int _1696 = _1464 * _1668;
    int _1698 = _1696 + _1684;
    int _1700 = ~_921;
    int _1702 = _1700 + 1;
    float _1704 = trunc(_1666);
    float _1706 = precise::max(_1704, 0.0);
    uint _1708 = uint(_1706);
    float _1710 = as_type<float>(_955) * _1694;
    int _1712 = _1662 * _1692;
    int _1714 = _1712 + _1698;
    bool _1716 = !_1580;
    int _1718 = _1716 ? 0 : 1;
    int _1720 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 128;
    bool _1722 = _1720 != 0;
    int _1724 = _1702 * int(_1690);
    int _1726 = _1724 + _1648;
    int _1728 = ~_895;
    int _1730 = _1728 + 1;
    float _1732 = trunc(_1710);
    float _1734 = precise::max(_1732, 0.0);
    uint _1736 = uint(_1734);
    float _1738 = _1694;
    if (_1642)
    {
        float _1740 = _1676 * 3.1415927410125732421875;
        _1738 = _1740;
    }
    float _1742 = _1738;
    int _1744 = abs(_1718);
    float _1746 = float(uint(_1726));
    float _1748 = _1742;
    if (_1642)
    {
        float _1750 = _1742 * 0.15915493667125701904296875;
        _1748 = _1750;
    }
    float _1752 = _1748;
    int _1754 = int(_1586) + int(_1708);
    int _1756 = ~_895;
    int _1758 = _1756 + 1;
    float _1760 = as_type<float>(_987) * _1746;
    int _1762 = _1494 * _1744;
    int _1764 = _1762 + _1714;
    float _1766 = as_type<float>(_1708);
    if (_1722)
    {
        float _1768 = in.m_62.x;
        _1766 = _1768;
    }
    float _1770 = _1766;
    int _1772 = _1730 * _1754;
    int _1774 = _1772 + _1526;
    float _1776 = _1752;
    if (_1642)
    {
        float _1778 = _1752 * 6.283185482025146484375;
        float _1780 = sin(_1778);
        _1776 = _1780;
    }
    float _1782 = _1776;
    float _1784 = float(uint(_1764));
    bool _1786 = uint(_1774) >= uint(_895);
    int _1788 = _1758 * int(_1736);
    int _1790 = _1788 + _1270;
    bool _1792 = _895 == 0;
    float _1794 = trunc(_1760);
    float _1796 = precise::max(_1794, 0.0);
    uint _1798 = uint(_1796);
    bool _1800 = !_1786;
    int _1802 = _1800 ? 0 : (-1);
    float _1804 = as_type<float>(_1092) * _1784;
    float _1806 = float(uint(_1790));
    int _1808 = ~_1754;
    int _1810 = _1808 + _1802;
    int _1812 = _1810 + 1;
    float _1814 = 0.0;
    bool _1816 = _1786;
    if (!_1642)
    {
        _1814 = _201;
    }
    float _1818 = _1814;
    float _1820 = trunc(_1804);
    float _1822 = precise::max(_1820, 0.0);
    uint _1824 = uint(_1822);
    float _1826 = _1818;
    float _1828 = _1782;
    if (_1642)
    {
        bool _1830 = _1782 > 0.5;
        _1816 = _1830;
    }
    bool _1832 = _1816;
    int _1834 = _895 * _1812;
    int _1836 = _1834 + _1526;
    float _1838 = float(uint(_1560));
    float _1840 = as_type<float>(_955) * _1806;
    if (_1642)
    {
        float _1842 = -_201;
        float _1844 = _1832 ? _1842 : _201;
        _1826 = _1844;
    }
    float _1846 = _1826;
    if (_1722)
    {
        float _1848 = _1770 * 3.1415927410125732421875;
        _1828 = _1848;
    }
    float _1850 = _1828;
    bool _1852 = !_1792;
    int _1854 = _1852 ? _1836 : (-1);
    float _1856 = as_type<float>(_987) * _1838;
    int _1858 = int(_1690) + int(_1798);
    float _1860 = _1850;
    if (_1722)
    {
        float _1862 = _1850 * 0.15915493667125701904296875;
        _1860 = _1862;
    }
    float _1864 = _1860;
    int _1866 = _1854 & 3;
    bool _1868 = _1866 != 0;
    float _1870 = trunc(_1856);
    float _1872 = precise::max(_1870, 0.0);
    uint _1874 = uint(_1872);
    int _1876 = ~_985;
    int _1878 = _1876 + 1;
    int _1880 = _1854 & 3;
    bool _1882 = _1880 != 0;
    int _1884 = _1868 ? 0 : 1;
    int _1886 = _1878 * int(_1824);
    int _1888 = _1886 + _1764;
    int _1890 = ~_921;
    int _1892 = _1890 + 1;
    float _1894 = _1864;
    if (_1722)
    {
        float _1896 = _1864 * 6.283185482025146484375;
        float _1898 = sin(_1896);
        _1894 = _1898;
    }
    float _1900 = _1894;
    bool _1902 = uint(_1880) > 1u;
    float _1904 = float(uint(_1888));
    int _1906 = _1892 * _1858;
    int _1908 = _1906 + _1648;
    float _1910 = -_211;
    int _1912 = _1550 ? as_type<int>(_1910) : as_type<int>(_211);
    int _1914 = ~_921;
    int _1916 = _1914 + 1;
    float _1918 = as_type<float>(_1092) * _1904;
    bool _1920 = uint(_1908) >= uint(_921);
    float _1922 = trunc(_1840);
    float _1924 = precise::max(_1922, 0.0);
    uint _1926 = uint(_1924);
    int _1928 = ~_1884;
    int _1930 = _1928 + 1;
    int _1932 = _1930 + 1;
    int _1934 = _1916 * int(_1874);
    int _1936 = _1934 + _1560;
    float _1938 = 0.0;
    int _1940 = _1932;
    if (!_1722)
    {
        _1938 = _211;
    }
    float _1942 = _1938;
    float _1944 = _1942;
    if (!_1902)
    {
        int _1946 = ~_1884;
        int _1948 = _1946 + 1;
        _1940 = _1948;
    }
    int _1950 = _1940;
    bool _1952 = !_1920;
    int _1954 = _1952 ? 0 : (-1);
    float _1956 = trunc(_1918);
    float _1958 = precise::max(_1956, 0.0);
    uint _1960 = uint(_1958);
    bool _1962 = _1880 != 3;
    bool _1964 = uint(_1880) >= 2u;
    int _1966 = ~_1858;
    int _1968 = _1966 + _1954;
    int _1970 = _1968 + 1;
    int _1972 = _1964 ? 0 : 1;
    bool _1974 = _1964;
    if (_1722)
    {
        bool _1976 = _1900 > 0.5;
        _1974 = _1976;
    }
    bool _1978 = _1974;
    int _1980 = _921 * _1970;
    int _1982 = _1980 + _1648;
    float _1984 = float(uint(_1936));
    if (_1722)
    {
        float _1986 = -_211;
        float _1988 = _1978 ? _1986 : _211;
        _1944 = _1988;
    }
    float _1990 = _1944;
    bool _1992 = !_1458;
    int _1994 = _1992 ? _1982 : (-1);
    float _1996 = as_type<float>(_987) * _1984;
    int _1998 = ~_1972;
    int _2000 = _1998 + 1;
    int _2002 = _2000 + 1;
    int _2004 = _2002;
    if (_1962)
    {
        int _2006 = ~_1972;
        int _2008 = _2006 + 1;
        _2004 = _2008;
    }
    int _2010 = _2004;
    int _2012 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _2014 = _2012 != 0;
    float _2016 = trunc(_1996);
    float _2018 = precise::max(_2016, 0.0);
    uint _2020 = uint(_2018);
    int _2022 = _1994 & 3;
    bool _2024 = _2022 != 0;
    bool _2026 = !_2014;
    float _2028 = _2026 ? _211 : as_type<float>(_1912);
    int _2030 = int(_1736) + int(_1926);
    int _2032 = ~_895;
    int _2034 = _2032 + 1;
    bool _2036 = uint(_2022) > 1u;
    int _2038 = int(_1824) + int(_1960);
    int _2040 = ~_985;
    int _2042 = _2040 + 1;
    int _2044 = _1994 & 3;
    bool _2046 = _2044 != 0;
    int _2048 = _2042 * _2038;
    int _2050 = _2048 + _1764;
    int _2052 = _2046 ? 0 : 1;
    int _2054 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _2056 = _2054 != 0;
    int _2058 = _2034 * _2030;
    int _2060 = _2058 + _1270;
    float _2062 = float(uint(_1662));
    bool _2064 = !_2056;
    int _2066 = _2064 ? 0 : 1;
    bool _2068 = uint(_2050) >= uint(_985);
    float _2070 = as_type<float>(_1092) * _2062;
    int _2072 = ~_2052;
    int _2074 = _2072 + 1;
    int _2076 = _2074 + 1;
    int _2078 = _2076;
    if (!_2036)
    {
        int _2080 = ~_2052;
        int _2082 = _2080 + 1;
        _2078 = _2082;
    }
    int _2084 = _2078;
    float _2086 = trunc(_2070);
    float _2088 = precise::max(_2086, 0.0);
    uint _2090 = uint(_2088);
    bool _2092 = uint(_2060) >= uint(_895);
    bool _2094 = !_2068;
    int _2096 = _2094 ? 0 : (-1);
    bool _2098 = _2022 != 3;
    bool _2100 = !_2092;
    int _2102 = _2100 ? 0 : (-1);
    bool _2104 = uint(_2022) >= 2u;
    int _2106 = ~_2038;
    int _2108 = _2106 + _2096;
    int _2110 = _2108 + 1;
    int _2112 = ~_921;
    int _2114 = _2112 + 1;
    int _2116 = int(_1874) + int(_2020);
    int _2118 = _985 * _2110;
    int _2120 = _2118 + _1764;
    int _2122 = ~_985;
    int _2124 = _2122 + 1;
    float _2126 = _1062 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    int _2128 = _2104 ? 0 : 1;
    int _2130 = _2114 * _2116;
    int _2132 = _2130 + _1560;
    int _2134 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8388608;
    bool _2136 = _2134 != 0;
    int _2138 = ~_2128;
    int _2140 = _2138 + 1;
    int _2142 = _2140 + 1;
    int _2144 = _2142;
    if (_2098)
    {
        int _2146 = ~_2128;
        int _2148 = _2146 + 1;
        _2144 = _2148;
    }
    int _2150 = _2144;
    int _2152 = _2124 * int(_2090);
    int _2154 = _2152 + _1662;
    int _2156 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16777216;
    bool _2158 = _2156 != 0;
    bool _2160 = !_2136;
    int _2162 = _2160 ? 0 : 1;
    bool _2164 = uint(_2132) >= uint(_921);
    bool _2166 = !_1604;
    int _2168 = _2166 ? _2120 : (-1);
    bool _2170 = !_2158;
    int _2172 = _2170 ? 0 : 1;
    bool _2174 = !_2164;
    int _2176 = _2174 ? 0 : (-1);
    int _2178 = _2168 & 3;
    bool _2180 = _2178 != 0;
    int _2182 = _2168 & 3;
    bool _2184 = _2182 != 0;
    float _2186 = float(uint(_2154));
    int _2188 = _2180 ? 0 : 1;
    bool _2190 = uint(_2182) > 1u;
    float _2192 = as_type<float>(_1092) * _2186;
    int _2194 = ~_2188;
    int _2196 = _2194 + 1;
    int _2198 = _2196 + 1;
    float _2200 = trunc(_2192);
    float _2202 = precise::max(_2200, 0.0);
    uint _2204 = uint(_2202);
    float _2206 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _2208 = (*spvDescriptorSet0.vp_c9)._m0[93].w + (*spvDescriptorSet0.vp_c9)._m0[93].y;
    int _2210 = _2198;
    float _2212 = _2192;
    if (!_2190)
    {
        int _2214 = ~_2188;
        int _2216 = _2214 + 1;
        _2210 = _2216;
    }
    int _2218 = _2210;
    float _2220 = fma(_1070, (*spvDescriptorSet0.vp_c9)._m0[93].w, _2208);
    bool _2222 = uint(_2182) >= 2u;
    float _2224 = _1070 * (*spvDescriptorSet0.vp_c9)._m0[92].y;
    int _2226 = ~_985;
    int _2228 = _2226 + 1;
    float _2230 = (*spvDescriptorSet0.vp_c9)._m0[92].x + (*spvDescriptorSet0.vp_c9)._m0[91].z;
    int _2232 = _2222 ? 0 : 1;
    float _2234 = (*spvDescriptorSet0.vp_c9)._m0[87].x + (*spvDescriptorSet0.vp_c9)._m0[86].z;
    bool _2236 = _2182 != 3;
    float _2238 = fma(_123, (*spvDescriptorSet0.vp_c9)._m0[92].w, _2220);
    int _2240 = int(_2090) + int(_2204);
    int _2242 = ~_2232;
    int _2244 = _2242 + 1;
    int _2246 = _2244 + 1;
    int _2248 = _2228 * _2240;
    int _2250 = _2248 + _1662;
    float _2252 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    int _2254 = _2246;
    if (_2236)
    {
        int _2256 = ~_2232;
        int _2258 = _2256 + 1;
        _2254 = _2258;
    }
    int _2260 = _2254;
    float _2262 = (*spvDescriptorSet0.vp_c9)._m0[87].y + (*spvDescriptorSet0.vp_c9)._m0[86].w;
    bool _2264 = uint(_2250) >= uint(_985);
    float _2266 = _1060 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _2268 = (*spvDescriptorSet0.vp_c9)._m0[88].z + (*spvDescriptorSet0.vp_c9)._m0[88].x;
    float _2270 = -_2206;
    float _2272 = fma(_2266, 2.0, _2270);
    float _2274 = fma(_1060, (*spvDescriptorSet0.vp_c9)._m0[88].z, _2268);
    bool _2276 = !_2264;
    int _2278 = _2276 ? 0 : (-1);
    float _2280 = -_123;
    float _2282 = fma(_2280, (*spvDescriptorSet0.vp_c9)._m0[76].x, _2272);
    bool _2284 = _1060 > 0.5;
    float _2286 = (*spvDescriptorSet0.vp_c9)._m0[93].z + (*spvDescriptorSet0.vp_c9)._m0[93].x;
    float _2288 = -(*spvDescriptorSet0.vp_c9)._m0[159].w;
    float _2290 = _2288 + (*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _2292 = -_201;
    int _2294 = _2284 ? as_type<int>(_2292) : as_type<int>(_201);
    float _2296 = fma(_1072, (*spvDescriptorSet0.vp_c9)._m0[93].z, _2286);
    bool _2298 = _1074 != 2;
    float _2300 = _1072 * (*spvDescriptorSet0.vp_c9)._m0[92].x;
    float _2302 = -(*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _2304 = _2302 + (*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _2306 = exp2(_1398);
    float _2308 = fma(_123, (*spvDescriptorSet0.vp_c9)._m0[92].z, _2296);
    float _2310 = -_2230;
    float _2312 = fma(_2300, 2.0, _2310);
    float _2314 = -_123;
    float _2316 = fma(_2314, (*spvDescriptorSet0.vp_c9)._m0[91].x, _2312);
    float _2318 = (*spvDescriptorSet0.vp_c9)._m0[88].w + (*spvDescriptorSet0.vp_c9)._m0[88].y;
    float _2320 = 1.0 / _2290;
    if (_2298)
    {
        _2212 = _1060;
    }
    float _2322 = _2212;
    float _2324 = fma(_1062, (*spvDescriptorSet0.vp_c9)._m0[88].w, _2318);
    float _2326 = _2322;
    if (_2298)
    {
        _1672 = _1062;
    }
    float _2328 = _1672;
    float _2330 = -(*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _2332 = _2330 + (*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _2334 = _2328;
    if (!_2298)
    {
        _2326 = _1134;
    }
    float _2336 = _2326;
    float _2338 = -_2306;
    float _2340 = _2338 + 1.0;
    if (!_2298)
    {
        _2334 = _1060;
    }
    float _2342 = _2334;
    float _2344 = 1.0 / _2304;
    int _2346 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _2348 = _2346 != 0;
    float _2350 = fma(_2126, -2.0, _2252);
    float _2352 = _2342 * (*spvDescriptorSet0.vp_c9)._m0[87].y;
    bool _2354 = !_2348;
    float _2356 = _2354 ? _201 : as_type<float>(_2294);
    float _2358 = fma(_123, (*spvDescriptorSet0.vp_c9)._m0[76].y, _2350);
    bool _2360 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _2362 = isnan(0.0);
    bool _2364 = _2360 || _2362;
    bool _2366 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _2368 = _2364 || _2366;
    float _2370 = (*spvDescriptorSet0.vp_c9)._m0[92].y + (*spvDescriptorSet0.vp_c9)._m0[91].w;
    float _2372 = fma(_2352, -2.0, _2262);
    float _2374 = _2368 ? _2340 : 0.0;
    float _2376 = fma(_2224, -2.0, _2370);
    bool _2378 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _2380 = isnan(1.0);
    bool _2382 = _2378 || _2380;
    bool _2384 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _2386 = _2382 || _2384;
    float _2388 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _2390 = 1.0 + _2388;
    float _2392 = _2336 * (*spvDescriptorSet0.vp_c9)._m0[87].x;
    float _2394 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _2396 = 1.0 / _2390;
    float _2398 = -_2234;
    float _2400 = fma(_2392, 2.0, _2398);
    float _2402 = fma(_123, (*spvDescriptorSet0.vp_c9)._m0[91].y, _2376);
    float _2404 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _2406 = in.m_48.x;
    float _2408 = in.m_48.y;
    float _2410 = in.m_48.z;
    float _2412 = fma(_1062, (*spvDescriptorSet0.vp_c9)._m0[78].w, _2394);
    float _2414 = fma(_123, (*spvDescriptorSet0.vp_c9)._m0[87].w, _2324);
    float _2416 = fma(_1060, (*spvDescriptorSet0.vp_c9)._m0[78].z, _2404);
    float _2418 = -_123;
    float _2420 = fma(_2418, (*spvDescriptorSet0.vp_c9)._m0[86].x, _2400);
    float _2422 = fma(_123, (*spvDescriptorSet0.vp_c9)._m0[77].w, _2412);
    float _2424 = fma(_123, (*spvDescriptorSet0.vp_c9)._m0[86].y, _2372);
    float _2426 = fma(_123, (*spvDescriptorSet0.vp_c9)._m0[77].z, _2416);
    float _2428 = fma(_123, (*spvDescriptorSet0.vp_c9)._m0[87].z, _2274);
    float _2430 = _1062 * 2.0;
    float _2432 = 1.0 / _2332;
    if (_2386)
    {
        float _2434 = _2374 * _2396;
        _133 = _2434;
    }
    float _2436 = _133;
    bool _2438 = _1306 >= 0.0;
    bool _2440 = isnan(_1306);
    bool _2442 = _2438 || _2440;
    bool _2444 = isnan(0.0);
    bool _2446 = _2442 || _2444;
    float _2448 = -(*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _2450 = _2448 + (*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _2452 = -(*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _2454 = _2452 + (*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _2456 = -(*spvDescriptorSet0.vp_c9)._m0[159].x;
    float _2458 = (*spvDescriptorSet0.vp_c9)._m0[160].x + _2456;
    int _2460 = _2446 ? 0 : 1;
    float _2462 = floor(_2430);
    bool _2464 = _1306 > 0.0;
    float _2466 = -(*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _2468 = _2466 + (*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _2470 = _2458 * _2320;
    float _2472 = _2408 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _2474 = _2408 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _2476 = _2408 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _2478 = 1.0 / _2454;
    int _2480 = ~_2460;
    int _2482 = _2480 + 1;
    int _2484 = _2482 + 1;
    float _2486 = fma(_2406, (*spvDescriptorSet0.vp_c10)._m0[4].x, _2472);
    float _2488 = fma(_2406, (*spvDescriptorSet0.vp_c10)._m0[5].x, _2474);
    float _2490 = fma(_2406, (*spvDescriptorSet0.vp_c10)._m0[6].x, _2476);
    float _2492 = -(*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _2494 = _2492 + (*spvDescriptorSet0.vp_c9)._m0[166].w;
    int _2496 = _2484;
    if (!_2464)
    {
        int _2498 = ~_2460;
        int _2500 = _2498 + 1;
        _2496 = _2500;
    }
    int _2502 = _2496;
    float _2504 = -(*spvDescriptorSet0.vp_c9)._m0[160].x;
    float _2506 = _2504 + (*spvDescriptorSet0.vp_c9)._m0[161].x;
    float _2508 = 1.0 / _2468;
    bool _2510 = _2462 >= 0.0;
    bool _2512 = isnan(_2462);
    bool _2514 = _2510 || _2512;
    bool _2516 = isnan(0.0);
    bool _2518 = _2514 || _2516;
    float _2520 = -_2308;
    float _2522 = _2520 + 1.0;
    float _2524 = _2506 * _2344;
    int _2526 = _2518 ? 0 : 1;
    float _2528 = -_2422;
    float _2530 = _2528 + 1.0;
    bool _2532 = _2462 > 0.0;
    float _2534 = 1.0 / _2450;
    float _2536 = -_2428;
    float _2538 = _2536 + 1.0;
    bool _2540 = _877 >= (*spvDescriptorSet0.vp_c9)._m0[166].w;
    bool _2542 = isnan(_877);
    bool _2544 = _2540 || _2542;
    bool _2546 = isnan((*spvDescriptorSet0.vp_c9)._m0[166].w);
    bool _2548 = _2544 || _2546;
    float _2550 = float(_2548);
    float _2552 = -_2414;
    float _2554 = _2552 + 1.0;
    bool _2556 = _877 >= (*spvDescriptorSet0.vp_c9)._m0[163].w;
    bool _2558 = isnan(_877);
    bool _2560 = _2556 || _2558;
    bool _2562 = isnan((*spvDescriptorSet0.vp_c9)._m0[163].w);
    bool _2564 = _2560 || _2562;
    float _2566 = float(_2564);
    float _2568 = -(*spvDescriptorSet0.vp_c9)._m0[161].x;
    float _2570 = (*spvDescriptorSet0.vp_c9)._m0[162].x + _2568;
    float _2572 = -(*spvDescriptorSet0.vp_c9)._m0[162].x;
    float _2574 = _2572 + (*spvDescriptorSet0.vp_c9)._m0[163].x;
    float _2576 = 1.0 / _2494;
    int _2578 = ~_2030;
    int _2580 = _2578 + _2102;
    int _2582 = _2580 + 1;
    float _2584 = _2570 * _2478;
    float _2586 = _1134 * 2.0;
    float _2588 = _2574 * _2432;
    int _2590 = ~_2116;
    int _2592 = _2590 + _2176;
    int _2594 = _2592 + 1;
    float _2596 = -(*spvDescriptorSet0.vp_c9)._m0[163].x;
    float _2598 = (*spvDescriptorSet0.vp_c9)._m0[164].x + _2596;
    int _2600 = ~_2526;
    int _2602 = _2600 + 1;
    int _2604 = _2602 + 1;
    float _2606 = floor(_2586);
    int _2608 = _2604;
    if (!_2532)
    {
        int _2610 = ~_2526;
        int _2612 = _2610 + 1;
        _2608 = _2612;
    }
    int _2614 = _2608;
    int _2616 = _921 * _2594;
    int _2618 = _2616 + _1560;
    float _2620 = _2598 * _2508;
    float _2622 = -(*spvDescriptorSet0.vp_c9)._m0[164].x;
    float _2624 = _2622 + (*spvDescriptorSet0.vp_c9)._m0[165].x;
    bool _2626 = _877 >= (*spvDescriptorSet0.vp_c9)._m0[164].w;
    bool _2628 = isnan(_877);
    bool _2630 = _2626 || _2628;
    bool _2632 = isnan((*spvDescriptorSet0.vp_c9)._m0[164].w);
    bool _2634 = _2630 || _2632;
    float _2636 = float(_2634);
    int _2638 = _895 * _2582;
    int _2640 = _2638 + _1270;
    bool _2642 = !_1458;
    int _2644 = _2642 ? _2618 : (-1);
    float _2646 = -(*spvDescriptorSet0.vp_c9)._m0[165].x;
    float _2648 = (*spvDescriptorSet0.vp_c9)._m0[166].x + _2646;
    int _2650 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _2652 = _2650 != 0;
    int _2654 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _2656 = _2654 != 0;
    int _2658 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _2660 = _2658 != 0;
    float _2662 = _2624 * _2534;
    bool _2664 = _877 >= (*spvDescriptorSet0.vp_c9)._m0[165].w;
    bool _2666 = isnan(_877);
    bool _2668 = _2664 || _2666;
    bool _2670 = isnan((*spvDescriptorSet0.vp_c9)._m0[165].w);
    bool _2672 = _2668 || _2670;
    float _2674 = float(_2672);
    float _2676 = -_2550;
    float _2678 = _2676 + 1.0;
    bool _2680 = !_1882;
    int _2682 = _2680 ? 0 : 1;
    float _2684 = fma(_2410, (*spvDescriptorSet0.vp_c10)._m0[6].z, _2490);
    bool _2686 = _2606 >= 0.0;
    bool _2688 = isnan(_2606);
    bool _2690 = _2686 || _2688;
    bool _2692 = isnan(0.0);
    bool _2694 = _2690 || _2692;
    float _2696 = _2648 * _2576;
    int _2698 = _1994 >> 31;
    float _2700 = -_2674;
    float _2702 = _2700 + 1.0;
    float _2704 = _2674 * _2678;
    int _2706 = _2694 ? 0 : 1;
    float _2708 = -(*spvDescriptorSet0.vp_c9)._m0[159].w;
    float _2710 = _877 + _2708;
    bool _2712 = _2606 > 0.0;
    float _2714 = -_2636;
    float _2716 = _2714 + 1.0;
    bool _2718 = _877 >= (*spvDescriptorSet0.vp_c9)._m0[162].w;
    bool _2720 = isnan(_877);
    bool _2722 = _2718 || _2720;
    bool _2724 = isnan((*spvDescriptorSet0.vp_c9)._m0[162].w);
    bool _2726 = _2722 || _2724;
    float _2728 = float(_2726);
    float _2730 = _2636 * _2702;
    int _2732 = _2698 & 3;
    float _2734 = fma(_2410, (*spvDescriptorSet0.vp_c10)._m0[4].z, _2486);
    float _2736 = fma(_2410, (*spvDescriptorSet0.vp_c10)._m0[5].z, _2488);
    float _2738 = fma(_2470, _2710, (*spvDescriptorSet0.vp_c9)._m0[159].x);
    float _2740 = _2566 * _2716;
    float _2742 = -_2566;
    float _2744 = _2742 + 1.0;
    bool _2746 = _877 >= (*spvDescriptorSet0.vp_c9)._m0[161].w;
    bool _2748 = isnan(_877);
    bool _2750 = _2746 || _2748;
    bool _2752 = isnan((*spvDescriptorSet0.vp_c9)._m0[161].w);
    bool _2754 = _2750 || _2752;
    float _2756 = float(_2754);
    float _2758 = -(*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _2760 = _877 + _2758;
    int _2762 = _1994 + _2732;
    float _2764 = -_2728;
    float _2766 = _2764 + 1.0;
    float _2768 = _2728 * _2744;
    float _2770 = fma(_2524, _2760, (*spvDescriptorSet0.vp_c9)._m0[160].x);
    int _2772 = _2762 >> 2;
    float _2774 = _2756 * _2766;
    bool _2776 = _877 >= (*spvDescriptorSet0.vp_c9)._m0[160].w;
    bool _2778 = isnan(_877);
    bool _2780 = _2776 || _2778;
    bool _2782 = isnan((*spvDescriptorSet0.vp_c9)._m0[160].w);
    bool _2784 = _2780 || _2782;
    float _2786 = float(_2784);
    float _2788 = -_2756;
    float _2790 = _2788 + 1.0;
    float _2792 = -(*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _2794 = _877 + _2792;
    float _2796 = -(*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _2798 = _877 + _2796;
    int _2800 = _2772 << 4;
    int _2802 = _2800 + 656;
    float _2804 = _2786 * _2790;
    bool _2806 = _877 >= (*spvDescriptorSet0.vp_c9)._m0[159].w;
    bool _2808 = isnan(_877);
    bool _2810 = _2806 || _2808;
    bool _2812 = isnan((*spvDescriptorSet0.vp_c9)._m0[159].w);
    bool _2814 = _2810 || _2812;
    float _2816 = float(_2814);
    float _2818 = -_2786;
    float _2820 = _2818 + 1.0;
    float _2822 = fma(_2584, _2794, (*spvDescriptorSet0.vp_c9)._m0[161].x);
    float _2824 = fma(_2588, _2798, (*spvDescriptorSet0.vp_c9)._m0[162].x);
    float _2826 = -(*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _2828 = _877 + _2826;
    uint _2830 = uint(int(uint(_2802) >> uint(2)));
    uint _2832 = uint(int(uint(int(_2830)) >> uint(2)));
    int _2834 = int(_2830) & 3;
    float _2836 = (*spvDescriptorSet0.vp_c9)._m0[int(_2832)][_2834];
    int _2838 = int(_2830) + 1;
    uint _2840 = uint(int(uint(_2838) >> uint(2)));
    int _2842 = _2838 & 3;
    float _2844 = (*spvDescriptorSet0.vp_c9)._m0[int(_2840)][_2842];
    float _2846 = _2816 * _2820;
    float _2848 = -(*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _2850 = _877 + _2848;
    float _2852 = -_2816;
    float _2854 = _2852 + 1.0;
    float _2856 = -(*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _2858 = _877 + _2856;
    float _2860 = _2738 * _2846;
    float _2862 = fma(_2620, _2828, (*spvDescriptorSet0.vp_c9)._m0[163].x);
    float _2864 = _2734 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    int _2866 = _2802 + 8;
    uint _2868 = uint(int(uint(_2866) >> uint(2)));
    uint _2870 = uint(int(uint(int(_2868)) >> uint(2)));
    int _2872 = int(_2868) & 3;
    float _2874 = (*spvDescriptorSet0.vp_c9)._m0[int(_2870)][_2872];
    int _2876 = int(_2868) + 1;
    uint _2878 = uint(int(uint(_2876) >> uint(2)));
    int _2880 = _2876 & 3;
    float _2882 = (*spvDescriptorSet0.vp_c9)._m0[int(_2878)][_2880];
    float _2884 = fma(_2854, (*spvDescriptorSet0.vp_c9)._m0[159].x, _2860);
    float _2886 = fma(_2696, _2858, (*spvDescriptorSet0.vp_c9)._m0[165].x);
    float _2888 = _2736 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    int _2890 = ~_2706;
    int _2892 = _2890 + 1;
    int _2894 = _2892 + 1;
    float _2896 = fma(_2770, _2804, _2884);
    int _2898 = _2894;
    if (!_2712)
    {
        int _2900 = ~_2706;
        int _2902 = _2900 + 1;
        _2898 = _2902;
    }
    int _2904 = _2898;
    float _2906 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2908 = _2888 + _2906;
    float _2910 = fma(_2662, _2850, (*spvDescriptorSet0.vp_c9)._m0[164].x);
    float _2912 = fma(_2822, _2774, _2896);
    float _2914 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2916 = _2864 + _2914;
    float _2918 = _2908 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _2920 = _1062 + _1060;
    bool _2922 = !_2024;
    int _2924 = _2922 ? 0 : 1;
    float _2926 = _1060 + _1134;
    bool _2928 = _2022 != 3;
    float _2930 = fma(_2916, (*spvDescriptorSet0.vp_c8)._m0[28].x, _2918);
    float _2932 = _1060 + (-0.5);
    float _2934 = _2920 + (-1.0);
    float _2936 = fma(_2824, _2768, _2912);
    float _2938 = _1062 + _1134;
    float _2940 = _1062 + (-0.5);
    float _2942 = fma(_2934, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _2944 = _1846 + 0.5;
    float _2946 = fma(_2862, _2740, _2936);
    int _2948 = abs(_2084);
    float _2950 = _2684 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _2952 = fma(_2944, (*spvDescriptorSet0.vp_c9)._m0[95].x, _2316);
    int _2954 = abs(_2150);
    float _2956 = fma(_2910, _2730, _2946);
    float _2958 = trunc((*spvDescriptorSet0.vp_c9)._m0[90].z);
    int _2960 = int(_2958);
    bool _2962 = !_2928;
    int _2964 = _2962 ? 0 : (-1);
    float _2966 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2968 = _2950 + _2966;
    int _2970 = abs(_2924);
    int _2972 = ~_2948;
    int _2974 = _2972 + 1;
    int _2976 = _2974 + 1;
    float _2978 = fma(_2968, (*spvDescriptorSet0.vp_c8)._m0[28].z, _2930);
    int _2980 = abs(_2964);
    int _2982 = ~_2970;
    int _2984 = _2982 + 1;
    int _2986 = _2984 + 1;
    int _2988 = _2976 * as_type<int>(_2844);
    float _2990 = _1990 + (-0.5);
    bool _2992 = _2978 >= 0.0;
    int _2994 = _2986 * as_type<int>(_2836);
    int _2996 = _2994 + _2988;
    int _2998 = ~_2954;
    int _3000 = _2998 + 1;
    int _3002 = _3000 + 1;
    float _3004 = -_2990;
    float _3006 = -_2402;
    float _3008 = fma(_3004, (*spvDescriptorSet0.vp_c9)._m0[95].y, _3006);
    int _3010 = abs(_2162);
    float _3012 = _2356 + 0.5;
    float _3014 = float(uint(_2960));
    int _3016 = _3002 * as_type<int>(_2874);
    int _3018 = _3016 + _2996;
    int _3020 = ~_2980;
    int _3022 = _3020 + 1;
    int _3024 = _3022 + 1;
    float _3026 = _2028 + (-0.5);
    int _3028 = ~_3010;
    int _3030 = _3028 + 1;
    int _3032 = _3030 + 1;
    float _3034 = fma(_3012, (*spvDescriptorSet0.vp_c9)._m0[80].x, _2282);
    float _3036 = 1.0 / _3014;
    int _3038 = _3024 * as_type<int>(_2882);
    int _3040 = _3038 + _3018;
    int _3042 = abs(_2960);
    float _3044 = -_3026;
    float _3046 = -_2358;
    float _3048 = fma(_3044, (*spvDescriptorSet0.vp_c9)._m0[80].y, _3046);
    int _3050 = _1854 >> 31;
    int _3052 = _3040 * _3032;
    int _3054 = _3050 & 3;
    int _3056 = _2644 * _3010;
    int _3058 = _3056 + _3052;
    float _3060 = float(uint(_3042));
    float _3062 = fma(_2028, _2530, _3048);
    float _3064 = _3012;
    if (_2992)
    {
        _3064 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _3066 = _3064;
    float _3068 = fma(_2886, _2704, _2956);
    int _3070 = _1854 + _3054;
    int _3072 = as_type<int>(_3066);
    if (_2992)
    {
        out.m_55.x = 0.0;
    }
    int _3074 = as_type<int>(_3036) + (-2);
    if (_2992)
    {
        float _3076 = _3066 * 5.0;
        _3072 = as_type<int>(_3076);
    }
    int _3078 = _3072;
    float _3080 = float(uint(_3058));
    float _3082 = 1.0 / _3060;
    int _3084 = _2168 >> 31;
    float _3086 = fma(_2550, (*spvDescriptorSet0.vp_c9)._m0[166].x, _3068);
    if (_2992)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _9486 = as_type<float>(_3078);
        out.gl_Position.z = _9486;
    }
    float _3088 = as_type<float>(_3074) * _3080;
    int _3090 = _3084 & 3;
    float _3092 = _2908 * _2908;
    bool _3094 = !_2652;
    int _3096 = _3094 ? 0 : 1;
    out.m_70.x = _3086;
    int _3098 = _2168 + _3090;
    int _3100 = _3070 >> 2;
    int _3102 = ~_2240;
    int _3104 = _3102 + _2278;
    int _3106 = _3104 + 1;
    float _3108 = -_2522;
    float _3110 = fma(_3108, _1846, _2952);
    float _3112 = -_2426;
    float _3114 = _3112 + 1.0;
    float _3116 = trunc(_3088);
    float _3118 = precise::max(_3116, 0.0);
    uint _3120 = uint(_3118);
    float _3122 = -_2238;
    float _3124 = _3122 + 1.0;
    int _3126 = ~_2960;
    int _3128 = _3126 + 1;
    float _3130 = -_3114;
    float _3132 = fma(_2356, _3130, _3034);
    int _3134 = abs(_3058);
    float _3136 = fma(_3124, _1990, _3008);
    int _3138 = as_type<int>(_3082) + (-2);
    float _3140 = fma(_2916, _2916, _3092);
    float _3142 = float(uint(_3134));
    out.m_72.x = _3132;
    out.m_72.y = _3062;
    int _3144 = _3098 >> 2;
    float _3146 = fma(_2968, _2968, _3140);
    int _3148 = _3100 << 4;
    int _3150 = _3148 + 368;
    float _3152 = as_type<float>(_3138) * _3142;
    int _3154 = _3144 << 4;
    int _3156 = _3154 + 800;
    out.m_74.x = _3110;
    out.m_74.y = _3136;
    int _3158 = _3128 * int(_3120);
    int _3160 = _3158 + _3058;
    uint _3162 = uint(int(uint(_3150) >> uint(2)));
    uint _3164 = uint(int(uint(int(_3162)) >> uint(2)));
    int _3166 = int(_3162) & 3;
    float _3168 = (*spvDescriptorSet0.vp_c9)._m0[int(_3164)][_3166];
    int _3170 = int(_3162) + 1;
    uint _3172 = uint(int(uint(_3170) >> uint(2)));
    int _3174 = _3170 & 3;
    float _3176 = (*spvDescriptorSet0.vp_c9)._m0[int(_3172)][_3174];
    int _3178 = _985 * _3106;
    int _3180 = _3178 + _1662;
    float _3182 = trunc(_3152);
    float _3184 = precise::max(_3182, 0.0);
    uint _3186 = uint(_3184);
    int _3188 = abs(_1950);
    float _3190 = float(uint(_3160));
    int _3192 = abs(_2218);
    uint _3194 = uint(int(uint(_3156) >> uint(2)));
    uint _3196 = uint(int(uint(int(_3194)) >> uint(2)));
    int _3198 = int(_3194) & 3;
    float _3200 = (*spvDescriptorSet0.vp_c9)._m0[int(_3196)][_3198];
    int _3202 = int(_3194) + 1;
    uint _3204 = uint(int(uint(_3202) >> uint(2)));
    int _3206 = _3202 & 3;
    float _3208 = (*spvDescriptorSet0.vp_c9)._m0[int(_3204)][_3206];
    int _3210 = abs(_3096);
    float _3212 = as_type<float>(_3074) * _3190;
    int _3214 = ~_3042;
    int _3216 = _3214 + 1;
    float _3218 = rsqrt(_3146);
    float _3220 = float(_2904);
    float _3222 = float(_3210);
    int _3224 = ~_3188;
    int _3226 = _3224 + 1;
    int _3228 = _3226 + 1;
    int _3230 = _3216 * int(_3186);
    int _3232 = _3230 + _3134;
    float _3234 = trunc(_3212);
    float _3236 = precise::max(_3234, 0.0);
    uint _3238 = uint(_3236);
    float _3240 = _3222 * _3220;
    int _3242 = ~_3192;
    int _3244 = _3242 + 1;
    int _3246 = _3244 + 1;
    int _3248 = _3150 + 8;
    uint _3250 = uint(int(uint(_3248) >> uint(2)));
    uint _3252 = uint(int(uint(int(_3250)) >> uint(2)));
    int _3254 = int(_3250) & 3;
    float _3256 = (*spvDescriptorSet0.vp_c9)._m0[int(_3252)][_3254];
    int _3258 = int(_3250) + 1;
    uint _3260 = uint(int(uint(_3258) >> uint(2)));
    int _3262 = _3258 & 3;
    float _3264 = (*spvDescriptorSet0.vp_c9)._m0[int(_3260)][_3262];
    float _3266 = float(uint(_3232));
    bool _3268 = !_2184;
    int _3270 = _3268 ? 0 : 1;
    float _3272 = _2908 * _3218;
    bool _3274 = _1880 != 3;
    float _3276 = as_type<float>(_3138) * _3266;
    int _3278 = abs(_3270);
    int _3280 = _3156 + 8;
    uint _3282 = uint(int(uint(_3280) >> uint(2)));
    uint _3284 = uint(int(uint(int(_3282)) >> uint(2)));
    int _3286 = int(_3282) & 3;
    float _3288 = (*spvDescriptorSet0.vp_c9)._m0[int(_3284)][_3286];
    int _3290 = int(_3282) + 1;
    uint _3292 = uint(int(uint(_3290) >> uint(2)));
    int _3294 = _3290 & 3;
    float _3296 = (*spvDescriptorSet0.vp_c9)._m0[int(_3292)][_3294];
    int _3298 = ~_3042;
    int _3300 = _3298 + 1;
    float _3302 = _2916 * _3218;
    int _3304 = ~_3278;
    int _3306 = _3304 + 1;
    int _3308 = _3306 + 1;
    float _3310 = trunc(_3276);
    float _3312 = precise::max(_3310, 0.0);
    uint _3314 = uint(_3312);
    int _3316 = int(_3120) + int(_3238);
    float _3318 = -_3272;
    float _3320 = fma(_3318, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2908);
    int _3322 = ~_2960;
    int _3324 = _3322 + 1;
    float _3326 = -_3302;
    float _3328 = fma(_3326, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2916);
    bool _3330 = _895 == 0;
    float _3332 = _3320 * _3320;
    bool _3334 = !_1604;
    int _3336 = _3334 ? _3180 : (-1);
    int _3338 = _3324 * _3316;
    int _3340 = _3338 + _3058;
    bool _3342 = !_3330;
    int _3344 = _3342 ? _2640 : (-1);
    float _3346 = fma(_3328, _3328, _3332);
    int _3348 = _3228 * as_type<int>(_3176);
    int _3350 = abs(_2682);
    int _3352 = int(_3186) + int(_3314);
    int _3354 = ~_3350;
    int _3356 = _3354 + 1;
    int _3358 = _3356 + 1;
    int _3360 = _3246 * as_type<int>(_3208);
    bool _3362 = !_3274;
    int _3364 = _3362 ? 0 : (-1);
    int _3366 = _3300 * _3352;
    int _3368 = _3366 + _3134;
    bool _3370 = uint(_3340) >= uint(_2960);
    int _3372 = _3358 * as_type<int>(_3168);
    int _3374 = _3372 + _3348;
    int _3376 = abs(_2010);
    int _3378 = _3308 * as_type<int>(_3200);
    int _3380 = _3378 + _3360;
    bool _3382 = !_3370;
    int _3384 = _3382 ? 0 : (-1);
    bool _3386 = _2182 != 3;
    int _3388 = ~_3316;
    int _3390 = _3388 + _3384;
    int _3392 = _3390 + 1;
    bool _3394 = !_3386;
    int _3396 = _3394 ? 0 : (-1);
    bool _3398 = uint(_3368) >= uint(_3042);
    int _3400 = ~_3376;
    int _3402 = _3400 + 1;
    int _3404 = _3402 + 1;
    int _3406 = abs(_3364);
    int _3408 = _2960 * _3392;
    int _3410 = _3408 + _3058;
    bool _3412 = !_3398;
    int _3414 = _3412 ? 0 : (-1);
    int _3416 = _3404 * as_type<int>(_3256);
    int _3418 = _3416 + _3374;
    bool _3420 = _2960 == 0;
    int _3422 = abs(_2260);
    bool _3424 = !_3420;
    int _3426 = _3424 ? _3410 : (-1);
    bool _3428 = _2960 == 0;
    int _3430 = ~_3422;
    int _3432 = _3430 + 1;
    int _3434 = _3432 + 1;
    int _3436 = _3058 ^ _2960;
    float _3438 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].z;
    int _3440 = ~_3406;
    int _3442 = _3440 + 1;
    int _3444 = _3442 + 1;
    int _3446 = _3434 * as_type<int>(_3288);
    int _3448 = _3446 + _3380;
    int _3450 = abs(_3396);
    uint _3452 = uint(int(uint(_3436) >> uint(31)));
    int _3454 = _3444 * as_type<int>(_3264);
    int _3456 = _3454 + _3418;
    float _3458 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].w;
    int _3460 = ~_3414;
    int _3462 = _3352 + _3460;
    int _3464 = _3462 + 1;
    int _3466 = ~int(_3452);
    int _3468 = _3466 + 1;
    int _3470 = abs(_2066);
    int _3472 = ~_3450;
    int _3474 = _3472 + 1;
    int _3476 = _3474 + 1;
    float _3478 = _3438 * (*spvDescriptorSet0.vp_c9)._m0[90].x;
    int _3480 = _3464 ^ _3468;
    int _3482 = ~_3470;
    int _3484 = _3482 + 1;
    int _3486 = _3484 + 1;
    int _3488 = _3476 * as_type<int>(_3296);
    int _3490 = _3488 + _3448;
    int _3492 = abs(_2172);
    float _3494 = in.m_76.x;
    float _3496 = in.m_76.y;
    float _3498 = in.m_76.z;
    int _3500 = ~_3468;
    int _3502 = _3500 + _3480;
    int _3504 = _3502 + 1;
    int _3506 = _3456 * _3486;
    float _3508 = float(_3426);
    int _3510 = ~_3492;
    int _3512 = _3510 + 1;
    int _3514 = _3512 + 1;
    int _3516 = _3344 * _3470;
    int _3518 = _3516 + _3506;
    bool _3520 = !_3428;
    int _3522 = _3520 ? _3504 : (-1);
    float _3524 = fma(_3478, _3508, _2420);
    float _3526 = _1298 + 0.5;
    int _3528 = _3490 * _3514;
    float _3530 = float(_3522);
    float _3532 = _3458 * (*spvDescriptorSet0.vp_c9)._m0[90].y;
    float _3534 = fma(_3478, _3526, _3524);
    int _3536 = _3336 * _3492;
    int _3538 = _3536 + _3528;
    float _3540 = float(_3518);
    float _3542 = -_2424;
    float _3544 = fma(_3532, _3530, _3542);
    float _3546 = _1292 + (-0.5);
    float _3548 = -_2538;
    float _3550 = fma(_1298, _3548, _3534);
    float _3552 = _3240 * (-2.0);
    out.m_78.x = _3540;
    float _3554 = -_3532;
    float _3556 = fma(_3554, _3546, _3544);
    float _3558 = float(_3538);
    float _3560 = _2968 * _3218;
    float _3562 = fma(_2942, _3552, _2942);
    float _3564 = fma(_1292, _2554, _3556);
    float _3566 = fma(_3552, _3494, _3494);
    bool _3568 = !_2656;
    int _3570 = _3568 ? 0 : 1;
    out.m_78.w = _3558;
    float _3572 = -_3560;
    float _3574 = fma(_3572, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2968);
    bool _3576 = !_2660;
    int _3578 = _3576 ? 0 : 1;
    out.m_80.x = _3550;
    out.m_80.y = _3564;
    int _3580 = abs(_3570);
    float _3582 = _3498;
    if (_2992)
    {
        return out;
    }
    float _3584 = -_3272;
    float _3586 = fma(_3584, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2888);
    float _3588 = -_3302;
    float _3590 = fma(_3588, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2864);
    float _3592 = float(_2502);
    float _3594 = fma(_2932, (*spvDescriptorSet0.vp_c9)._m0[196].x, _3566);
    float _3596 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _3598 = _3586 + _3596;
    float _3600 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _3602 = _3590 + _3600;
    float _3604 = float(_3580);
    float _3606 = fma(_3562, _2436, _3594);
    float _3608 = _3598 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _3610 = _2938 + (-1.0);
    float _3612 = _3604 * _3592;
    float _3614 = fma(_3602, (*spvDescriptorSet0.vp_c8)._m0[28].x, _3608);
    float _3616 = -_3560;
    float _3618 = fma(_3616, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2950);
    int _3620 = abs(_3578);
    float _3622 = _3612 * (-2.0);
    float _3624 = fma(_3610, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _3626 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _3628 = _3618 + _3626;
    float _3630 = float(_2614);
    float _3632 = fma(_3574, _3574, _3346);
    float _3634 = float(_3620);
    float _3636 = fma(_3628, (*spvDescriptorSet0.vp_c8)._m0[28].z, _3614);
    float _3638 = fma(_3622, _3496, _3496);
    float _3640 = fma(_3624, _3622, _3624);
    float _3642 = _3606 * 0.15915493667125701904296875;
    float _3644 = _3634 * _3630;
    bool _3646 = _3636 >= 0.0;
    float _3648 = fma(_2940, (*spvDescriptorSet0.vp_c9)._m0[196].y, _3638);
    float _3650 = _3644 * (-2.0);
    float _3652 = _2926 + (-1.0);
    float _3654 = fma(_3640, _2436, _3648);
    float _3656 = _1134 + (-0.5);
    float _3658 = fma(_3650, _3498, _3498);
    float _3660 = sqrt(_3632);
    float _3662 = _3654 * 0.15915493667125701904296875;
    float _3664 = fma(_3652, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _3666 = fma(_3656, (*spvDescriptorSet0.vp_c9)._m0[196].z, _3658);
    if (_3646)
    {
        _3582 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _3668 = _3582;
    float _3670 = fma(_3664, _3650, _3664);
    float _3672 = _3642 * 6.283185482025146484375;
    float _3674 = sin(_3672);
    int _3676 = as_type<int>(_3668);
    if (_3646)
    {
        out.m_55.x = 0.0;
    }
    if (_3646)
    {
        float _3678 = _3668 * 5.0;
        _3676 = as_type<int>(_3678);
    }
    int _3680 = _3676;
    float _3682 = fma(_3670, _2436, _3666);
    if (_3646)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _10360 = as_type<float>(_3680);
        out.gl_Position.z = _10360;
    }
    float _3684 = _3642 * 6.283185482025146484375;
    float _3686 = cos(_3684);
    float _3688 = _3682 * 0.15915493667125701904296875;
    float _3690 = _3662 * 6.283185482025146484375;
    float _3692 = sin(_3690);
    float _3694 = _3662 * 6.283185482025146484375;
    float _3696 = cos(_3694);
    if (_3646)
    {
        return out;
    }
    float _3698 = _3688 * 6.283185482025146484375;
    float _3700 = cos(_3698);
    float _3702 = _3218 * _3660;
    float _3704 = _639 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _3706 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _211);
    float _3708 = _3686 * _3696;
    float _3710 = _3686 * _3692;
    float _3712 = _3702 * _3704;
    float _3714 = _3674 * _3696;
    float _3716 = _3688 * 6.283185482025146484375;
    float _3718 = sin(_3716);
    float _3720 = _211 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _3722 = _3706 * _3712;
    float _3724 = _641 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _3726 = _3674 * _3692;
    float _3728 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _201);
    float _3730 = _3702 * _3724;
    float _3732 = _3686 * _3700;
    float _3734 = _3696 * _3700;
    float _3736 = _3674 * _3700;
    float _3738 = _3728 * _3730;
    float _3740 = _3732 * _3722;
    float _3742 = _3692 * _3700;
    float _3744 = _3702 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _3746 = _3744 * 0.5;
    float _3748 = fma(_3718, _3708, _3726);
    float _3750 = -_3714;
    float _3752 = fma(_3718, _3710, _3750);
    float _3754 = -_3722;
    float _3756 = _3718 * _3754;
    float _3758 = -_3710;
    float _3760 = fma(_3718, _3714, _3758);
    float _3762 = fma(_3748, _3738, _3740);
    float _3764 = _3736 * _3722;
    float _3766 = fma(_3734, _3738, _3756);
    float _3768 = fma(_3718, _3726, _3708);
    float _3770 = fma(_3752, _3746, _3762);
    float _3772 = fma(_3760, _3738, _3764);
    float _3774 = fma(_3742, _3746, _3766);
    float _3776 = _3748 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _3778 = _3770 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _3780 = _3770 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _3782 = fma(_3768, _3746, _3772);
    float _3784 = _3770 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _3786 = fma(_3774, (*spvDescriptorSet0.vp_c8)._m0[24].x, _3778);
    float _3788 = fma(_3774, (*spvDescriptorSet0.vp_c8)._m0[26].x, _3780);
    float _3790 = fma(_3734, (*spvDescriptorSet0.vp_c8)._m0[26].x, _3776);
    float _3792 = fma(_3774, (*spvDescriptorSet0.vp_c8)._m0[25].x, _3784);
    float _3794 = fma(_3782, (*spvDescriptorSet0.vp_c8)._m0[24].z, _3786);
    float _3796 = fma(_3782, (*spvDescriptorSet0.vp_c8)._m0[26].z, _3788);
    float _3798 = _3752 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _3800 = fma(_3782, (*spvDescriptorSet0.vp_c8)._m0[25].z, _3792);
    float _3802 = _3794 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _3804 = _3796 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _3806 = _3748 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _3808 = _3800 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _3810 = _2864 + _3802;
    float _3812 = _2950 + _3804;
    float _3814 = fma(_3734, (*spvDescriptorSet0.vp_c8)._m0[25].x, _3806);
    float _3816 = _3732 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _3818 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _3820 = _3810 + _3818;
    float _3822 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _3824 = _3812 + _3822;
    float _3826 = _3732 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _3828 = _3748 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _3830 = _3820 * _3820;
    float _3832 = _3824 * _3824;
    float _3834 = _3732 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _3836 = -_3718;
    float _3838 = fma(_3836, (*spvDescriptorSet0.vp_c8)._m0[24].x, _3816);
    float _3840 = -_3718;
    float _3842 = fma(_3840, (*spvDescriptorSet0.vp_c8)._m0[25].x, _3826);
    float _3844 = _3830 + _3832;
    float _3846 = fma(_3734, (*spvDescriptorSet0.vp_c8)._m0[24].x, _3828);
    float _3848 = -_3718;
    float _3850 = fma(_3848, (*spvDescriptorSet0.vp_c8)._m0[26].x, _3834);
    float _3852 = fma(_3720, _3720, 1.0);
    float _3854 = sqrt(_3844);
    float _3856 = _3752 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _3858 = _3752 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _3860 = _2888 + _3808;
    float _3862 = fma(_3742, (*spvDescriptorSet0.vp_c8)._m0[26].x, _3798);
    float _3864 = fma(_3742, (*spvDescriptorSet0.vp_c8)._m0[24].x, _3856);
    float _3866 = fma(_3742, (*spvDescriptorSet0.vp_c8)._m0[25].x, _3858);
    float _3868 = rsqrt(_3852);
    bool _3870 = _3854 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _3872 = _3742;
    float _3874 = _3856;
    float _3876 = _3826;
    float _3878 = _3852;
    float _3880 = _3858;
    if (!_3870)
    {
        _3872 = _3832;
    }
    float _3882 = _3872;
    float _3884 = _3882;
    if (!_3870)
    {
        _3874 = _3830;
    }
    float _3886 = _3874;
    float _3888 = _3886;
    if (!_3870)
    {
        _3876 = _3810;
    }
    float _3890 = _3876;
    float _3892 = _3890;
    if (!_3870)
    {
        _3878 = _3812;
    }
    float _3894 = _3878;
    float _3896 = _3894;
    if (!_3870)
    {
        _3880 = _3860;
    }
    float _3898 = _3880;
    bool _3900 = !_3870;
    float _3902 = _3898;
    if (!_3900)
    {
        float _3904 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _3906 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _3908 = _3854 + _3906;
        float _3910 = rsqrt(_3844);
        float _3912 = _3908 * _3904;
        float _3914 = _3860 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _3916 = _3912 * 0.15915493667125701904296875;
        float _3918 = _3916 * 6.283185482025146484375;
        float _3920 = sin(_3918);
        float _3922 = _3916 * 6.283185482025146484375;
        float _3924 = cos(_3922);
        float _3926 = fma(_3920, _3914, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _3928 = _3910 * _3926;
        float _3930 = _3924 + (-1.0);
        float _3932 = fma(_3820, _3928, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _3934 = fma(_3824, _3928, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _3936 = _3930 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _3938 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _3940 = _3932 + _3938;
        float _3942 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _3944 = _3934 + _3942;
        float _3946 = fma(_3860, _3924, _3936);
        float _3948 = _3940 * _3940;
        float _3950 = _3944 * _3944;
        _3902 = _3946;
        _3888 = _3948;
        _3884 = _3950;
        _3892 = _3932;
        _3896 = _3934;
    }
    float _3952 = _3902;
    float _3954 = _3888;
    float _3956 = _3884;
    float _3958 = _3892;
    float _3960 = _3896;
    float _3962 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _3964 = _3952 + _3962;
    float _3966 = fma(_3736, (*spvDescriptorSet0.vp_c8)._m0[24].z, _3838);
    float _3968 = fma(_3736, (*spvDescriptorSet0.vp_c8)._m0[25].z, _3842);
    float _3970 = fma(_3736, (*spvDescriptorSet0.vp_c8)._m0[26].z, _3850);
    float _3972 = fma(_3964, _3964, _3954);
    float _3974 = fma(_3768, (*spvDescriptorSet0.vp_c8)._m0[24].z, _3864);
    float _3976 = fma(_3768, (*spvDescriptorSet0.vp_c8)._m0[25].z, _3866);
    float _3978 = fma(_3768, (*spvDescriptorSet0.vp_c8)._m0[26].z, _3862);
    float _3980 = _3972 + _3956;
    float _3982 = _3720 * _3868;
    float _3984 = fma(_3760, (*spvDescriptorSet0.vp_c8)._m0[24].z, _3846);
    float _3986 = _201 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _3988 = _3720 * _3966;
    float _3990 = fma(_3760, (*spvDescriptorSet0.vp_c8)._m0[25].z, _3814);
    float _3992 = _3720 * _3968;
    float _3994 = fma(_3760, (*spvDescriptorSet0.vp_c8)._m0[26].z, _3790);
    float _3996 = _3720 * _3970;
    float _3998 = -_3974;
    float _4000 = _3982 * _3998;
    float _4002 = -_3976;
    float _4004 = _3982 * _4002;
    float _4006 = -_3978;
    float _4008 = _3982 * _4006;
    float _4010 = fma(_3986, _3984, _3988);
    float _4012 = sqrt(_3980);
    float _4014 = fma(_3986, _3990, _3992);
    float _4016 = fma(_3986, _3994, _3996);
    float _4018 = fma(_3868, _3966, _4000);
    float _4020 = fma(_3868, _3968, _4004);
    float _4022 = _3976 + _4014;
    float _4024 = fma(_3868, _3970, _4008);
    float _4026 = _3974 + _4010;
    float _4028 = _3978 + _4016;
    out.m_82.x = _3984;
    out.m_82.y = _3990;
    out.m_82.z = _3994;
    out.m_84.x = _4018;
    out.m_84.y = _4020;
    out.m_84.z = _4024;
    bool _4030 = _4012 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _4032 = isnan(_4012);
    bool _4034 = _4030 || _4032;
    bool _4036 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _4038 = _4034 || _4036;
    out.m_86.x = _4026;
    out.m_86.y = _4022;
    out.m_86.z = _4028;
    float _4040 = _3980;
    float _4042 = _3986;
    if (!_4038)
    {
        _4040 = 1.0;
    }
    float _4044 = _4040;
    bool _4046 = !_4038;
    float _4048 = _4044;
    if (!_4046)
    {
        bool _4050 = _4012 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _4052 = isnan(_4012);
        bool _4054 = _4050 || _4052;
        bool _4056 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _4058 = _4054 || _4056;
        if (!_4058)
        {
            float _4060 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _4062 = _4012 + _4060;
            float _4064 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _4066 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _4064;
            float _4068 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _4070 = _4068 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _4072 = 1.0 / _4066;
            float _4074 = _4062 * _4072;
            float _4076 = fma(_4074, _4070, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _4048 = _4076;
            _4042 = _4066;
            _4078 = true;
        }
        else
        {
            bool _4080 = _4012 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _4082 = isnan(_4012);
            bool _4084 = _4080 || _4082;
            bool _4086 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _4088 = _4084 || _4086;
            if (!_4088)
            {
                float _4090 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _4092 = _4012 + _4090;
                float _4094 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _4096 = _4094 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _4098 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _4100 = _4098 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _4102 = 1.0 / _4096;
                float _4104 = _4092 * _4102;
                float _4106 = fma(_4104, _4100, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _4048 = _4106;
                _4042 = _4096;
                _4078 = true;
            }
            else
            {
                _4048 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _4078 = false;
    float _4108 = _4048;
    float _4110 = _4042;
    float _4112 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _4114 = _3952 + _4112;
    float _4116 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _4118 = _3958 + _4116;
    float _4120 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _4122 = _3960 + _4120;
    float _4124 = fma(_4114, _4108, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _4126 = fma(_4118, _4108, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _4128 = fma(_4122, _4108, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _4130 = -_2888;
    float _4132 = _4130 + _4124;
    float _4134 = -_2864;
    float _4136 = _4134 + _4126;
    float _4138 = -_2950;
    float _4140 = _4138 + _4128;
    float _4142 = _4132 * _4132;
    float _4144 = fma(_4136, _4136, _4142);
    float _4146 = fma(_4140, _4140, _4144);
    float _4148 = sqrt(_4146);
    bool _4150 = _4148 > 0.0;
    float _4152 = _4122;
    float _4154 = _4110;
    float _4156 = _4148;
    float _4158 = _4118;
    float _4160 = _4140;
    if (!_4150)
    {
        _4152 = _4126;
    }
    float _4162 = _4152;
    float _4164 = _4162;
    if (!_4150)
    {
        _4154 = _4124;
    }
    float _4166 = _4154;
    float _4168 = _4166;
    float _4170 = _4166;
    if (!_4150)
    {
        _4156 = _4128;
    }
    float _4172 = _4156;
    bool _4174 = !_4150;
    float _4176 = _4172;
    if (!_4174)
    {
        float _4178 = _215 * _215;
        float _4180 = fma(_213, _213, _4178);
        float _4182 = fma(_217, _217, _4180);
        float _4184 = rsqrt(_4146);
        float _4186 = sqrt(_4182);
        float _4188 = _4136 * _4184;
        float _4190 = _4132 * _4184;
        float _4192 = _4140 * _4184;
        bool _4194 = _4186 > 0.0;
        float _4196 = _4186;
        float _4198 = _4184;
        _4158 = _4182;
        _4160 = _4192;
        if (!_4194)
        {
            _4196 = _4126;
        }
        float _4200 = _4196;
        _4164 = _4200;
        if (!_4194)
        {
            _4168 = _4124;
        }
        float _4202 = _4168;
        _4170 = _4202;
        if (!_4194)
        {
            _4198 = _4128;
        }
        float _4204 = _4198;
        bool _4206 = !_4194;
        _4176 = _4204;
        if (!_4206)
        {
            float _4208 = rsqrt(_4182);
            float _4210 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].z;
            float _4212 = _215 * _4208;
            float _4214 = _213 * _4208;
            float _4216 = _4190 * _4212;
            float _4218 = _217 * _4208;
            float _4220 = fma(_4188, _4214, _4216);
            float _4222 = _4210 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _4224 = fma(_4192, _4218, _4220);
            float _4226 = _4224 * _4222;
            float _4228 = fma(_213, _4226, _4126);
            float _4230 = fma(_215, _4226, _4124);
            float _4232 = fma(_217, _4226, _4128);
            _4170 = _4230;
            _4164 = _4228;
            _4176 = _4232;
            _4158 = _4208;
        }
    }
    float _4234 = _4170;
    float _4236 = _4164;
    float _4238 = _4176;
    float _4240 = _4158;
    float _4242 = _4160;
    float _4244 = -_3272;
    float _4246 = fma(_4244, (*spvDescriptorSet0.vp_c9)._m0[18].w, _4234);
    float _4248 = -_3302;
    float _4250 = fma(_4248, (*spvDescriptorSet0.vp_c9)._m0[18].w, _4236);
    float _4252 = -_3560;
    float _4254 = fma(_4252, (*spvDescriptorSet0.vp_c9)._m0[18].w, _4238);
    float _4256 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _4258 = _4246 + _4256;
    float _4260 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _4262 = _4250 + _4260;
    float _4264 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _4266 = _4254 + _4264;
    float _4268 = _4258 * _4258;
    float _4270 = fma(_4262, _4262, _4268);
    float _4272 = fma(_4266, _4266, _4270);
    float _4274 = rsqrt(_4272);
    float _4276 = sqrt(_4272);
    float _4278 = _4274 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _4280 = _4262 * _4278;
    float _4282 = _4266 * _4278;
    float _4284 = _4280 * _4280;
    float _4286 = _4282 * _4282;
    float _4288 = _4284 + _4286;
    float _4290 = sqrt(_4288);
    bool _4292 = _4290 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _4294 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _4296 = _4290 + _4294;
    float _4298 = _4266;
    float _4300 = _4234;
    float _4302 = _4296;
    float _4304 = _4240;
    float _4306 = _4258;
    float _4308 = _4242;
    if (_4292)
    {
        float _4310 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _4298 = _4310;
    }
    float _4312 = _4298;
    if (_4292)
    {
        float _4314 = rsqrt(_4288);
        _4300 = _4314;
    }
    float _4316 = _4300;
    if (_4292)
    {
        float _4318 = _4296 * _4312;
        _4302 = _4318;
    }
    float _4320 = _4302;
    if (_4292)
    {
        float _4322 = _4320 * 0.15915493667125701904296875;
        _4304 = _4322;
    }
    float _4324 = _4304;
    float _4326 = _4270;
    if (_4292)
    {
        float _4328 = _4324 * 6.283185482025146484375;
        float _4330 = sin(_4328);
        _4326 = _4330;
    }
    float _4332 = _4326;
    float _4334 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _4336 = precise::max(0.0, _4334);
    float _4338 = _4274;
    float _4340 = _4336;
    float _4342 = _4334;
    if (_4292)
    {
        float _4344 = _4324 * 6.283185482025146484375;
        float _4346 = cos(_4344);
        _4338 = _4346;
    }
    float _4348 = _4338;
    float _4350 = -_4278;
    float _4352 = -_4336;
    float _4354 = fma(_4258, _4350, _4352);
    if (!_4292)
    {
        _4306 = _4280;
    }
    float _4356 = _4306;
    float _4358 = _4356;
    if (_4292)
    {
        float _4360 = _4354 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _4340 = _4360;
    }
    float _4362 = _4340;
    float _4364 = _4332;
    float _4366 = _4362;
    if (_4292)
    {
        float _4368 = fma(_4332, _4362, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _4364 = _4368;
    }
    float _4370 = _4364;
    float _4372 = _4370;
    if (!_4292)
    {
        _4366 = _4354;
    }
    float _4374 = _4366;
    float _4376 = _4374;
    float _4378 = _4348;
    if (_4292)
    {
        float _4380 = _4348 + (-1.0);
        _4342 = _4380;
    }
    float _4382 = _4342;
    float _4384 = _4382;
    if (_4292)
    {
        float _4386 = _4316 * _4370;
        _4308 = _4386;
    }
    float _4388 = _4308;
    if (!_4292)
    {
        _4372 = _4284;
    }
    float _4390 = _4372;
    float _4392 = _4390;
    if (_4292)
    {
        float _4394 = _4382 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _4384 = _4394;
    }
    float _4396 = _4384;
    float _4398 = _4396;
    if (_4292)
    {
        float _4400 = _4280 * _4388;
        _4358 = _4400;
    }
    float _4402 = _4358;
    if (_4292)
    {
        float _4404 = fma(_4354, _4348, _4396);
        _4376 = _4404;
    }
    float _4406 = _4376;
    if (!_4292)
    {
        _4398 = _4282;
    }
    float _4408 = _4398;
    float _4410 = _4408;
    if (_4292)
    {
        float _4412 = _4282 * _4388;
        _4410 = _4412;
    }
    float _4414 = _4410;
    if (_4292)
    {
        float _4416 = _4402 * _4402;
        _4392 = _4416;
    }
    float _4418 = _4392;
    if (!_4292)
    {
        _4378 = _4286;
    }
    float _4420 = _4378;
    float _4422 = _4246 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _4424 = _4420;
    if (_4292)
    {
        float _4426 = _4414 * _4414;
        _4424 = _4426;
    }
    float _4428 = _4424;
    float _4430 = fma(_4406, _4406, _4418);
    float _4432 = _4246 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _4434 = fma(_3590, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _4436 = _4430 + _4428;
    float _4438 = fma(_4250, (*spvDescriptorSet0.vp_c8)._m0[2].x, _4432);
    float _4440 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _4442 = fma(_4276, (*spvDescriptorSet0.vp_c15)._m0[23].w, _4440);
    float _4444 = precise::clamp(_4442, 0.0, 1.0);
    float _4446 = fma(_4254, (*spvDescriptorSet0.vp_c8)._m0[2].z, _4438);
    float _4448 = rsqrt(_4436);
    float _4450 = -_4444;
    float _4452 = _4450 + 1.0;
    float _4454 = _4446 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _4456 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _4458 = fma(_3618, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _4460 = _4246 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _4462 = _4454 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _4464 = abs(_4452);
    float _4466 = log2(_4464);
    float _4468 = fma(_4250, (*spvDescriptorSet0.vp_c8)._m0[1].x, _4460);
    float _4470 = -_4462;
    float _4472 = fma(_4470, _4456, 1.0);
    float _4474 = _4246 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _4476 = fma(_4254, (*spvDescriptorSet0.vp_c8)._m0[1].z, _4468);
    float _4478 = _4448 * _4402;
    float _4480 = _4448 * _4406;
    float _4482 = fma(_4250, (*spvDescriptorSet0.vp_c8)._m0[0].x, _4474);
    float _4484 = _4448 * _4414;
    float _4486 = fma(_4250, (*spvDescriptorSet0.vp_c8)._m0[3].x, _4422);
    float _4488 = _4478 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _4490 = fma(_4254, (*spvDescriptorSet0.vp_c8)._m0[0].z, _4482);
    float _4492 = _4476 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _4494 = floor(_4434);
    float _4496 = -_4488;
    float _4498 = fma(_4480, (*spvDescriptorSet0.vp_c15)._m0[21].y, _4496);
    float _4500 = _4490 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _4502 = _4492 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _4504 = fma(_4254, (*spvDescriptorSet0.vp_c8)._m0[3].z, _4486);
    float _4506 = -_4484;
    float _4508 = fma(_4506, (*spvDescriptorSet0.vp_c15)._m0[21].z, _4498);
    float _4510 = _4466 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _4512 = fma(_4500, (*spvDescriptorSet0.vp_c8)._m0[7].x, _4502);
    float _4514 = _4504 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _4516 = floor(_4458);
    float _4518 = fma(_4508, -0.5, 0.5);
    float _4520 = fma(_4454, (*spvDescriptorSet0.vp_c8)._m0[7].z, _4512);
    float _4522 = fma(_4508, 0.5, 0.5);
    float _4524 = _4480 + 1.0;
    float _4526 = fma(_4514, (*spvDescriptorSet0.vp_c8)._m0[7].w, _4520);
    float _4528 = _4492 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _4530 = log2(_4472);
    float _4532 = -_4494;
    float _4534 = _4434 + _4532;
    float _4536 = fma(_4500, (*spvDescriptorSet0.vp_c8)._m0[4].x, _4528);
    float _4538 = fma(_4454, (*spvDescriptorSet0.vp_c8)._m0[4].z, _4536);
    float _4540 = 1.0 / _4526;
    float _4542 = _4492 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _4544 = fma(_4522, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _4546 = -_4516;
    float _4548 = _4458 + _4546;
    float _4550 = fma(_4500, (*spvDescriptorSet0.vp_c8)._m0[5].x, _4542);
    float _4552 = fma(_4522, _4544, -0.212114393711090087890625);
    float _4554 = sqrt(_4518);
    float _4556 = fma(_4454, (*spvDescriptorSet0.vp_c8)._m0[5].z, _4550);
    float _4558 = _4530 * 0.693147182464599609375;
    float _4560 = exp2(_4510);
    float _4562 = fma(_4514, (*spvDescriptorSet0.vp_c8)._m0[4].w, _4538);
    float _4564 = fma(_4514, (*spvDescriptorSet0.vp_c8)._m0[5].w, _4556);
    float2 _11850 = float2(_4534, _4548);
    float _4566 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_11850, float2(0.0), isnan(_11850)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_11850, float2(0.0), isnan(_11850)), level(0.0)).x;
    float _4568 = fma(_4522, _4552, 1.570728778839111328125);
    float _4570 = _4562 * _4540;
    float _4572 = _4564 * _4540;
    float _4574 = _4558 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _4576 = _4554 * 0.636619746685028076171875;
    float _4578 = fma(_4570, 0.5, 0.5);
    float _4580 = fma(_4572, -0.5, 0.5);
    float _4582 = -_4568;
    float _4584 = fma(_4576, _4582, 1.0);
    float _4586 = -_4480;
    float _4588 = fma(_4560, _4524, _4586);
    float3 _11893 = float3(_4578, _4580, _4574);
    float _4590 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_11893, float3(0.0), isnan(_11893)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_11893, float3(0.0), isnan(_11893)), level(0.0)).x;
    float3 _11904 = float3(_4578, _4580, _4574);
    float4 _4593 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_11904, float3(0.0), isnan(_11904)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_11904, float3(0.0), isnan(_11904)), level(0.0)).xyzw;
    float _4595 = _4593.x;
    float _4597 = _4593.y;
    float _4599 = _4593.z;
    float _4601 = _4593.w;
    float _4603 = fma(_4588, 0.5, 0.5);
    float2 _11922 = float2(_4584, _4603);
    float3 _4607 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_11922, float2(0.0), isnan(_11922)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_11922, float2(0.0), isnan(_11922)), level(0.0)).xyz;
    float _4609 = _4607.x;
    float _4611 = _4607.y;
    float _4613 = _4607.z;
    float _4615 = _3586 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _4617 = _3586 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _4619 = _4466 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _4621 = _4492 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _4623 = fma(_3590, (*spvDescriptorSet0.vp_c8)._m0[11].x, _4615);
    float _4625 = fma(_3590, (*spvDescriptorSet0.vp_c8)._m0[10].x, _4617);
    float _4627 = in.m_88.x;
    float _4629 = fma(_3618, (*spvDescriptorSet0.vp_c8)._m0[11].z, _4623);
    float _4631 = fma(_3618, (*spvDescriptorSet0.vp_c8)._m0[10].z, _4625);
    float _4633 = exp2(_4619);
    float _4635 = _4629 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _4637 = _4631 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _4639 = fma(_4500, (*spvDescriptorSet0.vp_c8)._m0[6].x, _4621);
    bool _4641 = _4276 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _4643 = isnan(_4276);
    bool _4645 = _4641 || _4643;
    bool _4647 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _4649 = _4645 || _4647;
    float _4651 = _4637 + _4635;
    float _4653 = 1.0 / _4635;
    float _4655 = fma(_4454, (*spvDescriptorSet0.vp_c8)._m0[6].z, _4639);
    float _4657 = fma(_4514, (*spvDescriptorSet0.vp_c8)._m0[6].w, _4655);
    float _4659 = -_4633;
    float _4661 = _4659 + 1.0;
    float _4663 = _4657 + _4526;
    out.gl_Position.x = _4562;
    out.gl_Position.y = _4564;
    out.gl_Position.z = _4657;
    out.gl_Position.w = _4526;
    float _4665 = _4661 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _4667 = _4663 * 0.5;
    float _4669 = _4651 * _4653;
    float _4671 = _4669 * 0.5;
    float _4673 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _4675 = fma(_4671, (*spvDescriptorSet0.vp_c8)._m0[30].w, _4673);
    float _4677 = 1.0 / _4675;
    float _4679 = -_4665;
    float _4681 = _4679 + 1.0;
    float _4683 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _4685 = _4677 * _4683;
    float _4687 = abs(_4685);
    float _4689 = log2(_4687);
    float _4691 = _4689 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _4693 = exp2(_4691);
    float _4695 = fma(_4693, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _4697 = precise::clamp(_4695, 0.0, 1.0);
    bool _4699 = _4685 <= 8000.0;
    bool _4701 = isnan(_4685);
    bool _4703 = _4699 || _4701;
    bool _4705 = isnan(8000.0);
    bool _4707 = _4703 || _4705;
    float _4709 = float(_4707);
    float _4711 = _4562 + _4526;
    float _4713 = fma(_4697, -2.0, 3.0);
    float _4715 = _4697 * _4697;
    float _4717 = _4711 * 0.5;
    float _4719 = _4715 * _4713;
    float _4721 = -_4719;
    float _4723 = _4721 + 1.0;
    float _4725 = fma(_4723, (*spvDescriptorSet0.vp_c15)._m0[654].w, _4719);
    float _4727 = _4526 * 0.5;
    float _4729 = _4709 * _4725;
    float _4731 = fma(_4564, -0.5, _4727);
    float _4733 = _4729 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _4735 = _4729;
    if (!_4649)
    {
        _4735 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _4737 = _4735;
    out.m_90.x = _4717;
    out.m_90.y = _4731;
    out.m_90.z = _4667;
    out.m_90.w = _4526;
    float _4739 = -_4566;
    float _4741 = _4739 + 1.0;
    float _4743 = _4741 * _4733;
    float _4745 = precise::clamp(_4743, 0.0, 1.0);
    float _4747 = -_4745;
    float _4749 = fma(_4747, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _4751 = _4749 * _4627;
    float _4753 = _4665 * _4590;
    float _4755 = _4751 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _4757 = _4601 * _4681;
    float _4759 = _4751;
    float _4761 = _4597;
    float _4763 = _4599;
    float _4765 = _4595;
    float _4767 = _4737;
    float _4769 = _4737;
    if (!_4649)
    {
        _4759 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _4771 = _4759;
    float _4773 = _4601 * _4753;
    out.m_92.x = _4755;
    float _4775 = _4613 * _4753;
    float _4777 = fma(_4609, _4773, _4595);
    float _4779 = fma(_4611, _4773, _4597);
    float _4781 = _4773;
    float _4783 = _4771;
    float _4785 = _4771;
    if (!_4649)
    {
        _4761 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _4787 = _4761;
    float _4789 = fma(_4601, _4775, _4599);
    float _4791 = _4787;
    float _4793 = _4787;
    if (!_4649)
    {
        _4763 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _4795 = _4763;
    float _4797 = _4795;
    float _4799 = _4795;
    if (!_4649)
    {
        _4765 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _4801 = _4765;
    out.m_94.x = _4777;
    out.m_94.y = _4779;
    out.m_94.z = _4789;
    out.m_94.w = _4757;
    float _4803 = _4801;
    float _4805 = _4801;
    if (!_4649)
    {
        _4781 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _4807 = _4781;
    bool _4809 = !_4649;
    float _4811 = _4807;
    float _4813 = _4807;
    if (!_4809)
    {
        bool _4815 = _4276 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _4817 = isnan(_4276);
        bool _4819 = _4815 || _4817;
        bool _4821 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _4823 = _4819 || _4821;
        if (!_4823)
        {
            float _4825 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _4827 = _4276 + _4825;
            float _4829 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _4831 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _4829;
            float _4833 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _4835 = _4833 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _4837 = 1.0 / _4831;
            float _4839 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _4841 = _4839 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _4843 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _4845 = _4843 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _4847 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _4849 = _4847 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _4851 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _4853 = _4851 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _4855 = _4827 * _4837;
            float _4857 = precise::clamp(_4855, 0.0, 1.0);
            float _4859 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _4861 = _4859 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _4863 = fma(_4857, _4835, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _4865 = fma(_4857, _4861, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _4867 = fma(_4857, _4841, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _4869 = fma(_4857, _4845, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _4871 = fma(_4857, _4849, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _4873 = fma(_4857, _4853, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _4793 = _4867;
            _4785 = _4871;
            _4799 = _4863;
            _4769 = _4869;
            _4805 = _4865;
            _4813 = _4873;
            _4875 = true;
        }
        else
        {
            bool _4877 = _4276 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _4879 = isnan(_4276);
            bool _4881 = _4877 || _4879;
            bool _4883 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _4885 = _4881 || _4883;
            if (!_4885)
            {
                _4797 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _4887 = _4797;
            _4799 = _4887;
            if (!_4885)
            {
                _4791 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _4889 = _4791;
            _4793 = _4889;
            if (!_4885)
            {
                _4803 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _4891 = _4803;
            _4805 = _4891;
            if (!_4885)
            {
                _4767 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _4893 = _4767;
            _4769 = _4893;
            if (!_4885)
            {
                _4783 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _4895 = _4783;
            _4785 = _4895;
            if (!_4885)
            {
                _4811 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _4897 = _4811;
            bool _4899 = !_4885;
            _4813 = _4897;
            if (!_4899)
            {
                bool _4901 = _4276 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _4903 = isnan(_4276);
                bool _4905 = _4901 || _4903;
                bool _4907 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _4909 = _4905 || _4907;
                if (!_4909)
                {
                    float _4911 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _4913 = _4276 + _4911;
                    float _4915 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _4917 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _4915;
                    float _4919 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _4921 = _4919 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _4923 = 1.0 / _4917;
                    float _4925 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _4927 = _4925 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _4929 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _4931 = _4929 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _4933 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _4935 = _4933 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _4937 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _4939 = _4937 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _4941 = _4913 * _4923;
                    float _4943 = precise::clamp(_4941, 0.0, 1.0);
                    float _4945 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _4947 = _4945 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _4949 = fma(_4943, _4921, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _4951 = fma(_4943, _4947, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _4953 = fma(_4943, _4927, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _4955 = fma(_4943, _4931, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _4957 = fma(_4943, _4935, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _4959 = fma(_4943, _4939, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _4793 = _4953;
                    _4785 = _4957;
                    _4799 = _4949;
                    _4769 = _4955;
                    _4805 = _4951;
                    _4813 = _4959;
                    _4875 = true;
                }
                else
                {
                    _4793 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _4785 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _4799 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _4769 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _4805 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _4813 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _4875 = false;
    float _4961 = _4793;
    float _4963 = _4785;
    float _4965 = _4799;
    float _4967 = _4769;
    float _4969 = _4805;
    float _4971 = _4813;
    float _4973 = fma(_4022, -0.5, 0.5);
    float _4975 = precise::clamp(_4973, 0.0, 1.0);
    float _4977 = -_4961;
    float _4979 = _4977 + _4963;
    float _4981 = -_4965;
    float _4983 = _4981 + _4967;
    float _4985 = -_4969;
    float _4987 = _4985 + _4971;
    bool _4989 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _4991 = fma(_4975, _4979, _4961);
    float _4993 = fma(_4975, _4983, _4965);
    float _4995 = fma(_4975, _4987, _4969);
    float _4997 = _4991 * 0.586610972881317138671875;
    out.m_96.x = 0.0;
    float _4999 = fma(_4993, 0.298911988735198974609375, _4997);
    float _5001 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _5003 = fma(_4995, 0.114477999508380889892578125, _4999);
    out.m_55.x = _5001;
    float _5005 = -_5003;
    float _5007 = _4993 + _5005;
    float _5009 = -_5003;
    float _5011 = _4991 + _5009;
    float _5013 = -_5003;
    float _5015 = _4995 + _5013;
    float _5017 = fma(_5007, (*spvDescriptorSet0.vp_c13)._m0[1].z, _5003);
    float _5019 = fma(_5011, (*spvDescriptorSet0.vp_c13)._m0[1].z, _5003);
    float _5021 = fma(_5015, (*spvDescriptorSet0.vp_c13)._m0[1].z, _5003);
    out.m_98.x = _5017;
    out.m_98.y = _5019;
    out.m_98.z = _5021;
    if (!_4989)
    {
        return out;
    }
    float _5023 = -_4246;
    float _5025 = _5023 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
    float _5027 = -_4250;
    float _5029 = _5027 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
    float _5031 = -_4254;
    float _5033 = _5031 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
    float _5035 = _5025 * _5025;
    float _5037 = fma(_5029, _5029, _5035);
    float _5039 = fma(_5033, _5033, _5037);
    float _5041 = sqrt(_5039);
    float _5043 = rsqrt(_5039);
    float _5045 = -_5041;
    float _5047 = _5045 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _5049 = _5047 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
    float _5051 = precise::clamp(_5049, 0.0, 1.0);
    float _5053 = _5029 * _5043;
    float _5055 = _5025 * _5043;
    float _5057 = abs(_5051);
    float _5059 = log2(_5057);
    float _5061 = _5033 * _5043;
    float _5063 = _5053 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
    float _5065 = _4022 * _5055;
    float _5067 = -_5055;
    float _5069 = -_5063;
    float _5071 = fma(_5067, (*spvDescriptorSet0.vp_c15)._m0[656].y, _5069);
    float _5073 = fma(_4026, _5053, _5065);
    float _5075 = -_5061;
    float _5077 = fma(_5075, (*spvDescriptorSet0.vp_c15)._m0[656].z, _5071);
    float _5079 = fma(_4028, _5061, _5073);
    float _5081 = precise::clamp(_5079, 0.0, 1.0);
    float _5083 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
    float _5085 = _5077 + _5083;
    float _5087 = _5059 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
    float _5089 = _5085 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
    float _5091 = precise::clamp(_5089, 0.0, 1.0);
    float _5093 = exp2(_5087);
    float _5095 = _5093 * _5091;
    float _5097 = _5081 * _5095;
    float _5099 = _5097 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
    float _5101 = _5097 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
    float _5103 = _5097 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
    out.m_96.x = _5099;
    out.m_96.y = _5101;
    out.m_96.z = _5103;
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
    out.m_66 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_68 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_55 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_98 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_53 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_72 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_90 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_70 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_80 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_74 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_78 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_84 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_86 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_82 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_96 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_92 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_94 = float4(0.0, 0.0, 0.0, 1.0);
    bool _4875 = false;
    bool _4078 = false;
    bool _663 = false;
    bool _519 = false;
    bool _239 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _112 = in.m_48.w;
    float _114 = in.m_50.w;
    float _116 = trunc(_112);
    int _119 = int(_116);
    float _121 = -_114;
    float _123 = _121 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    out.m_53.y = _123;
    bool _127 = _119 >= 1;
    float _129 = 0.0;
    float _131 = as_type<float>(_119);
    float _133 = _123;
    if (!_127)
    {
        _129 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _135 = _129;
    if (!_127)
    {
        out.m_55.x = 0.0;
    }
    int _137 = 0;
    if (!_127)
    {
        float _139 = _135 * 5.0;
        _137 = as_type<int>(_139);
    }
    int _141 = _137;
    int _143 = _141;
    if (!_127)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _5172 = as_type<float>(_141);
        out.gl_Position.z = _5172;
    }
    if (!_127)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_55.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_55.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_55.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_55.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_98.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_98.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_98.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_98.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_90.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_90.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_90.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_90.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 72, as_type<uint>(out.m_96.x)); dm_cw(dm_gs, dm_p, 73, as_type<uint>(out.m_96.y)); dm_cw(dm_gs, dm_p, 74, as_type<uint>(out.m_96.z)); dm_cw(dm_gs, dm_p, 75, as_type<uint>(out.m_96.w)); dm_cw(dm_gs, dm_p, 76, as_type<uint>(out.m_92.x)); dm_cw(dm_gs, dm_p, 77, as_type<uint>(out.m_92.y)); dm_cw(dm_gs, dm_p, 78, as_type<uint>(out.m_92.z)); dm_cw(dm_gs, dm_p, 79, as_type<uint>(out.m_92.w)); dm_cw(dm_gs, dm_p, 80, as_type<uint>(out.m_94.x)); dm_cw(dm_gs, dm_p, 81, as_type<uint>(out.m_94.y)); dm_cw(dm_gs, dm_p, 82, as_type<uint>(out.m_94.z)); dm_cw(dm_gs, dm_p, 83, as_type<uint>(out.m_94.w)); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    bool _145 = _114 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _147 = isnan(_114);
    bool _149 = _145 || _147;
    bool _151 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _153 = _149 || _151;
    float _155 = float(_119);
    bool _157 = _123 >= _155;
    bool _159 = !_153;
    bool _161 = _157 || _159;
    float _163 = 1.0 / _155;
    if (_161)
    {
        _131 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _165 = _131;
    if (_161)
    {
        out.m_55.x = 0.0;
    }
    float _167 = _123 * _163;
    float _169 = _167;
    if (_161)
    {
        float _171 = _165 * 5.0;
        _143 = as_type<int>(_171);
    }
    int _173 = _143;
    out.m_53.x = _167;
    if (_161)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _5235 = as_type<float>(_173);
        out.gl_Position.z = _5235;
    }
    if (_161)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_55.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_55.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_55.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_55.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_98.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_98.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_98.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_98.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_90.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_90.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_90.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_90.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 72, as_type<uint>(out.m_96.x)); dm_cw(dm_gs, dm_p, 73, as_type<uint>(out.m_96.y)); dm_cw(dm_gs, dm_p, 74, as_type<uint>(out.m_96.z)); dm_cw(dm_gs, dm_p, 75, as_type<uint>(out.m_96.w)); dm_cw(dm_gs, dm_p, 76, as_type<uint>(out.m_92.x)); dm_cw(dm_gs, dm_p, 77, as_type<uint>(out.m_92.y)); dm_cw(dm_gs, dm_p, 78, as_type<uint>(out.m_92.z)); dm_cw(dm_gs, dm_p, 79, as_type<uint>(out.m_92.w)); dm_cw(dm_gs, dm_p, 80, as_type<uint>(out.m_94.x)); dm_cw(dm_gs, dm_p, 81, as_type<uint>(out.m_94.y)); dm_cw(dm_gs, dm_p, 82, as_type<uint>(out.m_94.z)); dm_cw(dm_gs, dm_p, 83, as_type<uint>(out.m_94.w)); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _175 = as_type<float>(int(gl_VertexIndex));
    float _177 = in.m_60.x;
    float _179 = in.m_60.y;
    float _181 = in.m_60.z;
    int _183 = as_type<int>(_175) & 1;
    bool _185 = _183 != 0;
    int _187 = as_type<int>(_175) & 2;
    bool _189 = _187 != 0;
    bool _191 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _193 = _179 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _195 = _179 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _197 = _179 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    bool _199 = !_185;
    float _201 = _199 ? (-0.5) : 0.5;
    float _203 = fma(_177, (*spvDescriptorSet0.vp_c10)._m0[4].x, _193);
    float _205 = fma(_177, (*spvDescriptorSet0.vp_c10)._m0[5].x, _195);
    float _207 = fma(_177, (*spvDescriptorSet0.vp_c10)._m0[6].x, _197);
    bool _209 = !_189;
    float _211 = _209 ? (-0.5) : 0.5;
    float _213 = fma(_181, (*spvDescriptorSet0.vp_c10)._m0[4].z, _203);
    float _215 = fma(_181, (*spvDescriptorSet0.vp_c10)._m0[5].z, _205);
    float _217 = fma(_181, (*spvDescriptorSet0.vp_c10)._m0[6].z, _207);
    bool _219 = !_191;
    float _237;
    if (!_219)
    {
        float _221 = in.m_62.x;
        float _223 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _225 = _221 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _227 = fma(_225, (*spvDescriptorSet0.vp_c9)._m0[12].x, _123);
        float _229 = _227 * _223;
        float _231 = floor(_229);
        float _233 = -_231;
        float _235 = _229 + _233;
        _237 = _235;
        _239 = true;
    }
    else
    {
        _237 = _167;
    }
    _239 = false;
    float _241 = _237;
    float _243 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _245 = _241 + _243;
    float _247 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _249 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _247;
    float _251 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _253 = _251 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _255 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _257 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _255;
    float _259 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _261 = _259 + (*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _263 = 1.0 / _249;
    float _265 = -(*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _267 = (*spvDescriptorSet0.vp_c9)._m0[148].w + _265;
    bool _269 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _271 = 1.0 / _253;
    float _273 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _275 = _241 + _273;
    float _277 = 1.0 / _257;
    float _279 = _275 * _263;
    float _281 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _283 = _241 + _281;
    float _285 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _287 = _241 + _285;
    bool _289 = _241 >= (*spvDescriptorSet0.vp_c9)._m0[148].w;
    bool _291 = isnan(_241);
    bool _293 = _289 || _291;
    bool _295 = isnan((*spvDescriptorSet0.vp_c9)._m0[148].w);
    bool _297 = _293 || _295;
    float _299 = float(_297);
    float _301 = 1.0 / _267;
    float _303 = _245 * _271;
    float _305 = -(*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _307 = _241 + _305;
    bool _309 = _241 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _311 = isnan(_241);
    bool _313 = _309 || _311;
    bool _315 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _317 = _313 || _315;
    float _319 = float(_317);
    float _321 = 1.0 / _261;
    float _323 = _283 * _277;
    bool _325 = _241 >= (*spvDescriptorSet0.vp_c9)._m0[147].w;
    bool _327 = isnan(_241);
    bool _329 = _325 || _327;
    bool _331 = isnan((*spvDescriptorSet0.vp_c9)._m0[147].w);
    bool _333 = _329 || _331;
    float _335 = float(_333);
    float _337 = _307 * _301;
    float _339 = -_335;
    float _341 = _339 + 1.0;
    bool _343 = _241 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _345 = isnan(_241);
    bool _347 = _343 || _345;
    bool _349 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _351 = _347 || _349;
    float _353 = float(_351);
    float _355 = -_319;
    float _357 = _355 + 1.0;
    float _359 = _319 * _341;
    bool _361 = _241 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _363 = isnan(_241);
    bool _365 = _361 || _363;
    bool _367 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _369 = _365 || _367;
    float _371 = float(_369);
    float _373 = _353 * _357;
    float _375 = _287 * _321;
    float _377 = -_299;
    float _379 = _377 + 1.0;
    float _381 = -_353;
    float _383 = _381 + 1.0;
    bool _385 = _241 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _387 = isnan(_241);
    bool _389 = _385 || _387;
    bool _391 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _393 = _389 || _391;
    float _395 = float(_393);
    float _397 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _399 = _397 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _401 = _335 * _379;
    float _403 = _371 * _383;
    float _405 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _407 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _405;
    float _409 = -_371;
    float _411 = _409 + 1.0;
    float _413 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _415 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _413;
    float _417 = -_395;
    float _419 = _417 + 1.0;
    float _421 = fma(_407, _279, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _423 = _395 * _411;
    float _425 = fma(_415, _279, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _427 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _429 = _427 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _431 = fma(_399, _303, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _433 = _421 * _423;
    float _435 = _425 * _423;
    float _437 = fma(_429, _303, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _439 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _441 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _439;
    float _443 = fma(_419, (*spvDescriptorSet0.vp_c9)._m0[143].x, _433);
    float _445 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _447 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _445;
    float _449 = fma(_419, (*spvDescriptorSet0.vp_c9)._m0[143].y, _435);
    float _451 = -(*spvDescriptorSet0.vp_c9)._m0[146].x;
    float _453 = _451 + (*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _455 = fma(_441, _323, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _457 = fma(_447, _323, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _459 = -(*spvDescriptorSet0.vp_c9)._m0[146].y;
    float _461 = _459 + (*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _463 = fma(_431, _403, _443);
    float _465 = fma(_437, _403, _449);
    float _467 = fma(_453, _375, (*spvDescriptorSet0.vp_c9)._m0[146].x);
    float _469 = fma(_461, _375, (*spvDescriptorSet0.vp_c9)._m0[146].y);
    float _471 = -(*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _473 = (*spvDescriptorSet0.vp_c9)._m0[148].x + _471;
    float _475 = -(*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _477 = (*spvDescriptorSet0.vp_c9)._m0[148].y + _475;
    float _479 = fma(_455, _373, _463);
    float _481 = fma(_457, _373, _465);
    float _483 = fma(_473, _337, (*spvDescriptorSet0.vp_c9)._m0[147].x);
    float _485 = fma(_477, _337, (*spvDescriptorSet0.vp_c9)._m0[147].y);
    float _487 = fma(_467, _359, _479);
    float _489 = fma(_469, _359, _481);
    float _491 = fma(_483, _401, _487);
    float _493 = fma(_485, _401, _489);
    float _495 = fma(_299, (*spvDescriptorSet0.vp_c9)._m0[148].x, _491);
    float _497 = fma(_299, (*spvDescriptorSet0.vp_c9)._m0[148].y, _493);
    bool _499 = !_269;
    float _517;
    if (!_499)
    {
        float _501 = in.m_62.x;
        float _503 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _505 = _501 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _507 = fma(_505, (*spvDescriptorSet0.vp_c9)._m0[11].y, _123);
        float _509 = _507 * _503;
        float _511 = floor(_509);
        float _513 = -_511;
        float _515 = _509 + _513;
        _517 = _515;
        _519 = true;
    }
    else
    {
        _517 = _167;
    }
    _519 = false;
    float _521 = _517;
    float _523 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _525 = _521 + _523;
    float _527 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _529 = _527 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _531 = _521 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _533 = isnan(_521);
    bool _535 = _531 || _533;
    bool _537 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _539 = _535 || _537;
    float _541 = float(_539);
    float _543 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _545 = _543 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _547 = _521 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _549 = isnan(_521);
    bool _551 = _547 || _549;
    bool _553 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _555 = _551 || _553;
    float _557 = float(_555);
    float _559 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _561 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _559;
    bool _563 = _521 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _565 = isnan(_521);
    bool _567 = _563 || _565;
    bool _569 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _571 = _567 || _569;
    float _573 = float(_571);
    float _575 = 1.0 / _529;
    float _577 = -_541;
    float _579 = _577 + 1.0;
    bool _581 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _583 = 1.0 / _545;
    float _585 = _561 * _575;
    float _587 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _589 = _587 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _591 = -_573;
    float _593 = _591 + 1.0;
    float _595 = fma(_585, _525, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _597 = _557 * _579;
    float _599 = -_557;
    float _601 = _599 + 1.0;
    float _603 = _541 * _593;
    float _605 = _589 * _583;
    float _607 = _595 * _597;
    float _609 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _611 = _521 + _609;
    float _613 = fma(_601, (*spvDescriptorSet0.vp_c9)._m0[115].x, _607);
    float _615 = fma(_605, _611, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _617 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _619 = fma(_615, _603, _613);
    float _621 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _623 = _617 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _625 = fma(_573, (*spvDescriptorSet0.vp_c9)._m0[117].x, _619);
    float _627 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _629 = _621 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _631 = in.m_64.x;
    float _633 = in.m_64.y;
    float _635 = _625 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _637 = _627 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    out.m_66.x = _623;
    out.m_66.y = _629;
    out.m_66.z = _637;
    out.m_66.w = _635;
    float _639 = _497 * _633;
    float _641 = _495 * _631;
    bool _643 = !_581;
    float _661;
    if (!_643)
    {
        float _645 = in.m_62.x;
        float _647 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _649 = _645 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _651 = fma(_649, (*spvDescriptorSet0.vp_c9)._m0[11].w, _123);
        float _653 = _651 * _647;
        float _655 = floor(_653);
        float _657 = -_655;
        float _659 = _653 + _657;
        _661 = _659;
        _663 = true;
    }
    else
    {
        _661 = _167;
    }
    _663 = false;
    float _665 = _661;
    float _667 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _669 = _665 + _667;
    float _671 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _673 = _671 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _675 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _677 = _675 + (*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _679 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _681 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _679;
    bool _683 = _665 >= (*spvDescriptorSet0.vp_c9)._m0[133].w;
    bool _685 = isnan(_665);
    bool _687 = _683 || _685;
    bool _689 = isnan((*spvDescriptorSet0.vp_c9)._m0[133].w);
    bool _691 = _687 || _689;
    float _693 = float(_691);
    float _695 = 1.0 / _673;
    float _697 = -(*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _699 = _697 + (*spvDescriptorSet0.vp_c9)._m0[134].w;
    float _701 = -(*spvDescriptorSet0.vp_c9)._m0[134].w;
    float _703 = _701 + (*spvDescriptorSet0.vp_c9)._m0[135].w;
    bool _705 = _665 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _707 = isnan(_665);
    bool _709 = _705 || _707;
    bool _711 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _713 = _709 || _711;
    float _715 = float(_713);
    bool _717 = _665 >= (*spvDescriptorSet0.vp_c9)._m0[134].w;
    bool _719 = isnan(_665);
    bool _721 = _717 || _719;
    bool _723 = isnan((*spvDescriptorSet0.vp_c9)._m0[134].w);
    bool _725 = _721 || _723;
    float _727 = float(_725);
    float _729 = 1.0 / _677;
    bool _731 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[14].x;
    float _733 = _681 * _695;
    bool _735 = _665 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _737 = isnan(_665);
    bool _739 = _735 || _737;
    bool _741 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _743 = _739 || _741;
    float _745 = float(_743);
    float _747 = 1.0 / _699;
    float _749 = -_693;
    float _751 = _749 + 1.0;
    float _753 = fma(_733, _669, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    float _755 = -(*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _757 = (*spvDescriptorSet0.vp_c9)._m0[134].x + _755;
    float _759 = -_745;
    float _761 = _759 + 1.0;
    float _763 = _745 * _751;
    float _765 = -(*spvDescriptorSet0.vp_c9)._m0[132].x;
    float _767 = _765 + (*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _769 = -_727;
    float _771 = _769 + 1.0;
    float _773 = 1.0 / _703;
    float _775 = _715 * _761;
    float _777 = _767 * _729;
    float _779 = -_715;
    float _781 = _779 + 1.0;
    float _783 = _693 * _771;
    float _785 = _753 * _775;
    float _787 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _789 = _665 + _787;
    float _791 = -(*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _793 = _665 + _791;
    float _795 = _757 * _747;
    bool _797 = _665 >= (*spvDescriptorSet0.vp_c9)._m0[135].w;
    bool _799 = isnan(_665);
    bool _801 = _797 || _799;
    bool _803 = isnan((*spvDescriptorSet0.vp_c9)._m0[135].w);
    bool _805 = _801 || _803;
    float _807 = float(_805);
    float _809 = -(*spvDescriptorSet0.vp_c9)._m0[134].x;
    float _811 = _809 + (*spvDescriptorSet0.vp_c9)._m0[135].x;
    float _813 = fma(_777, _789, (*spvDescriptorSet0.vp_c9)._m0[132].x);
    float _815 = fma(_781, (*spvDescriptorSet0.vp_c9)._m0[131].x, _785);
    float _817 = fma(_795, _793, (*spvDescriptorSet0.vp_c9)._m0[133].x);
    float _819 = -_807;
    float _821 = _819 + 1.0;
    float _823 = -(*spvDescriptorSet0.vp_c9)._m0[134].w;
    float _825 = _665 + _823;
    float _827 = _811 * _773;
    float _829 = fma(_813, _763, _815);
    float _831 = _727 * _821;
    float _833 = fma(_827, _825, (*spvDescriptorSet0.vp_c9)._m0[134].x);
    float _835 = fma(_817, _783, _829);
    float _837 = fma(_833, _831, _835);
    float _839 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _841 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _843 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _845 = fma(_807, (*spvDescriptorSet0.vp_c9)._m0[135].x, _837);
    float _847 = _839 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _849 = _841 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _851 = _843 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _853 = _845 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    out.m_68.x = _847;
    out.m_68.y = _849;
    out.m_68.z = _851;
    out.m_68.w = _853;
    bool _855 = !_731;
    float _857 = _851;
    float _859 = _849;
    if (!_855)
    {
        float _861 = in.m_62.x;
        float _863 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[14].x;
        float _865 = _861 * (*spvDescriptorSet0.vp_c9)._m0[15].x;
        float _867 = fma(_865, (*spvDescriptorSet0.vp_c9)._m0[14].x, _123);
        float _869 = _867 * _863;
        float _871 = floor(_869);
        float _873 = -_871;
        float _875 = _869 + _873;
        _169 = _875;
    }
    float _877 = _169;
    float _879 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _881 = int(_879);
    int _883 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _885 = _883 != 0;
    float _887 = trunc((*spvDescriptorSet0.vp_c9)._m0[40].y);
    int _889 = int(_887);
    float _891 = float(_881);
    float _893 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _895 = int(_893);
    float _897 = (*spvDescriptorSet0.vp_c9)._m0[7].z;
    if (_885)
    {
        _857 = 1.0;
    }
    float _899 = _857;
    float _901 = _899;
    if (_885)
    {
        _897 = 1.0;
    }
    float _903 = _897;
    float _905 = float(_889);
    float _907 = trunc((*spvDescriptorSet0.vp_c9)._m0[49].y);
    int _909 = int(_907);
    float _911 = 1.0 / _891;
    float _913 = float(uint(_895));
    int _915 = ~_895;
    int _917 = _915 + 1;
    float _919 = trunc((*spvDescriptorSet0.vp_c9)._m0[40].x);
    int _921 = int(_919);
    float _923 = float(_909);
    float _925 = 1.0 / _905;
    float _927 = _911 * _123;
    float _929 = float(uint(_921));
    float _931 = 1.0 / _913;
    float _933 = _925 * _123;
    float _935 = trunc(_927);
    int _937 = int(_935);
    float _939 = _891;
    float _941 = _925;
    float _943 = _903;
    if (_885)
    {
        float _945 = in.m_62.x;
        float _947 = in.m_62.y;
        _939 = _945;
        _941 = _947;
    }
    float _949 = _939;
    float _951 = _941;
    float _953 = 1.0 / _923;
    int _955 = as_type<int>(_931) + (-2);
    int _957 = as_type<int>(_931);
    if (_885)
    {
        _957 = 0;
    }
    int _959 = _957;
    float _961 = 1.0 / _929;
    float _963 = float(uint(_937));
    float _965 = as_type<float>(_955) * _963;
    float _967 = trunc(_933);
    int _969 = int(_967);
    float _971 = _953 * _123;
    float _973 = _965;
    float _975 = _949;
    float _977 = _951;
    int _979 = _959;
    if (_885)
    {
        _859 = _949;
    }
    float _981 = _859;
    float _983 = trunc((*spvDescriptorSet0.vp_c9)._m0[49].x);
    int _985 = int(_983);
    int _987 = as_type<int>(_961) + (-2);
    float _989 = float(uint(_969));
    float _991 = trunc(_965);
    float _993 = precise::max(_991, 0.0);
    uint _996 = uint(_993);
    float _998 = as_type<float>(_987) * _989;
    float _1000 = _989;
    float _1002 = _981;
    if (_885)
    {
        _1000 = _981;
    }
    float _1004 = _1000;
    float _1006 = float(uint(_985));
    float _1008 = trunc(_971);
    int _1010 = int(_1008);
    float _1012 = _1006;
    float _1014 = _1004;
    if (_885)
    {
        _973 = _951;
    }
    float _1016 = _973;
    float _1018 = trunc(_998);
    float _1020 = precise::max(_1018, 0.0);
    uint _1022 = uint(_1020);
    int _1024 = _917 * int(_996);
    int _1026 = _1024 + _937;
    float _1028 = 1.0 / _1006;
    float _1030 = _1016;
    if (_885)
    {
        _1012 = _981;
    }
    float _1032 = _1012;
    float _1034 = _1032;
    if (!_885)
    {
        float _1036 = in.m_62.x;
        float _1038 = in.m_62.y;
        float _1040 = in.m_62.z;
        float _1042 = _1036 * 3.1415927410125732421875;
        float _1044 = _1042 * 0.15915493667125701904296875;
        float _1046 = _1038 * 3.1415927410125732421875;
        float _1048 = _1046 * 0.15915493667125701904296875;
        float _1050 = _1044 * 6.283185482025146484375;
        float _1052 = sin(_1050);
        float _1054 = _1048 * 6.283185482025146484375;
        float _1056 = sin(_1054);
        _901 = 7.345489978790283203125;
        _975 = _1036;
        _977 = _1038;
        _943 = 5.839270114898681640625;
        _1014 = _1040;
        _1002 = _1038;
        _1030 = _1056;
        _1034 = _1052;
        _979 = 2;
    }
    float _1058 = _901;
    float _1060 = _975;
    float _1062 = _977;
    float _1064 = _943;
    float _1066 = _1014;
    float _1068 = _1002;
    float _1070 = _1030;
    float _1072 = _1034;
    int _1074 = _979;
    float _1076 = float(uint(_1026));
    float _1078 = _1058 * _1060;
    float _1080 = float(uint(_1010));
    float _1082 = _1060 * 2.0;
    int _1084 = ~_921;
    int _1086 = _1084 + 1;
    float _1088 = as_type<float>(_955) * _1076;
    float _1090 = floor(_1078);
    int _1092 = as_type<int>(_1028) + (-2);
    int _1094 = ~_985;
    int _1096 = _1094 + 1;
    float _1098 = as_type<float>(_1092) * _1080;
    bool _1100 = _1062 > 0.5;
    float _1102 = trunc(_1088);
    float _1104 = precise::max(_1102, 0.0);
    uint _1106 = uint(_1104);
    int _1108 = _1086 * int(_1022);
    int _1110 = _1108 + _969;
    float _1112 = _1064 * _1066;
    int _1114 = ~_985;
    int _1116 = _1114 + 1;
    float _1118 = float(uint(_1110));
    float _1120 = trunc(_1098);
    float _1122 = precise::max(_1120, 0.0);
    uint _1124 = uint(_1122);
    float _1126 = -_1090;
    float _1128 = _1078 + _1126;
    int _1130 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _1132 = _1130 != 0;
    float _1134 = in.m_62.z;
    float _1136 = as_type<float>(_987) * _1118;
    int _1138 = int(_1132);
    int _1140 = _1100 ? 2 : 0;
    int _1142 = _1138 | _1140;
    int _1144 = _191 ? 4 : 0;
    int _1146 = _1142 | _1144;
    int _1148 = false ? 8 : 0;
    int _1150 = _1146 | _1148;
    int _1152 = false ? 16 : 0;
    int _1154 = _1150 | _1152;
    int _1156 = false ? 32 : 0;
    int _1158 = _1154 | _1156;
    int _1160 = false ? 64 : 0;
    int _1162 = _1158 | _1160;
    int _1164 = _1162 & 2;
    bool _1166 = !_1132;
    int _1168 = _1166 ? 0 : 1;
    float _1170 = trunc(_1136);
    float _1172 = precise::max(_1170, 0.0);
    uint _1174 = uint(_1172);
    int _1176 = int(_996) + int(_1106);
    int _1178 = ~_895;
    int _1180 = _1178 + 1;
    float _1182 = float(_895);
    int _1184 = abs(_1168);
    int _1186 = _1180 * _1176;
    int _1188 = _1186 + _937;
    float _1190 = floor(_1112);
    float _1192 = _1128 * _1182;
    int _1194 = _1096 * int(_1124);
    int _1196 = _1194 + _1010;
    float _1198 = _1058 * _1068;
    bool _1200 = uint(_1188) >= uint(_895);
    float _1202 = float(_937);
    float _1204 = trunc(_1192);
    int _1206 = int(_1204);
    float _1208 = float(uint(_1196));
    bool _1210 = _1202 >= _1182;
    bool _1212 = isnan(_1202);
    bool _1214 = _1210 || _1212;
    bool _1216 = isnan(_1182);
    bool _1218 = _1214 || _1216;
    float _1220 = float(_1218);
    bool _1222 = !_1200;
    int _1224 = _1222 ? 0 : (-1);
    float _1226 = as_type<float>(_1092) * _1208;
    bool _1228 = _1134 > 0.5;
    float _1230 = trunc(_1220);
    int _1232 = int(_1230);
    int _1234 = ~_1176;
    int _1236 = _1234 + _1224;
    int _1238 = _1236 + 1;
    float _1240 = -_1190;
    float _1242 = _1112 + _1240;
    int _1244 = int(_1022) + int(_1174);
    int _1246 = ~_921;
    int _1248 = _1246 + 1;
    int _1250 = _895 * _1238;
    int _1252 = _1250 + _937;
    int _1254 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16;
    bool _1256 = _1254 != 0;
    int _1258 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32;
    bool _1260 = _1258 != 0;
    float _1262 = trunc(_1226);
    float _1264 = precise::max(_1262, 0.0);
    uint _1266 = uint(_1264);
    int _1268 = _1206 * _1184;
    int _1270 = _1268 + _937;
    float _1272 = _163 * _123;
    float _1274 = -_211;
    int _1276 = _1228 ? as_type<int>(_1274) : as_type<int>(_211);
    int _1278 = _1248 * _1244;
    int _1280 = _1278 + _969;
    float _1282 = -_201;
    int _1284 = _1100 ? as_type<int>(_1282) : as_type<int>(_201);
    float _1286 = floor(_1198);
    bool _1288 = _895 == 0;
    bool _1290 = !_1260;
    float _1292 = _1290 ? _211 : as_type<float>(_1276);
    float _1294 = _1182 * _1272;
    bool _1296 = !_1256;
    float _1298 = _1296 ? _201 : as_type<float>(_1284);
    int _1300 = ~_1232;
    int _1302 = _1300 + 1;
    int _1304 = _1302 + 1;
    float _1306 = floor(_1082);
    bool _1308 = !_1288;
    int _1310 = _1308 ? _1252 : (-1);
    int _1312 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _1314 = _1312 != 0;
    int _1316 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _1318 = _1316 != 0;
    int _1320 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _1322 = _1320 != 0;
    bool _1324 = uint(_1280) >= uint(_921);
    int _1326 = _1310 * _1304;
    int _1328 = int(_1124) + int(_1266);
    float _1330 = trunc(_1294);
    int _1332 = int(_1330);
    bool _1334 = !_1314;
    int _1336 = _1334 ? 0 : 1;
    float _1338 = -_1286;
    float _1340 = _1198 + _1338;
    bool _1342 = !_1318;
    int _1344 = _1342 ? 0 : 1;
    int _1346 = _1116 * _1328;
    int _1348 = _1346 + _1010;
    float _1350 = float(_921);
    float _1352 = float(_969);
    float _1354 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _1356 = log2(_1354);
    int _1358 = _895 + (-1);
    float _1360 = _1242 * _1350;
    int _1362 = abs(_1336);
    int _1364 = abs(_1344);
    int _1366 = _1232 * _1358;
    int _1368 = _1366 + _1326;
    bool _1370 = _1352 >= _1350;
    bool _1372 = isnan(_1352);
    bool _1374 = _1370 || _1372;
    bool _1376 = isnan(_1350);
    bool _1378 = _1374 || _1376;
    float _1380 = float(_1378);
    float _1382 = _1350 * _1272;
    float _1384 = trunc(_1360);
    int _1386 = int(_1384);
    bool _1388 = !_1324;
    int _1390 = _1388 ? 0 : (-1);
    int _1392 = _1368 * _1364;
    int _1394 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _1396 = _1394 != 0;
    float _1398 = _1356 * _123;
    int _1400 = ~_1244;
    int _1402 = _1400 + _1390;
    int _1404 = _1402 + 1;
    float _1406 = trunc(_1380);
    int _1408 = int(_1406);
    bool _1410 = !_1322;
    int _1412 = _1410 ? 0 : 1;
    int _1414 = _1332 * _1362;
    int _1416 = _1414 + _1392;
    int _1418 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 4096;
    bool _1420 = _1418 != 0;
    int _1422 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 8192;
    bool _1424 = _1422 != 0;
    int _1426 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16384;
    bool _1428 = _1426 != 0;
    int _1430 = _921 * _1404;
    int _1432 = _1430 + _969;
    bool _1434 = !_1396;
    int _1436 = _1434 ? 0 : 1;
    float _1438 = float(_985);
    float _1440 = trunc(_1382);
    int _1442 = int(_1440);
    float _1444 = float(_1010);
    bool _1446 = !_1424;
    int _1448 = _1446 ? 0 : 1;
    float _1450 = _1438 * _1272;
    int _1452 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16384;
    bool _1454 = _1452 != 0;
    float _1456 = _1340 * _1438;
    bool _1458 = _921 == 0;
    int _1460 = abs(_1412);
    float _1462 = trunc(_1450);
    int _1464 = int(_1462);
    bool _1466 = _1444 >= _1438;
    bool _1468 = isnan(_1444);
    bool _1470 = _1466 || _1468;
    bool _1472 = isnan(_1438);
    bool _1474 = _1470 || _1472;
    float _1476 = float(_1474);
    int _1478 = ~_1408;
    int _1480 = _1478 + 1;
    int _1482 = _1480 + 1;
    bool _1484 = !_1458;
    int _1486 = _1484 ? _1432 : (-1);
    bool _1488 = !_1454;
    int _1490 = _1488 ? 0 : 1;
    float _1492 = trunc(_1456);
    int _1494 = int(_1492);
    bool _1496 = uint(_1348) >= uint(_985);
    int _1498 = _1486 * _1482;
    int _1500 = abs(_1436);
    int _1502 = _1270 * _1460;
    int _1504 = _1502 + _1416;
    bool _1506 = !_1496;
    int _1508 = _1506 ? 0 : (-1);
    float _1510 = trunc(_1476);
    int _1512 = int(_1510);
    int _1514 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32768;
    bool _1516 = _1514 != 0;
    int _1518 = ~_1328;
    int _1520 = _1518 + _1508;
    int _1522 = _1520 + 1;
    int _1524 = _1206 * _1500;
    int _1526 = _1524 + _1504;
    int _1528 = abs(_1490);
    bool _1530 = !_1420;
    int _1532 = _1530 ? 0 : 1;
    int _1534 = _985 * _1522;
    int _1536 = _1534 + _1010;
    float _1538 = float(uint(_1526));
    bool _1540 = !_1516;
    int _1542 = _1540 ? 0 : 1;
    int _1544 = abs(_1448);
    int _1546 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32768;
    bool _1548 = _1546 != 0;
    bool _1550 = _1164 != 0;
    int _1552 = abs(_1532);
    float _1554 = as_type<float>(_955) * _1538;
    int _1556 = _921 + (-1);
    int _1558 = _1386 * _1528;
    int _1560 = _1558 + _969;
    bool _1562 = !_1548;
    int _1564 = _1562 ? 0 : 1;
    int _1566 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 65536;
    bool _1568 = _1566 != 0;
    int _1570 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 131072;
    bool _1572 = _1570 != 0;
    int _1574 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 262144;
    bool _1576 = _1574 != 0;
    int _1578 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 524288;
    bool _1580 = _1578 != 0;
    float _1582 = trunc(_1554);
    float _1584 = precise::max(_1582, 0.0);
    uint _1586 = uint(_1584);
    int _1588 = _1408 * _1556;
    int _1590 = _1588 + _1498;
    int _1592 = ~_1512;
    int _1594 = _1592 + 1;
    int _1596 = _1594 + 1;
    bool _1598 = !_1572;
    int _1600 = _1598 ? 0 : 1;
    int _1602 = _1590 * _1544;
    bool _1604 = _985 == 0;
    bool _1606 = !_1428;
    int _1608 = _1606 ? 0 : 1;
    int _1610 = _1442 * _1552;
    int _1612 = _1610 + _1602;
    bool _1614 = !_1604;
    int _1616 = _1614 ? _1536 : (-1);
    int _1618 = ~_895;
    int _1620 = _1618 + 1;
    int _1622 = abs(_1542);
    int _1624 = _1616 * _1596;
    int _1626 = abs(_1608);
    int _1628 = _1620 * int(_1586);
    int _1630 = _1628 + _1526;
    bool _1632 = !_1568;
    int _1634 = _1632 ? 0 : 1;
    int _1636 = _1560 * _1626;
    int _1638 = _1636 + _1612;
    int _1640 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 64;
    bool _1642 = _1640 != 0;
    int _1644 = _985 + (-1);
    int _1646 = _1386 * _1622;
    int _1648 = _1646 + _1638;
    int _1650 = abs(_1564);
    float _1652 = float(uint(_1630));
    int _1654 = _1512 * _1644;
    int _1656 = _1654 + _1624;
    float _1658 = float(uint(_1648));
    int _1660 = _1494 * _1650;
    int _1662 = _1660 + _1010;
    int _1664 = abs(_1600);
    float _1666 = as_type<float>(_955) * _1652;
    int _1668 = abs(_1634);
    float _1670 = as_type<float>(_1612);
    float _1672 = as_type<float>(_1074);
    if (_1642)
    {
        float _1674 = in.m_62.w;
        _1670 = _1674;
    }
    float _1676 = _1670;
    float _1678 = as_type<float>(_987) * _1658;
    bool _1680 = !_1576;
    int _1682 = _1680 ? 0 : 1;
    int _1684 = _1656 * _1664;
    float _1686 = trunc(_1678);
    float _1688 = precise::max(_1686, 0.0);
    uint _1690 = uint(_1688);
    int _1692 = abs(_1682);
    float _1694 = float(uint(_1270));
    int _1696 = _1464 * _1668;
    int _1698 = _1696 + _1684;
    int _1700 = ~_921;
    int _1702 = _1700 + 1;
    float _1704 = trunc(_1666);
    float _1706 = precise::max(_1704, 0.0);
    uint _1708 = uint(_1706);
    float _1710 = as_type<float>(_955) * _1694;
    int _1712 = _1662 * _1692;
    int _1714 = _1712 + _1698;
    bool _1716 = !_1580;
    int _1718 = _1716 ? 0 : 1;
    int _1720 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 128;
    bool _1722 = _1720 != 0;
    int _1724 = _1702 * int(_1690);
    int _1726 = _1724 + _1648;
    int _1728 = ~_895;
    int _1730 = _1728 + 1;
    float _1732 = trunc(_1710);
    float _1734 = precise::max(_1732, 0.0);
    uint _1736 = uint(_1734);
    float _1738 = _1694;
    if (_1642)
    {
        float _1740 = _1676 * 3.1415927410125732421875;
        _1738 = _1740;
    }
    float _1742 = _1738;
    int _1744 = abs(_1718);
    float _1746 = float(uint(_1726));
    float _1748 = _1742;
    if (_1642)
    {
        float _1750 = _1742 * 0.15915493667125701904296875;
        _1748 = _1750;
    }
    float _1752 = _1748;
    int _1754 = int(_1586) + int(_1708);
    int _1756 = ~_895;
    int _1758 = _1756 + 1;
    float _1760 = as_type<float>(_987) * _1746;
    int _1762 = _1494 * _1744;
    int _1764 = _1762 + _1714;
    float _1766 = as_type<float>(_1708);
    if (_1722)
    {
        float _1768 = in.m_62.x;
        _1766 = _1768;
    }
    float _1770 = _1766;
    int _1772 = _1730 * _1754;
    int _1774 = _1772 + _1526;
    float _1776 = _1752;
    if (_1642)
    {
        float _1778 = _1752 * 6.283185482025146484375;
        float _1780 = sin(_1778);
        _1776 = _1780;
    }
    float _1782 = _1776;
    float _1784 = float(uint(_1764));
    bool _1786 = uint(_1774) >= uint(_895);
    int _1788 = _1758 * int(_1736);
    int _1790 = _1788 + _1270;
    bool _1792 = _895 == 0;
    float _1794 = trunc(_1760);
    float _1796 = precise::max(_1794, 0.0);
    uint _1798 = uint(_1796);
    bool _1800 = !_1786;
    int _1802 = _1800 ? 0 : (-1);
    float _1804 = as_type<float>(_1092) * _1784;
    float _1806 = float(uint(_1790));
    int _1808 = ~_1754;
    int _1810 = _1808 + _1802;
    int _1812 = _1810 + 1;
    float _1814 = 0.0;
    bool _1816 = _1786;
    if (!_1642)
    {
        _1814 = _201;
    }
    float _1818 = _1814;
    float _1820 = trunc(_1804);
    float _1822 = precise::max(_1820, 0.0);
    uint _1824 = uint(_1822);
    float _1826 = _1818;
    float _1828 = _1782;
    if (_1642)
    {
        bool _1830 = _1782 > 0.5;
        _1816 = _1830;
    }
    bool _1832 = _1816;
    int _1834 = _895 * _1812;
    int _1836 = _1834 + _1526;
    float _1838 = float(uint(_1560));
    float _1840 = as_type<float>(_955) * _1806;
    if (_1642)
    {
        float _1842 = -_201;
        float _1844 = _1832 ? _1842 : _201;
        _1826 = _1844;
    }
    float _1846 = _1826;
    if (_1722)
    {
        float _1848 = _1770 * 3.1415927410125732421875;
        _1828 = _1848;
    }
    float _1850 = _1828;
    bool _1852 = !_1792;
    int _1854 = _1852 ? _1836 : (-1);
    float _1856 = as_type<float>(_987) * _1838;
    int _1858 = int(_1690) + int(_1798);
    float _1860 = _1850;
    if (_1722)
    {
        float _1862 = _1850 * 0.15915493667125701904296875;
        _1860 = _1862;
    }
    float _1864 = _1860;
    int _1866 = _1854 & 3;
    bool _1868 = _1866 != 0;
    float _1870 = trunc(_1856);
    float _1872 = precise::max(_1870, 0.0);
    uint _1874 = uint(_1872);
    int _1876 = ~_985;
    int _1878 = _1876 + 1;
    int _1880 = _1854 & 3;
    bool _1882 = _1880 != 0;
    int _1884 = _1868 ? 0 : 1;
    int _1886 = _1878 * int(_1824);
    int _1888 = _1886 + _1764;
    int _1890 = ~_921;
    int _1892 = _1890 + 1;
    float _1894 = _1864;
    if (_1722)
    {
        float _1896 = _1864 * 6.283185482025146484375;
        float _1898 = sin(_1896);
        _1894 = _1898;
    }
    float _1900 = _1894;
    bool _1902 = uint(_1880) > 1u;
    float _1904 = float(uint(_1888));
    int _1906 = _1892 * _1858;
    int _1908 = _1906 + _1648;
    float _1910 = -_211;
    int _1912 = _1550 ? as_type<int>(_1910) : as_type<int>(_211);
    int _1914 = ~_921;
    int _1916 = _1914 + 1;
    float _1918 = as_type<float>(_1092) * _1904;
    bool _1920 = uint(_1908) >= uint(_921);
    float _1922 = trunc(_1840);
    float _1924 = precise::max(_1922, 0.0);
    uint _1926 = uint(_1924);
    int _1928 = ~_1884;
    int _1930 = _1928 + 1;
    int _1932 = _1930 + 1;
    int _1934 = _1916 * int(_1874);
    int _1936 = _1934 + _1560;
    float _1938 = 0.0;
    int _1940 = _1932;
    if (!_1722)
    {
        _1938 = _211;
    }
    float _1942 = _1938;
    float _1944 = _1942;
    if (!_1902)
    {
        int _1946 = ~_1884;
        int _1948 = _1946 + 1;
        _1940 = _1948;
    }
    int _1950 = _1940;
    bool _1952 = !_1920;
    int _1954 = _1952 ? 0 : (-1);
    float _1956 = trunc(_1918);
    float _1958 = precise::max(_1956, 0.0);
    uint _1960 = uint(_1958);
    bool _1962 = _1880 != 3;
    bool _1964 = uint(_1880) >= 2u;
    int _1966 = ~_1858;
    int _1968 = _1966 + _1954;
    int _1970 = _1968 + 1;
    int _1972 = _1964 ? 0 : 1;
    bool _1974 = _1964;
    if (_1722)
    {
        bool _1976 = _1900 > 0.5;
        _1974 = _1976;
    }
    bool _1978 = _1974;
    int _1980 = _921 * _1970;
    int _1982 = _1980 + _1648;
    float _1984 = float(uint(_1936));
    if (_1722)
    {
        float _1986 = -_211;
        float _1988 = _1978 ? _1986 : _211;
        _1944 = _1988;
    }
    float _1990 = _1944;
    bool _1992 = !_1458;
    int _1994 = _1992 ? _1982 : (-1);
    float _1996 = as_type<float>(_987) * _1984;
    int _1998 = ~_1972;
    int _2000 = _1998 + 1;
    int _2002 = _2000 + 1;
    int _2004 = _2002;
    if (_1962)
    {
        int _2006 = ~_1972;
        int _2008 = _2006 + 1;
        _2004 = _2008;
    }
    int _2010 = _2004;
    int _2012 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _2014 = _2012 != 0;
    float _2016 = trunc(_1996);
    float _2018 = precise::max(_2016, 0.0);
    uint _2020 = uint(_2018);
    int _2022 = _1994 & 3;
    bool _2024 = _2022 != 0;
    bool _2026 = !_2014;
    float _2028 = _2026 ? _211 : as_type<float>(_1912);
    int _2030 = int(_1736) + int(_1926);
    int _2032 = ~_895;
    int _2034 = _2032 + 1;
    bool _2036 = uint(_2022) > 1u;
    int _2038 = int(_1824) + int(_1960);
    int _2040 = ~_985;
    int _2042 = _2040 + 1;
    int _2044 = _1994 & 3;
    bool _2046 = _2044 != 0;
    int _2048 = _2042 * _2038;
    int _2050 = _2048 + _1764;
    int _2052 = _2046 ? 0 : 1;
    int _2054 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _2056 = _2054 != 0;
    int _2058 = _2034 * _2030;
    int _2060 = _2058 + _1270;
    float _2062 = float(uint(_1662));
    bool _2064 = !_2056;
    int _2066 = _2064 ? 0 : 1;
    bool _2068 = uint(_2050) >= uint(_985);
    float _2070 = as_type<float>(_1092) * _2062;
    int _2072 = ~_2052;
    int _2074 = _2072 + 1;
    int _2076 = _2074 + 1;
    int _2078 = _2076;
    if (!_2036)
    {
        int _2080 = ~_2052;
        int _2082 = _2080 + 1;
        _2078 = _2082;
    }
    int _2084 = _2078;
    float _2086 = trunc(_2070);
    float _2088 = precise::max(_2086, 0.0);
    uint _2090 = uint(_2088);
    bool _2092 = uint(_2060) >= uint(_895);
    bool _2094 = !_2068;
    int _2096 = _2094 ? 0 : (-1);
    bool _2098 = _2022 != 3;
    bool _2100 = !_2092;
    int _2102 = _2100 ? 0 : (-1);
    bool _2104 = uint(_2022) >= 2u;
    int _2106 = ~_2038;
    int _2108 = _2106 + _2096;
    int _2110 = _2108 + 1;
    int _2112 = ~_921;
    int _2114 = _2112 + 1;
    int _2116 = int(_1874) + int(_2020);
    int _2118 = _985 * _2110;
    int _2120 = _2118 + _1764;
    int _2122 = ~_985;
    int _2124 = _2122 + 1;
    float _2126 = _1062 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    int _2128 = _2104 ? 0 : 1;
    int _2130 = _2114 * _2116;
    int _2132 = _2130 + _1560;
    int _2134 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8388608;
    bool _2136 = _2134 != 0;
    int _2138 = ~_2128;
    int _2140 = _2138 + 1;
    int _2142 = _2140 + 1;
    int _2144 = _2142;
    if (_2098)
    {
        int _2146 = ~_2128;
        int _2148 = _2146 + 1;
        _2144 = _2148;
    }
    int _2150 = _2144;
    int _2152 = _2124 * int(_2090);
    int _2154 = _2152 + _1662;
    int _2156 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16777216;
    bool _2158 = _2156 != 0;
    bool _2160 = !_2136;
    int _2162 = _2160 ? 0 : 1;
    bool _2164 = uint(_2132) >= uint(_921);
    bool _2166 = !_1604;
    int _2168 = _2166 ? _2120 : (-1);
    bool _2170 = !_2158;
    int _2172 = _2170 ? 0 : 1;
    bool _2174 = !_2164;
    int _2176 = _2174 ? 0 : (-1);
    int _2178 = _2168 & 3;
    bool _2180 = _2178 != 0;
    int _2182 = _2168 & 3;
    bool _2184 = _2182 != 0;
    float _2186 = float(uint(_2154));
    int _2188 = _2180 ? 0 : 1;
    bool _2190 = uint(_2182) > 1u;
    float _2192 = as_type<float>(_1092) * _2186;
    int _2194 = ~_2188;
    int _2196 = _2194 + 1;
    int _2198 = _2196 + 1;
    float _2200 = trunc(_2192);
    float _2202 = precise::max(_2200, 0.0);
    uint _2204 = uint(_2202);
    float _2206 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _2208 = (*spvDescriptorSet0.vp_c9)._m0[93].w + (*spvDescriptorSet0.vp_c9)._m0[93].y;
    int _2210 = _2198;
    float _2212 = _2192;
    if (!_2190)
    {
        int _2214 = ~_2188;
        int _2216 = _2214 + 1;
        _2210 = _2216;
    }
    int _2218 = _2210;
    float _2220 = fma(_1070, (*spvDescriptorSet0.vp_c9)._m0[93].w, _2208);
    bool _2222 = uint(_2182) >= 2u;
    float _2224 = _1070 * (*spvDescriptorSet0.vp_c9)._m0[92].y;
    int _2226 = ~_985;
    int _2228 = _2226 + 1;
    float _2230 = (*spvDescriptorSet0.vp_c9)._m0[92].x + (*spvDescriptorSet0.vp_c9)._m0[91].z;
    int _2232 = _2222 ? 0 : 1;
    float _2234 = (*spvDescriptorSet0.vp_c9)._m0[87].x + (*spvDescriptorSet0.vp_c9)._m0[86].z;
    bool _2236 = _2182 != 3;
    float _2238 = fma(_123, (*spvDescriptorSet0.vp_c9)._m0[92].w, _2220);
    int _2240 = int(_2090) + int(_2204);
    int _2242 = ~_2232;
    int _2244 = _2242 + 1;
    int _2246 = _2244 + 1;
    int _2248 = _2228 * _2240;
    int _2250 = _2248 + _1662;
    float _2252 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    int _2254 = _2246;
    if (_2236)
    {
        int _2256 = ~_2232;
        int _2258 = _2256 + 1;
        _2254 = _2258;
    }
    int _2260 = _2254;
    float _2262 = (*spvDescriptorSet0.vp_c9)._m0[87].y + (*spvDescriptorSet0.vp_c9)._m0[86].w;
    bool _2264 = uint(_2250) >= uint(_985);
    float _2266 = _1060 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _2268 = (*spvDescriptorSet0.vp_c9)._m0[88].z + (*spvDescriptorSet0.vp_c9)._m0[88].x;
    float _2270 = -_2206;
    float _2272 = fma(_2266, 2.0, _2270);
    float _2274 = fma(_1060, (*spvDescriptorSet0.vp_c9)._m0[88].z, _2268);
    bool _2276 = !_2264;
    int _2278 = _2276 ? 0 : (-1);
    float _2280 = -_123;
    float _2282 = fma(_2280, (*spvDescriptorSet0.vp_c9)._m0[76].x, _2272);
    bool _2284 = _1060 > 0.5;
    float _2286 = (*spvDescriptorSet0.vp_c9)._m0[93].z + (*spvDescriptorSet0.vp_c9)._m0[93].x;
    float _2288 = -(*spvDescriptorSet0.vp_c9)._m0[159].w;
    float _2290 = _2288 + (*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _2292 = -_201;
    int _2294 = _2284 ? as_type<int>(_2292) : as_type<int>(_201);
    float _2296 = fma(_1072, (*spvDescriptorSet0.vp_c9)._m0[93].z, _2286);
    bool _2298 = _1074 != 2;
    float _2300 = _1072 * (*spvDescriptorSet0.vp_c9)._m0[92].x;
    float _2302 = -(*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _2304 = _2302 + (*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _2306 = exp2(_1398);
    float _2308 = fma(_123, (*spvDescriptorSet0.vp_c9)._m0[92].z, _2296);
    float _2310 = -_2230;
    float _2312 = fma(_2300, 2.0, _2310);
    float _2314 = -_123;
    float _2316 = fma(_2314, (*spvDescriptorSet0.vp_c9)._m0[91].x, _2312);
    float _2318 = (*spvDescriptorSet0.vp_c9)._m0[88].w + (*spvDescriptorSet0.vp_c9)._m0[88].y;
    float _2320 = 1.0 / _2290;
    if (_2298)
    {
        _2212 = _1060;
    }
    float _2322 = _2212;
    float _2324 = fma(_1062, (*spvDescriptorSet0.vp_c9)._m0[88].w, _2318);
    float _2326 = _2322;
    if (_2298)
    {
        _1672 = _1062;
    }
    float _2328 = _1672;
    float _2330 = -(*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _2332 = _2330 + (*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _2334 = _2328;
    if (!_2298)
    {
        _2326 = _1134;
    }
    float _2336 = _2326;
    float _2338 = -_2306;
    float _2340 = _2338 + 1.0;
    if (!_2298)
    {
        _2334 = _1060;
    }
    float _2342 = _2334;
    float _2344 = 1.0 / _2304;
    int _2346 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _2348 = _2346 != 0;
    float _2350 = fma(_2126, -2.0, _2252);
    float _2352 = _2342 * (*spvDescriptorSet0.vp_c9)._m0[87].y;
    bool _2354 = !_2348;
    float _2356 = _2354 ? _201 : as_type<float>(_2294);
    float _2358 = fma(_123, (*spvDescriptorSet0.vp_c9)._m0[76].y, _2350);
    bool _2360 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _2362 = isnan(0.0);
    bool _2364 = _2360 || _2362;
    bool _2366 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _2368 = _2364 || _2366;
    float _2370 = (*spvDescriptorSet0.vp_c9)._m0[92].y + (*spvDescriptorSet0.vp_c9)._m0[91].w;
    float _2372 = fma(_2352, -2.0, _2262);
    float _2374 = _2368 ? _2340 : 0.0;
    float _2376 = fma(_2224, -2.0, _2370);
    bool _2378 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _2380 = isnan(1.0);
    bool _2382 = _2378 || _2380;
    bool _2384 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _2386 = _2382 || _2384;
    float _2388 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _2390 = 1.0 + _2388;
    float _2392 = _2336 * (*spvDescriptorSet0.vp_c9)._m0[87].x;
    float _2394 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _2396 = 1.0 / _2390;
    float _2398 = -_2234;
    float _2400 = fma(_2392, 2.0, _2398);
    float _2402 = fma(_123, (*spvDescriptorSet0.vp_c9)._m0[91].y, _2376);
    float _2404 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _2406 = in.m_48.x;
    float _2408 = in.m_48.y;
    float _2410 = in.m_48.z;
    float _2412 = fma(_1062, (*spvDescriptorSet0.vp_c9)._m0[78].w, _2394);
    float _2414 = fma(_123, (*spvDescriptorSet0.vp_c9)._m0[87].w, _2324);
    float _2416 = fma(_1060, (*spvDescriptorSet0.vp_c9)._m0[78].z, _2404);
    float _2418 = -_123;
    float _2420 = fma(_2418, (*spvDescriptorSet0.vp_c9)._m0[86].x, _2400);
    float _2422 = fma(_123, (*spvDescriptorSet0.vp_c9)._m0[77].w, _2412);
    float _2424 = fma(_123, (*spvDescriptorSet0.vp_c9)._m0[86].y, _2372);
    float _2426 = fma(_123, (*spvDescriptorSet0.vp_c9)._m0[77].z, _2416);
    float _2428 = fma(_123, (*spvDescriptorSet0.vp_c9)._m0[87].z, _2274);
    float _2430 = _1062 * 2.0;
    float _2432 = 1.0 / _2332;
    if (_2386)
    {
        float _2434 = _2374 * _2396;
        _133 = _2434;
    }
    float _2436 = _133;
    bool _2438 = _1306 >= 0.0;
    bool _2440 = isnan(_1306);
    bool _2442 = _2438 || _2440;
    bool _2444 = isnan(0.0);
    bool _2446 = _2442 || _2444;
    float _2448 = -(*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _2450 = _2448 + (*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _2452 = -(*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _2454 = _2452 + (*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _2456 = -(*spvDescriptorSet0.vp_c9)._m0[159].x;
    float _2458 = (*spvDescriptorSet0.vp_c9)._m0[160].x + _2456;
    int _2460 = _2446 ? 0 : 1;
    float _2462 = floor(_2430);
    bool _2464 = _1306 > 0.0;
    float _2466 = -(*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _2468 = _2466 + (*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _2470 = _2458 * _2320;
    float _2472 = _2408 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _2474 = _2408 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _2476 = _2408 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _2478 = 1.0 / _2454;
    int _2480 = ~_2460;
    int _2482 = _2480 + 1;
    int _2484 = _2482 + 1;
    float _2486 = fma(_2406, (*spvDescriptorSet0.vp_c10)._m0[4].x, _2472);
    float _2488 = fma(_2406, (*spvDescriptorSet0.vp_c10)._m0[5].x, _2474);
    float _2490 = fma(_2406, (*spvDescriptorSet0.vp_c10)._m0[6].x, _2476);
    float _2492 = -(*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _2494 = _2492 + (*spvDescriptorSet0.vp_c9)._m0[166].w;
    int _2496 = _2484;
    if (!_2464)
    {
        int _2498 = ~_2460;
        int _2500 = _2498 + 1;
        _2496 = _2500;
    }
    int _2502 = _2496;
    float _2504 = -(*spvDescriptorSet0.vp_c9)._m0[160].x;
    float _2506 = _2504 + (*spvDescriptorSet0.vp_c9)._m0[161].x;
    float _2508 = 1.0 / _2468;
    bool _2510 = _2462 >= 0.0;
    bool _2512 = isnan(_2462);
    bool _2514 = _2510 || _2512;
    bool _2516 = isnan(0.0);
    bool _2518 = _2514 || _2516;
    float _2520 = -_2308;
    float _2522 = _2520 + 1.0;
    float _2524 = _2506 * _2344;
    int _2526 = _2518 ? 0 : 1;
    float _2528 = -_2422;
    float _2530 = _2528 + 1.0;
    bool _2532 = _2462 > 0.0;
    float _2534 = 1.0 / _2450;
    float _2536 = -_2428;
    float _2538 = _2536 + 1.0;
    bool _2540 = _877 >= (*spvDescriptorSet0.vp_c9)._m0[166].w;
    bool _2542 = isnan(_877);
    bool _2544 = _2540 || _2542;
    bool _2546 = isnan((*spvDescriptorSet0.vp_c9)._m0[166].w);
    bool _2548 = _2544 || _2546;
    float _2550 = float(_2548);
    float _2552 = -_2414;
    float _2554 = _2552 + 1.0;
    bool _2556 = _877 >= (*spvDescriptorSet0.vp_c9)._m0[163].w;
    bool _2558 = isnan(_877);
    bool _2560 = _2556 || _2558;
    bool _2562 = isnan((*spvDescriptorSet0.vp_c9)._m0[163].w);
    bool _2564 = _2560 || _2562;
    float _2566 = float(_2564);
    float _2568 = -(*spvDescriptorSet0.vp_c9)._m0[161].x;
    float _2570 = (*spvDescriptorSet0.vp_c9)._m0[162].x + _2568;
    float _2572 = -(*spvDescriptorSet0.vp_c9)._m0[162].x;
    float _2574 = _2572 + (*spvDescriptorSet0.vp_c9)._m0[163].x;
    float _2576 = 1.0 / _2494;
    int _2578 = ~_2030;
    int _2580 = _2578 + _2102;
    int _2582 = _2580 + 1;
    float _2584 = _2570 * _2478;
    float _2586 = _1134 * 2.0;
    float _2588 = _2574 * _2432;
    int _2590 = ~_2116;
    int _2592 = _2590 + _2176;
    int _2594 = _2592 + 1;
    float _2596 = -(*spvDescriptorSet0.vp_c9)._m0[163].x;
    float _2598 = (*spvDescriptorSet0.vp_c9)._m0[164].x + _2596;
    int _2600 = ~_2526;
    int _2602 = _2600 + 1;
    int _2604 = _2602 + 1;
    float _2606 = floor(_2586);
    int _2608 = _2604;
    if (!_2532)
    {
        int _2610 = ~_2526;
        int _2612 = _2610 + 1;
        _2608 = _2612;
    }
    int _2614 = _2608;
    int _2616 = _921 * _2594;
    int _2618 = _2616 + _1560;
    float _2620 = _2598 * _2508;
    float _2622 = -(*spvDescriptorSet0.vp_c9)._m0[164].x;
    float _2624 = _2622 + (*spvDescriptorSet0.vp_c9)._m0[165].x;
    bool _2626 = _877 >= (*spvDescriptorSet0.vp_c9)._m0[164].w;
    bool _2628 = isnan(_877);
    bool _2630 = _2626 || _2628;
    bool _2632 = isnan((*spvDescriptorSet0.vp_c9)._m0[164].w);
    bool _2634 = _2630 || _2632;
    float _2636 = float(_2634);
    int _2638 = _895 * _2582;
    int _2640 = _2638 + _1270;
    bool _2642 = !_1458;
    int _2644 = _2642 ? _2618 : (-1);
    float _2646 = -(*spvDescriptorSet0.vp_c9)._m0[165].x;
    float _2648 = (*spvDescriptorSet0.vp_c9)._m0[166].x + _2646;
    int _2650 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _2652 = _2650 != 0;
    int _2654 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _2656 = _2654 != 0;
    int _2658 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _2660 = _2658 != 0;
    float _2662 = _2624 * _2534;
    bool _2664 = _877 >= (*spvDescriptorSet0.vp_c9)._m0[165].w;
    bool _2666 = isnan(_877);
    bool _2668 = _2664 || _2666;
    bool _2670 = isnan((*spvDescriptorSet0.vp_c9)._m0[165].w);
    bool _2672 = _2668 || _2670;
    float _2674 = float(_2672);
    float _2676 = -_2550;
    float _2678 = _2676 + 1.0;
    bool _2680 = !_1882;
    int _2682 = _2680 ? 0 : 1;
    float _2684 = fma(_2410, (*spvDescriptorSet0.vp_c10)._m0[6].z, _2490);
    bool _2686 = _2606 >= 0.0;
    bool _2688 = isnan(_2606);
    bool _2690 = _2686 || _2688;
    bool _2692 = isnan(0.0);
    bool _2694 = _2690 || _2692;
    float _2696 = _2648 * _2576;
    int _2698 = _1994 >> 31;
    float _2700 = -_2674;
    float _2702 = _2700 + 1.0;
    float _2704 = _2674 * _2678;
    int _2706 = _2694 ? 0 : 1;
    float _2708 = -(*spvDescriptorSet0.vp_c9)._m0[159].w;
    float _2710 = _877 + _2708;
    bool _2712 = _2606 > 0.0;
    float _2714 = -_2636;
    float _2716 = _2714 + 1.0;
    bool _2718 = _877 >= (*spvDescriptorSet0.vp_c9)._m0[162].w;
    bool _2720 = isnan(_877);
    bool _2722 = _2718 || _2720;
    bool _2724 = isnan((*spvDescriptorSet0.vp_c9)._m0[162].w);
    bool _2726 = _2722 || _2724;
    float _2728 = float(_2726);
    float _2730 = _2636 * _2702;
    int _2732 = _2698 & 3;
    float _2734 = fma(_2410, (*spvDescriptorSet0.vp_c10)._m0[4].z, _2486);
    float _2736 = fma(_2410, (*spvDescriptorSet0.vp_c10)._m0[5].z, _2488);
    float _2738 = fma(_2470, _2710, (*spvDescriptorSet0.vp_c9)._m0[159].x);
    float _2740 = _2566 * _2716;
    float _2742 = -_2566;
    float _2744 = _2742 + 1.0;
    bool _2746 = _877 >= (*spvDescriptorSet0.vp_c9)._m0[161].w;
    bool _2748 = isnan(_877);
    bool _2750 = _2746 || _2748;
    bool _2752 = isnan((*spvDescriptorSet0.vp_c9)._m0[161].w);
    bool _2754 = _2750 || _2752;
    float _2756 = float(_2754);
    float _2758 = -(*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _2760 = _877 + _2758;
    int _2762 = _1994 + _2732;
    float _2764 = -_2728;
    float _2766 = _2764 + 1.0;
    float _2768 = _2728 * _2744;
    float _2770 = fma(_2524, _2760, (*spvDescriptorSet0.vp_c9)._m0[160].x);
    int _2772 = _2762 >> 2;
    float _2774 = _2756 * _2766;
    bool _2776 = _877 >= (*spvDescriptorSet0.vp_c9)._m0[160].w;
    bool _2778 = isnan(_877);
    bool _2780 = _2776 || _2778;
    bool _2782 = isnan((*spvDescriptorSet0.vp_c9)._m0[160].w);
    bool _2784 = _2780 || _2782;
    float _2786 = float(_2784);
    float _2788 = -_2756;
    float _2790 = _2788 + 1.0;
    float _2792 = -(*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _2794 = _877 + _2792;
    float _2796 = -(*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _2798 = _877 + _2796;
    int _2800 = _2772 << 4;
    int _2802 = _2800 + 656;
    float _2804 = _2786 * _2790;
    bool _2806 = _877 >= (*spvDescriptorSet0.vp_c9)._m0[159].w;
    bool _2808 = isnan(_877);
    bool _2810 = _2806 || _2808;
    bool _2812 = isnan((*spvDescriptorSet0.vp_c9)._m0[159].w);
    bool _2814 = _2810 || _2812;
    float _2816 = float(_2814);
    float _2818 = -_2786;
    float _2820 = _2818 + 1.0;
    float _2822 = fma(_2584, _2794, (*spvDescriptorSet0.vp_c9)._m0[161].x);
    float _2824 = fma(_2588, _2798, (*spvDescriptorSet0.vp_c9)._m0[162].x);
    float _2826 = -(*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _2828 = _877 + _2826;
    uint _2830 = uint(int(uint(_2802) >> uint(2)));
    uint _2832 = uint(int(uint(int(_2830)) >> uint(2)));
    int _2834 = int(_2830) & 3;
    float _2836 = (*spvDescriptorSet0.vp_c9)._m0[int(_2832)][_2834];
    int _2838 = int(_2830) + 1;
    uint _2840 = uint(int(uint(_2838) >> uint(2)));
    int _2842 = _2838 & 3;
    float _2844 = (*spvDescriptorSet0.vp_c9)._m0[int(_2840)][_2842];
    float _2846 = _2816 * _2820;
    float _2848 = -(*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _2850 = _877 + _2848;
    float _2852 = -_2816;
    float _2854 = _2852 + 1.0;
    float _2856 = -(*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _2858 = _877 + _2856;
    float _2860 = _2738 * _2846;
    float _2862 = fma(_2620, _2828, (*spvDescriptorSet0.vp_c9)._m0[163].x);
    float _2864 = _2734 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    int _2866 = _2802 + 8;
    uint _2868 = uint(int(uint(_2866) >> uint(2)));
    uint _2870 = uint(int(uint(int(_2868)) >> uint(2)));
    int _2872 = int(_2868) & 3;
    float _2874 = (*spvDescriptorSet0.vp_c9)._m0[int(_2870)][_2872];
    int _2876 = int(_2868) + 1;
    uint _2878 = uint(int(uint(_2876) >> uint(2)));
    int _2880 = _2876 & 3;
    float _2882 = (*spvDescriptorSet0.vp_c9)._m0[int(_2878)][_2880];
    float _2884 = fma(_2854, (*spvDescriptorSet0.vp_c9)._m0[159].x, _2860);
    float _2886 = fma(_2696, _2858, (*spvDescriptorSet0.vp_c9)._m0[165].x);
    float _2888 = _2736 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    int _2890 = ~_2706;
    int _2892 = _2890 + 1;
    int _2894 = _2892 + 1;
    float _2896 = fma(_2770, _2804, _2884);
    int _2898 = _2894;
    if (!_2712)
    {
        int _2900 = ~_2706;
        int _2902 = _2900 + 1;
        _2898 = _2902;
    }
    int _2904 = _2898;
    float _2906 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2908 = _2888 + _2906;
    float _2910 = fma(_2662, _2850, (*spvDescriptorSet0.vp_c9)._m0[164].x);
    float _2912 = fma(_2822, _2774, _2896);
    float _2914 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2916 = _2864 + _2914;
    float _2918 = _2908 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _2920 = _1062 + _1060;
    bool _2922 = !_2024;
    int _2924 = _2922 ? 0 : 1;
    float _2926 = _1060 + _1134;
    bool _2928 = _2022 != 3;
    float _2930 = fma(_2916, (*spvDescriptorSet0.vp_c8)._m0[28].x, _2918);
    float _2932 = _1060 + (-0.5);
    float _2934 = _2920 + (-1.0);
    float _2936 = fma(_2824, _2768, _2912);
    float _2938 = _1062 + _1134;
    float _2940 = _1062 + (-0.5);
    float _2942 = fma(_2934, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _2944 = _1846 + 0.5;
    float _2946 = fma(_2862, _2740, _2936);
    int _2948 = abs(_2084);
    float _2950 = _2684 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _2952 = fma(_2944, (*spvDescriptorSet0.vp_c9)._m0[95].x, _2316);
    int _2954 = abs(_2150);
    float _2956 = fma(_2910, _2730, _2946);
    float _2958 = trunc((*spvDescriptorSet0.vp_c9)._m0[90].z);
    int _2960 = int(_2958);
    bool _2962 = !_2928;
    int _2964 = _2962 ? 0 : (-1);
    float _2966 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2968 = _2950 + _2966;
    int _2970 = abs(_2924);
    int _2972 = ~_2948;
    int _2974 = _2972 + 1;
    int _2976 = _2974 + 1;
    float _2978 = fma(_2968, (*spvDescriptorSet0.vp_c8)._m0[28].z, _2930);
    int _2980 = abs(_2964);
    int _2982 = ~_2970;
    int _2984 = _2982 + 1;
    int _2986 = _2984 + 1;
    int _2988 = _2976 * as_type<int>(_2844);
    float _2990 = _1990 + (-0.5);
    bool _2992 = _2978 >= 0.0;
    int _2994 = _2986 * as_type<int>(_2836);
    int _2996 = _2994 + _2988;
    int _2998 = ~_2954;
    int _3000 = _2998 + 1;
    int _3002 = _3000 + 1;
    float _3004 = -_2990;
    float _3006 = -_2402;
    float _3008 = fma(_3004, (*spvDescriptorSet0.vp_c9)._m0[95].y, _3006);
    int _3010 = abs(_2162);
    float _3012 = _2356 + 0.5;
    float _3014 = float(uint(_2960));
    int _3016 = _3002 * as_type<int>(_2874);
    int _3018 = _3016 + _2996;
    int _3020 = ~_2980;
    int _3022 = _3020 + 1;
    int _3024 = _3022 + 1;
    float _3026 = _2028 + (-0.5);
    int _3028 = ~_3010;
    int _3030 = _3028 + 1;
    int _3032 = _3030 + 1;
    float _3034 = fma(_3012, (*spvDescriptorSet0.vp_c9)._m0[80].x, _2282);
    float _3036 = 1.0 / _3014;
    int _3038 = _3024 * as_type<int>(_2882);
    int _3040 = _3038 + _3018;
    int _3042 = abs(_2960);
    float _3044 = -_3026;
    float _3046 = -_2358;
    float _3048 = fma(_3044, (*spvDescriptorSet0.vp_c9)._m0[80].y, _3046);
    int _3050 = _1854 >> 31;
    int _3052 = _3040 * _3032;
    int _3054 = _3050 & 3;
    int _3056 = _2644 * _3010;
    int _3058 = _3056 + _3052;
    float _3060 = float(uint(_3042));
    float _3062 = fma(_2028, _2530, _3048);
    float _3064 = _3012;
    if (_2992)
    {
        _3064 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _3066 = _3064;
    float _3068 = fma(_2886, _2704, _2956);
    int _3070 = _1854 + _3054;
    int _3072 = as_type<int>(_3066);
    if (_2992)
    {
        out.m_55.x = 0.0;
    }
    int _3074 = as_type<int>(_3036) + (-2);
    if (_2992)
    {
        float _3076 = _3066 * 5.0;
        _3072 = as_type<int>(_3076);
    }
    int _3078 = _3072;
    float _3080 = float(uint(_3058));
    float _3082 = 1.0 / _3060;
    int _3084 = _2168 >> 31;
    float _3086 = fma(_2550, (*spvDescriptorSet0.vp_c9)._m0[166].x, _3068);
    if (_2992)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _9486 = as_type<float>(_3078);
        out.gl_Position.z = _9486;
    }
    float _3088 = as_type<float>(_3074) * _3080;
    int _3090 = _3084 & 3;
    float _3092 = _2908 * _2908;
    bool _3094 = !_2652;
    int _3096 = _3094 ? 0 : 1;
    out.m_70.x = _3086;
    int _3098 = _2168 + _3090;
    int _3100 = _3070 >> 2;
    int _3102 = ~_2240;
    int _3104 = _3102 + _2278;
    int _3106 = _3104 + 1;
    float _3108 = -_2522;
    float _3110 = fma(_3108, _1846, _2952);
    float _3112 = -_2426;
    float _3114 = _3112 + 1.0;
    float _3116 = trunc(_3088);
    float _3118 = precise::max(_3116, 0.0);
    uint _3120 = uint(_3118);
    float _3122 = -_2238;
    float _3124 = _3122 + 1.0;
    int _3126 = ~_2960;
    int _3128 = _3126 + 1;
    float _3130 = -_3114;
    float _3132 = fma(_2356, _3130, _3034);
    int _3134 = abs(_3058);
    float _3136 = fma(_3124, _1990, _3008);
    int _3138 = as_type<int>(_3082) + (-2);
    float _3140 = fma(_2916, _2916, _3092);
    float _3142 = float(uint(_3134));
    out.m_72.x = _3132;
    out.m_72.y = _3062;
    int _3144 = _3098 >> 2;
    float _3146 = fma(_2968, _2968, _3140);
    int _3148 = _3100 << 4;
    int _3150 = _3148 + 368;
    float _3152 = as_type<float>(_3138) * _3142;
    int _3154 = _3144 << 4;
    int _3156 = _3154 + 800;
    out.m_74.x = _3110;
    out.m_74.y = _3136;
    int _3158 = _3128 * int(_3120);
    int _3160 = _3158 + _3058;
    uint _3162 = uint(int(uint(_3150) >> uint(2)));
    uint _3164 = uint(int(uint(int(_3162)) >> uint(2)));
    int _3166 = int(_3162) & 3;
    float _3168 = (*spvDescriptorSet0.vp_c9)._m0[int(_3164)][_3166];
    int _3170 = int(_3162) + 1;
    uint _3172 = uint(int(uint(_3170) >> uint(2)));
    int _3174 = _3170 & 3;
    float _3176 = (*spvDescriptorSet0.vp_c9)._m0[int(_3172)][_3174];
    int _3178 = _985 * _3106;
    int _3180 = _3178 + _1662;
    float _3182 = trunc(_3152);
    float _3184 = precise::max(_3182, 0.0);
    uint _3186 = uint(_3184);
    int _3188 = abs(_1950);
    float _3190 = float(uint(_3160));
    int _3192 = abs(_2218);
    uint _3194 = uint(int(uint(_3156) >> uint(2)));
    uint _3196 = uint(int(uint(int(_3194)) >> uint(2)));
    int _3198 = int(_3194) & 3;
    float _3200 = (*spvDescriptorSet0.vp_c9)._m0[int(_3196)][_3198];
    int _3202 = int(_3194) + 1;
    uint _3204 = uint(int(uint(_3202) >> uint(2)));
    int _3206 = _3202 & 3;
    float _3208 = (*spvDescriptorSet0.vp_c9)._m0[int(_3204)][_3206];
    int _3210 = abs(_3096);
    float _3212 = as_type<float>(_3074) * _3190;
    int _3214 = ~_3042;
    int _3216 = _3214 + 1;
    float _3218 = rsqrt(_3146);
    float _3220 = float(_2904);
    float _3222 = float(_3210);
    int _3224 = ~_3188;
    int _3226 = _3224 + 1;
    int _3228 = _3226 + 1;
    int _3230 = _3216 * int(_3186);
    int _3232 = _3230 + _3134;
    float _3234 = trunc(_3212);
    float _3236 = precise::max(_3234, 0.0);
    uint _3238 = uint(_3236);
    float _3240 = _3222 * _3220;
    int _3242 = ~_3192;
    int _3244 = _3242 + 1;
    int _3246 = _3244 + 1;
    int _3248 = _3150 + 8;
    uint _3250 = uint(int(uint(_3248) >> uint(2)));
    uint _3252 = uint(int(uint(int(_3250)) >> uint(2)));
    int _3254 = int(_3250) & 3;
    float _3256 = (*spvDescriptorSet0.vp_c9)._m0[int(_3252)][_3254];
    int _3258 = int(_3250) + 1;
    uint _3260 = uint(int(uint(_3258) >> uint(2)));
    int _3262 = _3258 & 3;
    float _3264 = (*spvDescriptorSet0.vp_c9)._m0[int(_3260)][_3262];
    float _3266 = float(uint(_3232));
    bool _3268 = !_2184;
    int _3270 = _3268 ? 0 : 1;
    float _3272 = _2908 * _3218;
    bool _3274 = _1880 != 3;
    float _3276 = as_type<float>(_3138) * _3266;
    int _3278 = abs(_3270);
    int _3280 = _3156 + 8;
    uint _3282 = uint(int(uint(_3280) >> uint(2)));
    uint _3284 = uint(int(uint(int(_3282)) >> uint(2)));
    int _3286 = int(_3282) & 3;
    float _3288 = (*spvDescriptorSet0.vp_c9)._m0[int(_3284)][_3286];
    int _3290 = int(_3282) + 1;
    uint _3292 = uint(int(uint(_3290) >> uint(2)));
    int _3294 = _3290 & 3;
    float _3296 = (*spvDescriptorSet0.vp_c9)._m0[int(_3292)][_3294];
    int _3298 = ~_3042;
    int _3300 = _3298 + 1;
    float _3302 = _2916 * _3218;
    int _3304 = ~_3278;
    int _3306 = _3304 + 1;
    int _3308 = _3306 + 1;
    float _3310 = trunc(_3276);
    float _3312 = precise::max(_3310, 0.0);
    uint _3314 = uint(_3312);
    int _3316 = int(_3120) + int(_3238);
    float _3318 = -_3272;
    float _3320 = fma(_3318, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2908);
    int _3322 = ~_2960;
    int _3324 = _3322 + 1;
    float _3326 = -_3302;
    float _3328 = fma(_3326, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2916);
    bool _3330 = _895 == 0;
    float _3332 = _3320 * _3320;
    bool _3334 = !_1604;
    int _3336 = _3334 ? _3180 : (-1);
    int _3338 = _3324 * _3316;
    int _3340 = _3338 + _3058;
    bool _3342 = !_3330;
    int _3344 = _3342 ? _2640 : (-1);
    float _3346 = fma(_3328, _3328, _3332);
    int _3348 = _3228 * as_type<int>(_3176);
    int _3350 = abs(_2682);
    int _3352 = int(_3186) + int(_3314);
    int _3354 = ~_3350;
    int _3356 = _3354 + 1;
    int _3358 = _3356 + 1;
    int _3360 = _3246 * as_type<int>(_3208);
    bool _3362 = !_3274;
    int _3364 = _3362 ? 0 : (-1);
    int _3366 = _3300 * _3352;
    int _3368 = _3366 + _3134;
    bool _3370 = uint(_3340) >= uint(_2960);
    int _3372 = _3358 * as_type<int>(_3168);
    int _3374 = _3372 + _3348;
    int _3376 = abs(_2010);
    int _3378 = _3308 * as_type<int>(_3200);
    int _3380 = _3378 + _3360;
    bool _3382 = !_3370;
    int _3384 = _3382 ? 0 : (-1);
    bool _3386 = _2182 != 3;
    int _3388 = ~_3316;
    int _3390 = _3388 + _3384;
    int _3392 = _3390 + 1;
    bool _3394 = !_3386;
    int _3396 = _3394 ? 0 : (-1);
    bool _3398 = uint(_3368) >= uint(_3042);
    int _3400 = ~_3376;
    int _3402 = _3400 + 1;
    int _3404 = _3402 + 1;
    int _3406 = abs(_3364);
    int _3408 = _2960 * _3392;
    int _3410 = _3408 + _3058;
    bool _3412 = !_3398;
    int _3414 = _3412 ? 0 : (-1);
    int _3416 = _3404 * as_type<int>(_3256);
    int _3418 = _3416 + _3374;
    bool _3420 = _2960 == 0;
    int _3422 = abs(_2260);
    bool _3424 = !_3420;
    int _3426 = _3424 ? _3410 : (-1);
    bool _3428 = _2960 == 0;
    int _3430 = ~_3422;
    int _3432 = _3430 + 1;
    int _3434 = _3432 + 1;
    int _3436 = _3058 ^ _2960;
    float _3438 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].z;
    int _3440 = ~_3406;
    int _3442 = _3440 + 1;
    int _3444 = _3442 + 1;
    int _3446 = _3434 * as_type<int>(_3288);
    int _3448 = _3446 + _3380;
    int _3450 = abs(_3396);
    uint _3452 = uint(int(uint(_3436) >> uint(31)));
    int _3454 = _3444 * as_type<int>(_3264);
    int _3456 = _3454 + _3418;
    float _3458 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].w;
    int _3460 = ~_3414;
    int _3462 = _3352 + _3460;
    int _3464 = _3462 + 1;
    int _3466 = ~int(_3452);
    int _3468 = _3466 + 1;
    int _3470 = abs(_2066);
    int _3472 = ~_3450;
    int _3474 = _3472 + 1;
    int _3476 = _3474 + 1;
    float _3478 = _3438 * (*spvDescriptorSet0.vp_c9)._m0[90].x;
    int _3480 = _3464 ^ _3468;
    int _3482 = ~_3470;
    int _3484 = _3482 + 1;
    int _3486 = _3484 + 1;
    int _3488 = _3476 * as_type<int>(_3296);
    int _3490 = _3488 + _3448;
    int _3492 = abs(_2172);
    float _3494 = in.m_76.x;
    float _3496 = in.m_76.y;
    float _3498 = in.m_76.z;
    int _3500 = ~_3468;
    int _3502 = _3500 + _3480;
    int _3504 = _3502 + 1;
    int _3506 = _3456 * _3486;
    float _3508 = float(_3426);
    int _3510 = ~_3492;
    int _3512 = _3510 + 1;
    int _3514 = _3512 + 1;
    int _3516 = _3344 * _3470;
    int _3518 = _3516 + _3506;
    bool _3520 = !_3428;
    int _3522 = _3520 ? _3504 : (-1);
    float _3524 = fma(_3478, _3508, _2420);
    float _3526 = _1298 + 0.5;
    int _3528 = _3490 * _3514;
    float _3530 = float(_3522);
    float _3532 = _3458 * (*spvDescriptorSet0.vp_c9)._m0[90].y;
    float _3534 = fma(_3478, _3526, _3524);
    int _3536 = _3336 * _3492;
    int _3538 = _3536 + _3528;
    float _3540 = float(_3518);
    float _3542 = -_2424;
    float _3544 = fma(_3532, _3530, _3542);
    float _3546 = _1292 + (-0.5);
    float _3548 = -_2538;
    float _3550 = fma(_1298, _3548, _3534);
    float _3552 = _3240 * (-2.0);
    out.m_78.x = _3540;
    float _3554 = -_3532;
    float _3556 = fma(_3554, _3546, _3544);
    float _3558 = float(_3538);
    float _3560 = _2968 * _3218;
    float _3562 = fma(_2942, _3552, _2942);
    float _3564 = fma(_1292, _2554, _3556);
    float _3566 = fma(_3552, _3494, _3494);
    bool _3568 = !_2656;
    int _3570 = _3568 ? 0 : 1;
    out.m_78.w = _3558;
    float _3572 = -_3560;
    float _3574 = fma(_3572, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2968);
    bool _3576 = !_2660;
    int _3578 = _3576 ? 0 : 1;
    out.m_80.x = _3550;
    out.m_80.y = _3564;
    int _3580 = abs(_3570);
    float _3582 = _3498;
    if (_2992)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_55.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_55.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_55.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_55.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_98.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_98.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_98.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_98.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_90.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_90.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_90.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_90.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 72, as_type<uint>(out.m_96.x)); dm_cw(dm_gs, dm_p, 73, as_type<uint>(out.m_96.y)); dm_cw(dm_gs, dm_p, 74, as_type<uint>(out.m_96.z)); dm_cw(dm_gs, dm_p, 75, as_type<uint>(out.m_96.w)); dm_cw(dm_gs, dm_p, 76, as_type<uint>(out.m_92.x)); dm_cw(dm_gs, dm_p, 77, as_type<uint>(out.m_92.y)); dm_cw(dm_gs, dm_p, 78, as_type<uint>(out.m_92.z)); dm_cw(dm_gs, dm_p, 79, as_type<uint>(out.m_92.w)); dm_cw(dm_gs, dm_p, 80, as_type<uint>(out.m_94.x)); dm_cw(dm_gs, dm_p, 81, as_type<uint>(out.m_94.y)); dm_cw(dm_gs, dm_p, 82, as_type<uint>(out.m_94.z)); dm_cw(dm_gs, dm_p, 83, as_type<uint>(out.m_94.w)); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _3584 = -_3272;
    float _3586 = fma(_3584, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2888);
    float _3588 = -_3302;
    float _3590 = fma(_3588, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2864);
    float _3592 = float(_2502);
    float _3594 = fma(_2932, (*spvDescriptorSet0.vp_c9)._m0[196].x, _3566);
    float _3596 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _3598 = _3586 + _3596;
    float _3600 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _3602 = _3590 + _3600;
    float _3604 = float(_3580);
    float _3606 = fma(_3562, _2436, _3594);
    float _3608 = _3598 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _3610 = _2938 + (-1.0);
    float _3612 = _3604 * _3592;
    float _3614 = fma(_3602, (*spvDescriptorSet0.vp_c8)._m0[28].x, _3608);
    float _3616 = -_3560;
    float _3618 = fma(_3616, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2950);
    int _3620 = abs(_3578);
    float _3622 = _3612 * (-2.0);
    float _3624 = fma(_3610, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _3626 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _3628 = _3618 + _3626;
    float _3630 = float(_2614);
    float _3632 = fma(_3574, _3574, _3346);
    float _3634 = float(_3620);
    float _3636 = fma(_3628, (*spvDescriptorSet0.vp_c8)._m0[28].z, _3614);
    float _3638 = fma(_3622, _3496, _3496);
    float _3640 = fma(_3624, _3622, _3624);
    float _3642 = _3606 * 0.15915493667125701904296875;
    float _3644 = _3634 * _3630;
    bool _3646 = _3636 >= 0.0;
    float _3648 = fma(_2940, (*spvDescriptorSet0.vp_c9)._m0[196].y, _3638);
    float _3650 = _3644 * (-2.0);
    float _3652 = _2926 + (-1.0);
    float _3654 = fma(_3640, _2436, _3648);
    float _3656 = _1134 + (-0.5);
    float _3658 = fma(_3650, _3498, _3498);
    float _3660 = sqrt(_3632);
    float _3662 = _3654 * 0.15915493667125701904296875;
    float _3664 = fma(_3652, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _3666 = fma(_3656, (*spvDescriptorSet0.vp_c9)._m0[196].z, _3658);
    if (_3646)
    {
        _3582 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _3668 = _3582;
    float _3670 = fma(_3664, _3650, _3664);
    float _3672 = _3642 * 6.283185482025146484375;
    float _3674 = sin(_3672);
    int _3676 = as_type<int>(_3668);
    if (_3646)
    {
        out.m_55.x = 0.0;
    }
    if (_3646)
    {
        float _3678 = _3668 * 5.0;
        _3676 = as_type<int>(_3678);
    }
    int _3680 = _3676;
    float _3682 = fma(_3670, _2436, _3666);
    if (_3646)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _10360 = as_type<float>(_3680);
        out.gl_Position.z = _10360;
    }
    float _3684 = _3642 * 6.283185482025146484375;
    float _3686 = cos(_3684);
    float _3688 = _3682 * 0.15915493667125701904296875;
    float _3690 = _3662 * 6.283185482025146484375;
    float _3692 = sin(_3690);
    float _3694 = _3662 * 6.283185482025146484375;
    float _3696 = cos(_3694);
    if (_3646)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_55.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_55.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_55.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_55.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_98.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_98.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_98.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_98.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_90.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_90.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_90.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_90.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 72, as_type<uint>(out.m_96.x)); dm_cw(dm_gs, dm_p, 73, as_type<uint>(out.m_96.y)); dm_cw(dm_gs, dm_p, 74, as_type<uint>(out.m_96.z)); dm_cw(dm_gs, dm_p, 75, as_type<uint>(out.m_96.w)); dm_cw(dm_gs, dm_p, 76, as_type<uint>(out.m_92.x)); dm_cw(dm_gs, dm_p, 77, as_type<uint>(out.m_92.y)); dm_cw(dm_gs, dm_p, 78, as_type<uint>(out.m_92.z)); dm_cw(dm_gs, dm_p, 79, as_type<uint>(out.m_92.w)); dm_cw(dm_gs, dm_p, 80, as_type<uint>(out.m_94.x)); dm_cw(dm_gs, dm_p, 81, as_type<uint>(out.m_94.y)); dm_cw(dm_gs, dm_p, 82, as_type<uint>(out.m_94.z)); dm_cw(dm_gs, dm_p, 83, as_type<uint>(out.m_94.w)); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _3698 = _3688 * 6.283185482025146484375;
    float _3700 = cos(_3698);
    float _3702 = _3218 * _3660;
    float _3704 = _639 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _3706 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _211);
    float _3708 = _3686 * _3696;
    float _3710 = _3686 * _3692;
    float _3712 = _3702 * _3704;
    float _3714 = _3674 * _3696;
    float _3716 = _3688 * 6.283185482025146484375;
    float _3718 = sin(_3716);
    float _3720 = _211 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _3722 = _3706 * _3712;
    float _3724 = _641 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _3726 = _3674 * _3692;
    float _3728 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _201);
    float _3730 = _3702 * _3724;
    float _3732 = _3686 * _3700;
    float _3734 = _3696 * _3700;
    float _3736 = _3674 * _3700;
    float _3738 = _3728 * _3730;
    float _3740 = _3732 * _3722;
    float _3742 = _3692 * _3700;
    float _3744 = _3702 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _3746 = _3744 * 0.5;
    float _3748 = fma(_3718, _3708, _3726);
    float _3750 = -_3714;
    float _3752 = fma(_3718, _3710, _3750);
    float _3754 = -_3722;
    float _3756 = _3718 * _3754;
    float _3758 = -_3710;
    float _3760 = fma(_3718, _3714, _3758);
    float _3762 = fma(_3748, _3738, _3740);
    float _3764 = _3736 * _3722;
    float _3766 = fma(_3734, _3738, _3756);
    float _3768 = fma(_3718, _3726, _3708);
    float _3770 = fma(_3752, _3746, _3762);
    float _3772 = fma(_3760, _3738, _3764);
    float _3774 = fma(_3742, _3746, _3766);
    float _3776 = _3748 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _3778 = _3770 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _3780 = _3770 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _3782 = fma(_3768, _3746, _3772);
    float _3784 = _3770 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _3786 = fma(_3774, (*spvDescriptorSet0.vp_c8)._m0[24].x, _3778);
    float _3788 = fma(_3774, (*spvDescriptorSet0.vp_c8)._m0[26].x, _3780);
    float _3790 = fma(_3734, (*spvDescriptorSet0.vp_c8)._m0[26].x, _3776);
    float _3792 = fma(_3774, (*spvDescriptorSet0.vp_c8)._m0[25].x, _3784);
    float _3794 = fma(_3782, (*spvDescriptorSet0.vp_c8)._m0[24].z, _3786);
    float _3796 = fma(_3782, (*spvDescriptorSet0.vp_c8)._m0[26].z, _3788);
    float _3798 = _3752 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _3800 = fma(_3782, (*spvDescriptorSet0.vp_c8)._m0[25].z, _3792);
    float _3802 = _3794 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _3804 = _3796 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _3806 = _3748 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _3808 = _3800 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _3810 = _2864 + _3802;
    float _3812 = _2950 + _3804;
    float _3814 = fma(_3734, (*spvDescriptorSet0.vp_c8)._m0[25].x, _3806);
    float _3816 = _3732 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _3818 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _3820 = _3810 + _3818;
    float _3822 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _3824 = _3812 + _3822;
    float _3826 = _3732 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _3828 = _3748 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _3830 = _3820 * _3820;
    float _3832 = _3824 * _3824;
    float _3834 = _3732 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _3836 = -_3718;
    float _3838 = fma(_3836, (*spvDescriptorSet0.vp_c8)._m0[24].x, _3816);
    float _3840 = -_3718;
    float _3842 = fma(_3840, (*spvDescriptorSet0.vp_c8)._m0[25].x, _3826);
    float _3844 = _3830 + _3832;
    float _3846 = fma(_3734, (*spvDescriptorSet0.vp_c8)._m0[24].x, _3828);
    float _3848 = -_3718;
    float _3850 = fma(_3848, (*spvDescriptorSet0.vp_c8)._m0[26].x, _3834);
    float _3852 = fma(_3720, _3720, 1.0);
    float _3854 = sqrt(_3844);
    float _3856 = _3752 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _3858 = _3752 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _3860 = _2888 + _3808;
    float _3862 = fma(_3742, (*spvDescriptorSet0.vp_c8)._m0[26].x, _3798);
    float _3864 = fma(_3742, (*spvDescriptorSet0.vp_c8)._m0[24].x, _3856);
    float _3866 = fma(_3742, (*spvDescriptorSet0.vp_c8)._m0[25].x, _3858);
    float _3868 = rsqrt(_3852);
    bool _3870 = _3854 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _3872 = _3742;
    float _3874 = _3856;
    float _3876 = _3826;
    float _3878 = _3852;
    float _3880 = _3858;
    if (!_3870)
    {
        _3872 = _3832;
    }
    float _3882 = _3872;
    float _3884 = _3882;
    if (!_3870)
    {
        _3874 = _3830;
    }
    float _3886 = _3874;
    float _3888 = _3886;
    if (!_3870)
    {
        _3876 = _3810;
    }
    float _3890 = _3876;
    float _3892 = _3890;
    if (!_3870)
    {
        _3878 = _3812;
    }
    float _3894 = _3878;
    float _3896 = _3894;
    if (!_3870)
    {
        _3880 = _3860;
    }
    float _3898 = _3880;
    bool _3900 = !_3870;
    float _3902 = _3898;
    if (!_3900)
    {
        float _3904 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _3906 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _3908 = _3854 + _3906;
        float _3910 = rsqrt(_3844);
        float _3912 = _3908 * _3904;
        float _3914 = _3860 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _3916 = _3912 * 0.15915493667125701904296875;
        float _3918 = _3916 * 6.283185482025146484375;
        float _3920 = sin(_3918);
        float _3922 = _3916 * 6.283185482025146484375;
        float _3924 = cos(_3922);
        float _3926 = fma(_3920, _3914, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _3928 = _3910 * _3926;
        float _3930 = _3924 + (-1.0);
        float _3932 = fma(_3820, _3928, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _3934 = fma(_3824, _3928, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _3936 = _3930 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _3938 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _3940 = _3932 + _3938;
        float _3942 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _3944 = _3934 + _3942;
        float _3946 = fma(_3860, _3924, _3936);
        float _3948 = _3940 * _3940;
        float _3950 = _3944 * _3944;
        _3902 = _3946;
        _3888 = _3948;
        _3884 = _3950;
        _3892 = _3932;
        _3896 = _3934;
    }
    float _3952 = _3902;
    float _3954 = _3888;
    float _3956 = _3884;
    float _3958 = _3892;
    float _3960 = _3896;
    float _3962 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _3964 = _3952 + _3962;
    float _3966 = fma(_3736, (*spvDescriptorSet0.vp_c8)._m0[24].z, _3838);
    float _3968 = fma(_3736, (*spvDescriptorSet0.vp_c8)._m0[25].z, _3842);
    float _3970 = fma(_3736, (*spvDescriptorSet0.vp_c8)._m0[26].z, _3850);
    float _3972 = fma(_3964, _3964, _3954);
    float _3974 = fma(_3768, (*spvDescriptorSet0.vp_c8)._m0[24].z, _3864);
    float _3976 = fma(_3768, (*spvDescriptorSet0.vp_c8)._m0[25].z, _3866);
    float _3978 = fma(_3768, (*spvDescriptorSet0.vp_c8)._m0[26].z, _3862);
    float _3980 = _3972 + _3956;
    float _3982 = _3720 * _3868;
    float _3984 = fma(_3760, (*spvDescriptorSet0.vp_c8)._m0[24].z, _3846);
    float _3986 = _201 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _3988 = _3720 * _3966;
    float _3990 = fma(_3760, (*spvDescriptorSet0.vp_c8)._m0[25].z, _3814);
    float _3992 = _3720 * _3968;
    float _3994 = fma(_3760, (*spvDescriptorSet0.vp_c8)._m0[26].z, _3790);
    float _3996 = _3720 * _3970;
    float _3998 = -_3974;
    float _4000 = _3982 * _3998;
    float _4002 = -_3976;
    float _4004 = _3982 * _4002;
    float _4006 = -_3978;
    float _4008 = _3982 * _4006;
    float _4010 = fma(_3986, _3984, _3988);
    float _4012 = sqrt(_3980);
    float _4014 = fma(_3986, _3990, _3992);
    float _4016 = fma(_3986, _3994, _3996);
    float _4018 = fma(_3868, _3966, _4000);
    float _4020 = fma(_3868, _3968, _4004);
    float _4022 = _3976 + _4014;
    float _4024 = fma(_3868, _3970, _4008);
    float _4026 = _3974 + _4010;
    float _4028 = _3978 + _4016;
    out.m_82.x = _3984;
    out.m_82.y = _3990;
    out.m_82.z = _3994;
    out.m_84.x = _4018;
    out.m_84.y = _4020;
    out.m_84.z = _4024;
    bool _4030 = _4012 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _4032 = isnan(_4012);
    bool _4034 = _4030 || _4032;
    bool _4036 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _4038 = _4034 || _4036;
    out.m_86.x = _4026;
    out.m_86.y = _4022;
    out.m_86.z = _4028;
    float _4040 = _3980;
    float _4042 = _3986;
    if (!_4038)
    {
        _4040 = 1.0;
    }
    float _4044 = _4040;
    bool _4046 = !_4038;
    float _4048 = _4044;
    if (!_4046)
    {
        bool _4050 = _4012 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _4052 = isnan(_4012);
        bool _4054 = _4050 || _4052;
        bool _4056 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _4058 = _4054 || _4056;
        if (!_4058)
        {
            float _4060 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _4062 = _4012 + _4060;
            float _4064 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _4066 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _4064;
            float _4068 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _4070 = _4068 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _4072 = 1.0 / _4066;
            float _4074 = _4062 * _4072;
            float _4076 = fma(_4074, _4070, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _4048 = _4076;
            _4042 = _4066;
            _4078 = true;
        }
        else
        {
            bool _4080 = _4012 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _4082 = isnan(_4012);
            bool _4084 = _4080 || _4082;
            bool _4086 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _4088 = _4084 || _4086;
            if (!_4088)
            {
                float _4090 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _4092 = _4012 + _4090;
                float _4094 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _4096 = _4094 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _4098 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _4100 = _4098 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _4102 = 1.0 / _4096;
                float _4104 = _4092 * _4102;
                float _4106 = fma(_4104, _4100, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _4048 = _4106;
                _4042 = _4096;
                _4078 = true;
            }
            else
            {
                _4048 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _4078 = false;
    float _4108 = _4048;
    float _4110 = _4042;
    float _4112 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _4114 = _3952 + _4112;
    float _4116 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _4118 = _3958 + _4116;
    float _4120 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _4122 = _3960 + _4120;
    float _4124 = fma(_4114, _4108, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _4126 = fma(_4118, _4108, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _4128 = fma(_4122, _4108, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _4130 = -_2888;
    float _4132 = _4130 + _4124;
    float _4134 = -_2864;
    float _4136 = _4134 + _4126;
    float _4138 = -_2950;
    float _4140 = _4138 + _4128;
    float _4142 = _4132 * _4132;
    float _4144 = fma(_4136, _4136, _4142);
    float _4146 = fma(_4140, _4140, _4144);
    float _4148 = sqrt(_4146);
    bool _4150 = _4148 > 0.0;
    float _4152 = _4122;
    float _4154 = _4110;
    float _4156 = _4148;
    float _4158 = _4118;
    float _4160 = _4140;
    if (!_4150)
    {
        _4152 = _4126;
    }
    float _4162 = _4152;
    float _4164 = _4162;
    if (!_4150)
    {
        _4154 = _4124;
    }
    float _4166 = _4154;
    float _4168 = _4166;
    float _4170 = _4166;
    if (!_4150)
    {
        _4156 = _4128;
    }
    float _4172 = _4156;
    bool _4174 = !_4150;
    float _4176 = _4172;
    if (!_4174)
    {
        float _4178 = _215 * _215;
        float _4180 = fma(_213, _213, _4178);
        float _4182 = fma(_217, _217, _4180);
        float _4184 = rsqrt(_4146);
        float _4186 = sqrt(_4182);
        float _4188 = _4136 * _4184;
        float _4190 = _4132 * _4184;
        float _4192 = _4140 * _4184;
        bool _4194 = _4186 > 0.0;
        float _4196 = _4186;
        float _4198 = _4184;
        _4158 = _4182;
        _4160 = _4192;
        if (!_4194)
        {
            _4196 = _4126;
        }
        float _4200 = _4196;
        _4164 = _4200;
        if (!_4194)
        {
            _4168 = _4124;
        }
        float _4202 = _4168;
        _4170 = _4202;
        if (!_4194)
        {
            _4198 = _4128;
        }
        float _4204 = _4198;
        bool _4206 = !_4194;
        _4176 = _4204;
        if (!_4206)
        {
            float _4208 = rsqrt(_4182);
            float _4210 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].z;
            float _4212 = _215 * _4208;
            float _4214 = _213 * _4208;
            float _4216 = _4190 * _4212;
            float _4218 = _217 * _4208;
            float _4220 = fma(_4188, _4214, _4216);
            float _4222 = _4210 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _4224 = fma(_4192, _4218, _4220);
            float _4226 = _4224 * _4222;
            float _4228 = fma(_213, _4226, _4126);
            float _4230 = fma(_215, _4226, _4124);
            float _4232 = fma(_217, _4226, _4128);
            _4170 = _4230;
            _4164 = _4228;
            _4176 = _4232;
            _4158 = _4208;
        }
    }
    float _4234 = _4170;
    float _4236 = _4164;
    float _4238 = _4176;
    float _4240 = _4158;
    float _4242 = _4160;
    float _4244 = -_3272;
    float _4246 = fma(_4244, (*spvDescriptorSet0.vp_c9)._m0[18].w, _4234);
    float _4248 = -_3302;
    float _4250 = fma(_4248, (*spvDescriptorSet0.vp_c9)._m0[18].w, _4236);
    float _4252 = -_3560;
    float _4254 = fma(_4252, (*spvDescriptorSet0.vp_c9)._m0[18].w, _4238);
    float _4256 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _4258 = _4246 + _4256;
    float _4260 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _4262 = _4250 + _4260;
    float _4264 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _4266 = _4254 + _4264;
    float _4268 = _4258 * _4258;
    float _4270 = fma(_4262, _4262, _4268);
    float _4272 = fma(_4266, _4266, _4270);
    float _4274 = rsqrt(_4272);
    float _4276 = sqrt(_4272);
    float _4278 = _4274 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _4280 = _4262 * _4278;
    float _4282 = _4266 * _4278;
    float _4284 = _4280 * _4280;
    float _4286 = _4282 * _4282;
    float _4288 = _4284 + _4286;
    float _4290 = sqrt(_4288);
    bool _4292 = _4290 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _4294 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _4296 = _4290 + _4294;
    float _4298 = _4266;
    float _4300 = _4234;
    float _4302 = _4296;
    float _4304 = _4240;
    float _4306 = _4258;
    float _4308 = _4242;
    if (_4292)
    {
        float _4310 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _4298 = _4310;
    }
    float _4312 = _4298;
    if (_4292)
    {
        float _4314 = rsqrt(_4288);
        _4300 = _4314;
    }
    float _4316 = _4300;
    if (_4292)
    {
        float _4318 = _4296 * _4312;
        _4302 = _4318;
    }
    float _4320 = _4302;
    if (_4292)
    {
        float _4322 = _4320 * 0.15915493667125701904296875;
        _4304 = _4322;
    }
    float _4324 = _4304;
    float _4326 = _4270;
    if (_4292)
    {
        float _4328 = _4324 * 6.283185482025146484375;
        float _4330 = sin(_4328);
        _4326 = _4330;
    }
    float _4332 = _4326;
    float _4334 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _4336 = precise::max(0.0, _4334);
    float _4338 = _4274;
    float _4340 = _4336;
    float _4342 = _4334;
    if (_4292)
    {
        float _4344 = _4324 * 6.283185482025146484375;
        float _4346 = cos(_4344);
        _4338 = _4346;
    }
    float _4348 = _4338;
    float _4350 = -_4278;
    float _4352 = -_4336;
    float _4354 = fma(_4258, _4350, _4352);
    if (!_4292)
    {
        _4306 = _4280;
    }
    float _4356 = _4306;
    float _4358 = _4356;
    if (_4292)
    {
        float _4360 = _4354 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _4340 = _4360;
    }
    float _4362 = _4340;
    float _4364 = _4332;
    float _4366 = _4362;
    if (_4292)
    {
        float _4368 = fma(_4332, _4362, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _4364 = _4368;
    }
    float _4370 = _4364;
    float _4372 = _4370;
    if (!_4292)
    {
        _4366 = _4354;
    }
    float _4374 = _4366;
    float _4376 = _4374;
    float _4378 = _4348;
    if (_4292)
    {
        float _4380 = _4348 + (-1.0);
        _4342 = _4380;
    }
    float _4382 = _4342;
    float _4384 = _4382;
    if (_4292)
    {
        float _4386 = _4316 * _4370;
        _4308 = _4386;
    }
    float _4388 = _4308;
    if (!_4292)
    {
        _4372 = _4284;
    }
    float _4390 = _4372;
    float _4392 = _4390;
    if (_4292)
    {
        float _4394 = _4382 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _4384 = _4394;
    }
    float _4396 = _4384;
    float _4398 = _4396;
    if (_4292)
    {
        float _4400 = _4280 * _4388;
        _4358 = _4400;
    }
    float _4402 = _4358;
    if (_4292)
    {
        float _4404 = fma(_4354, _4348, _4396);
        _4376 = _4404;
    }
    float _4406 = _4376;
    if (!_4292)
    {
        _4398 = _4282;
    }
    float _4408 = _4398;
    float _4410 = _4408;
    if (_4292)
    {
        float _4412 = _4282 * _4388;
        _4410 = _4412;
    }
    float _4414 = _4410;
    if (_4292)
    {
        float _4416 = _4402 * _4402;
        _4392 = _4416;
    }
    float _4418 = _4392;
    if (!_4292)
    {
        _4378 = _4286;
    }
    float _4420 = _4378;
    float _4422 = _4246 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _4424 = _4420;
    if (_4292)
    {
        float _4426 = _4414 * _4414;
        _4424 = _4426;
    }
    float _4428 = _4424;
    float _4430 = fma(_4406, _4406, _4418);
    float _4432 = _4246 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _4434 = fma(_3590, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _4436 = _4430 + _4428;
    float _4438 = fma(_4250, (*spvDescriptorSet0.vp_c8)._m0[2].x, _4432);
    float _4440 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _4442 = fma(_4276, (*spvDescriptorSet0.vp_c15)._m0[23].w, _4440);
    float _4444 = precise::clamp(_4442, 0.0, 1.0);
    float _4446 = fma(_4254, (*spvDescriptorSet0.vp_c8)._m0[2].z, _4438);
    float _4448 = rsqrt(_4436);
    float _4450 = -_4444;
    float _4452 = _4450 + 1.0;
    float _4454 = _4446 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _4456 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _4458 = fma(_3618, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _4460 = _4246 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _4462 = _4454 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _4464 = abs(_4452);
    float _4466 = log2(_4464);
    float _4468 = fma(_4250, (*spvDescriptorSet0.vp_c8)._m0[1].x, _4460);
    float _4470 = -_4462;
    float _4472 = fma(_4470, _4456, 1.0);
    float _4474 = _4246 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _4476 = fma(_4254, (*spvDescriptorSet0.vp_c8)._m0[1].z, _4468);
    float _4478 = _4448 * _4402;
    float _4480 = _4448 * _4406;
    float _4482 = fma(_4250, (*spvDescriptorSet0.vp_c8)._m0[0].x, _4474);
    float _4484 = _4448 * _4414;
    float _4486 = fma(_4250, (*spvDescriptorSet0.vp_c8)._m0[3].x, _4422);
    float _4488 = _4478 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _4490 = fma(_4254, (*spvDescriptorSet0.vp_c8)._m0[0].z, _4482);
    float _4492 = _4476 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _4494 = floor(_4434);
    float _4496 = -_4488;
    float _4498 = fma(_4480, (*spvDescriptorSet0.vp_c15)._m0[21].y, _4496);
    float _4500 = _4490 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _4502 = _4492 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _4504 = fma(_4254, (*spvDescriptorSet0.vp_c8)._m0[3].z, _4486);
    float _4506 = -_4484;
    float _4508 = fma(_4506, (*spvDescriptorSet0.vp_c15)._m0[21].z, _4498);
    float _4510 = _4466 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _4512 = fma(_4500, (*spvDescriptorSet0.vp_c8)._m0[7].x, _4502);
    float _4514 = _4504 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _4516 = floor(_4458);
    float _4518 = fma(_4508, -0.5, 0.5);
    float _4520 = fma(_4454, (*spvDescriptorSet0.vp_c8)._m0[7].z, _4512);
    float _4522 = fma(_4508, 0.5, 0.5);
    float _4524 = _4480 + 1.0;
    float _4526 = fma(_4514, (*spvDescriptorSet0.vp_c8)._m0[7].w, _4520);
    float _4528 = _4492 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _4530 = log2(_4472);
    float _4532 = -_4494;
    float _4534 = _4434 + _4532;
    float _4536 = fma(_4500, (*spvDescriptorSet0.vp_c8)._m0[4].x, _4528);
    float _4538 = fma(_4454, (*spvDescriptorSet0.vp_c8)._m0[4].z, _4536);
    float _4540 = 1.0 / _4526;
    float _4542 = _4492 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _4544 = fma(_4522, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _4546 = -_4516;
    float _4548 = _4458 + _4546;
    float _4550 = fma(_4500, (*spvDescriptorSet0.vp_c8)._m0[5].x, _4542);
    float _4552 = fma(_4522, _4544, -0.212114393711090087890625);
    float _4554 = sqrt(_4518);
    float _4556 = fma(_4454, (*spvDescriptorSet0.vp_c8)._m0[5].z, _4550);
    float _4558 = _4530 * 0.693147182464599609375;
    float _4560 = exp2(_4510);
    float _4562 = fma(_4514, (*spvDescriptorSet0.vp_c8)._m0[4].w, _4538);
    float _4564 = fma(_4514, (*spvDescriptorSet0.vp_c8)._m0[5].w, _4556);
    float2 _11850 = float2(_4534, _4548);
    float _4566 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_11850, float2(0.0), isnan(_11850)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_11850, float2(0.0), isnan(_11850)), level(0.0)).x;
    float _4568 = fma(_4522, _4552, 1.570728778839111328125);
    float _4570 = _4562 * _4540;
    float _4572 = _4564 * _4540;
    float _4574 = _4558 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _4576 = _4554 * 0.636619746685028076171875;
    float _4578 = fma(_4570, 0.5, 0.5);
    float _4580 = fma(_4572, -0.5, 0.5);
    float _4582 = -_4568;
    float _4584 = fma(_4576, _4582, 1.0);
    float _4586 = -_4480;
    float _4588 = fma(_4560, _4524, _4586);
    float3 _11893 = float3(_4578, _4580, _4574);
    float _4590 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_11893, float3(0.0), isnan(_11893)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_11893, float3(0.0), isnan(_11893)), level(0.0)).x;
    float3 _11904 = float3(_4578, _4580, _4574);
    float4 _4593 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_11904, float3(0.0), isnan(_11904)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_11904, float3(0.0), isnan(_11904)), level(0.0)).xyzw;
    float _4595 = _4593.x;
    float _4597 = _4593.y;
    float _4599 = _4593.z;
    float _4601 = _4593.w;
    float _4603 = fma(_4588, 0.5, 0.5);
    float2 _11922 = float2(_4584, _4603);
    float3 _4607 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_11922, float2(0.0), isnan(_11922)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_11922, float2(0.0), isnan(_11922)), level(0.0)).xyz;
    float _4609 = _4607.x;
    float _4611 = _4607.y;
    float _4613 = _4607.z;
    float _4615 = _3586 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _4617 = _3586 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _4619 = _4466 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _4621 = _4492 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _4623 = fma(_3590, (*spvDescriptorSet0.vp_c8)._m0[11].x, _4615);
    float _4625 = fma(_3590, (*spvDescriptorSet0.vp_c8)._m0[10].x, _4617);
    float _4627 = in.m_88.x;
    float _4629 = fma(_3618, (*spvDescriptorSet0.vp_c8)._m0[11].z, _4623);
    float _4631 = fma(_3618, (*spvDescriptorSet0.vp_c8)._m0[10].z, _4625);
    float _4633 = exp2(_4619);
    float _4635 = _4629 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _4637 = _4631 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _4639 = fma(_4500, (*spvDescriptorSet0.vp_c8)._m0[6].x, _4621);
    bool _4641 = _4276 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _4643 = isnan(_4276);
    bool _4645 = _4641 || _4643;
    bool _4647 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _4649 = _4645 || _4647;
    float _4651 = _4637 + _4635;
    float _4653 = 1.0 / _4635;
    float _4655 = fma(_4454, (*spvDescriptorSet0.vp_c8)._m0[6].z, _4639);
    float _4657 = fma(_4514, (*spvDescriptorSet0.vp_c8)._m0[6].w, _4655);
    float _4659 = -_4633;
    float _4661 = _4659 + 1.0;
    float _4663 = _4657 + _4526;
    out.gl_Position.x = _4562;
    out.gl_Position.y = _4564;
    out.gl_Position.z = _4657;
    out.gl_Position.w = _4526;
    float _4665 = _4661 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _4667 = _4663 * 0.5;
    float _4669 = _4651 * _4653;
    float _4671 = _4669 * 0.5;
    float _4673 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _4675 = fma(_4671, (*spvDescriptorSet0.vp_c8)._m0[30].w, _4673);
    float _4677 = 1.0 / _4675;
    float _4679 = -_4665;
    float _4681 = _4679 + 1.0;
    float _4683 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _4685 = _4677 * _4683;
    float _4687 = abs(_4685);
    float _4689 = log2(_4687);
    float _4691 = _4689 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _4693 = exp2(_4691);
    float _4695 = fma(_4693, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _4697 = precise::clamp(_4695, 0.0, 1.0);
    bool _4699 = _4685 <= 8000.0;
    bool _4701 = isnan(_4685);
    bool _4703 = _4699 || _4701;
    bool _4705 = isnan(8000.0);
    bool _4707 = _4703 || _4705;
    float _4709 = float(_4707);
    float _4711 = _4562 + _4526;
    float _4713 = fma(_4697, -2.0, 3.0);
    float _4715 = _4697 * _4697;
    float _4717 = _4711 * 0.5;
    float _4719 = _4715 * _4713;
    float _4721 = -_4719;
    float _4723 = _4721 + 1.0;
    float _4725 = fma(_4723, (*spvDescriptorSet0.vp_c15)._m0[654].w, _4719);
    float _4727 = _4526 * 0.5;
    float _4729 = _4709 * _4725;
    float _4731 = fma(_4564, -0.5, _4727);
    float _4733 = _4729 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _4735 = _4729;
    if (!_4649)
    {
        _4735 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _4737 = _4735;
    out.m_90.x = _4717;
    out.m_90.y = _4731;
    out.m_90.z = _4667;
    out.m_90.w = _4526;
    float _4739 = -_4566;
    float _4741 = _4739 + 1.0;
    float _4743 = _4741 * _4733;
    float _4745 = precise::clamp(_4743, 0.0, 1.0);
    float _4747 = -_4745;
    float _4749 = fma(_4747, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _4751 = _4749 * _4627;
    float _4753 = _4665 * _4590;
    float _4755 = _4751 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _4757 = _4601 * _4681;
    float _4759 = _4751;
    float _4761 = _4597;
    float _4763 = _4599;
    float _4765 = _4595;
    float _4767 = _4737;
    float _4769 = _4737;
    if (!_4649)
    {
        _4759 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _4771 = _4759;
    float _4773 = _4601 * _4753;
    out.m_92.x = _4755;
    float _4775 = _4613 * _4753;
    float _4777 = fma(_4609, _4773, _4595);
    float _4779 = fma(_4611, _4773, _4597);
    float _4781 = _4773;
    float _4783 = _4771;
    float _4785 = _4771;
    if (!_4649)
    {
        _4761 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _4787 = _4761;
    float _4789 = fma(_4601, _4775, _4599);
    float _4791 = _4787;
    float _4793 = _4787;
    if (!_4649)
    {
        _4763 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _4795 = _4763;
    float _4797 = _4795;
    float _4799 = _4795;
    if (!_4649)
    {
        _4765 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _4801 = _4765;
    out.m_94.x = _4777;
    out.m_94.y = _4779;
    out.m_94.z = _4789;
    out.m_94.w = _4757;
    float _4803 = _4801;
    float _4805 = _4801;
    if (!_4649)
    {
        _4781 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _4807 = _4781;
    bool _4809 = !_4649;
    float _4811 = _4807;
    float _4813 = _4807;
    if (!_4809)
    {
        bool _4815 = _4276 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _4817 = isnan(_4276);
        bool _4819 = _4815 || _4817;
        bool _4821 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _4823 = _4819 || _4821;
        if (!_4823)
        {
            float _4825 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _4827 = _4276 + _4825;
            float _4829 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _4831 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _4829;
            float _4833 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _4835 = _4833 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _4837 = 1.0 / _4831;
            float _4839 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _4841 = _4839 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _4843 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _4845 = _4843 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _4847 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _4849 = _4847 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _4851 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _4853 = _4851 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _4855 = _4827 * _4837;
            float _4857 = precise::clamp(_4855, 0.0, 1.0);
            float _4859 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _4861 = _4859 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _4863 = fma(_4857, _4835, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _4865 = fma(_4857, _4861, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _4867 = fma(_4857, _4841, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _4869 = fma(_4857, _4845, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _4871 = fma(_4857, _4849, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _4873 = fma(_4857, _4853, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _4793 = _4867;
            _4785 = _4871;
            _4799 = _4863;
            _4769 = _4869;
            _4805 = _4865;
            _4813 = _4873;
            _4875 = true;
        }
        else
        {
            bool _4877 = _4276 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _4879 = isnan(_4276);
            bool _4881 = _4877 || _4879;
            bool _4883 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _4885 = _4881 || _4883;
            if (!_4885)
            {
                _4797 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _4887 = _4797;
            _4799 = _4887;
            if (!_4885)
            {
                _4791 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _4889 = _4791;
            _4793 = _4889;
            if (!_4885)
            {
                _4803 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _4891 = _4803;
            _4805 = _4891;
            if (!_4885)
            {
                _4767 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _4893 = _4767;
            _4769 = _4893;
            if (!_4885)
            {
                _4783 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _4895 = _4783;
            _4785 = _4895;
            if (!_4885)
            {
                _4811 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _4897 = _4811;
            bool _4899 = !_4885;
            _4813 = _4897;
            if (!_4899)
            {
                bool _4901 = _4276 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _4903 = isnan(_4276);
                bool _4905 = _4901 || _4903;
                bool _4907 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _4909 = _4905 || _4907;
                if (!_4909)
                {
                    float _4911 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _4913 = _4276 + _4911;
                    float _4915 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _4917 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _4915;
                    float _4919 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _4921 = _4919 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _4923 = 1.0 / _4917;
                    float _4925 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _4927 = _4925 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _4929 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _4931 = _4929 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _4933 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _4935 = _4933 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _4937 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _4939 = _4937 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _4941 = _4913 * _4923;
                    float _4943 = precise::clamp(_4941, 0.0, 1.0);
                    float _4945 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _4947 = _4945 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _4949 = fma(_4943, _4921, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _4951 = fma(_4943, _4947, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _4953 = fma(_4943, _4927, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _4955 = fma(_4943, _4931, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _4957 = fma(_4943, _4935, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _4959 = fma(_4943, _4939, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _4793 = _4953;
                    _4785 = _4957;
                    _4799 = _4949;
                    _4769 = _4955;
                    _4805 = _4951;
                    _4813 = _4959;
                    _4875 = true;
                }
                else
                {
                    _4793 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _4785 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _4799 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _4769 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _4805 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _4813 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _4875 = false;
    float _4961 = _4793;
    float _4963 = _4785;
    float _4965 = _4799;
    float _4967 = _4769;
    float _4969 = _4805;
    float _4971 = _4813;
    float _4973 = fma(_4022, -0.5, 0.5);
    float _4975 = precise::clamp(_4973, 0.0, 1.0);
    float _4977 = -_4961;
    float _4979 = _4977 + _4963;
    float _4981 = -_4965;
    float _4983 = _4981 + _4967;
    float _4985 = -_4969;
    float _4987 = _4985 + _4971;
    bool _4989 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _4991 = fma(_4975, _4979, _4961);
    float _4993 = fma(_4975, _4983, _4965);
    float _4995 = fma(_4975, _4987, _4969);
    float _4997 = _4991 * 0.586610972881317138671875;
    out.m_96.x = 0.0;
    float _4999 = fma(_4993, 0.298911988735198974609375, _4997);
    float _5001 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _5003 = fma(_4995, 0.114477999508380889892578125, _4999);
    out.m_55.x = _5001;
    float _5005 = -_5003;
    float _5007 = _4993 + _5005;
    float _5009 = -_5003;
    float _5011 = _4991 + _5009;
    float _5013 = -_5003;
    float _5015 = _4995 + _5013;
    float _5017 = fma(_5007, (*spvDescriptorSet0.vp_c13)._m0[1].z, _5003);
    float _5019 = fma(_5011, (*spvDescriptorSet0.vp_c13)._m0[1].z, _5003);
    float _5021 = fma(_5015, (*spvDescriptorSet0.vp_c13)._m0[1].z, _5003);
    out.m_98.x = _5017;
    out.m_98.y = _5019;
    out.m_98.z = _5021;
    if (!_4989)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_55.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_55.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_55.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_55.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_98.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_98.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_98.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_98.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_90.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_90.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_90.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_90.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 72, as_type<uint>(out.m_96.x)); dm_cw(dm_gs, dm_p, 73, as_type<uint>(out.m_96.y)); dm_cw(dm_gs, dm_p, 74, as_type<uint>(out.m_96.z)); dm_cw(dm_gs, dm_p, 75, as_type<uint>(out.m_96.w)); dm_cw(dm_gs, dm_p, 76, as_type<uint>(out.m_92.x)); dm_cw(dm_gs, dm_p, 77, as_type<uint>(out.m_92.y)); dm_cw(dm_gs, dm_p, 78, as_type<uint>(out.m_92.z)); dm_cw(dm_gs, dm_p, 79, as_type<uint>(out.m_92.w)); dm_cw(dm_gs, dm_p, 80, as_type<uint>(out.m_94.x)); dm_cw(dm_gs, dm_p, 81, as_type<uint>(out.m_94.y)); dm_cw(dm_gs, dm_p, 82, as_type<uint>(out.m_94.z)); dm_cw(dm_gs, dm_p, 83, as_type<uint>(out.m_94.w)); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _5023 = -_4246;
    float _5025 = _5023 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
    float _5027 = -_4250;
    float _5029 = _5027 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
    float _5031 = -_4254;
    float _5033 = _5031 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
    float _5035 = _5025 * _5025;
    float _5037 = fma(_5029, _5029, _5035);
    float _5039 = fma(_5033, _5033, _5037);
    float _5041 = sqrt(_5039);
    float _5043 = rsqrt(_5039);
    float _5045 = -_5041;
    float _5047 = _5045 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _5049 = _5047 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
    float _5051 = precise::clamp(_5049, 0.0, 1.0);
    float _5053 = _5029 * _5043;
    float _5055 = _5025 * _5043;
    float _5057 = abs(_5051);
    float _5059 = log2(_5057);
    float _5061 = _5033 * _5043;
    float _5063 = _5053 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
    float _5065 = _4022 * _5055;
    float _5067 = -_5055;
    float _5069 = -_5063;
    float _5071 = fma(_5067, (*spvDescriptorSet0.vp_c15)._m0[656].y, _5069);
    float _5073 = fma(_4026, _5053, _5065);
    float _5075 = -_5061;
    float _5077 = fma(_5075, (*spvDescriptorSet0.vp_c15)._m0[656].z, _5071);
    float _5079 = fma(_4028, _5061, _5073);
    float _5081 = precise::clamp(_5079, 0.0, 1.0);
    float _5083 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
    float _5085 = _5077 + _5083;
    float _5087 = _5059 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
    float _5089 = _5085 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
    float _5091 = precise::clamp(_5089, 0.0, 1.0);
    float _5093 = exp2(_5087);
    float _5095 = _5093 * _5091;
    float _5097 = _5081 * _5095;
    float _5099 = _5097 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
    float _5101 = _5097 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
    float _5103 = _5097 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
    out.m_96.x = _5099;
    out.m_96.y = _5101;
    out.m_96.z = _5103;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_55.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_55.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_55.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_55.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_98.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_98.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_98.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_98.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_90.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_90.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_90.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_90.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 72, as_type<uint>(out.m_96.x)); dm_cw(dm_gs, dm_p, 73, as_type<uint>(out.m_96.y)); dm_cw(dm_gs, dm_p, 74, as_type<uint>(out.m_96.z)); dm_cw(dm_gs, dm_p, 75, as_type<uint>(out.m_96.w)); dm_cw(dm_gs, dm_p, 76, as_type<uint>(out.m_92.x)); dm_cw(dm_gs, dm_p, 77, as_type<uint>(out.m_92.y)); dm_cw(dm_gs, dm_p, 78, as_type<uint>(out.m_92.z)); dm_cw(dm_gs, dm_p, 79, as_type<uint>(out.m_92.w)); dm_cw(dm_gs, dm_p, 80, as_type<uint>(out.m_94.x)); dm_cw(dm_gs, dm_p, 81, as_type<uint>(out.m_94.y)); dm_cw(dm_gs, dm_p, 82, as_type<uint>(out.m_94.z)); dm_cw(dm_gs, dm_p, 83, as_type<uint>(out.m_94.w)); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

