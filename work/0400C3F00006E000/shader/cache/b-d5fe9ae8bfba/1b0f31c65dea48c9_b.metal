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
    float4 m_64 [[user(locn0)]];
    float4 m_68 [[user(locn1)]];
    float4 m_88 [[user(locn2)]];
    float4 m_66 [[user(locn3)]];
    float4 m_90 [[user(locn4)]];
    float4 m_49 [[user(locn5)]];
    float4 m_53 [[user(locn6)]];
    float4 m_76 [[user(locn7)]];
    float4 m_98 [[user(locn8)]];
    float4 m_72 [[user(locn9)]];
    float4 m_74 [[user(locn10)]];
    float4 m_84 [[user(locn11)]];
    float4 m_86 [[user(locn12)]];
    float4 m_82 [[user(locn13)]];
    float4 m_78 [[user(locn14)]];
    float4 m_96 [[user(locn15)]];
    float4 m_92 [[user(locn16)]];
    float4 m_94 [[user(locn17)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_80 [[attribute(0)]];
    float4 m_70 [[attribute(1)]];
    float4 m_58 [[attribute(2)]];
    float4 m_46 [[attribute(3)]];
    float4 m_51 [[attribute(4)]];
    float4 m_60 [[attribute(5)]];
    float4 m_62 [[attribute(6)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_64 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_68 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_88 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_66 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_90 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_49 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_53 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_76 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_98 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_72 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_74 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_84 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_86 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_82 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_78 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_96 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_92 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_94 = float4(0.0, 0.0, 0.0, 1.0);
    bool _3479 = false;
    bool _345 = false;
    bool _241 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _112 = in.m_46.w;
    float _114 = trunc(_112);
    int _117 = int(_114);
    bool _121 = _117 >= 1;
    float _123 = 0.0;
    if (!_121)
    {
        _123 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _125 = _123;
    if (!_121)
    {
        out.m_49.x = 0.0;
    }
    int _127 = 0;
    if (!_121)
    {
        float _129 = _125 * 5.0;
        _127 = as_type<int>(_129);
    }
    int _131 = _127;
    int _133 = _131;
    if (!_121)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3783 = as_type<float>(_131);
        out.gl_Position.z = _3783;
    }
    if (!_121)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _135 = in.m_51.w;
    float _137 = float(_117);
    float _139 = -_135;
    float _141 = _139 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _143 = _135 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _145 = isnan(_135);
    bool _147 = _143 || _145;
    bool _149 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _151 = _147 || _149;
    bool _153 = _141 >= _137;
    bool _155 = !_151;
    bool _157 = _153 || _155;
    float _159 = 1.0 / _137;
    float _161 = _135;
    float _163 = _141;
    if (_157)
    {
        _161 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _165 = _161;
    if (_157)
    {
        out.m_49.x = 0.0;
    }
    float _167 = _141 * _159;
    float _169 = _167;
    if (_157)
    {
        float _171 = _165 * 5.0;
        _133 = as_type<int>(_171);
    }
    int _173 = _133;
    out.m_53.x = _167;
    if (_157)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3856 = as_type<float>(_173);
        out.gl_Position.z = _3856;
    }
    if (_157)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _175 = as_type<float>(int(gl_VertexIndex));
    float _177 = in.m_58.x;
    float _179 = in.m_58.y;
    float _181 = in.m_58.z;
    int _183 = as_type<int>(_175) & 1;
    bool _185 = _183 != 0;
    int _187 = as_type<int>(_175) & 2;
    bool _189 = _187 != 0;
    bool _191 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _193 = _179 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _195 = _179 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _197 = _179 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _199 = fma(_177, (*spvDescriptorSet0.vp_c10)._m0[4].x, _193);
    float _201 = fma(_177, (*spvDescriptorSet0.vp_c10)._m0[5].x, _195);
    float _203 = fma(_177, (*spvDescriptorSet0.vp_c10)._m0[6].x, _197);
    bool _205 = !_189;
    float _207 = _205 ? (-0.5) : 0.5;
    float _209 = fma(_181, (*spvDescriptorSet0.vp_c10)._m0[4].z, _199);
    float _211 = fma(_181, (*spvDescriptorSet0.vp_c10)._m0[5].z, _201);
    float _213 = fma(_181, (*spvDescriptorSet0.vp_c10)._m0[6].z, _203);
    bool _215 = !_185;
    float _217 = _215 ? (-0.5) : 0.5;
    bool _219 = !_191;
    float _221 = _211;
    float _239;
    if (!_219)
    {
        float _223 = in.m_60.x;
        float _225 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _227 = _223 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _229 = fma(_227, (*spvDescriptorSet0.vp_c9)._m0[12].x, _141);
        float _231 = _229 * _225;
        float _233 = floor(_231);
        float _235 = -_233;
        float _237 = _231 + _235;
        _239 = _237;
        _241 = true;
    }
    else
    {
        _239 = _167;
    }
    _241 = false;
    float _243 = _239;
    float _245 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _247 = _243 + _245;
    float _249 = in.m_62.x;
    float _251 = in.m_62.y;
    bool _253 = _243 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _255 = isnan(_243);
    bool _257 = _253 || _255;
    bool _259 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _261 = _257 || _259;
    float _263 = float(_261);
    float _265 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _267 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _265;
    bool _269 = _243 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _271 = isnan(_243);
    bool _273 = _269 || _271;
    bool _275 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _277 = _273 || _275;
    float _279 = float(_277);
    float _281 = -_263;
    float _283 = _281 + 1.0;
    float _285 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _287 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _285;
    float _289 = 1.0 / _267;
    bool _291 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _293 = _279 * _283;
    float _295 = -_279;
    float _297 = _295 + 1.0;
    float _299 = _247 * _289;
    float _301 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _303 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _301;
    float _305 = fma(_287, _299, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _307 = fma(_303, _299, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _309 = _305 * _293;
    float _311 = _307 * _293;
    float _313 = fma(_297, (*spvDescriptorSet0.vp_c9)._m0[143].x, _309);
    float _315 = fma(_297, (*spvDescriptorSet0.vp_c9)._m0[143].y, _311);
    float _317 = fma(_263, (*spvDescriptorSet0.vp_c9)._m0[144].x, _313);
    float _319 = fma(_263, (*spvDescriptorSet0.vp_c9)._m0[144].y, _315);
    float _321 = _317 * _249;
    float _323 = _319 * _251;
    bool _325 = !_291;
    float _343;
    if (!_325)
    {
        float _327 = in.m_60.x;
        float _329 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _331 = _327 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _333 = fma(_331, (*spvDescriptorSet0.vp_c9)._m0[11].y, _141);
        float _335 = _333 * _329;
        float _337 = floor(_335);
        float _339 = -_337;
        float _341 = _335 + _339;
        _343 = _341;
        _345 = true;
    }
    else
    {
        _343 = _167;
    }
    _345 = false;
    float _347 = _343;
    float _349 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _351 = _347 + _349;
    float _353 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _355 = _353 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _357 = _347 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _359 = isnan(_347);
    bool _361 = _357 || _359;
    bool _363 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _365 = _361 || _363;
    float _367 = float(_365);
    float _369 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _371 = _369 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _373 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _375 = _373 + (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _377 = _347 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _379 = isnan(_347);
    bool _381 = _377 || _379;
    bool _383 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _385 = _381 || _383;
    float _387 = float(_385);
    float _389 = 1.0 / _355;
    float _391 = -_367;
    float _393 = _391 + 1.0;
    float _395 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _397 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _395;
    bool _399 = _347 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _401 = isnan(_347);
    bool _403 = _399 || _401;
    bool _405 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _407 = _403 || _405;
    float _409 = float(_407);
    float _411 = _387 * _393;
    float _413 = -_387;
    float _415 = _413 + 1.0;
    bool _417 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _419 = 1.0 / _371;
    float _421 = _409 * _415;
    float _423 = -_409;
    float _425 = _423 + 1.0;
    float _427 = 1.0 / _375;
    float _429 = _397 * _389;
    float _431 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _433 = _431 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _435 = fma(_429, _351, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _437 = _433 * _419;
    bool _439 = _347 >= (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _441 = isnan(_347);
    bool _443 = _439 || _441;
    bool _445 = isnan((*spvDescriptorSet0.vp_c9)._m0[118].w);
    bool _447 = _443 || _445;
    float _449 = float(_447);
    float _451 = -(*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _453 = (*spvDescriptorSet0.vp_c9)._m0[118].x + _451;
    float _455 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _457 = _347 + _455;
    float _459 = _435 * _421;
    float _461 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _463 = _347 + _461;
    float _465 = -_449;
    float _467 = _465 + 1.0;
    float _469 = fma(_437, _457, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _471 = _453 * _427;
    float _473 = fma(_425, (*spvDescriptorSet0.vp_c9)._m0[115].x, _459);
    float _475 = _367 * _467;
    float _477 = fma(_471, _463, (*spvDescriptorSet0.vp_c9)._m0[117].x);
    float _479 = fma(_469, _411, _473);
    float _481 = fma(_477, _475, _479);
    float _483 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _485 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _487 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _489 = fma(_449, (*spvDescriptorSet0.vp_c9)._m0[118].x, _481);
    float _491 = _483 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _493 = _485 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _495 = _487 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _497 = _489 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    out.m_64.x = _491;
    out.m_64.y = _493;
    out.m_64.z = _495;
    out.m_64.w = _497;
    bool _499 = !_417;
    float _501 = _367;
    if (!_499)
    {
        float _503 = in.m_60.x;
        float _505 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _507 = _503 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _509 = fma(_507, (*spvDescriptorSet0.vp_c9)._m0[11].w, _141);
        float _511 = _509 * _505;
        float _513 = floor(_511);
        float _515 = -_513;
        float _517 = _511 + _515;
        _169 = _517;
    }
    float _519 = _169;
    float _521 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _523 = int(_521);
    float _525 = in.m_60.x;
    float _527 = in.m_60.y;
    float _529 = _159 * _141;
    float _531 = _321 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    int _533 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _535 = _533 != 0;
    float _537 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].y);
    int _539 = int(_537);
    float _541 = (*spvDescriptorSet0.vp_c9)._m0[87].x + (*spvDescriptorSet0.vp_c9)._m0[86].z;
    float _543 = float(_523);
    float _545 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _547 = int(_545);
    float _549 = (*spvDescriptorSet0.vp_c9)._m0[87].y + (*spvDescriptorSet0.vp_c9)._m0[86].w;
    int _551 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z);
    if (_535)
    {
        _501 = 1.0;
    }
    float _553 = _501;
    float _555 = _553;
    if (!_535)
    {
        _555 = 7.345489978790283203125;
    }
    float _557 = _555;
    float _559 = float(_539);
    float _561 = 1.0 / _543;
    float _563 = _557 * _525;
    float _565 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].x);
    int _567 = int(_565);
    float _569 = float(uint(_547));
    bool _571 = _547 == 0;
    float _573 = 1.0 / _559;
    float _575 = _561 * _141;
    float _577 = 1.0 / _569;
    float _579 = float(uint(_567));
    int _581 = ~_567;
    int _583 = _581 + 1;
    float _585 = trunc(_575);
    int _587 = int(_585);
    float _589 = _573 * _141;
    int _591 = ~_547;
    int _593 = _591 + 1;
    float _595 = 1.0 / _579;
    int _597 = as_type<int>(_577) + (-2);
    float _599 = trunc(_589);
    int _601 = int(_599);
    float _603 = float(uint(_587));
    float _605 = as_type<float>(_597) * _603;
    int _607 = as_type<int>(_595) + (-2);
    float _609 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].z;
    int _611 = ~_567;
    int _613 = _611 + 1;
    float _615 = float(uint(_601));
    float _617 = trunc(_605);
    float _619 = precise::max(_617, 0.0);
    uint _622 = uint(_619);
    float _624 = as_type<float>(_607) * _615;
    float _626 = trunc(_624);
    float _628 = precise::max(_626, 0.0);
    uint _630 = uint(_628);
    float _632 = _609 * (*spvDescriptorSet0.vp_c9)._m0[90].x;
    int _634 = _593 * int(_622);
    int _636 = _634 + _587;
    float _638 = floor(_563);
    float _640 = float(uint(_636));
    int _642 = _613 * int(_630);
    int _644 = _642 + _601;
    float _646 = as_type<float>(_597) * _640;
    float _648 = _640;
    if (_535)
    {
        _648 = 1.0;
    }
    float _650 = _648;
    float _652 = float(uint(_644));
    float _654 = trunc(_646);
    float _656 = precise::max(_654, 0.0);
    uint _658 = uint(_656);
    float _660 = _650;
    float _662 = _652;
    if (!_535)
    {
        _660 = 1.2345600128173828125;
    }
    float _664 = _660;
    float _666 = -_638;
    float _668 = _563 + _666;
    float _670 = as_type<float>(_607) * _652;
    if (_535)
    {
        _662 = _525;
    }
    float _672 = _662;
    float _674 = _672;
    if (!_535)
    {
        _674 = _527;
    }
    float _676 = _674;
    float _678 = trunc(_670);
    float _680 = precise::max(_678, 0.0);
    uint _682 = uint(_680);
    float _684 = _664 * _676;
    int _686 = ~_547;
    int _688 = _686 + 1;
    int _690 = int(_622) + int(_658);
    float _692 = floor(_684);
    float _694 = float(_547);
    float _696 = float(_587);
    int _698 = _688 * _690;
    int _700 = _698 + _587;
    int _702 = int(_630) + int(_682);
    float _704 = _668 * _694;
    float _706 = _694 * _529;
    bool _708 = _696 >= _694;
    bool _710 = isnan(_696);
    bool _712 = _708 || _710;
    bool _714 = isnan(_694);
    bool _716 = _712 || _714;
    float _718 = float(_716);
    bool _720 = uint(_700) >= uint(_547);
    int _722 = _583 * _702;
    int _724 = _722 + _601;
    float _726 = -_692;
    float _728 = _684 + _726;
    float _730 = trunc(_718);
    int _732 = int(_730);
    bool _734 = !_720;
    int _736 = _734 ? 0 : (-1);
    bool _738 = uint(_724) >= uint(_567);
    float _740 = in.m_60.z;
    int _742 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _744 = _742 != 0;
    int _746 = ~_690;
    int _748 = _746 + _736;
    int _750 = _748 + 1;
    float _752 = trunc(_704);
    int _754 = int(_752);
    bool _756 = !_744;
    int _758 = _756 ? 0 : 1;
    float _760 = float(_567);
    int _762 = abs(_758);
    int _764 = _547 * _750;
    int _766 = _764 + _587;
    float _768 = float(_601);
    float _770 = _760 * _529;
    int _772 = ~_732;
    int _774 = _772 + 1;
    int _776 = _774 + 1;
    bool _778 = !_738;
    int _780 = _778 ? 0 : (-1);
    bool _782 = !_571;
    int _784 = _782 ? _766 : (-1);
    float _786 = trunc(_770);
    int _788 = int(_786);
    bool _790 = _768 >= _760;
    bool _792 = isnan(_768);
    bool _794 = _790 || _792;
    bool _796 = isnan(_760);
    bool _798 = _794 || _796;
    float _800 = float(_798);
    float _802 = _728 * _760;
    bool _804 = _527 > 0.5;
    int _806 = _784 * _776;
    int _808 = ~_702;
    int _810 = _808 + _780;
    int _812 = _810 + 1;
    int _814 = _754 * _762;
    int _816 = _814 + _587;
    bool _818 = _740 > 0.5;
    float _820 = trunc(_802);
    int _822 = int(_820);
    float _824 = -_217;
    int _826 = _804 ? as_type<int>(_824) : as_type<int>(_217);
    int _828 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16;
    bool _830 = _828 != 0;
    int _832 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32;
    bool _834 = _832 != 0;
    float _836 = -_207;
    int _838 = _818 ? as_type<int>(_836) : as_type<int>(_207);
    int _840 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8192;
    bool _842 = _840 != 0;
    float _844 = trunc(_800);
    int _846 = int(_844);
    int _848 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _850 = _848 != 0;
    bool _852 = !_830;
    float _854 = _852 ? _217 : as_type<float>(_826);
    bool _856 = !_834;
    float _858 = _856 ? _207 : as_type<float>(_838);
    bool _860 = !_842;
    int _862 = _860 ? 0 : 1;
    float _864 = trunc(_706);
    int _866 = int(_864);
    int _868 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _870 = _868 != 0;
    int _872 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _874 = _872 != 0;
    int _876 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _878 = _876 != 0;
    float _880 = _854 + 0.5;
    int _882 = abs(_862);
    int _884 = _547 + (-1);
    bool _886 = !_874;
    int _888 = _886 ? 0 : 1;
    bool _890 = !_850;
    int _892 = _890 ? 0 : 1;
    int _894 = _732 * _884;
    int _896 = _894 + _806;
    bool _898 = !_870;
    int _900 = _898 ? 0 : 1;
    int _902 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 256;
    bool _904 = _902 != 0;
    int _906 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 512;
    bool _908 = _906 != 0;
    int _910 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1024;
    bool _912 = _910 != 0;
    int _914 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2048;
    bool _916 = _914 != 0;
    int _918 = abs(_888);
    int _920 = _822 * _882;
    int _922 = _920 + _601;
    int _924 = abs(_900);
    int _926 = _567 * _812;
    int _928 = _926 + _601;
    bool _930 = !_878;
    int _932 = _930 ? 0 : 1;
    bool _934 = !_908;
    int _936 = _934 ? 0 : 1;
    bool _938 = _567 == 0;
    int _940 = abs(_932);
    int _942 = _896 * _918;
    int _944 = ~_846;
    int _946 = _944 + 1;
    int _948 = _946 + 1;
    bool _950 = !_938;
    int _952 = _950 ? _928 : (-1);
    int _954 = _866 * _924;
    int _956 = _954 + _942;
    int _958 = _567 + (-1);
    int _960 = _952 * _948;
    int _962 = abs(_892);
    int _964 = _816 * _940;
    int _966 = _964 + _956;
    int _968 = abs(_936);
    int _970 = _846 * _958;
    int _972 = _970 + _960;
    bool _974 = !_904;
    int _976 = _974 ? 0 : 1;
    int _978 = _754 * _962;
    int _980 = _978 + _966;
    bool _982 = !_912;
    int _984 = _982 ? 0 : 1;
    int _986 = abs(_976);
    bool _988 = !_916;
    int _990 = _988 ? 0 : 1;
    int _992 = abs(_984);
    int _994 = _972 * _968;
    float _996 = float(uint(_980));
    int _998 = abs(_990);
    int _1000 = _788 * _986;
    int _1002 = _1000 + _994;
    float _1004 = as_type<float>(_597) * _996;
    int _1006 = ~_547;
    int _1008 = _1006 + 1;
    int _1010 = _922 * _992;
    int _1012 = _1010 + _1002;
    bool _1014 = _547 == 0;
    float _1016 = trunc(_1004);
    float _1018 = precise::max(_1016, 0.0);
    uint _1020 = uint(_1018);
    int _1022 = _822 * _998;
    int _1024 = _1022 + _1012;
    int _1026 = ~_547;
    int _1028 = _1026 + 1;
    int _1030 = ~_567;
    int _1032 = _1030 + 1;
    float _1034 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _1036 = float(uint(_1024));
    float _1038 = float(uint(_816));
    float _1040 = as_type<float>(_607) * _1036;
    float _1042 = as_type<float>(_597) * _1038;
    int _1044 = _1028 * int(_1020);
    int _1046 = _1044 + _980;
    float _1048 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _1050 = _1048 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _1052 = trunc(_1040);
    float _1054 = precise::max(_1052, 0.0);
    uint _1056 = uint(_1054);
    float _1058 = float(uint(_1046));
    float _1060 = as_type<float>(_597) * _1058;
    float _1062 = trunc(_1042);
    float _1064 = precise::max(_1062, 0.0);
    uint _1066 = uint(_1064);
    int _1068 = _1032 * int(_1056);
    int _1070 = _1068 + _1024;
    float _1072 = trunc(_1060);
    float _1074 = precise::max(_1072, 0.0);
    uint _1076 = uint(_1074);
    float _1078 = _527 * 2.0;
    float _1080 = float(uint(_1070));
    float _1082 = floor(_1078);
    float _1084 = as_type<float>(_607) * _1080;
    int _1086 = ~_567;
    int _1088 = _1086 + 1;
    int _1090 = int(_1020) + int(_1076);
    float _1092 = trunc(_1084);
    float _1094 = precise::max(_1092, 0.0);
    uint _1096 = uint(_1094);
    int _1098 = _1008 * _1090;
    int _1100 = _1098 + _980;
    float _1102 = 1.0 / _1050;
    bool _1104 = uint(_1100) >= uint(_547);
    bool _1106 = !_1104;
    int _1108 = _1106 ? 0 : (-1);
    int _1110 = ~_1090;
    int _1112 = _1110 + _1108;
    int _1114 = _1112 + 1;
    float _1116 = _740 * 2.0;
    int _1118 = int(_1056) + int(_1096);
    float _1120 = float(uint(_922));
    int _1122 = _547 * _1114;
    int _1124 = _1122 + _980;
    float _1126 = _527 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    int _1128 = _1088 * _1118;
    int _1130 = _1128 + _1024;
    float _1132 = floor(_1116);
    float _1134 = as_type<float>(_607) * _1120;
    bool _1136 = !_1014;
    int _1138 = _1136 ? _1124 : (-1);
    float _1140 = fma(_1126, -2.0, _1034);
    bool _1142 = uint(_1130) >= uint(_567);
    int _1144 = _1138 & 3;
    bool _1146 = _1144 != 0;
    int _1148 = _1138 & 3;
    bool _1150 = _1148 != 0;
    float _1152 = trunc(_1134);
    float _1154 = precise::max(_1152, 0.0);
    uint _1156 = uint(_1154);
    bool _1158 = !_1142;
    int _1160 = _1158 ? 0 : (-1);
    int _1162 = _1146 ? 0 : 1;
    bool _1164 = uint(_1148) >= 2u;
    bool _1166 = uint(_1148) > 1u;
    int _1168 = ~_1118;
    int _1170 = _1168 + _1160;
    int _1172 = _1170 + 1;
    int _1174 = _1164 ? 0 : 1;
    bool _1176 = _1148 != 3;
    int _1178 = _567 * _1172;
    int _1180 = _1178 + _1024;
    int _1182 = ~_1162;
    int _1184 = _1182 + 1;
    int _1186 = _1184 + 1;
    int _1188 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _1190 = _1188 != 0;
    bool _1192 = !_938;
    int _1194 = _1192 ? _1180 : (-1);
    int _1196 = _1186;
    float _1198 = as_type<float>(_816);
    if (!_1166)
    {
        int _1200 = ~_1162;
        int _1202 = _1200 + 1;
        _1196 = _1202;
    }
    int _1204 = _1196;
    int _1206 = _1194 & 3;
    bool _1208 = _1206 != 0;
    int _1210 = ~_1174;
    int _1212 = _1210 + 1;
    int _1214 = _1212 + 1;
    int _1216 = _1214;
    if (_1176)
    {
        int _1218 = ~_1174;
        int _1220 = _1218 + 1;
        _1216 = _1220;
    }
    int _1222 = _1216;
    bool _1224 = uint(_1206) > 1u;
    float _1226 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _1228 = log2(_1226);
    int _1230 = _1194 & 3;
    bool _1232 = _1230 != 0;
    if (_1190)
    {
        _551 = 0;
    }
    int _1234 = _551;
    int _1236 = _1232 ? 0 : 1;
    int _1238 = _1234;
    if (!_1190)
    {
        _1238 = 2;
    }
    int _1240 = _1238;
    int _1242 = ~_1236;
    int _1244 = _1242 + 1;
    int _1246 = _1244 + 1;
    bool _1248 = _527 > 0.5;
    int _1250 = _1246;
    if (!_1224)
    {
        int _1252 = ~_1236;
        int _1254 = _1252 + 1;
        _1250 = _1254;
    }
    int _1256 = _1250;
    float _1258 = _525 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _1260 = _1228 * _141;
    bool _1262 = _1206 != 3;
    bool _1264 = _1240 != 2;
    float _1266 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _1268 = -_207;
    float _1270 = _1248 ? _1268 : _207;
    float _1272 = exp2(_1260);
    bool _1274 = uint(_1206) >= 2u;
    float _1276 = -_1266;
    float _1278 = fma(_1258, 2.0, _1276);
    float _1280 = _525 * 2.0;
    float _1282 = _1274 ? 0.0 : 1.4012984643248170709237295832899e-45;
    float _1284 = floor(_1280);
    int _1286 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _1288 = _1286 != 0;
    int _1290 = ~as_type<int>(_1282);
    int _1292 = _1290 + 1;
    int _1294 = _1292 + 1;
    int _1296 = _1294;
    float _1298 = _1282;
    float _1300 = _1270;
    if (_1262)
    {
        int _1302 = ~as_type<int>(_1282);
        int _1304 = _1302 + 1;
        _1296 = _1304;
    }
    int _1306 = _1296;
    if (_1264)
    {
        _1298 = _525;
    }
    float _1308 = _1298;
    float _1310 = _1308;
    if (!_1264)
    {
        _1310 = _740;
    }
    float _1312 = _1310;
    bool _1314 = !_1288;
    int _1316 = _1314 ? 0 : 1;
    int _1318 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1320 = _1318 != 0;
    float _1322 = _1312 * (*spvDescriptorSet0.vp_c9)._m0[87].x;
    bool _1324 = _525 > 0.5;
    float _1326 = -_1272;
    float _1328 = _1326 + 1.0;
    bool _1330 = !_1320;
    float _1332 = _1330 ? _207 : _1270;
    float _1334 = -_541;
    float _1336 = fma(_1322, 2.0, _1334);
    int _1338 = ~_547;
    int _1340 = _1338 + 1;
    float _1342 = -_217;
    int _1344 = _1324 ? as_type<int>(_1342) : as_type<int>(_217);
    float _1346 = -_141;
    float _1348 = fma(_1346, (*spvDescriptorSet0.vp_c9)._m0[86].x, _1336);
    bool _1350 = _1284 > 0.0;
    int _1352 = _1340 * int(_1066);
    int _1354 = _1352 + _816;
    bool _1356 = _1284 >= 0.0;
    bool _1358 = isnan(_1284);
    bool _1360 = _1356 || _1358;
    bool _1362 = isnan(0.0);
    bool _1364 = _1360 || _1362;
    float _1366 = fma(_632, _880, _1348);
    int _1368 = ~_567;
    int _1370 = _1368 + 1;
    if (_1264)
    {
        _1300 = _527;
    }
    float _1372 = _1300;
    float _1374 = _1372;
    if (!_1264)
    {
        _1374 = _525;
    }
    float _1376 = _1374;
    int _1378 = _1370 * int(_1156);
    int _1380 = _1378 + _922;
    float _1382 = float(uint(_1354));
    bool _1384 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1386 = isnan(0.0);
    bool _1388 = _1384 || _1386;
    bool _1390 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1392 = _1388 || _1390;
    float _1394 = _1376 * (*spvDescriptorSet0.vp_c9)._m0[87].y;
    float _1396 = float(uint(_1380));
    float _1398 = as_type<float>(_597) * _1382;
    float _1400 = _1392 ? _1328 : 0.0;
    float _1402 = fma(_1394, -2.0, _549);
    bool _1404 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1406 = isnan(1.0);
    bool _1408 = _1404 || _1406;
    bool _1410 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1412 = _1408 || _1410;
    float _1414 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _1416 = 1.0 + _1414;
    float _1418 = as_type<float>(_607) * _1396;
    float _1420 = trunc(_1398);
    float _1422 = precise::max(_1420, 0.0);
    uint _1424 = uint(_1422);
    float _1426 = fma(_141, (*spvDescriptorSet0.vp_c9)._m0[86].y, _1402);
    float _1428 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _1430 = 1.0 / _1416;
    float _1432 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _1434 = (*spvDescriptorSet0.vp_c9)._m0[88].z + (*spvDescriptorSet0.vp_c9)._m0[88].x;
    float _1436 = fma(_525, (*spvDescriptorSet0.vp_c9)._m0[78].z, _1428);
    float _1438 = (*spvDescriptorSet0.vp_c9)._m0[88].w + (*spvDescriptorSet0.vp_c9)._m0[88].y;
    float _1440 = fma(_527, (*spvDescriptorSet0.vp_c9)._m0[78].w, _1432);
    float _1442 = fma(_525, (*spvDescriptorSet0.vp_c9)._m0[88].z, _1434);
    float _1444 = fma(_141, (*spvDescriptorSet0.vp_c9)._m0[77].z, _1436);
    float _1446 = trunc(_1418);
    float _1448 = precise::max(_1446, 0.0);
    uint _1450 = uint(_1448);
    float _1452 = fma(_527, (*spvDescriptorSet0.vp_c9)._m0[88].w, _1438);
    float _1454 = fma(_141, (*spvDescriptorSet0.vp_c9)._m0[76].y, _1140);
    float _1456 = -_141;
    float _1458 = fma(_1456, (*spvDescriptorSet0.vp_c9)._m0[76].x, _1278);
    float _1460 = fma(_141, (*spvDescriptorSet0.vp_c9)._m0[77].w, _1440);
    float _1462 = fma(_141, (*spvDescriptorSet0.vp_c9)._m0[87].z, _1442);
    float _1464 = fma(_141, (*spvDescriptorSet0.vp_c9)._m0[87].w, _1452);
    int _1466 = int(_1066) + int(_1424);
    if (_1412)
    {
        float _1468 = _1400 * _1430;
        _163 = _1468;
    }
    float _1470 = _163;
    int _1472 = ~_547;
    int _1474 = _1472 + 1;
    float _1476 = in.m_46.x;
    float _1478 = in.m_46.y;
    float _1480 = in.m_46.z;
    int _1482 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1484 = _1482 != 0;
    float _1486 = _1332 + (-0.5);
    int _1488 = ~_567;
    int _1490 = _1488 + 1;
    int _1492 = _1474 * _1466;
    int _1494 = _1492 + _816;
    int _1496 = _1364 ? 0 : 1;
    float _1498 = -_1444;
    float _1500 = _1498 + 1.0;
    bool _1502 = !_1484;
    float _1504 = _1502 ? _217 : as_type<float>(_1344);
    float _1506 = -_1486;
    float _1508 = -_1454;
    float _1510 = fma(_1506, (*spvDescriptorSet0.vp_c9)._m0[80].y, _1508);
    bool _1512 = _1082 > 0.0;
    float _1514 = -_1460;
    float _1516 = _1514 + 1.0;
    bool _1518 = _1082 >= 0.0;
    bool _1520 = isnan(_1082);
    bool _1522 = _1518 || _1520;
    bool _1524 = isnan(0.0);
    bool _1526 = _1522 || _1524;
    float _1528 = -_1462;
    float _1530 = _1528 + 1.0;
    int _1532 = int(_1156) + int(_1450);
    int _1534 = ~_1496;
    int _1536 = _1534 + 1;
    int _1538 = _1536 + 1;
    int _1540 = _1538;
    if (!_1350)
    {
        int _1542 = ~_1496;
        int _1544 = _1542 + 1;
        _1540 = _1544;
    }
    int _1546 = _1540;
    bool _1548 = uint(_1494) >= uint(_547);
    int _1550 = _1490 * _1532;
    int _1552 = _1550 + _922;
    float _1554 = _1478 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    int _1556 = _1526 ? 0 : 1;
    float _1558 = _1478 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    bool _1560 = !_1548;
    int _1562 = _1560 ? 0 : (-1);
    float _1564 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _1566 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _1564;
    bool _1568 = uint(_1552) >= uint(_567);
    float _1570 = fma(_1476, (*spvDescriptorSet0.vp_c10)._m0[4].x, _1554);
    int _1572 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4194304;
    bool _1574 = _1572 != 0;
    float _1576 = _1566 * _1102;
    bool _1578 = _519 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _1580 = isnan(_519);
    bool _1582 = _1578 || _1580;
    bool _1584 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _1586 = _1582 || _1584;
    float _1588 = float(_1586);
    float _1590 = fma(_1476, (*spvDescriptorSet0.vp_c10)._m0[6].x, _1558);
    int _1592 = ~_1556;
    int _1594 = _1592 + 1;
    int _1596 = _1594 + 1;
    int _1598 = _1596;
    if (!_1512)
    {
        int _1600 = ~_1556;
        int _1602 = _1600 + 1;
        _1598 = _1602;
    }
    int _1604 = _1598;
    float _1606 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _1608 = _519 + _1606;
    bool _1610 = !_1568;
    int _1612 = _1610 ? 0 : (-1);
    float _1614 = -_1588;
    float _1616 = _1614 + 1.0;
    int _1618 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _1620 = _1618 != 0;
    int _1622 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _1624 = _1622 != 0;
    int _1626 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _1628 = _1626 != 0;
    float _1630 = _1478 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    bool _1632 = _519 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _1634 = isnan(_519);
    bool _1636 = _1632 || _1634;
    bool _1638 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _1640 = _1636 || _1638;
    float _1642 = float(_1640);
    bool _1644 = !_1150;
    int _1646 = _1644 ? 0 : 1;
    float _1648 = fma(_1476, (*spvDescriptorSet0.vp_c10)._m0[5].x, _1630);
    float _1650 = fma(_1576, _1608, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    float _1652 = _1642 * _1616;
    float _1654 = _1504 + 0.5;
    float _1656 = fma(_1480, (*spvDescriptorSet0.vp_c10)._m0[5].z, _1648);
    bool _1658 = _1132 >= 0.0;
    bool _1660 = isnan(_1132);
    bool _1662 = _1658 || _1660;
    bool _1664 = isnan(0.0);
    bool _1666 = _1662 || _1664;
    float _1668 = _1650 * _1652;
    float _1670 = fma(_1654, (*spvDescriptorSet0.vp_c9)._m0[80].x, _1458);
    float _1672 = -_1642;
    float _1674 = _1672 + 1.0;
    int _1676 = _1666 ? 0 : 1;
    bool _1678 = _1132 > 0.0;
    float _1680 = fma(_1674, (*spvDescriptorSet0.vp_c9)._m0[131].x, _1668);
    float _1682 = -_1500;
    float _1684 = fma(_1504, _1682, _1670);
    float _1686 = fma(_1332, _1516, _1510);
    float _1688 = fma(_1480, (*spvDescriptorSet0.vp_c10)._m0[4].z, _1570);
    float _1690 = fma(_1588, (*spvDescriptorSet0.vp_c9)._m0[132].x, _1680);
    float _1692 = _1656 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    int _1694 = _1138 >> 31;
    float _1696 = _527 + _525;
    int _1698 = _1194 >> 31;
    float _1700 = fma(_1480, (*spvDescriptorSet0.vp_c10)._m0[6].z, _1590);
    float _1702 = _1688 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _1704 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1706 = _1692 + _1704;
    int _1708 = _1694 & 3;
    float _1710 = _1696 + (-1.0);
    float _1712 = _1700 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    int _1714 = _1698 & 3;
    float _1716 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1718 = _1702 + _1716;
    float _1720 = _1706 * _1706;
    int _1722 = _1138 + _1708;
    out.m_66.x = _1684;
    out.m_66.y = _1686;
    float _1724 = fma(_1710, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _1726 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1728 = _1712 + _1726;
    float _1730 = fma(_1718, _1718, _1720);
    int _1732 = _1722 >> 2;
    float _1734 = _1706 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    bool _1736 = !_1208;
    int _1738 = _1736 ? 0 : 1;
    float _1740 = fma(_1728, _1728, _1730);
    int _1742 = _1732 << 4;
    int _1744 = _1742 + 368;
    float _1746 = fma(_1718, (*spvDescriptorSet0.vp_c8)._m0[28].x, _1734);
    int _1748 = _1194 + _1714;
    float _1750 = _531 * (*spvDescriptorSet0.vp_c9)._m0[18].w;
    bool _1752 = _1148 != 3;
    float _1754 = rsqrt(_1740);
    int _1756 = _1748 >> 2;
    float _1758 = fma(_1728, (*spvDescriptorSet0.vp_c8)._m0[28].z, _1746);
    int _1760 = ~_1676;
    int _1762 = _1760 + 1;
    int _1764 = _1762 + 1;
    float _1766 = _1690 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    int _1768 = _1756 << 4;
    int _1770 = _1768 + 512;
    uint _1772 = uint(int(uint(_1744) >> uint(2)));
    uint _1774 = uint(int(uint(int(_1772)) >> uint(2)));
    int _1776 = int(_1772) & 3;
    float _1778 = (*spvDescriptorSet0.vp_c9)._m0[int(_1774)][_1776];
    int _1780 = int(_1772) + 1;
    uint _1782 = uint(int(uint(_1780) >> uint(2)));
    int _1784 = _1780 & 3;
    float _1786 = (*spvDescriptorSet0.vp_c9)._m0[int(_1782)][_1784];
    int _1788 = _1764;
    float _1790 = _1712;
    if (!_1678)
    {
        int _1792 = ~_1676;
        int _1794 = _1792 + 1;
        _1788 = _1794;
    }
    int _1796 = _1788;
    float _1798 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].w;
    bool _1800 = !_1752;
    int _1802 = _1800 ? 0 : (-1);
    out.m_68.w = _1766;
    bool _1804 = _1206 != 3;
    int _1806 = abs(_1222);
    uint _1808 = uint(int(uint(_1770) >> uint(2)));
    uint _1810 = uint(int(uint(int(_1808)) >> uint(2)));
    int _1812 = int(_1808) & 3;
    float _1814 = (*spvDescriptorSet0.vp_c9)._m0[int(_1810)][_1812];
    int _1816 = int(_1808) + 1;
    uint _1818 = uint(int(uint(_1816) >> uint(2)));
    int _1820 = _1816 & 3;
    float _1822 = (*spvDescriptorSet0.vp_c9)._m0[int(_1818)][_1820];
    bool _1824 = !_1804;
    int _1826 = _1824 ? 0 : (-1);
    bool _1828 = _1758 >= 0.0;
    float _1830 = _1750 * _1754;
    int _1832 = abs(_1306);
    int _1834 = abs(_1316);
    int _1836 = _1744 + 8;
    uint _1838 = uint(int(uint(_1836) >> uint(2)));
    uint _1840 = uint(int(uint(int(_1838)) >> uint(2)));
    int _1842 = int(_1838) & 3;
    float _1844 = (*spvDescriptorSet0.vp_c9)._m0[int(_1840)][_1842];
    int _1846 = int(_1838) + 1;
    uint _1848 = uint(int(uint(_1846) >> uint(2)));
    int _1850 = _1846 & 3;
    float _1852 = (*spvDescriptorSet0.vp_c9)._m0[int(_1848)][_1850];
    float _1854 = _1706 * _1830;
    float _1856 = _1718 * _1830;
    float _1858 = _1728 * _1830;
    float _1860 = _1798 * (*spvDescriptorSet0.vp_c9)._m0[90].y;
    float _1862 = -_1854;
    float _1864 = _1706 + _1862;
    float _1866 = -_1856;
    float _1868 = _1718 + _1866;
    float _1870 = -_1858;
    float _1872 = _1728 + _1870;
    int _1874 = _1770 + 8;
    uint _1876 = uint(int(uint(_1874) >> uint(2)));
    uint _1878 = uint(int(uint(int(_1876)) >> uint(2)));
    int _1880 = int(_1876) & 3;
    float _1882 = (*spvDescriptorSet0.vp_c9)._m0[int(_1878)][_1880];
    int _1884 = int(_1876) + 1;
    uint _1886 = uint(int(uint(_1884) >> uint(2)));
    int _1888 = _1884 & 3;
    float _1890 = (*spvDescriptorSet0.vp_c9)._m0[int(_1886)][_1888];
    float _1892 = _1864 * _1864;
    float _1894 = _858 + (-0.5);
    bool _1896 = !_1620;
    int _1898 = _1896 ? 0 : 1;
    float _1900 = _1856;
    if (_1828)
    {
        out.m_49.x = 0.0;
    }
    float _1902 = fma(_1868, _1868, _1892);
    float _1904 = -_1860;
    float _1906 = -_1426;
    float _1908 = fma(_1904, _1894, _1906);
    int _1910 = abs(_1256);
    float _1912 = -_1530;
    float _1914 = fma(_854, _1912, _1366);
    float _1916 = fma(_1872, _1872, _1902);
    int _1918 = abs(_1204);
    float _1920 = _525 + (-0.5);
    int _1922 = abs(_1646);
    int _1924 = ~_1918;
    int _1926 = _1924 + 1;
    int _1928 = _1926 + 1;
    int _1930 = ~_1910;
    int _1932 = _1930 + 1;
    int _1934 = _1932 + 1;
    int _1936 = ~_1922;
    int _1938 = _1936 + 1;
    int _1940 = _1938 + 1;
    int _1942 = abs(_1738);
    int _1944 = ~_1466;
    int _1946 = _1944 + _1562;
    int _1948 = _1946 + 1;
    int _1950 = _1928 * as_type<int>(_1786);
    int _1952 = ~_1806;
    int _1954 = _1952 + 1;
    int _1956 = _1954 + 1;
    int _1958 = ~_1532;
    int _1960 = _1958 + _1612;
    int _1962 = _1960 + 1;
    int _1964 = _1940 * as_type<int>(_1778);
    int _1966 = _1964 + _1950;
    int _1968 = abs(_1802);
    int _1970 = _547 * _1948;
    int _1972 = _1970 + _816;
    int _1974 = abs(_1898);
    int _1976 = _1934 * as_type<int>(_1822);
    int _1978 = ~_1942;
    int _1980 = _1978 + 1;
    int _1982 = _1980 + 1;
    int _1984 = _567 * _1962;
    int _1986 = _1984 + _922;
    bool _1988 = _547 == 0;
    float _1990 = float(_1796);
    int _1992 = _1982 * as_type<int>(_1814);
    int _1994 = _1992 + _1976;
    int _1996 = _1956 * as_type<int>(_1844);
    int _1998 = _1996 + _1966;
    bool _2000 = !_1574;
    int _2002 = _2000 ? 0 : 1;
    int _2004 = abs(_1826);
    int _2006 = abs(_2002);
    int _2008 = ~_1968;
    int _2010 = _2008 + 1;
    int _2012 = _2010 + 1;
    int _2014 = ~_1832;
    int _2016 = _2014 + 1;
    int _2018 = _2016 + 1;
    int _2020 = ~_2004;
    int _2022 = _2020 + 1;
    int _2024 = _2022 + 1;
    int _2026 = _2012 * as_type<int>(_1852);
    int _2028 = _2026 + _1998;
    float _2030 = float(_1974);
    int _2032 = _2018 * as_type<int>(_1882);
    int _2034 = _2032 + _1994;
    float _2036 = in.m_70.x;
    float _2038 = in.m_70.y;
    float _2040 = in.m_70.z;
    int _2042 = _2024 * as_type<int>(_1890);
    int _2044 = _2042 + _2034;
    float _2046 = sqrt(_1916);
    int _2048 = ~_1834;
    int _2050 = _2048 + 1;
    int _2052 = _2050 + 1;
    float _2054 = -_1464;
    float _2056 = _2054 + 1.0;
    int _2058 = ~_2006;
    int _2060 = _2058 + 1;
    int _2062 = _2060 + 1;
    float _2064 = _2030 * _1990;
    bool _2066 = !_1988;
    int _2068 = _2066 ? _1972 : (-1);
    int _2070 = _2028 * _2052;
    bool _2072 = !_938;
    int _2074 = _2072 ? _1986 : (-1);
    int _2076 = _2044 * _2062;
    float _2078 = fma(_858, _2056, _1908);
    int _2080 = _2068 * _1834;
    int _2082 = _2080 + _2070;
    if (_1828)
    {
        _1198 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _2084 = _1198;
    float _2086 = _2064 * (-2.0);
    int _2088 = _2074 * _2006;
    int _2090 = _2088 + _2076;
    bool _2092 = !_1624;
    int _2094 = _2092 ? 0 : 1;
    out.m_72.x = _1914;
    out.m_72.y = _2078;
    float _2096 = _1754 * _2046;
    int _2098 = as_type<int>(_2084);
    if (_1828)
    {
        float _2100 = _2084 * 5.0;
        _2098 = as_type<int>(_2100);
    }
    int _2102 = _2098;
    float _2104 = float(_2082);
    float _2106 = fma(_2086, _2036, _2036);
    float _2108 = float(_2090);
    float _2110 = _531 * _2096;
    if (_1828)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _6676 = as_type<float>(_2102);
        out.gl_Position.z = _6676;
    }
    float _2112 = fma(_1920, (*spvDescriptorSet0.vp_c9)._m0[196].x, _2106);
    float _2114 = _527 + _740;
    float _2116 = float(_1546);
    out.m_74.x = _2104;
    out.m_74.y = _2108;
    float _2118 = fma(_1724, _2086, _1724);
    float _2120 = _2114 + (-1.0);
    out.m_76.x = _2110;
    bool _2122 = !_1628;
    int _2124 = _2122 ? 0 : 1;
    int _2126 = abs(_2094);
    if (_1828)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _2128 = -_1854;
    float _2130 = _1692 + _2128;
    int _2132 = abs(_2124);
    float _2134 = -_1856;
    float _2136 = _1702 + _2134;
    float _2138 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2140 = _2130 + _2138;
    float _2142 = -_1858;
    float _2144 = _1712 + _2142;
    float _2146 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2148 = _2136 + _2146;
    float _2150 = float(_2126);
    float _2152 = _2140 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _2154 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2156 = _2144 + _2154;
    float _2158 = float(_1604);
    float _2160 = fma(_2120, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _2162 = fma(_2148, (*spvDescriptorSet0.vp_c8)._m0[28].x, _2152);
    float _2164 = _2150 * _2116;
    float _2166 = float(_2132);
    float _2168 = _527 + (-0.5);
    float _2170 = fma(_2156, (*spvDescriptorSet0.vp_c8)._m0[28].z, _2162);
    float _2172 = _2164 * (-2.0);
    float _2174 = _740 + _525;
    float _2176 = _2166 * _2158;
    float _2178 = fma(_2118, _1470, _2112);
    bool _2180 = _2170 >= 0.0;
    float _2182 = fma(_2172, _2038, _2038);
    float _2184 = fma(_2160, _2172, _2160);
    float _2186 = _2174 + (-1.0);
    float _2188 = fma(_2168, (*spvDescriptorSet0.vp_c9)._m0[196].y, _2182);
    float _2190 = _2176 * (-2.0);
    float _2192 = _2178 * 0.15915493667125701904296875;
    float _2194 = fma(_2186, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _2196 = fma(_2184, _1470, _2188);
    float _2198 = fma(_2190, _2040, _2040);
    float _2200 = _740 + (-0.5);
    float _2202 = _2192 * 6.283185482025146484375;
    float _2204 = sin(_2202);
    float _2206 = _2196 * 0.15915493667125701904296875;
    float _2208 = _2160;
    float _2210 = _2148;
    float _2212 = _2156;
    if (_2180)
    {
        _2208 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _2214 = _2208;
    float _2216 = fma(_2194, _2190, _2194);
    float _2218 = fma(_2200, (*spvDescriptorSet0.vp_c9)._m0[196].z, _2198);
    int _2220 = as_type<int>(_2214);
    if (_2180)
    {
        out.m_49.x = 0.0;
    }
    if (_2180)
    {
        float _2222 = _2214 * 5.0;
        _2220 = as_type<int>(_2222);
    }
    int _2224 = _2220;
    float _2226 = _2192 * 6.283185482025146484375;
    float _2228 = cos(_2226);
    float _2230 = fma(_2216, _1470, _2218);
    if (_2180)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _6879 = as_type<float>(_2224);
        out.gl_Position.z = _6879;
    }
    float _2232 = _2230 * 0.15915493667125701904296875;
    float _2234 = _2206 * 6.283185482025146484375;
    float _2236 = sin(_2234);
    float _2238 = _2206 * 6.283185482025146484375;
    float _2240 = cos(_2238);
    if (_2180)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _2242 = _2232 * 6.283185482025146484375;
    float _2244 = cos(_2242);
    float _2246 = _323 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _2248 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _207);
    float _2250 = _2204 * _2236;
    float _2252 = _2228 * _2240;
    float _2254 = _2246 * _2096;
    float _2256 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _217);
    float _2258 = _2204 * _2240;
    float _2260 = _2232 * 6.283185482025146484375;
    float _2262 = sin(_2260);
    float _2264 = _2254 * _2248;
    float _2266 = _2228 * _2236;
    float _2268 = _2096 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _2270 = _2268 * 0.5;
    float _2272 = _2228 * _2244;
    float _2274 = _2240 * _2244;
    float _2276 = _2204 * _2244;
    float _2278 = _2236 * _2244;
    float _2280 = _2110 * _2256;
    float _2282 = _2272 * _2264;
    float _2284 = fma(_2262, _2252, _2250);
    float _2286 = -_2258;
    float _2288 = fma(_2262, _2266, _2286);
    float _2290 = -_2264;
    float _2292 = _2262 * _2290;
    float _2294 = -_2266;
    float _2296 = fma(_2262, _2258, _2294);
    float _2298 = fma(_2284, _2280, _2282);
    float _2300 = _2276 * _2264;
    float _2302 = fma(_2274, _2280, _2292);
    float _2304 = fma(_2288, _2270, _2298);
    float _2306 = fma(_2262, _2250, _2252);
    float _2308 = fma(_2296, _2280, _2300);
    float _2310 = fma(_2278, _2270, _2302);
    float _2312 = _2304 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2314 = _2304 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2316 = fma(_2306, _2270, _2308);
    float _2318 = fma(_2310, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2312);
    float _2320 = fma(_2310, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2314);
    float _2322 = fma(_2316, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2318);
    float _2324 = fma(_2316, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2320);
    float _2326 = _2322 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _2328 = _2324 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _2330 = _1712 + _2326;
    float _2332 = _1702 + _2328;
    float _2334 = _2304 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2336 = _2130 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _2338 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _2340 = _2330 + _2338;
    float _2342 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _2344 = _2332 + _2342;
    float _2346 = fma(_2310, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2334);
    float _2348 = fma(_2136, (*spvDescriptorSet0.vp_c8)._m0[11].x, _2336);
    float _2350 = _2340 * _2340;
    float _2352 = fma(_2316, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2346);
    float _2354 = fma(_2144, (*spvDescriptorSet0.vp_c8)._m0[11].z, _2348);
    float _2356 = fma(_2344, _2344, _2350);
    float _2358 = _2352 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _2360 = sqrt(_2356);
    float _2362 = _1692 + _2358;
    bool _2364 = _2360 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2366 = _2352;
    float _2368 = _2358;
    float _2370 = _2336;
    float _2372 = _2280;
    if (!_2364)
    {
        _2366 = _2332;
    }
    float _2374 = _2366;
    float _2376 = _2374;
    if (!_2364)
    {
        _2368 = _2330;
    }
    float _2378 = _2368;
    float _2380 = _2378;
    if (!_2364)
    {
        _2370 = _2362;
    }
    float _2382 = _2370;
    bool _2384 = !_2364;
    float _2386 = _2382;
    if (!_2384)
    {
        float _2388 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2390 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _2392 = _2360 + _2390;
        float _2394 = rsqrt(_2356);
        float _2396 = _2392 * _2388;
        float _2398 = _2362 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2400 = _2396 * 0.15915493667125701904296875;
        float _2402 = _2400 * 6.283185482025146484375;
        float _2404 = cos(_2402);
        float _2406 = _2400 * 6.283185482025146484375;
        float _2408 = sin(_2406);
        float _2410 = _2404 + (-1.0);
        float _2412 = fma(_2408, _2398, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _2414 = _2410 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2416 = _2394 * _2412;
        float _2418 = fma(_2362, _2404, _2414);
        float _2420 = fma(_2344, _2416, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _2422 = fma(_2340, _2416, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _2386 = _2418;
        _2376 = _2420;
        _2380 = _2422;
        _2372 = _2400;
    }
    float _2424 = _2386;
    float _2426 = _2376;
    float _2428 = _2380;
    float _2430 = _2372;
    float _2432 = -_1692;
    float _2434 = _2432 + _2424;
    float _2436 = -_1702;
    float _2438 = _2436 + _2426;
    float _2440 = -_1712;
    float _2442 = _2440 + _2428;
    float _2444 = _2354 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _2446 = _2434 * _2434;
    float _2448 = _2130 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _2450 = 1.0 / _2444;
    float _2452 = fma(_2438, _2438, _2446);
    float _2454 = fma(_2136, (*spvDescriptorSet0.vp_c8)._m0[10].x, _2448);
    bool _2456 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _2458 = isnan(0.5);
    bool _2460 = _2456 || _2458;
    bool _2462 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _2464 = _2460 || _2462;
    float _2466 = fma(_2442, _2442, _2452);
    float _2468 = fma(_2144, (*spvDescriptorSet0.vp_c8)._m0[10].z, _2454);
    bool _2470 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _2472 = isnan(0.5);
    bool _2474 = _2470 || _2472;
    bool _2476 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _2478 = _2474 || _2476;
    float _2480 = sqrt(_2466);
    float _2482 = _2468 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _2484 = _2482 + _2444;
    float _2486 = _2484 * _2450;
    float _2488 = _2486 * 0.5;
    bool _2490 = _2480 > 0.0;
    float _2492 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _2494 = fma(_2488, (*spvDescriptorSet0.vp_c8)._m0[30].w, _2492);
    float _2496 = 1.0 / _2494;
    float _2498 = _2488;
    float _2500 = _2450;
    float _2502 = _2430;
    if (!_2490)
    {
        _2498 = _2426;
    }
    float _2504 = _2498;
    float _2506 = _2504;
    if (!_2490)
    {
        _2500 = _2424;
    }
    float _2508 = _2500;
    float _2510 = _2508;
    if (!_2490)
    {
        _2502 = _2428;
    }
    float _2512 = _2502;
    bool _2514 = !_2490;
    float _2516 = _2512;
    float _2518 = _2512;
    if (!_2514)
    {
        float _2520 = _211 * _211;
        float _2522 = fma(_209, _209, _2520);
        float _2524 = rsqrt(_2466);
        float _2526 = fma(_213, _213, _2522);
        float _2528 = sqrt(_2526);
        float _2530 = _2438 * _2524;
        float _2532 = _2434 * _2524;
        float _2534 = _2442 * _2524;
        bool _2536 = _2528 > 0.0;
        float _2538 = _2524;
        float _2540 = _2528;
        if (!_2536)
        {
            _2538 = _2426;
        }
        float _2542 = _2538;
        _2506 = _2542;
        if (!_2536)
        {
            _2540 = _2424;
        }
        float _2544 = _2540;
        _2510 = _2544;
        if (!_2536)
        {
            _2516 = _2428;
        }
        float _2546 = _2516;
        bool _2548 = !_2536;
        _2518 = _2546;
        if (!_2548)
        {
            float _2550 = rsqrt(_2526);
            float _2552 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].z;
            float _2554 = _211 * _2550;
            float _2556 = _209 * _2550;
            float _2558 = _2532 * _2554;
            float _2560 = _213 * _2550;
            float _2562 = fma(_2530, _2556, _2558);
            float _2564 = _2552 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _2566 = fma(_2534, _2560, _2562);
            float _2568 = _2566 * _2564;
            float _2570 = fma(_209, _2568, _2426);
            float _2572 = fma(_211, _2568, _2424);
            float _2574 = fma(_213, _2568, _2428);
            _2506 = _2570;
            _2510 = _2572;
            _2518 = _2574;
        }
    }
    float _2576 = _2506;
    float _2578 = _2510;
    float _2580 = _2518;
    float _2582 = -_1856;
    float _2584 = _2582 + _2576;
    float _2586 = -_1854;
    float _2588 = _2586 + _2578;
    float _2590 = -_1858;
    float _2592 = _2590 + _2580;
    float _2594 = _2588;
    float _2596 = _2584;
    float _2598 = _2592;
    if (_2478)
    {
        _221 = 1.0;
    }
    float _2600 = _221;
    float _2602 = _2600;
    if (!_2464)
    {
        float _2604 = _2140 * _2140;
        float _2606 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _2608 = -_1712;
        float _2610 = _2608 + _2580;
        float _2612 = -_1692;
        float _2614 = _2612 + _2578;
        float _2616 = fma(_2148, _2148, _2604);
        float _2618 = fma(_2156, _2156, _2616);
        float _2620 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _2622 = sqrt(_2618);
        float _2624 = 1.0 / _2096;
        float _2626 = precise::min(_2622, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _2628 = _2626 * _2606;
        float _2630 = _2620 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _2632 = -_1702;
        float _2634 = _2632 + _2576;
        float _2636 = _2628 * _2624;
        float _2638 = _2630 * _2636;
        float _2640 = _2610 * _2636;
        float _2642 = fma(_2614, _2638, _2130);
        float _2644 = fma(_2634, _2638, _2136);
        float _2646 = fma(_2630, _2640, _2144);
        _2594 = _2642;
        _2596 = _2644;
        _2598 = _2646;
        _2210 = _2622;
        _1790 = _2640;
    }
    float _2648 = _2594;
    float _2650 = _2596;
    float _2652 = _2598;
    float _2654 = _2210;
    float _2656 = _1790;
    float _2658 = _2654;
    float _2660 = _2656;
    if (_2478)
    {
        _1900 = 1.0;
    }
    float _2662 = _1900;
    float _2664 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _2666 = _2496 * _2664;
    float _2668 = _2662;
    if (!_2478)
    {
        float _2670 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _2672 = _2670 * 0.15915493667125701904296875;
        float _2674 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _2676 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2678 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _2676;
        float _2680 = _2672 * 6.283185482025146484375;
        float _2682 = cos(_2680);
        float _2684 = _2674 * 0.15915493667125701904296875;
        float _2686 = _2672 * 6.283185482025146484375;
        float _2688 = sin(_2686);
        float _2690 = 1.0 / _2682;
        float _2692 = _2684 * 6.283185482025146484375;
        float _2694 = cos(_2692);
        float _2696 = _2688 * _2690;
        float _2698 = _2684 * 6.283185482025146484375;
        float _2700 = sin(_2698);
        float _2702 = _2694 * _2696;
        float _2704 = 1.0 / _2678;
        float _2706 = 1.0 / _2702;
        float _2708 = _2700 * _2706;
        float _2710 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2712 = fma(_2666, _2708, _2710);
        float _2714 = _2712 * _2704;
        float _2716 = precise::clamp(_2714, 0.0, 1.0);
        _2212 = _2684;
        _2658 = _2696;
        _2602 = _2716;
    }
    float _2718 = _2212;
    float _2720 = _2658;
    float _2722 = _2602;
    float _2724 = _2718;
    float _2726 = _2720;
    if (!_2478)
    {
        float _2728 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _2730 = _2728 * 0.15915493667125701904296875;
        float _2732 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _2734 = _2730 * 6.283185482025146484375;
        float _2736 = cos(_2734);
        float _2738 = _2732 * 0.15915493667125701904296875;
        float _2740 = _2730 * 6.283185482025146484375;
        float _2742 = sin(_2740);
        float _2744 = 1.0 / _2736;
        float _2746 = _2738 * 6.283185482025146484375;
        float _2748 = cos(_2746);
        float _2750 = _2742 * _2744;
        float _2752 = _2738 * 6.283185482025146484375;
        float _2754 = sin(_2752);
        float _2756 = _2748 * _2750;
        float _2758 = 1.0 / _2756;
        float _2760 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _2762 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _2760;
        float _2764 = 1.0 / _2762;
        float _2766 = _2754 * _2758;
        float _2768 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _2770 = fma(_2666, _2766, _2768);
        float _2772 = _2770 * _2764;
        float _2774 = precise::clamp(_2772, 0.0, 1.0);
        float _2776 = -_2774;
        float _2778 = _2776 + 1.0;
        _2724 = _2744;
        _2726 = _2756;
        _2668 = _2778;
    }
    float _2780 = _2724;
    float _2782 = _2726;
    float _2784 = _2668;
    float _2786 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2788 = _2648 + _2786;
    float _2790 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2792 = _2650 + _2790;
    float _2794 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2796 = _2652 + _2794;
    float _2798 = _2648 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _2800 = _2788 * _2788;
    float _2802 = fma(_2650, (*spvDescriptorSet0.vp_c8)._m0[3].x, _2798);
    float _2804 = fma(_2792, _2792, _2800);
    float _2806 = fma(_2796, _2796, _2804);
    float _2808 = rsqrt(_2806);
    float _2810 = sqrt(_2806);
    float _2812 = _2808 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _2814 = _2792 * _2812;
    float _2816 = _2796 * _2812;
    float _2818 = _2814 * _2814;
    float _2820 = _2816 * _2816;
    float _2822 = _2818 + _2820;
    float _2824 = sqrt(_2822);
    bool _2826 = _2824 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2828 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2830 = _2824 + _2828;
    float _2832 = _2780;
    float _2834 = _2822;
    float _2836 = _2830;
    float _2838 = _2782;
    float _2840 = _2788;
    if (_2826)
    {
        float _2842 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2832 = _2842;
    }
    float _2844 = _2832;
    if (_2826)
    {
        float _2846 = rsqrt(_2822);
        _2834 = _2846;
    }
    float _2848 = _2834;
    float _2850 = _2848;
    if (_2826)
    {
        float _2852 = _2830 * _2844;
        _2836 = _2852;
    }
    float _2854 = _2836;
    if (_2826)
    {
        float _2856 = _2854 * 0.15915493667125701904296875;
        _2838 = _2856;
    }
    float _2858 = _2838;
    float _2860 = _2796;
    float _2862 = _2858;
    if (_2826)
    {
        float _2864 = _2858 * 6.283185482025146484375;
        float _2866 = sin(_2864);
        _2860 = _2866;
    }
    float _2868 = _2860;
    float _2870 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _2872 = precise::max(0.0, _2870);
    float _2874 = _2844;
    if (_2826)
    {
        float _2876 = _2858 * 6.283185482025146484375;
        float _2878 = cos(_2876);
        _2874 = _2878;
    }
    float _2880 = _2874;
    float _2882 = -_2812;
    float _2884 = -_2872;
    float _2886 = fma(_2788, _2882, _2884);
    float _2888 = (*spvDescriptorSet0.vp_c15)._m0[652].x;
    if (_2826)
    {
        float _2890 = _2886 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2840 = _2890;
    }
    float _2892 = _2840;
    float _2894 = _2892;
    if (!_2826)
    {
        _2862 = _2814;
    }
    float _2896 = _2862;
    float _2898 = fma(_2136, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _2900 = _2868;
    float _2902 = _2896;
    if (_2826)
    {
        float _2904 = fma(_2868, _2892, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _2900 = _2904;
    }
    float _2906 = _2900;
    float _2908 = _2906;
    if (!_2826)
    {
        _2894 = _2886;
    }
    float _2910 = _2894;
    float _2912 = _2910;
    float _2914 = _2880;
    if (_2826)
    {
        float _2916 = _2880 + (-1.0);
        _2888 = _2916;
    }
    float _2918 = _2888;
    float _2920 = _2918;
    if (_2826)
    {
        float _2922 = _2848 * _2906;
        _2660 = _2922;
    }
    float _2924 = _2660;
    if (!_2826)
    {
        _2850 = _2816;
    }
    float _2926 = _2850;
    float _2928 = _2926;
    if (_2826)
    {
        float _2930 = _2918 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2920 = _2930;
    }
    float _2932 = _2920;
    if (_2826)
    {
        float _2934 = _2814 * _2924;
        _2902 = _2934;
    }
    float _2936 = _2902;
    if (!_2826)
    {
        _2908 = _2818;
    }
    float _2938 = _2908;
    float _2940 = _2938;
    if (_2826)
    {
        float _2942 = _2816 * _2924;
        _2928 = _2942;
    }
    float _2944 = _2928;
    if (_2826)
    {
        float _2946 = fma(_2886, _2880, _2932);
        _2912 = _2946;
    }
    float _2948 = _2912;
    if (_2826)
    {
        float _2950 = _2936 * _2936;
        _2940 = _2950;
    }
    float _2952 = _2940;
    if (!_2826)
    {
        _2914 = _2820;
    }
    float _2954 = _2914;
    float _2956 = _2954;
    if (_2826)
    {
        float _2958 = _2944 * _2944;
        _2956 = _2958;
    }
    float _2960 = _2956;
    float _2962 = _2648 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _2964 = fma(_2948, _2948, _2952);
    float _2966 = floor(_2898);
    float _2968 = fma(_2650, (*spvDescriptorSet0.vp_c8)._m0[2].x, _2962);
    float _2970 = _2964 + _2960;
    float _2972 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _2974 = fma(_2810, (*spvDescriptorSet0.vp_c15)._m0[23].w, _2972);
    float _2976 = precise::clamp(_2974, 0.0, 1.0);
    float _2978 = fma(_2652, (*spvDescriptorSet0.vp_c8)._m0[2].z, _2968);
    float _2980 = rsqrt(_2970);
    float _2982 = -_2976;
    float _2984 = _2982 + 1.0;
    float _2986 = _2978 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _2988 = fma(_2144, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _2990 = _2648 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2992 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _2994 = abs(_2984);
    float _2996 = log2(_2994);
    float _2998 = _2648 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _3000 = _2986 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _3002 = fma(_2650, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2990);
    float _3004 = fma(_2650, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2998);
    float _3006 = -_3000;
    float _3008 = fma(_3006, _2992, 1.0);
    float _3010 = fma(_2652, (*spvDescriptorSet0.vp_c8)._m0[0].z, _3002);
    float _3012 = _2980 * _2936;
    float _3014 = fma(_2652, (*spvDescriptorSet0.vp_c8)._m0[1].z, _3004);
    float _3016 = _2980 * _2948;
    float _3018 = _2980 * _2944;
    float _3020 = _3012 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _3022 = _3014 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _3024 = _3010 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _3026 = floor(_2988);
    float _3028 = -_3020;
    float _3030 = fma(_3016, (*spvDescriptorSet0.vp_c15)._m0[21].y, _3028);
    float _3032 = _3022 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _3034 = _2996 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _3036 = -_3018;
    float _3038 = fma(_3036, (*spvDescriptorSet0.vp_c15)._m0[21].z, _3030);
    float _3040 = fma(_2652, (*spvDescriptorSet0.vp_c8)._m0[3].z, _2802);
    float _3042 = fma(_3024, (*spvDescriptorSet0.vp_c8)._m0[7].x, _3032);
    float _3044 = exp2(_3034);
    float _3046 = fma(_3038, -0.5, 0.5);
    float _3048 = _3040 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _3050 = fma(_2986, (*spvDescriptorSet0.vp_c8)._m0[7].z, _3042);
    float _3052 = fma(_3038, 0.5, 0.5);
    float _3054 = _3022 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _3056 = fma(_3048, (*spvDescriptorSet0.vp_c8)._m0[7].w, _3050);
    float _3058 = log2(_3008);
    float _3060 = -_3026;
    float _3062 = _2988 + _3060;
    float _3064 = fma(_3052, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _3066 = fma(_3024, (*spvDescriptorSet0.vp_c8)._m0[5].x, _3054);
    float _3068 = fma(_3052, _3064, -0.212114393711090087890625);
    float _3070 = fma(_2986, (*spvDescriptorSet0.vp_c8)._m0[5].z, _3066);
    float _3072 = 1.0 / _3056;
    float _3074 = -_2966;
    float _3076 = _2898 + _3074;
    float _3078 = _3022 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _3080 = fma(_3024, (*spvDescriptorSet0.vp_c8)._m0[4].x, _3078);
    float _3082 = _3016 + 1.0;
    float _3084 = sqrt(_3046);
    float _3086 = _3058 * 0.693147182464599609375;
    float _3088 = fma(_2986, (*spvDescriptorSet0.vp_c8)._m0[4].z, _3080);
    float _3090 = -_3016;
    float _3092 = fma(_3044, _3082, _3090);
    float _3094 = fma(_3052, _3068, 1.570728778839111328125);
    float2 _8232 = float2(_3076, _3062);
    float _3096 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_8232, float2(0.0), isnan(_8232)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_8232, float2(0.0), isnan(_8232)), level(0.0)).x;
    float _3098 = fma(_3048, (*spvDescriptorSet0.vp_c8)._m0[4].w, _3088);
    float _3100 = fma(_3048, (*spvDescriptorSet0.vp_c8)._m0[5].w, _3070);
    float _3102 = _3086 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _3104 = fma(_3092, 0.5, 0.5);
    float _3106 = _3098 * _3072;
    float _3108 = _3100 * _3072;
    float _3110 = fma(_3106, 0.5, 0.5);
    float _3112 = fma(_3108, -0.5, 0.5);
    float _3114 = _3084 * 0.636619746685028076171875;
    float _3116 = -_3094;
    float _3118 = fma(_3114, _3116, 1.0);
    float3 _8277 = float3(_3110, _3112, _3102);
    float _3120 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_8277, float3(0.0), isnan(_8277)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_8277, float3(0.0), isnan(_8277)), level(0.0)).x;
    float3 _8288 = float3(_3110, _3112, _3102);
    float4 _3123 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_8288, float3(0.0), isnan(_8288)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_8288, float3(0.0), isnan(_8288)), level(0.0)).xyzw;
    float _3125 = _3123.x;
    float _3127 = _3123.y;
    float _3129 = _3123.z;
    float _3131 = _3123.w;
    float2 _8304 = float2(_3118, _3104);
    float3 _3135 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_8304, float2(0.0), isnan(_8304)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_8304, float2(0.0), isnan(_8304)), level(0.0)).xyz;
    float _3137 = _3135.x;
    float _3139 = _3135.y;
    float _3141 = _3135.z;
    float _3143 = abs(_2666);
    float _3145 = log2(_3143);
    float _3147 = _2284 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _3149 = _2284 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _3151 = _2284 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _3153 = _2272 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _3155 = fma(_2274, (*spvDescriptorSet0.vp_c8)._m0[24].x, _3147);
    float _3157 = fma(_2274, (*spvDescriptorSet0.vp_c8)._m0[25].x, _3149);
    float _3159 = fma(_2274, (*spvDescriptorSet0.vp_c8)._m0[26].x, _3151);
    float _3161 = _2272 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _3163 = _2272 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _3165 = _2288 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _3167 = _2288 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _3169 = _2288 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _3171 = -_2262;
    float _3173 = fma(_3171, (*spvDescriptorSet0.vp_c8)._m0[25].x, _3153);
    float _3175 = -_2262;
    float _3177 = fma(_3175, (*spvDescriptorSet0.vp_c8)._m0[26].x, _3163);
    float _3179 = _207 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _3181 = _3145 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _3183 = -_2262;
    float _3185 = fma(_3183, (*spvDescriptorSet0.vp_c8)._m0[24].x, _3161);
    float _3187 = fma(_2278, (*spvDescriptorSet0.vp_c8)._m0[24].x, _3165);
    float _3189 = fma(_2278, (*spvDescriptorSet0.vp_c8)._m0[25].x, _3167);
    float _3191 = exp2(_3181);
    float _3193 = fma(_2278, (*spvDescriptorSet0.vp_c8)._m0[26].x, _3169);
    float _3195 = fma(_2276, (*spvDescriptorSet0.vp_c8)._m0[24].z, _3185);
    float _3197 = fma(_2306, (*spvDescriptorSet0.vp_c8)._m0[24].z, _3187);
    float _3199 = fma(_2306, (*spvDescriptorSet0.vp_c8)._m0[25].z, _3189);
    float _3201 = fma(_2306, (*spvDescriptorSet0.vp_c8)._m0[26].z, _3193);
    float _3203 = fma(_2296, (*spvDescriptorSet0.vp_c8)._m0[24].z, _3155);
    float _3205 = fma(_2276, (*spvDescriptorSet0.vp_c8)._m0[25].z, _3173);
    float _3207 = fma(_3179, _3179, 1.0);
    float _3209 = _217 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _3211 = fma(_2276, (*spvDescriptorSet0.vp_c8)._m0[26].z, _3177);
    float _3213 = _3022 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _3215 = rsqrt(_3207);
    float _3217 = fma(_2296, (*spvDescriptorSet0.vp_c8)._m0[25].z, _3157);
    float _3219 = _2996 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _3221 = fma(_3191, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _3223 = precise::clamp(_3221, 0.0, 1.0);
    float _3225 = fma(_2296, (*spvDescriptorSet0.vp_c8)._m0[26].z, _3159);
    float _3227 = _3179 * _3205;
    float _3229 = _3223 * _3223;
    float _3231 = fma(_3024, (*spvDescriptorSet0.vp_c8)._m0[6].x, _3213);
    float _3233 = fma(_3223, -2.0, 3.0);
    float _3235 = _3179 * _3195;
    float _3237 = exp2(_3219);
    float _3239 = fma(_3209, _3217, _3227);
    float _3241 = _3229 * _3233;
    float _3243 = fma(_3209, _3203, _3235);
    float _3245 = _3179 * _3211;
    float _3247 = _3179 * _3215;
    float _3249 = -_3241;
    float _3251 = _3249 + 1.0;
    out.m_78.x = _3203;
    out.m_78.y = _3217;
    out.m_78.z = _3225;
    float _3253 = fma(_3209, _3225, _3245);
    float _3255 = -_3197;
    float _3257 = _3247 * _3255;
    float _3259 = fma(_3251, (*spvDescriptorSet0.vp_c15)._m0[654].w, _3241);
    float _3261 = fma(_2986, (*spvDescriptorSet0.vp_c8)._m0[6].z, _3231);
    float _3263 = in.m_80.x;
    float _3265 = fma(_3215, _3195, _3257);
    float _3267 = _3197 + _3243;
    float _3269 = _3199 + _3239;
    float _3271 = -_3237;
    float _3273 = _3271 + 1.0;
    out.m_82.x = _2650;
    out.m_82.y = _2648;
    out.m_82.z = _2652;
    bool _3275 = _2810 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _3277 = isnan(_2810);
    bool _3279 = _3275 || _3277;
    bool _3281 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _3283 = _3279 || _3281;
    float _3285 = -_3199;
    float _3287 = _3247 * _3285;
    float _3289 = -_3201;
    float _3291 = _3247 * _3289;
    float _3293 = _3273 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _3295 = fma(_3215, _3205, _3287);
    bool _3297 = _2666 <= 8000.0;
    bool _3299 = isnan(_2666);
    bool _3301 = _3297 || _3299;
    bool _3303 = isnan(8000.0);
    bool _3305 = _3301 || _3303;
    float _3307 = float(_3305);
    float _3309 = fma(_3215, _3211, _3291);
    float _3311 = fma(_3048, (*spvDescriptorSet0.vp_c8)._m0[6].w, _3261);
    float _3313 = _3056 * 0.5;
    float _3315 = _3098 + _3056;
    float _3317 = _3307 * _3259;
    out.m_84.x = _3265;
    out.m_84.y = _3295;
    out.m_84.z = _3309;
    float _3319 = _3311 + _3056;
    float _3321 = fma(_3100, -0.5, _3313);
    float _3323 = _3317 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    out.gl_Position.x = _3098;
    out.gl_Position.y = _3100;
    out.gl_Position.z = _3311;
    out.gl_Position.w = _3056;
    float _3325 = _3319 * 0.5;
    float _3327 = _3201 + _3253;
    float _3329 = _3315 * 0.5;
    out.m_86.x = _3267;
    out.m_86.y = _3269;
    out.m_86.z = _3327;
    float _3331 = _3199;
    float _3333 = _3309;
    float _3335 = (*spvDescriptorSet0.vp_c15)._m0[653].y;
    if (!_3283)
    {
        _3331 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _3337 = _3331;
    float _3339 = _3337;
    float _3341 = _3337;
    if (!_3283)
    {
        _3333 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _3343 = _3333;
    out.m_88.z = _3325;
    out.m_88.w = _3056;
    out.m_90.x = _3329;
    out.m_90.y = _3321;
    out.m_90.z = _3325;
    out.m_90.w = _3056;
    float _3345 = -_3096;
    float _3347 = _3345 + 1.0;
    float _3349 = _3347 * _3323;
    float _3351 = precise::clamp(_3349, 0.0, 1.0);
    float _3353 = -_3351;
    float _3355 = fma(_3353, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _3357 = _3127;
    float _3359 = _3343;
    float _3361 = _3343;
    if (!_3283)
    {
        _3335 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _3363 = _3335;
    float _3365 = _3355 * _3263;
    float _3367 = _3365 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _3369 = _3293 * _3120;
    float _3371 = -_3293;
    float _3373 = _3371 + 1.0;
    float _3375 = _3131 * _3369;
    float _3377 = _3141 * _3369;
    float _3379 = _3131 * _3373;
    out.m_92.x = _3367;
    float _3381 = fma(_3137, _3375, _3125);
    float _3383 = fma(_3139, _3375, _3127);
    float _3385 = fma(_3131, _3377, _3129);
    float _3387 = _2722 * _2784;
    float _3389 = _3369;
    float _3391 = _3387;
    float _3393 = _3363;
    float _3395 = _3363;
    if (!_3283)
    {
        _3389 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _3397 = _3389;
    float _3399 = _3397;
    float _3401 = _3397;
    if (!_3283)
    {
        _3357 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _3403 = _3357;
    out.m_94.x = _3381;
    out.m_94.y = _3383;
    out.m_94.z = _3385;
    out.m_94.w = _3379;
    float _3405 = _3387 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _3407 = _3403;
    float _3409 = _3403;
    if (!_3283)
    {
        _3391 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _3411 = _3391;
    bool _3413 = !_3283;
    float _3415 = _3411;
    float _3417 = _3411;
    if (!_3413)
    {
        bool _3419 = _2810 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _3421 = isnan(_2810);
        bool _3423 = _3419 || _3421;
        bool _3425 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _3427 = _3423 || _3425;
        if (!_3427)
        {
            float _3429 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _3431 = _2810 + _3429;
            float _3433 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _3435 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _3433;
            float _3437 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _3439 = _3437 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _3441 = 1.0 / _3435;
            float _3443 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _3445 = _3443 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _3447 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _3449 = _3447 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _3451 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _3453 = _3451 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _3455 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _3457 = _3455 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _3459 = _3431 * _3441;
            float _3461 = precise::clamp(_3459, 0.0, 1.0);
            float _3463 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _3465 = _3463 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _3467 = fma(_3461, _3439, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _3469 = fma(_3461, _3465, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _3471 = fma(_3461, _3445, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _3473 = fma(_3461, _3449, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _3475 = fma(_3461, _3453, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _3477 = fma(_3461, _3457, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _3361 = _3471;
            _3409 = _3475;
            _3341 = _3467;
            _3401 = _3473;
            _3395 = _3469;
            _3417 = _3477;
            _3479 = true;
        }
        else
        {
            bool _3481 = _2810 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _3483 = isnan(_2810);
            bool _3485 = _3481 || _3483;
            bool _3487 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _3489 = _3485 || _3487;
            if (!_3489)
            {
                _3339 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _3491 = _3339;
            _3341 = _3491;
            if (!_3489)
            {
                _3359 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _3493 = _3359;
            _3361 = _3493;
            if (!_3489)
            {
                _3393 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _3495 = _3393;
            _3395 = _3495;
            if (!_3489)
            {
                _3399 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _3497 = _3399;
            _3401 = _3497;
            if (!_3489)
            {
                _3407 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _3499 = _3407;
            _3409 = _3499;
            if (!_3489)
            {
                _3415 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _3501 = _3415;
            bool _3503 = !_3489;
            _3417 = _3501;
            if (!_3503)
            {
                bool _3505 = _2810 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _3507 = isnan(_2810);
                bool _3509 = _3505 || _3507;
                bool _3511 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _3513 = _3509 || _3511;
                if (!_3513)
                {
                    float _3515 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _3517 = _2810 + _3515;
                    float _3519 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _3521 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _3519;
                    float _3523 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _3525 = _3523 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _3527 = 1.0 / _3521;
                    float _3529 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _3531 = _3529 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _3533 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _3535 = _3533 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _3537 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _3539 = _3537 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _3541 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _3543 = _3541 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _3545 = _3517 * _3527;
                    float _3547 = precise::clamp(_3545, 0.0, 1.0);
                    float _3549 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _3551 = _3549 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _3553 = fma(_3547, _3525, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _3555 = fma(_3547, _3551, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _3557 = fma(_3547, _3531, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _3559 = fma(_3547, _3535, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _3561 = fma(_3547, _3539, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _3563 = fma(_3547, _3543, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _3361 = _3557;
                    _3409 = _3561;
                    _3341 = _3553;
                    _3401 = _3559;
                    _3395 = _3555;
                    _3417 = _3563;
                    _3479 = true;
                }
                else
                {
                    _3361 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _3409 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _3341 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _3401 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _3395 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _3417 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _3479 = false;
    float _3565 = _3361;
    float _3567 = _3409;
    float _3569 = _3341;
    float _3571 = _3401;
    float _3573 = _3395;
    float _3575 = _3417;
    float _3577 = fma(_3269, -0.5, 0.5);
    float _3579 = precise::clamp(_3577, 0.0, 1.0);
    float _3581 = -_3565;
    float _3583 = _3581 + _3567;
    float _3585 = _3405 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _3587 = -_3569;
    float _3589 = _3587 + _3571;
    float _3591 = fma(_3579, _3583, _3565);
    out.m_96.x = 0.0;
    float _3593 = -_3573;
    float _3595 = _3593 + _3575;
    float _3597 = fma(_3579, _3589, _3569);
    float _3599 = _3591 * 0.586610972881317138671875;
    out.m_49.x = _3585;
    bool _3601 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _3603 = fma(_3579, _3595, _3573);
    float _3605 = fma(_3597, 0.298911988735198974609375, _3599);
    bool _3607 = _2722 > 0.0;
    bool _3609 = isnan(_2722);
    bool _3611 = _3607 || _3609;
    bool _3613 = isnan(0.0);
    bool _3615 = _3611 || _3613;
    float _3617 = fma(_3603, 0.114477999508380889892578125, _3605);
    bool _3619 = _2784 <= 0.0;
    bool _3621 = !_3615;
    bool _3623 = _3619 || _3621;
    float _3625 = -_3617;
    float _3627 = _3591 + _3625;
    float _3629 = -_3617;
    float _3631 = _3597 + _3629;
    float _3633 = -_3617;
    float _3635 = _3603 + _3633;
    float _3637 = fma(_3627, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3617);
    float _3639 = fma(_3631, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3617);
    float _3641 = fma(_3635, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3617);
    bool _3643 = !_3601;
    if (!_3643)
    {
        float _3645 = -_2648;
        float _3647 = _3645 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _3649 = -_2650;
        float _3651 = _3649 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _3653 = -_2652;
        float _3655 = _3653 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _3657 = _3647 * _3647;
        float _3659 = fma(_3651, _3651, _3657);
        float _3661 = fma(_3655, _3655, _3659);
        float _3663 = sqrt(_3661);
        float _3665 = rsqrt(_3661);
        float _3667 = -_3663;
        float _3669 = _3667 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _3671 = _3669 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _3673 = precise::clamp(_3671, 0.0, 1.0);
        float _3675 = _3651 * _3665;
        float _3677 = _3647 * _3665;
        float _3679 = abs(_3673);
        float _3681 = log2(_3679);
        float _3683 = _3655 * _3665;
        float _3685 = _3675 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _3687 = _3269 * _3677;
        float _3689 = -_3677;
        float _3691 = -_3685;
        float _3693 = fma(_3689, (*spvDescriptorSet0.vp_c15)._m0[656].y, _3691);
        float _3695 = fma(_3267, _3675, _3687);
        float _3697 = -_3683;
        float _3699 = fma(_3697, (*spvDescriptorSet0.vp_c15)._m0[656].z, _3693);
        float _3701 = fma(_3327, _3683, _3695);
        float _3703 = precise::clamp(_3701, 0.0, 1.0);
        float _3705 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _3707 = _3699 + _3705;
        float _3709 = _3681 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _3711 = _3707 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _3713 = precise::clamp(_3711, 0.0, 1.0);
        float _3715 = exp2(_3709);
        float _3717 = _3715 * _3713;
        float _3719 = _3703 * _3717;
        float _3721 = _3719 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _3723 = _3719 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _3725 = _3719 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_96.x = _3721;
        out.m_96.y = _3723;
        out.m_96.z = _3725;
    }
    out.m_98.x = _3639;
    out.m_98.y = _3637;
    out.m_98.z = _3641;
    if (!_3623)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _3727 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.m_49.x = 0.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _3727;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_64 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_68 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_88 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_66 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_90 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_49 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_53 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_76 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_98 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_72 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_74 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_84 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_86 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_82 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_78 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_96 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_92 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_94 = float4(0.0, 0.0, 0.0, 1.0);
    bool _3479 = false;
    bool _345 = false;
    bool _241 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _112 = in.m_46.w;
    float _114 = trunc(_112);
    int _117 = int(_114);
    bool _121 = _117 >= 1;
    float _123 = 0.0;
    if (!_121)
    {
        _123 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _125 = _123;
    if (!_121)
    {
        out.m_49.x = 0.0;
    }
    int _127 = 0;
    if (!_121)
    {
        float _129 = _125 * 5.0;
        _127 = as_type<int>(_129);
    }
    int _131 = _127;
    int _133 = _131;
    if (!_121)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3783 = as_type<float>(_131);
        out.gl_Position.z = _3783;
    }
    if (!_121)
    {
        return out;
    }
    float _135 = in.m_51.w;
    float _137 = float(_117);
    float _139 = -_135;
    float _141 = _139 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _143 = _135 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _145 = isnan(_135);
    bool _147 = _143 || _145;
    bool _149 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _151 = _147 || _149;
    bool _153 = _141 >= _137;
    bool _155 = !_151;
    bool _157 = _153 || _155;
    float _159 = 1.0 / _137;
    float _161 = _135;
    float _163 = _141;
    if (_157)
    {
        _161 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _165 = _161;
    if (_157)
    {
        out.m_49.x = 0.0;
    }
    float _167 = _141 * _159;
    float _169 = _167;
    if (_157)
    {
        float _171 = _165 * 5.0;
        _133 = as_type<int>(_171);
    }
    int _173 = _133;
    out.m_53.x = _167;
    if (_157)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3856 = as_type<float>(_173);
        out.gl_Position.z = _3856;
    }
    if (_157)
    {
        return out;
    }
    float _175 = as_type<float>(int(gl_VertexIndex));
    float _177 = in.m_58.x;
    float _179 = in.m_58.y;
    float _181 = in.m_58.z;
    int _183 = as_type<int>(_175) & 1;
    bool _185 = _183 != 0;
    int _187 = as_type<int>(_175) & 2;
    bool _189 = _187 != 0;
    bool _191 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _193 = _179 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _195 = _179 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _197 = _179 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _199 = fma(_177, (*spvDescriptorSet0.vp_c10)._m0[4].x, _193);
    float _201 = fma(_177, (*spvDescriptorSet0.vp_c10)._m0[5].x, _195);
    float _203 = fma(_177, (*spvDescriptorSet0.vp_c10)._m0[6].x, _197);
    bool _205 = !_189;
    float _207 = _205 ? (-0.5) : 0.5;
    float _209 = fma(_181, (*spvDescriptorSet0.vp_c10)._m0[4].z, _199);
    float _211 = fma(_181, (*spvDescriptorSet0.vp_c10)._m0[5].z, _201);
    float _213 = fma(_181, (*spvDescriptorSet0.vp_c10)._m0[6].z, _203);
    bool _215 = !_185;
    float _217 = _215 ? (-0.5) : 0.5;
    bool _219 = !_191;
    float _221 = _211;
    float _239;
    if (!_219)
    {
        float _223 = in.m_60.x;
        float _225 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _227 = _223 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _229 = fma(_227, (*spvDescriptorSet0.vp_c9)._m0[12].x, _141);
        float _231 = _229 * _225;
        float _233 = floor(_231);
        float _235 = -_233;
        float _237 = _231 + _235;
        _239 = _237;
        _241 = true;
    }
    else
    {
        _239 = _167;
    }
    _241 = false;
    float _243 = _239;
    float _245 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _247 = _243 + _245;
    float _249 = in.m_62.x;
    float _251 = in.m_62.y;
    bool _253 = _243 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _255 = isnan(_243);
    bool _257 = _253 || _255;
    bool _259 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _261 = _257 || _259;
    float _263 = float(_261);
    float _265 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _267 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _265;
    bool _269 = _243 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _271 = isnan(_243);
    bool _273 = _269 || _271;
    bool _275 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _277 = _273 || _275;
    float _279 = float(_277);
    float _281 = -_263;
    float _283 = _281 + 1.0;
    float _285 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _287 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _285;
    float _289 = 1.0 / _267;
    bool _291 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _293 = _279 * _283;
    float _295 = -_279;
    float _297 = _295 + 1.0;
    float _299 = _247 * _289;
    float _301 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _303 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _301;
    float _305 = fma(_287, _299, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _307 = fma(_303, _299, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _309 = _305 * _293;
    float _311 = _307 * _293;
    float _313 = fma(_297, (*spvDescriptorSet0.vp_c9)._m0[143].x, _309);
    float _315 = fma(_297, (*spvDescriptorSet0.vp_c9)._m0[143].y, _311);
    float _317 = fma(_263, (*spvDescriptorSet0.vp_c9)._m0[144].x, _313);
    float _319 = fma(_263, (*spvDescriptorSet0.vp_c9)._m0[144].y, _315);
    float _321 = _317 * _249;
    float _323 = _319 * _251;
    bool _325 = !_291;
    float _343;
    if (!_325)
    {
        float _327 = in.m_60.x;
        float _329 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _331 = _327 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _333 = fma(_331, (*spvDescriptorSet0.vp_c9)._m0[11].y, _141);
        float _335 = _333 * _329;
        float _337 = floor(_335);
        float _339 = -_337;
        float _341 = _335 + _339;
        _343 = _341;
        _345 = true;
    }
    else
    {
        _343 = _167;
    }
    _345 = false;
    float _347 = _343;
    float _349 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _351 = _347 + _349;
    float _353 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _355 = _353 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _357 = _347 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _359 = isnan(_347);
    bool _361 = _357 || _359;
    bool _363 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _365 = _361 || _363;
    float _367 = float(_365);
    float _369 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _371 = _369 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _373 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _375 = _373 + (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _377 = _347 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _379 = isnan(_347);
    bool _381 = _377 || _379;
    bool _383 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _385 = _381 || _383;
    float _387 = float(_385);
    float _389 = 1.0 / _355;
    float _391 = -_367;
    float _393 = _391 + 1.0;
    float _395 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _397 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _395;
    bool _399 = _347 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _401 = isnan(_347);
    bool _403 = _399 || _401;
    bool _405 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _407 = _403 || _405;
    float _409 = float(_407);
    float _411 = _387 * _393;
    float _413 = -_387;
    float _415 = _413 + 1.0;
    bool _417 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _419 = 1.0 / _371;
    float _421 = _409 * _415;
    float _423 = -_409;
    float _425 = _423 + 1.0;
    float _427 = 1.0 / _375;
    float _429 = _397 * _389;
    float _431 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _433 = _431 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _435 = fma(_429, _351, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _437 = _433 * _419;
    bool _439 = _347 >= (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _441 = isnan(_347);
    bool _443 = _439 || _441;
    bool _445 = isnan((*spvDescriptorSet0.vp_c9)._m0[118].w);
    bool _447 = _443 || _445;
    float _449 = float(_447);
    float _451 = -(*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _453 = (*spvDescriptorSet0.vp_c9)._m0[118].x + _451;
    float _455 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _457 = _347 + _455;
    float _459 = _435 * _421;
    float _461 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _463 = _347 + _461;
    float _465 = -_449;
    float _467 = _465 + 1.0;
    float _469 = fma(_437, _457, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _471 = _453 * _427;
    float _473 = fma(_425, (*spvDescriptorSet0.vp_c9)._m0[115].x, _459);
    float _475 = _367 * _467;
    float _477 = fma(_471, _463, (*spvDescriptorSet0.vp_c9)._m0[117].x);
    float _479 = fma(_469, _411, _473);
    float _481 = fma(_477, _475, _479);
    float _483 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _485 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _487 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _489 = fma(_449, (*spvDescriptorSet0.vp_c9)._m0[118].x, _481);
    float _491 = _483 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _493 = _485 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _495 = _487 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _497 = _489 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    out.m_64.x = _491;
    out.m_64.y = _493;
    out.m_64.z = _495;
    out.m_64.w = _497;
    bool _499 = !_417;
    float _501 = _367;
    if (!_499)
    {
        float _503 = in.m_60.x;
        float _505 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _507 = _503 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _509 = fma(_507, (*spvDescriptorSet0.vp_c9)._m0[11].w, _141);
        float _511 = _509 * _505;
        float _513 = floor(_511);
        float _515 = -_513;
        float _517 = _511 + _515;
        _169 = _517;
    }
    float _519 = _169;
    float _521 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _523 = int(_521);
    float _525 = in.m_60.x;
    float _527 = in.m_60.y;
    float _529 = _159 * _141;
    float _531 = _321 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    int _533 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _535 = _533 != 0;
    float _537 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].y);
    int _539 = int(_537);
    float _541 = (*spvDescriptorSet0.vp_c9)._m0[87].x + (*spvDescriptorSet0.vp_c9)._m0[86].z;
    float _543 = float(_523);
    float _545 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _547 = int(_545);
    float _549 = (*spvDescriptorSet0.vp_c9)._m0[87].y + (*spvDescriptorSet0.vp_c9)._m0[86].w;
    int _551 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z);
    if (_535)
    {
        _501 = 1.0;
    }
    float _553 = _501;
    float _555 = _553;
    if (!_535)
    {
        _555 = 7.345489978790283203125;
    }
    float _557 = _555;
    float _559 = float(_539);
    float _561 = 1.0 / _543;
    float _563 = _557 * _525;
    float _565 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].x);
    int _567 = int(_565);
    float _569 = float(uint(_547));
    bool _571 = _547 == 0;
    float _573 = 1.0 / _559;
    float _575 = _561 * _141;
    float _577 = 1.0 / _569;
    float _579 = float(uint(_567));
    int _581 = ~_567;
    int _583 = _581 + 1;
    float _585 = trunc(_575);
    int _587 = int(_585);
    float _589 = _573 * _141;
    int _591 = ~_547;
    int _593 = _591 + 1;
    float _595 = 1.0 / _579;
    int _597 = as_type<int>(_577) + (-2);
    float _599 = trunc(_589);
    int _601 = int(_599);
    float _603 = float(uint(_587));
    float _605 = as_type<float>(_597) * _603;
    int _607 = as_type<int>(_595) + (-2);
    float _609 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].z;
    int _611 = ~_567;
    int _613 = _611 + 1;
    float _615 = float(uint(_601));
    float _617 = trunc(_605);
    float _619 = precise::max(_617, 0.0);
    uint _622 = uint(_619);
    float _624 = as_type<float>(_607) * _615;
    float _626 = trunc(_624);
    float _628 = precise::max(_626, 0.0);
    uint _630 = uint(_628);
    float _632 = _609 * (*spvDescriptorSet0.vp_c9)._m0[90].x;
    int _634 = _593 * int(_622);
    int _636 = _634 + _587;
    float _638 = floor(_563);
    float _640 = float(uint(_636));
    int _642 = _613 * int(_630);
    int _644 = _642 + _601;
    float _646 = as_type<float>(_597) * _640;
    float _648 = _640;
    if (_535)
    {
        _648 = 1.0;
    }
    float _650 = _648;
    float _652 = float(uint(_644));
    float _654 = trunc(_646);
    float _656 = precise::max(_654, 0.0);
    uint _658 = uint(_656);
    float _660 = _650;
    float _662 = _652;
    if (!_535)
    {
        _660 = 1.2345600128173828125;
    }
    float _664 = _660;
    float _666 = -_638;
    float _668 = _563 + _666;
    float _670 = as_type<float>(_607) * _652;
    if (_535)
    {
        _662 = _525;
    }
    float _672 = _662;
    float _674 = _672;
    if (!_535)
    {
        _674 = _527;
    }
    float _676 = _674;
    float _678 = trunc(_670);
    float _680 = precise::max(_678, 0.0);
    uint _682 = uint(_680);
    float _684 = _664 * _676;
    int _686 = ~_547;
    int _688 = _686 + 1;
    int _690 = int(_622) + int(_658);
    float _692 = floor(_684);
    float _694 = float(_547);
    float _696 = float(_587);
    int _698 = _688 * _690;
    int _700 = _698 + _587;
    int _702 = int(_630) + int(_682);
    float _704 = _668 * _694;
    float _706 = _694 * _529;
    bool _708 = _696 >= _694;
    bool _710 = isnan(_696);
    bool _712 = _708 || _710;
    bool _714 = isnan(_694);
    bool _716 = _712 || _714;
    float _718 = float(_716);
    bool _720 = uint(_700) >= uint(_547);
    int _722 = _583 * _702;
    int _724 = _722 + _601;
    float _726 = -_692;
    float _728 = _684 + _726;
    float _730 = trunc(_718);
    int _732 = int(_730);
    bool _734 = !_720;
    int _736 = _734 ? 0 : (-1);
    bool _738 = uint(_724) >= uint(_567);
    float _740 = in.m_60.z;
    int _742 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _744 = _742 != 0;
    int _746 = ~_690;
    int _748 = _746 + _736;
    int _750 = _748 + 1;
    float _752 = trunc(_704);
    int _754 = int(_752);
    bool _756 = !_744;
    int _758 = _756 ? 0 : 1;
    float _760 = float(_567);
    int _762 = abs(_758);
    int _764 = _547 * _750;
    int _766 = _764 + _587;
    float _768 = float(_601);
    float _770 = _760 * _529;
    int _772 = ~_732;
    int _774 = _772 + 1;
    int _776 = _774 + 1;
    bool _778 = !_738;
    int _780 = _778 ? 0 : (-1);
    bool _782 = !_571;
    int _784 = _782 ? _766 : (-1);
    float _786 = trunc(_770);
    int _788 = int(_786);
    bool _790 = _768 >= _760;
    bool _792 = isnan(_768);
    bool _794 = _790 || _792;
    bool _796 = isnan(_760);
    bool _798 = _794 || _796;
    float _800 = float(_798);
    float _802 = _728 * _760;
    bool _804 = _527 > 0.5;
    int _806 = _784 * _776;
    int _808 = ~_702;
    int _810 = _808 + _780;
    int _812 = _810 + 1;
    int _814 = _754 * _762;
    int _816 = _814 + _587;
    bool _818 = _740 > 0.5;
    float _820 = trunc(_802);
    int _822 = int(_820);
    float _824 = -_217;
    int _826 = _804 ? as_type<int>(_824) : as_type<int>(_217);
    int _828 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16;
    bool _830 = _828 != 0;
    int _832 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32;
    bool _834 = _832 != 0;
    float _836 = -_207;
    int _838 = _818 ? as_type<int>(_836) : as_type<int>(_207);
    int _840 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8192;
    bool _842 = _840 != 0;
    float _844 = trunc(_800);
    int _846 = int(_844);
    int _848 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _850 = _848 != 0;
    bool _852 = !_830;
    float _854 = _852 ? _217 : as_type<float>(_826);
    bool _856 = !_834;
    float _858 = _856 ? _207 : as_type<float>(_838);
    bool _860 = !_842;
    int _862 = _860 ? 0 : 1;
    float _864 = trunc(_706);
    int _866 = int(_864);
    int _868 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _870 = _868 != 0;
    int _872 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _874 = _872 != 0;
    int _876 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _878 = _876 != 0;
    float _880 = _854 + 0.5;
    int _882 = abs(_862);
    int _884 = _547 + (-1);
    bool _886 = !_874;
    int _888 = _886 ? 0 : 1;
    bool _890 = !_850;
    int _892 = _890 ? 0 : 1;
    int _894 = _732 * _884;
    int _896 = _894 + _806;
    bool _898 = !_870;
    int _900 = _898 ? 0 : 1;
    int _902 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 256;
    bool _904 = _902 != 0;
    int _906 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 512;
    bool _908 = _906 != 0;
    int _910 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1024;
    bool _912 = _910 != 0;
    int _914 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2048;
    bool _916 = _914 != 0;
    int _918 = abs(_888);
    int _920 = _822 * _882;
    int _922 = _920 + _601;
    int _924 = abs(_900);
    int _926 = _567 * _812;
    int _928 = _926 + _601;
    bool _930 = !_878;
    int _932 = _930 ? 0 : 1;
    bool _934 = !_908;
    int _936 = _934 ? 0 : 1;
    bool _938 = _567 == 0;
    int _940 = abs(_932);
    int _942 = _896 * _918;
    int _944 = ~_846;
    int _946 = _944 + 1;
    int _948 = _946 + 1;
    bool _950 = !_938;
    int _952 = _950 ? _928 : (-1);
    int _954 = _866 * _924;
    int _956 = _954 + _942;
    int _958 = _567 + (-1);
    int _960 = _952 * _948;
    int _962 = abs(_892);
    int _964 = _816 * _940;
    int _966 = _964 + _956;
    int _968 = abs(_936);
    int _970 = _846 * _958;
    int _972 = _970 + _960;
    bool _974 = !_904;
    int _976 = _974 ? 0 : 1;
    int _978 = _754 * _962;
    int _980 = _978 + _966;
    bool _982 = !_912;
    int _984 = _982 ? 0 : 1;
    int _986 = abs(_976);
    bool _988 = !_916;
    int _990 = _988 ? 0 : 1;
    int _992 = abs(_984);
    int _994 = _972 * _968;
    float _996 = float(uint(_980));
    int _998 = abs(_990);
    int _1000 = _788 * _986;
    int _1002 = _1000 + _994;
    float _1004 = as_type<float>(_597) * _996;
    int _1006 = ~_547;
    int _1008 = _1006 + 1;
    int _1010 = _922 * _992;
    int _1012 = _1010 + _1002;
    bool _1014 = _547 == 0;
    float _1016 = trunc(_1004);
    float _1018 = precise::max(_1016, 0.0);
    uint _1020 = uint(_1018);
    int _1022 = _822 * _998;
    int _1024 = _1022 + _1012;
    int _1026 = ~_547;
    int _1028 = _1026 + 1;
    int _1030 = ~_567;
    int _1032 = _1030 + 1;
    float _1034 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _1036 = float(uint(_1024));
    float _1038 = float(uint(_816));
    float _1040 = as_type<float>(_607) * _1036;
    float _1042 = as_type<float>(_597) * _1038;
    int _1044 = _1028 * int(_1020);
    int _1046 = _1044 + _980;
    float _1048 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _1050 = _1048 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _1052 = trunc(_1040);
    float _1054 = precise::max(_1052, 0.0);
    uint _1056 = uint(_1054);
    float _1058 = float(uint(_1046));
    float _1060 = as_type<float>(_597) * _1058;
    float _1062 = trunc(_1042);
    float _1064 = precise::max(_1062, 0.0);
    uint _1066 = uint(_1064);
    int _1068 = _1032 * int(_1056);
    int _1070 = _1068 + _1024;
    float _1072 = trunc(_1060);
    float _1074 = precise::max(_1072, 0.0);
    uint _1076 = uint(_1074);
    float _1078 = _527 * 2.0;
    float _1080 = float(uint(_1070));
    float _1082 = floor(_1078);
    float _1084 = as_type<float>(_607) * _1080;
    int _1086 = ~_567;
    int _1088 = _1086 + 1;
    int _1090 = int(_1020) + int(_1076);
    float _1092 = trunc(_1084);
    float _1094 = precise::max(_1092, 0.0);
    uint _1096 = uint(_1094);
    int _1098 = _1008 * _1090;
    int _1100 = _1098 + _980;
    float _1102 = 1.0 / _1050;
    bool _1104 = uint(_1100) >= uint(_547);
    bool _1106 = !_1104;
    int _1108 = _1106 ? 0 : (-1);
    int _1110 = ~_1090;
    int _1112 = _1110 + _1108;
    int _1114 = _1112 + 1;
    float _1116 = _740 * 2.0;
    int _1118 = int(_1056) + int(_1096);
    float _1120 = float(uint(_922));
    int _1122 = _547 * _1114;
    int _1124 = _1122 + _980;
    float _1126 = _527 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    int _1128 = _1088 * _1118;
    int _1130 = _1128 + _1024;
    float _1132 = floor(_1116);
    float _1134 = as_type<float>(_607) * _1120;
    bool _1136 = !_1014;
    int _1138 = _1136 ? _1124 : (-1);
    float _1140 = fma(_1126, -2.0, _1034);
    bool _1142 = uint(_1130) >= uint(_567);
    int _1144 = _1138 & 3;
    bool _1146 = _1144 != 0;
    int _1148 = _1138 & 3;
    bool _1150 = _1148 != 0;
    float _1152 = trunc(_1134);
    float _1154 = precise::max(_1152, 0.0);
    uint _1156 = uint(_1154);
    bool _1158 = !_1142;
    int _1160 = _1158 ? 0 : (-1);
    int _1162 = _1146 ? 0 : 1;
    bool _1164 = uint(_1148) >= 2u;
    bool _1166 = uint(_1148) > 1u;
    int _1168 = ~_1118;
    int _1170 = _1168 + _1160;
    int _1172 = _1170 + 1;
    int _1174 = _1164 ? 0 : 1;
    bool _1176 = _1148 != 3;
    int _1178 = _567 * _1172;
    int _1180 = _1178 + _1024;
    int _1182 = ~_1162;
    int _1184 = _1182 + 1;
    int _1186 = _1184 + 1;
    int _1188 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _1190 = _1188 != 0;
    bool _1192 = !_938;
    int _1194 = _1192 ? _1180 : (-1);
    int _1196 = _1186;
    float _1198 = as_type<float>(_816);
    if (!_1166)
    {
        int _1200 = ~_1162;
        int _1202 = _1200 + 1;
        _1196 = _1202;
    }
    int _1204 = _1196;
    int _1206 = _1194 & 3;
    bool _1208 = _1206 != 0;
    int _1210 = ~_1174;
    int _1212 = _1210 + 1;
    int _1214 = _1212 + 1;
    int _1216 = _1214;
    if (_1176)
    {
        int _1218 = ~_1174;
        int _1220 = _1218 + 1;
        _1216 = _1220;
    }
    int _1222 = _1216;
    bool _1224 = uint(_1206) > 1u;
    float _1226 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _1228 = log2(_1226);
    int _1230 = _1194 & 3;
    bool _1232 = _1230 != 0;
    if (_1190)
    {
        _551 = 0;
    }
    int _1234 = _551;
    int _1236 = _1232 ? 0 : 1;
    int _1238 = _1234;
    if (!_1190)
    {
        _1238 = 2;
    }
    int _1240 = _1238;
    int _1242 = ~_1236;
    int _1244 = _1242 + 1;
    int _1246 = _1244 + 1;
    bool _1248 = _527 > 0.5;
    int _1250 = _1246;
    if (!_1224)
    {
        int _1252 = ~_1236;
        int _1254 = _1252 + 1;
        _1250 = _1254;
    }
    int _1256 = _1250;
    float _1258 = _525 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _1260 = _1228 * _141;
    bool _1262 = _1206 != 3;
    bool _1264 = _1240 != 2;
    float _1266 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _1268 = -_207;
    float _1270 = _1248 ? _1268 : _207;
    float _1272 = exp2(_1260);
    bool _1274 = uint(_1206) >= 2u;
    float _1276 = -_1266;
    float _1278 = fma(_1258, 2.0, _1276);
    float _1280 = _525 * 2.0;
    float _1282 = _1274 ? 0.0 : 1.4012984643248170709237295832899e-45;
    float _1284 = floor(_1280);
    int _1286 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _1288 = _1286 != 0;
    int _1290 = ~as_type<int>(_1282);
    int _1292 = _1290 + 1;
    int _1294 = _1292 + 1;
    int _1296 = _1294;
    float _1298 = _1282;
    float _1300 = _1270;
    if (_1262)
    {
        int _1302 = ~as_type<int>(_1282);
        int _1304 = _1302 + 1;
        _1296 = _1304;
    }
    int _1306 = _1296;
    if (_1264)
    {
        _1298 = _525;
    }
    float _1308 = _1298;
    float _1310 = _1308;
    if (!_1264)
    {
        _1310 = _740;
    }
    float _1312 = _1310;
    bool _1314 = !_1288;
    int _1316 = _1314 ? 0 : 1;
    int _1318 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1320 = _1318 != 0;
    float _1322 = _1312 * (*spvDescriptorSet0.vp_c9)._m0[87].x;
    bool _1324 = _525 > 0.5;
    float _1326 = -_1272;
    float _1328 = _1326 + 1.0;
    bool _1330 = !_1320;
    float _1332 = _1330 ? _207 : _1270;
    float _1334 = -_541;
    float _1336 = fma(_1322, 2.0, _1334);
    int _1338 = ~_547;
    int _1340 = _1338 + 1;
    float _1342 = -_217;
    int _1344 = _1324 ? as_type<int>(_1342) : as_type<int>(_217);
    float _1346 = -_141;
    float _1348 = fma(_1346, (*spvDescriptorSet0.vp_c9)._m0[86].x, _1336);
    bool _1350 = _1284 > 0.0;
    int _1352 = _1340 * int(_1066);
    int _1354 = _1352 + _816;
    bool _1356 = _1284 >= 0.0;
    bool _1358 = isnan(_1284);
    bool _1360 = _1356 || _1358;
    bool _1362 = isnan(0.0);
    bool _1364 = _1360 || _1362;
    float _1366 = fma(_632, _880, _1348);
    int _1368 = ~_567;
    int _1370 = _1368 + 1;
    if (_1264)
    {
        _1300 = _527;
    }
    float _1372 = _1300;
    float _1374 = _1372;
    if (!_1264)
    {
        _1374 = _525;
    }
    float _1376 = _1374;
    int _1378 = _1370 * int(_1156);
    int _1380 = _1378 + _922;
    float _1382 = float(uint(_1354));
    bool _1384 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1386 = isnan(0.0);
    bool _1388 = _1384 || _1386;
    bool _1390 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1392 = _1388 || _1390;
    float _1394 = _1376 * (*spvDescriptorSet0.vp_c9)._m0[87].y;
    float _1396 = float(uint(_1380));
    float _1398 = as_type<float>(_597) * _1382;
    float _1400 = _1392 ? _1328 : 0.0;
    float _1402 = fma(_1394, -2.0, _549);
    bool _1404 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1406 = isnan(1.0);
    bool _1408 = _1404 || _1406;
    bool _1410 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1412 = _1408 || _1410;
    float _1414 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _1416 = 1.0 + _1414;
    float _1418 = as_type<float>(_607) * _1396;
    float _1420 = trunc(_1398);
    float _1422 = precise::max(_1420, 0.0);
    uint _1424 = uint(_1422);
    float _1426 = fma(_141, (*spvDescriptorSet0.vp_c9)._m0[86].y, _1402);
    float _1428 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _1430 = 1.0 / _1416;
    float _1432 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _1434 = (*spvDescriptorSet0.vp_c9)._m0[88].z + (*spvDescriptorSet0.vp_c9)._m0[88].x;
    float _1436 = fma(_525, (*spvDescriptorSet0.vp_c9)._m0[78].z, _1428);
    float _1438 = (*spvDescriptorSet0.vp_c9)._m0[88].w + (*spvDescriptorSet0.vp_c9)._m0[88].y;
    float _1440 = fma(_527, (*spvDescriptorSet0.vp_c9)._m0[78].w, _1432);
    float _1442 = fma(_525, (*spvDescriptorSet0.vp_c9)._m0[88].z, _1434);
    float _1444 = fma(_141, (*spvDescriptorSet0.vp_c9)._m0[77].z, _1436);
    float _1446 = trunc(_1418);
    float _1448 = precise::max(_1446, 0.0);
    uint _1450 = uint(_1448);
    float _1452 = fma(_527, (*spvDescriptorSet0.vp_c9)._m0[88].w, _1438);
    float _1454 = fma(_141, (*spvDescriptorSet0.vp_c9)._m0[76].y, _1140);
    float _1456 = -_141;
    float _1458 = fma(_1456, (*spvDescriptorSet0.vp_c9)._m0[76].x, _1278);
    float _1460 = fma(_141, (*spvDescriptorSet0.vp_c9)._m0[77].w, _1440);
    float _1462 = fma(_141, (*spvDescriptorSet0.vp_c9)._m0[87].z, _1442);
    float _1464 = fma(_141, (*spvDescriptorSet0.vp_c9)._m0[87].w, _1452);
    int _1466 = int(_1066) + int(_1424);
    if (_1412)
    {
        float _1468 = _1400 * _1430;
        _163 = _1468;
    }
    float _1470 = _163;
    int _1472 = ~_547;
    int _1474 = _1472 + 1;
    float _1476 = in.m_46.x;
    float _1478 = in.m_46.y;
    float _1480 = in.m_46.z;
    int _1482 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1484 = _1482 != 0;
    float _1486 = _1332 + (-0.5);
    int _1488 = ~_567;
    int _1490 = _1488 + 1;
    int _1492 = _1474 * _1466;
    int _1494 = _1492 + _816;
    int _1496 = _1364 ? 0 : 1;
    float _1498 = -_1444;
    float _1500 = _1498 + 1.0;
    bool _1502 = !_1484;
    float _1504 = _1502 ? _217 : as_type<float>(_1344);
    float _1506 = -_1486;
    float _1508 = -_1454;
    float _1510 = fma(_1506, (*spvDescriptorSet0.vp_c9)._m0[80].y, _1508);
    bool _1512 = _1082 > 0.0;
    float _1514 = -_1460;
    float _1516 = _1514 + 1.0;
    bool _1518 = _1082 >= 0.0;
    bool _1520 = isnan(_1082);
    bool _1522 = _1518 || _1520;
    bool _1524 = isnan(0.0);
    bool _1526 = _1522 || _1524;
    float _1528 = -_1462;
    float _1530 = _1528 + 1.0;
    int _1532 = int(_1156) + int(_1450);
    int _1534 = ~_1496;
    int _1536 = _1534 + 1;
    int _1538 = _1536 + 1;
    int _1540 = _1538;
    if (!_1350)
    {
        int _1542 = ~_1496;
        int _1544 = _1542 + 1;
        _1540 = _1544;
    }
    int _1546 = _1540;
    bool _1548 = uint(_1494) >= uint(_547);
    int _1550 = _1490 * _1532;
    int _1552 = _1550 + _922;
    float _1554 = _1478 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    int _1556 = _1526 ? 0 : 1;
    float _1558 = _1478 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    bool _1560 = !_1548;
    int _1562 = _1560 ? 0 : (-1);
    float _1564 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _1566 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _1564;
    bool _1568 = uint(_1552) >= uint(_567);
    float _1570 = fma(_1476, (*spvDescriptorSet0.vp_c10)._m0[4].x, _1554);
    int _1572 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4194304;
    bool _1574 = _1572 != 0;
    float _1576 = _1566 * _1102;
    bool _1578 = _519 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _1580 = isnan(_519);
    bool _1582 = _1578 || _1580;
    bool _1584 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _1586 = _1582 || _1584;
    float _1588 = float(_1586);
    float _1590 = fma(_1476, (*spvDescriptorSet0.vp_c10)._m0[6].x, _1558);
    int _1592 = ~_1556;
    int _1594 = _1592 + 1;
    int _1596 = _1594 + 1;
    int _1598 = _1596;
    if (!_1512)
    {
        int _1600 = ~_1556;
        int _1602 = _1600 + 1;
        _1598 = _1602;
    }
    int _1604 = _1598;
    float _1606 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _1608 = _519 + _1606;
    bool _1610 = !_1568;
    int _1612 = _1610 ? 0 : (-1);
    float _1614 = -_1588;
    float _1616 = _1614 + 1.0;
    int _1618 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _1620 = _1618 != 0;
    int _1622 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _1624 = _1622 != 0;
    int _1626 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _1628 = _1626 != 0;
    float _1630 = _1478 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    bool _1632 = _519 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _1634 = isnan(_519);
    bool _1636 = _1632 || _1634;
    bool _1638 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _1640 = _1636 || _1638;
    float _1642 = float(_1640);
    bool _1644 = !_1150;
    int _1646 = _1644 ? 0 : 1;
    float _1648 = fma(_1476, (*spvDescriptorSet0.vp_c10)._m0[5].x, _1630);
    float _1650 = fma(_1576, _1608, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    float _1652 = _1642 * _1616;
    float _1654 = _1504 + 0.5;
    float _1656 = fma(_1480, (*spvDescriptorSet0.vp_c10)._m0[5].z, _1648);
    bool _1658 = _1132 >= 0.0;
    bool _1660 = isnan(_1132);
    bool _1662 = _1658 || _1660;
    bool _1664 = isnan(0.0);
    bool _1666 = _1662 || _1664;
    float _1668 = _1650 * _1652;
    float _1670 = fma(_1654, (*spvDescriptorSet0.vp_c9)._m0[80].x, _1458);
    float _1672 = -_1642;
    float _1674 = _1672 + 1.0;
    int _1676 = _1666 ? 0 : 1;
    bool _1678 = _1132 > 0.0;
    float _1680 = fma(_1674, (*spvDescriptorSet0.vp_c9)._m0[131].x, _1668);
    float _1682 = -_1500;
    float _1684 = fma(_1504, _1682, _1670);
    float _1686 = fma(_1332, _1516, _1510);
    float _1688 = fma(_1480, (*spvDescriptorSet0.vp_c10)._m0[4].z, _1570);
    float _1690 = fma(_1588, (*spvDescriptorSet0.vp_c9)._m0[132].x, _1680);
    float _1692 = _1656 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    int _1694 = _1138 >> 31;
    float _1696 = _527 + _525;
    int _1698 = _1194 >> 31;
    float _1700 = fma(_1480, (*spvDescriptorSet0.vp_c10)._m0[6].z, _1590);
    float _1702 = _1688 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _1704 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1706 = _1692 + _1704;
    int _1708 = _1694 & 3;
    float _1710 = _1696 + (-1.0);
    float _1712 = _1700 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    int _1714 = _1698 & 3;
    float _1716 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1718 = _1702 + _1716;
    float _1720 = _1706 * _1706;
    int _1722 = _1138 + _1708;
    out.m_66.x = _1684;
    out.m_66.y = _1686;
    float _1724 = fma(_1710, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _1726 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1728 = _1712 + _1726;
    float _1730 = fma(_1718, _1718, _1720);
    int _1732 = _1722 >> 2;
    float _1734 = _1706 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    bool _1736 = !_1208;
    int _1738 = _1736 ? 0 : 1;
    float _1740 = fma(_1728, _1728, _1730);
    int _1742 = _1732 << 4;
    int _1744 = _1742 + 368;
    float _1746 = fma(_1718, (*spvDescriptorSet0.vp_c8)._m0[28].x, _1734);
    int _1748 = _1194 + _1714;
    float _1750 = _531 * (*spvDescriptorSet0.vp_c9)._m0[18].w;
    bool _1752 = _1148 != 3;
    float _1754 = rsqrt(_1740);
    int _1756 = _1748 >> 2;
    float _1758 = fma(_1728, (*spvDescriptorSet0.vp_c8)._m0[28].z, _1746);
    int _1760 = ~_1676;
    int _1762 = _1760 + 1;
    int _1764 = _1762 + 1;
    float _1766 = _1690 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    int _1768 = _1756 << 4;
    int _1770 = _1768 + 512;
    uint _1772 = uint(int(uint(_1744) >> uint(2)));
    uint _1774 = uint(int(uint(int(_1772)) >> uint(2)));
    int _1776 = int(_1772) & 3;
    float _1778 = (*spvDescriptorSet0.vp_c9)._m0[int(_1774)][_1776];
    int _1780 = int(_1772) + 1;
    uint _1782 = uint(int(uint(_1780) >> uint(2)));
    int _1784 = _1780 & 3;
    float _1786 = (*spvDescriptorSet0.vp_c9)._m0[int(_1782)][_1784];
    int _1788 = _1764;
    float _1790 = _1712;
    if (!_1678)
    {
        int _1792 = ~_1676;
        int _1794 = _1792 + 1;
        _1788 = _1794;
    }
    int _1796 = _1788;
    float _1798 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].w;
    bool _1800 = !_1752;
    int _1802 = _1800 ? 0 : (-1);
    out.m_68.w = _1766;
    bool _1804 = _1206 != 3;
    int _1806 = abs(_1222);
    uint _1808 = uint(int(uint(_1770) >> uint(2)));
    uint _1810 = uint(int(uint(int(_1808)) >> uint(2)));
    int _1812 = int(_1808) & 3;
    float _1814 = (*spvDescriptorSet0.vp_c9)._m0[int(_1810)][_1812];
    int _1816 = int(_1808) + 1;
    uint _1818 = uint(int(uint(_1816) >> uint(2)));
    int _1820 = _1816 & 3;
    float _1822 = (*spvDescriptorSet0.vp_c9)._m0[int(_1818)][_1820];
    bool _1824 = !_1804;
    int _1826 = _1824 ? 0 : (-1);
    bool _1828 = _1758 >= 0.0;
    float _1830 = _1750 * _1754;
    int _1832 = abs(_1306);
    int _1834 = abs(_1316);
    int _1836 = _1744 + 8;
    uint _1838 = uint(int(uint(_1836) >> uint(2)));
    uint _1840 = uint(int(uint(int(_1838)) >> uint(2)));
    int _1842 = int(_1838) & 3;
    float _1844 = (*spvDescriptorSet0.vp_c9)._m0[int(_1840)][_1842];
    int _1846 = int(_1838) + 1;
    uint _1848 = uint(int(uint(_1846) >> uint(2)));
    int _1850 = _1846 & 3;
    float _1852 = (*spvDescriptorSet0.vp_c9)._m0[int(_1848)][_1850];
    float _1854 = _1706 * _1830;
    float _1856 = _1718 * _1830;
    float _1858 = _1728 * _1830;
    float _1860 = _1798 * (*spvDescriptorSet0.vp_c9)._m0[90].y;
    float _1862 = -_1854;
    float _1864 = _1706 + _1862;
    float _1866 = -_1856;
    float _1868 = _1718 + _1866;
    float _1870 = -_1858;
    float _1872 = _1728 + _1870;
    int _1874 = _1770 + 8;
    uint _1876 = uint(int(uint(_1874) >> uint(2)));
    uint _1878 = uint(int(uint(int(_1876)) >> uint(2)));
    int _1880 = int(_1876) & 3;
    float _1882 = (*spvDescriptorSet0.vp_c9)._m0[int(_1878)][_1880];
    int _1884 = int(_1876) + 1;
    uint _1886 = uint(int(uint(_1884) >> uint(2)));
    int _1888 = _1884 & 3;
    float _1890 = (*spvDescriptorSet0.vp_c9)._m0[int(_1886)][_1888];
    float _1892 = _1864 * _1864;
    float _1894 = _858 + (-0.5);
    bool _1896 = !_1620;
    int _1898 = _1896 ? 0 : 1;
    float _1900 = _1856;
    if (_1828)
    {
        out.m_49.x = 0.0;
    }
    float _1902 = fma(_1868, _1868, _1892);
    float _1904 = -_1860;
    float _1906 = -_1426;
    float _1908 = fma(_1904, _1894, _1906);
    int _1910 = abs(_1256);
    float _1912 = -_1530;
    float _1914 = fma(_854, _1912, _1366);
    float _1916 = fma(_1872, _1872, _1902);
    int _1918 = abs(_1204);
    float _1920 = _525 + (-0.5);
    int _1922 = abs(_1646);
    int _1924 = ~_1918;
    int _1926 = _1924 + 1;
    int _1928 = _1926 + 1;
    int _1930 = ~_1910;
    int _1932 = _1930 + 1;
    int _1934 = _1932 + 1;
    int _1936 = ~_1922;
    int _1938 = _1936 + 1;
    int _1940 = _1938 + 1;
    int _1942 = abs(_1738);
    int _1944 = ~_1466;
    int _1946 = _1944 + _1562;
    int _1948 = _1946 + 1;
    int _1950 = _1928 * as_type<int>(_1786);
    int _1952 = ~_1806;
    int _1954 = _1952 + 1;
    int _1956 = _1954 + 1;
    int _1958 = ~_1532;
    int _1960 = _1958 + _1612;
    int _1962 = _1960 + 1;
    int _1964 = _1940 * as_type<int>(_1778);
    int _1966 = _1964 + _1950;
    int _1968 = abs(_1802);
    int _1970 = _547 * _1948;
    int _1972 = _1970 + _816;
    int _1974 = abs(_1898);
    int _1976 = _1934 * as_type<int>(_1822);
    int _1978 = ~_1942;
    int _1980 = _1978 + 1;
    int _1982 = _1980 + 1;
    int _1984 = _567 * _1962;
    int _1986 = _1984 + _922;
    bool _1988 = _547 == 0;
    float _1990 = float(_1796);
    int _1992 = _1982 * as_type<int>(_1814);
    int _1994 = _1992 + _1976;
    int _1996 = _1956 * as_type<int>(_1844);
    int _1998 = _1996 + _1966;
    bool _2000 = !_1574;
    int _2002 = _2000 ? 0 : 1;
    int _2004 = abs(_1826);
    int _2006 = abs(_2002);
    int _2008 = ~_1968;
    int _2010 = _2008 + 1;
    int _2012 = _2010 + 1;
    int _2014 = ~_1832;
    int _2016 = _2014 + 1;
    int _2018 = _2016 + 1;
    int _2020 = ~_2004;
    int _2022 = _2020 + 1;
    int _2024 = _2022 + 1;
    int _2026 = _2012 * as_type<int>(_1852);
    int _2028 = _2026 + _1998;
    float _2030 = float(_1974);
    int _2032 = _2018 * as_type<int>(_1882);
    int _2034 = _2032 + _1994;
    float _2036 = in.m_70.x;
    float _2038 = in.m_70.y;
    float _2040 = in.m_70.z;
    int _2042 = _2024 * as_type<int>(_1890);
    int _2044 = _2042 + _2034;
    float _2046 = sqrt(_1916);
    int _2048 = ~_1834;
    int _2050 = _2048 + 1;
    int _2052 = _2050 + 1;
    float _2054 = -_1464;
    float _2056 = _2054 + 1.0;
    int _2058 = ~_2006;
    int _2060 = _2058 + 1;
    int _2062 = _2060 + 1;
    float _2064 = _2030 * _1990;
    bool _2066 = !_1988;
    int _2068 = _2066 ? _1972 : (-1);
    int _2070 = _2028 * _2052;
    bool _2072 = !_938;
    int _2074 = _2072 ? _1986 : (-1);
    int _2076 = _2044 * _2062;
    float _2078 = fma(_858, _2056, _1908);
    int _2080 = _2068 * _1834;
    int _2082 = _2080 + _2070;
    if (_1828)
    {
        _1198 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _2084 = _1198;
    float _2086 = _2064 * (-2.0);
    int _2088 = _2074 * _2006;
    int _2090 = _2088 + _2076;
    bool _2092 = !_1624;
    int _2094 = _2092 ? 0 : 1;
    out.m_72.x = _1914;
    out.m_72.y = _2078;
    float _2096 = _1754 * _2046;
    int _2098 = as_type<int>(_2084);
    if (_1828)
    {
        float _2100 = _2084 * 5.0;
        _2098 = as_type<int>(_2100);
    }
    int _2102 = _2098;
    float _2104 = float(_2082);
    float _2106 = fma(_2086, _2036, _2036);
    float _2108 = float(_2090);
    float _2110 = _531 * _2096;
    if (_1828)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _6676 = as_type<float>(_2102);
        out.gl_Position.z = _6676;
    }
    float _2112 = fma(_1920, (*spvDescriptorSet0.vp_c9)._m0[196].x, _2106);
    float _2114 = _527 + _740;
    float _2116 = float(_1546);
    out.m_74.x = _2104;
    out.m_74.y = _2108;
    float _2118 = fma(_1724, _2086, _1724);
    float _2120 = _2114 + (-1.0);
    out.m_76.x = _2110;
    bool _2122 = !_1628;
    int _2124 = _2122 ? 0 : 1;
    int _2126 = abs(_2094);
    if (_1828)
    {
        return out;
    }
    float _2128 = -_1854;
    float _2130 = _1692 + _2128;
    int _2132 = abs(_2124);
    float _2134 = -_1856;
    float _2136 = _1702 + _2134;
    float _2138 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2140 = _2130 + _2138;
    float _2142 = -_1858;
    float _2144 = _1712 + _2142;
    float _2146 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2148 = _2136 + _2146;
    float _2150 = float(_2126);
    float _2152 = _2140 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _2154 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2156 = _2144 + _2154;
    float _2158 = float(_1604);
    float _2160 = fma(_2120, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _2162 = fma(_2148, (*spvDescriptorSet0.vp_c8)._m0[28].x, _2152);
    float _2164 = _2150 * _2116;
    float _2166 = float(_2132);
    float _2168 = _527 + (-0.5);
    float _2170 = fma(_2156, (*spvDescriptorSet0.vp_c8)._m0[28].z, _2162);
    float _2172 = _2164 * (-2.0);
    float _2174 = _740 + _525;
    float _2176 = _2166 * _2158;
    float _2178 = fma(_2118, _1470, _2112);
    bool _2180 = _2170 >= 0.0;
    float _2182 = fma(_2172, _2038, _2038);
    float _2184 = fma(_2160, _2172, _2160);
    float _2186 = _2174 + (-1.0);
    float _2188 = fma(_2168, (*spvDescriptorSet0.vp_c9)._m0[196].y, _2182);
    float _2190 = _2176 * (-2.0);
    float _2192 = _2178 * 0.15915493667125701904296875;
    float _2194 = fma(_2186, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _2196 = fma(_2184, _1470, _2188);
    float _2198 = fma(_2190, _2040, _2040);
    float _2200 = _740 + (-0.5);
    float _2202 = _2192 * 6.283185482025146484375;
    float _2204 = sin(_2202);
    float _2206 = _2196 * 0.15915493667125701904296875;
    float _2208 = _2160;
    float _2210 = _2148;
    float _2212 = _2156;
    if (_2180)
    {
        _2208 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _2214 = _2208;
    float _2216 = fma(_2194, _2190, _2194);
    float _2218 = fma(_2200, (*spvDescriptorSet0.vp_c9)._m0[196].z, _2198);
    int _2220 = as_type<int>(_2214);
    if (_2180)
    {
        out.m_49.x = 0.0;
    }
    if (_2180)
    {
        float _2222 = _2214 * 5.0;
        _2220 = as_type<int>(_2222);
    }
    int _2224 = _2220;
    float _2226 = _2192 * 6.283185482025146484375;
    float _2228 = cos(_2226);
    float _2230 = fma(_2216, _1470, _2218);
    if (_2180)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _6879 = as_type<float>(_2224);
        out.gl_Position.z = _6879;
    }
    float _2232 = _2230 * 0.15915493667125701904296875;
    float _2234 = _2206 * 6.283185482025146484375;
    float _2236 = sin(_2234);
    float _2238 = _2206 * 6.283185482025146484375;
    float _2240 = cos(_2238);
    if (_2180)
    {
        return out;
    }
    float _2242 = _2232 * 6.283185482025146484375;
    float _2244 = cos(_2242);
    float _2246 = _323 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _2248 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _207);
    float _2250 = _2204 * _2236;
    float _2252 = _2228 * _2240;
    float _2254 = _2246 * _2096;
    float _2256 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _217);
    float _2258 = _2204 * _2240;
    float _2260 = _2232 * 6.283185482025146484375;
    float _2262 = sin(_2260);
    float _2264 = _2254 * _2248;
    float _2266 = _2228 * _2236;
    float _2268 = _2096 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _2270 = _2268 * 0.5;
    float _2272 = _2228 * _2244;
    float _2274 = _2240 * _2244;
    float _2276 = _2204 * _2244;
    float _2278 = _2236 * _2244;
    float _2280 = _2110 * _2256;
    float _2282 = _2272 * _2264;
    float _2284 = fma(_2262, _2252, _2250);
    float _2286 = -_2258;
    float _2288 = fma(_2262, _2266, _2286);
    float _2290 = -_2264;
    float _2292 = _2262 * _2290;
    float _2294 = -_2266;
    float _2296 = fma(_2262, _2258, _2294);
    float _2298 = fma(_2284, _2280, _2282);
    float _2300 = _2276 * _2264;
    float _2302 = fma(_2274, _2280, _2292);
    float _2304 = fma(_2288, _2270, _2298);
    float _2306 = fma(_2262, _2250, _2252);
    float _2308 = fma(_2296, _2280, _2300);
    float _2310 = fma(_2278, _2270, _2302);
    float _2312 = _2304 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2314 = _2304 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2316 = fma(_2306, _2270, _2308);
    float _2318 = fma(_2310, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2312);
    float _2320 = fma(_2310, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2314);
    float _2322 = fma(_2316, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2318);
    float _2324 = fma(_2316, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2320);
    float _2326 = _2322 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _2328 = _2324 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _2330 = _1712 + _2326;
    float _2332 = _1702 + _2328;
    float _2334 = _2304 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2336 = _2130 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _2338 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _2340 = _2330 + _2338;
    float _2342 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _2344 = _2332 + _2342;
    float _2346 = fma(_2310, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2334);
    float _2348 = fma(_2136, (*spvDescriptorSet0.vp_c8)._m0[11].x, _2336);
    float _2350 = _2340 * _2340;
    float _2352 = fma(_2316, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2346);
    float _2354 = fma(_2144, (*spvDescriptorSet0.vp_c8)._m0[11].z, _2348);
    float _2356 = fma(_2344, _2344, _2350);
    float _2358 = _2352 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _2360 = sqrt(_2356);
    float _2362 = _1692 + _2358;
    bool _2364 = _2360 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2366 = _2352;
    float _2368 = _2358;
    float _2370 = _2336;
    float _2372 = _2280;
    if (!_2364)
    {
        _2366 = _2332;
    }
    float _2374 = _2366;
    float _2376 = _2374;
    if (!_2364)
    {
        _2368 = _2330;
    }
    float _2378 = _2368;
    float _2380 = _2378;
    if (!_2364)
    {
        _2370 = _2362;
    }
    float _2382 = _2370;
    bool _2384 = !_2364;
    float _2386 = _2382;
    if (!_2384)
    {
        float _2388 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2390 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _2392 = _2360 + _2390;
        float _2394 = rsqrt(_2356);
        float _2396 = _2392 * _2388;
        float _2398 = _2362 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2400 = _2396 * 0.15915493667125701904296875;
        float _2402 = _2400 * 6.283185482025146484375;
        float _2404 = cos(_2402);
        float _2406 = _2400 * 6.283185482025146484375;
        float _2408 = sin(_2406);
        float _2410 = _2404 + (-1.0);
        float _2412 = fma(_2408, _2398, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _2414 = _2410 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2416 = _2394 * _2412;
        float _2418 = fma(_2362, _2404, _2414);
        float _2420 = fma(_2344, _2416, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _2422 = fma(_2340, _2416, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _2386 = _2418;
        _2376 = _2420;
        _2380 = _2422;
        _2372 = _2400;
    }
    float _2424 = _2386;
    float _2426 = _2376;
    float _2428 = _2380;
    float _2430 = _2372;
    float _2432 = -_1692;
    float _2434 = _2432 + _2424;
    float _2436 = -_1702;
    float _2438 = _2436 + _2426;
    float _2440 = -_1712;
    float _2442 = _2440 + _2428;
    float _2444 = _2354 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _2446 = _2434 * _2434;
    float _2448 = _2130 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _2450 = 1.0 / _2444;
    float _2452 = fma(_2438, _2438, _2446);
    float _2454 = fma(_2136, (*spvDescriptorSet0.vp_c8)._m0[10].x, _2448);
    bool _2456 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _2458 = isnan(0.5);
    bool _2460 = _2456 || _2458;
    bool _2462 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _2464 = _2460 || _2462;
    float _2466 = fma(_2442, _2442, _2452);
    float _2468 = fma(_2144, (*spvDescriptorSet0.vp_c8)._m0[10].z, _2454);
    bool _2470 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _2472 = isnan(0.5);
    bool _2474 = _2470 || _2472;
    bool _2476 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _2478 = _2474 || _2476;
    float _2480 = sqrt(_2466);
    float _2482 = _2468 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _2484 = _2482 + _2444;
    float _2486 = _2484 * _2450;
    float _2488 = _2486 * 0.5;
    bool _2490 = _2480 > 0.0;
    float _2492 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _2494 = fma(_2488, (*spvDescriptorSet0.vp_c8)._m0[30].w, _2492);
    float _2496 = 1.0 / _2494;
    float _2498 = _2488;
    float _2500 = _2450;
    float _2502 = _2430;
    if (!_2490)
    {
        _2498 = _2426;
    }
    float _2504 = _2498;
    float _2506 = _2504;
    if (!_2490)
    {
        _2500 = _2424;
    }
    float _2508 = _2500;
    float _2510 = _2508;
    if (!_2490)
    {
        _2502 = _2428;
    }
    float _2512 = _2502;
    bool _2514 = !_2490;
    float _2516 = _2512;
    float _2518 = _2512;
    if (!_2514)
    {
        float _2520 = _211 * _211;
        float _2522 = fma(_209, _209, _2520);
        float _2524 = rsqrt(_2466);
        float _2526 = fma(_213, _213, _2522);
        float _2528 = sqrt(_2526);
        float _2530 = _2438 * _2524;
        float _2532 = _2434 * _2524;
        float _2534 = _2442 * _2524;
        bool _2536 = _2528 > 0.0;
        float _2538 = _2524;
        float _2540 = _2528;
        if (!_2536)
        {
            _2538 = _2426;
        }
        float _2542 = _2538;
        _2506 = _2542;
        if (!_2536)
        {
            _2540 = _2424;
        }
        float _2544 = _2540;
        _2510 = _2544;
        if (!_2536)
        {
            _2516 = _2428;
        }
        float _2546 = _2516;
        bool _2548 = !_2536;
        _2518 = _2546;
        if (!_2548)
        {
            float _2550 = rsqrt(_2526);
            float _2552 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].z;
            float _2554 = _211 * _2550;
            float _2556 = _209 * _2550;
            float _2558 = _2532 * _2554;
            float _2560 = _213 * _2550;
            float _2562 = fma(_2530, _2556, _2558);
            float _2564 = _2552 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _2566 = fma(_2534, _2560, _2562);
            float _2568 = _2566 * _2564;
            float _2570 = fma(_209, _2568, _2426);
            float _2572 = fma(_211, _2568, _2424);
            float _2574 = fma(_213, _2568, _2428);
            _2506 = _2570;
            _2510 = _2572;
            _2518 = _2574;
        }
    }
    float _2576 = _2506;
    float _2578 = _2510;
    float _2580 = _2518;
    float _2582 = -_1856;
    float _2584 = _2582 + _2576;
    float _2586 = -_1854;
    float _2588 = _2586 + _2578;
    float _2590 = -_1858;
    float _2592 = _2590 + _2580;
    float _2594 = _2588;
    float _2596 = _2584;
    float _2598 = _2592;
    if (_2478)
    {
        _221 = 1.0;
    }
    float _2600 = _221;
    float _2602 = _2600;
    if (!_2464)
    {
        float _2604 = _2140 * _2140;
        float _2606 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _2608 = -_1712;
        float _2610 = _2608 + _2580;
        float _2612 = -_1692;
        float _2614 = _2612 + _2578;
        float _2616 = fma(_2148, _2148, _2604);
        float _2618 = fma(_2156, _2156, _2616);
        float _2620 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _2622 = sqrt(_2618);
        float _2624 = 1.0 / _2096;
        float _2626 = precise::min(_2622, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _2628 = _2626 * _2606;
        float _2630 = _2620 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _2632 = -_1702;
        float _2634 = _2632 + _2576;
        float _2636 = _2628 * _2624;
        float _2638 = _2630 * _2636;
        float _2640 = _2610 * _2636;
        float _2642 = fma(_2614, _2638, _2130);
        float _2644 = fma(_2634, _2638, _2136);
        float _2646 = fma(_2630, _2640, _2144);
        _2594 = _2642;
        _2596 = _2644;
        _2598 = _2646;
        _2210 = _2622;
        _1790 = _2640;
    }
    float _2648 = _2594;
    float _2650 = _2596;
    float _2652 = _2598;
    float _2654 = _2210;
    float _2656 = _1790;
    float _2658 = _2654;
    float _2660 = _2656;
    if (_2478)
    {
        _1900 = 1.0;
    }
    float _2662 = _1900;
    float _2664 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _2666 = _2496 * _2664;
    float _2668 = _2662;
    if (!_2478)
    {
        float _2670 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _2672 = _2670 * 0.15915493667125701904296875;
        float _2674 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _2676 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2678 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _2676;
        float _2680 = _2672 * 6.283185482025146484375;
        float _2682 = cos(_2680);
        float _2684 = _2674 * 0.15915493667125701904296875;
        float _2686 = _2672 * 6.283185482025146484375;
        float _2688 = sin(_2686);
        float _2690 = 1.0 / _2682;
        float _2692 = _2684 * 6.283185482025146484375;
        float _2694 = cos(_2692);
        float _2696 = _2688 * _2690;
        float _2698 = _2684 * 6.283185482025146484375;
        float _2700 = sin(_2698);
        float _2702 = _2694 * _2696;
        float _2704 = 1.0 / _2678;
        float _2706 = 1.0 / _2702;
        float _2708 = _2700 * _2706;
        float _2710 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2712 = fma(_2666, _2708, _2710);
        float _2714 = _2712 * _2704;
        float _2716 = precise::clamp(_2714, 0.0, 1.0);
        _2212 = _2684;
        _2658 = _2696;
        _2602 = _2716;
    }
    float _2718 = _2212;
    float _2720 = _2658;
    float _2722 = _2602;
    float _2724 = _2718;
    float _2726 = _2720;
    if (!_2478)
    {
        float _2728 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _2730 = _2728 * 0.15915493667125701904296875;
        float _2732 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _2734 = _2730 * 6.283185482025146484375;
        float _2736 = cos(_2734);
        float _2738 = _2732 * 0.15915493667125701904296875;
        float _2740 = _2730 * 6.283185482025146484375;
        float _2742 = sin(_2740);
        float _2744 = 1.0 / _2736;
        float _2746 = _2738 * 6.283185482025146484375;
        float _2748 = cos(_2746);
        float _2750 = _2742 * _2744;
        float _2752 = _2738 * 6.283185482025146484375;
        float _2754 = sin(_2752);
        float _2756 = _2748 * _2750;
        float _2758 = 1.0 / _2756;
        float _2760 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _2762 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _2760;
        float _2764 = 1.0 / _2762;
        float _2766 = _2754 * _2758;
        float _2768 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _2770 = fma(_2666, _2766, _2768);
        float _2772 = _2770 * _2764;
        float _2774 = precise::clamp(_2772, 0.0, 1.0);
        float _2776 = -_2774;
        float _2778 = _2776 + 1.0;
        _2724 = _2744;
        _2726 = _2756;
        _2668 = _2778;
    }
    float _2780 = _2724;
    float _2782 = _2726;
    float _2784 = _2668;
    float _2786 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2788 = _2648 + _2786;
    float _2790 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2792 = _2650 + _2790;
    float _2794 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2796 = _2652 + _2794;
    float _2798 = _2648 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _2800 = _2788 * _2788;
    float _2802 = fma(_2650, (*spvDescriptorSet0.vp_c8)._m0[3].x, _2798);
    float _2804 = fma(_2792, _2792, _2800);
    float _2806 = fma(_2796, _2796, _2804);
    float _2808 = rsqrt(_2806);
    float _2810 = sqrt(_2806);
    float _2812 = _2808 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _2814 = _2792 * _2812;
    float _2816 = _2796 * _2812;
    float _2818 = _2814 * _2814;
    float _2820 = _2816 * _2816;
    float _2822 = _2818 + _2820;
    float _2824 = sqrt(_2822);
    bool _2826 = _2824 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2828 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2830 = _2824 + _2828;
    float _2832 = _2780;
    float _2834 = _2822;
    float _2836 = _2830;
    float _2838 = _2782;
    float _2840 = _2788;
    if (_2826)
    {
        float _2842 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2832 = _2842;
    }
    float _2844 = _2832;
    if (_2826)
    {
        float _2846 = rsqrt(_2822);
        _2834 = _2846;
    }
    float _2848 = _2834;
    float _2850 = _2848;
    if (_2826)
    {
        float _2852 = _2830 * _2844;
        _2836 = _2852;
    }
    float _2854 = _2836;
    if (_2826)
    {
        float _2856 = _2854 * 0.15915493667125701904296875;
        _2838 = _2856;
    }
    float _2858 = _2838;
    float _2860 = _2796;
    float _2862 = _2858;
    if (_2826)
    {
        float _2864 = _2858 * 6.283185482025146484375;
        float _2866 = sin(_2864);
        _2860 = _2866;
    }
    float _2868 = _2860;
    float _2870 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _2872 = precise::max(0.0, _2870);
    float _2874 = _2844;
    if (_2826)
    {
        float _2876 = _2858 * 6.283185482025146484375;
        float _2878 = cos(_2876);
        _2874 = _2878;
    }
    float _2880 = _2874;
    float _2882 = -_2812;
    float _2884 = -_2872;
    float _2886 = fma(_2788, _2882, _2884);
    float _2888 = (*spvDescriptorSet0.vp_c15)._m0[652].x;
    if (_2826)
    {
        float _2890 = _2886 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2840 = _2890;
    }
    float _2892 = _2840;
    float _2894 = _2892;
    if (!_2826)
    {
        _2862 = _2814;
    }
    float _2896 = _2862;
    float _2898 = fma(_2136, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _2900 = _2868;
    float _2902 = _2896;
    if (_2826)
    {
        float _2904 = fma(_2868, _2892, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _2900 = _2904;
    }
    float _2906 = _2900;
    float _2908 = _2906;
    if (!_2826)
    {
        _2894 = _2886;
    }
    float _2910 = _2894;
    float _2912 = _2910;
    float _2914 = _2880;
    if (_2826)
    {
        float _2916 = _2880 + (-1.0);
        _2888 = _2916;
    }
    float _2918 = _2888;
    float _2920 = _2918;
    if (_2826)
    {
        float _2922 = _2848 * _2906;
        _2660 = _2922;
    }
    float _2924 = _2660;
    if (!_2826)
    {
        _2850 = _2816;
    }
    float _2926 = _2850;
    float _2928 = _2926;
    if (_2826)
    {
        float _2930 = _2918 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2920 = _2930;
    }
    float _2932 = _2920;
    if (_2826)
    {
        float _2934 = _2814 * _2924;
        _2902 = _2934;
    }
    float _2936 = _2902;
    if (!_2826)
    {
        _2908 = _2818;
    }
    float _2938 = _2908;
    float _2940 = _2938;
    if (_2826)
    {
        float _2942 = _2816 * _2924;
        _2928 = _2942;
    }
    float _2944 = _2928;
    if (_2826)
    {
        float _2946 = fma(_2886, _2880, _2932);
        _2912 = _2946;
    }
    float _2948 = _2912;
    if (_2826)
    {
        float _2950 = _2936 * _2936;
        _2940 = _2950;
    }
    float _2952 = _2940;
    if (!_2826)
    {
        _2914 = _2820;
    }
    float _2954 = _2914;
    float _2956 = _2954;
    if (_2826)
    {
        float _2958 = _2944 * _2944;
        _2956 = _2958;
    }
    float _2960 = _2956;
    float _2962 = _2648 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _2964 = fma(_2948, _2948, _2952);
    float _2966 = floor(_2898);
    float _2968 = fma(_2650, (*spvDescriptorSet0.vp_c8)._m0[2].x, _2962);
    float _2970 = _2964 + _2960;
    float _2972 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _2974 = fma(_2810, (*spvDescriptorSet0.vp_c15)._m0[23].w, _2972);
    float _2976 = precise::clamp(_2974, 0.0, 1.0);
    float _2978 = fma(_2652, (*spvDescriptorSet0.vp_c8)._m0[2].z, _2968);
    float _2980 = rsqrt(_2970);
    float _2982 = -_2976;
    float _2984 = _2982 + 1.0;
    float _2986 = _2978 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _2988 = fma(_2144, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _2990 = _2648 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2992 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _2994 = abs(_2984);
    float _2996 = log2(_2994);
    float _2998 = _2648 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _3000 = _2986 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _3002 = fma(_2650, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2990);
    float _3004 = fma(_2650, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2998);
    float _3006 = -_3000;
    float _3008 = fma(_3006, _2992, 1.0);
    float _3010 = fma(_2652, (*spvDescriptorSet0.vp_c8)._m0[0].z, _3002);
    float _3012 = _2980 * _2936;
    float _3014 = fma(_2652, (*spvDescriptorSet0.vp_c8)._m0[1].z, _3004);
    float _3016 = _2980 * _2948;
    float _3018 = _2980 * _2944;
    float _3020 = _3012 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _3022 = _3014 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _3024 = _3010 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _3026 = floor(_2988);
    float _3028 = -_3020;
    float _3030 = fma(_3016, (*spvDescriptorSet0.vp_c15)._m0[21].y, _3028);
    float _3032 = _3022 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _3034 = _2996 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _3036 = -_3018;
    float _3038 = fma(_3036, (*spvDescriptorSet0.vp_c15)._m0[21].z, _3030);
    float _3040 = fma(_2652, (*spvDescriptorSet0.vp_c8)._m0[3].z, _2802);
    float _3042 = fma(_3024, (*spvDescriptorSet0.vp_c8)._m0[7].x, _3032);
    float _3044 = exp2(_3034);
    float _3046 = fma(_3038, -0.5, 0.5);
    float _3048 = _3040 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _3050 = fma(_2986, (*spvDescriptorSet0.vp_c8)._m0[7].z, _3042);
    float _3052 = fma(_3038, 0.5, 0.5);
    float _3054 = _3022 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _3056 = fma(_3048, (*spvDescriptorSet0.vp_c8)._m0[7].w, _3050);
    float _3058 = log2(_3008);
    float _3060 = -_3026;
    float _3062 = _2988 + _3060;
    float _3064 = fma(_3052, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _3066 = fma(_3024, (*spvDescriptorSet0.vp_c8)._m0[5].x, _3054);
    float _3068 = fma(_3052, _3064, -0.212114393711090087890625);
    float _3070 = fma(_2986, (*spvDescriptorSet0.vp_c8)._m0[5].z, _3066);
    float _3072 = 1.0 / _3056;
    float _3074 = -_2966;
    float _3076 = _2898 + _3074;
    float _3078 = _3022 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _3080 = fma(_3024, (*spvDescriptorSet0.vp_c8)._m0[4].x, _3078);
    float _3082 = _3016 + 1.0;
    float _3084 = sqrt(_3046);
    float _3086 = _3058 * 0.693147182464599609375;
    float _3088 = fma(_2986, (*spvDescriptorSet0.vp_c8)._m0[4].z, _3080);
    float _3090 = -_3016;
    float _3092 = fma(_3044, _3082, _3090);
    float _3094 = fma(_3052, _3068, 1.570728778839111328125);
    float2 _8232 = float2(_3076, _3062);
    float _3096 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_8232, float2(0.0), isnan(_8232)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_8232, float2(0.0), isnan(_8232)), level(0.0)).x;
    float _3098 = fma(_3048, (*spvDescriptorSet0.vp_c8)._m0[4].w, _3088);
    float _3100 = fma(_3048, (*spvDescriptorSet0.vp_c8)._m0[5].w, _3070);
    float _3102 = _3086 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _3104 = fma(_3092, 0.5, 0.5);
    float _3106 = _3098 * _3072;
    float _3108 = _3100 * _3072;
    float _3110 = fma(_3106, 0.5, 0.5);
    float _3112 = fma(_3108, -0.5, 0.5);
    float _3114 = _3084 * 0.636619746685028076171875;
    float _3116 = -_3094;
    float _3118 = fma(_3114, _3116, 1.0);
    float3 _8277 = float3(_3110, _3112, _3102);
    float _3120 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_8277, float3(0.0), isnan(_8277)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_8277, float3(0.0), isnan(_8277)), level(0.0)).x;
    float3 _8288 = float3(_3110, _3112, _3102);
    float4 _3123 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_8288, float3(0.0), isnan(_8288)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_8288, float3(0.0), isnan(_8288)), level(0.0)).xyzw;
    float _3125 = _3123.x;
    float _3127 = _3123.y;
    float _3129 = _3123.z;
    float _3131 = _3123.w;
    float2 _8304 = float2(_3118, _3104);
    float3 _3135 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_8304, float2(0.0), isnan(_8304)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_8304, float2(0.0), isnan(_8304)), level(0.0)).xyz;
    float _3137 = _3135.x;
    float _3139 = _3135.y;
    float _3141 = _3135.z;
    float _3143 = abs(_2666);
    float _3145 = log2(_3143);
    float _3147 = _2284 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _3149 = _2284 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _3151 = _2284 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _3153 = _2272 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _3155 = fma(_2274, (*spvDescriptorSet0.vp_c8)._m0[24].x, _3147);
    float _3157 = fma(_2274, (*spvDescriptorSet0.vp_c8)._m0[25].x, _3149);
    float _3159 = fma(_2274, (*spvDescriptorSet0.vp_c8)._m0[26].x, _3151);
    float _3161 = _2272 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _3163 = _2272 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _3165 = _2288 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _3167 = _2288 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _3169 = _2288 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _3171 = -_2262;
    float _3173 = fma(_3171, (*spvDescriptorSet0.vp_c8)._m0[25].x, _3153);
    float _3175 = -_2262;
    float _3177 = fma(_3175, (*spvDescriptorSet0.vp_c8)._m0[26].x, _3163);
    float _3179 = _207 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _3181 = _3145 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _3183 = -_2262;
    float _3185 = fma(_3183, (*spvDescriptorSet0.vp_c8)._m0[24].x, _3161);
    float _3187 = fma(_2278, (*spvDescriptorSet0.vp_c8)._m0[24].x, _3165);
    float _3189 = fma(_2278, (*spvDescriptorSet0.vp_c8)._m0[25].x, _3167);
    float _3191 = exp2(_3181);
    float _3193 = fma(_2278, (*spvDescriptorSet0.vp_c8)._m0[26].x, _3169);
    float _3195 = fma(_2276, (*spvDescriptorSet0.vp_c8)._m0[24].z, _3185);
    float _3197 = fma(_2306, (*spvDescriptorSet0.vp_c8)._m0[24].z, _3187);
    float _3199 = fma(_2306, (*spvDescriptorSet0.vp_c8)._m0[25].z, _3189);
    float _3201 = fma(_2306, (*spvDescriptorSet0.vp_c8)._m0[26].z, _3193);
    float _3203 = fma(_2296, (*spvDescriptorSet0.vp_c8)._m0[24].z, _3155);
    float _3205 = fma(_2276, (*spvDescriptorSet0.vp_c8)._m0[25].z, _3173);
    float _3207 = fma(_3179, _3179, 1.0);
    float _3209 = _217 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _3211 = fma(_2276, (*spvDescriptorSet0.vp_c8)._m0[26].z, _3177);
    float _3213 = _3022 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _3215 = rsqrt(_3207);
    float _3217 = fma(_2296, (*spvDescriptorSet0.vp_c8)._m0[25].z, _3157);
    float _3219 = _2996 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _3221 = fma(_3191, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _3223 = precise::clamp(_3221, 0.0, 1.0);
    float _3225 = fma(_2296, (*spvDescriptorSet0.vp_c8)._m0[26].z, _3159);
    float _3227 = _3179 * _3205;
    float _3229 = _3223 * _3223;
    float _3231 = fma(_3024, (*spvDescriptorSet0.vp_c8)._m0[6].x, _3213);
    float _3233 = fma(_3223, -2.0, 3.0);
    float _3235 = _3179 * _3195;
    float _3237 = exp2(_3219);
    float _3239 = fma(_3209, _3217, _3227);
    float _3241 = _3229 * _3233;
    float _3243 = fma(_3209, _3203, _3235);
    float _3245 = _3179 * _3211;
    float _3247 = _3179 * _3215;
    float _3249 = -_3241;
    float _3251 = _3249 + 1.0;
    out.m_78.x = _3203;
    out.m_78.y = _3217;
    out.m_78.z = _3225;
    float _3253 = fma(_3209, _3225, _3245);
    float _3255 = -_3197;
    float _3257 = _3247 * _3255;
    float _3259 = fma(_3251, (*spvDescriptorSet0.vp_c15)._m0[654].w, _3241);
    float _3261 = fma(_2986, (*spvDescriptorSet0.vp_c8)._m0[6].z, _3231);
    float _3263 = in.m_80.x;
    float _3265 = fma(_3215, _3195, _3257);
    float _3267 = _3197 + _3243;
    float _3269 = _3199 + _3239;
    float _3271 = -_3237;
    float _3273 = _3271 + 1.0;
    out.m_82.x = _2650;
    out.m_82.y = _2648;
    out.m_82.z = _2652;
    bool _3275 = _2810 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _3277 = isnan(_2810);
    bool _3279 = _3275 || _3277;
    bool _3281 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _3283 = _3279 || _3281;
    float _3285 = -_3199;
    float _3287 = _3247 * _3285;
    float _3289 = -_3201;
    float _3291 = _3247 * _3289;
    float _3293 = _3273 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _3295 = fma(_3215, _3205, _3287);
    bool _3297 = _2666 <= 8000.0;
    bool _3299 = isnan(_2666);
    bool _3301 = _3297 || _3299;
    bool _3303 = isnan(8000.0);
    bool _3305 = _3301 || _3303;
    float _3307 = float(_3305);
    float _3309 = fma(_3215, _3211, _3291);
    float _3311 = fma(_3048, (*spvDescriptorSet0.vp_c8)._m0[6].w, _3261);
    float _3313 = _3056 * 0.5;
    float _3315 = _3098 + _3056;
    float _3317 = _3307 * _3259;
    out.m_84.x = _3265;
    out.m_84.y = _3295;
    out.m_84.z = _3309;
    float _3319 = _3311 + _3056;
    float _3321 = fma(_3100, -0.5, _3313);
    float _3323 = _3317 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    out.gl_Position.x = _3098;
    out.gl_Position.y = _3100;
    out.gl_Position.z = _3311;
    out.gl_Position.w = _3056;
    float _3325 = _3319 * 0.5;
    float _3327 = _3201 + _3253;
    float _3329 = _3315 * 0.5;
    out.m_86.x = _3267;
    out.m_86.y = _3269;
    out.m_86.z = _3327;
    float _3331 = _3199;
    float _3333 = _3309;
    float _3335 = (*spvDescriptorSet0.vp_c15)._m0[653].y;
    if (!_3283)
    {
        _3331 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _3337 = _3331;
    float _3339 = _3337;
    float _3341 = _3337;
    if (!_3283)
    {
        _3333 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _3343 = _3333;
    out.m_88.z = _3325;
    out.m_88.w = _3056;
    out.m_90.x = _3329;
    out.m_90.y = _3321;
    out.m_90.z = _3325;
    out.m_90.w = _3056;
    float _3345 = -_3096;
    float _3347 = _3345 + 1.0;
    float _3349 = _3347 * _3323;
    float _3351 = precise::clamp(_3349, 0.0, 1.0);
    float _3353 = -_3351;
    float _3355 = fma(_3353, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _3357 = _3127;
    float _3359 = _3343;
    float _3361 = _3343;
    if (!_3283)
    {
        _3335 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _3363 = _3335;
    float _3365 = _3355 * _3263;
    float _3367 = _3365 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _3369 = _3293 * _3120;
    float _3371 = -_3293;
    float _3373 = _3371 + 1.0;
    float _3375 = _3131 * _3369;
    float _3377 = _3141 * _3369;
    float _3379 = _3131 * _3373;
    out.m_92.x = _3367;
    float _3381 = fma(_3137, _3375, _3125);
    float _3383 = fma(_3139, _3375, _3127);
    float _3385 = fma(_3131, _3377, _3129);
    float _3387 = _2722 * _2784;
    float _3389 = _3369;
    float _3391 = _3387;
    float _3393 = _3363;
    float _3395 = _3363;
    if (!_3283)
    {
        _3389 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _3397 = _3389;
    float _3399 = _3397;
    float _3401 = _3397;
    if (!_3283)
    {
        _3357 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _3403 = _3357;
    out.m_94.x = _3381;
    out.m_94.y = _3383;
    out.m_94.z = _3385;
    out.m_94.w = _3379;
    float _3405 = _3387 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _3407 = _3403;
    float _3409 = _3403;
    if (!_3283)
    {
        _3391 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _3411 = _3391;
    bool _3413 = !_3283;
    float _3415 = _3411;
    float _3417 = _3411;
    if (!_3413)
    {
        bool _3419 = _2810 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _3421 = isnan(_2810);
        bool _3423 = _3419 || _3421;
        bool _3425 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _3427 = _3423 || _3425;
        if (!_3427)
        {
            float _3429 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _3431 = _2810 + _3429;
            float _3433 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _3435 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _3433;
            float _3437 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _3439 = _3437 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _3441 = 1.0 / _3435;
            float _3443 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _3445 = _3443 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _3447 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _3449 = _3447 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _3451 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _3453 = _3451 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _3455 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _3457 = _3455 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _3459 = _3431 * _3441;
            float _3461 = precise::clamp(_3459, 0.0, 1.0);
            float _3463 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _3465 = _3463 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _3467 = fma(_3461, _3439, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _3469 = fma(_3461, _3465, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _3471 = fma(_3461, _3445, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _3473 = fma(_3461, _3449, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _3475 = fma(_3461, _3453, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _3477 = fma(_3461, _3457, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _3361 = _3471;
            _3409 = _3475;
            _3341 = _3467;
            _3401 = _3473;
            _3395 = _3469;
            _3417 = _3477;
            _3479 = true;
        }
        else
        {
            bool _3481 = _2810 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _3483 = isnan(_2810);
            bool _3485 = _3481 || _3483;
            bool _3487 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _3489 = _3485 || _3487;
            if (!_3489)
            {
                _3339 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _3491 = _3339;
            _3341 = _3491;
            if (!_3489)
            {
                _3359 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _3493 = _3359;
            _3361 = _3493;
            if (!_3489)
            {
                _3393 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _3495 = _3393;
            _3395 = _3495;
            if (!_3489)
            {
                _3399 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _3497 = _3399;
            _3401 = _3497;
            if (!_3489)
            {
                _3407 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _3499 = _3407;
            _3409 = _3499;
            if (!_3489)
            {
                _3415 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _3501 = _3415;
            bool _3503 = !_3489;
            _3417 = _3501;
            if (!_3503)
            {
                bool _3505 = _2810 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _3507 = isnan(_2810);
                bool _3509 = _3505 || _3507;
                bool _3511 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _3513 = _3509 || _3511;
                if (!_3513)
                {
                    float _3515 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _3517 = _2810 + _3515;
                    float _3519 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _3521 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _3519;
                    float _3523 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _3525 = _3523 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _3527 = 1.0 / _3521;
                    float _3529 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _3531 = _3529 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _3533 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _3535 = _3533 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _3537 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _3539 = _3537 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _3541 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _3543 = _3541 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _3545 = _3517 * _3527;
                    float _3547 = precise::clamp(_3545, 0.0, 1.0);
                    float _3549 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _3551 = _3549 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _3553 = fma(_3547, _3525, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _3555 = fma(_3547, _3551, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _3557 = fma(_3547, _3531, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _3559 = fma(_3547, _3535, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _3561 = fma(_3547, _3539, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _3563 = fma(_3547, _3543, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _3361 = _3557;
                    _3409 = _3561;
                    _3341 = _3553;
                    _3401 = _3559;
                    _3395 = _3555;
                    _3417 = _3563;
                    _3479 = true;
                }
                else
                {
                    _3361 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _3409 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _3341 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _3401 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _3395 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _3417 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _3479 = false;
    float _3565 = _3361;
    float _3567 = _3409;
    float _3569 = _3341;
    float _3571 = _3401;
    float _3573 = _3395;
    float _3575 = _3417;
    float _3577 = fma(_3269, -0.5, 0.5);
    float _3579 = precise::clamp(_3577, 0.0, 1.0);
    float _3581 = -_3565;
    float _3583 = _3581 + _3567;
    float _3585 = _3405 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _3587 = -_3569;
    float _3589 = _3587 + _3571;
    float _3591 = fma(_3579, _3583, _3565);
    out.m_96.x = 0.0;
    float _3593 = -_3573;
    float _3595 = _3593 + _3575;
    float _3597 = fma(_3579, _3589, _3569);
    float _3599 = _3591 * 0.586610972881317138671875;
    out.m_49.x = _3585;
    bool _3601 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _3603 = fma(_3579, _3595, _3573);
    float _3605 = fma(_3597, 0.298911988735198974609375, _3599);
    bool _3607 = _2722 > 0.0;
    bool _3609 = isnan(_2722);
    bool _3611 = _3607 || _3609;
    bool _3613 = isnan(0.0);
    bool _3615 = _3611 || _3613;
    float _3617 = fma(_3603, 0.114477999508380889892578125, _3605);
    bool _3619 = _2784 <= 0.0;
    bool _3621 = !_3615;
    bool _3623 = _3619 || _3621;
    float _3625 = -_3617;
    float _3627 = _3591 + _3625;
    float _3629 = -_3617;
    float _3631 = _3597 + _3629;
    float _3633 = -_3617;
    float _3635 = _3603 + _3633;
    float _3637 = fma(_3627, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3617);
    float _3639 = fma(_3631, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3617);
    float _3641 = fma(_3635, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3617);
    bool _3643 = !_3601;
    if (!_3643)
    {
        float _3645 = -_2648;
        float _3647 = _3645 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _3649 = -_2650;
        float _3651 = _3649 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _3653 = -_2652;
        float _3655 = _3653 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _3657 = _3647 * _3647;
        float _3659 = fma(_3651, _3651, _3657);
        float _3661 = fma(_3655, _3655, _3659);
        float _3663 = sqrt(_3661);
        float _3665 = rsqrt(_3661);
        float _3667 = -_3663;
        float _3669 = _3667 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _3671 = _3669 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _3673 = precise::clamp(_3671, 0.0, 1.0);
        float _3675 = _3651 * _3665;
        float _3677 = _3647 * _3665;
        float _3679 = abs(_3673);
        float _3681 = log2(_3679);
        float _3683 = _3655 * _3665;
        float _3685 = _3675 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _3687 = _3269 * _3677;
        float _3689 = -_3677;
        float _3691 = -_3685;
        float _3693 = fma(_3689, (*spvDescriptorSet0.vp_c15)._m0[656].y, _3691);
        float _3695 = fma(_3267, _3675, _3687);
        float _3697 = -_3683;
        float _3699 = fma(_3697, (*spvDescriptorSet0.vp_c15)._m0[656].z, _3693);
        float _3701 = fma(_3327, _3683, _3695);
        float _3703 = precise::clamp(_3701, 0.0, 1.0);
        float _3705 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _3707 = _3699 + _3705;
        float _3709 = _3681 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _3711 = _3707 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _3713 = precise::clamp(_3711, 0.0, 1.0);
        float _3715 = exp2(_3709);
        float _3717 = _3715 * _3713;
        float _3719 = _3703 * _3717;
        float _3721 = _3719 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _3723 = _3719 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _3725 = _3719 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_96.x = _3721;
        out.m_96.y = _3723;
        out.m_96.z = _3725;
    }
    out.m_98.x = _3639;
    out.m_98.y = _3637;
    out.m_98.z = _3641;
    if (!_3623)
    {
        return out;
    }
    float _3727 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.m_49.x = 0.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _3727;
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
    out.m_64 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_68 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_88 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_66 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_90 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_49 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_53 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_76 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_98 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_72 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_74 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_84 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_86 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_82 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_78 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_96 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_92 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_94 = float4(0.0, 0.0, 0.0, 1.0);
    bool _3479 = false;
    bool _345 = false;
    bool _241 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _112 = in.m_46.w;
    float _114 = trunc(_112);
    int _117 = int(_114);
    bool _121 = _117 >= 1;
    float _123 = 0.0;
    if (!_121)
    {
        _123 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _125 = _123;
    if (!_121)
    {
        out.m_49.x = 0.0;
    }
    int _127 = 0;
    if (!_121)
    {
        float _129 = _125 * 5.0;
        _127 = as_type<int>(_129);
    }
    int _131 = _127;
    int _133 = _131;
    if (!_121)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3783 = as_type<float>(_131);
        out.gl_Position.z = _3783;
    }
    if (!_121)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_88.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_88.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_88.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_88.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_90.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_90.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_90.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_90.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_49.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_49.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_49.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_49.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_98.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_98.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_98.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_98.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 72, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 73, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 74, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 75, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 76, as_type<uint>(out.m_96.x)); dm_cw(dm_gs, dm_p, 77, as_type<uint>(out.m_96.y)); dm_cw(dm_gs, dm_p, 78, as_type<uint>(out.m_96.z)); dm_cw(dm_gs, dm_p, 79, as_type<uint>(out.m_96.w)); dm_cw(dm_gs, dm_p, 80, as_type<uint>(out.m_92.x)); dm_cw(dm_gs, dm_p, 81, as_type<uint>(out.m_92.y)); dm_cw(dm_gs, dm_p, 82, as_type<uint>(out.m_92.z)); dm_cw(dm_gs, dm_p, 83, as_type<uint>(out.m_92.w)); dm_cw(dm_gs, dm_p, 84, as_type<uint>(out.m_94.x)); dm_cw(dm_gs, dm_p, 85, as_type<uint>(out.m_94.y)); dm_cw(dm_gs, dm_p, 86, as_type<uint>(out.m_94.z)); dm_cw(dm_gs, dm_p, 87, as_type<uint>(out.m_94.w)); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _135 = in.m_51.w;
    float _137 = float(_117);
    float _139 = -_135;
    float _141 = _139 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _143 = _135 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _145 = isnan(_135);
    bool _147 = _143 || _145;
    bool _149 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _151 = _147 || _149;
    bool _153 = _141 >= _137;
    bool _155 = !_151;
    bool _157 = _153 || _155;
    float _159 = 1.0 / _137;
    float _161 = _135;
    float _163 = _141;
    if (_157)
    {
        _161 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _165 = _161;
    if (_157)
    {
        out.m_49.x = 0.0;
    }
    float _167 = _141 * _159;
    float _169 = _167;
    if (_157)
    {
        float _171 = _165 * 5.0;
        _133 = as_type<int>(_171);
    }
    int _173 = _133;
    out.m_53.x = _167;
    if (_157)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3856 = as_type<float>(_173);
        out.gl_Position.z = _3856;
    }
    if (_157)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_88.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_88.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_88.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_88.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_90.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_90.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_90.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_90.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_49.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_49.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_49.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_49.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_98.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_98.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_98.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_98.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 72, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 73, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 74, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 75, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 76, as_type<uint>(out.m_96.x)); dm_cw(dm_gs, dm_p, 77, as_type<uint>(out.m_96.y)); dm_cw(dm_gs, dm_p, 78, as_type<uint>(out.m_96.z)); dm_cw(dm_gs, dm_p, 79, as_type<uint>(out.m_96.w)); dm_cw(dm_gs, dm_p, 80, as_type<uint>(out.m_92.x)); dm_cw(dm_gs, dm_p, 81, as_type<uint>(out.m_92.y)); dm_cw(dm_gs, dm_p, 82, as_type<uint>(out.m_92.z)); dm_cw(dm_gs, dm_p, 83, as_type<uint>(out.m_92.w)); dm_cw(dm_gs, dm_p, 84, as_type<uint>(out.m_94.x)); dm_cw(dm_gs, dm_p, 85, as_type<uint>(out.m_94.y)); dm_cw(dm_gs, dm_p, 86, as_type<uint>(out.m_94.z)); dm_cw(dm_gs, dm_p, 87, as_type<uint>(out.m_94.w)); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _175 = as_type<float>(int(gl_VertexIndex));
    float _177 = in.m_58.x;
    float _179 = in.m_58.y;
    float _181 = in.m_58.z;
    int _183 = as_type<int>(_175) & 1;
    bool _185 = _183 != 0;
    int _187 = as_type<int>(_175) & 2;
    bool _189 = _187 != 0;
    bool _191 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _193 = _179 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _195 = _179 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _197 = _179 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _199 = fma(_177, (*spvDescriptorSet0.vp_c10)._m0[4].x, _193);
    float _201 = fma(_177, (*spvDescriptorSet0.vp_c10)._m0[5].x, _195);
    float _203 = fma(_177, (*spvDescriptorSet0.vp_c10)._m0[6].x, _197);
    bool _205 = !_189;
    float _207 = _205 ? (-0.5) : 0.5;
    float _209 = fma(_181, (*spvDescriptorSet0.vp_c10)._m0[4].z, _199);
    float _211 = fma(_181, (*spvDescriptorSet0.vp_c10)._m0[5].z, _201);
    float _213 = fma(_181, (*spvDescriptorSet0.vp_c10)._m0[6].z, _203);
    bool _215 = !_185;
    float _217 = _215 ? (-0.5) : 0.5;
    bool _219 = !_191;
    float _221 = _211;
    float _239;
    if (!_219)
    {
        float _223 = in.m_60.x;
        float _225 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _227 = _223 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _229 = fma(_227, (*spvDescriptorSet0.vp_c9)._m0[12].x, _141);
        float _231 = _229 * _225;
        float _233 = floor(_231);
        float _235 = -_233;
        float _237 = _231 + _235;
        _239 = _237;
        _241 = true;
    }
    else
    {
        _239 = _167;
    }
    _241 = false;
    float _243 = _239;
    float _245 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _247 = _243 + _245;
    float _249 = in.m_62.x;
    float _251 = in.m_62.y;
    bool _253 = _243 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _255 = isnan(_243);
    bool _257 = _253 || _255;
    bool _259 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _261 = _257 || _259;
    float _263 = float(_261);
    float _265 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _267 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _265;
    bool _269 = _243 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _271 = isnan(_243);
    bool _273 = _269 || _271;
    bool _275 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _277 = _273 || _275;
    float _279 = float(_277);
    float _281 = -_263;
    float _283 = _281 + 1.0;
    float _285 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _287 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _285;
    float _289 = 1.0 / _267;
    bool _291 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _293 = _279 * _283;
    float _295 = -_279;
    float _297 = _295 + 1.0;
    float _299 = _247 * _289;
    float _301 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _303 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _301;
    float _305 = fma(_287, _299, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _307 = fma(_303, _299, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _309 = _305 * _293;
    float _311 = _307 * _293;
    float _313 = fma(_297, (*spvDescriptorSet0.vp_c9)._m0[143].x, _309);
    float _315 = fma(_297, (*spvDescriptorSet0.vp_c9)._m0[143].y, _311);
    float _317 = fma(_263, (*spvDescriptorSet0.vp_c9)._m0[144].x, _313);
    float _319 = fma(_263, (*spvDescriptorSet0.vp_c9)._m0[144].y, _315);
    float _321 = _317 * _249;
    float _323 = _319 * _251;
    bool _325 = !_291;
    float _343;
    if (!_325)
    {
        float _327 = in.m_60.x;
        float _329 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _331 = _327 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _333 = fma(_331, (*spvDescriptorSet0.vp_c9)._m0[11].y, _141);
        float _335 = _333 * _329;
        float _337 = floor(_335);
        float _339 = -_337;
        float _341 = _335 + _339;
        _343 = _341;
        _345 = true;
    }
    else
    {
        _343 = _167;
    }
    _345 = false;
    float _347 = _343;
    float _349 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _351 = _347 + _349;
    float _353 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _355 = _353 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _357 = _347 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _359 = isnan(_347);
    bool _361 = _357 || _359;
    bool _363 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _365 = _361 || _363;
    float _367 = float(_365);
    float _369 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _371 = _369 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _373 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _375 = _373 + (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _377 = _347 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _379 = isnan(_347);
    bool _381 = _377 || _379;
    bool _383 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _385 = _381 || _383;
    float _387 = float(_385);
    float _389 = 1.0 / _355;
    float _391 = -_367;
    float _393 = _391 + 1.0;
    float _395 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _397 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _395;
    bool _399 = _347 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _401 = isnan(_347);
    bool _403 = _399 || _401;
    bool _405 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _407 = _403 || _405;
    float _409 = float(_407);
    float _411 = _387 * _393;
    float _413 = -_387;
    float _415 = _413 + 1.0;
    bool _417 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _419 = 1.0 / _371;
    float _421 = _409 * _415;
    float _423 = -_409;
    float _425 = _423 + 1.0;
    float _427 = 1.0 / _375;
    float _429 = _397 * _389;
    float _431 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _433 = _431 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _435 = fma(_429, _351, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _437 = _433 * _419;
    bool _439 = _347 >= (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _441 = isnan(_347);
    bool _443 = _439 || _441;
    bool _445 = isnan((*spvDescriptorSet0.vp_c9)._m0[118].w);
    bool _447 = _443 || _445;
    float _449 = float(_447);
    float _451 = -(*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _453 = (*spvDescriptorSet0.vp_c9)._m0[118].x + _451;
    float _455 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _457 = _347 + _455;
    float _459 = _435 * _421;
    float _461 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _463 = _347 + _461;
    float _465 = -_449;
    float _467 = _465 + 1.0;
    float _469 = fma(_437, _457, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _471 = _453 * _427;
    float _473 = fma(_425, (*spvDescriptorSet0.vp_c9)._m0[115].x, _459);
    float _475 = _367 * _467;
    float _477 = fma(_471, _463, (*spvDescriptorSet0.vp_c9)._m0[117].x);
    float _479 = fma(_469, _411, _473);
    float _481 = fma(_477, _475, _479);
    float _483 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _485 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _487 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _489 = fma(_449, (*spvDescriptorSet0.vp_c9)._m0[118].x, _481);
    float _491 = _483 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _493 = _485 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _495 = _487 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _497 = _489 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    out.m_64.x = _491;
    out.m_64.y = _493;
    out.m_64.z = _495;
    out.m_64.w = _497;
    bool _499 = !_417;
    float _501 = _367;
    if (!_499)
    {
        float _503 = in.m_60.x;
        float _505 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _507 = _503 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _509 = fma(_507, (*spvDescriptorSet0.vp_c9)._m0[11].w, _141);
        float _511 = _509 * _505;
        float _513 = floor(_511);
        float _515 = -_513;
        float _517 = _511 + _515;
        _169 = _517;
    }
    float _519 = _169;
    float _521 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _523 = int(_521);
    float _525 = in.m_60.x;
    float _527 = in.m_60.y;
    float _529 = _159 * _141;
    float _531 = _321 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    int _533 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _535 = _533 != 0;
    float _537 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].y);
    int _539 = int(_537);
    float _541 = (*spvDescriptorSet0.vp_c9)._m0[87].x + (*spvDescriptorSet0.vp_c9)._m0[86].z;
    float _543 = float(_523);
    float _545 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _547 = int(_545);
    float _549 = (*spvDescriptorSet0.vp_c9)._m0[87].y + (*spvDescriptorSet0.vp_c9)._m0[86].w;
    int _551 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z);
    if (_535)
    {
        _501 = 1.0;
    }
    float _553 = _501;
    float _555 = _553;
    if (!_535)
    {
        _555 = 7.345489978790283203125;
    }
    float _557 = _555;
    float _559 = float(_539);
    float _561 = 1.0 / _543;
    float _563 = _557 * _525;
    float _565 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].x);
    int _567 = int(_565);
    float _569 = float(uint(_547));
    bool _571 = _547 == 0;
    float _573 = 1.0 / _559;
    float _575 = _561 * _141;
    float _577 = 1.0 / _569;
    float _579 = float(uint(_567));
    int _581 = ~_567;
    int _583 = _581 + 1;
    float _585 = trunc(_575);
    int _587 = int(_585);
    float _589 = _573 * _141;
    int _591 = ~_547;
    int _593 = _591 + 1;
    float _595 = 1.0 / _579;
    int _597 = as_type<int>(_577) + (-2);
    float _599 = trunc(_589);
    int _601 = int(_599);
    float _603 = float(uint(_587));
    float _605 = as_type<float>(_597) * _603;
    int _607 = as_type<int>(_595) + (-2);
    float _609 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].z;
    int _611 = ~_567;
    int _613 = _611 + 1;
    float _615 = float(uint(_601));
    float _617 = trunc(_605);
    float _619 = precise::max(_617, 0.0);
    uint _622 = uint(_619);
    float _624 = as_type<float>(_607) * _615;
    float _626 = trunc(_624);
    float _628 = precise::max(_626, 0.0);
    uint _630 = uint(_628);
    float _632 = _609 * (*spvDescriptorSet0.vp_c9)._m0[90].x;
    int _634 = _593 * int(_622);
    int _636 = _634 + _587;
    float _638 = floor(_563);
    float _640 = float(uint(_636));
    int _642 = _613 * int(_630);
    int _644 = _642 + _601;
    float _646 = as_type<float>(_597) * _640;
    float _648 = _640;
    if (_535)
    {
        _648 = 1.0;
    }
    float _650 = _648;
    float _652 = float(uint(_644));
    float _654 = trunc(_646);
    float _656 = precise::max(_654, 0.0);
    uint _658 = uint(_656);
    float _660 = _650;
    float _662 = _652;
    if (!_535)
    {
        _660 = 1.2345600128173828125;
    }
    float _664 = _660;
    float _666 = -_638;
    float _668 = _563 + _666;
    float _670 = as_type<float>(_607) * _652;
    if (_535)
    {
        _662 = _525;
    }
    float _672 = _662;
    float _674 = _672;
    if (!_535)
    {
        _674 = _527;
    }
    float _676 = _674;
    float _678 = trunc(_670);
    float _680 = precise::max(_678, 0.0);
    uint _682 = uint(_680);
    float _684 = _664 * _676;
    int _686 = ~_547;
    int _688 = _686 + 1;
    int _690 = int(_622) + int(_658);
    float _692 = floor(_684);
    float _694 = float(_547);
    float _696 = float(_587);
    int _698 = _688 * _690;
    int _700 = _698 + _587;
    int _702 = int(_630) + int(_682);
    float _704 = _668 * _694;
    float _706 = _694 * _529;
    bool _708 = _696 >= _694;
    bool _710 = isnan(_696);
    bool _712 = _708 || _710;
    bool _714 = isnan(_694);
    bool _716 = _712 || _714;
    float _718 = float(_716);
    bool _720 = uint(_700) >= uint(_547);
    int _722 = _583 * _702;
    int _724 = _722 + _601;
    float _726 = -_692;
    float _728 = _684 + _726;
    float _730 = trunc(_718);
    int _732 = int(_730);
    bool _734 = !_720;
    int _736 = _734 ? 0 : (-1);
    bool _738 = uint(_724) >= uint(_567);
    float _740 = in.m_60.z;
    int _742 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _744 = _742 != 0;
    int _746 = ~_690;
    int _748 = _746 + _736;
    int _750 = _748 + 1;
    float _752 = trunc(_704);
    int _754 = int(_752);
    bool _756 = !_744;
    int _758 = _756 ? 0 : 1;
    float _760 = float(_567);
    int _762 = abs(_758);
    int _764 = _547 * _750;
    int _766 = _764 + _587;
    float _768 = float(_601);
    float _770 = _760 * _529;
    int _772 = ~_732;
    int _774 = _772 + 1;
    int _776 = _774 + 1;
    bool _778 = !_738;
    int _780 = _778 ? 0 : (-1);
    bool _782 = !_571;
    int _784 = _782 ? _766 : (-1);
    float _786 = trunc(_770);
    int _788 = int(_786);
    bool _790 = _768 >= _760;
    bool _792 = isnan(_768);
    bool _794 = _790 || _792;
    bool _796 = isnan(_760);
    bool _798 = _794 || _796;
    float _800 = float(_798);
    float _802 = _728 * _760;
    bool _804 = _527 > 0.5;
    int _806 = _784 * _776;
    int _808 = ~_702;
    int _810 = _808 + _780;
    int _812 = _810 + 1;
    int _814 = _754 * _762;
    int _816 = _814 + _587;
    bool _818 = _740 > 0.5;
    float _820 = trunc(_802);
    int _822 = int(_820);
    float _824 = -_217;
    int _826 = _804 ? as_type<int>(_824) : as_type<int>(_217);
    int _828 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16;
    bool _830 = _828 != 0;
    int _832 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32;
    bool _834 = _832 != 0;
    float _836 = -_207;
    int _838 = _818 ? as_type<int>(_836) : as_type<int>(_207);
    int _840 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8192;
    bool _842 = _840 != 0;
    float _844 = trunc(_800);
    int _846 = int(_844);
    int _848 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _850 = _848 != 0;
    bool _852 = !_830;
    float _854 = _852 ? _217 : as_type<float>(_826);
    bool _856 = !_834;
    float _858 = _856 ? _207 : as_type<float>(_838);
    bool _860 = !_842;
    int _862 = _860 ? 0 : 1;
    float _864 = trunc(_706);
    int _866 = int(_864);
    int _868 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _870 = _868 != 0;
    int _872 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _874 = _872 != 0;
    int _876 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _878 = _876 != 0;
    float _880 = _854 + 0.5;
    int _882 = abs(_862);
    int _884 = _547 + (-1);
    bool _886 = !_874;
    int _888 = _886 ? 0 : 1;
    bool _890 = !_850;
    int _892 = _890 ? 0 : 1;
    int _894 = _732 * _884;
    int _896 = _894 + _806;
    bool _898 = !_870;
    int _900 = _898 ? 0 : 1;
    int _902 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 256;
    bool _904 = _902 != 0;
    int _906 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 512;
    bool _908 = _906 != 0;
    int _910 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1024;
    bool _912 = _910 != 0;
    int _914 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2048;
    bool _916 = _914 != 0;
    int _918 = abs(_888);
    int _920 = _822 * _882;
    int _922 = _920 + _601;
    int _924 = abs(_900);
    int _926 = _567 * _812;
    int _928 = _926 + _601;
    bool _930 = !_878;
    int _932 = _930 ? 0 : 1;
    bool _934 = !_908;
    int _936 = _934 ? 0 : 1;
    bool _938 = _567 == 0;
    int _940 = abs(_932);
    int _942 = _896 * _918;
    int _944 = ~_846;
    int _946 = _944 + 1;
    int _948 = _946 + 1;
    bool _950 = !_938;
    int _952 = _950 ? _928 : (-1);
    int _954 = _866 * _924;
    int _956 = _954 + _942;
    int _958 = _567 + (-1);
    int _960 = _952 * _948;
    int _962 = abs(_892);
    int _964 = _816 * _940;
    int _966 = _964 + _956;
    int _968 = abs(_936);
    int _970 = _846 * _958;
    int _972 = _970 + _960;
    bool _974 = !_904;
    int _976 = _974 ? 0 : 1;
    int _978 = _754 * _962;
    int _980 = _978 + _966;
    bool _982 = !_912;
    int _984 = _982 ? 0 : 1;
    int _986 = abs(_976);
    bool _988 = !_916;
    int _990 = _988 ? 0 : 1;
    int _992 = abs(_984);
    int _994 = _972 * _968;
    float _996 = float(uint(_980));
    int _998 = abs(_990);
    int _1000 = _788 * _986;
    int _1002 = _1000 + _994;
    float _1004 = as_type<float>(_597) * _996;
    int _1006 = ~_547;
    int _1008 = _1006 + 1;
    int _1010 = _922 * _992;
    int _1012 = _1010 + _1002;
    bool _1014 = _547 == 0;
    float _1016 = trunc(_1004);
    float _1018 = precise::max(_1016, 0.0);
    uint _1020 = uint(_1018);
    int _1022 = _822 * _998;
    int _1024 = _1022 + _1012;
    int _1026 = ~_547;
    int _1028 = _1026 + 1;
    int _1030 = ~_567;
    int _1032 = _1030 + 1;
    float _1034 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _1036 = float(uint(_1024));
    float _1038 = float(uint(_816));
    float _1040 = as_type<float>(_607) * _1036;
    float _1042 = as_type<float>(_597) * _1038;
    int _1044 = _1028 * int(_1020);
    int _1046 = _1044 + _980;
    float _1048 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _1050 = _1048 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _1052 = trunc(_1040);
    float _1054 = precise::max(_1052, 0.0);
    uint _1056 = uint(_1054);
    float _1058 = float(uint(_1046));
    float _1060 = as_type<float>(_597) * _1058;
    float _1062 = trunc(_1042);
    float _1064 = precise::max(_1062, 0.0);
    uint _1066 = uint(_1064);
    int _1068 = _1032 * int(_1056);
    int _1070 = _1068 + _1024;
    float _1072 = trunc(_1060);
    float _1074 = precise::max(_1072, 0.0);
    uint _1076 = uint(_1074);
    float _1078 = _527 * 2.0;
    float _1080 = float(uint(_1070));
    float _1082 = floor(_1078);
    float _1084 = as_type<float>(_607) * _1080;
    int _1086 = ~_567;
    int _1088 = _1086 + 1;
    int _1090 = int(_1020) + int(_1076);
    float _1092 = trunc(_1084);
    float _1094 = precise::max(_1092, 0.0);
    uint _1096 = uint(_1094);
    int _1098 = _1008 * _1090;
    int _1100 = _1098 + _980;
    float _1102 = 1.0 / _1050;
    bool _1104 = uint(_1100) >= uint(_547);
    bool _1106 = !_1104;
    int _1108 = _1106 ? 0 : (-1);
    int _1110 = ~_1090;
    int _1112 = _1110 + _1108;
    int _1114 = _1112 + 1;
    float _1116 = _740 * 2.0;
    int _1118 = int(_1056) + int(_1096);
    float _1120 = float(uint(_922));
    int _1122 = _547 * _1114;
    int _1124 = _1122 + _980;
    float _1126 = _527 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    int _1128 = _1088 * _1118;
    int _1130 = _1128 + _1024;
    float _1132 = floor(_1116);
    float _1134 = as_type<float>(_607) * _1120;
    bool _1136 = !_1014;
    int _1138 = _1136 ? _1124 : (-1);
    float _1140 = fma(_1126, -2.0, _1034);
    bool _1142 = uint(_1130) >= uint(_567);
    int _1144 = _1138 & 3;
    bool _1146 = _1144 != 0;
    int _1148 = _1138 & 3;
    bool _1150 = _1148 != 0;
    float _1152 = trunc(_1134);
    float _1154 = precise::max(_1152, 0.0);
    uint _1156 = uint(_1154);
    bool _1158 = !_1142;
    int _1160 = _1158 ? 0 : (-1);
    int _1162 = _1146 ? 0 : 1;
    bool _1164 = uint(_1148) >= 2u;
    bool _1166 = uint(_1148) > 1u;
    int _1168 = ~_1118;
    int _1170 = _1168 + _1160;
    int _1172 = _1170 + 1;
    int _1174 = _1164 ? 0 : 1;
    bool _1176 = _1148 != 3;
    int _1178 = _567 * _1172;
    int _1180 = _1178 + _1024;
    int _1182 = ~_1162;
    int _1184 = _1182 + 1;
    int _1186 = _1184 + 1;
    int _1188 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _1190 = _1188 != 0;
    bool _1192 = !_938;
    int _1194 = _1192 ? _1180 : (-1);
    int _1196 = _1186;
    float _1198 = as_type<float>(_816);
    if (!_1166)
    {
        int _1200 = ~_1162;
        int _1202 = _1200 + 1;
        _1196 = _1202;
    }
    int _1204 = _1196;
    int _1206 = _1194 & 3;
    bool _1208 = _1206 != 0;
    int _1210 = ~_1174;
    int _1212 = _1210 + 1;
    int _1214 = _1212 + 1;
    int _1216 = _1214;
    if (_1176)
    {
        int _1218 = ~_1174;
        int _1220 = _1218 + 1;
        _1216 = _1220;
    }
    int _1222 = _1216;
    bool _1224 = uint(_1206) > 1u;
    float _1226 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _1228 = log2(_1226);
    int _1230 = _1194 & 3;
    bool _1232 = _1230 != 0;
    if (_1190)
    {
        _551 = 0;
    }
    int _1234 = _551;
    int _1236 = _1232 ? 0 : 1;
    int _1238 = _1234;
    if (!_1190)
    {
        _1238 = 2;
    }
    int _1240 = _1238;
    int _1242 = ~_1236;
    int _1244 = _1242 + 1;
    int _1246 = _1244 + 1;
    bool _1248 = _527 > 0.5;
    int _1250 = _1246;
    if (!_1224)
    {
        int _1252 = ~_1236;
        int _1254 = _1252 + 1;
        _1250 = _1254;
    }
    int _1256 = _1250;
    float _1258 = _525 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _1260 = _1228 * _141;
    bool _1262 = _1206 != 3;
    bool _1264 = _1240 != 2;
    float _1266 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _1268 = -_207;
    float _1270 = _1248 ? _1268 : _207;
    float _1272 = exp2(_1260);
    bool _1274 = uint(_1206) >= 2u;
    float _1276 = -_1266;
    float _1278 = fma(_1258, 2.0, _1276);
    float _1280 = _525 * 2.0;
    float _1282 = _1274 ? 0.0 : 1.4012984643248170709237295832899e-45;
    float _1284 = floor(_1280);
    int _1286 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _1288 = _1286 != 0;
    int _1290 = ~as_type<int>(_1282);
    int _1292 = _1290 + 1;
    int _1294 = _1292 + 1;
    int _1296 = _1294;
    float _1298 = _1282;
    float _1300 = _1270;
    if (_1262)
    {
        int _1302 = ~as_type<int>(_1282);
        int _1304 = _1302 + 1;
        _1296 = _1304;
    }
    int _1306 = _1296;
    if (_1264)
    {
        _1298 = _525;
    }
    float _1308 = _1298;
    float _1310 = _1308;
    if (!_1264)
    {
        _1310 = _740;
    }
    float _1312 = _1310;
    bool _1314 = !_1288;
    int _1316 = _1314 ? 0 : 1;
    int _1318 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1320 = _1318 != 0;
    float _1322 = _1312 * (*spvDescriptorSet0.vp_c9)._m0[87].x;
    bool _1324 = _525 > 0.5;
    float _1326 = -_1272;
    float _1328 = _1326 + 1.0;
    bool _1330 = !_1320;
    float _1332 = _1330 ? _207 : _1270;
    float _1334 = -_541;
    float _1336 = fma(_1322, 2.0, _1334);
    int _1338 = ~_547;
    int _1340 = _1338 + 1;
    float _1342 = -_217;
    int _1344 = _1324 ? as_type<int>(_1342) : as_type<int>(_217);
    float _1346 = -_141;
    float _1348 = fma(_1346, (*spvDescriptorSet0.vp_c9)._m0[86].x, _1336);
    bool _1350 = _1284 > 0.0;
    int _1352 = _1340 * int(_1066);
    int _1354 = _1352 + _816;
    bool _1356 = _1284 >= 0.0;
    bool _1358 = isnan(_1284);
    bool _1360 = _1356 || _1358;
    bool _1362 = isnan(0.0);
    bool _1364 = _1360 || _1362;
    float _1366 = fma(_632, _880, _1348);
    int _1368 = ~_567;
    int _1370 = _1368 + 1;
    if (_1264)
    {
        _1300 = _527;
    }
    float _1372 = _1300;
    float _1374 = _1372;
    if (!_1264)
    {
        _1374 = _525;
    }
    float _1376 = _1374;
    int _1378 = _1370 * int(_1156);
    int _1380 = _1378 + _922;
    float _1382 = float(uint(_1354));
    bool _1384 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1386 = isnan(0.0);
    bool _1388 = _1384 || _1386;
    bool _1390 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1392 = _1388 || _1390;
    float _1394 = _1376 * (*spvDescriptorSet0.vp_c9)._m0[87].y;
    float _1396 = float(uint(_1380));
    float _1398 = as_type<float>(_597) * _1382;
    float _1400 = _1392 ? _1328 : 0.0;
    float _1402 = fma(_1394, -2.0, _549);
    bool _1404 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1406 = isnan(1.0);
    bool _1408 = _1404 || _1406;
    bool _1410 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1412 = _1408 || _1410;
    float _1414 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _1416 = 1.0 + _1414;
    float _1418 = as_type<float>(_607) * _1396;
    float _1420 = trunc(_1398);
    float _1422 = precise::max(_1420, 0.0);
    uint _1424 = uint(_1422);
    float _1426 = fma(_141, (*spvDescriptorSet0.vp_c9)._m0[86].y, _1402);
    float _1428 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _1430 = 1.0 / _1416;
    float _1432 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _1434 = (*spvDescriptorSet0.vp_c9)._m0[88].z + (*spvDescriptorSet0.vp_c9)._m0[88].x;
    float _1436 = fma(_525, (*spvDescriptorSet0.vp_c9)._m0[78].z, _1428);
    float _1438 = (*spvDescriptorSet0.vp_c9)._m0[88].w + (*spvDescriptorSet0.vp_c9)._m0[88].y;
    float _1440 = fma(_527, (*spvDescriptorSet0.vp_c9)._m0[78].w, _1432);
    float _1442 = fma(_525, (*spvDescriptorSet0.vp_c9)._m0[88].z, _1434);
    float _1444 = fma(_141, (*spvDescriptorSet0.vp_c9)._m0[77].z, _1436);
    float _1446 = trunc(_1418);
    float _1448 = precise::max(_1446, 0.0);
    uint _1450 = uint(_1448);
    float _1452 = fma(_527, (*spvDescriptorSet0.vp_c9)._m0[88].w, _1438);
    float _1454 = fma(_141, (*spvDescriptorSet0.vp_c9)._m0[76].y, _1140);
    float _1456 = -_141;
    float _1458 = fma(_1456, (*spvDescriptorSet0.vp_c9)._m0[76].x, _1278);
    float _1460 = fma(_141, (*spvDescriptorSet0.vp_c9)._m0[77].w, _1440);
    float _1462 = fma(_141, (*spvDescriptorSet0.vp_c9)._m0[87].z, _1442);
    float _1464 = fma(_141, (*spvDescriptorSet0.vp_c9)._m0[87].w, _1452);
    int _1466 = int(_1066) + int(_1424);
    if (_1412)
    {
        float _1468 = _1400 * _1430;
        _163 = _1468;
    }
    float _1470 = _163;
    int _1472 = ~_547;
    int _1474 = _1472 + 1;
    float _1476 = in.m_46.x;
    float _1478 = in.m_46.y;
    float _1480 = in.m_46.z;
    int _1482 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1484 = _1482 != 0;
    float _1486 = _1332 + (-0.5);
    int _1488 = ~_567;
    int _1490 = _1488 + 1;
    int _1492 = _1474 * _1466;
    int _1494 = _1492 + _816;
    int _1496 = _1364 ? 0 : 1;
    float _1498 = -_1444;
    float _1500 = _1498 + 1.0;
    bool _1502 = !_1484;
    float _1504 = _1502 ? _217 : as_type<float>(_1344);
    float _1506 = -_1486;
    float _1508 = -_1454;
    float _1510 = fma(_1506, (*spvDescriptorSet0.vp_c9)._m0[80].y, _1508);
    bool _1512 = _1082 > 0.0;
    float _1514 = -_1460;
    float _1516 = _1514 + 1.0;
    bool _1518 = _1082 >= 0.0;
    bool _1520 = isnan(_1082);
    bool _1522 = _1518 || _1520;
    bool _1524 = isnan(0.0);
    bool _1526 = _1522 || _1524;
    float _1528 = -_1462;
    float _1530 = _1528 + 1.0;
    int _1532 = int(_1156) + int(_1450);
    int _1534 = ~_1496;
    int _1536 = _1534 + 1;
    int _1538 = _1536 + 1;
    int _1540 = _1538;
    if (!_1350)
    {
        int _1542 = ~_1496;
        int _1544 = _1542 + 1;
        _1540 = _1544;
    }
    int _1546 = _1540;
    bool _1548 = uint(_1494) >= uint(_547);
    int _1550 = _1490 * _1532;
    int _1552 = _1550 + _922;
    float _1554 = _1478 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    int _1556 = _1526 ? 0 : 1;
    float _1558 = _1478 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    bool _1560 = !_1548;
    int _1562 = _1560 ? 0 : (-1);
    float _1564 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _1566 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _1564;
    bool _1568 = uint(_1552) >= uint(_567);
    float _1570 = fma(_1476, (*spvDescriptorSet0.vp_c10)._m0[4].x, _1554);
    int _1572 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4194304;
    bool _1574 = _1572 != 0;
    float _1576 = _1566 * _1102;
    bool _1578 = _519 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _1580 = isnan(_519);
    bool _1582 = _1578 || _1580;
    bool _1584 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _1586 = _1582 || _1584;
    float _1588 = float(_1586);
    float _1590 = fma(_1476, (*spvDescriptorSet0.vp_c10)._m0[6].x, _1558);
    int _1592 = ~_1556;
    int _1594 = _1592 + 1;
    int _1596 = _1594 + 1;
    int _1598 = _1596;
    if (!_1512)
    {
        int _1600 = ~_1556;
        int _1602 = _1600 + 1;
        _1598 = _1602;
    }
    int _1604 = _1598;
    float _1606 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _1608 = _519 + _1606;
    bool _1610 = !_1568;
    int _1612 = _1610 ? 0 : (-1);
    float _1614 = -_1588;
    float _1616 = _1614 + 1.0;
    int _1618 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _1620 = _1618 != 0;
    int _1622 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _1624 = _1622 != 0;
    int _1626 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _1628 = _1626 != 0;
    float _1630 = _1478 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    bool _1632 = _519 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _1634 = isnan(_519);
    bool _1636 = _1632 || _1634;
    bool _1638 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _1640 = _1636 || _1638;
    float _1642 = float(_1640);
    bool _1644 = !_1150;
    int _1646 = _1644 ? 0 : 1;
    float _1648 = fma(_1476, (*spvDescriptorSet0.vp_c10)._m0[5].x, _1630);
    float _1650 = fma(_1576, _1608, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    float _1652 = _1642 * _1616;
    float _1654 = _1504 + 0.5;
    float _1656 = fma(_1480, (*spvDescriptorSet0.vp_c10)._m0[5].z, _1648);
    bool _1658 = _1132 >= 0.0;
    bool _1660 = isnan(_1132);
    bool _1662 = _1658 || _1660;
    bool _1664 = isnan(0.0);
    bool _1666 = _1662 || _1664;
    float _1668 = _1650 * _1652;
    float _1670 = fma(_1654, (*spvDescriptorSet0.vp_c9)._m0[80].x, _1458);
    float _1672 = -_1642;
    float _1674 = _1672 + 1.0;
    int _1676 = _1666 ? 0 : 1;
    bool _1678 = _1132 > 0.0;
    float _1680 = fma(_1674, (*spvDescriptorSet0.vp_c9)._m0[131].x, _1668);
    float _1682 = -_1500;
    float _1684 = fma(_1504, _1682, _1670);
    float _1686 = fma(_1332, _1516, _1510);
    float _1688 = fma(_1480, (*spvDescriptorSet0.vp_c10)._m0[4].z, _1570);
    float _1690 = fma(_1588, (*spvDescriptorSet0.vp_c9)._m0[132].x, _1680);
    float _1692 = _1656 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    int _1694 = _1138 >> 31;
    float _1696 = _527 + _525;
    int _1698 = _1194 >> 31;
    float _1700 = fma(_1480, (*spvDescriptorSet0.vp_c10)._m0[6].z, _1590);
    float _1702 = _1688 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _1704 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1706 = _1692 + _1704;
    int _1708 = _1694 & 3;
    float _1710 = _1696 + (-1.0);
    float _1712 = _1700 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    int _1714 = _1698 & 3;
    float _1716 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1718 = _1702 + _1716;
    float _1720 = _1706 * _1706;
    int _1722 = _1138 + _1708;
    out.m_66.x = _1684;
    out.m_66.y = _1686;
    float _1724 = fma(_1710, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _1726 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1728 = _1712 + _1726;
    float _1730 = fma(_1718, _1718, _1720);
    int _1732 = _1722 >> 2;
    float _1734 = _1706 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    bool _1736 = !_1208;
    int _1738 = _1736 ? 0 : 1;
    float _1740 = fma(_1728, _1728, _1730);
    int _1742 = _1732 << 4;
    int _1744 = _1742 + 368;
    float _1746 = fma(_1718, (*spvDescriptorSet0.vp_c8)._m0[28].x, _1734);
    int _1748 = _1194 + _1714;
    float _1750 = _531 * (*spvDescriptorSet0.vp_c9)._m0[18].w;
    bool _1752 = _1148 != 3;
    float _1754 = rsqrt(_1740);
    int _1756 = _1748 >> 2;
    float _1758 = fma(_1728, (*spvDescriptorSet0.vp_c8)._m0[28].z, _1746);
    int _1760 = ~_1676;
    int _1762 = _1760 + 1;
    int _1764 = _1762 + 1;
    float _1766 = _1690 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    int _1768 = _1756 << 4;
    int _1770 = _1768 + 512;
    uint _1772 = uint(int(uint(_1744) >> uint(2)));
    uint _1774 = uint(int(uint(int(_1772)) >> uint(2)));
    int _1776 = int(_1772) & 3;
    float _1778 = (*spvDescriptorSet0.vp_c9)._m0[int(_1774)][_1776];
    int _1780 = int(_1772) + 1;
    uint _1782 = uint(int(uint(_1780) >> uint(2)));
    int _1784 = _1780 & 3;
    float _1786 = (*spvDescriptorSet0.vp_c9)._m0[int(_1782)][_1784];
    int _1788 = _1764;
    float _1790 = _1712;
    if (!_1678)
    {
        int _1792 = ~_1676;
        int _1794 = _1792 + 1;
        _1788 = _1794;
    }
    int _1796 = _1788;
    float _1798 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].w;
    bool _1800 = !_1752;
    int _1802 = _1800 ? 0 : (-1);
    out.m_68.w = _1766;
    bool _1804 = _1206 != 3;
    int _1806 = abs(_1222);
    uint _1808 = uint(int(uint(_1770) >> uint(2)));
    uint _1810 = uint(int(uint(int(_1808)) >> uint(2)));
    int _1812 = int(_1808) & 3;
    float _1814 = (*spvDescriptorSet0.vp_c9)._m0[int(_1810)][_1812];
    int _1816 = int(_1808) + 1;
    uint _1818 = uint(int(uint(_1816) >> uint(2)));
    int _1820 = _1816 & 3;
    float _1822 = (*spvDescriptorSet0.vp_c9)._m0[int(_1818)][_1820];
    bool _1824 = !_1804;
    int _1826 = _1824 ? 0 : (-1);
    bool _1828 = _1758 >= 0.0;
    float _1830 = _1750 * _1754;
    int _1832 = abs(_1306);
    int _1834 = abs(_1316);
    int _1836 = _1744 + 8;
    uint _1838 = uint(int(uint(_1836) >> uint(2)));
    uint _1840 = uint(int(uint(int(_1838)) >> uint(2)));
    int _1842 = int(_1838) & 3;
    float _1844 = (*spvDescriptorSet0.vp_c9)._m0[int(_1840)][_1842];
    int _1846 = int(_1838) + 1;
    uint _1848 = uint(int(uint(_1846) >> uint(2)));
    int _1850 = _1846 & 3;
    float _1852 = (*spvDescriptorSet0.vp_c9)._m0[int(_1848)][_1850];
    float _1854 = _1706 * _1830;
    float _1856 = _1718 * _1830;
    float _1858 = _1728 * _1830;
    float _1860 = _1798 * (*spvDescriptorSet0.vp_c9)._m0[90].y;
    float _1862 = -_1854;
    float _1864 = _1706 + _1862;
    float _1866 = -_1856;
    float _1868 = _1718 + _1866;
    float _1870 = -_1858;
    float _1872 = _1728 + _1870;
    int _1874 = _1770 + 8;
    uint _1876 = uint(int(uint(_1874) >> uint(2)));
    uint _1878 = uint(int(uint(int(_1876)) >> uint(2)));
    int _1880 = int(_1876) & 3;
    float _1882 = (*spvDescriptorSet0.vp_c9)._m0[int(_1878)][_1880];
    int _1884 = int(_1876) + 1;
    uint _1886 = uint(int(uint(_1884) >> uint(2)));
    int _1888 = _1884 & 3;
    float _1890 = (*spvDescriptorSet0.vp_c9)._m0[int(_1886)][_1888];
    float _1892 = _1864 * _1864;
    float _1894 = _858 + (-0.5);
    bool _1896 = !_1620;
    int _1898 = _1896 ? 0 : 1;
    float _1900 = _1856;
    if (_1828)
    {
        out.m_49.x = 0.0;
    }
    float _1902 = fma(_1868, _1868, _1892);
    float _1904 = -_1860;
    float _1906 = -_1426;
    float _1908 = fma(_1904, _1894, _1906);
    int _1910 = abs(_1256);
    float _1912 = -_1530;
    float _1914 = fma(_854, _1912, _1366);
    float _1916 = fma(_1872, _1872, _1902);
    int _1918 = abs(_1204);
    float _1920 = _525 + (-0.5);
    int _1922 = abs(_1646);
    int _1924 = ~_1918;
    int _1926 = _1924 + 1;
    int _1928 = _1926 + 1;
    int _1930 = ~_1910;
    int _1932 = _1930 + 1;
    int _1934 = _1932 + 1;
    int _1936 = ~_1922;
    int _1938 = _1936 + 1;
    int _1940 = _1938 + 1;
    int _1942 = abs(_1738);
    int _1944 = ~_1466;
    int _1946 = _1944 + _1562;
    int _1948 = _1946 + 1;
    int _1950 = _1928 * as_type<int>(_1786);
    int _1952 = ~_1806;
    int _1954 = _1952 + 1;
    int _1956 = _1954 + 1;
    int _1958 = ~_1532;
    int _1960 = _1958 + _1612;
    int _1962 = _1960 + 1;
    int _1964 = _1940 * as_type<int>(_1778);
    int _1966 = _1964 + _1950;
    int _1968 = abs(_1802);
    int _1970 = _547 * _1948;
    int _1972 = _1970 + _816;
    int _1974 = abs(_1898);
    int _1976 = _1934 * as_type<int>(_1822);
    int _1978 = ~_1942;
    int _1980 = _1978 + 1;
    int _1982 = _1980 + 1;
    int _1984 = _567 * _1962;
    int _1986 = _1984 + _922;
    bool _1988 = _547 == 0;
    float _1990 = float(_1796);
    int _1992 = _1982 * as_type<int>(_1814);
    int _1994 = _1992 + _1976;
    int _1996 = _1956 * as_type<int>(_1844);
    int _1998 = _1996 + _1966;
    bool _2000 = !_1574;
    int _2002 = _2000 ? 0 : 1;
    int _2004 = abs(_1826);
    int _2006 = abs(_2002);
    int _2008 = ~_1968;
    int _2010 = _2008 + 1;
    int _2012 = _2010 + 1;
    int _2014 = ~_1832;
    int _2016 = _2014 + 1;
    int _2018 = _2016 + 1;
    int _2020 = ~_2004;
    int _2022 = _2020 + 1;
    int _2024 = _2022 + 1;
    int _2026 = _2012 * as_type<int>(_1852);
    int _2028 = _2026 + _1998;
    float _2030 = float(_1974);
    int _2032 = _2018 * as_type<int>(_1882);
    int _2034 = _2032 + _1994;
    float _2036 = in.m_70.x;
    float _2038 = in.m_70.y;
    float _2040 = in.m_70.z;
    int _2042 = _2024 * as_type<int>(_1890);
    int _2044 = _2042 + _2034;
    float _2046 = sqrt(_1916);
    int _2048 = ~_1834;
    int _2050 = _2048 + 1;
    int _2052 = _2050 + 1;
    float _2054 = -_1464;
    float _2056 = _2054 + 1.0;
    int _2058 = ~_2006;
    int _2060 = _2058 + 1;
    int _2062 = _2060 + 1;
    float _2064 = _2030 * _1990;
    bool _2066 = !_1988;
    int _2068 = _2066 ? _1972 : (-1);
    int _2070 = _2028 * _2052;
    bool _2072 = !_938;
    int _2074 = _2072 ? _1986 : (-1);
    int _2076 = _2044 * _2062;
    float _2078 = fma(_858, _2056, _1908);
    int _2080 = _2068 * _1834;
    int _2082 = _2080 + _2070;
    if (_1828)
    {
        _1198 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _2084 = _1198;
    float _2086 = _2064 * (-2.0);
    int _2088 = _2074 * _2006;
    int _2090 = _2088 + _2076;
    bool _2092 = !_1624;
    int _2094 = _2092 ? 0 : 1;
    out.m_72.x = _1914;
    out.m_72.y = _2078;
    float _2096 = _1754 * _2046;
    int _2098 = as_type<int>(_2084);
    if (_1828)
    {
        float _2100 = _2084 * 5.0;
        _2098 = as_type<int>(_2100);
    }
    int _2102 = _2098;
    float _2104 = float(_2082);
    float _2106 = fma(_2086, _2036, _2036);
    float _2108 = float(_2090);
    float _2110 = _531 * _2096;
    if (_1828)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _6676 = as_type<float>(_2102);
        out.gl_Position.z = _6676;
    }
    float _2112 = fma(_1920, (*spvDescriptorSet0.vp_c9)._m0[196].x, _2106);
    float _2114 = _527 + _740;
    float _2116 = float(_1546);
    out.m_74.x = _2104;
    out.m_74.y = _2108;
    float _2118 = fma(_1724, _2086, _1724);
    float _2120 = _2114 + (-1.0);
    out.m_76.x = _2110;
    bool _2122 = !_1628;
    int _2124 = _2122 ? 0 : 1;
    int _2126 = abs(_2094);
    if (_1828)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_88.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_88.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_88.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_88.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_90.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_90.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_90.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_90.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_49.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_49.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_49.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_49.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_98.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_98.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_98.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_98.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 72, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 73, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 74, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 75, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 76, as_type<uint>(out.m_96.x)); dm_cw(dm_gs, dm_p, 77, as_type<uint>(out.m_96.y)); dm_cw(dm_gs, dm_p, 78, as_type<uint>(out.m_96.z)); dm_cw(dm_gs, dm_p, 79, as_type<uint>(out.m_96.w)); dm_cw(dm_gs, dm_p, 80, as_type<uint>(out.m_92.x)); dm_cw(dm_gs, dm_p, 81, as_type<uint>(out.m_92.y)); dm_cw(dm_gs, dm_p, 82, as_type<uint>(out.m_92.z)); dm_cw(dm_gs, dm_p, 83, as_type<uint>(out.m_92.w)); dm_cw(dm_gs, dm_p, 84, as_type<uint>(out.m_94.x)); dm_cw(dm_gs, dm_p, 85, as_type<uint>(out.m_94.y)); dm_cw(dm_gs, dm_p, 86, as_type<uint>(out.m_94.z)); dm_cw(dm_gs, dm_p, 87, as_type<uint>(out.m_94.w)); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _2128 = -_1854;
    float _2130 = _1692 + _2128;
    int _2132 = abs(_2124);
    float _2134 = -_1856;
    float _2136 = _1702 + _2134;
    float _2138 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2140 = _2130 + _2138;
    float _2142 = -_1858;
    float _2144 = _1712 + _2142;
    float _2146 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2148 = _2136 + _2146;
    float _2150 = float(_2126);
    float _2152 = _2140 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _2154 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2156 = _2144 + _2154;
    float _2158 = float(_1604);
    float _2160 = fma(_2120, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _2162 = fma(_2148, (*spvDescriptorSet0.vp_c8)._m0[28].x, _2152);
    float _2164 = _2150 * _2116;
    float _2166 = float(_2132);
    float _2168 = _527 + (-0.5);
    float _2170 = fma(_2156, (*spvDescriptorSet0.vp_c8)._m0[28].z, _2162);
    float _2172 = _2164 * (-2.0);
    float _2174 = _740 + _525;
    float _2176 = _2166 * _2158;
    float _2178 = fma(_2118, _1470, _2112);
    bool _2180 = _2170 >= 0.0;
    float _2182 = fma(_2172, _2038, _2038);
    float _2184 = fma(_2160, _2172, _2160);
    float _2186 = _2174 + (-1.0);
    float _2188 = fma(_2168, (*spvDescriptorSet0.vp_c9)._m0[196].y, _2182);
    float _2190 = _2176 * (-2.0);
    float _2192 = _2178 * 0.15915493667125701904296875;
    float _2194 = fma(_2186, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _2196 = fma(_2184, _1470, _2188);
    float _2198 = fma(_2190, _2040, _2040);
    float _2200 = _740 + (-0.5);
    float _2202 = _2192 * 6.283185482025146484375;
    float _2204 = sin(_2202);
    float _2206 = _2196 * 0.15915493667125701904296875;
    float _2208 = _2160;
    float _2210 = _2148;
    float _2212 = _2156;
    if (_2180)
    {
        _2208 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _2214 = _2208;
    float _2216 = fma(_2194, _2190, _2194);
    float _2218 = fma(_2200, (*spvDescriptorSet0.vp_c9)._m0[196].z, _2198);
    int _2220 = as_type<int>(_2214);
    if (_2180)
    {
        out.m_49.x = 0.0;
    }
    if (_2180)
    {
        float _2222 = _2214 * 5.0;
        _2220 = as_type<int>(_2222);
    }
    int _2224 = _2220;
    float _2226 = _2192 * 6.283185482025146484375;
    float _2228 = cos(_2226);
    float _2230 = fma(_2216, _1470, _2218);
    if (_2180)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _6879 = as_type<float>(_2224);
        out.gl_Position.z = _6879;
    }
    float _2232 = _2230 * 0.15915493667125701904296875;
    float _2234 = _2206 * 6.283185482025146484375;
    float _2236 = sin(_2234);
    float _2238 = _2206 * 6.283185482025146484375;
    float _2240 = cos(_2238);
    if (_2180)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_88.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_88.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_88.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_88.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_90.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_90.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_90.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_90.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_49.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_49.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_49.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_49.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_98.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_98.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_98.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_98.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 72, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 73, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 74, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 75, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 76, as_type<uint>(out.m_96.x)); dm_cw(dm_gs, dm_p, 77, as_type<uint>(out.m_96.y)); dm_cw(dm_gs, dm_p, 78, as_type<uint>(out.m_96.z)); dm_cw(dm_gs, dm_p, 79, as_type<uint>(out.m_96.w)); dm_cw(dm_gs, dm_p, 80, as_type<uint>(out.m_92.x)); dm_cw(dm_gs, dm_p, 81, as_type<uint>(out.m_92.y)); dm_cw(dm_gs, dm_p, 82, as_type<uint>(out.m_92.z)); dm_cw(dm_gs, dm_p, 83, as_type<uint>(out.m_92.w)); dm_cw(dm_gs, dm_p, 84, as_type<uint>(out.m_94.x)); dm_cw(dm_gs, dm_p, 85, as_type<uint>(out.m_94.y)); dm_cw(dm_gs, dm_p, 86, as_type<uint>(out.m_94.z)); dm_cw(dm_gs, dm_p, 87, as_type<uint>(out.m_94.w)); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _2242 = _2232 * 6.283185482025146484375;
    float _2244 = cos(_2242);
    float _2246 = _323 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _2248 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _207);
    float _2250 = _2204 * _2236;
    float _2252 = _2228 * _2240;
    float _2254 = _2246 * _2096;
    float _2256 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _217);
    float _2258 = _2204 * _2240;
    float _2260 = _2232 * 6.283185482025146484375;
    float _2262 = sin(_2260);
    float _2264 = _2254 * _2248;
    float _2266 = _2228 * _2236;
    float _2268 = _2096 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _2270 = _2268 * 0.5;
    float _2272 = _2228 * _2244;
    float _2274 = _2240 * _2244;
    float _2276 = _2204 * _2244;
    float _2278 = _2236 * _2244;
    float _2280 = _2110 * _2256;
    float _2282 = _2272 * _2264;
    float _2284 = fma(_2262, _2252, _2250);
    float _2286 = -_2258;
    float _2288 = fma(_2262, _2266, _2286);
    float _2290 = -_2264;
    float _2292 = _2262 * _2290;
    float _2294 = -_2266;
    float _2296 = fma(_2262, _2258, _2294);
    float _2298 = fma(_2284, _2280, _2282);
    float _2300 = _2276 * _2264;
    float _2302 = fma(_2274, _2280, _2292);
    float _2304 = fma(_2288, _2270, _2298);
    float _2306 = fma(_2262, _2250, _2252);
    float _2308 = fma(_2296, _2280, _2300);
    float _2310 = fma(_2278, _2270, _2302);
    float _2312 = _2304 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2314 = _2304 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2316 = fma(_2306, _2270, _2308);
    float _2318 = fma(_2310, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2312);
    float _2320 = fma(_2310, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2314);
    float _2322 = fma(_2316, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2318);
    float _2324 = fma(_2316, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2320);
    float _2326 = _2322 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _2328 = _2324 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _2330 = _1712 + _2326;
    float _2332 = _1702 + _2328;
    float _2334 = _2304 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2336 = _2130 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _2338 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _2340 = _2330 + _2338;
    float _2342 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _2344 = _2332 + _2342;
    float _2346 = fma(_2310, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2334);
    float _2348 = fma(_2136, (*spvDescriptorSet0.vp_c8)._m0[11].x, _2336);
    float _2350 = _2340 * _2340;
    float _2352 = fma(_2316, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2346);
    float _2354 = fma(_2144, (*spvDescriptorSet0.vp_c8)._m0[11].z, _2348);
    float _2356 = fma(_2344, _2344, _2350);
    float _2358 = _2352 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _2360 = sqrt(_2356);
    float _2362 = _1692 + _2358;
    bool _2364 = _2360 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2366 = _2352;
    float _2368 = _2358;
    float _2370 = _2336;
    float _2372 = _2280;
    if (!_2364)
    {
        _2366 = _2332;
    }
    float _2374 = _2366;
    float _2376 = _2374;
    if (!_2364)
    {
        _2368 = _2330;
    }
    float _2378 = _2368;
    float _2380 = _2378;
    if (!_2364)
    {
        _2370 = _2362;
    }
    float _2382 = _2370;
    bool _2384 = !_2364;
    float _2386 = _2382;
    if (!_2384)
    {
        float _2388 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2390 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _2392 = _2360 + _2390;
        float _2394 = rsqrt(_2356);
        float _2396 = _2392 * _2388;
        float _2398 = _2362 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2400 = _2396 * 0.15915493667125701904296875;
        float _2402 = _2400 * 6.283185482025146484375;
        float _2404 = cos(_2402);
        float _2406 = _2400 * 6.283185482025146484375;
        float _2408 = sin(_2406);
        float _2410 = _2404 + (-1.0);
        float _2412 = fma(_2408, _2398, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _2414 = _2410 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2416 = _2394 * _2412;
        float _2418 = fma(_2362, _2404, _2414);
        float _2420 = fma(_2344, _2416, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _2422 = fma(_2340, _2416, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _2386 = _2418;
        _2376 = _2420;
        _2380 = _2422;
        _2372 = _2400;
    }
    float _2424 = _2386;
    float _2426 = _2376;
    float _2428 = _2380;
    float _2430 = _2372;
    float _2432 = -_1692;
    float _2434 = _2432 + _2424;
    float _2436 = -_1702;
    float _2438 = _2436 + _2426;
    float _2440 = -_1712;
    float _2442 = _2440 + _2428;
    float _2444 = _2354 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _2446 = _2434 * _2434;
    float _2448 = _2130 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _2450 = 1.0 / _2444;
    float _2452 = fma(_2438, _2438, _2446);
    float _2454 = fma(_2136, (*spvDescriptorSet0.vp_c8)._m0[10].x, _2448);
    bool _2456 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _2458 = isnan(0.5);
    bool _2460 = _2456 || _2458;
    bool _2462 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _2464 = _2460 || _2462;
    float _2466 = fma(_2442, _2442, _2452);
    float _2468 = fma(_2144, (*spvDescriptorSet0.vp_c8)._m0[10].z, _2454);
    bool _2470 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _2472 = isnan(0.5);
    bool _2474 = _2470 || _2472;
    bool _2476 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _2478 = _2474 || _2476;
    float _2480 = sqrt(_2466);
    float _2482 = _2468 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _2484 = _2482 + _2444;
    float _2486 = _2484 * _2450;
    float _2488 = _2486 * 0.5;
    bool _2490 = _2480 > 0.0;
    float _2492 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _2494 = fma(_2488, (*spvDescriptorSet0.vp_c8)._m0[30].w, _2492);
    float _2496 = 1.0 / _2494;
    float _2498 = _2488;
    float _2500 = _2450;
    float _2502 = _2430;
    if (!_2490)
    {
        _2498 = _2426;
    }
    float _2504 = _2498;
    float _2506 = _2504;
    if (!_2490)
    {
        _2500 = _2424;
    }
    float _2508 = _2500;
    float _2510 = _2508;
    if (!_2490)
    {
        _2502 = _2428;
    }
    float _2512 = _2502;
    bool _2514 = !_2490;
    float _2516 = _2512;
    float _2518 = _2512;
    if (!_2514)
    {
        float _2520 = _211 * _211;
        float _2522 = fma(_209, _209, _2520);
        float _2524 = rsqrt(_2466);
        float _2526 = fma(_213, _213, _2522);
        float _2528 = sqrt(_2526);
        float _2530 = _2438 * _2524;
        float _2532 = _2434 * _2524;
        float _2534 = _2442 * _2524;
        bool _2536 = _2528 > 0.0;
        float _2538 = _2524;
        float _2540 = _2528;
        if (!_2536)
        {
            _2538 = _2426;
        }
        float _2542 = _2538;
        _2506 = _2542;
        if (!_2536)
        {
            _2540 = _2424;
        }
        float _2544 = _2540;
        _2510 = _2544;
        if (!_2536)
        {
            _2516 = _2428;
        }
        float _2546 = _2516;
        bool _2548 = !_2536;
        _2518 = _2546;
        if (!_2548)
        {
            float _2550 = rsqrt(_2526);
            float _2552 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].z;
            float _2554 = _211 * _2550;
            float _2556 = _209 * _2550;
            float _2558 = _2532 * _2554;
            float _2560 = _213 * _2550;
            float _2562 = fma(_2530, _2556, _2558);
            float _2564 = _2552 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _2566 = fma(_2534, _2560, _2562);
            float _2568 = _2566 * _2564;
            float _2570 = fma(_209, _2568, _2426);
            float _2572 = fma(_211, _2568, _2424);
            float _2574 = fma(_213, _2568, _2428);
            _2506 = _2570;
            _2510 = _2572;
            _2518 = _2574;
        }
    }
    float _2576 = _2506;
    float _2578 = _2510;
    float _2580 = _2518;
    float _2582 = -_1856;
    float _2584 = _2582 + _2576;
    float _2586 = -_1854;
    float _2588 = _2586 + _2578;
    float _2590 = -_1858;
    float _2592 = _2590 + _2580;
    float _2594 = _2588;
    float _2596 = _2584;
    float _2598 = _2592;
    if (_2478)
    {
        _221 = 1.0;
    }
    float _2600 = _221;
    float _2602 = _2600;
    if (!_2464)
    {
        float _2604 = _2140 * _2140;
        float _2606 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _2608 = -_1712;
        float _2610 = _2608 + _2580;
        float _2612 = -_1692;
        float _2614 = _2612 + _2578;
        float _2616 = fma(_2148, _2148, _2604);
        float _2618 = fma(_2156, _2156, _2616);
        float _2620 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _2622 = sqrt(_2618);
        float _2624 = 1.0 / _2096;
        float _2626 = precise::min(_2622, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _2628 = _2626 * _2606;
        float _2630 = _2620 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _2632 = -_1702;
        float _2634 = _2632 + _2576;
        float _2636 = _2628 * _2624;
        float _2638 = _2630 * _2636;
        float _2640 = _2610 * _2636;
        float _2642 = fma(_2614, _2638, _2130);
        float _2644 = fma(_2634, _2638, _2136);
        float _2646 = fma(_2630, _2640, _2144);
        _2594 = _2642;
        _2596 = _2644;
        _2598 = _2646;
        _2210 = _2622;
        _1790 = _2640;
    }
    float _2648 = _2594;
    float _2650 = _2596;
    float _2652 = _2598;
    float _2654 = _2210;
    float _2656 = _1790;
    float _2658 = _2654;
    float _2660 = _2656;
    if (_2478)
    {
        _1900 = 1.0;
    }
    float _2662 = _1900;
    float _2664 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _2666 = _2496 * _2664;
    float _2668 = _2662;
    if (!_2478)
    {
        float _2670 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _2672 = _2670 * 0.15915493667125701904296875;
        float _2674 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _2676 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2678 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _2676;
        float _2680 = _2672 * 6.283185482025146484375;
        float _2682 = cos(_2680);
        float _2684 = _2674 * 0.15915493667125701904296875;
        float _2686 = _2672 * 6.283185482025146484375;
        float _2688 = sin(_2686);
        float _2690 = 1.0 / _2682;
        float _2692 = _2684 * 6.283185482025146484375;
        float _2694 = cos(_2692);
        float _2696 = _2688 * _2690;
        float _2698 = _2684 * 6.283185482025146484375;
        float _2700 = sin(_2698);
        float _2702 = _2694 * _2696;
        float _2704 = 1.0 / _2678;
        float _2706 = 1.0 / _2702;
        float _2708 = _2700 * _2706;
        float _2710 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2712 = fma(_2666, _2708, _2710);
        float _2714 = _2712 * _2704;
        float _2716 = precise::clamp(_2714, 0.0, 1.0);
        _2212 = _2684;
        _2658 = _2696;
        _2602 = _2716;
    }
    float _2718 = _2212;
    float _2720 = _2658;
    float _2722 = _2602;
    float _2724 = _2718;
    float _2726 = _2720;
    if (!_2478)
    {
        float _2728 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _2730 = _2728 * 0.15915493667125701904296875;
        float _2732 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _2734 = _2730 * 6.283185482025146484375;
        float _2736 = cos(_2734);
        float _2738 = _2732 * 0.15915493667125701904296875;
        float _2740 = _2730 * 6.283185482025146484375;
        float _2742 = sin(_2740);
        float _2744 = 1.0 / _2736;
        float _2746 = _2738 * 6.283185482025146484375;
        float _2748 = cos(_2746);
        float _2750 = _2742 * _2744;
        float _2752 = _2738 * 6.283185482025146484375;
        float _2754 = sin(_2752);
        float _2756 = _2748 * _2750;
        float _2758 = 1.0 / _2756;
        float _2760 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _2762 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _2760;
        float _2764 = 1.0 / _2762;
        float _2766 = _2754 * _2758;
        float _2768 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _2770 = fma(_2666, _2766, _2768);
        float _2772 = _2770 * _2764;
        float _2774 = precise::clamp(_2772, 0.0, 1.0);
        float _2776 = -_2774;
        float _2778 = _2776 + 1.0;
        _2724 = _2744;
        _2726 = _2756;
        _2668 = _2778;
    }
    float _2780 = _2724;
    float _2782 = _2726;
    float _2784 = _2668;
    float _2786 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2788 = _2648 + _2786;
    float _2790 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2792 = _2650 + _2790;
    float _2794 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2796 = _2652 + _2794;
    float _2798 = _2648 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _2800 = _2788 * _2788;
    float _2802 = fma(_2650, (*spvDescriptorSet0.vp_c8)._m0[3].x, _2798);
    float _2804 = fma(_2792, _2792, _2800);
    float _2806 = fma(_2796, _2796, _2804);
    float _2808 = rsqrt(_2806);
    float _2810 = sqrt(_2806);
    float _2812 = _2808 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _2814 = _2792 * _2812;
    float _2816 = _2796 * _2812;
    float _2818 = _2814 * _2814;
    float _2820 = _2816 * _2816;
    float _2822 = _2818 + _2820;
    float _2824 = sqrt(_2822);
    bool _2826 = _2824 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2828 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2830 = _2824 + _2828;
    float _2832 = _2780;
    float _2834 = _2822;
    float _2836 = _2830;
    float _2838 = _2782;
    float _2840 = _2788;
    if (_2826)
    {
        float _2842 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2832 = _2842;
    }
    float _2844 = _2832;
    if (_2826)
    {
        float _2846 = rsqrt(_2822);
        _2834 = _2846;
    }
    float _2848 = _2834;
    float _2850 = _2848;
    if (_2826)
    {
        float _2852 = _2830 * _2844;
        _2836 = _2852;
    }
    float _2854 = _2836;
    if (_2826)
    {
        float _2856 = _2854 * 0.15915493667125701904296875;
        _2838 = _2856;
    }
    float _2858 = _2838;
    float _2860 = _2796;
    float _2862 = _2858;
    if (_2826)
    {
        float _2864 = _2858 * 6.283185482025146484375;
        float _2866 = sin(_2864);
        _2860 = _2866;
    }
    float _2868 = _2860;
    float _2870 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _2872 = precise::max(0.0, _2870);
    float _2874 = _2844;
    if (_2826)
    {
        float _2876 = _2858 * 6.283185482025146484375;
        float _2878 = cos(_2876);
        _2874 = _2878;
    }
    float _2880 = _2874;
    float _2882 = -_2812;
    float _2884 = -_2872;
    float _2886 = fma(_2788, _2882, _2884);
    float _2888 = (*spvDescriptorSet0.vp_c15)._m0[652].x;
    if (_2826)
    {
        float _2890 = _2886 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2840 = _2890;
    }
    float _2892 = _2840;
    float _2894 = _2892;
    if (!_2826)
    {
        _2862 = _2814;
    }
    float _2896 = _2862;
    float _2898 = fma(_2136, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _2900 = _2868;
    float _2902 = _2896;
    if (_2826)
    {
        float _2904 = fma(_2868, _2892, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _2900 = _2904;
    }
    float _2906 = _2900;
    float _2908 = _2906;
    if (!_2826)
    {
        _2894 = _2886;
    }
    float _2910 = _2894;
    float _2912 = _2910;
    float _2914 = _2880;
    if (_2826)
    {
        float _2916 = _2880 + (-1.0);
        _2888 = _2916;
    }
    float _2918 = _2888;
    float _2920 = _2918;
    if (_2826)
    {
        float _2922 = _2848 * _2906;
        _2660 = _2922;
    }
    float _2924 = _2660;
    if (!_2826)
    {
        _2850 = _2816;
    }
    float _2926 = _2850;
    float _2928 = _2926;
    if (_2826)
    {
        float _2930 = _2918 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2920 = _2930;
    }
    float _2932 = _2920;
    if (_2826)
    {
        float _2934 = _2814 * _2924;
        _2902 = _2934;
    }
    float _2936 = _2902;
    if (!_2826)
    {
        _2908 = _2818;
    }
    float _2938 = _2908;
    float _2940 = _2938;
    if (_2826)
    {
        float _2942 = _2816 * _2924;
        _2928 = _2942;
    }
    float _2944 = _2928;
    if (_2826)
    {
        float _2946 = fma(_2886, _2880, _2932);
        _2912 = _2946;
    }
    float _2948 = _2912;
    if (_2826)
    {
        float _2950 = _2936 * _2936;
        _2940 = _2950;
    }
    float _2952 = _2940;
    if (!_2826)
    {
        _2914 = _2820;
    }
    float _2954 = _2914;
    float _2956 = _2954;
    if (_2826)
    {
        float _2958 = _2944 * _2944;
        _2956 = _2958;
    }
    float _2960 = _2956;
    float _2962 = _2648 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _2964 = fma(_2948, _2948, _2952);
    float _2966 = floor(_2898);
    float _2968 = fma(_2650, (*spvDescriptorSet0.vp_c8)._m0[2].x, _2962);
    float _2970 = _2964 + _2960;
    float _2972 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _2974 = fma(_2810, (*spvDescriptorSet0.vp_c15)._m0[23].w, _2972);
    float _2976 = precise::clamp(_2974, 0.0, 1.0);
    float _2978 = fma(_2652, (*spvDescriptorSet0.vp_c8)._m0[2].z, _2968);
    float _2980 = rsqrt(_2970);
    float _2982 = -_2976;
    float _2984 = _2982 + 1.0;
    float _2986 = _2978 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _2988 = fma(_2144, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _2990 = _2648 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2992 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _2994 = abs(_2984);
    float _2996 = log2(_2994);
    float _2998 = _2648 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _3000 = _2986 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _3002 = fma(_2650, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2990);
    float _3004 = fma(_2650, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2998);
    float _3006 = -_3000;
    float _3008 = fma(_3006, _2992, 1.0);
    float _3010 = fma(_2652, (*spvDescriptorSet0.vp_c8)._m0[0].z, _3002);
    float _3012 = _2980 * _2936;
    float _3014 = fma(_2652, (*spvDescriptorSet0.vp_c8)._m0[1].z, _3004);
    float _3016 = _2980 * _2948;
    float _3018 = _2980 * _2944;
    float _3020 = _3012 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _3022 = _3014 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _3024 = _3010 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _3026 = floor(_2988);
    float _3028 = -_3020;
    float _3030 = fma(_3016, (*spvDescriptorSet0.vp_c15)._m0[21].y, _3028);
    float _3032 = _3022 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _3034 = _2996 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _3036 = -_3018;
    float _3038 = fma(_3036, (*spvDescriptorSet0.vp_c15)._m0[21].z, _3030);
    float _3040 = fma(_2652, (*spvDescriptorSet0.vp_c8)._m0[3].z, _2802);
    float _3042 = fma(_3024, (*spvDescriptorSet0.vp_c8)._m0[7].x, _3032);
    float _3044 = exp2(_3034);
    float _3046 = fma(_3038, -0.5, 0.5);
    float _3048 = _3040 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _3050 = fma(_2986, (*spvDescriptorSet0.vp_c8)._m0[7].z, _3042);
    float _3052 = fma(_3038, 0.5, 0.5);
    float _3054 = _3022 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _3056 = fma(_3048, (*spvDescriptorSet0.vp_c8)._m0[7].w, _3050);
    float _3058 = log2(_3008);
    float _3060 = -_3026;
    float _3062 = _2988 + _3060;
    float _3064 = fma(_3052, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _3066 = fma(_3024, (*spvDescriptorSet0.vp_c8)._m0[5].x, _3054);
    float _3068 = fma(_3052, _3064, -0.212114393711090087890625);
    float _3070 = fma(_2986, (*spvDescriptorSet0.vp_c8)._m0[5].z, _3066);
    float _3072 = 1.0 / _3056;
    float _3074 = -_2966;
    float _3076 = _2898 + _3074;
    float _3078 = _3022 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _3080 = fma(_3024, (*spvDescriptorSet0.vp_c8)._m0[4].x, _3078);
    float _3082 = _3016 + 1.0;
    float _3084 = sqrt(_3046);
    float _3086 = _3058 * 0.693147182464599609375;
    float _3088 = fma(_2986, (*spvDescriptorSet0.vp_c8)._m0[4].z, _3080);
    float _3090 = -_3016;
    float _3092 = fma(_3044, _3082, _3090);
    float _3094 = fma(_3052, _3068, 1.570728778839111328125);
    float2 _8232 = float2(_3076, _3062);
    float _3096 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_8232, float2(0.0), isnan(_8232)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_8232, float2(0.0), isnan(_8232)), level(0.0)).x;
    float _3098 = fma(_3048, (*spvDescriptorSet0.vp_c8)._m0[4].w, _3088);
    float _3100 = fma(_3048, (*spvDescriptorSet0.vp_c8)._m0[5].w, _3070);
    float _3102 = _3086 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _3104 = fma(_3092, 0.5, 0.5);
    float _3106 = _3098 * _3072;
    float _3108 = _3100 * _3072;
    float _3110 = fma(_3106, 0.5, 0.5);
    float _3112 = fma(_3108, -0.5, 0.5);
    float _3114 = _3084 * 0.636619746685028076171875;
    float _3116 = -_3094;
    float _3118 = fma(_3114, _3116, 1.0);
    float3 _8277 = float3(_3110, _3112, _3102);
    float _3120 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_8277, float3(0.0), isnan(_8277)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_8277, float3(0.0), isnan(_8277)), level(0.0)).x;
    float3 _8288 = float3(_3110, _3112, _3102);
    float4 _3123 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_8288, float3(0.0), isnan(_8288)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_8288, float3(0.0), isnan(_8288)), level(0.0)).xyzw;
    float _3125 = _3123.x;
    float _3127 = _3123.y;
    float _3129 = _3123.z;
    float _3131 = _3123.w;
    float2 _8304 = float2(_3118, _3104);
    float3 _3135 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_8304, float2(0.0), isnan(_8304)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_8304, float2(0.0), isnan(_8304)), level(0.0)).xyz;
    float _3137 = _3135.x;
    float _3139 = _3135.y;
    float _3141 = _3135.z;
    float _3143 = abs(_2666);
    float _3145 = log2(_3143);
    float _3147 = _2284 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _3149 = _2284 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _3151 = _2284 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _3153 = _2272 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _3155 = fma(_2274, (*spvDescriptorSet0.vp_c8)._m0[24].x, _3147);
    float _3157 = fma(_2274, (*spvDescriptorSet0.vp_c8)._m0[25].x, _3149);
    float _3159 = fma(_2274, (*spvDescriptorSet0.vp_c8)._m0[26].x, _3151);
    float _3161 = _2272 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _3163 = _2272 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _3165 = _2288 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _3167 = _2288 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _3169 = _2288 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _3171 = -_2262;
    float _3173 = fma(_3171, (*spvDescriptorSet0.vp_c8)._m0[25].x, _3153);
    float _3175 = -_2262;
    float _3177 = fma(_3175, (*spvDescriptorSet0.vp_c8)._m0[26].x, _3163);
    float _3179 = _207 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _3181 = _3145 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _3183 = -_2262;
    float _3185 = fma(_3183, (*spvDescriptorSet0.vp_c8)._m0[24].x, _3161);
    float _3187 = fma(_2278, (*spvDescriptorSet0.vp_c8)._m0[24].x, _3165);
    float _3189 = fma(_2278, (*spvDescriptorSet0.vp_c8)._m0[25].x, _3167);
    float _3191 = exp2(_3181);
    float _3193 = fma(_2278, (*spvDescriptorSet0.vp_c8)._m0[26].x, _3169);
    float _3195 = fma(_2276, (*spvDescriptorSet0.vp_c8)._m0[24].z, _3185);
    float _3197 = fma(_2306, (*spvDescriptorSet0.vp_c8)._m0[24].z, _3187);
    float _3199 = fma(_2306, (*spvDescriptorSet0.vp_c8)._m0[25].z, _3189);
    float _3201 = fma(_2306, (*spvDescriptorSet0.vp_c8)._m0[26].z, _3193);
    float _3203 = fma(_2296, (*spvDescriptorSet0.vp_c8)._m0[24].z, _3155);
    float _3205 = fma(_2276, (*spvDescriptorSet0.vp_c8)._m0[25].z, _3173);
    float _3207 = fma(_3179, _3179, 1.0);
    float _3209 = _217 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _3211 = fma(_2276, (*spvDescriptorSet0.vp_c8)._m0[26].z, _3177);
    float _3213 = _3022 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _3215 = rsqrt(_3207);
    float _3217 = fma(_2296, (*spvDescriptorSet0.vp_c8)._m0[25].z, _3157);
    float _3219 = _2996 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _3221 = fma(_3191, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _3223 = precise::clamp(_3221, 0.0, 1.0);
    float _3225 = fma(_2296, (*spvDescriptorSet0.vp_c8)._m0[26].z, _3159);
    float _3227 = _3179 * _3205;
    float _3229 = _3223 * _3223;
    float _3231 = fma(_3024, (*spvDescriptorSet0.vp_c8)._m0[6].x, _3213);
    float _3233 = fma(_3223, -2.0, 3.0);
    float _3235 = _3179 * _3195;
    float _3237 = exp2(_3219);
    float _3239 = fma(_3209, _3217, _3227);
    float _3241 = _3229 * _3233;
    float _3243 = fma(_3209, _3203, _3235);
    float _3245 = _3179 * _3211;
    float _3247 = _3179 * _3215;
    float _3249 = -_3241;
    float _3251 = _3249 + 1.0;
    out.m_78.x = _3203;
    out.m_78.y = _3217;
    out.m_78.z = _3225;
    float _3253 = fma(_3209, _3225, _3245);
    float _3255 = -_3197;
    float _3257 = _3247 * _3255;
    float _3259 = fma(_3251, (*spvDescriptorSet0.vp_c15)._m0[654].w, _3241);
    float _3261 = fma(_2986, (*spvDescriptorSet0.vp_c8)._m0[6].z, _3231);
    float _3263 = in.m_80.x;
    float _3265 = fma(_3215, _3195, _3257);
    float _3267 = _3197 + _3243;
    float _3269 = _3199 + _3239;
    float _3271 = -_3237;
    float _3273 = _3271 + 1.0;
    out.m_82.x = _2650;
    out.m_82.y = _2648;
    out.m_82.z = _2652;
    bool _3275 = _2810 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _3277 = isnan(_2810);
    bool _3279 = _3275 || _3277;
    bool _3281 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _3283 = _3279 || _3281;
    float _3285 = -_3199;
    float _3287 = _3247 * _3285;
    float _3289 = -_3201;
    float _3291 = _3247 * _3289;
    float _3293 = _3273 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _3295 = fma(_3215, _3205, _3287);
    bool _3297 = _2666 <= 8000.0;
    bool _3299 = isnan(_2666);
    bool _3301 = _3297 || _3299;
    bool _3303 = isnan(8000.0);
    bool _3305 = _3301 || _3303;
    float _3307 = float(_3305);
    float _3309 = fma(_3215, _3211, _3291);
    float _3311 = fma(_3048, (*spvDescriptorSet0.vp_c8)._m0[6].w, _3261);
    float _3313 = _3056 * 0.5;
    float _3315 = _3098 + _3056;
    float _3317 = _3307 * _3259;
    out.m_84.x = _3265;
    out.m_84.y = _3295;
    out.m_84.z = _3309;
    float _3319 = _3311 + _3056;
    float _3321 = fma(_3100, -0.5, _3313);
    float _3323 = _3317 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    out.gl_Position.x = _3098;
    out.gl_Position.y = _3100;
    out.gl_Position.z = _3311;
    out.gl_Position.w = _3056;
    float _3325 = _3319 * 0.5;
    float _3327 = _3201 + _3253;
    float _3329 = _3315 * 0.5;
    out.m_86.x = _3267;
    out.m_86.y = _3269;
    out.m_86.z = _3327;
    float _3331 = _3199;
    float _3333 = _3309;
    float _3335 = (*spvDescriptorSet0.vp_c15)._m0[653].y;
    if (!_3283)
    {
        _3331 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _3337 = _3331;
    float _3339 = _3337;
    float _3341 = _3337;
    if (!_3283)
    {
        _3333 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _3343 = _3333;
    out.m_88.z = _3325;
    out.m_88.w = _3056;
    out.m_90.x = _3329;
    out.m_90.y = _3321;
    out.m_90.z = _3325;
    out.m_90.w = _3056;
    float _3345 = -_3096;
    float _3347 = _3345 + 1.0;
    float _3349 = _3347 * _3323;
    float _3351 = precise::clamp(_3349, 0.0, 1.0);
    float _3353 = -_3351;
    float _3355 = fma(_3353, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _3357 = _3127;
    float _3359 = _3343;
    float _3361 = _3343;
    if (!_3283)
    {
        _3335 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _3363 = _3335;
    float _3365 = _3355 * _3263;
    float _3367 = _3365 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _3369 = _3293 * _3120;
    float _3371 = -_3293;
    float _3373 = _3371 + 1.0;
    float _3375 = _3131 * _3369;
    float _3377 = _3141 * _3369;
    float _3379 = _3131 * _3373;
    out.m_92.x = _3367;
    float _3381 = fma(_3137, _3375, _3125);
    float _3383 = fma(_3139, _3375, _3127);
    float _3385 = fma(_3131, _3377, _3129);
    float _3387 = _2722 * _2784;
    float _3389 = _3369;
    float _3391 = _3387;
    float _3393 = _3363;
    float _3395 = _3363;
    if (!_3283)
    {
        _3389 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _3397 = _3389;
    float _3399 = _3397;
    float _3401 = _3397;
    if (!_3283)
    {
        _3357 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _3403 = _3357;
    out.m_94.x = _3381;
    out.m_94.y = _3383;
    out.m_94.z = _3385;
    out.m_94.w = _3379;
    float _3405 = _3387 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _3407 = _3403;
    float _3409 = _3403;
    if (!_3283)
    {
        _3391 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _3411 = _3391;
    bool _3413 = !_3283;
    float _3415 = _3411;
    float _3417 = _3411;
    if (!_3413)
    {
        bool _3419 = _2810 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _3421 = isnan(_2810);
        bool _3423 = _3419 || _3421;
        bool _3425 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _3427 = _3423 || _3425;
        if (!_3427)
        {
            float _3429 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _3431 = _2810 + _3429;
            float _3433 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _3435 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _3433;
            float _3437 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _3439 = _3437 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _3441 = 1.0 / _3435;
            float _3443 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _3445 = _3443 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _3447 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _3449 = _3447 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _3451 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _3453 = _3451 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _3455 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _3457 = _3455 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _3459 = _3431 * _3441;
            float _3461 = precise::clamp(_3459, 0.0, 1.0);
            float _3463 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _3465 = _3463 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _3467 = fma(_3461, _3439, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _3469 = fma(_3461, _3465, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _3471 = fma(_3461, _3445, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _3473 = fma(_3461, _3449, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _3475 = fma(_3461, _3453, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _3477 = fma(_3461, _3457, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _3361 = _3471;
            _3409 = _3475;
            _3341 = _3467;
            _3401 = _3473;
            _3395 = _3469;
            _3417 = _3477;
            _3479 = true;
        }
        else
        {
            bool _3481 = _2810 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _3483 = isnan(_2810);
            bool _3485 = _3481 || _3483;
            bool _3487 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _3489 = _3485 || _3487;
            if (!_3489)
            {
                _3339 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _3491 = _3339;
            _3341 = _3491;
            if (!_3489)
            {
                _3359 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _3493 = _3359;
            _3361 = _3493;
            if (!_3489)
            {
                _3393 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _3495 = _3393;
            _3395 = _3495;
            if (!_3489)
            {
                _3399 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _3497 = _3399;
            _3401 = _3497;
            if (!_3489)
            {
                _3407 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _3499 = _3407;
            _3409 = _3499;
            if (!_3489)
            {
                _3415 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _3501 = _3415;
            bool _3503 = !_3489;
            _3417 = _3501;
            if (!_3503)
            {
                bool _3505 = _2810 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _3507 = isnan(_2810);
                bool _3509 = _3505 || _3507;
                bool _3511 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _3513 = _3509 || _3511;
                if (!_3513)
                {
                    float _3515 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _3517 = _2810 + _3515;
                    float _3519 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _3521 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _3519;
                    float _3523 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _3525 = _3523 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _3527 = 1.0 / _3521;
                    float _3529 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _3531 = _3529 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _3533 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _3535 = _3533 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _3537 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _3539 = _3537 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _3541 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _3543 = _3541 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _3545 = _3517 * _3527;
                    float _3547 = precise::clamp(_3545, 0.0, 1.0);
                    float _3549 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _3551 = _3549 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _3553 = fma(_3547, _3525, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _3555 = fma(_3547, _3551, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _3557 = fma(_3547, _3531, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _3559 = fma(_3547, _3535, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _3561 = fma(_3547, _3539, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _3563 = fma(_3547, _3543, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _3361 = _3557;
                    _3409 = _3561;
                    _3341 = _3553;
                    _3401 = _3559;
                    _3395 = _3555;
                    _3417 = _3563;
                    _3479 = true;
                }
                else
                {
                    _3361 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _3409 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _3341 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _3401 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _3395 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _3417 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _3479 = false;
    float _3565 = _3361;
    float _3567 = _3409;
    float _3569 = _3341;
    float _3571 = _3401;
    float _3573 = _3395;
    float _3575 = _3417;
    float _3577 = fma(_3269, -0.5, 0.5);
    float _3579 = precise::clamp(_3577, 0.0, 1.0);
    float _3581 = -_3565;
    float _3583 = _3581 + _3567;
    float _3585 = _3405 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _3587 = -_3569;
    float _3589 = _3587 + _3571;
    float _3591 = fma(_3579, _3583, _3565);
    out.m_96.x = 0.0;
    float _3593 = -_3573;
    float _3595 = _3593 + _3575;
    float _3597 = fma(_3579, _3589, _3569);
    float _3599 = _3591 * 0.586610972881317138671875;
    out.m_49.x = _3585;
    bool _3601 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _3603 = fma(_3579, _3595, _3573);
    float _3605 = fma(_3597, 0.298911988735198974609375, _3599);
    bool _3607 = _2722 > 0.0;
    bool _3609 = isnan(_2722);
    bool _3611 = _3607 || _3609;
    bool _3613 = isnan(0.0);
    bool _3615 = _3611 || _3613;
    float _3617 = fma(_3603, 0.114477999508380889892578125, _3605);
    bool _3619 = _2784 <= 0.0;
    bool _3621 = !_3615;
    bool _3623 = _3619 || _3621;
    float _3625 = -_3617;
    float _3627 = _3591 + _3625;
    float _3629 = -_3617;
    float _3631 = _3597 + _3629;
    float _3633 = -_3617;
    float _3635 = _3603 + _3633;
    float _3637 = fma(_3627, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3617);
    float _3639 = fma(_3631, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3617);
    float _3641 = fma(_3635, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3617);
    bool _3643 = !_3601;
    if (!_3643)
    {
        float _3645 = -_2648;
        float _3647 = _3645 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _3649 = -_2650;
        float _3651 = _3649 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _3653 = -_2652;
        float _3655 = _3653 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _3657 = _3647 * _3647;
        float _3659 = fma(_3651, _3651, _3657);
        float _3661 = fma(_3655, _3655, _3659);
        float _3663 = sqrt(_3661);
        float _3665 = rsqrt(_3661);
        float _3667 = -_3663;
        float _3669 = _3667 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _3671 = _3669 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _3673 = precise::clamp(_3671, 0.0, 1.0);
        float _3675 = _3651 * _3665;
        float _3677 = _3647 * _3665;
        float _3679 = abs(_3673);
        float _3681 = log2(_3679);
        float _3683 = _3655 * _3665;
        float _3685 = _3675 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _3687 = _3269 * _3677;
        float _3689 = -_3677;
        float _3691 = -_3685;
        float _3693 = fma(_3689, (*spvDescriptorSet0.vp_c15)._m0[656].y, _3691);
        float _3695 = fma(_3267, _3675, _3687);
        float _3697 = -_3683;
        float _3699 = fma(_3697, (*spvDescriptorSet0.vp_c15)._m0[656].z, _3693);
        float _3701 = fma(_3327, _3683, _3695);
        float _3703 = precise::clamp(_3701, 0.0, 1.0);
        float _3705 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _3707 = _3699 + _3705;
        float _3709 = _3681 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _3711 = _3707 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _3713 = precise::clamp(_3711, 0.0, 1.0);
        float _3715 = exp2(_3709);
        float _3717 = _3715 * _3713;
        float _3719 = _3703 * _3717;
        float _3721 = _3719 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _3723 = _3719 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _3725 = _3719 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_96.x = _3721;
        out.m_96.y = _3723;
        out.m_96.z = _3725;
    }
    out.m_98.x = _3639;
    out.m_98.y = _3637;
    out.m_98.z = _3641;
    if (!_3623)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_88.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_88.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_88.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_88.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_90.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_90.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_90.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_90.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_49.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_49.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_49.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_49.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_98.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_98.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_98.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_98.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 72, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 73, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 74, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 75, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 76, as_type<uint>(out.m_96.x)); dm_cw(dm_gs, dm_p, 77, as_type<uint>(out.m_96.y)); dm_cw(dm_gs, dm_p, 78, as_type<uint>(out.m_96.z)); dm_cw(dm_gs, dm_p, 79, as_type<uint>(out.m_96.w)); dm_cw(dm_gs, dm_p, 80, as_type<uint>(out.m_92.x)); dm_cw(dm_gs, dm_p, 81, as_type<uint>(out.m_92.y)); dm_cw(dm_gs, dm_p, 82, as_type<uint>(out.m_92.z)); dm_cw(dm_gs, dm_p, 83, as_type<uint>(out.m_92.w)); dm_cw(dm_gs, dm_p, 84, as_type<uint>(out.m_94.x)); dm_cw(dm_gs, dm_p, 85, as_type<uint>(out.m_94.y)); dm_cw(dm_gs, dm_p, 86, as_type<uint>(out.m_94.z)); dm_cw(dm_gs, dm_p, 87, as_type<uint>(out.m_94.w)); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _3727 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.m_49.x = 0.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _3727;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_88.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_88.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_88.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_88.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_90.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_90.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_90.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_90.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_49.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_49.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_49.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_49.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_98.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_98.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_98.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_98.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 72, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 73, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 74, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 75, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 76, as_type<uint>(out.m_96.x)); dm_cw(dm_gs, dm_p, 77, as_type<uint>(out.m_96.y)); dm_cw(dm_gs, dm_p, 78, as_type<uint>(out.m_96.z)); dm_cw(dm_gs, dm_p, 79, as_type<uint>(out.m_96.w)); dm_cw(dm_gs, dm_p, 80, as_type<uint>(out.m_92.x)); dm_cw(dm_gs, dm_p, 81, as_type<uint>(out.m_92.y)); dm_cw(dm_gs, dm_p, 82, as_type<uint>(out.m_92.z)); dm_cw(dm_gs, dm_p, 83, as_type<uint>(out.m_92.w)); dm_cw(dm_gs, dm_p, 84, as_type<uint>(out.m_94.x)); dm_cw(dm_gs, dm_p, 85, as_type<uint>(out.m_94.y)); dm_cw(dm_gs, dm_p, 86, as_type<uint>(out.m_94.z)); dm_cw(dm_gs, dm_p, 87, as_type<uint>(out.m_94.w)); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

