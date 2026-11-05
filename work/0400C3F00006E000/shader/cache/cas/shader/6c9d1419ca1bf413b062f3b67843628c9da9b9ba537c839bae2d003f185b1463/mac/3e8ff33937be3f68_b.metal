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
    float4 m_70 [[user(locn0)]];
    float4 m_68 [[user(locn1)]];
    float4 m_66 [[user(locn2)]];
    float4 m_78 [[user(locn3)]];
    float4 m_86 [[user(locn4)]];
    float4 m_51 [[user(locn5)]];
    float4 m_72 [[user(locn6)]];
    float4 m_74 [[user(locn7)]];
    float4 m_84 [[user(locn8)]];
    float4 m_80 [[user(locn9)]];
    float4 m_82 [[user(locn10)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_76 [[attribute(0)]];
    float4 m_64 [[attribute(1)]];
    float4 m_58 [[attribute(2)]];
    float4 m_48 [[attribute(3)]];
    float4 m_53 [[attribute(4)]];
    float4 m_60 [[attribute(5)]];
    float4 m_62 [[attribute(6)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_70 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_68 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_66 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_78 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_86 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_51 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_72 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_74 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_84 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_80 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_82 = float4(0.0, 0.0, 0.0, 1.0);
    bool _2755 = false;
    bool _1910 = false;
    bool _381 = false;
    bool _229 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _100 = in.m_48.w;
    float _102 = trunc(_100);
    int _105 = int(_102);
    bool _109 = _105 >= 1;
    float _111 = 0.0;
    if (!_109)
    {
        _111 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _113 = _111;
    float _115 = _113;
    if (!_109)
    {
        out.m_51.x = 0.0;
    }
    int _117 = 0;
    if (!_109)
    {
        float _119 = _113 * 5.0;
        _117 = as_type<int>(_119);
    }
    int _121 = _117;
    int _123 = _121;
    if (!_109)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3040 = as_type<float>(_121);
        out.gl_Position.z = _3040;
    }
    if (!_109)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _125 = in.m_53.w;
    bool _127 = _125 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _129 = isnan(_125);
    bool _131 = _127 || _129;
    bool _133 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _135 = _131 || _133;
    float _137 = -_125;
    float _139 = _137 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _141 = 0.0;
    float _143 = _139;
    if (_135)
    {
        float _145 = float(_105);
        _141 = _145;
    }
    float _147 = _141;
    bool _149 = _139 >= _147;
    bool _151 = !_135;
    bool _153 = _149 || _151;
    if (_153)
    {
        _115 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _155 = _115;
    if (_153)
    {
        out.m_51.x = 0.0;
    }
    if (_153)
    {
        float _157 = _155 * 5.0;
        _123 = as_type<int>(_157);
    }
    int _159 = _123;
    if (_153)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3109 = as_type<float>(_159);
        out.gl_Position.z = _3109;
    }
    if (_153)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _161 = as_type<float>(int(gl_VertexIndex));
    float _163 = in.m_58.x;
    float _165 = in.m_58.y;
    float _167 = in.m_58.z;
    int _169 = as_type<int>(_161) & 1;
    bool _171 = _169 != 0;
    int _173 = as_type<int>(_161) & 2;
    bool _175 = _173 != 0;
    bool _177 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _179 = _165 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _181 = _165 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _183 = _165 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    bool _185 = !_171;
    float _187 = _185 ? (-0.5) : 0.5;
    float _189 = fma(_163, (*spvDescriptorSet0.vp_c10)._m0[4].x, _179);
    float _191 = fma(_163, (*spvDescriptorSet0.vp_c10)._m0[5].x, _181);
    float _193 = fma(_163, (*spvDescriptorSet0.vp_c10)._m0[6].x, _183);
    bool _195 = !_175;
    float _197 = _195 ? (-0.5) : 0.5;
    float _199 = fma(_167, (*spvDescriptorSet0.vp_c10)._m0[4].z, _189);
    float _201 = fma(_167, (*spvDescriptorSet0.vp_c10)._m0[5].z, _191);
    float _203 = fma(_167, (*spvDescriptorSet0.vp_c10)._m0[6].z, _193);
    bool _205 = !_177;
    float _207 = _199;
    float _209 = _201;
    float _227;
    if (!_205)
    {
        float _211 = in.m_60.x;
        float _213 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _215 = _211 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _217 = fma(_215, (*spvDescriptorSet0.vp_c9)._m0[12].x, _139);
        float _219 = _217 * _213;
        float _221 = floor(_219);
        float _223 = -_221;
        float _225 = _219 + _223;
        _227 = _225;
        _229 = true;
    }
    else
    {
        float _231 = float(_105);
        float _233 = 1.0 / _231;
        float _235 = _139 * _233;
        _227 = _235;
    }
    _229 = false;
    float _237 = _227;
    float _239 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _241 = _237 + _239;
    bool _243 = _237 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _245 = isnan(_237);
    bool _247 = _243 || _245;
    bool _249 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _251 = _247 || _249;
    float _253 = float(_251);
    bool _255 = _237 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _257 = isnan(_237);
    bool _259 = _255 || _257;
    bool _261 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _263 = _259 || _261;
    float _265 = float(_263);
    float _267 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _269 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _267;
    float _271 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _273 = _271 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _275 = -_253;
    float _277 = _275 + 1.0;
    float _279 = 1.0 / _273;
    bool _281 = _237 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _283 = isnan(_237);
    bool _285 = _281 || _283;
    bool _287 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _289 = _285 || _287;
    float _291 = float(_289);
    float _293 = _265 * _277;
    float _295 = -_265;
    float _297 = _295 + 1.0;
    bool _299 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _301 = _291 * _297;
    float _303 = 1.0 / _269;
    float _305 = -_291;
    float _307 = _305 + 1.0;
    float _309 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _311 = _309 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _313 = _241 * _303;
    float _315 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _317 = _237 + _315;
    float _319 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _321 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _319;
    float _323 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _325 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _323;
    float _327 = _317 * _279;
    float _329 = fma(_321, _313, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _331 = fma(_325, _313, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _333 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _335 = _333 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _337 = fma(_311, _327, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _339 = _329 * _301;
    float _341 = _331 * _301;
    float _343 = fma(_335, _327, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _345 = fma(_307, (*spvDescriptorSet0.vp_c9)._m0[143].x, _339);
    float _347 = fma(_307, (*spvDescriptorSet0.vp_c9)._m0[143].y, _341);
    float _349 = fma(_343, _293, _345);
    float _351 = fma(_337, _293, _347);
    float _353 = fma(_253, (*spvDescriptorSet0.vp_c9)._m0[145].x, _349);
    float _355 = fma(_253, (*spvDescriptorSet0.vp_c9)._m0[145].y, _351);
    bool _357 = !_299;
    float _377;
    float _379;
    if (!_357)
    {
        float _359 = in.m_60.x;
        float _361 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _363 = float(_105);
        float _365 = _359 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _367 = fma(_365, (*spvDescriptorSet0.vp_c9)._m0[11].y, _139);
        float _369 = _367 * _361;
        float _371 = floor(_369);
        float _373 = -_371;
        float _375 = _369 + _373;
        _377 = _363;
        _379 = _375;
        _381 = true;
    }
    else
    {
        float _383 = float(_105);
        float _385 = 1.0 / _383;
        float _387 = _139 * _385;
        _377 = _383;
        _379 = _387;
    }
    _381 = false;
    float _389 = _377;
    float _391 = _379;
    float _393 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _395 = int(_393);
    float _397 = in.m_60.x;
    float _399 = in.m_60.y;
    float _401 = in.m_60.z;
    float _403 = in.m_60.w;
    float _405 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _197);
    float _407 = in.m_62.x;
    float _409 = in.m_62.y;
    float _411 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _413 = int(_411);
    float _415 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _417 = _415 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _419 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _421 = _419 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _423 = 1.0 / _389;
    float _425 = float(_395);
    float _427 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _429 = 1.0 / _425;
    float _431 = float(uint(_413));
    float _433 = _401 * 2.0;
    bool _435 = _403 > 0.5;
    float _437 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _439 = _353 * _407;
    float _441 = _399 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    int _443 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _445 = _443 != 0;
    int _447 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _449 = _447 != 0;
    int _451 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _453 = _451 != 0;
    float _455 = 1.0 / _431;
    float _457 = _397 * 2.0;
    int _459 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _461 = _459 != 0;
    float _463 = _355 * _409;
    bool _465 = !_445;
    int _467 = _465 ? 0 : 1;
    float _469 = fma(_441, -2.0, _427);
    int _471 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _473 = _471 != 0;
    float _475 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _477 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _475;
    float _479 = _429 * _139;
    int _481 = ~_413;
    int _483 = _481 + 1;
    float _485 = floor(_457);
    bool _487 = !_461;
    int _489 = _487 ? 0 : 1;
    float _491 = _397 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    bool _493 = !_473;
    int _495 = _493 ? 0 : 1;
    float _497 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    bool _499 = !_449;
    int _501 = _499 ? 0 : 1;
    float _503 = _401 + _397;
    int _505 = as_type<int>(_455) + (-2);
    float _507 = trunc(_479);
    int _509 = int(_507);
    int _511 = int(_435);
    int _513 = _175 ? 2 : 0;
    int _515 = _511 | _513;
    int _517 = _177 ? 4 : 0;
    int _519 = _515 | _517;
    int _521 = _461 ? 8 : 0;
    int _523 = _519 | _521;
    int _525 = _473 ? 16 : 0;
    int _527 = _523 | _525;
    int _529 = _449 ? 32 : 0;
    int _531 = _527 | _529;
    int _533 = _453 ? 64 : 0;
    int _535 = _531 | _533;
    int _537 = _535 & 1;
    float _539 = -_437;
    float _541 = fma(_491, 2.0, _539);
    bool _543 = _397 > 0.5;
    float _545 = fma(_397, (*spvDescriptorSet0.vp_c9)._m0[78].z, _497);
    bool _547 = !_453;
    int _549 = _547 ? 0 : 1;
    float _551 = -_139;
    float _553 = fma(_551, (*spvDescriptorSet0.vp_c9)._m0[76].x, _541);
    float _555 = float(_413);
    float _557 = 1.0 / _417;
    bool _559 = _485 > 0.0;
    bool _561 = _485 >= 0.0;
    bool _563 = isnan(_485);
    bool _565 = _561 || _563;
    bool _567 = isnan(0.0);
    bool _569 = _565 || _567;
    float _571 = -_187;
    int _573 = _543 ? as_type<int>(_571) : as_type<int>(_187);
    float _575 = 1.0 / _421;
    float _577 = float(uint(_509));
    float _579 = float(_509);
    int _581 = abs(_501);
    float _583 = as_type<float>(_505) * _577;
    bool _585 = _579 >= _555;
    bool _587 = isnan(_579);
    bool _589 = _585 || _587;
    bool _591 = isnan(_555);
    bool _593 = _589 || _591;
    float _595 = float(_593);
    float _597 = _477 * _557;
    float _599 = trunc(_583);
    float _601 = precise::max(_599, 0.0);
    uint _604 = uint(_601);
    float _606 = trunc(_595);
    int _608 = int(_606);
    int _610 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _612 = _610 != 0;
    int _614 = _483 * int(_604);
    int _616 = _614 + _509;
    float _618 = _399 * 2.0;
    bool _620 = !_612;
    float _622 = _620 ? 7.345489978790283203125 : 1.0;
    float _624 = float(uint(_616));
    float _626 = floor(_618);
    float _628 = as_type<float>(_505) * _624;
    float _630 = 0.0;
    if (!_612)
    {
        _630 = _399;
    }
    float _632 = _630;
    float _634 = 0.0;
    float _636 = _632;
    if (!_612)
    {
        _634 = _401;
    }
    float _638 = _634;
    float _640 = 0.0;
    float _642 = _638;
    if (!_612)
    {
        _640 = _401;
    }
    float _644 = _640;
    float _646 = trunc(_628);
    float _648 = precise::max(_646, 0.0);
    uint _650 = uint(_648);
    float _652 = _644;
    if (_612)
    {
        _636 = _397;
    }
    float _654 = _636;
    if (_612)
    {
        _642 = _399;
    }
    float _656 = _642;
    if (_612)
    {
        _652 = _399;
    }
    float _658 = _652;
    bool _660 = _626 > 0.0;
    float _662 = _656 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    bool _664 = _626 >= 0.0;
    bool _666 = isnan(_626);
    bool _668 = _664 || _666;
    bool _670 = isnan(0.0);
    bool _672 = _668 || _670;
    int _674 = _569 ? 0 : 1;
    bool _676 = _399 > 0.5;
    int _678 = _672 ? 0 : 1;
    int _680 = int(_604) + int(_650);
    int _682 = ~_413;
    int _684 = _682 + 1;
    int _686 = ~_674;
    int _688 = _686 + 1;
    int _690 = _688 + 1;
    int _692 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _694 = _692 != 0;
    int _696 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _698 = _696 != 0;
    int _700 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _702 = _700 != 0;
    int _704 = _684 * _680;
    int _706 = _704 + _509;
    int _708 = _690;
    if (!_559)
    {
        int _710 = ~_674;
        int _712 = _710 + 1;
        _708 = _712;
    }
    int _714 = _708;
    int _716 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _718 = _716 != 0;
    int _720 = ~_678;
    int _722 = _720 + 1;
    int _724 = _722 + 1;
    int _726 = _724;
    if (!_660)
    {
        int _728 = ~_678;
        int _730 = _728 + 1;
        _726 = _730;
    }
    int _732 = _726;
    bool _734 = !_718;
    float _736 = _734 ? _187 : as_type<float>(_573);
    bool _738 = uint(_706) >= uint(_413);
    float _740 = in.m_48.x;
    float _742 = in.m_48.y;
    float _744 = in.m_48.z;
    float _746 = -_197;
    int _748 = _676 ? as_type<int>(_746) : as_type<int>(_197);
    bool _750 = !_738;
    int _752 = _750 ? 0 : (-1);
    int _754 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _756 = _754 != 0;
    int _758 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _760 = _758 != 0;
    int _762 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _764 = _762 != 0;
    int _766 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _768 = _766 != 0;
    bool _770 = !_698;
    int _772 = _770 ? 0 : 1;
    bool _774 = _401 > 0.5;
    bool _776 = !_694;
    int _778 = _776 ? 0 : 1;
    int _780 = ~_680;
    int _782 = _780 + _752;
    int _784 = _782 + 1;
    int _786 = abs(_778);
    float _788 = fma(_139, (*spvDescriptorSet0.vp_c9)._m0[77].z, _545);
    float _790 = fma(_139, (*spvDescriptorSet0.vp_c9)._m0[76].y, _469);
    float _792 = _742 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _794 = _742 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _796 = _742 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _798 = float(_786);
    float _800 = fma(_740, (*spvDescriptorSet0.vp_c10)._m0[5].x, _792);
    float _802 = fma(_740, (*spvDescriptorSet0.vp_c10)._m0[6].x, _794);
    float _804 = fma(_740, (*spvDescriptorSet0.vp_c10)._m0[4].x, _796);
    float _806 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _808 = _806 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _810 = _555 * _139;
    float _812 = _399 + _401;
    float _814 = float(_732);
    float _816 = _808 * _575;
    float _818 = _810 * _423;
    float _820 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _822 = _399 + _397;
    float _824 = _399 + (-0.5);
    bool _826 = !_702;
    int _828 = _826 ? 0 : 1;
    float _830 = fma(_399, (*spvDescriptorSet0.vp_c9)._m0[78].w, _820);
    float _832 = _822 + (-1.0);
    float _834 = floor(_433);
    float _836 = _397 + (-0.5);
    float _838 = _622 * _397;
    float _840 = _503 + (-1.0);
    bool _842 = _537 != 0;
    float _844 = _401 + (-0.5);
    float _846 = fma(_832, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _848 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _850 = log2(_848);
    float _852 = _812 + (-1.0);
    float _854 = fma(_840, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _856 = _463 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _858 = fma(_852, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _860 = _439 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    bool _862 = _834 >= 0.0;
    bool _864 = isnan(_834);
    bool _866 = _862 || _864;
    bool _868 = isnan(0.0);
    bool _870 = _866 || _868;
    float _872 = _856 * _405;
    float _874 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _876 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _187);
    int _878 = _870 ? 0 : 1;
    float _880 = fma(_139, (*spvDescriptorSet0.vp_c9)._m0[77].w, _830);
    bool _882 = _834 > 0.0;
    float _884 = fma(_658, (*spvDescriptorSet0.vp_c9)._m0[83].w, _874);
    float _886 = floor(_838);
    float _888 = _850 * _139;
    float _890 = _860 * _876;
    float _892 = fma(_744, (*spvDescriptorSet0.vp_c10)._m0[4].z, _804);
    float _894 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _896 = exp2(_888);
    float _898 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    bool _900 = !_764;
    float _902 = _900 ? _197 : as_type<float>(_748);
    float _904 = fma(_654, (*spvDescriptorSet0.vp_c9)._m0[83].z, _894);
    float _906 = _654 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _908 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _910 = fma(_744, (*spvDescriptorSet0.vp_c10)._m0[5].z, _800);
    float _912 = fma(_139, (*spvDescriptorSet0.vp_c9)._m0[82].z, _904);
    float _914 = -_886;
    float _916 = _838 + _914;
    float _918 = -_898;
    float _920 = fma(_906, 2.0, _918);
    float _922 = fma(_662, -2.0, _908);
    float _924 = _916 * _555;
    int _926 = ~_878;
    int _928 = _926 + 1;
    int _930 = _928 + 1;
    float _932 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _934 = 1.0 + _932;
    int _936 = _930;
    if (!_882)
    {
        int _938 = ~_878;
        int _940 = _938 + 1;
        _936 = _940;
    }
    int _942 = _936;
    float _944 = -_896;
    float _946 = _944 + 1.0;
    bool _948 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _950 = isnan(0.0);
    bool _952 = _948 || _950;
    bool _954 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _956 = _952 || _954;
    float _958 = in.m_64.x;
    float _960 = in.m_64.y;
    float _962 = in.m_64.z;
    float _964 = fma(_139, (*spvDescriptorSet0.vp_c9)._m0[82].w, _884);
    float _966 = 1.0 / _934;
    float _968 = _956 ? _946 : 0.0;
    float _970 = -_139;
    float _972 = fma(_970, (*spvDescriptorSet0.vp_c9)._m0[81].x, _920);
    bool _974 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _976 = isnan(1.0);
    bool _978 = _974 || _976;
    bool _980 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _982 = _978 || _980;
    float _984 = fma(_139, (*spvDescriptorSet0.vp_c9)._m0[81].y, _922);
    float _986 = float(_942);
    float _988 = fma(_744, (*spvDescriptorSet0.vp_c10)._m0[6].z, _802);
    float _990 = _892 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _992 = trunc(_924);
    int _994 = int(_992);
    float _996 = _910 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _998 = _798 * _986;
    float _1000 = _988 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _1002 = _998 * (-2.0);
    if (_982)
    {
        float _1004 = _968 * _966;
        _143 = _1004;
    }
    float _1006 = _143;
    int _1008 = _413 * _784;
    int _1010 = _1008 + _509;
    bool _1012 = _413 == 0;
    float _1014 = trunc(_818);
    int _1016 = int(_1014);
    int _1018 = ~_608;
    int _1020 = _1018 + 1;
    int _1022 = _1020 + 1;
    bool _1024 = !_1012;
    int _1026 = _1024 ? _1010 : (-1);
    float _1028 = fma(_1002, _958, _958);
    int _1030 = abs(_495);
    float _1032 = fma(_846, _1002, _846);
    int _1034 = _413 + (-1);
    int _1036 = _1026 * _1022;
    int _1038 = abs(_467);
    int _1040 = _994 * _1030;
    int _1042 = _1040 + _509;
    float _1044 = fma(_836, (*spvDescriptorSet0.vp_c9)._m0[196].x, _1028);
    int _1046 = _608 * _1034;
    int _1048 = _1046 + _1036;
    int _1050 = abs(_772);
    float _1052 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    int _1054 = abs(_549);
    int _1056 = _1048 * _581;
    float _1058 = fma(_1032, _1006, _1044);
    int _1060 = ~_413;
    int _1062 = _1060 + 1;
    int _1064 = _1016 * _1038;
    int _1066 = _1064 + _1056;
    float _1068 = float(uint(_1042));
    float _1070 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    int _1072 = abs(_489);
    float _1074 = as_type<float>(_505) * _1068;
    float _1076 = _1058 * 0.15915493667125701904296875;
    float _1078 = float(_714);
    float _1080 = _1052 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _1082 = float(_1050);
    int _1084 = _1042 * _1054;
    int _1086 = _1084 + _1066;
    int _1088 = abs(_828);
    float _1090 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _1092 = _391 + _1090;
    float _1094 = trunc(_1074);
    float _1096 = precise::max(_1094, 0.0);
    uint _1098 = uint(_1096);
    float _1100 = _1082 * _1078;
    int _1102 = _994 * _1072;
    int _1104 = _1102 + _1086;
    float _1106 = fma(_597, _1092, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _1108 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _1110 = _391 + _1108;
    float _1112 = _1100 * (-2.0);
    float _1114 = float(_1088);
    float _1116 = _1070 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _1118 = float(uint(_1104));
    float _1120 = fma(_1112, _960, _960);
    float _1122 = fma(_858, _1112, _858);
    float _1124 = _1114 * _814;
    float _1126 = fma(_816, _1110, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _1128 = as_type<float>(_505) * _1118;
    float _1130 = fma(_824, (*spvDescriptorSet0.vp_c9)._m0[196].y, _1120);
    float _1132 = _1124 * (-2.0);
    bool _1134 = _391 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _1136 = isnan(_391);
    bool _1138 = _1134 || _1136;
    bool _1140 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _1142 = _1138 || _1140;
    float _1144 = float(_1142);
    float _1146 = _1076 * 6.283185482025146484375;
    float _1148 = sin(_1146);
    float _1150 = fma(_1122, _1006, _1130);
    float _1152 = fma(_1132, _962, _962);
    float _1154 = fma(_854, _1132, _854);
    bool _1156 = _391 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _1158 = isnan(_391);
    bool _1160 = _1156 || _1158;
    bool _1162 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _1164 = _1160 || _1162;
    float _1166 = float(_1164);
    float _1168 = _1150 * 0.15915493667125701904296875;
    float _1170 = fma(_844, (*spvDescriptorSet0.vp_c9)._m0[196].z, _1152);
    int _1172 = ~_413;
    int _1174 = _1172 + 1;
    float _1176 = trunc(_1128);
    float _1178 = precise::max(_1176, 0.0);
    uint _1180 = uint(_1178);
    float _1182 = -_1144;
    float _1184 = _1182 + 1.0;
    float _1186 = fma(_1154, _1006, _1170);
    bool _1188 = _391 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _1190 = isnan(_391);
    bool _1192 = _1188 || _1190;
    bool _1194 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _1196 = _1192 || _1194;
    float _1198 = float(_1196);
    float _1200 = -_1166;
    float _1202 = _1200 + 1.0;
    float _1204 = _1166 * _1184;
    int _1206 = ~_413;
    int _1208 = _1206 + 1;
    float _1210 = _1076 * 6.283185482025146484375;
    float _1212 = cos(_1210);
    float _1214 = 0.5 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    int _1216 = _1174 * int(_1180);
    int _1218 = _1216 + _1104;
    float _1220 = _1198 * _1202;
    float _1222 = _1186 * 0.15915493667125701904296875;
    float _1224 = _1168 * 6.283185482025146484375;
    float _1226 = sin(_1224);
    float _1228 = float(uint(_1218));
    float _1230 = _1106 * _1220;
    float _1232 = -_187;
    int _1234 = _774 ? as_type<int>(_1232) : as_type<int>(_187);
    int _1236 = _1208 * int(_1098);
    int _1238 = _1236 + _1042;
    float _1240 = _736 + 0.5;
    float _1242 = _1168 * 6.283185482025146484375;
    float _1244 = cos(_1242);
    float _1246 = float(uint(_1238));
    float _1248 = fma(_1240, (*spvDescriptorSet0.vp_c9)._m0[80].x, _553);
    float _1250 = as_type<float>(_505) * _1246;
    float _1252 = -_197;
    int _1254 = _842 ? as_type<int>(_1252) : as_type<int>(_197);
    float _1256 = _1222 * 6.283185482025146484375;
    float _1258 = cos(_1256);
    float _1260 = as_type<float>(_505) * _1228;
    float _1262 = _902 + (-0.5);
    float _1264 = -_1262;
    float _1266 = -_790;
    float _1268 = fma(_1264, (*spvDescriptorSet0.vp_c9)._m0[80].y, _1266);
    float _1270 = -_1198;
    float _1272 = _1270 + 1.0;
    float _1274 = trunc(_1260);
    float _1276 = precise::max(_1274, 0.0);
    uint _1278 = uint(_1276);
    bool _1280 = !_768;
    float _1282 = _1280 ? _187 : as_type<float>(_1234);
    float _1284 = fma(_1272, (*spvDescriptorSet0.vp_c9)._m0[115].x, _1230);
    bool _1286 = !_756;
    float _1288 = _1286 ? _197 : as_type<float>(_1254);
    float _1290 = _197 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _1292 = _1282 + 0.5;
    float _1294 = fma(_1126, _1204, _1284);
    float _1296 = trunc(_1250);
    float _1298 = precise::max(_1296, 0.0);
    uint _1300 = uint(_1298);
    float _1302 = _1288 + (-0.5);
    float _1304 = fma(_1080, _1292, _972);
    int _1306 = ~_413;
    int _1308 = _1306 + 1;
    float _1310 = _1148 * _1244;
    float _1312 = -_1116;
    float _1314 = -_984;
    float _1316 = fma(_1312, _1302, _1314);
    float _1318 = fma(_1144, (*spvDescriptorSet0.vp_c9)._m0[117].x, _1294);
    float _1320 = _1222 * 6.283185482025146484375;
    float _1322 = sin(_1320);
    int _1324 = int(_1180) + int(_1278);
    float _1326 = _1148 * _1226;
    float _1328 = _1148 * _1258;
    float _1330 = _1212 * _1244;
    float _1332 = _1244 * _1258;
    float _1334 = _1212 * _1226;
    float _1336 = _1212 * _1258;
    int _1338 = int(_1098) + int(_1300);
    int _1340 = _1308 * _1324;
    int _1342 = _1340 + _1104;
    float _1344 = _1226 * _1258;
    float _1346 = _1336 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1348 = _1336 * _872;
    int _1350 = _1062 * _1338;
    int _1352 = _1350 + _1042;
    bool _1354 = uint(_1342) >= uint(_413);
    float _1356 = _1336 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1358 = fma(_1322, _1330, _1326);
    float _1360 = fma(_1322, _1326, _1330);
    bool _1362 = !_1354;
    int _1364 = _1362 ? 0 : (-1);
    float _1366 = -_1334;
    float _1368 = fma(_1322, _1310, _1366);
    float _1370 = -_1310;
    float _1372 = fma(_1322, _1334, _1370);
    float _1374 = _1336 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    int _1376 = ~_1324;
    int _1378 = _1376 + _1364;
    int _1380 = _1378 + 1;
    float _1382 = -_1322;
    float _1384 = fma(_1382, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1356);
    float _1386 = -_872;
    float _1388 = _1322 * _1386;
    float _1390 = -_1322;
    float _1392 = fma(_1390, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1374);
    float _1394 = -_1322;
    float _1396 = fma(_1394, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1346);
    int _1398 = _413 * _1380;
    int _1400 = _1398 + _1104;
    float _1402 = fma(_1358, _890, _1348);
    float _1404 = fma(_1328, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1392);
    float _1406 = fma(_1332, _890, _1388);
    float _1408 = fma(_1328, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1384);
    bool _1410 = !_1012;
    int _1412 = _1410 ? _1400 : (-1);
    float _1414 = _1358 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1416 = _1358 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1418 = _1358 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    int _1420 = _1412 >> 31;
    float _1422 = _1328 * _872;
    float _1424 = fma(_1328, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1396);
    float _1426 = _1372 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    int _1428 = _1420 & 3;
    float _1430 = fma(_1368, _890, _1422);
    float _1432 = fma(_1344, _1214, _1406);
    float _1434 = _1372 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    int _1436 = _1412 + _1428;
    float _1438 = _1372 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1440 = fma(_1372, _1214, _1402);
    float _1442 = fma(_1332, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1414);
    int _1444 = _1436 >> 2;
    float _1446 = fma(_1332, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1416);
    float _1448 = fma(_1332, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1418);
    float _1450 = fma(_1344, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1426);
    float _1452 = fma(_1344, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1434);
    float _1454 = fma(_1344, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1438);
    int _1456 = _1444 << 4;
    int _1458 = _1456 + 368;
    float _1460 = fma(_1360, _1214, _1430);
    float _1462 = _1290 * _1404;
    float _1464 = _1440 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1466 = _1440 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    uint _1468 = uint(int(uint(_1458) >> uint(2)));
    uint _1470 = uint(int(uint(int(_1468)) >> uint(2)));
    int _1472 = int(_1468) & 3;
    float _1474 = (*spvDescriptorSet0.vp_c9)._m0[int(_1470)][_1472];
    int _1476 = int(_1468) + 1;
    uint _1478 = uint(int(uint(_1476) >> uint(2)));
    int _1480 = _1476 & 3;
    float _1482 = (*spvDescriptorSet0.vp_c9)._m0[int(_1478)][_1480];
    float _1484 = _1290 * _1408;
    float _1486 = fma(_1432, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1464);
    float _1488 = fma(_1432, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1466);
    bool _1490 = uint(_1352) >= uint(_413);
    float _1492 = _1290 * _1424;
    float _1494 = fma(_1460, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1486);
    float _1496 = fma(_1460, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1488);
    int _1498 = _1412 & 3;
    bool _1500 = _1498 != 0;
    float _1502 = fma(_1368, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1442);
    float _1504 = _1494 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _1506 = _1496 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _1508 = fma(_1368, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1446);
    float _1510 = fma(_1368, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1448);
    float _1512 = _990 + _1504;
    float _1514 = _1000 + _1506;
    int _1516 = _1412 & 3;
    bool _1518 = _1516 != 0;
    float _1520 = _1440 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    int _1522 = _1458 + 8;
    uint _1524 = uint(int(uint(_1522) >> uint(2)));
    uint _1526 = uint(int(uint(int(_1524)) >> uint(2)));
    int _1528 = int(_1524) & 3;
    float _1530 = (*spvDescriptorSet0.vp_c9)._m0[int(_1526)][_1528];
    int _1532 = int(_1524) + 1;
    uint _1534 = uint(int(uint(_1532) >> uint(2)));
    int _1536 = _1532 & 3;
    float _1538 = (*spvDescriptorSet0.vp_c9)._m0[int(_1534)][_1536];
    bool _1540 = uint(_1498) > 1u;
    float _1542 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1544 = _1512 + _1542;
    float _1546 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1548 = _1514 + _1546;
    bool _1550 = !_1490;
    int _1552 = _1550 ? 0 : (-1);
    float _1554 = fma(_1432, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1520);
    float _1556 = _1544 * _1544;
    float _1558 = _1548 * _1548;
    int _1560 = _1518 ? 0 : 1;
    float _1562 = fma(_1460, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1554);
    int _1564 = ~_1338;
    int _1566 = _1564 + _1552;
    int _1568 = _1566 + 1;
    float _1570 = _1556 + _1558;
    int _1572 = ~_1560;
    int _1574 = _1572 + 1;
    int _1576 = _1574 + 1;
    float _1578 = fma(_1360, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1450);
    int _1580 = _1576;
    float _1582 = _1556;
    float _1584 = _1558;
    float _1586 = _1514;
    float _1588 = _1318;
    if (!_1540)
    {
        int _1590 = ~_1560;
        int _1592 = _1590 + 1;
        _1580 = _1592;
    }
    int _1594 = _1580;
    float _1596 = sqrt(_1570);
    int _1598 = _413 * _1568;
    int _1600 = _1598 + _1042;
    bool _1602 = _1498 != 3;
    float _1604 = fma(_1360, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1452);
    int _1606 = abs(_1594);
    float _1608 = fma(_1360, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1454);
    bool _1610 = !_1500;
    int _1612 = _1610 ? 0 : 1;
    bool _1614 = uint(_1498) >= 2u;
    int _1616 = ~_1606;
    int _1618 = _1616 + 1;
    int _1620 = _1618 + 1;
    int _1622 = abs(_1612);
    int _1624 = _1614 ? 0 : 1;
    int _1626 = _1620 * as_type<int>(_1482);
    bool _1628 = _1596 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    int _1630 = ~_1622;
    int _1632 = _1630 + 1;
    int _1634 = _1632 + 1;
    bool _1636 = !_760;
    int _1638 = _1636 ? 0 : 1;
    bool _1640 = _1498 != 3;
    int _1642 = _1634 * as_type<int>(_1474);
    int _1644 = _1642 + _1626;
    int _1646 = ~_1624;
    int _1648 = _1646 + 1;
    int _1650 = _1648 + 1;
    float _1652 = _1562 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    int _1654 = _1650;
    if (_1602)
    {
        int _1656 = ~_1624;
        int _1658 = _1656 + 1;
        _1654 = _1658;
    }
    int _1660 = _1654;
    int _1662 = abs(_1638);
    float _1664 = _996 + _1652;
    bool _1666 = !_1640;
    float _1668 = _1666 ? 0.0 : as_type<float>(0xffffffffu /* nan */);
    int _1670 = abs(_1660);
    int _1672 = abs(as_type<int>(_1668));
    float _1674 = _1668;
    float _1676 = _1664;
    if (!_1628)
    {
        _1674 = _1512;
    }
    float _1678 = _1674;
    int _1680 = ~_1670;
    int _1682 = _1680 + 1;
    int _1684 = _1682 + 1;
    bool _1686 = !_1628;
    float _1688 = _1678;
    if (!_1686)
    {
        float _1690 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1692 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1694 = _1596 + _1692;
        float _1696 = rsqrt(_1570);
        float _1698 = _1694 * _1690;
        float _1700 = _1664 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1702 = _1698 * 0.15915493667125701904296875;
        float _1704 = _1702 * 6.283185482025146484375;
        float _1706 = sin(_1704);
        float _1708 = _1702 * 6.283185482025146484375;
        float _1710 = cos(_1708);
        float _1712 = fma(_1706, _1700, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1714 = _1696 * _1712;
        float _1716 = fma(_1544, _1714, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1718 = _1710 + (-1.0);
        float _1720 = fma(_1548, _1714, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _1722 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _1724 = _1716 + _1722;
        float _1726 = _1718 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1728 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _1730 = _1720 + _1728;
        float _1732 = _1724 * _1724;
        float _1734 = fma(_1664, _1710, _1726);
        float _1736 = _1730 * _1730;
        _1676 = _1734;
        _1582 = _1732;
        _1584 = _1736;
        _1688 = _1716;
        _1586 = _1720;
    }
    float _1738 = _1676;
    float _1740 = _1582;
    float _1742 = _1584;
    float _1744 = _1688;
    float _1746 = _1586;
    int _1748 = _1684 * as_type<int>(_1530);
    int _1750 = _1748 + _1644;
    int _1752 = ~_1672;
    int _1754 = _1752 + 1;
    int _1756 = _1754 + 1;
    float _1758 = _187 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    int _1760 = ~_1662;
    int _1762 = _1760 + 1;
    int _1764 = _1762 + 1;
    float _1766 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _1768 = _1738 + _1766;
    bool _1770 = !_1012;
    int _1772 = _1770 ? _1600 : (-1);
    int _1774 = _1756 * as_type<int>(_1538);
    int _1776 = _1774 + _1750;
    float _1778 = fma(_1758, _1502, _1462);
    float _1780 = fma(_1768, _1768, _1740);
    float _1782 = -_964;
    float _1784 = _1782 + 1.0;
    int _1786 = _1776 * _1764;
    float _1788 = -_788;
    float _1790 = _1788 + 1.0;
    float _1792 = _1780 + _1742;
    float _1794 = fma(_1758, _1508, _1484);
    int _1796 = _1772 * _1662;
    int _1798 = _1796 + _1786;
    float _1800 = -_880;
    float _1802 = _1800 + 1.0;
    float _1804 = fma(_1758, _1510, _1492);
    float _1806 = -_1790;
    float _1808 = fma(_736, _1806, _1248);
    float _1810 = fma(_1288, _1784, _1316);
    float _1812 = fma(_902, _1802, _1268);
    float _1814 = _1578 + _1778;
    float _1816 = sqrt(_1792);
    float _1818 = -_912;
    float _1820 = _1818 + 1.0;
    float _1822 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _1824 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _1826 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1828 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1830 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1832 = _1604 + _1794;
    float _1834 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1836 = float(_1798);
    float _1838 = -_1820;
    float _1840 = fma(_1282, _1838, _1304);
    float _1842 = (*spvDescriptorSet0.vp_c9)._m0[131].x * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _1844 = _1822 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1846 = _1824 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1848 = _1828 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1850 = _1830 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1852 = _1834 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1854 = _1826 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1856 = _1318 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _1858 = _1608 + _1804;
    out.m_66.x = _1808;
    out.m_66.y = _1812;
    out.m_66.z = _1840;
    out.m_66.w = _1810;
    bool _1860 = _1816 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _1862 = isnan(_1816);
    bool _1864 = _1860 || _1862;
    bool _1866 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _1868 = _1864 || _1866;
    out.m_68.x = _1848;
    out.m_68.y = _1850;
    out.m_68.z = _1852;
    out.m_68.w = _1842;
    out.m_70.x = _1844;
    out.m_70.y = _1846;
    out.m_70.z = _1854;
    out.m_70.w = _1856;
    out.m_72.x = _1836;
    float _1870 = _1808;
    float _1872 = _1840;
    float _1874 = _1854;
    if (!_1868)
    {
        _1588 = 1.0;
    }
    float _1876 = _1588;
    out.m_74.x = _1814;
    out.m_74.y = _1832;
    out.m_74.z = _1858;
    bool _1878 = !_1868;
    float _1880 = _1876;
    if (!_1878)
    {
        bool _1882 = _1816 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _1884 = isnan(_1816);
        bool _1886 = _1882 || _1884;
        bool _1888 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _1890 = _1886 || _1888;
        if (!_1890)
        {
            float _1892 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1894 = _1816 + _1892;
            float _1896 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1898 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _1896;
            float _1900 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _1902 = _1900 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _1904 = 1.0 / _1898;
            float _1906 = _1894 * _1904;
            float _1908 = fma(_1906, _1902, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _1880 = _1908;
            _1870 = _1898;
            _1910 = true;
        }
        else
        {
            bool _1912 = _1816 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _1914 = isnan(_1816);
            bool _1916 = _1912 || _1914;
            bool _1918 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _1920 = _1916 || _1918;
            if (!_1920)
            {
                float _1922 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1924 = _1816 + _1922;
                float _1926 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1928 = _1926 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _1930 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _1932 = _1930 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _1934 = 1.0 / _1928;
                float _1936 = _1924 * _1934;
                float _1938 = fma(_1936, _1932, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _1880 = _1938;
                _1870 = _1928;
                _1910 = true;
            }
            else
            {
                _1880 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _1910 = false;
    float _1940 = _1880;
    float _1942 = _1870;
    float _1944 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _1946 = _1738 + _1944;
    float _1948 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _1950 = _1744 + _1948;
    float _1952 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _1954 = _1746 + _1952;
    float _1956 = fma(_1946, _1940, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _1958 = fma(_1950, _1940, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _1960 = fma(_1954, _1940, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _1962 = -_996;
    float _1964 = _1962 + _1956;
    float _1966 = -_990;
    float _1968 = _1966 + _1958;
    float _1970 = -_1000;
    float _1972 = _1970 + _1960;
    float _1974 = _1964 * _1964;
    float _1976 = fma(_1968, _1968, _1974);
    float _1978 = fma(_1972, _1972, _1976);
    float _1980 = sqrt(_1978);
    bool _1982 = _1980 > 0.0;
    bool _1984 = (*spvDescriptorSet0.vp_c15)._m0[660].y >= 0.5;
    bool _1986 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1988 = _1984 || _1986;
    bool _1990 = isnan(0.5);
    bool _1992 = _1988 || _1990;
    float _1994 = (*spvDescriptorSet0.vp_c15)._m0[660].y;
    float _1996 = _1942;
    float _1998 = _1958;
    float _2000 = _1972;
    if (!_1982)
    {
        _1994 = _1958;
    }
    float _2002 = _1994;
    float _2004 = _2002;
    if (!_1982)
    {
        _1872 = _1956;
    }
    float _2006 = _1872;
    float _2008 = _2006;
    float _2010 = _2006;
    if (!_1982)
    {
        _1996 = _1960;
    }
    float _2012 = _1996;
    bool _2014 = !_1982;
    float _2016 = _2012;
    if (!_2014)
    {
        float _2018 = _201 * _201;
        float _2020 = fma(_199, _199, _2018);
        float _2022 = rsqrt(_1978);
        float _2024 = fma(_203, _203, _2020);
        float _2026 = sqrt(_2024);
        float _2028 = _1968 * _2022;
        float _2030 = _1964 * _2022;
        float _2032 = _1972 * _2022;
        bool _2034 = _2026 > 0.0;
        float _2036 = _2022;
        float _2038 = _2026;
        _1874 = _2032;
        if (!_2034)
        {
            _2036 = _1958;
        }
        float _2040 = _2036;
        _2004 = _2040;
        if (!_2034)
        {
            _2008 = _1956;
        }
        float _2042 = _2008;
        _2010 = _2042;
        if (!_2034)
        {
            _2038 = _1960;
        }
        float _2044 = _2038;
        bool _2046 = !_2034;
        _2016 = _2044;
        if (!_2046)
        {
            float _2048 = rsqrt(_2024);
            float _2050 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].z;
            float _2052 = _201 * _2048;
            float _2054 = _199 * _2048;
            float _2056 = _203 * _2048;
            float _2058 = _2030 * _2052;
            float _2060 = fma(_2028, _2054, _2058);
            float _2062 = _2050 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _2064 = fma(_2032, _2056, _2060);
            float _2066 = _2064 * _2062;
            float _2068 = fma(_199, _2066, _1958);
            float _2070 = fma(_201, _2066, _1956);
            float _2072 = fma(_203, _2066, _1960);
            _2010 = _2070;
            _2016 = _2072;
            _2004 = _2068;
        }
    }
    float _2074 = _2010;
    float _2076 = _2016;
    float _2078 = _2004;
    float _2080 = _1874;
    float _2082 = _2078;
    float _2084 = _2080;
    if (_1992)
    {
        _207 = _2074;
    }
    float _2086 = _207;
    float _2088 = _2086;
    if (_1992)
    {
        _209 = _2076;
    }
    float _2090 = _209;
    float _2092 = _2090;
    if (!_1992)
    {
        float _2094 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _2096 = _996 + _2094;
        float _2098 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _2100 = _990 + _2098;
        float _2102 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _2104 = -_990;
        float _2106 = _2104 + _2078;
        float _2108 = _2096 * _2096;
        float _2110 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _2112 = _1000 + _2110;
        float _2114 = -_996;
        float _2116 = _2114 + _2074;
        float _2118 = -_1000;
        float _2120 = _2118 + _2076;
        float _2122 = fma(_2100, _2100, _2108);
        float _2124 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _2126 = fma(_2112, _2112, _2122);
        float _2128 = sqrt(_2126);
        float _2130 = _2102 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _2132 = precise::min(_2128, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _2134 = _2132 * _2124;
        float _2136 = _2130 * _2134;
        float _2138 = fma(_2106, _2136, _990);
        float _2140 = fma(_2116, _2136, _996);
        float _2142 = fma(_2120, _2136, _1000);
        _2088 = _2140;
        _2082 = _2138;
        _2092 = _2142;
        _1998 = _2136;
    }
    float _2144 = _2088;
    float _2146 = _2082;
    float _2148 = _2092;
    float _2150 = _1998;
    float _2152 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2154 = _2144 + _2152;
    float _2156 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2158 = _2146 + _2156;
    float _2160 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2162 = _2148 + _2160;
    float _2164 = _2154 * _2154;
    float _2166 = fma(_2158, _2158, _2164);
    float _2168 = fma(_2162, _2162, _2166);
    float _2170 = rsqrt(_2168);
    float _2172 = sqrt(_2168);
    float _2174 = _2170 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _2176 = _2158 * _2174;
    float _2178 = _2162 * _2174;
    float _2180 = _2176 * _2176;
    float _2182 = _2178 * _2178;
    float _2184 = _2180 + _2182;
    float _2186 = sqrt(_2184);
    bool _2188 = _2186 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2190 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2192 = _2186 + _2190;
    float _2194 = _2170;
    float _2196 = _2192;
    float _2198 = _2150;
    float _2200 = _2154;
    if (_2188)
    {
        float _2202 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2194 = _2202;
    }
    float _2204 = _2194;
    if (_2188)
    {
        float _2206 = rsqrt(_2184);
        _2000 = _2206;
    }
    float _2208 = _2000;
    float _2210 = _2208;
    if (_2188)
    {
        float _2212 = _2192 * _2204;
        _2196 = _2212;
    }
    float _2214 = _2196;
    if (_2188)
    {
        float _2216 = _2214 * 0.15915493667125701904296875;
        _2198 = _2216;
    }
    float _2218 = _2198;
    float _2220 = _2204;
    if (_2188)
    {
        float _2222 = _2218 * 6.283185482025146484375;
        float _2224 = sin(_2222);
        _2220 = _2224;
    }
    float _2226 = _2220;
    float _2228 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _2230 = precise::max(0.0, _2228);
    float _2232 = _2162;
    float _2234 = _2230;
    if (_2188)
    {
        float _2236 = _2218 * 6.283185482025146484375;
        float _2238 = cos(_2236);
        _2232 = _2238;
    }
    float _2240 = _2232;
    float _2242 = -_2174;
    float _2244 = -_2230;
    float _2246 = fma(_2154, _2242, _2244);
    float _2248 = _2246;
    if (_2188)
    {
        float _2250 = _2246 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2234 = _2250;
    }
    float _2252 = _2234;
    float _2254 = _2252;
    float _2256 = _2226;
    if (_2188)
    {
        float _2258 = fma(_2226, _2252, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _2254 = _2258;
    }
    float _2260 = _2254;
    float _2262 = _2260;
    if (!_2188)
    {
        _2256 = _2178;
    }
    float _2264 = _2256;
    float _2266 = fma(_990, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _2268 = _2264;
    float _2270 = _2240;
    if (_2188)
    {
        float _2272 = _2240 + (-1.0);
        _2200 = _2272;
    }
    float _2274 = _2200;
    float _2276 = _2274;
    if (_2188)
    {
        float _2278 = _2208 * _2260;
        _2084 = _2278;
    }
    float _2280 = _2084;
    if (!_2188)
    {
        _2210 = _2176;
    }
    float _2282 = _2210;
    float _2284 = _2282;
    if (_2188)
    {
        float _2286 = _2274 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2276 = _2286;
    }
    float _2288 = _2276;
    if (_2188)
    {
        float _2290 = _2176 * _2280;
        _2284 = _2290;
    }
    float _2292 = _2284;
    if (!_2188)
    {
        _2262 = _2180;
    }
    float _2294 = _2262;
    float _2296 = _2294;
    if (_2188)
    {
        float _2298 = _2178 * _2280;
        _2268 = _2298;
    }
    float _2300 = _2268;
    if (_2188)
    {
        float _2302 = fma(_2246, _2240, _2288);
        _2248 = _2302;
    }
    float _2304 = _2248;
    if (_2188)
    {
        float _2306 = _2292 * _2292;
        _2296 = _2306;
    }
    float _2308 = _2296;
    if (!_2188)
    {
        _2270 = _2182;
    }
    float _2310 = _2270;
    float _2312 = _2310;
    if (_2188)
    {
        float _2314 = _2300 * _2300;
        _2312 = _2314;
    }
    float _2316 = _2312;
    float _2318 = _2144 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _2320 = fma(_2304, _2304, _2308);
    float _2322 = floor(_2266);
    float _2324 = fma(_2146, (*spvDescriptorSet0.vp_c8)._m0[2].x, _2318);
    float _2326 = _2320 + _2316;
    float _2328 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _2330 = fma(_2172, (*spvDescriptorSet0.vp_c15)._m0[23].w, _2328);
    float _2332 = precise::clamp(_2330, 0.0, 1.0);
    float _2334 = fma(_2148, (*spvDescriptorSet0.vp_c8)._m0[2].z, _2324);
    float _2336 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _2338 = -_2332;
    float _2340 = _2338 + 1.0;
    float _2342 = rsqrt(_2326);
    float _2344 = _2334 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _2346 = fma(_1000, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _2348 = _2144 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _2350 = _2344 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _2352 = abs(_2340);
    float _2354 = log2(_2352);
    float _2356 = _2144 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2358 = -_2350;
    float _2360 = fma(_2358, _2336, 1.0);
    float _2362 = _2144 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2364 = fma(_2146, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2356);
    float _2366 = fma(_2146, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2362);
    float _2368 = _2342 * _2292;
    float _2370 = fma(_2148, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2364);
    float _2372 = _2342 * _2304;
    float _2374 = fma(_2148, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2366);
    float _2376 = _2368 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _2378 = _2370 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _2380 = _2342 * _2300;
    float _2382 = fma(_2146, (*spvDescriptorSet0.vp_c8)._m0[3].x, _2348);
    float _2384 = -_2376;
    float _2386 = fma(_2372, (*spvDescriptorSet0.vp_c15)._m0[21].y, _2384);
    float _2388 = _2374 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2390 = _2378 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _2392 = floor(_2346);
    float _2394 = -_2380;
    float _2396 = fma(_2394, (*spvDescriptorSet0.vp_c15)._m0[21].z, _2386);
    float _2398 = fma(_2148, (*spvDescriptorSet0.vp_c8)._m0[3].z, _2382);
    float _2400 = fma(_2388, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2390);
    float _2402 = _2354 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _2404 = -_2322;
    float _2406 = _2266 + _2404;
    float _2408 = _2398 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _2410 = fma(_2344, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2400);
    float _2412 = log2(_2360);
    float _2414 = fma(_2396, 0.5, 0.5);
    float _2416 = fma(_2408, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2410);
    float _2418 = _2378 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2420 = _2378 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2422 = -_2392;
    float _2424 = _2346 + _2422;
    float _2426 = exp2(_2402);
    float _2428 = fma(_2396, -0.5, 0.5);
    float _2430 = fma(_2414, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _2432 = fma(_2388, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2418);
    float _2434 = fma(_2388, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2420);
    float _2436 = _2372 + 1.0;
    float _2438 = fma(_2414, _2430, -0.212114393711090087890625);
    float _2440 = fma(_2344, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2432);
    float _2442 = 1.0 / _2416;
    float _2444 = fma(_2344, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2434);
    float2 _6677 = float2(_2406, _2424);
    float _2446 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_6677, float2(0.0), isnan(_6677)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_6677, float2(0.0), isnan(_6677)), level(0.0)).x;
    float _2448 = fma(_2414, _2438, 1.570728778839111328125);
    float _2450 = sqrt(_2428);
    float _2452 = -_2372;
    float _2454 = fma(_2426, _2436, _2452);
    float _2456 = _2412 * 0.693147182464599609375;
    float _2458 = fma(_2454, 0.5, 0.5);
    float _2460 = _2456 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _2462 = fma(_2408, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2440);
    float _2464 = fma(_2408, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2444);
    float _2466 = _2462 * _2442;
    float _2468 = _2464 * _2442;
    float _2470 = _2450 * 0.636619746685028076171875;
    float _2472 = fma(_2466, 0.5, 0.5);
    float _2474 = fma(_2468, -0.5, 0.5);
    float _2476 = -_2448;
    float _2478 = fma(_2470, _2476, 1.0);
    float3 _6737 = float3(_2472, _2474, _2460);
    float _2480 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_6737, float3(0.0), isnan(_6737)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_6737, float3(0.0), isnan(_6737)), level(0.0)).x;
    float3 _6748 = float3(_2472, _2474, _2460);
    float4 _2483 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_6748, float3(0.0), isnan(_6748)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_6748, float3(0.0), isnan(_6748)), level(0.0)).xyzw;
    float _2485 = _2483.x;
    float _2487 = _2483.y;
    float _2489 = _2483.z;
    float _2491 = _2483.w;
    float2 _6764 = float2(_2478, _2458);
    float3 _2495 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_6764, float2(0.0), isnan(_6764)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_6764, float2(0.0), isnan(_6764)), level(0.0)).xyz;
    float _2497 = _2495.x;
    float _2499 = _2495.y;
    float _2501 = _2495.z;
    float _2503 = _996 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    bool _2505 = _2172 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _2507 = isnan(_2172);
    bool _2509 = _2505 || _2507;
    bool _2511 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _2513 = _2509 || _2511;
    float _2515 = fma(_990, (*spvDescriptorSet0.vp_c8)._m0[11].x, _2503);
    float _2517 = fma(_1000, (*spvDescriptorSet0.vp_c8)._m0[11].z, _2515);
    float _2519 = _996 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _2521 = _2517 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _2523 = fma(_990, (*spvDescriptorSet0.vp_c8)._m0[10].x, _2519);
    float _2525 = 1.0 / _2521;
    float _2527 = fma(_1000, (*spvDescriptorSet0.vp_c8)._m0[10].z, _2523);
    float _2529 = _2527 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _2531 = _2529 + _2521;
    float _2533 = _2531 * _2525;
    float _2535 = _2533 * 0.5;
    float _2537 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _2539 = fma(_2535, (*spvDescriptorSet0.vp_c8)._m0[30].w, _2537);
    float _2541 = 1.0 / _2539;
    float _2543 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _2545 = _2541 * _2543;
    float _2547 = abs(_2545);
    float _2549 = log2(_2547);
    float _2551 = _2549 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _2553 = _2378 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _2555 = _2354 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _2557 = exp2(_2551);
    float _2559 = fma(_2388, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2553);
    float _2561 = fma(_2344, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2559);
    float _2563 = exp2(_2555);
    float _2565 = fma(_2408, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2561);
    bool _2567 = _2545 <= 8000.0;
    bool _2569 = isnan(_2545);
    bool _2571 = _2567 || _2569;
    bool _2573 = isnan(8000.0);
    bool _2575 = _2571 || _2573;
    float _2577 = float(_2575);
    float _2579 = fma(_2557, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _2581 = precise::clamp(_2579, 0.0, 1.0);
    float _2583 = in.m_76.x;
    float _2585 = fma(_2581, -2.0, 3.0);
    float _2587 = _2581 * _2581;
    float _2589 = -_2563;
    float _2591 = _2589 + 1.0;
    float _2593 = _2587 * _2585;
    float _2595 = _2591 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _2597 = -_2593;
    float _2599 = _2597 + 1.0;
    float _2601 = fma(_2599, (*spvDescriptorSet0.vp_c15)._m0[654].w, _2593);
    float _2603 = _2565 + _2416;
    float _2605 = _2577 * _2601;
    out.gl_Position.x = _2462;
    out.gl_Position.y = _2464;
    out.gl_Position.z = _2565;
    out.gl_Position.w = _2416;
    float _2607 = _2603 * 0.5;
    float _2609 = _2605 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _2611 = _2603;
    float _2613 = _2416;
    float _2615 = _2565;
    float _2617 = _2464;
    if (!_2513)
    {
        _2611 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _2619 = _2611;
    out.m_78.z = _2607;
    out.m_78.w = _2416;
    float _2621 = -_2595;
    float _2623 = _2621 + 1.0;
    float _2625 = _2623;
    float _2627 = _2619;
    float _2629 = _2619;
    if (!_2513)
    {
        _2613 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _2631 = _2613;
    float _2633 = _2631;
    float _2635 = _2631;
    if (!_2513)
    {
        _2615 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _2637 = _2615;
    float _2639 = _2637;
    float _2641 = _2637;
    if (!_2513)
    {
        _2617 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _2643 = _2617;
    float _2645 = -_2446;
    float _2647 = _2645 + 1.0;
    float _2649 = _2647 * _2609;
    float _2651 = precise::clamp(_2649, 0.0, 1.0);
    float _2653 = -_2651;
    float _2655 = fma(_2653, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _2657 = _2655 * _2583;
    float _2659 = _2657 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    out.m_80.x = _2659;
    float _2661 = _2595 * _2480;
    float _2663 = _2491 * _2623;
    float _2665 = _2485;
    float _2667 = _2643;
    float _2669 = _2643;
    if (!_2513)
    {
        _2625 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _2671 = _2625;
    float _2673 = _2491 * _2661;
    float _2675 = _2501 * _2661;
    float _2677 = fma(_2497, _2673, _2485);
    float _2679 = fma(_2499, _2673, _2487);
    float _2681 = fma(_2491, _2675, _2489);
    float _2683 = _2671;
    float _2685 = _2671;
    if (!_2513)
    {
        _2665 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _2687 = _2665;
    out.m_82.x = _2677;
    out.m_82.y = _2679;
    out.m_82.z = _2681;
    out.m_82.w = _2663;
    bool _2689 = !_2513;
    float _2691 = _2687;
    float _2693 = _2687;
    if (!_2689)
    {
        bool _2695 = _2172 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _2697 = isnan(_2172);
        bool _2699 = _2695 || _2697;
        bool _2701 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _2703 = _2699 || _2701;
        if (!_2703)
        {
            float _2705 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2707 = _2172 + _2705;
            float _2709 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2711 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _2709;
            float _2713 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _2715 = _2713 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _2717 = 1.0 / _2711;
            float _2719 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _2721 = _2719 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _2723 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _2725 = _2723 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _2727 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _2729 = _2727 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _2731 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _2733 = _2731 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _2735 = _2707 * _2717;
            float _2737 = precise::clamp(_2735, 0.0, 1.0);
            float _2739 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _2741 = _2739 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _2743 = fma(_2737, _2715, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _2745 = fma(_2737, _2741, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _2747 = fma(_2737, _2721, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _2749 = fma(_2737, _2725, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _2751 = fma(_2737, _2729, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _2753 = fma(_2737, _2733, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _2635 = _2747;
            _2685 = _2751;
            _2693 = _2743;
            _2669 = _2749;
            _2641 = _2745;
            _2629 = _2753;
            _2755 = true;
        }
        else
        {
            bool _2757 = _2172 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _2759 = isnan(_2172);
            bool _2761 = _2757 || _2759;
            bool _2763 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _2765 = _2761 || _2763;
            if (!_2765)
            {
                _2691 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _2767 = _2691;
            _2693 = _2767;
            if (!_2765)
            {
                _2633 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _2769 = _2633;
            _2635 = _2769;
            if (!_2765)
            {
                _2639 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _2771 = _2639;
            _2641 = _2771;
            if (!_2765)
            {
                _2667 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _2773 = _2667;
            _2669 = _2773;
            if (!_2765)
            {
                _2683 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _2775 = _2683;
            _2685 = _2775;
            if (!_2765)
            {
                _2627 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _2777 = _2627;
            bool _2779 = !_2765;
            _2629 = _2777;
            if (!_2779)
            {
                bool _2781 = _2172 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _2783 = isnan(_2172);
                bool _2785 = _2781 || _2783;
                bool _2787 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _2789 = _2785 || _2787;
                if (!_2789)
                {
                    float _2791 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2793 = _2172 + _2791;
                    float _2795 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2797 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _2795;
                    float _2799 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _2801 = _2799 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _2803 = 1.0 / _2797;
                    float _2805 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _2807 = _2805 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _2809 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _2811 = _2809 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _2813 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _2815 = _2813 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _2817 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _2819 = _2817 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _2821 = _2793 * _2803;
                    float _2823 = precise::clamp(_2821, 0.0, 1.0);
                    float _2825 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _2827 = _2825 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _2829 = fma(_2823, _2801, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _2831 = fma(_2823, _2827, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _2833 = fma(_2823, _2807, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _2835 = fma(_2823, _2811, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _2837 = fma(_2823, _2815, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _2839 = fma(_2823, _2819, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _2635 = _2833;
                    _2685 = _2837;
                    _2693 = _2829;
                    _2669 = _2835;
                    _2641 = _2831;
                    _2629 = _2839;
                    _2755 = true;
                }
                else
                {
                    _2635 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _2685 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _2693 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _2669 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _2641 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _2629 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _2755 = false;
    float _2841 = _2635;
    float _2843 = _2685;
    float _2845 = _2693;
    float _2847 = _2669;
    float _2849 = _2641;
    float _2851 = _2629;
    float _2853 = fma(_1832, -0.5, 0.5);
    float _2855 = precise::clamp(_2853, 0.0, 1.0);
    float _2857 = -_2841;
    float _2859 = _2857 + _2843;
    float _2861 = -_2845;
    float _2863 = _2861 + _2847;
    float _2865 = -_2849;
    float _2867 = _2865 + _2851;
    bool _2869 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2871 = fma(_2855, _2859, _2841);
    float _2873 = fma(_2855, _2863, _2845);
    float _2875 = fma(_2855, _2867, _2849);
    float _2877 = _2871 * 0.586610972881317138671875;
    out.m_51.x = 1.0;
    float _2879 = fma(_2873, 0.298911988735198974609375, _2877);
    float _2881 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2883 = fma(_2875, 0.114477999508380889892578125, _2879);
    out.m_80.w = _2881;
    float _2885 = -_2883;
    float _2887 = _2873 + _2885;
    float _2889 = -_2883;
    float _2891 = _2871 + _2889;
    float _2893 = -_2883;
    float _2895 = _2875 + _2893;
    out.m_84.x = 0.0;
    float _2897 = fma(_2887, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2883);
    float _2899 = fma(_2891, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2883);
    float _2901 = fma(_2895, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2883);
    out.m_86.x = _2897;
    out.m_86.y = _2899;
    out.m_86.z = _2901;
    if (!_2869)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _2903 = -_2144;
    float _2905 = _2903 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
    float _2907 = -_2146;
    float _2909 = _2907 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
    float _2911 = -_2148;
    float _2913 = _2911 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
    float _2915 = _2905 * _2905;
    float _2917 = fma(_2909, _2909, _2915);
    float _2919 = fma(_2913, _2913, _2917);
    float _2921 = sqrt(_2919);
    float _2923 = rsqrt(_2919);
    float _2925 = -_2921;
    float _2927 = _2925 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2929 = _2927 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
    float _2931 = precise::clamp(_2929, 0.0, 1.0);
    float _2933 = _2909 * _2923;
    float _2935 = _2905 * _2923;
    float _2937 = abs(_2931);
    float _2939 = log2(_2937);
    float _2941 = _2913 * _2923;
    float _2943 = _2933 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
    float _2945 = _1832 * _2935;
    float _2947 = -_2935;
    float _2949 = -_2943;
    float _2951 = fma(_2947, (*spvDescriptorSet0.vp_c15)._m0[656].y, _2949);
    float _2953 = fma(_1814, _2933, _2945);
    float _2955 = -_2941;
    float _2957 = fma(_2955, (*spvDescriptorSet0.vp_c15)._m0[656].z, _2951);
    float _2959 = fma(_1858, _2941, _2953);
    float _2961 = precise::clamp(_2959, 0.0, 1.0);
    float _2963 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
    float _2965 = _2957 + _2963;
    float _2967 = _2939 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
    float _2969 = _2965 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
    float _2971 = precise::clamp(_2969, 0.0, 1.0);
    float _2973 = exp2(_2967);
    float _2975 = _2973 * _2971;
    float _2977 = _2961 * _2975;
    float _2979 = _2977 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
    float _2981 = _2977 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
    float _2983 = _2977 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
    out.m_84.x = _2979;
    out.m_84.y = _2981;
    out.m_84.z = _2983;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_70 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_68 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_66 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_78 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_86 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_51 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_72 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_74 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_84 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_80 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_82 = float4(0.0, 0.0, 0.0, 1.0);
    bool _2755 = false;
    bool _1910 = false;
    bool _381 = false;
    bool _229 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _100 = in.m_48.w;
    float _102 = trunc(_100);
    int _105 = int(_102);
    bool _109 = _105 >= 1;
    float _111 = 0.0;
    if (!_109)
    {
        _111 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _113 = _111;
    float _115 = _113;
    if (!_109)
    {
        out.m_51.x = 0.0;
    }
    int _117 = 0;
    if (!_109)
    {
        float _119 = _113 * 5.0;
        _117 = as_type<int>(_119);
    }
    int _121 = _117;
    int _123 = _121;
    if (!_109)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3040 = as_type<float>(_121);
        out.gl_Position.z = _3040;
    }
    if (!_109)
    {
        return out;
    }
    float _125 = in.m_53.w;
    bool _127 = _125 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _129 = isnan(_125);
    bool _131 = _127 || _129;
    bool _133 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _135 = _131 || _133;
    float _137 = -_125;
    float _139 = _137 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _141 = 0.0;
    float _143 = _139;
    if (_135)
    {
        float _145 = float(_105);
        _141 = _145;
    }
    float _147 = _141;
    bool _149 = _139 >= _147;
    bool _151 = !_135;
    bool _153 = _149 || _151;
    if (_153)
    {
        _115 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _155 = _115;
    if (_153)
    {
        out.m_51.x = 0.0;
    }
    if (_153)
    {
        float _157 = _155 * 5.0;
        _123 = as_type<int>(_157);
    }
    int _159 = _123;
    if (_153)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3109 = as_type<float>(_159);
        out.gl_Position.z = _3109;
    }
    if (_153)
    {
        return out;
    }
    float _161 = as_type<float>(int(gl_VertexIndex));
    float _163 = in.m_58.x;
    float _165 = in.m_58.y;
    float _167 = in.m_58.z;
    int _169 = as_type<int>(_161) & 1;
    bool _171 = _169 != 0;
    int _173 = as_type<int>(_161) & 2;
    bool _175 = _173 != 0;
    bool _177 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _179 = _165 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _181 = _165 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _183 = _165 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    bool _185 = !_171;
    float _187 = _185 ? (-0.5) : 0.5;
    float _189 = fma(_163, (*spvDescriptorSet0.vp_c10)._m0[4].x, _179);
    float _191 = fma(_163, (*spvDescriptorSet0.vp_c10)._m0[5].x, _181);
    float _193 = fma(_163, (*spvDescriptorSet0.vp_c10)._m0[6].x, _183);
    bool _195 = !_175;
    float _197 = _195 ? (-0.5) : 0.5;
    float _199 = fma(_167, (*spvDescriptorSet0.vp_c10)._m0[4].z, _189);
    float _201 = fma(_167, (*spvDescriptorSet0.vp_c10)._m0[5].z, _191);
    float _203 = fma(_167, (*spvDescriptorSet0.vp_c10)._m0[6].z, _193);
    bool _205 = !_177;
    float _207 = _199;
    float _209 = _201;
    float _227;
    if (!_205)
    {
        float _211 = in.m_60.x;
        float _213 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _215 = _211 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _217 = fma(_215, (*spvDescriptorSet0.vp_c9)._m0[12].x, _139);
        float _219 = _217 * _213;
        float _221 = floor(_219);
        float _223 = -_221;
        float _225 = _219 + _223;
        _227 = _225;
        _229 = true;
    }
    else
    {
        float _231 = float(_105);
        float _233 = 1.0 / _231;
        float _235 = _139 * _233;
        _227 = _235;
    }
    _229 = false;
    float _237 = _227;
    float _239 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _241 = _237 + _239;
    bool _243 = _237 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _245 = isnan(_237);
    bool _247 = _243 || _245;
    bool _249 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _251 = _247 || _249;
    float _253 = float(_251);
    bool _255 = _237 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _257 = isnan(_237);
    bool _259 = _255 || _257;
    bool _261 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _263 = _259 || _261;
    float _265 = float(_263);
    float _267 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _269 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _267;
    float _271 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _273 = _271 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _275 = -_253;
    float _277 = _275 + 1.0;
    float _279 = 1.0 / _273;
    bool _281 = _237 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _283 = isnan(_237);
    bool _285 = _281 || _283;
    bool _287 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _289 = _285 || _287;
    float _291 = float(_289);
    float _293 = _265 * _277;
    float _295 = -_265;
    float _297 = _295 + 1.0;
    bool _299 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _301 = _291 * _297;
    float _303 = 1.0 / _269;
    float _305 = -_291;
    float _307 = _305 + 1.0;
    float _309 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _311 = _309 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _313 = _241 * _303;
    float _315 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _317 = _237 + _315;
    float _319 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _321 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _319;
    float _323 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _325 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _323;
    float _327 = _317 * _279;
    float _329 = fma(_321, _313, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _331 = fma(_325, _313, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _333 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _335 = _333 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _337 = fma(_311, _327, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _339 = _329 * _301;
    float _341 = _331 * _301;
    float _343 = fma(_335, _327, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _345 = fma(_307, (*spvDescriptorSet0.vp_c9)._m0[143].x, _339);
    float _347 = fma(_307, (*spvDescriptorSet0.vp_c9)._m0[143].y, _341);
    float _349 = fma(_343, _293, _345);
    float _351 = fma(_337, _293, _347);
    float _353 = fma(_253, (*spvDescriptorSet0.vp_c9)._m0[145].x, _349);
    float _355 = fma(_253, (*spvDescriptorSet0.vp_c9)._m0[145].y, _351);
    bool _357 = !_299;
    float _377;
    float _379;
    if (!_357)
    {
        float _359 = in.m_60.x;
        float _361 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _363 = float(_105);
        float _365 = _359 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _367 = fma(_365, (*spvDescriptorSet0.vp_c9)._m0[11].y, _139);
        float _369 = _367 * _361;
        float _371 = floor(_369);
        float _373 = -_371;
        float _375 = _369 + _373;
        _377 = _363;
        _379 = _375;
        _381 = true;
    }
    else
    {
        float _383 = float(_105);
        float _385 = 1.0 / _383;
        float _387 = _139 * _385;
        _377 = _383;
        _379 = _387;
    }
    _381 = false;
    float _389 = _377;
    float _391 = _379;
    float _393 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _395 = int(_393);
    float _397 = in.m_60.x;
    float _399 = in.m_60.y;
    float _401 = in.m_60.z;
    float _403 = in.m_60.w;
    float _405 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _197);
    float _407 = in.m_62.x;
    float _409 = in.m_62.y;
    float _411 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _413 = int(_411);
    float _415 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _417 = _415 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _419 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _421 = _419 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _423 = 1.0 / _389;
    float _425 = float(_395);
    float _427 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _429 = 1.0 / _425;
    float _431 = float(uint(_413));
    float _433 = _401 * 2.0;
    bool _435 = _403 > 0.5;
    float _437 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _439 = _353 * _407;
    float _441 = _399 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    int _443 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _445 = _443 != 0;
    int _447 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _449 = _447 != 0;
    int _451 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _453 = _451 != 0;
    float _455 = 1.0 / _431;
    float _457 = _397 * 2.0;
    int _459 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _461 = _459 != 0;
    float _463 = _355 * _409;
    bool _465 = !_445;
    int _467 = _465 ? 0 : 1;
    float _469 = fma(_441, -2.0, _427);
    int _471 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _473 = _471 != 0;
    float _475 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _477 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _475;
    float _479 = _429 * _139;
    int _481 = ~_413;
    int _483 = _481 + 1;
    float _485 = floor(_457);
    bool _487 = !_461;
    int _489 = _487 ? 0 : 1;
    float _491 = _397 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    bool _493 = !_473;
    int _495 = _493 ? 0 : 1;
    float _497 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    bool _499 = !_449;
    int _501 = _499 ? 0 : 1;
    float _503 = _401 + _397;
    int _505 = as_type<int>(_455) + (-2);
    float _507 = trunc(_479);
    int _509 = int(_507);
    int _511 = int(_435);
    int _513 = _175 ? 2 : 0;
    int _515 = _511 | _513;
    int _517 = _177 ? 4 : 0;
    int _519 = _515 | _517;
    int _521 = _461 ? 8 : 0;
    int _523 = _519 | _521;
    int _525 = _473 ? 16 : 0;
    int _527 = _523 | _525;
    int _529 = _449 ? 32 : 0;
    int _531 = _527 | _529;
    int _533 = _453 ? 64 : 0;
    int _535 = _531 | _533;
    int _537 = _535 & 1;
    float _539 = -_437;
    float _541 = fma(_491, 2.0, _539);
    bool _543 = _397 > 0.5;
    float _545 = fma(_397, (*spvDescriptorSet0.vp_c9)._m0[78].z, _497);
    bool _547 = !_453;
    int _549 = _547 ? 0 : 1;
    float _551 = -_139;
    float _553 = fma(_551, (*spvDescriptorSet0.vp_c9)._m0[76].x, _541);
    float _555 = float(_413);
    float _557 = 1.0 / _417;
    bool _559 = _485 > 0.0;
    bool _561 = _485 >= 0.0;
    bool _563 = isnan(_485);
    bool _565 = _561 || _563;
    bool _567 = isnan(0.0);
    bool _569 = _565 || _567;
    float _571 = -_187;
    int _573 = _543 ? as_type<int>(_571) : as_type<int>(_187);
    float _575 = 1.0 / _421;
    float _577 = float(uint(_509));
    float _579 = float(_509);
    int _581 = abs(_501);
    float _583 = as_type<float>(_505) * _577;
    bool _585 = _579 >= _555;
    bool _587 = isnan(_579);
    bool _589 = _585 || _587;
    bool _591 = isnan(_555);
    bool _593 = _589 || _591;
    float _595 = float(_593);
    float _597 = _477 * _557;
    float _599 = trunc(_583);
    float _601 = precise::max(_599, 0.0);
    uint _604 = uint(_601);
    float _606 = trunc(_595);
    int _608 = int(_606);
    int _610 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _612 = _610 != 0;
    int _614 = _483 * int(_604);
    int _616 = _614 + _509;
    float _618 = _399 * 2.0;
    bool _620 = !_612;
    float _622 = _620 ? 7.345489978790283203125 : 1.0;
    float _624 = float(uint(_616));
    float _626 = floor(_618);
    float _628 = as_type<float>(_505) * _624;
    float _630 = 0.0;
    if (!_612)
    {
        _630 = _399;
    }
    float _632 = _630;
    float _634 = 0.0;
    float _636 = _632;
    if (!_612)
    {
        _634 = _401;
    }
    float _638 = _634;
    float _640 = 0.0;
    float _642 = _638;
    if (!_612)
    {
        _640 = _401;
    }
    float _644 = _640;
    float _646 = trunc(_628);
    float _648 = precise::max(_646, 0.0);
    uint _650 = uint(_648);
    float _652 = _644;
    if (_612)
    {
        _636 = _397;
    }
    float _654 = _636;
    if (_612)
    {
        _642 = _399;
    }
    float _656 = _642;
    if (_612)
    {
        _652 = _399;
    }
    float _658 = _652;
    bool _660 = _626 > 0.0;
    float _662 = _656 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    bool _664 = _626 >= 0.0;
    bool _666 = isnan(_626);
    bool _668 = _664 || _666;
    bool _670 = isnan(0.0);
    bool _672 = _668 || _670;
    int _674 = _569 ? 0 : 1;
    bool _676 = _399 > 0.5;
    int _678 = _672 ? 0 : 1;
    int _680 = int(_604) + int(_650);
    int _682 = ~_413;
    int _684 = _682 + 1;
    int _686 = ~_674;
    int _688 = _686 + 1;
    int _690 = _688 + 1;
    int _692 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _694 = _692 != 0;
    int _696 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _698 = _696 != 0;
    int _700 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _702 = _700 != 0;
    int _704 = _684 * _680;
    int _706 = _704 + _509;
    int _708 = _690;
    if (!_559)
    {
        int _710 = ~_674;
        int _712 = _710 + 1;
        _708 = _712;
    }
    int _714 = _708;
    int _716 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _718 = _716 != 0;
    int _720 = ~_678;
    int _722 = _720 + 1;
    int _724 = _722 + 1;
    int _726 = _724;
    if (!_660)
    {
        int _728 = ~_678;
        int _730 = _728 + 1;
        _726 = _730;
    }
    int _732 = _726;
    bool _734 = !_718;
    float _736 = _734 ? _187 : as_type<float>(_573);
    bool _738 = uint(_706) >= uint(_413);
    float _740 = in.m_48.x;
    float _742 = in.m_48.y;
    float _744 = in.m_48.z;
    float _746 = -_197;
    int _748 = _676 ? as_type<int>(_746) : as_type<int>(_197);
    bool _750 = !_738;
    int _752 = _750 ? 0 : (-1);
    int _754 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _756 = _754 != 0;
    int _758 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _760 = _758 != 0;
    int _762 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _764 = _762 != 0;
    int _766 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _768 = _766 != 0;
    bool _770 = !_698;
    int _772 = _770 ? 0 : 1;
    bool _774 = _401 > 0.5;
    bool _776 = !_694;
    int _778 = _776 ? 0 : 1;
    int _780 = ~_680;
    int _782 = _780 + _752;
    int _784 = _782 + 1;
    int _786 = abs(_778);
    float _788 = fma(_139, (*spvDescriptorSet0.vp_c9)._m0[77].z, _545);
    float _790 = fma(_139, (*spvDescriptorSet0.vp_c9)._m0[76].y, _469);
    float _792 = _742 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _794 = _742 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _796 = _742 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _798 = float(_786);
    float _800 = fma(_740, (*spvDescriptorSet0.vp_c10)._m0[5].x, _792);
    float _802 = fma(_740, (*spvDescriptorSet0.vp_c10)._m0[6].x, _794);
    float _804 = fma(_740, (*spvDescriptorSet0.vp_c10)._m0[4].x, _796);
    float _806 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _808 = _806 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _810 = _555 * _139;
    float _812 = _399 + _401;
    float _814 = float(_732);
    float _816 = _808 * _575;
    float _818 = _810 * _423;
    float _820 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _822 = _399 + _397;
    float _824 = _399 + (-0.5);
    bool _826 = !_702;
    int _828 = _826 ? 0 : 1;
    float _830 = fma(_399, (*spvDescriptorSet0.vp_c9)._m0[78].w, _820);
    float _832 = _822 + (-1.0);
    float _834 = floor(_433);
    float _836 = _397 + (-0.5);
    float _838 = _622 * _397;
    float _840 = _503 + (-1.0);
    bool _842 = _537 != 0;
    float _844 = _401 + (-0.5);
    float _846 = fma(_832, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _848 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _850 = log2(_848);
    float _852 = _812 + (-1.0);
    float _854 = fma(_840, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _856 = _463 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _858 = fma(_852, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _860 = _439 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    bool _862 = _834 >= 0.0;
    bool _864 = isnan(_834);
    bool _866 = _862 || _864;
    bool _868 = isnan(0.0);
    bool _870 = _866 || _868;
    float _872 = _856 * _405;
    float _874 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _876 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _187);
    int _878 = _870 ? 0 : 1;
    float _880 = fma(_139, (*spvDescriptorSet0.vp_c9)._m0[77].w, _830);
    bool _882 = _834 > 0.0;
    float _884 = fma(_658, (*spvDescriptorSet0.vp_c9)._m0[83].w, _874);
    float _886 = floor(_838);
    float _888 = _850 * _139;
    float _890 = _860 * _876;
    float _892 = fma(_744, (*spvDescriptorSet0.vp_c10)._m0[4].z, _804);
    float _894 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _896 = exp2(_888);
    float _898 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    bool _900 = !_764;
    float _902 = _900 ? _197 : as_type<float>(_748);
    float _904 = fma(_654, (*spvDescriptorSet0.vp_c9)._m0[83].z, _894);
    float _906 = _654 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _908 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _910 = fma(_744, (*spvDescriptorSet0.vp_c10)._m0[5].z, _800);
    float _912 = fma(_139, (*spvDescriptorSet0.vp_c9)._m0[82].z, _904);
    float _914 = -_886;
    float _916 = _838 + _914;
    float _918 = -_898;
    float _920 = fma(_906, 2.0, _918);
    float _922 = fma(_662, -2.0, _908);
    float _924 = _916 * _555;
    int _926 = ~_878;
    int _928 = _926 + 1;
    int _930 = _928 + 1;
    float _932 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _934 = 1.0 + _932;
    int _936 = _930;
    if (!_882)
    {
        int _938 = ~_878;
        int _940 = _938 + 1;
        _936 = _940;
    }
    int _942 = _936;
    float _944 = -_896;
    float _946 = _944 + 1.0;
    bool _948 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _950 = isnan(0.0);
    bool _952 = _948 || _950;
    bool _954 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _956 = _952 || _954;
    float _958 = in.m_64.x;
    float _960 = in.m_64.y;
    float _962 = in.m_64.z;
    float _964 = fma(_139, (*spvDescriptorSet0.vp_c9)._m0[82].w, _884);
    float _966 = 1.0 / _934;
    float _968 = _956 ? _946 : 0.0;
    float _970 = -_139;
    float _972 = fma(_970, (*spvDescriptorSet0.vp_c9)._m0[81].x, _920);
    bool _974 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _976 = isnan(1.0);
    bool _978 = _974 || _976;
    bool _980 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _982 = _978 || _980;
    float _984 = fma(_139, (*spvDescriptorSet0.vp_c9)._m0[81].y, _922);
    float _986 = float(_942);
    float _988 = fma(_744, (*spvDescriptorSet0.vp_c10)._m0[6].z, _802);
    float _990 = _892 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _992 = trunc(_924);
    int _994 = int(_992);
    float _996 = _910 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _998 = _798 * _986;
    float _1000 = _988 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _1002 = _998 * (-2.0);
    if (_982)
    {
        float _1004 = _968 * _966;
        _143 = _1004;
    }
    float _1006 = _143;
    int _1008 = _413 * _784;
    int _1010 = _1008 + _509;
    bool _1012 = _413 == 0;
    float _1014 = trunc(_818);
    int _1016 = int(_1014);
    int _1018 = ~_608;
    int _1020 = _1018 + 1;
    int _1022 = _1020 + 1;
    bool _1024 = !_1012;
    int _1026 = _1024 ? _1010 : (-1);
    float _1028 = fma(_1002, _958, _958);
    int _1030 = abs(_495);
    float _1032 = fma(_846, _1002, _846);
    int _1034 = _413 + (-1);
    int _1036 = _1026 * _1022;
    int _1038 = abs(_467);
    int _1040 = _994 * _1030;
    int _1042 = _1040 + _509;
    float _1044 = fma(_836, (*spvDescriptorSet0.vp_c9)._m0[196].x, _1028);
    int _1046 = _608 * _1034;
    int _1048 = _1046 + _1036;
    int _1050 = abs(_772);
    float _1052 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    int _1054 = abs(_549);
    int _1056 = _1048 * _581;
    float _1058 = fma(_1032, _1006, _1044);
    int _1060 = ~_413;
    int _1062 = _1060 + 1;
    int _1064 = _1016 * _1038;
    int _1066 = _1064 + _1056;
    float _1068 = float(uint(_1042));
    float _1070 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    int _1072 = abs(_489);
    float _1074 = as_type<float>(_505) * _1068;
    float _1076 = _1058 * 0.15915493667125701904296875;
    float _1078 = float(_714);
    float _1080 = _1052 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _1082 = float(_1050);
    int _1084 = _1042 * _1054;
    int _1086 = _1084 + _1066;
    int _1088 = abs(_828);
    float _1090 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _1092 = _391 + _1090;
    float _1094 = trunc(_1074);
    float _1096 = precise::max(_1094, 0.0);
    uint _1098 = uint(_1096);
    float _1100 = _1082 * _1078;
    int _1102 = _994 * _1072;
    int _1104 = _1102 + _1086;
    float _1106 = fma(_597, _1092, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _1108 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _1110 = _391 + _1108;
    float _1112 = _1100 * (-2.0);
    float _1114 = float(_1088);
    float _1116 = _1070 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _1118 = float(uint(_1104));
    float _1120 = fma(_1112, _960, _960);
    float _1122 = fma(_858, _1112, _858);
    float _1124 = _1114 * _814;
    float _1126 = fma(_816, _1110, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _1128 = as_type<float>(_505) * _1118;
    float _1130 = fma(_824, (*spvDescriptorSet0.vp_c9)._m0[196].y, _1120);
    float _1132 = _1124 * (-2.0);
    bool _1134 = _391 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _1136 = isnan(_391);
    bool _1138 = _1134 || _1136;
    bool _1140 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _1142 = _1138 || _1140;
    float _1144 = float(_1142);
    float _1146 = _1076 * 6.283185482025146484375;
    float _1148 = sin(_1146);
    float _1150 = fma(_1122, _1006, _1130);
    float _1152 = fma(_1132, _962, _962);
    float _1154 = fma(_854, _1132, _854);
    bool _1156 = _391 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _1158 = isnan(_391);
    bool _1160 = _1156 || _1158;
    bool _1162 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _1164 = _1160 || _1162;
    float _1166 = float(_1164);
    float _1168 = _1150 * 0.15915493667125701904296875;
    float _1170 = fma(_844, (*spvDescriptorSet0.vp_c9)._m0[196].z, _1152);
    int _1172 = ~_413;
    int _1174 = _1172 + 1;
    float _1176 = trunc(_1128);
    float _1178 = precise::max(_1176, 0.0);
    uint _1180 = uint(_1178);
    float _1182 = -_1144;
    float _1184 = _1182 + 1.0;
    float _1186 = fma(_1154, _1006, _1170);
    bool _1188 = _391 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _1190 = isnan(_391);
    bool _1192 = _1188 || _1190;
    bool _1194 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _1196 = _1192 || _1194;
    float _1198 = float(_1196);
    float _1200 = -_1166;
    float _1202 = _1200 + 1.0;
    float _1204 = _1166 * _1184;
    int _1206 = ~_413;
    int _1208 = _1206 + 1;
    float _1210 = _1076 * 6.283185482025146484375;
    float _1212 = cos(_1210);
    float _1214 = 0.5 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    int _1216 = _1174 * int(_1180);
    int _1218 = _1216 + _1104;
    float _1220 = _1198 * _1202;
    float _1222 = _1186 * 0.15915493667125701904296875;
    float _1224 = _1168 * 6.283185482025146484375;
    float _1226 = sin(_1224);
    float _1228 = float(uint(_1218));
    float _1230 = _1106 * _1220;
    float _1232 = -_187;
    int _1234 = _774 ? as_type<int>(_1232) : as_type<int>(_187);
    int _1236 = _1208 * int(_1098);
    int _1238 = _1236 + _1042;
    float _1240 = _736 + 0.5;
    float _1242 = _1168 * 6.283185482025146484375;
    float _1244 = cos(_1242);
    float _1246 = float(uint(_1238));
    float _1248 = fma(_1240, (*spvDescriptorSet0.vp_c9)._m0[80].x, _553);
    float _1250 = as_type<float>(_505) * _1246;
    float _1252 = -_197;
    int _1254 = _842 ? as_type<int>(_1252) : as_type<int>(_197);
    float _1256 = _1222 * 6.283185482025146484375;
    float _1258 = cos(_1256);
    float _1260 = as_type<float>(_505) * _1228;
    float _1262 = _902 + (-0.5);
    float _1264 = -_1262;
    float _1266 = -_790;
    float _1268 = fma(_1264, (*spvDescriptorSet0.vp_c9)._m0[80].y, _1266);
    float _1270 = -_1198;
    float _1272 = _1270 + 1.0;
    float _1274 = trunc(_1260);
    float _1276 = precise::max(_1274, 0.0);
    uint _1278 = uint(_1276);
    bool _1280 = !_768;
    float _1282 = _1280 ? _187 : as_type<float>(_1234);
    float _1284 = fma(_1272, (*spvDescriptorSet0.vp_c9)._m0[115].x, _1230);
    bool _1286 = !_756;
    float _1288 = _1286 ? _197 : as_type<float>(_1254);
    float _1290 = _197 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _1292 = _1282 + 0.5;
    float _1294 = fma(_1126, _1204, _1284);
    float _1296 = trunc(_1250);
    float _1298 = precise::max(_1296, 0.0);
    uint _1300 = uint(_1298);
    float _1302 = _1288 + (-0.5);
    float _1304 = fma(_1080, _1292, _972);
    int _1306 = ~_413;
    int _1308 = _1306 + 1;
    float _1310 = _1148 * _1244;
    float _1312 = -_1116;
    float _1314 = -_984;
    float _1316 = fma(_1312, _1302, _1314);
    float _1318 = fma(_1144, (*spvDescriptorSet0.vp_c9)._m0[117].x, _1294);
    float _1320 = _1222 * 6.283185482025146484375;
    float _1322 = sin(_1320);
    int _1324 = int(_1180) + int(_1278);
    float _1326 = _1148 * _1226;
    float _1328 = _1148 * _1258;
    float _1330 = _1212 * _1244;
    float _1332 = _1244 * _1258;
    float _1334 = _1212 * _1226;
    float _1336 = _1212 * _1258;
    int _1338 = int(_1098) + int(_1300);
    int _1340 = _1308 * _1324;
    int _1342 = _1340 + _1104;
    float _1344 = _1226 * _1258;
    float _1346 = _1336 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1348 = _1336 * _872;
    int _1350 = _1062 * _1338;
    int _1352 = _1350 + _1042;
    bool _1354 = uint(_1342) >= uint(_413);
    float _1356 = _1336 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1358 = fma(_1322, _1330, _1326);
    float _1360 = fma(_1322, _1326, _1330);
    bool _1362 = !_1354;
    int _1364 = _1362 ? 0 : (-1);
    float _1366 = -_1334;
    float _1368 = fma(_1322, _1310, _1366);
    float _1370 = -_1310;
    float _1372 = fma(_1322, _1334, _1370);
    float _1374 = _1336 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    int _1376 = ~_1324;
    int _1378 = _1376 + _1364;
    int _1380 = _1378 + 1;
    float _1382 = -_1322;
    float _1384 = fma(_1382, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1356);
    float _1386 = -_872;
    float _1388 = _1322 * _1386;
    float _1390 = -_1322;
    float _1392 = fma(_1390, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1374);
    float _1394 = -_1322;
    float _1396 = fma(_1394, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1346);
    int _1398 = _413 * _1380;
    int _1400 = _1398 + _1104;
    float _1402 = fma(_1358, _890, _1348);
    float _1404 = fma(_1328, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1392);
    float _1406 = fma(_1332, _890, _1388);
    float _1408 = fma(_1328, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1384);
    bool _1410 = !_1012;
    int _1412 = _1410 ? _1400 : (-1);
    float _1414 = _1358 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1416 = _1358 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1418 = _1358 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    int _1420 = _1412 >> 31;
    float _1422 = _1328 * _872;
    float _1424 = fma(_1328, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1396);
    float _1426 = _1372 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    int _1428 = _1420 & 3;
    float _1430 = fma(_1368, _890, _1422);
    float _1432 = fma(_1344, _1214, _1406);
    float _1434 = _1372 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    int _1436 = _1412 + _1428;
    float _1438 = _1372 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1440 = fma(_1372, _1214, _1402);
    float _1442 = fma(_1332, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1414);
    int _1444 = _1436 >> 2;
    float _1446 = fma(_1332, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1416);
    float _1448 = fma(_1332, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1418);
    float _1450 = fma(_1344, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1426);
    float _1452 = fma(_1344, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1434);
    float _1454 = fma(_1344, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1438);
    int _1456 = _1444 << 4;
    int _1458 = _1456 + 368;
    float _1460 = fma(_1360, _1214, _1430);
    float _1462 = _1290 * _1404;
    float _1464 = _1440 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1466 = _1440 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    uint _1468 = uint(int(uint(_1458) >> uint(2)));
    uint _1470 = uint(int(uint(int(_1468)) >> uint(2)));
    int _1472 = int(_1468) & 3;
    float _1474 = (*spvDescriptorSet0.vp_c9)._m0[int(_1470)][_1472];
    int _1476 = int(_1468) + 1;
    uint _1478 = uint(int(uint(_1476) >> uint(2)));
    int _1480 = _1476 & 3;
    float _1482 = (*spvDescriptorSet0.vp_c9)._m0[int(_1478)][_1480];
    float _1484 = _1290 * _1408;
    float _1486 = fma(_1432, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1464);
    float _1488 = fma(_1432, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1466);
    bool _1490 = uint(_1352) >= uint(_413);
    float _1492 = _1290 * _1424;
    float _1494 = fma(_1460, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1486);
    float _1496 = fma(_1460, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1488);
    int _1498 = _1412 & 3;
    bool _1500 = _1498 != 0;
    float _1502 = fma(_1368, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1442);
    float _1504 = _1494 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _1506 = _1496 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _1508 = fma(_1368, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1446);
    float _1510 = fma(_1368, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1448);
    float _1512 = _990 + _1504;
    float _1514 = _1000 + _1506;
    int _1516 = _1412 & 3;
    bool _1518 = _1516 != 0;
    float _1520 = _1440 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    int _1522 = _1458 + 8;
    uint _1524 = uint(int(uint(_1522) >> uint(2)));
    uint _1526 = uint(int(uint(int(_1524)) >> uint(2)));
    int _1528 = int(_1524) & 3;
    float _1530 = (*spvDescriptorSet0.vp_c9)._m0[int(_1526)][_1528];
    int _1532 = int(_1524) + 1;
    uint _1534 = uint(int(uint(_1532) >> uint(2)));
    int _1536 = _1532 & 3;
    float _1538 = (*spvDescriptorSet0.vp_c9)._m0[int(_1534)][_1536];
    bool _1540 = uint(_1498) > 1u;
    float _1542 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1544 = _1512 + _1542;
    float _1546 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1548 = _1514 + _1546;
    bool _1550 = !_1490;
    int _1552 = _1550 ? 0 : (-1);
    float _1554 = fma(_1432, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1520);
    float _1556 = _1544 * _1544;
    float _1558 = _1548 * _1548;
    int _1560 = _1518 ? 0 : 1;
    float _1562 = fma(_1460, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1554);
    int _1564 = ~_1338;
    int _1566 = _1564 + _1552;
    int _1568 = _1566 + 1;
    float _1570 = _1556 + _1558;
    int _1572 = ~_1560;
    int _1574 = _1572 + 1;
    int _1576 = _1574 + 1;
    float _1578 = fma(_1360, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1450);
    int _1580 = _1576;
    float _1582 = _1556;
    float _1584 = _1558;
    float _1586 = _1514;
    float _1588 = _1318;
    if (!_1540)
    {
        int _1590 = ~_1560;
        int _1592 = _1590 + 1;
        _1580 = _1592;
    }
    int _1594 = _1580;
    float _1596 = sqrt(_1570);
    int _1598 = _413 * _1568;
    int _1600 = _1598 + _1042;
    bool _1602 = _1498 != 3;
    float _1604 = fma(_1360, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1452);
    int _1606 = abs(_1594);
    float _1608 = fma(_1360, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1454);
    bool _1610 = !_1500;
    int _1612 = _1610 ? 0 : 1;
    bool _1614 = uint(_1498) >= 2u;
    int _1616 = ~_1606;
    int _1618 = _1616 + 1;
    int _1620 = _1618 + 1;
    int _1622 = abs(_1612);
    int _1624 = _1614 ? 0 : 1;
    int _1626 = _1620 * as_type<int>(_1482);
    bool _1628 = _1596 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    int _1630 = ~_1622;
    int _1632 = _1630 + 1;
    int _1634 = _1632 + 1;
    bool _1636 = !_760;
    int _1638 = _1636 ? 0 : 1;
    bool _1640 = _1498 != 3;
    int _1642 = _1634 * as_type<int>(_1474);
    int _1644 = _1642 + _1626;
    int _1646 = ~_1624;
    int _1648 = _1646 + 1;
    int _1650 = _1648 + 1;
    float _1652 = _1562 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    int _1654 = _1650;
    if (_1602)
    {
        int _1656 = ~_1624;
        int _1658 = _1656 + 1;
        _1654 = _1658;
    }
    int _1660 = _1654;
    int _1662 = abs(_1638);
    float _1664 = _996 + _1652;
    bool _1666 = !_1640;
    float _1668 = _1666 ? 0.0 : as_type<float>(0xffffffffu /* nan */);
    int _1670 = abs(_1660);
    int _1672 = abs(as_type<int>(_1668));
    float _1674 = _1668;
    float _1676 = _1664;
    if (!_1628)
    {
        _1674 = _1512;
    }
    float _1678 = _1674;
    int _1680 = ~_1670;
    int _1682 = _1680 + 1;
    int _1684 = _1682 + 1;
    bool _1686 = !_1628;
    float _1688 = _1678;
    if (!_1686)
    {
        float _1690 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1692 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1694 = _1596 + _1692;
        float _1696 = rsqrt(_1570);
        float _1698 = _1694 * _1690;
        float _1700 = _1664 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1702 = _1698 * 0.15915493667125701904296875;
        float _1704 = _1702 * 6.283185482025146484375;
        float _1706 = sin(_1704);
        float _1708 = _1702 * 6.283185482025146484375;
        float _1710 = cos(_1708);
        float _1712 = fma(_1706, _1700, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1714 = _1696 * _1712;
        float _1716 = fma(_1544, _1714, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1718 = _1710 + (-1.0);
        float _1720 = fma(_1548, _1714, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _1722 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _1724 = _1716 + _1722;
        float _1726 = _1718 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1728 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _1730 = _1720 + _1728;
        float _1732 = _1724 * _1724;
        float _1734 = fma(_1664, _1710, _1726);
        float _1736 = _1730 * _1730;
        _1676 = _1734;
        _1582 = _1732;
        _1584 = _1736;
        _1688 = _1716;
        _1586 = _1720;
    }
    float _1738 = _1676;
    float _1740 = _1582;
    float _1742 = _1584;
    float _1744 = _1688;
    float _1746 = _1586;
    int _1748 = _1684 * as_type<int>(_1530);
    int _1750 = _1748 + _1644;
    int _1752 = ~_1672;
    int _1754 = _1752 + 1;
    int _1756 = _1754 + 1;
    float _1758 = _187 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    int _1760 = ~_1662;
    int _1762 = _1760 + 1;
    int _1764 = _1762 + 1;
    float _1766 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _1768 = _1738 + _1766;
    bool _1770 = !_1012;
    int _1772 = _1770 ? _1600 : (-1);
    int _1774 = _1756 * as_type<int>(_1538);
    int _1776 = _1774 + _1750;
    float _1778 = fma(_1758, _1502, _1462);
    float _1780 = fma(_1768, _1768, _1740);
    float _1782 = -_964;
    float _1784 = _1782 + 1.0;
    int _1786 = _1776 * _1764;
    float _1788 = -_788;
    float _1790 = _1788 + 1.0;
    float _1792 = _1780 + _1742;
    float _1794 = fma(_1758, _1508, _1484);
    int _1796 = _1772 * _1662;
    int _1798 = _1796 + _1786;
    float _1800 = -_880;
    float _1802 = _1800 + 1.0;
    float _1804 = fma(_1758, _1510, _1492);
    float _1806 = -_1790;
    float _1808 = fma(_736, _1806, _1248);
    float _1810 = fma(_1288, _1784, _1316);
    float _1812 = fma(_902, _1802, _1268);
    float _1814 = _1578 + _1778;
    float _1816 = sqrt(_1792);
    float _1818 = -_912;
    float _1820 = _1818 + 1.0;
    float _1822 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _1824 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _1826 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1828 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1830 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1832 = _1604 + _1794;
    float _1834 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1836 = float(_1798);
    float _1838 = -_1820;
    float _1840 = fma(_1282, _1838, _1304);
    float _1842 = (*spvDescriptorSet0.vp_c9)._m0[131].x * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _1844 = _1822 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1846 = _1824 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1848 = _1828 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1850 = _1830 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1852 = _1834 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1854 = _1826 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1856 = _1318 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _1858 = _1608 + _1804;
    out.m_66.x = _1808;
    out.m_66.y = _1812;
    out.m_66.z = _1840;
    out.m_66.w = _1810;
    bool _1860 = _1816 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _1862 = isnan(_1816);
    bool _1864 = _1860 || _1862;
    bool _1866 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _1868 = _1864 || _1866;
    out.m_68.x = _1848;
    out.m_68.y = _1850;
    out.m_68.z = _1852;
    out.m_68.w = _1842;
    out.m_70.x = _1844;
    out.m_70.y = _1846;
    out.m_70.z = _1854;
    out.m_70.w = _1856;
    out.m_72.x = _1836;
    float _1870 = _1808;
    float _1872 = _1840;
    float _1874 = _1854;
    if (!_1868)
    {
        _1588 = 1.0;
    }
    float _1876 = _1588;
    out.m_74.x = _1814;
    out.m_74.y = _1832;
    out.m_74.z = _1858;
    bool _1878 = !_1868;
    float _1880 = _1876;
    if (!_1878)
    {
        bool _1882 = _1816 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _1884 = isnan(_1816);
        bool _1886 = _1882 || _1884;
        bool _1888 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _1890 = _1886 || _1888;
        if (!_1890)
        {
            float _1892 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1894 = _1816 + _1892;
            float _1896 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1898 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _1896;
            float _1900 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _1902 = _1900 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _1904 = 1.0 / _1898;
            float _1906 = _1894 * _1904;
            float _1908 = fma(_1906, _1902, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _1880 = _1908;
            _1870 = _1898;
            _1910 = true;
        }
        else
        {
            bool _1912 = _1816 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _1914 = isnan(_1816);
            bool _1916 = _1912 || _1914;
            bool _1918 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _1920 = _1916 || _1918;
            if (!_1920)
            {
                float _1922 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1924 = _1816 + _1922;
                float _1926 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1928 = _1926 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _1930 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _1932 = _1930 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _1934 = 1.0 / _1928;
                float _1936 = _1924 * _1934;
                float _1938 = fma(_1936, _1932, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _1880 = _1938;
                _1870 = _1928;
                _1910 = true;
            }
            else
            {
                _1880 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _1910 = false;
    float _1940 = _1880;
    float _1942 = _1870;
    float _1944 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _1946 = _1738 + _1944;
    float _1948 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _1950 = _1744 + _1948;
    float _1952 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _1954 = _1746 + _1952;
    float _1956 = fma(_1946, _1940, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _1958 = fma(_1950, _1940, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _1960 = fma(_1954, _1940, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _1962 = -_996;
    float _1964 = _1962 + _1956;
    float _1966 = -_990;
    float _1968 = _1966 + _1958;
    float _1970 = -_1000;
    float _1972 = _1970 + _1960;
    float _1974 = _1964 * _1964;
    float _1976 = fma(_1968, _1968, _1974);
    float _1978 = fma(_1972, _1972, _1976);
    float _1980 = sqrt(_1978);
    bool _1982 = _1980 > 0.0;
    bool _1984 = (*spvDescriptorSet0.vp_c15)._m0[660].y >= 0.5;
    bool _1986 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1988 = _1984 || _1986;
    bool _1990 = isnan(0.5);
    bool _1992 = _1988 || _1990;
    float _1994 = (*spvDescriptorSet0.vp_c15)._m0[660].y;
    float _1996 = _1942;
    float _1998 = _1958;
    float _2000 = _1972;
    if (!_1982)
    {
        _1994 = _1958;
    }
    float _2002 = _1994;
    float _2004 = _2002;
    if (!_1982)
    {
        _1872 = _1956;
    }
    float _2006 = _1872;
    float _2008 = _2006;
    float _2010 = _2006;
    if (!_1982)
    {
        _1996 = _1960;
    }
    float _2012 = _1996;
    bool _2014 = !_1982;
    float _2016 = _2012;
    if (!_2014)
    {
        float _2018 = _201 * _201;
        float _2020 = fma(_199, _199, _2018);
        float _2022 = rsqrt(_1978);
        float _2024 = fma(_203, _203, _2020);
        float _2026 = sqrt(_2024);
        float _2028 = _1968 * _2022;
        float _2030 = _1964 * _2022;
        float _2032 = _1972 * _2022;
        bool _2034 = _2026 > 0.0;
        float _2036 = _2022;
        float _2038 = _2026;
        _1874 = _2032;
        if (!_2034)
        {
            _2036 = _1958;
        }
        float _2040 = _2036;
        _2004 = _2040;
        if (!_2034)
        {
            _2008 = _1956;
        }
        float _2042 = _2008;
        _2010 = _2042;
        if (!_2034)
        {
            _2038 = _1960;
        }
        float _2044 = _2038;
        bool _2046 = !_2034;
        _2016 = _2044;
        if (!_2046)
        {
            float _2048 = rsqrt(_2024);
            float _2050 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].z;
            float _2052 = _201 * _2048;
            float _2054 = _199 * _2048;
            float _2056 = _203 * _2048;
            float _2058 = _2030 * _2052;
            float _2060 = fma(_2028, _2054, _2058);
            float _2062 = _2050 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _2064 = fma(_2032, _2056, _2060);
            float _2066 = _2064 * _2062;
            float _2068 = fma(_199, _2066, _1958);
            float _2070 = fma(_201, _2066, _1956);
            float _2072 = fma(_203, _2066, _1960);
            _2010 = _2070;
            _2016 = _2072;
            _2004 = _2068;
        }
    }
    float _2074 = _2010;
    float _2076 = _2016;
    float _2078 = _2004;
    float _2080 = _1874;
    float _2082 = _2078;
    float _2084 = _2080;
    if (_1992)
    {
        _207 = _2074;
    }
    float _2086 = _207;
    float _2088 = _2086;
    if (_1992)
    {
        _209 = _2076;
    }
    float _2090 = _209;
    float _2092 = _2090;
    if (!_1992)
    {
        float _2094 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _2096 = _996 + _2094;
        float _2098 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _2100 = _990 + _2098;
        float _2102 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _2104 = -_990;
        float _2106 = _2104 + _2078;
        float _2108 = _2096 * _2096;
        float _2110 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _2112 = _1000 + _2110;
        float _2114 = -_996;
        float _2116 = _2114 + _2074;
        float _2118 = -_1000;
        float _2120 = _2118 + _2076;
        float _2122 = fma(_2100, _2100, _2108);
        float _2124 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _2126 = fma(_2112, _2112, _2122);
        float _2128 = sqrt(_2126);
        float _2130 = _2102 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _2132 = precise::min(_2128, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _2134 = _2132 * _2124;
        float _2136 = _2130 * _2134;
        float _2138 = fma(_2106, _2136, _990);
        float _2140 = fma(_2116, _2136, _996);
        float _2142 = fma(_2120, _2136, _1000);
        _2088 = _2140;
        _2082 = _2138;
        _2092 = _2142;
        _1998 = _2136;
    }
    float _2144 = _2088;
    float _2146 = _2082;
    float _2148 = _2092;
    float _2150 = _1998;
    float _2152 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2154 = _2144 + _2152;
    float _2156 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2158 = _2146 + _2156;
    float _2160 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2162 = _2148 + _2160;
    float _2164 = _2154 * _2154;
    float _2166 = fma(_2158, _2158, _2164);
    float _2168 = fma(_2162, _2162, _2166);
    float _2170 = rsqrt(_2168);
    float _2172 = sqrt(_2168);
    float _2174 = _2170 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _2176 = _2158 * _2174;
    float _2178 = _2162 * _2174;
    float _2180 = _2176 * _2176;
    float _2182 = _2178 * _2178;
    float _2184 = _2180 + _2182;
    float _2186 = sqrt(_2184);
    bool _2188 = _2186 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2190 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2192 = _2186 + _2190;
    float _2194 = _2170;
    float _2196 = _2192;
    float _2198 = _2150;
    float _2200 = _2154;
    if (_2188)
    {
        float _2202 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2194 = _2202;
    }
    float _2204 = _2194;
    if (_2188)
    {
        float _2206 = rsqrt(_2184);
        _2000 = _2206;
    }
    float _2208 = _2000;
    float _2210 = _2208;
    if (_2188)
    {
        float _2212 = _2192 * _2204;
        _2196 = _2212;
    }
    float _2214 = _2196;
    if (_2188)
    {
        float _2216 = _2214 * 0.15915493667125701904296875;
        _2198 = _2216;
    }
    float _2218 = _2198;
    float _2220 = _2204;
    if (_2188)
    {
        float _2222 = _2218 * 6.283185482025146484375;
        float _2224 = sin(_2222);
        _2220 = _2224;
    }
    float _2226 = _2220;
    float _2228 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _2230 = precise::max(0.0, _2228);
    float _2232 = _2162;
    float _2234 = _2230;
    if (_2188)
    {
        float _2236 = _2218 * 6.283185482025146484375;
        float _2238 = cos(_2236);
        _2232 = _2238;
    }
    float _2240 = _2232;
    float _2242 = -_2174;
    float _2244 = -_2230;
    float _2246 = fma(_2154, _2242, _2244);
    float _2248 = _2246;
    if (_2188)
    {
        float _2250 = _2246 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2234 = _2250;
    }
    float _2252 = _2234;
    float _2254 = _2252;
    float _2256 = _2226;
    if (_2188)
    {
        float _2258 = fma(_2226, _2252, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _2254 = _2258;
    }
    float _2260 = _2254;
    float _2262 = _2260;
    if (!_2188)
    {
        _2256 = _2178;
    }
    float _2264 = _2256;
    float _2266 = fma(_990, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _2268 = _2264;
    float _2270 = _2240;
    if (_2188)
    {
        float _2272 = _2240 + (-1.0);
        _2200 = _2272;
    }
    float _2274 = _2200;
    float _2276 = _2274;
    if (_2188)
    {
        float _2278 = _2208 * _2260;
        _2084 = _2278;
    }
    float _2280 = _2084;
    if (!_2188)
    {
        _2210 = _2176;
    }
    float _2282 = _2210;
    float _2284 = _2282;
    if (_2188)
    {
        float _2286 = _2274 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2276 = _2286;
    }
    float _2288 = _2276;
    if (_2188)
    {
        float _2290 = _2176 * _2280;
        _2284 = _2290;
    }
    float _2292 = _2284;
    if (!_2188)
    {
        _2262 = _2180;
    }
    float _2294 = _2262;
    float _2296 = _2294;
    if (_2188)
    {
        float _2298 = _2178 * _2280;
        _2268 = _2298;
    }
    float _2300 = _2268;
    if (_2188)
    {
        float _2302 = fma(_2246, _2240, _2288);
        _2248 = _2302;
    }
    float _2304 = _2248;
    if (_2188)
    {
        float _2306 = _2292 * _2292;
        _2296 = _2306;
    }
    float _2308 = _2296;
    if (!_2188)
    {
        _2270 = _2182;
    }
    float _2310 = _2270;
    float _2312 = _2310;
    if (_2188)
    {
        float _2314 = _2300 * _2300;
        _2312 = _2314;
    }
    float _2316 = _2312;
    float _2318 = _2144 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _2320 = fma(_2304, _2304, _2308);
    float _2322 = floor(_2266);
    float _2324 = fma(_2146, (*spvDescriptorSet0.vp_c8)._m0[2].x, _2318);
    float _2326 = _2320 + _2316;
    float _2328 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _2330 = fma(_2172, (*spvDescriptorSet0.vp_c15)._m0[23].w, _2328);
    float _2332 = precise::clamp(_2330, 0.0, 1.0);
    float _2334 = fma(_2148, (*spvDescriptorSet0.vp_c8)._m0[2].z, _2324);
    float _2336 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _2338 = -_2332;
    float _2340 = _2338 + 1.0;
    float _2342 = rsqrt(_2326);
    float _2344 = _2334 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _2346 = fma(_1000, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _2348 = _2144 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _2350 = _2344 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _2352 = abs(_2340);
    float _2354 = log2(_2352);
    float _2356 = _2144 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2358 = -_2350;
    float _2360 = fma(_2358, _2336, 1.0);
    float _2362 = _2144 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2364 = fma(_2146, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2356);
    float _2366 = fma(_2146, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2362);
    float _2368 = _2342 * _2292;
    float _2370 = fma(_2148, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2364);
    float _2372 = _2342 * _2304;
    float _2374 = fma(_2148, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2366);
    float _2376 = _2368 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _2378 = _2370 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _2380 = _2342 * _2300;
    float _2382 = fma(_2146, (*spvDescriptorSet0.vp_c8)._m0[3].x, _2348);
    float _2384 = -_2376;
    float _2386 = fma(_2372, (*spvDescriptorSet0.vp_c15)._m0[21].y, _2384);
    float _2388 = _2374 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2390 = _2378 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _2392 = floor(_2346);
    float _2394 = -_2380;
    float _2396 = fma(_2394, (*spvDescriptorSet0.vp_c15)._m0[21].z, _2386);
    float _2398 = fma(_2148, (*spvDescriptorSet0.vp_c8)._m0[3].z, _2382);
    float _2400 = fma(_2388, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2390);
    float _2402 = _2354 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _2404 = -_2322;
    float _2406 = _2266 + _2404;
    float _2408 = _2398 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _2410 = fma(_2344, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2400);
    float _2412 = log2(_2360);
    float _2414 = fma(_2396, 0.5, 0.5);
    float _2416 = fma(_2408, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2410);
    float _2418 = _2378 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2420 = _2378 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2422 = -_2392;
    float _2424 = _2346 + _2422;
    float _2426 = exp2(_2402);
    float _2428 = fma(_2396, -0.5, 0.5);
    float _2430 = fma(_2414, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _2432 = fma(_2388, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2418);
    float _2434 = fma(_2388, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2420);
    float _2436 = _2372 + 1.0;
    float _2438 = fma(_2414, _2430, -0.212114393711090087890625);
    float _2440 = fma(_2344, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2432);
    float _2442 = 1.0 / _2416;
    float _2444 = fma(_2344, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2434);
    float2 _6677 = float2(_2406, _2424);
    float _2446 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_6677, float2(0.0), isnan(_6677)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_6677, float2(0.0), isnan(_6677)), level(0.0)).x;
    float _2448 = fma(_2414, _2438, 1.570728778839111328125);
    float _2450 = sqrt(_2428);
    float _2452 = -_2372;
    float _2454 = fma(_2426, _2436, _2452);
    float _2456 = _2412 * 0.693147182464599609375;
    float _2458 = fma(_2454, 0.5, 0.5);
    float _2460 = _2456 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _2462 = fma(_2408, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2440);
    float _2464 = fma(_2408, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2444);
    float _2466 = _2462 * _2442;
    float _2468 = _2464 * _2442;
    float _2470 = _2450 * 0.636619746685028076171875;
    float _2472 = fma(_2466, 0.5, 0.5);
    float _2474 = fma(_2468, -0.5, 0.5);
    float _2476 = -_2448;
    float _2478 = fma(_2470, _2476, 1.0);
    float3 _6737 = float3(_2472, _2474, _2460);
    float _2480 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_6737, float3(0.0), isnan(_6737)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_6737, float3(0.0), isnan(_6737)), level(0.0)).x;
    float3 _6748 = float3(_2472, _2474, _2460);
    float4 _2483 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_6748, float3(0.0), isnan(_6748)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_6748, float3(0.0), isnan(_6748)), level(0.0)).xyzw;
    float _2485 = _2483.x;
    float _2487 = _2483.y;
    float _2489 = _2483.z;
    float _2491 = _2483.w;
    float2 _6764 = float2(_2478, _2458);
    float3 _2495 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_6764, float2(0.0), isnan(_6764)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_6764, float2(0.0), isnan(_6764)), level(0.0)).xyz;
    float _2497 = _2495.x;
    float _2499 = _2495.y;
    float _2501 = _2495.z;
    float _2503 = _996 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    bool _2505 = _2172 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _2507 = isnan(_2172);
    bool _2509 = _2505 || _2507;
    bool _2511 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _2513 = _2509 || _2511;
    float _2515 = fma(_990, (*spvDescriptorSet0.vp_c8)._m0[11].x, _2503);
    float _2517 = fma(_1000, (*spvDescriptorSet0.vp_c8)._m0[11].z, _2515);
    float _2519 = _996 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _2521 = _2517 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _2523 = fma(_990, (*spvDescriptorSet0.vp_c8)._m0[10].x, _2519);
    float _2525 = 1.0 / _2521;
    float _2527 = fma(_1000, (*spvDescriptorSet0.vp_c8)._m0[10].z, _2523);
    float _2529 = _2527 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _2531 = _2529 + _2521;
    float _2533 = _2531 * _2525;
    float _2535 = _2533 * 0.5;
    float _2537 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _2539 = fma(_2535, (*spvDescriptorSet0.vp_c8)._m0[30].w, _2537);
    float _2541 = 1.0 / _2539;
    float _2543 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _2545 = _2541 * _2543;
    float _2547 = abs(_2545);
    float _2549 = log2(_2547);
    float _2551 = _2549 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _2553 = _2378 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _2555 = _2354 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _2557 = exp2(_2551);
    float _2559 = fma(_2388, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2553);
    float _2561 = fma(_2344, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2559);
    float _2563 = exp2(_2555);
    float _2565 = fma(_2408, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2561);
    bool _2567 = _2545 <= 8000.0;
    bool _2569 = isnan(_2545);
    bool _2571 = _2567 || _2569;
    bool _2573 = isnan(8000.0);
    bool _2575 = _2571 || _2573;
    float _2577 = float(_2575);
    float _2579 = fma(_2557, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _2581 = precise::clamp(_2579, 0.0, 1.0);
    float _2583 = in.m_76.x;
    float _2585 = fma(_2581, -2.0, 3.0);
    float _2587 = _2581 * _2581;
    float _2589 = -_2563;
    float _2591 = _2589 + 1.0;
    float _2593 = _2587 * _2585;
    float _2595 = _2591 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _2597 = -_2593;
    float _2599 = _2597 + 1.0;
    float _2601 = fma(_2599, (*spvDescriptorSet0.vp_c15)._m0[654].w, _2593);
    float _2603 = _2565 + _2416;
    float _2605 = _2577 * _2601;
    out.gl_Position.x = _2462;
    out.gl_Position.y = _2464;
    out.gl_Position.z = _2565;
    out.gl_Position.w = _2416;
    float _2607 = _2603 * 0.5;
    float _2609 = _2605 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _2611 = _2603;
    float _2613 = _2416;
    float _2615 = _2565;
    float _2617 = _2464;
    if (!_2513)
    {
        _2611 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _2619 = _2611;
    out.m_78.z = _2607;
    out.m_78.w = _2416;
    float _2621 = -_2595;
    float _2623 = _2621 + 1.0;
    float _2625 = _2623;
    float _2627 = _2619;
    float _2629 = _2619;
    if (!_2513)
    {
        _2613 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _2631 = _2613;
    float _2633 = _2631;
    float _2635 = _2631;
    if (!_2513)
    {
        _2615 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _2637 = _2615;
    float _2639 = _2637;
    float _2641 = _2637;
    if (!_2513)
    {
        _2617 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _2643 = _2617;
    float _2645 = -_2446;
    float _2647 = _2645 + 1.0;
    float _2649 = _2647 * _2609;
    float _2651 = precise::clamp(_2649, 0.0, 1.0);
    float _2653 = -_2651;
    float _2655 = fma(_2653, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _2657 = _2655 * _2583;
    float _2659 = _2657 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    out.m_80.x = _2659;
    float _2661 = _2595 * _2480;
    float _2663 = _2491 * _2623;
    float _2665 = _2485;
    float _2667 = _2643;
    float _2669 = _2643;
    if (!_2513)
    {
        _2625 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _2671 = _2625;
    float _2673 = _2491 * _2661;
    float _2675 = _2501 * _2661;
    float _2677 = fma(_2497, _2673, _2485);
    float _2679 = fma(_2499, _2673, _2487);
    float _2681 = fma(_2491, _2675, _2489);
    float _2683 = _2671;
    float _2685 = _2671;
    if (!_2513)
    {
        _2665 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _2687 = _2665;
    out.m_82.x = _2677;
    out.m_82.y = _2679;
    out.m_82.z = _2681;
    out.m_82.w = _2663;
    bool _2689 = !_2513;
    float _2691 = _2687;
    float _2693 = _2687;
    if (!_2689)
    {
        bool _2695 = _2172 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _2697 = isnan(_2172);
        bool _2699 = _2695 || _2697;
        bool _2701 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _2703 = _2699 || _2701;
        if (!_2703)
        {
            float _2705 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2707 = _2172 + _2705;
            float _2709 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2711 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _2709;
            float _2713 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _2715 = _2713 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _2717 = 1.0 / _2711;
            float _2719 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _2721 = _2719 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _2723 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _2725 = _2723 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _2727 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _2729 = _2727 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _2731 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _2733 = _2731 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _2735 = _2707 * _2717;
            float _2737 = precise::clamp(_2735, 0.0, 1.0);
            float _2739 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _2741 = _2739 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _2743 = fma(_2737, _2715, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _2745 = fma(_2737, _2741, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _2747 = fma(_2737, _2721, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _2749 = fma(_2737, _2725, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _2751 = fma(_2737, _2729, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _2753 = fma(_2737, _2733, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _2635 = _2747;
            _2685 = _2751;
            _2693 = _2743;
            _2669 = _2749;
            _2641 = _2745;
            _2629 = _2753;
            _2755 = true;
        }
        else
        {
            bool _2757 = _2172 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _2759 = isnan(_2172);
            bool _2761 = _2757 || _2759;
            bool _2763 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _2765 = _2761 || _2763;
            if (!_2765)
            {
                _2691 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _2767 = _2691;
            _2693 = _2767;
            if (!_2765)
            {
                _2633 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _2769 = _2633;
            _2635 = _2769;
            if (!_2765)
            {
                _2639 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _2771 = _2639;
            _2641 = _2771;
            if (!_2765)
            {
                _2667 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _2773 = _2667;
            _2669 = _2773;
            if (!_2765)
            {
                _2683 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _2775 = _2683;
            _2685 = _2775;
            if (!_2765)
            {
                _2627 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _2777 = _2627;
            bool _2779 = !_2765;
            _2629 = _2777;
            if (!_2779)
            {
                bool _2781 = _2172 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _2783 = isnan(_2172);
                bool _2785 = _2781 || _2783;
                bool _2787 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _2789 = _2785 || _2787;
                if (!_2789)
                {
                    float _2791 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2793 = _2172 + _2791;
                    float _2795 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2797 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _2795;
                    float _2799 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _2801 = _2799 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _2803 = 1.0 / _2797;
                    float _2805 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _2807 = _2805 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _2809 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _2811 = _2809 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _2813 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _2815 = _2813 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _2817 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _2819 = _2817 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _2821 = _2793 * _2803;
                    float _2823 = precise::clamp(_2821, 0.0, 1.0);
                    float _2825 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _2827 = _2825 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _2829 = fma(_2823, _2801, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _2831 = fma(_2823, _2827, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _2833 = fma(_2823, _2807, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _2835 = fma(_2823, _2811, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _2837 = fma(_2823, _2815, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _2839 = fma(_2823, _2819, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _2635 = _2833;
                    _2685 = _2837;
                    _2693 = _2829;
                    _2669 = _2835;
                    _2641 = _2831;
                    _2629 = _2839;
                    _2755 = true;
                }
                else
                {
                    _2635 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _2685 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _2693 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _2669 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _2641 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _2629 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _2755 = false;
    float _2841 = _2635;
    float _2843 = _2685;
    float _2845 = _2693;
    float _2847 = _2669;
    float _2849 = _2641;
    float _2851 = _2629;
    float _2853 = fma(_1832, -0.5, 0.5);
    float _2855 = precise::clamp(_2853, 0.0, 1.0);
    float _2857 = -_2841;
    float _2859 = _2857 + _2843;
    float _2861 = -_2845;
    float _2863 = _2861 + _2847;
    float _2865 = -_2849;
    float _2867 = _2865 + _2851;
    bool _2869 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2871 = fma(_2855, _2859, _2841);
    float _2873 = fma(_2855, _2863, _2845);
    float _2875 = fma(_2855, _2867, _2849);
    float _2877 = _2871 * 0.586610972881317138671875;
    out.m_51.x = 1.0;
    float _2879 = fma(_2873, 0.298911988735198974609375, _2877);
    float _2881 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2883 = fma(_2875, 0.114477999508380889892578125, _2879);
    out.m_80.w = _2881;
    float _2885 = -_2883;
    float _2887 = _2873 + _2885;
    float _2889 = -_2883;
    float _2891 = _2871 + _2889;
    float _2893 = -_2883;
    float _2895 = _2875 + _2893;
    out.m_84.x = 0.0;
    float _2897 = fma(_2887, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2883);
    float _2899 = fma(_2891, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2883);
    float _2901 = fma(_2895, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2883);
    out.m_86.x = _2897;
    out.m_86.y = _2899;
    out.m_86.z = _2901;
    if (!_2869)
    {
        return out;
    }
    float _2903 = -_2144;
    float _2905 = _2903 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
    float _2907 = -_2146;
    float _2909 = _2907 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
    float _2911 = -_2148;
    float _2913 = _2911 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
    float _2915 = _2905 * _2905;
    float _2917 = fma(_2909, _2909, _2915);
    float _2919 = fma(_2913, _2913, _2917);
    float _2921 = sqrt(_2919);
    float _2923 = rsqrt(_2919);
    float _2925 = -_2921;
    float _2927 = _2925 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2929 = _2927 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
    float _2931 = precise::clamp(_2929, 0.0, 1.0);
    float _2933 = _2909 * _2923;
    float _2935 = _2905 * _2923;
    float _2937 = abs(_2931);
    float _2939 = log2(_2937);
    float _2941 = _2913 * _2923;
    float _2943 = _2933 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
    float _2945 = _1832 * _2935;
    float _2947 = -_2935;
    float _2949 = -_2943;
    float _2951 = fma(_2947, (*spvDescriptorSet0.vp_c15)._m0[656].y, _2949);
    float _2953 = fma(_1814, _2933, _2945);
    float _2955 = -_2941;
    float _2957 = fma(_2955, (*spvDescriptorSet0.vp_c15)._m0[656].z, _2951);
    float _2959 = fma(_1858, _2941, _2953);
    float _2961 = precise::clamp(_2959, 0.0, 1.0);
    float _2963 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
    float _2965 = _2957 + _2963;
    float _2967 = _2939 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
    float _2969 = _2965 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
    float _2971 = precise::clamp(_2969, 0.0, 1.0);
    float _2973 = exp2(_2967);
    float _2975 = _2973 * _2971;
    float _2977 = _2961 * _2975;
    float _2979 = _2977 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
    float _2981 = _2977 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
    float _2983 = _2977 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
    out.m_84.x = _2979;
    out.m_84.y = _2981;
    out.m_84.z = _2983;
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
    out.m_70 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_68 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_66 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_78 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_86 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_51 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_72 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_74 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_84 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_80 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_82 = float4(0.0, 0.0, 0.0, 1.0);
    bool _2755 = false;
    bool _1910 = false;
    bool _381 = false;
    bool _229 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _100 = in.m_48.w;
    float _102 = trunc(_100);
    int _105 = int(_102);
    bool _109 = _105 >= 1;
    float _111 = 0.0;
    if (!_109)
    {
        _111 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _113 = _111;
    float _115 = _113;
    if (!_109)
    {
        out.m_51.x = 0.0;
    }
    int _117 = 0;
    if (!_109)
    {
        float _119 = _113 * 5.0;
        _117 = as_type<int>(_119);
    }
    int _121 = _117;
    int _123 = _121;
    if (!_109)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3040 = as_type<float>(_121);
        out.gl_Position.z = _3040;
    }
    if (!_109)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _125 = in.m_53.w;
    bool _127 = _125 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _129 = isnan(_125);
    bool _131 = _127 || _129;
    bool _133 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _135 = _131 || _133;
    float _137 = -_125;
    float _139 = _137 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _141 = 0.0;
    float _143 = _139;
    if (_135)
    {
        float _145 = float(_105);
        _141 = _145;
    }
    float _147 = _141;
    bool _149 = _139 >= _147;
    bool _151 = !_135;
    bool _153 = _149 || _151;
    if (_153)
    {
        _115 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _155 = _115;
    if (_153)
    {
        out.m_51.x = 0.0;
    }
    if (_153)
    {
        float _157 = _155 * 5.0;
        _123 = as_type<int>(_157);
    }
    int _159 = _123;
    if (_153)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3109 = as_type<float>(_159);
        out.gl_Position.z = _3109;
    }
    if (_153)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _161 = as_type<float>(int(gl_VertexIndex));
    float _163 = in.m_58.x;
    float _165 = in.m_58.y;
    float _167 = in.m_58.z;
    int _169 = as_type<int>(_161) & 1;
    bool _171 = _169 != 0;
    int _173 = as_type<int>(_161) & 2;
    bool _175 = _173 != 0;
    bool _177 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _179 = _165 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _181 = _165 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _183 = _165 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    bool _185 = !_171;
    float _187 = _185 ? (-0.5) : 0.5;
    float _189 = fma(_163, (*spvDescriptorSet0.vp_c10)._m0[4].x, _179);
    float _191 = fma(_163, (*spvDescriptorSet0.vp_c10)._m0[5].x, _181);
    float _193 = fma(_163, (*spvDescriptorSet0.vp_c10)._m0[6].x, _183);
    bool _195 = !_175;
    float _197 = _195 ? (-0.5) : 0.5;
    float _199 = fma(_167, (*spvDescriptorSet0.vp_c10)._m0[4].z, _189);
    float _201 = fma(_167, (*spvDescriptorSet0.vp_c10)._m0[5].z, _191);
    float _203 = fma(_167, (*spvDescriptorSet0.vp_c10)._m0[6].z, _193);
    bool _205 = !_177;
    float _207 = _199;
    float _209 = _201;
    float _227;
    if (!_205)
    {
        float _211 = in.m_60.x;
        float _213 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _215 = _211 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _217 = fma(_215, (*spvDescriptorSet0.vp_c9)._m0[12].x, _139);
        float _219 = _217 * _213;
        float _221 = floor(_219);
        float _223 = -_221;
        float _225 = _219 + _223;
        _227 = _225;
        _229 = true;
    }
    else
    {
        float _231 = float(_105);
        float _233 = 1.0 / _231;
        float _235 = _139 * _233;
        _227 = _235;
    }
    _229 = false;
    float _237 = _227;
    float _239 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _241 = _237 + _239;
    bool _243 = _237 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _245 = isnan(_237);
    bool _247 = _243 || _245;
    bool _249 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _251 = _247 || _249;
    float _253 = float(_251);
    bool _255 = _237 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _257 = isnan(_237);
    bool _259 = _255 || _257;
    bool _261 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _263 = _259 || _261;
    float _265 = float(_263);
    float _267 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _269 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _267;
    float _271 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _273 = _271 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _275 = -_253;
    float _277 = _275 + 1.0;
    float _279 = 1.0 / _273;
    bool _281 = _237 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _283 = isnan(_237);
    bool _285 = _281 || _283;
    bool _287 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _289 = _285 || _287;
    float _291 = float(_289);
    float _293 = _265 * _277;
    float _295 = -_265;
    float _297 = _295 + 1.0;
    bool _299 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _301 = _291 * _297;
    float _303 = 1.0 / _269;
    float _305 = -_291;
    float _307 = _305 + 1.0;
    float _309 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _311 = _309 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _313 = _241 * _303;
    float _315 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _317 = _237 + _315;
    float _319 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _321 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _319;
    float _323 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _325 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _323;
    float _327 = _317 * _279;
    float _329 = fma(_321, _313, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _331 = fma(_325, _313, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _333 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _335 = _333 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _337 = fma(_311, _327, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _339 = _329 * _301;
    float _341 = _331 * _301;
    float _343 = fma(_335, _327, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _345 = fma(_307, (*spvDescriptorSet0.vp_c9)._m0[143].x, _339);
    float _347 = fma(_307, (*spvDescriptorSet0.vp_c9)._m0[143].y, _341);
    float _349 = fma(_343, _293, _345);
    float _351 = fma(_337, _293, _347);
    float _353 = fma(_253, (*spvDescriptorSet0.vp_c9)._m0[145].x, _349);
    float _355 = fma(_253, (*spvDescriptorSet0.vp_c9)._m0[145].y, _351);
    bool _357 = !_299;
    float _377;
    float _379;
    if (!_357)
    {
        float _359 = in.m_60.x;
        float _361 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _363 = float(_105);
        float _365 = _359 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _367 = fma(_365, (*spvDescriptorSet0.vp_c9)._m0[11].y, _139);
        float _369 = _367 * _361;
        float _371 = floor(_369);
        float _373 = -_371;
        float _375 = _369 + _373;
        _377 = _363;
        _379 = _375;
        _381 = true;
    }
    else
    {
        float _383 = float(_105);
        float _385 = 1.0 / _383;
        float _387 = _139 * _385;
        _377 = _383;
        _379 = _387;
    }
    _381 = false;
    float _389 = _377;
    float _391 = _379;
    float _393 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _395 = int(_393);
    float _397 = in.m_60.x;
    float _399 = in.m_60.y;
    float _401 = in.m_60.z;
    float _403 = in.m_60.w;
    float _405 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _197);
    float _407 = in.m_62.x;
    float _409 = in.m_62.y;
    float _411 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _413 = int(_411);
    float _415 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _417 = _415 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _419 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _421 = _419 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _423 = 1.0 / _389;
    float _425 = float(_395);
    float _427 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _429 = 1.0 / _425;
    float _431 = float(uint(_413));
    float _433 = _401 * 2.0;
    bool _435 = _403 > 0.5;
    float _437 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _439 = _353 * _407;
    float _441 = _399 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    int _443 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _445 = _443 != 0;
    int _447 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _449 = _447 != 0;
    int _451 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _453 = _451 != 0;
    float _455 = 1.0 / _431;
    float _457 = _397 * 2.0;
    int _459 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _461 = _459 != 0;
    float _463 = _355 * _409;
    bool _465 = !_445;
    int _467 = _465 ? 0 : 1;
    float _469 = fma(_441, -2.0, _427);
    int _471 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _473 = _471 != 0;
    float _475 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _477 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _475;
    float _479 = _429 * _139;
    int _481 = ~_413;
    int _483 = _481 + 1;
    float _485 = floor(_457);
    bool _487 = !_461;
    int _489 = _487 ? 0 : 1;
    float _491 = _397 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    bool _493 = !_473;
    int _495 = _493 ? 0 : 1;
    float _497 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    bool _499 = !_449;
    int _501 = _499 ? 0 : 1;
    float _503 = _401 + _397;
    int _505 = as_type<int>(_455) + (-2);
    float _507 = trunc(_479);
    int _509 = int(_507);
    int _511 = int(_435);
    int _513 = _175 ? 2 : 0;
    int _515 = _511 | _513;
    int _517 = _177 ? 4 : 0;
    int _519 = _515 | _517;
    int _521 = _461 ? 8 : 0;
    int _523 = _519 | _521;
    int _525 = _473 ? 16 : 0;
    int _527 = _523 | _525;
    int _529 = _449 ? 32 : 0;
    int _531 = _527 | _529;
    int _533 = _453 ? 64 : 0;
    int _535 = _531 | _533;
    int _537 = _535 & 1;
    float _539 = -_437;
    float _541 = fma(_491, 2.0, _539);
    bool _543 = _397 > 0.5;
    float _545 = fma(_397, (*spvDescriptorSet0.vp_c9)._m0[78].z, _497);
    bool _547 = !_453;
    int _549 = _547 ? 0 : 1;
    float _551 = -_139;
    float _553 = fma(_551, (*spvDescriptorSet0.vp_c9)._m0[76].x, _541);
    float _555 = float(_413);
    float _557 = 1.0 / _417;
    bool _559 = _485 > 0.0;
    bool _561 = _485 >= 0.0;
    bool _563 = isnan(_485);
    bool _565 = _561 || _563;
    bool _567 = isnan(0.0);
    bool _569 = _565 || _567;
    float _571 = -_187;
    int _573 = _543 ? as_type<int>(_571) : as_type<int>(_187);
    float _575 = 1.0 / _421;
    float _577 = float(uint(_509));
    float _579 = float(_509);
    int _581 = abs(_501);
    float _583 = as_type<float>(_505) * _577;
    bool _585 = _579 >= _555;
    bool _587 = isnan(_579);
    bool _589 = _585 || _587;
    bool _591 = isnan(_555);
    bool _593 = _589 || _591;
    float _595 = float(_593);
    float _597 = _477 * _557;
    float _599 = trunc(_583);
    float _601 = precise::max(_599, 0.0);
    uint _604 = uint(_601);
    float _606 = trunc(_595);
    int _608 = int(_606);
    int _610 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _612 = _610 != 0;
    int _614 = _483 * int(_604);
    int _616 = _614 + _509;
    float _618 = _399 * 2.0;
    bool _620 = !_612;
    float _622 = _620 ? 7.345489978790283203125 : 1.0;
    float _624 = float(uint(_616));
    float _626 = floor(_618);
    float _628 = as_type<float>(_505) * _624;
    float _630 = 0.0;
    if (!_612)
    {
        _630 = _399;
    }
    float _632 = _630;
    float _634 = 0.0;
    float _636 = _632;
    if (!_612)
    {
        _634 = _401;
    }
    float _638 = _634;
    float _640 = 0.0;
    float _642 = _638;
    if (!_612)
    {
        _640 = _401;
    }
    float _644 = _640;
    float _646 = trunc(_628);
    float _648 = precise::max(_646, 0.0);
    uint _650 = uint(_648);
    float _652 = _644;
    if (_612)
    {
        _636 = _397;
    }
    float _654 = _636;
    if (_612)
    {
        _642 = _399;
    }
    float _656 = _642;
    if (_612)
    {
        _652 = _399;
    }
    float _658 = _652;
    bool _660 = _626 > 0.0;
    float _662 = _656 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    bool _664 = _626 >= 0.0;
    bool _666 = isnan(_626);
    bool _668 = _664 || _666;
    bool _670 = isnan(0.0);
    bool _672 = _668 || _670;
    int _674 = _569 ? 0 : 1;
    bool _676 = _399 > 0.5;
    int _678 = _672 ? 0 : 1;
    int _680 = int(_604) + int(_650);
    int _682 = ~_413;
    int _684 = _682 + 1;
    int _686 = ~_674;
    int _688 = _686 + 1;
    int _690 = _688 + 1;
    int _692 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _694 = _692 != 0;
    int _696 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _698 = _696 != 0;
    int _700 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _702 = _700 != 0;
    int _704 = _684 * _680;
    int _706 = _704 + _509;
    int _708 = _690;
    if (!_559)
    {
        int _710 = ~_674;
        int _712 = _710 + 1;
        _708 = _712;
    }
    int _714 = _708;
    int _716 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _718 = _716 != 0;
    int _720 = ~_678;
    int _722 = _720 + 1;
    int _724 = _722 + 1;
    int _726 = _724;
    if (!_660)
    {
        int _728 = ~_678;
        int _730 = _728 + 1;
        _726 = _730;
    }
    int _732 = _726;
    bool _734 = !_718;
    float _736 = _734 ? _187 : as_type<float>(_573);
    bool _738 = uint(_706) >= uint(_413);
    float _740 = in.m_48.x;
    float _742 = in.m_48.y;
    float _744 = in.m_48.z;
    float _746 = -_197;
    int _748 = _676 ? as_type<int>(_746) : as_type<int>(_197);
    bool _750 = !_738;
    int _752 = _750 ? 0 : (-1);
    int _754 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _756 = _754 != 0;
    int _758 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _760 = _758 != 0;
    int _762 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _764 = _762 != 0;
    int _766 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _768 = _766 != 0;
    bool _770 = !_698;
    int _772 = _770 ? 0 : 1;
    bool _774 = _401 > 0.5;
    bool _776 = !_694;
    int _778 = _776 ? 0 : 1;
    int _780 = ~_680;
    int _782 = _780 + _752;
    int _784 = _782 + 1;
    int _786 = abs(_778);
    float _788 = fma(_139, (*spvDescriptorSet0.vp_c9)._m0[77].z, _545);
    float _790 = fma(_139, (*spvDescriptorSet0.vp_c9)._m0[76].y, _469);
    float _792 = _742 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _794 = _742 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _796 = _742 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _798 = float(_786);
    float _800 = fma(_740, (*spvDescriptorSet0.vp_c10)._m0[5].x, _792);
    float _802 = fma(_740, (*spvDescriptorSet0.vp_c10)._m0[6].x, _794);
    float _804 = fma(_740, (*spvDescriptorSet0.vp_c10)._m0[4].x, _796);
    float _806 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _808 = _806 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _810 = _555 * _139;
    float _812 = _399 + _401;
    float _814 = float(_732);
    float _816 = _808 * _575;
    float _818 = _810 * _423;
    float _820 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _822 = _399 + _397;
    float _824 = _399 + (-0.5);
    bool _826 = !_702;
    int _828 = _826 ? 0 : 1;
    float _830 = fma(_399, (*spvDescriptorSet0.vp_c9)._m0[78].w, _820);
    float _832 = _822 + (-1.0);
    float _834 = floor(_433);
    float _836 = _397 + (-0.5);
    float _838 = _622 * _397;
    float _840 = _503 + (-1.0);
    bool _842 = _537 != 0;
    float _844 = _401 + (-0.5);
    float _846 = fma(_832, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _848 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _850 = log2(_848);
    float _852 = _812 + (-1.0);
    float _854 = fma(_840, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _856 = _463 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _858 = fma(_852, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _860 = _439 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    bool _862 = _834 >= 0.0;
    bool _864 = isnan(_834);
    bool _866 = _862 || _864;
    bool _868 = isnan(0.0);
    bool _870 = _866 || _868;
    float _872 = _856 * _405;
    float _874 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _876 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _187);
    int _878 = _870 ? 0 : 1;
    float _880 = fma(_139, (*spvDescriptorSet0.vp_c9)._m0[77].w, _830);
    bool _882 = _834 > 0.0;
    float _884 = fma(_658, (*spvDescriptorSet0.vp_c9)._m0[83].w, _874);
    float _886 = floor(_838);
    float _888 = _850 * _139;
    float _890 = _860 * _876;
    float _892 = fma(_744, (*spvDescriptorSet0.vp_c10)._m0[4].z, _804);
    float _894 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _896 = exp2(_888);
    float _898 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    bool _900 = !_764;
    float _902 = _900 ? _197 : as_type<float>(_748);
    float _904 = fma(_654, (*spvDescriptorSet0.vp_c9)._m0[83].z, _894);
    float _906 = _654 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _908 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _910 = fma(_744, (*spvDescriptorSet0.vp_c10)._m0[5].z, _800);
    float _912 = fma(_139, (*spvDescriptorSet0.vp_c9)._m0[82].z, _904);
    float _914 = -_886;
    float _916 = _838 + _914;
    float _918 = -_898;
    float _920 = fma(_906, 2.0, _918);
    float _922 = fma(_662, -2.0, _908);
    float _924 = _916 * _555;
    int _926 = ~_878;
    int _928 = _926 + 1;
    int _930 = _928 + 1;
    float _932 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _934 = 1.0 + _932;
    int _936 = _930;
    if (!_882)
    {
        int _938 = ~_878;
        int _940 = _938 + 1;
        _936 = _940;
    }
    int _942 = _936;
    float _944 = -_896;
    float _946 = _944 + 1.0;
    bool _948 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _950 = isnan(0.0);
    bool _952 = _948 || _950;
    bool _954 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _956 = _952 || _954;
    float _958 = in.m_64.x;
    float _960 = in.m_64.y;
    float _962 = in.m_64.z;
    float _964 = fma(_139, (*spvDescriptorSet0.vp_c9)._m0[82].w, _884);
    float _966 = 1.0 / _934;
    float _968 = _956 ? _946 : 0.0;
    float _970 = -_139;
    float _972 = fma(_970, (*spvDescriptorSet0.vp_c9)._m0[81].x, _920);
    bool _974 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _976 = isnan(1.0);
    bool _978 = _974 || _976;
    bool _980 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _982 = _978 || _980;
    float _984 = fma(_139, (*spvDescriptorSet0.vp_c9)._m0[81].y, _922);
    float _986 = float(_942);
    float _988 = fma(_744, (*spvDescriptorSet0.vp_c10)._m0[6].z, _802);
    float _990 = _892 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _992 = trunc(_924);
    int _994 = int(_992);
    float _996 = _910 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _998 = _798 * _986;
    float _1000 = _988 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _1002 = _998 * (-2.0);
    if (_982)
    {
        float _1004 = _968 * _966;
        _143 = _1004;
    }
    float _1006 = _143;
    int _1008 = _413 * _784;
    int _1010 = _1008 + _509;
    bool _1012 = _413 == 0;
    float _1014 = trunc(_818);
    int _1016 = int(_1014);
    int _1018 = ~_608;
    int _1020 = _1018 + 1;
    int _1022 = _1020 + 1;
    bool _1024 = !_1012;
    int _1026 = _1024 ? _1010 : (-1);
    float _1028 = fma(_1002, _958, _958);
    int _1030 = abs(_495);
    float _1032 = fma(_846, _1002, _846);
    int _1034 = _413 + (-1);
    int _1036 = _1026 * _1022;
    int _1038 = abs(_467);
    int _1040 = _994 * _1030;
    int _1042 = _1040 + _509;
    float _1044 = fma(_836, (*spvDescriptorSet0.vp_c9)._m0[196].x, _1028);
    int _1046 = _608 * _1034;
    int _1048 = _1046 + _1036;
    int _1050 = abs(_772);
    float _1052 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    int _1054 = abs(_549);
    int _1056 = _1048 * _581;
    float _1058 = fma(_1032, _1006, _1044);
    int _1060 = ~_413;
    int _1062 = _1060 + 1;
    int _1064 = _1016 * _1038;
    int _1066 = _1064 + _1056;
    float _1068 = float(uint(_1042));
    float _1070 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    int _1072 = abs(_489);
    float _1074 = as_type<float>(_505) * _1068;
    float _1076 = _1058 * 0.15915493667125701904296875;
    float _1078 = float(_714);
    float _1080 = _1052 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _1082 = float(_1050);
    int _1084 = _1042 * _1054;
    int _1086 = _1084 + _1066;
    int _1088 = abs(_828);
    float _1090 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _1092 = _391 + _1090;
    float _1094 = trunc(_1074);
    float _1096 = precise::max(_1094, 0.0);
    uint _1098 = uint(_1096);
    float _1100 = _1082 * _1078;
    int _1102 = _994 * _1072;
    int _1104 = _1102 + _1086;
    float _1106 = fma(_597, _1092, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _1108 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _1110 = _391 + _1108;
    float _1112 = _1100 * (-2.0);
    float _1114 = float(_1088);
    float _1116 = _1070 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _1118 = float(uint(_1104));
    float _1120 = fma(_1112, _960, _960);
    float _1122 = fma(_858, _1112, _858);
    float _1124 = _1114 * _814;
    float _1126 = fma(_816, _1110, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _1128 = as_type<float>(_505) * _1118;
    float _1130 = fma(_824, (*spvDescriptorSet0.vp_c9)._m0[196].y, _1120);
    float _1132 = _1124 * (-2.0);
    bool _1134 = _391 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _1136 = isnan(_391);
    bool _1138 = _1134 || _1136;
    bool _1140 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _1142 = _1138 || _1140;
    float _1144 = float(_1142);
    float _1146 = _1076 * 6.283185482025146484375;
    float _1148 = sin(_1146);
    float _1150 = fma(_1122, _1006, _1130);
    float _1152 = fma(_1132, _962, _962);
    float _1154 = fma(_854, _1132, _854);
    bool _1156 = _391 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _1158 = isnan(_391);
    bool _1160 = _1156 || _1158;
    bool _1162 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _1164 = _1160 || _1162;
    float _1166 = float(_1164);
    float _1168 = _1150 * 0.15915493667125701904296875;
    float _1170 = fma(_844, (*spvDescriptorSet0.vp_c9)._m0[196].z, _1152);
    int _1172 = ~_413;
    int _1174 = _1172 + 1;
    float _1176 = trunc(_1128);
    float _1178 = precise::max(_1176, 0.0);
    uint _1180 = uint(_1178);
    float _1182 = -_1144;
    float _1184 = _1182 + 1.0;
    float _1186 = fma(_1154, _1006, _1170);
    bool _1188 = _391 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _1190 = isnan(_391);
    bool _1192 = _1188 || _1190;
    bool _1194 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _1196 = _1192 || _1194;
    float _1198 = float(_1196);
    float _1200 = -_1166;
    float _1202 = _1200 + 1.0;
    float _1204 = _1166 * _1184;
    int _1206 = ~_413;
    int _1208 = _1206 + 1;
    float _1210 = _1076 * 6.283185482025146484375;
    float _1212 = cos(_1210);
    float _1214 = 0.5 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    int _1216 = _1174 * int(_1180);
    int _1218 = _1216 + _1104;
    float _1220 = _1198 * _1202;
    float _1222 = _1186 * 0.15915493667125701904296875;
    float _1224 = _1168 * 6.283185482025146484375;
    float _1226 = sin(_1224);
    float _1228 = float(uint(_1218));
    float _1230 = _1106 * _1220;
    float _1232 = -_187;
    int _1234 = _774 ? as_type<int>(_1232) : as_type<int>(_187);
    int _1236 = _1208 * int(_1098);
    int _1238 = _1236 + _1042;
    float _1240 = _736 + 0.5;
    float _1242 = _1168 * 6.283185482025146484375;
    float _1244 = cos(_1242);
    float _1246 = float(uint(_1238));
    float _1248 = fma(_1240, (*spvDescriptorSet0.vp_c9)._m0[80].x, _553);
    float _1250 = as_type<float>(_505) * _1246;
    float _1252 = -_197;
    int _1254 = _842 ? as_type<int>(_1252) : as_type<int>(_197);
    float _1256 = _1222 * 6.283185482025146484375;
    float _1258 = cos(_1256);
    float _1260 = as_type<float>(_505) * _1228;
    float _1262 = _902 + (-0.5);
    float _1264 = -_1262;
    float _1266 = -_790;
    float _1268 = fma(_1264, (*spvDescriptorSet0.vp_c9)._m0[80].y, _1266);
    float _1270 = -_1198;
    float _1272 = _1270 + 1.0;
    float _1274 = trunc(_1260);
    float _1276 = precise::max(_1274, 0.0);
    uint _1278 = uint(_1276);
    bool _1280 = !_768;
    float _1282 = _1280 ? _187 : as_type<float>(_1234);
    float _1284 = fma(_1272, (*spvDescriptorSet0.vp_c9)._m0[115].x, _1230);
    bool _1286 = !_756;
    float _1288 = _1286 ? _197 : as_type<float>(_1254);
    float _1290 = _197 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _1292 = _1282 + 0.5;
    float _1294 = fma(_1126, _1204, _1284);
    float _1296 = trunc(_1250);
    float _1298 = precise::max(_1296, 0.0);
    uint _1300 = uint(_1298);
    float _1302 = _1288 + (-0.5);
    float _1304 = fma(_1080, _1292, _972);
    int _1306 = ~_413;
    int _1308 = _1306 + 1;
    float _1310 = _1148 * _1244;
    float _1312 = -_1116;
    float _1314 = -_984;
    float _1316 = fma(_1312, _1302, _1314);
    float _1318 = fma(_1144, (*spvDescriptorSet0.vp_c9)._m0[117].x, _1294);
    float _1320 = _1222 * 6.283185482025146484375;
    float _1322 = sin(_1320);
    int _1324 = int(_1180) + int(_1278);
    float _1326 = _1148 * _1226;
    float _1328 = _1148 * _1258;
    float _1330 = _1212 * _1244;
    float _1332 = _1244 * _1258;
    float _1334 = _1212 * _1226;
    float _1336 = _1212 * _1258;
    int _1338 = int(_1098) + int(_1300);
    int _1340 = _1308 * _1324;
    int _1342 = _1340 + _1104;
    float _1344 = _1226 * _1258;
    float _1346 = _1336 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1348 = _1336 * _872;
    int _1350 = _1062 * _1338;
    int _1352 = _1350 + _1042;
    bool _1354 = uint(_1342) >= uint(_413);
    float _1356 = _1336 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1358 = fma(_1322, _1330, _1326);
    float _1360 = fma(_1322, _1326, _1330);
    bool _1362 = !_1354;
    int _1364 = _1362 ? 0 : (-1);
    float _1366 = -_1334;
    float _1368 = fma(_1322, _1310, _1366);
    float _1370 = -_1310;
    float _1372 = fma(_1322, _1334, _1370);
    float _1374 = _1336 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    int _1376 = ~_1324;
    int _1378 = _1376 + _1364;
    int _1380 = _1378 + 1;
    float _1382 = -_1322;
    float _1384 = fma(_1382, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1356);
    float _1386 = -_872;
    float _1388 = _1322 * _1386;
    float _1390 = -_1322;
    float _1392 = fma(_1390, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1374);
    float _1394 = -_1322;
    float _1396 = fma(_1394, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1346);
    int _1398 = _413 * _1380;
    int _1400 = _1398 + _1104;
    float _1402 = fma(_1358, _890, _1348);
    float _1404 = fma(_1328, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1392);
    float _1406 = fma(_1332, _890, _1388);
    float _1408 = fma(_1328, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1384);
    bool _1410 = !_1012;
    int _1412 = _1410 ? _1400 : (-1);
    float _1414 = _1358 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1416 = _1358 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1418 = _1358 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    int _1420 = _1412 >> 31;
    float _1422 = _1328 * _872;
    float _1424 = fma(_1328, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1396);
    float _1426 = _1372 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    int _1428 = _1420 & 3;
    float _1430 = fma(_1368, _890, _1422);
    float _1432 = fma(_1344, _1214, _1406);
    float _1434 = _1372 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    int _1436 = _1412 + _1428;
    float _1438 = _1372 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1440 = fma(_1372, _1214, _1402);
    float _1442 = fma(_1332, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1414);
    int _1444 = _1436 >> 2;
    float _1446 = fma(_1332, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1416);
    float _1448 = fma(_1332, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1418);
    float _1450 = fma(_1344, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1426);
    float _1452 = fma(_1344, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1434);
    float _1454 = fma(_1344, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1438);
    int _1456 = _1444 << 4;
    int _1458 = _1456 + 368;
    float _1460 = fma(_1360, _1214, _1430);
    float _1462 = _1290 * _1404;
    float _1464 = _1440 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1466 = _1440 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    uint _1468 = uint(int(uint(_1458) >> uint(2)));
    uint _1470 = uint(int(uint(int(_1468)) >> uint(2)));
    int _1472 = int(_1468) & 3;
    float _1474 = (*spvDescriptorSet0.vp_c9)._m0[int(_1470)][_1472];
    int _1476 = int(_1468) + 1;
    uint _1478 = uint(int(uint(_1476) >> uint(2)));
    int _1480 = _1476 & 3;
    float _1482 = (*spvDescriptorSet0.vp_c9)._m0[int(_1478)][_1480];
    float _1484 = _1290 * _1408;
    float _1486 = fma(_1432, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1464);
    float _1488 = fma(_1432, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1466);
    bool _1490 = uint(_1352) >= uint(_413);
    float _1492 = _1290 * _1424;
    float _1494 = fma(_1460, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1486);
    float _1496 = fma(_1460, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1488);
    int _1498 = _1412 & 3;
    bool _1500 = _1498 != 0;
    float _1502 = fma(_1368, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1442);
    float _1504 = _1494 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _1506 = _1496 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _1508 = fma(_1368, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1446);
    float _1510 = fma(_1368, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1448);
    float _1512 = _990 + _1504;
    float _1514 = _1000 + _1506;
    int _1516 = _1412 & 3;
    bool _1518 = _1516 != 0;
    float _1520 = _1440 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    int _1522 = _1458 + 8;
    uint _1524 = uint(int(uint(_1522) >> uint(2)));
    uint _1526 = uint(int(uint(int(_1524)) >> uint(2)));
    int _1528 = int(_1524) & 3;
    float _1530 = (*spvDescriptorSet0.vp_c9)._m0[int(_1526)][_1528];
    int _1532 = int(_1524) + 1;
    uint _1534 = uint(int(uint(_1532) >> uint(2)));
    int _1536 = _1532 & 3;
    float _1538 = (*spvDescriptorSet0.vp_c9)._m0[int(_1534)][_1536];
    bool _1540 = uint(_1498) > 1u;
    float _1542 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1544 = _1512 + _1542;
    float _1546 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1548 = _1514 + _1546;
    bool _1550 = !_1490;
    int _1552 = _1550 ? 0 : (-1);
    float _1554 = fma(_1432, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1520);
    float _1556 = _1544 * _1544;
    float _1558 = _1548 * _1548;
    int _1560 = _1518 ? 0 : 1;
    float _1562 = fma(_1460, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1554);
    int _1564 = ~_1338;
    int _1566 = _1564 + _1552;
    int _1568 = _1566 + 1;
    float _1570 = _1556 + _1558;
    int _1572 = ~_1560;
    int _1574 = _1572 + 1;
    int _1576 = _1574 + 1;
    float _1578 = fma(_1360, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1450);
    int _1580 = _1576;
    float _1582 = _1556;
    float _1584 = _1558;
    float _1586 = _1514;
    float _1588 = _1318;
    if (!_1540)
    {
        int _1590 = ~_1560;
        int _1592 = _1590 + 1;
        _1580 = _1592;
    }
    int _1594 = _1580;
    float _1596 = sqrt(_1570);
    int _1598 = _413 * _1568;
    int _1600 = _1598 + _1042;
    bool _1602 = _1498 != 3;
    float _1604 = fma(_1360, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1452);
    int _1606 = abs(_1594);
    float _1608 = fma(_1360, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1454);
    bool _1610 = !_1500;
    int _1612 = _1610 ? 0 : 1;
    bool _1614 = uint(_1498) >= 2u;
    int _1616 = ~_1606;
    int _1618 = _1616 + 1;
    int _1620 = _1618 + 1;
    int _1622 = abs(_1612);
    int _1624 = _1614 ? 0 : 1;
    int _1626 = _1620 * as_type<int>(_1482);
    bool _1628 = _1596 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    int _1630 = ~_1622;
    int _1632 = _1630 + 1;
    int _1634 = _1632 + 1;
    bool _1636 = !_760;
    int _1638 = _1636 ? 0 : 1;
    bool _1640 = _1498 != 3;
    int _1642 = _1634 * as_type<int>(_1474);
    int _1644 = _1642 + _1626;
    int _1646 = ~_1624;
    int _1648 = _1646 + 1;
    int _1650 = _1648 + 1;
    float _1652 = _1562 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    int _1654 = _1650;
    if (_1602)
    {
        int _1656 = ~_1624;
        int _1658 = _1656 + 1;
        _1654 = _1658;
    }
    int _1660 = _1654;
    int _1662 = abs(_1638);
    float _1664 = _996 + _1652;
    bool _1666 = !_1640;
    float _1668 = _1666 ? 0.0 : as_type<float>(0xffffffffu /* nan */);
    int _1670 = abs(_1660);
    int _1672 = abs(as_type<int>(_1668));
    float _1674 = _1668;
    float _1676 = _1664;
    if (!_1628)
    {
        _1674 = _1512;
    }
    float _1678 = _1674;
    int _1680 = ~_1670;
    int _1682 = _1680 + 1;
    int _1684 = _1682 + 1;
    bool _1686 = !_1628;
    float _1688 = _1678;
    if (!_1686)
    {
        float _1690 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1692 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1694 = _1596 + _1692;
        float _1696 = rsqrt(_1570);
        float _1698 = _1694 * _1690;
        float _1700 = _1664 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1702 = _1698 * 0.15915493667125701904296875;
        float _1704 = _1702 * 6.283185482025146484375;
        float _1706 = sin(_1704);
        float _1708 = _1702 * 6.283185482025146484375;
        float _1710 = cos(_1708);
        float _1712 = fma(_1706, _1700, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1714 = _1696 * _1712;
        float _1716 = fma(_1544, _1714, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1718 = _1710 + (-1.0);
        float _1720 = fma(_1548, _1714, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _1722 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _1724 = _1716 + _1722;
        float _1726 = _1718 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1728 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _1730 = _1720 + _1728;
        float _1732 = _1724 * _1724;
        float _1734 = fma(_1664, _1710, _1726);
        float _1736 = _1730 * _1730;
        _1676 = _1734;
        _1582 = _1732;
        _1584 = _1736;
        _1688 = _1716;
        _1586 = _1720;
    }
    float _1738 = _1676;
    float _1740 = _1582;
    float _1742 = _1584;
    float _1744 = _1688;
    float _1746 = _1586;
    int _1748 = _1684 * as_type<int>(_1530);
    int _1750 = _1748 + _1644;
    int _1752 = ~_1672;
    int _1754 = _1752 + 1;
    int _1756 = _1754 + 1;
    float _1758 = _187 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    int _1760 = ~_1662;
    int _1762 = _1760 + 1;
    int _1764 = _1762 + 1;
    float _1766 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _1768 = _1738 + _1766;
    bool _1770 = !_1012;
    int _1772 = _1770 ? _1600 : (-1);
    int _1774 = _1756 * as_type<int>(_1538);
    int _1776 = _1774 + _1750;
    float _1778 = fma(_1758, _1502, _1462);
    float _1780 = fma(_1768, _1768, _1740);
    float _1782 = -_964;
    float _1784 = _1782 + 1.0;
    int _1786 = _1776 * _1764;
    float _1788 = -_788;
    float _1790 = _1788 + 1.0;
    float _1792 = _1780 + _1742;
    float _1794 = fma(_1758, _1508, _1484);
    int _1796 = _1772 * _1662;
    int _1798 = _1796 + _1786;
    float _1800 = -_880;
    float _1802 = _1800 + 1.0;
    float _1804 = fma(_1758, _1510, _1492);
    float _1806 = -_1790;
    float _1808 = fma(_736, _1806, _1248);
    float _1810 = fma(_1288, _1784, _1316);
    float _1812 = fma(_902, _1802, _1268);
    float _1814 = _1578 + _1778;
    float _1816 = sqrt(_1792);
    float _1818 = -_912;
    float _1820 = _1818 + 1.0;
    float _1822 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _1824 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _1826 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1828 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1830 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1832 = _1604 + _1794;
    float _1834 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1836 = float(_1798);
    float _1838 = -_1820;
    float _1840 = fma(_1282, _1838, _1304);
    float _1842 = (*spvDescriptorSet0.vp_c9)._m0[131].x * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _1844 = _1822 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1846 = _1824 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1848 = _1828 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1850 = _1830 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1852 = _1834 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1854 = _1826 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1856 = _1318 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _1858 = _1608 + _1804;
    out.m_66.x = _1808;
    out.m_66.y = _1812;
    out.m_66.z = _1840;
    out.m_66.w = _1810;
    bool _1860 = _1816 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _1862 = isnan(_1816);
    bool _1864 = _1860 || _1862;
    bool _1866 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _1868 = _1864 || _1866;
    out.m_68.x = _1848;
    out.m_68.y = _1850;
    out.m_68.z = _1852;
    out.m_68.w = _1842;
    out.m_70.x = _1844;
    out.m_70.y = _1846;
    out.m_70.z = _1854;
    out.m_70.w = _1856;
    out.m_72.x = _1836;
    float _1870 = _1808;
    float _1872 = _1840;
    float _1874 = _1854;
    if (!_1868)
    {
        _1588 = 1.0;
    }
    float _1876 = _1588;
    out.m_74.x = _1814;
    out.m_74.y = _1832;
    out.m_74.z = _1858;
    bool _1878 = !_1868;
    float _1880 = _1876;
    if (!_1878)
    {
        bool _1882 = _1816 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _1884 = isnan(_1816);
        bool _1886 = _1882 || _1884;
        bool _1888 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _1890 = _1886 || _1888;
        if (!_1890)
        {
            float _1892 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1894 = _1816 + _1892;
            float _1896 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1898 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _1896;
            float _1900 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _1902 = _1900 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _1904 = 1.0 / _1898;
            float _1906 = _1894 * _1904;
            float _1908 = fma(_1906, _1902, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _1880 = _1908;
            _1870 = _1898;
            _1910 = true;
        }
        else
        {
            bool _1912 = _1816 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _1914 = isnan(_1816);
            bool _1916 = _1912 || _1914;
            bool _1918 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _1920 = _1916 || _1918;
            if (!_1920)
            {
                float _1922 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1924 = _1816 + _1922;
                float _1926 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1928 = _1926 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _1930 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _1932 = _1930 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _1934 = 1.0 / _1928;
                float _1936 = _1924 * _1934;
                float _1938 = fma(_1936, _1932, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _1880 = _1938;
                _1870 = _1928;
                _1910 = true;
            }
            else
            {
                _1880 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _1910 = false;
    float _1940 = _1880;
    float _1942 = _1870;
    float _1944 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _1946 = _1738 + _1944;
    float _1948 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _1950 = _1744 + _1948;
    float _1952 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _1954 = _1746 + _1952;
    float _1956 = fma(_1946, _1940, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _1958 = fma(_1950, _1940, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _1960 = fma(_1954, _1940, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _1962 = -_996;
    float _1964 = _1962 + _1956;
    float _1966 = -_990;
    float _1968 = _1966 + _1958;
    float _1970 = -_1000;
    float _1972 = _1970 + _1960;
    float _1974 = _1964 * _1964;
    float _1976 = fma(_1968, _1968, _1974);
    float _1978 = fma(_1972, _1972, _1976);
    float _1980 = sqrt(_1978);
    bool _1982 = _1980 > 0.0;
    bool _1984 = (*spvDescriptorSet0.vp_c15)._m0[660].y >= 0.5;
    bool _1986 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1988 = _1984 || _1986;
    bool _1990 = isnan(0.5);
    bool _1992 = _1988 || _1990;
    float _1994 = (*spvDescriptorSet0.vp_c15)._m0[660].y;
    float _1996 = _1942;
    float _1998 = _1958;
    float _2000 = _1972;
    if (!_1982)
    {
        _1994 = _1958;
    }
    float _2002 = _1994;
    float _2004 = _2002;
    if (!_1982)
    {
        _1872 = _1956;
    }
    float _2006 = _1872;
    float _2008 = _2006;
    float _2010 = _2006;
    if (!_1982)
    {
        _1996 = _1960;
    }
    float _2012 = _1996;
    bool _2014 = !_1982;
    float _2016 = _2012;
    if (!_2014)
    {
        float _2018 = _201 * _201;
        float _2020 = fma(_199, _199, _2018);
        float _2022 = rsqrt(_1978);
        float _2024 = fma(_203, _203, _2020);
        float _2026 = sqrt(_2024);
        float _2028 = _1968 * _2022;
        float _2030 = _1964 * _2022;
        float _2032 = _1972 * _2022;
        bool _2034 = _2026 > 0.0;
        float _2036 = _2022;
        float _2038 = _2026;
        _1874 = _2032;
        if (!_2034)
        {
            _2036 = _1958;
        }
        float _2040 = _2036;
        _2004 = _2040;
        if (!_2034)
        {
            _2008 = _1956;
        }
        float _2042 = _2008;
        _2010 = _2042;
        if (!_2034)
        {
            _2038 = _1960;
        }
        float _2044 = _2038;
        bool _2046 = !_2034;
        _2016 = _2044;
        if (!_2046)
        {
            float _2048 = rsqrt(_2024);
            float _2050 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].z;
            float _2052 = _201 * _2048;
            float _2054 = _199 * _2048;
            float _2056 = _203 * _2048;
            float _2058 = _2030 * _2052;
            float _2060 = fma(_2028, _2054, _2058);
            float _2062 = _2050 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _2064 = fma(_2032, _2056, _2060);
            float _2066 = _2064 * _2062;
            float _2068 = fma(_199, _2066, _1958);
            float _2070 = fma(_201, _2066, _1956);
            float _2072 = fma(_203, _2066, _1960);
            _2010 = _2070;
            _2016 = _2072;
            _2004 = _2068;
        }
    }
    float _2074 = _2010;
    float _2076 = _2016;
    float _2078 = _2004;
    float _2080 = _1874;
    float _2082 = _2078;
    float _2084 = _2080;
    if (_1992)
    {
        _207 = _2074;
    }
    float _2086 = _207;
    float _2088 = _2086;
    if (_1992)
    {
        _209 = _2076;
    }
    float _2090 = _209;
    float _2092 = _2090;
    if (!_1992)
    {
        float _2094 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _2096 = _996 + _2094;
        float _2098 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _2100 = _990 + _2098;
        float _2102 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _2104 = -_990;
        float _2106 = _2104 + _2078;
        float _2108 = _2096 * _2096;
        float _2110 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _2112 = _1000 + _2110;
        float _2114 = -_996;
        float _2116 = _2114 + _2074;
        float _2118 = -_1000;
        float _2120 = _2118 + _2076;
        float _2122 = fma(_2100, _2100, _2108);
        float _2124 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _2126 = fma(_2112, _2112, _2122);
        float _2128 = sqrt(_2126);
        float _2130 = _2102 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _2132 = precise::min(_2128, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _2134 = _2132 * _2124;
        float _2136 = _2130 * _2134;
        float _2138 = fma(_2106, _2136, _990);
        float _2140 = fma(_2116, _2136, _996);
        float _2142 = fma(_2120, _2136, _1000);
        _2088 = _2140;
        _2082 = _2138;
        _2092 = _2142;
        _1998 = _2136;
    }
    float _2144 = _2088;
    float _2146 = _2082;
    float _2148 = _2092;
    float _2150 = _1998;
    float _2152 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2154 = _2144 + _2152;
    float _2156 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2158 = _2146 + _2156;
    float _2160 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2162 = _2148 + _2160;
    float _2164 = _2154 * _2154;
    float _2166 = fma(_2158, _2158, _2164);
    float _2168 = fma(_2162, _2162, _2166);
    float _2170 = rsqrt(_2168);
    float _2172 = sqrt(_2168);
    float _2174 = _2170 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _2176 = _2158 * _2174;
    float _2178 = _2162 * _2174;
    float _2180 = _2176 * _2176;
    float _2182 = _2178 * _2178;
    float _2184 = _2180 + _2182;
    float _2186 = sqrt(_2184);
    bool _2188 = _2186 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2190 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2192 = _2186 + _2190;
    float _2194 = _2170;
    float _2196 = _2192;
    float _2198 = _2150;
    float _2200 = _2154;
    if (_2188)
    {
        float _2202 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2194 = _2202;
    }
    float _2204 = _2194;
    if (_2188)
    {
        float _2206 = rsqrt(_2184);
        _2000 = _2206;
    }
    float _2208 = _2000;
    float _2210 = _2208;
    if (_2188)
    {
        float _2212 = _2192 * _2204;
        _2196 = _2212;
    }
    float _2214 = _2196;
    if (_2188)
    {
        float _2216 = _2214 * 0.15915493667125701904296875;
        _2198 = _2216;
    }
    float _2218 = _2198;
    float _2220 = _2204;
    if (_2188)
    {
        float _2222 = _2218 * 6.283185482025146484375;
        float _2224 = sin(_2222);
        _2220 = _2224;
    }
    float _2226 = _2220;
    float _2228 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _2230 = precise::max(0.0, _2228);
    float _2232 = _2162;
    float _2234 = _2230;
    if (_2188)
    {
        float _2236 = _2218 * 6.283185482025146484375;
        float _2238 = cos(_2236);
        _2232 = _2238;
    }
    float _2240 = _2232;
    float _2242 = -_2174;
    float _2244 = -_2230;
    float _2246 = fma(_2154, _2242, _2244);
    float _2248 = _2246;
    if (_2188)
    {
        float _2250 = _2246 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2234 = _2250;
    }
    float _2252 = _2234;
    float _2254 = _2252;
    float _2256 = _2226;
    if (_2188)
    {
        float _2258 = fma(_2226, _2252, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _2254 = _2258;
    }
    float _2260 = _2254;
    float _2262 = _2260;
    if (!_2188)
    {
        _2256 = _2178;
    }
    float _2264 = _2256;
    float _2266 = fma(_990, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _2268 = _2264;
    float _2270 = _2240;
    if (_2188)
    {
        float _2272 = _2240 + (-1.0);
        _2200 = _2272;
    }
    float _2274 = _2200;
    float _2276 = _2274;
    if (_2188)
    {
        float _2278 = _2208 * _2260;
        _2084 = _2278;
    }
    float _2280 = _2084;
    if (!_2188)
    {
        _2210 = _2176;
    }
    float _2282 = _2210;
    float _2284 = _2282;
    if (_2188)
    {
        float _2286 = _2274 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2276 = _2286;
    }
    float _2288 = _2276;
    if (_2188)
    {
        float _2290 = _2176 * _2280;
        _2284 = _2290;
    }
    float _2292 = _2284;
    if (!_2188)
    {
        _2262 = _2180;
    }
    float _2294 = _2262;
    float _2296 = _2294;
    if (_2188)
    {
        float _2298 = _2178 * _2280;
        _2268 = _2298;
    }
    float _2300 = _2268;
    if (_2188)
    {
        float _2302 = fma(_2246, _2240, _2288);
        _2248 = _2302;
    }
    float _2304 = _2248;
    if (_2188)
    {
        float _2306 = _2292 * _2292;
        _2296 = _2306;
    }
    float _2308 = _2296;
    if (!_2188)
    {
        _2270 = _2182;
    }
    float _2310 = _2270;
    float _2312 = _2310;
    if (_2188)
    {
        float _2314 = _2300 * _2300;
        _2312 = _2314;
    }
    float _2316 = _2312;
    float _2318 = _2144 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _2320 = fma(_2304, _2304, _2308);
    float _2322 = floor(_2266);
    float _2324 = fma(_2146, (*spvDescriptorSet0.vp_c8)._m0[2].x, _2318);
    float _2326 = _2320 + _2316;
    float _2328 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _2330 = fma(_2172, (*spvDescriptorSet0.vp_c15)._m0[23].w, _2328);
    float _2332 = precise::clamp(_2330, 0.0, 1.0);
    float _2334 = fma(_2148, (*spvDescriptorSet0.vp_c8)._m0[2].z, _2324);
    float _2336 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _2338 = -_2332;
    float _2340 = _2338 + 1.0;
    float _2342 = rsqrt(_2326);
    float _2344 = _2334 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _2346 = fma(_1000, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _2348 = _2144 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _2350 = _2344 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _2352 = abs(_2340);
    float _2354 = log2(_2352);
    float _2356 = _2144 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2358 = -_2350;
    float _2360 = fma(_2358, _2336, 1.0);
    float _2362 = _2144 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2364 = fma(_2146, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2356);
    float _2366 = fma(_2146, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2362);
    float _2368 = _2342 * _2292;
    float _2370 = fma(_2148, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2364);
    float _2372 = _2342 * _2304;
    float _2374 = fma(_2148, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2366);
    float _2376 = _2368 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _2378 = _2370 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _2380 = _2342 * _2300;
    float _2382 = fma(_2146, (*spvDescriptorSet0.vp_c8)._m0[3].x, _2348);
    float _2384 = -_2376;
    float _2386 = fma(_2372, (*spvDescriptorSet0.vp_c15)._m0[21].y, _2384);
    float _2388 = _2374 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2390 = _2378 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _2392 = floor(_2346);
    float _2394 = -_2380;
    float _2396 = fma(_2394, (*spvDescriptorSet0.vp_c15)._m0[21].z, _2386);
    float _2398 = fma(_2148, (*spvDescriptorSet0.vp_c8)._m0[3].z, _2382);
    float _2400 = fma(_2388, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2390);
    float _2402 = _2354 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _2404 = -_2322;
    float _2406 = _2266 + _2404;
    float _2408 = _2398 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _2410 = fma(_2344, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2400);
    float _2412 = log2(_2360);
    float _2414 = fma(_2396, 0.5, 0.5);
    float _2416 = fma(_2408, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2410);
    float _2418 = _2378 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2420 = _2378 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2422 = -_2392;
    float _2424 = _2346 + _2422;
    float _2426 = exp2(_2402);
    float _2428 = fma(_2396, -0.5, 0.5);
    float _2430 = fma(_2414, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _2432 = fma(_2388, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2418);
    float _2434 = fma(_2388, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2420);
    float _2436 = _2372 + 1.0;
    float _2438 = fma(_2414, _2430, -0.212114393711090087890625);
    float _2440 = fma(_2344, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2432);
    float _2442 = 1.0 / _2416;
    float _2444 = fma(_2344, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2434);
    float2 _6677 = float2(_2406, _2424);
    float _2446 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_6677, float2(0.0), isnan(_6677)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_6677, float2(0.0), isnan(_6677)), level(0.0)).x;
    float _2448 = fma(_2414, _2438, 1.570728778839111328125);
    float _2450 = sqrt(_2428);
    float _2452 = -_2372;
    float _2454 = fma(_2426, _2436, _2452);
    float _2456 = _2412 * 0.693147182464599609375;
    float _2458 = fma(_2454, 0.5, 0.5);
    float _2460 = _2456 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _2462 = fma(_2408, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2440);
    float _2464 = fma(_2408, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2444);
    float _2466 = _2462 * _2442;
    float _2468 = _2464 * _2442;
    float _2470 = _2450 * 0.636619746685028076171875;
    float _2472 = fma(_2466, 0.5, 0.5);
    float _2474 = fma(_2468, -0.5, 0.5);
    float _2476 = -_2448;
    float _2478 = fma(_2470, _2476, 1.0);
    float3 _6737 = float3(_2472, _2474, _2460);
    float _2480 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_6737, float3(0.0), isnan(_6737)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_6737, float3(0.0), isnan(_6737)), level(0.0)).x;
    float3 _6748 = float3(_2472, _2474, _2460);
    float4 _2483 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_6748, float3(0.0), isnan(_6748)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_6748, float3(0.0), isnan(_6748)), level(0.0)).xyzw;
    float _2485 = _2483.x;
    float _2487 = _2483.y;
    float _2489 = _2483.z;
    float _2491 = _2483.w;
    float2 _6764 = float2(_2478, _2458);
    float3 _2495 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_6764, float2(0.0), isnan(_6764)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_6764, float2(0.0), isnan(_6764)), level(0.0)).xyz;
    float _2497 = _2495.x;
    float _2499 = _2495.y;
    float _2501 = _2495.z;
    float _2503 = _996 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    bool _2505 = _2172 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _2507 = isnan(_2172);
    bool _2509 = _2505 || _2507;
    bool _2511 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _2513 = _2509 || _2511;
    float _2515 = fma(_990, (*spvDescriptorSet0.vp_c8)._m0[11].x, _2503);
    float _2517 = fma(_1000, (*spvDescriptorSet0.vp_c8)._m0[11].z, _2515);
    float _2519 = _996 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _2521 = _2517 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _2523 = fma(_990, (*spvDescriptorSet0.vp_c8)._m0[10].x, _2519);
    float _2525 = 1.0 / _2521;
    float _2527 = fma(_1000, (*spvDescriptorSet0.vp_c8)._m0[10].z, _2523);
    float _2529 = _2527 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _2531 = _2529 + _2521;
    float _2533 = _2531 * _2525;
    float _2535 = _2533 * 0.5;
    float _2537 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _2539 = fma(_2535, (*spvDescriptorSet0.vp_c8)._m0[30].w, _2537);
    float _2541 = 1.0 / _2539;
    float _2543 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _2545 = _2541 * _2543;
    float _2547 = abs(_2545);
    float _2549 = log2(_2547);
    float _2551 = _2549 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _2553 = _2378 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _2555 = _2354 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _2557 = exp2(_2551);
    float _2559 = fma(_2388, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2553);
    float _2561 = fma(_2344, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2559);
    float _2563 = exp2(_2555);
    float _2565 = fma(_2408, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2561);
    bool _2567 = _2545 <= 8000.0;
    bool _2569 = isnan(_2545);
    bool _2571 = _2567 || _2569;
    bool _2573 = isnan(8000.0);
    bool _2575 = _2571 || _2573;
    float _2577 = float(_2575);
    float _2579 = fma(_2557, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _2581 = precise::clamp(_2579, 0.0, 1.0);
    float _2583 = in.m_76.x;
    float _2585 = fma(_2581, -2.0, 3.0);
    float _2587 = _2581 * _2581;
    float _2589 = -_2563;
    float _2591 = _2589 + 1.0;
    float _2593 = _2587 * _2585;
    float _2595 = _2591 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _2597 = -_2593;
    float _2599 = _2597 + 1.0;
    float _2601 = fma(_2599, (*spvDescriptorSet0.vp_c15)._m0[654].w, _2593);
    float _2603 = _2565 + _2416;
    float _2605 = _2577 * _2601;
    out.gl_Position.x = _2462;
    out.gl_Position.y = _2464;
    out.gl_Position.z = _2565;
    out.gl_Position.w = _2416;
    float _2607 = _2603 * 0.5;
    float _2609 = _2605 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _2611 = _2603;
    float _2613 = _2416;
    float _2615 = _2565;
    float _2617 = _2464;
    if (!_2513)
    {
        _2611 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _2619 = _2611;
    out.m_78.z = _2607;
    out.m_78.w = _2416;
    float _2621 = -_2595;
    float _2623 = _2621 + 1.0;
    float _2625 = _2623;
    float _2627 = _2619;
    float _2629 = _2619;
    if (!_2513)
    {
        _2613 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _2631 = _2613;
    float _2633 = _2631;
    float _2635 = _2631;
    if (!_2513)
    {
        _2615 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _2637 = _2615;
    float _2639 = _2637;
    float _2641 = _2637;
    if (!_2513)
    {
        _2617 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _2643 = _2617;
    float _2645 = -_2446;
    float _2647 = _2645 + 1.0;
    float _2649 = _2647 * _2609;
    float _2651 = precise::clamp(_2649, 0.0, 1.0);
    float _2653 = -_2651;
    float _2655 = fma(_2653, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _2657 = _2655 * _2583;
    float _2659 = _2657 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    out.m_80.x = _2659;
    float _2661 = _2595 * _2480;
    float _2663 = _2491 * _2623;
    float _2665 = _2485;
    float _2667 = _2643;
    float _2669 = _2643;
    if (!_2513)
    {
        _2625 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _2671 = _2625;
    float _2673 = _2491 * _2661;
    float _2675 = _2501 * _2661;
    float _2677 = fma(_2497, _2673, _2485);
    float _2679 = fma(_2499, _2673, _2487);
    float _2681 = fma(_2491, _2675, _2489);
    float _2683 = _2671;
    float _2685 = _2671;
    if (!_2513)
    {
        _2665 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _2687 = _2665;
    out.m_82.x = _2677;
    out.m_82.y = _2679;
    out.m_82.z = _2681;
    out.m_82.w = _2663;
    bool _2689 = !_2513;
    float _2691 = _2687;
    float _2693 = _2687;
    if (!_2689)
    {
        bool _2695 = _2172 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _2697 = isnan(_2172);
        bool _2699 = _2695 || _2697;
        bool _2701 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _2703 = _2699 || _2701;
        if (!_2703)
        {
            float _2705 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2707 = _2172 + _2705;
            float _2709 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2711 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _2709;
            float _2713 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _2715 = _2713 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _2717 = 1.0 / _2711;
            float _2719 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _2721 = _2719 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _2723 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _2725 = _2723 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _2727 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _2729 = _2727 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _2731 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _2733 = _2731 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _2735 = _2707 * _2717;
            float _2737 = precise::clamp(_2735, 0.0, 1.0);
            float _2739 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _2741 = _2739 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _2743 = fma(_2737, _2715, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _2745 = fma(_2737, _2741, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _2747 = fma(_2737, _2721, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _2749 = fma(_2737, _2725, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _2751 = fma(_2737, _2729, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _2753 = fma(_2737, _2733, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _2635 = _2747;
            _2685 = _2751;
            _2693 = _2743;
            _2669 = _2749;
            _2641 = _2745;
            _2629 = _2753;
            _2755 = true;
        }
        else
        {
            bool _2757 = _2172 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _2759 = isnan(_2172);
            bool _2761 = _2757 || _2759;
            bool _2763 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _2765 = _2761 || _2763;
            if (!_2765)
            {
                _2691 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _2767 = _2691;
            _2693 = _2767;
            if (!_2765)
            {
                _2633 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _2769 = _2633;
            _2635 = _2769;
            if (!_2765)
            {
                _2639 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _2771 = _2639;
            _2641 = _2771;
            if (!_2765)
            {
                _2667 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _2773 = _2667;
            _2669 = _2773;
            if (!_2765)
            {
                _2683 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _2775 = _2683;
            _2685 = _2775;
            if (!_2765)
            {
                _2627 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _2777 = _2627;
            bool _2779 = !_2765;
            _2629 = _2777;
            if (!_2779)
            {
                bool _2781 = _2172 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _2783 = isnan(_2172);
                bool _2785 = _2781 || _2783;
                bool _2787 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _2789 = _2785 || _2787;
                if (!_2789)
                {
                    float _2791 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2793 = _2172 + _2791;
                    float _2795 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2797 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _2795;
                    float _2799 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _2801 = _2799 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _2803 = 1.0 / _2797;
                    float _2805 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _2807 = _2805 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _2809 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _2811 = _2809 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _2813 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _2815 = _2813 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _2817 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _2819 = _2817 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _2821 = _2793 * _2803;
                    float _2823 = precise::clamp(_2821, 0.0, 1.0);
                    float _2825 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _2827 = _2825 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _2829 = fma(_2823, _2801, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _2831 = fma(_2823, _2827, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _2833 = fma(_2823, _2807, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _2835 = fma(_2823, _2811, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _2837 = fma(_2823, _2815, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _2839 = fma(_2823, _2819, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _2635 = _2833;
                    _2685 = _2837;
                    _2693 = _2829;
                    _2669 = _2835;
                    _2641 = _2831;
                    _2629 = _2839;
                    _2755 = true;
                }
                else
                {
                    _2635 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _2685 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _2693 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _2669 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _2641 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _2629 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _2755 = false;
    float _2841 = _2635;
    float _2843 = _2685;
    float _2845 = _2693;
    float _2847 = _2669;
    float _2849 = _2641;
    float _2851 = _2629;
    float _2853 = fma(_1832, -0.5, 0.5);
    float _2855 = precise::clamp(_2853, 0.0, 1.0);
    float _2857 = -_2841;
    float _2859 = _2857 + _2843;
    float _2861 = -_2845;
    float _2863 = _2861 + _2847;
    float _2865 = -_2849;
    float _2867 = _2865 + _2851;
    bool _2869 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2871 = fma(_2855, _2859, _2841);
    float _2873 = fma(_2855, _2863, _2845);
    float _2875 = fma(_2855, _2867, _2849);
    float _2877 = _2871 * 0.586610972881317138671875;
    out.m_51.x = 1.0;
    float _2879 = fma(_2873, 0.298911988735198974609375, _2877);
    float _2881 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2883 = fma(_2875, 0.114477999508380889892578125, _2879);
    out.m_80.w = _2881;
    float _2885 = -_2883;
    float _2887 = _2873 + _2885;
    float _2889 = -_2883;
    float _2891 = _2871 + _2889;
    float _2893 = -_2883;
    float _2895 = _2875 + _2893;
    out.m_84.x = 0.0;
    float _2897 = fma(_2887, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2883);
    float _2899 = fma(_2891, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2883);
    float _2901 = fma(_2895, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2883);
    out.m_86.x = _2897;
    out.m_86.y = _2899;
    out.m_86.z = _2901;
    if (!_2869)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _2903 = -_2144;
    float _2905 = _2903 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
    float _2907 = -_2146;
    float _2909 = _2907 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
    float _2911 = -_2148;
    float _2913 = _2911 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
    float _2915 = _2905 * _2905;
    float _2917 = fma(_2909, _2909, _2915);
    float _2919 = fma(_2913, _2913, _2917);
    float _2921 = sqrt(_2919);
    float _2923 = rsqrt(_2919);
    float _2925 = -_2921;
    float _2927 = _2925 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2929 = _2927 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
    float _2931 = precise::clamp(_2929, 0.0, 1.0);
    float _2933 = _2909 * _2923;
    float _2935 = _2905 * _2923;
    float _2937 = abs(_2931);
    float _2939 = log2(_2937);
    float _2941 = _2913 * _2923;
    float _2943 = _2933 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
    float _2945 = _1832 * _2935;
    float _2947 = -_2935;
    float _2949 = -_2943;
    float _2951 = fma(_2947, (*spvDescriptorSet0.vp_c15)._m0[656].y, _2949);
    float _2953 = fma(_1814, _2933, _2945);
    float _2955 = -_2941;
    float _2957 = fma(_2955, (*spvDescriptorSet0.vp_c15)._m0[656].z, _2951);
    float _2959 = fma(_1858, _2941, _2953);
    float _2961 = precise::clamp(_2959, 0.0, 1.0);
    float _2963 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
    float _2965 = _2957 + _2963;
    float _2967 = _2939 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
    float _2969 = _2965 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
    float _2971 = precise::clamp(_2969, 0.0, 1.0);
    float _2973 = exp2(_2967);
    float _2975 = _2973 * _2971;
    float _2977 = _2961 * _2975;
    float _2979 = _2977 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
    float _2981 = _2977 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
    float _2983 = _2977 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
    out.m_84.x = _2979;
    out.m_84.y = _2981;
    out.m_84.z = _2983;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

