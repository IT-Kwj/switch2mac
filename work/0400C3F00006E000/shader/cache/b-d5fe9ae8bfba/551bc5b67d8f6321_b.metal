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
    constant _16* vp_c7 [[id(4)]];
    texture3d<float> vp_t_tcb_32 [[id(5)]];
    sampler vp_t_tcb_32Smplr [[id(6)]];
    texture3d<float> vp_t_tcb_30 [[id(7)]];
    sampler vp_t_tcb_30Smplr [[id(8)]];
    texture2d<float> vp_t_tcb_1C [[id(9)]];
    sampler vp_t_tcb_1CSmplr [[id(10)]];
    sampler vp_t_tcb_32Smplr_w [[id(11)]];
    sampler vp_t_tcb_30Smplr_w [[id(12)]];
    sampler vp_t_tcb_1CSmplr_w [[id(13)]];
    constant dm_border_t* dm_border [[id(14)]];
};

struct main0_out
{
    float4 m_56 [[user(locn0)]];
    float4 m_54 [[user(locn1)]];
    float4 m_62 [[user(locn2)]];
    float4 m_45 [[user(locn3)]];
    float4 m_58 [[user(locn4)]];
    float4 m_64 [[user(locn6)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_42 [[attribute(2)]];
    float4 m_47 [[attribute(3)]];
    float4 m_52 [[attribute(4)]];
    float4 m_60 [[attribute(5)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_56 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_54 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_62 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_45 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_58 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_64 = float4(0.0, 0.0, 0.0, 1.0);
    bool _559 = false;
    bool _177 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _78 = in.m_42.w;
    float _80 = trunc(_78);
    int _83 = int(_80);
    bool _87 = _83 >= 1;
    float _89 = 0.0;
    if (!_87)
    {
        _89 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _91 = _89;
    float _93 = _91;
    if (!_87)
    {
        out.m_45.x = 0.0;
    }
    int _95 = 0;
    if (!_87)
    {
        float _97 = _91 * 5.0;
        _95 = as_type<int>(_97);
    }
    int _99 = _95;
    if (!_87)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2223 = as_type<float>(_99);
        out.gl_Position.z = _2223;
    }
    if (!_87)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _101 = in.m_47.w;
    bool _103 = _101 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _105 = isnan(_101);
    bool _107 = _103 || _105;
    bool _109 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _111 = _107 || _109;
    float _113 = -_101;
    float _115 = _113 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    if (_111)
    {
        float _117 = float(_83);
        _93 = _117;
    }
    float _119 = _93;
    bool _121 = _115 >= _119;
    bool _123 = !_111;
    bool _125 = _121 || _123;
    float _127 = _119;
    if (_125)
    {
        _127 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _129 = _127;
    if (_125)
    {
        out.m_45.x = 0.0;
    }
    int _131 = 0;
    if (_125)
    {
        float _133 = _129 * 5.0;
        _131 = as_type<int>(_133);
    }
    int _135 = _131;
    if (_125)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2292 = as_type<float>(_135);
        out.gl_Position.z = _2292;
    }
    if (_125)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _137 = as_type<float>(int(gl_VertexIndex));
    bool _139 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    int _141 = as_type<int>(_137) & 1;
    bool _143 = _141 != 0;
    int _145 = as_type<int>(_137) & 2;
    bool _147 = _145 != 0;
    bool _149 = !_143;
    float _151 = _149 ? (-0.5) : 0.5;
    bool _153 = !_147;
    float _155 = _153 ? (-0.5) : 0.5;
    bool _157 = !_139;
    float _175;
    if (!_157)
    {
        float _159 = in.m_52.x;
        float _161 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _163 = _159 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _165 = fma(_163, (*spvDescriptorSet0.vp_c9)._m0[12].x, _115);
        float _167 = _165 * _161;
        float _169 = floor(_167);
        float _171 = -_169;
        float _173 = _167 + _171;
        _175 = _173;
        _177 = true;
    }
    else
    {
        float _179 = float(_83);
        float _181 = 1.0 / _179;
        float _183 = _115 * _181;
        _175 = _183;
    }
    _177 = false;
    float _185 = _175;
    float _187 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _189 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _187;
    float _191 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _193 = _191 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _195 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _197 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _195;
    float _199 = 1.0 / _189;
    float _201 = -(*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _203 = (*spvDescriptorSet0.vp_c9)._m0[148].w + _201;
    float _205 = -(*spvDescriptorSet0.vp_c9)._m0[148].w;
    float _207 = _205 + (*spvDescriptorSet0.vp_c9)._m0[149].w;
    float _209 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _211 = _209 + (*spvDescriptorSet0.vp_c9)._m0[147].w;
    bool _213 = _185 >= (*spvDescriptorSet0.vp_c9)._m0[150].w;
    bool _215 = isnan(_185);
    bool _217 = _213 || _215;
    bool _219 = isnan((*spvDescriptorSet0.vp_c9)._m0[150].w);
    bool _221 = _217 || _219;
    float _223 = float(_221);
    bool _225 = _185 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _227 = isnan(_185);
    bool _229 = _225 || _227;
    bool _231 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _233 = _229 || _231;
    float _235 = float(_233);
    float _237 = 1.0 / _193;
    float _239 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _241 = _185 + _239;
    float _243 = -_235;
    float _245 = _243 + 1.0;
    float _247 = 1.0 / _197;
    float _249 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _251 = _185 + _249;
    float _253 = _241 * _199;
    float _255 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _257 = _185 + _255;
    float _259 = -(*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _261 = _185 + _259;
    bool _263 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].x;
    float _265 = 1.0 / _203;
    float _267 = -(*spvDescriptorSet0.vp_c9)._m0[149].w;
    float _269 = (*spvDescriptorSet0.vp_c9)._m0[150].w + _267;
    float _271 = _251 * _237;
    bool _273 = _185 >= (*spvDescriptorSet0.vp_c9)._m0[149].w;
    bool _275 = isnan(_185);
    bool _277 = _273 || _275;
    bool _279 = isnan((*spvDescriptorSet0.vp_c9)._m0[149].w);
    bool _281 = _277 || _279;
    float _283 = float(_281);
    float _285 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _287 = _185 + _285;
    float _289 = 1.0 / _207;
    float _291 = _257 * _247;
    float _293 = -_223;
    float _295 = _293 + 1.0;
    float _297 = -_283;
    float _299 = _297 + 1.0;
    bool _301 = _185 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _303 = isnan(_185);
    bool _305 = _301 || _303;
    bool _307 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _309 = _305 || _307;
    float _311 = float(_309);
    float _313 = _283 * _295;
    float _315 = 1.0 / _269;
    float _317 = _261 * _265;
    float _319 = -(*spvDescriptorSet0.vp_c9)._m0[148].w;
    float _321 = _185 + _319;
    bool _323 = _185 >= (*spvDescriptorSet0.vp_c9)._m0[147].w;
    bool _325 = isnan(_185);
    bool _327 = _323 || _325;
    bool _329 = isnan((*spvDescriptorSet0.vp_c9)._m0[147].w);
    bool _331 = _327 || _329;
    float _333 = float(_331);
    float _335 = _311 * _245;
    float _337 = -_311;
    float _339 = _337 + 1.0;
    float _341 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _343 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _341;
    float _345 = 1.0 / _211;
    float _347 = _321 * _289;
    float _349 = -_333;
    float _351 = _349 + 1.0;
    float _353 = -(*spvDescriptorSet0.vp_c9)._m0[149].w;
    float _355 = _185 + _353;
    float _357 = fma(_343, _291, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _359 = _355 * _315;
    bool _361 = _185 >= (*spvDescriptorSet0.vp_c9)._m0[148].w;
    bool _363 = isnan(_185);
    bool _365 = _361 || _363;
    bool _367 = isnan((*spvDescriptorSet0.vp_c9)._m0[148].w);
    bool _369 = _365 || _367;
    float _371 = float(_369);
    float _373 = _371 * _299;
    float _375 = -_371;
    float _377 = _375 + 1.0;
    float _379 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _381 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _379;
    float _383 = _287 * _345;
    float _385 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _387 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _385;
    float _389 = _333 * _377;
    float _391 = _235 * _351;
    bool _393 = _185 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _395 = isnan(_185);
    bool _397 = _393 || _395;
    bool _399 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _401 = _397 || _399;
    float _403 = float(_401);
    float _405 = fma(_381, _253, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    bool _407 = _185 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _409 = isnan(_185);
    bool _411 = _407 || _409;
    bool _413 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _415 = _411 || _413;
    float _417 = float(_415);
    float _419 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _421 = _419 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _423 = fma(_387, _253, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _425 = -_403;
    float _427 = _425 + 1.0;
    float _429 = _403 * _339;
    float _431 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _433 = _431 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _435 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _437 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _435;
    float _439 = _417 * _427;
    float _441 = -_417;
    float _443 = _441 + 1.0;
    float _445 = fma(_421, _271, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _447 = fma(_433, _271, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _449 = _405 * _439;
    float _451 = _423 * _439;
    float _453 = -(*spvDescriptorSet0.vp_c9)._m0[146].x;
    float _455 = _453 + (*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _457 = -(*spvDescriptorSet0.vp_c9)._m0[146].y;
    float _459 = _457 + (*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _461 = fma(_443, (*spvDescriptorSet0.vp_c9)._m0[143].x, _449);
    float _463 = fma(_455, _383, (*spvDescriptorSet0.vp_c9)._m0[146].x);
    float _465 = fma(_459, _383, (*spvDescriptorSet0.vp_c9)._m0[146].y);
    float _467 = fma(_443, (*spvDescriptorSet0.vp_c9)._m0[143].y, _451);
    float _469 = -(*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _471 = (*spvDescriptorSet0.vp_c9)._m0[148].x + _469;
    float _473 = -(*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _475 = (*spvDescriptorSet0.vp_c9)._m0[148].y + _473;
    float _477 = fma(_437, _291, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _479 = fma(_445, _429, _461);
    float _481 = fma(_447, _429, _467);
    float _483 = fma(_471, _317, (*spvDescriptorSet0.vp_c9)._m0[147].x);
    float _485 = fma(_475, _317, (*spvDescriptorSet0.vp_c9)._m0[147].y);
    float _487 = fma(_477, _335, _479);
    float _489 = -(*spvDescriptorSet0.vp_c9)._m0[148].x;
    float _491 = _489 + (*spvDescriptorSet0.vp_c9)._m0[149].x;
    float _493 = -(*spvDescriptorSet0.vp_c9)._m0[148].y;
    float _495 = _493 + (*spvDescriptorSet0.vp_c9)._m0[149].y;
    float _497 = fma(_357, _335, _481);
    float _499 = fma(_491, _347, (*spvDescriptorSet0.vp_c9)._m0[148].x);
    float _501 = fma(_495, _347, (*spvDescriptorSet0.vp_c9)._m0[148].y);
    float _503 = fma(_463, _391, _487);
    float _505 = fma(_465, _391, _497);
    float _507 = -(*spvDescriptorSet0.vp_c9)._m0[149].x;
    float _509 = (*spvDescriptorSet0.vp_c9)._m0[150].x + _507;
    float _511 = -(*spvDescriptorSet0.vp_c9)._m0[149].y;
    float _513 = (*spvDescriptorSet0.vp_c9)._m0[150].y + _511;
    float _515 = fma(_483, _389, _503);
    float _517 = fma(_485, _389, _505);
    float _519 = fma(_509, _359, (*spvDescriptorSet0.vp_c9)._m0[149].x);
    float _521 = fma(_513, _359, (*spvDescriptorSet0.vp_c9)._m0[149].y);
    float _523 = fma(_499, _373, _515);
    float _525 = fma(_501, _373, _517);
    float _527 = fma(_519, _313, _523);
    float _529 = fma(_521, _313, _525);
    float _531 = fma(_223, (*spvDescriptorSet0.vp_c9)._m0[150].x, _527);
    float _533 = fma(_223, (*spvDescriptorSet0.vp_c9)._m0[150].y, _529);
    bool _535 = !_263;
    float _555;
    float _557;
    if (!_535)
    {
        float _537 = in.m_52.x;
        float _539 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].x;
        float _541 = float(_83);
        float _543 = _537 * (*spvDescriptorSet0.vp_c9)._m0[12].y;
        float _545 = fma(_543, (*spvDescriptorSet0.vp_c9)._m0[11].x, _115);
        float _547 = _545 * _539;
        float _549 = floor(_547);
        float _551 = -_549;
        float _553 = _547 + _551;
        _555 = _541;
        _557 = _553;
        _559 = true;
    }
    else
    {
        float _561 = float(_83);
        float _563 = 1.0 / _561;
        float _565 = _115 * _563;
        _555 = _561;
        _557 = _565;
    }
    _559 = false;
    float _567 = _555;
    float _569 = _557;
    float _571 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _573 = int(_571);
    float _575 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _577 = int(_575);
    float _579 = float(_573);
    float _581 = 1.0 / _567;
    float _583 = float(uint(_577));
    float _585 = 1.0 / _579;
    int _587 = ~_577;
    int _589 = _587 + 1;
    int _591 = ~_577;
    int _593 = _591 + 1;
    int _595 = ~_577;
    int _597 = _595 + 1;
    float _599 = 1.0 / _583;
    float _601 = _115 * _585;
    int _603 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _605 = _603 != 0;
    float _607 = trunc(_601);
    int _609 = int(_607);
    float _611 = float(_577);
    int _613 = as_type<int>(_599) + (-2);
    float _615 = float(uint(_609));
    float _617 = float(_609);
    float _619 = as_type<float>(_613) * _615;
    bool _621 = _617 >= _611;
    bool _623 = isnan(_617);
    bool _625 = _621 || _623;
    bool _627 = isnan(_611);
    bool _629 = _625 || _627;
    float _631 = float(_629);
    float _633 = in.m_52.x;
    float _635 = in.m_52.y;
    float _637 = trunc(_619);
    float _639 = precise::max(_637, 0.0);
    uint _642 = uint(_639);
    float _644 = trunc(_631);
    int _646 = int(_644);
    int _648 = _589 * int(_642);
    int _650 = _648 + _609;
    float _652 = float(uint(_650));
    float _654 = as_type<float>(_613) * _652;
    bool _656 = !_605;
    float _658 = _656 ? 7.345489978790283203125 : 1.0;
    float _660 = trunc(_654);
    float _662 = precise::max(_660, 0.0);
    uint _664 = uint(_662);
    float _666 = _658 * _633;
    float _668 = floor(_666);
    int _670 = int(_642) + int(_664);
    int _672 = _593 * _670;
    int _674 = _672 + _609;
    int _676 = ~_646;
    int _678 = _676 + 1;
    int _680 = _678 + 1;
    float _682 = -_668;
    float _684 = _666 + _682;
    bool _686 = uint(_674) >= uint(_577);
    float _688 = _684 * _611;
    float _690 = _115 * _611;
    bool _692 = !_686;
    int _694 = _692 ? 0 : (-1);
    bool _696 = _577 == 0;
    float _698 = _690 * _581;
    int _700 = ~_670;
    int _702 = _700 + _694;
    int _704 = _702 + 1;
    int _706 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _708 = _706 != 0;
    int _710 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _712 = _710 != 0;
    int _714 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _716 = _714 != 0;
    float _718 = trunc(_688);
    int _720 = int(_718);
    int _722 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _724 = _722 != 0;
    int _726 = _577 * _704;
    int _728 = _726 + _609;
    int _730 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _732 = _730 != 0;
    bool _734 = !_712;
    int _736 = _734 ? 0 : 1;
    bool _738 = !_696;
    int _740 = _738 ? _728 : (-1);
    float _742 = trunc(_698);
    int _744 = int(_742);
    int _746 = _577 + (-1);
    int _748 = _740 * _680;
    bool _750 = !_724;
    int _752 = _750 ? 0 : 1;
    int _754 = _646 * _746;
    int _756 = _754 + _748;
    bool _758 = !_708;
    int _760 = _758 ? 0 : 1;
    int _762 = abs(_736);
    bool _764 = !_716;
    int _766 = _764 ? 0 : 1;
    int _768 = abs(_760);
    int _770 = _756 * _762;
    int _772 = abs(_752);
    bool _774 = !_732;
    int _776 = _774 ? 0 : 1;
    int _778 = abs(_766);
    int _780 = _720 * _772;
    int _782 = _780 + _609;
    int _784 = abs(_776);
    int _786 = _744 * _768;
    int _788 = _786 + _770;
    int _790 = ~_577;
    int _792 = _790 + 1;
    int _794 = _782 * _778;
    int _796 = _794 + _788;
    int _798 = ~_577;
    int _800 = _798 + 1;
    int _802 = _720 * _784;
    int _804 = _802 + _796;
    float _806 = float(uint(_804));
    float _808 = as_type<float>(_613) * _806;
    float _810 = trunc(_808);
    float _812 = precise::max(_810, 0.0);
    uint _814 = uint(_812);
    int _816 = _800 * int(_814);
    int _818 = _816 + _804;
    float _820 = float(uint(_818));
    float _822 = as_type<float>(_613) * _820;
    float _824 = trunc(_822);
    float _826 = precise::max(_824, 0.0);
    uint _828 = uint(_826);
    int _830 = int(_814) + int(_828);
    int _832 = _792 * _830;
    int _834 = _832 + _804;
    bool _836 = uint(_834) >= uint(_577);
    float _838 = float(uint(_782));
    bool _840 = !_836;
    int _842 = _840 ? 0 : (-1);
    float _844 = as_type<float>(_613) * _838;
    int _846 = ~_830;
    int _848 = _846 + _842;
    int _850 = _848 + 1;
    int _852 = _577 * _850;
    int _854 = _852 + _804;
    float _856 = trunc(_844);
    float _858 = precise::max(_856, 0.0);
    uint _860 = uint(_858);
    int _862 = ~_577;
    int _864 = _862 + 1;
    bool _866 = !_696;
    int _868 = _866 ? _854 : (-1);
    int _870 = _868 >> 31;
    int _872 = _868 & 3;
    bool _874 = _872 != 0;
    int _876 = _870 & 3;
    int _878 = _868 + _876;
    int _880 = _878 >> 2;
    int _882 = _864 * int(_860);
    int _884 = _882 + _782;
    int _886 = _880 << 4;
    int _888 = _886 + 368;
    uint _890 = uint(int(uint(_888) >> uint(2)));
    uint _892 = uint(int(uint(int(_890)) >> uint(2)));
    int _894 = int(_890) & 3;
    float _896 = (*spvDescriptorSet0.vp_c9)._m0[int(_892)][_894];
    int _898 = int(_890) + 1;
    uint _900 = uint(int(uint(_898) >> uint(2)));
    int _902 = _898 & 3;
    float _904 = (*spvDescriptorSet0.vp_c9)._m0[int(_900)][_902];
    float _906 = float(uint(_884));
    float _908 = as_type<float>(_613) * _906;
    int _910 = _868 & 3;
    bool _912 = _910 != 0;
    int _914 = _888 + 8;
    uint _916 = uint(int(uint(_914) >> uint(2)));
    uint _918 = uint(int(uint(int(_916)) >> uint(2)));
    int _920 = int(_916) & 3;
    float _922 = (*spvDescriptorSet0.vp_c9)._m0[int(_918)][_920];
    int _924 = int(_916) + 1;
    uint _926 = uint(int(uint(_924) >> uint(2)));
    int _928 = _924 & 3;
    float _930 = (*spvDescriptorSet0.vp_c9)._m0[int(_926)][_928];
    int _932 = _874 ? 0 : 1;
    bool _934 = uint(_910) > 1u;
    float _936 = trunc(_908);
    float _938 = precise::max(_936, 0.0);
    uint _940 = uint(_938);
    bool _942 = _910 != 3;
    bool _944 = uint(_910) >= 2u;
    int _946 = ~_932;
    int _948 = _946 + 1;
    int _950 = _948 + 1;
    int _952 = _950;
    if (!_934)
    {
        int _954 = ~_932;
        int _956 = _954 + 1;
        _952 = _956;
    }
    int _958 = _952;
    bool _960 = !_912;
    int _962 = _960 ? 0 : 1;
    int _964 = int(_860) + int(_940);
    int _966 = abs(_958);
    int _968 = abs(_962);
    int _970 = _597 * _964;
    int _972 = _970 + _782;
    int _974 = _944 ? 0 : 1;
    float _976 = trunc((*spvDescriptorSet0.vp_c9)._m0[80].z);
    int _978 = int(_976);
    bool _980 = _910 != 3;
    int _982 = ~_974;
    int _984 = _982 + 1;
    int _986 = _984 + 1;
    int _988 = _986;
    if (_942)
    {
        int _990 = ~_974;
        int _992 = _990 + 1;
        _988 = _992;
    }
    int _994 = _988;
    int _996 = ~_966;
    int _998 = _996 + 1;
    int _1000 = _998 + 1;
    int _1002 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _1004 = _1002 != 0;
    int _1006 = abs(_994);
    int _1008 = _1000 * as_type<int>(_904);
    bool _1010 = !_980;
    int _1012 = _1010 ? 0 : (-1);
    int _1014 = ~_968;
    int _1016 = _1014 + 1;
    int _1018 = _1016 + 1;
    bool _1020 = !_1004;
    int _1022 = _1020 ? 0 : 1;
    int _1024 = abs(_1012);
    int _1026 = _1018 * as_type<int>(_896);
    int _1028 = _1026 + _1008;
    bool _1030 = uint(_972) >= uint(_577);
    int _1032 = ~_1006;
    int _1034 = _1032 + 1;
    int _1036 = _1034 + 1;
    int _1038 = abs(_1022);
    int _1040 = _1036 * as_type<int>(_922);
    int _1042 = _1040 + _1028;
    bool _1044 = !_1030;
    int _1046 = _1044 ? 0 : (-1);
    float _1048 = float(uint(_978));
    int _1050 = ~_1024;
    int _1052 = _1050 + 1;
    int _1054 = _1052 + 1;
    int _1056 = ~_964;
    int _1058 = _1056 + _1046;
    int _1060 = _1058 + 1;
    int _1062 = abs(_978);
    float _1064 = 1.0 / _1048;
    int _1066 = _1054 * as_type<int>(_930);
    int _1068 = _1066 + _1042;
    int _1070 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1072 = _1070 != 0;
    int _1074 = _577 * _1060;
    int _1076 = _1074 + _782;
    float _1078 = float(uint(_1062));
    int _1080 = ~_1038;
    int _1082 = _1080 + 1;
    int _1084 = _1082 + 1;
    bool _1086 = !_696;
    int _1088 = _1086 ? _1076 : (-1);
    float _1090 = 1.0 / _1078;
    int _1092 = _1068 * _1084;
    int _1094 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1096 = _1094 != 0;
    float _1098 = _633 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    int _1100 = ~_978;
    int _1102 = _1100 + 1;
    int _1104 = _1088 * _1038;
    int _1106 = _1104 + _1092;
    int _1108 = as_type<int>(_1064) + (-2);
    int _1110 = ~_1062;
    int _1112 = _1110 + 1;
    float _1114 = float(uint(_1106));
    int _1116 = abs(_1106);
    bool _1118 = _633 > 0.5;
    float _1120 = as_type<float>(_1108) * _1114;
    int _1122 = as_type<int>(_1090) + (-2);
    float _1124 = float(uint(_1116));
    float _1126 = trunc(_1120);
    float _1128 = precise::max(_1126, 0.0);
    uint _1130 = uint(_1128);
    float _1132 = as_type<float>(_1122) * _1124;
    bool _1134 = _635 > 0.5;
    float _1136 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    bool _1138 = _978 == 0;
    float _1140 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _1142 = trunc(_1132);
    float _1144 = precise::max(_1142, 0.0);
    uint _1146 = uint(_1144);
    float _1148 = -_1136;
    float _1150 = fma(_1098, 2.0, _1148);
    float _1152 = fma(_633, (*spvDescriptorSet0.vp_c9)._m0[78].z, _1140);
    float _1154 = in.m_42.x;
    float _1156 = in.m_42.y;
    float _1158 = in.m_42.z;
    float _1160 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _1162 = (*spvDescriptorSet0.vp_c9)._m0[108].w + _1160;
    int _1164 = _1102 * int(_1130);
    int _1166 = _1164 + _1106;
    float _1168 = 1.0 / _1162;
    float _1170 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _1172 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _1174 = float(uint(_1166));
    int _1176 = _1112 * int(_1146);
    int _1178 = _1176 + _1116;
    float _1180 = as_type<float>(_1108) * _1174;
    float _1182 = _635 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _1184 = fma(_635, (*spvDescriptorSet0.vp_c9)._m0[78].w, _1172);
    float _1186 = float(uint(_1178));
    float _1188 = trunc(_1180);
    float _1190 = precise::max(_1188, 0.0);
    uint _1192 = uint(_1190);
    float _1194 = fma(_1182, -2.0, _1170);
    int _1196 = ~_978;
    int _1198 = _1196 + 1;
    float _1200 = as_type<float>(_1122) * _1186;
    float _1202 = _1156 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _1204 = _1156 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _1206 = _1156 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _1208 = trunc(_1200);
    float _1210 = precise::max(_1208, 0.0);
    uint _1212 = uint(_1210);
    float _1214 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _1216 = _569 + _1214;
    float _1218 = fma(_1154, (*spvDescriptorSet0.vp_c10)._m0[4].x, _1202);
    float _1220 = fma(_1154, (*spvDescriptorSet0.vp_c10)._m0[5].x, _1204);
    float _1222 = fma(_1154, (*spvDescriptorSet0.vp_c10)._m0[6].x, _1206);
    float _1224 = _1216 * _1168;
    float _1226 = -_115;
    float _1228 = fma(_1226, (*spvDescriptorSet0.vp_c9)._m0[76].x, _1150);
    float _1230 = fma(_115, (*spvDescriptorSet0.vp_c9)._m0[77].z, _1152);
    int _1232 = int(_1130) + int(_1192);
    float _1234 = fma(_115, (*spvDescriptorSet0.vp_c9)._m0[76].y, _1194);
    float _1236 = fma(_115, (*spvDescriptorSet0.vp_c9)._m0[77].w, _1184);
    float _1238 = fma(_1158, (*spvDescriptorSet0.vp_c10)._m0[4].z, _1218);
    float _1240 = fma(_1158, (*spvDescriptorSet0.vp_c10)._m0[5].z, _1220);
    float _1242 = fma(_1158, (*spvDescriptorSet0.vp_c10)._m0[6].z, _1222);
    int _1244 = _1198 * _1232;
    int _1246 = _1244 + _1106;
    float _1248 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _1250 = _1238 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    int _1252 = int(_1146) + int(_1212);
    float _1254 = -(*spvDescriptorSet0.vp_c9)._m0[107].x;
    float _1256 = (*spvDescriptorSet0.vp_c9)._m0[108].x + _1254;
    int _1258 = ~_1062;
    int _1260 = _1258 + 1;
    float _1262 = _1242 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    bool _1264 = uint(_1246) >= uint(_978);
    float _1266 = -(*spvDescriptorSet0.vp_c9)._m0[107].z;
    float _1268 = (*spvDescriptorSet0.vp_c9)._m0[108].z + _1266;
    int _1270 = _1260 * _1252;
    int _1272 = _1270 + _1116;
    float _1274 = fma(_1256, _1224, (*spvDescriptorSet0.vp_c9)._m0[107].x);
    bool _1276 = _569 >= (*spvDescriptorSet0.vp_c9)._m0[108].w;
    bool _1278 = isnan(_569);
    bool _1280 = _1276 || _1278;
    bool _1282 = isnan((*spvDescriptorSet0.vp_c9)._m0[108].w);
    bool _1284 = _1280 || _1282;
    float _1286 = float(_1284);
    float _1288 = fma(_1268, _1224, (*spvDescriptorSet0.vp_c9)._m0[107].z);
    bool _1290 = _569 >= (*spvDescriptorSet0.vp_c9)._m0[107].w;
    bool _1292 = isnan(_569);
    bool _1294 = _1290 || _1292;
    bool _1296 = isnan((*spvDescriptorSet0.vp_c9)._m0[107].w);
    bool _1298 = _1294 || _1296;
    float _1300 = float(_1298);
    float _1302 = -(*spvDescriptorSet0.vp_c9)._m0[107].y;
    float _1304 = (*spvDescriptorSet0.vp_c9)._m0[108].y + _1302;
    bool _1306 = uint(_1272) >= uint(_1062);
    float _1308 = -_1286;
    float _1310 = _1308 + 1.0;
    bool _1312 = !_1264;
    int _1314 = _1312 ? 0 : (-1);
    float _1316 = fma(_1304, _1224, (*spvDescriptorSet0.vp_c9)._m0[107].y);
    int _1318 = _1106 ^ _978;
    float _1320 = _1300 * _1310;
    int _1322 = ~_1232;
    int _1324 = _1322 + _1314;
    int _1326 = _1324 + 1;
    float _1328 = -_1300;
    float _1330 = _1328 + 1.0;
    bool _1332 = _978 == 0;
    float _1334 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    uint _1336 = uint(int(uint(_1318) >> uint(31)));
    int _1338 = _978 * _1326;
    int _1340 = _1338 + _1106;
    float _1342 = _1274 * _1320;
    bool _1344 = !_1306;
    int _1346 = _1344 ? 0 : (-1);
    float _1348 = _1316 * _1320;
    int _1350 = ~int(_1336);
    int _1352 = _1350 + 1;
    float _1354 = _1288 * _1320;
    int _1356 = ~_1346;
    int _1358 = _1252 + _1356;
    int _1360 = _1358 + 1;
    float _1362 = _1248 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    bool _1364 = !_1332;
    int _1366 = _1364 ? _1340 : (-1);
    float _1368 = fma(_1330, (*spvDescriptorSet0.vp_c9)._m0[107].y, _1348);
    int _1370 = _1360 ^ _1352;
    float _1372 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1374 = _1250 + _1372;
    float _1376 = float(_1366);
    float _1378 = fma(_1330, (*spvDescriptorSet0.vp_c9)._m0[107].x, _1342);
    int _1380 = ~_1352;
    int _1382 = _1380 + _1370;
    int _1384 = _1382 + 1;
    float _1386 = fma(_1330, (*spvDescriptorSet0.vp_c9)._m0[107].z, _1354);
    float _1388 = -_151;
    int _1390 = _1118 ? as_type<int>(_1388) : as_type<int>(_151);
    float _1392 = fma(_1362, _1376, _1228);
    float _1394 = _1240 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _1396 = _1334 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    bool _1398 = !_1072;
    float _1400 = _1398 ? _151 : as_type<float>(_1390);
    float _1402 = -_1230;
    float _1404 = _1402 + 1.0;
    float _1406 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1408 = _1394 + _1406;
    bool _1410 = !_1138;
    int _1412 = _1410 ? _1384 : (-1);
    float _1414 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1416 = _1262 + _1414;
    float _1418 = -_155;
    int _1420 = _1134 ? as_type<int>(_1418) : as_type<int>(_155);
    float _1422 = _1408 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1424 = _1400 + 0.5;
    float _1426 = float(_1412);
    float _1428 = fma(_1286, (*spvDescriptorSet0.vp_c9)._m0[108].y, _1368);
    float _1430 = fma(_1374, (*spvDescriptorSet0.vp_c8)._m0[28].x, _1422);
    bool _1432 = !_1096;
    float _1434 = _1432 ? _155 : as_type<float>(_1420);
    float _1436 = fma(_1362, _1424, _1392);
    float _1438 = -_1234;
    float _1440 = fma(_1396, _1426, _1438);
    float _1442 = fma(_1416, (*spvDescriptorSet0.vp_c8)._m0[28].z, _1430);
    float _1444 = _1434 + (-0.5);
    float _1446 = -_1404;
    float _1448 = fma(_1400, _1446, _1436);
    float _1450 = _1408 * _1408;
    bool _1452 = _1442 >= 0.0;
    float _1454 = -_1396;
    float _1456 = fma(_1454, _1444, _1440);
    float _1458 = fma(_1286, (*spvDescriptorSet0.vp_c9)._m0[108].x, _1378);
    float _1460 = fma(_1374, _1374, _1450);
    float _1462 = fma(_1286, (*spvDescriptorSet0.vp_c9)._m0[108].z, _1386);
    float _1464 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _1466 = fma(_1416, _1416, _1460);
    float _1468 = _1458 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _1470 = rsqrt(_1466);
    float _1472 = _1462 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1474 = _1200;
    int _1476 = as_type<int>(_1472);
    if (_1452)
    {
        _1474 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _1478 = _1474;
    float _1480 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1482 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1484 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1486 = _1428 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _1488 = -_1236;
    float _1490 = _1488 + 1.0;
    float _1492 = _1468 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1494 = _1472 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1496 = _1480 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1498 = _1482 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1500 = _1484 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1502 = _1486 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1504 = _1500;
    if (_1452)
    {
        float _1506 = _1478 * 5.0;
        _1476 = as_type<int>(_1506);
    }
    int _1508 = _1476;
    float _1510 = fma(_1434, _1490, _1456);
    if (_1452)
    {
        out.m_45.x = 0.0;
    }
    float _1512 = _1408 * _1470;
    float _1514 = _1374 * _1470;
    out.m_54.x = _1496;
    out.m_54.y = _1498;
    out.m_54.z = _1500;
    out.m_56.x = _1492;
    out.m_56.y = _1502;
    out.m_56.z = _1494;
    out.m_56.w = _1464;
    if (_1452)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _4394 = as_type<float>(_1508);
        out.gl_Position.z = _4394;
    }
    out.m_58.x = _1448;
    out.m_58.y = _1510;
    if (_1452)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _1516 = -_1512;
    float _1518 = fma(_1516, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1394);
    float _1520 = _1416 * _1470;
    float _1522 = -_1514;
    float _1524 = fma(_1522, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1250);
    float _1526 = -_1512;
    float _1528 = fma(_1526, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1408);
    float _1530 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1532 = _1518 + _1530;
    float _1534 = -_1520;
    float _1536 = fma(_1534, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1262);
    float _1538 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1540 = _1524 + _1538;
    float _1542 = -_1514;
    float _1544 = fma(_1542, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1374);
    float _1546 = _1532 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1548 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1550 = _1536 + _1548;
    float _1552 = _1528 * _1528;
    float _1554 = in.m_60.x;
    float _1556 = in.m_60.y;
    float _1558 = fma(_1540, (*spvDescriptorSet0.vp_c8)._m0[28].x, _1546);
    float _1560 = -_1520;
    float _1562 = fma(_1560, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1416);
    float _1564 = fma(_1544, _1544, _1552);
    float _1566 = fma(_1550, (*spvDescriptorSet0.vp_c8)._m0[28].z, _1558);
    float _1568 = fma(_1562, _1562, _1564);
    bool _1570 = _1566 >= 0.0;
    float _1572 = sqrt(_1568);
    float _1574 = _1520;
    float _1576 = _1550;
    if (_1570)
    {
        _1504 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _1578 = _1504;
    int _1580 = as_type<int>(_1578);
    if (_1570)
    {
        out.m_45.x = 0.0;
    }
    float _1582 = _531 * _1554;
    float _1584 = _533 * _1556;
    float _1586 = _1470 * _1572;
    if (_1570)
    {
        float _1588 = _1578 * 5.0;
        _1580 = as_type<int>(_1588);
    }
    int _1590 = _1580;
    if (_1570)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _4537 = as_type<float>(_1590);
        out.gl_Position.z = _4537;
    }
    if (_1570)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _1592 = _1584 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1594 = _1582 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1596 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _155);
    float _1598 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _151);
    float _1600 = _1592 * _1586;
    float _1602 = _1594 * _1586;
    float _1604 = _1586 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _1606 = _1604 * 0.5;
    float _1608 = _1596 * _1600;
    float _1610 = _1598 * _1602;
    bool _1612 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _1614 = isnan(0.5);
    bool _1616 = _1612 || _1614;
    bool _1618 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1620 = _1616 || _1618;
    float _1622 = _1608 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1624 = _1608 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1626 = _1608 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1628 = fma(_1610, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1622);
    float _1630 = fma(_1610, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1624);
    float _1632 = fma(_1610, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1626);
    float _1634 = fma(_1606, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1628);
    float _1636 = fma(_1606, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1630);
    float _1638 = fma(_1606, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1632);
    float _1640 = _1634 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _1642 = _1636 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _1644 = _1638 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _1646 = _1262 + _1640;
    float _1648 = _1250 + _1642;
    float _1650 = _1394 + _1644;
    float _1652 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1654 = _1646 + _1652;
    float _1656 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1658 = _1648 + _1656;
    float _1660 = _1654 * _1654;
    float _1662 = fma(_1658, _1658, _1660);
    float _1664 = sqrt(_1662);
    bool _1666 = _1664 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1668 = _1644;
    float _1670 = _1638;
    float _1672 = _1636;
    float _1674 = _1646;
    if (!_1666)
    {
        _1668 = _1648;
    }
    float _1676 = _1668;
    float _1678 = _1676;
    if (!_1666)
    {
        _1670 = _1646;
    }
    float _1680 = _1670;
    float _1682 = _1680;
    if (!_1666)
    {
        _1672 = _1650;
    }
    float _1684 = _1672;
    bool _1686 = !_1666;
    float _1688 = _1684;
    if (!_1686)
    {
        float _1690 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1692 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1694 = _1664 + _1692;
        float _1696 = rsqrt(_1662);
        float _1698 = _1694 * _1690;
        float _1700 = _1650 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1702 = _1698 * 0.15915493667125701904296875;
        float _1704 = _1702 * 6.283185482025146484375;
        float _1706 = sin(_1704);
        float _1708 = _1702 * 6.283185482025146484375;
        float _1710 = cos(_1708);
        float _1712 = fma(_1706, _1700, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1714 = _1696 * _1712;
        float _1716 = _1710 + (-1.0);
        float _1718 = fma(_1658, _1714, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1720 = fma(_1654, _1714, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _1722 = _1716 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1724 = fma(_1650, _1710, _1722);
        _1678 = _1718;
        _1682 = _1720;
        _1688 = _1724;
    }
    float _1726 = _1678;
    float _1728 = _1682;
    float _1730 = _1688;
    float _1732 = -_1514;
    float _1734 = fma(_1732, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1726);
    float _1736 = -_1520;
    float _1738 = fma(_1736, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1728);
    float _1740 = -_1512;
    float _1742 = fma(_1740, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1730);
    float _1744 = _1742;
    float _1746 = _1738;
    if (_1620)
    {
        _1574 = _1734;
    }
    float _1748 = _1574;
    float _1750 = _1748;
    if (!_1620)
    {
        float _1752 = _1532 * _1532;
        float _1754 = 1.0 / _1586;
        float _1756 = -_1250;
        float _1758 = _1756 + _1726;
        float _1760 = -_1394;
        float _1762 = _1760 + _1730;
        float _1764 = fma(_1540, _1540, _1752);
        float _1766 = fma(_1550, _1550, _1764);
        float _1768 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1770 = sqrt(_1766);
        float _1772 = precise::min(_1770, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1774 = _1772 * _1768;
        float _1776 = _1774 * _1754;
        float _1778 = -_1262;
        float _1780 = _1778 + _1728;
        float _1782 = fma(_1758, _1776, _1524);
        float _1784 = fma(_1762, _1776, _1518);
        float _1786 = fma(_1780, _1776, _1536);
        _1744 = _1784;
        _1750 = _1782;
        _1746 = _1786;
        _1576 = _1768;
    }
    float _1788 = _1744;
    float _1790 = _1750;
    float _1792 = _1746;
    float _1794 = _1576;
    float _1796 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1798 = _1788 + _1796;
    float _1800 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1802 = _1790 + _1800;
    float _1804 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1806 = _1792 + _1804;
    float _1808 = _1798 * _1798;
    float _1810 = fma(_1802, _1802, _1808);
    float _1812 = fma(_1806, _1806, _1810);
    float _1814 = rsqrt(_1812);
    float _1816 = _1814 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1818 = _1802 * _1816;
    float _1820 = _1806 * _1816;
    float _1822 = _1818 * _1818;
    float _1824 = _1820 * _1820;
    float _1826 = _1822 + _1824;
    float _1828 = sqrt(_1826);
    bool _1830 = _1828 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1832 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1834 = _1828 + _1832;
    float _1836 = _1814;
    float _1838 = _1826;
    float _1840 = _1834;
    float _1842 = _1794;
    float _1844 = _1798;
    float _1846 = _1818;
    if (_1830)
    {
        float _1848 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1836 = _1848;
    }
    float _1850 = _1836;
    if (_1830)
    {
        float _1852 = rsqrt(_1826);
        _1838 = _1852;
    }
    float _1854 = _1838;
    if (_1830)
    {
        float _1856 = _1834 * _1850;
        _1840 = _1856;
    }
    float _1858 = _1840;
    if (_1830)
    {
        float _1860 = _1858 * 0.15915493667125701904296875;
        _1842 = _1860;
    }
    float _1862 = _1842;
    float _1864 = _1850;
    if (_1830)
    {
        float _1866 = _1862 * 6.283185482025146484375;
        float _1868 = sin(_1866);
        _1864 = _1868;
    }
    float _1870 = _1864;
    float _1872 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1874 = precise::max(0.0, _1872);
    float _1876 = _1806;
    float _1878 = _1874;
    if (_1830)
    {
        float _1880 = _1862 * 6.283185482025146484375;
        float _1882 = cos(_1880);
        _1876 = _1882;
    }
    float _1884 = _1876;
    float _1886 = -_1816;
    float _1888 = -_1874;
    float _1890 = fma(_1798, _1886, _1888);
    float _1892 = _1890;
    if (_1830)
    {
        float _1894 = _1890 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1878 = _1894;
    }
    float _1896 = _1878;
    float _1898 = _1870;
    float _1900 = _1896;
    if (_1830)
    {
        float _1902 = fma(_1870, _1896, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1898 = _1902;
    }
    float _1904 = _1898;
    float _1906 = _1904;
    if (_1830)
    {
        float _1908 = _1884 + (-1.0);
        _1900 = _1908;
    }
    float _1910 = _1900;
    float _1912 = _1910;
    if (_1830)
    {
        float _1914 = _1854 * _1904;
        _1674 = _1914;
    }
    float _1916 = _1674;
    if (!_1830)
    {
        _1906 = _1820;
    }
    float _1918 = _1906;
    float _1920 = sqrt(_1812);
    float _1922 = _1918;
    if (_1830)
    {
        float _1924 = _1910 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1844 = _1924;
    }
    float _1926 = _1844;
    float _1928 = _1926;
    if (_1830)
    {
        float _1930 = _1818 * _1916;
        _1846 = _1930;
    }
    float _1932 = _1846;
    if (!_1830)
    {
        _1912 = _1822;
    }
    float _1934 = _1912;
    float _1936 = _1934;
    if (_1830)
    {
        float _1938 = _1820 * _1916;
        _1922 = _1938;
    }
    float _1940 = _1922;
    if (_1830)
    {
        float _1942 = fma(_1890, _1884, _1926);
        _1892 = _1942;
    }
    float _1944 = _1892;
    if (_1830)
    {
        float _1946 = _1932 * _1932;
        _1936 = _1946;
    }
    float _1948 = _1936;
    if (!_1830)
    {
        _1928 = _1824;
    }
    float _1950 = _1928;
    float _1952 = _1950;
    if (_1830)
    {
        float _1954 = _1940 * _1940;
        _1952 = _1954;
    }
    float _1956 = _1952;
    float _1958 = fma(_1944, _1944, _1948);
    float _1960 = _1788 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1962 = _1958 + _1956;
    float _1964 = _1788 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1966 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1968 = fma(_1920, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1966);
    float _1970 = precise::clamp(_1968, 0.0, 1.0);
    float _1972 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _1974 = rsqrt(_1962);
    float _1976 = fma(_1790, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1964);
    float _1978 = _1788 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1980 = -_1970;
    float _1982 = _1980 + 1.0;
    float _1984 = fma(_1790, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1960);
    float _1986 = fma(_1792, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1976);
    float _1988 = _1788 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1990 = fma(_1790, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1978);
    float _1992 = _1986 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1994 = abs(_1982);
    float _1996 = log2(_1994);
    float _1998 = fma(_1790, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1988);
    float _2000 = fma(_1792, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1990);
    float _2002 = _1992 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _2004 = fma(_1792, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1998);
    float _2006 = _2000 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _2008 = -_2002;
    float _2010 = fma(_2008, _1972, 1.0);
    float _2012 = fma(_1792, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1984);
    float _2014 = _1974 * _1932;
    float _2016 = _2004 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2018 = _2006 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _2020 = _1974 * _1944;
    float _2022 = _2014 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _2024 = _1974 * _1940;
    float _2026 = fma(_2016, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2018);
    float _2028 = _1996 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _2030 = -_2022;
    float _2032 = fma(_2020, (*spvDescriptorSet0.vp_c15)._m0[21].y, _2030);
    float _2034 = _2012 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _2036 = fma(_1992, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2026);
    float _2038 = exp2(_2028);
    float _2040 = -_2024;
    float _2042 = fma(_2040, (*spvDescriptorSet0.vp_c15)._m0[21].z, _2032);
    float _2044 = _2006 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2046 = fma(_2034, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2036);
    float _2048 = _2006 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2050 = fma(_2042, -0.5, 0.5);
    float _2052 = fma(_2016, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2044);
    float _2054 = log2(_2010);
    float _2056 = fma(_2042, 0.5, 0.5);
    float _2058 = fma(_2016, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2048);
    float _2060 = _2020 + 1.0;
    float _2062 = fma(_1992, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2052);
    float _2064 = fma(_2056, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _2066 = fma(_1992, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2058);
    float _2068 = 1.0 / _2046;
    float _2070 = -_2020;
    float _2072 = fma(_2038, _2060, _2070);
    float _2074 = fma(_2034, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2062);
    float _2076 = fma(_2056, _2064, -0.212114393711090087890625);
    float _2078 = fma(_2034, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2066);
    float _2080 = fma(_2072, 0.5, 0.5);
    float _2082 = fma(_2056, _2076, 1.570728778839111328125);
    float _2084 = sqrt(_2050);
    float _2086 = _2054 * 0.693147182464599609375;
    float _2088 = _2074 * _2068;
    float _2090 = _2078 * _2068;
    float _2092 = _2086 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _2094 = fma(_2088, 0.5, 0.5);
    float _2096 = fma(_2090, -0.5, 0.5);
    float _2098 = _2084 * 0.636619746685028076171875;
    float3 _5381 = float3(_2094, _2096, _2092);
    float _2100 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_5381, float3(0.0), isnan(_5381)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_5381, float3(0.0), isnan(_5381)), level(0.0)).x;
    float3 _5392 = float3(_2094, _2096, _2092);
    float4 _2103 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_5392, float3(0.0), isnan(_5392)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_5392, float3(0.0), isnan(_5392)), level(0.0)).xyzw;
    float _2105 = _2103.x;
    float _2107 = _2103.y;
    float _2109 = _2103.z;
    float _2111 = _2103.w;
    float _2113 = -_2082;
    float _2115 = fma(_2098, _2113, 1.0);
    float2 _5414 = float2(_2115, _2080);
    float3 _2119 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_5414, float2(0.0), isnan(_5414)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_5414, float2(0.0), isnan(_5414)), level(0.0)).xyz;
    float _2121 = _2119.x;
    float _2123 = _2119.y;
    float _2125 = _2119.z;
    float _2127 = _1996 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _2129 = _2006 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _2131 = fma(_2016, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2129);
    float _2133 = exp2(_2127);
    float _2135 = fma(_1992, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2131);
    float _2137 = fma(_2034, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2135);
    float _2139 = _2137 + _2046;
    out.gl_Position.x = _2074;
    out.gl_Position.y = _2078;
    out.gl_Position.z = _2137;
    out.gl_Position.w = _2046;
    float _2141 = _2139 * 0.5;
    float _2143 = -_2133;
    float _2145 = _2143 + 1.0;
    float _2147 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2149 = _2145 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    out.m_62.z = _2141;
    out.m_62.w = _2046;
    out.m_45.x = _2147;
    float _2151 = _2149 * _2100;
    float _2153 = -_2149;
    float _2155 = _2153 + 1.0;
    float _2157 = _2111 * _2151;
    float _2159 = _2125 * _2151;
    float _2161 = fma(_2121, _2157, _2105);
    float _2163 = fma(_2123, _2157, _2107);
    float _2165 = _2111 * _2155;
    float _2167 = fma(_2111, _2159, _2109);
    out.m_64.x = _2161;
    out.m_64.y = _2163;
    out.m_64.z = _2167;
    out.m_64.w = _2165;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_56 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_54 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_62 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_45 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_58 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_64 = float4(0.0, 0.0, 0.0, 1.0);
    bool _559 = false;
    bool _177 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _78 = in.m_42.w;
    float _80 = trunc(_78);
    int _83 = int(_80);
    bool _87 = _83 >= 1;
    float _89 = 0.0;
    if (!_87)
    {
        _89 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _91 = _89;
    float _93 = _91;
    if (!_87)
    {
        out.m_45.x = 0.0;
    }
    int _95 = 0;
    if (!_87)
    {
        float _97 = _91 * 5.0;
        _95 = as_type<int>(_97);
    }
    int _99 = _95;
    if (!_87)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2223 = as_type<float>(_99);
        out.gl_Position.z = _2223;
    }
    if (!_87)
    {
        return out;
    }
    float _101 = in.m_47.w;
    bool _103 = _101 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _105 = isnan(_101);
    bool _107 = _103 || _105;
    bool _109 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _111 = _107 || _109;
    float _113 = -_101;
    float _115 = _113 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    if (_111)
    {
        float _117 = float(_83);
        _93 = _117;
    }
    float _119 = _93;
    bool _121 = _115 >= _119;
    bool _123 = !_111;
    bool _125 = _121 || _123;
    float _127 = _119;
    if (_125)
    {
        _127 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _129 = _127;
    if (_125)
    {
        out.m_45.x = 0.0;
    }
    int _131 = 0;
    if (_125)
    {
        float _133 = _129 * 5.0;
        _131 = as_type<int>(_133);
    }
    int _135 = _131;
    if (_125)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2292 = as_type<float>(_135);
        out.gl_Position.z = _2292;
    }
    if (_125)
    {
        return out;
    }
    float _137 = as_type<float>(int(gl_VertexIndex));
    bool _139 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    int _141 = as_type<int>(_137) & 1;
    bool _143 = _141 != 0;
    int _145 = as_type<int>(_137) & 2;
    bool _147 = _145 != 0;
    bool _149 = !_143;
    float _151 = _149 ? (-0.5) : 0.5;
    bool _153 = !_147;
    float _155 = _153 ? (-0.5) : 0.5;
    bool _157 = !_139;
    float _175;
    if (!_157)
    {
        float _159 = in.m_52.x;
        float _161 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _163 = _159 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _165 = fma(_163, (*spvDescriptorSet0.vp_c9)._m0[12].x, _115);
        float _167 = _165 * _161;
        float _169 = floor(_167);
        float _171 = -_169;
        float _173 = _167 + _171;
        _175 = _173;
        _177 = true;
    }
    else
    {
        float _179 = float(_83);
        float _181 = 1.0 / _179;
        float _183 = _115 * _181;
        _175 = _183;
    }
    _177 = false;
    float _185 = _175;
    float _187 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _189 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _187;
    float _191 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _193 = _191 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _195 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _197 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _195;
    float _199 = 1.0 / _189;
    float _201 = -(*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _203 = (*spvDescriptorSet0.vp_c9)._m0[148].w + _201;
    float _205 = -(*spvDescriptorSet0.vp_c9)._m0[148].w;
    float _207 = _205 + (*spvDescriptorSet0.vp_c9)._m0[149].w;
    float _209 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _211 = _209 + (*spvDescriptorSet0.vp_c9)._m0[147].w;
    bool _213 = _185 >= (*spvDescriptorSet0.vp_c9)._m0[150].w;
    bool _215 = isnan(_185);
    bool _217 = _213 || _215;
    bool _219 = isnan((*spvDescriptorSet0.vp_c9)._m0[150].w);
    bool _221 = _217 || _219;
    float _223 = float(_221);
    bool _225 = _185 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _227 = isnan(_185);
    bool _229 = _225 || _227;
    bool _231 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _233 = _229 || _231;
    float _235 = float(_233);
    float _237 = 1.0 / _193;
    float _239 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _241 = _185 + _239;
    float _243 = -_235;
    float _245 = _243 + 1.0;
    float _247 = 1.0 / _197;
    float _249 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _251 = _185 + _249;
    float _253 = _241 * _199;
    float _255 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _257 = _185 + _255;
    float _259 = -(*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _261 = _185 + _259;
    bool _263 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].x;
    float _265 = 1.0 / _203;
    float _267 = -(*spvDescriptorSet0.vp_c9)._m0[149].w;
    float _269 = (*spvDescriptorSet0.vp_c9)._m0[150].w + _267;
    float _271 = _251 * _237;
    bool _273 = _185 >= (*spvDescriptorSet0.vp_c9)._m0[149].w;
    bool _275 = isnan(_185);
    bool _277 = _273 || _275;
    bool _279 = isnan((*spvDescriptorSet0.vp_c9)._m0[149].w);
    bool _281 = _277 || _279;
    float _283 = float(_281);
    float _285 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _287 = _185 + _285;
    float _289 = 1.0 / _207;
    float _291 = _257 * _247;
    float _293 = -_223;
    float _295 = _293 + 1.0;
    float _297 = -_283;
    float _299 = _297 + 1.0;
    bool _301 = _185 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _303 = isnan(_185);
    bool _305 = _301 || _303;
    bool _307 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _309 = _305 || _307;
    float _311 = float(_309);
    float _313 = _283 * _295;
    float _315 = 1.0 / _269;
    float _317 = _261 * _265;
    float _319 = -(*spvDescriptorSet0.vp_c9)._m0[148].w;
    float _321 = _185 + _319;
    bool _323 = _185 >= (*spvDescriptorSet0.vp_c9)._m0[147].w;
    bool _325 = isnan(_185);
    bool _327 = _323 || _325;
    bool _329 = isnan((*spvDescriptorSet0.vp_c9)._m0[147].w);
    bool _331 = _327 || _329;
    float _333 = float(_331);
    float _335 = _311 * _245;
    float _337 = -_311;
    float _339 = _337 + 1.0;
    float _341 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _343 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _341;
    float _345 = 1.0 / _211;
    float _347 = _321 * _289;
    float _349 = -_333;
    float _351 = _349 + 1.0;
    float _353 = -(*spvDescriptorSet0.vp_c9)._m0[149].w;
    float _355 = _185 + _353;
    float _357 = fma(_343, _291, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _359 = _355 * _315;
    bool _361 = _185 >= (*spvDescriptorSet0.vp_c9)._m0[148].w;
    bool _363 = isnan(_185);
    bool _365 = _361 || _363;
    bool _367 = isnan((*spvDescriptorSet0.vp_c9)._m0[148].w);
    bool _369 = _365 || _367;
    float _371 = float(_369);
    float _373 = _371 * _299;
    float _375 = -_371;
    float _377 = _375 + 1.0;
    float _379 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _381 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _379;
    float _383 = _287 * _345;
    float _385 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _387 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _385;
    float _389 = _333 * _377;
    float _391 = _235 * _351;
    bool _393 = _185 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _395 = isnan(_185);
    bool _397 = _393 || _395;
    bool _399 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _401 = _397 || _399;
    float _403 = float(_401);
    float _405 = fma(_381, _253, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    bool _407 = _185 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _409 = isnan(_185);
    bool _411 = _407 || _409;
    bool _413 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _415 = _411 || _413;
    float _417 = float(_415);
    float _419 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _421 = _419 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _423 = fma(_387, _253, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _425 = -_403;
    float _427 = _425 + 1.0;
    float _429 = _403 * _339;
    float _431 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _433 = _431 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _435 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _437 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _435;
    float _439 = _417 * _427;
    float _441 = -_417;
    float _443 = _441 + 1.0;
    float _445 = fma(_421, _271, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _447 = fma(_433, _271, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _449 = _405 * _439;
    float _451 = _423 * _439;
    float _453 = -(*spvDescriptorSet0.vp_c9)._m0[146].x;
    float _455 = _453 + (*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _457 = -(*spvDescriptorSet0.vp_c9)._m0[146].y;
    float _459 = _457 + (*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _461 = fma(_443, (*spvDescriptorSet0.vp_c9)._m0[143].x, _449);
    float _463 = fma(_455, _383, (*spvDescriptorSet0.vp_c9)._m0[146].x);
    float _465 = fma(_459, _383, (*spvDescriptorSet0.vp_c9)._m0[146].y);
    float _467 = fma(_443, (*spvDescriptorSet0.vp_c9)._m0[143].y, _451);
    float _469 = -(*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _471 = (*spvDescriptorSet0.vp_c9)._m0[148].x + _469;
    float _473 = -(*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _475 = (*spvDescriptorSet0.vp_c9)._m0[148].y + _473;
    float _477 = fma(_437, _291, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _479 = fma(_445, _429, _461);
    float _481 = fma(_447, _429, _467);
    float _483 = fma(_471, _317, (*spvDescriptorSet0.vp_c9)._m0[147].x);
    float _485 = fma(_475, _317, (*spvDescriptorSet0.vp_c9)._m0[147].y);
    float _487 = fma(_477, _335, _479);
    float _489 = -(*spvDescriptorSet0.vp_c9)._m0[148].x;
    float _491 = _489 + (*spvDescriptorSet0.vp_c9)._m0[149].x;
    float _493 = -(*spvDescriptorSet0.vp_c9)._m0[148].y;
    float _495 = _493 + (*spvDescriptorSet0.vp_c9)._m0[149].y;
    float _497 = fma(_357, _335, _481);
    float _499 = fma(_491, _347, (*spvDescriptorSet0.vp_c9)._m0[148].x);
    float _501 = fma(_495, _347, (*spvDescriptorSet0.vp_c9)._m0[148].y);
    float _503 = fma(_463, _391, _487);
    float _505 = fma(_465, _391, _497);
    float _507 = -(*spvDescriptorSet0.vp_c9)._m0[149].x;
    float _509 = (*spvDescriptorSet0.vp_c9)._m0[150].x + _507;
    float _511 = -(*spvDescriptorSet0.vp_c9)._m0[149].y;
    float _513 = (*spvDescriptorSet0.vp_c9)._m0[150].y + _511;
    float _515 = fma(_483, _389, _503);
    float _517 = fma(_485, _389, _505);
    float _519 = fma(_509, _359, (*spvDescriptorSet0.vp_c9)._m0[149].x);
    float _521 = fma(_513, _359, (*spvDescriptorSet0.vp_c9)._m0[149].y);
    float _523 = fma(_499, _373, _515);
    float _525 = fma(_501, _373, _517);
    float _527 = fma(_519, _313, _523);
    float _529 = fma(_521, _313, _525);
    float _531 = fma(_223, (*spvDescriptorSet0.vp_c9)._m0[150].x, _527);
    float _533 = fma(_223, (*spvDescriptorSet0.vp_c9)._m0[150].y, _529);
    bool _535 = !_263;
    float _555;
    float _557;
    if (!_535)
    {
        float _537 = in.m_52.x;
        float _539 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].x;
        float _541 = float(_83);
        float _543 = _537 * (*spvDescriptorSet0.vp_c9)._m0[12].y;
        float _545 = fma(_543, (*spvDescriptorSet0.vp_c9)._m0[11].x, _115);
        float _547 = _545 * _539;
        float _549 = floor(_547);
        float _551 = -_549;
        float _553 = _547 + _551;
        _555 = _541;
        _557 = _553;
        _559 = true;
    }
    else
    {
        float _561 = float(_83);
        float _563 = 1.0 / _561;
        float _565 = _115 * _563;
        _555 = _561;
        _557 = _565;
    }
    _559 = false;
    float _567 = _555;
    float _569 = _557;
    float _571 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _573 = int(_571);
    float _575 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _577 = int(_575);
    float _579 = float(_573);
    float _581 = 1.0 / _567;
    float _583 = float(uint(_577));
    float _585 = 1.0 / _579;
    int _587 = ~_577;
    int _589 = _587 + 1;
    int _591 = ~_577;
    int _593 = _591 + 1;
    int _595 = ~_577;
    int _597 = _595 + 1;
    float _599 = 1.0 / _583;
    float _601 = _115 * _585;
    int _603 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _605 = _603 != 0;
    float _607 = trunc(_601);
    int _609 = int(_607);
    float _611 = float(_577);
    int _613 = as_type<int>(_599) + (-2);
    float _615 = float(uint(_609));
    float _617 = float(_609);
    float _619 = as_type<float>(_613) * _615;
    bool _621 = _617 >= _611;
    bool _623 = isnan(_617);
    bool _625 = _621 || _623;
    bool _627 = isnan(_611);
    bool _629 = _625 || _627;
    float _631 = float(_629);
    float _633 = in.m_52.x;
    float _635 = in.m_52.y;
    float _637 = trunc(_619);
    float _639 = precise::max(_637, 0.0);
    uint _642 = uint(_639);
    float _644 = trunc(_631);
    int _646 = int(_644);
    int _648 = _589 * int(_642);
    int _650 = _648 + _609;
    float _652 = float(uint(_650));
    float _654 = as_type<float>(_613) * _652;
    bool _656 = !_605;
    float _658 = _656 ? 7.345489978790283203125 : 1.0;
    float _660 = trunc(_654);
    float _662 = precise::max(_660, 0.0);
    uint _664 = uint(_662);
    float _666 = _658 * _633;
    float _668 = floor(_666);
    int _670 = int(_642) + int(_664);
    int _672 = _593 * _670;
    int _674 = _672 + _609;
    int _676 = ~_646;
    int _678 = _676 + 1;
    int _680 = _678 + 1;
    float _682 = -_668;
    float _684 = _666 + _682;
    bool _686 = uint(_674) >= uint(_577);
    float _688 = _684 * _611;
    float _690 = _115 * _611;
    bool _692 = !_686;
    int _694 = _692 ? 0 : (-1);
    bool _696 = _577 == 0;
    float _698 = _690 * _581;
    int _700 = ~_670;
    int _702 = _700 + _694;
    int _704 = _702 + 1;
    int _706 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _708 = _706 != 0;
    int _710 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _712 = _710 != 0;
    int _714 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _716 = _714 != 0;
    float _718 = trunc(_688);
    int _720 = int(_718);
    int _722 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _724 = _722 != 0;
    int _726 = _577 * _704;
    int _728 = _726 + _609;
    int _730 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _732 = _730 != 0;
    bool _734 = !_712;
    int _736 = _734 ? 0 : 1;
    bool _738 = !_696;
    int _740 = _738 ? _728 : (-1);
    float _742 = trunc(_698);
    int _744 = int(_742);
    int _746 = _577 + (-1);
    int _748 = _740 * _680;
    bool _750 = !_724;
    int _752 = _750 ? 0 : 1;
    int _754 = _646 * _746;
    int _756 = _754 + _748;
    bool _758 = !_708;
    int _760 = _758 ? 0 : 1;
    int _762 = abs(_736);
    bool _764 = !_716;
    int _766 = _764 ? 0 : 1;
    int _768 = abs(_760);
    int _770 = _756 * _762;
    int _772 = abs(_752);
    bool _774 = !_732;
    int _776 = _774 ? 0 : 1;
    int _778 = abs(_766);
    int _780 = _720 * _772;
    int _782 = _780 + _609;
    int _784 = abs(_776);
    int _786 = _744 * _768;
    int _788 = _786 + _770;
    int _790 = ~_577;
    int _792 = _790 + 1;
    int _794 = _782 * _778;
    int _796 = _794 + _788;
    int _798 = ~_577;
    int _800 = _798 + 1;
    int _802 = _720 * _784;
    int _804 = _802 + _796;
    float _806 = float(uint(_804));
    float _808 = as_type<float>(_613) * _806;
    float _810 = trunc(_808);
    float _812 = precise::max(_810, 0.0);
    uint _814 = uint(_812);
    int _816 = _800 * int(_814);
    int _818 = _816 + _804;
    float _820 = float(uint(_818));
    float _822 = as_type<float>(_613) * _820;
    float _824 = trunc(_822);
    float _826 = precise::max(_824, 0.0);
    uint _828 = uint(_826);
    int _830 = int(_814) + int(_828);
    int _832 = _792 * _830;
    int _834 = _832 + _804;
    bool _836 = uint(_834) >= uint(_577);
    float _838 = float(uint(_782));
    bool _840 = !_836;
    int _842 = _840 ? 0 : (-1);
    float _844 = as_type<float>(_613) * _838;
    int _846 = ~_830;
    int _848 = _846 + _842;
    int _850 = _848 + 1;
    int _852 = _577 * _850;
    int _854 = _852 + _804;
    float _856 = trunc(_844);
    float _858 = precise::max(_856, 0.0);
    uint _860 = uint(_858);
    int _862 = ~_577;
    int _864 = _862 + 1;
    bool _866 = !_696;
    int _868 = _866 ? _854 : (-1);
    int _870 = _868 >> 31;
    int _872 = _868 & 3;
    bool _874 = _872 != 0;
    int _876 = _870 & 3;
    int _878 = _868 + _876;
    int _880 = _878 >> 2;
    int _882 = _864 * int(_860);
    int _884 = _882 + _782;
    int _886 = _880 << 4;
    int _888 = _886 + 368;
    uint _890 = uint(int(uint(_888) >> uint(2)));
    uint _892 = uint(int(uint(int(_890)) >> uint(2)));
    int _894 = int(_890) & 3;
    float _896 = (*spvDescriptorSet0.vp_c9)._m0[int(_892)][_894];
    int _898 = int(_890) + 1;
    uint _900 = uint(int(uint(_898) >> uint(2)));
    int _902 = _898 & 3;
    float _904 = (*spvDescriptorSet0.vp_c9)._m0[int(_900)][_902];
    float _906 = float(uint(_884));
    float _908 = as_type<float>(_613) * _906;
    int _910 = _868 & 3;
    bool _912 = _910 != 0;
    int _914 = _888 + 8;
    uint _916 = uint(int(uint(_914) >> uint(2)));
    uint _918 = uint(int(uint(int(_916)) >> uint(2)));
    int _920 = int(_916) & 3;
    float _922 = (*spvDescriptorSet0.vp_c9)._m0[int(_918)][_920];
    int _924 = int(_916) + 1;
    uint _926 = uint(int(uint(_924) >> uint(2)));
    int _928 = _924 & 3;
    float _930 = (*spvDescriptorSet0.vp_c9)._m0[int(_926)][_928];
    int _932 = _874 ? 0 : 1;
    bool _934 = uint(_910) > 1u;
    float _936 = trunc(_908);
    float _938 = precise::max(_936, 0.0);
    uint _940 = uint(_938);
    bool _942 = _910 != 3;
    bool _944 = uint(_910) >= 2u;
    int _946 = ~_932;
    int _948 = _946 + 1;
    int _950 = _948 + 1;
    int _952 = _950;
    if (!_934)
    {
        int _954 = ~_932;
        int _956 = _954 + 1;
        _952 = _956;
    }
    int _958 = _952;
    bool _960 = !_912;
    int _962 = _960 ? 0 : 1;
    int _964 = int(_860) + int(_940);
    int _966 = abs(_958);
    int _968 = abs(_962);
    int _970 = _597 * _964;
    int _972 = _970 + _782;
    int _974 = _944 ? 0 : 1;
    float _976 = trunc((*spvDescriptorSet0.vp_c9)._m0[80].z);
    int _978 = int(_976);
    bool _980 = _910 != 3;
    int _982 = ~_974;
    int _984 = _982 + 1;
    int _986 = _984 + 1;
    int _988 = _986;
    if (_942)
    {
        int _990 = ~_974;
        int _992 = _990 + 1;
        _988 = _992;
    }
    int _994 = _988;
    int _996 = ~_966;
    int _998 = _996 + 1;
    int _1000 = _998 + 1;
    int _1002 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _1004 = _1002 != 0;
    int _1006 = abs(_994);
    int _1008 = _1000 * as_type<int>(_904);
    bool _1010 = !_980;
    int _1012 = _1010 ? 0 : (-1);
    int _1014 = ~_968;
    int _1016 = _1014 + 1;
    int _1018 = _1016 + 1;
    bool _1020 = !_1004;
    int _1022 = _1020 ? 0 : 1;
    int _1024 = abs(_1012);
    int _1026 = _1018 * as_type<int>(_896);
    int _1028 = _1026 + _1008;
    bool _1030 = uint(_972) >= uint(_577);
    int _1032 = ~_1006;
    int _1034 = _1032 + 1;
    int _1036 = _1034 + 1;
    int _1038 = abs(_1022);
    int _1040 = _1036 * as_type<int>(_922);
    int _1042 = _1040 + _1028;
    bool _1044 = !_1030;
    int _1046 = _1044 ? 0 : (-1);
    float _1048 = float(uint(_978));
    int _1050 = ~_1024;
    int _1052 = _1050 + 1;
    int _1054 = _1052 + 1;
    int _1056 = ~_964;
    int _1058 = _1056 + _1046;
    int _1060 = _1058 + 1;
    int _1062 = abs(_978);
    float _1064 = 1.0 / _1048;
    int _1066 = _1054 * as_type<int>(_930);
    int _1068 = _1066 + _1042;
    int _1070 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1072 = _1070 != 0;
    int _1074 = _577 * _1060;
    int _1076 = _1074 + _782;
    float _1078 = float(uint(_1062));
    int _1080 = ~_1038;
    int _1082 = _1080 + 1;
    int _1084 = _1082 + 1;
    bool _1086 = !_696;
    int _1088 = _1086 ? _1076 : (-1);
    float _1090 = 1.0 / _1078;
    int _1092 = _1068 * _1084;
    int _1094 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1096 = _1094 != 0;
    float _1098 = _633 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    int _1100 = ~_978;
    int _1102 = _1100 + 1;
    int _1104 = _1088 * _1038;
    int _1106 = _1104 + _1092;
    int _1108 = as_type<int>(_1064) + (-2);
    int _1110 = ~_1062;
    int _1112 = _1110 + 1;
    float _1114 = float(uint(_1106));
    int _1116 = abs(_1106);
    bool _1118 = _633 > 0.5;
    float _1120 = as_type<float>(_1108) * _1114;
    int _1122 = as_type<int>(_1090) + (-2);
    float _1124 = float(uint(_1116));
    float _1126 = trunc(_1120);
    float _1128 = precise::max(_1126, 0.0);
    uint _1130 = uint(_1128);
    float _1132 = as_type<float>(_1122) * _1124;
    bool _1134 = _635 > 0.5;
    float _1136 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    bool _1138 = _978 == 0;
    float _1140 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _1142 = trunc(_1132);
    float _1144 = precise::max(_1142, 0.0);
    uint _1146 = uint(_1144);
    float _1148 = -_1136;
    float _1150 = fma(_1098, 2.0, _1148);
    float _1152 = fma(_633, (*spvDescriptorSet0.vp_c9)._m0[78].z, _1140);
    float _1154 = in.m_42.x;
    float _1156 = in.m_42.y;
    float _1158 = in.m_42.z;
    float _1160 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _1162 = (*spvDescriptorSet0.vp_c9)._m0[108].w + _1160;
    int _1164 = _1102 * int(_1130);
    int _1166 = _1164 + _1106;
    float _1168 = 1.0 / _1162;
    float _1170 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _1172 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _1174 = float(uint(_1166));
    int _1176 = _1112 * int(_1146);
    int _1178 = _1176 + _1116;
    float _1180 = as_type<float>(_1108) * _1174;
    float _1182 = _635 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _1184 = fma(_635, (*spvDescriptorSet0.vp_c9)._m0[78].w, _1172);
    float _1186 = float(uint(_1178));
    float _1188 = trunc(_1180);
    float _1190 = precise::max(_1188, 0.0);
    uint _1192 = uint(_1190);
    float _1194 = fma(_1182, -2.0, _1170);
    int _1196 = ~_978;
    int _1198 = _1196 + 1;
    float _1200 = as_type<float>(_1122) * _1186;
    float _1202 = _1156 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _1204 = _1156 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _1206 = _1156 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _1208 = trunc(_1200);
    float _1210 = precise::max(_1208, 0.0);
    uint _1212 = uint(_1210);
    float _1214 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _1216 = _569 + _1214;
    float _1218 = fma(_1154, (*spvDescriptorSet0.vp_c10)._m0[4].x, _1202);
    float _1220 = fma(_1154, (*spvDescriptorSet0.vp_c10)._m0[5].x, _1204);
    float _1222 = fma(_1154, (*spvDescriptorSet0.vp_c10)._m0[6].x, _1206);
    float _1224 = _1216 * _1168;
    float _1226 = -_115;
    float _1228 = fma(_1226, (*spvDescriptorSet0.vp_c9)._m0[76].x, _1150);
    float _1230 = fma(_115, (*spvDescriptorSet0.vp_c9)._m0[77].z, _1152);
    int _1232 = int(_1130) + int(_1192);
    float _1234 = fma(_115, (*spvDescriptorSet0.vp_c9)._m0[76].y, _1194);
    float _1236 = fma(_115, (*spvDescriptorSet0.vp_c9)._m0[77].w, _1184);
    float _1238 = fma(_1158, (*spvDescriptorSet0.vp_c10)._m0[4].z, _1218);
    float _1240 = fma(_1158, (*spvDescriptorSet0.vp_c10)._m0[5].z, _1220);
    float _1242 = fma(_1158, (*spvDescriptorSet0.vp_c10)._m0[6].z, _1222);
    int _1244 = _1198 * _1232;
    int _1246 = _1244 + _1106;
    float _1248 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _1250 = _1238 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    int _1252 = int(_1146) + int(_1212);
    float _1254 = -(*spvDescriptorSet0.vp_c9)._m0[107].x;
    float _1256 = (*spvDescriptorSet0.vp_c9)._m0[108].x + _1254;
    int _1258 = ~_1062;
    int _1260 = _1258 + 1;
    float _1262 = _1242 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    bool _1264 = uint(_1246) >= uint(_978);
    float _1266 = -(*spvDescriptorSet0.vp_c9)._m0[107].z;
    float _1268 = (*spvDescriptorSet0.vp_c9)._m0[108].z + _1266;
    int _1270 = _1260 * _1252;
    int _1272 = _1270 + _1116;
    float _1274 = fma(_1256, _1224, (*spvDescriptorSet0.vp_c9)._m0[107].x);
    bool _1276 = _569 >= (*spvDescriptorSet0.vp_c9)._m0[108].w;
    bool _1278 = isnan(_569);
    bool _1280 = _1276 || _1278;
    bool _1282 = isnan((*spvDescriptorSet0.vp_c9)._m0[108].w);
    bool _1284 = _1280 || _1282;
    float _1286 = float(_1284);
    float _1288 = fma(_1268, _1224, (*spvDescriptorSet0.vp_c9)._m0[107].z);
    bool _1290 = _569 >= (*spvDescriptorSet0.vp_c9)._m0[107].w;
    bool _1292 = isnan(_569);
    bool _1294 = _1290 || _1292;
    bool _1296 = isnan((*spvDescriptorSet0.vp_c9)._m0[107].w);
    bool _1298 = _1294 || _1296;
    float _1300 = float(_1298);
    float _1302 = -(*spvDescriptorSet0.vp_c9)._m0[107].y;
    float _1304 = (*spvDescriptorSet0.vp_c9)._m0[108].y + _1302;
    bool _1306 = uint(_1272) >= uint(_1062);
    float _1308 = -_1286;
    float _1310 = _1308 + 1.0;
    bool _1312 = !_1264;
    int _1314 = _1312 ? 0 : (-1);
    float _1316 = fma(_1304, _1224, (*spvDescriptorSet0.vp_c9)._m0[107].y);
    int _1318 = _1106 ^ _978;
    float _1320 = _1300 * _1310;
    int _1322 = ~_1232;
    int _1324 = _1322 + _1314;
    int _1326 = _1324 + 1;
    float _1328 = -_1300;
    float _1330 = _1328 + 1.0;
    bool _1332 = _978 == 0;
    float _1334 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    uint _1336 = uint(int(uint(_1318) >> uint(31)));
    int _1338 = _978 * _1326;
    int _1340 = _1338 + _1106;
    float _1342 = _1274 * _1320;
    bool _1344 = !_1306;
    int _1346 = _1344 ? 0 : (-1);
    float _1348 = _1316 * _1320;
    int _1350 = ~int(_1336);
    int _1352 = _1350 + 1;
    float _1354 = _1288 * _1320;
    int _1356 = ~_1346;
    int _1358 = _1252 + _1356;
    int _1360 = _1358 + 1;
    float _1362 = _1248 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    bool _1364 = !_1332;
    int _1366 = _1364 ? _1340 : (-1);
    float _1368 = fma(_1330, (*spvDescriptorSet0.vp_c9)._m0[107].y, _1348);
    int _1370 = _1360 ^ _1352;
    float _1372 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1374 = _1250 + _1372;
    float _1376 = float(_1366);
    float _1378 = fma(_1330, (*spvDescriptorSet0.vp_c9)._m0[107].x, _1342);
    int _1380 = ~_1352;
    int _1382 = _1380 + _1370;
    int _1384 = _1382 + 1;
    float _1386 = fma(_1330, (*spvDescriptorSet0.vp_c9)._m0[107].z, _1354);
    float _1388 = -_151;
    int _1390 = _1118 ? as_type<int>(_1388) : as_type<int>(_151);
    float _1392 = fma(_1362, _1376, _1228);
    float _1394 = _1240 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _1396 = _1334 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    bool _1398 = !_1072;
    float _1400 = _1398 ? _151 : as_type<float>(_1390);
    float _1402 = -_1230;
    float _1404 = _1402 + 1.0;
    float _1406 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1408 = _1394 + _1406;
    bool _1410 = !_1138;
    int _1412 = _1410 ? _1384 : (-1);
    float _1414 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1416 = _1262 + _1414;
    float _1418 = -_155;
    int _1420 = _1134 ? as_type<int>(_1418) : as_type<int>(_155);
    float _1422 = _1408 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1424 = _1400 + 0.5;
    float _1426 = float(_1412);
    float _1428 = fma(_1286, (*spvDescriptorSet0.vp_c9)._m0[108].y, _1368);
    float _1430 = fma(_1374, (*spvDescriptorSet0.vp_c8)._m0[28].x, _1422);
    bool _1432 = !_1096;
    float _1434 = _1432 ? _155 : as_type<float>(_1420);
    float _1436 = fma(_1362, _1424, _1392);
    float _1438 = -_1234;
    float _1440 = fma(_1396, _1426, _1438);
    float _1442 = fma(_1416, (*spvDescriptorSet0.vp_c8)._m0[28].z, _1430);
    float _1444 = _1434 + (-0.5);
    float _1446 = -_1404;
    float _1448 = fma(_1400, _1446, _1436);
    float _1450 = _1408 * _1408;
    bool _1452 = _1442 >= 0.0;
    float _1454 = -_1396;
    float _1456 = fma(_1454, _1444, _1440);
    float _1458 = fma(_1286, (*spvDescriptorSet0.vp_c9)._m0[108].x, _1378);
    float _1460 = fma(_1374, _1374, _1450);
    float _1462 = fma(_1286, (*spvDescriptorSet0.vp_c9)._m0[108].z, _1386);
    float _1464 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _1466 = fma(_1416, _1416, _1460);
    float _1468 = _1458 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _1470 = rsqrt(_1466);
    float _1472 = _1462 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1474 = _1200;
    int _1476 = as_type<int>(_1472);
    if (_1452)
    {
        _1474 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _1478 = _1474;
    float _1480 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1482 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1484 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1486 = _1428 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _1488 = -_1236;
    float _1490 = _1488 + 1.0;
    float _1492 = _1468 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1494 = _1472 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1496 = _1480 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1498 = _1482 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1500 = _1484 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1502 = _1486 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1504 = _1500;
    if (_1452)
    {
        float _1506 = _1478 * 5.0;
        _1476 = as_type<int>(_1506);
    }
    int _1508 = _1476;
    float _1510 = fma(_1434, _1490, _1456);
    if (_1452)
    {
        out.m_45.x = 0.0;
    }
    float _1512 = _1408 * _1470;
    float _1514 = _1374 * _1470;
    out.m_54.x = _1496;
    out.m_54.y = _1498;
    out.m_54.z = _1500;
    out.m_56.x = _1492;
    out.m_56.y = _1502;
    out.m_56.z = _1494;
    out.m_56.w = _1464;
    if (_1452)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _4394 = as_type<float>(_1508);
        out.gl_Position.z = _4394;
    }
    out.m_58.x = _1448;
    out.m_58.y = _1510;
    if (_1452)
    {
        return out;
    }
    float _1516 = -_1512;
    float _1518 = fma(_1516, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1394);
    float _1520 = _1416 * _1470;
    float _1522 = -_1514;
    float _1524 = fma(_1522, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1250);
    float _1526 = -_1512;
    float _1528 = fma(_1526, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1408);
    float _1530 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1532 = _1518 + _1530;
    float _1534 = -_1520;
    float _1536 = fma(_1534, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1262);
    float _1538 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1540 = _1524 + _1538;
    float _1542 = -_1514;
    float _1544 = fma(_1542, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1374);
    float _1546 = _1532 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1548 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1550 = _1536 + _1548;
    float _1552 = _1528 * _1528;
    float _1554 = in.m_60.x;
    float _1556 = in.m_60.y;
    float _1558 = fma(_1540, (*spvDescriptorSet0.vp_c8)._m0[28].x, _1546);
    float _1560 = -_1520;
    float _1562 = fma(_1560, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1416);
    float _1564 = fma(_1544, _1544, _1552);
    float _1566 = fma(_1550, (*spvDescriptorSet0.vp_c8)._m0[28].z, _1558);
    float _1568 = fma(_1562, _1562, _1564);
    bool _1570 = _1566 >= 0.0;
    float _1572 = sqrt(_1568);
    float _1574 = _1520;
    float _1576 = _1550;
    if (_1570)
    {
        _1504 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _1578 = _1504;
    int _1580 = as_type<int>(_1578);
    if (_1570)
    {
        out.m_45.x = 0.0;
    }
    float _1582 = _531 * _1554;
    float _1584 = _533 * _1556;
    float _1586 = _1470 * _1572;
    if (_1570)
    {
        float _1588 = _1578 * 5.0;
        _1580 = as_type<int>(_1588);
    }
    int _1590 = _1580;
    if (_1570)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _4537 = as_type<float>(_1590);
        out.gl_Position.z = _4537;
    }
    if (_1570)
    {
        return out;
    }
    float _1592 = _1584 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1594 = _1582 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1596 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _155);
    float _1598 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _151);
    float _1600 = _1592 * _1586;
    float _1602 = _1594 * _1586;
    float _1604 = _1586 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _1606 = _1604 * 0.5;
    float _1608 = _1596 * _1600;
    float _1610 = _1598 * _1602;
    bool _1612 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _1614 = isnan(0.5);
    bool _1616 = _1612 || _1614;
    bool _1618 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1620 = _1616 || _1618;
    float _1622 = _1608 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1624 = _1608 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1626 = _1608 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1628 = fma(_1610, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1622);
    float _1630 = fma(_1610, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1624);
    float _1632 = fma(_1610, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1626);
    float _1634 = fma(_1606, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1628);
    float _1636 = fma(_1606, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1630);
    float _1638 = fma(_1606, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1632);
    float _1640 = _1634 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _1642 = _1636 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _1644 = _1638 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _1646 = _1262 + _1640;
    float _1648 = _1250 + _1642;
    float _1650 = _1394 + _1644;
    float _1652 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1654 = _1646 + _1652;
    float _1656 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1658 = _1648 + _1656;
    float _1660 = _1654 * _1654;
    float _1662 = fma(_1658, _1658, _1660);
    float _1664 = sqrt(_1662);
    bool _1666 = _1664 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1668 = _1644;
    float _1670 = _1638;
    float _1672 = _1636;
    float _1674 = _1646;
    if (!_1666)
    {
        _1668 = _1648;
    }
    float _1676 = _1668;
    float _1678 = _1676;
    if (!_1666)
    {
        _1670 = _1646;
    }
    float _1680 = _1670;
    float _1682 = _1680;
    if (!_1666)
    {
        _1672 = _1650;
    }
    float _1684 = _1672;
    bool _1686 = !_1666;
    float _1688 = _1684;
    if (!_1686)
    {
        float _1690 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1692 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1694 = _1664 + _1692;
        float _1696 = rsqrt(_1662);
        float _1698 = _1694 * _1690;
        float _1700 = _1650 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1702 = _1698 * 0.15915493667125701904296875;
        float _1704 = _1702 * 6.283185482025146484375;
        float _1706 = sin(_1704);
        float _1708 = _1702 * 6.283185482025146484375;
        float _1710 = cos(_1708);
        float _1712 = fma(_1706, _1700, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1714 = _1696 * _1712;
        float _1716 = _1710 + (-1.0);
        float _1718 = fma(_1658, _1714, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1720 = fma(_1654, _1714, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _1722 = _1716 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1724 = fma(_1650, _1710, _1722);
        _1678 = _1718;
        _1682 = _1720;
        _1688 = _1724;
    }
    float _1726 = _1678;
    float _1728 = _1682;
    float _1730 = _1688;
    float _1732 = -_1514;
    float _1734 = fma(_1732, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1726);
    float _1736 = -_1520;
    float _1738 = fma(_1736, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1728);
    float _1740 = -_1512;
    float _1742 = fma(_1740, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1730);
    float _1744 = _1742;
    float _1746 = _1738;
    if (_1620)
    {
        _1574 = _1734;
    }
    float _1748 = _1574;
    float _1750 = _1748;
    if (!_1620)
    {
        float _1752 = _1532 * _1532;
        float _1754 = 1.0 / _1586;
        float _1756 = -_1250;
        float _1758 = _1756 + _1726;
        float _1760 = -_1394;
        float _1762 = _1760 + _1730;
        float _1764 = fma(_1540, _1540, _1752);
        float _1766 = fma(_1550, _1550, _1764);
        float _1768 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1770 = sqrt(_1766);
        float _1772 = precise::min(_1770, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1774 = _1772 * _1768;
        float _1776 = _1774 * _1754;
        float _1778 = -_1262;
        float _1780 = _1778 + _1728;
        float _1782 = fma(_1758, _1776, _1524);
        float _1784 = fma(_1762, _1776, _1518);
        float _1786 = fma(_1780, _1776, _1536);
        _1744 = _1784;
        _1750 = _1782;
        _1746 = _1786;
        _1576 = _1768;
    }
    float _1788 = _1744;
    float _1790 = _1750;
    float _1792 = _1746;
    float _1794 = _1576;
    float _1796 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1798 = _1788 + _1796;
    float _1800 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1802 = _1790 + _1800;
    float _1804 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1806 = _1792 + _1804;
    float _1808 = _1798 * _1798;
    float _1810 = fma(_1802, _1802, _1808);
    float _1812 = fma(_1806, _1806, _1810);
    float _1814 = rsqrt(_1812);
    float _1816 = _1814 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1818 = _1802 * _1816;
    float _1820 = _1806 * _1816;
    float _1822 = _1818 * _1818;
    float _1824 = _1820 * _1820;
    float _1826 = _1822 + _1824;
    float _1828 = sqrt(_1826);
    bool _1830 = _1828 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1832 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1834 = _1828 + _1832;
    float _1836 = _1814;
    float _1838 = _1826;
    float _1840 = _1834;
    float _1842 = _1794;
    float _1844 = _1798;
    float _1846 = _1818;
    if (_1830)
    {
        float _1848 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1836 = _1848;
    }
    float _1850 = _1836;
    if (_1830)
    {
        float _1852 = rsqrt(_1826);
        _1838 = _1852;
    }
    float _1854 = _1838;
    if (_1830)
    {
        float _1856 = _1834 * _1850;
        _1840 = _1856;
    }
    float _1858 = _1840;
    if (_1830)
    {
        float _1860 = _1858 * 0.15915493667125701904296875;
        _1842 = _1860;
    }
    float _1862 = _1842;
    float _1864 = _1850;
    if (_1830)
    {
        float _1866 = _1862 * 6.283185482025146484375;
        float _1868 = sin(_1866);
        _1864 = _1868;
    }
    float _1870 = _1864;
    float _1872 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1874 = precise::max(0.0, _1872);
    float _1876 = _1806;
    float _1878 = _1874;
    if (_1830)
    {
        float _1880 = _1862 * 6.283185482025146484375;
        float _1882 = cos(_1880);
        _1876 = _1882;
    }
    float _1884 = _1876;
    float _1886 = -_1816;
    float _1888 = -_1874;
    float _1890 = fma(_1798, _1886, _1888);
    float _1892 = _1890;
    if (_1830)
    {
        float _1894 = _1890 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1878 = _1894;
    }
    float _1896 = _1878;
    float _1898 = _1870;
    float _1900 = _1896;
    if (_1830)
    {
        float _1902 = fma(_1870, _1896, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1898 = _1902;
    }
    float _1904 = _1898;
    float _1906 = _1904;
    if (_1830)
    {
        float _1908 = _1884 + (-1.0);
        _1900 = _1908;
    }
    float _1910 = _1900;
    float _1912 = _1910;
    if (_1830)
    {
        float _1914 = _1854 * _1904;
        _1674 = _1914;
    }
    float _1916 = _1674;
    if (!_1830)
    {
        _1906 = _1820;
    }
    float _1918 = _1906;
    float _1920 = sqrt(_1812);
    float _1922 = _1918;
    if (_1830)
    {
        float _1924 = _1910 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1844 = _1924;
    }
    float _1926 = _1844;
    float _1928 = _1926;
    if (_1830)
    {
        float _1930 = _1818 * _1916;
        _1846 = _1930;
    }
    float _1932 = _1846;
    if (!_1830)
    {
        _1912 = _1822;
    }
    float _1934 = _1912;
    float _1936 = _1934;
    if (_1830)
    {
        float _1938 = _1820 * _1916;
        _1922 = _1938;
    }
    float _1940 = _1922;
    if (_1830)
    {
        float _1942 = fma(_1890, _1884, _1926);
        _1892 = _1942;
    }
    float _1944 = _1892;
    if (_1830)
    {
        float _1946 = _1932 * _1932;
        _1936 = _1946;
    }
    float _1948 = _1936;
    if (!_1830)
    {
        _1928 = _1824;
    }
    float _1950 = _1928;
    float _1952 = _1950;
    if (_1830)
    {
        float _1954 = _1940 * _1940;
        _1952 = _1954;
    }
    float _1956 = _1952;
    float _1958 = fma(_1944, _1944, _1948);
    float _1960 = _1788 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1962 = _1958 + _1956;
    float _1964 = _1788 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1966 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1968 = fma(_1920, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1966);
    float _1970 = precise::clamp(_1968, 0.0, 1.0);
    float _1972 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _1974 = rsqrt(_1962);
    float _1976 = fma(_1790, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1964);
    float _1978 = _1788 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1980 = -_1970;
    float _1982 = _1980 + 1.0;
    float _1984 = fma(_1790, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1960);
    float _1986 = fma(_1792, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1976);
    float _1988 = _1788 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1990 = fma(_1790, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1978);
    float _1992 = _1986 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1994 = abs(_1982);
    float _1996 = log2(_1994);
    float _1998 = fma(_1790, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1988);
    float _2000 = fma(_1792, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1990);
    float _2002 = _1992 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _2004 = fma(_1792, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1998);
    float _2006 = _2000 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _2008 = -_2002;
    float _2010 = fma(_2008, _1972, 1.0);
    float _2012 = fma(_1792, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1984);
    float _2014 = _1974 * _1932;
    float _2016 = _2004 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2018 = _2006 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _2020 = _1974 * _1944;
    float _2022 = _2014 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _2024 = _1974 * _1940;
    float _2026 = fma(_2016, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2018);
    float _2028 = _1996 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _2030 = -_2022;
    float _2032 = fma(_2020, (*spvDescriptorSet0.vp_c15)._m0[21].y, _2030);
    float _2034 = _2012 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _2036 = fma(_1992, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2026);
    float _2038 = exp2(_2028);
    float _2040 = -_2024;
    float _2042 = fma(_2040, (*spvDescriptorSet0.vp_c15)._m0[21].z, _2032);
    float _2044 = _2006 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2046 = fma(_2034, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2036);
    float _2048 = _2006 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2050 = fma(_2042, -0.5, 0.5);
    float _2052 = fma(_2016, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2044);
    float _2054 = log2(_2010);
    float _2056 = fma(_2042, 0.5, 0.5);
    float _2058 = fma(_2016, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2048);
    float _2060 = _2020 + 1.0;
    float _2062 = fma(_1992, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2052);
    float _2064 = fma(_2056, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _2066 = fma(_1992, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2058);
    float _2068 = 1.0 / _2046;
    float _2070 = -_2020;
    float _2072 = fma(_2038, _2060, _2070);
    float _2074 = fma(_2034, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2062);
    float _2076 = fma(_2056, _2064, -0.212114393711090087890625);
    float _2078 = fma(_2034, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2066);
    float _2080 = fma(_2072, 0.5, 0.5);
    float _2082 = fma(_2056, _2076, 1.570728778839111328125);
    float _2084 = sqrt(_2050);
    float _2086 = _2054 * 0.693147182464599609375;
    float _2088 = _2074 * _2068;
    float _2090 = _2078 * _2068;
    float _2092 = _2086 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _2094 = fma(_2088, 0.5, 0.5);
    float _2096 = fma(_2090, -0.5, 0.5);
    float _2098 = _2084 * 0.636619746685028076171875;
    float3 _5381 = float3(_2094, _2096, _2092);
    float _2100 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_5381, float3(0.0), isnan(_5381)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_5381, float3(0.0), isnan(_5381)), level(0.0)).x;
    float3 _5392 = float3(_2094, _2096, _2092);
    float4 _2103 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_5392, float3(0.0), isnan(_5392)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_5392, float3(0.0), isnan(_5392)), level(0.0)).xyzw;
    float _2105 = _2103.x;
    float _2107 = _2103.y;
    float _2109 = _2103.z;
    float _2111 = _2103.w;
    float _2113 = -_2082;
    float _2115 = fma(_2098, _2113, 1.0);
    float2 _5414 = float2(_2115, _2080);
    float3 _2119 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_5414, float2(0.0), isnan(_5414)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_5414, float2(0.0), isnan(_5414)), level(0.0)).xyz;
    float _2121 = _2119.x;
    float _2123 = _2119.y;
    float _2125 = _2119.z;
    float _2127 = _1996 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _2129 = _2006 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _2131 = fma(_2016, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2129);
    float _2133 = exp2(_2127);
    float _2135 = fma(_1992, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2131);
    float _2137 = fma(_2034, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2135);
    float _2139 = _2137 + _2046;
    out.gl_Position.x = _2074;
    out.gl_Position.y = _2078;
    out.gl_Position.z = _2137;
    out.gl_Position.w = _2046;
    float _2141 = _2139 * 0.5;
    float _2143 = -_2133;
    float _2145 = _2143 + 1.0;
    float _2147 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2149 = _2145 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    out.m_62.z = _2141;
    out.m_62.w = _2046;
    out.m_45.x = _2147;
    float _2151 = _2149 * _2100;
    float _2153 = -_2149;
    float _2155 = _2153 + 1.0;
    float _2157 = _2111 * _2151;
    float _2159 = _2125 * _2151;
    float _2161 = fma(_2121, _2157, _2105);
    float _2163 = fma(_2123, _2157, _2107);
    float _2165 = _2111 * _2155;
    float _2167 = fma(_2111, _2159, _2109);
    out.m_64.x = _2161;
    out.m_64.y = _2163;
    out.m_64.z = _2167;
    out.m_64.w = _2165;
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
    out.m_56 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_54 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_62 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_45 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_58 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_64 = float4(0.0, 0.0, 0.0, 1.0);
    bool _559 = false;
    bool _177 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _78 = in.m_42.w;
    float _80 = trunc(_78);
    int _83 = int(_80);
    bool _87 = _83 >= 1;
    float _89 = 0.0;
    if (!_87)
    {
        _89 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _91 = _89;
    float _93 = _91;
    if (!_87)
    {
        out.m_45.x = 0.0;
    }
    int _95 = 0;
    if (!_87)
    {
        float _97 = _91 * 5.0;
        _95 = as_type<int>(_97);
    }
    int _99 = _95;
    if (!_87)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2223 = as_type<float>(_99);
        out.gl_Position.z = _2223;
    }
    if (!_87)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_56.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_56.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_56.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_56.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_54.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_54.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_54.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_54.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_62.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_62.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_62.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_62.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_58.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_58.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_58.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_58.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _101 = in.m_47.w;
    bool _103 = _101 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _105 = isnan(_101);
    bool _107 = _103 || _105;
    bool _109 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _111 = _107 || _109;
    float _113 = -_101;
    float _115 = _113 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    if (_111)
    {
        float _117 = float(_83);
        _93 = _117;
    }
    float _119 = _93;
    bool _121 = _115 >= _119;
    bool _123 = !_111;
    bool _125 = _121 || _123;
    float _127 = _119;
    if (_125)
    {
        _127 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _129 = _127;
    if (_125)
    {
        out.m_45.x = 0.0;
    }
    int _131 = 0;
    if (_125)
    {
        float _133 = _129 * 5.0;
        _131 = as_type<int>(_133);
    }
    int _135 = _131;
    if (_125)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2292 = as_type<float>(_135);
        out.gl_Position.z = _2292;
    }
    if (_125)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_56.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_56.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_56.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_56.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_54.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_54.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_54.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_54.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_62.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_62.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_62.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_62.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_58.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_58.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_58.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_58.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _137 = as_type<float>(int(gl_VertexIndex));
    bool _139 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    int _141 = as_type<int>(_137) & 1;
    bool _143 = _141 != 0;
    int _145 = as_type<int>(_137) & 2;
    bool _147 = _145 != 0;
    bool _149 = !_143;
    float _151 = _149 ? (-0.5) : 0.5;
    bool _153 = !_147;
    float _155 = _153 ? (-0.5) : 0.5;
    bool _157 = !_139;
    float _175;
    if (!_157)
    {
        float _159 = in.m_52.x;
        float _161 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _163 = _159 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _165 = fma(_163, (*spvDescriptorSet0.vp_c9)._m0[12].x, _115);
        float _167 = _165 * _161;
        float _169 = floor(_167);
        float _171 = -_169;
        float _173 = _167 + _171;
        _175 = _173;
        _177 = true;
    }
    else
    {
        float _179 = float(_83);
        float _181 = 1.0 / _179;
        float _183 = _115 * _181;
        _175 = _183;
    }
    _177 = false;
    float _185 = _175;
    float _187 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _189 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _187;
    float _191 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _193 = _191 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _195 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _197 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _195;
    float _199 = 1.0 / _189;
    float _201 = -(*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _203 = (*spvDescriptorSet0.vp_c9)._m0[148].w + _201;
    float _205 = -(*spvDescriptorSet0.vp_c9)._m0[148].w;
    float _207 = _205 + (*spvDescriptorSet0.vp_c9)._m0[149].w;
    float _209 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _211 = _209 + (*spvDescriptorSet0.vp_c9)._m0[147].w;
    bool _213 = _185 >= (*spvDescriptorSet0.vp_c9)._m0[150].w;
    bool _215 = isnan(_185);
    bool _217 = _213 || _215;
    bool _219 = isnan((*spvDescriptorSet0.vp_c9)._m0[150].w);
    bool _221 = _217 || _219;
    float _223 = float(_221);
    bool _225 = _185 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _227 = isnan(_185);
    bool _229 = _225 || _227;
    bool _231 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _233 = _229 || _231;
    float _235 = float(_233);
    float _237 = 1.0 / _193;
    float _239 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _241 = _185 + _239;
    float _243 = -_235;
    float _245 = _243 + 1.0;
    float _247 = 1.0 / _197;
    float _249 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _251 = _185 + _249;
    float _253 = _241 * _199;
    float _255 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _257 = _185 + _255;
    float _259 = -(*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _261 = _185 + _259;
    bool _263 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].x;
    float _265 = 1.0 / _203;
    float _267 = -(*spvDescriptorSet0.vp_c9)._m0[149].w;
    float _269 = (*spvDescriptorSet0.vp_c9)._m0[150].w + _267;
    float _271 = _251 * _237;
    bool _273 = _185 >= (*spvDescriptorSet0.vp_c9)._m0[149].w;
    bool _275 = isnan(_185);
    bool _277 = _273 || _275;
    bool _279 = isnan((*spvDescriptorSet0.vp_c9)._m0[149].w);
    bool _281 = _277 || _279;
    float _283 = float(_281);
    float _285 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _287 = _185 + _285;
    float _289 = 1.0 / _207;
    float _291 = _257 * _247;
    float _293 = -_223;
    float _295 = _293 + 1.0;
    float _297 = -_283;
    float _299 = _297 + 1.0;
    bool _301 = _185 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _303 = isnan(_185);
    bool _305 = _301 || _303;
    bool _307 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _309 = _305 || _307;
    float _311 = float(_309);
    float _313 = _283 * _295;
    float _315 = 1.0 / _269;
    float _317 = _261 * _265;
    float _319 = -(*spvDescriptorSet0.vp_c9)._m0[148].w;
    float _321 = _185 + _319;
    bool _323 = _185 >= (*spvDescriptorSet0.vp_c9)._m0[147].w;
    bool _325 = isnan(_185);
    bool _327 = _323 || _325;
    bool _329 = isnan((*spvDescriptorSet0.vp_c9)._m0[147].w);
    bool _331 = _327 || _329;
    float _333 = float(_331);
    float _335 = _311 * _245;
    float _337 = -_311;
    float _339 = _337 + 1.0;
    float _341 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _343 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _341;
    float _345 = 1.0 / _211;
    float _347 = _321 * _289;
    float _349 = -_333;
    float _351 = _349 + 1.0;
    float _353 = -(*spvDescriptorSet0.vp_c9)._m0[149].w;
    float _355 = _185 + _353;
    float _357 = fma(_343, _291, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _359 = _355 * _315;
    bool _361 = _185 >= (*spvDescriptorSet0.vp_c9)._m0[148].w;
    bool _363 = isnan(_185);
    bool _365 = _361 || _363;
    bool _367 = isnan((*spvDescriptorSet0.vp_c9)._m0[148].w);
    bool _369 = _365 || _367;
    float _371 = float(_369);
    float _373 = _371 * _299;
    float _375 = -_371;
    float _377 = _375 + 1.0;
    float _379 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _381 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _379;
    float _383 = _287 * _345;
    float _385 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _387 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _385;
    float _389 = _333 * _377;
    float _391 = _235 * _351;
    bool _393 = _185 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _395 = isnan(_185);
    bool _397 = _393 || _395;
    bool _399 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _401 = _397 || _399;
    float _403 = float(_401);
    float _405 = fma(_381, _253, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    bool _407 = _185 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _409 = isnan(_185);
    bool _411 = _407 || _409;
    bool _413 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _415 = _411 || _413;
    float _417 = float(_415);
    float _419 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _421 = _419 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _423 = fma(_387, _253, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _425 = -_403;
    float _427 = _425 + 1.0;
    float _429 = _403 * _339;
    float _431 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _433 = _431 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _435 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _437 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _435;
    float _439 = _417 * _427;
    float _441 = -_417;
    float _443 = _441 + 1.0;
    float _445 = fma(_421, _271, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _447 = fma(_433, _271, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _449 = _405 * _439;
    float _451 = _423 * _439;
    float _453 = -(*spvDescriptorSet0.vp_c9)._m0[146].x;
    float _455 = _453 + (*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _457 = -(*spvDescriptorSet0.vp_c9)._m0[146].y;
    float _459 = _457 + (*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _461 = fma(_443, (*spvDescriptorSet0.vp_c9)._m0[143].x, _449);
    float _463 = fma(_455, _383, (*spvDescriptorSet0.vp_c9)._m0[146].x);
    float _465 = fma(_459, _383, (*spvDescriptorSet0.vp_c9)._m0[146].y);
    float _467 = fma(_443, (*spvDescriptorSet0.vp_c9)._m0[143].y, _451);
    float _469 = -(*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _471 = (*spvDescriptorSet0.vp_c9)._m0[148].x + _469;
    float _473 = -(*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _475 = (*spvDescriptorSet0.vp_c9)._m0[148].y + _473;
    float _477 = fma(_437, _291, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _479 = fma(_445, _429, _461);
    float _481 = fma(_447, _429, _467);
    float _483 = fma(_471, _317, (*spvDescriptorSet0.vp_c9)._m0[147].x);
    float _485 = fma(_475, _317, (*spvDescriptorSet0.vp_c9)._m0[147].y);
    float _487 = fma(_477, _335, _479);
    float _489 = -(*spvDescriptorSet0.vp_c9)._m0[148].x;
    float _491 = _489 + (*spvDescriptorSet0.vp_c9)._m0[149].x;
    float _493 = -(*spvDescriptorSet0.vp_c9)._m0[148].y;
    float _495 = _493 + (*spvDescriptorSet0.vp_c9)._m0[149].y;
    float _497 = fma(_357, _335, _481);
    float _499 = fma(_491, _347, (*spvDescriptorSet0.vp_c9)._m0[148].x);
    float _501 = fma(_495, _347, (*spvDescriptorSet0.vp_c9)._m0[148].y);
    float _503 = fma(_463, _391, _487);
    float _505 = fma(_465, _391, _497);
    float _507 = -(*spvDescriptorSet0.vp_c9)._m0[149].x;
    float _509 = (*spvDescriptorSet0.vp_c9)._m0[150].x + _507;
    float _511 = -(*spvDescriptorSet0.vp_c9)._m0[149].y;
    float _513 = (*spvDescriptorSet0.vp_c9)._m0[150].y + _511;
    float _515 = fma(_483, _389, _503);
    float _517 = fma(_485, _389, _505);
    float _519 = fma(_509, _359, (*spvDescriptorSet0.vp_c9)._m0[149].x);
    float _521 = fma(_513, _359, (*spvDescriptorSet0.vp_c9)._m0[149].y);
    float _523 = fma(_499, _373, _515);
    float _525 = fma(_501, _373, _517);
    float _527 = fma(_519, _313, _523);
    float _529 = fma(_521, _313, _525);
    float _531 = fma(_223, (*spvDescriptorSet0.vp_c9)._m0[150].x, _527);
    float _533 = fma(_223, (*spvDescriptorSet0.vp_c9)._m0[150].y, _529);
    bool _535 = !_263;
    float _555;
    float _557;
    if (!_535)
    {
        float _537 = in.m_52.x;
        float _539 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].x;
        float _541 = float(_83);
        float _543 = _537 * (*spvDescriptorSet0.vp_c9)._m0[12].y;
        float _545 = fma(_543, (*spvDescriptorSet0.vp_c9)._m0[11].x, _115);
        float _547 = _545 * _539;
        float _549 = floor(_547);
        float _551 = -_549;
        float _553 = _547 + _551;
        _555 = _541;
        _557 = _553;
        _559 = true;
    }
    else
    {
        float _561 = float(_83);
        float _563 = 1.0 / _561;
        float _565 = _115 * _563;
        _555 = _561;
        _557 = _565;
    }
    _559 = false;
    float _567 = _555;
    float _569 = _557;
    float _571 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _573 = int(_571);
    float _575 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _577 = int(_575);
    float _579 = float(_573);
    float _581 = 1.0 / _567;
    float _583 = float(uint(_577));
    float _585 = 1.0 / _579;
    int _587 = ~_577;
    int _589 = _587 + 1;
    int _591 = ~_577;
    int _593 = _591 + 1;
    int _595 = ~_577;
    int _597 = _595 + 1;
    float _599 = 1.0 / _583;
    float _601 = _115 * _585;
    int _603 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _605 = _603 != 0;
    float _607 = trunc(_601);
    int _609 = int(_607);
    float _611 = float(_577);
    int _613 = as_type<int>(_599) + (-2);
    float _615 = float(uint(_609));
    float _617 = float(_609);
    float _619 = as_type<float>(_613) * _615;
    bool _621 = _617 >= _611;
    bool _623 = isnan(_617);
    bool _625 = _621 || _623;
    bool _627 = isnan(_611);
    bool _629 = _625 || _627;
    float _631 = float(_629);
    float _633 = in.m_52.x;
    float _635 = in.m_52.y;
    float _637 = trunc(_619);
    float _639 = precise::max(_637, 0.0);
    uint _642 = uint(_639);
    float _644 = trunc(_631);
    int _646 = int(_644);
    int _648 = _589 * int(_642);
    int _650 = _648 + _609;
    float _652 = float(uint(_650));
    float _654 = as_type<float>(_613) * _652;
    bool _656 = !_605;
    float _658 = _656 ? 7.345489978790283203125 : 1.0;
    float _660 = trunc(_654);
    float _662 = precise::max(_660, 0.0);
    uint _664 = uint(_662);
    float _666 = _658 * _633;
    float _668 = floor(_666);
    int _670 = int(_642) + int(_664);
    int _672 = _593 * _670;
    int _674 = _672 + _609;
    int _676 = ~_646;
    int _678 = _676 + 1;
    int _680 = _678 + 1;
    float _682 = -_668;
    float _684 = _666 + _682;
    bool _686 = uint(_674) >= uint(_577);
    float _688 = _684 * _611;
    float _690 = _115 * _611;
    bool _692 = !_686;
    int _694 = _692 ? 0 : (-1);
    bool _696 = _577 == 0;
    float _698 = _690 * _581;
    int _700 = ~_670;
    int _702 = _700 + _694;
    int _704 = _702 + 1;
    int _706 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _708 = _706 != 0;
    int _710 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _712 = _710 != 0;
    int _714 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _716 = _714 != 0;
    float _718 = trunc(_688);
    int _720 = int(_718);
    int _722 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _724 = _722 != 0;
    int _726 = _577 * _704;
    int _728 = _726 + _609;
    int _730 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _732 = _730 != 0;
    bool _734 = !_712;
    int _736 = _734 ? 0 : 1;
    bool _738 = !_696;
    int _740 = _738 ? _728 : (-1);
    float _742 = trunc(_698);
    int _744 = int(_742);
    int _746 = _577 + (-1);
    int _748 = _740 * _680;
    bool _750 = !_724;
    int _752 = _750 ? 0 : 1;
    int _754 = _646 * _746;
    int _756 = _754 + _748;
    bool _758 = !_708;
    int _760 = _758 ? 0 : 1;
    int _762 = abs(_736);
    bool _764 = !_716;
    int _766 = _764 ? 0 : 1;
    int _768 = abs(_760);
    int _770 = _756 * _762;
    int _772 = abs(_752);
    bool _774 = !_732;
    int _776 = _774 ? 0 : 1;
    int _778 = abs(_766);
    int _780 = _720 * _772;
    int _782 = _780 + _609;
    int _784 = abs(_776);
    int _786 = _744 * _768;
    int _788 = _786 + _770;
    int _790 = ~_577;
    int _792 = _790 + 1;
    int _794 = _782 * _778;
    int _796 = _794 + _788;
    int _798 = ~_577;
    int _800 = _798 + 1;
    int _802 = _720 * _784;
    int _804 = _802 + _796;
    float _806 = float(uint(_804));
    float _808 = as_type<float>(_613) * _806;
    float _810 = trunc(_808);
    float _812 = precise::max(_810, 0.0);
    uint _814 = uint(_812);
    int _816 = _800 * int(_814);
    int _818 = _816 + _804;
    float _820 = float(uint(_818));
    float _822 = as_type<float>(_613) * _820;
    float _824 = trunc(_822);
    float _826 = precise::max(_824, 0.0);
    uint _828 = uint(_826);
    int _830 = int(_814) + int(_828);
    int _832 = _792 * _830;
    int _834 = _832 + _804;
    bool _836 = uint(_834) >= uint(_577);
    float _838 = float(uint(_782));
    bool _840 = !_836;
    int _842 = _840 ? 0 : (-1);
    float _844 = as_type<float>(_613) * _838;
    int _846 = ~_830;
    int _848 = _846 + _842;
    int _850 = _848 + 1;
    int _852 = _577 * _850;
    int _854 = _852 + _804;
    float _856 = trunc(_844);
    float _858 = precise::max(_856, 0.0);
    uint _860 = uint(_858);
    int _862 = ~_577;
    int _864 = _862 + 1;
    bool _866 = !_696;
    int _868 = _866 ? _854 : (-1);
    int _870 = _868 >> 31;
    int _872 = _868 & 3;
    bool _874 = _872 != 0;
    int _876 = _870 & 3;
    int _878 = _868 + _876;
    int _880 = _878 >> 2;
    int _882 = _864 * int(_860);
    int _884 = _882 + _782;
    int _886 = _880 << 4;
    int _888 = _886 + 368;
    uint _890 = uint(int(uint(_888) >> uint(2)));
    uint _892 = uint(int(uint(int(_890)) >> uint(2)));
    int _894 = int(_890) & 3;
    float _896 = (*spvDescriptorSet0.vp_c9)._m0[int(_892)][_894];
    int _898 = int(_890) + 1;
    uint _900 = uint(int(uint(_898) >> uint(2)));
    int _902 = _898 & 3;
    float _904 = (*spvDescriptorSet0.vp_c9)._m0[int(_900)][_902];
    float _906 = float(uint(_884));
    float _908 = as_type<float>(_613) * _906;
    int _910 = _868 & 3;
    bool _912 = _910 != 0;
    int _914 = _888 + 8;
    uint _916 = uint(int(uint(_914) >> uint(2)));
    uint _918 = uint(int(uint(int(_916)) >> uint(2)));
    int _920 = int(_916) & 3;
    float _922 = (*spvDescriptorSet0.vp_c9)._m0[int(_918)][_920];
    int _924 = int(_916) + 1;
    uint _926 = uint(int(uint(_924) >> uint(2)));
    int _928 = _924 & 3;
    float _930 = (*spvDescriptorSet0.vp_c9)._m0[int(_926)][_928];
    int _932 = _874 ? 0 : 1;
    bool _934 = uint(_910) > 1u;
    float _936 = trunc(_908);
    float _938 = precise::max(_936, 0.0);
    uint _940 = uint(_938);
    bool _942 = _910 != 3;
    bool _944 = uint(_910) >= 2u;
    int _946 = ~_932;
    int _948 = _946 + 1;
    int _950 = _948 + 1;
    int _952 = _950;
    if (!_934)
    {
        int _954 = ~_932;
        int _956 = _954 + 1;
        _952 = _956;
    }
    int _958 = _952;
    bool _960 = !_912;
    int _962 = _960 ? 0 : 1;
    int _964 = int(_860) + int(_940);
    int _966 = abs(_958);
    int _968 = abs(_962);
    int _970 = _597 * _964;
    int _972 = _970 + _782;
    int _974 = _944 ? 0 : 1;
    float _976 = trunc((*spvDescriptorSet0.vp_c9)._m0[80].z);
    int _978 = int(_976);
    bool _980 = _910 != 3;
    int _982 = ~_974;
    int _984 = _982 + 1;
    int _986 = _984 + 1;
    int _988 = _986;
    if (_942)
    {
        int _990 = ~_974;
        int _992 = _990 + 1;
        _988 = _992;
    }
    int _994 = _988;
    int _996 = ~_966;
    int _998 = _996 + 1;
    int _1000 = _998 + 1;
    int _1002 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _1004 = _1002 != 0;
    int _1006 = abs(_994);
    int _1008 = _1000 * as_type<int>(_904);
    bool _1010 = !_980;
    int _1012 = _1010 ? 0 : (-1);
    int _1014 = ~_968;
    int _1016 = _1014 + 1;
    int _1018 = _1016 + 1;
    bool _1020 = !_1004;
    int _1022 = _1020 ? 0 : 1;
    int _1024 = abs(_1012);
    int _1026 = _1018 * as_type<int>(_896);
    int _1028 = _1026 + _1008;
    bool _1030 = uint(_972) >= uint(_577);
    int _1032 = ~_1006;
    int _1034 = _1032 + 1;
    int _1036 = _1034 + 1;
    int _1038 = abs(_1022);
    int _1040 = _1036 * as_type<int>(_922);
    int _1042 = _1040 + _1028;
    bool _1044 = !_1030;
    int _1046 = _1044 ? 0 : (-1);
    float _1048 = float(uint(_978));
    int _1050 = ~_1024;
    int _1052 = _1050 + 1;
    int _1054 = _1052 + 1;
    int _1056 = ~_964;
    int _1058 = _1056 + _1046;
    int _1060 = _1058 + 1;
    int _1062 = abs(_978);
    float _1064 = 1.0 / _1048;
    int _1066 = _1054 * as_type<int>(_930);
    int _1068 = _1066 + _1042;
    int _1070 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1072 = _1070 != 0;
    int _1074 = _577 * _1060;
    int _1076 = _1074 + _782;
    float _1078 = float(uint(_1062));
    int _1080 = ~_1038;
    int _1082 = _1080 + 1;
    int _1084 = _1082 + 1;
    bool _1086 = !_696;
    int _1088 = _1086 ? _1076 : (-1);
    float _1090 = 1.0 / _1078;
    int _1092 = _1068 * _1084;
    int _1094 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1096 = _1094 != 0;
    float _1098 = _633 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    int _1100 = ~_978;
    int _1102 = _1100 + 1;
    int _1104 = _1088 * _1038;
    int _1106 = _1104 + _1092;
    int _1108 = as_type<int>(_1064) + (-2);
    int _1110 = ~_1062;
    int _1112 = _1110 + 1;
    float _1114 = float(uint(_1106));
    int _1116 = abs(_1106);
    bool _1118 = _633 > 0.5;
    float _1120 = as_type<float>(_1108) * _1114;
    int _1122 = as_type<int>(_1090) + (-2);
    float _1124 = float(uint(_1116));
    float _1126 = trunc(_1120);
    float _1128 = precise::max(_1126, 0.0);
    uint _1130 = uint(_1128);
    float _1132 = as_type<float>(_1122) * _1124;
    bool _1134 = _635 > 0.5;
    float _1136 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    bool _1138 = _978 == 0;
    float _1140 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _1142 = trunc(_1132);
    float _1144 = precise::max(_1142, 0.0);
    uint _1146 = uint(_1144);
    float _1148 = -_1136;
    float _1150 = fma(_1098, 2.0, _1148);
    float _1152 = fma(_633, (*spvDescriptorSet0.vp_c9)._m0[78].z, _1140);
    float _1154 = in.m_42.x;
    float _1156 = in.m_42.y;
    float _1158 = in.m_42.z;
    float _1160 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _1162 = (*spvDescriptorSet0.vp_c9)._m0[108].w + _1160;
    int _1164 = _1102 * int(_1130);
    int _1166 = _1164 + _1106;
    float _1168 = 1.0 / _1162;
    float _1170 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _1172 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _1174 = float(uint(_1166));
    int _1176 = _1112 * int(_1146);
    int _1178 = _1176 + _1116;
    float _1180 = as_type<float>(_1108) * _1174;
    float _1182 = _635 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _1184 = fma(_635, (*spvDescriptorSet0.vp_c9)._m0[78].w, _1172);
    float _1186 = float(uint(_1178));
    float _1188 = trunc(_1180);
    float _1190 = precise::max(_1188, 0.0);
    uint _1192 = uint(_1190);
    float _1194 = fma(_1182, -2.0, _1170);
    int _1196 = ~_978;
    int _1198 = _1196 + 1;
    float _1200 = as_type<float>(_1122) * _1186;
    float _1202 = _1156 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _1204 = _1156 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _1206 = _1156 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _1208 = trunc(_1200);
    float _1210 = precise::max(_1208, 0.0);
    uint _1212 = uint(_1210);
    float _1214 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _1216 = _569 + _1214;
    float _1218 = fma(_1154, (*spvDescriptorSet0.vp_c10)._m0[4].x, _1202);
    float _1220 = fma(_1154, (*spvDescriptorSet0.vp_c10)._m0[5].x, _1204);
    float _1222 = fma(_1154, (*spvDescriptorSet0.vp_c10)._m0[6].x, _1206);
    float _1224 = _1216 * _1168;
    float _1226 = -_115;
    float _1228 = fma(_1226, (*spvDescriptorSet0.vp_c9)._m0[76].x, _1150);
    float _1230 = fma(_115, (*spvDescriptorSet0.vp_c9)._m0[77].z, _1152);
    int _1232 = int(_1130) + int(_1192);
    float _1234 = fma(_115, (*spvDescriptorSet0.vp_c9)._m0[76].y, _1194);
    float _1236 = fma(_115, (*spvDescriptorSet0.vp_c9)._m0[77].w, _1184);
    float _1238 = fma(_1158, (*spvDescriptorSet0.vp_c10)._m0[4].z, _1218);
    float _1240 = fma(_1158, (*spvDescriptorSet0.vp_c10)._m0[5].z, _1220);
    float _1242 = fma(_1158, (*spvDescriptorSet0.vp_c10)._m0[6].z, _1222);
    int _1244 = _1198 * _1232;
    int _1246 = _1244 + _1106;
    float _1248 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _1250 = _1238 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    int _1252 = int(_1146) + int(_1212);
    float _1254 = -(*spvDescriptorSet0.vp_c9)._m0[107].x;
    float _1256 = (*spvDescriptorSet0.vp_c9)._m0[108].x + _1254;
    int _1258 = ~_1062;
    int _1260 = _1258 + 1;
    float _1262 = _1242 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    bool _1264 = uint(_1246) >= uint(_978);
    float _1266 = -(*spvDescriptorSet0.vp_c9)._m0[107].z;
    float _1268 = (*spvDescriptorSet0.vp_c9)._m0[108].z + _1266;
    int _1270 = _1260 * _1252;
    int _1272 = _1270 + _1116;
    float _1274 = fma(_1256, _1224, (*spvDescriptorSet0.vp_c9)._m0[107].x);
    bool _1276 = _569 >= (*spvDescriptorSet0.vp_c9)._m0[108].w;
    bool _1278 = isnan(_569);
    bool _1280 = _1276 || _1278;
    bool _1282 = isnan((*spvDescriptorSet0.vp_c9)._m0[108].w);
    bool _1284 = _1280 || _1282;
    float _1286 = float(_1284);
    float _1288 = fma(_1268, _1224, (*spvDescriptorSet0.vp_c9)._m0[107].z);
    bool _1290 = _569 >= (*spvDescriptorSet0.vp_c9)._m0[107].w;
    bool _1292 = isnan(_569);
    bool _1294 = _1290 || _1292;
    bool _1296 = isnan((*spvDescriptorSet0.vp_c9)._m0[107].w);
    bool _1298 = _1294 || _1296;
    float _1300 = float(_1298);
    float _1302 = -(*spvDescriptorSet0.vp_c9)._m0[107].y;
    float _1304 = (*spvDescriptorSet0.vp_c9)._m0[108].y + _1302;
    bool _1306 = uint(_1272) >= uint(_1062);
    float _1308 = -_1286;
    float _1310 = _1308 + 1.0;
    bool _1312 = !_1264;
    int _1314 = _1312 ? 0 : (-1);
    float _1316 = fma(_1304, _1224, (*spvDescriptorSet0.vp_c9)._m0[107].y);
    int _1318 = _1106 ^ _978;
    float _1320 = _1300 * _1310;
    int _1322 = ~_1232;
    int _1324 = _1322 + _1314;
    int _1326 = _1324 + 1;
    float _1328 = -_1300;
    float _1330 = _1328 + 1.0;
    bool _1332 = _978 == 0;
    float _1334 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    uint _1336 = uint(int(uint(_1318) >> uint(31)));
    int _1338 = _978 * _1326;
    int _1340 = _1338 + _1106;
    float _1342 = _1274 * _1320;
    bool _1344 = !_1306;
    int _1346 = _1344 ? 0 : (-1);
    float _1348 = _1316 * _1320;
    int _1350 = ~int(_1336);
    int _1352 = _1350 + 1;
    float _1354 = _1288 * _1320;
    int _1356 = ~_1346;
    int _1358 = _1252 + _1356;
    int _1360 = _1358 + 1;
    float _1362 = _1248 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    bool _1364 = !_1332;
    int _1366 = _1364 ? _1340 : (-1);
    float _1368 = fma(_1330, (*spvDescriptorSet0.vp_c9)._m0[107].y, _1348);
    int _1370 = _1360 ^ _1352;
    float _1372 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1374 = _1250 + _1372;
    float _1376 = float(_1366);
    float _1378 = fma(_1330, (*spvDescriptorSet0.vp_c9)._m0[107].x, _1342);
    int _1380 = ~_1352;
    int _1382 = _1380 + _1370;
    int _1384 = _1382 + 1;
    float _1386 = fma(_1330, (*spvDescriptorSet0.vp_c9)._m0[107].z, _1354);
    float _1388 = -_151;
    int _1390 = _1118 ? as_type<int>(_1388) : as_type<int>(_151);
    float _1392 = fma(_1362, _1376, _1228);
    float _1394 = _1240 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _1396 = _1334 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    bool _1398 = !_1072;
    float _1400 = _1398 ? _151 : as_type<float>(_1390);
    float _1402 = -_1230;
    float _1404 = _1402 + 1.0;
    float _1406 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1408 = _1394 + _1406;
    bool _1410 = !_1138;
    int _1412 = _1410 ? _1384 : (-1);
    float _1414 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1416 = _1262 + _1414;
    float _1418 = -_155;
    int _1420 = _1134 ? as_type<int>(_1418) : as_type<int>(_155);
    float _1422 = _1408 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1424 = _1400 + 0.5;
    float _1426 = float(_1412);
    float _1428 = fma(_1286, (*spvDescriptorSet0.vp_c9)._m0[108].y, _1368);
    float _1430 = fma(_1374, (*spvDescriptorSet0.vp_c8)._m0[28].x, _1422);
    bool _1432 = !_1096;
    float _1434 = _1432 ? _155 : as_type<float>(_1420);
    float _1436 = fma(_1362, _1424, _1392);
    float _1438 = -_1234;
    float _1440 = fma(_1396, _1426, _1438);
    float _1442 = fma(_1416, (*spvDescriptorSet0.vp_c8)._m0[28].z, _1430);
    float _1444 = _1434 + (-0.5);
    float _1446 = -_1404;
    float _1448 = fma(_1400, _1446, _1436);
    float _1450 = _1408 * _1408;
    bool _1452 = _1442 >= 0.0;
    float _1454 = -_1396;
    float _1456 = fma(_1454, _1444, _1440);
    float _1458 = fma(_1286, (*spvDescriptorSet0.vp_c9)._m0[108].x, _1378);
    float _1460 = fma(_1374, _1374, _1450);
    float _1462 = fma(_1286, (*spvDescriptorSet0.vp_c9)._m0[108].z, _1386);
    float _1464 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _1466 = fma(_1416, _1416, _1460);
    float _1468 = _1458 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _1470 = rsqrt(_1466);
    float _1472 = _1462 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1474 = _1200;
    int _1476 = as_type<int>(_1472);
    if (_1452)
    {
        _1474 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _1478 = _1474;
    float _1480 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1482 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1484 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1486 = _1428 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _1488 = -_1236;
    float _1490 = _1488 + 1.0;
    float _1492 = _1468 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1494 = _1472 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1496 = _1480 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1498 = _1482 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1500 = _1484 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1502 = _1486 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1504 = _1500;
    if (_1452)
    {
        float _1506 = _1478 * 5.0;
        _1476 = as_type<int>(_1506);
    }
    int _1508 = _1476;
    float _1510 = fma(_1434, _1490, _1456);
    if (_1452)
    {
        out.m_45.x = 0.0;
    }
    float _1512 = _1408 * _1470;
    float _1514 = _1374 * _1470;
    out.m_54.x = _1496;
    out.m_54.y = _1498;
    out.m_54.z = _1500;
    out.m_56.x = _1492;
    out.m_56.y = _1502;
    out.m_56.z = _1494;
    out.m_56.w = _1464;
    if (_1452)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _4394 = as_type<float>(_1508);
        out.gl_Position.z = _4394;
    }
    out.m_58.x = _1448;
    out.m_58.y = _1510;
    if (_1452)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_56.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_56.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_56.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_56.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_54.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_54.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_54.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_54.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_62.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_62.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_62.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_62.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_58.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_58.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_58.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_58.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _1516 = -_1512;
    float _1518 = fma(_1516, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1394);
    float _1520 = _1416 * _1470;
    float _1522 = -_1514;
    float _1524 = fma(_1522, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1250);
    float _1526 = -_1512;
    float _1528 = fma(_1526, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1408);
    float _1530 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1532 = _1518 + _1530;
    float _1534 = -_1520;
    float _1536 = fma(_1534, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1262);
    float _1538 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1540 = _1524 + _1538;
    float _1542 = -_1514;
    float _1544 = fma(_1542, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1374);
    float _1546 = _1532 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1548 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1550 = _1536 + _1548;
    float _1552 = _1528 * _1528;
    float _1554 = in.m_60.x;
    float _1556 = in.m_60.y;
    float _1558 = fma(_1540, (*spvDescriptorSet0.vp_c8)._m0[28].x, _1546);
    float _1560 = -_1520;
    float _1562 = fma(_1560, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1416);
    float _1564 = fma(_1544, _1544, _1552);
    float _1566 = fma(_1550, (*spvDescriptorSet0.vp_c8)._m0[28].z, _1558);
    float _1568 = fma(_1562, _1562, _1564);
    bool _1570 = _1566 >= 0.0;
    float _1572 = sqrt(_1568);
    float _1574 = _1520;
    float _1576 = _1550;
    if (_1570)
    {
        _1504 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _1578 = _1504;
    int _1580 = as_type<int>(_1578);
    if (_1570)
    {
        out.m_45.x = 0.0;
    }
    float _1582 = _531 * _1554;
    float _1584 = _533 * _1556;
    float _1586 = _1470 * _1572;
    if (_1570)
    {
        float _1588 = _1578 * 5.0;
        _1580 = as_type<int>(_1588);
    }
    int _1590 = _1580;
    if (_1570)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _4537 = as_type<float>(_1590);
        out.gl_Position.z = _4537;
    }
    if (_1570)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_56.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_56.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_56.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_56.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_54.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_54.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_54.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_54.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_62.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_62.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_62.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_62.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_58.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_58.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_58.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_58.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _1592 = _1584 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1594 = _1582 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1596 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _155);
    float _1598 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _151);
    float _1600 = _1592 * _1586;
    float _1602 = _1594 * _1586;
    float _1604 = _1586 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _1606 = _1604 * 0.5;
    float _1608 = _1596 * _1600;
    float _1610 = _1598 * _1602;
    bool _1612 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _1614 = isnan(0.5);
    bool _1616 = _1612 || _1614;
    bool _1618 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1620 = _1616 || _1618;
    float _1622 = _1608 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1624 = _1608 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1626 = _1608 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1628 = fma(_1610, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1622);
    float _1630 = fma(_1610, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1624);
    float _1632 = fma(_1610, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1626);
    float _1634 = fma(_1606, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1628);
    float _1636 = fma(_1606, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1630);
    float _1638 = fma(_1606, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1632);
    float _1640 = _1634 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _1642 = _1636 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _1644 = _1638 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _1646 = _1262 + _1640;
    float _1648 = _1250 + _1642;
    float _1650 = _1394 + _1644;
    float _1652 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1654 = _1646 + _1652;
    float _1656 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1658 = _1648 + _1656;
    float _1660 = _1654 * _1654;
    float _1662 = fma(_1658, _1658, _1660);
    float _1664 = sqrt(_1662);
    bool _1666 = _1664 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1668 = _1644;
    float _1670 = _1638;
    float _1672 = _1636;
    float _1674 = _1646;
    if (!_1666)
    {
        _1668 = _1648;
    }
    float _1676 = _1668;
    float _1678 = _1676;
    if (!_1666)
    {
        _1670 = _1646;
    }
    float _1680 = _1670;
    float _1682 = _1680;
    if (!_1666)
    {
        _1672 = _1650;
    }
    float _1684 = _1672;
    bool _1686 = !_1666;
    float _1688 = _1684;
    if (!_1686)
    {
        float _1690 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1692 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1694 = _1664 + _1692;
        float _1696 = rsqrt(_1662);
        float _1698 = _1694 * _1690;
        float _1700 = _1650 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1702 = _1698 * 0.15915493667125701904296875;
        float _1704 = _1702 * 6.283185482025146484375;
        float _1706 = sin(_1704);
        float _1708 = _1702 * 6.283185482025146484375;
        float _1710 = cos(_1708);
        float _1712 = fma(_1706, _1700, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1714 = _1696 * _1712;
        float _1716 = _1710 + (-1.0);
        float _1718 = fma(_1658, _1714, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1720 = fma(_1654, _1714, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _1722 = _1716 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1724 = fma(_1650, _1710, _1722);
        _1678 = _1718;
        _1682 = _1720;
        _1688 = _1724;
    }
    float _1726 = _1678;
    float _1728 = _1682;
    float _1730 = _1688;
    float _1732 = -_1514;
    float _1734 = fma(_1732, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1726);
    float _1736 = -_1520;
    float _1738 = fma(_1736, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1728);
    float _1740 = -_1512;
    float _1742 = fma(_1740, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1730);
    float _1744 = _1742;
    float _1746 = _1738;
    if (_1620)
    {
        _1574 = _1734;
    }
    float _1748 = _1574;
    float _1750 = _1748;
    if (!_1620)
    {
        float _1752 = _1532 * _1532;
        float _1754 = 1.0 / _1586;
        float _1756 = -_1250;
        float _1758 = _1756 + _1726;
        float _1760 = -_1394;
        float _1762 = _1760 + _1730;
        float _1764 = fma(_1540, _1540, _1752);
        float _1766 = fma(_1550, _1550, _1764);
        float _1768 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1770 = sqrt(_1766);
        float _1772 = precise::min(_1770, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1774 = _1772 * _1768;
        float _1776 = _1774 * _1754;
        float _1778 = -_1262;
        float _1780 = _1778 + _1728;
        float _1782 = fma(_1758, _1776, _1524);
        float _1784 = fma(_1762, _1776, _1518);
        float _1786 = fma(_1780, _1776, _1536);
        _1744 = _1784;
        _1750 = _1782;
        _1746 = _1786;
        _1576 = _1768;
    }
    float _1788 = _1744;
    float _1790 = _1750;
    float _1792 = _1746;
    float _1794 = _1576;
    float _1796 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1798 = _1788 + _1796;
    float _1800 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1802 = _1790 + _1800;
    float _1804 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1806 = _1792 + _1804;
    float _1808 = _1798 * _1798;
    float _1810 = fma(_1802, _1802, _1808);
    float _1812 = fma(_1806, _1806, _1810);
    float _1814 = rsqrt(_1812);
    float _1816 = _1814 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1818 = _1802 * _1816;
    float _1820 = _1806 * _1816;
    float _1822 = _1818 * _1818;
    float _1824 = _1820 * _1820;
    float _1826 = _1822 + _1824;
    float _1828 = sqrt(_1826);
    bool _1830 = _1828 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1832 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1834 = _1828 + _1832;
    float _1836 = _1814;
    float _1838 = _1826;
    float _1840 = _1834;
    float _1842 = _1794;
    float _1844 = _1798;
    float _1846 = _1818;
    if (_1830)
    {
        float _1848 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1836 = _1848;
    }
    float _1850 = _1836;
    if (_1830)
    {
        float _1852 = rsqrt(_1826);
        _1838 = _1852;
    }
    float _1854 = _1838;
    if (_1830)
    {
        float _1856 = _1834 * _1850;
        _1840 = _1856;
    }
    float _1858 = _1840;
    if (_1830)
    {
        float _1860 = _1858 * 0.15915493667125701904296875;
        _1842 = _1860;
    }
    float _1862 = _1842;
    float _1864 = _1850;
    if (_1830)
    {
        float _1866 = _1862 * 6.283185482025146484375;
        float _1868 = sin(_1866);
        _1864 = _1868;
    }
    float _1870 = _1864;
    float _1872 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1874 = precise::max(0.0, _1872);
    float _1876 = _1806;
    float _1878 = _1874;
    if (_1830)
    {
        float _1880 = _1862 * 6.283185482025146484375;
        float _1882 = cos(_1880);
        _1876 = _1882;
    }
    float _1884 = _1876;
    float _1886 = -_1816;
    float _1888 = -_1874;
    float _1890 = fma(_1798, _1886, _1888);
    float _1892 = _1890;
    if (_1830)
    {
        float _1894 = _1890 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1878 = _1894;
    }
    float _1896 = _1878;
    float _1898 = _1870;
    float _1900 = _1896;
    if (_1830)
    {
        float _1902 = fma(_1870, _1896, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1898 = _1902;
    }
    float _1904 = _1898;
    float _1906 = _1904;
    if (_1830)
    {
        float _1908 = _1884 + (-1.0);
        _1900 = _1908;
    }
    float _1910 = _1900;
    float _1912 = _1910;
    if (_1830)
    {
        float _1914 = _1854 * _1904;
        _1674 = _1914;
    }
    float _1916 = _1674;
    if (!_1830)
    {
        _1906 = _1820;
    }
    float _1918 = _1906;
    float _1920 = sqrt(_1812);
    float _1922 = _1918;
    if (_1830)
    {
        float _1924 = _1910 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1844 = _1924;
    }
    float _1926 = _1844;
    float _1928 = _1926;
    if (_1830)
    {
        float _1930 = _1818 * _1916;
        _1846 = _1930;
    }
    float _1932 = _1846;
    if (!_1830)
    {
        _1912 = _1822;
    }
    float _1934 = _1912;
    float _1936 = _1934;
    if (_1830)
    {
        float _1938 = _1820 * _1916;
        _1922 = _1938;
    }
    float _1940 = _1922;
    if (_1830)
    {
        float _1942 = fma(_1890, _1884, _1926);
        _1892 = _1942;
    }
    float _1944 = _1892;
    if (_1830)
    {
        float _1946 = _1932 * _1932;
        _1936 = _1946;
    }
    float _1948 = _1936;
    if (!_1830)
    {
        _1928 = _1824;
    }
    float _1950 = _1928;
    float _1952 = _1950;
    if (_1830)
    {
        float _1954 = _1940 * _1940;
        _1952 = _1954;
    }
    float _1956 = _1952;
    float _1958 = fma(_1944, _1944, _1948);
    float _1960 = _1788 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1962 = _1958 + _1956;
    float _1964 = _1788 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1966 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1968 = fma(_1920, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1966);
    float _1970 = precise::clamp(_1968, 0.0, 1.0);
    float _1972 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _1974 = rsqrt(_1962);
    float _1976 = fma(_1790, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1964);
    float _1978 = _1788 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1980 = -_1970;
    float _1982 = _1980 + 1.0;
    float _1984 = fma(_1790, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1960);
    float _1986 = fma(_1792, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1976);
    float _1988 = _1788 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1990 = fma(_1790, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1978);
    float _1992 = _1986 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1994 = abs(_1982);
    float _1996 = log2(_1994);
    float _1998 = fma(_1790, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1988);
    float _2000 = fma(_1792, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1990);
    float _2002 = _1992 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _2004 = fma(_1792, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1998);
    float _2006 = _2000 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _2008 = -_2002;
    float _2010 = fma(_2008, _1972, 1.0);
    float _2012 = fma(_1792, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1984);
    float _2014 = _1974 * _1932;
    float _2016 = _2004 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2018 = _2006 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _2020 = _1974 * _1944;
    float _2022 = _2014 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _2024 = _1974 * _1940;
    float _2026 = fma(_2016, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2018);
    float _2028 = _1996 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _2030 = -_2022;
    float _2032 = fma(_2020, (*spvDescriptorSet0.vp_c15)._m0[21].y, _2030);
    float _2034 = _2012 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _2036 = fma(_1992, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2026);
    float _2038 = exp2(_2028);
    float _2040 = -_2024;
    float _2042 = fma(_2040, (*spvDescriptorSet0.vp_c15)._m0[21].z, _2032);
    float _2044 = _2006 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2046 = fma(_2034, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2036);
    float _2048 = _2006 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2050 = fma(_2042, -0.5, 0.5);
    float _2052 = fma(_2016, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2044);
    float _2054 = log2(_2010);
    float _2056 = fma(_2042, 0.5, 0.5);
    float _2058 = fma(_2016, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2048);
    float _2060 = _2020 + 1.0;
    float _2062 = fma(_1992, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2052);
    float _2064 = fma(_2056, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _2066 = fma(_1992, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2058);
    float _2068 = 1.0 / _2046;
    float _2070 = -_2020;
    float _2072 = fma(_2038, _2060, _2070);
    float _2074 = fma(_2034, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2062);
    float _2076 = fma(_2056, _2064, -0.212114393711090087890625);
    float _2078 = fma(_2034, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2066);
    float _2080 = fma(_2072, 0.5, 0.5);
    float _2082 = fma(_2056, _2076, 1.570728778839111328125);
    float _2084 = sqrt(_2050);
    float _2086 = _2054 * 0.693147182464599609375;
    float _2088 = _2074 * _2068;
    float _2090 = _2078 * _2068;
    float _2092 = _2086 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _2094 = fma(_2088, 0.5, 0.5);
    float _2096 = fma(_2090, -0.5, 0.5);
    float _2098 = _2084 * 0.636619746685028076171875;
    float3 _5381 = float3(_2094, _2096, _2092);
    float _2100 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_5381, float3(0.0), isnan(_5381)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_5381, float3(0.0), isnan(_5381)), level(0.0)).x;
    float3 _5392 = float3(_2094, _2096, _2092);
    float4 _2103 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_5392, float3(0.0), isnan(_5392)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_5392, float3(0.0), isnan(_5392)), level(0.0)).xyzw;
    float _2105 = _2103.x;
    float _2107 = _2103.y;
    float _2109 = _2103.z;
    float _2111 = _2103.w;
    float _2113 = -_2082;
    float _2115 = fma(_2098, _2113, 1.0);
    float2 _5414 = float2(_2115, _2080);
    float3 _2119 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_5414, float2(0.0), isnan(_5414)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_5414, float2(0.0), isnan(_5414)), level(0.0)).xyz;
    float _2121 = _2119.x;
    float _2123 = _2119.y;
    float _2125 = _2119.z;
    float _2127 = _1996 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _2129 = _2006 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _2131 = fma(_2016, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2129);
    float _2133 = exp2(_2127);
    float _2135 = fma(_1992, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2131);
    float _2137 = fma(_2034, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2135);
    float _2139 = _2137 + _2046;
    out.gl_Position.x = _2074;
    out.gl_Position.y = _2078;
    out.gl_Position.z = _2137;
    out.gl_Position.w = _2046;
    float _2141 = _2139 * 0.5;
    float _2143 = -_2133;
    float _2145 = _2143 + 1.0;
    float _2147 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2149 = _2145 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    out.m_62.z = _2141;
    out.m_62.w = _2046;
    out.m_45.x = _2147;
    float _2151 = _2149 * _2100;
    float _2153 = -_2149;
    float _2155 = _2153 + 1.0;
    float _2157 = _2111 * _2151;
    float _2159 = _2125 * _2151;
    float _2161 = fma(_2121, _2157, _2105);
    float _2163 = fma(_2123, _2157, _2107);
    float _2165 = _2111 * _2155;
    float _2167 = fma(_2111, _2159, _2109);
    out.m_64.x = _2161;
    out.m_64.y = _2163;
    out.m_64.z = _2167;
    out.m_64.w = _2165;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_56.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_56.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_56.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_56.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_54.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_54.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_54.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_54.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_62.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_62.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_62.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_62.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_58.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_58.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_58.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_58.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

