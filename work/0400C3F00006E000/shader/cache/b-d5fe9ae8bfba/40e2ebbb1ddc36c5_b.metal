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
    float4 m_72 [[user(locn0)]];
    float4 m_78 [[user(locn1)]];
    float4 m_74 [[user(locn2)]];
    float4 m_90 [[user(locn3)]];
    float4 m_100 [[user(locn4)]];
    float4 m_53 [[user(locn5)]];
    float4 m_80 [[user(locn6)]];
    float4 m_84 [[user(locn7)]];
    float4 m_86 [[user(locn8)]];
    float4 m_82 [[user(locn9)]];
    float4 m_98 [[user(locn10)]];
    float4 m_88 [[user(locn11)]];
    float4 m_94 [[user(locn12)]];
    float4 m_96 [[user(locn13)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_92 [[attribute(0)]];
    float4 m_62 [[attribute(1)]];
    float4 m_64 [[attribute(2)]];
    float4 m_66 [[attribute(3)]];
    float4 m_76 [[attribute(4)]];
    float4 m_60 [[attribute(5)]];
    float4 m_50 [[attribute(6)]];
    float4 m_55 [[attribute(7)]];
    float4 m_68 [[attribute(8)]];
    float4 m_70 [[attribute(9)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_72 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_78 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_74 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_90 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_100 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_53 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_80 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_84 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_86 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_82 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_98 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_88 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_94 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_96 = float4(0.0, 0.0, 0.0, 1.0);
    bool _4987 = false;
    bool _4078 = false;
    bool _753 = false;
    bool _641 = false;
    bool _257 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _114 = in.m_50.w;
    float _116 = trunc(_114);
    int _119 = int(_116);
    bool _123 = _119 >= 1;
    float _125 = 0.0;
    if (!_123)
    {
        _125 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _127 = _125;
    float _129 = _127;
    if (!_123)
    {
        out.m_53.x = 0.0;
    }
    int _131 = 0;
    if (!_123)
    {
        float _133 = _127 * 5.0;
        _131 = as_type<int>(_133);
    }
    int _135 = _131;
    int _137 = _135;
    if (!_123)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _5286 = as_type<float>(_135);
        out.gl_Position.z = _5286;
    }
    if (!_123)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _139 = in.m_55.w;
    bool _141 = _139 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _143 = isnan(_139);
    bool _145 = _141 || _143;
    bool _147 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _149 = _145 || _147;
    float _151 = -_139;
    float _153 = _151 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _155 = _153;
    if (_149)
    {
        float _157 = float(_119);
        _129 = _157;
    }
    float _159 = _129;
    bool _161 = _153 >= _159;
    bool _163 = !_149;
    bool _165 = _161 || _163;
    float _167 = _159;
    if (_165)
    {
        _167 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _169 = _167;
    if (_165)
    {
        out.m_53.x = 0.0;
    }
    if (_165)
    {
        float _171 = _169 * 5.0;
        _137 = as_type<int>(_171);
    }
    int _173 = _137;
    if (_165)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _5356 = as_type<float>(_173);
        out.gl_Position.z = _5356;
    }
    if (_165)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _175 = as_type<float>(int(gl_VertexIndex));
    float _177 = in.m_60.x;
    float _179 = in.m_60.y;
    float _181 = in.m_60.z;
    float _183 = in.m_62.x;
    float _185 = in.m_62.y;
    float _187 = in.m_62.z;
    float _189 = in.m_64.x;
    float _191 = in.m_64.y;
    float _193 = in.m_64.z;
    float _195 = in.m_66.x;
    float _197 = in.m_66.y;
    float _199 = in.m_66.z;
    int _201 = as_type<int>(_175) & 1;
    bool _203 = _201 != 0;
    int _205 = as_type<int>(_175) & 2;
    bool _207 = _205 != 0;
    bool _209 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    bool _211 = !_203;
    float _213 = _211 ? (-0.5) : 0.5;
    bool _215 = !_207;
    float _217 = _215 ? (-0.5) : 0.5;
    float _219 = _179 * _185;
    float _221 = _179 * _191;
    float _223 = fma(_177, _183, _219);
    float _225 = _179 * _197;
    float _227 = fma(_177, _189, _221);
    float _229 = fma(_181, _187, _223);
    float _231 = fma(_177, _195, _225);
    float _233 = fma(_181, _193, _227);
    float _235 = fma(_181, _199, _231);
    bool _237 = !_209;
    float _255;
    if (!_237)
    {
        float _239 = in.m_68.x;
        float _241 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _243 = _239 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _245 = fma(_243, (*spvDescriptorSet0.vp_c9)._m0[12].x, _153);
        float _247 = _245 * _241;
        float _249 = floor(_247);
        float _251 = -_249;
        float _253 = _247 + _251;
        _255 = _253;
        _257 = true;
    }
    else
    {
        float _259 = float(_119);
        float _261 = 1.0 / _259;
        float _263 = _153 * _261;
        _255 = _263;
    }
    _257 = false;
    float _265 = _255;
    float _267 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _269 = _265 + _267;
    float _271 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _273 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _271;
    float _275 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _277 = _275 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _279 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _281 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _279;
    float _283 = 1.0 / _273;
    float _285 = -(*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _287 = (*spvDescriptorSet0.vp_c9)._m0[148].w + _285;
    float _289 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _291 = _289 + (*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _293 = -(*spvDescriptorSet0.vp_c9)._m0[148].w;
    float _295 = _293 + (*spvDescriptorSet0.vp_c9)._m0[149].w;
    float _297 = 1.0 / _277;
    float _299 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _301 = _265 + _299;
    bool _303 = _265 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _305 = isnan(_265);
    bool _307 = _303 || _305;
    bool _309 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _311 = _307 || _309;
    float _313 = float(_311);
    float _315 = 1.0 / _281;
    float _317 = _301 * _283;
    float _319 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _321 = _265 + _319;
    bool _323 = _265 >= (*spvDescriptorSet0.vp_c9)._m0[150].w;
    bool _325 = isnan(_265);
    bool _327 = _323 || _325;
    bool _329 = isnan((*spvDescriptorSet0.vp_c9)._m0[150].w);
    bool _331 = _327 || _329;
    float _333 = float(_331);
    bool _335 = _265 >= (*spvDescriptorSet0.vp_c9)._m0[149].w;
    bool _337 = isnan(_265);
    bool _339 = _335 || _337;
    bool _341 = isnan((*spvDescriptorSet0.vp_c9)._m0[149].w);
    bool _343 = _339 || _341;
    float _345 = float(_343);
    float _347 = 1.0 / _287;
    float _349 = -(*spvDescriptorSet0.vp_c9)._m0[149].w;
    float _351 = (*spvDescriptorSet0.vp_c9)._m0[150].w + _349;
    float _353 = _269 * _297;
    float _355 = -(*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _357 = _265 + _355;
    float _359 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _361 = _265 + _359;
    bool _363 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _365 = 1.0 / _351;
    float _367 = _321 * _315;
    float _369 = -_333;
    float _371 = _369 + 1.0;
    bool _373 = _265 >= (*spvDescriptorSet0.vp_c9)._m0[148].w;
    bool _375 = isnan(_265);
    bool _377 = _373 || _375;
    bool _379 = isnan((*spvDescriptorSet0.vp_c9)._m0[148].w);
    bool _381 = _377 || _379;
    float _383 = float(_381);
    float _385 = _345 * _371;
    float _387 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _389 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _387;
    float _391 = 1.0 / _291;
    float _393 = _357 * _347;
    float _395 = -_345;
    float _397 = _395 + 1.0;
    bool _399 = _265 >= (*spvDescriptorSet0.vp_c9)._m0[147].w;
    bool _401 = isnan(_265);
    bool _403 = _399 || _401;
    bool _405 = isnan((*spvDescriptorSet0.vp_c9)._m0[147].w);
    bool _407 = _403 || _405;
    float _409 = float(_407);
    float _411 = fma(_389, _317, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _413 = 1.0 / _295;
    float _415 = -(*spvDescriptorSet0.vp_c9)._m0[149].w;
    float _417 = _265 + _415;
    float _419 = _417 * _365;
    float _421 = _383 * _397;
    float _423 = -_383;
    float _425 = _423 + 1.0;
    float _427 = _361 * _391;
    float _429 = -(*spvDescriptorSet0.vp_c9)._m0[148].w;
    float _431 = _265 + _429;
    bool _433 = _265 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _435 = isnan(_265);
    bool _437 = _433 || _435;
    bool _439 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _441 = _437 || _439;
    float _443 = float(_441);
    float _445 = _409 * _425;
    float _447 = -_409;
    float _449 = _447 + 1.0;
    float _451 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _453 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _451;
    float _455 = _431 * _413;
    float _457 = _443 * _449;
    float _459 = -_443;
    float _461 = _459 + 1.0;
    bool _463 = _265 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _465 = isnan(_265);
    bool _467 = _463 || _465;
    bool _469 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _471 = _467 || _469;
    float _473 = float(_471);
    float _475 = fma(_453, _317, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    bool _477 = _265 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _479 = isnan(_265);
    bool _481 = _477 || _479;
    bool _483 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _485 = _481 || _483;
    float _487 = float(_485);
    float _489 = _313 * _461;
    float _491 = -_313;
    float _493 = _491 + 1.0;
    float _495 = -_473;
    float _497 = _495 + 1.0;
    float _499 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _501 = _499 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _503 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _505 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _503;
    float _507 = _473 * _493;
    float _509 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _511 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _509;
    float _513 = _487 * _497;
    float _515 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _517 = _515 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _519 = fma(_505, _367, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _521 = fma(_511, _367, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _523 = _411 * _513;
    float _525 = -_487;
    float _527 = _525 + 1.0;
    float _529 = _475 * _513;
    float _531 = -(*spvDescriptorSet0.vp_c9)._m0[146].x;
    float _533 = _531 + (*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _535 = fma(_501, _353, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _537 = fma(_527, (*spvDescriptorSet0.vp_c9)._m0[143].x, _523);
    float _539 = fma(_517, _353, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _541 = -(*spvDescriptorSet0.vp_c9)._m0[146].y;
    float _543 = _541 + (*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _545 = fma(_527, (*spvDescriptorSet0.vp_c9)._m0[143].y, _529);
    float _547 = fma(_533, _427, (*spvDescriptorSet0.vp_c9)._m0[146].x);
    float _549 = fma(_543, _427, (*spvDescriptorSet0.vp_c9)._m0[146].y);
    float _551 = fma(_535, _507, _537);
    float _553 = fma(_539, _507, _545);
    float _555 = -(*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _557 = (*spvDescriptorSet0.vp_c9)._m0[148].x + _555;
    float _559 = -(*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _561 = (*spvDescriptorSet0.vp_c9)._m0[148].y + _559;
    float _563 = fma(_521, _489, _551);
    float _565 = fma(_519, _489, _553);
    float _567 = fma(_557, _393, (*spvDescriptorSet0.vp_c9)._m0[147].x);
    float _569 = fma(_561, _393, (*spvDescriptorSet0.vp_c9)._m0[147].y);
    float _571 = -(*spvDescriptorSet0.vp_c9)._m0[148].x;
    float _573 = _571 + (*spvDescriptorSet0.vp_c9)._m0[149].x;
    float _575 = -(*spvDescriptorSet0.vp_c9)._m0[148].y;
    float _577 = _575 + (*spvDescriptorSet0.vp_c9)._m0[149].y;
    float _579 = fma(_547, _457, _563);
    float _581 = fma(_549, _457, _565);
    float _583 = fma(_573, _455, (*spvDescriptorSet0.vp_c9)._m0[148].x);
    float _585 = fma(_577, _455, (*spvDescriptorSet0.vp_c9)._m0[148].y);
    float _587 = -(*spvDescriptorSet0.vp_c9)._m0[149].x;
    float _589 = (*spvDescriptorSet0.vp_c9)._m0[150].x + _587;
    float _591 = -(*spvDescriptorSet0.vp_c9)._m0[149].y;
    float _593 = (*spvDescriptorSet0.vp_c9)._m0[150].y + _591;
    float _595 = fma(_567, _445, _579);
    float _597 = fma(_569, _445, _581);
    float _599 = fma(_589, _419, (*spvDescriptorSet0.vp_c9)._m0[149].x);
    float _601 = fma(_593, _419, (*spvDescriptorSet0.vp_c9)._m0[149].y);
    float _603 = fma(_583, _421, _595);
    float _605 = fma(_585, _421, _597);
    float _607 = fma(_599, _385, _603);
    float _609 = fma(_601, _385, _605);
    float _611 = fma(_333, (*spvDescriptorSet0.vp_c9)._m0[150].x, _607);
    float _613 = fma(_333, (*spvDescriptorSet0.vp_c9)._m0[150].y, _609);
    bool _615 = !_363;
    int _617 = as_type<int>(_523);
    int _619 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[148].y);
    float _621 = (*spvDescriptorSet0.vp_c9)._m0[148].x;
    float _639;
    if (!_615)
    {
        float _623 = in.m_68.x;
        float _625 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _627 = _623 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _629 = fma(_627, (*spvDescriptorSet0.vp_c9)._m0[11].y, _153);
        float _631 = _629 * _625;
        float _633 = floor(_631);
        float _635 = -_633;
        float _637 = _631 + _635;
        _639 = _637;
        _641 = true;
    }
    else
    {
        float _643 = float(_119);
        float _645 = 1.0 / _643;
        float _647 = _153 * _645;
        _639 = _647;
    }
    _641 = false;
    float _649 = _639;
    float _651 = in.m_70.x;
    float _653 = in.m_70.y;
    bool _655 = _649 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _657 = isnan(_649);
    bool _659 = _655 || _657;
    bool _661 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _663 = _659 || _661;
    float _665 = float(_663);
    float _667 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _669 = _667 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _671 = _649 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _673 = isnan(_649);
    bool _675 = _671 || _673;
    bool _677 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _679 = _675 || _677;
    float _681 = float(_679);
    float _683 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _685 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _683;
    float _687 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _689 = _649 + _687;
    float _691 = -_665;
    float _693 = _691 + 1.0;
    float _695 = 1.0 / _669;
    float _697 = _681 * _693;
    float _699 = -_681;
    float _701 = _699 + 1.0;
    float _703 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _705 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    bool _707 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _709 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _711 = _703 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _713 = _705 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _715 = _709 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _717 = _613 * _653;
    float _719 = _611 * _651;
    float _721 = _685 * _695;
    float _723 = fma(_721, _689, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _725 = _723 * _697;
    float _727 = fma(_701, (*spvDescriptorSet0.vp_c9)._m0[115].x, _725);
    float _729 = fma(_665, (*spvDescriptorSet0.vp_c9)._m0[116].x, _727);
    float _731 = _729 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    out.m_72.x = _711;
    out.m_72.y = _715;
    out.m_72.z = _713;
    out.m_72.w = _731;
    bool _733 = !_707;
    float _751;
    if (!_733)
    {
        float _735 = in.m_68.x;
        float _737 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _739 = _735 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _741 = fma(_739, (*spvDescriptorSet0.vp_c9)._m0[11].w, _153);
        float _743 = _741 * _737;
        float _745 = floor(_743);
        float _747 = -_745;
        float _749 = _743 + _747;
        _751 = _749;
        _753 = true;
    }
    else
    {
        float _755 = float(_119);
        float _757 = 1.0 / _755;
        float _759 = _153 * _757;
        _751 = _759;
    }
    _753 = false;
    float _761 = _751;
    float _763 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _765 = int(_763);
    float _767 = float(_119);
    float _769 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _771 = int(_769);
    float _773 = float(_765);
    float _775 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].y);
    int _777 = int(_775);
    float _779 = float(uint(_771));
    float _781 = 1.0 / _773;
    float _783 = float(_771);
    int _785 = ~_771;
    int _787 = _785 + 1;
    float _789 = 1.0 / _779;
    float _791 = float(_777);
    float _793 = _781 * _153;
    float _795 = trunc((*spvDescriptorSet0.vp_c9)._m0[40].y);
    int _797 = int(_795);
    int _799 = as_type<int>(_789) + (-2);
    float _801 = trunc(_793);
    int _803 = int(_801);
    int _805 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _807 = _805 != 0;
    float _809 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].x);
    int _811 = int(_809);
    float _813 = float(_797);
    float _815 = float(uint(_803));
    float _817 = 1.0 / _767;
    float _819 = (*spvDescriptorSet0.vp_c9)._m0[7].z;
    float _821 = _817;
    if (_807)
    {
        float _823 = in.m_68.x;
        _819 = _823;
    }
    float _825 = _819;
    if (_807)
    {
        _617 = 0;
    }
    int _827 = _617;
    float _829 = as_type<float>(_799) * _815;
    int _831 = _827;
    if (_807)
    {
        _619 = 0;
    }
    int _833 = _619;
    float _835 = float(uint(_811));
    float _837 = trunc(_829);
    float _839 = precise::max(_837, 0.0);
    uint _842 = uint(_839);
    float _844 = 1.0 / _791;
    float _846 = 1.0 / _813;
    float _848 = _825;
    int _850 = _833;
    if (_807)
    {
        _621 = _825;
    }
    float _852 = _621;
    float _854 = 1.0 / _835;
    int _856 = ~_771;
    int _858 = _856 + 1;
    float _860 = _844 * _153;
    int _862 = _858 * int(_842);
    int _864 = _862 + _803;
    float _866 = trunc((*spvDescriptorSet0.vp_c9)._m0[40].x);
    int _868 = int(_866);
    float _870 = _817 * _153;
    float _872 = _846 * _153;
    float _874 = float(uint(_864));
    float _876 = in.m_68.x;
    float _878 = in.m_68.y;
    float _880 = in.m_68.z;
    float _882 = in.m_68.w;
    float _884 = _783 * _870;
    float _886 = _874;
    float _888 = _852;
    if (_807)
    {
        _821 = 1.0;
    }
    float _890 = _821;
    float _892 = as_type<float>(_799) * _874;
    float _894 = trunc(_860);
    int _896 = int(_894);
    float _898 = _890;
    if (_807)
    {
        _886 = 1.0;
    }
    float _900 = _886;
    float _902 = float(uint(_868));
    float _904 = trunc(_884);
    int _906 = int(_904);
    float _908 = trunc(_872);
    int _910 = int(_908);
    float _912 = trunc(_892);
    float _914 = precise::max(_912, 0.0);
    uint _916 = uint(_914);
    float _918 = 1.0 / _902;
    float _920 = _902;
    float _922 = _900;
    if (_807)
    {
        _920 = 1.0;
    }
    float _924 = _920;
    float _926 = _924;
    if (!_807)
    {
        float _928 = in.m_68.y;
        float _930 = in.m_68.z;
        _922 = 7.345489978790283203125;
        _898 = 1.2345600128173828125;
        _848 = _928;
        _926 = 5.839270114898681640625;
        _888 = _930;
        _831 = 1;
        _850 = 2;
    }
    float _932 = _922;
    float _934 = _898;
    float _936 = _848;
    float _938 = _926;
    float _940 = _888;
    int _942 = _831;
    int _944 = _850;
    float _946 = _932 * _876;
    int _948 = int(_842) + int(_916);
    float _950 = _934 * _936;
    float _952 = _938 * _940;
    float _954 = float(_803);
    float _956 = floor(_946);
    int _958 = as_type<int>(_854) + (-2);
    int _960 = _787 * _948;
    int _962 = _960 + _803;
    bool _964 = _954 >= _783;
    bool _966 = isnan(_954);
    bool _968 = _964 || _966;
    bool _970 = isnan(_783);
    bool _972 = _968 || _970;
    float _974 = float(_972);
    float _976 = _719 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _978 = float(uint(_896));
    int _980 = as_type<int>(_918) + (-2);
    float _982 = trunc(_974);
    int _984 = int(_982);
    float _986 = float(uint(_910));
    bool _988 = uint(_962) >= uint(_771);
    float _990 = as_type<float>(_958) * _978;
    bool _992 = _878 > 0.5;
    float _994 = as_type<float>(_980) * _986;
    bool _996 = !_988;
    int _998 = _996 ? 0 : (-1);
    float _1000 = -_956;
    float _1002 = _946 + _1000;
    float _1004 = trunc(_990);
    float _1006 = precise::max(_1004, 0.0);
    uint _1008 = uint(_1006);
    int _1010 = ~_948;
    int _1012 = _1010 + _998;
    int _1014 = _1012 + 1;
    float _1016 = _1002 * _783;
    bool _1018 = _771 == 0;
    bool _1020 = _880 > 0.5;
    int _1022 = _771 * _1014;
    int _1024 = _1022 + _803;
    int _1026 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _1028 = _1026 != 0;
    float _1030 = trunc(_994);
    float _1032 = precise::max(_1030, 0.0);
    uint _1034 = uint(_1032);
    float _1036 = -_213;
    int _1038 = _992 ? as_type<int>(_1036) : as_type<int>(_213);
    int _1040 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _1042 = _1040 != 0;
    int _1044 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16;
    bool _1046 = _1044 != 0;
    int _1048 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32;
    bool _1050 = _1048 != 0;
    float _1052 = -_217;
    int _1054 = _1020 ? as_type<int>(_1052) : as_type<int>(_217);
    float _1056 = floor(_950);
    bool _1058 = !_1050;
    float _1060 = _1058 ? _217 : as_type<float>(_1054);
    int _1062 = ~_984;
    int _1064 = _1062 + 1;
    int _1066 = _1064 + 1;
    bool _1068 = !_1018;
    int _1070 = _1068 ? _1024 : (-1);
    bool _1072 = !_1046;
    float _1074 = _1072 ? _213 : as_type<float>(_1038);
    float _1076 = floor(_952);
    int _1078 = ~_811;
    int _1080 = _1078 + 1;
    int _1082 = _1070 * _1066;
    int _1084 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _1086 = _1084 != 0;
    int _1088 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _1090 = _1088 != 0;
    int _1092 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _1094 = _1092 != 0;
    int _1096 = _771 + (-1);
    int _1098 = _1080 * int(_1008);
    int _1100 = _1098 + _896;
    bool _1102 = !_1028;
    int _1104 = _1102 ? 0 : 1;
    float _1106 = trunc(_1016);
    int _1108 = int(_1106);
    bool _1110 = !_1090;
    int _1112 = _1110 ? 0 : 1;
    int _1114 = _984 * _1096;
    int _1116 = _1114 + _1082;
    bool _1118 = _882 > 0.5;
    float _1120 = -_1056;
    float _1122 = _950 + _1120;
    bool _1124 = !_1086;
    int _1126 = _1124 ? 0 : 1;
    int _1128 = abs(_1112);
    float _1130 = -_1076;
    float _1132 = _952 + _1130;
    float _1134 = float(uint(_1100));
    bool _1136 = !_1094;
    int _1138 = _1136 ? 0 : 1;
    int _1140 = _1116 * _1128;
    int _1142 = ~_868;
    int _1144 = _1142 + 1;
    float _1146 = as_type<float>(_958) * _1134;
    int _1148 = abs(_1126);
    int _1150 = abs(_1138);
    float _1152 = trunc(_1146);
    float _1154 = precise::max(_1152, 0.0);
    uint _1156 = uint(_1154);
    int _1158 = _1144 * int(_1034);
    int _1160 = _1158 + _910;
    int _1162 = abs(_1104);
    int _1164 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _1166 = _1164 != 0;
    int _1168 = _906 * _1148;
    int _1170 = _1168 + _1140;
    float _1172 = float(uint(_1160));
    int _1174 = _1108 * _1162;
    int _1176 = _1174 + _803;
    int _1178 = ~_811;
    int _1180 = _1178 + 1;
    float _1182 = as_type<float>(_980) * _1172;
    bool _1184 = !_1166;
    int _1186 = _1184 ? 0 : 1;
    int _1188 = _1176 * _1150;
    int _1190 = _1188 + _1170;
    float _1192 = float(_811);
    float _1194 = trunc(_1182);
    float _1196 = precise::max(_1194, 0.0);
    uint _1198 = uint(_1196);
    int _1200 = int(_1008) + int(_1156);
    float _1202 = float(_896);
    float _1204 = _1122 * _1192;
    int _1206 = abs(_1186);
    int _1208 = _1180 * _1200;
    int _1210 = _1208 + _896;
    bool _1212 = _1202 >= _1192;
    bool _1214 = isnan(_1202);
    bool _1216 = _1212 || _1214;
    bool _1218 = isnan(_1192);
    bool _1220 = _1216 || _1218;
    float _1222 = float(_1220);
    float _1224 = _1192 * _870;
    float _1226 = float(_868);
    int _1228 = _1108 * _1206;
    int _1230 = _1228 + _1190;
    int _1232 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8192;
    bool _1234 = _1232 != 0;
    float _1236 = trunc(_1204);
    int _1238 = int(_1236);
    float _1240 = float(_910);
    float _1242 = _1226 * _870;
    bool _1244 = uint(_1210) >= uint(_811);
    float _1246 = _1132 * _1226;
    int _1248 = int(_1034) + int(_1198);
    bool _1250 = !_1234;
    int _1252 = _1250 ? 0 : 1;
    float _1254 = trunc(_1222);
    int _1256 = int(_1254);
    bool _1258 = _1240 >= _1226;
    bool _1260 = isnan(_1240);
    bool _1262 = _1258 || _1260;
    bool _1264 = isnan(_1226);
    bool _1266 = _1262 || _1264;
    float _1268 = float(_1266);
    float _1270 = -_217;
    int _1272 = _1118 ? as_type<int>(_1270) : as_type<int>(_217);
    float _1274 = float(uint(_1230));
    bool _1276 = !_1244;
    int _1278 = _1276 ? 0 : (-1);
    float _1280 = trunc(_1224);
    int _1282 = int(_1280);
    int _1284 = abs(_1252);
    bool _1286 = !_1042;
    float _1288 = _1286 ? _217 : as_type<float>(_1272);
    float _1290 = as_type<float>(_799) * _1274;
    int _1292 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 256;
    bool _1294 = _1292 != 0;
    int _1296 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 512;
    bool _1298 = _1296 != 0;
    int _1300 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1024;
    bool _1302 = _1300 != 0;
    int _1304 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2048;
    bool _1306 = _1304 != 0;
    int _1308 = ~_1200;
    int _1310 = _1308 + _1278;
    int _1312 = _1310 + 1;
    float _1314 = trunc(_1268);
    int _1316 = int(_1314);
    int _1318 = ~_868;
    int _1320 = _1318 + 1;
    bool _1322 = !_1298;
    int _1324 = _1322 ? 0 : 1;
    int _1326 = _811 * _1312;
    int _1328 = _1326 + _896;
    bool _1330 = _811 == 0;
    int _1332 = _1320 * _1248;
    int _1334 = _1332 + _910;
    float _1336 = trunc(_1290);
    float _1338 = precise::max(_1336, 0.0);
    uint _1340 = uint(_1338);
    int _1342 = ~_1256;
    int _1344 = _1342 + 1;
    int _1346 = _1344 + 1;
    bool _1348 = !_1330;
    int _1350 = _1348 ? _1328 : (-1);
    int _1352 = _1238 * _1284;
    int _1354 = _1352 + _896;
    int _1356 = ~_771;
    int _1358 = _1356 + 1;
    int _1360 = _811 + (-1);
    int _1362 = _1350 * _1346;
    bool _1364 = !_1294;
    int _1366 = _1364 ? 0 : 1;
    float _1368 = trunc(_1242);
    int _1370 = int(_1368);
    bool _1372 = uint(_1334) >= uint(_868);
    int _1374 = _1256 * _1360;
    int _1376 = _1374 + _1362;
    int _1378 = abs(_1324);
    bool _1380 = !_1372;
    int _1382 = _1380 ? 0 : (-1);
    int _1384 = _1358 * int(_1340);
    int _1386 = _1384 + _1230;
    int _1388 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 4096;
    bool _1390 = _1388 != 0;
    int _1392 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 8192;
    bool _1394 = _1392 != 0;
    int _1396 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16384;
    bool _1398 = _1396 != 0;
    int _1400 = _1376 * _1378;
    int _1402 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16384;
    bool _1404 = _1402 != 0;
    float _1406 = float(uint(_1386));
    int _1408 = abs(_1366);
    float _1410 = trunc(_1246);
    int _1412 = int(_1410);
    int _1414 = ~_1248;
    int _1416 = _1414 + _1382;
    int _1418 = _1416 + 1;
    float _1420 = as_type<float>(_799) * _1406;
    float _1422 = float(uint(_1176));
    int _1424 = _1282 * _1408;
    int _1426 = _1424 + _1400;
    bool _1428 = !_1404;
    int _1430 = _1428 ? 0 : 1;
    bool _1432 = !_1302;
    int _1434 = _1432 ? 0 : 1;
    float _1436 = as_type<float>(_799) * _1422;
    int _1438 = abs(_1430);
    float _1440 = trunc(_1420);
    float _1442 = precise::max(_1440, 0.0);
    uint _1444 = uint(_1442);
    bool _1446 = !_1306;
    int _1448 = _1446 ? 0 : 1;
    int _1450 = _868 * _1418;
    int _1452 = _1450 + _910;
    int _1454 = abs(_1434);
    int _1456 = abs(_1448);
    float _1458 = trunc(_1436);
    float _1460 = precise::max(_1458, 0.0);
    uint _1462 = uint(_1460);
    int _1464 = _1412 * _1438;
    int _1466 = _1464 + _910;
    bool _1468 = _868 == 0;
    int _1470 = ~_1316;
    int _1472 = _1470 + 1;
    int _1474 = _1472 + 1;
    int _1476 = _1354 * _1454;
    int _1478 = _1476 + _1426;
    bool _1480 = !_1468;
    int _1482 = _1480 ? _1452 : (-1);
    int _1484 = ~_771;
    int _1486 = _1484 + 1;
    int _1488 = _1238 * _1456;
    int _1490 = _1488 + _1478;
    int _1492 = ~_771;
    int _1494 = _1492 + 1;
    int _1496 = _1482 * _1474;
    bool _1498 = !_1394;
    int _1500 = _1498 ? 0 : 1;
    int _1502 = _868 + (-1);
    int _1504 = _1486 * int(_1462);
    int _1506 = _1504 + _1176;
    int _1508 = int(_1340) + int(_1444);
    int _1510 = _1316 * _1502;
    int _1512 = _1510 + _1496;
    int _1514 = abs(_1500);
    float _1516 = float(uint(_1490));
    float _1518 = float(uint(_1506));
    int _1520 = _1494 * _1508;
    int _1522 = _1520 + _1230;
    int _1524 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32768;
    bool _1526 = _1524 != 0;
    float _1528 = as_type<float>(_958) * _1516;
    int _1530 = _1512 * _1514;
    float _1532 = as_type<float>(_799) * _1518;
    bool _1534 = !_1390;
    int _1536 = _1534 ? 0 : 1;
    float _1538 = float(uint(_1354));
    float _1540 = trunc(_1528);
    float _1542 = precise::max(_1540, 0.0);
    uint _1544 = uint(_1542);
    bool _1546 = uint(_1522) >= uint(_771);
    bool _1548 = !_1398;
    int _1550 = _1548 ? 0 : 1;
    float _1552 = as_type<float>(_958) * _1538;
    int _1554 = abs(_1536);
    int _1556 = abs(_1550);
    float _1558 = trunc(_1532);
    float _1560 = precise::max(_1558, 0.0);
    uint _1562 = uint(_1560);
    bool _1564 = !_1526;
    int _1566 = _1564 ? 0 : 1;
    int _1568 = ~_811;
    int _1570 = _1568 + 1;
    int _1572 = _1370 * _1554;
    int _1574 = _1572 + _1530;
    int _1576 = abs(_1566);
    float _1578 = trunc(_1552);
    float _1580 = precise::max(_1578, 0.0);
    uint _1582 = uint(_1580);
    bool _1584 = !_1546;
    int _1586 = _1584 ? 0 : (-1);
    int _1588 = _1466 * _1556;
    int _1590 = _1588 + _1574;
    int _1592 = _1570 * int(_1544);
    int _1594 = _1592 + _1490;
    int _1596 = ~_1508;
    int _1598 = _1596 + _1586;
    int _1600 = _1598 + 1;
    int _1602 = _1412 * _1576;
    int _1604 = _1602 + _1590;
    float _1606 = float(uint(_1594));
    int _1608 = _771 * _1600;
    int _1610 = _1608 + _1230;
    bool _1612 = _771 == 0;
    int _1614 = int(_1462) + int(_1562);
    float _1616 = as_type<float>(_958) * _1606;
    bool _1618 = !_1612;
    int _1620 = _1618 ? _1610 : (-1);
    int _1622 = _1570 * int(_1582);
    int _1624 = _1622 + _1354;
    float _1626 = float(uint(_1604));
    float _1628 = trunc(_1616);
    float _1630 = precise::max(_1628, 0.0);
    uint _1632 = uint(_1630);
    int _1634 = _1620 & 3;
    bool _1636 = _1634 != 0;
    float _1638 = float(uint(_1624));
    float _1640 = as_type<float>(_980) * _1626;
    int _1642 = _1620 & 3;
    bool _1644 = _1642 != 0;
    int _1646 = _1636 ? 0 : 1;
    float _1648 = as_type<float>(_958) * _1638;
    float _1650 = float(uint(_1466));
    float _1652 = trunc(_1640);
    float _1654 = precise::max(_1652, 0.0);
    uint _1656 = uint(_1654);
    bool _1658 = uint(_1642) > 1u;
    int _1660 = ~_868;
    int _1662 = _1660 + 1;
    float _1664 = as_type<float>(_980) * _1650;
    int _1666 = ~_1646;
    int _1668 = _1666 + 1;
    int _1670 = _1668 + 1;
    float _1672 = trunc(_1648);
    float _1674 = precise::max(_1672, 0.0);
    uint _1676 = uint(_1674);
    int _1678 = int(_1544) + int(_1632);
    int _1680 = ~_771;
    int _1682 = _1680 + 1;
    int _1684 = ~_811;
    int _1686 = _1684 + 1;
    int _1688 = _1670;
    if (!_1658)
    {
        int _1690 = ~_1646;
        int _1692 = _1690 + 1;
        _1688 = _1692;
    }
    int _1694 = _1688;
    int _1696 = _1662 * int(_1656);
    int _1698 = _1696 + _1604;
    bool _1700 = uint(_1642) >= 2u;
    int _1702 = _1682 * _1614;
    int _1704 = _1702 + _1176;
    float _1706 = trunc(_1664);
    float _1708 = precise::max(_1706, 0.0);
    uint _1710 = uint(_1708);
    int _1712 = ~_868;
    int _1714 = _1712 + 1;
    float _1716 = float(uint(_1698));
    int _1718 = _1700 ? 0 : 1;
    bool _1720 = uint(_1704) >= uint(_771);
    float _1722 = as_type<float>(_980) * _1716;
    int _1724 = _1686 * _1678;
    int _1726 = _1724 + _1490;
    int _1728 = ~_1718;
    int _1730 = _1728 + 1;
    int _1732 = _1730 + 1;
    bool _1734 = !_1720;
    int _1736 = _1734 ? 0 : (-1);
    bool _1738 = uint(_1726) >= uint(_811);
    float _1740 = trunc(_1722);
    float _1742 = precise::max(_1740, 0.0);
    uint _1744 = uint(_1742);
    int _1746 = ~_1614;
    int _1748 = _1746 + _1736;
    int _1750 = _1748 + 1;
    int _1752 = _1714 * int(_1710);
    int _1754 = _1752 + _1466;
    bool _1756 = !_1738;
    int _1758 = _1756 ? 0 : (-1);
    bool _1760 = _1642 != 3;
    int _1762 = _771 * _1750;
    int _1764 = _1762 + _1176;
    int _1766 = ~_1678;
    int _1768 = _1766 + _1758;
    int _1770 = _1768 + 1;
    float _1772 = float(uint(_1754));
    int _1774 = ~_868;
    int _1776 = _1774 + 1;
    int _1778 = _811 * _1770;
    int _1780 = _1778 + _1490;
    bool _1782 = !_1644;
    int _1784 = _1782 ? 0 : 1;
    float _1786 = as_type<float>(_980) * _1772;
    bool _1788 = !_1612;
    int _1790 = _1788 ? _1764 : (-1);
    bool _1792 = !_1330;
    int _1794 = _1792 ? _1780 : (-1);
    float _1796 = trunc(_1786);
    float _1798 = precise::max(_1796, 0.0);
    uint _1800 = uint(_1798);
    int _1802 = int(_1656) + int(_1744);
    int _1804 = _1732;
    if (_1760)
    {
        int _1806 = ~_1718;
        int _1808 = _1806 + 1;
        _1804 = _1808;
    }
    int _1810 = _1804;
    int _1812 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _1814 = _1812 != 0;
    int _1816 = _1776 * _1802;
    int _1818 = _1816 + _1604;
    int _1820 = _1794 & 3;
    bool _1822 = _1820 != 0;
    int _1824 = _1794 & 3;
    bool _1826 = _1824 != 0;
    bool _1828 = !_1814;
    int _1830 = _1828 ? 0 : 1;
    bool _1832 = uint(_1820) > 1u;
    int _1834 = _1826 ? 0 : 1;
    bool _1836 = uint(_1818) >= uint(_868);
    int _1838 = int(_1582) + int(_1676);
    bool _1840 = !_1836;
    int _1842 = _1840 ? 0 : (-1);
    int _1844 = ~_811;
    int _1846 = _1844 + 1;
    int _1848 = ~_1802;
    int _1850 = _1848 + _1842;
    int _1852 = _1850 + 1;
    int _1854 = ~_1834;
    int _1856 = _1854 + 1;
    int _1858 = _1856 + 1;
    int _1860 = _1846 * _1838;
    int _1862 = _1860 + _1354;
    int _1864 = _1858;
    if (!_1832)
    {
        int _1866 = ~_1834;
        int _1868 = _1866 + 1;
        _1864 = _1868;
    }
    int _1870 = _1864;
    int _1872 = _868 * _1852;
    int _1874 = _1872 + _1604;
    bool _1876 = _1642 != 3;
    bool _1878 = uint(_1820) >= 2u;
    int _1880 = _1794 >> 31;
    bool _1882 = !_1876;
    int _1884 = _1882 ? 0 : (-1);
    int _1886 = _1878 ? 0 : 1;
    bool _1888 = _1820 != 3;
    bool _1890 = _1820 != 3;
    int _1892 = _1880 & 3;
    bool _1894 = !_1822;
    int _1896 = _1894 ? 0 : 1;
    bool _1898 = !_1468;
    int _1900 = _1898 ? _1874 : (-1);
    bool _1902 = uint(_1862) >= uint(_811);
    int _1904 = _1620 >> 31;
    int _1906 = _1794 + _1892;
    int _1908 = _1900 >> 31;
    int _1910 = _1904 & 3;
    int _1912 = _1908 & 3;
    int _1914 = _1620 + _1910;
    int _1916 = ~_1886;
    int _1918 = _1916 + 1;
    int _1920 = _1918 + 1;
    int _1922 = _1920;
    if (_1888)
    {
        int _1924 = ~_1886;
        int _1926 = _1924 + 1;
        _1922 = _1926;
    }
    int _1928 = _1922;
    bool _1930 = !_1890;
    int _1932 = _1930 ? 0 : (-1);
    int _1934 = int(_1710) + int(_1800);
    int _1936 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4194304;
    bool _1938 = _1936 != 0;
    int _1940 = _1900 & 3;
    bool _1942 = _1940 != 0;
    int _1944 = _1900 + _1912;
    int _1946 = _1900 & 3;
    bool _1948 = _1946 != 0;
    float _1950 = in.m_50.x;
    float _1952 = in.m_50.y;
    float _1954 = in.m_50.z;
    int _1956 = _1914 >> 2;
    bool _1958 = !_1938;
    int _1960 = _1958 ? 0 : 1;
    bool _1962 = !_1902;
    int _1964 = _1962 ? 0 : (-1);
    bool _1966 = uint(_1946) > 1u;
    int _1968 = _1956 << 4;
    int _1970 = _1968 + 368;
    int _1972 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8388608;
    bool _1974 = _1972 != 0;
    int _1976 = _1906 >> 2;
    uint _1978 = uint(int(uint(_1970) >> uint(2)));
    uint _1980 = uint(int(uint(int(_1978)) >> uint(2)));
    int _1982 = int(_1978) & 3;
    float _1984 = (*spvDescriptorSet0.vp_c9)._m0[int(_1980)][_1982];
    int _1986 = int(_1978) + 1;
    uint _1988 = uint(int(uint(_1986) >> uint(2)));
    int _1990 = _1986 & 3;
    float _1992 = (*spvDescriptorSet0.vp_c9)._m0[int(_1988)][_1990];
    bool _1994 = !_1974;
    int _1996 = _1994 ? 0 : 1;
    int _1998 = ~_868;
    int _2000 = _1998 + 1;
    bool _2002 = _1946 != 3;
    int _2004 = _1976 << 4;
    int _2006 = _2004 + 512;
    int _2008 = _2000 * _1934;
    int _2010 = _2008 + _1466;
    int _2012 = _1942 ? 0 : 1;
    float _2014 = _197 * _1952;
    int _2016 = _1944 >> 2;
    uint _2018 = uint(int(uint(_2006) >> uint(2)));
    uint _2020 = uint(int(uint(int(_2018)) >> uint(2)));
    int _2022 = int(_2018) & 3;
    float _2024 = (*spvDescriptorSet0.vp_c9)._m0[int(_2020)][_2022];
    int _2026 = int(_2018) + 1;
    uint _2028 = uint(int(uint(_2026) >> uint(2)));
    int _2030 = _2026 & 3;
    float _2032 = (*spvDescriptorSet0.vp_c9)._m0[int(_2028)][_2030];
    bool _2034 = uint(_1946) >= 2u;
    float _2036 = _185 * _1952;
    int _2038 = ~_2012;
    int _2040 = _2038 + 1;
    int _2042 = _2040 + 1;
    int _2044 = _2042;
    if (!_1966)
    {
        int _2046 = ~_2012;
        int _2048 = _2046 + 1;
        _2044 = _2048;
    }
    int _2050 = _2044;
    float _2052 = fma(_183, _1950, _2036);
    int _2054 = _2016 << 4;
    int _2056 = _2054 + 656;
    float _2058 = trunc((*spvDescriptorSet0.vp_c9)._m0[90].z);
    int _2060 = int(_2058);
    bool _2062 = _1946 != 3;
    float _2064 = fma(_187, _1954, _2052);
    int _2066 = _2034 ? 0 : 1;
    uint _2068 = uint(int(uint(_2056) >> uint(2)));
    uint _2070 = uint(int(uint(int(_2068)) >> uint(2)));
    int _2072 = int(_2068) & 3;
    float _2074 = (*spvDescriptorSet0.vp_c9)._m0[int(_2070)][_2072];
    int _2076 = int(_2068) + 1;
    uint _2078 = uint(int(uint(_2076) >> uint(2)));
    int _2080 = _2076 & 3;
    float _2082 = (*spvDescriptorSet0.vp_c9)._m0[int(_2078)][_2080];
    bool _2084 = uint(_2010) >= uint(_868);
    int _2086 = ~_1838;
    int _2088 = _2086 + _1964;
    int _2090 = _2088 + 1;
    bool _2092 = !_1948;
    int _2094 = _2092 ? 0 : 1;
    int _2096 = _2006 + 8;
    uint _2098 = uint(int(uint(_2096) >> uint(2)));
    uint _2100 = uint(int(uint(int(_2098)) >> uint(2)));
    int _2102 = int(_2098) & 3;
    float _2104 = (*spvDescriptorSet0.vp_c9)._m0[int(_2100)][_2102];
    int _2106 = int(_2098) + 1;
    uint _2108 = uint(int(uint(_2106) >> uint(2)));
    int _2110 = _2106 & 3;
    float _2112 = (*spvDescriptorSet0.vp_c9)._m0[int(_2108)][_2110];
    int _2114 = ~_2066;
    int _2116 = _2114 + 1;
    int _2118 = _2116 + 1;
    int _2120 = _811 * _2090;
    int _2122 = _2120 + _1354;
    int _2124 = 2 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y);
    bool _2126 = _2124 != 0;
    int _2128 = _2118;
    if (_2002)
    {
        int _2130 = ~_2066;
        int _2132 = _2130 + 1;
        _2128 = _2132;
    }
    int _2134 = _2128;
    bool _2136 = !_2062;
    int _2138 = _2136 ? 0 : (-1);
    bool _2140 = !_2084;
    int _2142 = _2140 ? 0 : (-1);
    int _2144 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _2146 = _2144 != 0;
    int _2148 = _1970 + 8;
    uint _2150 = uint(int(uint(_2148) >> uint(2)));
    uint _2152 = uint(int(uint(int(_2150)) >> uint(2)));
    int _2154 = int(_2150) & 3;
    float _2156 = (*spvDescriptorSet0.vp_c9)._m0[int(_2152)][_2154];
    int _2158 = int(_2150) + 1;
    uint _2160 = uint(int(uint(_2158) >> uint(2)));
    int _2162 = _2158 & 3;
    float _2164 = (*spvDescriptorSet0.vp_c9)._m0[int(_2160)][_2162];
    int _2166 = ~_1934;
    int _2168 = _2166 + _2142;
    int _2170 = _2168 + 1;
    float _2172 = fma(_195, _1950, _2014);
    int _2174 = abs(_1694);
    int _2176 = abs(_2050);
    int _2178 = _868 * _2170;
    int _2180 = _2178 + _1466;
    int _2182 = _2056 + 8;
    uint _2184 = uint(int(uint(_2182) >> uint(2)));
    uint _2186 = uint(int(uint(int(_2184)) >> uint(2)));
    int _2188 = int(_2184) & 3;
    float _2190 = (*spvDescriptorSet0.vp_c9)._m0[int(_2186)][_2188];
    int _2192 = int(_2184) + 1;
    uint _2194 = uint(int(uint(_2192) >> uint(2)));
    int _2196 = _2192 & 3;
    float _2198 = (*spvDescriptorSet0.vp_c9)._m0[int(_2194)][_2196];
    int _2200 = abs(_1870);
    float _2202 = fma(_199, _1954, _2172);
    int _2204 = abs(_1784);
    int _2206 = ~_2174;
    int _2208 = _2206 + 1;
    int _2210 = _2208 + 1;
    int _2212 = ~_2204;
    int _2214 = _2212 + 1;
    int _2216 = _2214 + 1;
    int _2218 = _2210 * as_type<int>(_1992);
    int _2220 = ~_2200;
    int _2222 = _2220 + 1;
    int _2224 = _2222 + 1;
    int _2226 = _2216 * as_type<int>(_1984);
    int _2228 = _2226 + _2218;
    int _2230 = abs(_1896);
    int _2232 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y);
    bool _2234 = _2232 != 0;
    float _2236 = _191 * _1952;
    int _2238 = abs(_2094);
    float _2240 = trunc((*spvDescriptorSet0.vp_c9)._m0[80].z);
    int _2242 = int(_2240);
    int _2244 = abs(_1928);
    int _2246 = _2224 * as_type<int>(_2032);
    int _2248 = ~_2230;
    int _2250 = _2248 + 1;
    int _2252 = _2250 + 1;
    float _2254 = fma(_189, _1950, _2236);
    int _2256 = ~_2176;
    int _2258 = _2256 + 1;
    int _2260 = _2258 + 1;
    int _2262 = abs(_1810);
    float _2264 = trunc((*spvDescriptorSet0.vp_c9)._m0[85].z);
    int _2266 = int(_2264);
    int _2268 = _2252 * as_type<int>(_2024);
    int _2270 = _2268 + _2246;
    int _2272 = ~_2244;
    int _2274 = _2272 + 1;
    int _2276 = _2274 + 1;
    int _2278 = _2260 * as_type<int>(_2082);
    int _2280 = ~_2238;
    int _2282 = _2280 + 1;
    int _2284 = _2282 + 1;
    float _2286 = fma(_193, _1954, _2254);
    int _2288 = ~_2262;
    int _2290 = _2288 + 1;
    int _2292 = _2290 + 1;
    int _2294 = _2276 * as_type<int>(_2104);
    int _2296 = _2294 + _2270;
    int _2298 = abs(_2134);
    int _2300 = _2284 * as_type<int>(_2074);
    int _2302 = _2300 + _2278;
    int _2304 = abs(_1884);
    int _2306 = _2292 * as_type<int>(_2156);
    int _2308 = _2306 + _2228;
    int _2310 = ~_2298;
    int _2312 = _2310 + 1;
    int _2314 = _2312 + 1;
    int _2316 = abs(_2138);
    int _2318 = ~_2304;
    int _2320 = _2318 + 1;
    int _2322 = _2320 + 1;
    float _2324 = float(uint(_2242));
    int _2326 = _2314 * as_type<int>(_2190);
    int _2328 = _2326 + _2302;
    int _2330 = ~_2316;
    int _2332 = _2330 + 1;
    int _2334 = _2332 + 1;
    int _2336 = _2322 * as_type<int>(_2164);
    int _2338 = _2336 + _2308;
    int _2340 = abs(_2242);
    int _2342 = abs(_2266);
    float _2344 = 1.0 / _2324;
    int _2346 = abs(_1830);
    int _2348 = _2334 * as_type<int>(_2198);
    int _2350 = _2348 + _2328;
    float _2352 = float(uint(_2266));
    int _2354 = abs(_1932);
    float _2356 = 1.0 / _2352;
    int _2358 = ~_2346;
    int _2360 = _2358 + 1;
    int _2362 = _2360 + 1;
    int _2364 = ~_2354;
    int _2366 = _2364 + 1;
    int _2368 = _2366 + 1;
    int _2370 = abs(_1960);
    int _2372 = _2338 * _2362;
    float _2374 = float(uint(_2060));
    int _2376 = _2368 * as_type<int>(_2112);
    int _2378 = _2376 + _2296;
    int _2380 = ~_2370;
    int _2382 = _2380 + 1;
    int _2384 = _2382 + 1;
    int _2386 = _1790 * _2346;
    int _2388 = _2386 + _2372;
    int _2390 = abs(_1996);
    float _2392 = _876 * 2.0;
    float _2394 = 1.0 / _2374;
    float _2396 = float(uint(_2340));
    int _2398 = _2378 * _2384;
    bool _2400 = !_1330;
    int _2402 = _2400 ? _2122 : (-1);
    int _2404 = ~_2390;
    int _2406 = _2404 + 1;
    int _2408 = _2406 + 1;
    int _2410 = as_type<int>(_2344) + (-2);
    int _2412 = _2402 * _2370;
    int _2414 = _2412 + _2398;
    float _2416 = 1.0 / _2396;
    float _2418 = float(uint(_2388));
    int _2420 = _2350 * _2408;
    bool _2422 = !_1468;
    int _2424 = _2422 ? _2180 : (-1);
    float _2426 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    int _2428 = abs(_2060);
    float _2430 = as_type<float>(_2410) * _2418;
    float _2432 = _876 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    int _2434 = as_type<int>(_2356) + (-2);
    int _2436 = _2424 * _2390;
    int _2438 = _2436 + _2420;
    float _2440 = float(uint(_2414));
    float _2442 = -_2426;
    float _2444 = fma(_2432, 2.0, _2442);
    float _2446 = float(uint(_2342));
    float _2448 = trunc(_2430);
    float _2450 = precise::max(_2448, 0.0);
    uint _2452 = uint(_2450);
    float _2454 = as_type<float>(_2434) * _2440;
    float _2456 = -_153;
    float _2458 = fma(_2456, (*spvDescriptorSet0.vp_c9)._m0[76].x, _2444);
    int _2460 = as_type<int>(_2394) + (-2);
    float _2462 = float(uint(_2438));
    float _2464 = 1.0 / _2446;
    int _2466 = abs(_2388);
    float _2468 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _2470 = _878 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _2472 = as_type<float>(_2460) * _2462;
    int _2474 = as_type<int>(_2416) + (-2);
    float _2476 = trunc(_2454);
    float _2478 = precise::max(_2476, 0.0);
    uint _2480 = uint(_2478);
    float _2482 = float(uint(_2466));
    float _2484 = fma(_2470, -2.0, _2468);
    float _2486 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _2488 = _2486 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    int _2490 = ~_2242;
    int _2492 = _2490 + 1;
    float _2494 = as_type<float>(_2474) * _2482;
    int _2496 = abs(_2438);
    float _2498 = trunc(_2472);
    float _2500 = precise::max(_2498, 0.0);
    uint _2502 = uint(_2500);
    float _2504 = float(uint(_2428));
    float _2506 = fma(_153, (*spvDescriptorSet0.vp_c9)._m0[76].y, _2484);
    int _2508 = abs(_2414);
    float _2510 = 1.0 / _2488;
    int _2512 = ~_2266;
    int _2514 = _2512 + 1;
    int _2516 = _2492 * int(_2452);
    int _2518 = _2516 + _2388;
    int _2520 = ~_2060;
    int _2522 = _2520 + 1;
    int _2524 = as_type<int>(_2464) + (-2);
    int _2526 = _2514 * int(_2480);
    int _2528 = _2526 + _2414;
    float _2530 = float(uint(_2508));
    float _2532 = trunc(_2494);
    float _2534 = precise::max(_2532, 0.0);
    uint _2536 = uint(_2534);
    float _2538 = as_type<float>(_2524) * _2530;
    float _2540 = float(uint(_2518));
    int _2542 = _2522 * int(_2502);
    int _2544 = _2542 + _2438;
    int _2546 = ~_2340;
    int _2548 = _2546 + 1;
    float _2550 = 1.0 / _2504;
    float _2552 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _2554 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _2552;
    float _2556 = float(uint(_2528));
    float _2558 = as_type<float>(_2410) * _2540;
    float _2560 = float(uint(_2544));
    float _2562 = _2554 * _2510;
    float _2564 = _876 + _878;
    float _2566 = float(uint(_2496));
    float _2568 = floor(_2392);
    int _2570 = _2548 * int(_2536);
    int _2572 = _2570 + _2466;
    float _2574 = as_type<float>(_2434) * _2556;
    float _2576 = _2564 + (-1.0);
    float _2578 = as_type<float>(_2460) * _2560;
    int _2580 = ~_2342;
    int _2582 = _2580 + 1;
    float _2584 = trunc(_2538);
    float _2586 = precise::max(_2584, 0.0);
    uint _2588 = uint(_2586);
    int _2590 = as_type<int>(_2550) + (-2);
    float _2592 = float(uint(_2572));
    float _2594 = fma(_2576, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _2596 = as_type<float>(_2590) * _2566;
    bool _2598 = _942 != 1;
    float _2600 = trunc(_2558);
    float _2602 = precise::max(_2600, 0.0);
    uint _2604 = uint(_2602);
    float _2606 = as_type<float>(_2474) * _2592;
    bool _2608 = _2568 > 0.0;
    float _2610 = _878 + _880;
    bool _2612 = _2568 >= 0.0;
    bool _2614 = isnan(_2568);
    bool _2616 = _2612 || _2614;
    bool _2618 = isnan(0.0);
    bool _2620 = _2616 || _2618;
    bool _2622 = _878 > 0.5;
    float _2624 = _2610 + (-1.0);
    float _2626 = trunc(_2596);
    float _2628 = precise::max(_2626, 0.0);
    uint _2630 = uint(_2628);
    int _2632 = _2582 * int(_2588);
    int _2634 = _2632 + _2508;
    float _2636 = -_217;
    int _2638 = _2622 ? as_type<int>(_2636) : as_type<int>(_217);
    float _2640 = float(uint(_2634));
    float _2642 = trunc(_2606);
    float _2644 = precise::max(_2642, 0.0);
    uint _2646 = uint(_2644);
    int _2648 = int(_2452) + int(_2604);
    float _2650 = fma(_2624, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    int _2652 = ~_2428;
    int _2654 = _2652 + 1;
    float _2656 = as_type<float>(_2524) * _2640;
    int _2658 = ~_2242;
    int _2660 = _2658 + 1;
    float _2662 = trunc(_2574);
    float _2664 = precise::max(_2662, 0.0);
    uint _2666 = uint(_2664);
    int _2668 = _2654 * int(_2630);
    int _2670 = _2668 + _2496;
    int _2672 = ~_2340;
    int _2674 = _2672 + 1;
    int _2676 = _2660 * _2648;
    int _2678 = _2676 + _2388;
    float _2680 = trunc(_2656);
    float _2682 = precise::max(_2680, 0.0);
    uint _2684 = uint(_2682);
    int _2686 = int(_2536) + int(_2646);
    float _2688 = float(uint(_2670));
    bool _2690 = !_2126;
    float _2692 = _2690 ? _217 : as_type<float>(_2638);
    int _2694 = _2674 * _2686;
    int _2696 = _2694 + _2466;
    bool _2698 = _880 > 0.5;
    float _2700 = trunc(_2578);
    float _2702 = precise::max(_2700, 0.0);
    uint _2704 = uint(_2702);
    int _2706 = int(_2480) + int(_2666);
    float _2708 = as_type<float>(_2590) * _2688;
    int _2710 = ~_2266;
    int _2712 = _2710 + 1;
    float _2714 = in.m_64.w;
    bool _2716 = uint(_2678) >= uint(_2242);
    float _2718 = -_213;
    int _2720 = _2698 ? as_type<int>(_2718) : as_type<int>(_213);
    int _2722 = _2712 * _2706;
    int _2724 = _2722 + _2414;
    bool _2726 = !_2716;
    int _2728 = _2726 ? 0 : (-1);
    float _2730 = trunc(_2708);
    float _2732 = precise::max(_2730, 0.0);
    uint _2734 = uint(_2732);
    bool _2736 = !_2146;
    float _2738 = _2736 ? _213 : as_type<float>(_2720);
    bool _2740 = uint(_2696) >= uint(_2340);
    bool _2742 = _876 > 0.5;
    int _2744 = int(_2588) + int(_2684);
    int _2746 = ~_2648;
    int _2748 = _2746 + _2728;
    int _2750 = _2748 + 1;
    int _2752 = ~_2342;
    int _2754 = _2752 + 1;
    bool _2756 = uint(_2724) >= uint(_2266);
    int _2758 = _2242 * _2750;
    int _2760 = _2758 + _2388;
    int _2762 = int(_2502) + int(_2704);
    int _2764 = ~_2060;
    int _2766 = _2764 + 1;
    float _2768 = _2286 + _2714;
    float _2770 = -_213;
    int _2772 = _2742 ? as_type<int>(_2770) : as_type<int>(_213);
    bool _2774 = _944 != 2;
    int _2776 = _2754 * _2744;
    int _2778 = _2776 + _2508;
    bool _2780 = !_2740;
    int _2782 = _2780 ? 0 : (-1);
    int _2784 = _2766 * _2762;
    int _2786 = _2784 + _2438;
    bool _2788 = _2242 == 0;
    bool _2790 = !_2756;
    int _2792 = _2790 ? 0 : (-1);
    bool _2794 = !_2788;
    int _2796 = _2794 ? _2760 : (-1);
    int _2798 = ~_2706;
    int _2800 = _2798 + _2792;
    int _2802 = _2800 + 1;
    bool _2804 = uint(_2778) >= uint(_2342);
    bool _2806 = uint(_2786) >= uint(_2060);
    int _2808 = _2266 * _2802;
    int _2810 = _2808 + _2414;
    int _2812 = int(_2630) + int(_2734);
    int _2814 = ~_2428;
    int _2816 = _2814 + 1;
    bool _2818 = !_2804;
    int _2820 = _2818 ? 0 : (-1);
    bool _2822 = _2266 == 0;
    int _2824 = _2816 * _2812;
    int _2826 = _2824 + _2496;
    bool _2828 = !_2234;
    float _2830 = _2828 ? _213 : as_type<float>(_2772);
    bool _2832 = _2242 == 0;
    int _2834 = _2388 ^ _2242;
    bool _2836 = !_2822;
    int _2838 = _2836 ? _2810 : (-1);
    bool _2840 = _2266 == 0;
    int _2842 = _2414 ^ _2266;
    float _2844 = _878 * 2.0;
    bool _2846 = !_2806;
    int _2848 = _2846 ? 0 : (-1);
    bool _2850 = uint(_2826) >= uint(_2428);
    int _2852 = ~_2782;
    int _2854 = _2686 + _2852;
    int _2856 = _2854 + 1;
    float _2858 = floor(_2844);
    int _2860 = ~_2820;
    int _2862 = _2744 + _2860;
    int _2864 = _2862 + 1;
    float _2866 = in.m_62.w;
    uint _2868 = uint(int(uint(_2842) >> uint(31)));
    uint _2870 = uint(int(uint(_2834) >> uint(31)));
    int _2872 = ~_2762;
    int _2874 = _2872 + _2848;
    int _2876 = _2874 + 1;
    float _2878 = _880 * 2.0;
    float _2880 = as_type<float>(_2388);
    float _2882 = as_type<float>(_2826);
    float _2884 = as_type<float>(_2414);
    float _2886 = as_type<float>(_2724);
    float _2888 = _2768;
    if (!_2598)
    {
        _2880 = _878;
    }
    float _2890 = _2880;
    float _2892 = in.m_66.w;
    int _2894 = ~int(_2868);
    int _2896 = _2894 + 1;
    float _2898 = floor(_2878);
    int _2900 = ~int(_2870);
    int _2902 = _2900 + 1;
    int _2904 = _2060 * _2876;
    int _2906 = _2904 + _2438;
    float _2908 = _2890;
    float _2910 = as_type<float>(_2902);
    if (!_2598)
    {
        _2882 = _2890;
    }
    float _2912 = _2882;
    float _2914 = _2912;
    if (!_2598)
    {
        _2884 = _880;
    }
    float _2916 = _2884;
    float _2918 = _2916;
    if (!_2598)
    {
        _2886 = _880;
    }
    float _2920 = _2886;
    float _2922 = _2920;
    if (_2598)
    {
        _2914 = _876;
    }
    float _2924 = _2914;
    if (_2598)
    {
        _2908 = _876;
    }
    float _2926 = _2908;
    if (_2598)
    {
        _2918 = _878;
    }
    float _2928 = _2918;
    float _2930 = _2064 + _2866;
    float _2932 = _2930;
    if (_2598)
    {
        _2922 = _878;
    }
    float _2934 = _2922;
    float _2936 = _2924 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    bool _2938 = _2060 == 0;
    float _2940 = _2928 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    int _2942 = _2864 ^ _2896;
    int _2944 = _2856 ^ _2902;
    bool _2946 = !_2938;
    int _2948 = _2946 ? _2906 : (-1);
    int _2950 = ~_2896;
    int _2952 = _2950 + _2942;
    int _2954 = _2952 + 1;
    float _2956 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _2958 = _761 + _2956;
    bool _2960 = !_2850;
    int _2962 = _2960 ? 0 : (-1);
    int _2964 = ~_2902;
    int _2966 = _2964 + _2944;
    int _2968 = _2966 + 1;
    float _2970 = fma(_2562, _2958, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    bool _2972 = _761 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _2974 = isnan(_761);
    bool _2976 = _2972 || _2974;
    bool _2978 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _2980 = _2976 || _2978;
    float _2982 = float(_2980);
    bool _2984 = _2858 > 0.0;
    bool _2986 = _2858 >= 0.0;
    bool _2988 = isnan(_2858);
    bool _2990 = _2986 || _2988;
    bool _2992 = isnan(0.0);
    bool _2994 = _2990 || _2992;
    float _2996 = -_2982;
    float _2998 = _2996 + 1.0;
    float _3000 = as_type<float>(_2944);
    if (_2774)
    {
        _3000 = _876;
    }
    float _3002 = _3000;
    float _3004 = _3002;
    if (_2774)
    {
        _2910 = _878;
    }
    float _3006 = _2910;
    bool _3008 = _761 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _3010 = isnan(_761);
    bool _3012 = _3008 || _3010;
    bool _3014 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _3016 = _3012 || _3014;
    float _3018 = float(_3016);
    float _3020 = _3006;
    if (!_2774)
    {
        _3004 = _880;
    }
    float _3022 = _3004;
    if (!_2774)
    {
        _3020 = _876;
    }
    float _3024 = _3020;
    float _3026 = _3018 * _2998;
    bool _3028 = !_2832;
    int _3030 = _3028 ? _2968 : (-1);
    float _3032 = _3022 * (*spvDescriptorSet0.vp_c9)._m0[87].x;
    bool _3034 = !_2840;
    int _3036 = _3034 ? _2954 : (-1);
    float _3038 = _2970 * _3026;
    int _3040 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _3042 = _3040 != 0;
    int _3044 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _3046 = _3044 != 0;
    int _3048 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _3050 = _3048 != 0;
    float _3052 = -_3018;
    float _3054 = _3052 + 1.0;
    int _3056 = _2620 ? 0 : 1;
    float _3058 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    bool _3060 = _2898 > 0.0;
    bool _3062 = !_3046;
    int _3064 = _3062 ? 0 : 1;
    bool _3066 = _2898 >= 0.0;
    bool _3068 = isnan(_2898);
    bool _3070 = _3066 || _3068;
    bool _3072 = isnan(0.0);
    bool _3074 = _3070 || _3072;
    int _3076 = _2438 ^ _2060;
    float _3078 = fma(_3054, (*spvDescriptorSet0.vp_c9)._m0[131].x, _3038);
    int _3080 = _3074 ? 0 : 1;
    float _3082 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    uint _3084 = uint(int(uint(_3076) >> uint(31)));
    float _3086 = fma(_2982, (*spvDescriptorSet0.vp_c9)._m0[132].x, _3078);
    int _3088 = ~_2962;
    int _3090 = _2812 + _3088;
    int _3092 = _3090 + 1;
    float _3094 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _3096 = _2768 + _3094;
    bool _3098 = _2060 == 0;
    float _3100 = _2202 + _2892;
    int _3102 = ~_3080;
    int _3104 = _3102 + 1;
    int _3106 = _3104 + 1;
    float _3108 = _3058 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    int _3110 = _3106;
    if (!_3060)
    {
        int _3112 = ~_3080;
        int _3114 = _3112 + 1;
        _3110 = _3114;
    }
    int _3116 = _3110;
    float _3118 = _3096 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    int _3120 = ~int(_3084);
    int _3122 = _3120 + 1;
    float _3124 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _3126 = _2930 + _3124;
    float _3128 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _3130 = _3100 + _3128;
    int _3132 = _3092 ^ _3122;
    float _3134 = fma(_3126, (*spvDescriptorSet0.vp_c8)._m0[28].x, _3118);
    float _3136 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    int _3138 = ~_3122;
    int _3140 = _3138 + _3132;
    int _3142 = _3140 + 1;
    float _3144 = fma(_3130, (*spvDescriptorSet0.vp_c8)._m0[28].z, _3134);
    float _3146 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _3148 = float(_2838);
    float _3150 = (*spvDescriptorSet0.vp_c9)._m0[87].x + (*spvDescriptorSet0.vp_c9)._m0[86].z;
    bool _3152 = _3144 >= 0.0;
    float _3154 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _3156 = -_3150;
    float _3158 = fma(_3032, 2.0, _3156);
    float _3160 = float(_2796);
    float _3162 = fma(_2926, (*spvDescriptorSet0.vp_c9)._m0[83].z, _3154);
    float _3164 = float(_3030);
    float _3166 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _3168 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].z;
    float _3170 = fma(_3108, _3160, _2458);
    float _3172 = -_3166;
    float _3174 = fma(_2936, 2.0, _3172);
    float _3176 = fma(_2940, -2.0, _3136);
    float _3178 = _3024 * (*spvDescriptorSet0.vp_c9)._m0[87].y;
    float _3180 = _3146 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _3182 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _3184 = (*spvDescriptorSet0.vp_c9)._m0[87].y + (*spvDescriptorSet0.vp_c9)._m0[86].w;
    float _3186 = -_153;
    float _3188 = fma(_3186, (*spvDescriptorSet0.vp_c9)._m0[81].x, _3174);
    float _3190 = _3082 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    bool _3192 = !_3098;
    int _3194 = _3192 ? _3142 : (-1);
    float _3196 = fma(_3178, -2.0, _3184);
    float _3198 = fma(_3180, _3148, _3188);
    float _3200 = _2830 + 0.5;
    float _3202 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].w;
    float _3204 = float(_2948);
    float _3206 = _3168 * (*spvDescriptorSet0.vp_c9)._m0[90].x;
    float _3208 = -_153;
    float _3210 = fma(_3208, (*spvDescriptorSet0.vp_c9)._m0[86].x, _3158);
    float _3212 = fma(_3108, _3200, _3170);
    float _3214 = -_2506;
    float _3216 = fma(_3190, _3164, _3214);
    float _3218 = float(_3036);
    float _3220 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _3222 = _3182 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _3224 = fma(_153, (*spvDescriptorSet0.vp_c9)._m0[81].y, _3176);
    float _3226 = float(_3194);
    float _3228 = _2692 + (-0.5);
    float _3230 = fma(_153, (*spvDescriptorSet0.vp_c9)._m0[86].y, _3196);
    float _3232 = fma(_3206, _3204, _3210);
    float _3234 = fma(_2934, (*spvDescriptorSet0.vp_c9)._m0[83].w, _3220);
    float _3236 = -_3224;
    float _3238 = fma(_3222, _3218, _3236);
    float _3240 = _3202 * (*spvDescriptorSet0.vp_c9)._m0[90].y;
    float _3242 = -_3190;
    float _3244 = fma(_3242, _3228, _3216);
    float _3246 = _1288 + (-0.5);
    float _3248 = -_3230;
    float _3250 = fma(_3240, _3226, _3248);
    float _3252 = _1060 + (-0.5);
    float _3254 = -_3222;
    float _3256 = fma(_3254, _3246, _3238);
    float _3258 = _1074 + 0.5;
    float _3260 = -_3240;
    float _3262 = fma(_3260, _3252, _3250);
    float _3264 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _3266 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _3268 = fma(_3206, _3258, _3232);
    float _3270 = fma(_878, (*spvDescriptorSet0.vp_c9)._m0[78].w, _3264);
    float _3272 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _3274 = log2(_3272);
    float _3276 = fma(_876, (*spvDescriptorSet0.vp_c9)._m0[78].z, _3266);
    float _3278 = (*spvDescriptorSet0.vp_c9)._m0[88].z + (*spvDescriptorSet0.vp_c9)._m0[88].x;
    float _3280 = fma(_153, (*spvDescriptorSet0.vp_c9)._m0[77].w, _3270);
    float _3282 = fma(_153, (*spvDescriptorSet0.vp_c9)._m0[82].w, _3234);
    float _3284 = fma(_153, (*spvDescriptorSet0.vp_c9)._m0[77].z, _3276);
    float _3286 = fma(_876, (*spvDescriptorSet0.vp_c9)._m0[88].z, _3278);
    float _3288 = -_3280;
    float _3290 = _3288 + 1.0;
    float _3292 = _2738 + 0.5;
    float _3294 = -_3284;
    float _3296 = _3294 + 1.0;
    float _3298 = fma(_153, (*spvDescriptorSet0.vp_c9)._m0[87].z, _3286);
    float _3300 = fma(_2692, _3290, _3244);
    float _3302 = -_3296;
    float _3304 = fma(_2830, _3302, _3212);
    float _3306 = _3096 * _3096;
    float _3308 = -_3298;
    float _3310 = _3308 + 1.0;
    float _3312 = fma(_153, (*spvDescriptorSet0.vp_c9)._m0[82].z, _3162);
    float _3314 = (*spvDescriptorSet0.vp_c9)._m0[88].w + (*spvDescriptorSet0.vp_c9)._m0[88].y;
    float _3316 = fma(_3126, _3126, _3306);
    float _3318 = _3252;
    if (_3152)
    {
        _3318 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _3320 = _3318;
    float _3322 = -_3310;
    float _3324 = fma(_1074, _3322, _3268);
    float _3326 = fma(_878, (*spvDescriptorSet0.vp_c9)._m0[88].w, _3314);
    float _3328 = -_3282;
    float _3330 = _3328 + 1.0;
    float _3332 = fma(_3130, _3130, _3316);
    float _3334 = fma(_3180, _3292, _3198);
    float _3336 = fma(_153, (*spvDescriptorSet0.vp_c9)._m0[87].w, _3326);
    float _3338 = -_3312;
    float _3340 = _3338 + 1.0;
    float _3342 = _3274 * _153;
    float _3344 = fma(_1288, _3330, _3256);
    float _3346 = -_3336;
    float _3348 = _3346 + 1.0;
    int _3350 = as_type<int>(_3336);
    if (_3152)
    {
        float _3352 = _3320 * 5.0;
        _3350 = as_type<int>(_3352);
    }
    int _3354 = _3350;
    float _3356 = -_3340;
    float _3358 = fma(_2738, _3356, _3334);
    float _3360 = _3086 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _3362 = rsqrt(_3332);
    float _3364 = fma(_1060, _3348, _3262);
    float _3366 = _976 * (*spvDescriptorSet0.vp_c9)._m0[18].w;
    out.m_74.x = _3304;
    out.m_74.y = _3300;
    out.m_74.z = _3358;
    out.m_74.w = _3344;
    float _3368 = exp2(_3342);
    bool _3370 = !_3050;
    int _3372 = _3370 ? 0 : 1;
    float _3374 = in.m_76.x;
    float _3376 = in.m_76.y;
    float _3378 = in.m_76.z;
    bool _3380 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _3382 = isnan(1.0);
    bool _3384 = _3380 || _3382;
    bool _3386 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _3388 = _3384 || _3386;
    float _3390 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _3392 = 1.0 + _3390;
    float _3394 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _3396 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _3398 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _3400 = 1.0 / _3392;
    float _3402 = _3394 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _3404 = _3396 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _3406 = _3398 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    if (_3152)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _9969 = as_type<float>(_3354);
        out.gl_Position.z = _9969;
    }
    bool _3408 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _3410 = isnan(0.0);
    bool _3412 = _3408 || _3410;
    bool _3414 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _3416 = _3412 || _3414;
    float _3418 = float(_3116);
    out.m_78.x = _3402;
    out.m_78.y = _3404;
    out.m_78.z = _3406;
    out.m_78.w = _3360;
    float _3420 = -_3368;
    float _3422 = _3420 + 1.0;
    out.m_80.x = _3324;
    out.m_80.y = _3364;
    if (_3152)
    {
        out.m_53.x = 0.0;
    }
    int _3424 = ~_3056;
    int _3426 = _3424 + 1;
    int _3428 = _3426 + 1;
    bool _3430 = !_3042;
    int _3432 = _3430 ? 0 : 1;
    float _3434 = _3366 * _3362;
    float _3436 = _3126 * _3434;
    float _3438 = _3096 * _3434;
    float _3440 = _3130 * _3434;
    int _3442 = _3428;
    if (_3152)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _3444 = -_3438;
    float _3446 = _2768 + _3444;
    float _3448 = -_3436;
    float _3450 = _2930 + _3448;
    int _3452 = abs(_3432);
    float _3454 = -_3440;
    float _3456 = _3100 + _3454;
    float _3458 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _3460 = _3446 + _3458;
    float _3462 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _3464 = _3450 + _3462;
    float _3466 = -_3438;
    float _3468 = _3096 + _3466;
    float _3470 = float(_3452);
    float _3472 = _3460 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _3474 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _3476 = _3456 + _3474;
    float _3478 = -_3436;
    float _3480 = _3126 + _3478;
    float _3482 = _3468 * _3468;
    float _3484 = fma(_3464, (*spvDescriptorSet0.vp_c8)._m0[28].x, _3472);
    float _3486 = _3470 * _3418;
    float _3488 = _3446;
    if (!_2608)
    {
        int _3490 = ~_3056;
        int _3492 = _3490 + 1;
        _3442 = _3492;
    }
    int _3494 = _3442;
    float _3496 = fma(_3480, _3480, _3482);
    float _3498 = fma(_3476, (*spvDescriptorSet0.vp_c8)._m0[28].z, _3484);
    float _3500 = _3486 * (-2.0);
    int _3502 = abs(_3064);
    float _3504 = _876 + (-0.5);
    float _3506 = _3416 ? _3422 : 0.0;
    float _3508 = fma(_3500, _3374, _3374);
    bool _3510 = _3498 >= 0.0;
    float _3512 = fma(_2594, _3500, _2594);
    float _3514 = float(_3494);
    float _3516 = _3514;
    if (_3388)
    {
        float _3518 = _3506 * _3400;
        _155 = _3518;
    }
    float _3520 = _155;
    float _3522 = float(_3502);
    float _3524 = fma(_3504, (*spvDescriptorSet0.vp_c9)._m0[196].x, _3508);
    float _3526 = -_3440;
    float _3528 = _3130 + _3526;
    int _3530 = _2994 ? 0 : 1;
    float _3532 = _3522 * _3514;
    float _3534 = fma(_3512, _3520, _3524);
    float _3536 = fma(_3528, _3528, _3496);
    int _3538 = ~_3530;
    int _3540 = _3538 + 1;
    int _3542 = _3540 + 1;
    float _3544 = _3532 * (-2.0);
    float _3546 = _3534 * 0.15915493667125701904296875;
    int _3548 = _3542;
    if (_3510)
    {
        _3516 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _3550 = _3516;
    float _3552 = fma(_2650, _3544, _2650);
    float _3554 = fma(_3544, _3376, _3376);
    float _3556 = _878 + (-0.5);
    float _3558 = sqrt(_3536);
    int _3560 = as_type<int>(_3550);
    if (_3510)
    {
        float _3562 = _3550 * 5.0;
        _3560 = as_type<int>(_3562);
    }
    int _3564 = _3560;
    if (_3510)
    {
        out.m_53.x = 0.0;
    }
    if (!_2984)
    {
        int _3566 = ~_3530;
        int _3568 = _3566 + 1;
        _3548 = _3568;
    }
    int _3570 = _3548;
    int _3572 = abs(_3372);
    if (_3510)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _10232 = as_type<float>(_3564);
        out.gl_Position.z = _10232;
    }
    float _3574 = _3546 * 6.283185482025146484375;
    float _3576 = sin(_3574);
    if (_3510)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _3578 = -_2768;
    float _3580 = _3578 + (*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _3582 = float(_3570);
    float _3584 = -_2930;
    float _3586 = _3584 + (*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _3588 = -_3100;
    float _3590 = _3588 + (*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _3592 = _3580 * _3580;
    float _3594 = fma(_3556, (*spvDescriptorSet0.vp_c9)._m0[196].y, _3554);
    float _3596 = _876 + _880;
    float _3598 = fma(_3586, _3586, _3592);
    float _3600 = float(_3572);
    float _3602 = fma(_3552, _3520, _3594);
    float _3604 = fma(_3590, _3590, _3598);
    float _3606 = _3596 + (-1.0);
    float _3608 = _3600 * _3582;
    float _3610 = _3602 * 0.15915493667125701904296875;
    float _3612 = _880 + (-0.5);
    float _3614 = fma(_3606, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _3616 = rsqrt(_3604);
    float _3618 = _3608 * (-2.0);
    float _3620 = _3362 * _3558;
    float _3622 = _717 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _3624 = fma(_3618, _3378, _3378);
    float _3626 = fma(_3614, _3618, _3614);
    float _3628 = _3546 * 6.283185482025146484375;
    float _3630 = cos(_3628);
    float _3632 = fma(_3612, (*spvDescriptorSet0.vp_c9)._m0[196].z, _3624);
    float _3634 = fma(_3626, _3520, _3632);
    float _3636 = _3586 * _3616;
    float _3638 = _3590 * _3616;
    float _3640 = _3634 * 0.15915493667125701904296875;
    float _3642 = _3580 * _3616;
    float _3644 = -(*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _3646 = _3636 * _3644;
    float _3648 = -(*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _3650 = _3638 * _3648;
    float _3652 = _3610 * 6.283185482025146484375;
    float _3654 = sin(_3652);
    float _3656 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _217);
    float _3658 = -(*spvDescriptorSet0.vp_c8)._m0[1].x;
    float _3660 = -_3646;
    float _3662 = fma(_3638, _3658, _3660);
    float _3664 = -(*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _3666 = -_3650;
    float _3668 = fma(_3642, _3664, _3666);
    float _3670 = -(*spvDescriptorSet0.vp_c8)._m0[1].x;
    float _3672 = _3642 * _3670;
    float _3674 = _3662 * _3662;
    float _3676 = _3610 * 6.283185482025146484375;
    float _3678 = cos(_3676);
    float _3680 = -(*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _3682 = -_3672;
    float _3684 = fma(_3636, _3680, _3682);
    float _3686 = fma(_3668, _3668, _3674);
    float _3688 = fma(_3684, _3684, _3686);
    float _3690 = _3640 * 6.283185482025146484375;
    float _3692 = cos(_3690);
    float _3694 = _3576 * _3654;
    float _3696 = _3640 * 6.283185482025146484375;
    float _3698 = sin(_3696);
    float _3700 = _3630 * _3678;
    float _3702 = _3576 * _3678;
    float _3704 = rsqrt(_3688);
    float _3706 = _3678 * _3692;
    float _3708 = _3620 * _3622;
    float _3710 = _3630 * _3692;
    float _3712 = _3576 * _3692;
    float _3714 = _3654 * _3692;
    float _3716 = _3656 * _3708;
    float _3718 = fma(_3698, _3700, _3694);
    float _3720 = fma(_3698, _3694, _3700);
    float _3722 = _3630 * _3654;
    float _3724 = _976 * _3620;
    float _3726 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _213);
    float _3728 = _3710 * _3716;
    float _3730 = -_3722;
    float _3732 = fma(_3698, _3702, _3730);
    float _3734 = -_3702;
    float _3736 = fma(_3698, _3722, _3734);
    float _3738 = _3726 * _3724;
    float _3740 = _3668 * _3704;
    float _3742 = _3662 * _3704;
    float _3744 = _3620 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _3746 = _3744 * 0.5;
    float _3748 = fma(_3718, _3738, _3728);
    float _3750 = _3684 * _3704;
    float _3752 = -_3716;
    float _3754 = _3698 * _3752;
    float _3756 = _3638 * _3742;
    float _3758 = _3642 * _3740;
    float _3760 = fma(_3736, _3746, _3748);
    float _3762 = _3712 * _3716;
    float _3764 = fma(_3706, _3738, _3754);
    float _3766 = -_3756;
    float _3768 = fma(_3642, _3750, _3766);
    float _3770 = -_3758;
    float _3772 = fma(_3636, _3742, _3770);
    float _3774 = fma(_3732, _3738, _3762);
    float _3776 = fma(_3714, _3746, _3764);
    float _3778 = _3768 * _3760;
    float _3780 = _3772 * _3760;
    float _3782 = fma(_3720, _3746, _3774);
    float _3784 = _3636 * _3750;
    float _3786 = fma(_3740, _3776, _3778);
    float _3788 = fma(_3750, _3776, _3780);
    float _3790 = -_3784;
    float _3792 = fma(_3638, _3740, _3790);
    float _3794 = fma(_3636, _3782, _3786);
    float _3796 = fma(_3638, _3782, _3788);
    float _3798 = _3792 * _3760;
    float _3800 = _2930 + _3794;
    float _3802 = _3100 + _3796;
    float _3804 = fma(_3742, _3776, _3798);
    float _3806 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _3808 = _3800 + _3806;
    float _3810 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _3812 = _3802 + _3810;
    float _3814 = fma(_3642, _3782, _3804);
    float _3816 = _3808 * _3808;
    float _3818 = _3812 * _3812;
    float _3820 = _2768 + _3814;
    float _3822 = _3816 + _3818;
    float _3824 = sqrt(_3822);
    bool _3826 = _3824 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _3828 = _3794;
    float _3830 = _3800;
    float _3832 = _3802;
    float _3834 = _3816;
    float _3836 = _3818;
    if (!_3826)
    {
        _3828 = _3820;
    }
    float _3838 = _3828;
    bool _3840 = !_3826;
    float _3842 = _3838;
    if (!_3840)
    {
        float _3844 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _3846 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _3848 = _3824 + _3846;
        float _3850 = rsqrt(_3822);
        float _3852 = _3848 * _3844;
        float _3854 = _3820 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _3856 = _3852 * 0.15915493667125701904296875;
        float _3858 = _3856 * 6.283185482025146484375;
        float _3860 = sin(_3858);
        float _3862 = _3856 * 6.283185482025146484375;
        float _3864 = cos(_3862);
        float _3866 = fma(_3860, _3854, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _3868 = _3850 * _3866;
        float _3870 = _3864 + (-1.0);
        float _3872 = fma(_3808, _3868, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _3874 = fma(_3812, _3868, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _3876 = _3870 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _3878 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _3880 = _3872 + _3878;
        float _3882 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _3884 = _3874 + _3882;
        float _3886 = fma(_3820, _3864, _3876);
        float _3888 = _3880 * _3880;
        float _3890 = _3884 * _3884;
        _3830 = _3872;
        _3832 = _3874;
        _3842 = _3886;
        _3834 = _3888;
        _3836 = _3890;
    }
    float _3892 = _3830;
    float _3894 = _3832;
    float _3896 = _3842;
    float _3898 = _3834;
    float _3900 = _3836;
    float _3902 = fma(_3892, 6.2500002968590706586837768554688e-05, 0.5);
    float _3904 = fma(_3894, 6.2500002968590706586837768554688e-05, 0.5);
    float2 _10740 = float2(_3902, _3904);
    float3 _3908 = dm_bs(spvDescriptorSet0.vp_t_tcb_20.sample(spvDescriptorSet0.vp_t_tcb_20Smplr, select(_10740, float2(0.0), isnan(_10740)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_20, spvDescriptorSet0.vp_t_tcb_20Smplr_w, select(_10740, float2(0.0), isnan(_10740)), level(0.0)).xyz;
    float _3910 = _3908.x;
    float _3912 = _3908.y;
    float _3914 = _3908.z;
    float _3916 = _217 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _3918 = _3710 * _3768;
    float _3920 = _3710 * _3792;
    float _3922 = _3710 * _3772;
    float _3924 = fma(_3916, _3916, 1.0);
    float _3926 = _3718 * _3792;
    float _3928 = _3736 * _3792;
    float _3930 = -_3698;
    float _3932 = fma(_3930, _3742, _3920);
    float _3934 = _3718 * _3768;
    float _3936 = fma(_3706, _3742, _3926);
    float _3938 = rsqrt(_3924);
    float _3940 = fma(_3714, _3742, _3928);
    float _3942 = _3718 * _3772;
    float _3944 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _3946 = _3896 + _3944;
    float _3948 = _3736 * _3768;
    float _3950 = _3736 * _3772;
    float _3952 = -_3698;
    float _3954 = fma(_3952, _3740, _3918);
    float _3956 = fma(_3706, _3740, _3934);
    float _3958 = fma(_3706, _3750, _3942);
    float _3960 = -_3698;
    float _3962 = fma(_3960, _3750, _3922);
    float _3964 = fma(_3946, _3946, _3898);
    float _3966 = fma(_3714, _3740, _3948);
    float _3968 = fma(_3714, _3750, _3950);
    float _3970 = fma(_3712, _3636, _3954);
    float _3972 = fma(_3712, _3642, _3932);
    float _3974 = fma(_3712, _3638, _3962);
    float _3976 = _3964 + _3900;
    float _3978 = fma(_3720, _3636, _3966);
    float _3980 = _3916 * _3938;
    float _3982 = fma(_3720, _3642, _3940);
    float _3984 = fma(_3720, _3638, _3968);
    float _3986 = fma(_3732, _3636, _3956);
    float _3988 = _213 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _3990 = _3916 * _3970;
    float _3992 = _3916 * _3972;
    float _3994 = fma(_3732, _3642, _3936);
    float _3996 = fma(_3732, _3638, _3958);
    float _3998 = _3916 * _3974;
    float _4000 = -_3978;
    float _4002 = _3980 * _4000;
    float _4004 = -_3982;
    float _4006 = _3980 * _4004;
    float _4008 = -_3984;
    float _4010 = _3980 * _4008;
    float _4012 = sqrt(_3976);
    float _4014 = fma(_3988, _3986, _3990);
    float _4016 = fma(_3988, _3994, _3992);
    float _4018 = fma(_3988, _3996, _3998);
    float _4020 = fma(_3938, _3970, _4002);
    float _4022 = fma(_3938, _3972, _4006);
    float _4024 = fma(_3938, _3974, _4010);
    float _4026 = _3978 + _4014;
    float _4028 = _3982 + _4016;
    float _4030 = _3984 + _4018;
    out.m_82.x = _3986;
    out.m_82.y = _3994;
    out.m_82.z = _3996;
    out.m_84.x = _4020;
    out.m_84.y = _4022;
    out.m_84.z = _4024;
    bool _4032 = _4012 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _4034 = isnan(_4012);
    bool _4036 = _4032 || _4034;
    bool _4038 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _4040 = _4036 || _4038;
    out.m_86.x = _4026;
    out.m_86.y = _4028;
    out.m_86.z = _4030;
    float _4042 = _4014;
    if (!_4040)
    {
        _4042 = 1.0;
    }
    float _4044 = _4042;
    out.m_88.x = _3910;
    out.m_88.y = _3912;
    out.m_88.z = _3914;
    bool _4046 = !_4040;
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
    float _4110 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _4112 = _3896 + _4110;
    float _4114 = _3446 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _4116 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _4118 = _3892 + _4116;
    float _4120 = fma(_4112, _4108, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _4122 = fma(_3450, (*spvDescriptorSet0.vp_c8)._m0[11].x, _4114);
    float _4124 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _4126 = _3894 + _4124;
    float _4128 = fma(_4118, _4108, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _4130 = -_2768;
    float _4132 = _4130 + _4120;
    float _4134 = fma(_3456, (*spvDescriptorSet0.vp_c8)._m0[11].z, _4122);
    float _4136 = fma(_4126, _4108, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _4138 = -_2930;
    float _4140 = _4138 + _4128;
    float _4142 = _4132 * _4132;
    float _4144 = _4134 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _4146 = _3446 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _4148 = -_3100;
    float _4150 = _4148 + _4136;
    float _4152 = fma(_4140, _4140, _4142);
    float _4154 = 1.0 / _4144;
    float _4156 = fma(_3450, (*spvDescriptorSet0.vp_c8)._m0[10].x, _4146);
    float _4158 = fma(_4150, _4150, _4152);
    float _4160 = fma(_3456, (*spvDescriptorSet0.vp_c8)._m0[10].z, _4156);
    float _4162 = sqrt(_4158);
    float _4164 = _4160 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _4166 = _4164 + _4144;
    float _4168 = _4166 * _4154;
    float _4170 = _4168 * 0.5;
    bool _4172 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _4174 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _4176 = _4172 || _4174;
    bool _4178 = isnan(0.5);
    bool _4180 = _4176 || _4178;
    float _4182 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _4184 = fma(_4170, (*spvDescriptorSet0.vp_c8)._m0[30].w, _4182);
    bool _4186 = _4162 > 0.0;
    float _4188 = 1.0 / _4184;
    bool _4190 = (*spvDescriptorSet0.vp_c15)._m0[660].y >= 0.5;
    bool _4192 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _4194 = _4190 || _4192;
    bool _4196 = isnan(0.5);
    bool _4198 = _4194 || _4196;
    float _4200 = (*spvDescriptorSet0.vp_c8)._m0[30].w;
    float _4202 = _4134;
    float _4204 = _4128;
    float _4206 = (*spvDescriptorSet0.vp_c15)._m0[660].y;
    if (!_4186)
    {
        _4200 = _4120;
    }
    float _4208 = _4200;
    float _4210 = _4208;
    float _4212 = _4208;
    if (!_4186)
    {
        _4202 = _4136;
    }
    float _4214 = _4202;
    bool _4216 = !_4186;
    float _4218 = _4214;
    float _4220 = _4214;
    if (!_4216)
    {
        float _4222 = _233 * _233;
        float _4224 = fma(_229, _229, _4222);
        float _4226 = fma(_235, _235, _4224);
        float _4228 = rsqrt(_4158);
        float _4230 = sqrt(_4226);
        float _4232 = _4140 * _4228;
        float _4234 = _4132 * _4228;
        float _4236 = _4150 * _4228;
        bool _4238 = _4230 > 0.0;
        _4206 = _4228;
        if (!_4238)
        {
            _4210 = _4120;
        }
        float _4240 = _4210;
        _4212 = _4240;
        if (!_4238)
        {
            _4218 = _4136;
        }
        float _4242 = _4218;
        bool _4244 = !_4238;
        _4220 = _4242;
        if (!_4244)
        {
            float _4246 = rsqrt(_4226);
            float _4248 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].z;
            float _4250 = _233 * _4246;
            float _4252 = _229 * _4246;
            float _4254 = _235 * _4246;
            float _4256 = _4234 * _4250;
            float _4258 = fma(_4232, _4252, _4256);
            float _4260 = _4248 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _4262 = fma(_4236, _4254, _4258);
            float _4264 = _4262 * _4260;
            float _4266 = fma(_229, _4264, _4128);
            float _4268 = fma(_233, _4264, _4120);
            float _4270 = fma(_235, _4264, _4136);
            _4204 = _4266;
            _4212 = _4268;
            _4220 = _4270;
            _4206 = _4264;
        }
    }
    float _4272 = _4204;
    float _4274 = _4212;
    float _4276 = _4220;
    float _4278 = _4206;
    float _4280 = -_3436;
    float _4282 = _4280 + _4272;
    float _4284 = -_3438;
    float _4286 = _4284 + _4274;
    float _4288 = -_3440;
    float _4290 = _4288 + _4276;
    float _4292 = _4278;
    float _4294 = _4286;
    float _4296 = _4282;
    float _4298 = _4290;
    if (_4180)
    {
        _4292 = 1.0;
    }
    float _4300 = _4292;
    float _4302 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _4304 = _4188 * _4302;
    float _4306 = _4300;
    if (!_4198)
    {
        float _4308 = _3460 * _3460;
        float _4310 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _4312 = -_3100;
        float _4314 = _4312 + _4276;
        float _4316 = -_2768;
        float _4318 = _4316 + _4274;
        float _4320 = fma(_3464, _3464, _4308);
        float _4322 = fma(_3476, _3476, _4320);
        float _4324 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _4326 = sqrt(_4322);
        float _4328 = 1.0 / _3620;
        float _4330 = _4324 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _4332 = precise::min(_4326, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _4334 = _4332 * _4310;
        float _4336 = _4334 * _4328;
        float _4338 = -_2930;
        float _4340 = _4338 + _4272;
        float _4342 = _4330 * _4336;
        float _4344 = _4314 * _4336;
        float _4346 = fma(_4318, _4342, _3446);
        float _4348 = fma(_4340, _4342, _3450);
        float _4350 = fma(_4330, _4344, _3456);
        _4294 = _4346;
        _4296 = _4348;
        _4298 = _4350;
        _2888 = _4318;
    }
    float _4352 = _4294;
    float _4354 = _4296;
    float _4356 = _4298;
    float _4358 = _2888;
    float _4360 = _4358;
    if (!_4180)
    {
        float _4362 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _4364 = _4362 * 0.15915493667125701904296875;
        float _4366 = _4364 * 6.283185482025146484375;
        float _4368 = cos(_4366);
        float _4370 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _4372 = _4370 * 0.15915493667125701904296875;
        float _4374 = _4364 * 6.283185482025146484375;
        float _4376 = sin(_4374);
        float _4378 = 1.0 / _4368;
        float _4380 = _4372 * 6.283185482025146484375;
        float _4382 = cos(_4380);
        float _4384 = _4376 * _4378;
        float _4386 = _4372 * 6.283185482025146484375;
        float _4388 = sin(_4386);
        float _4390 = _4382 * _4384;
        float _4392 = 1.0 / _4390;
        float _4394 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _4396 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _4394;
        float _4398 = 1.0 / _4396;
        float _4400 = _4388 * _4392;
        float _4402 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _4404 = fma(_4304, _4400, _4402);
        float _4406 = _4404 * _4398;
        float _4408 = precise::clamp(_4406, 0.0, 1.0);
        _2932 = _4364;
        _4306 = _4408;
    }
    float _4410 = _2932;
    float _4412 = _4306;
    float _4414 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _4416 = _4352 + _4414;
    float _4418 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _4420 = _4354 + _4418;
    float _4422 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _4424 = _4356 + _4422;
    float _4426 = _4416 * _4416;
    float _4428 = fma(_4420, _4420, _4426);
    float _4430 = fma(_3450, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _4432 = fma(_4424, _4424, _4428);
    float _4434 = fma(_3456, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _4436 = rsqrt(_4432);
    float _4438 = sqrt(_4432);
    float _4440 = _4436 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _4442 = _4420 * _4440;
    float _4444 = _4424 * _4440;
    float _4446 = _4442 * _4442;
    float _4448 = _4444 * _4444;
    float _4450 = _4446 + _4448;
    float _4452 = sqrt(_4450);
    bool _4454 = _4452 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _4456 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _4458 = _4452 + _4456;
    float _4460 = _4436;
    float _4462 = _4410;
    float _4464 = _4458;
    float _4466 = _4416;
    if (_4454)
    {
        float _4468 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _4460 = _4468;
    }
    float _4470 = _4460;
    if (_4454)
    {
        float _4472 = rsqrt(_4450);
        _4462 = _4472;
    }
    float _4474 = _4462;
    float _4476 = _4474;
    if (_4454)
    {
        float _4478 = _4458 * _4470;
        _4464 = _4478;
    }
    float _4480 = _4464;
    if (_4454)
    {
        float _4482 = _4480 * 0.15915493667125701904296875;
        _3488 = _4482;
    }
    float _4484 = _3488;
    float _4486 = _4470;
    float _4488 = _4484;
    if (_4454)
    {
        float _4490 = _4484 * 6.283185482025146484375;
        float _4492 = sin(_4490);
        _4486 = _4492;
    }
    float _4494 = _4486;
    float _4496 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _4498 = precise::max(0.0, _4496);
    float _4500 = _4424;
    float _4502 = _4498;
    if (_4454)
    {
        float _4504 = _4484 * 6.283185482025146484375;
        float _4506 = cos(_4504);
        _4500 = _4506;
    }
    float _4508 = _4500;
    float _4510 = -_4440;
    float _4512 = -_4498;
    float _4514 = fma(_4416, _4510, _4512);
    if (!_4454)
    {
        _4466 = _4444;
    }
    float _4516 = _4466;
    float _4518 = _4516;
    if (_4454)
    {
        float _4520 = _4514 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _4502 = _4520;
    }
    float _4522 = _4502;
    float _4524 = _4494;
    float _4526 = _4522;
    if (_4454)
    {
        float _4528 = fma(_4494, _4522, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _4360 = _4528;
    }
    float _4530 = _4360;
    float _4532 = _4530;
    if (!_4454)
    {
        _4524 = _4514;
    }
    float _4534 = _4524;
    float _4536 = _4534;
    float _4538 = _4508;
    if (_4454)
    {
        float _4540 = _4508 + (-1.0);
        _4526 = _4540;
    }
    float _4542 = _4526;
    float _4544 = _4542;
    if (_4454)
    {
        float _4546 = _4474 * _4530;
        _4532 = _4546;
    }
    float _4548 = _4532;
    if (!_4454)
    {
        _4476 = _4442;
    }
    float _4550 = _4476;
    float _4552 = _4550;
    if (_4454)
    {
        float _4554 = _4542 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _4488 = _4554;
    }
    float _4556 = _4488;
    if (_4454)
    {
        float _4558 = _4442 * _4548;
        _4552 = _4558;
    }
    float _4560 = _4552;
    if (!_4454)
    {
        _4544 = _4446;
    }
    float _4562 = _4544;
    float _4564 = _4562;
    if (_4454)
    {
        float _4566 = _4444 * _4548;
        _4518 = _4566;
    }
    float _4568 = _4518;
    if (_4454)
    {
        float _4570 = fma(_4514, _4508, _4556);
        _4536 = _4570;
    }
    float _4572 = _4536;
    if (_4454)
    {
        float _4574 = _4560 * _4560;
        _4564 = _4574;
    }
    float _4576 = _4564;
    float _4578 = _4352 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    if (!_4454)
    {
        _4538 = _4448;
    }
    float _4580 = _4538;
    float _4582 = _4580;
    if (_4454)
    {
        float _4584 = _4568 * _4568;
        _4582 = _4584;
    }
    float _4586 = _4582;
    float _4588 = fma(_4572, _4572, _4576);
    float _4590 = fma(_4354, (*spvDescriptorSet0.vp_c8)._m0[2].x, _4578);
    float _4592 = floor(_4430);
    float _4594 = _4588 + _4586;
    float _4596 = fma(_4356, (*spvDescriptorSet0.vp_c8)._m0[2].z, _4590);
    float _4598 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _4600 = _4596 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _4602 = rsqrt(_4594);
    float _4604 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _4606 = fma(_4438, (*spvDescriptorSet0.vp_c15)._m0[23].w, _4604);
    float _4608 = precise::clamp(_4606, 0.0, 1.0);
    float _4610 = _4600 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _4612 = _4352 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _4614 = -_4608;
    float _4616 = _4614 + 1.0;
    float _4618 = -_4610;
    float _4620 = fma(_4618, _4598, 1.0);
    float _4622 = _4352 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _4624 = floor(_4434);
    float _4626 = _4352 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _4628 = -_4592;
    float _4630 = _4430 + _4628;
    float _4632 = fma(_4354, (*spvDescriptorSet0.vp_c8)._m0[0].x, _4622);
    float _4634 = fma(_4354, (*spvDescriptorSet0.vp_c8)._m0[1].x, _4626);
    float _4636 = fma(_4356, (*spvDescriptorSet0.vp_c8)._m0[0].z, _4632);
    float _4638 = abs(_4616);
    float _4640 = log2(_4638);
    float _4642 = fma(_4356, (*spvDescriptorSet0.vp_c8)._m0[1].z, _4634);
    float _4644 = _4602 * _4560;
    float _4646 = _4602 * _4572;
    float _4648 = _4602 * _4568;
    float _4650 = _4642 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _4652 = _4644 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _4654 = fma(_4354, (*spvDescriptorSet0.vp_c8)._m0[3].x, _4612);
    float _4656 = _4636 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _4658 = _4650 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _4660 = -_4652;
    float _4662 = fma(_4646, (*spvDescriptorSet0.vp_c15)._m0[21].y, _4660);
    float _4664 = fma(_4356, (*spvDescriptorSet0.vp_c8)._m0[3].z, _4654);
    float _4666 = log2(_4620);
    float _4668 = fma(_4656, (*spvDescriptorSet0.vp_c8)._m0[7].x, _4658);
    float _4670 = -_4648;
    float _4672 = fma(_4670, (*spvDescriptorSet0.vp_c15)._m0[21].z, _4662);
    float _4674 = _4664 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _4676 = _4640 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _4678 = fma(_4600, (*spvDescriptorSet0.vp_c8)._m0[7].z, _4668);
    float _4680 = fma(_4672, -0.5, 0.5);
    float _4682 = fma(_4672, 0.5, 0.5);
    float _4684 = exp2(_4676);
    float _4686 = fma(_4674, (*spvDescriptorSet0.vp_c8)._m0[7].w, _4678);
    float _4688 = _4650 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _4690 = _4650 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _4692 = -_4624;
    float _4694 = _4434 + _4692;
    float _4696 = fma(_4682, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _4698 = fma(_4656, (*spvDescriptorSet0.vp_c8)._m0[4].x, _4688);
    float _4700 = fma(_4656, (*spvDescriptorSet0.vp_c8)._m0[5].x, _4690);
    float _4702 = 1.0 / _4686;
    float _4704 = _4646 + 1.0;
    float _4706 = fma(_4600, (*spvDescriptorSet0.vp_c8)._m0[4].z, _4698);
    float _4708 = fma(_4682, _4696, -0.212114393711090087890625);
    float _4710 = _4666 * 0.693147182464599609375;
    float _4712 = fma(_4674, (*spvDescriptorSet0.vp_c8)._m0[4].w, _4706);
    float _4714 = sqrt(_4680);
    float _4716 = -_4646;
    float _4718 = fma(_4684, _4704, _4716);
    float2 _12076 = float2(_4630, _4694);
    float _4720 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_12076, float2(0.0), isnan(_12076)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_12076, float2(0.0), isnan(_12076)), level(0.0)).x;
    float _4722 = fma(_4682, _4708, 1.570728778839111328125);
    float _4724 = fma(_4718, 0.5, 0.5);
    float _4726 = fma(_4600, (*spvDescriptorSet0.vp_c8)._m0[5].z, _4700);
    float _4728 = _4712 * _4702;
    float _4730 = fma(_4674, (*spvDescriptorSet0.vp_c8)._m0[5].w, _4726);
    float _4732 = fma(_4728, 0.5, 0.5);
    float _4734 = _4714 * 0.636619746685028076171875;
    float _4736 = _4730 * _4702;
    float _4738 = _4710 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _4740 = -_4722;
    float _4742 = fma(_4734, _4740, 1.0);
    float _4744 = fma(_4736, -0.5, 0.5);
    float3 _12123 = float3(_4732, _4744, _4738);
    float _4746 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_12123, float3(0.0), isnan(_12123)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_12123, float3(0.0), isnan(_12123)), level(0.0)).x;
    float3 _12134 = float3(_4732, _4744, _4738);
    float4 _4749 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_12134, float3(0.0), isnan(_12134)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_12134, float3(0.0), isnan(_12134)), level(0.0)).xyzw;
    float _4751 = _4749.x;
    float _4753 = _4749.y;
    float _4755 = _4749.z;
    float _4757 = _4749.w;
    float2 _12150 = float2(_4742, _4724);
    float3 _4759 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_12150, float2(0.0), isnan(_12150)), level(0.0)), spvDescriptorSet0.dm_border, 4u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_12150, float2(0.0), isnan(_12150)), level(0.0)).xyz;
    float _4761 = _4759.x;
    float _4763 = _4759.y;
    float _4765 = _4759.z;
    float _4767 = abs(_4304);
    float _4769 = log2(_4767);
    float _4771 = _4650 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    bool _4773 = _4438 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _4775 = isnan(_4438);
    bool _4777 = _4773 || _4775;
    bool _4779 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _4781 = _4777 || _4779;
    float _4783 = fma(_4656, (*spvDescriptorSet0.vp_c8)._m0[6].x, _4771);
    float _4785 = _4640 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    bool _4787 = _4304 <= 8000.0;
    bool _4789 = isnan(_4304);
    bool _4791 = _4787 || _4789;
    bool _4793 = isnan(8000.0);
    bool _4795 = _4791 || _4793;
    float _4797 = float(_4795);
    float _4799 = fma(_4600, (*spvDescriptorSet0.vp_c8)._m0[6].z, _4783);
    float _4801 = fma(_4674, (*spvDescriptorSet0.vp_c8)._m0[6].w, _4799);
    float _4803 = _4769 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _4805 = _4801 + _4686;
    out.gl_Position.x = _4712;
    out.gl_Position.y = _4730;
    out.gl_Position.z = _4801;
    out.gl_Position.w = _4686;
    float _4807 = exp2(_4803);
    float _4809 = _4805 * 0.5;
    float _4811 = _4801;
    float _4813 = _4730;
    float _4815 = _4686;
    if (!_4781)
    {
        _4811 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _4817 = _4811;
    float _4819 = _4817;
    float _4821 = _4817;
    if (!_4781)
    {
        _4813 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _4823 = _4813;
    float _4825 = fma(_4807, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _4827 = precise::clamp(_4825, 0.0, 1.0);
    float _4829 = _4823;
    float _4831 = _4823;
    if (!_4781)
    {
        _4815 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _4833 = _4815;
    float _4835 = fma(_4827, -2.0, 3.0);
    float _4837 = _4827 * _4827;
    out.m_90.z = _4809;
    out.m_90.w = _4686;
    float _4839 = _4837 * _4835;
    float _4841 = exp2(_4785);
    float _4843 = -_4839;
    float _4845 = _4843 + 1.0;
    float _4847 = fma(_4845, (*spvDescriptorSet0.vp_c15)._m0[654].w, _4839);
    float _4849 = in.m_92.x;
    float _4851 = _4797 * _4847;
    float _4853 = _4851 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _4855 = -_4841;
    float _4857 = _4855 + 1.0;
    float _4859 = _4857 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _4861 = -_4859;
    float _4863 = _4861 + 1.0;
    float _4865 = -_4720;
    float _4867 = _4865 + 1.0;
    float _4869 = _4867 * _4853;
    float _4871 = precise::clamp(_4869, 0.0, 1.0);
    float _4873 = -_4871;
    float _4875 = fma(_4873, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _4877 = _4875 * _4849;
    float _4879 = _4877 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _4881 = _4877;
    float _4883 = _4863;
    float _4885 = _4833;
    float _4887 = _4833;
    if (!_4781)
    {
        _4881 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _4889 = _4881;
    out.m_94.x = _4879;
    float _4891 = _4859 * _4746;
    float _4893 = _4757 * _4891;
    float _4895 = _4765 * _4891;
    float _4897 = _4757 * _4863;
    float _4899 = _4893;
    float _4901 = _4889;
    float _4903 = _4889;
    if (!_4781)
    {
        _4883 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _4905 = _4883;
    float _4907 = fma(_4761, _4893, _4751);
    float _4909 = fma(_4763, _4893, _4753);
    float _4911 = fma(_4757, _4895, _4755);
    float _4913 = _4412 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _4915 = _4905;
    float _4917 = _4905;
    if (!_4781)
    {
        _4899 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _4919 = _4899;
    out.m_96.x = _4907;
    out.m_96.y = _4909;
    out.m_96.z = _4911;
    out.m_96.w = _4897;
    bool _4921 = !_4781;
    float _4923 = _4919;
    float _4925 = _4919;
    if (!_4921)
    {
        bool _4927 = _4438 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _4929 = isnan(_4438);
        bool _4931 = _4927 || _4929;
        bool _4933 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _4935 = _4931 || _4933;
        if (!_4935)
        {
            float _4937 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _4939 = _4438 + _4937;
            float _4941 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _4943 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _4941;
            float _4945 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _4947 = _4945 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _4949 = 1.0 / _4943;
            float _4951 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _4953 = _4951 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _4955 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _4957 = _4955 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _4959 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _4961 = _4959 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _4963 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _4965 = _4963 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _4967 = _4939 * _4949;
            float _4969 = precise::clamp(_4967, 0.0, 1.0);
            float _4971 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _4973 = _4971 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _4975 = fma(_4969, _4947, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _4977 = fma(_4969, _4973, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _4979 = fma(_4969, _4953, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _4981 = fma(_4969, _4957, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _4983 = fma(_4969, _4961, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _4985 = fma(_4969, _4965, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _4887 = _4979;
            _4917 = _4983;
            _4903 = _4975;
            _4831 = _4981;
            _4821 = _4977;
            _4925 = _4985;
            _4987 = true;
        }
        else
        {
            bool _4989 = _4438 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _4991 = isnan(_4438);
            bool _4993 = _4989 || _4991;
            bool _4995 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _4997 = _4993 || _4995;
            if (!_4997)
            {
                _4901 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _4999 = _4901;
            _4903 = _4999;
            if (!_4997)
            {
                _4885 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _5001 = _4885;
            _4887 = _5001;
            if (!_4997)
            {
                _4819 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _5003 = _4819;
            _4821 = _5003;
            if (!_4997)
            {
                _4829 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _5005 = _4829;
            _4831 = _5005;
            if (!_4997)
            {
                _4915 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _5007 = _4915;
            _4917 = _5007;
            if (!_4997)
            {
                _4923 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _5009 = _4923;
            bool _5011 = !_4997;
            _4925 = _5009;
            if (!_5011)
            {
                bool _5013 = _4438 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _5015 = isnan(_4438);
                bool _5017 = _5013 || _5015;
                bool _5019 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _5021 = _5017 || _5019;
                if (!_5021)
                {
                    float _5023 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _5025 = _4438 + _5023;
                    float _5027 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _5029 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _5027;
                    float _5031 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _5033 = _5031 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _5035 = 1.0 / _5029;
                    float _5037 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _5039 = _5037 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _5041 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _5043 = _5041 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _5045 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _5047 = _5045 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _5049 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _5051 = _5049 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _5053 = _5025 * _5035;
                    float _5055 = precise::clamp(_5053, 0.0, 1.0);
                    float _5057 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _5059 = _5057 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _5061 = fma(_5055, _5033, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _5063 = fma(_5055, _5059, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _5065 = fma(_5055, _5039, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _5067 = fma(_5055, _5043, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _5069 = fma(_5055, _5047, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _5071 = fma(_5055, _5051, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _4887 = _5065;
                    _4917 = _5069;
                    _4903 = _5061;
                    _4831 = _5067;
                    _4821 = _5063;
                    _4925 = _5071;
                    _4987 = true;
                }
                else
                {
                    _4887 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _4917 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _4903 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _4831 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _4821 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _4925 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _4987 = false;
    float _5073 = _4887;
    float _5075 = _4917;
    float _5077 = _4903;
    float _5079 = _4831;
    float _5081 = _4821;
    float _5083 = _4925;
    float _5085 = _4913 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _5087 = fma(_4028, -0.5, 0.5);
    float _5089 = precise::clamp(_5087, 0.0, 1.0);
    float _5091 = -_5073;
    float _5093 = _5091 + _5075;
    float _5095 = -_5077;
    float _5097 = _5095 + _5079;
    out.m_53.x = _5085;
    float _5099 = fma(_5089, _5093, _5073);
    float _5101 = -_5081;
    float _5103 = _5101 + _5083;
    float _5105 = fma(_5089, _5097, _5077);
    float _5107 = _5099 * 0.586610972881317138671875;
    bool _5109 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _5111 = fma(_5089, _5103, _5081);
    out.m_98.x = 0.0;
    float _5113 = fma(_5105, 0.298911988735198974609375, _5107);
    bool _5115 = _4412 > 0.0;
    bool _5117 = isnan(_4412);
    bool _5119 = _5115 || _5117;
    bool _5121 = isnan(0.0);
    bool _5123 = _5119 || _5121;
    float _5125 = fma(_5111, 0.114477999508380889892578125, _5113);
    float _5127 = -_5125;
    float _5129 = _5105 + _5127;
    float _5131 = -_5125;
    float _5133 = _5099 + _5131;
    float _5135 = -_5125;
    float _5137 = _5111 + _5135;
    float _5139 = fma(_5129, (*spvDescriptorSet0.vp_c13)._m0[1].z, _5125);
    float _5141 = fma(_5133, (*spvDescriptorSet0.vp_c13)._m0[1].z, _5125);
    float _5143 = fma(_5137, (*spvDescriptorSet0.vp_c13)._m0[1].z, _5125);
    bool _5145 = !_5109;
    if (!_5145)
    {
        float _5147 = -_4352;
        float _5149 = _5147 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _5151 = -_4354;
        float _5153 = _5151 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _5155 = -_4356;
        float _5157 = _5155 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _5159 = _5149 * _5149;
        float _5161 = fma(_5153, _5153, _5159);
        float _5163 = fma(_5157, _5157, _5161);
        float _5165 = sqrt(_5163);
        float _5167 = rsqrt(_5163);
        float _5169 = -_5165;
        float _5171 = _5169 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _5173 = _5171 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _5175 = precise::clamp(_5173, 0.0, 1.0);
        float _5177 = _5153 * _5167;
        float _5179 = _5149 * _5167;
        float _5181 = abs(_5175);
        float _5183 = log2(_5181);
        float _5185 = _5157 * _5167;
        float _5187 = _5177 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _5189 = _4028 * _5179;
        float _5191 = -_5179;
        float _5193 = -_5187;
        float _5195 = fma(_5191, (*spvDescriptorSet0.vp_c15)._m0[656].y, _5193);
        float _5197 = fma(_4026, _5177, _5189);
        float _5199 = -_5185;
        float _5201 = fma(_5199, (*spvDescriptorSet0.vp_c15)._m0[656].z, _5195);
        float _5203 = fma(_4030, _5185, _5197);
        float _5205 = precise::clamp(_5203, 0.0, 1.0);
        float _5207 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _5209 = _5201 + _5207;
        float _5211 = _5183 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _5213 = _5209 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _5215 = precise::clamp(_5213, 0.0, 1.0);
        float _5217 = exp2(_5211);
        float _5219 = _5217 * _5215;
        float _5221 = _5205 * _5219;
        float _5223 = _5221 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _5225 = _5221 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _5227 = _5221 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_98.x = _5223;
        out.m_98.y = _5225;
        out.m_98.z = _5227;
    }
    out.m_100.x = _5139;
    out.m_100.y = _5141;
    out.m_100.z = _5143;
    if (_5123)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    out.m_53.x = 0.0;
    float _5229 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _5229;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_72 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_78 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_74 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_90 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_100 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_53 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_80 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_84 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_86 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_82 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_98 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_88 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_94 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_96 = float4(0.0, 0.0, 0.0, 1.0);
    bool _4987 = false;
    bool _4078 = false;
    bool _753 = false;
    bool _641 = false;
    bool _257 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _114 = in.m_50.w;
    float _116 = trunc(_114);
    int _119 = int(_116);
    bool _123 = _119 >= 1;
    float _125 = 0.0;
    if (!_123)
    {
        _125 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _127 = _125;
    float _129 = _127;
    if (!_123)
    {
        out.m_53.x = 0.0;
    }
    int _131 = 0;
    if (!_123)
    {
        float _133 = _127 * 5.0;
        _131 = as_type<int>(_133);
    }
    int _135 = _131;
    int _137 = _135;
    if (!_123)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _5286 = as_type<float>(_135);
        out.gl_Position.z = _5286;
    }
    if (!_123)
    {
        return out;
    }
    float _139 = in.m_55.w;
    bool _141 = _139 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _143 = isnan(_139);
    bool _145 = _141 || _143;
    bool _147 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _149 = _145 || _147;
    float _151 = -_139;
    float _153 = _151 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _155 = _153;
    if (_149)
    {
        float _157 = float(_119);
        _129 = _157;
    }
    float _159 = _129;
    bool _161 = _153 >= _159;
    bool _163 = !_149;
    bool _165 = _161 || _163;
    float _167 = _159;
    if (_165)
    {
        _167 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _169 = _167;
    if (_165)
    {
        out.m_53.x = 0.0;
    }
    if (_165)
    {
        float _171 = _169 * 5.0;
        _137 = as_type<int>(_171);
    }
    int _173 = _137;
    if (_165)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _5356 = as_type<float>(_173);
        out.gl_Position.z = _5356;
    }
    if (_165)
    {
        return out;
    }
    float _175 = as_type<float>(int(gl_VertexIndex));
    float _177 = in.m_60.x;
    float _179 = in.m_60.y;
    float _181 = in.m_60.z;
    float _183 = in.m_62.x;
    float _185 = in.m_62.y;
    float _187 = in.m_62.z;
    float _189 = in.m_64.x;
    float _191 = in.m_64.y;
    float _193 = in.m_64.z;
    float _195 = in.m_66.x;
    float _197 = in.m_66.y;
    float _199 = in.m_66.z;
    int _201 = as_type<int>(_175) & 1;
    bool _203 = _201 != 0;
    int _205 = as_type<int>(_175) & 2;
    bool _207 = _205 != 0;
    bool _209 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    bool _211 = !_203;
    float _213 = _211 ? (-0.5) : 0.5;
    bool _215 = !_207;
    float _217 = _215 ? (-0.5) : 0.5;
    float _219 = _179 * _185;
    float _221 = _179 * _191;
    float _223 = fma(_177, _183, _219);
    float _225 = _179 * _197;
    float _227 = fma(_177, _189, _221);
    float _229 = fma(_181, _187, _223);
    float _231 = fma(_177, _195, _225);
    float _233 = fma(_181, _193, _227);
    float _235 = fma(_181, _199, _231);
    bool _237 = !_209;
    float _255;
    if (!_237)
    {
        float _239 = in.m_68.x;
        float _241 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _243 = _239 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _245 = fma(_243, (*spvDescriptorSet0.vp_c9)._m0[12].x, _153);
        float _247 = _245 * _241;
        float _249 = floor(_247);
        float _251 = -_249;
        float _253 = _247 + _251;
        _255 = _253;
        _257 = true;
    }
    else
    {
        float _259 = float(_119);
        float _261 = 1.0 / _259;
        float _263 = _153 * _261;
        _255 = _263;
    }
    _257 = false;
    float _265 = _255;
    float _267 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _269 = _265 + _267;
    float _271 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _273 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _271;
    float _275 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _277 = _275 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _279 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _281 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _279;
    float _283 = 1.0 / _273;
    float _285 = -(*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _287 = (*spvDescriptorSet0.vp_c9)._m0[148].w + _285;
    float _289 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _291 = _289 + (*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _293 = -(*spvDescriptorSet0.vp_c9)._m0[148].w;
    float _295 = _293 + (*spvDescriptorSet0.vp_c9)._m0[149].w;
    float _297 = 1.0 / _277;
    float _299 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _301 = _265 + _299;
    bool _303 = _265 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _305 = isnan(_265);
    bool _307 = _303 || _305;
    bool _309 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _311 = _307 || _309;
    float _313 = float(_311);
    float _315 = 1.0 / _281;
    float _317 = _301 * _283;
    float _319 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _321 = _265 + _319;
    bool _323 = _265 >= (*spvDescriptorSet0.vp_c9)._m0[150].w;
    bool _325 = isnan(_265);
    bool _327 = _323 || _325;
    bool _329 = isnan((*spvDescriptorSet0.vp_c9)._m0[150].w);
    bool _331 = _327 || _329;
    float _333 = float(_331);
    bool _335 = _265 >= (*spvDescriptorSet0.vp_c9)._m0[149].w;
    bool _337 = isnan(_265);
    bool _339 = _335 || _337;
    bool _341 = isnan((*spvDescriptorSet0.vp_c9)._m0[149].w);
    bool _343 = _339 || _341;
    float _345 = float(_343);
    float _347 = 1.0 / _287;
    float _349 = -(*spvDescriptorSet0.vp_c9)._m0[149].w;
    float _351 = (*spvDescriptorSet0.vp_c9)._m0[150].w + _349;
    float _353 = _269 * _297;
    float _355 = -(*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _357 = _265 + _355;
    float _359 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _361 = _265 + _359;
    bool _363 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _365 = 1.0 / _351;
    float _367 = _321 * _315;
    float _369 = -_333;
    float _371 = _369 + 1.0;
    bool _373 = _265 >= (*spvDescriptorSet0.vp_c9)._m0[148].w;
    bool _375 = isnan(_265);
    bool _377 = _373 || _375;
    bool _379 = isnan((*spvDescriptorSet0.vp_c9)._m0[148].w);
    bool _381 = _377 || _379;
    float _383 = float(_381);
    float _385 = _345 * _371;
    float _387 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _389 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _387;
    float _391 = 1.0 / _291;
    float _393 = _357 * _347;
    float _395 = -_345;
    float _397 = _395 + 1.0;
    bool _399 = _265 >= (*spvDescriptorSet0.vp_c9)._m0[147].w;
    bool _401 = isnan(_265);
    bool _403 = _399 || _401;
    bool _405 = isnan((*spvDescriptorSet0.vp_c9)._m0[147].w);
    bool _407 = _403 || _405;
    float _409 = float(_407);
    float _411 = fma(_389, _317, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _413 = 1.0 / _295;
    float _415 = -(*spvDescriptorSet0.vp_c9)._m0[149].w;
    float _417 = _265 + _415;
    float _419 = _417 * _365;
    float _421 = _383 * _397;
    float _423 = -_383;
    float _425 = _423 + 1.0;
    float _427 = _361 * _391;
    float _429 = -(*spvDescriptorSet0.vp_c9)._m0[148].w;
    float _431 = _265 + _429;
    bool _433 = _265 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _435 = isnan(_265);
    bool _437 = _433 || _435;
    bool _439 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _441 = _437 || _439;
    float _443 = float(_441);
    float _445 = _409 * _425;
    float _447 = -_409;
    float _449 = _447 + 1.0;
    float _451 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _453 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _451;
    float _455 = _431 * _413;
    float _457 = _443 * _449;
    float _459 = -_443;
    float _461 = _459 + 1.0;
    bool _463 = _265 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _465 = isnan(_265);
    bool _467 = _463 || _465;
    bool _469 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _471 = _467 || _469;
    float _473 = float(_471);
    float _475 = fma(_453, _317, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    bool _477 = _265 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _479 = isnan(_265);
    bool _481 = _477 || _479;
    bool _483 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _485 = _481 || _483;
    float _487 = float(_485);
    float _489 = _313 * _461;
    float _491 = -_313;
    float _493 = _491 + 1.0;
    float _495 = -_473;
    float _497 = _495 + 1.0;
    float _499 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _501 = _499 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _503 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _505 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _503;
    float _507 = _473 * _493;
    float _509 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _511 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _509;
    float _513 = _487 * _497;
    float _515 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _517 = _515 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _519 = fma(_505, _367, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _521 = fma(_511, _367, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _523 = _411 * _513;
    float _525 = -_487;
    float _527 = _525 + 1.0;
    float _529 = _475 * _513;
    float _531 = -(*spvDescriptorSet0.vp_c9)._m0[146].x;
    float _533 = _531 + (*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _535 = fma(_501, _353, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _537 = fma(_527, (*spvDescriptorSet0.vp_c9)._m0[143].x, _523);
    float _539 = fma(_517, _353, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _541 = -(*spvDescriptorSet0.vp_c9)._m0[146].y;
    float _543 = _541 + (*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _545 = fma(_527, (*spvDescriptorSet0.vp_c9)._m0[143].y, _529);
    float _547 = fma(_533, _427, (*spvDescriptorSet0.vp_c9)._m0[146].x);
    float _549 = fma(_543, _427, (*spvDescriptorSet0.vp_c9)._m0[146].y);
    float _551 = fma(_535, _507, _537);
    float _553 = fma(_539, _507, _545);
    float _555 = -(*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _557 = (*spvDescriptorSet0.vp_c9)._m0[148].x + _555;
    float _559 = -(*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _561 = (*spvDescriptorSet0.vp_c9)._m0[148].y + _559;
    float _563 = fma(_521, _489, _551);
    float _565 = fma(_519, _489, _553);
    float _567 = fma(_557, _393, (*spvDescriptorSet0.vp_c9)._m0[147].x);
    float _569 = fma(_561, _393, (*spvDescriptorSet0.vp_c9)._m0[147].y);
    float _571 = -(*spvDescriptorSet0.vp_c9)._m0[148].x;
    float _573 = _571 + (*spvDescriptorSet0.vp_c9)._m0[149].x;
    float _575 = -(*spvDescriptorSet0.vp_c9)._m0[148].y;
    float _577 = _575 + (*spvDescriptorSet0.vp_c9)._m0[149].y;
    float _579 = fma(_547, _457, _563);
    float _581 = fma(_549, _457, _565);
    float _583 = fma(_573, _455, (*spvDescriptorSet0.vp_c9)._m0[148].x);
    float _585 = fma(_577, _455, (*spvDescriptorSet0.vp_c9)._m0[148].y);
    float _587 = -(*spvDescriptorSet0.vp_c9)._m0[149].x;
    float _589 = (*spvDescriptorSet0.vp_c9)._m0[150].x + _587;
    float _591 = -(*spvDescriptorSet0.vp_c9)._m0[149].y;
    float _593 = (*spvDescriptorSet0.vp_c9)._m0[150].y + _591;
    float _595 = fma(_567, _445, _579);
    float _597 = fma(_569, _445, _581);
    float _599 = fma(_589, _419, (*spvDescriptorSet0.vp_c9)._m0[149].x);
    float _601 = fma(_593, _419, (*spvDescriptorSet0.vp_c9)._m0[149].y);
    float _603 = fma(_583, _421, _595);
    float _605 = fma(_585, _421, _597);
    float _607 = fma(_599, _385, _603);
    float _609 = fma(_601, _385, _605);
    float _611 = fma(_333, (*spvDescriptorSet0.vp_c9)._m0[150].x, _607);
    float _613 = fma(_333, (*spvDescriptorSet0.vp_c9)._m0[150].y, _609);
    bool _615 = !_363;
    int _617 = as_type<int>(_523);
    int _619 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[148].y);
    float _621 = (*spvDescriptorSet0.vp_c9)._m0[148].x;
    float _639;
    if (!_615)
    {
        float _623 = in.m_68.x;
        float _625 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _627 = _623 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _629 = fma(_627, (*spvDescriptorSet0.vp_c9)._m0[11].y, _153);
        float _631 = _629 * _625;
        float _633 = floor(_631);
        float _635 = -_633;
        float _637 = _631 + _635;
        _639 = _637;
        _641 = true;
    }
    else
    {
        float _643 = float(_119);
        float _645 = 1.0 / _643;
        float _647 = _153 * _645;
        _639 = _647;
    }
    _641 = false;
    float _649 = _639;
    float _651 = in.m_70.x;
    float _653 = in.m_70.y;
    bool _655 = _649 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _657 = isnan(_649);
    bool _659 = _655 || _657;
    bool _661 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _663 = _659 || _661;
    float _665 = float(_663);
    float _667 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _669 = _667 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _671 = _649 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _673 = isnan(_649);
    bool _675 = _671 || _673;
    bool _677 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _679 = _675 || _677;
    float _681 = float(_679);
    float _683 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _685 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _683;
    float _687 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _689 = _649 + _687;
    float _691 = -_665;
    float _693 = _691 + 1.0;
    float _695 = 1.0 / _669;
    float _697 = _681 * _693;
    float _699 = -_681;
    float _701 = _699 + 1.0;
    float _703 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _705 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    bool _707 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _709 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _711 = _703 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _713 = _705 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _715 = _709 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _717 = _613 * _653;
    float _719 = _611 * _651;
    float _721 = _685 * _695;
    float _723 = fma(_721, _689, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _725 = _723 * _697;
    float _727 = fma(_701, (*spvDescriptorSet0.vp_c9)._m0[115].x, _725);
    float _729 = fma(_665, (*spvDescriptorSet0.vp_c9)._m0[116].x, _727);
    float _731 = _729 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    out.m_72.x = _711;
    out.m_72.y = _715;
    out.m_72.z = _713;
    out.m_72.w = _731;
    bool _733 = !_707;
    float _751;
    if (!_733)
    {
        float _735 = in.m_68.x;
        float _737 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _739 = _735 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _741 = fma(_739, (*spvDescriptorSet0.vp_c9)._m0[11].w, _153);
        float _743 = _741 * _737;
        float _745 = floor(_743);
        float _747 = -_745;
        float _749 = _743 + _747;
        _751 = _749;
        _753 = true;
    }
    else
    {
        float _755 = float(_119);
        float _757 = 1.0 / _755;
        float _759 = _153 * _757;
        _751 = _759;
    }
    _753 = false;
    float _761 = _751;
    float _763 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _765 = int(_763);
    float _767 = float(_119);
    float _769 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _771 = int(_769);
    float _773 = float(_765);
    float _775 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].y);
    int _777 = int(_775);
    float _779 = float(uint(_771));
    float _781 = 1.0 / _773;
    float _783 = float(_771);
    int _785 = ~_771;
    int _787 = _785 + 1;
    float _789 = 1.0 / _779;
    float _791 = float(_777);
    float _793 = _781 * _153;
    float _795 = trunc((*spvDescriptorSet0.vp_c9)._m0[40].y);
    int _797 = int(_795);
    int _799 = as_type<int>(_789) + (-2);
    float _801 = trunc(_793);
    int _803 = int(_801);
    int _805 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _807 = _805 != 0;
    float _809 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].x);
    int _811 = int(_809);
    float _813 = float(_797);
    float _815 = float(uint(_803));
    float _817 = 1.0 / _767;
    float _819 = (*spvDescriptorSet0.vp_c9)._m0[7].z;
    float _821 = _817;
    if (_807)
    {
        float _823 = in.m_68.x;
        _819 = _823;
    }
    float _825 = _819;
    if (_807)
    {
        _617 = 0;
    }
    int _827 = _617;
    float _829 = as_type<float>(_799) * _815;
    int _831 = _827;
    if (_807)
    {
        _619 = 0;
    }
    int _833 = _619;
    float _835 = float(uint(_811));
    float _837 = trunc(_829);
    float _839 = precise::max(_837, 0.0);
    uint _842 = uint(_839);
    float _844 = 1.0 / _791;
    float _846 = 1.0 / _813;
    float _848 = _825;
    int _850 = _833;
    if (_807)
    {
        _621 = _825;
    }
    float _852 = _621;
    float _854 = 1.0 / _835;
    int _856 = ~_771;
    int _858 = _856 + 1;
    float _860 = _844 * _153;
    int _862 = _858 * int(_842);
    int _864 = _862 + _803;
    float _866 = trunc((*spvDescriptorSet0.vp_c9)._m0[40].x);
    int _868 = int(_866);
    float _870 = _817 * _153;
    float _872 = _846 * _153;
    float _874 = float(uint(_864));
    float _876 = in.m_68.x;
    float _878 = in.m_68.y;
    float _880 = in.m_68.z;
    float _882 = in.m_68.w;
    float _884 = _783 * _870;
    float _886 = _874;
    float _888 = _852;
    if (_807)
    {
        _821 = 1.0;
    }
    float _890 = _821;
    float _892 = as_type<float>(_799) * _874;
    float _894 = trunc(_860);
    int _896 = int(_894);
    float _898 = _890;
    if (_807)
    {
        _886 = 1.0;
    }
    float _900 = _886;
    float _902 = float(uint(_868));
    float _904 = trunc(_884);
    int _906 = int(_904);
    float _908 = trunc(_872);
    int _910 = int(_908);
    float _912 = trunc(_892);
    float _914 = precise::max(_912, 0.0);
    uint _916 = uint(_914);
    float _918 = 1.0 / _902;
    float _920 = _902;
    float _922 = _900;
    if (_807)
    {
        _920 = 1.0;
    }
    float _924 = _920;
    float _926 = _924;
    if (!_807)
    {
        float _928 = in.m_68.y;
        float _930 = in.m_68.z;
        _922 = 7.345489978790283203125;
        _898 = 1.2345600128173828125;
        _848 = _928;
        _926 = 5.839270114898681640625;
        _888 = _930;
        _831 = 1;
        _850 = 2;
    }
    float _932 = _922;
    float _934 = _898;
    float _936 = _848;
    float _938 = _926;
    float _940 = _888;
    int _942 = _831;
    int _944 = _850;
    float _946 = _932 * _876;
    int _948 = int(_842) + int(_916);
    float _950 = _934 * _936;
    float _952 = _938 * _940;
    float _954 = float(_803);
    float _956 = floor(_946);
    int _958 = as_type<int>(_854) + (-2);
    int _960 = _787 * _948;
    int _962 = _960 + _803;
    bool _964 = _954 >= _783;
    bool _966 = isnan(_954);
    bool _968 = _964 || _966;
    bool _970 = isnan(_783);
    bool _972 = _968 || _970;
    float _974 = float(_972);
    float _976 = _719 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _978 = float(uint(_896));
    int _980 = as_type<int>(_918) + (-2);
    float _982 = trunc(_974);
    int _984 = int(_982);
    float _986 = float(uint(_910));
    bool _988 = uint(_962) >= uint(_771);
    float _990 = as_type<float>(_958) * _978;
    bool _992 = _878 > 0.5;
    float _994 = as_type<float>(_980) * _986;
    bool _996 = !_988;
    int _998 = _996 ? 0 : (-1);
    float _1000 = -_956;
    float _1002 = _946 + _1000;
    float _1004 = trunc(_990);
    float _1006 = precise::max(_1004, 0.0);
    uint _1008 = uint(_1006);
    int _1010 = ~_948;
    int _1012 = _1010 + _998;
    int _1014 = _1012 + 1;
    float _1016 = _1002 * _783;
    bool _1018 = _771 == 0;
    bool _1020 = _880 > 0.5;
    int _1022 = _771 * _1014;
    int _1024 = _1022 + _803;
    int _1026 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _1028 = _1026 != 0;
    float _1030 = trunc(_994);
    float _1032 = precise::max(_1030, 0.0);
    uint _1034 = uint(_1032);
    float _1036 = -_213;
    int _1038 = _992 ? as_type<int>(_1036) : as_type<int>(_213);
    int _1040 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _1042 = _1040 != 0;
    int _1044 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16;
    bool _1046 = _1044 != 0;
    int _1048 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32;
    bool _1050 = _1048 != 0;
    float _1052 = -_217;
    int _1054 = _1020 ? as_type<int>(_1052) : as_type<int>(_217);
    float _1056 = floor(_950);
    bool _1058 = !_1050;
    float _1060 = _1058 ? _217 : as_type<float>(_1054);
    int _1062 = ~_984;
    int _1064 = _1062 + 1;
    int _1066 = _1064 + 1;
    bool _1068 = !_1018;
    int _1070 = _1068 ? _1024 : (-1);
    bool _1072 = !_1046;
    float _1074 = _1072 ? _213 : as_type<float>(_1038);
    float _1076 = floor(_952);
    int _1078 = ~_811;
    int _1080 = _1078 + 1;
    int _1082 = _1070 * _1066;
    int _1084 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _1086 = _1084 != 0;
    int _1088 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _1090 = _1088 != 0;
    int _1092 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _1094 = _1092 != 0;
    int _1096 = _771 + (-1);
    int _1098 = _1080 * int(_1008);
    int _1100 = _1098 + _896;
    bool _1102 = !_1028;
    int _1104 = _1102 ? 0 : 1;
    float _1106 = trunc(_1016);
    int _1108 = int(_1106);
    bool _1110 = !_1090;
    int _1112 = _1110 ? 0 : 1;
    int _1114 = _984 * _1096;
    int _1116 = _1114 + _1082;
    bool _1118 = _882 > 0.5;
    float _1120 = -_1056;
    float _1122 = _950 + _1120;
    bool _1124 = !_1086;
    int _1126 = _1124 ? 0 : 1;
    int _1128 = abs(_1112);
    float _1130 = -_1076;
    float _1132 = _952 + _1130;
    float _1134 = float(uint(_1100));
    bool _1136 = !_1094;
    int _1138 = _1136 ? 0 : 1;
    int _1140 = _1116 * _1128;
    int _1142 = ~_868;
    int _1144 = _1142 + 1;
    float _1146 = as_type<float>(_958) * _1134;
    int _1148 = abs(_1126);
    int _1150 = abs(_1138);
    float _1152 = trunc(_1146);
    float _1154 = precise::max(_1152, 0.0);
    uint _1156 = uint(_1154);
    int _1158 = _1144 * int(_1034);
    int _1160 = _1158 + _910;
    int _1162 = abs(_1104);
    int _1164 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _1166 = _1164 != 0;
    int _1168 = _906 * _1148;
    int _1170 = _1168 + _1140;
    float _1172 = float(uint(_1160));
    int _1174 = _1108 * _1162;
    int _1176 = _1174 + _803;
    int _1178 = ~_811;
    int _1180 = _1178 + 1;
    float _1182 = as_type<float>(_980) * _1172;
    bool _1184 = !_1166;
    int _1186 = _1184 ? 0 : 1;
    int _1188 = _1176 * _1150;
    int _1190 = _1188 + _1170;
    float _1192 = float(_811);
    float _1194 = trunc(_1182);
    float _1196 = precise::max(_1194, 0.0);
    uint _1198 = uint(_1196);
    int _1200 = int(_1008) + int(_1156);
    float _1202 = float(_896);
    float _1204 = _1122 * _1192;
    int _1206 = abs(_1186);
    int _1208 = _1180 * _1200;
    int _1210 = _1208 + _896;
    bool _1212 = _1202 >= _1192;
    bool _1214 = isnan(_1202);
    bool _1216 = _1212 || _1214;
    bool _1218 = isnan(_1192);
    bool _1220 = _1216 || _1218;
    float _1222 = float(_1220);
    float _1224 = _1192 * _870;
    float _1226 = float(_868);
    int _1228 = _1108 * _1206;
    int _1230 = _1228 + _1190;
    int _1232 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8192;
    bool _1234 = _1232 != 0;
    float _1236 = trunc(_1204);
    int _1238 = int(_1236);
    float _1240 = float(_910);
    float _1242 = _1226 * _870;
    bool _1244 = uint(_1210) >= uint(_811);
    float _1246 = _1132 * _1226;
    int _1248 = int(_1034) + int(_1198);
    bool _1250 = !_1234;
    int _1252 = _1250 ? 0 : 1;
    float _1254 = trunc(_1222);
    int _1256 = int(_1254);
    bool _1258 = _1240 >= _1226;
    bool _1260 = isnan(_1240);
    bool _1262 = _1258 || _1260;
    bool _1264 = isnan(_1226);
    bool _1266 = _1262 || _1264;
    float _1268 = float(_1266);
    float _1270 = -_217;
    int _1272 = _1118 ? as_type<int>(_1270) : as_type<int>(_217);
    float _1274 = float(uint(_1230));
    bool _1276 = !_1244;
    int _1278 = _1276 ? 0 : (-1);
    float _1280 = trunc(_1224);
    int _1282 = int(_1280);
    int _1284 = abs(_1252);
    bool _1286 = !_1042;
    float _1288 = _1286 ? _217 : as_type<float>(_1272);
    float _1290 = as_type<float>(_799) * _1274;
    int _1292 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 256;
    bool _1294 = _1292 != 0;
    int _1296 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 512;
    bool _1298 = _1296 != 0;
    int _1300 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1024;
    bool _1302 = _1300 != 0;
    int _1304 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2048;
    bool _1306 = _1304 != 0;
    int _1308 = ~_1200;
    int _1310 = _1308 + _1278;
    int _1312 = _1310 + 1;
    float _1314 = trunc(_1268);
    int _1316 = int(_1314);
    int _1318 = ~_868;
    int _1320 = _1318 + 1;
    bool _1322 = !_1298;
    int _1324 = _1322 ? 0 : 1;
    int _1326 = _811 * _1312;
    int _1328 = _1326 + _896;
    bool _1330 = _811 == 0;
    int _1332 = _1320 * _1248;
    int _1334 = _1332 + _910;
    float _1336 = trunc(_1290);
    float _1338 = precise::max(_1336, 0.0);
    uint _1340 = uint(_1338);
    int _1342 = ~_1256;
    int _1344 = _1342 + 1;
    int _1346 = _1344 + 1;
    bool _1348 = !_1330;
    int _1350 = _1348 ? _1328 : (-1);
    int _1352 = _1238 * _1284;
    int _1354 = _1352 + _896;
    int _1356 = ~_771;
    int _1358 = _1356 + 1;
    int _1360 = _811 + (-1);
    int _1362 = _1350 * _1346;
    bool _1364 = !_1294;
    int _1366 = _1364 ? 0 : 1;
    float _1368 = trunc(_1242);
    int _1370 = int(_1368);
    bool _1372 = uint(_1334) >= uint(_868);
    int _1374 = _1256 * _1360;
    int _1376 = _1374 + _1362;
    int _1378 = abs(_1324);
    bool _1380 = !_1372;
    int _1382 = _1380 ? 0 : (-1);
    int _1384 = _1358 * int(_1340);
    int _1386 = _1384 + _1230;
    int _1388 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 4096;
    bool _1390 = _1388 != 0;
    int _1392 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 8192;
    bool _1394 = _1392 != 0;
    int _1396 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16384;
    bool _1398 = _1396 != 0;
    int _1400 = _1376 * _1378;
    int _1402 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16384;
    bool _1404 = _1402 != 0;
    float _1406 = float(uint(_1386));
    int _1408 = abs(_1366);
    float _1410 = trunc(_1246);
    int _1412 = int(_1410);
    int _1414 = ~_1248;
    int _1416 = _1414 + _1382;
    int _1418 = _1416 + 1;
    float _1420 = as_type<float>(_799) * _1406;
    float _1422 = float(uint(_1176));
    int _1424 = _1282 * _1408;
    int _1426 = _1424 + _1400;
    bool _1428 = !_1404;
    int _1430 = _1428 ? 0 : 1;
    bool _1432 = !_1302;
    int _1434 = _1432 ? 0 : 1;
    float _1436 = as_type<float>(_799) * _1422;
    int _1438 = abs(_1430);
    float _1440 = trunc(_1420);
    float _1442 = precise::max(_1440, 0.0);
    uint _1444 = uint(_1442);
    bool _1446 = !_1306;
    int _1448 = _1446 ? 0 : 1;
    int _1450 = _868 * _1418;
    int _1452 = _1450 + _910;
    int _1454 = abs(_1434);
    int _1456 = abs(_1448);
    float _1458 = trunc(_1436);
    float _1460 = precise::max(_1458, 0.0);
    uint _1462 = uint(_1460);
    int _1464 = _1412 * _1438;
    int _1466 = _1464 + _910;
    bool _1468 = _868 == 0;
    int _1470 = ~_1316;
    int _1472 = _1470 + 1;
    int _1474 = _1472 + 1;
    int _1476 = _1354 * _1454;
    int _1478 = _1476 + _1426;
    bool _1480 = !_1468;
    int _1482 = _1480 ? _1452 : (-1);
    int _1484 = ~_771;
    int _1486 = _1484 + 1;
    int _1488 = _1238 * _1456;
    int _1490 = _1488 + _1478;
    int _1492 = ~_771;
    int _1494 = _1492 + 1;
    int _1496 = _1482 * _1474;
    bool _1498 = !_1394;
    int _1500 = _1498 ? 0 : 1;
    int _1502 = _868 + (-1);
    int _1504 = _1486 * int(_1462);
    int _1506 = _1504 + _1176;
    int _1508 = int(_1340) + int(_1444);
    int _1510 = _1316 * _1502;
    int _1512 = _1510 + _1496;
    int _1514 = abs(_1500);
    float _1516 = float(uint(_1490));
    float _1518 = float(uint(_1506));
    int _1520 = _1494 * _1508;
    int _1522 = _1520 + _1230;
    int _1524 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32768;
    bool _1526 = _1524 != 0;
    float _1528 = as_type<float>(_958) * _1516;
    int _1530 = _1512 * _1514;
    float _1532 = as_type<float>(_799) * _1518;
    bool _1534 = !_1390;
    int _1536 = _1534 ? 0 : 1;
    float _1538 = float(uint(_1354));
    float _1540 = trunc(_1528);
    float _1542 = precise::max(_1540, 0.0);
    uint _1544 = uint(_1542);
    bool _1546 = uint(_1522) >= uint(_771);
    bool _1548 = !_1398;
    int _1550 = _1548 ? 0 : 1;
    float _1552 = as_type<float>(_958) * _1538;
    int _1554 = abs(_1536);
    int _1556 = abs(_1550);
    float _1558 = trunc(_1532);
    float _1560 = precise::max(_1558, 0.0);
    uint _1562 = uint(_1560);
    bool _1564 = !_1526;
    int _1566 = _1564 ? 0 : 1;
    int _1568 = ~_811;
    int _1570 = _1568 + 1;
    int _1572 = _1370 * _1554;
    int _1574 = _1572 + _1530;
    int _1576 = abs(_1566);
    float _1578 = trunc(_1552);
    float _1580 = precise::max(_1578, 0.0);
    uint _1582 = uint(_1580);
    bool _1584 = !_1546;
    int _1586 = _1584 ? 0 : (-1);
    int _1588 = _1466 * _1556;
    int _1590 = _1588 + _1574;
    int _1592 = _1570 * int(_1544);
    int _1594 = _1592 + _1490;
    int _1596 = ~_1508;
    int _1598 = _1596 + _1586;
    int _1600 = _1598 + 1;
    int _1602 = _1412 * _1576;
    int _1604 = _1602 + _1590;
    float _1606 = float(uint(_1594));
    int _1608 = _771 * _1600;
    int _1610 = _1608 + _1230;
    bool _1612 = _771 == 0;
    int _1614 = int(_1462) + int(_1562);
    float _1616 = as_type<float>(_958) * _1606;
    bool _1618 = !_1612;
    int _1620 = _1618 ? _1610 : (-1);
    int _1622 = _1570 * int(_1582);
    int _1624 = _1622 + _1354;
    float _1626 = float(uint(_1604));
    float _1628 = trunc(_1616);
    float _1630 = precise::max(_1628, 0.0);
    uint _1632 = uint(_1630);
    int _1634 = _1620 & 3;
    bool _1636 = _1634 != 0;
    float _1638 = float(uint(_1624));
    float _1640 = as_type<float>(_980) * _1626;
    int _1642 = _1620 & 3;
    bool _1644 = _1642 != 0;
    int _1646 = _1636 ? 0 : 1;
    float _1648 = as_type<float>(_958) * _1638;
    float _1650 = float(uint(_1466));
    float _1652 = trunc(_1640);
    float _1654 = precise::max(_1652, 0.0);
    uint _1656 = uint(_1654);
    bool _1658 = uint(_1642) > 1u;
    int _1660 = ~_868;
    int _1662 = _1660 + 1;
    float _1664 = as_type<float>(_980) * _1650;
    int _1666 = ~_1646;
    int _1668 = _1666 + 1;
    int _1670 = _1668 + 1;
    float _1672 = trunc(_1648);
    float _1674 = precise::max(_1672, 0.0);
    uint _1676 = uint(_1674);
    int _1678 = int(_1544) + int(_1632);
    int _1680 = ~_771;
    int _1682 = _1680 + 1;
    int _1684 = ~_811;
    int _1686 = _1684 + 1;
    int _1688 = _1670;
    if (!_1658)
    {
        int _1690 = ~_1646;
        int _1692 = _1690 + 1;
        _1688 = _1692;
    }
    int _1694 = _1688;
    int _1696 = _1662 * int(_1656);
    int _1698 = _1696 + _1604;
    bool _1700 = uint(_1642) >= 2u;
    int _1702 = _1682 * _1614;
    int _1704 = _1702 + _1176;
    float _1706 = trunc(_1664);
    float _1708 = precise::max(_1706, 0.0);
    uint _1710 = uint(_1708);
    int _1712 = ~_868;
    int _1714 = _1712 + 1;
    float _1716 = float(uint(_1698));
    int _1718 = _1700 ? 0 : 1;
    bool _1720 = uint(_1704) >= uint(_771);
    float _1722 = as_type<float>(_980) * _1716;
    int _1724 = _1686 * _1678;
    int _1726 = _1724 + _1490;
    int _1728 = ~_1718;
    int _1730 = _1728 + 1;
    int _1732 = _1730 + 1;
    bool _1734 = !_1720;
    int _1736 = _1734 ? 0 : (-1);
    bool _1738 = uint(_1726) >= uint(_811);
    float _1740 = trunc(_1722);
    float _1742 = precise::max(_1740, 0.0);
    uint _1744 = uint(_1742);
    int _1746 = ~_1614;
    int _1748 = _1746 + _1736;
    int _1750 = _1748 + 1;
    int _1752 = _1714 * int(_1710);
    int _1754 = _1752 + _1466;
    bool _1756 = !_1738;
    int _1758 = _1756 ? 0 : (-1);
    bool _1760 = _1642 != 3;
    int _1762 = _771 * _1750;
    int _1764 = _1762 + _1176;
    int _1766 = ~_1678;
    int _1768 = _1766 + _1758;
    int _1770 = _1768 + 1;
    float _1772 = float(uint(_1754));
    int _1774 = ~_868;
    int _1776 = _1774 + 1;
    int _1778 = _811 * _1770;
    int _1780 = _1778 + _1490;
    bool _1782 = !_1644;
    int _1784 = _1782 ? 0 : 1;
    float _1786 = as_type<float>(_980) * _1772;
    bool _1788 = !_1612;
    int _1790 = _1788 ? _1764 : (-1);
    bool _1792 = !_1330;
    int _1794 = _1792 ? _1780 : (-1);
    float _1796 = trunc(_1786);
    float _1798 = precise::max(_1796, 0.0);
    uint _1800 = uint(_1798);
    int _1802 = int(_1656) + int(_1744);
    int _1804 = _1732;
    if (_1760)
    {
        int _1806 = ~_1718;
        int _1808 = _1806 + 1;
        _1804 = _1808;
    }
    int _1810 = _1804;
    int _1812 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _1814 = _1812 != 0;
    int _1816 = _1776 * _1802;
    int _1818 = _1816 + _1604;
    int _1820 = _1794 & 3;
    bool _1822 = _1820 != 0;
    int _1824 = _1794 & 3;
    bool _1826 = _1824 != 0;
    bool _1828 = !_1814;
    int _1830 = _1828 ? 0 : 1;
    bool _1832 = uint(_1820) > 1u;
    int _1834 = _1826 ? 0 : 1;
    bool _1836 = uint(_1818) >= uint(_868);
    int _1838 = int(_1582) + int(_1676);
    bool _1840 = !_1836;
    int _1842 = _1840 ? 0 : (-1);
    int _1844 = ~_811;
    int _1846 = _1844 + 1;
    int _1848 = ~_1802;
    int _1850 = _1848 + _1842;
    int _1852 = _1850 + 1;
    int _1854 = ~_1834;
    int _1856 = _1854 + 1;
    int _1858 = _1856 + 1;
    int _1860 = _1846 * _1838;
    int _1862 = _1860 + _1354;
    int _1864 = _1858;
    if (!_1832)
    {
        int _1866 = ~_1834;
        int _1868 = _1866 + 1;
        _1864 = _1868;
    }
    int _1870 = _1864;
    int _1872 = _868 * _1852;
    int _1874 = _1872 + _1604;
    bool _1876 = _1642 != 3;
    bool _1878 = uint(_1820) >= 2u;
    int _1880 = _1794 >> 31;
    bool _1882 = !_1876;
    int _1884 = _1882 ? 0 : (-1);
    int _1886 = _1878 ? 0 : 1;
    bool _1888 = _1820 != 3;
    bool _1890 = _1820 != 3;
    int _1892 = _1880 & 3;
    bool _1894 = !_1822;
    int _1896 = _1894 ? 0 : 1;
    bool _1898 = !_1468;
    int _1900 = _1898 ? _1874 : (-1);
    bool _1902 = uint(_1862) >= uint(_811);
    int _1904 = _1620 >> 31;
    int _1906 = _1794 + _1892;
    int _1908 = _1900 >> 31;
    int _1910 = _1904 & 3;
    int _1912 = _1908 & 3;
    int _1914 = _1620 + _1910;
    int _1916 = ~_1886;
    int _1918 = _1916 + 1;
    int _1920 = _1918 + 1;
    int _1922 = _1920;
    if (_1888)
    {
        int _1924 = ~_1886;
        int _1926 = _1924 + 1;
        _1922 = _1926;
    }
    int _1928 = _1922;
    bool _1930 = !_1890;
    int _1932 = _1930 ? 0 : (-1);
    int _1934 = int(_1710) + int(_1800);
    int _1936 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4194304;
    bool _1938 = _1936 != 0;
    int _1940 = _1900 & 3;
    bool _1942 = _1940 != 0;
    int _1944 = _1900 + _1912;
    int _1946 = _1900 & 3;
    bool _1948 = _1946 != 0;
    float _1950 = in.m_50.x;
    float _1952 = in.m_50.y;
    float _1954 = in.m_50.z;
    int _1956 = _1914 >> 2;
    bool _1958 = !_1938;
    int _1960 = _1958 ? 0 : 1;
    bool _1962 = !_1902;
    int _1964 = _1962 ? 0 : (-1);
    bool _1966 = uint(_1946) > 1u;
    int _1968 = _1956 << 4;
    int _1970 = _1968 + 368;
    int _1972 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8388608;
    bool _1974 = _1972 != 0;
    int _1976 = _1906 >> 2;
    uint _1978 = uint(int(uint(_1970) >> uint(2)));
    uint _1980 = uint(int(uint(int(_1978)) >> uint(2)));
    int _1982 = int(_1978) & 3;
    float _1984 = (*spvDescriptorSet0.vp_c9)._m0[int(_1980)][_1982];
    int _1986 = int(_1978) + 1;
    uint _1988 = uint(int(uint(_1986) >> uint(2)));
    int _1990 = _1986 & 3;
    float _1992 = (*spvDescriptorSet0.vp_c9)._m0[int(_1988)][_1990];
    bool _1994 = !_1974;
    int _1996 = _1994 ? 0 : 1;
    int _1998 = ~_868;
    int _2000 = _1998 + 1;
    bool _2002 = _1946 != 3;
    int _2004 = _1976 << 4;
    int _2006 = _2004 + 512;
    int _2008 = _2000 * _1934;
    int _2010 = _2008 + _1466;
    int _2012 = _1942 ? 0 : 1;
    float _2014 = _197 * _1952;
    int _2016 = _1944 >> 2;
    uint _2018 = uint(int(uint(_2006) >> uint(2)));
    uint _2020 = uint(int(uint(int(_2018)) >> uint(2)));
    int _2022 = int(_2018) & 3;
    float _2024 = (*spvDescriptorSet0.vp_c9)._m0[int(_2020)][_2022];
    int _2026 = int(_2018) + 1;
    uint _2028 = uint(int(uint(_2026) >> uint(2)));
    int _2030 = _2026 & 3;
    float _2032 = (*spvDescriptorSet0.vp_c9)._m0[int(_2028)][_2030];
    bool _2034 = uint(_1946) >= 2u;
    float _2036 = _185 * _1952;
    int _2038 = ~_2012;
    int _2040 = _2038 + 1;
    int _2042 = _2040 + 1;
    int _2044 = _2042;
    if (!_1966)
    {
        int _2046 = ~_2012;
        int _2048 = _2046 + 1;
        _2044 = _2048;
    }
    int _2050 = _2044;
    float _2052 = fma(_183, _1950, _2036);
    int _2054 = _2016 << 4;
    int _2056 = _2054 + 656;
    float _2058 = trunc((*spvDescriptorSet0.vp_c9)._m0[90].z);
    int _2060 = int(_2058);
    bool _2062 = _1946 != 3;
    float _2064 = fma(_187, _1954, _2052);
    int _2066 = _2034 ? 0 : 1;
    uint _2068 = uint(int(uint(_2056) >> uint(2)));
    uint _2070 = uint(int(uint(int(_2068)) >> uint(2)));
    int _2072 = int(_2068) & 3;
    float _2074 = (*spvDescriptorSet0.vp_c9)._m0[int(_2070)][_2072];
    int _2076 = int(_2068) + 1;
    uint _2078 = uint(int(uint(_2076) >> uint(2)));
    int _2080 = _2076 & 3;
    float _2082 = (*spvDescriptorSet0.vp_c9)._m0[int(_2078)][_2080];
    bool _2084 = uint(_2010) >= uint(_868);
    int _2086 = ~_1838;
    int _2088 = _2086 + _1964;
    int _2090 = _2088 + 1;
    bool _2092 = !_1948;
    int _2094 = _2092 ? 0 : 1;
    int _2096 = _2006 + 8;
    uint _2098 = uint(int(uint(_2096) >> uint(2)));
    uint _2100 = uint(int(uint(int(_2098)) >> uint(2)));
    int _2102 = int(_2098) & 3;
    float _2104 = (*spvDescriptorSet0.vp_c9)._m0[int(_2100)][_2102];
    int _2106 = int(_2098) + 1;
    uint _2108 = uint(int(uint(_2106) >> uint(2)));
    int _2110 = _2106 & 3;
    float _2112 = (*spvDescriptorSet0.vp_c9)._m0[int(_2108)][_2110];
    int _2114 = ~_2066;
    int _2116 = _2114 + 1;
    int _2118 = _2116 + 1;
    int _2120 = _811 * _2090;
    int _2122 = _2120 + _1354;
    int _2124 = 2 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y);
    bool _2126 = _2124 != 0;
    int _2128 = _2118;
    if (_2002)
    {
        int _2130 = ~_2066;
        int _2132 = _2130 + 1;
        _2128 = _2132;
    }
    int _2134 = _2128;
    bool _2136 = !_2062;
    int _2138 = _2136 ? 0 : (-1);
    bool _2140 = !_2084;
    int _2142 = _2140 ? 0 : (-1);
    int _2144 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _2146 = _2144 != 0;
    int _2148 = _1970 + 8;
    uint _2150 = uint(int(uint(_2148) >> uint(2)));
    uint _2152 = uint(int(uint(int(_2150)) >> uint(2)));
    int _2154 = int(_2150) & 3;
    float _2156 = (*spvDescriptorSet0.vp_c9)._m0[int(_2152)][_2154];
    int _2158 = int(_2150) + 1;
    uint _2160 = uint(int(uint(_2158) >> uint(2)));
    int _2162 = _2158 & 3;
    float _2164 = (*spvDescriptorSet0.vp_c9)._m0[int(_2160)][_2162];
    int _2166 = ~_1934;
    int _2168 = _2166 + _2142;
    int _2170 = _2168 + 1;
    float _2172 = fma(_195, _1950, _2014);
    int _2174 = abs(_1694);
    int _2176 = abs(_2050);
    int _2178 = _868 * _2170;
    int _2180 = _2178 + _1466;
    int _2182 = _2056 + 8;
    uint _2184 = uint(int(uint(_2182) >> uint(2)));
    uint _2186 = uint(int(uint(int(_2184)) >> uint(2)));
    int _2188 = int(_2184) & 3;
    float _2190 = (*spvDescriptorSet0.vp_c9)._m0[int(_2186)][_2188];
    int _2192 = int(_2184) + 1;
    uint _2194 = uint(int(uint(_2192) >> uint(2)));
    int _2196 = _2192 & 3;
    float _2198 = (*spvDescriptorSet0.vp_c9)._m0[int(_2194)][_2196];
    int _2200 = abs(_1870);
    float _2202 = fma(_199, _1954, _2172);
    int _2204 = abs(_1784);
    int _2206 = ~_2174;
    int _2208 = _2206 + 1;
    int _2210 = _2208 + 1;
    int _2212 = ~_2204;
    int _2214 = _2212 + 1;
    int _2216 = _2214 + 1;
    int _2218 = _2210 * as_type<int>(_1992);
    int _2220 = ~_2200;
    int _2222 = _2220 + 1;
    int _2224 = _2222 + 1;
    int _2226 = _2216 * as_type<int>(_1984);
    int _2228 = _2226 + _2218;
    int _2230 = abs(_1896);
    int _2232 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y);
    bool _2234 = _2232 != 0;
    float _2236 = _191 * _1952;
    int _2238 = abs(_2094);
    float _2240 = trunc((*spvDescriptorSet0.vp_c9)._m0[80].z);
    int _2242 = int(_2240);
    int _2244 = abs(_1928);
    int _2246 = _2224 * as_type<int>(_2032);
    int _2248 = ~_2230;
    int _2250 = _2248 + 1;
    int _2252 = _2250 + 1;
    float _2254 = fma(_189, _1950, _2236);
    int _2256 = ~_2176;
    int _2258 = _2256 + 1;
    int _2260 = _2258 + 1;
    int _2262 = abs(_1810);
    float _2264 = trunc((*spvDescriptorSet0.vp_c9)._m0[85].z);
    int _2266 = int(_2264);
    int _2268 = _2252 * as_type<int>(_2024);
    int _2270 = _2268 + _2246;
    int _2272 = ~_2244;
    int _2274 = _2272 + 1;
    int _2276 = _2274 + 1;
    int _2278 = _2260 * as_type<int>(_2082);
    int _2280 = ~_2238;
    int _2282 = _2280 + 1;
    int _2284 = _2282 + 1;
    float _2286 = fma(_193, _1954, _2254);
    int _2288 = ~_2262;
    int _2290 = _2288 + 1;
    int _2292 = _2290 + 1;
    int _2294 = _2276 * as_type<int>(_2104);
    int _2296 = _2294 + _2270;
    int _2298 = abs(_2134);
    int _2300 = _2284 * as_type<int>(_2074);
    int _2302 = _2300 + _2278;
    int _2304 = abs(_1884);
    int _2306 = _2292 * as_type<int>(_2156);
    int _2308 = _2306 + _2228;
    int _2310 = ~_2298;
    int _2312 = _2310 + 1;
    int _2314 = _2312 + 1;
    int _2316 = abs(_2138);
    int _2318 = ~_2304;
    int _2320 = _2318 + 1;
    int _2322 = _2320 + 1;
    float _2324 = float(uint(_2242));
    int _2326 = _2314 * as_type<int>(_2190);
    int _2328 = _2326 + _2302;
    int _2330 = ~_2316;
    int _2332 = _2330 + 1;
    int _2334 = _2332 + 1;
    int _2336 = _2322 * as_type<int>(_2164);
    int _2338 = _2336 + _2308;
    int _2340 = abs(_2242);
    int _2342 = abs(_2266);
    float _2344 = 1.0 / _2324;
    int _2346 = abs(_1830);
    int _2348 = _2334 * as_type<int>(_2198);
    int _2350 = _2348 + _2328;
    float _2352 = float(uint(_2266));
    int _2354 = abs(_1932);
    float _2356 = 1.0 / _2352;
    int _2358 = ~_2346;
    int _2360 = _2358 + 1;
    int _2362 = _2360 + 1;
    int _2364 = ~_2354;
    int _2366 = _2364 + 1;
    int _2368 = _2366 + 1;
    int _2370 = abs(_1960);
    int _2372 = _2338 * _2362;
    float _2374 = float(uint(_2060));
    int _2376 = _2368 * as_type<int>(_2112);
    int _2378 = _2376 + _2296;
    int _2380 = ~_2370;
    int _2382 = _2380 + 1;
    int _2384 = _2382 + 1;
    int _2386 = _1790 * _2346;
    int _2388 = _2386 + _2372;
    int _2390 = abs(_1996);
    float _2392 = _876 * 2.0;
    float _2394 = 1.0 / _2374;
    float _2396 = float(uint(_2340));
    int _2398 = _2378 * _2384;
    bool _2400 = !_1330;
    int _2402 = _2400 ? _2122 : (-1);
    int _2404 = ~_2390;
    int _2406 = _2404 + 1;
    int _2408 = _2406 + 1;
    int _2410 = as_type<int>(_2344) + (-2);
    int _2412 = _2402 * _2370;
    int _2414 = _2412 + _2398;
    float _2416 = 1.0 / _2396;
    float _2418 = float(uint(_2388));
    int _2420 = _2350 * _2408;
    bool _2422 = !_1468;
    int _2424 = _2422 ? _2180 : (-1);
    float _2426 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    int _2428 = abs(_2060);
    float _2430 = as_type<float>(_2410) * _2418;
    float _2432 = _876 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    int _2434 = as_type<int>(_2356) + (-2);
    int _2436 = _2424 * _2390;
    int _2438 = _2436 + _2420;
    float _2440 = float(uint(_2414));
    float _2442 = -_2426;
    float _2444 = fma(_2432, 2.0, _2442);
    float _2446 = float(uint(_2342));
    float _2448 = trunc(_2430);
    float _2450 = precise::max(_2448, 0.0);
    uint _2452 = uint(_2450);
    float _2454 = as_type<float>(_2434) * _2440;
    float _2456 = -_153;
    float _2458 = fma(_2456, (*spvDescriptorSet0.vp_c9)._m0[76].x, _2444);
    int _2460 = as_type<int>(_2394) + (-2);
    float _2462 = float(uint(_2438));
    float _2464 = 1.0 / _2446;
    int _2466 = abs(_2388);
    float _2468 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _2470 = _878 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _2472 = as_type<float>(_2460) * _2462;
    int _2474 = as_type<int>(_2416) + (-2);
    float _2476 = trunc(_2454);
    float _2478 = precise::max(_2476, 0.0);
    uint _2480 = uint(_2478);
    float _2482 = float(uint(_2466));
    float _2484 = fma(_2470, -2.0, _2468);
    float _2486 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _2488 = _2486 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    int _2490 = ~_2242;
    int _2492 = _2490 + 1;
    float _2494 = as_type<float>(_2474) * _2482;
    int _2496 = abs(_2438);
    float _2498 = trunc(_2472);
    float _2500 = precise::max(_2498, 0.0);
    uint _2502 = uint(_2500);
    float _2504 = float(uint(_2428));
    float _2506 = fma(_153, (*spvDescriptorSet0.vp_c9)._m0[76].y, _2484);
    int _2508 = abs(_2414);
    float _2510 = 1.0 / _2488;
    int _2512 = ~_2266;
    int _2514 = _2512 + 1;
    int _2516 = _2492 * int(_2452);
    int _2518 = _2516 + _2388;
    int _2520 = ~_2060;
    int _2522 = _2520 + 1;
    int _2524 = as_type<int>(_2464) + (-2);
    int _2526 = _2514 * int(_2480);
    int _2528 = _2526 + _2414;
    float _2530 = float(uint(_2508));
    float _2532 = trunc(_2494);
    float _2534 = precise::max(_2532, 0.0);
    uint _2536 = uint(_2534);
    float _2538 = as_type<float>(_2524) * _2530;
    float _2540 = float(uint(_2518));
    int _2542 = _2522 * int(_2502);
    int _2544 = _2542 + _2438;
    int _2546 = ~_2340;
    int _2548 = _2546 + 1;
    float _2550 = 1.0 / _2504;
    float _2552 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _2554 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _2552;
    float _2556 = float(uint(_2528));
    float _2558 = as_type<float>(_2410) * _2540;
    float _2560 = float(uint(_2544));
    float _2562 = _2554 * _2510;
    float _2564 = _876 + _878;
    float _2566 = float(uint(_2496));
    float _2568 = floor(_2392);
    int _2570 = _2548 * int(_2536);
    int _2572 = _2570 + _2466;
    float _2574 = as_type<float>(_2434) * _2556;
    float _2576 = _2564 + (-1.0);
    float _2578 = as_type<float>(_2460) * _2560;
    int _2580 = ~_2342;
    int _2582 = _2580 + 1;
    float _2584 = trunc(_2538);
    float _2586 = precise::max(_2584, 0.0);
    uint _2588 = uint(_2586);
    int _2590 = as_type<int>(_2550) + (-2);
    float _2592 = float(uint(_2572));
    float _2594 = fma(_2576, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _2596 = as_type<float>(_2590) * _2566;
    bool _2598 = _942 != 1;
    float _2600 = trunc(_2558);
    float _2602 = precise::max(_2600, 0.0);
    uint _2604 = uint(_2602);
    float _2606 = as_type<float>(_2474) * _2592;
    bool _2608 = _2568 > 0.0;
    float _2610 = _878 + _880;
    bool _2612 = _2568 >= 0.0;
    bool _2614 = isnan(_2568);
    bool _2616 = _2612 || _2614;
    bool _2618 = isnan(0.0);
    bool _2620 = _2616 || _2618;
    bool _2622 = _878 > 0.5;
    float _2624 = _2610 + (-1.0);
    float _2626 = trunc(_2596);
    float _2628 = precise::max(_2626, 0.0);
    uint _2630 = uint(_2628);
    int _2632 = _2582 * int(_2588);
    int _2634 = _2632 + _2508;
    float _2636 = -_217;
    int _2638 = _2622 ? as_type<int>(_2636) : as_type<int>(_217);
    float _2640 = float(uint(_2634));
    float _2642 = trunc(_2606);
    float _2644 = precise::max(_2642, 0.0);
    uint _2646 = uint(_2644);
    int _2648 = int(_2452) + int(_2604);
    float _2650 = fma(_2624, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    int _2652 = ~_2428;
    int _2654 = _2652 + 1;
    float _2656 = as_type<float>(_2524) * _2640;
    int _2658 = ~_2242;
    int _2660 = _2658 + 1;
    float _2662 = trunc(_2574);
    float _2664 = precise::max(_2662, 0.0);
    uint _2666 = uint(_2664);
    int _2668 = _2654 * int(_2630);
    int _2670 = _2668 + _2496;
    int _2672 = ~_2340;
    int _2674 = _2672 + 1;
    int _2676 = _2660 * _2648;
    int _2678 = _2676 + _2388;
    float _2680 = trunc(_2656);
    float _2682 = precise::max(_2680, 0.0);
    uint _2684 = uint(_2682);
    int _2686 = int(_2536) + int(_2646);
    float _2688 = float(uint(_2670));
    bool _2690 = !_2126;
    float _2692 = _2690 ? _217 : as_type<float>(_2638);
    int _2694 = _2674 * _2686;
    int _2696 = _2694 + _2466;
    bool _2698 = _880 > 0.5;
    float _2700 = trunc(_2578);
    float _2702 = precise::max(_2700, 0.0);
    uint _2704 = uint(_2702);
    int _2706 = int(_2480) + int(_2666);
    float _2708 = as_type<float>(_2590) * _2688;
    int _2710 = ~_2266;
    int _2712 = _2710 + 1;
    float _2714 = in.m_64.w;
    bool _2716 = uint(_2678) >= uint(_2242);
    float _2718 = -_213;
    int _2720 = _2698 ? as_type<int>(_2718) : as_type<int>(_213);
    int _2722 = _2712 * _2706;
    int _2724 = _2722 + _2414;
    bool _2726 = !_2716;
    int _2728 = _2726 ? 0 : (-1);
    float _2730 = trunc(_2708);
    float _2732 = precise::max(_2730, 0.0);
    uint _2734 = uint(_2732);
    bool _2736 = !_2146;
    float _2738 = _2736 ? _213 : as_type<float>(_2720);
    bool _2740 = uint(_2696) >= uint(_2340);
    bool _2742 = _876 > 0.5;
    int _2744 = int(_2588) + int(_2684);
    int _2746 = ~_2648;
    int _2748 = _2746 + _2728;
    int _2750 = _2748 + 1;
    int _2752 = ~_2342;
    int _2754 = _2752 + 1;
    bool _2756 = uint(_2724) >= uint(_2266);
    int _2758 = _2242 * _2750;
    int _2760 = _2758 + _2388;
    int _2762 = int(_2502) + int(_2704);
    int _2764 = ~_2060;
    int _2766 = _2764 + 1;
    float _2768 = _2286 + _2714;
    float _2770 = -_213;
    int _2772 = _2742 ? as_type<int>(_2770) : as_type<int>(_213);
    bool _2774 = _944 != 2;
    int _2776 = _2754 * _2744;
    int _2778 = _2776 + _2508;
    bool _2780 = !_2740;
    int _2782 = _2780 ? 0 : (-1);
    int _2784 = _2766 * _2762;
    int _2786 = _2784 + _2438;
    bool _2788 = _2242 == 0;
    bool _2790 = !_2756;
    int _2792 = _2790 ? 0 : (-1);
    bool _2794 = !_2788;
    int _2796 = _2794 ? _2760 : (-1);
    int _2798 = ~_2706;
    int _2800 = _2798 + _2792;
    int _2802 = _2800 + 1;
    bool _2804 = uint(_2778) >= uint(_2342);
    bool _2806 = uint(_2786) >= uint(_2060);
    int _2808 = _2266 * _2802;
    int _2810 = _2808 + _2414;
    int _2812 = int(_2630) + int(_2734);
    int _2814 = ~_2428;
    int _2816 = _2814 + 1;
    bool _2818 = !_2804;
    int _2820 = _2818 ? 0 : (-1);
    bool _2822 = _2266 == 0;
    int _2824 = _2816 * _2812;
    int _2826 = _2824 + _2496;
    bool _2828 = !_2234;
    float _2830 = _2828 ? _213 : as_type<float>(_2772);
    bool _2832 = _2242 == 0;
    int _2834 = _2388 ^ _2242;
    bool _2836 = !_2822;
    int _2838 = _2836 ? _2810 : (-1);
    bool _2840 = _2266 == 0;
    int _2842 = _2414 ^ _2266;
    float _2844 = _878 * 2.0;
    bool _2846 = !_2806;
    int _2848 = _2846 ? 0 : (-1);
    bool _2850 = uint(_2826) >= uint(_2428);
    int _2852 = ~_2782;
    int _2854 = _2686 + _2852;
    int _2856 = _2854 + 1;
    float _2858 = floor(_2844);
    int _2860 = ~_2820;
    int _2862 = _2744 + _2860;
    int _2864 = _2862 + 1;
    float _2866 = in.m_62.w;
    uint _2868 = uint(int(uint(_2842) >> uint(31)));
    uint _2870 = uint(int(uint(_2834) >> uint(31)));
    int _2872 = ~_2762;
    int _2874 = _2872 + _2848;
    int _2876 = _2874 + 1;
    float _2878 = _880 * 2.0;
    float _2880 = as_type<float>(_2388);
    float _2882 = as_type<float>(_2826);
    float _2884 = as_type<float>(_2414);
    float _2886 = as_type<float>(_2724);
    float _2888 = _2768;
    if (!_2598)
    {
        _2880 = _878;
    }
    float _2890 = _2880;
    float _2892 = in.m_66.w;
    int _2894 = ~int(_2868);
    int _2896 = _2894 + 1;
    float _2898 = floor(_2878);
    int _2900 = ~int(_2870);
    int _2902 = _2900 + 1;
    int _2904 = _2060 * _2876;
    int _2906 = _2904 + _2438;
    float _2908 = _2890;
    float _2910 = as_type<float>(_2902);
    if (!_2598)
    {
        _2882 = _2890;
    }
    float _2912 = _2882;
    float _2914 = _2912;
    if (!_2598)
    {
        _2884 = _880;
    }
    float _2916 = _2884;
    float _2918 = _2916;
    if (!_2598)
    {
        _2886 = _880;
    }
    float _2920 = _2886;
    float _2922 = _2920;
    if (_2598)
    {
        _2914 = _876;
    }
    float _2924 = _2914;
    if (_2598)
    {
        _2908 = _876;
    }
    float _2926 = _2908;
    if (_2598)
    {
        _2918 = _878;
    }
    float _2928 = _2918;
    float _2930 = _2064 + _2866;
    float _2932 = _2930;
    if (_2598)
    {
        _2922 = _878;
    }
    float _2934 = _2922;
    float _2936 = _2924 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    bool _2938 = _2060 == 0;
    float _2940 = _2928 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    int _2942 = _2864 ^ _2896;
    int _2944 = _2856 ^ _2902;
    bool _2946 = !_2938;
    int _2948 = _2946 ? _2906 : (-1);
    int _2950 = ~_2896;
    int _2952 = _2950 + _2942;
    int _2954 = _2952 + 1;
    float _2956 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _2958 = _761 + _2956;
    bool _2960 = !_2850;
    int _2962 = _2960 ? 0 : (-1);
    int _2964 = ~_2902;
    int _2966 = _2964 + _2944;
    int _2968 = _2966 + 1;
    float _2970 = fma(_2562, _2958, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    bool _2972 = _761 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _2974 = isnan(_761);
    bool _2976 = _2972 || _2974;
    bool _2978 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _2980 = _2976 || _2978;
    float _2982 = float(_2980);
    bool _2984 = _2858 > 0.0;
    bool _2986 = _2858 >= 0.0;
    bool _2988 = isnan(_2858);
    bool _2990 = _2986 || _2988;
    bool _2992 = isnan(0.0);
    bool _2994 = _2990 || _2992;
    float _2996 = -_2982;
    float _2998 = _2996 + 1.0;
    float _3000 = as_type<float>(_2944);
    if (_2774)
    {
        _3000 = _876;
    }
    float _3002 = _3000;
    float _3004 = _3002;
    if (_2774)
    {
        _2910 = _878;
    }
    float _3006 = _2910;
    bool _3008 = _761 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _3010 = isnan(_761);
    bool _3012 = _3008 || _3010;
    bool _3014 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _3016 = _3012 || _3014;
    float _3018 = float(_3016);
    float _3020 = _3006;
    if (!_2774)
    {
        _3004 = _880;
    }
    float _3022 = _3004;
    if (!_2774)
    {
        _3020 = _876;
    }
    float _3024 = _3020;
    float _3026 = _3018 * _2998;
    bool _3028 = !_2832;
    int _3030 = _3028 ? _2968 : (-1);
    float _3032 = _3022 * (*spvDescriptorSet0.vp_c9)._m0[87].x;
    bool _3034 = !_2840;
    int _3036 = _3034 ? _2954 : (-1);
    float _3038 = _2970 * _3026;
    int _3040 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _3042 = _3040 != 0;
    int _3044 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _3046 = _3044 != 0;
    int _3048 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _3050 = _3048 != 0;
    float _3052 = -_3018;
    float _3054 = _3052 + 1.0;
    int _3056 = _2620 ? 0 : 1;
    float _3058 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    bool _3060 = _2898 > 0.0;
    bool _3062 = !_3046;
    int _3064 = _3062 ? 0 : 1;
    bool _3066 = _2898 >= 0.0;
    bool _3068 = isnan(_2898);
    bool _3070 = _3066 || _3068;
    bool _3072 = isnan(0.0);
    bool _3074 = _3070 || _3072;
    int _3076 = _2438 ^ _2060;
    float _3078 = fma(_3054, (*spvDescriptorSet0.vp_c9)._m0[131].x, _3038);
    int _3080 = _3074 ? 0 : 1;
    float _3082 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    uint _3084 = uint(int(uint(_3076) >> uint(31)));
    float _3086 = fma(_2982, (*spvDescriptorSet0.vp_c9)._m0[132].x, _3078);
    int _3088 = ~_2962;
    int _3090 = _2812 + _3088;
    int _3092 = _3090 + 1;
    float _3094 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _3096 = _2768 + _3094;
    bool _3098 = _2060 == 0;
    float _3100 = _2202 + _2892;
    int _3102 = ~_3080;
    int _3104 = _3102 + 1;
    int _3106 = _3104 + 1;
    float _3108 = _3058 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    int _3110 = _3106;
    if (!_3060)
    {
        int _3112 = ~_3080;
        int _3114 = _3112 + 1;
        _3110 = _3114;
    }
    int _3116 = _3110;
    float _3118 = _3096 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    int _3120 = ~int(_3084);
    int _3122 = _3120 + 1;
    float _3124 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _3126 = _2930 + _3124;
    float _3128 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _3130 = _3100 + _3128;
    int _3132 = _3092 ^ _3122;
    float _3134 = fma(_3126, (*spvDescriptorSet0.vp_c8)._m0[28].x, _3118);
    float _3136 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    int _3138 = ~_3122;
    int _3140 = _3138 + _3132;
    int _3142 = _3140 + 1;
    float _3144 = fma(_3130, (*spvDescriptorSet0.vp_c8)._m0[28].z, _3134);
    float _3146 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _3148 = float(_2838);
    float _3150 = (*spvDescriptorSet0.vp_c9)._m0[87].x + (*spvDescriptorSet0.vp_c9)._m0[86].z;
    bool _3152 = _3144 >= 0.0;
    float _3154 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _3156 = -_3150;
    float _3158 = fma(_3032, 2.0, _3156);
    float _3160 = float(_2796);
    float _3162 = fma(_2926, (*spvDescriptorSet0.vp_c9)._m0[83].z, _3154);
    float _3164 = float(_3030);
    float _3166 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _3168 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].z;
    float _3170 = fma(_3108, _3160, _2458);
    float _3172 = -_3166;
    float _3174 = fma(_2936, 2.0, _3172);
    float _3176 = fma(_2940, -2.0, _3136);
    float _3178 = _3024 * (*spvDescriptorSet0.vp_c9)._m0[87].y;
    float _3180 = _3146 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _3182 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _3184 = (*spvDescriptorSet0.vp_c9)._m0[87].y + (*spvDescriptorSet0.vp_c9)._m0[86].w;
    float _3186 = -_153;
    float _3188 = fma(_3186, (*spvDescriptorSet0.vp_c9)._m0[81].x, _3174);
    float _3190 = _3082 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    bool _3192 = !_3098;
    int _3194 = _3192 ? _3142 : (-1);
    float _3196 = fma(_3178, -2.0, _3184);
    float _3198 = fma(_3180, _3148, _3188);
    float _3200 = _2830 + 0.5;
    float _3202 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].w;
    float _3204 = float(_2948);
    float _3206 = _3168 * (*spvDescriptorSet0.vp_c9)._m0[90].x;
    float _3208 = -_153;
    float _3210 = fma(_3208, (*spvDescriptorSet0.vp_c9)._m0[86].x, _3158);
    float _3212 = fma(_3108, _3200, _3170);
    float _3214 = -_2506;
    float _3216 = fma(_3190, _3164, _3214);
    float _3218 = float(_3036);
    float _3220 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _3222 = _3182 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _3224 = fma(_153, (*spvDescriptorSet0.vp_c9)._m0[81].y, _3176);
    float _3226 = float(_3194);
    float _3228 = _2692 + (-0.5);
    float _3230 = fma(_153, (*spvDescriptorSet0.vp_c9)._m0[86].y, _3196);
    float _3232 = fma(_3206, _3204, _3210);
    float _3234 = fma(_2934, (*spvDescriptorSet0.vp_c9)._m0[83].w, _3220);
    float _3236 = -_3224;
    float _3238 = fma(_3222, _3218, _3236);
    float _3240 = _3202 * (*spvDescriptorSet0.vp_c9)._m0[90].y;
    float _3242 = -_3190;
    float _3244 = fma(_3242, _3228, _3216);
    float _3246 = _1288 + (-0.5);
    float _3248 = -_3230;
    float _3250 = fma(_3240, _3226, _3248);
    float _3252 = _1060 + (-0.5);
    float _3254 = -_3222;
    float _3256 = fma(_3254, _3246, _3238);
    float _3258 = _1074 + 0.5;
    float _3260 = -_3240;
    float _3262 = fma(_3260, _3252, _3250);
    float _3264 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _3266 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _3268 = fma(_3206, _3258, _3232);
    float _3270 = fma(_878, (*spvDescriptorSet0.vp_c9)._m0[78].w, _3264);
    float _3272 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _3274 = log2(_3272);
    float _3276 = fma(_876, (*spvDescriptorSet0.vp_c9)._m0[78].z, _3266);
    float _3278 = (*spvDescriptorSet0.vp_c9)._m0[88].z + (*spvDescriptorSet0.vp_c9)._m0[88].x;
    float _3280 = fma(_153, (*spvDescriptorSet0.vp_c9)._m0[77].w, _3270);
    float _3282 = fma(_153, (*spvDescriptorSet0.vp_c9)._m0[82].w, _3234);
    float _3284 = fma(_153, (*spvDescriptorSet0.vp_c9)._m0[77].z, _3276);
    float _3286 = fma(_876, (*spvDescriptorSet0.vp_c9)._m0[88].z, _3278);
    float _3288 = -_3280;
    float _3290 = _3288 + 1.0;
    float _3292 = _2738 + 0.5;
    float _3294 = -_3284;
    float _3296 = _3294 + 1.0;
    float _3298 = fma(_153, (*spvDescriptorSet0.vp_c9)._m0[87].z, _3286);
    float _3300 = fma(_2692, _3290, _3244);
    float _3302 = -_3296;
    float _3304 = fma(_2830, _3302, _3212);
    float _3306 = _3096 * _3096;
    float _3308 = -_3298;
    float _3310 = _3308 + 1.0;
    float _3312 = fma(_153, (*spvDescriptorSet0.vp_c9)._m0[82].z, _3162);
    float _3314 = (*spvDescriptorSet0.vp_c9)._m0[88].w + (*spvDescriptorSet0.vp_c9)._m0[88].y;
    float _3316 = fma(_3126, _3126, _3306);
    float _3318 = _3252;
    if (_3152)
    {
        _3318 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _3320 = _3318;
    float _3322 = -_3310;
    float _3324 = fma(_1074, _3322, _3268);
    float _3326 = fma(_878, (*spvDescriptorSet0.vp_c9)._m0[88].w, _3314);
    float _3328 = -_3282;
    float _3330 = _3328 + 1.0;
    float _3332 = fma(_3130, _3130, _3316);
    float _3334 = fma(_3180, _3292, _3198);
    float _3336 = fma(_153, (*spvDescriptorSet0.vp_c9)._m0[87].w, _3326);
    float _3338 = -_3312;
    float _3340 = _3338 + 1.0;
    float _3342 = _3274 * _153;
    float _3344 = fma(_1288, _3330, _3256);
    float _3346 = -_3336;
    float _3348 = _3346 + 1.0;
    int _3350 = as_type<int>(_3336);
    if (_3152)
    {
        float _3352 = _3320 * 5.0;
        _3350 = as_type<int>(_3352);
    }
    int _3354 = _3350;
    float _3356 = -_3340;
    float _3358 = fma(_2738, _3356, _3334);
    float _3360 = _3086 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _3362 = rsqrt(_3332);
    float _3364 = fma(_1060, _3348, _3262);
    float _3366 = _976 * (*spvDescriptorSet0.vp_c9)._m0[18].w;
    out.m_74.x = _3304;
    out.m_74.y = _3300;
    out.m_74.z = _3358;
    out.m_74.w = _3344;
    float _3368 = exp2(_3342);
    bool _3370 = !_3050;
    int _3372 = _3370 ? 0 : 1;
    float _3374 = in.m_76.x;
    float _3376 = in.m_76.y;
    float _3378 = in.m_76.z;
    bool _3380 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _3382 = isnan(1.0);
    bool _3384 = _3380 || _3382;
    bool _3386 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _3388 = _3384 || _3386;
    float _3390 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _3392 = 1.0 + _3390;
    float _3394 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _3396 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _3398 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _3400 = 1.0 / _3392;
    float _3402 = _3394 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _3404 = _3396 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _3406 = _3398 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    if (_3152)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _9969 = as_type<float>(_3354);
        out.gl_Position.z = _9969;
    }
    bool _3408 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _3410 = isnan(0.0);
    bool _3412 = _3408 || _3410;
    bool _3414 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _3416 = _3412 || _3414;
    float _3418 = float(_3116);
    out.m_78.x = _3402;
    out.m_78.y = _3404;
    out.m_78.z = _3406;
    out.m_78.w = _3360;
    float _3420 = -_3368;
    float _3422 = _3420 + 1.0;
    out.m_80.x = _3324;
    out.m_80.y = _3364;
    if (_3152)
    {
        out.m_53.x = 0.0;
    }
    int _3424 = ~_3056;
    int _3426 = _3424 + 1;
    int _3428 = _3426 + 1;
    bool _3430 = !_3042;
    int _3432 = _3430 ? 0 : 1;
    float _3434 = _3366 * _3362;
    float _3436 = _3126 * _3434;
    float _3438 = _3096 * _3434;
    float _3440 = _3130 * _3434;
    int _3442 = _3428;
    if (_3152)
    {
        return out;
    }
    float _3444 = -_3438;
    float _3446 = _2768 + _3444;
    float _3448 = -_3436;
    float _3450 = _2930 + _3448;
    int _3452 = abs(_3432);
    float _3454 = -_3440;
    float _3456 = _3100 + _3454;
    float _3458 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _3460 = _3446 + _3458;
    float _3462 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _3464 = _3450 + _3462;
    float _3466 = -_3438;
    float _3468 = _3096 + _3466;
    float _3470 = float(_3452);
    float _3472 = _3460 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _3474 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _3476 = _3456 + _3474;
    float _3478 = -_3436;
    float _3480 = _3126 + _3478;
    float _3482 = _3468 * _3468;
    float _3484 = fma(_3464, (*spvDescriptorSet0.vp_c8)._m0[28].x, _3472);
    float _3486 = _3470 * _3418;
    float _3488 = _3446;
    if (!_2608)
    {
        int _3490 = ~_3056;
        int _3492 = _3490 + 1;
        _3442 = _3492;
    }
    int _3494 = _3442;
    float _3496 = fma(_3480, _3480, _3482);
    float _3498 = fma(_3476, (*spvDescriptorSet0.vp_c8)._m0[28].z, _3484);
    float _3500 = _3486 * (-2.0);
    int _3502 = abs(_3064);
    float _3504 = _876 + (-0.5);
    float _3506 = _3416 ? _3422 : 0.0;
    float _3508 = fma(_3500, _3374, _3374);
    bool _3510 = _3498 >= 0.0;
    float _3512 = fma(_2594, _3500, _2594);
    float _3514 = float(_3494);
    float _3516 = _3514;
    if (_3388)
    {
        float _3518 = _3506 * _3400;
        _155 = _3518;
    }
    float _3520 = _155;
    float _3522 = float(_3502);
    float _3524 = fma(_3504, (*spvDescriptorSet0.vp_c9)._m0[196].x, _3508);
    float _3526 = -_3440;
    float _3528 = _3130 + _3526;
    int _3530 = _2994 ? 0 : 1;
    float _3532 = _3522 * _3514;
    float _3534 = fma(_3512, _3520, _3524);
    float _3536 = fma(_3528, _3528, _3496);
    int _3538 = ~_3530;
    int _3540 = _3538 + 1;
    int _3542 = _3540 + 1;
    float _3544 = _3532 * (-2.0);
    float _3546 = _3534 * 0.15915493667125701904296875;
    int _3548 = _3542;
    if (_3510)
    {
        _3516 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _3550 = _3516;
    float _3552 = fma(_2650, _3544, _2650);
    float _3554 = fma(_3544, _3376, _3376);
    float _3556 = _878 + (-0.5);
    float _3558 = sqrt(_3536);
    int _3560 = as_type<int>(_3550);
    if (_3510)
    {
        float _3562 = _3550 * 5.0;
        _3560 = as_type<int>(_3562);
    }
    int _3564 = _3560;
    if (_3510)
    {
        out.m_53.x = 0.0;
    }
    if (!_2984)
    {
        int _3566 = ~_3530;
        int _3568 = _3566 + 1;
        _3548 = _3568;
    }
    int _3570 = _3548;
    int _3572 = abs(_3372);
    if (_3510)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _10232 = as_type<float>(_3564);
        out.gl_Position.z = _10232;
    }
    float _3574 = _3546 * 6.283185482025146484375;
    float _3576 = sin(_3574);
    if (_3510)
    {
        return out;
    }
    float _3578 = -_2768;
    float _3580 = _3578 + (*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _3582 = float(_3570);
    float _3584 = -_2930;
    float _3586 = _3584 + (*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _3588 = -_3100;
    float _3590 = _3588 + (*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _3592 = _3580 * _3580;
    float _3594 = fma(_3556, (*spvDescriptorSet0.vp_c9)._m0[196].y, _3554);
    float _3596 = _876 + _880;
    float _3598 = fma(_3586, _3586, _3592);
    float _3600 = float(_3572);
    float _3602 = fma(_3552, _3520, _3594);
    float _3604 = fma(_3590, _3590, _3598);
    float _3606 = _3596 + (-1.0);
    float _3608 = _3600 * _3582;
    float _3610 = _3602 * 0.15915493667125701904296875;
    float _3612 = _880 + (-0.5);
    float _3614 = fma(_3606, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _3616 = rsqrt(_3604);
    float _3618 = _3608 * (-2.0);
    float _3620 = _3362 * _3558;
    float _3622 = _717 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _3624 = fma(_3618, _3378, _3378);
    float _3626 = fma(_3614, _3618, _3614);
    float _3628 = _3546 * 6.283185482025146484375;
    float _3630 = cos(_3628);
    float _3632 = fma(_3612, (*spvDescriptorSet0.vp_c9)._m0[196].z, _3624);
    float _3634 = fma(_3626, _3520, _3632);
    float _3636 = _3586 * _3616;
    float _3638 = _3590 * _3616;
    float _3640 = _3634 * 0.15915493667125701904296875;
    float _3642 = _3580 * _3616;
    float _3644 = -(*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _3646 = _3636 * _3644;
    float _3648 = -(*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _3650 = _3638 * _3648;
    float _3652 = _3610 * 6.283185482025146484375;
    float _3654 = sin(_3652);
    float _3656 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _217);
    float _3658 = -(*spvDescriptorSet0.vp_c8)._m0[1].x;
    float _3660 = -_3646;
    float _3662 = fma(_3638, _3658, _3660);
    float _3664 = -(*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _3666 = -_3650;
    float _3668 = fma(_3642, _3664, _3666);
    float _3670 = -(*spvDescriptorSet0.vp_c8)._m0[1].x;
    float _3672 = _3642 * _3670;
    float _3674 = _3662 * _3662;
    float _3676 = _3610 * 6.283185482025146484375;
    float _3678 = cos(_3676);
    float _3680 = -(*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _3682 = -_3672;
    float _3684 = fma(_3636, _3680, _3682);
    float _3686 = fma(_3668, _3668, _3674);
    float _3688 = fma(_3684, _3684, _3686);
    float _3690 = _3640 * 6.283185482025146484375;
    float _3692 = cos(_3690);
    float _3694 = _3576 * _3654;
    float _3696 = _3640 * 6.283185482025146484375;
    float _3698 = sin(_3696);
    float _3700 = _3630 * _3678;
    float _3702 = _3576 * _3678;
    float _3704 = rsqrt(_3688);
    float _3706 = _3678 * _3692;
    float _3708 = _3620 * _3622;
    float _3710 = _3630 * _3692;
    float _3712 = _3576 * _3692;
    float _3714 = _3654 * _3692;
    float _3716 = _3656 * _3708;
    float _3718 = fma(_3698, _3700, _3694);
    float _3720 = fma(_3698, _3694, _3700);
    float _3722 = _3630 * _3654;
    float _3724 = _976 * _3620;
    float _3726 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _213);
    float _3728 = _3710 * _3716;
    float _3730 = -_3722;
    float _3732 = fma(_3698, _3702, _3730);
    float _3734 = -_3702;
    float _3736 = fma(_3698, _3722, _3734);
    float _3738 = _3726 * _3724;
    float _3740 = _3668 * _3704;
    float _3742 = _3662 * _3704;
    float _3744 = _3620 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _3746 = _3744 * 0.5;
    float _3748 = fma(_3718, _3738, _3728);
    float _3750 = _3684 * _3704;
    float _3752 = -_3716;
    float _3754 = _3698 * _3752;
    float _3756 = _3638 * _3742;
    float _3758 = _3642 * _3740;
    float _3760 = fma(_3736, _3746, _3748);
    float _3762 = _3712 * _3716;
    float _3764 = fma(_3706, _3738, _3754);
    float _3766 = -_3756;
    float _3768 = fma(_3642, _3750, _3766);
    float _3770 = -_3758;
    float _3772 = fma(_3636, _3742, _3770);
    float _3774 = fma(_3732, _3738, _3762);
    float _3776 = fma(_3714, _3746, _3764);
    float _3778 = _3768 * _3760;
    float _3780 = _3772 * _3760;
    float _3782 = fma(_3720, _3746, _3774);
    float _3784 = _3636 * _3750;
    float _3786 = fma(_3740, _3776, _3778);
    float _3788 = fma(_3750, _3776, _3780);
    float _3790 = -_3784;
    float _3792 = fma(_3638, _3740, _3790);
    float _3794 = fma(_3636, _3782, _3786);
    float _3796 = fma(_3638, _3782, _3788);
    float _3798 = _3792 * _3760;
    float _3800 = _2930 + _3794;
    float _3802 = _3100 + _3796;
    float _3804 = fma(_3742, _3776, _3798);
    float _3806 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _3808 = _3800 + _3806;
    float _3810 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _3812 = _3802 + _3810;
    float _3814 = fma(_3642, _3782, _3804);
    float _3816 = _3808 * _3808;
    float _3818 = _3812 * _3812;
    float _3820 = _2768 + _3814;
    float _3822 = _3816 + _3818;
    float _3824 = sqrt(_3822);
    bool _3826 = _3824 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _3828 = _3794;
    float _3830 = _3800;
    float _3832 = _3802;
    float _3834 = _3816;
    float _3836 = _3818;
    if (!_3826)
    {
        _3828 = _3820;
    }
    float _3838 = _3828;
    bool _3840 = !_3826;
    float _3842 = _3838;
    if (!_3840)
    {
        float _3844 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _3846 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _3848 = _3824 + _3846;
        float _3850 = rsqrt(_3822);
        float _3852 = _3848 * _3844;
        float _3854 = _3820 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _3856 = _3852 * 0.15915493667125701904296875;
        float _3858 = _3856 * 6.283185482025146484375;
        float _3860 = sin(_3858);
        float _3862 = _3856 * 6.283185482025146484375;
        float _3864 = cos(_3862);
        float _3866 = fma(_3860, _3854, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _3868 = _3850 * _3866;
        float _3870 = _3864 + (-1.0);
        float _3872 = fma(_3808, _3868, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _3874 = fma(_3812, _3868, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _3876 = _3870 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _3878 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _3880 = _3872 + _3878;
        float _3882 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _3884 = _3874 + _3882;
        float _3886 = fma(_3820, _3864, _3876);
        float _3888 = _3880 * _3880;
        float _3890 = _3884 * _3884;
        _3830 = _3872;
        _3832 = _3874;
        _3842 = _3886;
        _3834 = _3888;
        _3836 = _3890;
    }
    float _3892 = _3830;
    float _3894 = _3832;
    float _3896 = _3842;
    float _3898 = _3834;
    float _3900 = _3836;
    float _3902 = fma(_3892, 6.2500002968590706586837768554688e-05, 0.5);
    float _3904 = fma(_3894, 6.2500002968590706586837768554688e-05, 0.5);
    float2 _10740 = float2(_3902, _3904);
    float3 _3908 = dm_bs(spvDescriptorSet0.vp_t_tcb_20.sample(spvDescriptorSet0.vp_t_tcb_20Smplr, select(_10740, float2(0.0), isnan(_10740)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_20, spvDescriptorSet0.vp_t_tcb_20Smplr_w, select(_10740, float2(0.0), isnan(_10740)), level(0.0)).xyz;
    float _3910 = _3908.x;
    float _3912 = _3908.y;
    float _3914 = _3908.z;
    float _3916 = _217 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _3918 = _3710 * _3768;
    float _3920 = _3710 * _3792;
    float _3922 = _3710 * _3772;
    float _3924 = fma(_3916, _3916, 1.0);
    float _3926 = _3718 * _3792;
    float _3928 = _3736 * _3792;
    float _3930 = -_3698;
    float _3932 = fma(_3930, _3742, _3920);
    float _3934 = _3718 * _3768;
    float _3936 = fma(_3706, _3742, _3926);
    float _3938 = rsqrt(_3924);
    float _3940 = fma(_3714, _3742, _3928);
    float _3942 = _3718 * _3772;
    float _3944 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _3946 = _3896 + _3944;
    float _3948 = _3736 * _3768;
    float _3950 = _3736 * _3772;
    float _3952 = -_3698;
    float _3954 = fma(_3952, _3740, _3918);
    float _3956 = fma(_3706, _3740, _3934);
    float _3958 = fma(_3706, _3750, _3942);
    float _3960 = -_3698;
    float _3962 = fma(_3960, _3750, _3922);
    float _3964 = fma(_3946, _3946, _3898);
    float _3966 = fma(_3714, _3740, _3948);
    float _3968 = fma(_3714, _3750, _3950);
    float _3970 = fma(_3712, _3636, _3954);
    float _3972 = fma(_3712, _3642, _3932);
    float _3974 = fma(_3712, _3638, _3962);
    float _3976 = _3964 + _3900;
    float _3978 = fma(_3720, _3636, _3966);
    float _3980 = _3916 * _3938;
    float _3982 = fma(_3720, _3642, _3940);
    float _3984 = fma(_3720, _3638, _3968);
    float _3986 = fma(_3732, _3636, _3956);
    float _3988 = _213 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _3990 = _3916 * _3970;
    float _3992 = _3916 * _3972;
    float _3994 = fma(_3732, _3642, _3936);
    float _3996 = fma(_3732, _3638, _3958);
    float _3998 = _3916 * _3974;
    float _4000 = -_3978;
    float _4002 = _3980 * _4000;
    float _4004 = -_3982;
    float _4006 = _3980 * _4004;
    float _4008 = -_3984;
    float _4010 = _3980 * _4008;
    float _4012 = sqrt(_3976);
    float _4014 = fma(_3988, _3986, _3990);
    float _4016 = fma(_3988, _3994, _3992);
    float _4018 = fma(_3988, _3996, _3998);
    float _4020 = fma(_3938, _3970, _4002);
    float _4022 = fma(_3938, _3972, _4006);
    float _4024 = fma(_3938, _3974, _4010);
    float _4026 = _3978 + _4014;
    float _4028 = _3982 + _4016;
    float _4030 = _3984 + _4018;
    out.m_82.x = _3986;
    out.m_82.y = _3994;
    out.m_82.z = _3996;
    out.m_84.x = _4020;
    out.m_84.y = _4022;
    out.m_84.z = _4024;
    bool _4032 = _4012 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _4034 = isnan(_4012);
    bool _4036 = _4032 || _4034;
    bool _4038 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _4040 = _4036 || _4038;
    out.m_86.x = _4026;
    out.m_86.y = _4028;
    out.m_86.z = _4030;
    float _4042 = _4014;
    if (!_4040)
    {
        _4042 = 1.0;
    }
    float _4044 = _4042;
    out.m_88.x = _3910;
    out.m_88.y = _3912;
    out.m_88.z = _3914;
    bool _4046 = !_4040;
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
    float _4110 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _4112 = _3896 + _4110;
    float _4114 = _3446 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _4116 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _4118 = _3892 + _4116;
    float _4120 = fma(_4112, _4108, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _4122 = fma(_3450, (*spvDescriptorSet0.vp_c8)._m0[11].x, _4114);
    float _4124 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _4126 = _3894 + _4124;
    float _4128 = fma(_4118, _4108, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _4130 = -_2768;
    float _4132 = _4130 + _4120;
    float _4134 = fma(_3456, (*spvDescriptorSet0.vp_c8)._m0[11].z, _4122);
    float _4136 = fma(_4126, _4108, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _4138 = -_2930;
    float _4140 = _4138 + _4128;
    float _4142 = _4132 * _4132;
    float _4144 = _4134 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _4146 = _3446 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _4148 = -_3100;
    float _4150 = _4148 + _4136;
    float _4152 = fma(_4140, _4140, _4142);
    float _4154 = 1.0 / _4144;
    float _4156 = fma(_3450, (*spvDescriptorSet0.vp_c8)._m0[10].x, _4146);
    float _4158 = fma(_4150, _4150, _4152);
    float _4160 = fma(_3456, (*spvDescriptorSet0.vp_c8)._m0[10].z, _4156);
    float _4162 = sqrt(_4158);
    float _4164 = _4160 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _4166 = _4164 + _4144;
    float _4168 = _4166 * _4154;
    float _4170 = _4168 * 0.5;
    bool _4172 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _4174 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _4176 = _4172 || _4174;
    bool _4178 = isnan(0.5);
    bool _4180 = _4176 || _4178;
    float _4182 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _4184 = fma(_4170, (*spvDescriptorSet0.vp_c8)._m0[30].w, _4182);
    bool _4186 = _4162 > 0.0;
    float _4188 = 1.0 / _4184;
    bool _4190 = (*spvDescriptorSet0.vp_c15)._m0[660].y >= 0.5;
    bool _4192 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _4194 = _4190 || _4192;
    bool _4196 = isnan(0.5);
    bool _4198 = _4194 || _4196;
    float _4200 = (*spvDescriptorSet0.vp_c8)._m0[30].w;
    float _4202 = _4134;
    float _4204 = _4128;
    float _4206 = (*spvDescriptorSet0.vp_c15)._m0[660].y;
    if (!_4186)
    {
        _4200 = _4120;
    }
    float _4208 = _4200;
    float _4210 = _4208;
    float _4212 = _4208;
    if (!_4186)
    {
        _4202 = _4136;
    }
    float _4214 = _4202;
    bool _4216 = !_4186;
    float _4218 = _4214;
    float _4220 = _4214;
    if (!_4216)
    {
        float _4222 = _233 * _233;
        float _4224 = fma(_229, _229, _4222);
        float _4226 = fma(_235, _235, _4224);
        float _4228 = rsqrt(_4158);
        float _4230 = sqrt(_4226);
        float _4232 = _4140 * _4228;
        float _4234 = _4132 * _4228;
        float _4236 = _4150 * _4228;
        bool _4238 = _4230 > 0.0;
        _4206 = _4228;
        if (!_4238)
        {
            _4210 = _4120;
        }
        float _4240 = _4210;
        _4212 = _4240;
        if (!_4238)
        {
            _4218 = _4136;
        }
        float _4242 = _4218;
        bool _4244 = !_4238;
        _4220 = _4242;
        if (!_4244)
        {
            float _4246 = rsqrt(_4226);
            float _4248 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].z;
            float _4250 = _233 * _4246;
            float _4252 = _229 * _4246;
            float _4254 = _235 * _4246;
            float _4256 = _4234 * _4250;
            float _4258 = fma(_4232, _4252, _4256);
            float _4260 = _4248 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _4262 = fma(_4236, _4254, _4258);
            float _4264 = _4262 * _4260;
            float _4266 = fma(_229, _4264, _4128);
            float _4268 = fma(_233, _4264, _4120);
            float _4270 = fma(_235, _4264, _4136);
            _4204 = _4266;
            _4212 = _4268;
            _4220 = _4270;
            _4206 = _4264;
        }
    }
    float _4272 = _4204;
    float _4274 = _4212;
    float _4276 = _4220;
    float _4278 = _4206;
    float _4280 = -_3436;
    float _4282 = _4280 + _4272;
    float _4284 = -_3438;
    float _4286 = _4284 + _4274;
    float _4288 = -_3440;
    float _4290 = _4288 + _4276;
    float _4292 = _4278;
    float _4294 = _4286;
    float _4296 = _4282;
    float _4298 = _4290;
    if (_4180)
    {
        _4292 = 1.0;
    }
    float _4300 = _4292;
    float _4302 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _4304 = _4188 * _4302;
    float _4306 = _4300;
    if (!_4198)
    {
        float _4308 = _3460 * _3460;
        float _4310 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _4312 = -_3100;
        float _4314 = _4312 + _4276;
        float _4316 = -_2768;
        float _4318 = _4316 + _4274;
        float _4320 = fma(_3464, _3464, _4308);
        float _4322 = fma(_3476, _3476, _4320);
        float _4324 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _4326 = sqrt(_4322);
        float _4328 = 1.0 / _3620;
        float _4330 = _4324 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _4332 = precise::min(_4326, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _4334 = _4332 * _4310;
        float _4336 = _4334 * _4328;
        float _4338 = -_2930;
        float _4340 = _4338 + _4272;
        float _4342 = _4330 * _4336;
        float _4344 = _4314 * _4336;
        float _4346 = fma(_4318, _4342, _3446);
        float _4348 = fma(_4340, _4342, _3450);
        float _4350 = fma(_4330, _4344, _3456);
        _4294 = _4346;
        _4296 = _4348;
        _4298 = _4350;
        _2888 = _4318;
    }
    float _4352 = _4294;
    float _4354 = _4296;
    float _4356 = _4298;
    float _4358 = _2888;
    float _4360 = _4358;
    if (!_4180)
    {
        float _4362 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _4364 = _4362 * 0.15915493667125701904296875;
        float _4366 = _4364 * 6.283185482025146484375;
        float _4368 = cos(_4366);
        float _4370 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _4372 = _4370 * 0.15915493667125701904296875;
        float _4374 = _4364 * 6.283185482025146484375;
        float _4376 = sin(_4374);
        float _4378 = 1.0 / _4368;
        float _4380 = _4372 * 6.283185482025146484375;
        float _4382 = cos(_4380);
        float _4384 = _4376 * _4378;
        float _4386 = _4372 * 6.283185482025146484375;
        float _4388 = sin(_4386);
        float _4390 = _4382 * _4384;
        float _4392 = 1.0 / _4390;
        float _4394 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _4396 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _4394;
        float _4398 = 1.0 / _4396;
        float _4400 = _4388 * _4392;
        float _4402 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _4404 = fma(_4304, _4400, _4402);
        float _4406 = _4404 * _4398;
        float _4408 = precise::clamp(_4406, 0.0, 1.0);
        _2932 = _4364;
        _4306 = _4408;
    }
    float _4410 = _2932;
    float _4412 = _4306;
    float _4414 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _4416 = _4352 + _4414;
    float _4418 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _4420 = _4354 + _4418;
    float _4422 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _4424 = _4356 + _4422;
    float _4426 = _4416 * _4416;
    float _4428 = fma(_4420, _4420, _4426);
    float _4430 = fma(_3450, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _4432 = fma(_4424, _4424, _4428);
    float _4434 = fma(_3456, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _4436 = rsqrt(_4432);
    float _4438 = sqrt(_4432);
    float _4440 = _4436 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _4442 = _4420 * _4440;
    float _4444 = _4424 * _4440;
    float _4446 = _4442 * _4442;
    float _4448 = _4444 * _4444;
    float _4450 = _4446 + _4448;
    float _4452 = sqrt(_4450);
    bool _4454 = _4452 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _4456 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _4458 = _4452 + _4456;
    float _4460 = _4436;
    float _4462 = _4410;
    float _4464 = _4458;
    float _4466 = _4416;
    if (_4454)
    {
        float _4468 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _4460 = _4468;
    }
    float _4470 = _4460;
    if (_4454)
    {
        float _4472 = rsqrt(_4450);
        _4462 = _4472;
    }
    float _4474 = _4462;
    float _4476 = _4474;
    if (_4454)
    {
        float _4478 = _4458 * _4470;
        _4464 = _4478;
    }
    float _4480 = _4464;
    if (_4454)
    {
        float _4482 = _4480 * 0.15915493667125701904296875;
        _3488 = _4482;
    }
    float _4484 = _3488;
    float _4486 = _4470;
    float _4488 = _4484;
    if (_4454)
    {
        float _4490 = _4484 * 6.283185482025146484375;
        float _4492 = sin(_4490);
        _4486 = _4492;
    }
    float _4494 = _4486;
    float _4496 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _4498 = precise::max(0.0, _4496);
    float _4500 = _4424;
    float _4502 = _4498;
    if (_4454)
    {
        float _4504 = _4484 * 6.283185482025146484375;
        float _4506 = cos(_4504);
        _4500 = _4506;
    }
    float _4508 = _4500;
    float _4510 = -_4440;
    float _4512 = -_4498;
    float _4514 = fma(_4416, _4510, _4512);
    if (!_4454)
    {
        _4466 = _4444;
    }
    float _4516 = _4466;
    float _4518 = _4516;
    if (_4454)
    {
        float _4520 = _4514 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _4502 = _4520;
    }
    float _4522 = _4502;
    float _4524 = _4494;
    float _4526 = _4522;
    if (_4454)
    {
        float _4528 = fma(_4494, _4522, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _4360 = _4528;
    }
    float _4530 = _4360;
    float _4532 = _4530;
    if (!_4454)
    {
        _4524 = _4514;
    }
    float _4534 = _4524;
    float _4536 = _4534;
    float _4538 = _4508;
    if (_4454)
    {
        float _4540 = _4508 + (-1.0);
        _4526 = _4540;
    }
    float _4542 = _4526;
    float _4544 = _4542;
    if (_4454)
    {
        float _4546 = _4474 * _4530;
        _4532 = _4546;
    }
    float _4548 = _4532;
    if (!_4454)
    {
        _4476 = _4442;
    }
    float _4550 = _4476;
    float _4552 = _4550;
    if (_4454)
    {
        float _4554 = _4542 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _4488 = _4554;
    }
    float _4556 = _4488;
    if (_4454)
    {
        float _4558 = _4442 * _4548;
        _4552 = _4558;
    }
    float _4560 = _4552;
    if (!_4454)
    {
        _4544 = _4446;
    }
    float _4562 = _4544;
    float _4564 = _4562;
    if (_4454)
    {
        float _4566 = _4444 * _4548;
        _4518 = _4566;
    }
    float _4568 = _4518;
    if (_4454)
    {
        float _4570 = fma(_4514, _4508, _4556);
        _4536 = _4570;
    }
    float _4572 = _4536;
    if (_4454)
    {
        float _4574 = _4560 * _4560;
        _4564 = _4574;
    }
    float _4576 = _4564;
    float _4578 = _4352 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    if (!_4454)
    {
        _4538 = _4448;
    }
    float _4580 = _4538;
    float _4582 = _4580;
    if (_4454)
    {
        float _4584 = _4568 * _4568;
        _4582 = _4584;
    }
    float _4586 = _4582;
    float _4588 = fma(_4572, _4572, _4576);
    float _4590 = fma(_4354, (*spvDescriptorSet0.vp_c8)._m0[2].x, _4578);
    float _4592 = floor(_4430);
    float _4594 = _4588 + _4586;
    float _4596 = fma(_4356, (*spvDescriptorSet0.vp_c8)._m0[2].z, _4590);
    float _4598 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _4600 = _4596 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _4602 = rsqrt(_4594);
    float _4604 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _4606 = fma(_4438, (*spvDescriptorSet0.vp_c15)._m0[23].w, _4604);
    float _4608 = precise::clamp(_4606, 0.0, 1.0);
    float _4610 = _4600 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _4612 = _4352 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _4614 = -_4608;
    float _4616 = _4614 + 1.0;
    float _4618 = -_4610;
    float _4620 = fma(_4618, _4598, 1.0);
    float _4622 = _4352 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _4624 = floor(_4434);
    float _4626 = _4352 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _4628 = -_4592;
    float _4630 = _4430 + _4628;
    float _4632 = fma(_4354, (*spvDescriptorSet0.vp_c8)._m0[0].x, _4622);
    float _4634 = fma(_4354, (*spvDescriptorSet0.vp_c8)._m0[1].x, _4626);
    float _4636 = fma(_4356, (*spvDescriptorSet0.vp_c8)._m0[0].z, _4632);
    float _4638 = abs(_4616);
    float _4640 = log2(_4638);
    float _4642 = fma(_4356, (*spvDescriptorSet0.vp_c8)._m0[1].z, _4634);
    float _4644 = _4602 * _4560;
    float _4646 = _4602 * _4572;
    float _4648 = _4602 * _4568;
    float _4650 = _4642 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _4652 = _4644 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _4654 = fma(_4354, (*spvDescriptorSet0.vp_c8)._m0[3].x, _4612);
    float _4656 = _4636 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _4658 = _4650 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _4660 = -_4652;
    float _4662 = fma(_4646, (*spvDescriptorSet0.vp_c15)._m0[21].y, _4660);
    float _4664 = fma(_4356, (*spvDescriptorSet0.vp_c8)._m0[3].z, _4654);
    float _4666 = log2(_4620);
    float _4668 = fma(_4656, (*spvDescriptorSet0.vp_c8)._m0[7].x, _4658);
    float _4670 = -_4648;
    float _4672 = fma(_4670, (*spvDescriptorSet0.vp_c15)._m0[21].z, _4662);
    float _4674 = _4664 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _4676 = _4640 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _4678 = fma(_4600, (*spvDescriptorSet0.vp_c8)._m0[7].z, _4668);
    float _4680 = fma(_4672, -0.5, 0.5);
    float _4682 = fma(_4672, 0.5, 0.5);
    float _4684 = exp2(_4676);
    float _4686 = fma(_4674, (*spvDescriptorSet0.vp_c8)._m0[7].w, _4678);
    float _4688 = _4650 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _4690 = _4650 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _4692 = -_4624;
    float _4694 = _4434 + _4692;
    float _4696 = fma(_4682, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _4698 = fma(_4656, (*spvDescriptorSet0.vp_c8)._m0[4].x, _4688);
    float _4700 = fma(_4656, (*spvDescriptorSet0.vp_c8)._m0[5].x, _4690);
    float _4702 = 1.0 / _4686;
    float _4704 = _4646 + 1.0;
    float _4706 = fma(_4600, (*spvDescriptorSet0.vp_c8)._m0[4].z, _4698);
    float _4708 = fma(_4682, _4696, -0.212114393711090087890625);
    float _4710 = _4666 * 0.693147182464599609375;
    float _4712 = fma(_4674, (*spvDescriptorSet0.vp_c8)._m0[4].w, _4706);
    float _4714 = sqrt(_4680);
    float _4716 = -_4646;
    float _4718 = fma(_4684, _4704, _4716);
    float2 _12076 = float2(_4630, _4694);
    float _4720 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_12076, float2(0.0), isnan(_12076)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_12076, float2(0.0), isnan(_12076)), level(0.0)).x;
    float _4722 = fma(_4682, _4708, 1.570728778839111328125);
    float _4724 = fma(_4718, 0.5, 0.5);
    float _4726 = fma(_4600, (*spvDescriptorSet0.vp_c8)._m0[5].z, _4700);
    float _4728 = _4712 * _4702;
    float _4730 = fma(_4674, (*spvDescriptorSet0.vp_c8)._m0[5].w, _4726);
    float _4732 = fma(_4728, 0.5, 0.5);
    float _4734 = _4714 * 0.636619746685028076171875;
    float _4736 = _4730 * _4702;
    float _4738 = _4710 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _4740 = -_4722;
    float _4742 = fma(_4734, _4740, 1.0);
    float _4744 = fma(_4736, -0.5, 0.5);
    float3 _12123 = float3(_4732, _4744, _4738);
    float _4746 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_12123, float3(0.0), isnan(_12123)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_12123, float3(0.0), isnan(_12123)), level(0.0)).x;
    float3 _12134 = float3(_4732, _4744, _4738);
    float4 _4749 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_12134, float3(0.0), isnan(_12134)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_12134, float3(0.0), isnan(_12134)), level(0.0)).xyzw;
    float _4751 = _4749.x;
    float _4753 = _4749.y;
    float _4755 = _4749.z;
    float _4757 = _4749.w;
    float2 _12150 = float2(_4742, _4724);
    float3 _4759 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_12150, float2(0.0), isnan(_12150)), level(0.0)), spvDescriptorSet0.dm_border, 4u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_12150, float2(0.0), isnan(_12150)), level(0.0)).xyz;
    float _4761 = _4759.x;
    float _4763 = _4759.y;
    float _4765 = _4759.z;
    float _4767 = abs(_4304);
    float _4769 = log2(_4767);
    float _4771 = _4650 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    bool _4773 = _4438 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _4775 = isnan(_4438);
    bool _4777 = _4773 || _4775;
    bool _4779 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _4781 = _4777 || _4779;
    float _4783 = fma(_4656, (*spvDescriptorSet0.vp_c8)._m0[6].x, _4771);
    float _4785 = _4640 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    bool _4787 = _4304 <= 8000.0;
    bool _4789 = isnan(_4304);
    bool _4791 = _4787 || _4789;
    bool _4793 = isnan(8000.0);
    bool _4795 = _4791 || _4793;
    float _4797 = float(_4795);
    float _4799 = fma(_4600, (*spvDescriptorSet0.vp_c8)._m0[6].z, _4783);
    float _4801 = fma(_4674, (*spvDescriptorSet0.vp_c8)._m0[6].w, _4799);
    float _4803 = _4769 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _4805 = _4801 + _4686;
    out.gl_Position.x = _4712;
    out.gl_Position.y = _4730;
    out.gl_Position.z = _4801;
    out.gl_Position.w = _4686;
    float _4807 = exp2(_4803);
    float _4809 = _4805 * 0.5;
    float _4811 = _4801;
    float _4813 = _4730;
    float _4815 = _4686;
    if (!_4781)
    {
        _4811 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _4817 = _4811;
    float _4819 = _4817;
    float _4821 = _4817;
    if (!_4781)
    {
        _4813 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _4823 = _4813;
    float _4825 = fma(_4807, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _4827 = precise::clamp(_4825, 0.0, 1.0);
    float _4829 = _4823;
    float _4831 = _4823;
    if (!_4781)
    {
        _4815 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _4833 = _4815;
    float _4835 = fma(_4827, -2.0, 3.0);
    float _4837 = _4827 * _4827;
    out.m_90.z = _4809;
    out.m_90.w = _4686;
    float _4839 = _4837 * _4835;
    float _4841 = exp2(_4785);
    float _4843 = -_4839;
    float _4845 = _4843 + 1.0;
    float _4847 = fma(_4845, (*spvDescriptorSet0.vp_c15)._m0[654].w, _4839);
    float _4849 = in.m_92.x;
    float _4851 = _4797 * _4847;
    float _4853 = _4851 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _4855 = -_4841;
    float _4857 = _4855 + 1.0;
    float _4859 = _4857 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _4861 = -_4859;
    float _4863 = _4861 + 1.0;
    float _4865 = -_4720;
    float _4867 = _4865 + 1.0;
    float _4869 = _4867 * _4853;
    float _4871 = precise::clamp(_4869, 0.0, 1.0);
    float _4873 = -_4871;
    float _4875 = fma(_4873, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _4877 = _4875 * _4849;
    float _4879 = _4877 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _4881 = _4877;
    float _4883 = _4863;
    float _4885 = _4833;
    float _4887 = _4833;
    if (!_4781)
    {
        _4881 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _4889 = _4881;
    out.m_94.x = _4879;
    float _4891 = _4859 * _4746;
    float _4893 = _4757 * _4891;
    float _4895 = _4765 * _4891;
    float _4897 = _4757 * _4863;
    float _4899 = _4893;
    float _4901 = _4889;
    float _4903 = _4889;
    if (!_4781)
    {
        _4883 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _4905 = _4883;
    float _4907 = fma(_4761, _4893, _4751);
    float _4909 = fma(_4763, _4893, _4753);
    float _4911 = fma(_4757, _4895, _4755);
    float _4913 = _4412 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _4915 = _4905;
    float _4917 = _4905;
    if (!_4781)
    {
        _4899 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _4919 = _4899;
    out.m_96.x = _4907;
    out.m_96.y = _4909;
    out.m_96.z = _4911;
    out.m_96.w = _4897;
    bool _4921 = !_4781;
    float _4923 = _4919;
    float _4925 = _4919;
    if (!_4921)
    {
        bool _4927 = _4438 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _4929 = isnan(_4438);
        bool _4931 = _4927 || _4929;
        bool _4933 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _4935 = _4931 || _4933;
        if (!_4935)
        {
            float _4937 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _4939 = _4438 + _4937;
            float _4941 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _4943 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _4941;
            float _4945 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _4947 = _4945 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _4949 = 1.0 / _4943;
            float _4951 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _4953 = _4951 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _4955 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _4957 = _4955 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _4959 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _4961 = _4959 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _4963 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _4965 = _4963 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _4967 = _4939 * _4949;
            float _4969 = precise::clamp(_4967, 0.0, 1.0);
            float _4971 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _4973 = _4971 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _4975 = fma(_4969, _4947, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _4977 = fma(_4969, _4973, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _4979 = fma(_4969, _4953, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _4981 = fma(_4969, _4957, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _4983 = fma(_4969, _4961, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _4985 = fma(_4969, _4965, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _4887 = _4979;
            _4917 = _4983;
            _4903 = _4975;
            _4831 = _4981;
            _4821 = _4977;
            _4925 = _4985;
            _4987 = true;
        }
        else
        {
            bool _4989 = _4438 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _4991 = isnan(_4438);
            bool _4993 = _4989 || _4991;
            bool _4995 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _4997 = _4993 || _4995;
            if (!_4997)
            {
                _4901 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _4999 = _4901;
            _4903 = _4999;
            if (!_4997)
            {
                _4885 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _5001 = _4885;
            _4887 = _5001;
            if (!_4997)
            {
                _4819 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _5003 = _4819;
            _4821 = _5003;
            if (!_4997)
            {
                _4829 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _5005 = _4829;
            _4831 = _5005;
            if (!_4997)
            {
                _4915 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _5007 = _4915;
            _4917 = _5007;
            if (!_4997)
            {
                _4923 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _5009 = _4923;
            bool _5011 = !_4997;
            _4925 = _5009;
            if (!_5011)
            {
                bool _5013 = _4438 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _5015 = isnan(_4438);
                bool _5017 = _5013 || _5015;
                bool _5019 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _5021 = _5017 || _5019;
                if (!_5021)
                {
                    float _5023 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _5025 = _4438 + _5023;
                    float _5027 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _5029 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _5027;
                    float _5031 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _5033 = _5031 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _5035 = 1.0 / _5029;
                    float _5037 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _5039 = _5037 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _5041 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _5043 = _5041 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _5045 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _5047 = _5045 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _5049 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _5051 = _5049 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _5053 = _5025 * _5035;
                    float _5055 = precise::clamp(_5053, 0.0, 1.0);
                    float _5057 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _5059 = _5057 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _5061 = fma(_5055, _5033, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _5063 = fma(_5055, _5059, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _5065 = fma(_5055, _5039, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _5067 = fma(_5055, _5043, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _5069 = fma(_5055, _5047, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _5071 = fma(_5055, _5051, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _4887 = _5065;
                    _4917 = _5069;
                    _4903 = _5061;
                    _4831 = _5067;
                    _4821 = _5063;
                    _4925 = _5071;
                    _4987 = true;
                }
                else
                {
                    _4887 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _4917 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _4903 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _4831 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _4821 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _4925 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _4987 = false;
    float _5073 = _4887;
    float _5075 = _4917;
    float _5077 = _4903;
    float _5079 = _4831;
    float _5081 = _4821;
    float _5083 = _4925;
    float _5085 = _4913 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _5087 = fma(_4028, -0.5, 0.5);
    float _5089 = precise::clamp(_5087, 0.0, 1.0);
    float _5091 = -_5073;
    float _5093 = _5091 + _5075;
    float _5095 = -_5077;
    float _5097 = _5095 + _5079;
    out.m_53.x = _5085;
    float _5099 = fma(_5089, _5093, _5073);
    float _5101 = -_5081;
    float _5103 = _5101 + _5083;
    float _5105 = fma(_5089, _5097, _5077);
    float _5107 = _5099 * 0.586610972881317138671875;
    bool _5109 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _5111 = fma(_5089, _5103, _5081);
    out.m_98.x = 0.0;
    float _5113 = fma(_5105, 0.298911988735198974609375, _5107);
    bool _5115 = _4412 > 0.0;
    bool _5117 = isnan(_4412);
    bool _5119 = _5115 || _5117;
    bool _5121 = isnan(0.0);
    bool _5123 = _5119 || _5121;
    float _5125 = fma(_5111, 0.114477999508380889892578125, _5113);
    float _5127 = -_5125;
    float _5129 = _5105 + _5127;
    float _5131 = -_5125;
    float _5133 = _5099 + _5131;
    float _5135 = -_5125;
    float _5137 = _5111 + _5135;
    float _5139 = fma(_5129, (*spvDescriptorSet0.vp_c13)._m0[1].z, _5125);
    float _5141 = fma(_5133, (*spvDescriptorSet0.vp_c13)._m0[1].z, _5125);
    float _5143 = fma(_5137, (*spvDescriptorSet0.vp_c13)._m0[1].z, _5125);
    bool _5145 = !_5109;
    if (!_5145)
    {
        float _5147 = -_4352;
        float _5149 = _5147 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _5151 = -_4354;
        float _5153 = _5151 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _5155 = -_4356;
        float _5157 = _5155 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _5159 = _5149 * _5149;
        float _5161 = fma(_5153, _5153, _5159);
        float _5163 = fma(_5157, _5157, _5161);
        float _5165 = sqrt(_5163);
        float _5167 = rsqrt(_5163);
        float _5169 = -_5165;
        float _5171 = _5169 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _5173 = _5171 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _5175 = precise::clamp(_5173, 0.0, 1.0);
        float _5177 = _5153 * _5167;
        float _5179 = _5149 * _5167;
        float _5181 = abs(_5175);
        float _5183 = log2(_5181);
        float _5185 = _5157 * _5167;
        float _5187 = _5177 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _5189 = _4028 * _5179;
        float _5191 = -_5179;
        float _5193 = -_5187;
        float _5195 = fma(_5191, (*spvDescriptorSet0.vp_c15)._m0[656].y, _5193);
        float _5197 = fma(_4026, _5177, _5189);
        float _5199 = -_5185;
        float _5201 = fma(_5199, (*spvDescriptorSet0.vp_c15)._m0[656].z, _5195);
        float _5203 = fma(_4030, _5185, _5197);
        float _5205 = precise::clamp(_5203, 0.0, 1.0);
        float _5207 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _5209 = _5201 + _5207;
        float _5211 = _5183 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _5213 = _5209 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _5215 = precise::clamp(_5213, 0.0, 1.0);
        float _5217 = exp2(_5211);
        float _5219 = _5217 * _5215;
        float _5221 = _5205 * _5219;
        float _5223 = _5221 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _5225 = _5221 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _5227 = _5221 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_98.x = _5223;
        out.m_98.y = _5225;
        out.m_98.z = _5227;
    }
    out.m_100.x = _5139;
    out.m_100.y = _5141;
    out.m_100.z = _5143;
    if (_5123)
    {
        return out;
    }
    out.m_53.x = 0.0;
    float _5229 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _5229;
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
    out.m_72 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_78 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_74 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_90 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_100 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_53 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_80 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_84 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_86 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_82 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_98 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_88 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_94 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_96 = float4(0.0, 0.0, 0.0, 1.0);
    bool _4987 = false;
    bool _4078 = false;
    bool _753 = false;
    bool _641 = false;
    bool _257 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _114 = in.m_50.w;
    float _116 = trunc(_114);
    int _119 = int(_116);
    bool _123 = _119 >= 1;
    float _125 = 0.0;
    if (!_123)
    {
        _125 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _127 = _125;
    float _129 = _127;
    if (!_123)
    {
        out.m_53.x = 0.0;
    }
    int _131 = 0;
    if (!_123)
    {
        float _133 = _127 * 5.0;
        _131 = as_type<int>(_133);
    }
    int _135 = _131;
    int _137 = _135;
    if (!_123)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _5286 = as_type<float>(_135);
        out.gl_Position.z = _5286;
    }
    if (!_123)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_90.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_90.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_90.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_90.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_100.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_100.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_100.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_100.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_98.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_98.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_98.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_98.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_88.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_88.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_88.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_88.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_94.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_94.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_94.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_94.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_96.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_96.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_96.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_96.w)); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _139 = in.m_55.w;
    bool _141 = _139 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _143 = isnan(_139);
    bool _145 = _141 || _143;
    bool _147 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _149 = _145 || _147;
    float _151 = -_139;
    float _153 = _151 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _155 = _153;
    if (_149)
    {
        float _157 = float(_119);
        _129 = _157;
    }
    float _159 = _129;
    bool _161 = _153 >= _159;
    bool _163 = !_149;
    bool _165 = _161 || _163;
    float _167 = _159;
    if (_165)
    {
        _167 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _169 = _167;
    if (_165)
    {
        out.m_53.x = 0.0;
    }
    if (_165)
    {
        float _171 = _169 * 5.0;
        _137 = as_type<int>(_171);
    }
    int _173 = _137;
    if (_165)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _5356 = as_type<float>(_173);
        out.gl_Position.z = _5356;
    }
    if (_165)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_90.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_90.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_90.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_90.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_100.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_100.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_100.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_100.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_98.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_98.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_98.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_98.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_88.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_88.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_88.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_88.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_94.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_94.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_94.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_94.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_96.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_96.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_96.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_96.w)); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _175 = as_type<float>(int(gl_VertexIndex));
    float _177 = in.m_60.x;
    float _179 = in.m_60.y;
    float _181 = in.m_60.z;
    float _183 = in.m_62.x;
    float _185 = in.m_62.y;
    float _187 = in.m_62.z;
    float _189 = in.m_64.x;
    float _191 = in.m_64.y;
    float _193 = in.m_64.z;
    float _195 = in.m_66.x;
    float _197 = in.m_66.y;
    float _199 = in.m_66.z;
    int _201 = as_type<int>(_175) & 1;
    bool _203 = _201 != 0;
    int _205 = as_type<int>(_175) & 2;
    bool _207 = _205 != 0;
    bool _209 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    bool _211 = !_203;
    float _213 = _211 ? (-0.5) : 0.5;
    bool _215 = !_207;
    float _217 = _215 ? (-0.5) : 0.5;
    float _219 = _179 * _185;
    float _221 = _179 * _191;
    float _223 = fma(_177, _183, _219);
    float _225 = _179 * _197;
    float _227 = fma(_177, _189, _221);
    float _229 = fma(_181, _187, _223);
    float _231 = fma(_177, _195, _225);
    float _233 = fma(_181, _193, _227);
    float _235 = fma(_181, _199, _231);
    bool _237 = !_209;
    float _255;
    if (!_237)
    {
        float _239 = in.m_68.x;
        float _241 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _243 = _239 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _245 = fma(_243, (*spvDescriptorSet0.vp_c9)._m0[12].x, _153);
        float _247 = _245 * _241;
        float _249 = floor(_247);
        float _251 = -_249;
        float _253 = _247 + _251;
        _255 = _253;
        _257 = true;
    }
    else
    {
        float _259 = float(_119);
        float _261 = 1.0 / _259;
        float _263 = _153 * _261;
        _255 = _263;
    }
    _257 = false;
    float _265 = _255;
    float _267 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _269 = _265 + _267;
    float _271 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _273 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _271;
    float _275 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _277 = _275 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _279 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _281 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _279;
    float _283 = 1.0 / _273;
    float _285 = -(*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _287 = (*spvDescriptorSet0.vp_c9)._m0[148].w + _285;
    float _289 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _291 = _289 + (*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _293 = -(*spvDescriptorSet0.vp_c9)._m0[148].w;
    float _295 = _293 + (*spvDescriptorSet0.vp_c9)._m0[149].w;
    float _297 = 1.0 / _277;
    float _299 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _301 = _265 + _299;
    bool _303 = _265 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _305 = isnan(_265);
    bool _307 = _303 || _305;
    bool _309 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _311 = _307 || _309;
    float _313 = float(_311);
    float _315 = 1.0 / _281;
    float _317 = _301 * _283;
    float _319 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _321 = _265 + _319;
    bool _323 = _265 >= (*spvDescriptorSet0.vp_c9)._m0[150].w;
    bool _325 = isnan(_265);
    bool _327 = _323 || _325;
    bool _329 = isnan((*spvDescriptorSet0.vp_c9)._m0[150].w);
    bool _331 = _327 || _329;
    float _333 = float(_331);
    bool _335 = _265 >= (*spvDescriptorSet0.vp_c9)._m0[149].w;
    bool _337 = isnan(_265);
    bool _339 = _335 || _337;
    bool _341 = isnan((*spvDescriptorSet0.vp_c9)._m0[149].w);
    bool _343 = _339 || _341;
    float _345 = float(_343);
    float _347 = 1.0 / _287;
    float _349 = -(*spvDescriptorSet0.vp_c9)._m0[149].w;
    float _351 = (*spvDescriptorSet0.vp_c9)._m0[150].w + _349;
    float _353 = _269 * _297;
    float _355 = -(*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _357 = _265 + _355;
    float _359 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _361 = _265 + _359;
    bool _363 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _365 = 1.0 / _351;
    float _367 = _321 * _315;
    float _369 = -_333;
    float _371 = _369 + 1.0;
    bool _373 = _265 >= (*spvDescriptorSet0.vp_c9)._m0[148].w;
    bool _375 = isnan(_265);
    bool _377 = _373 || _375;
    bool _379 = isnan((*spvDescriptorSet0.vp_c9)._m0[148].w);
    bool _381 = _377 || _379;
    float _383 = float(_381);
    float _385 = _345 * _371;
    float _387 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _389 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _387;
    float _391 = 1.0 / _291;
    float _393 = _357 * _347;
    float _395 = -_345;
    float _397 = _395 + 1.0;
    bool _399 = _265 >= (*spvDescriptorSet0.vp_c9)._m0[147].w;
    bool _401 = isnan(_265);
    bool _403 = _399 || _401;
    bool _405 = isnan((*spvDescriptorSet0.vp_c9)._m0[147].w);
    bool _407 = _403 || _405;
    float _409 = float(_407);
    float _411 = fma(_389, _317, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _413 = 1.0 / _295;
    float _415 = -(*spvDescriptorSet0.vp_c9)._m0[149].w;
    float _417 = _265 + _415;
    float _419 = _417 * _365;
    float _421 = _383 * _397;
    float _423 = -_383;
    float _425 = _423 + 1.0;
    float _427 = _361 * _391;
    float _429 = -(*spvDescriptorSet0.vp_c9)._m0[148].w;
    float _431 = _265 + _429;
    bool _433 = _265 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _435 = isnan(_265);
    bool _437 = _433 || _435;
    bool _439 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _441 = _437 || _439;
    float _443 = float(_441);
    float _445 = _409 * _425;
    float _447 = -_409;
    float _449 = _447 + 1.0;
    float _451 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _453 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _451;
    float _455 = _431 * _413;
    float _457 = _443 * _449;
    float _459 = -_443;
    float _461 = _459 + 1.0;
    bool _463 = _265 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _465 = isnan(_265);
    bool _467 = _463 || _465;
    bool _469 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _471 = _467 || _469;
    float _473 = float(_471);
    float _475 = fma(_453, _317, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    bool _477 = _265 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _479 = isnan(_265);
    bool _481 = _477 || _479;
    bool _483 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _485 = _481 || _483;
    float _487 = float(_485);
    float _489 = _313 * _461;
    float _491 = -_313;
    float _493 = _491 + 1.0;
    float _495 = -_473;
    float _497 = _495 + 1.0;
    float _499 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _501 = _499 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _503 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _505 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _503;
    float _507 = _473 * _493;
    float _509 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _511 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _509;
    float _513 = _487 * _497;
    float _515 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _517 = _515 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _519 = fma(_505, _367, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _521 = fma(_511, _367, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _523 = _411 * _513;
    float _525 = -_487;
    float _527 = _525 + 1.0;
    float _529 = _475 * _513;
    float _531 = -(*spvDescriptorSet0.vp_c9)._m0[146].x;
    float _533 = _531 + (*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _535 = fma(_501, _353, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _537 = fma(_527, (*spvDescriptorSet0.vp_c9)._m0[143].x, _523);
    float _539 = fma(_517, _353, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _541 = -(*spvDescriptorSet0.vp_c9)._m0[146].y;
    float _543 = _541 + (*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _545 = fma(_527, (*spvDescriptorSet0.vp_c9)._m0[143].y, _529);
    float _547 = fma(_533, _427, (*spvDescriptorSet0.vp_c9)._m0[146].x);
    float _549 = fma(_543, _427, (*spvDescriptorSet0.vp_c9)._m0[146].y);
    float _551 = fma(_535, _507, _537);
    float _553 = fma(_539, _507, _545);
    float _555 = -(*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _557 = (*spvDescriptorSet0.vp_c9)._m0[148].x + _555;
    float _559 = -(*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _561 = (*spvDescriptorSet0.vp_c9)._m0[148].y + _559;
    float _563 = fma(_521, _489, _551);
    float _565 = fma(_519, _489, _553);
    float _567 = fma(_557, _393, (*spvDescriptorSet0.vp_c9)._m0[147].x);
    float _569 = fma(_561, _393, (*spvDescriptorSet0.vp_c9)._m0[147].y);
    float _571 = -(*spvDescriptorSet0.vp_c9)._m0[148].x;
    float _573 = _571 + (*spvDescriptorSet0.vp_c9)._m0[149].x;
    float _575 = -(*spvDescriptorSet0.vp_c9)._m0[148].y;
    float _577 = _575 + (*spvDescriptorSet0.vp_c9)._m0[149].y;
    float _579 = fma(_547, _457, _563);
    float _581 = fma(_549, _457, _565);
    float _583 = fma(_573, _455, (*spvDescriptorSet0.vp_c9)._m0[148].x);
    float _585 = fma(_577, _455, (*spvDescriptorSet0.vp_c9)._m0[148].y);
    float _587 = -(*spvDescriptorSet0.vp_c9)._m0[149].x;
    float _589 = (*spvDescriptorSet0.vp_c9)._m0[150].x + _587;
    float _591 = -(*spvDescriptorSet0.vp_c9)._m0[149].y;
    float _593 = (*spvDescriptorSet0.vp_c9)._m0[150].y + _591;
    float _595 = fma(_567, _445, _579);
    float _597 = fma(_569, _445, _581);
    float _599 = fma(_589, _419, (*spvDescriptorSet0.vp_c9)._m0[149].x);
    float _601 = fma(_593, _419, (*spvDescriptorSet0.vp_c9)._m0[149].y);
    float _603 = fma(_583, _421, _595);
    float _605 = fma(_585, _421, _597);
    float _607 = fma(_599, _385, _603);
    float _609 = fma(_601, _385, _605);
    float _611 = fma(_333, (*spvDescriptorSet0.vp_c9)._m0[150].x, _607);
    float _613 = fma(_333, (*spvDescriptorSet0.vp_c9)._m0[150].y, _609);
    bool _615 = !_363;
    int _617 = as_type<int>(_523);
    int _619 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[148].y);
    float _621 = (*spvDescriptorSet0.vp_c9)._m0[148].x;
    float _639;
    if (!_615)
    {
        float _623 = in.m_68.x;
        float _625 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _627 = _623 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _629 = fma(_627, (*spvDescriptorSet0.vp_c9)._m0[11].y, _153);
        float _631 = _629 * _625;
        float _633 = floor(_631);
        float _635 = -_633;
        float _637 = _631 + _635;
        _639 = _637;
        _641 = true;
    }
    else
    {
        float _643 = float(_119);
        float _645 = 1.0 / _643;
        float _647 = _153 * _645;
        _639 = _647;
    }
    _641 = false;
    float _649 = _639;
    float _651 = in.m_70.x;
    float _653 = in.m_70.y;
    bool _655 = _649 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _657 = isnan(_649);
    bool _659 = _655 || _657;
    bool _661 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _663 = _659 || _661;
    float _665 = float(_663);
    float _667 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _669 = _667 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _671 = _649 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _673 = isnan(_649);
    bool _675 = _671 || _673;
    bool _677 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _679 = _675 || _677;
    float _681 = float(_679);
    float _683 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _685 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _683;
    float _687 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _689 = _649 + _687;
    float _691 = -_665;
    float _693 = _691 + 1.0;
    float _695 = 1.0 / _669;
    float _697 = _681 * _693;
    float _699 = -_681;
    float _701 = _699 + 1.0;
    float _703 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _705 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    bool _707 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _709 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _711 = _703 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _713 = _705 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _715 = _709 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _717 = _613 * _653;
    float _719 = _611 * _651;
    float _721 = _685 * _695;
    float _723 = fma(_721, _689, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _725 = _723 * _697;
    float _727 = fma(_701, (*spvDescriptorSet0.vp_c9)._m0[115].x, _725);
    float _729 = fma(_665, (*spvDescriptorSet0.vp_c9)._m0[116].x, _727);
    float _731 = _729 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    out.m_72.x = _711;
    out.m_72.y = _715;
    out.m_72.z = _713;
    out.m_72.w = _731;
    bool _733 = !_707;
    float _751;
    if (!_733)
    {
        float _735 = in.m_68.x;
        float _737 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _739 = _735 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _741 = fma(_739, (*spvDescriptorSet0.vp_c9)._m0[11].w, _153);
        float _743 = _741 * _737;
        float _745 = floor(_743);
        float _747 = -_745;
        float _749 = _743 + _747;
        _751 = _749;
        _753 = true;
    }
    else
    {
        float _755 = float(_119);
        float _757 = 1.0 / _755;
        float _759 = _153 * _757;
        _751 = _759;
    }
    _753 = false;
    float _761 = _751;
    float _763 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _765 = int(_763);
    float _767 = float(_119);
    float _769 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _771 = int(_769);
    float _773 = float(_765);
    float _775 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].y);
    int _777 = int(_775);
    float _779 = float(uint(_771));
    float _781 = 1.0 / _773;
    float _783 = float(_771);
    int _785 = ~_771;
    int _787 = _785 + 1;
    float _789 = 1.0 / _779;
    float _791 = float(_777);
    float _793 = _781 * _153;
    float _795 = trunc((*spvDescriptorSet0.vp_c9)._m0[40].y);
    int _797 = int(_795);
    int _799 = as_type<int>(_789) + (-2);
    float _801 = trunc(_793);
    int _803 = int(_801);
    int _805 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _807 = _805 != 0;
    float _809 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].x);
    int _811 = int(_809);
    float _813 = float(_797);
    float _815 = float(uint(_803));
    float _817 = 1.0 / _767;
    float _819 = (*spvDescriptorSet0.vp_c9)._m0[7].z;
    float _821 = _817;
    if (_807)
    {
        float _823 = in.m_68.x;
        _819 = _823;
    }
    float _825 = _819;
    if (_807)
    {
        _617 = 0;
    }
    int _827 = _617;
    float _829 = as_type<float>(_799) * _815;
    int _831 = _827;
    if (_807)
    {
        _619 = 0;
    }
    int _833 = _619;
    float _835 = float(uint(_811));
    float _837 = trunc(_829);
    float _839 = precise::max(_837, 0.0);
    uint _842 = uint(_839);
    float _844 = 1.0 / _791;
    float _846 = 1.0 / _813;
    float _848 = _825;
    int _850 = _833;
    if (_807)
    {
        _621 = _825;
    }
    float _852 = _621;
    float _854 = 1.0 / _835;
    int _856 = ~_771;
    int _858 = _856 + 1;
    float _860 = _844 * _153;
    int _862 = _858 * int(_842);
    int _864 = _862 + _803;
    float _866 = trunc((*spvDescriptorSet0.vp_c9)._m0[40].x);
    int _868 = int(_866);
    float _870 = _817 * _153;
    float _872 = _846 * _153;
    float _874 = float(uint(_864));
    float _876 = in.m_68.x;
    float _878 = in.m_68.y;
    float _880 = in.m_68.z;
    float _882 = in.m_68.w;
    float _884 = _783 * _870;
    float _886 = _874;
    float _888 = _852;
    if (_807)
    {
        _821 = 1.0;
    }
    float _890 = _821;
    float _892 = as_type<float>(_799) * _874;
    float _894 = trunc(_860);
    int _896 = int(_894);
    float _898 = _890;
    if (_807)
    {
        _886 = 1.0;
    }
    float _900 = _886;
    float _902 = float(uint(_868));
    float _904 = trunc(_884);
    int _906 = int(_904);
    float _908 = trunc(_872);
    int _910 = int(_908);
    float _912 = trunc(_892);
    float _914 = precise::max(_912, 0.0);
    uint _916 = uint(_914);
    float _918 = 1.0 / _902;
    float _920 = _902;
    float _922 = _900;
    if (_807)
    {
        _920 = 1.0;
    }
    float _924 = _920;
    float _926 = _924;
    if (!_807)
    {
        float _928 = in.m_68.y;
        float _930 = in.m_68.z;
        _922 = 7.345489978790283203125;
        _898 = 1.2345600128173828125;
        _848 = _928;
        _926 = 5.839270114898681640625;
        _888 = _930;
        _831 = 1;
        _850 = 2;
    }
    float _932 = _922;
    float _934 = _898;
    float _936 = _848;
    float _938 = _926;
    float _940 = _888;
    int _942 = _831;
    int _944 = _850;
    float _946 = _932 * _876;
    int _948 = int(_842) + int(_916);
    float _950 = _934 * _936;
    float _952 = _938 * _940;
    float _954 = float(_803);
    float _956 = floor(_946);
    int _958 = as_type<int>(_854) + (-2);
    int _960 = _787 * _948;
    int _962 = _960 + _803;
    bool _964 = _954 >= _783;
    bool _966 = isnan(_954);
    bool _968 = _964 || _966;
    bool _970 = isnan(_783);
    bool _972 = _968 || _970;
    float _974 = float(_972);
    float _976 = _719 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _978 = float(uint(_896));
    int _980 = as_type<int>(_918) + (-2);
    float _982 = trunc(_974);
    int _984 = int(_982);
    float _986 = float(uint(_910));
    bool _988 = uint(_962) >= uint(_771);
    float _990 = as_type<float>(_958) * _978;
    bool _992 = _878 > 0.5;
    float _994 = as_type<float>(_980) * _986;
    bool _996 = !_988;
    int _998 = _996 ? 0 : (-1);
    float _1000 = -_956;
    float _1002 = _946 + _1000;
    float _1004 = trunc(_990);
    float _1006 = precise::max(_1004, 0.0);
    uint _1008 = uint(_1006);
    int _1010 = ~_948;
    int _1012 = _1010 + _998;
    int _1014 = _1012 + 1;
    float _1016 = _1002 * _783;
    bool _1018 = _771 == 0;
    bool _1020 = _880 > 0.5;
    int _1022 = _771 * _1014;
    int _1024 = _1022 + _803;
    int _1026 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _1028 = _1026 != 0;
    float _1030 = trunc(_994);
    float _1032 = precise::max(_1030, 0.0);
    uint _1034 = uint(_1032);
    float _1036 = -_213;
    int _1038 = _992 ? as_type<int>(_1036) : as_type<int>(_213);
    int _1040 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _1042 = _1040 != 0;
    int _1044 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16;
    bool _1046 = _1044 != 0;
    int _1048 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32;
    bool _1050 = _1048 != 0;
    float _1052 = -_217;
    int _1054 = _1020 ? as_type<int>(_1052) : as_type<int>(_217);
    float _1056 = floor(_950);
    bool _1058 = !_1050;
    float _1060 = _1058 ? _217 : as_type<float>(_1054);
    int _1062 = ~_984;
    int _1064 = _1062 + 1;
    int _1066 = _1064 + 1;
    bool _1068 = !_1018;
    int _1070 = _1068 ? _1024 : (-1);
    bool _1072 = !_1046;
    float _1074 = _1072 ? _213 : as_type<float>(_1038);
    float _1076 = floor(_952);
    int _1078 = ~_811;
    int _1080 = _1078 + 1;
    int _1082 = _1070 * _1066;
    int _1084 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _1086 = _1084 != 0;
    int _1088 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _1090 = _1088 != 0;
    int _1092 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _1094 = _1092 != 0;
    int _1096 = _771 + (-1);
    int _1098 = _1080 * int(_1008);
    int _1100 = _1098 + _896;
    bool _1102 = !_1028;
    int _1104 = _1102 ? 0 : 1;
    float _1106 = trunc(_1016);
    int _1108 = int(_1106);
    bool _1110 = !_1090;
    int _1112 = _1110 ? 0 : 1;
    int _1114 = _984 * _1096;
    int _1116 = _1114 + _1082;
    bool _1118 = _882 > 0.5;
    float _1120 = -_1056;
    float _1122 = _950 + _1120;
    bool _1124 = !_1086;
    int _1126 = _1124 ? 0 : 1;
    int _1128 = abs(_1112);
    float _1130 = -_1076;
    float _1132 = _952 + _1130;
    float _1134 = float(uint(_1100));
    bool _1136 = !_1094;
    int _1138 = _1136 ? 0 : 1;
    int _1140 = _1116 * _1128;
    int _1142 = ~_868;
    int _1144 = _1142 + 1;
    float _1146 = as_type<float>(_958) * _1134;
    int _1148 = abs(_1126);
    int _1150 = abs(_1138);
    float _1152 = trunc(_1146);
    float _1154 = precise::max(_1152, 0.0);
    uint _1156 = uint(_1154);
    int _1158 = _1144 * int(_1034);
    int _1160 = _1158 + _910;
    int _1162 = abs(_1104);
    int _1164 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _1166 = _1164 != 0;
    int _1168 = _906 * _1148;
    int _1170 = _1168 + _1140;
    float _1172 = float(uint(_1160));
    int _1174 = _1108 * _1162;
    int _1176 = _1174 + _803;
    int _1178 = ~_811;
    int _1180 = _1178 + 1;
    float _1182 = as_type<float>(_980) * _1172;
    bool _1184 = !_1166;
    int _1186 = _1184 ? 0 : 1;
    int _1188 = _1176 * _1150;
    int _1190 = _1188 + _1170;
    float _1192 = float(_811);
    float _1194 = trunc(_1182);
    float _1196 = precise::max(_1194, 0.0);
    uint _1198 = uint(_1196);
    int _1200 = int(_1008) + int(_1156);
    float _1202 = float(_896);
    float _1204 = _1122 * _1192;
    int _1206 = abs(_1186);
    int _1208 = _1180 * _1200;
    int _1210 = _1208 + _896;
    bool _1212 = _1202 >= _1192;
    bool _1214 = isnan(_1202);
    bool _1216 = _1212 || _1214;
    bool _1218 = isnan(_1192);
    bool _1220 = _1216 || _1218;
    float _1222 = float(_1220);
    float _1224 = _1192 * _870;
    float _1226 = float(_868);
    int _1228 = _1108 * _1206;
    int _1230 = _1228 + _1190;
    int _1232 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8192;
    bool _1234 = _1232 != 0;
    float _1236 = trunc(_1204);
    int _1238 = int(_1236);
    float _1240 = float(_910);
    float _1242 = _1226 * _870;
    bool _1244 = uint(_1210) >= uint(_811);
    float _1246 = _1132 * _1226;
    int _1248 = int(_1034) + int(_1198);
    bool _1250 = !_1234;
    int _1252 = _1250 ? 0 : 1;
    float _1254 = trunc(_1222);
    int _1256 = int(_1254);
    bool _1258 = _1240 >= _1226;
    bool _1260 = isnan(_1240);
    bool _1262 = _1258 || _1260;
    bool _1264 = isnan(_1226);
    bool _1266 = _1262 || _1264;
    float _1268 = float(_1266);
    float _1270 = -_217;
    int _1272 = _1118 ? as_type<int>(_1270) : as_type<int>(_217);
    float _1274 = float(uint(_1230));
    bool _1276 = !_1244;
    int _1278 = _1276 ? 0 : (-1);
    float _1280 = trunc(_1224);
    int _1282 = int(_1280);
    int _1284 = abs(_1252);
    bool _1286 = !_1042;
    float _1288 = _1286 ? _217 : as_type<float>(_1272);
    float _1290 = as_type<float>(_799) * _1274;
    int _1292 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 256;
    bool _1294 = _1292 != 0;
    int _1296 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 512;
    bool _1298 = _1296 != 0;
    int _1300 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1024;
    bool _1302 = _1300 != 0;
    int _1304 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2048;
    bool _1306 = _1304 != 0;
    int _1308 = ~_1200;
    int _1310 = _1308 + _1278;
    int _1312 = _1310 + 1;
    float _1314 = trunc(_1268);
    int _1316 = int(_1314);
    int _1318 = ~_868;
    int _1320 = _1318 + 1;
    bool _1322 = !_1298;
    int _1324 = _1322 ? 0 : 1;
    int _1326 = _811 * _1312;
    int _1328 = _1326 + _896;
    bool _1330 = _811 == 0;
    int _1332 = _1320 * _1248;
    int _1334 = _1332 + _910;
    float _1336 = trunc(_1290);
    float _1338 = precise::max(_1336, 0.0);
    uint _1340 = uint(_1338);
    int _1342 = ~_1256;
    int _1344 = _1342 + 1;
    int _1346 = _1344 + 1;
    bool _1348 = !_1330;
    int _1350 = _1348 ? _1328 : (-1);
    int _1352 = _1238 * _1284;
    int _1354 = _1352 + _896;
    int _1356 = ~_771;
    int _1358 = _1356 + 1;
    int _1360 = _811 + (-1);
    int _1362 = _1350 * _1346;
    bool _1364 = !_1294;
    int _1366 = _1364 ? 0 : 1;
    float _1368 = trunc(_1242);
    int _1370 = int(_1368);
    bool _1372 = uint(_1334) >= uint(_868);
    int _1374 = _1256 * _1360;
    int _1376 = _1374 + _1362;
    int _1378 = abs(_1324);
    bool _1380 = !_1372;
    int _1382 = _1380 ? 0 : (-1);
    int _1384 = _1358 * int(_1340);
    int _1386 = _1384 + _1230;
    int _1388 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 4096;
    bool _1390 = _1388 != 0;
    int _1392 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 8192;
    bool _1394 = _1392 != 0;
    int _1396 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16384;
    bool _1398 = _1396 != 0;
    int _1400 = _1376 * _1378;
    int _1402 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16384;
    bool _1404 = _1402 != 0;
    float _1406 = float(uint(_1386));
    int _1408 = abs(_1366);
    float _1410 = trunc(_1246);
    int _1412 = int(_1410);
    int _1414 = ~_1248;
    int _1416 = _1414 + _1382;
    int _1418 = _1416 + 1;
    float _1420 = as_type<float>(_799) * _1406;
    float _1422 = float(uint(_1176));
    int _1424 = _1282 * _1408;
    int _1426 = _1424 + _1400;
    bool _1428 = !_1404;
    int _1430 = _1428 ? 0 : 1;
    bool _1432 = !_1302;
    int _1434 = _1432 ? 0 : 1;
    float _1436 = as_type<float>(_799) * _1422;
    int _1438 = abs(_1430);
    float _1440 = trunc(_1420);
    float _1442 = precise::max(_1440, 0.0);
    uint _1444 = uint(_1442);
    bool _1446 = !_1306;
    int _1448 = _1446 ? 0 : 1;
    int _1450 = _868 * _1418;
    int _1452 = _1450 + _910;
    int _1454 = abs(_1434);
    int _1456 = abs(_1448);
    float _1458 = trunc(_1436);
    float _1460 = precise::max(_1458, 0.0);
    uint _1462 = uint(_1460);
    int _1464 = _1412 * _1438;
    int _1466 = _1464 + _910;
    bool _1468 = _868 == 0;
    int _1470 = ~_1316;
    int _1472 = _1470 + 1;
    int _1474 = _1472 + 1;
    int _1476 = _1354 * _1454;
    int _1478 = _1476 + _1426;
    bool _1480 = !_1468;
    int _1482 = _1480 ? _1452 : (-1);
    int _1484 = ~_771;
    int _1486 = _1484 + 1;
    int _1488 = _1238 * _1456;
    int _1490 = _1488 + _1478;
    int _1492 = ~_771;
    int _1494 = _1492 + 1;
    int _1496 = _1482 * _1474;
    bool _1498 = !_1394;
    int _1500 = _1498 ? 0 : 1;
    int _1502 = _868 + (-1);
    int _1504 = _1486 * int(_1462);
    int _1506 = _1504 + _1176;
    int _1508 = int(_1340) + int(_1444);
    int _1510 = _1316 * _1502;
    int _1512 = _1510 + _1496;
    int _1514 = abs(_1500);
    float _1516 = float(uint(_1490));
    float _1518 = float(uint(_1506));
    int _1520 = _1494 * _1508;
    int _1522 = _1520 + _1230;
    int _1524 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32768;
    bool _1526 = _1524 != 0;
    float _1528 = as_type<float>(_958) * _1516;
    int _1530 = _1512 * _1514;
    float _1532 = as_type<float>(_799) * _1518;
    bool _1534 = !_1390;
    int _1536 = _1534 ? 0 : 1;
    float _1538 = float(uint(_1354));
    float _1540 = trunc(_1528);
    float _1542 = precise::max(_1540, 0.0);
    uint _1544 = uint(_1542);
    bool _1546 = uint(_1522) >= uint(_771);
    bool _1548 = !_1398;
    int _1550 = _1548 ? 0 : 1;
    float _1552 = as_type<float>(_958) * _1538;
    int _1554 = abs(_1536);
    int _1556 = abs(_1550);
    float _1558 = trunc(_1532);
    float _1560 = precise::max(_1558, 0.0);
    uint _1562 = uint(_1560);
    bool _1564 = !_1526;
    int _1566 = _1564 ? 0 : 1;
    int _1568 = ~_811;
    int _1570 = _1568 + 1;
    int _1572 = _1370 * _1554;
    int _1574 = _1572 + _1530;
    int _1576 = abs(_1566);
    float _1578 = trunc(_1552);
    float _1580 = precise::max(_1578, 0.0);
    uint _1582 = uint(_1580);
    bool _1584 = !_1546;
    int _1586 = _1584 ? 0 : (-1);
    int _1588 = _1466 * _1556;
    int _1590 = _1588 + _1574;
    int _1592 = _1570 * int(_1544);
    int _1594 = _1592 + _1490;
    int _1596 = ~_1508;
    int _1598 = _1596 + _1586;
    int _1600 = _1598 + 1;
    int _1602 = _1412 * _1576;
    int _1604 = _1602 + _1590;
    float _1606 = float(uint(_1594));
    int _1608 = _771 * _1600;
    int _1610 = _1608 + _1230;
    bool _1612 = _771 == 0;
    int _1614 = int(_1462) + int(_1562);
    float _1616 = as_type<float>(_958) * _1606;
    bool _1618 = !_1612;
    int _1620 = _1618 ? _1610 : (-1);
    int _1622 = _1570 * int(_1582);
    int _1624 = _1622 + _1354;
    float _1626 = float(uint(_1604));
    float _1628 = trunc(_1616);
    float _1630 = precise::max(_1628, 0.0);
    uint _1632 = uint(_1630);
    int _1634 = _1620 & 3;
    bool _1636 = _1634 != 0;
    float _1638 = float(uint(_1624));
    float _1640 = as_type<float>(_980) * _1626;
    int _1642 = _1620 & 3;
    bool _1644 = _1642 != 0;
    int _1646 = _1636 ? 0 : 1;
    float _1648 = as_type<float>(_958) * _1638;
    float _1650 = float(uint(_1466));
    float _1652 = trunc(_1640);
    float _1654 = precise::max(_1652, 0.0);
    uint _1656 = uint(_1654);
    bool _1658 = uint(_1642) > 1u;
    int _1660 = ~_868;
    int _1662 = _1660 + 1;
    float _1664 = as_type<float>(_980) * _1650;
    int _1666 = ~_1646;
    int _1668 = _1666 + 1;
    int _1670 = _1668 + 1;
    float _1672 = trunc(_1648);
    float _1674 = precise::max(_1672, 0.0);
    uint _1676 = uint(_1674);
    int _1678 = int(_1544) + int(_1632);
    int _1680 = ~_771;
    int _1682 = _1680 + 1;
    int _1684 = ~_811;
    int _1686 = _1684 + 1;
    int _1688 = _1670;
    if (!_1658)
    {
        int _1690 = ~_1646;
        int _1692 = _1690 + 1;
        _1688 = _1692;
    }
    int _1694 = _1688;
    int _1696 = _1662 * int(_1656);
    int _1698 = _1696 + _1604;
    bool _1700 = uint(_1642) >= 2u;
    int _1702 = _1682 * _1614;
    int _1704 = _1702 + _1176;
    float _1706 = trunc(_1664);
    float _1708 = precise::max(_1706, 0.0);
    uint _1710 = uint(_1708);
    int _1712 = ~_868;
    int _1714 = _1712 + 1;
    float _1716 = float(uint(_1698));
    int _1718 = _1700 ? 0 : 1;
    bool _1720 = uint(_1704) >= uint(_771);
    float _1722 = as_type<float>(_980) * _1716;
    int _1724 = _1686 * _1678;
    int _1726 = _1724 + _1490;
    int _1728 = ~_1718;
    int _1730 = _1728 + 1;
    int _1732 = _1730 + 1;
    bool _1734 = !_1720;
    int _1736 = _1734 ? 0 : (-1);
    bool _1738 = uint(_1726) >= uint(_811);
    float _1740 = trunc(_1722);
    float _1742 = precise::max(_1740, 0.0);
    uint _1744 = uint(_1742);
    int _1746 = ~_1614;
    int _1748 = _1746 + _1736;
    int _1750 = _1748 + 1;
    int _1752 = _1714 * int(_1710);
    int _1754 = _1752 + _1466;
    bool _1756 = !_1738;
    int _1758 = _1756 ? 0 : (-1);
    bool _1760 = _1642 != 3;
    int _1762 = _771 * _1750;
    int _1764 = _1762 + _1176;
    int _1766 = ~_1678;
    int _1768 = _1766 + _1758;
    int _1770 = _1768 + 1;
    float _1772 = float(uint(_1754));
    int _1774 = ~_868;
    int _1776 = _1774 + 1;
    int _1778 = _811 * _1770;
    int _1780 = _1778 + _1490;
    bool _1782 = !_1644;
    int _1784 = _1782 ? 0 : 1;
    float _1786 = as_type<float>(_980) * _1772;
    bool _1788 = !_1612;
    int _1790 = _1788 ? _1764 : (-1);
    bool _1792 = !_1330;
    int _1794 = _1792 ? _1780 : (-1);
    float _1796 = trunc(_1786);
    float _1798 = precise::max(_1796, 0.0);
    uint _1800 = uint(_1798);
    int _1802 = int(_1656) + int(_1744);
    int _1804 = _1732;
    if (_1760)
    {
        int _1806 = ~_1718;
        int _1808 = _1806 + 1;
        _1804 = _1808;
    }
    int _1810 = _1804;
    int _1812 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _1814 = _1812 != 0;
    int _1816 = _1776 * _1802;
    int _1818 = _1816 + _1604;
    int _1820 = _1794 & 3;
    bool _1822 = _1820 != 0;
    int _1824 = _1794 & 3;
    bool _1826 = _1824 != 0;
    bool _1828 = !_1814;
    int _1830 = _1828 ? 0 : 1;
    bool _1832 = uint(_1820) > 1u;
    int _1834 = _1826 ? 0 : 1;
    bool _1836 = uint(_1818) >= uint(_868);
    int _1838 = int(_1582) + int(_1676);
    bool _1840 = !_1836;
    int _1842 = _1840 ? 0 : (-1);
    int _1844 = ~_811;
    int _1846 = _1844 + 1;
    int _1848 = ~_1802;
    int _1850 = _1848 + _1842;
    int _1852 = _1850 + 1;
    int _1854 = ~_1834;
    int _1856 = _1854 + 1;
    int _1858 = _1856 + 1;
    int _1860 = _1846 * _1838;
    int _1862 = _1860 + _1354;
    int _1864 = _1858;
    if (!_1832)
    {
        int _1866 = ~_1834;
        int _1868 = _1866 + 1;
        _1864 = _1868;
    }
    int _1870 = _1864;
    int _1872 = _868 * _1852;
    int _1874 = _1872 + _1604;
    bool _1876 = _1642 != 3;
    bool _1878 = uint(_1820) >= 2u;
    int _1880 = _1794 >> 31;
    bool _1882 = !_1876;
    int _1884 = _1882 ? 0 : (-1);
    int _1886 = _1878 ? 0 : 1;
    bool _1888 = _1820 != 3;
    bool _1890 = _1820 != 3;
    int _1892 = _1880 & 3;
    bool _1894 = !_1822;
    int _1896 = _1894 ? 0 : 1;
    bool _1898 = !_1468;
    int _1900 = _1898 ? _1874 : (-1);
    bool _1902 = uint(_1862) >= uint(_811);
    int _1904 = _1620 >> 31;
    int _1906 = _1794 + _1892;
    int _1908 = _1900 >> 31;
    int _1910 = _1904 & 3;
    int _1912 = _1908 & 3;
    int _1914 = _1620 + _1910;
    int _1916 = ~_1886;
    int _1918 = _1916 + 1;
    int _1920 = _1918 + 1;
    int _1922 = _1920;
    if (_1888)
    {
        int _1924 = ~_1886;
        int _1926 = _1924 + 1;
        _1922 = _1926;
    }
    int _1928 = _1922;
    bool _1930 = !_1890;
    int _1932 = _1930 ? 0 : (-1);
    int _1934 = int(_1710) + int(_1800);
    int _1936 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4194304;
    bool _1938 = _1936 != 0;
    int _1940 = _1900 & 3;
    bool _1942 = _1940 != 0;
    int _1944 = _1900 + _1912;
    int _1946 = _1900 & 3;
    bool _1948 = _1946 != 0;
    float _1950 = in.m_50.x;
    float _1952 = in.m_50.y;
    float _1954 = in.m_50.z;
    int _1956 = _1914 >> 2;
    bool _1958 = !_1938;
    int _1960 = _1958 ? 0 : 1;
    bool _1962 = !_1902;
    int _1964 = _1962 ? 0 : (-1);
    bool _1966 = uint(_1946) > 1u;
    int _1968 = _1956 << 4;
    int _1970 = _1968 + 368;
    int _1972 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8388608;
    bool _1974 = _1972 != 0;
    int _1976 = _1906 >> 2;
    uint _1978 = uint(int(uint(_1970) >> uint(2)));
    uint _1980 = uint(int(uint(int(_1978)) >> uint(2)));
    int _1982 = int(_1978) & 3;
    float _1984 = (*spvDescriptorSet0.vp_c9)._m0[int(_1980)][_1982];
    int _1986 = int(_1978) + 1;
    uint _1988 = uint(int(uint(_1986) >> uint(2)));
    int _1990 = _1986 & 3;
    float _1992 = (*spvDescriptorSet0.vp_c9)._m0[int(_1988)][_1990];
    bool _1994 = !_1974;
    int _1996 = _1994 ? 0 : 1;
    int _1998 = ~_868;
    int _2000 = _1998 + 1;
    bool _2002 = _1946 != 3;
    int _2004 = _1976 << 4;
    int _2006 = _2004 + 512;
    int _2008 = _2000 * _1934;
    int _2010 = _2008 + _1466;
    int _2012 = _1942 ? 0 : 1;
    float _2014 = _197 * _1952;
    int _2016 = _1944 >> 2;
    uint _2018 = uint(int(uint(_2006) >> uint(2)));
    uint _2020 = uint(int(uint(int(_2018)) >> uint(2)));
    int _2022 = int(_2018) & 3;
    float _2024 = (*spvDescriptorSet0.vp_c9)._m0[int(_2020)][_2022];
    int _2026 = int(_2018) + 1;
    uint _2028 = uint(int(uint(_2026) >> uint(2)));
    int _2030 = _2026 & 3;
    float _2032 = (*spvDescriptorSet0.vp_c9)._m0[int(_2028)][_2030];
    bool _2034 = uint(_1946) >= 2u;
    float _2036 = _185 * _1952;
    int _2038 = ~_2012;
    int _2040 = _2038 + 1;
    int _2042 = _2040 + 1;
    int _2044 = _2042;
    if (!_1966)
    {
        int _2046 = ~_2012;
        int _2048 = _2046 + 1;
        _2044 = _2048;
    }
    int _2050 = _2044;
    float _2052 = fma(_183, _1950, _2036);
    int _2054 = _2016 << 4;
    int _2056 = _2054 + 656;
    float _2058 = trunc((*spvDescriptorSet0.vp_c9)._m0[90].z);
    int _2060 = int(_2058);
    bool _2062 = _1946 != 3;
    float _2064 = fma(_187, _1954, _2052);
    int _2066 = _2034 ? 0 : 1;
    uint _2068 = uint(int(uint(_2056) >> uint(2)));
    uint _2070 = uint(int(uint(int(_2068)) >> uint(2)));
    int _2072 = int(_2068) & 3;
    float _2074 = (*spvDescriptorSet0.vp_c9)._m0[int(_2070)][_2072];
    int _2076 = int(_2068) + 1;
    uint _2078 = uint(int(uint(_2076) >> uint(2)));
    int _2080 = _2076 & 3;
    float _2082 = (*spvDescriptorSet0.vp_c9)._m0[int(_2078)][_2080];
    bool _2084 = uint(_2010) >= uint(_868);
    int _2086 = ~_1838;
    int _2088 = _2086 + _1964;
    int _2090 = _2088 + 1;
    bool _2092 = !_1948;
    int _2094 = _2092 ? 0 : 1;
    int _2096 = _2006 + 8;
    uint _2098 = uint(int(uint(_2096) >> uint(2)));
    uint _2100 = uint(int(uint(int(_2098)) >> uint(2)));
    int _2102 = int(_2098) & 3;
    float _2104 = (*spvDescriptorSet0.vp_c9)._m0[int(_2100)][_2102];
    int _2106 = int(_2098) + 1;
    uint _2108 = uint(int(uint(_2106) >> uint(2)));
    int _2110 = _2106 & 3;
    float _2112 = (*spvDescriptorSet0.vp_c9)._m0[int(_2108)][_2110];
    int _2114 = ~_2066;
    int _2116 = _2114 + 1;
    int _2118 = _2116 + 1;
    int _2120 = _811 * _2090;
    int _2122 = _2120 + _1354;
    int _2124 = 2 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y);
    bool _2126 = _2124 != 0;
    int _2128 = _2118;
    if (_2002)
    {
        int _2130 = ~_2066;
        int _2132 = _2130 + 1;
        _2128 = _2132;
    }
    int _2134 = _2128;
    bool _2136 = !_2062;
    int _2138 = _2136 ? 0 : (-1);
    bool _2140 = !_2084;
    int _2142 = _2140 ? 0 : (-1);
    int _2144 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _2146 = _2144 != 0;
    int _2148 = _1970 + 8;
    uint _2150 = uint(int(uint(_2148) >> uint(2)));
    uint _2152 = uint(int(uint(int(_2150)) >> uint(2)));
    int _2154 = int(_2150) & 3;
    float _2156 = (*spvDescriptorSet0.vp_c9)._m0[int(_2152)][_2154];
    int _2158 = int(_2150) + 1;
    uint _2160 = uint(int(uint(_2158) >> uint(2)));
    int _2162 = _2158 & 3;
    float _2164 = (*spvDescriptorSet0.vp_c9)._m0[int(_2160)][_2162];
    int _2166 = ~_1934;
    int _2168 = _2166 + _2142;
    int _2170 = _2168 + 1;
    float _2172 = fma(_195, _1950, _2014);
    int _2174 = abs(_1694);
    int _2176 = abs(_2050);
    int _2178 = _868 * _2170;
    int _2180 = _2178 + _1466;
    int _2182 = _2056 + 8;
    uint _2184 = uint(int(uint(_2182) >> uint(2)));
    uint _2186 = uint(int(uint(int(_2184)) >> uint(2)));
    int _2188 = int(_2184) & 3;
    float _2190 = (*spvDescriptorSet0.vp_c9)._m0[int(_2186)][_2188];
    int _2192 = int(_2184) + 1;
    uint _2194 = uint(int(uint(_2192) >> uint(2)));
    int _2196 = _2192 & 3;
    float _2198 = (*spvDescriptorSet0.vp_c9)._m0[int(_2194)][_2196];
    int _2200 = abs(_1870);
    float _2202 = fma(_199, _1954, _2172);
    int _2204 = abs(_1784);
    int _2206 = ~_2174;
    int _2208 = _2206 + 1;
    int _2210 = _2208 + 1;
    int _2212 = ~_2204;
    int _2214 = _2212 + 1;
    int _2216 = _2214 + 1;
    int _2218 = _2210 * as_type<int>(_1992);
    int _2220 = ~_2200;
    int _2222 = _2220 + 1;
    int _2224 = _2222 + 1;
    int _2226 = _2216 * as_type<int>(_1984);
    int _2228 = _2226 + _2218;
    int _2230 = abs(_1896);
    int _2232 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y);
    bool _2234 = _2232 != 0;
    float _2236 = _191 * _1952;
    int _2238 = abs(_2094);
    float _2240 = trunc((*spvDescriptorSet0.vp_c9)._m0[80].z);
    int _2242 = int(_2240);
    int _2244 = abs(_1928);
    int _2246 = _2224 * as_type<int>(_2032);
    int _2248 = ~_2230;
    int _2250 = _2248 + 1;
    int _2252 = _2250 + 1;
    float _2254 = fma(_189, _1950, _2236);
    int _2256 = ~_2176;
    int _2258 = _2256 + 1;
    int _2260 = _2258 + 1;
    int _2262 = abs(_1810);
    float _2264 = trunc((*spvDescriptorSet0.vp_c9)._m0[85].z);
    int _2266 = int(_2264);
    int _2268 = _2252 * as_type<int>(_2024);
    int _2270 = _2268 + _2246;
    int _2272 = ~_2244;
    int _2274 = _2272 + 1;
    int _2276 = _2274 + 1;
    int _2278 = _2260 * as_type<int>(_2082);
    int _2280 = ~_2238;
    int _2282 = _2280 + 1;
    int _2284 = _2282 + 1;
    float _2286 = fma(_193, _1954, _2254);
    int _2288 = ~_2262;
    int _2290 = _2288 + 1;
    int _2292 = _2290 + 1;
    int _2294 = _2276 * as_type<int>(_2104);
    int _2296 = _2294 + _2270;
    int _2298 = abs(_2134);
    int _2300 = _2284 * as_type<int>(_2074);
    int _2302 = _2300 + _2278;
    int _2304 = abs(_1884);
    int _2306 = _2292 * as_type<int>(_2156);
    int _2308 = _2306 + _2228;
    int _2310 = ~_2298;
    int _2312 = _2310 + 1;
    int _2314 = _2312 + 1;
    int _2316 = abs(_2138);
    int _2318 = ~_2304;
    int _2320 = _2318 + 1;
    int _2322 = _2320 + 1;
    float _2324 = float(uint(_2242));
    int _2326 = _2314 * as_type<int>(_2190);
    int _2328 = _2326 + _2302;
    int _2330 = ~_2316;
    int _2332 = _2330 + 1;
    int _2334 = _2332 + 1;
    int _2336 = _2322 * as_type<int>(_2164);
    int _2338 = _2336 + _2308;
    int _2340 = abs(_2242);
    int _2342 = abs(_2266);
    float _2344 = 1.0 / _2324;
    int _2346 = abs(_1830);
    int _2348 = _2334 * as_type<int>(_2198);
    int _2350 = _2348 + _2328;
    float _2352 = float(uint(_2266));
    int _2354 = abs(_1932);
    float _2356 = 1.0 / _2352;
    int _2358 = ~_2346;
    int _2360 = _2358 + 1;
    int _2362 = _2360 + 1;
    int _2364 = ~_2354;
    int _2366 = _2364 + 1;
    int _2368 = _2366 + 1;
    int _2370 = abs(_1960);
    int _2372 = _2338 * _2362;
    float _2374 = float(uint(_2060));
    int _2376 = _2368 * as_type<int>(_2112);
    int _2378 = _2376 + _2296;
    int _2380 = ~_2370;
    int _2382 = _2380 + 1;
    int _2384 = _2382 + 1;
    int _2386 = _1790 * _2346;
    int _2388 = _2386 + _2372;
    int _2390 = abs(_1996);
    float _2392 = _876 * 2.0;
    float _2394 = 1.0 / _2374;
    float _2396 = float(uint(_2340));
    int _2398 = _2378 * _2384;
    bool _2400 = !_1330;
    int _2402 = _2400 ? _2122 : (-1);
    int _2404 = ~_2390;
    int _2406 = _2404 + 1;
    int _2408 = _2406 + 1;
    int _2410 = as_type<int>(_2344) + (-2);
    int _2412 = _2402 * _2370;
    int _2414 = _2412 + _2398;
    float _2416 = 1.0 / _2396;
    float _2418 = float(uint(_2388));
    int _2420 = _2350 * _2408;
    bool _2422 = !_1468;
    int _2424 = _2422 ? _2180 : (-1);
    float _2426 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    int _2428 = abs(_2060);
    float _2430 = as_type<float>(_2410) * _2418;
    float _2432 = _876 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    int _2434 = as_type<int>(_2356) + (-2);
    int _2436 = _2424 * _2390;
    int _2438 = _2436 + _2420;
    float _2440 = float(uint(_2414));
    float _2442 = -_2426;
    float _2444 = fma(_2432, 2.0, _2442);
    float _2446 = float(uint(_2342));
    float _2448 = trunc(_2430);
    float _2450 = precise::max(_2448, 0.0);
    uint _2452 = uint(_2450);
    float _2454 = as_type<float>(_2434) * _2440;
    float _2456 = -_153;
    float _2458 = fma(_2456, (*spvDescriptorSet0.vp_c9)._m0[76].x, _2444);
    int _2460 = as_type<int>(_2394) + (-2);
    float _2462 = float(uint(_2438));
    float _2464 = 1.0 / _2446;
    int _2466 = abs(_2388);
    float _2468 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _2470 = _878 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _2472 = as_type<float>(_2460) * _2462;
    int _2474 = as_type<int>(_2416) + (-2);
    float _2476 = trunc(_2454);
    float _2478 = precise::max(_2476, 0.0);
    uint _2480 = uint(_2478);
    float _2482 = float(uint(_2466));
    float _2484 = fma(_2470, -2.0, _2468);
    float _2486 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _2488 = _2486 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    int _2490 = ~_2242;
    int _2492 = _2490 + 1;
    float _2494 = as_type<float>(_2474) * _2482;
    int _2496 = abs(_2438);
    float _2498 = trunc(_2472);
    float _2500 = precise::max(_2498, 0.0);
    uint _2502 = uint(_2500);
    float _2504 = float(uint(_2428));
    float _2506 = fma(_153, (*spvDescriptorSet0.vp_c9)._m0[76].y, _2484);
    int _2508 = abs(_2414);
    float _2510 = 1.0 / _2488;
    int _2512 = ~_2266;
    int _2514 = _2512 + 1;
    int _2516 = _2492 * int(_2452);
    int _2518 = _2516 + _2388;
    int _2520 = ~_2060;
    int _2522 = _2520 + 1;
    int _2524 = as_type<int>(_2464) + (-2);
    int _2526 = _2514 * int(_2480);
    int _2528 = _2526 + _2414;
    float _2530 = float(uint(_2508));
    float _2532 = trunc(_2494);
    float _2534 = precise::max(_2532, 0.0);
    uint _2536 = uint(_2534);
    float _2538 = as_type<float>(_2524) * _2530;
    float _2540 = float(uint(_2518));
    int _2542 = _2522 * int(_2502);
    int _2544 = _2542 + _2438;
    int _2546 = ~_2340;
    int _2548 = _2546 + 1;
    float _2550 = 1.0 / _2504;
    float _2552 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _2554 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _2552;
    float _2556 = float(uint(_2528));
    float _2558 = as_type<float>(_2410) * _2540;
    float _2560 = float(uint(_2544));
    float _2562 = _2554 * _2510;
    float _2564 = _876 + _878;
    float _2566 = float(uint(_2496));
    float _2568 = floor(_2392);
    int _2570 = _2548 * int(_2536);
    int _2572 = _2570 + _2466;
    float _2574 = as_type<float>(_2434) * _2556;
    float _2576 = _2564 + (-1.0);
    float _2578 = as_type<float>(_2460) * _2560;
    int _2580 = ~_2342;
    int _2582 = _2580 + 1;
    float _2584 = trunc(_2538);
    float _2586 = precise::max(_2584, 0.0);
    uint _2588 = uint(_2586);
    int _2590 = as_type<int>(_2550) + (-2);
    float _2592 = float(uint(_2572));
    float _2594 = fma(_2576, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _2596 = as_type<float>(_2590) * _2566;
    bool _2598 = _942 != 1;
    float _2600 = trunc(_2558);
    float _2602 = precise::max(_2600, 0.0);
    uint _2604 = uint(_2602);
    float _2606 = as_type<float>(_2474) * _2592;
    bool _2608 = _2568 > 0.0;
    float _2610 = _878 + _880;
    bool _2612 = _2568 >= 0.0;
    bool _2614 = isnan(_2568);
    bool _2616 = _2612 || _2614;
    bool _2618 = isnan(0.0);
    bool _2620 = _2616 || _2618;
    bool _2622 = _878 > 0.5;
    float _2624 = _2610 + (-1.0);
    float _2626 = trunc(_2596);
    float _2628 = precise::max(_2626, 0.0);
    uint _2630 = uint(_2628);
    int _2632 = _2582 * int(_2588);
    int _2634 = _2632 + _2508;
    float _2636 = -_217;
    int _2638 = _2622 ? as_type<int>(_2636) : as_type<int>(_217);
    float _2640 = float(uint(_2634));
    float _2642 = trunc(_2606);
    float _2644 = precise::max(_2642, 0.0);
    uint _2646 = uint(_2644);
    int _2648 = int(_2452) + int(_2604);
    float _2650 = fma(_2624, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    int _2652 = ~_2428;
    int _2654 = _2652 + 1;
    float _2656 = as_type<float>(_2524) * _2640;
    int _2658 = ~_2242;
    int _2660 = _2658 + 1;
    float _2662 = trunc(_2574);
    float _2664 = precise::max(_2662, 0.0);
    uint _2666 = uint(_2664);
    int _2668 = _2654 * int(_2630);
    int _2670 = _2668 + _2496;
    int _2672 = ~_2340;
    int _2674 = _2672 + 1;
    int _2676 = _2660 * _2648;
    int _2678 = _2676 + _2388;
    float _2680 = trunc(_2656);
    float _2682 = precise::max(_2680, 0.0);
    uint _2684 = uint(_2682);
    int _2686 = int(_2536) + int(_2646);
    float _2688 = float(uint(_2670));
    bool _2690 = !_2126;
    float _2692 = _2690 ? _217 : as_type<float>(_2638);
    int _2694 = _2674 * _2686;
    int _2696 = _2694 + _2466;
    bool _2698 = _880 > 0.5;
    float _2700 = trunc(_2578);
    float _2702 = precise::max(_2700, 0.0);
    uint _2704 = uint(_2702);
    int _2706 = int(_2480) + int(_2666);
    float _2708 = as_type<float>(_2590) * _2688;
    int _2710 = ~_2266;
    int _2712 = _2710 + 1;
    float _2714 = in.m_64.w;
    bool _2716 = uint(_2678) >= uint(_2242);
    float _2718 = -_213;
    int _2720 = _2698 ? as_type<int>(_2718) : as_type<int>(_213);
    int _2722 = _2712 * _2706;
    int _2724 = _2722 + _2414;
    bool _2726 = !_2716;
    int _2728 = _2726 ? 0 : (-1);
    float _2730 = trunc(_2708);
    float _2732 = precise::max(_2730, 0.0);
    uint _2734 = uint(_2732);
    bool _2736 = !_2146;
    float _2738 = _2736 ? _213 : as_type<float>(_2720);
    bool _2740 = uint(_2696) >= uint(_2340);
    bool _2742 = _876 > 0.5;
    int _2744 = int(_2588) + int(_2684);
    int _2746 = ~_2648;
    int _2748 = _2746 + _2728;
    int _2750 = _2748 + 1;
    int _2752 = ~_2342;
    int _2754 = _2752 + 1;
    bool _2756 = uint(_2724) >= uint(_2266);
    int _2758 = _2242 * _2750;
    int _2760 = _2758 + _2388;
    int _2762 = int(_2502) + int(_2704);
    int _2764 = ~_2060;
    int _2766 = _2764 + 1;
    float _2768 = _2286 + _2714;
    float _2770 = -_213;
    int _2772 = _2742 ? as_type<int>(_2770) : as_type<int>(_213);
    bool _2774 = _944 != 2;
    int _2776 = _2754 * _2744;
    int _2778 = _2776 + _2508;
    bool _2780 = !_2740;
    int _2782 = _2780 ? 0 : (-1);
    int _2784 = _2766 * _2762;
    int _2786 = _2784 + _2438;
    bool _2788 = _2242 == 0;
    bool _2790 = !_2756;
    int _2792 = _2790 ? 0 : (-1);
    bool _2794 = !_2788;
    int _2796 = _2794 ? _2760 : (-1);
    int _2798 = ~_2706;
    int _2800 = _2798 + _2792;
    int _2802 = _2800 + 1;
    bool _2804 = uint(_2778) >= uint(_2342);
    bool _2806 = uint(_2786) >= uint(_2060);
    int _2808 = _2266 * _2802;
    int _2810 = _2808 + _2414;
    int _2812 = int(_2630) + int(_2734);
    int _2814 = ~_2428;
    int _2816 = _2814 + 1;
    bool _2818 = !_2804;
    int _2820 = _2818 ? 0 : (-1);
    bool _2822 = _2266 == 0;
    int _2824 = _2816 * _2812;
    int _2826 = _2824 + _2496;
    bool _2828 = !_2234;
    float _2830 = _2828 ? _213 : as_type<float>(_2772);
    bool _2832 = _2242 == 0;
    int _2834 = _2388 ^ _2242;
    bool _2836 = !_2822;
    int _2838 = _2836 ? _2810 : (-1);
    bool _2840 = _2266 == 0;
    int _2842 = _2414 ^ _2266;
    float _2844 = _878 * 2.0;
    bool _2846 = !_2806;
    int _2848 = _2846 ? 0 : (-1);
    bool _2850 = uint(_2826) >= uint(_2428);
    int _2852 = ~_2782;
    int _2854 = _2686 + _2852;
    int _2856 = _2854 + 1;
    float _2858 = floor(_2844);
    int _2860 = ~_2820;
    int _2862 = _2744 + _2860;
    int _2864 = _2862 + 1;
    float _2866 = in.m_62.w;
    uint _2868 = uint(int(uint(_2842) >> uint(31)));
    uint _2870 = uint(int(uint(_2834) >> uint(31)));
    int _2872 = ~_2762;
    int _2874 = _2872 + _2848;
    int _2876 = _2874 + 1;
    float _2878 = _880 * 2.0;
    float _2880 = as_type<float>(_2388);
    float _2882 = as_type<float>(_2826);
    float _2884 = as_type<float>(_2414);
    float _2886 = as_type<float>(_2724);
    float _2888 = _2768;
    if (!_2598)
    {
        _2880 = _878;
    }
    float _2890 = _2880;
    float _2892 = in.m_66.w;
    int _2894 = ~int(_2868);
    int _2896 = _2894 + 1;
    float _2898 = floor(_2878);
    int _2900 = ~int(_2870);
    int _2902 = _2900 + 1;
    int _2904 = _2060 * _2876;
    int _2906 = _2904 + _2438;
    float _2908 = _2890;
    float _2910 = as_type<float>(_2902);
    if (!_2598)
    {
        _2882 = _2890;
    }
    float _2912 = _2882;
    float _2914 = _2912;
    if (!_2598)
    {
        _2884 = _880;
    }
    float _2916 = _2884;
    float _2918 = _2916;
    if (!_2598)
    {
        _2886 = _880;
    }
    float _2920 = _2886;
    float _2922 = _2920;
    if (_2598)
    {
        _2914 = _876;
    }
    float _2924 = _2914;
    if (_2598)
    {
        _2908 = _876;
    }
    float _2926 = _2908;
    if (_2598)
    {
        _2918 = _878;
    }
    float _2928 = _2918;
    float _2930 = _2064 + _2866;
    float _2932 = _2930;
    if (_2598)
    {
        _2922 = _878;
    }
    float _2934 = _2922;
    float _2936 = _2924 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    bool _2938 = _2060 == 0;
    float _2940 = _2928 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    int _2942 = _2864 ^ _2896;
    int _2944 = _2856 ^ _2902;
    bool _2946 = !_2938;
    int _2948 = _2946 ? _2906 : (-1);
    int _2950 = ~_2896;
    int _2952 = _2950 + _2942;
    int _2954 = _2952 + 1;
    float _2956 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _2958 = _761 + _2956;
    bool _2960 = !_2850;
    int _2962 = _2960 ? 0 : (-1);
    int _2964 = ~_2902;
    int _2966 = _2964 + _2944;
    int _2968 = _2966 + 1;
    float _2970 = fma(_2562, _2958, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    bool _2972 = _761 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _2974 = isnan(_761);
    bool _2976 = _2972 || _2974;
    bool _2978 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _2980 = _2976 || _2978;
    float _2982 = float(_2980);
    bool _2984 = _2858 > 0.0;
    bool _2986 = _2858 >= 0.0;
    bool _2988 = isnan(_2858);
    bool _2990 = _2986 || _2988;
    bool _2992 = isnan(0.0);
    bool _2994 = _2990 || _2992;
    float _2996 = -_2982;
    float _2998 = _2996 + 1.0;
    float _3000 = as_type<float>(_2944);
    if (_2774)
    {
        _3000 = _876;
    }
    float _3002 = _3000;
    float _3004 = _3002;
    if (_2774)
    {
        _2910 = _878;
    }
    float _3006 = _2910;
    bool _3008 = _761 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _3010 = isnan(_761);
    bool _3012 = _3008 || _3010;
    bool _3014 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _3016 = _3012 || _3014;
    float _3018 = float(_3016);
    float _3020 = _3006;
    if (!_2774)
    {
        _3004 = _880;
    }
    float _3022 = _3004;
    if (!_2774)
    {
        _3020 = _876;
    }
    float _3024 = _3020;
    float _3026 = _3018 * _2998;
    bool _3028 = !_2832;
    int _3030 = _3028 ? _2968 : (-1);
    float _3032 = _3022 * (*spvDescriptorSet0.vp_c9)._m0[87].x;
    bool _3034 = !_2840;
    int _3036 = _3034 ? _2954 : (-1);
    float _3038 = _2970 * _3026;
    int _3040 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _3042 = _3040 != 0;
    int _3044 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _3046 = _3044 != 0;
    int _3048 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _3050 = _3048 != 0;
    float _3052 = -_3018;
    float _3054 = _3052 + 1.0;
    int _3056 = _2620 ? 0 : 1;
    float _3058 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    bool _3060 = _2898 > 0.0;
    bool _3062 = !_3046;
    int _3064 = _3062 ? 0 : 1;
    bool _3066 = _2898 >= 0.0;
    bool _3068 = isnan(_2898);
    bool _3070 = _3066 || _3068;
    bool _3072 = isnan(0.0);
    bool _3074 = _3070 || _3072;
    int _3076 = _2438 ^ _2060;
    float _3078 = fma(_3054, (*spvDescriptorSet0.vp_c9)._m0[131].x, _3038);
    int _3080 = _3074 ? 0 : 1;
    float _3082 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    uint _3084 = uint(int(uint(_3076) >> uint(31)));
    float _3086 = fma(_2982, (*spvDescriptorSet0.vp_c9)._m0[132].x, _3078);
    int _3088 = ~_2962;
    int _3090 = _2812 + _3088;
    int _3092 = _3090 + 1;
    float _3094 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _3096 = _2768 + _3094;
    bool _3098 = _2060 == 0;
    float _3100 = _2202 + _2892;
    int _3102 = ~_3080;
    int _3104 = _3102 + 1;
    int _3106 = _3104 + 1;
    float _3108 = _3058 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    int _3110 = _3106;
    if (!_3060)
    {
        int _3112 = ~_3080;
        int _3114 = _3112 + 1;
        _3110 = _3114;
    }
    int _3116 = _3110;
    float _3118 = _3096 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    int _3120 = ~int(_3084);
    int _3122 = _3120 + 1;
    float _3124 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _3126 = _2930 + _3124;
    float _3128 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _3130 = _3100 + _3128;
    int _3132 = _3092 ^ _3122;
    float _3134 = fma(_3126, (*spvDescriptorSet0.vp_c8)._m0[28].x, _3118);
    float _3136 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    int _3138 = ~_3122;
    int _3140 = _3138 + _3132;
    int _3142 = _3140 + 1;
    float _3144 = fma(_3130, (*spvDescriptorSet0.vp_c8)._m0[28].z, _3134);
    float _3146 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _3148 = float(_2838);
    float _3150 = (*spvDescriptorSet0.vp_c9)._m0[87].x + (*spvDescriptorSet0.vp_c9)._m0[86].z;
    bool _3152 = _3144 >= 0.0;
    float _3154 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _3156 = -_3150;
    float _3158 = fma(_3032, 2.0, _3156);
    float _3160 = float(_2796);
    float _3162 = fma(_2926, (*spvDescriptorSet0.vp_c9)._m0[83].z, _3154);
    float _3164 = float(_3030);
    float _3166 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _3168 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].z;
    float _3170 = fma(_3108, _3160, _2458);
    float _3172 = -_3166;
    float _3174 = fma(_2936, 2.0, _3172);
    float _3176 = fma(_2940, -2.0, _3136);
    float _3178 = _3024 * (*spvDescriptorSet0.vp_c9)._m0[87].y;
    float _3180 = _3146 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _3182 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _3184 = (*spvDescriptorSet0.vp_c9)._m0[87].y + (*spvDescriptorSet0.vp_c9)._m0[86].w;
    float _3186 = -_153;
    float _3188 = fma(_3186, (*spvDescriptorSet0.vp_c9)._m0[81].x, _3174);
    float _3190 = _3082 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    bool _3192 = !_3098;
    int _3194 = _3192 ? _3142 : (-1);
    float _3196 = fma(_3178, -2.0, _3184);
    float _3198 = fma(_3180, _3148, _3188);
    float _3200 = _2830 + 0.5;
    float _3202 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].w;
    float _3204 = float(_2948);
    float _3206 = _3168 * (*spvDescriptorSet0.vp_c9)._m0[90].x;
    float _3208 = -_153;
    float _3210 = fma(_3208, (*spvDescriptorSet0.vp_c9)._m0[86].x, _3158);
    float _3212 = fma(_3108, _3200, _3170);
    float _3214 = -_2506;
    float _3216 = fma(_3190, _3164, _3214);
    float _3218 = float(_3036);
    float _3220 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _3222 = _3182 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _3224 = fma(_153, (*spvDescriptorSet0.vp_c9)._m0[81].y, _3176);
    float _3226 = float(_3194);
    float _3228 = _2692 + (-0.5);
    float _3230 = fma(_153, (*spvDescriptorSet0.vp_c9)._m0[86].y, _3196);
    float _3232 = fma(_3206, _3204, _3210);
    float _3234 = fma(_2934, (*spvDescriptorSet0.vp_c9)._m0[83].w, _3220);
    float _3236 = -_3224;
    float _3238 = fma(_3222, _3218, _3236);
    float _3240 = _3202 * (*spvDescriptorSet0.vp_c9)._m0[90].y;
    float _3242 = -_3190;
    float _3244 = fma(_3242, _3228, _3216);
    float _3246 = _1288 + (-0.5);
    float _3248 = -_3230;
    float _3250 = fma(_3240, _3226, _3248);
    float _3252 = _1060 + (-0.5);
    float _3254 = -_3222;
    float _3256 = fma(_3254, _3246, _3238);
    float _3258 = _1074 + 0.5;
    float _3260 = -_3240;
    float _3262 = fma(_3260, _3252, _3250);
    float _3264 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _3266 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _3268 = fma(_3206, _3258, _3232);
    float _3270 = fma(_878, (*spvDescriptorSet0.vp_c9)._m0[78].w, _3264);
    float _3272 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _3274 = log2(_3272);
    float _3276 = fma(_876, (*spvDescriptorSet0.vp_c9)._m0[78].z, _3266);
    float _3278 = (*spvDescriptorSet0.vp_c9)._m0[88].z + (*spvDescriptorSet0.vp_c9)._m0[88].x;
    float _3280 = fma(_153, (*spvDescriptorSet0.vp_c9)._m0[77].w, _3270);
    float _3282 = fma(_153, (*spvDescriptorSet0.vp_c9)._m0[82].w, _3234);
    float _3284 = fma(_153, (*spvDescriptorSet0.vp_c9)._m0[77].z, _3276);
    float _3286 = fma(_876, (*spvDescriptorSet0.vp_c9)._m0[88].z, _3278);
    float _3288 = -_3280;
    float _3290 = _3288 + 1.0;
    float _3292 = _2738 + 0.5;
    float _3294 = -_3284;
    float _3296 = _3294 + 1.0;
    float _3298 = fma(_153, (*spvDescriptorSet0.vp_c9)._m0[87].z, _3286);
    float _3300 = fma(_2692, _3290, _3244);
    float _3302 = -_3296;
    float _3304 = fma(_2830, _3302, _3212);
    float _3306 = _3096 * _3096;
    float _3308 = -_3298;
    float _3310 = _3308 + 1.0;
    float _3312 = fma(_153, (*spvDescriptorSet0.vp_c9)._m0[82].z, _3162);
    float _3314 = (*spvDescriptorSet0.vp_c9)._m0[88].w + (*spvDescriptorSet0.vp_c9)._m0[88].y;
    float _3316 = fma(_3126, _3126, _3306);
    float _3318 = _3252;
    if (_3152)
    {
        _3318 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _3320 = _3318;
    float _3322 = -_3310;
    float _3324 = fma(_1074, _3322, _3268);
    float _3326 = fma(_878, (*spvDescriptorSet0.vp_c9)._m0[88].w, _3314);
    float _3328 = -_3282;
    float _3330 = _3328 + 1.0;
    float _3332 = fma(_3130, _3130, _3316);
    float _3334 = fma(_3180, _3292, _3198);
    float _3336 = fma(_153, (*spvDescriptorSet0.vp_c9)._m0[87].w, _3326);
    float _3338 = -_3312;
    float _3340 = _3338 + 1.0;
    float _3342 = _3274 * _153;
    float _3344 = fma(_1288, _3330, _3256);
    float _3346 = -_3336;
    float _3348 = _3346 + 1.0;
    int _3350 = as_type<int>(_3336);
    if (_3152)
    {
        float _3352 = _3320 * 5.0;
        _3350 = as_type<int>(_3352);
    }
    int _3354 = _3350;
    float _3356 = -_3340;
    float _3358 = fma(_2738, _3356, _3334);
    float _3360 = _3086 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _3362 = rsqrt(_3332);
    float _3364 = fma(_1060, _3348, _3262);
    float _3366 = _976 * (*spvDescriptorSet0.vp_c9)._m0[18].w;
    out.m_74.x = _3304;
    out.m_74.y = _3300;
    out.m_74.z = _3358;
    out.m_74.w = _3344;
    float _3368 = exp2(_3342);
    bool _3370 = !_3050;
    int _3372 = _3370 ? 0 : 1;
    float _3374 = in.m_76.x;
    float _3376 = in.m_76.y;
    float _3378 = in.m_76.z;
    bool _3380 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _3382 = isnan(1.0);
    bool _3384 = _3380 || _3382;
    bool _3386 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _3388 = _3384 || _3386;
    float _3390 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _3392 = 1.0 + _3390;
    float _3394 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _3396 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _3398 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _3400 = 1.0 / _3392;
    float _3402 = _3394 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _3404 = _3396 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _3406 = _3398 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    if (_3152)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _9969 = as_type<float>(_3354);
        out.gl_Position.z = _9969;
    }
    bool _3408 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _3410 = isnan(0.0);
    bool _3412 = _3408 || _3410;
    bool _3414 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _3416 = _3412 || _3414;
    float _3418 = float(_3116);
    out.m_78.x = _3402;
    out.m_78.y = _3404;
    out.m_78.z = _3406;
    out.m_78.w = _3360;
    float _3420 = -_3368;
    float _3422 = _3420 + 1.0;
    out.m_80.x = _3324;
    out.m_80.y = _3364;
    if (_3152)
    {
        out.m_53.x = 0.0;
    }
    int _3424 = ~_3056;
    int _3426 = _3424 + 1;
    int _3428 = _3426 + 1;
    bool _3430 = !_3042;
    int _3432 = _3430 ? 0 : 1;
    float _3434 = _3366 * _3362;
    float _3436 = _3126 * _3434;
    float _3438 = _3096 * _3434;
    float _3440 = _3130 * _3434;
    int _3442 = _3428;
    if (_3152)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_90.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_90.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_90.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_90.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_100.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_100.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_100.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_100.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_98.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_98.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_98.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_98.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_88.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_88.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_88.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_88.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_94.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_94.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_94.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_94.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_96.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_96.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_96.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_96.w)); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _3444 = -_3438;
    float _3446 = _2768 + _3444;
    float _3448 = -_3436;
    float _3450 = _2930 + _3448;
    int _3452 = abs(_3432);
    float _3454 = -_3440;
    float _3456 = _3100 + _3454;
    float _3458 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _3460 = _3446 + _3458;
    float _3462 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _3464 = _3450 + _3462;
    float _3466 = -_3438;
    float _3468 = _3096 + _3466;
    float _3470 = float(_3452);
    float _3472 = _3460 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _3474 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _3476 = _3456 + _3474;
    float _3478 = -_3436;
    float _3480 = _3126 + _3478;
    float _3482 = _3468 * _3468;
    float _3484 = fma(_3464, (*spvDescriptorSet0.vp_c8)._m0[28].x, _3472);
    float _3486 = _3470 * _3418;
    float _3488 = _3446;
    if (!_2608)
    {
        int _3490 = ~_3056;
        int _3492 = _3490 + 1;
        _3442 = _3492;
    }
    int _3494 = _3442;
    float _3496 = fma(_3480, _3480, _3482);
    float _3498 = fma(_3476, (*spvDescriptorSet0.vp_c8)._m0[28].z, _3484);
    float _3500 = _3486 * (-2.0);
    int _3502 = abs(_3064);
    float _3504 = _876 + (-0.5);
    float _3506 = _3416 ? _3422 : 0.0;
    float _3508 = fma(_3500, _3374, _3374);
    bool _3510 = _3498 >= 0.0;
    float _3512 = fma(_2594, _3500, _2594);
    float _3514 = float(_3494);
    float _3516 = _3514;
    if (_3388)
    {
        float _3518 = _3506 * _3400;
        _155 = _3518;
    }
    float _3520 = _155;
    float _3522 = float(_3502);
    float _3524 = fma(_3504, (*spvDescriptorSet0.vp_c9)._m0[196].x, _3508);
    float _3526 = -_3440;
    float _3528 = _3130 + _3526;
    int _3530 = _2994 ? 0 : 1;
    float _3532 = _3522 * _3514;
    float _3534 = fma(_3512, _3520, _3524);
    float _3536 = fma(_3528, _3528, _3496);
    int _3538 = ~_3530;
    int _3540 = _3538 + 1;
    int _3542 = _3540 + 1;
    float _3544 = _3532 * (-2.0);
    float _3546 = _3534 * 0.15915493667125701904296875;
    int _3548 = _3542;
    if (_3510)
    {
        _3516 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _3550 = _3516;
    float _3552 = fma(_2650, _3544, _2650);
    float _3554 = fma(_3544, _3376, _3376);
    float _3556 = _878 + (-0.5);
    float _3558 = sqrt(_3536);
    int _3560 = as_type<int>(_3550);
    if (_3510)
    {
        float _3562 = _3550 * 5.0;
        _3560 = as_type<int>(_3562);
    }
    int _3564 = _3560;
    if (_3510)
    {
        out.m_53.x = 0.0;
    }
    if (!_2984)
    {
        int _3566 = ~_3530;
        int _3568 = _3566 + 1;
        _3548 = _3568;
    }
    int _3570 = _3548;
    int _3572 = abs(_3372);
    if (_3510)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _10232 = as_type<float>(_3564);
        out.gl_Position.z = _10232;
    }
    float _3574 = _3546 * 6.283185482025146484375;
    float _3576 = sin(_3574);
    if (_3510)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_90.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_90.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_90.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_90.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_100.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_100.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_100.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_100.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_98.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_98.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_98.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_98.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_88.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_88.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_88.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_88.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_94.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_94.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_94.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_94.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_96.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_96.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_96.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_96.w)); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _3578 = -_2768;
    float _3580 = _3578 + (*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _3582 = float(_3570);
    float _3584 = -_2930;
    float _3586 = _3584 + (*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _3588 = -_3100;
    float _3590 = _3588 + (*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _3592 = _3580 * _3580;
    float _3594 = fma(_3556, (*spvDescriptorSet0.vp_c9)._m0[196].y, _3554);
    float _3596 = _876 + _880;
    float _3598 = fma(_3586, _3586, _3592);
    float _3600 = float(_3572);
    float _3602 = fma(_3552, _3520, _3594);
    float _3604 = fma(_3590, _3590, _3598);
    float _3606 = _3596 + (-1.0);
    float _3608 = _3600 * _3582;
    float _3610 = _3602 * 0.15915493667125701904296875;
    float _3612 = _880 + (-0.5);
    float _3614 = fma(_3606, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _3616 = rsqrt(_3604);
    float _3618 = _3608 * (-2.0);
    float _3620 = _3362 * _3558;
    float _3622 = _717 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _3624 = fma(_3618, _3378, _3378);
    float _3626 = fma(_3614, _3618, _3614);
    float _3628 = _3546 * 6.283185482025146484375;
    float _3630 = cos(_3628);
    float _3632 = fma(_3612, (*spvDescriptorSet0.vp_c9)._m0[196].z, _3624);
    float _3634 = fma(_3626, _3520, _3632);
    float _3636 = _3586 * _3616;
    float _3638 = _3590 * _3616;
    float _3640 = _3634 * 0.15915493667125701904296875;
    float _3642 = _3580 * _3616;
    float _3644 = -(*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _3646 = _3636 * _3644;
    float _3648 = -(*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _3650 = _3638 * _3648;
    float _3652 = _3610 * 6.283185482025146484375;
    float _3654 = sin(_3652);
    float _3656 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _217);
    float _3658 = -(*spvDescriptorSet0.vp_c8)._m0[1].x;
    float _3660 = -_3646;
    float _3662 = fma(_3638, _3658, _3660);
    float _3664 = -(*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _3666 = -_3650;
    float _3668 = fma(_3642, _3664, _3666);
    float _3670 = -(*spvDescriptorSet0.vp_c8)._m0[1].x;
    float _3672 = _3642 * _3670;
    float _3674 = _3662 * _3662;
    float _3676 = _3610 * 6.283185482025146484375;
    float _3678 = cos(_3676);
    float _3680 = -(*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _3682 = -_3672;
    float _3684 = fma(_3636, _3680, _3682);
    float _3686 = fma(_3668, _3668, _3674);
    float _3688 = fma(_3684, _3684, _3686);
    float _3690 = _3640 * 6.283185482025146484375;
    float _3692 = cos(_3690);
    float _3694 = _3576 * _3654;
    float _3696 = _3640 * 6.283185482025146484375;
    float _3698 = sin(_3696);
    float _3700 = _3630 * _3678;
    float _3702 = _3576 * _3678;
    float _3704 = rsqrt(_3688);
    float _3706 = _3678 * _3692;
    float _3708 = _3620 * _3622;
    float _3710 = _3630 * _3692;
    float _3712 = _3576 * _3692;
    float _3714 = _3654 * _3692;
    float _3716 = _3656 * _3708;
    float _3718 = fma(_3698, _3700, _3694);
    float _3720 = fma(_3698, _3694, _3700);
    float _3722 = _3630 * _3654;
    float _3724 = _976 * _3620;
    float _3726 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _213);
    float _3728 = _3710 * _3716;
    float _3730 = -_3722;
    float _3732 = fma(_3698, _3702, _3730);
    float _3734 = -_3702;
    float _3736 = fma(_3698, _3722, _3734);
    float _3738 = _3726 * _3724;
    float _3740 = _3668 * _3704;
    float _3742 = _3662 * _3704;
    float _3744 = _3620 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _3746 = _3744 * 0.5;
    float _3748 = fma(_3718, _3738, _3728);
    float _3750 = _3684 * _3704;
    float _3752 = -_3716;
    float _3754 = _3698 * _3752;
    float _3756 = _3638 * _3742;
    float _3758 = _3642 * _3740;
    float _3760 = fma(_3736, _3746, _3748);
    float _3762 = _3712 * _3716;
    float _3764 = fma(_3706, _3738, _3754);
    float _3766 = -_3756;
    float _3768 = fma(_3642, _3750, _3766);
    float _3770 = -_3758;
    float _3772 = fma(_3636, _3742, _3770);
    float _3774 = fma(_3732, _3738, _3762);
    float _3776 = fma(_3714, _3746, _3764);
    float _3778 = _3768 * _3760;
    float _3780 = _3772 * _3760;
    float _3782 = fma(_3720, _3746, _3774);
    float _3784 = _3636 * _3750;
    float _3786 = fma(_3740, _3776, _3778);
    float _3788 = fma(_3750, _3776, _3780);
    float _3790 = -_3784;
    float _3792 = fma(_3638, _3740, _3790);
    float _3794 = fma(_3636, _3782, _3786);
    float _3796 = fma(_3638, _3782, _3788);
    float _3798 = _3792 * _3760;
    float _3800 = _2930 + _3794;
    float _3802 = _3100 + _3796;
    float _3804 = fma(_3742, _3776, _3798);
    float _3806 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _3808 = _3800 + _3806;
    float _3810 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _3812 = _3802 + _3810;
    float _3814 = fma(_3642, _3782, _3804);
    float _3816 = _3808 * _3808;
    float _3818 = _3812 * _3812;
    float _3820 = _2768 + _3814;
    float _3822 = _3816 + _3818;
    float _3824 = sqrt(_3822);
    bool _3826 = _3824 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _3828 = _3794;
    float _3830 = _3800;
    float _3832 = _3802;
    float _3834 = _3816;
    float _3836 = _3818;
    if (!_3826)
    {
        _3828 = _3820;
    }
    float _3838 = _3828;
    bool _3840 = !_3826;
    float _3842 = _3838;
    if (!_3840)
    {
        float _3844 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _3846 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _3848 = _3824 + _3846;
        float _3850 = rsqrt(_3822);
        float _3852 = _3848 * _3844;
        float _3854 = _3820 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _3856 = _3852 * 0.15915493667125701904296875;
        float _3858 = _3856 * 6.283185482025146484375;
        float _3860 = sin(_3858);
        float _3862 = _3856 * 6.283185482025146484375;
        float _3864 = cos(_3862);
        float _3866 = fma(_3860, _3854, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _3868 = _3850 * _3866;
        float _3870 = _3864 + (-1.0);
        float _3872 = fma(_3808, _3868, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _3874 = fma(_3812, _3868, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _3876 = _3870 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _3878 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _3880 = _3872 + _3878;
        float _3882 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _3884 = _3874 + _3882;
        float _3886 = fma(_3820, _3864, _3876);
        float _3888 = _3880 * _3880;
        float _3890 = _3884 * _3884;
        _3830 = _3872;
        _3832 = _3874;
        _3842 = _3886;
        _3834 = _3888;
        _3836 = _3890;
    }
    float _3892 = _3830;
    float _3894 = _3832;
    float _3896 = _3842;
    float _3898 = _3834;
    float _3900 = _3836;
    float _3902 = fma(_3892, 6.2500002968590706586837768554688e-05, 0.5);
    float _3904 = fma(_3894, 6.2500002968590706586837768554688e-05, 0.5);
    float2 _10740 = float2(_3902, _3904);
    float3 _3908 = dm_bs(spvDescriptorSet0.vp_t_tcb_20.sample(spvDescriptorSet0.vp_t_tcb_20Smplr, select(_10740, float2(0.0), isnan(_10740)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_20, spvDescriptorSet0.vp_t_tcb_20Smplr_w, select(_10740, float2(0.0), isnan(_10740)), level(0.0)).xyz;
    float _3910 = _3908.x;
    float _3912 = _3908.y;
    float _3914 = _3908.z;
    float _3916 = _217 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _3918 = _3710 * _3768;
    float _3920 = _3710 * _3792;
    float _3922 = _3710 * _3772;
    float _3924 = fma(_3916, _3916, 1.0);
    float _3926 = _3718 * _3792;
    float _3928 = _3736 * _3792;
    float _3930 = -_3698;
    float _3932 = fma(_3930, _3742, _3920);
    float _3934 = _3718 * _3768;
    float _3936 = fma(_3706, _3742, _3926);
    float _3938 = rsqrt(_3924);
    float _3940 = fma(_3714, _3742, _3928);
    float _3942 = _3718 * _3772;
    float _3944 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _3946 = _3896 + _3944;
    float _3948 = _3736 * _3768;
    float _3950 = _3736 * _3772;
    float _3952 = -_3698;
    float _3954 = fma(_3952, _3740, _3918);
    float _3956 = fma(_3706, _3740, _3934);
    float _3958 = fma(_3706, _3750, _3942);
    float _3960 = -_3698;
    float _3962 = fma(_3960, _3750, _3922);
    float _3964 = fma(_3946, _3946, _3898);
    float _3966 = fma(_3714, _3740, _3948);
    float _3968 = fma(_3714, _3750, _3950);
    float _3970 = fma(_3712, _3636, _3954);
    float _3972 = fma(_3712, _3642, _3932);
    float _3974 = fma(_3712, _3638, _3962);
    float _3976 = _3964 + _3900;
    float _3978 = fma(_3720, _3636, _3966);
    float _3980 = _3916 * _3938;
    float _3982 = fma(_3720, _3642, _3940);
    float _3984 = fma(_3720, _3638, _3968);
    float _3986 = fma(_3732, _3636, _3956);
    float _3988 = _213 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _3990 = _3916 * _3970;
    float _3992 = _3916 * _3972;
    float _3994 = fma(_3732, _3642, _3936);
    float _3996 = fma(_3732, _3638, _3958);
    float _3998 = _3916 * _3974;
    float _4000 = -_3978;
    float _4002 = _3980 * _4000;
    float _4004 = -_3982;
    float _4006 = _3980 * _4004;
    float _4008 = -_3984;
    float _4010 = _3980 * _4008;
    float _4012 = sqrt(_3976);
    float _4014 = fma(_3988, _3986, _3990);
    float _4016 = fma(_3988, _3994, _3992);
    float _4018 = fma(_3988, _3996, _3998);
    float _4020 = fma(_3938, _3970, _4002);
    float _4022 = fma(_3938, _3972, _4006);
    float _4024 = fma(_3938, _3974, _4010);
    float _4026 = _3978 + _4014;
    float _4028 = _3982 + _4016;
    float _4030 = _3984 + _4018;
    out.m_82.x = _3986;
    out.m_82.y = _3994;
    out.m_82.z = _3996;
    out.m_84.x = _4020;
    out.m_84.y = _4022;
    out.m_84.z = _4024;
    bool _4032 = _4012 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _4034 = isnan(_4012);
    bool _4036 = _4032 || _4034;
    bool _4038 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _4040 = _4036 || _4038;
    out.m_86.x = _4026;
    out.m_86.y = _4028;
    out.m_86.z = _4030;
    float _4042 = _4014;
    if (!_4040)
    {
        _4042 = 1.0;
    }
    float _4044 = _4042;
    out.m_88.x = _3910;
    out.m_88.y = _3912;
    out.m_88.z = _3914;
    bool _4046 = !_4040;
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
    float _4110 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _4112 = _3896 + _4110;
    float _4114 = _3446 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _4116 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _4118 = _3892 + _4116;
    float _4120 = fma(_4112, _4108, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _4122 = fma(_3450, (*spvDescriptorSet0.vp_c8)._m0[11].x, _4114);
    float _4124 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _4126 = _3894 + _4124;
    float _4128 = fma(_4118, _4108, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _4130 = -_2768;
    float _4132 = _4130 + _4120;
    float _4134 = fma(_3456, (*spvDescriptorSet0.vp_c8)._m0[11].z, _4122);
    float _4136 = fma(_4126, _4108, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _4138 = -_2930;
    float _4140 = _4138 + _4128;
    float _4142 = _4132 * _4132;
    float _4144 = _4134 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _4146 = _3446 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _4148 = -_3100;
    float _4150 = _4148 + _4136;
    float _4152 = fma(_4140, _4140, _4142);
    float _4154 = 1.0 / _4144;
    float _4156 = fma(_3450, (*spvDescriptorSet0.vp_c8)._m0[10].x, _4146);
    float _4158 = fma(_4150, _4150, _4152);
    float _4160 = fma(_3456, (*spvDescriptorSet0.vp_c8)._m0[10].z, _4156);
    float _4162 = sqrt(_4158);
    float _4164 = _4160 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _4166 = _4164 + _4144;
    float _4168 = _4166 * _4154;
    float _4170 = _4168 * 0.5;
    bool _4172 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _4174 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _4176 = _4172 || _4174;
    bool _4178 = isnan(0.5);
    bool _4180 = _4176 || _4178;
    float _4182 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _4184 = fma(_4170, (*spvDescriptorSet0.vp_c8)._m0[30].w, _4182);
    bool _4186 = _4162 > 0.0;
    float _4188 = 1.0 / _4184;
    bool _4190 = (*spvDescriptorSet0.vp_c15)._m0[660].y >= 0.5;
    bool _4192 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _4194 = _4190 || _4192;
    bool _4196 = isnan(0.5);
    bool _4198 = _4194 || _4196;
    float _4200 = (*spvDescriptorSet0.vp_c8)._m0[30].w;
    float _4202 = _4134;
    float _4204 = _4128;
    float _4206 = (*spvDescriptorSet0.vp_c15)._m0[660].y;
    if (!_4186)
    {
        _4200 = _4120;
    }
    float _4208 = _4200;
    float _4210 = _4208;
    float _4212 = _4208;
    if (!_4186)
    {
        _4202 = _4136;
    }
    float _4214 = _4202;
    bool _4216 = !_4186;
    float _4218 = _4214;
    float _4220 = _4214;
    if (!_4216)
    {
        float _4222 = _233 * _233;
        float _4224 = fma(_229, _229, _4222);
        float _4226 = fma(_235, _235, _4224);
        float _4228 = rsqrt(_4158);
        float _4230 = sqrt(_4226);
        float _4232 = _4140 * _4228;
        float _4234 = _4132 * _4228;
        float _4236 = _4150 * _4228;
        bool _4238 = _4230 > 0.0;
        _4206 = _4228;
        if (!_4238)
        {
            _4210 = _4120;
        }
        float _4240 = _4210;
        _4212 = _4240;
        if (!_4238)
        {
            _4218 = _4136;
        }
        float _4242 = _4218;
        bool _4244 = !_4238;
        _4220 = _4242;
        if (!_4244)
        {
            float _4246 = rsqrt(_4226);
            float _4248 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].z;
            float _4250 = _233 * _4246;
            float _4252 = _229 * _4246;
            float _4254 = _235 * _4246;
            float _4256 = _4234 * _4250;
            float _4258 = fma(_4232, _4252, _4256);
            float _4260 = _4248 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _4262 = fma(_4236, _4254, _4258);
            float _4264 = _4262 * _4260;
            float _4266 = fma(_229, _4264, _4128);
            float _4268 = fma(_233, _4264, _4120);
            float _4270 = fma(_235, _4264, _4136);
            _4204 = _4266;
            _4212 = _4268;
            _4220 = _4270;
            _4206 = _4264;
        }
    }
    float _4272 = _4204;
    float _4274 = _4212;
    float _4276 = _4220;
    float _4278 = _4206;
    float _4280 = -_3436;
    float _4282 = _4280 + _4272;
    float _4284 = -_3438;
    float _4286 = _4284 + _4274;
    float _4288 = -_3440;
    float _4290 = _4288 + _4276;
    float _4292 = _4278;
    float _4294 = _4286;
    float _4296 = _4282;
    float _4298 = _4290;
    if (_4180)
    {
        _4292 = 1.0;
    }
    float _4300 = _4292;
    float _4302 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _4304 = _4188 * _4302;
    float _4306 = _4300;
    if (!_4198)
    {
        float _4308 = _3460 * _3460;
        float _4310 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _4312 = -_3100;
        float _4314 = _4312 + _4276;
        float _4316 = -_2768;
        float _4318 = _4316 + _4274;
        float _4320 = fma(_3464, _3464, _4308);
        float _4322 = fma(_3476, _3476, _4320);
        float _4324 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _4326 = sqrt(_4322);
        float _4328 = 1.0 / _3620;
        float _4330 = _4324 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _4332 = precise::min(_4326, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _4334 = _4332 * _4310;
        float _4336 = _4334 * _4328;
        float _4338 = -_2930;
        float _4340 = _4338 + _4272;
        float _4342 = _4330 * _4336;
        float _4344 = _4314 * _4336;
        float _4346 = fma(_4318, _4342, _3446);
        float _4348 = fma(_4340, _4342, _3450);
        float _4350 = fma(_4330, _4344, _3456);
        _4294 = _4346;
        _4296 = _4348;
        _4298 = _4350;
        _2888 = _4318;
    }
    float _4352 = _4294;
    float _4354 = _4296;
    float _4356 = _4298;
    float _4358 = _2888;
    float _4360 = _4358;
    if (!_4180)
    {
        float _4362 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _4364 = _4362 * 0.15915493667125701904296875;
        float _4366 = _4364 * 6.283185482025146484375;
        float _4368 = cos(_4366);
        float _4370 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _4372 = _4370 * 0.15915493667125701904296875;
        float _4374 = _4364 * 6.283185482025146484375;
        float _4376 = sin(_4374);
        float _4378 = 1.0 / _4368;
        float _4380 = _4372 * 6.283185482025146484375;
        float _4382 = cos(_4380);
        float _4384 = _4376 * _4378;
        float _4386 = _4372 * 6.283185482025146484375;
        float _4388 = sin(_4386);
        float _4390 = _4382 * _4384;
        float _4392 = 1.0 / _4390;
        float _4394 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _4396 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _4394;
        float _4398 = 1.0 / _4396;
        float _4400 = _4388 * _4392;
        float _4402 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _4404 = fma(_4304, _4400, _4402);
        float _4406 = _4404 * _4398;
        float _4408 = precise::clamp(_4406, 0.0, 1.0);
        _2932 = _4364;
        _4306 = _4408;
    }
    float _4410 = _2932;
    float _4412 = _4306;
    float _4414 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _4416 = _4352 + _4414;
    float _4418 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _4420 = _4354 + _4418;
    float _4422 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _4424 = _4356 + _4422;
    float _4426 = _4416 * _4416;
    float _4428 = fma(_4420, _4420, _4426);
    float _4430 = fma(_3450, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _4432 = fma(_4424, _4424, _4428);
    float _4434 = fma(_3456, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _4436 = rsqrt(_4432);
    float _4438 = sqrt(_4432);
    float _4440 = _4436 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _4442 = _4420 * _4440;
    float _4444 = _4424 * _4440;
    float _4446 = _4442 * _4442;
    float _4448 = _4444 * _4444;
    float _4450 = _4446 + _4448;
    float _4452 = sqrt(_4450);
    bool _4454 = _4452 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _4456 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _4458 = _4452 + _4456;
    float _4460 = _4436;
    float _4462 = _4410;
    float _4464 = _4458;
    float _4466 = _4416;
    if (_4454)
    {
        float _4468 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _4460 = _4468;
    }
    float _4470 = _4460;
    if (_4454)
    {
        float _4472 = rsqrt(_4450);
        _4462 = _4472;
    }
    float _4474 = _4462;
    float _4476 = _4474;
    if (_4454)
    {
        float _4478 = _4458 * _4470;
        _4464 = _4478;
    }
    float _4480 = _4464;
    if (_4454)
    {
        float _4482 = _4480 * 0.15915493667125701904296875;
        _3488 = _4482;
    }
    float _4484 = _3488;
    float _4486 = _4470;
    float _4488 = _4484;
    if (_4454)
    {
        float _4490 = _4484 * 6.283185482025146484375;
        float _4492 = sin(_4490);
        _4486 = _4492;
    }
    float _4494 = _4486;
    float _4496 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _4498 = precise::max(0.0, _4496);
    float _4500 = _4424;
    float _4502 = _4498;
    if (_4454)
    {
        float _4504 = _4484 * 6.283185482025146484375;
        float _4506 = cos(_4504);
        _4500 = _4506;
    }
    float _4508 = _4500;
    float _4510 = -_4440;
    float _4512 = -_4498;
    float _4514 = fma(_4416, _4510, _4512);
    if (!_4454)
    {
        _4466 = _4444;
    }
    float _4516 = _4466;
    float _4518 = _4516;
    if (_4454)
    {
        float _4520 = _4514 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _4502 = _4520;
    }
    float _4522 = _4502;
    float _4524 = _4494;
    float _4526 = _4522;
    if (_4454)
    {
        float _4528 = fma(_4494, _4522, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _4360 = _4528;
    }
    float _4530 = _4360;
    float _4532 = _4530;
    if (!_4454)
    {
        _4524 = _4514;
    }
    float _4534 = _4524;
    float _4536 = _4534;
    float _4538 = _4508;
    if (_4454)
    {
        float _4540 = _4508 + (-1.0);
        _4526 = _4540;
    }
    float _4542 = _4526;
    float _4544 = _4542;
    if (_4454)
    {
        float _4546 = _4474 * _4530;
        _4532 = _4546;
    }
    float _4548 = _4532;
    if (!_4454)
    {
        _4476 = _4442;
    }
    float _4550 = _4476;
    float _4552 = _4550;
    if (_4454)
    {
        float _4554 = _4542 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _4488 = _4554;
    }
    float _4556 = _4488;
    if (_4454)
    {
        float _4558 = _4442 * _4548;
        _4552 = _4558;
    }
    float _4560 = _4552;
    if (!_4454)
    {
        _4544 = _4446;
    }
    float _4562 = _4544;
    float _4564 = _4562;
    if (_4454)
    {
        float _4566 = _4444 * _4548;
        _4518 = _4566;
    }
    float _4568 = _4518;
    if (_4454)
    {
        float _4570 = fma(_4514, _4508, _4556);
        _4536 = _4570;
    }
    float _4572 = _4536;
    if (_4454)
    {
        float _4574 = _4560 * _4560;
        _4564 = _4574;
    }
    float _4576 = _4564;
    float _4578 = _4352 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    if (!_4454)
    {
        _4538 = _4448;
    }
    float _4580 = _4538;
    float _4582 = _4580;
    if (_4454)
    {
        float _4584 = _4568 * _4568;
        _4582 = _4584;
    }
    float _4586 = _4582;
    float _4588 = fma(_4572, _4572, _4576);
    float _4590 = fma(_4354, (*spvDescriptorSet0.vp_c8)._m0[2].x, _4578);
    float _4592 = floor(_4430);
    float _4594 = _4588 + _4586;
    float _4596 = fma(_4356, (*spvDescriptorSet0.vp_c8)._m0[2].z, _4590);
    float _4598 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _4600 = _4596 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _4602 = rsqrt(_4594);
    float _4604 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _4606 = fma(_4438, (*spvDescriptorSet0.vp_c15)._m0[23].w, _4604);
    float _4608 = precise::clamp(_4606, 0.0, 1.0);
    float _4610 = _4600 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _4612 = _4352 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _4614 = -_4608;
    float _4616 = _4614 + 1.0;
    float _4618 = -_4610;
    float _4620 = fma(_4618, _4598, 1.0);
    float _4622 = _4352 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _4624 = floor(_4434);
    float _4626 = _4352 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _4628 = -_4592;
    float _4630 = _4430 + _4628;
    float _4632 = fma(_4354, (*spvDescriptorSet0.vp_c8)._m0[0].x, _4622);
    float _4634 = fma(_4354, (*spvDescriptorSet0.vp_c8)._m0[1].x, _4626);
    float _4636 = fma(_4356, (*spvDescriptorSet0.vp_c8)._m0[0].z, _4632);
    float _4638 = abs(_4616);
    float _4640 = log2(_4638);
    float _4642 = fma(_4356, (*spvDescriptorSet0.vp_c8)._m0[1].z, _4634);
    float _4644 = _4602 * _4560;
    float _4646 = _4602 * _4572;
    float _4648 = _4602 * _4568;
    float _4650 = _4642 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _4652 = _4644 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _4654 = fma(_4354, (*spvDescriptorSet0.vp_c8)._m0[3].x, _4612);
    float _4656 = _4636 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _4658 = _4650 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _4660 = -_4652;
    float _4662 = fma(_4646, (*spvDescriptorSet0.vp_c15)._m0[21].y, _4660);
    float _4664 = fma(_4356, (*spvDescriptorSet0.vp_c8)._m0[3].z, _4654);
    float _4666 = log2(_4620);
    float _4668 = fma(_4656, (*spvDescriptorSet0.vp_c8)._m0[7].x, _4658);
    float _4670 = -_4648;
    float _4672 = fma(_4670, (*spvDescriptorSet0.vp_c15)._m0[21].z, _4662);
    float _4674 = _4664 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _4676 = _4640 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _4678 = fma(_4600, (*spvDescriptorSet0.vp_c8)._m0[7].z, _4668);
    float _4680 = fma(_4672, -0.5, 0.5);
    float _4682 = fma(_4672, 0.5, 0.5);
    float _4684 = exp2(_4676);
    float _4686 = fma(_4674, (*spvDescriptorSet0.vp_c8)._m0[7].w, _4678);
    float _4688 = _4650 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _4690 = _4650 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _4692 = -_4624;
    float _4694 = _4434 + _4692;
    float _4696 = fma(_4682, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _4698 = fma(_4656, (*spvDescriptorSet0.vp_c8)._m0[4].x, _4688);
    float _4700 = fma(_4656, (*spvDescriptorSet0.vp_c8)._m0[5].x, _4690);
    float _4702 = 1.0 / _4686;
    float _4704 = _4646 + 1.0;
    float _4706 = fma(_4600, (*spvDescriptorSet0.vp_c8)._m0[4].z, _4698);
    float _4708 = fma(_4682, _4696, -0.212114393711090087890625);
    float _4710 = _4666 * 0.693147182464599609375;
    float _4712 = fma(_4674, (*spvDescriptorSet0.vp_c8)._m0[4].w, _4706);
    float _4714 = sqrt(_4680);
    float _4716 = -_4646;
    float _4718 = fma(_4684, _4704, _4716);
    float2 _12076 = float2(_4630, _4694);
    float _4720 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_12076, float2(0.0), isnan(_12076)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_12076, float2(0.0), isnan(_12076)), level(0.0)).x;
    float _4722 = fma(_4682, _4708, 1.570728778839111328125);
    float _4724 = fma(_4718, 0.5, 0.5);
    float _4726 = fma(_4600, (*spvDescriptorSet0.vp_c8)._m0[5].z, _4700);
    float _4728 = _4712 * _4702;
    float _4730 = fma(_4674, (*spvDescriptorSet0.vp_c8)._m0[5].w, _4726);
    float _4732 = fma(_4728, 0.5, 0.5);
    float _4734 = _4714 * 0.636619746685028076171875;
    float _4736 = _4730 * _4702;
    float _4738 = _4710 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _4740 = -_4722;
    float _4742 = fma(_4734, _4740, 1.0);
    float _4744 = fma(_4736, -0.5, 0.5);
    float3 _12123 = float3(_4732, _4744, _4738);
    float _4746 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_12123, float3(0.0), isnan(_12123)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_12123, float3(0.0), isnan(_12123)), level(0.0)).x;
    float3 _12134 = float3(_4732, _4744, _4738);
    float4 _4749 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_12134, float3(0.0), isnan(_12134)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_12134, float3(0.0), isnan(_12134)), level(0.0)).xyzw;
    float _4751 = _4749.x;
    float _4753 = _4749.y;
    float _4755 = _4749.z;
    float _4757 = _4749.w;
    float2 _12150 = float2(_4742, _4724);
    float3 _4759 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_12150, float2(0.0), isnan(_12150)), level(0.0)), spvDescriptorSet0.dm_border, 4u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_12150, float2(0.0), isnan(_12150)), level(0.0)).xyz;
    float _4761 = _4759.x;
    float _4763 = _4759.y;
    float _4765 = _4759.z;
    float _4767 = abs(_4304);
    float _4769 = log2(_4767);
    float _4771 = _4650 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    bool _4773 = _4438 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _4775 = isnan(_4438);
    bool _4777 = _4773 || _4775;
    bool _4779 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _4781 = _4777 || _4779;
    float _4783 = fma(_4656, (*spvDescriptorSet0.vp_c8)._m0[6].x, _4771);
    float _4785 = _4640 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    bool _4787 = _4304 <= 8000.0;
    bool _4789 = isnan(_4304);
    bool _4791 = _4787 || _4789;
    bool _4793 = isnan(8000.0);
    bool _4795 = _4791 || _4793;
    float _4797 = float(_4795);
    float _4799 = fma(_4600, (*spvDescriptorSet0.vp_c8)._m0[6].z, _4783);
    float _4801 = fma(_4674, (*spvDescriptorSet0.vp_c8)._m0[6].w, _4799);
    float _4803 = _4769 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _4805 = _4801 + _4686;
    out.gl_Position.x = _4712;
    out.gl_Position.y = _4730;
    out.gl_Position.z = _4801;
    out.gl_Position.w = _4686;
    float _4807 = exp2(_4803);
    float _4809 = _4805 * 0.5;
    float _4811 = _4801;
    float _4813 = _4730;
    float _4815 = _4686;
    if (!_4781)
    {
        _4811 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _4817 = _4811;
    float _4819 = _4817;
    float _4821 = _4817;
    if (!_4781)
    {
        _4813 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _4823 = _4813;
    float _4825 = fma(_4807, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _4827 = precise::clamp(_4825, 0.0, 1.0);
    float _4829 = _4823;
    float _4831 = _4823;
    if (!_4781)
    {
        _4815 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _4833 = _4815;
    float _4835 = fma(_4827, -2.0, 3.0);
    float _4837 = _4827 * _4827;
    out.m_90.z = _4809;
    out.m_90.w = _4686;
    float _4839 = _4837 * _4835;
    float _4841 = exp2(_4785);
    float _4843 = -_4839;
    float _4845 = _4843 + 1.0;
    float _4847 = fma(_4845, (*spvDescriptorSet0.vp_c15)._m0[654].w, _4839);
    float _4849 = in.m_92.x;
    float _4851 = _4797 * _4847;
    float _4853 = _4851 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _4855 = -_4841;
    float _4857 = _4855 + 1.0;
    float _4859 = _4857 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _4861 = -_4859;
    float _4863 = _4861 + 1.0;
    float _4865 = -_4720;
    float _4867 = _4865 + 1.0;
    float _4869 = _4867 * _4853;
    float _4871 = precise::clamp(_4869, 0.0, 1.0);
    float _4873 = -_4871;
    float _4875 = fma(_4873, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _4877 = _4875 * _4849;
    float _4879 = _4877 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _4881 = _4877;
    float _4883 = _4863;
    float _4885 = _4833;
    float _4887 = _4833;
    if (!_4781)
    {
        _4881 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _4889 = _4881;
    out.m_94.x = _4879;
    float _4891 = _4859 * _4746;
    float _4893 = _4757 * _4891;
    float _4895 = _4765 * _4891;
    float _4897 = _4757 * _4863;
    float _4899 = _4893;
    float _4901 = _4889;
    float _4903 = _4889;
    if (!_4781)
    {
        _4883 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _4905 = _4883;
    float _4907 = fma(_4761, _4893, _4751);
    float _4909 = fma(_4763, _4893, _4753);
    float _4911 = fma(_4757, _4895, _4755);
    float _4913 = _4412 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _4915 = _4905;
    float _4917 = _4905;
    if (!_4781)
    {
        _4899 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _4919 = _4899;
    out.m_96.x = _4907;
    out.m_96.y = _4909;
    out.m_96.z = _4911;
    out.m_96.w = _4897;
    bool _4921 = !_4781;
    float _4923 = _4919;
    float _4925 = _4919;
    if (!_4921)
    {
        bool _4927 = _4438 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _4929 = isnan(_4438);
        bool _4931 = _4927 || _4929;
        bool _4933 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _4935 = _4931 || _4933;
        if (!_4935)
        {
            float _4937 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _4939 = _4438 + _4937;
            float _4941 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _4943 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _4941;
            float _4945 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _4947 = _4945 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _4949 = 1.0 / _4943;
            float _4951 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _4953 = _4951 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _4955 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _4957 = _4955 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _4959 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _4961 = _4959 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _4963 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _4965 = _4963 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _4967 = _4939 * _4949;
            float _4969 = precise::clamp(_4967, 0.0, 1.0);
            float _4971 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _4973 = _4971 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _4975 = fma(_4969, _4947, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _4977 = fma(_4969, _4973, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _4979 = fma(_4969, _4953, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _4981 = fma(_4969, _4957, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _4983 = fma(_4969, _4961, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _4985 = fma(_4969, _4965, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _4887 = _4979;
            _4917 = _4983;
            _4903 = _4975;
            _4831 = _4981;
            _4821 = _4977;
            _4925 = _4985;
            _4987 = true;
        }
        else
        {
            bool _4989 = _4438 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _4991 = isnan(_4438);
            bool _4993 = _4989 || _4991;
            bool _4995 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _4997 = _4993 || _4995;
            if (!_4997)
            {
                _4901 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _4999 = _4901;
            _4903 = _4999;
            if (!_4997)
            {
                _4885 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _5001 = _4885;
            _4887 = _5001;
            if (!_4997)
            {
                _4819 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _5003 = _4819;
            _4821 = _5003;
            if (!_4997)
            {
                _4829 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _5005 = _4829;
            _4831 = _5005;
            if (!_4997)
            {
                _4915 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _5007 = _4915;
            _4917 = _5007;
            if (!_4997)
            {
                _4923 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _5009 = _4923;
            bool _5011 = !_4997;
            _4925 = _5009;
            if (!_5011)
            {
                bool _5013 = _4438 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _5015 = isnan(_4438);
                bool _5017 = _5013 || _5015;
                bool _5019 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _5021 = _5017 || _5019;
                if (!_5021)
                {
                    float _5023 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _5025 = _4438 + _5023;
                    float _5027 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _5029 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _5027;
                    float _5031 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _5033 = _5031 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _5035 = 1.0 / _5029;
                    float _5037 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _5039 = _5037 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _5041 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _5043 = _5041 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _5045 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _5047 = _5045 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _5049 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _5051 = _5049 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _5053 = _5025 * _5035;
                    float _5055 = precise::clamp(_5053, 0.0, 1.0);
                    float _5057 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _5059 = _5057 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _5061 = fma(_5055, _5033, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _5063 = fma(_5055, _5059, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _5065 = fma(_5055, _5039, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _5067 = fma(_5055, _5043, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _5069 = fma(_5055, _5047, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _5071 = fma(_5055, _5051, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _4887 = _5065;
                    _4917 = _5069;
                    _4903 = _5061;
                    _4831 = _5067;
                    _4821 = _5063;
                    _4925 = _5071;
                    _4987 = true;
                }
                else
                {
                    _4887 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _4917 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _4903 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _4831 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _4821 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _4925 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _4987 = false;
    float _5073 = _4887;
    float _5075 = _4917;
    float _5077 = _4903;
    float _5079 = _4831;
    float _5081 = _4821;
    float _5083 = _4925;
    float _5085 = _4913 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _5087 = fma(_4028, -0.5, 0.5);
    float _5089 = precise::clamp(_5087, 0.0, 1.0);
    float _5091 = -_5073;
    float _5093 = _5091 + _5075;
    float _5095 = -_5077;
    float _5097 = _5095 + _5079;
    out.m_53.x = _5085;
    float _5099 = fma(_5089, _5093, _5073);
    float _5101 = -_5081;
    float _5103 = _5101 + _5083;
    float _5105 = fma(_5089, _5097, _5077);
    float _5107 = _5099 * 0.586610972881317138671875;
    bool _5109 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _5111 = fma(_5089, _5103, _5081);
    out.m_98.x = 0.0;
    float _5113 = fma(_5105, 0.298911988735198974609375, _5107);
    bool _5115 = _4412 > 0.0;
    bool _5117 = isnan(_4412);
    bool _5119 = _5115 || _5117;
    bool _5121 = isnan(0.0);
    bool _5123 = _5119 || _5121;
    float _5125 = fma(_5111, 0.114477999508380889892578125, _5113);
    float _5127 = -_5125;
    float _5129 = _5105 + _5127;
    float _5131 = -_5125;
    float _5133 = _5099 + _5131;
    float _5135 = -_5125;
    float _5137 = _5111 + _5135;
    float _5139 = fma(_5129, (*spvDescriptorSet0.vp_c13)._m0[1].z, _5125);
    float _5141 = fma(_5133, (*spvDescriptorSet0.vp_c13)._m0[1].z, _5125);
    float _5143 = fma(_5137, (*spvDescriptorSet0.vp_c13)._m0[1].z, _5125);
    bool _5145 = !_5109;
    if (!_5145)
    {
        float _5147 = -_4352;
        float _5149 = _5147 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _5151 = -_4354;
        float _5153 = _5151 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _5155 = -_4356;
        float _5157 = _5155 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _5159 = _5149 * _5149;
        float _5161 = fma(_5153, _5153, _5159);
        float _5163 = fma(_5157, _5157, _5161);
        float _5165 = sqrt(_5163);
        float _5167 = rsqrt(_5163);
        float _5169 = -_5165;
        float _5171 = _5169 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _5173 = _5171 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _5175 = precise::clamp(_5173, 0.0, 1.0);
        float _5177 = _5153 * _5167;
        float _5179 = _5149 * _5167;
        float _5181 = abs(_5175);
        float _5183 = log2(_5181);
        float _5185 = _5157 * _5167;
        float _5187 = _5177 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _5189 = _4028 * _5179;
        float _5191 = -_5179;
        float _5193 = -_5187;
        float _5195 = fma(_5191, (*spvDescriptorSet0.vp_c15)._m0[656].y, _5193);
        float _5197 = fma(_4026, _5177, _5189);
        float _5199 = -_5185;
        float _5201 = fma(_5199, (*spvDescriptorSet0.vp_c15)._m0[656].z, _5195);
        float _5203 = fma(_4030, _5185, _5197);
        float _5205 = precise::clamp(_5203, 0.0, 1.0);
        float _5207 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _5209 = _5201 + _5207;
        float _5211 = _5183 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _5213 = _5209 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _5215 = precise::clamp(_5213, 0.0, 1.0);
        float _5217 = exp2(_5211);
        float _5219 = _5217 * _5215;
        float _5221 = _5205 * _5219;
        float _5223 = _5221 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _5225 = _5221 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _5227 = _5221 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_98.x = _5223;
        out.m_98.y = _5225;
        out.m_98.z = _5227;
    }
    out.m_100.x = _5139;
    out.m_100.y = _5141;
    out.m_100.z = _5143;
    if (_5123)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_90.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_90.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_90.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_90.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_100.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_100.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_100.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_100.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_98.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_98.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_98.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_98.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_88.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_88.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_88.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_88.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_94.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_94.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_94.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_94.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_96.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_96.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_96.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_96.w)); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    out.m_53.x = 0.0;
    float _5229 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _5229;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_90.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_90.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_90.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_90.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_100.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_100.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_100.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_100.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_98.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_98.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_98.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_98.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_88.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_88.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_88.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_88.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_94.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_94.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_94.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_94.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_96.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_96.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_96.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_96.w)); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

