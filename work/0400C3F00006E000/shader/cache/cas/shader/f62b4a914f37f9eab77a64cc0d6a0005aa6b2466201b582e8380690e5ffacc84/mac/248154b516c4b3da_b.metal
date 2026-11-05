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
    float4 m_60 [[user(locn0)]];
    float4 m_68 [[user(locn1)]];
    float4 m_49 [[user(locn2)]];
    float4 m_92 [[user(locn3)]];
    float4 m_70 [[user(locn4)]];
    float4 m_74 [[user(locn5)]];
    float4 m_82 [[user(locn6)]];
    float4 m_72 [[user(locn7)]];
    float4 m_78 [[user(locn8)]];
    float4 m_84 [[user(locn9)]];
    float4 m_90 [[user(locn10)]];
    float4 m_86 [[user(locn11)]];
    float4 m_88 [[user(locn12)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_80 [[attribute(0)]];
    float4 m_66 [[attribute(1)]];
    float4 m_62 [[attribute(2)]];
    float4 m_64 [[attribute(3)]];
    float4 m_76 [[attribute(4)]];
    float4 m_46 [[attribute(5)]];
    float4 m_51 [[attribute(6)]];
    float4 m_56 [[attribute(7)]];
    float4 m_58 [[attribute(8)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_60 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_68 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_49 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_92 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_70 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_74 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_82 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_72 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_78 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_84 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_90 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_86 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_88 = float4(0.0, 0.0, 0.0, 1.0);
    bool _3147 = false;
    bool _431 = false;
    bool _309 = false;
    bool _207 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _106 = in.m_46.w;
    float _108 = trunc(_106);
    int _111 = int(_108);
    bool _115 = _111 >= 1;
    float _117 = 0.0;
    if (!_115)
    {
        _117 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _119 = _117;
    float _121 = _119;
    if (!_115)
    {
        out.m_49.x = 0.0;
    }
    int _123 = 0;
    if (!_115)
    {
        float _125 = _119 * 5.0;
        _123 = as_type<int>(_125);
    }
    int _127 = _123;
    int _129 = _127;
    if (!_115)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3452 = as_type<float>(_127);
        out.gl_Position.z = _3452;
    }
    if (!_115)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _131 = in.m_51.w;
    bool _133 = _131 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _135 = isnan(_131);
    bool _137 = _133 || _135;
    bool _139 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _141 = _137 || _139;
    float _143 = -_131;
    float _145 = _143 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _147 = _145;
    if (_141)
    {
        float _149 = float(_111);
        _121 = _149;
    }
    float _151 = _121;
    bool _153 = _145 >= _151;
    bool _155 = !_141;
    bool _157 = _153 || _155;
    float _159 = _151;
    if (_157)
    {
        _159 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _161 = _159;
    if (_157)
    {
        out.m_49.x = 0.0;
    }
    if (_157)
    {
        float _163 = _161 * 5.0;
        _129 = as_type<int>(_163);
    }
    int _165 = _129;
    if (_157)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3522 = as_type<float>(_165);
        out.gl_Position.z = _3522;
    }
    if (_157)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _167 = as_type<float>(int(gl_VertexIndex));
    bool _169 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    int _171 = as_type<int>(_167) & 1;
    bool _173 = _171 != 0;
    int _175 = as_type<int>(_167) & 2;
    bool _177 = _175 != 0;
    bool _179 = !_173;
    float _181 = _179 ? (-0.5) : 0.5;
    bool _183 = !_177;
    float _185 = _183 ? (-0.5) : 0.5;
    bool _187 = !_169;
    float _205;
    if (!_187)
    {
        float _189 = in.m_56.x;
        float _191 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _193 = _189 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _195 = fma(_193, (*spvDescriptorSet0.vp_c9)._m0[12].x, _145);
        float _197 = _195 * _191;
        float _199 = floor(_197);
        float _201 = -_199;
        float _203 = _197 + _201;
        _205 = _203;
        _207 = true;
    }
    else
    {
        float _209 = float(_111);
        float _211 = 1.0 / _209;
        float _213 = _145 * _211;
        _205 = _213;
    }
    _207 = false;
    float _215 = _205;
    float _217 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _219 = _215 + _217;
    bool _221 = _215 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _223 = isnan(_215);
    bool _225 = _221 || _223;
    bool _227 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _229 = _225 || _227;
    float _231 = float(_229);
    float _233 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _235 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _233;
    float _237 = -_231;
    float _239 = _237 + 1.0;
    bool _241 = _215 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _243 = isnan(_215);
    bool _245 = _241 || _243;
    bool _247 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _249 = _245 || _247;
    float _251 = float(_249);
    float _253 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _255 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _253;
    bool _257 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _259 = 1.0 / _235;
    float _261 = _251 * _239;
    float _263 = -_251;
    float _265 = _263 + 1.0;
    float _267 = _219 * _259;
    float _269 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _271 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _269;
    float _273 = fma(_255, _267, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _275 = fma(_271, _267, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _277 = _273 * _261;
    float _279 = _275 * _261;
    float _281 = fma(_265, (*spvDescriptorSet0.vp_c9)._m0[143].x, _277);
    float _283 = fma(_265, (*spvDescriptorSet0.vp_c9)._m0[143].y, _279);
    float _285 = fma(_231, (*spvDescriptorSet0.vp_c9)._m0[144].x, _281);
    float _287 = fma(_231, (*spvDescriptorSet0.vp_c9)._m0[144].y, _283);
    bool _289 = !_257;
    float _307;
    if (!_289)
    {
        float _291 = in.m_56.x;
        float _293 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _295 = _291 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _297 = fma(_295, (*spvDescriptorSet0.vp_c9)._m0[11].y, _145);
        float _299 = _297 * _293;
        float _301 = floor(_299);
        float _303 = -_301;
        float _305 = _299 + _303;
        _307 = _305;
        _309 = true;
    }
    else
    {
        float _311 = float(_111);
        float _313 = 1.0 / _311;
        float _315 = _145 * _313;
        _307 = _315;
    }
    _309 = false;
    float _317 = _307;
    bool _319 = _317 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _321 = isnan(_317);
    bool _323 = _319 || _321;
    bool _325 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _327 = _323 || _325;
    float _329 = float(_327);
    float _331 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _333 = _331 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _335 = _317 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _337 = isnan(_317);
    bool _339 = _335 || _337;
    bool _341 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _343 = _339 || _341;
    float _345 = float(_343);
    float _347 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _349 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _347;
    float _351 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _353 = _317 + _351;
    float _355 = -_329;
    float _357 = _355 + 1.0;
    bool _359 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _361 = 1.0 / _333;
    float _363 = _345 * _357;
    float _365 = -_345;
    float _367 = _365 + 1.0;
    float _369 = _349 * _361;
    float _371 = fma(_369, _353, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _373 = _371 * _363;
    float _375 = fma(_367, (*spvDescriptorSet0.vp_c9)._m0[115].x, _373);
    float _377 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _379 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _381 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _383 = fma(_329, (*spvDescriptorSet0.vp_c9)._m0[116].x, _375);
    float _385 = _377 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _387 = _379 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _389 = _381 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _391 = _383 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _393 = in.m_58.x;
    float _395 = in.m_58.y;
    out.m_60.x = _385;
    out.m_60.y = _387;
    out.m_60.z = _389;
    out.m_60.w = _391;
    float _397 = _287 * _395;
    float _399 = _285 * _393;
    bool _401 = !_359;
    float _425;
    float _427;
    float _429;
    if (!_401)
    {
        float _403 = in.m_56.x;
        float _405 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _407 = float(_111);
        float _409 = 1.0 / _407;
        float _411 = _403 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _413 = _145 * _409;
        float _415 = fma(_411, (*spvDescriptorSet0.vp_c9)._m0[11].w, _145);
        float _417 = _415 * _405;
        float _419 = floor(_417);
        float _421 = -_419;
        float _423 = _417 + _421;
        _425 = _413;
        _427 = _407;
        _429 = _423;
        _431 = true;
    }
    else
    {
        float _433 = float(_111);
        float _435 = 1.0 / _433;
        float _437 = _145 * _435;
        _425 = _437;
        _427 = _433;
        _429 = _437;
    }
    _431 = false;
    float _439 = _425;
    float _441 = _427;
    float _443 = _429;
    float _445 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].y);
    int _447 = int(_445);
    float _449 = in.m_56.x;
    int _451 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _453 = _451 != 0;
    float _455 = in.m_56.z;
    float _457 = in.m_56.w;
    float _459 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].x);
    int _461 = int(_459);
    int _463 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8192;
    bool _465 = _463 != 0;
    float _467 = in.m_62.x;
    float _469 = in.m_62.y;
    float _471 = in.m_62.z;
    float _473 = in.m_62.w;
    float _475 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _477 = log2(_475);
    float _479 = float(_447);
    float _481 = 0.0;
    if (!_453)
    {
        float _483 = in.m_56.y;
        _481 = _483;
    }
    float _485 = _481;
    float _487 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _489 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _491 = 0.0;
    if (!_453)
    {
        float _493 = in.m_56.z;
        _491 = _493;
    }
    float _495 = _491;
    float _497 = 1.0 / _479;
    float _499 = float(uint(_461));
    float _501 = _449 * 2.0;
    int _503 = ~_461;
    int _505 = _503 + 1;
    float _507 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    bool _509 = _461 == 0;
    float _511 = (*spvDescriptorSet0.vp_c9)._m0[88].z + (*spvDescriptorSet0.vp_c9)._m0[88].x;
    float _513 = 0.0;
    if (_453)
    {
        _513 = _449;
    }
    float _515 = _513;
    float _517 = 1.0 / _499;
    float _519 = _477 * _145;
    float _521 = _515;
    if (!_453)
    {
        _521 = _455;
    }
    float _523 = _521;
    float _525 = fma(_449, (*spvDescriptorSet0.vp_c9)._m0[88].z, _511);
    float _527 = _497 * _145;
    int _529 = ~_461;
    int _531 = _529 + 1;
    float _533 = exp2(_519);
    float _535 = 0.0;
    float _537 = _495;
    if (!_453)
    {
        _535 = _485;
    }
    float _539 = _535;
    float _541 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _543 = _541 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _545 = -(*spvDescriptorSet0.vp_c9)._m0[151].w;
    float _547 = _545 + (*spvDescriptorSet0.vp_c9)._m0[152].w;
    float _549 = 0.0;
    float _551 = _539;
    if (!_453)
    {
        _549 = _495;
    }
    float _553 = _549;
    int _555 = as_type<int>(_517) + (-2);
    float _557 = trunc(_527);
    int _559 = int(_557);
    float _561 = 0.0;
    float _563 = _553;
    if (!_453)
    {
        _561 = _539;
    }
    float _565 = _561;
    bool _567 = _439 >= (*spvDescriptorSet0.vp_c9)._m0[153].w;
    bool _569 = isnan(_439);
    bool _571 = _567 || _569;
    bool _573 = isnan((*spvDescriptorSet0.vp_c9)._m0[153].w);
    bool _575 = _571 || _573;
    float _577 = float(_575);
    float _579 = _565;
    float _581 = _485;
    if (_453)
    {
        float _583 = in.m_56.x;
        float _585 = in.m_56.y;
        _579 = _583;
        _581 = _585;
    }
    float _587 = _579;
    float _589 = _581;
    float _591 = -_533;
    float _593 = _591 + 1.0;
    float _595 = floor(_501);
    float _597 = -(*spvDescriptorSet0.vp_c9)._m0[155].w;
    float _599 = _597 + (*spvDescriptorSet0.vp_c9)._m0[156].w;
    bool _601 = _439 >= (*spvDescriptorSet0.vp_c9)._m0[152].w;
    bool _603 = isnan(_439);
    bool _605 = _601 || _603;
    bool _607 = isnan((*spvDescriptorSet0.vp_c9)._m0[152].w);
    bool _609 = _605 || _607;
    float _611 = float(_609);
    float _613 = float(uint(_559));
    float _615 = 1.0 / _543;
    float _617 = float(_559);
    float _619 = as_type<float>(_555) * _613;
    float _621 = trunc(_619);
    float _623 = precise::max(_621, 0.0);
    uint _626 = uint(_623);
    if (_453)
    {
        _551 = _589;
    }
    float _628 = _551;
    float _630 = 1.0 / _547;
    float _632 = float(_461);
    float _634 = _628;
    if (_453)
    {
        _563 = _628;
    }
    float _636 = _563;
    bool _638 = _617 >= _632;
    bool _640 = isnan(_617);
    bool _642 = _638 || _640;
    bool _644 = isnan(_632);
    bool _646 = _642 || _644;
    float _648 = float(_646);
    bool _650 = !_453;
    float _652 = _650 ? _589 : _449;
    int _654 = _531 * int(_626);
    int _656 = _654 + _559;
    if (_453)
    {
        _537 = _628;
    }
    float _658 = _537;
    float _660 = trunc(_648);
    int _662 = int(_660);
    if (!_453)
    {
        _634 = _449;
    }
    float _664 = _634;
    float _666 = float(uint(_656));
    float _668 = fma(_658, (*spvDescriptorSet0.vp_c9)._m0[83].w, _507);
    float _670 = as_type<float>(_555) * _666;
    bool _672 = !_453;
    float _674 = _672 ? 1.2345600128173828125 : 1.0;
    float _676 = trunc(_670);
    float _678 = precise::max(_676, 0.0);
    uint _680 = uint(_678);
    float _682 = _674 * _652;
    float _684 = floor(_682);
    int _686 = int(_626) + int(_680);
    int _688 = ~_662;
    int _690 = _688 + 1;
    int _692 = _690 + 1;
    int _694 = _505 * _686;
    int _696 = _694 + _559;
    float _698 = -_684;
    float _700 = _682 + _698;
    bool _702 = uint(_696) >= uint(_461);
    float _704 = _632 * _700;
    float _706 = 1.0 / _441;
    float _708 = _632 * _145;
    bool _710 = !_702;
    int _712 = _710 ? 0 : (-1);
    int _714 = ~_686;
    int _716 = _714 + _712;
    int _718 = _716 + 1;
    float _720 = trunc(_704);
    int _722 = int(_720);
    int _724 = _461 * _718;
    int _726 = _724 + _559;
    bool _728 = !_509;
    int _730 = _728 ? _726 : (-1);
    float _732 = _708 * _706;
    int _734 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 256;
    bool _736 = _734 != 0;
    int _738 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 512;
    bool _740 = _738 != 0;
    int _742 = _461 + (-1);
    int _744 = _730 * _692;
    bool _746 = !_465;
    int _748 = _746 ? 0 : 1;
    float _750 = trunc(_732);
    int _752 = int(_750);
    int _754 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1024;
    bool _756 = _754 != 0;
    int _758 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2048;
    bool _760 = _758 != 0;
    int _762 = _662 * _742;
    int _764 = _762 + _744;
    bool _766 = !_740;
    int _768 = _766 ? 0 : 1;
    bool _770 = !_736;
    int _772 = _770 ? 0 : 1;
    int _774 = abs(_748);
    int _776 = abs(_768);
    bool _778 = !_756;
    int _780 = _778 ? 0 : 1;
    int _782 = abs(_772);
    bool _784 = !_760;
    int _786 = _784 ? 0 : 1;
    int _788 = abs(_780);
    int _790 = _764 * _776;
    int _792 = ~_461;
    int _794 = _792 + 1;
    int _796 = _722 * _774;
    int _798 = _796 + _559;
    int _800 = abs(_786);
    int _802 = _752 * _782;
    int _804 = _802 + _790;
    bool _806 = _457 > 0.5;
    float _808 = in.m_64.x;
    float _810 = in.m_64.y;
    float _812 = in.m_64.z;
    float _814 = in.m_64.w;
    int _816 = _798 * _788;
    int _818 = _816 + _804;
    int _820 = ~_461;
    int _822 = _820 + 1;
    float _824 = -_185;
    int _826 = _806 ? as_type<int>(_824) : as_type<int>(_185);
    int _828 = _722 * _800;
    int _830 = _828 + _818;
    float _832 = float(uint(_830));
    float _834 = as_type<float>(_555) * _832;
    float _836 = trunc(_834);
    float _838 = precise::max(_836, 0.0);
    uint _840 = uint(_838);
    int _842 = _822 * int(_840);
    int _844 = _842 + _830;
    float _846 = float(uint(_844));
    float _848 = as_type<float>(_555) * _846;
    float _850 = trunc(_848);
    float _852 = precise::max(_850, 0.0);
    uint _854 = uint(_852);
    int _856 = int(_840) + int(_854);
    int _858 = _794 * _856;
    int _860 = _858 + _830;
    bool _862 = uint(_860) >= uint(_461);
    bool _864 = !_862;
    int _866 = _864 ? 0 : (-1);
    int _868 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _870 = _868 != 0;
    int _872 = ~_856;
    int _874 = _872 + _866;
    int _876 = _874 + 1;
    int _878 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16;
    bool _880 = _878 != 0;
    int _882 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32;
    bool _884 = _882 != 0;
    float _886 = in.m_46.x;
    float _888 = in.m_46.y;
    float _890 = in.m_46.z;
    bool _892 = _455 > 0.5;
    int _894 = _461 * _876;
    int _896 = _894 + _830;
    bool _898 = _461 == 0;
    float _900 = in.m_66.x;
    float _902 = in.m_66.y;
    float _904 = in.m_66.z;
    float _906 = in.m_66.w;
    float _908 = -_185;
    int _910 = _892 ? as_type<int>(_908) : as_type<int>(_185);
    bool _912 = !_870;
    float _914 = _912 ? _185 : as_type<float>(_826);
    bool _916 = !_884;
    float _918 = _916 ? _185 : as_type<float>(_910);
    bool _920 = !_898;
    int _922 = _920 ? _896 : (-1);
    float _924 = -_181;
    int _926 = _892 ? as_type<int>(_924) : as_type<int>(_181);
    int _928 = _922 & 3;
    bool _930 = _928 != 0;
    int _932 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _934 = _932 != 0;
    bool _936 = uint(_928) > 1u;
    bool _938 = !_934;
    float _940 = _938 ? _181 : as_type<float>(_926);
    int _942 = _922 & 3;
    bool _944 = _942 != 0;
    float _946 = _888 * _469;
    int _948 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4194304;
    bool _950 = _948 != 0;
    float _952 = _888 * _810;
    int _954 = _944 ? 0 : 1;
    float _956 = _888 * _902;
    int _958 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _960 = _958 != 0;
    float _962 = fma(_886, _467, _946);
    int _964 = ~_954;
    int _966 = _964 + 1;
    int _968 = _966 + 1;
    float _970 = fma(_886, _808, _952);
    int _972 = _968;
    if (!_936)
    {
        int _974 = ~_954;
        int _976 = _974 + 1;
        _972 = _976;
    }
    int _978 = _972;
    bool _980 = uint(_928) >= 2u;
    int _982 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _984 = _982 != 0;
    int _986 = _980 ? 0 : 1;
    bool _988 = _928 != 3;
    float _990 = (*spvDescriptorSet0.vp_c9)._m0[87].x + (*spvDescriptorSet0.vp_c9)._m0[86].z;
    float _992 = _523 * (*spvDescriptorSet0.vp_c9)._m0[87].x;
    int _994 = ~_986;
    int _996 = _994 + 1;
    int _998 = _996 + 1;
    float _1000 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _1002 = -(*spvDescriptorSet0.vp_c9)._m0[152].w;
    float _1004 = _1002 + (*spvDescriptorSet0.vp_c9)._m0[153].w;
    float _1006 = -_990;
    float _1008 = fma(_992, 2.0, _1006);
    int _1010 = _998;
    if (_988)
    {
        int _1012 = ~_986;
        int _1014 = _1012 + 1;
        _1010 = _1014;
    }
    int _1016 = _1010;
    float _1018 = fma(_587, (*spvDescriptorSet0.vp_c9)._m0[83].z, _1000);
    bool _1020 = _449 > 0.5;
    float _1022 = _587 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _1024 = -_145;
    float _1026 = fma(_1024, (*spvDescriptorSet0.vp_c9)._m0[86].x, _1008);
    float _1028 = -_181;
    int _1030 = _1020 ? as_type<int>(_1028) : as_type<int>(_181);
    float _1032 = -_487;
    float _1034 = fma(_1022, 2.0, _1032);
    bool _1036 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1038 = isnan(0.0);
    bool _1040 = _1036 || _1038;
    bool _1042 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1044 = _1040 || _1042;
    float _1046 = _636 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _1048 = (*spvDescriptorSet0.vp_c9)._m0[87].y + (*spvDescriptorSet0.vp_c9)._m0[86].w;
    float _1050 = _1044 ? _593 : 0.0;
    float _1052 = fma(_1046, -2.0, _489);
    bool _1054 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1056 = isnan(1.0);
    bool _1058 = _1054 || _1056;
    bool _1060 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1062 = _1058 || _1060;
    float _1064 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _1066 = 1.0 + _1064;
    float _1068 = _664 * (*spvDescriptorSet0.vp_c9)._m0[87].y;
    float _1070 = fma(_145, (*spvDescriptorSet0.vp_c9)._m0[82].w, _668);
    float _1072 = fma(_886, _900, _956);
    float _1074 = _589 * 2.0;
    float _1076 = fma(_1068, -2.0, _1048);
    float _1078 = 1.0 / _1066;
    float _1080 = (*spvDescriptorSet0.vp_c9)._m0[88].w + (*spvDescriptorSet0.vp_c9)._m0[88].y;
    float _1082 = -(*spvDescriptorSet0.vp_c9)._m0[154].w;
    float _1084 = _1082 + (*spvDescriptorSet0.vp_c9)._m0[155].w;
    float _1086 = fma(_145, (*spvDescriptorSet0.vp_c9)._m0[82].z, _1018);
    float _1088 = -_145;
    float _1090 = fma(_1088, (*spvDescriptorSet0.vp_c9)._m0[81].x, _1034);
    float _1092 = fma(_589, (*spvDescriptorSet0.vp_c9)._m0[88].w, _1080);
    float _1094 = fma(_145, (*spvDescriptorSet0.vp_c9)._m0[87].z, _525);
    float _1096 = fma(_145, (*spvDescriptorSet0.vp_c9)._m0[81].y, _1052);
    float _1098 = fma(_145, (*spvDescriptorSet0.vp_c9)._m0[86].y, _1076);
    float _1100 = fma(_145, (*spvDescriptorSet0.vp_c9)._m0[87].w, _1092);
    float _1102 = floor(_1074);
    float _1104 = fma(_890, _904, _1072);
    float _1106 = -_577;
    float _1108 = _1106 + 1.0;
    if (_1062)
    {
        float _1110 = _1050 * _1078;
        _147 = _1110;
    }
    float _1112 = _147;
    bool _1114 = _595 >= 0.0;
    bool _1116 = isnan(_595);
    bool _1118 = _1114 || _1116;
    bool _1120 = isnan(0.0);
    bool _1122 = _1118 || _1120;
    float _1124 = -(*spvDescriptorSet0.vp_c9)._m0[156].w;
    float _1126 = _1124 + (*spvDescriptorSet0.vp_c9)._m0[157].w;
    float _1128 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _1130 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _1128;
    float _1132 = fma(_890, _471, _962);
    int _1134 = _1122 ? 0 : 1;
    float _1136 = -(*spvDescriptorSet0.vp_c9)._m0[153].w;
    float _1138 = _1136 + (*spvDescriptorSet0.vp_c9)._m0[154].w;
    bool _1140 = _595 > 0.0;
    float _1142 = _1130 * _615;
    float _1144 = _455 * 2.0;
    float _1146 = 1.0 / _599;
    int _1148 = ~_1134;
    int _1150 = _1148 + 1;
    int _1152 = _1150 + 1;
    float _1154 = fma(_890, _812, _970);
    float _1156 = -(*spvDescriptorSet0.vp_c9)._m0[152].x;
    float _1158 = _1156 + (*spvDescriptorSet0.vp_c9)._m0[153].x;
    float _1160 = _1132 + _473;
    float _1162 = float(uint(_798));
    float _1164 = 1.0 / _1138;
    int _1166 = _1152;
    if (!_1140)
    {
        int _1168 = ~_1134;
        int _1170 = _1168 + 1;
        _1166 = _1170;
    }
    int _1172 = _1166;
    float _1174 = -(*spvDescriptorSet0.vp_c9)._m0[151].x;
    float _1176 = (*spvDescriptorSet0.vp_c9)._m0[152].x + _1174;
    bool _1178 = _1102 >= 0.0;
    bool _1180 = isnan(_1102);
    bool _1182 = _1178 || _1180;
    bool _1184 = isnan(0.0);
    bool _1186 = _1182 || _1184;
    float _1188 = -(*spvDescriptorSet0.vp_c9)._m0[155].x;
    float _1190 = (*spvDescriptorSet0.vp_c9)._m0[156].x + _1188;
    float _1192 = _1176 * _630;
    int _1194 = _1186 ? 0 : 1;
    float _1196 = 1.0 / _1084;
    bool _1198 = _1102 > 0.0;
    float _1200 = -(*spvDescriptorSet0.vp_c9)._m0[153].x;
    float _1202 = (*spvDescriptorSet0.vp_c9)._m0[154].x + _1200;
    float _1204 = -(*spvDescriptorSet0.vp_c9)._m0[154].x;
    float _1206 = _1204 + (*spvDescriptorSet0.vp_c9)._m0[155].x;
    float _1208 = -(*spvDescriptorSet0.vp_c9)._m0[156].x;
    float _1210 = _1208 + (*spvDescriptorSet0.vp_c9)._m0[157].x;
    float _1212 = -(*spvDescriptorSet0.vp_c9)._m0[157].w;
    float _1214 = _1212 + (*spvDescriptorSet0.vp_c9)._m0[158].w;
    int _1216 = ~_1194;
    int _1218 = _1216 + 1;
    int _1220 = _1218 + 1;
    float _1222 = as_type<float>(_555) * _1162;
    float _1224 = 1.0 / _1126;
    float _1226 = _1202 * _1164;
    int _1228 = abs(_978);
    float _1230 = -_1094;
    float _1232 = _1230 + 1.0;
    float _1234 = float(_1172);
    int _1236 = _1220;
    if (!_1198)
    {
        int _1238 = ~_1194;
        int _1240 = _1238 + 1;
        _1236 = _1240;
    }
    int _1242 = _1236;
    float _1244 = floor(_1144);
    float _1246 = _1206 * _1196;
    float _1248 = -(*spvDescriptorSet0.vp_c9)._m0[151].w;
    float _1250 = _439 + _1248;
    float _1252 = _1190 * _1146;
    bool _1254 = _439 >= (*spvDescriptorSet0.vp_c9)._m0[158].w;
    bool _1256 = isnan(_439);
    bool _1258 = _1254 || _1256;
    bool _1260 = isnan((*spvDescriptorSet0.vp_c9)._m0[158].w);
    bool _1262 = _1258 || _1260;
    float _1264 = float(_1262);
    float _1266 = fma(_1192, _1250, (*spvDescriptorSet0.vp_c9)._m0[151].x);
    float _1268 = -(*spvDescriptorSet0.vp_c9)._m0[152].w;
    float _1270 = _439 + _1268;
    float _1272 = 1.0 / _1004;
    float _1274 = _1210 * _1224;
    float _1276 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _1278 = _443 + _1276;
    float _1280 = -_1264;
    float _1282 = _1280 + 1.0;
    float _1284 = fma(_1142, _1278, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    float _1286 = -(*spvDescriptorSet0.vp_c9)._m0[153].w;
    float _1288 = _439 + _1286;
    bool _1290 = _1244 >= 0.0;
    bool _1292 = isnan(_1244);
    bool _1294 = _1290 || _1292;
    bool _1296 = isnan(0.0);
    bool _1298 = _1294 || _1296;
    float _1300 = 1.0 / _1214;
    float _1302 = -(*spvDescriptorSet0.vp_c9)._m0[154].w;
    float _1304 = _439 + _1302;
    int _1306 = _1298 ? 0 : 1;
    bool _1308 = _1244 > 0.0;
    float _1310 = fma(_1246, _1304, (*spvDescriptorSet0.vp_c9)._m0[154].x);
    float _1312 = _1158 * _1272;
    bool _1314 = _439 >= (*spvDescriptorSet0.vp_c9)._m0[157].w;
    bool _1316 = isnan(_439);
    bool _1318 = _1314 || _1316;
    bool _1320 = isnan((*spvDescriptorSet0.vp_c9)._m0[157].w);
    bool _1322 = _1318 || _1320;
    float _1324 = float(_1322);
    bool _1326 = _439 >= (*spvDescriptorSet0.vp_c9)._m0[156].w;
    bool _1328 = isnan(_439);
    bool _1330 = _1326 || _1328;
    bool _1332 = isnan((*spvDescriptorSet0.vp_c9)._m0[156].w);
    bool _1334 = _1330 || _1332;
    float _1336 = float(_1334);
    float _1338 = fma(_1312, _1270, (*spvDescriptorSet0.vp_c9)._m0[152].x);
    float _1340 = fma(_1226, _1288, (*spvDescriptorSet0.vp_c9)._m0[153].x);
    float _1342 = -(*spvDescriptorSet0.vp_c9)._m0[155].w;
    float _1344 = _439 + _1342;
    float _1346 = -_1324;
    float _1348 = _1346 + 1.0;
    float _1350 = _1324 * _1282;
    float _1352 = fma(_1252, _1344, (*spvDescriptorSet0.vp_c9)._m0[155].x);
    bool _1354 = _439 >= (*spvDescriptorSet0.vp_c9)._m0[155].w;
    bool _1356 = isnan(_439);
    bool _1358 = _1354 || _1356;
    bool _1360 = isnan((*spvDescriptorSet0.vp_c9)._m0[155].w);
    bool _1362 = _1358 || _1360;
    float _1364 = float(_1362);
    float _1366 = _1336 * _1348;
    float _1368 = -(*spvDescriptorSet0.vp_c9)._m0[157].x;
    float _1370 = (*spvDescriptorSet0.vp_c9)._m0[158].x + _1368;
    float _1372 = -_1336;
    float _1374 = _1372 + 1.0;
    bool _1376 = _439 >= (*spvDescriptorSet0.vp_c9)._m0[154].w;
    bool _1378 = isnan(_439);
    bool _1380 = _1376 || _1378;
    bool _1382 = isnan((*spvDescriptorSet0.vp_c9)._m0[154].w);
    bool _1384 = _1380 || _1382;
    float _1386 = float(_1384);
    float _1388 = _1370 * _1300;
    float _1390 = _1364 * _1374;
    float _1392 = -(*spvDescriptorSet0.vp_c9)._m0[156].w;
    float _1394 = _439 + _1392;
    float _1396 = -_1364;
    float _1398 = _1396 + 1.0;
    float _1400 = -_1386;
    float _1402 = _1400 + 1.0;
    float _1404 = fma(_1274, _1394, (*spvDescriptorSet0.vp_c9)._m0[156].x);
    float _1406 = _1386 * _1398;
    float _1408 = -(*spvDescriptorSet0.vp_c9)._m0[157].w;
    float _1410 = _439 + _1408;
    float _1412 = trunc(_1222);
    float _1414 = precise::max(_1412, 0.0);
    uint _1416 = uint(_1414);
    bool _1418 = _443 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _1420 = isnan(_443);
    bool _1422 = _1418 || _1420;
    bool _1424 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _1426 = _1422 || _1424;
    float _1428 = float(_1426);
    float _1430 = _577 * _1402;
    float _1432 = fma(_1388, _1410, (*spvDescriptorSet0.vp_c9)._m0[157].x);
    bool _1434 = _443 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _1436 = isnan(_443);
    bool _1438 = _1434 || _1436;
    bool _1440 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _1442 = _1438 || _1440;
    float _1444 = float(_1442);
    float _1446 = _611 * _1108;
    bool _1448 = _439 >= (*spvDescriptorSet0.vp_c9)._m0[151].w;
    bool _1450 = isnan(_439);
    bool _1452 = _1448 || _1450;
    bool _1454 = isnan((*spvDescriptorSet0.vp_c9)._m0[151].w);
    bool _1456 = _1452 || _1454;
    float _1458 = float(_1456);
    float _1460 = -_611;
    float _1462 = _1460 + 1.0;
    int _1464 = ~_461;
    int _1466 = _1464 + 1;
    float _1468 = -_1444;
    float _1470 = _1468 + 1.0;
    float _1472 = _1458 * _1462;
    float _1474 = _1104 + _906;
    float _1476 = _1428 * _1470;
    float _1478 = _1266 * _1472;
    float _1480 = -_1428;
    float _1482 = _1480 + 1.0;
    int _1484 = _1466 * int(_1416);
    int _1486 = _1484 + _798;
    float _1488 = _1284 * _1476;
    float _1490 = -_1458;
    float _1492 = _1490 + 1.0;
    float _1494 = _1154 + _814;
    int _1496 = ~_461;
    int _1498 = _1496 + 1;
    float _1500 = fma(_1482, (*spvDescriptorSet0.vp_c9)._m0[131].x, _1488);
    float _1502 = float(uint(_1486));
    float _1504 = fma(_1492, (*spvDescriptorSet0.vp_c9)._m0[151].x, _1478);
    float _1506 = fma(_1444, (*spvDescriptorSet0.vp_c9)._m0[132].x, _1500);
    float _1508 = _589 + _449;
    float _1510 = as_type<float>(_555) * _1502;
    float _1512 = fma(_1338, _1446, _1504);
    float _1514 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1516 = _1506 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _1518 = trunc(_1510);
    float _1520 = precise::max(_1518, 0.0);
    uint _1522 = uint(_1520);
    float _1524 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    int _1526 = ~_1306;
    int _1528 = _1526 + 1;
    int _1530 = _1528 + 1;
    float _1532 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    int _1534 = _1530;
    if (!_1308)
    {
        int _1536 = ~_1306;
        int _1538 = _1536 + 1;
        _1534 = _1538;
    }
    int _1540 = _1534;
    float _1542 = _1514 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1544 = _1524 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1546 = _1532 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1548 = _1508 + (-1.0);
    bool _1550 = !_960;
    float _1552 = _1550 ? _181 : as_type<float>(_1030);
    float _1554 = fma(_1340, _1430, _1512);
    bool _1556 = _589 > 0.5;
    out.m_68.x = _1542;
    out.m_68.y = _1544;
    out.m_68.z = _1546;
    out.m_68.w = _1516;
    float _1558 = _940 + 0.5;
    float _1560 = fma(_1310, _1406, _1554);
    int _1562 = int(_1416) + int(_1522);
    float _1564 = fma(_1548, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _1566 = -_181;
    int _1568 = _1556 ? as_type<int>(_1566) : as_type<int>(_181);
    float _1570 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].z;
    float _1572 = -_185;
    int _1574 = _1556 ? as_type<int>(_1572) : as_type<int>(_185);
    int _1576 = _1498 * _1562;
    int _1578 = _1576 + _798;
    float _1580 = fma(_1558, (*spvDescriptorSet0.vp_c9)._m0[85].x, _1090);
    bool _1582 = !_880;
    float _1584 = _1582 ? _181 : as_type<float>(_1568);
    float _1586 = _1552 + 0.5;
    bool _1588 = uint(_1578) >= uint(_461);
    float _1590 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1592 = _1160 + _1590;
    int _1594 = _922 >> 31;
    float _1596 = fma(_1352, _1390, _1560);
    int _1598 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _1600 = _1598 != 0;
    int _1602 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _1604 = _1602 != 0;
    int _1606 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _1608 = _1606 != 0;
    float _1610 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1612 = _1474 + _1610;
    int _1614 = _1594 & 3;
    float _1616 = _1592 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    bool _1618 = !_930;
    int _1620 = _1618 ? 0 : 1;
    float _1622 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    int _1624 = _922 + _1614;
    float _1626 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1628 = _1494 + _1626;
    float _1630 = fma(_1612, (*spvDescriptorSet0.vp_c8)._m0[28].x, _1616);
    bool _1632 = _928 != 3;
    float _1634 = _1584 + 0.5;
    int _1636 = _1624 >> 2;
    float _1638 = fma(_1628, (*spvDescriptorSet0.vp_c8)._m0[28].z, _1630);
    bool _1640 = !_1632;
    int _1642 = _1640 ? 0 : (-1);
    float _1644 = _1570 * (*spvDescriptorSet0.vp_c9)._m0[90].x;
    int _1646 = _1636 << 4;
    int _1648 = _1646 + 512;
    float _1650 = fma(_1404, _1366, _1596);
    bool _1652 = _1638 >= 0.0;
    float _1654 = fma(_1644, _1634, _1026);
    uint _1656 = uint(int(uint(_1648) >> uint(2)));
    uint _1658 = uint(int(uint(int(_1656)) >> uint(2)));
    int _1660 = int(_1656) & 3;
    float _1662 = (*spvDescriptorSet0.vp_c9)._m0[int(_1658)][_1660];
    int _1664 = int(_1656) + 1;
    uint _1666 = uint(int(uint(_1664) >> uint(2)));
    int _1668 = _1664 & 3;
    float _1670 = (*spvDescriptorSet0.vp_c9)._m0[int(_1666)][_1668];
    float _1672 = -_1086;
    float _1674 = _1672 + 1.0;
    float _1676 = _1592 * _1592;
    float _1678 = _1586 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    bool _1680 = !_984;
    float _1682 = _1680 ? _185 : as_type<float>(_1574);
    float _1684 = -_1674;
    float _1686 = fma(_940, _1684, _1580);
    float _1688 = fma(_1612, _1612, _1676);
    float _1690 = _1678 * _1622;
    float _1692 = _914 + (-0.5);
    int _1694 = _1648 + 8;
    uint _1696 = uint(int(uint(_1694) >> uint(2)));
    uint _1698 = uint(int(uint(int(_1696)) >> uint(2)));
    int _1700 = int(_1696) & 3;
    float _1702 = (*spvDescriptorSet0.vp_c9)._m0[int(_1698)][_1700];
    int _1704 = int(_1696) + 1;
    uint _1706 = uint(int(uint(_1704) >> uint(2)));
    int _1708 = _1704 & 3;
    float _1710 = (*spvDescriptorSet0.vp_c9)._m0[int(_1706)][_1708];
    float _1712 = fma(_1628, _1628, _1688);
    float _1714 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].w;
    float _1716 = -_1692;
    float _1718 = -_1096;
    float _1720 = fma(_1716, (*spvDescriptorSet0.vp_c9)._m0[85].y, _1718);
    float _1722 = -_1682;
    float _1724 = _1722 + 0.5;
    float _1726 = _1676;
    if (_1652)
    {
        _1726 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _1728 = _1726;
    float _1730 = fma(_1432, _1350, _1650);
    float _1732 = -_1070;
    float _1734 = _1732 + 1.0;
    float _1736 = _1724 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    int _1738 = abs(_1642);
    float _1740 = rsqrt(_1712);
    int _1742 = as_type<int>(_1728);
    if (_1652)
    {
        float _1744 = _1728 * 5.0;
        _1742 = as_type<int>(_1744);
    }
    int _1746 = _1742;
    float _1748 = fma(_914, _1734, _1720);
    float _1750 = _918 + (-0.5);
    bool _1752 = !_1588;
    int _1754 = _1752 ? 0 : (-1);
    float _1756 = fma(_1264, (*spvDescriptorSet0.vp_c9)._m0[158].x, _1730);
    if (_1652)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _5909 = as_type<float>(_1746);
        out.gl_Position.z = _5909;
    }
    float _1758 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _1760 = _1714 * (*spvDescriptorSet0.vp_c9)._m0[90].y;
    int _1762 = ~_1562;
    int _1764 = _1762 + _1754;
    int _1766 = _1764 + 1;
    out.m_70.x = _1756;
    bool _1768 = _461 == 0;
    float _1770 = -_1760;
    float _1772 = -_1098;
    float _1774 = fma(_1770, _1750, _1772);
    float _1776 = -_1100;
    float _1778 = _1776 + 1.0;
    float _1780 = -_1232;
    float _1782 = fma(_1584, _1780, _1654);
    float _1784 = _1592 * _1740;
    float _1786 = _1612 * _1740;
    int _1788 = _461 * _1766;
    int _1790 = _1788 + _798;
    int _1792 = abs(_1620);
    float _1794 = -_1784;
    float _1796 = fma(_1794, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1592);
    float _1798 = -_1786;
    float _1800 = fma(_1798, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1612);
    float _1802 = fma(_918, _1778, _1774);
    int _1804 = ~_1792;
    int _1806 = _1804 + 1;
    int _1808 = _1806 + 1;
    float _1810 = _1796 * _1796;
    float _1812 = _1736 * _1758;
    int _1814 = ~_1228;
    int _1816 = _1814 + 1;
    int _1818 = _1816 + 1;
    out.m_72.x = _1782;
    out.m_72.y = _1802;
    float _1820 = fma(_1800, _1800, _1810);
    out.m_74.x = _1690;
    out.m_74.y = _1812;
    out.m_74.z = _1686;
    out.m_74.w = _1748;
    int _1822 = _1818 * as_type<int>(_1670);
    if (_1652)
    {
        out.m_49.x = 0.0;
    }
    int _1824 = abs(_1016);
    int _1826 = _1808 * as_type<int>(_1662);
    int _1828 = _1826 + _1822;
    bool _1830 = !_950;
    int _1832 = _1830 ? 0 : 1;
    float _1834 = in.m_76.x;
    float _1836 = in.m_76.y;
    float _1838 = in.m_76.z;
    int _1840 = ~_1824;
    int _1842 = _1840 + 1;
    int _1844 = _1842 + 1;
    int _1846 = abs(_1832);
    int _1848 = ~_1738;
    int _1850 = _1848 + 1;
    int _1852 = _1850 + 1;
    int _1854 = _1844 * as_type<int>(_1702);
    int _1856 = _1854 + _1828;
    bool _1858 = !_1600;
    int _1860 = _1858 ? 0 : 1;
    int _1862 = ~_1846;
    int _1864 = _1862 + 1;
    int _1866 = _1864 + 1;
    int _1868 = _1852 * as_type<int>(_1710);
    int _1870 = _1868 + _1856;
    int _1872 = abs(_1860);
    bool _1874 = !_1768;
    int _1876 = _1874 ? _1790 : (-1);
    int _1878 = _1870 * _1866;
    float _1880 = float(_1540);
    float _1882 = float(_1872);
    int _1884 = _1876 * _1846;
    int _1886 = _1884 + _1878;
    bool _1888 = !_1604;
    int _1890 = _1888 ? 0 : 1;
    float _1892 = _1628 * _1740;
    float _1894 = _1882 * _1880;
    int _1896 = abs(_1890);
    float _1898 = -_1892;
    float _1900 = fma(_1898, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1628);
    float _1902 = float(_1886);
    float _1904 = _1894 * (-2.0);
    float _1906 = float(_1896);
    float _1908 = _449 + (-0.5);
    float _1910 = fma(_1900, _1900, _1820);
    float _1912 = fma(_1904, _1834, _1834);
    out.m_78.y = _1902;
    float _1914 = _1906 * _1234;
    float _1916 = fma(_1564, _1904, _1564);
    float _1918 = fma(_1908, (*spvDescriptorSet0.vp_c9)._m0[196].x, _1912);
    float _1920 = _455 + _589;
    bool _1922 = !_1608;
    int _1924 = _1922 ? 0 : 1;
    float _1926 = _1838;
    if (_1652)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _1928 = -_1784;
    float _1930 = fma(_1928, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1160);
    float _1932 = -_1786;
    float _1934 = fma(_1932, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1474);
    int _1936 = abs(_1924);
    float _1938 = -_1892;
    float _1940 = fma(_1938, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1494);
    float _1942 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1944 = _1930 + _1942;
    float _1946 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1948 = _1934 + _1946;
    float _1950 = float(_1242);
    float _1952 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1954 = _1940 + _1952;
    float _1956 = _1944 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1958 = _1914 * (-2.0);
    float _1960 = _1920 + (-1.0);
    float _1962 = fma(_1948, (*spvDescriptorSet0.vp_c8)._m0[28].x, _1956);
    float _1964 = float(_1936);
    float _1966 = _589 + (-0.5);
    float _1968 = fma(_1960, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _1970 = fma(_1954, (*spvDescriptorSet0.vp_c8)._m0[28].z, _1962);
    float _1972 = _455 + _449;
    float _1974 = _1964 * _1950;
    float _1976 = _455 + (-0.5);
    float _1978 = fma(_1916, _1112, _1918);
    bool _1980 = _1970 >= 0.0;
    float _1982 = fma(_1958, _1836, _1836);
    float _1984 = fma(_1968, _1958, _1968);
    float _1986 = _1972 + (-1.0);
    float _1988 = _1974 * (-2.0);
    float _1990 = fma(_1966, (*spvDescriptorSet0.vp_c9)._m0[196].y, _1982);
    float _1992 = _1978 * 0.15915493667125701904296875;
    float _1994 = sqrt(_1910);
    float _1996 = fma(_1984, _1112, _1990);
    float _1998 = fma(_1988, _1838, _1838);
    float _2000 = fma(_1986, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _2002 = _1996 * 0.15915493667125701904296875;
    float _2004 = fma(_1976, (*spvDescriptorSet0.vp_c9)._m0[196].z, _1998);
    float _2006 = fma(_2000, _1988, _2000);
    float _2008 = _1948;
    if (_1980)
    {
        _1926 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _2010 = _1926;
    float _2012 = _1992 * 6.283185482025146484375;
    float _2014 = sin(_2012);
    float _2016 = fma(_2006, _1112, _2004);
    int _2018 = as_type<int>(_2010);
    if (_1980)
    {
        out.m_49.x = 0.0;
    }
    if (_1980)
    {
        float _2020 = _2010 * 5.0;
        _2018 = as_type<int>(_2020);
    }
    int _2022 = _2018;
    float _2024 = _2016 * 0.15915493667125701904296875;
    float _2026 = _1992 * 6.283185482025146484375;
    float _2028 = cos(_2026);
    if (_1980)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _6334 = as_type<float>(_2022);
        out.gl_Position.z = _6334;
    }
    float _2030 = _2002 * 6.283185482025146484375;
    float _2032 = sin(_2030);
    float _2034 = _2002 * 6.283185482025146484375;
    float _2036 = cos(_2034);
    if (_1980)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _2038 = _2024 * 6.283185482025146484375;
    float _2040 = cos(_2038);
    float _2042 = _1740 * _1994;
    float _2044 = _397 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _2046 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _185);
    float _2048 = _399 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _2050 = _2028 * _2036;
    float _2052 = _2042 * _2044;
    float _2054 = _2028 * _2032;
    float _2056 = _2024 * 6.283185482025146484375;
    float _2058 = sin(_2056);
    float _2060 = _2042 * _2048;
    float _2062 = _2046 * _2052;
    float _2064 = _2014 * _2032;
    float _2066 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _181);
    float _2068 = _2014 * _2036;
    float _2070 = _2042 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _2072 = _2070 * 0.5;
    float _2074 = _2028 * _2040;
    float _2076 = _2066 * _2060;
    float _2078 = _2036 * _2040;
    float _2080 = _2014 * _2040;
    float _2082 = _2074 * _2062;
    float _2084 = _2032 * _2040;
    bool _2086 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _2088 = isnan(0.5);
    bool _2090 = _2086 || _2088;
    bool _2092 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _2094 = _2090 || _2092;
    float _2096 = fma(_2058, _2050, _2064);
    float _2098 = -_2068;
    float _2100 = fma(_2058, _2054, _2098);
    float _2102 = -_2062;
    float _2104 = _2058 * _2102;
    float _2106 = -_2054;
    float _2108 = fma(_2058, _2068, _2106);
    float _2110 = fma(_2096, _2076, _2082);
    float _2112 = _2080 * _2062;
    float _2114 = fma(_2078, _2076, _2104);
    float _2116 = fma(_2058, _2064, _2050);
    float _2118 = fma(_2100, _2072, _2110);
    float _2120 = fma(_2108, _2076, _2112);
    float _2122 = fma(_2084, _2072, _2114);
    float _2124 = _1930 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _2126 = _2118 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2128 = fma(_2116, _2072, _2120);
    float _2130 = _2118 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2132 = fma(_1934, (*spvDescriptorSet0.vp_c8)._m0[11].x, _2124);
    float _2134 = fma(_2122, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2126);
    float _2136 = _1930 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _2138 = fma(_2122, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2130);
    float _2140 = fma(_1940, (*spvDescriptorSet0.vp_c8)._m0[11].z, _2132);
    float _2142 = fma(_2128, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2134);
    bool _2144 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _2146 = isnan(0.5);
    bool _2148 = _2144 || _2146;
    bool _2150 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _2152 = _2148 || _2150;
    float _2154 = fma(_2128, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2138);
    float _2156 = _2140 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _2158 = _2142 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _2160 = _2154 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _2162 = 1.0 / _2156;
    float _2164 = _1494 + _2158;
    float _2166 = _1474 + _2160;
    float _2168 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _2170 = _2164 + _2168;
    float _2172 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _2174 = _2166 + _2172;
    float _2176 = _2170 * _2170;
    float _2178 = fma(_2174, _2174, _2176);
    float _2180 = fma(_1934, (*spvDescriptorSet0.vp_c8)._m0[10].x, _2136);
    float _2182 = sqrt(_2178);
    float _2184 = fma(_1940, (*spvDescriptorSet0.vp_c8)._m0[10].z, _2180);
    float _2186 = _2184 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _2188 = _2186 + _2156;
    float _2190 = _2118 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2192 = _2188 * _2162;
    float _2194 = _2192 * 0.5;
    float _2196 = fma(_2122, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2190);
    bool _2198 = _2182 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2200 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _2202 = fma(_2194, (*spvDescriptorSet0.vp_c8)._m0[30].w, _2200);
    float _2204 = fma(_2128, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2196);
    float _2206 = 1.0 / _2202;
    float _2208 = _2204 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _2210 = _1160 + _2208;
    float _2212 = _2156;
    float _2214 = _2166;
    float _2216 = _2194;
    float _2218 = _2170;
    float _2220 = _2210;
    if (!_2198)
    {
        _2212 = _2166;
    }
    float _2222 = _2212;
    float _2224 = _2222;
    if (!_2198)
    {
        _2214 = _2164;
    }
    float _2226 = _2214;
    float _2228 = _2226;
    if (!_2198)
    {
        _2216 = _2210;
    }
    float _2230 = _2216;
    bool _2232 = !_2198;
    float _2234 = _2230;
    if (!_2232)
    {
        float _2236 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2238 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _2240 = _2182 + _2238;
        float _2242 = _2210 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2244 = rsqrt(_2178);
        float _2246 = _2240 * _2236;
        float _2248 = _2246 * 0.15915493667125701904296875;
        float _2250 = _2248 * 6.283185482025146484375;
        float _2252 = sin(_2250);
        float _2254 = _2248 * 6.283185482025146484375;
        float _2256 = cos(_2254);
        float _2258 = fma(_2252, _2242, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _2260 = _2244 * _2258;
        float _2262 = _2256 + (-1.0);
        float _2264 = fma(_2174, _2260, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _2266 = fma(_2170, _2260, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _2268 = _2262 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2270 = fma(_2210, _2256, _2268);
        _2224 = _2264;
        _2234 = _2270;
        _2228 = _2266;
    }
    float _2272 = _2224;
    float _2274 = _2234;
    float _2276 = _2228;
    float _2278 = -_1786;
    float _2280 = fma(_2278, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2272);
    float _2282 = -_1784;
    float _2284 = fma(_2282, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2274);
    float _2286 = -_1892;
    float _2288 = fma(_2286, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2276);
    float _2290 = _2284;
    float _2292 = _2280;
    float _2294 = _2288;
    float _2296 = _2276;
    if (_2152)
    {
        _2218 = 1.0;
    }
    float _2298 = _2218;
    float _2300 = _2298;
    if (!_2094)
    {
        float _2302 = _1944 * _1944;
        float _2304 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _2306 = -_1494;
        float _2308 = _2306 + _2276;
        float _2310 = -_1160;
        float _2312 = _2310 + _2274;
        float _2314 = fma(_1948, _1948, _2302);
        float _2316 = -_1474;
        float _2318 = _2316 + _2272;
        float _2320 = fma(_1954, _1954, _2314);
        float _2322 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _2324 = sqrt(_2320);
        float _2326 = 1.0 / _2042;
        float _2328 = _2322 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _2330 = precise::min(_2324, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _2332 = _2330 * _2304;
        float _2334 = _2332 * _2326;
        float _2336 = _2328 * _2334;
        float _2338 = _2308 * _2334;
        float _2340 = fma(_2312, _2336, _1930);
        float _2342 = fma(_2318, _2336, _1934);
        float _2344 = fma(_2328, _2338, _1940);
        _2008 = _2324;
        _2290 = _2340;
        _2292 = _2342;
        _2294 = _2344;
        _2296 = _2338;
    }
    float _2346 = _2008;
    float _2348 = _2290;
    float _2350 = _2292;
    float _2352 = _2294;
    float _2354 = _2296;
    float _2356 = _2354;
    float _2358 = _2346;
    if (_2152)
    {
        _2356 = 1.0;
    }
    float _2360 = _2356;
    float _2362 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _2364 = _2206 * _2362;
    float _2366 = _2360;
    if (!_2152)
    {
        float _2368 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _2370 = _2368 * 0.15915493667125701904296875;
        float _2372 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _2374 = _2370 * 6.283185482025146484375;
        float _2376 = cos(_2374);
        float _2378 = _2372 * 0.15915493667125701904296875;
        float _2380 = _2370 * 6.283185482025146484375;
        float _2382 = sin(_2380);
        float _2384 = 1.0 / _2376;
        float _2386 = _2378 * 6.283185482025146484375;
        float _2388 = cos(_2386);
        float _2390 = _2382 * _2384;
        float _2392 = _2378 * 6.283185482025146484375;
        float _2394 = sin(_2392);
        float _2396 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2398 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _2396;
        float _2400 = _2388 * _2390;
        float _2402 = 1.0 / _2398;
        float _2404 = 1.0 / _2400;
        float _2406 = _2394 * _2404;
        float _2408 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2410 = fma(_2364, _2406, _2408);
        float _2412 = _2410 * _2402;
        float _2414 = precise::clamp(_2412, 0.0, 1.0);
        _2358 = _2390;
        _2300 = _2414;
    }
    float _2416 = _2358;
    float _2418 = _2300;
    float _2420 = _2416;
    if (!_2152)
    {
        float _2422 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _2424 = _2422 * 0.15915493667125701904296875;
        float _2426 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _2428 = _2424 * 6.283185482025146484375;
        float _2430 = cos(_2428);
        float _2432 = _2426 * 0.15915493667125701904296875;
        float _2434 = _2424 * 6.283185482025146484375;
        float _2436 = sin(_2434);
        float _2438 = 1.0 / _2430;
        float _2440 = _2432 * 6.283185482025146484375;
        float _2442 = cos(_2440);
        float _2444 = _2436 * _2438;
        float _2446 = _2432 * 6.283185482025146484375;
        float _2448 = sin(_2446);
        float _2450 = _2442 * _2444;
        float _2452 = 1.0 / _2450;
        float _2454 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _2456 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _2454;
        float _2458 = 1.0 / _2456;
        float _2460 = _2448 * _2452;
        float _2462 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _2464 = fma(_2364, _2460, _2462);
        float _2466 = _2464 * _2458;
        float _2468 = precise::clamp(_2466, 0.0, 1.0);
        float _2470 = -_2468;
        float _2472 = _2470 + 1.0;
        _2420 = _2438;
        _2366 = _2472;
    }
    float _2474 = _2420;
    float _2476 = _2366;
    float _2478 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2480 = _2348 + _2478;
    float _2482 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2484 = _2350 + _2482;
    float _2486 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2488 = _2352 + _2486;
    float _2490 = _2480 * _2480;
    float _2492 = _2348 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _2494 = fma(_2484, _2484, _2490);
    float _2496 = fma(_2488, _2488, _2494);
    float _2498 = rsqrt(_2496);
    float _2500 = sqrt(_2496);
    float _2502 = _2498 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _2504 = _2484 * _2502;
    float _2506 = _2488 * _2502;
    float _2508 = _2504 * _2504;
    float _2510 = _2506 * _2506;
    float _2512 = _2508 + _2510;
    float _2514 = sqrt(_2512);
    bool _2516 = _2514 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2518 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2520 = _2514 + _2518;
    float _2522 = _2488;
    float _2524 = _2512;
    float _2526 = _2520;
    float _2528 = _2490;
    if (_2516)
    {
        float _2530 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2522 = _2530;
    }
    float _2532 = _2522;
    if (_2516)
    {
        float _2534 = rsqrt(_2512);
        _2524 = _2534;
    }
    float _2536 = _2524;
    float _2538 = _2536;
    if (_2516)
    {
        float _2540 = _2520 * _2532;
        _2526 = _2540;
    }
    float _2542 = _2526;
    if (_2516)
    {
        float _2544 = _2542 * 0.15915493667125701904296875;
        _2528 = _2544;
    }
    float _2546 = _2528;
    float _2548 = _2532;
    float _2550 = _2546;
    if (_2516)
    {
        float _2552 = _2546 * 6.283185482025146484375;
        float _2554 = sin(_2552);
        _2548 = _2554;
    }
    float _2556 = _2548;
    float _2558 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _2560 = precise::max(0.0, _2558);
    float _2562 = _2474;
    float _2564 = _2560;
    if (_2516)
    {
        float _2566 = _2546 * 6.283185482025146484375;
        float _2568 = cos(_2566);
        _2562 = _2568;
    }
    float _2570 = _2562;
    float _2572 = -_2502;
    float _2574 = -_2560;
    float _2576 = fma(_2480, _2572, _2574);
    float _2578 = (*spvDescriptorSet0.vp_c15)._m0[652].x;
    if (_2516)
    {
        float _2580 = _2576 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2564 = _2580;
    }
    float _2582 = _2564;
    float _2584 = _2582;
    if (!_2516)
    {
        _2550 = _2504;
    }
    float _2586 = _2550;
    float _2588 = fma(_1934, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _2590 = _2556;
    float _2592 = _2586;
    if (_2516)
    {
        float _2594 = fma(_2556, _2582, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _2590 = _2594;
    }
    float _2596 = _2590;
    float _2598 = _2596;
    if (!_2516)
    {
        _2584 = _2576;
    }
    float _2600 = _2584;
    float _2602 = _2600;
    float _2604 = _2570;
    if (_2516)
    {
        float _2606 = _2570 + (-1.0);
        _2578 = _2606;
    }
    float _2608 = _2578;
    float _2610 = _2608;
    if (_2516)
    {
        float _2612 = _2536 * _2596;
        _2220 = _2612;
    }
    float _2614 = _2220;
    if (!_2516)
    {
        _2538 = _2506;
    }
    float _2616 = _2538;
    float _2618 = _2616;
    if (_2516)
    {
        float _2620 = _2608 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2610 = _2620;
    }
    float _2622 = _2610;
    if (_2516)
    {
        float _2624 = _2504 * _2614;
        _2592 = _2624;
    }
    float _2626 = _2592;
    if (!_2516)
    {
        _2598 = _2508;
    }
    float _2628 = _2598;
    float _2630 = _2628;
    if (_2516)
    {
        float _2632 = _2506 * _2614;
        _2618 = _2632;
    }
    float _2634 = _2618;
    if (_2516)
    {
        float _2636 = fma(_2576, _2570, _2622);
        _2602 = _2636;
    }
    float _2638 = _2602;
    if (_2516)
    {
        float _2640 = _2626 * _2626;
        _2630 = _2640;
    }
    float _2642 = _2630;
    if (!_2516)
    {
        _2604 = _2510;
    }
    float _2644 = _2604;
    float _2646 = _2644;
    if (_2516)
    {
        float _2648 = _2634 * _2634;
        _2646 = _2648;
    }
    float _2650 = _2646;
    float _2652 = _2348 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _2654 = fma(_2638, _2638, _2642);
    float _2656 = floor(_2588);
    float _2658 = _2654 + _2650;
    float _2660 = fma(_2350, (*spvDescriptorSet0.vp_c8)._m0[2].x, _2652);
    float _2662 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _2664 = fma(_2500, (*spvDescriptorSet0.vp_c15)._m0[23].w, _2662);
    float _2666 = precise::clamp(_2664, 0.0, 1.0);
    float _2668 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _2670 = fma(_2352, (*spvDescriptorSet0.vp_c8)._m0[2].z, _2660);
    float _2672 = rsqrt(_2658);
    float _2674 = -_2666;
    float _2676 = _2674 + 1.0;
    float _2678 = _2670 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _2680 = fma(_1940, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _2682 = _2348 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2684 = _2678 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _2686 = abs(_2676);
    float _2688 = log2(_2686);
    float _2690 = _2348 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2692 = -_2684;
    float _2694 = fma(_2692, _2668, 1.0);
    float _2696 = fma(_2350, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2682);
    float _2698 = fma(_2350, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2690);
    float _2700 = _2672 * _2626;
    float _2702 = fma(_2352, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2696);
    float _2704 = _2672 * _2638;
    float _2706 = fma(_2350, (*spvDescriptorSet0.vp_c8)._m0[3].x, _2492);
    float _2708 = _2700 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _2710 = fma(_2352, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2698);
    float _2712 = _2702 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _2714 = _2672 * _2634;
    float _2716 = -_2708;
    float _2718 = fma(_2704, (*spvDescriptorSet0.vp_c15)._m0[21].y, _2716);
    float _2720 = _2710 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2722 = _2712 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _2724 = floor(_2680);
    float _2726 = fma(_2352, (*spvDescriptorSet0.vp_c8)._m0[3].z, _2706);
    float _2728 = _2688 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _2730 = fma(_2720, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2722);
    float _2732 = -_2714;
    float _2734 = fma(_2732, (*spvDescriptorSet0.vp_c15)._m0[21].z, _2718);
    float _2736 = _2726 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _2738 = _2712 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2740 = fma(_2678, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2730);
    float _2742 = exp2(_2728);
    float _2744 = fma(_2734, -0.5, 0.5);
    float _2746 = fma(_2734, 0.5, 0.5);
    float _2748 = fma(_2736, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2740);
    float _2750 = log2(_2694);
    float _2752 = -_2724;
    float _2754 = _2680 + _2752;
    float _2756 = fma(_2720, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2738);
    float _2758 = fma(_2746, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _2760 = fma(_2678, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2756);
    float _2762 = fma(_2746, _2758, -0.212114393711090087890625);
    float _2764 = 1.0 / _2748;
    float _2766 = -_2656;
    float _2768 = _2588 + _2766;
    float _2770 = _2712 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2772 = fma(_2746, _2762, 1.570728778839111328125);
    float _2774 = fma(_2720, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2770);
    float _2776 = _2704 + 1.0;
    float _2778 = sqrt(_2744);
    float _2780 = _2750 * 0.693147182464599609375;
    float _2782 = fma(_2678, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2774);
    float _2784 = -_2704;
    float _2786 = fma(_2742, _2776, _2784);
    float2 _7530 = float2(_2768, _2754);
    float _2788 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_7530, float2(0.0), isnan(_7530)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_7530, float2(0.0), isnan(_7530)), level(0.0)).x;
    float _2790 = _2780 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _2792 = fma(_2736, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2782);
    float _2794 = fma(_2736, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2760);
    float _2796 = fma(_2786, 0.5, 0.5);
    float _2798 = _2792 * _2764;
    float _2800 = _2794 * _2764;
    float _2802 = fma(_2798, 0.5, 0.5);
    float _2804 = fma(_2800, -0.5, 0.5);
    float _2806 = _2778 * 0.636619746685028076171875;
    float3 _7570 = float3(_2802, _2804, _2790);
    float _2808 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_7570, float3(0.0), isnan(_7570)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_7570, float3(0.0), isnan(_7570)), level(0.0)).x;
    float3 _7581 = float3(_2802, _2804, _2790);
    float4 _2811 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_7581, float3(0.0), isnan(_7581)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_7581, float3(0.0), isnan(_7581)), level(0.0)).xyzw;
    float _2813 = _2811.x;
    float _2815 = _2811.y;
    float _2817 = _2811.z;
    float _2819 = _2811.w;
    float _2821 = -_2772;
    float _2823 = fma(_2806, _2821, 1.0);
    float2 _7602 = float2(_2823, _2796);
    float3 _2827 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_7602, float2(0.0), isnan(_7602)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_7602, float2(0.0), isnan(_7602)), level(0.0)).xyz;
    float _2829 = _2827.x;
    float _2831 = _2827.y;
    float _2833 = _2827.z;
    float _2835 = abs(_2364);
    float _2837 = log2(_2835);
    float _2839 = _2096 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2841 = _2096 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2843 = _2096 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2845 = _2074 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2847 = fma(_2078, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2839);
    float _2849 = _2074 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2851 = _2712 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _2853 = _185 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    bool _2855 = _2500 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _2857 = isnan(_2500);
    bool _2859 = _2855 || _2857;
    bool _2861 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _2863 = _2859 || _2861;
    float _2865 = _2837 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _2867 = _2074 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2869 = fma(_2078, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2841);
    float _2871 = fma(_2078, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2843);
    float _2873 = fma(_2108, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2847);
    float _2875 = exp2(_2865);
    float _2877 = -_2058;
    float _2879 = fma(_2877, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2845);
    float _2881 = -_2058;
    float _2883 = fma(_2881, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2849);
    float _2885 = -_2058;
    float _2887 = fma(_2885, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2867);
    float _2889 = _2100 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2891 = _2100 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2893 = _2100 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2895 = fma(_2080, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2883);
    float _2897 = fma(_2084, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2889);
    float _2899 = fma(_2084, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2891);
    float _2901 = fma(_2084, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2893);
    float _2903 = fma(_2080, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2879);
    float _2905 = fma(_2080, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2887);
    float _2907 = fma(_2720, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2851);
    float _2909 = fma(_2116, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2897);
    float _2911 = fma(_2875, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _2913 = precise::clamp(_2911, 0.0, 1.0);
    float _2915 = fma(_2116, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2899);
    float _2917 = fma(_2116, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2901);
    float _2919 = _2853 * _2905;
    float _2921 = fma(_2913, -2.0, 3.0);
    float _2923 = _2913 * _2913;
    float _2925 = fma(_2108, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2869);
    float _2927 = fma(_2108, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2871);
    float _2929 = _2923 * _2921;
    float _2931 = fma(_2678, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2907);
    float _2933 = _181 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _2935 = _2853 * _2903;
    float _2937 = -_2929;
    float _2939 = _2937 + 1.0;
    float _2941 = fma(_2736, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2931);
    float _2943 = _2688 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _2945 = in.m_80.x;
    float _2947 = _2853 * _2895;
    bool _2949 = _2364 <= 8000.0;
    bool _2951 = isnan(_2364);
    bool _2953 = _2949 || _2951;
    bool _2955 = isnan(8000.0);
    bool _2957 = _2953 || _2955;
    float _2959 = float(_2957);
    float _2961 = fma(_2939, (*spvDescriptorSet0.vp_c15)._m0[654].w, _2929);
    float _2963 = _2748 * 0.5;
    float _2965 = exp2(_2943);
    float _2967 = fma(_2933, _2873, _2935);
    float _2969 = _2959 * _2961;
    float _2971 = fma(_2794, -0.5, _2963);
    float _2973 = fma(_2933, _2925, _2947);
    float _2975 = _2909 + _2967;
    float _2977 = _2969 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _2979 = _2941 + _2748;
    float _2981 = _2792 + _2748;
    out.gl_Position.x = _2792;
    out.gl_Position.y = _2794;
    out.gl_Position.z = _2941;
    out.gl_Position.w = _2748;
    float _2983 = _2979 * 0.5;
    float _2985 = _2981 * 0.5;
    float _2987 = fma(_2933, _2927, _2919);
    float _2989 = _2915 + _2973;
    float _2991 = -_2965;
    float _2993 = _2991 + 1.0;
    out.m_82.x = _2985;
    out.m_82.y = _2971;
    out.m_82.z = _2983;
    out.m_82.w = _2748;
    float _2995 = _2917 + _2987;
    float _2997 = _2993 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    out.m_84.x = _2975;
    out.m_84.y = _2989;
    out.m_84.z = _2995;
    float _2999 = -_2997;
    float _3001 = _2999 + 1.0;
    float _3003 = -_2788;
    float _3005 = _3003 + 1.0;
    float _3007 = _3005 * _2977;
    float _3009 = precise::clamp(_3007, 0.0, 1.0);
    float _3011 = -_3009;
    float _3013 = fma(_3011, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _3015 = _3013 * _2945;
    float _3017 = _2997 * _2808;
    float _3019 = _3015 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _3021 = _2819 * _3001;
    float _3023 = _2819 * _3017;
    out.m_86.x = _3019;
    float _3025 = _2833 * _3017;
    float _3027 = fma(_2829, _3023, _2813);
    float _3029 = fma(_2831, _3023, _2815);
    float _3031 = _2418 * _2476;
    float _3033 = fma(_2819, _3025, _2817);
    float _3035 = _2831;
    float _3037 = _2829;
    float _3039 = _2819;
    float _3041 = _2817;
    float _3043 = _2815;
    float _3045 = _3031;
    if (!_2863)
    {
        _3035 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _3047 = _3035;
    float _3049 = _3031 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _3051 = _3047;
    float _3053 = _3047;
    if (!_2863)
    {
        _3037 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _3055 = _3037;
    out.m_88.x = _3027;
    out.m_88.y = _3029;
    out.m_88.z = _3033;
    out.m_88.w = _3021;
    float _3057 = _3055;
    float _3059 = _3055;
    if (!_2863)
    {
        _3039 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _3061 = _3039;
    float _3063 = _3061;
    float _3065 = _3061;
    if (!_2863)
    {
        _3041 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _3067 = _3041;
    float _3069 = _3067;
    float _3071 = _3067;
    if (!_2863)
    {
        _3043 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _3073 = _3043;
    float _3075 = _3073;
    float _3077 = _3073;
    if (!_2863)
    {
        _3045 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _3079 = _3045;
    bool _3081 = !_2863;
    float _3083 = _3079;
    float _3085 = _3079;
    if (!_3081)
    {
        bool _3087 = _2500 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _3089 = isnan(_2500);
        bool _3091 = _3087 || _3089;
        bool _3093 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _3095 = _3091 || _3093;
        if (!_3095)
        {
            float _3097 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _3099 = _2500 + _3097;
            float _3101 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _3103 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _3101;
            float _3105 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _3107 = _3105 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _3109 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _3111 = _3109 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _3113 = 1.0 / _3103;
            float _3115 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _3117 = _3115 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _3119 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _3121 = _3119 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _3123 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _3125 = _3123 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _3127 = _3099 * _3113;
            float _3129 = precise::clamp(_3127, 0.0, 1.0);
            float _3131 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _3133 = _3131 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _3135 = fma(_3129, _3107, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _3137 = fma(_3129, _3111, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _3139 = fma(_3129, _3117, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _3141 = fma(_3129, _3133, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _3143 = fma(_3129, _3121, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _3145 = fma(_3129, _3125, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _3059 = _3139;
            _3077 = _3135;
            _3053 = _3137;
            _3071 = _3143;
            _3065 = _3141;
            _3085 = _3145;
            _3147 = true;
        }
        else
        {
            bool _3149 = _2500 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _3151 = isnan(_2500);
            bool _3153 = _3149 || _3151;
            bool _3155 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _3157 = _3153 || _3155;
            if (!_3157)
            {
                _3051 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _3159 = _3051;
            _3053 = _3159;
            if (!_3157)
            {
                _3057 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _3161 = _3057;
            _3059 = _3161;
            if (!_3157)
            {
                _3063 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _3163 = _3063;
            _3065 = _3163;
            if (!_3157)
            {
                _3069 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _3165 = _3069;
            _3071 = _3165;
            if (!_3157)
            {
                _3075 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _3167 = _3075;
            _3077 = _3167;
            if (!_3157)
            {
                _3083 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _3169 = _3083;
            bool _3171 = !_3157;
            _3085 = _3169;
            if (!_3171)
            {
                bool _3173 = _2500 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _3175 = isnan(_2500);
                bool _3177 = _3173 || _3175;
                bool _3179 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _3181 = _3177 || _3179;
                if (!_3181)
                {
                    float _3183 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _3185 = _2500 + _3183;
                    float _3187 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _3189 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _3187;
                    float _3191 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _3193 = _3191 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _3195 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _3197 = _3195 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _3199 = 1.0 / _3189;
                    float _3201 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _3203 = _3201 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _3205 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _3207 = _3205 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _3209 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _3211 = _3209 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _3213 = _3185 * _3199;
                    float _3215 = precise::clamp(_3213, 0.0, 1.0);
                    float _3217 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _3219 = _3217 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _3221 = fma(_3215, _3193, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _3223 = fma(_3215, _3197, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _3225 = fma(_3215, _3203, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _3227 = fma(_3215, _3219, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _3229 = fma(_3215, _3207, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _3231 = fma(_3215, _3211, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _3059 = _3225;
                    _3077 = _3221;
                    _3053 = _3223;
                    _3071 = _3229;
                    _3065 = _3227;
                    _3085 = _3231;
                    _3147 = true;
                }
                else
                {
                    _3059 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _3077 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _3053 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _3071 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _3065 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _3085 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _3147 = false;
    float _3233 = _3059;
    float _3235 = _3077;
    float _3237 = _3053;
    float _3239 = _3071;
    float _3241 = _3065;
    float _3243 = _3085;
    float _3245 = fma(_2989, -0.5, 0.5);
    float _3247 = precise::clamp(_3245, 0.0, 1.0);
    float _3249 = -_3233;
    float _3251 = _3249 + _3235;
    float _3253 = -_3237;
    float _3255 = _3253 + _3239;
    out.m_90.x = 0.0;
    float _3257 = -_3241;
    float _3259 = _3257 + _3243;
    float _3261 = fma(_3247, _3251, _3233);
    float _3263 = fma(_3247, _3255, _3237);
    bool _3265 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _3267 = _3261 * 0.586610972881317138671875;
    float _3269 = fma(_3247, _3259, _3241);
    float _3271 = _3049 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _3273 = fma(_3263, 0.298911988735198974609375, _3267);
    bool _3275 = _2418 > 0.0;
    bool _3277 = isnan(_2418);
    bool _3279 = _3275 || _3277;
    bool _3281 = isnan(0.0);
    bool _3283 = _3279 || _3281;
    float _3285 = fma(_3269, 0.114477999508380889892578125, _3273);
    out.m_49.x = _3271;
    bool _3287 = _2476 <= 0.0;
    bool _3289 = !_3283;
    bool _3291 = _3287 || _3289;
    float _3293 = -_3285;
    float _3295 = _3263 + _3293;
    float _3297 = -_3285;
    float _3299 = _3269 + _3297;
    float _3301 = fma(_3295, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3285);
    float _3303 = -_3285;
    float _3305 = _3261 + _3303;
    float _3307 = fma(_3305, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3285);
    float _3309 = fma(_3299, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3285);
    bool _3311 = !_3265;
    if (!_3311)
    {
        float _3313 = -_2348;
        float _3315 = _3313 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _3317 = -_2350;
        float _3319 = _3317 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _3321 = -_2352;
        float _3323 = _3321 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _3325 = _3315 * _3315;
        float _3327 = fma(_3319, _3319, _3325);
        float _3329 = fma(_3323, _3323, _3327);
        float _3331 = sqrt(_3329);
        float _3333 = rsqrt(_3329);
        float _3335 = -_3331;
        float _3337 = _3335 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _3339 = _3337 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _3341 = precise::clamp(_3339, 0.0, 1.0);
        float _3343 = _3319 * _3333;
        float _3345 = _3315 * _3333;
        float _3347 = abs(_3341);
        float _3349 = log2(_3347);
        float _3351 = _3323 * _3333;
        float _3353 = _3343 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _3355 = _2989 * _3345;
        float _3357 = -_3345;
        float _3359 = -_3353;
        float _3361 = fma(_3357, (*spvDescriptorSet0.vp_c15)._m0[656].y, _3359);
        float _3363 = fma(_2975, _3343, _3355);
        float _3365 = -_3351;
        float _3367 = fma(_3365, (*spvDescriptorSet0.vp_c15)._m0[656].z, _3361);
        float _3369 = fma(_2995, _3351, _3363);
        float _3371 = precise::clamp(_3369, 0.0, 1.0);
        float _3373 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _3375 = _3367 + _3373;
        float _3377 = _3349 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _3379 = _3375 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _3381 = precise::clamp(_3379, 0.0, 1.0);
        float _3383 = exp2(_3377);
        float _3385 = _3383 * _3381;
        float _3387 = _3371 * _3385;
        float _3389 = _3387 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _3391 = _3387 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _3393 = _3387 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_90.x = _3389;
        out.m_90.y = _3391;
        out.m_90.z = _3393;
    }
    out.m_92.x = _3301;
    out.m_92.y = _3307;
    out.m_92.z = _3309;
    if (!_3291)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _3395 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.m_49.x = 0.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _3395;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_60 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_68 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_49 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_92 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_70 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_74 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_82 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_72 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_78 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_84 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_90 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_86 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_88 = float4(0.0, 0.0, 0.0, 1.0);
    bool _3147 = false;
    bool _431 = false;
    bool _309 = false;
    bool _207 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _106 = in.m_46.w;
    float _108 = trunc(_106);
    int _111 = int(_108);
    bool _115 = _111 >= 1;
    float _117 = 0.0;
    if (!_115)
    {
        _117 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _119 = _117;
    float _121 = _119;
    if (!_115)
    {
        out.m_49.x = 0.0;
    }
    int _123 = 0;
    if (!_115)
    {
        float _125 = _119 * 5.0;
        _123 = as_type<int>(_125);
    }
    int _127 = _123;
    int _129 = _127;
    if (!_115)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3452 = as_type<float>(_127);
        out.gl_Position.z = _3452;
    }
    if (!_115)
    {
        return out;
    }
    float _131 = in.m_51.w;
    bool _133 = _131 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _135 = isnan(_131);
    bool _137 = _133 || _135;
    bool _139 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _141 = _137 || _139;
    float _143 = -_131;
    float _145 = _143 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _147 = _145;
    if (_141)
    {
        float _149 = float(_111);
        _121 = _149;
    }
    float _151 = _121;
    bool _153 = _145 >= _151;
    bool _155 = !_141;
    bool _157 = _153 || _155;
    float _159 = _151;
    if (_157)
    {
        _159 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _161 = _159;
    if (_157)
    {
        out.m_49.x = 0.0;
    }
    if (_157)
    {
        float _163 = _161 * 5.0;
        _129 = as_type<int>(_163);
    }
    int _165 = _129;
    if (_157)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3522 = as_type<float>(_165);
        out.gl_Position.z = _3522;
    }
    if (_157)
    {
        return out;
    }
    float _167 = as_type<float>(int(gl_VertexIndex));
    bool _169 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    int _171 = as_type<int>(_167) & 1;
    bool _173 = _171 != 0;
    int _175 = as_type<int>(_167) & 2;
    bool _177 = _175 != 0;
    bool _179 = !_173;
    float _181 = _179 ? (-0.5) : 0.5;
    bool _183 = !_177;
    float _185 = _183 ? (-0.5) : 0.5;
    bool _187 = !_169;
    float _205;
    if (!_187)
    {
        float _189 = in.m_56.x;
        float _191 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _193 = _189 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _195 = fma(_193, (*spvDescriptorSet0.vp_c9)._m0[12].x, _145);
        float _197 = _195 * _191;
        float _199 = floor(_197);
        float _201 = -_199;
        float _203 = _197 + _201;
        _205 = _203;
        _207 = true;
    }
    else
    {
        float _209 = float(_111);
        float _211 = 1.0 / _209;
        float _213 = _145 * _211;
        _205 = _213;
    }
    _207 = false;
    float _215 = _205;
    float _217 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _219 = _215 + _217;
    bool _221 = _215 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _223 = isnan(_215);
    bool _225 = _221 || _223;
    bool _227 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _229 = _225 || _227;
    float _231 = float(_229);
    float _233 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _235 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _233;
    float _237 = -_231;
    float _239 = _237 + 1.0;
    bool _241 = _215 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _243 = isnan(_215);
    bool _245 = _241 || _243;
    bool _247 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _249 = _245 || _247;
    float _251 = float(_249);
    float _253 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _255 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _253;
    bool _257 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _259 = 1.0 / _235;
    float _261 = _251 * _239;
    float _263 = -_251;
    float _265 = _263 + 1.0;
    float _267 = _219 * _259;
    float _269 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _271 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _269;
    float _273 = fma(_255, _267, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _275 = fma(_271, _267, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _277 = _273 * _261;
    float _279 = _275 * _261;
    float _281 = fma(_265, (*spvDescriptorSet0.vp_c9)._m0[143].x, _277);
    float _283 = fma(_265, (*spvDescriptorSet0.vp_c9)._m0[143].y, _279);
    float _285 = fma(_231, (*spvDescriptorSet0.vp_c9)._m0[144].x, _281);
    float _287 = fma(_231, (*spvDescriptorSet0.vp_c9)._m0[144].y, _283);
    bool _289 = !_257;
    float _307;
    if (!_289)
    {
        float _291 = in.m_56.x;
        float _293 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _295 = _291 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _297 = fma(_295, (*spvDescriptorSet0.vp_c9)._m0[11].y, _145);
        float _299 = _297 * _293;
        float _301 = floor(_299);
        float _303 = -_301;
        float _305 = _299 + _303;
        _307 = _305;
        _309 = true;
    }
    else
    {
        float _311 = float(_111);
        float _313 = 1.0 / _311;
        float _315 = _145 * _313;
        _307 = _315;
    }
    _309 = false;
    float _317 = _307;
    bool _319 = _317 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _321 = isnan(_317);
    bool _323 = _319 || _321;
    bool _325 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _327 = _323 || _325;
    float _329 = float(_327);
    float _331 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _333 = _331 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _335 = _317 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _337 = isnan(_317);
    bool _339 = _335 || _337;
    bool _341 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _343 = _339 || _341;
    float _345 = float(_343);
    float _347 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _349 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _347;
    float _351 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _353 = _317 + _351;
    float _355 = -_329;
    float _357 = _355 + 1.0;
    bool _359 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _361 = 1.0 / _333;
    float _363 = _345 * _357;
    float _365 = -_345;
    float _367 = _365 + 1.0;
    float _369 = _349 * _361;
    float _371 = fma(_369, _353, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _373 = _371 * _363;
    float _375 = fma(_367, (*spvDescriptorSet0.vp_c9)._m0[115].x, _373);
    float _377 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _379 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _381 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _383 = fma(_329, (*spvDescriptorSet0.vp_c9)._m0[116].x, _375);
    float _385 = _377 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _387 = _379 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _389 = _381 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _391 = _383 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _393 = in.m_58.x;
    float _395 = in.m_58.y;
    out.m_60.x = _385;
    out.m_60.y = _387;
    out.m_60.z = _389;
    out.m_60.w = _391;
    float _397 = _287 * _395;
    float _399 = _285 * _393;
    bool _401 = !_359;
    float _425;
    float _427;
    float _429;
    if (!_401)
    {
        float _403 = in.m_56.x;
        float _405 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _407 = float(_111);
        float _409 = 1.0 / _407;
        float _411 = _403 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _413 = _145 * _409;
        float _415 = fma(_411, (*spvDescriptorSet0.vp_c9)._m0[11].w, _145);
        float _417 = _415 * _405;
        float _419 = floor(_417);
        float _421 = -_419;
        float _423 = _417 + _421;
        _425 = _413;
        _427 = _407;
        _429 = _423;
        _431 = true;
    }
    else
    {
        float _433 = float(_111);
        float _435 = 1.0 / _433;
        float _437 = _145 * _435;
        _425 = _437;
        _427 = _433;
        _429 = _437;
    }
    _431 = false;
    float _439 = _425;
    float _441 = _427;
    float _443 = _429;
    float _445 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].y);
    int _447 = int(_445);
    float _449 = in.m_56.x;
    int _451 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _453 = _451 != 0;
    float _455 = in.m_56.z;
    float _457 = in.m_56.w;
    float _459 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].x);
    int _461 = int(_459);
    int _463 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8192;
    bool _465 = _463 != 0;
    float _467 = in.m_62.x;
    float _469 = in.m_62.y;
    float _471 = in.m_62.z;
    float _473 = in.m_62.w;
    float _475 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _477 = log2(_475);
    float _479 = float(_447);
    float _481 = 0.0;
    if (!_453)
    {
        float _483 = in.m_56.y;
        _481 = _483;
    }
    float _485 = _481;
    float _487 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _489 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _491 = 0.0;
    if (!_453)
    {
        float _493 = in.m_56.z;
        _491 = _493;
    }
    float _495 = _491;
    float _497 = 1.0 / _479;
    float _499 = float(uint(_461));
    float _501 = _449 * 2.0;
    int _503 = ~_461;
    int _505 = _503 + 1;
    float _507 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    bool _509 = _461 == 0;
    float _511 = (*spvDescriptorSet0.vp_c9)._m0[88].z + (*spvDescriptorSet0.vp_c9)._m0[88].x;
    float _513 = 0.0;
    if (_453)
    {
        _513 = _449;
    }
    float _515 = _513;
    float _517 = 1.0 / _499;
    float _519 = _477 * _145;
    float _521 = _515;
    if (!_453)
    {
        _521 = _455;
    }
    float _523 = _521;
    float _525 = fma(_449, (*spvDescriptorSet0.vp_c9)._m0[88].z, _511);
    float _527 = _497 * _145;
    int _529 = ~_461;
    int _531 = _529 + 1;
    float _533 = exp2(_519);
    float _535 = 0.0;
    float _537 = _495;
    if (!_453)
    {
        _535 = _485;
    }
    float _539 = _535;
    float _541 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _543 = _541 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _545 = -(*spvDescriptorSet0.vp_c9)._m0[151].w;
    float _547 = _545 + (*spvDescriptorSet0.vp_c9)._m0[152].w;
    float _549 = 0.0;
    float _551 = _539;
    if (!_453)
    {
        _549 = _495;
    }
    float _553 = _549;
    int _555 = as_type<int>(_517) + (-2);
    float _557 = trunc(_527);
    int _559 = int(_557);
    float _561 = 0.0;
    float _563 = _553;
    if (!_453)
    {
        _561 = _539;
    }
    float _565 = _561;
    bool _567 = _439 >= (*spvDescriptorSet0.vp_c9)._m0[153].w;
    bool _569 = isnan(_439);
    bool _571 = _567 || _569;
    bool _573 = isnan((*spvDescriptorSet0.vp_c9)._m0[153].w);
    bool _575 = _571 || _573;
    float _577 = float(_575);
    float _579 = _565;
    float _581 = _485;
    if (_453)
    {
        float _583 = in.m_56.x;
        float _585 = in.m_56.y;
        _579 = _583;
        _581 = _585;
    }
    float _587 = _579;
    float _589 = _581;
    float _591 = -_533;
    float _593 = _591 + 1.0;
    float _595 = floor(_501);
    float _597 = -(*spvDescriptorSet0.vp_c9)._m0[155].w;
    float _599 = _597 + (*spvDescriptorSet0.vp_c9)._m0[156].w;
    bool _601 = _439 >= (*spvDescriptorSet0.vp_c9)._m0[152].w;
    bool _603 = isnan(_439);
    bool _605 = _601 || _603;
    bool _607 = isnan((*spvDescriptorSet0.vp_c9)._m0[152].w);
    bool _609 = _605 || _607;
    float _611 = float(_609);
    float _613 = float(uint(_559));
    float _615 = 1.0 / _543;
    float _617 = float(_559);
    float _619 = as_type<float>(_555) * _613;
    float _621 = trunc(_619);
    float _623 = precise::max(_621, 0.0);
    uint _626 = uint(_623);
    if (_453)
    {
        _551 = _589;
    }
    float _628 = _551;
    float _630 = 1.0 / _547;
    float _632 = float(_461);
    float _634 = _628;
    if (_453)
    {
        _563 = _628;
    }
    float _636 = _563;
    bool _638 = _617 >= _632;
    bool _640 = isnan(_617);
    bool _642 = _638 || _640;
    bool _644 = isnan(_632);
    bool _646 = _642 || _644;
    float _648 = float(_646);
    bool _650 = !_453;
    float _652 = _650 ? _589 : _449;
    int _654 = _531 * int(_626);
    int _656 = _654 + _559;
    if (_453)
    {
        _537 = _628;
    }
    float _658 = _537;
    float _660 = trunc(_648);
    int _662 = int(_660);
    if (!_453)
    {
        _634 = _449;
    }
    float _664 = _634;
    float _666 = float(uint(_656));
    float _668 = fma(_658, (*spvDescriptorSet0.vp_c9)._m0[83].w, _507);
    float _670 = as_type<float>(_555) * _666;
    bool _672 = !_453;
    float _674 = _672 ? 1.2345600128173828125 : 1.0;
    float _676 = trunc(_670);
    float _678 = precise::max(_676, 0.0);
    uint _680 = uint(_678);
    float _682 = _674 * _652;
    float _684 = floor(_682);
    int _686 = int(_626) + int(_680);
    int _688 = ~_662;
    int _690 = _688 + 1;
    int _692 = _690 + 1;
    int _694 = _505 * _686;
    int _696 = _694 + _559;
    float _698 = -_684;
    float _700 = _682 + _698;
    bool _702 = uint(_696) >= uint(_461);
    float _704 = _632 * _700;
    float _706 = 1.0 / _441;
    float _708 = _632 * _145;
    bool _710 = !_702;
    int _712 = _710 ? 0 : (-1);
    int _714 = ~_686;
    int _716 = _714 + _712;
    int _718 = _716 + 1;
    float _720 = trunc(_704);
    int _722 = int(_720);
    int _724 = _461 * _718;
    int _726 = _724 + _559;
    bool _728 = !_509;
    int _730 = _728 ? _726 : (-1);
    float _732 = _708 * _706;
    int _734 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 256;
    bool _736 = _734 != 0;
    int _738 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 512;
    bool _740 = _738 != 0;
    int _742 = _461 + (-1);
    int _744 = _730 * _692;
    bool _746 = !_465;
    int _748 = _746 ? 0 : 1;
    float _750 = trunc(_732);
    int _752 = int(_750);
    int _754 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1024;
    bool _756 = _754 != 0;
    int _758 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2048;
    bool _760 = _758 != 0;
    int _762 = _662 * _742;
    int _764 = _762 + _744;
    bool _766 = !_740;
    int _768 = _766 ? 0 : 1;
    bool _770 = !_736;
    int _772 = _770 ? 0 : 1;
    int _774 = abs(_748);
    int _776 = abs(_768);
    bool _778 = !_756;
    int _780 = _778 ? 0 : 1;
    int _782 = abs(_772);
    bool _784 = !_760;
    int _786 = _784 ? 0 : 1;
    int _788 = abs(_780);
    int _790 = _764 * _776;
    int _792 = ~_461;
    int _794 = _792 + 1;
    int _796 = _722 * _774;
    int _798 = _796 + _559;
    int _800 = abs(_786);
    int _802 = _752 * _782;
    int _804 = _802 + _790;
    bool _806 = _457 > 0.5;
    float _808 = in.m_64.x;
    float _810 = in.m_64.y;
    float _812 = in.m_64.z;
    float _814 = in.m_64.w;
    int _816 = _798 * _788;
    int _818 = _816 + _804;
    int _820 = ~_461;
    int _822 = _820 + 1;
    float _824 = -_185;
    int _826 = _806 ? as_type<int>(_824) : as_type<int>(_185);
    int _828 = _722 * _800;
    int _830 = _828 + _818;
    float _832 = float(uint(_830));
    float _834 = as_type<float>(_555) * _832;
    float _836 = trunc(_834);
    float _838 = precise::max(_836, 0.0);
    uint _840 = uint(_838);
    int _842 = _822 * int(_840);
    int _844 = _842 + _830;
    float _846 = float(uint(_844));
    float _848 = as_type<float>(_555) * _846;
    float _850 = trunc(_848);
    float _852 = precise::max(_850, 0.0);
    uint _854 = uint(_852);
    int _856 = int(_840) + int(_854);
    int _858 = _794 * _856;
    int _860 = _858 + _830;
    bool _862 = uint(_860) >= uint(_461);
    bool _864 = !_862;
    int _866 = _864 ? 0 : (-1);
    int _868 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _870 = _868 != 0;
    int _872 = ~_856;
    int _874 = _872 + _866;
    int _876 = _874 + 1;
    int _878 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16;
    bool _880 = _878 != 0;
    int _882 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32;
    bool _884 = _882 != 0;
    float _886 = in.m_46.x;
    float _888 = in.m_46.y;
    float _890 = in.m_46.z;
    bool _892 = _455 > 0.5;
    int _894 = _461 * _876;
    int _896 = _894 + _830;
    bool _898 = _461 == 0;
    float _900 = in.m_66.x;
    float _902 = in.m_66.y;
    float _904 = in.m_66.z;
    float _906 = in.m_66.w;
    float _908 = -_185;
    int _910 = _892 ? as_type<int>(_908) : as_type<int>(_185);
    bool _912 = !_870;
    float _914 = _912 ? _185 : as_type<float>(_826);
    bool _916 = !_884;
    float _918 = _916 ? _185 : as_type<float>(_910);
    bool _920 = !_898;
    int _922 = _920 ? _896 : (-1);
    float _924 = -_181;
    int _926 = _892 ? as_type<int>(_924) : as_type<int>(_181);
    int _928 = _922 & 3;
    bool _930 = _928 != 0;
    int _932 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _934 = _932 != 0;
    bool _936 = uint(_928) > 1u;
    bool _938 = !_934;
    float _940 = _938 ? _181 : as_type<float>(_926);
    int _942 = _922 & 3;
    bool _944 = _942 != 0;
    float _946 = _888 * _469;
    int _948 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4194304;
    bool _950 = _948 != 0;
    float _952 = _888 * _810;
    int _954 = _944 ? 0 : 1;
    float _956 = _888 * _902;
    int _958 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _960 = _958 != 0;
    float _962 = fma(_886, _467, _946);
    int _964 = ~_954;
    int _966 = _964 + 1;
    int _968 = _966 + 1;
    float _970 = fma(_886, _808, _952);
    int _972 = _968;
    if (!_936)
    {
        int _974 = ~_954;
        int _976 = _974 + 1;
        _972 = _976;
    }
    int _978 = _972;
    bool _980 = uint(_928) >= 2u;
    int _982 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _984 = _982 != 0;
    int _986 = _980 ? 0 : 1;
    bool _988 = _928 != 3;
    float _990 = (*spvDescriptorSet0.vp_c9)._m0[87].x + (*spvDescriptorSet0.vp_c9)._m0[86].z;
    float _992 = _523 * (*spvDescriptorSet0.vp_c9)._m0[87].x;
    int _994 = ~_986;
    int _996 = _994 + 1;
    int _998 = _996 + 1;
    float _1000 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _1002 = -(*spvDescriptorSet0.vp_c9)._m0[152].w;
    float _1004 = _1002 + (*spvDescriptorSet0.vp_c9)._m0[153].w;
    float _1006 = -_990;
    float _1008 = fma(_992, 2.0, _1006);
    int _1010 = _998;
    if (_988)
    {
        int _1012 = ~_986;
        int _1014 = _1012 + 1;
        _1010 = _1014;
    }
    int _1016 = _1010;
    float _1018 = fma(_587, (*spvDescriptorSet0.vp_c9)._m0[83].z, _1000);
    bool _1020 = _449 > 0.5;
    float _1022 = _587 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _1024 = -_145;
    float _1026 = fma(_1024, (*spvDescriptorSet0.vp_c9)._m0[86].x, _1008);
    float _1028 = -_181;
    int _1030 = _1020 ? as_type<int>(_1028) : as_type<int>(_181);
    float _1032 = -_487;
    float _1034 = fma(_1022, 2.0, _1032);
    bool _1036 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1038 = isnan(0.0);
    bool _1040 = _1036 || _1038;
    bool _1042 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1044 = _1040 || _1042;
    float _1046 = _636 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _1048 = (*spvDescriptorSet0.vp_c9)._m0[87].y + (*spvDescriptorSet0.vp_c9)._m0[86].w;
    float _1050 = _1044 ? _593 : 0.0;
    float _1052 = fma(_1046, -2.0, _489);
    bool _1054 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1056 = isnan(1.0);
    bool _1058 = _1054 || _1056;
    bool _1060 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1062 = _1058 || _1060;
    float _1064 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _1066 = 1.0 + _1064;
    float _1068 = _664 * (*spvDescriptorSet0.vp_c9)._m0[87].y;
    float _1070 = fma(_145, (*spvDescriptorSet0.vp_c9)._m0[82].w, _668);
    float _1072 = fma(_886, _900, _956);
    float _1074 = _589 * 2.0;
    float _1076 = fma(_1068, -2.0, _1048);
    float _1078 = 1.0 / _1066;
    float _1080 = (*spvDescriptorSet0.vp_c9)._m0[88].w + (*spvDescriptorSet0.vp_c9)._m0[88].y;
    float _1082 = -(*spvDescriptorSet0.vp_c9)._m0[154].w;
    float _1084 = _1082 + (*spvDescriptorSet0.vp_c9)._m0[155].w;
    float _1086 = fma(_145, (*spvDescriptorSet0.vp_c9)._m0[82].z, _1018);
    float _1088 = -_145;
    float _1090 = fma(_1088, (*spvDescriptorSet0.vp_c9)._m0[81].x, _1034);
    float _1092 = fma(_589, (*spvDescriptorSet0.vp_c9)._m0[88].w, _1080);
    float _1094 = fma(_145, (*spvDescriptorSet0.vp_c9)._m0[87].z, _525);
    float _1096 = fma(_145, (*spvDescriptorSet0.vp_c9)._m0[81].y, _1052);
    float _1098 = fma(_145, (*spvDescriptorSet0.vp_c9)._m0[86].y, _1076);
    float _1100 = fma(_145, (*spvDescriptorSet0.vp_c9)._m0[87].w, _1092);
    float _1102 = floor(_1074);
    float _1104 = fma(_890, _904, _1072);
    float _1106 = -_577;
    float _1108 = _1106 + 1.0;
    if (_1062)
    {
        float _1110 = _1050 * _1078;
        _147 = _1110;
    }
    float _1112 = _147;
    bool _1114 = _595 >= 0.0;
    bool _1116 = isnan(_595);
    bool _1118 = _1114 || _1116;
    bool _1120 = isnan(0.0);
    bool _1122 = _1118 || _1120;
    float _1124 = -(*spvDescriptorSet0.vp_c9)._m0[156].w;
    float _1126 = _1124 + (*spvDescriptorSet0.vp_c9)._m0[157].w;
    float _1128 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _1130 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _1128;
    float _1132 = fma(_890, _471, _962);
    int _1134 = _1122 ? 0 : 1;
    float _1136 = -(*spvDescriptorSet0.vp_c9)._m0[153].w;
    float _1138 = _1136 + (*spvDescriptorSet0.vp_c9)._m0[154].w;
    bool _1140 = _595 > 0.0;
    float _1142 = _1130 * _615;
    float _1144 = _455 * 2.0;
    float _1146 = 1.0 / _599;
    int _1148 = ~_1134;
    int _1150 = _1148 + 1;
    int _1152 = _1150 + 1;
    float _1154 = fma(_890, _812, _970);
    float _1156 = -(*spvDescriptorSet0.vp_c9)._m0[152].x;
    float _1158 = _1156 + (*spvDescriptorSet0.vp_c9)._m0[153].x;
    float _1160 = _1132 + _473;
    float _1162 = float(uint(_798));
    float _1164 = 1.0 / _1138;
    int _1166 = _1152;
    if (!_1140)
    {
        int _1168 = ~_1134;
        int _1170 = _1168 + 1;
        _1166 = _1170;
    }
    int _1172 = _1166;
    float _1174 = -(*spvDescriptorSet0.vp_c9)._m0[151].x;
    float _1176 = (*spvDescriptorSet0.vp_c9)._m0[152].x + _1174;
    bool _1178 = _1102 >= 0.0;
    bool _1180 = isnan(_1102);
    bool _1182 = _1178 || _1180;
    bool _1184 = isnan(0.0);
    bool _1186 = _1182 || _1184;
    float _1188 = -(*spvDescriptorSet0.vp_c9)._m0[155].x;
    float _1190 = (*spvDescriptorSet0.vp_c9)._m0[156].x + _1188;
    float _1192 = _1176 * _630;
    int _1194 = _1186 ? 0 : 1;
    float _1196 = 1.0 / _1084;
    bool _1198 = _1102 > 0.0;
    float _1200 = -(*spvDescriptorSet0.vp_c9)._m0[153].x;
    float _1202 = (*spvDescriptorSet0.vp_c9)._m0[154].x + _1200;
    float _1204 = -(*spvDescriptorSet0.vp_c9)._m0[154].x;
    float _1206 = _1204 + (*spvDescriptorSet0.vp_c9)._m0[155].x;
    float _1208 = -(*spvDescriptorSet0.vp_c9)._m0[156].x;
    float _1210 = _1208 + (*spvDescriptorSet0.vp_c9)._m0[157].x;
    float _1212 = -(*spvDescriptorSet0.vp_c9)._m0[157].w;
    float _1214 = _1212 + (*spvDescriptorSet0.vp_c9)._m0[158].w;
    int _1216 = ~_1194;
    int _1218 = _1216 + 1;
    int _1220 = _1218 + 1;
    float _1222 = as_type<float>(_555) * _1162;
    float _1224 = 1.0 / _1126;
    float _1226 = _1202 * _1164;
    int _1228 = abs(_978);
    float _1230 = -_1094;
    float _1232 = _1230 + 1.0;
    float _1234 = float(_1172);
    int _1236 = _1220;
    if (!_1198)
    {
        int _1238 = ~_1194;
        int _1240 = _1238 + 1;
        _1236 = _1240;
    }
    int _1242 = _1236;
    float _1244 = floor(_1144);
    float _1246 = _1206 * _1196;
    float _1248 = -(*spvDescriptorSet0.vp_c9)._m0[151].w;
    float _1250 = _439 + _1248;
    float _1252 = _1190 * _1146;
    bool _1254 = _439 >= (*spvDescriptorSet0.vp_c9)._m0[158].w;
    bool _1256 = isnan(_439);
    bool _1258 = _1254 || _1256;
    bool _1260 = isnan((*spvDescriptorSet0.vp_c9)._m0[158].w);
    bool _1262 = _1258 || _1260;
    float _1264 = float(_1262);
    float _1266 = fma(_1192, _1250, (*spvDescriptorSet0.vp_c9)._m0[151].x);
    float _1268 = -(*spvDescriptorSet0.vp_c9)._m0[152].w;
    float _1270 = _439 + _1268;
    float _1272 = 1.0 / _1004;
    float _1274 = _1210 * _1224;
    float _1276 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _1278 = _443 + _1276;
    float _1280 = -_1264;
    float _1282 = _1280 + 1.0;
    float _1284 = fma(_1142, _1278, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    float _1286 = -(*spvDescriptorSet0.vp_c9)._m0[153].w;
    float _1288 = _439 + _1286;
    bool _1290 = _1244 >= 0.0;
    bool _1292 = isnan(_1244);
    bool _1294 = _1290 || _1292;
    bool _1296 = isnan(0.0);
    bool _1298 = _1294 || _1296;
    float _1300 = 1.0 / _1214;
    float _1302 = -(*spvDescriptorSet0.vp_c9)._m0[154].w;
    float _1304 = _439 + _1302;
    int _1306 = _1298 ? 0 : 1;
    bool _1308 = _1244 > 0.0;
    float _1310 = fma(_1246, _1304, (*spvDescriptorSet0.vp_c9)._m0[154].x);
    float _1312 = _1158 * _1272;
    bool _1314 = _439 >= (*spvDescriptorSet0.vp_c9)._m0[157].w;
    bool _1316 = isnan(_439);
    bool _1318 = _1314 || _1316;
    bool _1320 = isnan((*spvDescriptorSet0.vp_c9)._m0[157].w);
    bool _1322 = _1318 || _1320;
    float _1324 = float(_1322);
    bool _1326 = _439 >= (*spvDescriptorSet0.vp_c9)._m0[156].w;
    bool _1328 = isnan(_439);
    bool _1330 = _1326 || _1328;
    bool _1332 = isnan((*spvDescriptorSet0.vp_c9)._m0[156].w);
    bool _1334 = _1330 || _1332;
    float _1336 = float(_1334);
    float _1338 = fma(_1312, _1270, (*spvDescriptorSet0.vp_c9)._m0[152].x);
    float _1340 = fma(_1226, _1288, (*spvDescriptorSet0.vp_c9)._m0[153].x);
    float _1342 = -(*spvDescriptorSet0.vp_c9)._m0[155].w;
    float _1344 = _439 + _1342;
    float _1346 = -_1324;
    float _1348 = _1346 + 1.0;
    float _1350 = _1324 * _1282;
    float _1352 = fma(_1252, _1344, (*spvDescriptorSet0.vp_c9)._m0[155].x);
    bool _1354 = _439 >= (*spvDescriptorSet0.vp_c9)._m0[155].w;
    bool _1356 = isnan(_439);
    bool _1358 = _1354 || _1356;
    bool _1360 = isnan((*spvDescriptorSet0.vp_c9)._m0[155].w);
    bool _1362 = _1358 || _1360;
    float _1364 = float(_1362);
    float _1366 = _1336 * _1348;
    float _1368 = -(*spvDescriptorSet0.vp_c9)._m0[157].x;
    float _1370 = (*spvDescriptorSet0.vp_c9)._m0[158].x + _1368;
    float _1372 = -_1336;
    float _1374 = _1372 + 1.0;
    bool _1376 = _439 >= (*spvDescriptorSet0.vp_c9)._m0[154].w;
    bool _1378 = isnan(_439);
    bool _1380 = _1376 || _1378;
    bool _1382 = isnan((*spvDescriptorSet0.vp_c9)._m0[154].w);
    bool _1384 = _1380 || _1382;
    float _1386 = float(_1384);
    float _1388 = _1370 * _1300;
    float _1390 = _1364 * _1374;
    float _1392 = -(*spvDescriptorSet0.vp_c9)._m0[156].w;
    float _1394 = _439 + _1392;
    float _1396 = -_1364;
    float _1398 = _1396 + 1.0;
    float _1400 = -_1386;
    float _1402 = _1400 + 1.0;
    float _1404 = fma(_1274, _1394, (*spvDescriptorSet0.vp_c9)._m0[156].x);
    float _1406 = _1386 * _1398;
    float _1408 = -(*spvDescriptorSet0.vp_c9)._m0[157].w;
    float _1410 = _439 + _1408;
    float _1412 = trunc(_1222);
    float _1414 = precise::max(_1412, 0.0);
    uint _1416 = uint(_1414);
    bool _1418 = _443 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _1420 = isnan(_443);
    bool _1422 = _1418 || _1420;
    bool _1424 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _1426 = _1422 || _1424;
    float _1428 = float(_1426);
    float _1430 = _577 * _1402;
    float _1432 = fma(_1388, _1410, (*spvDescriptorSet0.vp_c9)._m0[157].x);
    bool _1434 = _443 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _1436 = isnan(_443);
    bool _1438 = _1434 || _1436;
    bool _1440 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _1442 = _1438 || _1440;
    float _1444 = float(_1442);
    float _1446 = _611 * _1108;
    bool _1448 = _439 >= (*spvDescriptorSet0.vp_c9)._m0[151].w;
    bool _1450 = isnan(_439);
    bool _1452 = _1448 || _1450;
    bool _1454 = isnan((*spvDescriptorSet0.vp_c9)._m0[151].w);
    bool _1456 = _1452 || _1454;
    float _1458 = float(_1456);
    float _1460 = -_611;
    float _1462 = _1460 + 1.0;
    int _1464 = ~_461;
    int _1466 = _1464 + 1;
    float _1468 = -_1444;
    float _1470 = _1468 + 1.0;
    float _1472 = _1458 * _1462;
    float _1474 = _1104 + _906;
    float _1476 = _1428 * _1470;
    float _1478 = _1266 * _1472;
    float _1480 = -_1428;
    float _1482 = _1480 + 1.0;
    int _1484 = _1466 * int(_1416);
    int _1486 = _1484 + _798;
    float _1488 = _1284 * _1476;
    float _1490 = -_1458;
    float _1492 = _1490 + 1.0;
    float _1494 = _1154 + _814;
    int _1496 = ~_461;
    int _1498 = _1496 + 1;
    float _1500 = fma(_1482, (*spvDescriptorSet0.vp_c9)._m0[131].x, _1488);
    float _1502 = float(uint(_1486));
    float _1504 = fma(_1492, (*spvDescriptorSet0.vp_c9)._m0[151].x, _1478);
    float _1506 = fma(_1444, (*spvDescriptorSet0.vp_c9)._m0[132].x, _1500);
    float _1508 = _589 + _449;
    float _1510 = as_type<float>(_555) * _1502;
    float _1512 = fma(_1338, _1446, _1504);
    float _1514 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1516 = _1506 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _1518 = trunc(_1510);
    float _1520 = precise::max(_1518, 0.0);
    uint _1522 = uint(_1520);
    float _1524 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    int _1526 = ~_1306;
    int _1528 = _1526 + 1;
    int _1530 = _1528 + 1;
    float _1532 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    int _1534 = _1530;
    if (!_1308)
    {
        int _1536 = ~_1306;
        int _1538 = _1536 + 1;
        _1534 = _1538;
    }
    int _1540 = _1534;
    float _1542 = _1514 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1544 = _1524 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1546 = _1532 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1548 = _1508 + (-1.0);
    bool _1550 = !_960;
    float _1552 = _1550 ? _181 : as_type<float>(_1030);
    float _1554 = fma(_1340, _1430, _1512);
    bool _1556 = _589 > 0.5;
    out.m_68.x = _1542;
    out.m_68.y = _1544;
    out.m_68.z = _1546;
    out.m_68.w = _1516;
    float _1558 = _940 + 0.5;
    float _1560 = fma(_1310, _1406, _1554);
    int _1562 = int(_1416) + int(_1522);
    float _1564 = fma(_1548, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _1566 = -_181;
    int _1568 = _1556 ? as_type<int>(_1566) : as_type<int>(_181);
    float _1570 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].z;
    float _1572 = -_185;
    int _1574 = _1556 ? as_type<int>(_1572) : as_type<int>(_185);
    int _1576 = _1498 * _1562;
    int _1578 = _1576 + _798;
    float _1580 = fma(_1558, (*spvDescriptorSet0.vp_c9)._m0[85].x, _1090);
    bool _1582 = !_880;
    float _1584 = _1582 ? _181 : as_type<float>(_1568);
    float _1586 = _1552 + 0.5;
    bool _1588 = uint(_1578) >= uint(_461);
    float _1590 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1592 = _1160 + _1590;
    int _1594 = _922 >> 31;
    float _1596 = fma(_1352, _1390, _1560);
    int _1598 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _1600 = _1598 != 0;
    int _1602 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _1604 = _1602 != 0;
    int _1606 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _1608 = _1606 != 0;
    float _1610 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1612 = _1474 + _1610;
    int _1614 = _1594 & 3;
    float _1616 = _1592 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    bool _1618 = !_930;
    int _1620 = _1618 ? 0 : 1;
    float _1622 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    int _1624 = _922 + _1614;
    float _1626 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1628 = _1494 + _1626;
    float _1630 = fma(_1612, (*spvDescriptorSet0.vp_c8)._m0[28].x, _1616);
    bool _1632 = _928 != 3;
    float _1634 = _1584 + 0.5;
    int _1636 = _1624 >> 2;
    float _1638 = fma(_1628, (*spvDescriptorSet0.vp_c8)._m0[28].z, _1630);
    bool _1640 = !_1632;
    int _1642 = _1640 ? 0 : (-1);
    float _1644 = _1570 * (*spvDescriptorSet0.vp_c9)._m0[90].x;
    int _1646 = _1636 << 4;
    int _1648 = _1646 + 512;
    float _1650 = fma(_1404, _1366, _1596);
    bool _1652 = _1638 >= 0.0;
    float _1654 = fma(_1644, _1634, _1026);
    uint _1656 = uint(int(uint(_1648) >> uint(2)));
    uint _1658 = uint(int(uint(int(_1656)) >> uint(2)));
    int _1660 = int(_1656) & 3;
    float _1662 = (*spvDescriptorSet0.vp_c9)._m0[int(_1658)][_1660];
    int _1664 = int(_1656) + 1;
    uint _1666 = uint(int(uint(_1664) >> uint(2)));
    int _1668 = _1664 & 3;
    float _1670 = (*spvDescriptorSet0.vp_c9)._m0[int(_1666)][_1668];
    float _1672 = -_1086;
    float _1674 = _1672 + 1.0;
    float _1676 = _1592 * _1592;
    float _1678 = _1586 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    bool _1680 = !_984;
    float _1682 = _1680 ? _185 : as_type<float>(_1574);
    float _1684 = -_1674;
    float _1686 = fma(_940, _1684, _1580);
    float _1688 = fma(_1612, _1612, _1676);
    float _1690 = _1678 * _1622;
    float _1692 = _914 + (-0.5);
    int _1694 = _1648 + 8;
    uint _1696 = uint(int(uint(_1694) >> uint(2)));
    uint _1698 = uint(int(uint(int(_1696)) >> uint(2)));
    int _1700 = int(_1696) & 3;
    float _1702 = (*spvDescriptorSet0.vp_c9)._m0[int(_1698)][_1700];
    int _1704 = int(_1696) + 1;
    uint _1706 = uint(int(uint(_1704) >> uint(2)));
    int _1708 = _1704 & 3;
    float _1710 = (*spvDescriptorSet0.vp_c9)._m0[int(_1706)][_1708];
    float _1712 = fma(_1628, _1628, _1688);
    float _1714 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].w;
    float _1716 = -_1692;
    float _1718 = -_1096;
    float _1720 = fma(_1716, (*spvDescriptorSet0.vp_c9)._m0[85].y, _1718);
    float _1722 = -_1682;
    float _1724 = _1722 + 0.5;
    float _1726 = _1676;
    if (_1652)
    {
        _1726 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _1728 = _1726;
    float _1730 = fma(_1432, _1350, _1650);
    float _1732 = -_1070;
    float _1734 = _1732 + 1.0;
    float _1736 = _1724 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    int _1738 = abs(_1642);
    float _1740 = rsqrt(_1712);
    int _1742 = as_type<int>(_1728);
    if (_1652)
    {
        float _1744 = _1728 * 5.0;
        _1742 = as_type<int>(_1744);
    }
    int _1746 = _1742;
    float _1748 = fma(_914, _1734, _1720);
    float _1750 = _918 + (-0.5);
    bool _1752 = !_1588;
    int _1754 = _1752 ? 0 : (-1);
    float _1756 = fma(_1264, (*spvDescriptorSet0.vp_c9)._m0[158].x, _1730);
    if (_1652)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _5909 = as_type<float>(_1746);
        out.gl_Position.z = _5909;
    }
    float _1758 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _1760 = _1714 * (*spvDescriptorSet0.vp_c9)._m0[90].y;
    int _1762 = ~_1562;
    int _1764 = _1762 + _1754;
    int _1766 = _1764 + 1;
    out.m_70.x = _1756;
    bool _1768 = _461 == 0;
    float _1770 = -_1760;
    float _1772 = -_1098;
    float _1774 = fma(_1770, _1750, _1772);
    float _1776 = -_1100;
    float _1778 = _1776 + 1.0;
    float _1780 = -_1232;
    float _1782 = fma(_1584, _1780, _1654);
    float _1784 = _1592 * _1740;
    float _1786 = _1612 * _1740;
    int _1788 = _461 * _1766;
    int _1790 = _1788 + _798;
    int _1792 = abs(_1620);
    float _1794 = -_1784;
    float _1796 = fma(_1794, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1592);
    float _1798 = -_1786;
    float _1800 = fma(_1798, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1612);
    float _1802 = fma(_918, _1778, _1774);
    int _1804 = ~_1792;
    int _1806 = _1804 + 1;
    int _1808 = _1806 + 1;
    float _1810 = _1796 * _1796;
    float _1812 = _1736 * _1758;
    int _1814 = ~_1228;
    int _1816 = _1814 + 1;
    int _1818 = _1816 + 1;
    out.m_72.x = _1782;
    out.m_72.y = _1802;
    float _1820 = fma(_1800, _1800, _1810);
    out.m_74.x = _1690;
    out.m_74.y = _1812;
    out.m_74.z = _1686;
    out.m_74.w = _1748;
    int _1822 = _1818 * as_type<int>(_1670);
    if (_1652)
    {
        out.m_49.x = 0.0;
    }
    int _1824 = abs(_1016);
    int _1826 = _1808 * as_type<int>(_1662);
    int _1828 = _1826 + _1822;
    bool _1830 = !_950;
    int _1832 = _1830 ? 0 : 1;
    float _1834 = in.m_76.x;
    float _1836 = in.m_76.y;
    float _1838 = in.m_76.z;
    int _1840 = ~_1824;
    int _1842 = _1840 + 1;
    int _1844 = _1842 + 1;
    int _1846 = abs(_1832);
    int _1848 = ~_1738;
    int _1850 = _1848 + 1;
    int _1852 = _1850 + 1;
    int _1854 = _1844 * as_type<int>(_1702);
    int _1856 = _1854 + _1828;
    bool _1858 = !_1600;
    int _1860 = _1858 ? 0 : 1;
    int _1862 = ~_1846;
    int _1864 = _1862 + 1;
    int _1866 = _1864 + 1;
    int _1868 = _1852 * as_type<int>(_1710);
    int _1870 = _1868 + _1856;
    int _1872 = abs(_1860);
    bool _1874 = !_1768;
    int _1876 = _1874 ? _1790 : (-1);
    int _1878 = _1870 * _1866;
    float _1880 = float(_1540);
    float _1882 = float(_1872);
    int _1884 = _1876 * _1846;
    int _1886 = _1884 + _1878;
    bool _1888 = !_1604;
    int _1890 = _1888 ? 0 : 1;
    float _1892 = _1628 * _1740;
    float _1894 = _1882 * _1880;
    int _1896 = abs(_1890);
    float _1898 = -_1892;
    float _1900 = fma(_1898, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1628);
    float _1902 = float(_1886);
    float _1904 = _1894 * (-2.0);
    float _1906 = float(_1896);
    float _1908 = _449 + (-0.5);
    float _1910 = fma(_1900, _1900, _1820);
    float _1912 = fma(_1904, _1834, _1834);
    out.m_78.y = _1902;
    float _1914 = _1906 * _1234;
    float _1916 = fma(_1564, _1904, _1564);
    float _1918 = fma(_1908, (*spvDescriptorSet0.vp_c9)._m0[196].x, _1912);
    float _1920 = _455 + _589;
    bool _1922 = !_1608;
    int _1924 = _1922 ? 0 : 1;
    float _1926 = _1838;
    if (_1652)
    {
        return out;
    }
    float _1928 = -_1784;
    float _1930 = fma(_1928, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1160);
    float _1932 = -_1786;
    float _1934 = fma(_1932, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1474);
    int _1936 = abs(_1924);
    float _1938 = -_1892;
    float _1940 = fma(_1938, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1494);
    float _1942 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1944 = _1930 + _1942;
    float _1946 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1948 = _1934 + _1946;
    float _1950 = float(_1242);
    float _1952 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1954 = _1940 + _1952;
    float _1956 = _1944 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1958 = _1914 * (-2.0);
    float _1960 = _1920 + (-1.0);
    float _1962 = fma(_1948, (*spvDescriptorSet0.vp_c8)._m0[28].x, _1956);
    float _1964 = float(_1936);
    float _1966 = _589 + (-0.5);
    float _1968 = fma(_1960, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _1970 = fma(_1954, (*spvDescriptorSet0.vp_c8)._m0[28].z, _1962);
    float _1972 = _455 + _449;
    float _1974 = _1964 * _1950;
    float _1976 = _455 + (-0.5);
    float _1978 = fma(_1916, _1112, _1918);
    bool _1980 = _1970 >= 0.0;
    float _1982 = fma(_1958, _1836, _1836);
    float _1984 = fma(_1968, _1958, _1968);
    float _1986 = _1972 + (-1.0);
    float _1988 = _1974 * (-2.0);
    float _1990 = fma(_1966, (*spvDescriptorSet0.vp_c9)._m0[196].y, _1982);
    float _1992 = _1978 * 0.15915493667125701904296875;
    float _1994 = sqrt(_1910);
    float _1996 = fma(_1984, _1112, _1990);
    float _1998 = fma(_1988, _1838, _1838);
    float _2000 = fma(_1986, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _2002 = _1996 * 0.15915493667125701904296875;
    float _2004 = fma(_1976, (*spvDescriptorSet0.vp_c9)._m0[196].z, _1998);
    float _2006 = fma(_2000, _1988, _2000);
    float _2008 = _1948;
    if (_1980)
    {
        _1926 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _2010 = _1926;
    float _2012 = _1992 * 6.283185482025146484375;
    float _2014 = sin(_2012);
    float _2016 = fma(_2006, _1112, _2004);
    int _2018 = as_type<int>(_2010);
    if (_1980)
    {
        out.m_49.x = 0.0;
    }
    if (_1980)
    {
        float _2020 = _2010 * 5.0;
        _2018 = as_type<int>(_2020);
    }
    int _2022 = _2018;
    float _2024 = _2016 * 0.15915493667125701904296875;
    float _2026 = _1992 * 6.283185482025146484375;
    float _2028 = cos(_2026);
    if (_1980)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _6334 = as_type<float>(_2022);
        out.gl_Position.z = _6334;
    }
    float _2030 = _2002 * 6.283185482025146484375;
    float _2032 = sin(_2030);
    float _2034 = _2002 * 6.283185482025146484375;
    float _2036 = cos(_2034);
    if (_1980)
    {
        return out;
    }
    float _2038 = _2024 * 6.283185482025146484375;
    float _2040 = cos(_2038);
    float _2042 = _1740 * _1994;
    float _2044 = _397 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _2046 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _185);
    float _2048 = _399 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _2050 = _2028 * _2036;
    float _2052 = _2042 * _2044;
    float _2054 = _2028 * _2032;
    float _2056 = _2024 * 6.283185482025146484375;
    float _2058 = sin(_2056);
    float _2060 = _2042 * _2048;
    float _2062 = _2046 * _2052;
    float _2064 = _2014 * _2032;
    float _2066 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _181);
    float _2068 = _2014 * _2036;
    float _2070 = _2042 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _2072 = _2070 * 0.5;
    float _2074 = _2028 * _2040;
    float _2076 = _2066 * _2060;
    float _2078 = _2036 * _2040;
    float _2080 = _2014 * _2040;
    float _2082 = _2074 * _2062;
    float _2084 = _2032 * _2040;
    bool _2086 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _2088 = isnan(0.5);
    bool _2090 = _2086 || _2088;
    bool _2092 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _2094 = _2090 || _2092;
    float _2096 = fma(_2058, _2050, _2064);
    float _2098 = -_2068;
    float _2100 = fma(_2058, _2054, _2098);
    float _2102 = -_2062;
    float _2104 = _2058 * _2102;
    float _2106 = -_2054;
    float _2108 = fma(_2058, _2068, _2106);
    float _2110 = fma(_2096, _2076, _2082);
    float _2112 = _2080 * _2062;
    float _2114 = fma(_2078, _2076, _2104);
    float _2116 = fma(_2058, _2064, _2050);
    float _2118 = fma(_2100, _2072, _2110);
    float _2120 = fma(_2108, _2076, _2112);
    float _2122 = fma(_2084, _2072, _2114);
    float _2124 = _1930 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _2126 = _2118 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2128 = fma(_2116, _2072, _2120);
    float _2130 = _2118 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2132 = fma(_1934, (*spvDescriptorSet0.vp_c8)._m0[11].x, _2124);
    float _2134 = fma(_2122, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2126);
    float _2136 = _1930 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _2138 = fma(_2122, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2130);
    float _2140 = fma(_1940, (*spvDescriptorSet0.vp_c8)._m0[11].z, _2132);
    float _2142 = fma(_2128, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2134);
    bool _2144 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _2146 = isnan(0.5);
    bool _2148 = _2144 || _2146;
    bool _2150 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _2152 = _2148 || _2150;
    float _2154 = fma(_2128, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2138);
    float _2156 = _2140 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _2158 = _2142 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _2160 = _2154 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _2162 = 1.0 / _2156;
    float _2164 = _1494 + _2158;
    float _2166 = _1474 + _2160;
    float _2168 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _2170 = _2164 + _2168;
    float _2172 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _2174 = _2166 + _2172;
    float _2176 = _2170 * _2170;
    float _2178 = fma(_2174, _2174, _2176);
    float _2180 = fma(_1934, (*spvDescriptorSet0.vp_c8)._m0[10].x, _2136);
    float _2182 = sqrt(_2178);
    float _2184 = fma(_1940, (*spvDescriptorSet0.vp_c8)._m0[10].z, _2180);
    float _2186 = _2184 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _2188 = _2186 + _2156;
    float _2190 = _2118 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2192 = _2188 * _2162;
    float _2194 = _2192 * 0.5;
    float _2196 = fma(_2122, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2190);
    bool _2198 = _2182 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2200 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _2202 = fma(_2194, (*spvDescriptorSet0.vp_c8)._m0[30].w, _2200);
    float _2204 = fma(_2128, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2196);
    float _2206 = 1.0 / _2202;
    float _2208 = _2204 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _2210 = _1160 + _2208;
    float _2212 = _2156;
    float _2214 = _2166;
    float _2216 = _2194;
    float _2218 = _2170;
    float _2220 = _2210;
    if (!_2198)
    {
        _2212 = _2166;
    }
    float _2222 = _2212;
    float _2224 = _2222;
    if (!_2198)
    {
        _2214 = _2164;
    }
    float _2226 = _2214;
    float _2228 = _2226;
    if (!_2198)
    {
        _2216 = _2210;
    }
    float _2230 = _2216;
    bool _2232 = !_2198;
    float _2234 = _2230;
    if (!_2232)
    {
        float _2236 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2238 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _2240 = _2182 + _2238;
        float _2242 = _2210 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2244 = rsqrt(_2178);
        float _2246 = _2240 * _2236;
        float _2248 = _2246 * 0.15915493667125701904296875;
        float _2250 = _2248 * 6.283185482025146484375;
        float _2252 = sin(_2250);
        float _2254 = _2248 * 6.283185482025146484375;
        float _2256 = cos(_2254);
        float _2258 = fma(_2252, _2242, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _2260 = _2244 * _2258;
        float _2262 = _2256 + (-1.0);
        float _2264 = fma(_2174, _2260, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _2266 = fma(_2170, _2260, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _2268 = _2262 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2270 = fma(_2210, _2256, _2268);
        _2224 = _2264;
        _2234 = _2270;
        _2228 = _2266;
    }
    float _2272 = _2224;
    float _2274 = _2234;
    float _2276 = _2228;
    float _2278 = -_1786;
    float _2280 = fma(_2278, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2272);
    float _2282 = -_1784;
    float _2284 = fma(_2282, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2274);
    float _2286 = -_1892;
    float _2288 = fma(_2286, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2276);
    float _2290 = _2284;
    float _2292 = _2280;
    float _2294 = _2288;
    float _2296 = _2276;
    if (_2152)
    {
        _2218 = 1.0;
    }
    float _2298 = _2218;
    float _2300 = _2298;
    if (!_2094)
    {
        float _2302 = _1944 * _1944;
        float _2304 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _2306 = -_1494;
        float _2308 = _2306 + _2276;
        float _2310 = -_1160;
        float _2312 = _2310 + _2274;
        float _2314 = fma(_1948, _1948, _2302);
        float _2316 = -_1474;
        float _2318 = _2316 + _2272;
        float _2320 = fma(_1954, _1954, _2314);
        float _2322 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _2324 = sqrt(_2320);
        float _2326 = 1.0 / _2042;
        float _2328 = _2322 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _2330 = precise::min(_2324, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _2332 = _2330 * _2304;
        float _2334 = _2332 * _2326;
        float _2336 = _2328 * _2334;
        float _2338 = _2308 * _2334;
        float _2340 = fma(_2312, _2336, _1930);
        float _2342 = fma(_2318, _2336, _1934);
        float _2344 = fma(_2328, _2338, _1940);
        _2008 = _2324;
        _2290 = _2340;
        _2292 = _2342;
        _2294 = _2344;
        _2296 = _2338;
    }
    float _2346 = _2008;
    float _2348 = _2290;
    float _2350 = _2292;
    float _2352 = _2294;
    float _2354 = _2296;
    float _2356 = _2354;
    float _2358 = _2346;
    if (_2152)
    {
        _2356 = 1.0;
    }
    float _2360 = _2356;
    float _2362 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _2364 = _2206 * _2362;
    float _2366 = _2360;
    if (!_2152)
    {
        float _2368 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _2370 = _2368 * 0.15915493667125701904296875;
        float _2372 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _2374 = _2370 * 6.283185482025146484375;
        float _2376 = cos(_2374);
        float _2378 = _2372 * 0.15915493667125701904296875;
        float _2380 = _2370 * 6.283185482025146484375;
        float _2382 = sin(_2380);
        float _2384 = 1.0 / _2376;
        float _2386 = _2378 * 6.283185482025146484375;
        float _2388 = cos(_2386);
        float _2390 = _2382 * _2384;
        float _2392 = _2378 * 6.283185482025146484375;
        float _2394 = sin(_2392);
        float _2396 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2398 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _2396;
        float _2400 = _2388 * _2390;
        float _2402 = 1.0 / _2398;
        float _2404 = 1.0 / _2400;
        float _2406 = _2394 * _2404;
        float _2408 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2410 = fma(_2364, _2406, _2408);
        float _2412 = _2410 * _2402;
        float _2414 = precise::clamp(_2412, 0.0, 1.0);
        _2358 = _2390;
        _2300 = _2414;
    }
    float _2416 = _2358;
    float _2418 = _2300;
    float _2420 = _2416;
    if (!_2152)
    {
        float _2422 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _2424 = _2422 * 0.15915493667125701904296875;
        float _2426 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _2428 = _2424 * 6.283185482025146484375;
        float _2430 = cos(_2428);
        float _2432 = _2426 * 0.15915493667125701904296875;
        float _2434 = _2424 * 6.283185482025146484375;
        float _2436 = sin(_2434);
        float _2438 = 1.0 / _2430;
        float _2440 = _2432 * 6.283185482025146484375;
        float _2442 = cos(_2440);
        float _2444 = _2436 * _2438;
        float _2446 = _2432 * 6.283185482025146484375;
        float _2448 = sin(_2446);
        float _2450 = _2442 * _2444;
        float _2452 = 1.0 / _2450;
        float _2454 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _2456 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _2454;
        float _2458 = 1.0 / _2456;
        float _2460 = _2448 * _2452;
        float _2462 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _2464 = fma(_2364, _2460, _2462);
        float _2466 = _2464 * _2458;
        float _2468 = precise::clamp(_2466, 0.0, 1.0);
        float _2470 = -_2468;
        float _2472 = _2470 + 1.0;
        _2420 = _2438;
        _2366 = _2472;
    }
    float _2474 = _2420;
    float _2476 = _2366;
    float _2478 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2480 = _2348 + _2478;
    float _2482 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2484 = _2350 + _2482;
    float _2486 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2488 = _2352 + _2486;
    float _2490 = _2480 * _2480;
    float _2492 = _2348 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _2494 = fma(_2484, _2484, _2490);
    float _2496 = fma(_2488, _2488, _2494);
    float _2498 = rsqrt(_2496);
    float _2500 = sqrt(_2496);
    float _2502 = _2498 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _2504 = _2484 * _2502;
    float _2506 = _2488 * _2502;
    float _2508 = _2504 * _2504;
    float _2510 = _2506 * _2506;
    float _2512 = _2508 + _2510;
    float _2514 = sqrt(_2512);
    bool _2516 = _2514 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2518 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2520 = _2514 + _2518;
    float _2522 = _2488;
    float _2524 = _2512;
    float _2526 = _2520;
    float _2528 = _2490;
    if (_2516)
    {
        float _2530 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2522 = _2530;
    }
    float _2532 = _2522;
    if (_2516)
    {
        float _2534 = rsqrt(_2512);
        _2524 = _2534;
    }
    float _2536 = _2524;
    float _2538 = _2536;
    if (_2516)
    {
        float _2540 = _2520 * _2532;
        _2526 = _2540;
    }
    float _2542 = _2526;
    if (_2516)
    {
        float _2544 = _2542 * 0.15915493667125701904296875;
        _2528 = _2544;
    }
    float _2546 = _2528;
    float _2548 = _2532;
    float _2550 = _2546;
    if (_2516)
    {
        float _2552 = _2546 * 6.283185482025146484375;
        float _2554 = sin(_2552);
        _2548 = _2554;
    }
    float _2556 = _2548;
    float _2558 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _2560 = precise::max(0.0, _2558);
    float _2562 = _2474;
    float _2564 = _2560;
    if (_2516)
    {
        float _2566 = _2546 * 6.283185482025146484375;
        float _2568 = cos(_2566);
        _2562 = _2568;
    }
    float _2570 = _2562;
    float _2572 = -_2502;
    float _2574 = -_2560;
    float _2576 = fma(_2480, _2572, _2574);
    float _2578 = (*spvDescriptorSet0.vp_c15)._m0[652].x;
    if (_2516)
    {
        float _2580 = _2576 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2564 = _2580;
    }
    float _2582 = _2564;
    float _2584 = _2582;
    if (!_2516)
    {
        _2550 = _2504;
    }
    float _2586 = _2550;
    float _2588 = fma(_1934, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _2590 = _2556;
    float _2592 = _2586;
    if (_2516)
    {
        float _2594 = fma(_2556, _2582, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _2590 = _2594;
    }
    float _2596 = _2590;
    float _2598 = _2596;
    if (!_2516)
    {
        _2584 = _2576;
    }
    float _2600 = _2584;
    float _2602 = _2600;
    float _2604 = _2570;
    if (_2516)
    {
        float _2606 = _2570 + (-1.0);
        _2578 = _2606;
    }
    float _2608 = _2578;
    float _2610 = _2608;
    if (_2516)
    {
        float _2612 = _2536 * _2596;
        _2220 = _2612;
    }
    float _2614 = _2220;
    if (!_2516)
    {
        _2538 = _2506;
    }
    float _2616 = _2538;
    float _2618 = _2616;
    if (_2516)
    {
        float _2620 = _2608 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2610 = _2620;
    }
    float _2622 = _2610;
    if (_2516)
    {
        float _2624 = _2504 * _2614;
        _2592 = _2624;
    }
    float _2626 = _2592;
    if (!_2516)
    {
        _2598 = _2508;
    }
    float _2628 = _2598;
    float _2630 = _2628;
    if (_2516)
    {
        float _2632 = _2506 * _2614;
        _2618 = _2632;
    }
    float _2634 = _2618;
    if (_2516)
    {
        float _2636 = fma(_2576, _2570, _2622);
        _2602 = _2636;
    }
    float _2638 = _2602;
    if (_2516)
    {
        float _2640 = _2626 * _2626;
        _2630 = _2640;
    }
    float _2642 = _2630;
    if (!_2516)
    {
        _2604 = _2510;
    }
    float _2644 = _2604;
    float _2646 = _2644;
    if (_2516)
    {
        float _2648 = _2634 * _2634;
        _2646 = _2648;
    }
    float _2650 = _2646;
    float _2652 = _2348 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _2654 = fma(_2638, _2638, _2642);
    float _2656 = floor(_2588);
    float _2658 = _2654 + _2650;
    float _2660 = fma(_2350, (*spvDescriptorSet0.vp_c8)._m0[2].x, _2652);
    float _2662 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _2664 = fma(_2500, (*spvDescriptorSet0.vp_c15)._m0[23].w, _2662);
    float _2666 = precise::clamp(_2664, 0.0, 1.0);
    float _2668 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _2670 = fma(_2352, (*spvDescriptorSet0.vp_c8)._m0[2].z, _2660);
    float _2672 = rsqrt(_2658);
    float _2674 = -_2666;
    float _2676 = _2674 + 1.0;
    float _2678 = _2670 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _2680 = fma(_1940, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _2682 = _2348 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2684 = _2678 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _2686 = abs(_2676);
    float _2688 = log2(_2686);
    float _2690 = _2348 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2692 = -_2684;
    float _2694 = fma(_2692, _2668, 1.0);
    float _2696 = fma(_2350, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2682);
    float _2698 = fma(_2350, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2690);
    float _2700 = _2672 * _2626;
    float _2702 = fma(_2352, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2696);
    float _2704 = _2672 * _2638;
    float _2706 = fma(_2350, (*spvDescriptorSet0.vp_c8)._m0[3].x, _2492);
    float _2708 = _2700 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _2710 = fma(_2352, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2698);
    float _2712 = _2702 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _2714 = _2672 * _2634;
    float _2716 = -_2708;
    float _2718 = fma(_2704, (*spvDescriptorSet0.vp_c15)._m0[21].y, _2716);
    float _2720 = _2710 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2722 = _2712 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _2724 = floor(_2680);
    float _2726 = fma(_2352, (*spvDescriptorSet0.vp_c8)._m0[3].z, _2706);
    float _2728 = _2688 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _2730 = fma(_2720, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2722);
    float _2732 = -_2714;
    float _2734 = fma(_2732, (*spvDescriptorSet0.vp_c15)._m0[21].z, _2718);
    float _2736 = _2726 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _2738 = _2712 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2740 = fma(_2678, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2730);
    float _2742 = exp2(_2728);
    float _2744 = fma(_2734, -0.5, 0.5);
    float _2746 = fma(_2734, 0.5, 0.5);
    float _2748 = fma(_2736, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2740);
    float _2750 = log2(_2694);
    float _2752 = -_2724;
    float _2754 = _2680 + _2752;
    float _2756 = fma(_2720, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2738);
    float _2758 = fma(_2746, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _2760 = fma(_2678, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2756);
    float _2762 = fma(_2746, _2758, -0.212114393711090087890625);
    float _2764 = 1.0 / _2748;
    float _2766 = -_2656;
    float _2768 = _2588 + _2766;
    float _2770 = _2712 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2772 = fma(_2746, _2762, 1.570728778839111328125);
    float _2774 = fma(_2720, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2770);
    float _2776 = _2704 + 1.0;
    float _2778 = sqrt(_2744);
    float _2780 = _2750 * 0.693147182464599609375;
    float _2782 = fma(_2678, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2774);
    float _2784 = -_2704;
    float _2786 = fma(_2742, _2776, _2784);
    float2 _7530 = float2(_2768, _2754);
    float _2788 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_7530, float2(0.0), isnan(_7530)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_7530, float2(0.0), isnan(_7530)), level(0.0)).x;
    float _2790 = _2780 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _2792 = fma(_2736, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2782);
    float _2794 = fma(_2736, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2760);
    float _2796 = fma(_2786, 0.5, 0.5);
    float _2798 = _2792 * _2764;
    float _2800 = _2794 * _2764;
    float _2802 = fma(_2798, 0.5, 0.5);
    float _2804 = fma(_2800, -0.5, 0.5);
    float _2806 = _2778 * 0.636619746685028076171875;
    float3 _7570 = float3(_2802, _2804, _2790);
    float _2808 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_7570, float3(0.0), isnan(_7570)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_7570, float3(0.0), isnan(_7570)), level(0.0)).x;
    float3 _7581 = float3(_2802, _2804, _2790);
    float4 _2811 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_7581, float3(0.0), isnan(_7581)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_7581, float3(0.0), isnan(_7581)), level(0.0)).xyzw;
    float _2813 = _2811.x;
    float _2815 = _2811.y;
    float _2817 = _2811.z;
    float _2819 = _2811.w;
    float _2821 = -_2772;
    float _2823 = fma(_2806, _2821, 1.0);
    float2 _7602 = float2(_2823, _2796);
    float3 _2827 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_7602, float2(0.0), isnan(_7602)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_7602, float2(0.0), isnan(_7602)), level(0.0)).xyz;
    float _2829 = _2827.x;
    float _2831 = _2827.y;
    float _2833 = _2827.z;
    float _2835 = abs(_2364);
    float _2837 = log2(_2835);
    float _2839 = _2096 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2841 = _2096 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2843 = _2096 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2845 = _2074 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2847 = fma(_2078, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2839);
    float _2849 = _2074 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2851 = _2712 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _2853 = _185 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    bool _2855 = _2500 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _2857 = isnan(_2500);
    bool _2859 = _2855 || _2857;
    bool _2861 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _2863 = _2859 || _2861;
    float _2865 = _2837 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _2867 = _2074 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2869 = fma(_2078, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2841);
    float _2871 = fma(_2078, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2843);
    float _2873 = fma(_2108, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2847);
    float _2875 = exp2(_2865);
    float _2877 = -_2058;
    float _2879 = fma(_2877, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2845);
    float _2881 = -_2058;
    float _2883 = fma(_2881, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2849);
    float _2885 = -_2058;
    float _2887 = fma(_2885, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2867);
    float _2889 = _2100 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2891 = _2100 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2893 = _2100 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2895 = fma(_2080, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2883);
    float _2897 = fma(_2084, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2889);
    float _2899 = fma(_2084, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2891);
    float _2901 = fma(_2084, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2893);
    float _2903 = fma(_2080, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2879);
    float _2905 = fma(_2080, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2887);
    float _2907 = fma(_2720, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2851);
    float _2909 = fma(_2116, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2897);
    float _2911 = fma(_2875, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _2913 = precise::clamp(_2911, 0.0, 1.0);
    float _2915 = fma(_2116, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2899);
    float _2917 = fma(_2116, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2901);
    float _2919 = _2853 * _2905;
    float _2921 = fma(_2913, -2.0, 3.0);
    float _2923 = _2913 * _2913;
    float _2925 = fma(_2108, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2869);
    float _2927 = fma(_2108, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2871);
    float _2929 = _2923 * _2921;
    float _2931 = fma(_2678, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2907);
    float _2933 = _181 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _2935 = _2853 * _2903;
    float _2937 = -_2929;
    float _2939 = _2937 + 1.0;
    float _2941 = fma(_2736, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2931);
    float _2943 = _2688 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _2945 = in.m_80.x;
    float _2947 = _2853 * _2895;
    bool _2949 = _2364 <= 8000.0;
    bool _2951 = isnan(_2364);
    bool _2953 = _2949 || _2951;
    bool _2955 = isnan(8000.0);
    bool _2957 = _2953 || _2955;
    float _2959 = float(_2957);
    float _2961 = fma(_2939, (*spvDescriptorSet0.vp_c15)._m0[654].w, _2929);
    float _2963 = _2748 * 0.5;
    float _2965 = exp2(_2943);
    float _2967 = fma(_2933, _2873, _2935);
    float _2969 = _2959 * _2961;
    float _2971 = fma(_2794, -0.5, _2963);
    float _2973 = fma(_2933, _2925, _2947);
    float _2975 = _2909 + _2967;
    float _2977 = _2969 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _2979 = _2941 + _2748;
    float _2981 = _2792 + _2748;
    out.gl_Position.x = _2792;
    out.gl_Position.y = _2794;
    out.gl_Position.z = _2941;
    out.gl_Position.w = _2748;
    float _2983 = _2979 * 0.5;
    float _2985 = _2981 * 0.5;
    float _2987 = fma(_2933, _2927, _2919);
    float _2989 = _2915 + _2973;
    float _2991 = -_2965;
    float _2993 = _2991 + 1.0;
    out.m_82.x = _2985;
    out.m_82.y = _2971;
    out.m_82.z = _2983;
    out.m_82.w = _2748;
    float _2995 = _2917 + _2987;
    float _2997 = _2993 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    out.m_84.x = _2975;
    out.m_84.y = _2989;
    out.m_84.z = _2995;
    float _2999 = -_2997;
    float _3001 = _2999 + 1.0;
    float _3003 = -_2788;
    float _3005 = _3003 + 1.0;
    float _3007 = _3005 * _2977;
    float _3009 = precise::clamp(_3007, 0.0, 1.0);
    float _3011 = -_3009;
    float _3013 = fma(_3011, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _3015 = _3013 * _2945;
    float _3017 = _2997 * _2808;
    float _3019 = _3015 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _3021 = _2819 * _3001;
    float _3023 = _2819 * _3017;
    out.m_86.x = _3019;
    float _3025 = _2833 * _3017;
    float _3027 = fma(_2829, _3023, _2813);
    float _3029 = fma(_2831, _3023, _2815);
    float _3031 = _2418 * _2476;
    float _3033 = fma(_2819, _3025, _2817);
    float _3035 = _2831;
    float _3037 = _2829;
    float _3039 = _2819;
    float _3041 = _2817;
    float _3043 = _2815;
    float _3045 = _3031;
    if (!_2863)
    {
        _3035 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _3047 = _3035;
    float _3049 = _3031 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _3051 = _3047;
    float _3053 = _3047;
    if (!_2863)
    {
        _3037 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _3055 = _3037;
    out.m_88.x = _3027;
    out.m_88.y = _3029;
    out.m_88.z = _3033;
    out.m_88.w = _3021;
    float _3057 = _3055;
    float _3059 = _3055;
    if (!_2863)
    {
        _3039 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _3061 = _3039;
    float _3063 = _3061;
    float _3065 = _3061;
    if (!_2863)
    {
        _3041 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _3067 = _3041;
    float _3069 = _3067;
    float _3071 = _3067;
    if (!_2863)
    {
        _3043 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _3073 = _3043;
    float _3075 = _3073;
    float _3077 = _3073;
    if (!_2863)
    {
        _3045 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _3079 = _3045;
    bool _3081 = !_2863;
    float _3083 = _3079;
    float _3085 = _3079;
    if (!_3081)
    {
        bool _3087 = _2500 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _3089 = isnan(_2500);
        bool _3091 = _3087 || _3089;
        bool _3093 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _3095 = _3091 || _3093;
        if (!_3095)
        {
            float _3097 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _3099 = _2500 + _3097;
            float _3101 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _3103 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _3101;
            float _3105 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _3107 = _3105 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _3109 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _3111 = _3109 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _3113 = 1.0 / _3103;
            float _3115 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _3117 = _3115 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _3119 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _3121 = _3119 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _3123 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _3125 = _3123 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _3127 = _3099 * _3113;
            float _3129 = precise::clamp(_3127, 0.0, 1.0);
            float _3131 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _3133 = _3131 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _3135 = fma(_3129, _3107, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _3137 = fma(_3129, _3111, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _3139 = fma(_3129, _3117, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _3141 = fma(_3129, _3133, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _3143 = fma(_3129, _3121, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _3145 = fma(_3129, _3125, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _3059 = _3139;
            _3077 = _3135;
            _3053 = _3137;
            _3071 = _3143;
            _3065 = _3141;
            _3085 = _3145;
            _3147 = true;
        }
        else
        {
            bool _3149 = _2500 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _3151 = isnan(_2500);
            bool _3153 = _3149 || _3151;
            bool _3155 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _3157 = _3153 || _3155;
            if (!_3157)
            {
                _3051 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _3159 = _3051;
            _3053 = _3159;
            if (!_3157)
            {
                _3057 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _3161 = _3057;
            _3059 = _3161;
            if (!_3157)
            {
                _3063 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _3163 = _3063;
            _3065 = _3163;
            if (!_3157)
            {
                _3069 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _3165 = _3069;
            _3071 = _3165;
            if (!_3157)
            {
                _3075 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _3167 = _3075;
            _3077 = _3167;
            if (!_3157)
            {
                _3083 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _3169 = _3083;
            bool _3171 = !_3157;
            _3085 = _3169;
            if (!_3171)
            {
                bool _3173 = _2500 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _3175 = isnan(_2500);
                bool _3177 = _3173 || _3175;
                bool _3179 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _3181 = _3177 || _3179;
                if (!_3181)
                {
                    float _3183 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _3185 = _2500 + _3183;
                    float _3187 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _3189 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _3187;
                    float _3191 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _3193 = _3191 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _3195 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _3197 = _3195 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _3199 = 1.0 / _3189;
                    float _3201 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _3203 = _3201 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _3205 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _3207 = _3205 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _3209 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _3211 = _3209 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _3213 = _3185 * _3199;
                    float _3215 = precise::clamp(_3213, 0.0, 1.0);
                    float _3217 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _3219 = _3217 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _3221 = fma(_3215, _3193, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _3223 = fma(_3215, _3197, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _3225 = fma(_3215, _3203, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _3227 = fma(_3215, _3219, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _3229 = fma(_3215, _3207, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _3231 = fma(_3215, _3211, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _3059 = _3225;
                    _3077 = _3221;
                    _3053 = _3223;
                    _3071 = _3229;
                    _3065 = _3227;
                    _3085 = _3231;
                    _3147 = true;
                }
                else
                {
                    _3059 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _3077 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _3053 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _3071 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _3065 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _3085 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _3147 = false;
    float _3233 = _3059;
    float _3235 = _3077;
    float _3237 = _3053;
    float _3239 = _3071;
    float _3241 = _3065;
    float _3243 = _3085;
    float _3245 = fma(_2989, -0.5, 0.5);
    float _3247 = precise::clamp(_3245, 0.0, 1.0);
    float _3249 = -_3233;
    float _3251 = _3249 + _3235;
    float _3253 = -_3237;
    float _3255 = _3253 + _3239;
    out.m_90.x = 0.0;
    float _3257 = -_3241;
    float _3259 = _3257 + _3243;
    float _3261 = fma(_3247, _3251, _3233);
    float _3263 = fma(_3247, _3255, _3237);
    bool _3265 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _3267 = _3261 * 0.586610972881317138671875;
    float _3269 = fma(_3247, _3259, _3241);
    float _3271 = _3049 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _3273 = fma(_3263, 0.298911988735198974609375, _3267);
    bool _3275 = _2418 > 0.0;
    bool _3277 = isnan(_2418);
    bool _3279 = _3275 || _3277;
    bool _3281 = isnan(0.0);
    bool _3283 = _3279 || _3281;
    float _3285 = fma(_3269, 0.114477999508380889892578125, _3273);
    out.m_49.x = _3271;
    bool _3287 = _2476 <= 0.0;
    bool _3289 = !_3283;
    bool _3291 = _3287 || _3289;
    float _3293 = -_3285;
    float _3295 = _3263 + _3293;
    float _3297 = -_3285;
    float _3299 = _3269 + _3297;
    float _3301 = fma(_3295, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3285);
    float _3303 = -_3285;
    float _3305 = _3261 + _3303;
    float _3307 = fma(_3305, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3285);
    float _3309 = fma(_3299, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3285);
    bool _3311 = !_3265;
    if (!_3311)
    {
        float _3313 = -_2348;
        float _3315 = _3313 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _3317 = -_2350;
        float _3319 = _3317 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _3321 = -_2352;
        float _3323 = _3321 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _3325 = _3315 * _3315;
        float _3327 = fma(_3319, _3319, _3325);
        float _3329 = fma(_3323, _3323, _3327);
        float _3331 = sqrt(_3329);
        float _3333 = rsqrt(_3329);
        float _3335 = -_3331;
        float _3337 = _3335 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _3339 = _3337 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _3341 = precise::clamp(_3339, 0.0, 1.0);
        float _3343 = _3319 * _3333;
        float _3345 = _3315 * _3333;
        float _3347 = abs(_3341);
        float _3349 = log2(_3347);
        float _3351 = _3323 * _3333;
        float _3353 = _3343 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _3355 = _2989 * _3345;
        float _3357 = -_3345;
        float _3359 = -_3353;
        float _3361 = fma(_3357, (*spvDescriptorSet0.vp_c15)._m0[656].y, _3359);
        float _3363 = fma(_2975, _3343, _3355);
        float _3365 = -_3351;
        float _3367 = fma(_3365, (*spvDescriptorSet0.vp_c15)._m0[656].z, _3361);
        float _3369 = fma(_2995, _3351, _3363);
        float _3371 = precise::clamp(_3369, 0.0, 1.0);
        float _3373 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _3375 = _3367 + _3373;
        float _3377 = _3349 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _3379 = _3375 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _3381 = precise::clamp(_3379, 0.0, 1.0);
        float _3383 = exp2(_3377);
        float _3385 = _3383 * _3381;
        float _3387 = _3371 * _3385;
        float _3389 = _3387 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _3391 = _3387 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _3393 = _3387 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_90.x = _3389;
        out.m_90.y = _3391;
        out.m_90.z = _3393;
    }
    out.m_92.x = _3301;
    out.m_92.y = _3307;
    out.m_92.z = _3309;
    if (!_3291)
    {
        return out;
    }
    float _3395 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.m_49.x = 0.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _3395;
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
    out.m_60 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_68 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_49 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_92 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_70 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_74 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_82 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_72 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_78 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_84 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_90 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_86 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_88 = float4(0.0, 0.0, 0.0, 1.0);
    bool _3147 = false;
    bool _431 = false;
    bool _309 = false;
    bool _207 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _106 = in.m_46.w;
    float _108 = trunc(_106);
    int _111 = int(_108);
    bool _115 = _111 >= 1;
    float _117 = 0.0;
    if (!_115)
    {
        _117 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _119 = _117;
    float _121 = _119;
    if (!_115)
    {
        out.m_49.x = 0.0;
    }
    int _123 = 0;
    if (!_115)
    {
        float _125 = _119 * 5.0;
        _123 = as_type<int>(_125);
    }
    int _127 = _123;
    int _129 = _127;
    if (!_115)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3452 = as_type<float>(_127);
        out.gl_Position.z = _3452;
    }
    if (!_115)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_60.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_60.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_60.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_60.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_49.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_49.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_49.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_49.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_92.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_92.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_92.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_92.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_90.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_90.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_90.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_90.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_88.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_88.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_88.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_88.w)); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _131 = in.m_51.w;
    bool _133 = _131 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _135 = isnan(_131);
    bool _137 = _133 || _135;
    bool _139 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _141 = _137 || _139;
    float _143 = -_131;
    float _145 = _143 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _147 = _145;
    if (_141)
    {
        float _149 = float(_111);
        _121 = _149;
    }
    float _151 = _121;
    bool _153 = _145 >= _151;
    bool _155 = !_141;
    bool _157 = _153 || _155;
    float _159 = _151;
    if (_157)
    {
        _159 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _161 = _159;
    if (_157)
    {
        out.m_49.x = 0.0;
    }
    if (_157)
    {
        float _163 = _161 * 5.0;
        _129 = as_type<int>(_163);
    }
    int _165 = _129;
    if (_157)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3522 = as_type<float>(_165);
        out.gl_Position.z = _3522;
    }
    if (_157)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_60.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_60.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_60.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_60.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_49.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_49.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_49.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_49.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_92.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_92.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_92.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_92.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_90.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_90.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_90.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_90.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_88.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_88.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_88.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_88.w)); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _167 = as_type<float>(int(gl_VertexIndex));
    bool _169 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    int _171 = as_type<int>(_167) & 1;
    bool _173 = _171 != 0;
    int _175 = as_type<int>(_167) & 2;
    bool _177 = _175 != 0;
    bool _179 = !_173;
    float _181 = _179 ? (-0.5) : 0.5;
    bool _183 = !_177;
    float _185 = _183 ? (-0.5) : 0.5;
    bool _187 = !_169;
    float _205;
    if (!_187)
    {
        float _189 = in.m_56.x;
        float _191 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _193 = _189 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _195 = fma(_193, (*spvDescriptorSet0.vp_c9)._m0[12].x, _145);
        float _197 = _195 * _191;
        float _199 = floor(_197);
        float _201 = -_199;
        float _203 = _197 + _201;
        _205 = _203;
        _207 = true;
    }
    else
    {
        float _209 = float(_111);
        float _211 = 1.0 / _209;
        float _213 = _145 * _211;
        _205 = _213;
    }
    _207 = false;
    float _215 = _205;
    float _217 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _219 = _215 + _217;
    bool _221 = _215 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _223 = isnan(_215);
    bool _225 = _221 || _223;
    bool _227 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _229 = _225 || _227;
    float _231 = float(_229);
    float _233 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _235 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _233;
    float _237 = -_231;
    float _239 = _237 + 1.0;
    bool _241 = _215 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _243 = isnan(_215);
    bool _245 = _241 || _243;
    bool _247 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _249 = _245 || _247;
    float _251 = float(_249);
    float _253 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _255 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _253;
    bool _257 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _259 = 1.0 / _235;
    float _261 = _251 * _239;
    float _263 = -_251;
    float _265 = _263 + 1.0;
    float _267 = _219 * _259;
    float _269 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _271 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _269;
    float _273 = fma(_255, _267, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _275 = fma(_271, _267, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _277 = _273 * _261;
    float _279 = _275 * _261;
    float _281 = fma(_265, (*spvDescriptorSet0.vp_c9)._m0[143].x, _277);
    float _283 = fma(_265, (*spvDescriptorSet0.vp_c9)._m0[143].y, _279);
    float _285 = fma(_231, (*spvDescriptorSet0.vp_c9)._m0[144].x, _281);
    float _287 = fma(_231, (*spvDescriptorSet0.vp_c9)._m0[144].y, _283);
    bool _289 = !_257;
    float _307;
    if (!_289)
    {
        float _291 = in.m_56.x;
        float _293 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _295 = _291 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _297 = fma(_295, (*spvDescriptorSet0.vp_c9)._m0[11].y, _145);
        float _299 = _297 * _293;
        float _301 = floor(_299);
        float _303 = -_301;
        float _305 = _299 + _303;
        _307 = _305;
        _309 = true;
    }
    else
    {
        float _311 = float(_111);
        float _313 = 1.0 / _311;
        float _315 = _145 * _313;
        _307 = _315;
    }
    _309 = false;
    float _317 = _307;
    bool _319 = _317 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _321 = isnan(_317);
    bool _323 = _319 || _321;
    bool _325 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _327 = _323 || _325;
    float _329 = float(_327);
    float _331 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _333 = _331 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _335 = _317 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _337 = isnan(_317);
    bool _339 = _335 || _337;
    bool _341 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _343 = _339 || _341;
    float _345 = float(_343);
    float _347 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _349 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _347;
    float _351 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _353 = _317 + _351;
    float _355 = -_329;
    float _357 = _355 + 1.0;
    bool _359 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _361 = 1.0 / _333;
    float _363 = _345 * _357;
    float _365 = -_345;
    float _367 = _365 + 1.0;
    float _369 = _349 * _361;
    float _371 = fma(_369, _353, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _373 = _371 * _363;
    float _375 = fma(_367, (*spvDescriptorSet0.vp_c9)._m0[115].x, _373);
    float _377 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _379 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _381 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _383 = fma(_329, (*spvDescriptorSet0.vp_c9)._m0[116].x, _375);
    float _385 = _377 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _387 = _379 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _389 = _381 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _391 = _383 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _393 = in.m_58.x;
    float _395 = in.m_58.y;
    out.m_60.x = _385;
    out.m_60.y = _387;
    out.m_60.z = _389;
    out.m_60.w = _391;
    float _397 = _287 * _395;
    float _399 = _285 * _393;
    bool _401 = !_359;
    float _425;
    float _427;
    float _429;
    if (!_401)
    {
        float _403 = in.m_56.x;
        float _405 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _407 = float(_111);
        float _409 = 1.0 / _407;
        float _411 = _403 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _413 = _145 * _409;
        float _415 = fma(_411, (*spvDescriptorSet0.vp_c9)._m0[11].w, _145);
        float _417 = _415 * _405;
        float _419 = floor(_417);
        float _421 = -_419;
        float _423 = _417 + _421;
        _425 = _413;
        _427 = _407;
        _429 = _423;
        _431 = true;
    }
    else
    {
        float _433 = float(_111);
        float _435 = 1.0 / _433;
        float _437 = _145 * _435;
        _425 = _437;
        _427 = _433;
        _429 = _437;
    }
    _431 = false;
    float _439 = _425;
    float _441 = _427;
    float _443 = _429;
    float _445 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].y);
    int _447 = int(_445);
    float _449 = in.m_56.x;
    int _451 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _453 = _451 != 0;
    float _455 = in.m_56.z;
    float _457 = in.m_56.w;
    float _459 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].x);
    int _461 = int(_459);
    int _463 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8192;
    bool _465 = _463 != 0;
    float _467 = in.m_62.x;
    float _469 = in.m_62.y;
    float _471 = in.m_62.z;
    float _473 = in.m_62.w;
    float _475 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _477 = log2(_475);
    float _479 = float(_447);
    float _481 = 0.0;
    if (!_453)
    {
        float _483 = in.m_56.y;
        _481 = _483;
    }
    float _485 = _481;
    float _487 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _489 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _491 = 0.0;
    if (!_453)
    {
        float _493 = in.m_56.z;
        _491 = _493;
    }
    float _495 = _491;
    float _497 = 1.0 / _479;
    float _499 = float(uint(_461));
    float _501 = _449 * 2.0;
    int _503 = ~_461;
    int _505 = _503 + 1;
    float _507 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    bool _509 = _461 == 0;
    float _511 = (*spvDescriptorSet0.vp_c9)._m0[88].z + (*spvDescriptorSet0.vp_c9)._m0[88].x;
    float _513 = 0.0;
    if (_453)
    {
        _513 = _449;
    }
    float _515 = _513;
    float _517 = 1.0 / _499;
    float _519 = _477 * _145;
    float _521 = _515;
    if (!_453)
    {
        _521 = _455;
    }
    float _523 = _521;
    float _525 = fma(_449, (*spvDescriptorSet0.vp_c9)._m0[88].z, _511);
    float _527 = _497 * _145;
    int _529 = ~_461;
    int _531 = _529 + 1;
    float _533 = exp2(_519);
    float _535 = 0.0;
    float _537 = _495;
    if (!_453)
    {
        _535 = _485;
    }
    float _539 = _535;
    float _541 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _543 = _541 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _545 = -(*spvDescriptorSet0.vp_c9)._m0[151].w;
    float _547 = _545 + (*spvDescriptorSet0.vp_c9)._m0[152].w;
    float _549 = 0.0;
    float _551 = _539;
    if (!_453)
    {
        _549 = _495;
    }
    float _553 = _549;
    int _555 = as_type<int>(_517) + (-2);
    float _557 = trunc(_527);
    int _559 = int(_557);
    float _561 = 0.0;
    float _563 = _553;
    if (!_453)
    {
        _561 = _539;
    }
    float _565 = _561;
    bool _567 = _439 >= (*spvDescriptorSet0.vp_c9)._m0[153].w;
    bool _569 = isnan(_439);
    bool _571 = _567 || _569;
    bool _573 = isnan((*spvDescriptorSet0.vp_c9)._m0[153].w);
    bool _575 = _571 || _573;
    float _577 = float(_575);
    float _579 = _565;
    float _581 = _485;
    if (_453)
    {
        float _583 = in.m_56.x;
        float _585 = in.m_56.y;
        _579 = _583;
        _581 = _585;
    }
    float _587 = _579;
    float _589 = _581;
    float _591 = -_533;
    float _593 = _591 + 1.0;
    float _595 = floor(_501);
    float _597 = -(*spvDescriptorSet0.vp_c9)._m0[155].w;
    float _599 = _597 + (*spvDescriptorSet0.vp_c9)._m0[156].w;
    bool _601 = _439 >= (*spvDescriptorSet0.vp_c9)._m0[152].w;
    bool _603 = isnan(_439);
    bool _605 = _601 || _603;
    bool _607 = isnan((*spvDescriptorSet0.vp_c9)._m0[152].w);
    bool _609 = _605 || _607;
    float _611 = float(_609);
    float _613 = float(uint(_559));
    float _615 = 1.0 / _543;
    float _617 = float(_559);
    float _619 = as_type<float>(_555) * _613;
    float _621 = trunc(_619);
    float _623 = precise::max(_621, 0.0);
    uint _626 = uint(_623);
    if (_453)
    {
        _551 = _589;
    }
    float _628 = _551;
    float _630 = 1.0 / _547;
    float _632 = float(_461);
    float _634 = _628;
    if (_453)
    {
        _563 = _628;
    }
    float _636 = _563;
    bool _638 = _617 >= _632;
    bool _640 = isnan(_617);
    bool _642 = _638 || _640;
    bool _644 = isnan(_632);
    bool _646 = _642 || _644;
    float _648 = float(_646);
    bool _650 = !_453;
    float _652 = _650 ? _589 : _449;
    int _654 = _531 * int(_626);
    int _656 = _654 + _559;
    if (_453)
    {
        _537 = _628;
    }
    float _658 = _537;
    float _660 = trunc(_648);
    int _662 = int(_660);
    if (!_453)
    {
        _634 = _449;
    }
    float _664 = _634;
    float _666 = float(uint(_656));
    float _668 = fma(_658, (*spvDescriptorSet0.vp_c9)._m0[83].w, _507);
    float _670 = as_type<float>(_555) * _666;
    bool _672 = !_453;
    float _674 = _672 ? 1.2345600128173828125 : 1.0;
    float _676 = trunc(_670);
    float _678 = precise::max(_676, 0.0);
    uint _680 = uint(_678);
    float _682 = _674 * _652;
    float _684 = floor(_682);
    int _686 = int(_626) + int(_680);
    int _688 = ~_662;
    int _690 = _688 + 1;
    int _692 = _690 + 1;
    int _694 = _505 * _686;
    int _696 = _694 + _559;
    float _698 = -_684;
    float _700 = _682 + _698;
    bool _702 = uint(_696) >= uint(_461);
    float _704 = _632 * _700;
    float _706 = 1.0 / _441;
    float _708 = _632 * _145;
    bool _710 = !_702;
    int _712 = _710 ? 0 : (-1);
    int _714 = ~_686;
    int _716 = _714 + _712;
    int _718 = _716 + 1;
    float _720 = trunc(_704);
    int _722 = int(_720);
    int _724 = _461 * _718;
    int _726 = _724 + _559;
    bool _728 = !_509;
    int _730 = _728 ? _726 : (-1);
    float _732 = _708 * _706;
    int _734 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 256;
    bool _736 = _734 != 0;
    int _738 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 512;
    bool _740 = _738 != 0;
    int _742 = _461 + (-1);
    int _744 = _730 * _692;
    bool _746 = !_465;
    int _748 = _746 ? 0 : 1;
    float _750 = trunc(_732);
    int _752 = int(_750);
    int _754 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1024;
    bool _756 = _754 != 0;
    int _758 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2048;
    bool _760 = _758 != 0;
    int _762 = _662 * _742;
    int _764 = _762 + _744;
    bool _766 = !_740;
    int _768 = _766 ? 0 : 1;
    bool _770 = !_736;
    int _772 = _770 ? 0 : 1;
    int _774 = abs(_748);
    int _776 = abs(_768);
    bool _778 = !_756;
    int _780 = _778 ? 0 : 1;
    int _782 = abs(_772);
    bool _784 = !_760;
    int _786 = _784 ? 0 : 1;
    int _788 = abs(_780);
    int _790 = _764 * _776;
    int _792 = ~_461;
    int _794 = _792 + 1;
    int _796 = _722 * _774;
    int _798 = _796 + _559;
    int _800 = abs(_786);
    int _802 = _752 * _782;
    int _804 = _802 + _790;
    bool _806 = _457 > 0.5;
    float _808 = in.m_64.x;
    float _810 = in.m_64.y;
    float _812 = in.m_64.z;
    float _814 = in.m_64.w;
    int _816 = _798 * _788;
    int _818 = _816 + _804;
    int _820 = ~_461;
    int _822 = _820 + 1;
    float _824 = -_185;
    int _826 = _806 ? as_type<int>(_824) : as_type<int>(_185);
    int _828 = _722 * _800;
    int _830 = _828 + _818;
    float _832 = float(uint(_830));
    float _834 = as_type<float>(_555) * _832;
    float _836 = trunc(_834);
    float _838 = precise::max(_836, 0.0);
    uint _840 = uint(_838);
    int _842 = _822 * int(_840);
    int _844 = _842 + _830;
    float _846 = float(uint(_844));
    float _848 = as_type<float>(_555) * _846;
    float _850 = trunc(_848);
    float _852 = precise::max(_850, 0.0);
    uint _854 = uint(_852);
    int _856 = int(_840) + int(_854);
    int _858 = _794 * _856;
    int _860 = _858 + _830;
    bool _862 = uint(_860) >= uint(_461);
    bool _864 = !_862;
    int _866 = _864 ? 0 : (-1);
    int _868 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _870 = _868 != 0;
    int _872 = ~_856;
    int _874 = _872 + _866;
    int _876 = _874 + 1;
    int _878 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16;
    bool _880 = _878 != 0;
    int _882 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32;
    bool _884 = _882 != 0;
    float _886 = in.m_46.x;
    float _888 = in.m_46.y;
    float _890 = in.m_46.z;
    bool _892 = _455 > 0.5;
    int _894 = _461 * _876;
    int _896 = _894 + _830;
    bool _898 = _461 == 0;
    float _900 = in.m_66.x;
    float _902 = in.m_66.y;
    float _904 = in.m_66.z;
    float _906 = in.m_66.w;
    float _908 = -_185;
    int _910 = _892 ? as_type<int>(_908) : as_type<int>(_185);
    bool _912 = !_870;
    float _914 = _912 ? _185 : as_type<float>(_826);
    bool _916 = !_884;
    float _918 = _916 ? _185 : as_type<float>(_910);
    bool _920 = !_898;
    int _922 = _920 ? _896 : (-1);
    float _924 = -_181;
    int _926 = _892 ? as_type<int>(_924) : as_type<int>(_181);
    int _928 = _922 & 3;
    bool _930 = _928 != 0;
    int _932 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _934 = _932 != 0;
    bool _936 = uint(_928) > 1u;
    bool _938 = !_934;
    float _940 = _938 ? _181 : as_type<float>(_926);
    int _942 = _922 & 3;
    bool _944 = _942 != 0;
    float _946 = _888 * _469;
    int _948 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4194304;
    bool _950 = _948 != 0;
    float _952 = _888 * _810;
    int _954 = _944 ? 0 : 1;
    float _956 = _888 * _902;
    int _958 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _960 = _958 != 0;
    float _962 = fma(_886, _467, _946);
    int _964 = ~_954;
    int _966 = _964 + 1;
    int _968 = _966 + 1;
    float _970 = fma(_886, _808, _952);
    int _972 = _968;
    if (!_936)
    {
        int _974 = ~_954;
        int _976 = _974 + 1;
        _972 = _976;
    }
    int _978 = _972;
    bool _980 = uint(_928) >= 2u;
    int _982 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _984 = _982 != 0;
    int _986 = _980 ? 0 : 1;
    bool _988 = _928 != 3;
    float _990 = (*spvDescriptorSet0.vp_c9)._m0[87].x + (*spvDescriptorSet0.vp_c9)._m0[86].z;
    float _992 = _523 * (*spvDescriptorSet0.vp_c9)._m0[87].x;
    int _994 = ~_986;
    int _996 = _994 + 1;
    int _998 = _996 + 1;
    float _1000 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _1002 = -(*spvDescriptorSet0.vp_c9)._m0[152].w;
    float _1004 = _1002 + (*spvDescriptorSet0.vp_c9)._m0[153].w;
    float _1006 = -_990;
    float _1008 = fma(_992, 2.0, _1006);
    int _1010 = _998;
    if (_988)
    {
        int _1012 = ~_986;
        int _1014 = _1012 + 1;
        _1010 = _1014;
    }
    int _1016 = _1010;
    float _1018 = fma(_587, (*spvDescriptorSet0.vp_c9)._m0[83].z, _1000);
    bool _1020 = _449 > 0.5;
    float _1022 = _587 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _1024 = -_145;
    float _1026 = fma(_1024, (*spvDescriptorSet0.vp_c9)._m0[86].x, _1008);
    float _1028 = -_181;
    int _1030 = _1020 ? as_type<int>(_1028) : as_type<int>(_181);
    float _1032 = -_487;
    float _1034 = fma(_1022, 2.0, _1032);
    bool _1036 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1038 = isnan(0.0);
    bool _1040 = _1036 || _1038;
    bool _1042 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1044 = _1040 || _1042;
    float _1046 = _636 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _1048 = (*spvDescriptorSet0.vp_c9)._m0[87].y + (*spvDescriptorSet0.vp_c9)._m0[86].w;
    float _1050 = _1044 ? _593 : 0.0;
    float _1052 = fma(_1046, -2.0, _489);
    bool _1054 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1056 = isnan(1.0);
    bool _1058 = _1054 || _1056;
    bool _1060 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1062 = _1058 || _1060;
    float _1064 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _1066 = 1.0 + _1064;
    float _1068 = _664 * (*spvDescriptorSet0.vp_c9)._m0[87].y;
    float _1070 = fma(_145, (*spvDescriptorSet0.vp_c9)._m0[82].w, _668);
    float _1072 = fma(_886, _900, _956);
    float _1074 = _589 * 2.0;
    float _1076 = fma(_1068, -2.0, _1048);
    float _1078 = 1.0 / _1066;
    float _1080 = (*spvDescriptorSet0.vp_c9)._m0[88].w + (*spvDescriptorSet0.vp_c9)._m0[88].y;
    float _1082 = -(*spvDescriptorSet0.vp_c9)._m0[154].w;
    float _1084 = _1082 + (*spvDescriptorSet0.vp_c9)._m0[155].w;
    float _1086 = fma(_145, (*spvDescriptorSet0.vp_c9)._m0[82].z, _1018);
    float _1088 = -_145;
    float _1090 = fma(_1088, (*spvDescriptorSet0.vp_c9)._m0[81].x, _1034);
    float _1092 = fma(_589, (*spvDescriptorSet0.vp_c9)._m0[88].w, _1080);
    float _1094 = fma(_145, (*spvDescriptorSet0.vp_c9)._m0[87].z, _525);
    float _1096 = fma(_145, (*spvDescriptorSet0.vp_c9)._m0[81].y, _1052);
    float _1098 = fma(_145, (*spvDescriptorSet0.vp_c9)._m0[86].y, _1076);
    float _1100 = fma(_145, (*spvDescriptorSet0.vp_c9)._m0[87].w, _1092);
    float _1102 = floor(_1074);
    float _1104 = fma(_890, _904, _1072);
    float _1106 = -_577;
    float _1108 = _1106 + 1.0;
    if (_1062)
    {
        float _1110 = _1050 * _1078;
        _147 = _1110;
    }
    float _1112 = _147;
    bool _1114 = _595 >= 0.0;
    bool _1116 = isnan(_595);
    bool _1118 = _1114 || _1116;
    bool _1120 = isnan(0.0);
    bool _1122 = _1118 || _1120;
    float _1124 = -(*spvDescriptorSet0.vp_c9)._m0[156].w;
    float _1126 = _1124 + (*spvDescriptorSet0.vp_c9)._m0[157].w;
    float _1128 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _1130 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _1128;
    float _1132 = fma(_890, _471, _962);
    int _1134 = _1122 ? 0 : 1;
    float _1136 = -(*spvDescriptorSet0.vp_c9)._m0[153].w;
    float _1138 = _1136 + (*spvDescriptorSet0.vp_c9)._m0[154].w;
    bool _1140 = _595 > 0.0;
    float _1142 = _1130 * _615;
    float _1144 = _455 * 2.0;
    float _1146 = 1.0 / _599;
    int _1148 = ~_1134;
    int _1150 = _1148 + 1;
    int _1152 = _1150 + 1;
    float _1154 = fma(_890, _812, _970);
    float _1156 = -(*spvDescriptorSet0.vp_c9)._m0[152].x;
    float _1158 = _1156 + (*spvDescriptorSet0.vp_c9)._m0[153].x;
    float _1160 = _1132 + _473;
    float _1162 = float(uint(_798));
    float _1164 = 1.0 / _1138;
    int _1166 = _1152;
    if (!_1140)
    {
        int _1168 = ~_1134;
        int _1170 = _1168 + 1;
        _1166 = _1170;
    }
    int _1172 = _1166;
    float _1174 = -(*spvDescriptorSet0.vp_c9)._m0[151].x;
    float _1176 = (*spvDescriptorSet0.vp_c9)._m0[152].x + _1174;
    bool _1178 = _1102 >= 0.0;
    bool _1180 = isnan(_1102);
    bool _1182 = _1178 || _1180;
    bool _1184 = isnan(0.0);
    bool _1186 = _1182 || _1184;
    float _1188 = -(*spvDescriptorSet0.vp_c9)._m0[155].x;
    float _1190 = (*spvDescriptorSet0.vp_c9)._m0[156].x + _1188;
    float _1192 = _1176 * _630;
    int _1194 = _1186 ? 0 : 1;
    float _1196 = 1.0 / _1084;
    bool _1198 = _1102 > 0.0;
    float _1200 = -(*spvDescriptorSet0.vp_c9)._m0[153].x;
    float _1202 = (*spvDescriptorSet0.vp_c9)._m0[154].x + _1200;
    float _1204 = -(*spvDescriptorSet0.vp_c9)._m0[154].x;
    float _1206 = _1204 + (*spvDescriptorSet0.vp_c9)._m0[155].x;
    float _1208 = -(*spvDescriptorSet0.vp_c9)._m0[156].x;
    float _1210 = _1208 + (*spvDescriptorSet0.vp_c9)._m0[157].x;
    float _1212 = -(*spvDescriptorSet0.vp_c9)._m0[157].w;
    float _1214 = _1212 + (*spvDescriptorSet0.vp_c9)._m0[158].w;
    int _1216 = ~_1194;
    int _1218 = _1216 + 1;
    int _1220 = _1218 + 1;
    float _1222 = as_type<float>(_555) * _1162;
    float _1224 = 1.0 / _1126;
    float _1226 = _1202 * _1164;
    int _1228 = abs(_978);
    float _1230 = -_1094;
    float _1232 = _1230 + 1.0;
    float _1234 = float(_1172);
    int _1236 = _1220;
    if (!_1198)
    {
        int _1238 = ~_1194;
        int _1240 = _1238 + 1;
        _1236 = _1240;
    }
    int _1242 = _1236;
    float _1244 = floor(_1144);
    float _1246 = _1206 * _1196;
    float _1248 = -(*spvDescriptorSet0.vp_c9)._m0[151].w;
    float _1250 = _439 + _1248;
    float _1252 = _1190 * _1146;
    bool _1254 = _439 >= (*spvDescriptorSet0.vp_c9)._m0[158].w;
    bool _1256 = isnan(_439);
    bool _1258 = _1254 || _1256;
    bool _1260 = isnan((*spvDescriptorSet0.vp_c9)._m0[158].w);
    bool _1262 = _1258 || _1260;
    float _1264 = float(_1262);
    float _1266 = fma(_1192, _1250, (*spvDescriptorSet0.vp_c9)._m0[151].x);
    float _1268 = -(*spvDescriptorSet0.vp_c9)._m0[152].w;
    float _1270 = _439 + _1268;
    float _1272 = 1.0 / _1004;
    float _1274 = _1210 * _1224;
    float _1276 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _1278 = _443 + _1276;
    float _1280 = -_1264;
    float _1282 = _1280 + 1.0;
    float _1284 = fma(_1142, _1278, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    float _1286 = -(*spvDescriptorSet0.vp_c9)._m0[153].w;
    float _1288 = _439 + _1286;
    bool _1290 = _1244 >= 0.0;
    bool _1292 = isnan(_1244);
    bool _1294 = _1290 || _1292;
    bool _1296 = isnan(0.0);
    bool _1298 = _1294 || _1296;
    float _1300 = 1.0 / _1214;
    float _1302 = -(*spvDescriptorSet0.vp_c9)._m0[154].w;
    float _1304 = _439 + _1302;
    int _1306 = _1298 ? 0 : 1;
    bool _1308 = _1244 > 0.0;
    float _1310 = fma(_1246, _1304, (*spvDescriptorSet0.vp_c9)._m0[154].x);
    float _1312 = _1158 * _1272;
    bool _1314 = _439 >= (*spvDescriptorSet0.vp_c9)._m0[157].w;
    bool _1316 = isnan(_439);
    bool _1318 = _1314 || _1316;
    bool _1320 = isnan((*spvDescriptorSet0.vp_c9)._m0[157].w);
    bool _1322 = _1318 || _1320;
    float _1324 = float(_1322);
    bool _1326 = _439 >= (*spvDescriptorSet0.vp_c9)._m0[156].w;
    bool _1328 = isnan(_439);
    bool _1330 = _1326 || _1328;
    bool _1332 = isnan((*spvDescriptorSet0.vp_c9)._m0[156].w);
    bool _1334 = _1330 || _1332;
    float _1336 = float(_1334);
    float _1338 = fma(_1312, _1270, (*spvDescriptorSet0.vp_c9)._m0[152].x);
    float _1340 = fma(_1226, _1288, (*spvDescriptorSet0.vp_c9)._m0[153].x);
    float _1342 = -(*spvDescriptorSet0.vp_c9)._m0[155].w;
    float _1344 = _439 + _1342;
    float _1346 = -_1324;
    float _1348 = _1346 + 1.0;
    float _1350 = _1324 * _1282;
    float _1352 = fma(_1252, _1344, (*spvDescriptorSet0.vp_c9)._m0[155].x);
    bool _1354 = _439 >= (*spvDescriptorSet0.vp_c9)._m0[155].w;
    bool _1356 = isnan(_439);
    bool _1358 = _1354 || _1356;
    bool _1360 = isnan((*spvDescriptorSet0.vp_c9)._m0[155].w);
    bool _1362 = _1358 || _1360;
    float _1364 = float(_1362);
    float _1366 = _1336 * _1348;
    float _1368 = -(*spvDescriptorSet0.vp_c9)._m0[157].x;
    float _1370 = (*spvDescriptorSet0.vp_c9)._m0[158].x + _1368;
    float _1372 = -_1336;
    float _1374 = _1372 + 1.0;
    bool _1376 = _439 >= (*spvDescriptorSet0.vp_c9)._m0[154].w;
    bool _1378 = isnan(_439);
    bool _1380 = _1376 || _1378;
    bool _1382 = isnan((*spvDescriptorSet0.vp_c9)._m0[154].w);
    bool _1384 = _1380 || _1382;
    float _1386 = float(_1384);
    float _1388 = _1370 * _1300;
    float _1390 = _1364 * _1374;
    float _1392 = -(*spvDescriptorSet0.vp_c9)._m0[156].w;
    float _1394 = _439 + _1392;
    float _1396 = -_1364;
    float _1398 = _1396 + 1.0;
    float _1400 = -_1386;
    float _1402 = _1400 + 1.0;
    float _1404 = fma(_1274, _1394, (*spvDescriptorSet0.vp_c9)._m0[156].x);
    float _1406 = _1386 * _1398;
    float _1408 = -(*spvDescriptorSet0.vp_c9)._m0[157].w;
    float _1410 = _439 + _1408;
    float _1412 = trunc(_1222);
    float _1414 = precise::max(_1412, 0.0);
    uint _1416 = uint(_1414);
    bool _1418 = _443 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _1420 = isnan(_443);
    bool _1422 = _1418 || _1420;
    bool _1424 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _1426 = _1422 || _1424;
    float _1428 = float(_1426);
    float _1430 = _577 * _1402;
    float _1432 = fma(_1388, _1410, (*spvDescriptorSet0.vp_c9)._m0[157].x);
    bool _1434 = _443 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _1436 = isnan(_443);
    bool _1438 = _1434 || _1436;
    bool _1440 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _1442 = _1438 || _1440;
    float _1444 = float(_1442);
    float _1446 = _611 * _1108;
    bool _1448 = _439 >= (*spvDescriptorSet0.vp_c9)._m0[151].w;
    bool _1450 = isnan(_439);
    bool _1452 = _1448 || _1450;
    bool _1454 = isnan((*spvDescriptorSet0.vp_c9)._m0[151].w);
    bool _1456 = _1452 || _1454;
    float _1458 = float(_1456);
    float _1460 = -_611;
    float _1462 = _1460 + 1.0;
    int _1464 = ~_461;
    int _1466 = _1464 + 1;
    float _1468 = -_1444;
    float _1470 = _1468 + 1.0;
    float _1472 = _1458 * _1462;
    float _1474 = _1104 + _906;
    float _1476 = _1428 * _1470;
    float _1478 = _1266 * _1472;
    float _1480 = -_1428;
    float _1482 = _1480 + 1.0;
    int _1484 = _1466 * int(_1416);
    int _1486 = _1484 + _798;
    float _1488 = _1284 * _1476;
    float _1490 = -_1458;
    float _1492 = _1490 + 1.0;
    float _1494 = _1154 + _814;
    int _1496 = ~_461;
    int _1498 = _1496 + 1;
    float _1500 = fma(_1482, (*spvDescriptorSet0.vp_c9)._m0[131].x, _1488);
    float _1502 = float(uint(_1486));
    float _1504 = fma(_1492, (*spvDescriptorSet0.vp_c9)._m0[151].x, _1478);
    float _1506 = fma(_1444, (*spvDescriptorSet0.vp_c9)._m0[132].x, _1500);
    float _1508 = _589 + _449;
    float _1510 = as_type<float>(_555) * _1502;
    float _1512 = fma(_1338, _1446, _1504);
    float _1514 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1516 = _1506 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _1518 = trunc(_1510);
    float _1520 = precise::max(_1518, 0.0);
    uint _1522 = uint(_1520);
    float _1524 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    int _1526 = ~_1306;
    int _1528 = _1526 + 1;
    int _1530 = _1528 + 1;
    float _1532 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    int _1534 = _1530;
    if (!_1308)
    {
        int _1536 = ~_1306;
        int _1538 = _1536 + 1;
        _1534 = _1538;
    }
    int _1540 = _1534;
    float _1542 = _1514 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1544 = _1524 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1546 = _1532 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1548 = _1508 + (-1.0);
    bool _1550 = !_960;
    float _1552 = _1550 ? _181 : as_type<float>(_1030);
    float _1554 = fma(_1340, _1430, _1512);
    bool _1556 = _589 > 0.5;
    out.m_68.x = _1542;
    out.m_68.y = _1544;
    out.m_68.z = _1546;
    out.m_68.w = _1516;
    float _1558 = _940 + 0.5;
    float _1560 = fma(_1310, _1406, _1554);
    int _1562 = int(_1416) + int(_1522);
    float _1564 = fma(_1548, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _1566 = -_181;
    int _1568 = _1556 ? as_type<int>(_1566) : as_type<int>(_181);
    float _1570 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].z;
    float _1572 = -_185;
    int _1574 = _1556 ? as_type<int>(_1572) : as_type<int>(_185);
    int _1576 = _1498 * _1562;
    int _1578 = _1576 + _798;
    float _1580 = fma(_1558, (*spvDescriptorSet0.vp_c9)._m0[85].x, _1090);
    bool _1582 = !_880;
    float _1584 = _1582 ? _181 : as_type<float>(_1568);
    float _1586 = _1552 + 0.5;
    bool _1588 = uint(_1578) >= uint(_461);
    float _1590 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1592 = _1160 + _1590;
    int _1594 = _922 >> 31;
    float _1596 = fma(_1352, _1390, _1560);
    int _1598 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _1600 = _1598 != 0;
    int _1602 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _1604 = _1602 != 0;
    int _1606 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _1608 = _1606 != 0;
    float _1610 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1612 = _1474 + _1610;
    int _1614 = _1594 & 3;
    float _1616 = _1592 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    bool _1618 = !_930;
    int _1620 = _1618 ? 0 : 1;
    float _1622 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    int _1624 = _922 + _1614;
    float _1626 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1628 = _1494 + _1626;
    float _1630 = fma(_1612, (*spvDescriptorSet0.vp_c8)._m0[28].x, _1616);
    bool _1632 = _928 != 3;
    float _1634 = _1584 + 0.5;
    int _1636 = _1624 >> 2;
    float _1638 = fma(_1628, (*spvDescriptorSet0.vp_c8)._m0[28].z, _1630);
    bool _1640 = !_1632;
    int _1642 = _1640 ? 0 : (-1);
    float _1644 = _1570 * (*spvDescriptorSet0.vp_c9)._m0[90].x;
    int _1646 = _1636 << 4;
    int _1648 = _1646 + 512;
    float _1650 = fma(_1404, _1366, _1596);
    bool _1652 = _1638 >= 0.0;
    float _1654 = fma(_1644, _1634, _1026);
    uint _1656 = uint(int(uint(_1648) >> uint(2)));
    uint _1658 = uint(int(uint(int(_1656)) >> uint(2)));
    int _1660 = int(_1656) & 3;
    float _1662 = (*spvDescriptorSet0.vp_c9)._m0[int(_1658)][_1660];
    int _1664 = int(_1656) + 1;
    uint _1666 = uint(int(uint(_1664) >> uint(2)));
    int _1668 = _1664 & 3;
    float _1670 = (*spvDescriptorSet0.vp_c9)._m0[int(_1666)][_1668];
    float _1672 = -_1086;
    float _1674 = _1672 + 1.0;
    float _1676 = _1592 * _1592;
    float _1678 = _1586 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    bool _1680 = !_984;
    float _1682 = _1680 ? _185 : as_type<float>(_1574);
    float _1684 = -_1674;
    float _1686 = fma(_940, _1684, _1580);
    float _1688 = fma(_1612, _1612, _1676);
    float _1690 = _1678 * _1622;
    float _1692 = _914 + (-0.5);
    int _1694 = _1648 + 8;
    uint _1696 = uint(int(uint(_1694) >> uint(2)));
    uint _1698 = uint(int(uint(int(_1696)) >> uint(2)));
    int _1700 = int(_1696) & 3;
    float _1702 = (*spvDescriptorSet0.vp_c9)._m0[int(_1698)][_1700];
    int _1704 = int(_1696) + 1;
    uint _1706 = uint(int(uint(_1704) >> uint(2)));
    int _1708 = _1704 & 3;
    float _1710 = (*spvDescriptorSet0.vp_c9)._m0[int(_1706)][_1708];
    float _1712 = fma(_1628, _1628, _1688);
    float _1714 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].w;
    float _1716 = -_1692;
    float _1718 = -_1096;
    float _1720 = fma(_1716, (*spvDescriptorSet0.vp_c9)._m0[85].y, _1718);
    float _1722 = -_1682;
    float _1724 = _1722 + 0.5;
    float _1726 = _1676;
    if (_1652)
    {
        _1726 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _1728 = _1726;
    float _1730 = fma(_1432, _1350, _1650);
    float _1732 = -_1070;
    float _1734 = _1732 + 1.0;
    float _1736 = _1724 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    int _1738 = abs(_1642);
    float _1740 = rsqrt(_1712);
    int _1742 = as_type<int>(_1728);
    if (_1652)
    {
        float _1744 = _1728 * 5.0;
        _1742 = as_type<int>(_1744);
    }
    int _1746 = _1742;
    float _1748 = fma(_914, _1734, _1720);
    float _1750 = _918 + (-0.5);
    bool _1752 = !_1588;
    int _1754 = _1752 ? 0 : (-1);
    float _1756 = fma(_1264, (*spvDescriptorSet0.vp_c9)._m0[158].x, _1730);
    if (_1652)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _5909 = as_type<float>(_1746);
        out.gl_Position.z = _5909;
    }
    float _1758 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _1760 = _1714 * (*spvDescriptorSet0.vp_c9)._m0[90].y;
    int _1762 = ~_1562;
    int _1764 = _1762 + _1754;
    int _1766 = _1764 + 1;
    out.m_70.x = _1756;
    bool _1768 = _461 == 0;
    float _1770 = -_1760;
    float _1772 = -_1098;
    float _1774 = fma(_1770, _1750, _1772);
    float _1776 = -_1100;
    float _1778 = _1776 + 1.0;
    float _1780 = -_1232;
    float _1782 = fma(_1584, _1780, _1654);
    float _1784 = _1592 * _1740;
    float _1786 = _1612 * _1740;
    int _1788 = _461 * _1766;
    int _1790 = _1788 + _798;
    int _1792 = abs(_1620);
    float _1794 = -_1784;
    float _1796 = fma(_1794, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1592);
    float _1798 = -_1786;
    float _1800 = fma(_1798, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1612);
    float _1802 = fma(_918, _1778, _1774);
    int _1804 = ~_1792;
    int _1806 = _1804 + 1;
    int _1808 = _1806 + 1;
    float _1810 = _1796 * _1796;
    float _1812 = _1736 * _1758;
    int _1814 = ~_1228;
    int _1816 = _1814 + 1;
    int _1818 = _1816 + 1;
    out.m_72.x = _1782;
    out.m_72.y = _1802;
    float _1820 = fma(_1800, _1800, _1810);
    out.m_74.x = _1690;
    out.m_74.y = _1812;
    out.m_74.z = _1686;
    out.m_74.w = _1748;
    int _1822 = _1818 * as_type<int>(_1670);
    if (_1652)
    {
        out.m_49.x = 0.0;
    }
    int _1824 = abs(_1016);
    int _1826 = _1808 * as_type<int>(_1662);
    int _1828 = _1826 + _1822;
    bool _1830 = !_950;
    int _1832 = _1830 ? 0 : 1;
    float _1834 = in.m_76.x;
    float _1836 = in.m_76.y;
    float _1838 = in.m_76.z;
    int _1840 = ~_1824;
    int _1842 = _1840 + 1;
    int _1844 = _1842 + 1;
    int _1846 = abs(_1832);
    int _1848 = ~_1738;
    int _1850 = _1848 + 1;
    int _1852 = _1850 + 1;
    int _1854 = _1844 * as_type<int>(_1702);
    int _1856 = _1854 + _1828;
    bool _1858 = !_1600;
    int _1860 = _1858 ? 0 : 1;
    int _1862 = ~_1846;
    int _1864 = _1862 + 1;
    int _1866 = _1864 + 1;
    int _1868 = _1852 * as_type<int>(_1710);
    int _1870 = _1868 + _1856;
    int _1872 = abs(_1860);
    bool _1874 = !_1768;
    int _1876 = _1874 ? _1790 : (-1);
    int _1878 = _1870 * _1866;
    float _1880 = float(_1540);
    float _1882 = float(_1872);
    int _1884 = _1876 * _1846;
    int _1886 = _1884 + _1878;
    bool _1888 = !_1604;
    int _1890 = _1888 ? 0 : 1;
    float _1892 = _1628 * _1740;
    float _1894 = _1882 * _1880;
    int _1896 = abs(_1890);
    float _1898 = -_1892;
    float _1900 = fma(_1898, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1628);
    float _1902 = float(_1886);
    float _1904 = _1894 * (-2.0);
    float _1906 = float(_1896);
    float _1908 = _449 + (-0.5);
    float _1910 = fma(_1900, _1900, _1820);
    float _1912 = fma(_1904, _1834, _1834);
    out.m_78.y = _1902;
    float _1914 = _1906 * _1234;
    float _1916 = fma(_1564, _1904, _1564);
    float _1918 = fma(_1908, (*spvDescriptorSet0.vp_c9)._m0[196].x, _1912);
    float _1920 = _455 + _589;
    bool _1922 = !_1608;
    int _1924 = _1922 ? 0 : 1;
    float _1926 = _1838;
    if (_1652)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_60.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_60.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_60.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_60.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_49.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_49.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_49.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_49.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_92.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_92.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_92.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_92.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_90.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_90.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_90.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_90.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_88.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_88.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_88.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_88.w)); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _1928 = -_1784;
    float _1930 = fma(_1928, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1160);
    float _1932 = -_1786;
    float _1934 = fma(_1932, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1474);
    int _1936 = abs(_1924);
    float _1938 = -_1892;
    float _1940 = fma(_1938, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1494);
    float _1942 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1944 = _1930 + _1942;
    float _1946 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1948 = _1934 + _1946;
    float _1950 = float(_1242);
    float _1952 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1954 = _1940 + _1952;
    float _1956 = _1944 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1958 = _1914 * (-2.0);
    float _1960 = _1920 + (-1.0);
    float _1962 = fma(_1948, (*spvDescriptorSet0.vp_c8)._m0[28].x, _1956);
    float _1964 = float(_1936);
    float _1966 = _589 + (-0.5);
    float _1968 = fma(_1960, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _1970 = fma(_1954, (*spvDescriptorSet0.vp_c8)._m0[28].z, _1962);
    float _1972 = _455 + _449;
    float _1974 = _1964 * _1950;
    float _1976 = _455 + (-0.5);
    float _1978 = fma(_1916, _1112, _1918);
    bool _1980 = _1970 >= 0.0;
    float _1982 = fma(_1958, _1836, _1836);
    float _1984 = fma(_1968, _1958, _1968);
    float _1986 = _1972 + (-1.0);
    float _1988 = _1974 * (-2.0);
    float _1990 = fma(_1966, (*spvDescriptorSet0.vp_c9)._m0[196].y, _1982);
    float _1992 = _1978 * 0.15915493667125701904296875;
    float _1994 = sqrt(_1910);
    float _1996 = fma(_1984, _1112, _1990);
    float _1998 = fma(_1988, _1838, _1838);
    float _2000 = fma(_1986, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _2002 = _1996 * 0.15915493667125701904296875;
    float _2004 = fma(_1976, (*spvDescriptorSet0.vp_c9)._m0[196].z, _1998);
    float _2006 = fma(_2000, _1988, _2000);
    float _2008 = _1948;
    if (_1980)
    {
        _1926 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _2010 = _1926;
    float _2012 = _1992 * 6.283185482025146484375;
    float _2014 = sin(_2012);
    float _2016 = fma(_2006, _1112, _2004);
    int _2018 = as_type<int>(_2010);
    if (_1980)
    {
        out.m_49.x = 0.0;
    }
    if (_1980)
    {
        float _2020 = _2010 * 5.0;
        _2018 = as_type<int>(_2020);
    }
    int _2022 = _2018;
    float _2024 = _2016 * 0.15915493667125701904296875;
    float _2026 = _1992 * 6.283185482025146484375;
    float _2028 = cos(_2026);
    if (_1980)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _6334 = as_type<float>(_2022);
        out.gl_Position.z = _6334;
    }
    float _2030 = _2002 * 6.283185482025146484375;
    float _2032 = sin(_2030);
    float _2034 = _2002 * 6.283185482025146484375;
    float _2036 = cos(_2034);
    if (_1980)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_60.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_60.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_60.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_60.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_49.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_49.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_49.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_49.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_92.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_92.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_92.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_92.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_90.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_90.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_90.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_90.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_88.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_88.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_88.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_88.w)); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _2038 = _2024 * 6.283185482025146484375;
    float _2040 = cos(_2038);
    float _2042 = _1740 * _1994;
    float _2044 = _397 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _2046 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _185);
    float _2048 = _399 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _2050 = _2028 * _2036;
    float _2052 = _2042 * _2044;
    float _2054 = _2028 * _2032;
    float _2056 = _2024 * 6.283185482025146484375;
    float _2058 = sin(_2056);
    float _2060 = _2042 * _2048;
    float _2062 = _2046 * _2052;
    float _2064 = _2014 * _2032;
    float _2066 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _181);
    float _2068 = _2014 * _2036;
    float _2070 = _2042 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _2072 = _2070 * 0.5;
    float _2074 = _2028 * _2040;
    float _2076 = _2066 * _2060;
    float _2078 = _2036 * _2040;
    float _2080 = _2014 * _2040;
    float _2082 = _2074 * _2062;
    float _2084 = _2032 * _2040;
    bool _2086 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _2088 = isnan(0.5);
    bool _2090 = _2086 || _2088;
    bool _2092 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _2094 = _2090 || _2092;
    float _2096 = fma(_2058, _2050, _2064);
    float _2098 = -_2068;
    float _2100 = fma(_2058, _2054, _2098);
    float _2102 = -_2062;
    float _2104 = _2058 * _2102;
    float _2106 = -_2054;
    float _2108 = fma(_2058, _2068, _2106);
    float _2110 = fma(_2096, _2076, _2082);
    float _2112 = _2080 * _2062;
    float _2114 = fma(_2078, _2076, _2104);
    float _2116 = fma(_2058, _2064, _2050);
    float _2118 = fma(_2100, _2072, _2110);
    float _2120 = fma(_2108, _2076, _2112);
    float _2122 = fma(_2084, _2072, _2114);
    float _2124 = _1930 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _2126 = _2118 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2128 = fma(_2116, _2072, _2120);
    float _2130 = _2118 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2132 = fma(_1934, (*spvDescriptorSet0.vp_c8)._m0[11].x, _2124);
    float _2134 = fma(_2122, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2126);
    float _2136 = _1930 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _2138 = fma(_2122, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2130);
    float _2140 = fma(_1940, (*spvDescriptorSet0.vp_c8)._m0[11].z, _2132);
    float _2142 = fma(_2128, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2134);
    bool _2144 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _2146 = isnan(0.5);
    bool _2148 = _2144 || _2146;
    bool _2150 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _2152 = _2148 || _2150;
    float _2154 = fma(_2128, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2138);
    float _2156 = _2140 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _2158 = _2142 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _2160 = _2154 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _2162 = 1.0 / _2156;
    float _2164 = _1494 + _2158;
    float _2166 = _1474 + _2160;
    float _2168 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _2170 = _2164 + _2168;
    float _2172 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _2174 = _2166 + _2172;
    float _2176 = _2170 * _2170;
    float _2178 = fma(_2174, _2174, _2176);
    float _2180 = fma(_1934, (*spvDescriptorSet0.vp_c8)._m0[10].x, _2136);
    float _2182 = sqrt(_2178);
    float _2184 = fma(_1940, (*spvDescriptorSet0.vp_c8)._m0[10].z, _2180);
    float _2186 = _2184 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _2188 = _2186 + _2156;
    float _2190 = _2118 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2192 = _2188 * _2162;
    float _2194 = _2192 * 0.5;
    float _2196 = fma(_2122, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2190);
    bool _2198 = _2182 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2200 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _2202 = fma(_2194, (*spvDescriptorSet0.vp_c8)._m0[30].w, _2200);
    float _2204 = fma(_2128, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2196);
    float _2206 = 1.0 / _2202;
    float _2208 = _2204 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _2210 = _1160 + _2208;
    float _2212 = _2156;
    float _2214 = _2166;
    float _2216 = _2194;
    float _2218 = _2170;
    float _2220 = _2210;
    if (!_2198)
    {
        _2212 = _2166;
    }
    float _2222 = _2212;
    float _2224 = _2222;
    if (!_2198)
    {
        _2214 = _2164;
    }
    float _2226 = _2214;
    float _2228 = _2226;
    if (!_2198)
    {
        _2216 = _2210;
    }
    float _2230 = _2216;
    bool _2232 = !_2198;
    float _2234 = _2230;
    if (!_2232)
    {
        float _2236 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2238 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _2240 = _2182 + _2238;
        float _2242 = _2210 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2244 = rsqrt(_2178);
        float _2246 = _2240 * _2236;
        float _2248 = _2246 * 0.15915493667125701904296875;
        float _2250 = _2248 * 6.283185482025146484375;
        float _2252 = sin(_2250);
        float _2254 = _2248 * 6.283185482025146484375;
        float _2256 = cos(_2254);
        float _2258 = fma(_2252, _2242, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _2260 = _2244 * _2258;
        float _2262 = _2256 + (-1.0);
        float _2264 = fma(_2174, _2260, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _2266 = fma(_2170, _2260, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _2268 = _2262 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2270 = fma(_2210, _2256, _2268);
        _2224 = _2264;
        _2234 = _2270;
        _2228 = _2266;
    }
    float _2272 = _2224;
    float _2274 = _2234;
    float _2276 = _2228;
    float _2278 = -_1786;
    float _2280 = fma(_2278, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2272);
    float _2282 = -_1784;
    float _2284 = fma(_2282, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2274);
    float _2286 = -_1892;
    float _2288 = fma(_2286, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2276);
    float _2290 = _2284;
    float _2292 = _2280;
    float _2294 = _2288;
    float _2296 = _2276;
    if (_2152)
    {
        _2218 = 1.0;
    }
    float _2298 = _2218;
    float _2300 = _2298;
    if (!_2094)
    {
        float _2302 = _1944 * _1944;
        float _2304 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _2306 = -_1494;
        float _2308 = _2306 + _2276;
        float _2310 = -_1160;
        float _2312 = _2310 + _2274;
        float _2314 = fma(_1948, _1948, _2302);
        float _2316 = -_1474;
        float _2318 = _2316 + _2272;
        float _2320 = fma(_1954, _1954, _2314);
        float _2322 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _2324 = sqrt(_2320);
        float _2326 = 1.0 / _2042;
        float _2328 = _2322 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _2330 = precise::min(_2324, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _2332 = _2330 * _2304;
        float _2334 = _2332 * _2326;
        float _2336 = _2328 * _2334;
        float _2338 = _2308 * _2334;
        float _2340 = fma(_2312, _2336, _1930);
        float _2342 = fma(_2318, _2336, _1934);
        float _2344 = fma(_2328, _2338, _1940);
        _2008 = _2324;
        _2290 = _2340;
        _2292 = _2342;
        _2294 = _2344;
        _2296 = _2338;
    }
    float _2346 = _2008;
    float _2348 = _2290;
    float _2350 = _2292;
    float _2352 = _2294;
    float _2354 = _2296;
    float _2356 = _2354;
    float _2358 = _2346;
    if (_2152)
    {
        _2356 = 1.0;
    }
    float _2360 = _2356;
    float _2362 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _2364 = _2206 * _2362;
    float _2366 = _2360;
    if (!_2152)
    {
        float _2368 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _2370 = _2368 * 0.15915493667125701904296875;
        float _2372 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _2374 = _2370 * 6.283185482025146484375;
        float _2376 = cos(_2374);
        float _2378 = _2372 * 0.15915493667125701904296875;
        float _2380 = _2370 * 6.283185482025146484375;
        float _2382 = sin(_2380);
        float _2384 = 1.0 / _2376;
        float _2386 = _2378 * 6.283185482025146484375;
        float _2388 = cos(_2386);
        float _2390 = _2382 * _2384;
        float _2392 = _2378 * 6.283185482025146484375;
        float _2394 = sin(_2392);
        float _2396 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2398 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _2396;
        float _2400 = _2388 * _2390;
        float _2402 = 1.0 / _2398;
        float _2404 = 1.0 / _2400;
        float _2406 = _2394 * _2404;
        float _2408 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2410 = fma(_2364, _2406, _2408);
        float _2412 = _2410 * _2402;
        float _2414 = precise::clamp(_2412, 0.0, 1.0);
        _2358 = _2390;
        _2300 = _2414;
    }
    float _2416 = _2358;
    float _2418 = _2300;
    float _2420 = _2416;
    if (!_2152)
    {
        float _2422 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _2424 = _2422 * 0.15915493667125701904296875;
        float _2426 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _2428 = _2424 * 6.283185482025146484375;
        float _2430 = cos(_2428);
        float _2432 = _2426 * 0.15915493667125701904296875;
        float _2434 = _2424 * 6.283185482025146484375;
        float _2436 = sin(_2434);
        float _2438 = 1.0 / _2430;
        float _2440 = _2432 * 6.283185482025146484375;
        float _2442 = cos(_2440);
        float _2444 = _2436 * _2438;
        float _2446 = _2432 * 6.283185482025146484375;
        float _2448 = sin(_2446);
        float _2450 = _2442 * _2444;
        float _2452 = 1.0 / _2450;
        float _2454 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _2456 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _2454;
        float _2458 = 1.0 / _2456;
        float _2460 = _2448 * _2452;
        float _2462 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _2464 = fma(_2364, _2460, _2462);
        float _2466 = _2464 * _2458;
        float _2468 = precise::clamp(_2466, 0.0, 1.0);
        float _2470 = -_2468;
        float _2472 = _2470 + 1.0;
        _2420 = _2438;
        _2366 = _2472;
    }
    float _2474 = _2420;
    float _2476 = _2366;
    float _2478 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2480 = _2348 + _2478;
    float _2482 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2484 = _2350 + _2482;
    float _2486 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2488 = _2352 + _2486;
    float _2490 = _2480 * _2480;
    float _2492 = _2348 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _2494 = fma(_2484, _2484, _2490);
    float _2496 = fma(_2488, _2488, _2494);
    float _2498 = rsqrt(_2496);
    float _2500 = sqrt(_2496);
    float _2502 = _2498 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _2504 = _2484 * _2502;
    float _2506 = _2488 * _2502;
    float _2508 = _2504 * _2504;
    float _2510 = _2506 * _2506;
    float _2512 = _2508 + _2510;
    float _2514 = sqrt(_2512);
    bool _2516 = _2514 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2518 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2520 = _2514 + _2518;
    float _2522 = _2488;
    float _2524 = _2512;
    float _2526 = _2520;
    float _2528 = _2490;
    if (_2516)
    {
        float _2530 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2522 = _2530;
    }
    float _2532 = _2522;
    if (_2516)
    {
        float _2534 = rsqrt(_2512);
        _2524 = _2534;
    }
    float _2536 = _2524;
    float _2538 = _2536;
    if (_2516)
    {
        float _2540 = _2520 * _2532;
        _2526 = _2540;
    }
    float _2542 = _2526;
    if (_2516)
    {
        float _2544 = _2542 * 0.15915493667125701904296875;
        _2528 = _2544;
    }
    float _2546 = _2528;
    float _2548 = _2532;
    float _2550 = _2546;
    if (_2516)
    {
        float _2552 = _2546 * 6.283185482025146484375;
        float _2554 = sin(_2552);
        _2548 = _2554;
    }
    float _2556 = _2548;
    float _2558 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _2560 = precise::max(0.0, _2558);
    float _2562 = _2474;
    float _2564 = _2560;
    if (_2516)
    {
        float _2566 = _2546 * 6.283185482025146484375;
        float _2568 = cos(_2566);
        _2562 = _2568;
    }
    float _2570 = _2562;
    float _2572 = -_2502;
    float _2574 = -_2560;
    float _2576 = fma(_2480, _2572, _2574);
    float _2578 = (*spvDescriptorSet0.vp_c15)._m0[652].x;
    if (_2516)
    {
        float _2580 = _2576 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2564 = _2580;
    }
    float _2582 = _2564;
    float _2584 = _2582;
    if (!_2516)
    {
        _2550 = _2504;
    }
    float _2586 = _2550;
    float _2588 = fma(_1934, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _2590 = _2556;
    float _2592 = _2586;
    if (_2516)
    {
        float _2594 = fma(_2556, _2582, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _2590 = _2594;
    }
    float _2596 = _2590;
    float _2598 = _2596;
    if (!_2516)
    {
        _2584 = _2576;
    }
    float _2600 = _2584;
    float _2602 = _2600;
    float _2604 = _2570;
    if (_2516)
    {
        float _2606 = _2570 + (-1.0);
        _2578 = _2606;
    }
    float _2608 = _2578;
    float _2610 = _2608;
    if (_2516)
    {
        float _2612 = _2536 * _2596;
        _2220 = _2612;
    }
    float _2614 = _2220;
    if (!_2516)
    {
        _2538 = _2506;
    }
    float _2616 = _2538;
    float _2618 = _2616;
    if (_2516)
    {
        float _2620 = _2608 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2610 = _2620;
    }
    float _2622 = _2610;
    if (_2516)
    {
        float _2624 = _2504 * _2614;
        _2592 = _2624;
    }
    float _2626 = _2592;
    if (!_2516)
    {
        _2598 = _2508;
    }
    float _2628 = _2598;
    float _2630 = _2628;
    if (_2516)
    {
        float _2632 = _2506 * _2614;
        _2618 = _2632;
    }
    float _2634 = _2618;
    if (_2516)
    {
        float _2636 = fma(_2576, _2570, _2622);
        _2602 = _2636;
    }
    float _2638 = _2602;
    if (_2516)
    {
        float _2640 = _2626 * _2626;
        _2630 = _2640;
    }
    float _2642 = _2630;
    if (!_2516)
    {
        _2604 = _2510;
    }
    float _2644 = _2604;
    float _2646 = _2644;
    if (_2516)
    {
        float _2648 = _2634 * _2634;
        _2646 = _2648;
    }
    float _2650 = _2646;
    float _2652 = _2348 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _2654 = fma(_2638, _2638, _2642);
    float _2656 = floor(_2588);
    float _2658 = _2654 + _2650;
    float _2660 = fma(_2350, (*spvDescriptorSet0.vp_c8)._m0[2].x, _2652);
    float _2662 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _2664 = fma(_2500, (*spvDescriptorSet0.vp_c15)._m0[23].w, _2662);
    float _2666 = precise::clamp(_2664, 0.0, 1.0);
    float _2668 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _2670 = fma(_2352, (*spvDescriptorSet0.vp_c8)._m0[2].z, _2660);
    float _2672 = rsqrt(_2658);
    float _2674 = -_2666;
    float _2676 = _2674 + 1.0;
    float _2678 = _2670 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _2680 = fma(_1940, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _2682 = _2348 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2684 = _2678 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _2686 = abs(_2676);
    float _2688 = log2(_2686);
    float _2690 = _2348 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2692 = -_2684;
    float _2694 = fma(_2692, _2668, 1.0);
    float _2696 = fma(_2350, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2682);
    float _2698 = fma(_2350, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2690);
    float _2700 = _2672 * _2626;
    float _2702 = fma(_2352, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2696);
    float _2704 = _2672 * _2638;
    float _2706 = fma(_2350, (*spvDescriptorSet0.vp_c8)._m0[3].x, _2492);
    float _2708 = _2700 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _2710 = fma(_2352, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2698);
    float _2712 = _2702 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _2714 = _2672 * _2634;
    float _2716 = -_2708;
    float _2718 = fma(_2704, (*spvDescriptorSet0.vp_c15)._m0[21].y, _2716);
    float _2720 = _2710 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2722 = _2712 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _2724 = floor(_2680);
    float _2726 = fma(_2352, (*spvDescriptorSet0.vp_c8)._m0[3].z, _2706);
    float _2728 = _2688 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _2730 = fma(_2720, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2722);
    float _2732 = -_2714;
    float _2734 = fma(_2732, (*spvDescriptorSet0.vp_c15)._m0[21].z, _2718);
    float _2736 = _2726 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _2738 = _2712 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2740 = fma(_2678, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2730);
    float _2742 = exp2(_2728);
    float _2744 = fma(_2734, -0.5, 0.5);
    float _2746 = fma(_2734, 0.5, 0.5);
    float _2748 = fma(_2736, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2740);
    float _2750 = log2(_2694);
    float _2752 = -_2724;
    float _2754 = _2680 + _2752;
    float _2756 = fma(_2720, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2738);
    float _2758 = fma(_2746, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _2760 = fma(_2678, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2756);
    float _2762 = fma(_2746, _2758, -0.212114393711090087890625);
    float _2764 = 1.0 / _2748;
    float _2766 = -_2656;
    float _2768 = _2588 + _2766;
    float _2770 = _2712 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2772 = fma(_2746, _2762, 1.570728778839111328125);
    float _2774 = fma(_2720, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2770);
    float _2776 = _2704 + 1.0;
    float _2778 = sqrt(_2744);
    float _2780 = _2750 * 0.693147182464599609375;
    float _2782 = fma(_2678, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2774);
    float _2784 = -_2704;
    float _2786 = fma(_2742, _2776, _2784);
    float2 _7530 = float2(_2768, _2754);
    float _2788 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_7530, float2(0.0), isnan(_7530)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_7530, float2(0.0), isnan(_7530)), level(0.0)).x;
    float _2790 = _2780 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _2792 = fma(_2736, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2782);
    float _2794 = fma(_2736, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2760);
    float _2796 = fma(_2786, 0.5, 0.5);
    float _2798 = _2792 * _2764;
    float _2800 = _2794 * _2764;
    float _2802 = fma(_2798, 0.5, 0.5);
    float _2804 = fma(_2800, -0.5, 0.5);
    float _2806 = _2778 * 0.636619746685028076171875;
    float3 _7570 = float3(_2802, _2804, _2790);
    float _2808 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_7570, float3(0.0), isnan(_7570)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_7570, float3(0.0), isnan(_7570)), level(0.0)).x;
    float3 _7581 = float3(_2802, _2804, _2790);
    float4 _2811 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_7581, float3(0.0), isnan(_7581)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_7581, float3(0.0), isnan(_7581)), level(0.0)).xyzw;
    float _2813 = _2811.x;
    float _2815 = _2811.y;
    float _2817 = _2811.z;
    float _2819 = _2811.w;
    float _2821 = -_2772;
    float _2823 = fma(_2806, _2821, 1.0);
    float2 _7602 = float2(_2823, _2796);
    float3 _2827 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_7602, float2(0.0), isnan(_7602)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_7602, float2(0.0), isnan(_7602)), level(0.0)).xyz;
    float _2829 = _2827.x;
    float _2831 = _2827.y;
    float _2833 = _2827.z;
    float _2835 = abs(_2364);
    float _2837 = log2(_2835);
    float _2839 = _2096 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2841 = _2096 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2843 = _2096 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2845 = _2074 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2847 = fma(_2078, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2839);
    float _2849 = _2074 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2851 = _2712 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _2853 = _185 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    bool _2855 = _2500 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _2857 = isnan(_2500);
    bool _2859 = _2855 || _2857;
    bool _2861 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _2863 = _2859 || _2861;
    float _2865 = _2837 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _2867 = _2074 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2869 = fma(_2078, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2841);
    float _2871 = fma(_2078, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2843);
    float _2873 = fma(_2108, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2847);
    float _2875 = exp2(_2865);
    float _2877 = -_2058;
    float _2879 = fma(_2877, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2845);
    float _2881 = -_2058;
    float _2883 = fma(_2881, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2849);
    float _2885 = -_2058;
    float _2887 = fma(_2885, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2867);
    float _2889 = _2100 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2891 = _2100 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2893 = _2100 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2895 = fma(_2080, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2883);
    float _2897 = fma(_2084, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2889);
    float _2899 = fma(_2084, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2891);
    float _2901 = fma(_2084, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2893);
    float _2903 = fma(_2080, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2879);
    float _2905 = fma(_2080, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2887);
    float _2907 = fma(_2720, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2851);
    float _2909 = fma(_2116, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2897);
    float _2911 = fma(_2875, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _2913 = precise::clamp(_2911, 0.0, 1.0);
    float _2915 = fma(_2116, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2899);
    float _2917 = fma(_2116, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2901);
    float _2919 = _2853 * _2905;
    float _2921 = fma(_2913, -2.0, 3.0);
    float _2923 = _2913 * _2913;
    float _2925 = fma(_2108, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2869);
    float _2927 = fma(_2108, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2871);
    float _2929 = _2923 * _2921;
    float _2931 = fma(_2678, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2907);
    float _2933 = _181 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _2935 = _2853 * _2903;
    float _2937 = -_2929;
    float _2939 = _2937 + 1.0;
    float _2941 = fma(_2736, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2931);
    float _2943 = _2688 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _2945 = in.m_80.x;
    float _2947 = _2853 * _2895;
    bool _2949 = _2364 <= 8000.0;
    bool _2951 = isnan(_2364);
    bool _2953 = _2949 || _2951;
    bool _2955 = isnan(8000.0);
    bool _2957 = _2953 || _2955;
    float _2959 = float(_2957);
    float _2961 = fma(_2939, (*spvDescriptorSet0.vp_c15)._m0[654].w, _2929);
    float _2963 = _2748 * 0.5;
    float _2965 = exp2(_2943);
    float _2967 = fma(_2933, _2873, _2935);
    float _2969 = _2959 * _2961;
    float _2971 = fma(_2794, -0.5, _2963);
    float _2973 = fma(_2933, _2925, _2947);
    float _2975 = _2909 + _2967;
    float _2977 = _2969 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _2979 = _2941 + _2748;
    float _2981 = _2792 + _2748;
    out.gl_Position.x = _2792;
    out.gl_Position.y = _2794;
    out.gl_Position.z = _2941;
    out.gl_Position.w = _2748;
    float _2983 = _2979 * 0.5;
    float _2985 = _2981 * 0.5;
    float _2987 = fma(_2933, _2927, _2919);
    float _2989 = _2915 + _2973;
    float _2991 = -_2965;
    float _2993 = _2991 + 1.0;
    out.m_82.x = _2985;
    out.m_82.y = _2971;
    out.m_82.z = _2983;
    out.m_82.w = _2748;
    float _2995 = _2917 + _2987;
    float _2997 = _2993 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    out.m_84.x = _2975;
    out.m_84.y = _2989;
    out.m_84.z = _2995;
    float _2999 = -_2997;
    float _3001 = _2999 + 1.0;
    float _3003 = -_2788;
    float _3005 = _3003 + 1.0;
    float _3007 = _3005 * _2977;
    float _3009 = precise::clamp(_3007, 0.0, 1.0);
    float _3011 = -_3009;
    float _3013 = fma(_3011, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _3015 = _3013 * _2945;
    float _3017 = _2997 * _2808;
    float _3019 = _3015 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _3021 = _2819 * _3001;
    float _3023 = _2819 * _3017;
    out.m_86.x = _3019;
    float _3025 = _2833 * _3017;
    float _3027 = fma(_2829, _3023, _2813);
    float _3029 = fma(_2831, _3023, _2815);
    float _3031 = _2418 * _2476;
    float _3033 = fma(_2819, _3025, _2817);
    float _3035 = _2831;
    float _3037 = _2829;
    float _3039 = _2819;
    float _3041 = _2817;
    float _3043 = _2815;
    float _3045 = _3031;
    if (!_2863)
    {
        _3035 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _3047 = _3035;
    float _3049 = _3031 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _3051 = _3047;
    float _3053 = _3047;
    if (!_2863)
    {
        _3037 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _3055 = _3037;
    out.m_88.x = _3027;
    out.m_88.y = _3029;
    out.m_88.z = _3033;
    out.m_88.w = _3021;
    float _3057 = _3055;
    float _3059 = _3055;
    if (!_2863)
    {
        _3039 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _3061 = _3039;
    float _3063 = _3061;
    float _3065 = _3061;
    if (!_2863)
    {
        _3041 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _3067 = _3041;
    float _3069 = _3067;
    float _3071 = _3067;
    if (!_2863)
    {
        _3043 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _3073 = _3043;
    float _3075 = _3073;
    float _3077 = _3073;
    if (!_2863)
    {
        _3045 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _3079 = _3045;
    bool _3081 = !_2863;
    float _3083 = _3079;
    float _3085 = _3079;
    if (!_3081)
    {
        bool _3087 = _2500 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _3089 = isnan(_2500);
        bool _3091 = _3087 || _3089;
        bool _3093 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _3095 = _3091 || _3093;
        if (!_3095)
        {
            float _3097 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _3099 = _2500 + _3097;
            float _3101 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _3103 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _3101;
            float _3105 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _3107 = _3105 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _3109 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _3111 = _3109 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _3113 = 1.0 / _3103;
            float _3115 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _3117 = _3115 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _3119 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _3121 = _3119 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _3123 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _3125 = _3123 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _3127 = _3099 * _3113;
            float _3129 = precise::clamp(_3127, 0.0, 1.0);
            float _3131 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _3133 = _3131 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _3135 = fma(_3129, _3107, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _3137 = fma(_3129, _3111, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _3139 = fma(_3129, _3117, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _3141 = fma(_3129, _3133, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _3143 = fma(_3129, _3121, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _3145 = fma(_3129, _3125, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _3059 = _3139;
            _3077 = _3135;
            _3053 = _3137;
            _3071 = _3143;
            _3065 = _3141;
            _3085 = _3145;
            _3147 = true;
        }
        else
        {
            bool _3149 = _2500 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _3151 = isnan(_2500);
            bool _3153 = _3149 || _3151;
            bool _3155 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _3157 = _3153 || _3155;
            if (!_3157)
            {
                _3051 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _3159 = _3051;
            _3053 = _3159;
            if (!_3157)
            {
                _3057 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _3161 = _3057;
            _3059 = _3161;
            if (!_3157)
            {
                _3063 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _3163 = _3063;
            _3065 = _3163;
            if (!_3157)
            {
                _3069 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _3165 = _3069;
            _3071 = _3165;
            if (!_3157)
            {
                _3075 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _3167 = _3075;
            _3077 = _3167;
            if (!_3157)
            {
                _3083 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _3169 = _3083;
            bool _3171 = !_3157;
            _3085 = _3169;
            if (!_3171)
            {
                bool _3173 = _2500 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _3175 = isnan(_2500);
                bool _3177 = _3173 || _3175;
                bool _3179 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _3181 = _3177 || _3179;
                if (!_3181)
                {
                    float _3183 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _3185 = _2500 + _3183;
                    float _3187 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _3189 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _3187;
                    float _3191 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _3193 = _3191 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _3195 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _3197 = _3195 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _3199 = 1.0 / _3189;
                    float _3201 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _3203 = _3201 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _3205 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _3207 = _3205 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _3209 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _3211 = _3209 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _3213 = _3185 * _3199;
                    float _3215 = precise::clamp(_3213, 0.0, 1.0);
                    float _3217 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _3219 = _3217 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _3221 = fma(_3215, _3193, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _3223 = fma(_3215, _3197, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _3225 = fma(_3215, _3203, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _3227 = fma(_3215, _3219, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _3229 = fma(_3215, _3207, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _3231 = fma(_3215, _3211, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _3059 = _3225;
                    _3077 = _3221;
                    _3053 = _3223;
                    _3071 = _3229;
                    _3065 = _3227;
                    _3085 = _3231;
                    _3147 = true;
                }
                else
                {
                    _3059 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _3077 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _3053 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _3071 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _3065 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _3085 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _3147 = false;
    float _3233 = _3059;
    float _3235 = _3077;
    float _3237 = _3053;
    float _3239 = _3071;
    float _3241 = _3065;
    float _3243 = _3085;
    float _3245 = fma(_2989, -0.5, 0.5);
    float _3247 = precise::clamp(_3245, 0.0, 1.0);
    float _3249 = -_3233;
    float _3251 = _3249 + _3235;
    float _3253 = -_3237;
    float _3255 = _3253 + _3239;
    out.m_90.x = 0.0;
    float _3257 = -_3241;
    float _3259 = _3257 + _3243;
    float _3261 = fma(_3247, _3251, _3233);
    float _3263 = fma(_3247, _3255, _3237);
    bool _3265 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _3267 = _3261 * 0.586610972881317138671875;
    float _3269 = fma(_3247, _3259, _3241);
    float _3271 = _3049 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _3273 = fma(_3263, 0.298911988735198974609375, _3267);
    bool _3275 = _2418 > 0.0;
    bool _3277 = isnan(_2418);
    bool _3279 = _3275 || _3277;
    bool _3281 = isnan(0.0);
    bool _3283 = _3279 || _3281;
    float _3285 = fma(_3269, 0.114477999508380889892578125, _3273);
    out.m_49.x = _3271;
    bool _3287 = _2476 <= 0.0;
    bool _3289 = !_3283;
    bool _3291 = _3287 || _3289;
    float _3293 = -_3285;
    float _3295 = _3263 + _3293;
    float _3297 = -_3285;
    float _3299 = _3269 + _3297;
    float _3301 = fma(_3295, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3285);
    float _3303 = -_3285;
    float _3305 = _3261 + _3303;
    float _3307 = fma(_3305, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3285);
    float _3309 = fma(_3299, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3285);
    bool _3311 = !_3265;
    if (!_3311)
    {
        float _3313 = -_2348;
        float _3315 = _3313 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _3317 = -_2350;
        float _3319 = _3317 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _3321 = -_2352;
        float _3323 = _3321 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _3325 = _3315 * _3315;
        float _3327 = fma(_3319, _3319, _3325);
        float _3329 = fma(_3323, _3323, _3327);
        float _3331 = sqrt(_3329);
        float _3333 = rsqrt(_3329);
        float _3335 = -_3331;
        float _3337 = _3335 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _3339 = _3337 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _3341 = precise::clamp(_3339, 0.0, 1.0);
        float _3343 = _3319 * _3333;
        float _3345 = _3315 * _3333;
        float _3347 = abs(_3341);
        float _3349 = log2(_3347);
        float _3351 = _3323 * _3333;
        float _3353 = _3343 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _3355 = _2989 * _3345;
        float _3357 = -_3345;
        float _3359 = -_3353;
        float _3361 = fma(_3357, (*spvDescriptorSet0.vp_c15)._m0[656].y, _3359);
        float _3363 = fma(_2975, _3343, _3355);
        float _3365 = -_3351;
        float _3367 = fma(_3365, (*spvDescriptorSet0.vp_c15)._m0[656].z, _3361);
        float _3369 = fma(_2995, _3351, _3363);
        float _3371 = precise::clamp(_3369, 0.0, 1.0);
        float _3373 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _3375 = _3367 + _3373;
        float _3377 = _3349 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _3379 = _3375 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _3381 = precise::clamp(_3379, 0.0, 1.0);
        float _3383 = exp2(_3377);
        float _3385 = _3383 * _3381;
        float _3387 = _3371 * _3385;
        float _3389 = _3387 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _3391 = _3387 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _3393 = _3387 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_90.x = _3389;
        out.m_90.y = _3391;
        out.m_90.z = _3393;
    }
    out.m_92.x = _3301;
    out.m_92.y = _3307;
    out.m_92.z = _3309;
    if (!_3291)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_60.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_60.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_60.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_60.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_49.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_49.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_49.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_49.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_92.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_92.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_92.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_92.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_90.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_90.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_90.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_90.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_88.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_88.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_88.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_88.w)); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _3395 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.m_49.x = 0.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _3395;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_60.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_60.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_60.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_60.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_49.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_49.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_49.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_49.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_92.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_92.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_92.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_92.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_90.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_90.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_90.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_90.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_88.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_88.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_88.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_88.w)); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

