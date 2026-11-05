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
    texture2d<float> vp_t_tcb_28 [[id(6)]];
    sampler vp_t_tcb_28Smplr [[id(7)]];
    texture2d<float> vp_t_tcb_24 [[id(8)]];
    sampler vp_t_tcb_24Smplr [[id(9)]];
    texture3d<float> vp_t_tcb_32 [[id(10)]];
    sampler vp_t_tcb_32Smplr [[id(11)]];
    texture3d<float> vp_t_tcb_30 [[id(12)]];
    sampler vp_t_tcb_30Smplr [[id(13)]];
    texture2d<float> vp_t_tcb_1C [[id(14)]];
    sampler vp_t_tcb_1CSmplr [[id(15)]];
    sampler vp_t_tcb_28Smplr_w [[id(16)]];
    sampler vp_t_tcb_24Smplr_w [[id(17)]];
    sampler vp_t_tcb_32Smplr_w [[id(18)]];
    sampler vp_t_tcb_30Smplr_w [[id(19)]];
    sampler vp_t_tcb_1CSmplr_w [[id(20)]];
    constant dm_border_t* dm_border [[id(21)]];
};

struct main0_out
{
    float4 m_74 [[user(locn0)]];
    float4 m_76 [[user(locn1)]];
    float4 m_82 [[user(locn2)]];
    float4 m_86 [[user(locn3)]];
    float4 m_94 [[user(locn4)]];
    float4 m_51 [[user(locn5)]];
    float4 m_80 [[user(locn6)]];
    float4 m_84 [[user(locn7)]];
    float4 m_72 [[user(locn8)]];
    float4 m_78 [[user(locn9)]];
    float4 m_92 [[user(locn10)]];
    float4 m_90 [[user(locn11)]];
    float4 m_88 [[user(locn12)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_66 [[attribute(0)]];
    float4 m_57 [[attribute(1)]];
    float4 m_55 [[attribute(2)]];
    float4 m_59 [[attribute(3)]];
    float4 m_68 [[attribute(4)]];
    float4 m_48 [[attribute(5)]];
    float4 m_53 [[attribute(6)]];
    float4 m_64 [[attribute(7)]];
    float4 m_70 [[attribute(8)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_74 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_76 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_82 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_86 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_94 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_51 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_80 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_84 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_72 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_78 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_92 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_90 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_88 = float4(0.0, 0.0, 0.0, 1.0);
    bool _3745 = false;
    bool _367 = false;
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
        float _4030 = as_type<float>(_129);
        out.gl_Position.z = _4030;
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
        float _4099 = as_type<float>(_167);
        out.gl_Position.z = _4099;
    }
    if (_161)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _169 = in.m_55.x;
    float _171 = in.m_55.y;
    float _173 = in.m_55.z;
    float _175 = in.m_57.x;
    float _177 = in.m_57.y;
    float _179 = in.m_57.z;
    float _181 = in.m_59.x;
    float _183 = in.m_59.y;
    float _185 = in.m_59.z;
    float _187 = as_type<float>(int(gl_VertexIndex));
    float _189 = _169 * _169;
    float _191 = _171 * _171;
    float _193 = _173 * _173;
    float _195 = fma(_175, _175, _189);
    float _197 = fma(_177, _177, _191);
    float _199 = fma(_179, _179, _193);
    float _201 = fma(_181, _181, _195);
    float _203 = fma(_183, _183, _197);
    float _205 = fma(_185, _185, _199);
    float _207 = sqrt(_201);
    float _209 = sqrt(_203);
    bool _211 = _207 > 0.0;
    float _213 = sqrt(_205);
    bool _215 = _209 > 0.0;
    float _217 = _201;
    float _219 = _203;
    int _221 = as_type<int>(_185);
    if (_211)
    {
        float _223 = rsqrt(_201);
        _217 = _223;
    }
    float _225 = _217;
    float _227 = 0.0;
    float _229 = 0.0;
    if (!_211)
    {
        _227 = 0.0;
        _229 = 0.0;
    }
    float _231 = _227;
    float _233 = _229;
    float _235 = 0.0;
    float _237 = _233;
    float _239 = _231;
    if (!_211)
    {
        _235 = 0.0;
    }
    float _241 = _235;
    bool _243 = _213 > 0.0;
    float _245 = 0.0;
    float _247 = _241;
    if (_215)
    {
        float _249 = rsqrt(_203);
        _245 = _249;
    }
    float _251 = _245;
    int _253 = as_type<int>(_187) & 1;
    bool _255 = _253 != 0;
    int _257 = as_type<int>(_187) & 2;
    bool _259 = _257 != 0;
    float _261 = 0.0;
    float _263 = 0.0;
    if (!_215)
    {
        _261 = 0.0;
        _263 = 0.0;
    }
    float _265 = _261;
    float _267 = _263;
    float _269 = 0.0;
    float _271 = _267;
    float _273 = _265;
    if (!_215)
    {
        _269 = 0.0;
    }
    float _275 = _269;
    bool _277 = !_255;
    float _279 = _277 ? (-0.5) : 0.5;
    float _281 = _275;
    if (_211)
    {
        float _283 = _225 * _169;
        _237 = _283;
    }
    float _285 = _237;
    if (_211)
    {
        float _287 = _225 * _175;
        _239 = _287;
    }
    float _289 = _239;
    float _291 = _209;
    if (_243)
    {
        float _293 = rsqrt(_205);
        _291 = _293;
    }
    float _295 = _291;
    if (_211)
    {
        float _297 = _225 * _181;
        _247 = _297;
    }
    float _299 = _247;
    bool _301 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _303 = 0.0;
    if (!_243)
    {
        _303 = 0.0;
    }
    float _305 = _303;
    float _307 = 0.0;
    float _309 = _305;
    if (!_243)
    {
        _307 = 0.0;
    }
    float _311 = _307;
    float _313 = _311;
    if (_215)
    {
        float _315 = _251 * _171;
        _271 = _315;
    }
    float _317 = _271;
    if (!_243)
    {
        _219 = 0.0;
    }
    float _319 = _219;
    float _321 = _319;
    if (_215)
    {
        float _323 = _251 * _177;
        _273 = _323;
    }
    float _325 = _273;
    if (_215)
    {
        float _327 = _251 * _183;
        _281 = _327;
    }
    float _329 = _281;
    bool _331 = !_259;
    float _333 = _331 ? (-0.5) : 0.5;
    if (_243)
    {
        float _335 = _295 * _173;
        _309 = _335;
    }
    float _337 = _309;
    if (_243)
    {
        float _339 = _295 * _179;
        _313 = _339;
    }
    float _341 = _313;
    if (_243)
    {
        float _343 = _295 * _185;
        _321 = _343;
    }
    float _345 = _321;
    bool _347 = !_301;
    float _365;
    if (!_347)
    {
        float _349 = in.m_64.x;
        float _351 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _353 = _349 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _355 = fma(_353, (*spvDescriptorSet0.vp_c9)._m0[12].x, _147);
        float _357 = _355 * _351;
        float _359 = floor(_357);
        float _361 = -_359;
        float _363 = _357 + _361;
        _365 = _363;
        _367 = true;
    }
    else
    {
        float _369 = float(_113);
        float _371 = 1.0 / _369;
        float _373 = _147 * _371;
        _365 = _373;
    }
    _367 = false;
    float _375 = _365;
    float _377 = in.m_48.x;
    float _379 = in.m_48.y;
    float _381 = in.m_48.z;
    float _383 = -(*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _385 = _375 + _383;
    float _387 = in.m_66.y;
    float _389 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _391 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _389;
    float _393 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _395 = _393 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _397 = in.m_64.x;
    float _399 = in.m_64.y;
    float _401 = in.m_64.z;
    float _403 = in.m_64.w;
    float _405 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _407 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _405;
    float _409 = 1.0 / _391;
    float _411 = -(*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _413 = (*spvDescriptorSet0.vp_c9)._m0[148].w + _411;
    float _415 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _417 = _415 + (*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _419 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _421 = _375 + _419;
    float _423 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _425 = _375 + _423;
    float _427 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _429 = _375 + _427;
    float _431 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _433 = _375 + _431;
    float _435 = 1.0 / _407;
    float _437 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _439 = in.m_57.w;
    bool _441 = _375 >= (*spvDescriptorSet0.vp_c9)._m0[147].w;
    bool _443 = isnan(_375);
    bool _445 = _441 || _443;
    bool _447 = isnan((*spvDescriptorSet0.vp_c9)._m0[147].w);
    bool _449 = _445 || _447;
    float _451 = float(_449);
    float _453 = _183 * _379;
    float _455 = _177 * _379;
    float _457 = 1.0 / _413;
    float _459 = -(*spvDescriptorSet0.vp_c9)._m0[149].w;
    float _461 = (*spvDescriptorSet0.vp_c9)._m0[150].w + _459;
    float _463 = _379 + _387;
    float _465 = fma(_175, _377, _455);
    float _467 = _397 * 2.0;
    int _469 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _471 = _469 != 0;
    float _473 = 1.0 / _395;
    float _475 = fma(_181, _377, _453);
    float _477 = _397 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _479 = fma(_179, _381, _465);
    float _481 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _483 = fma(_185, _381, _475);
    float _485 = float(_113);
    float _487 = -(*spvDescriptorSet0.vp_c9)._m0[149].w;
    float _489 = _375 + _487;
    float _491 = floor(_467);
    float _493 = -(*spvDescriptorSet0.vp_c9)._m0[148].w;
    float _495 = _493 + (*spvDescriptorSet0.vp_c9)._m0[149].w;
    float _497 = _399 * 2.0;
    float _499 = _385 * _457;
    if (_471)
    {
        _221 = 0;
    }
    int _501 = _221;
    float _503 = _425 * _435;
    int _505 = _501;
    if (!_471)
    {
        _505 = 1;
    }
    int _507 = _505;
    float _509 = _433 * _409;
    float _511 = 1.0 / _417;
    float _513 = _421 * _473;
    bool _515 = _507 != 1;
    float _517 = _479 + _439;
    bool _519 = _375 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _521 = isnan(_375);
    bool _523 = _519 || _521;
    bool _525 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _527 = _523 || _525;
    float _529 = float(_527);
    float _531 = floor(_497);
    float _533 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    bool _535 = _491 > 0.0;
    float _537 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _539 = _399 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _541 = 1.0 / _495;
    float _543 = as_type<float>(_507);
    if (!_515)
    {
        _543 = _399;
    }
    float _545 = _543;
    float _547 = -_537;
    float _549 = fma(_477, 2.0, _547);
    float _551 = fma(_539, -2.0, _437);
    float _553 = -(*spvDescriptorSet0.vp_c9)._m0[148].w;
    float _555 = _375 + _553;
    bool _557 = _491 >= 0.0;
    bool _559 = isnan(_491);
    bool _561 = _557 || _559;
    bool _563 = isnan(0.0);
    bool _565 = _561 || _563;
    float _567 = -_147;
    float _569 = fma(_567, (*spvDescriptorSet0.vp_c9)._m0[76].x, _549);
    float _571 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].y);
    int _573 = int(_571);
    float _575 = fma(_147, (*spvDescriptorSet0.vp_c9)._m0[76].y, _551);
    bool _577 = _531 > 0.0;
    float _579 = _429 * _511;
    bool _581 = _531 >= 0.0;
    bool _583 = isnan(_531);
    bool _585 = _581 || _583;
    bool _587 = isnan(0.0);
    bool _589 = _585 || _587;
    float _591 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    int _593 = _565 ? 0 : 1;
    float _595 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _597 = int(_595);
    float _599 = _545;
    if (_515)
    {
        _599 = _397;
    }
    float _601 = _599;
    float _603 = _555 * _541;
    int _605 = ~_593;
    int _607 = _605 + 1;
    int _609 = _607 + 1;
    float _611 = _397 + _399;
    int _613 = _609;
    float _615 = _601;
    if (!_535)
    {
        int _617 = ~_593;
        int _619 = _617 + 1;
        _613 = _619;
    }
    int _621 = _613;
    float _623 = fma(_601, (*spvDescriptorSet0.vp_c9)._m0[83].z, _591);
    if (!_515)
    {
        _615 = _401;
    }
    float _625 = _615;
    float _627 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _629 = log2(_627);
    float _631 = float(_573);
    float _633 = fma(_147, (*spvDescriptorSet0.vp_c9)._m0[82].z, _623);
    float _635 = as_type<float>(_573);
    float _637 = _625;
    if (!_515)
    {
        _635 = _399;
    }
    float _639 = _635;
    float _641 = _611 + (-1.0);
    float _643 = _639;
    if (_515)
    {
        _643 = _397;
    }
    float _645 = _643;
    if (_515)
    {
        _637 = _399;
    }
    float _647 = _637;
    float _649 = 1.0 / _461;
    float _651 = float(_597);
    float _653 = as_type<float>(_597);
    if (!_515)
    {
        _653 = _401;
    }
    float _655 = _653;
    float _657 = fma(_647, (*spvDescriptorSet0.vp_c9)._m0[83].w, _533);
    float _659 = _655;
    if (_515)
    {
        _659 = _399;
    }
    float _661 = _659;
    int _663 = _589 ? 0 : 1;
    float _665 = _629 * _147;
    float _667 = 1.0 / _651;
    float _669 = _401 * 2.0;
    int _671 = ~_663;
    int _673 = _671 + 1;
    int _675 = _673 + 1;
    float _677 = fma(_147, (*spvDescriptorSet0.vp_c9)._m0[82].w, _657);
    int _679 = _675;
    if (!_577)
    {
        int _681 = ~_663;
        int _683 = _681 + 1;
        _679 = _683;
    }
    int _685 = _679;
    float _687 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _689 = _489 * _649;
    float _691 = exp2(_665);
    float _693 = _645 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _695 = _661 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _697 = fma(_399, (*spvDescriptorSet0.vp_c9)._m0[78].w, _687);
    float _699 = fma(_695, -2.0, _481);
    float _701 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _703 = 1.0 + _701;
    float _705 = 1.0 / _485;
    bool _707 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _709 = isnan(1.0);
    bool _711 = _707 || _709;
    bool _713 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _715 = _711 || _713;
    float _717 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    bool _719 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _721 = isnan(0.0);
    bool _723 = _719 || _721;
    bool _725 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _727 = _723 || _725;
    float _729 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _731 = _401 + _397;
    float _733 = -_717;
    float _735 = fma(_693, 2.0, _733);
    float _737 = 1.0 / _631;
    float _739 = -_691;
    float _741 = _739 + 1.0;
    float _743 = fma(_397, (*spvDescriptorSet0.vp_c9)._m0[78].z, _729);
    float _745 = _667 * _147;
    float _747 = fma(_147, (*spvDescriptorSet0.vp_c9)._m0[77].w, _697);
    float _749 = -_147;
    float _751 = fma(_749, (*spvDescriptorSet0.vp_c9)._m0[81].x, _735);
    float _753 = _727 ? _741 : 0.0;
    float _755 = fma(_147, (*spvDescriptorSet0.vp_c9)._m0[77].z, _743);
    float _757 = 1.0 / _703;
    float _759 = _705 * _147;
    float _761 = fma(_147, (*spvDescriptorSet0.vp_c9)._m0[81].y, _699);
    float _763 = _731 + (-1.0);
    float _765 = fma(_763, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _767 = _737 * _147;
    float _769 = floor(_669);
    float _771 = _401 + _399;
    float _773 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _775 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _773;
    bool _777 = _375 >= (*spvDescriptorSet0.vp_c9)._m0[150].w;
    bool _779 = isnan(_375);
    bool _781 = _777 || _779;
    bool _783 = isnan((*spvDescriptorSet0.vp_c9)._m0[150].w);
    bool _785 = _781 || _783;
    float _787 = float(_785);
    float _789 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _791 = _789 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _793 = _771 + (-1.0);
    if (_715)
    {
        float _795 = _753 * _757;
        _151 = _795;
    }
    float _797 = _151;
    float _799 = fma(_793, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _801 = -_787;
    float _803 = _801 + 1.0;
    float _805 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[201].y;
    float _807 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _809 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _807;
    float _811 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _813 = _811 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _815 = -(*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _817 = (*spvDescriptorSet0.vp_c9)._m0[148].y + _815;
    bool _819 = _769 >= 0.0;
    bool _821 = isnan(_769);
    bool _823 = _819 || _821;
    bool _825 = isnan(0.0);
    bool _827 = _823 || _825;
    float _829 = fma(_809, _509, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _831 = fma(_775, _509, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _833 = fma(_813, _513, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _835 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _837 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _835;
    bool _839 = _375 >= (*spvDescriptorSet0.vp_c9)._m0[149].w;
    bool _841 = isnan(_375);
    bool _843 = _839 || _841;
    bool _845 = isnan((*spvDescriptorSet0.vp_c9)._m0[149].w);
    bool _847 = _843 || _845;
    float _849 = float(_847);
    float _851 = fma(_791, _513, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _853 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _855 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _853;
    bool _857 = _375 >= (*spvDescriptorSet0.vp_c9)._m0[148].w;
    bool _859 = isnan(_375);
    bool _861 = _857 || _859;
    bool _863 = isnan((*spvDescriptorSet0.vp_c9)._m0[148].w);
    bool _865 = _861 || _863;
    float _867 = float(_865);
    float _869 = -(*spvDescriptorSet0.vp_c9)._m0[146].x;
    float _871 = _869 + (*spvDescriptorSet0.vp_c9)._m0[147].x;
    int _873 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _875 = _873 != 0;
    int _877 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _879 = _877 != 0;
    int _881 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _883 = _881 != 0;
    float _885 = fma(_855, _503, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _887 = fma(_837, _503, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _889 = _849 * _803;
    float _891 = -_849;
    float _893 = _891 + 1.0;
    float _895 = -_867;
    float _897 = _895 + 1.0;
    bool _899 = !_879;
    int _901 = _899 ? 0 : 1;
    float _903 = -(*spvDescriptorSet0.vp_c9)._m0[146].y;
    float _905 = _903 + (*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _907 = _867 * _893;
    float _909 = _451 * _897;
    bool _911 = _769 > 0.0;
    float _913 = -_451;
    float _915 = _913 + 1.0;
    float _917 = fma(_871, _579, (*spvDescriptorSet0.vp_c9)._m0[146].x);
    float _919 = fma(_905, _579, (*spvDescriptorSet0.vp_c9)._m0[146].y);
    bool _921 = _375 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _923 = isnan(_375);
    bool _925 = _921 || _923;
    bool _927 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _929 = _925 || _927;
    float _931 = float(_929);
    float _933 = _529 * _915;
    bool _935 = _375 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _937 = isnan(_375);
    bool _939 = _935 || _937;
    bool _941 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _943 = _939 || _941;
    float _945 = float(_943);
    float _947 = -_529;
    float _949 = _947 + 1.0;
    bool _951 = _375 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _953 = isnan(_375);
    bool _955 = _951 || _953;
    bool _957 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _959 = _955 || _957;
    float _961 = float(_959);
    float _963 = in.m_59.w;
    int _965 = _827 ? 0 : 1;
    float _967 = -_945;
    float _969 = _967 + 1.0;
    int _971 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 256;
    bool _973 = _971 != 0;
    int _975 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 512;
    bool _977 = _975 != 0;
    int _979 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1024;
    bool _981 = _979 != 0;
    int _983 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2048;
    bool _985 = _983 != 0;
    float _987 = _961 * _949;
    float _989 = -_961;
    float _991 = _989 + 1.0;
    float _993 = -(*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _995 = (*spvDescriptorSet0.vp_c9)._m0[148].x + _993;
    int _997 = ~_965;
    int _999 = _997 + 1;
    int _1001 = _999 + 1;
    bool _1003 = !_875;
    int _1005 = _1003 ? 0 : 1;
    float _1007 = _945 * _991;
    int _1009 = _1001;
    if (!_911)
    {
        int _1011 = ~_965;
        int _1013 = _1011 + 1;
        _1009 = _1013;
    }
    int _1015 = _1009;
    float _1017 = fma(_995, _499, (*spvDescriptorSet0.vp_c9)._m0[147].x);
    bool _1019 = !_883;
    int _1021 = _1019 ? 0 : 1;
    float _1023 = -(*spvDescriptorSet0.vp_c9)._m0[148].x;
    float _1025 = _1023 + (*spvDescriptorSet0.vp_c9)._m0[149].x;
    int _1027 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _1029 = _1027 != 0;
    int _1031 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _1033 = _1031 != 0;
    int _1035 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _1037 = _1035 != 0;
    float _1039 = _931 * _969;
    float _1041 = fma(_817, _499, (*spvDescriptorSet0.vp_c9)._m0[147].y);
    float _1043 = -(*spvDescriptorSet0.vp_c9)._m0[148].y;
    float _1045 = _1043 + (*spvDescriptorSet0.vp_c9)._m0[149].y;
    float _1047 = -_931;
    float _1049 = _1047 + 1.0;
    bool _1051 = !_1029;
    int _1053 = _1051 ? 0 : 1;
    float _1055 = _829 * _1039;
    float _1057 = fma(_1025, _603, (*spvDescriptorSet0.vp_c9)._m0[148].x);
    float _1059 = fma(_1045, _603, (*spvDescriptorSet0.vp_c9)._m0[148].y);
    int _1061 = abs(_1053);
    float _1063 = _797 + (*spvDescriptorSet0.vp_c9)._m0[202].y;
    float _1065 = fma(_1049, (*spvDescriptorSet0.vp_c9)._m0[143].x, _1055);
    float _1067 = float(_1015);
    float _1069 = _831 * _1039;
    float _1071 = float(_1061);
    float _1073 = _1063 * _805;
    float _1075 = fma(_833, _1007, _1065);
    float _1077 = fma(_1049, (*spvDescriptorSet0.vp_c9)._m0[143].y, _1069);
    bool _1079 = !_1033;
    int _1081 = _1079 ? 0 : 1;
    float _1083 = _1071 * _1067;
    float _1085 = fma(_885, _987, _1075);
    float _1087 = fma(_397, (*spvDescriptorSet0.vp_c9)._m0[203].y, _1073);
    float _1089 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1091 = _463 + _1089;
    float _1093 = in.m_68.x;
    float _1095 = in.m_68.y;
    float _1097 = in.m_68.z;
    float _1099 = _483 + _963;
    float _1101 = fma(_851, _1007, _1077);
    bool _1103 = !_1037;
    int _1105 = _1103 ? 0 : 1;
    float _1107 = _1091 * _1091;
    float _1109 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1111 = _517 + _1109;
    int _1113 = abs(_1081);
    float _1115 = floor(_1087);
    int _1117 = abs(_1105);
    float _1119 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1121 = _1099 + _1119;
    float _1123 = fma(_1111, _1111, _1107);
    float _1125 = _1087 + 0.25;
    float _1127 = _1083 * (-2.0);
    float _1129 = fma(_1121, _1121, _1123);
    float _1131 = floor(_1125);
    float _1133 = fma(_887, _987, _1101);
    float _1135 = float(_621);
    float _1137 = fma(_917, _933, _1085);
    float _1139 = float(_1113);
    float _1141 = fma(_641, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _1143 = float(_685);
    float _1145 = rsqrt(_1129);
    float _1147 = float(_1117);
    float _1149 = _1139 * _1135;
    int _1151 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 32768;
    bool _1153 = _1151 != 0;
    float _1155 = _397 + (-0.5);
    bool _1157 = !_977;
    int _1159 = _1157 ? 0 : 1;
    float _1161 = _1147 * _1143;
    bool _1163 = !_973;
    int _1165 = _1163 ? 0 : 1;
    float _1167 = fma(_1127, _1093, _1093);
    int _1169 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 65536;
    bool _1171 = _1169 != 0;
    int _1173 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 131072;
    bool _1175 = _1173 != 0;
    float _1177 = -_1115;
    float _1179 = _1087 + _1177;
    float _1181 = _1087 * 6.283185482025146484375;
    float _1183 = fma(_1155, (*spvDescriptorSet0.vp_c9)._m0[196].x, _1167);
    float _1185 = -_1131;
    float _1187 = _1125 + _1185;
    bool _1189 = !_1171;
    int _1191 = _1189 ? 0 : 1;
    float _1193 = _1181 * 0.15915493667125701904296875;
    bool _1195 = _1179 >= 0.5;
    bool _1197 = isnan(_1179);
    bool _1199 = _1195 || _1197;
    bool _1201 = isnan(0.5);
    bool _1203 = _1199 || _1201;
    float _1205 = fma(_1141, _1127, _1141);
    int _1207 = abs(_1191);
    float _1209 = _1091 * _1145;
    bool _1211 = _1187 > 0.5;
    float _1213 = _1193 * 6.283185482025146484375;
    float _1215 = sin(_1213);
    bool _1217 = !_1153;
    int _1219 = _1217 ? 0 : 1;
    float _1221 = -_1209;
    float _1223 = fma(_1221, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1091);
    bool _1225 = !_1203;
    float _1227 = _1225 ? 0.5 : (-0.5);
    float _1229 = _1111 * _1145;
    int _1231 = abs(_1219);
    float _1233 = _1223 * _1223;
    float _1235 = float(_1207);
    float _1237 = _1227 * (*spvDescriptorSet0.vp_c9)._m0[200].y;
    float _1239 = _1237 * 2.0;
    float _1241 = -_1229;
    float _1243 = fma(_1241, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1111);
    bool _1245 = !_1175;
    int _1247 = _1245 ? 0 : 1;
    float _1249 = _1235 * _1239;
    float _1251 = _1187;
    float _1253 = _1229;
    if (_1211)
    {
        float _1255 = -_1187;
        float _1257 = _1255 + 1.0;
        _1251 = _1257;
    }
    float _1259 = _1251;
    float _1261 = _1121 * _1145;
    float _1263 = float(_1231);
    float _1265 = _1215 * (*spvDescriptorSet0.vp_c9)._m0[200].y;
    int _1267 = abs(_1247);
    float _1269 = fma(_1259, 4.0, -1.0);
    float _1271 = fma(_1243, _1243, _1233);
    float _1273 = -_1261;
    float _1275 = fma(_1273, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1121);
    float _1277 = float(_1267);
    float _1279 = fma(_1263, _1265, _1249);
    float _1281 = _1269 * (*spvDescriptorSet0.vp_c9)._m0[200].y;
    float _1283 = fma(_1275, _1275, _1271);
    float _1285 = _1161 * (-2.0);
    float _1287 = fma(_1205, _797, _1183);
    float _1289 = fma(_1277, _1281, _1279);
    float _1291 = _401 + (-0.5);
    float _1293 = fma(_765, _1285, _765);
    float _1295 = fma(_1285, _1097, _1097);
    float _1297 = fma(_1289, 3.1415927410125732421875, _1095);
    float _1299 = _1149 * (-2.0);
    float _1301 = fma(_919, _933, _1133);
    float _1303 = fma(_1291, (*spvDescriptorSet0.vp_c9)._m0[196].z, _1295);
    float _1305 = _399 + (-0.5);
    float _1307 = fma(_1297, _1299, _1297);
    float _1309 = fma(_799, _1299, _799);
    float _1311 = fma(_1017, _909, _1137);
    float _1313 = fma(_1305, (*spvDescriptorSet0.vp_c9)._m0[196].y, _1307);
    float _1315 = in.m_70.x;
    float _1317 = in.m_70.y;
    float _1319 = fma(_1041, _909, _1301);
    float _1321 = fma(_1309, _797, _1313);
    float _1323 = -(*spvDescriptorSet0.vp_c9)._m0[149].x;
    float _1325 = (*spvDescriptorSet0.vp_c9)._m0[150].x + _1323;
    float _1327 = -(*spvDescriptorSet0.vp_c9)._m0[149].y;
    float _1329 = (*spvDescriptorSet0.vp_c9)._m0[150].y + _1327;
    float _1331 = fma(_1293, _797, _1303);
    float _1333 = fma(_1059, _907, _1319);
    float _1335 = fma(_1325, _689, (*spvDescriptorSet0.vp_c9)._m0[149].x);
    float _1337 = fma(_1329, _689, (*spvDescriptorSet0.vp_c9)._m0[149].y);
    float _1339 = sqrt(_1283);
    float _1341 = fma(_1057, _907, _1311);
    float _1343 = _1287 * 0.15915493667125701904296875;
    float _1345 = fma(_1337, _889, _1333);
    float _1347 = _1331 * 0.15915493667125701904296875;
    float _1349 = fma(_1335, _889, _1341);
    float _1351 = _1321 * 0.15915493667125701904296875;
    float _1353 = fma(_787, (*spvDescriptorSet0.vp_c9)._m0[150].y, _1345);
    float _1355 = _1343 * 6.283185482025146484375;
    float _1357 = sin(_1355);
    float _1359 = fma(_787, (*spvDescriptorSet0.vp_c9)._m0[150].x, _1349);
    float _1361 = _467 + (-1.0);
    float _1363 = fma(_1361, (*spvDescriptorSet0.vp_c9)._m0[191].x, _279);
    float _1365 = _1353 * _1317;
    float _1367 = _1343 * 6.283185482025146484375;
    float _1369 = cos(_1367);
    float _1371 = _1359 * _1315;
    float _1373 = _1145 * _1339;
    float _1375 = fma(_1361, (*spvDescriptorSet0.vp_c9)._m0[191].x, _333);
    float _1377 = _1365 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1379 = _1371 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1381 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _1363);
    float _1383 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _1375);
    float _1385 = _1347 * 6.283185482025146484375;
    float _1387 = cos(_1385);
    float _1389 = _1379 * _1373;
    float _1391 = _1377 * _1373;
    float _1393 = _1373 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _1395 = _1393 * 0.5;
    float _1397 = _1389 * _1381;
    float _1399 = _1391 * _1383;
    float _1401 = _1351 * 6.283185482025146484375;
    float _1403 = sin(_1401);
    float _1405 = _1351 * 6.283185482025146484375;
    float _1407 = cos(_1405);
    float _1409 = _1369 * _1387;
    float _1411 = _1357 * _1387;
    float _1413 = _1409 * _1395;
    float _1415 = _1347 * 6.283185482025146484375;
    float _1417 = sin(_1415);
    float _1419 = _1357 * _1403;
    float _1421 = _1369 * _1407;
    float _1423 = _1357 * _1407;
    float _1425 = _1369 * _1403;
    float _1427 = _1407 * _1387;
    float _1429 = _1403 * _1387;
    float _1431 = fma(_1417, _1421, _1419);
    float _1433 = _1417 * _1395;
    float _1435 = -_1423;
    float _1437 = fma(_1417, _1425, _1435);
    float _1439 = -_1425;
    float _1441 = fma(_1417, _1423, _1439);
    float _1443 = fma(_1431, _1397, _1413);
    float _1445 = _1411 * _1395;
    float _1447 = -_1433;
    float _1449 = fma(_1427, _1397, _1447);
    float _1451 = fma(_1417, _1419, _1421);
    float _1453 = -_1399;
    float _1455 = fma(_1437, _1453, _1443);
    float _1457 = fma(_1441, _1397, _1445);
    float _1459 = -_1399;
    float _1461 = fma(_1429, _1459, _1449);
    bool _1463 = !_981;
    int _1465 = _1463 ? 0 : 1;
    float _1467 = _1455 * _329;
    float _1469 = -_1399;
    float _1471 = fma(_1451, _1469, _1457);
    float _1473 = _1455 * _325;
    float _1475 = _1455 * _317;
    float _1477 = fma(_1461, _299, _1467);
    float _1479 = fma(_1461, _289, _1473);
    float _1481 = fma(_1461, _285, _1475);
    float _1483 = fma(_1471, _345, _1477);
    float _1485 = fma(_1471, _341, _1479);
    float _1487 = fma(_1471, _337, _1481);
    float _1489 = _1099 + _1483;
    float _1491 = _517 + _1485;
    float _1493 = _463 + _1487;
    float _1495 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1497 = _1489 + _1495;
    float _1499 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1501 = _1491 + _1499;
    float _1503 = _1497 * _1497;
    float _1505 = fma(_1501, _1501, _1503);
    bool _1507 = !_985;
    int _1509 = _1507 ? 0 : 1;
    float _1511 = sqrt(_1505);
    bool _1513 = _1511 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1515 = _1471;
    float _1517 = _1487;
    float _1519 = _1491;
    float _1521 = _1501;
    if (!_1513)
    {
        _1515 = _1491;
    }
    float _1523 = _1515;
    float _1525 = _1523;
    if (!_1513)
    {
        _1517 = _1489;
    }
    float _1527 = _1517;
    float _1529 = _1527;
    if (!_1513)
    {
        _1519 = _1493;
    }
    float _1531 = _1519;
    bool _1533 = !_1513;
    float _1535 = _1531;
    if (!_1533)
    {
        float _1537 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1539 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1541 = _1511 + _1539;
        float _1543 = _1493 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1545 = rsqrt(_1505);
        float _1547 = _1541 * _1537;
        float _1549 = _1547 * 0.15915493667125701904296875;
        float _1551 = _1549 * 6.283185482025146484375;
        float _1553 = sin(_1551);
        float _1555 = _1549 * 6.283185482025146484375;
        float _1557 = cos(_1555);
        float _1559 = fma(_1553, _1543, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1561 = _1545 * _1559;
        float _1563 = _1557 + (-1.0);
        float _1565 = fma(_1501, _1561, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1567 = fma(_1497, _1561, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _1569 = _1563 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1571 = fma(_1493, _1557, _1569);
        _1529 = _1567;
        _1525 = _1565;
        _1535 = _1571;
    }
    float _1573 = _1529;
    float _1575 = _1525;
    float _1577 = _1535;
    float _1579 = -(*spvDescriptorSet0.vp_c15)._m0[630].y;
    float _1581 = _1573 + _1579;
    float _1583 = -(*spvDescriptorSet0.vp_c15)._m0[630].x;
    float _1585 = _1575 + _1583;
    float _1587 = fma(_1581, (*spvDescriptorSet0.vp_c15)._m0[630].z, 0.5);
    float _1589 = fma(_1585, (*spvDescriptorSet0.vp_c15)._m0[630].z, 0.5);
    float2 _6243 = float2(_1589, _1587);
    float _1591 = dm_bs(spvDescriptorSet0.vp_t_tcb_28.sample(spvDescriptorSet0.vp_t_tcb_28Smplr, select(_6243, float2(0.0), isnan(_6243)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_28, spvDescriptorSet0.vp_t_tcb_28Smplr_w, select(_6243, float2(0.0), isnan(_6243)), level(0.0)).x;
    float _1593 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _1595 = int(_1593);
    int _1597 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _1599 = _1597 != 0;
    float _1601 = -_1261;
    float _1603 = fma(_1601, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1573);
    int _1605 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _1607 = _1605 != 0;
    float _1609 = -_1261;
    float _1611 = fma(_1609, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1099);
    int _1613 = abs(_1159);
    float _1615 = -_1229;
    float _1617 = fma(_1615, (*spvDescriptorSet0.vp_c9)._m0[18].w, _517);
    int _1619 = abs(_1465);
    float _1621 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].x);
    int _1623 = int(_1621);
    if (_1599)
    {
        float _1625 = in.m_64.x;
        _1521 = _1625;
    }
    float _1627 = _1521;
    float _1629 = float(uint(_1595));
    float _1631 = trunc(_745);
    int _1633 = int(_1631);
    float _1635 = trunc(_767);
    int _1637 = int(_1635);
    float _1639 = float(uint(_1623));
    float _1641 = _1627;
    if (!_1599)
    {
        float _1643 = in.m_64.y;
        _1641 = _1643;
    }
    float _1645 = _1641;
    int _1647 = ~_1595;
    int _1649 = _1647 + 1;
    bool _1651 = _1595 == 0;
    float _1653 = float(_1623);
    float _1655 = 1.0 / _1629;
    float _1657 = float(uint(_1633));
    int _1659 = ~_1595;
    int _1661 = _1659 + 1;
    float _1663 = 1.0 / _1639;
    float _1665 = float(uint(_1637));
    int _1667 = as_type<int>(_1655) + (-2);
    float _1669 = as_type<float>(_1667) * _1657;
    int _1671 = as_type<int>(_1663) + (-2);
    float _1673 = trunc(_1669);
    float _1675 = precise::max(_1673, 0.0);
    uint _1678 = uint(_1675);
    float _1680 = as_type<float>(_1671) * _1665;
    float _1682 = trunc(_1680);
    float _1684 = precise::max(_1682, 0.0);
    uint _1686 = uint(_1684);
    int _1688 = ~_1623;
    int _1690 = _1688 + 1;
    int _1692 = _1649 * int(_1678);
    int _1694 = _1692 + _1633;
    float _1696 = as_type<float>(_1649);
    float _1698 = as_type<float>(_1694);
    if (_1599)
    {
        _1696 = 1.0;
    }
    float _1700 = _1696;
    float _1702 = _1700;
    if (!_1599)
    {
        _1702 = 7.345489978790283203125;
    }
    float _1704 = _1702;
    float _1706 = float(uint(_1694));
    if (_1599)
    {
        _1698 = 1.0;
    }
    float _1708 = _1698;
    int _1710 = _1690 * int(_1686);
    int _1712 = _1710 + _1637;
    float _1714 = _1708;
    if (!_1599)
    {
        _1714 = 1.2345600128173828125;
    }
    float _1716 = _1714;
    float _1718 = as_type<float>(_1667) * _1706;
    float _1720 = _1704 * _397;
    float _1722 = float(uint(_1712));
    float _1724 = _1645 * _1716;
    int _1726 = ~_1595;
    int _1728 = _1726 + 1;
    float _1730 = trunc(_1718);
    float _1732 = precise::max(_1730, 0.0);
    uint _1734 = uint(_1732);
    float _1736 = as_type<float>(_1671) * _1722;
    float _1738 = floor(_1720);
    int _1740 = int(_1678) + int(_1734);
    float _1742 = floor(_1724);
    float _1744 = float(_1595);
    float _1746 = float(_1633);
    int _1748 = _1728 * _1740;
    int _1750 = _1748 + _1633;
    float _1752 = -_1738;
    float _1754 = _1720 + _1752;
    float _1756 = trunc(_1736);
    float _1758 = precise::max(_1756, 0.0);
    uint _1760 = uint(_1758);
    bool _1762 = _1746 >= _1744;
    bool _1764 = isnan(_1746);
    bool _1766 = _1762 || _1764;
    bool _1768 = isnan(_1744);
    bool _1770 = _1766 || _1768;
    float _1772 = float(_1770);
    bool _1774 = uint(_1750) >= uint(_1595);
    int _1776 = ~_1623;
    int _1778 = _1776 + 1;
    bool _1780 = !_1774;
    int _1782 = _1780 ? 0 : (-1);
    float _1784 = trunc(_1772);
    int _1786 = int(_1784);
    float _1788 = -_1742;
    float _1790 = _1724 + _1788;
    int _1792 = ~_1740;
    int _1794 = _1792 + _1782;
    int _1796 = _1794 + 1;
    float _1798 = _1790 * _1653;
    float _1800 = _1754 * _1744;
    int _1802 = int(_1686) + int(_1760);
    int _1804 = _1595 * _1796;
    int _1806 = _1804 + _1633;
    float _1808 = float(_1637);
    float _1810 = _1744 * _759;
    int _1812 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _1814 = _1812 != 0;
    int _1816 = _1778 * _1802;
    int _1818 = _1816 + _1637;
    float _1820 = trunc(_1800);
    int _1822 = int(_1820);
    bool _1824 = !_1651;
    int _1826 = _1824 ? _1806 : (-1);
    int _1828 = ~_1786;
    int _1830 = _1828 + 1;
    int _1832 = _1830 + 1;
    bool _1834 = _1808 >= _1653;
    bool _1836 = isnan(_1808);
    bool _1838 = _1834 || _1836;
    bool _1840 = isnan(_1653);
    bool _1842 = _1838 || _1840;
    float _1844 = float(_1842);
    bool _1846 = !_1814;
    int _1848 = _1846 ? 0 : 1;
    int _1850 = _1826 * _1832;
    bool _1852 = uint(_1818) >= uint(_1623);
    float _1854 = trunc(_1810);
    int _1856 = int(_1854);
    int _1858 = _1595 + (-1);
    int _1860 = abs(_1848);
    int _1862 = abs(_901);
    int _1864 = _1786 * _1858;
    int _1866 = _1864 + _1850;
    bool _1868 = !_1852;
    int _1870 = _1868 ? 0 : (-1);
    float _1872 = trunc(_1844);
    int _1874 = int(_1872);
    float _1876 = _1653 * _759;
    int _1878 = ~_1802;
    int _1880 = _1878 + _1870;
    int _1882 = _1880 + 1;
    bool _1884 = _1623 == 0;
    int _1886 = _1822 * _1860;
    int _1888 = _1886 + _1633;
    int _1890 = abs(_1005);
    int _1892 = _1866 * _1862;
    int _1894 = abs(_1021);
    int _1896 = _1623 * _1882;
    int _1898 = _1896 + _1637;
    bool _1900 = !_1607;
    int _1902 = _1900 ? 0 : 1;
    int _1904 = _1856 * _1890;
    int _1906 = _1904 + _1892;
    float _1908 = trunc(_1876);
    int _1910 = int(_1908);
    int _1912 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8192;
    bool _1914 = _1912 != 0;
    int _1916 = abs(_1902);
    int _1918 = _1888 * _1894;
    int _1920 = _1918 + _1906;
    int _1922 = ~_1874;
    int _1924 = _1922 + 1;
    int _1926 = _1924 + 1;
    bool _1928 = !_1884;
    int _1930 = _1928 ? _1898 : (-1);
    float _1932 = trunc(_1798);
    int _1934 = int(_1932);
    int _1936 = _1623 + (-1);
    int _1938 = _1930 * _1926;
    bool _1940 = !_1914;
    int _1942 = _1940 ? 0 : 1;
    int _1944 = _1822 * _1916;
    int _1946 = _1944 + _1920;
    int _1948 = abs(_1165);
    int _1950 = _1874 * _1936;
    int _1952 = _1950 + _1938;
    int _1954 = abs(_1942);
    float _1956 = float(uint(_1946));
    int _1958 = _1952 * _1613;
    int _1960 = ~_1595;
    int _1962 = _1960 + 1;
    float _1964 = as_type<float>(_1667) * _1956;
    float _1966 = float(uint(_1888));
    int _1968 = _1910 * _1948;
    int _1970 = _1968 + _1958;
    int _1972 = abs(_1509);
    int _1974 = _1934 * _1954;
    int _1976 = _1974 + _1637;
    float _1978 = trunc(_1964);
    float _1980 = precise::max(_1978, 0.0);
    uint _1982 = uint(_1980);
    float _1984 = as_type<float>(_1667) * _1966;
    float _1986 = float(uint(_1976));
    int _1988 = _1976 * _1619;
    int _1990 = _1988 + _1970;
    float _1992 = trunc(_1984);
    float _1994 = precise::max(_1992, 0.0);
    uint _1996 = uint(_1994);
    int _1998 = _1934 * _1972;
    int _2000 = _1998 + _1990;
    float _2002 = as_type<float>(_1671) * _1986;
    int _2004 = ~_1623;
    int _2006 = _2004 + 1;
    float _2008 = float(uint(_2000));
    int _2010 = _1962 * int(_1982);
    int _2012 = _2010 + _1946;
    float _2014 = trunc(_2002);
    float _2016 = precise::max(_2014, 0.0);
    uint _2018 = uint(_2016);
    float _2020 = as_type<float>(_1671) * _2008;
    float _2022 = float(uint(_2012));
    int _2024 = ~_1595;
    int _2026 = _2024 + 1;
    float _2028 = as_type<float>(_1667) * _2022;
    float _2030 = trunc(_2020);
    float _2032 = precise::max(_2030, 0.0);
    uint _2034 = uint(_2032);
    int _2036 = _2026 * int(_1996);
    int _2038 = _2036 + _1888;
    float _2040 = float(uint(_2038));
    float _2042 = trunc(_2028);
    float _2044 = precise::max(_2042, 0.0);
    uint _2046 = uint(_2044);
    float _2048 = as_type<float>(_1667) * _2040;
    int _2050 = _2006 * int(_2034);
    int _2052 = _2050 + _2000;
    int _2054 = ~_1595;
    int _2056 = _2054 + 1;
    float _2058 = trunc(_2048);
    float _2060 = precise::max(_2058, 0.0);
    uint _2062 = uint(_2060);
    float _2064 = float(uint(_2052));
    int _2066 = int(_1982) + int(_2046);
    float _2068 = as_type<float>(_1671) * _2064;
    int _2070 = _2056 * _2066;
    int _2072 = _2070 + _1946;
    float _2074 = trunc(_2068);
    float _2076 = precise::max(_2074, 0.0);
    uint _2078 = uint(_2076);
    bool _2080 = uint(_2072) >= uint(_1595);
    int _2082 = int(_1996) + int(_2062);
    bool _2084 = !_2080;
    int _2086 = _2084 ? 0 : (-1);
    int _2088 = _1661 * _2082;
    int _2090 = _2088 + _1888;
    int _2092 = ~_2066;
    int _2094 = _2092 + _2086;
    int _2096 = _2094 + 1;
    float _2098 = -_1229;
    float _2100 = fma(_2098, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1575);
    int _2102 = _1595 * _2096;
    int _2104 = _2102 + _1946;
    float _2106 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2108 = _2100 + _2106;
    int _2110 = int(_2034) + int(_2078);
    float _2112 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2114 = _1603 + _2112;
    float _2116 = fma(_1591, 100.0, _1577);
    float _2118 = -_1209;
    float _2120 = fma(_2118, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2116);
    float _2122 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2124 = _2120 + _2122;
    float _2126 = _2124 * _2124;
    float _2128 = fma(_2108, _2108, _2126);
    float _2130 = fma(_2114, _2114, _2128);
    float _2132 = rsqrt(_2130);
    float _2134 = sqrt(_2130);
    float _2136 = _2132 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _2138 = _2108 * _2136;
    float _2140 = _2114 * _2136;
    float _2142 = _2138 * _2138;
    float _2144 = _2140 * _2140;
    float _2146 = _2142 + _2144;
    float _2148 = sqrt(_2146);
    bool _2150 = _2148 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2152 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2154 = _2148 + _2152;
    float _2156 = _2114;
    float _2158 = _2146;
    float _2160 = _2154;
    float _2162 = _2124;
    float _2164 = as_type<float>(_1916);
    if (_2150)
    {
        float _2166 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2156 = _2166;
    }
    float _2168 = _2156;
    if (_2150)
    {
        float _2170 = rsqrt(_2146);
        _2158 = _2170;
    }
    float _2172 = _2158;
    if (_2150)
    {
        float _2174 = _2154 * _2168;
        _2160 = _2174;
    }
    float _2176 = _2160;
    if (_2150)
    {
        float _2178 = _2176 * 0.15915493667125701904296875;
        _1253 = _2178;
    }
    float _2180 = _1253;
    float _2182 = _2126;
    float _2184 = _2180;
    if (_2150)
    {
        float _2186 = _2180 * 6.283185482025146484375;
        float _2188 = sin(_2186);
        _2182 = _2188;
    }
    float _2190 = _2182;
    float _2192 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _2194 = precise::max(0.0, _2192);
    float _2196 = _2132;
    float _2198 = _2194;
    float _2200 = _2192;
    if (_2150)
    {
        float _2202 = _2180 * 6.283185482025146484375;
        float _2204 = cos(_2202);
        _2196 = _2204;
    }
    float _2206 = _2196;
    float _2208 = -_2136;
    float _2210 = -_2194;
    float _2212 = fma(_2124, _2208, _2210);
    if (!_2150)
    {
        _2198 = _2138;
    }
    float _2214 = _2198;
    float _2216 = _2214;
    if (_2150)
    {
        float _2218 = _2212 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2200 = _2218;
    }
    float _2220 = _2200;
    float _2222 = _2190;
    float _2224 = _2220;
    if (_2150)
    {
        float _2226 = fma(_2190, _2220, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _2222 = _2226;
    }
    float _2228 = _2222;
    float _2230 = _2228;
    if (!_2150)
    {
        _2224 = _2212;
    }
    float _2232 = _2224;
    float _2234 = _2232;
    float _2236 = _2206;
    if (_2150)
    {
        float _2238 = _2206 + (-1.0);
        _2162 = _2238;
    }
    float _2240 = _2162;
    float _2242 = _2240;
    if (_2150)
    {
        float _2244 = _2172 * _2228;
        _2164 = _2244;
    }
    float _2246 = _2164;
    if (!_2150)
    {
        _2230 = _2142;
    }
    float _2248 = _2230;
    float _2250 = _2248;
    if (_2150)
    {
        float _2252 = _2240 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2184 = _2252;
    }
    float _2254 = _2184;
    if (_2150)
    {
        float _2256 = _2138 * _2246;
        _2216 = _2256;
    }
    float _2258 = _2216;
    if (!_2150)
    {
        _2242 = _2140;
    }
    float _2260 = _2242;
    float _2262 = _2260;
    if (_2150)
    {
        float _2264 = _2140 * _2246;
        _2262 = _2264;
    }
    float _2266 = _2262;
    if (_2150)
    {
        float _2268 = fma(_2212, _2206, _2254);
        _2234 = _2268;
    }
    float _2270 = _2234;
    if (_2150)
    {
        float _2272 = _2258 * _2258;
        _2250 = _2272;
    }
    float _2274 = _2250;
    if (!_2150)
    {
        _2236 = _2144;
    }
    float _2276 = _2236;
    float _2278 = _2276;
    if (_2150)
    {
        float _2280 = _2266 * _2266;
        _2278 = _2280;
    }
    float _2282 = _2278;
    float _2284 = fma(_2270, _2270, _2274);
    float _2286 = _2120 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _2288 = _2120 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _2290 = _2284 + _2282;
    float _2292 = fma(_1617, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _2294 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _2296 = fma(_2134, (*spvDescriptorSet0.vp_c15)._m0[23].w, _2294);
    float _2298 = precise::clamp(_2296, 0.0, 1.0);
    float _2300 = fma(_2100, (*spvDescriptorSet0.vp_c8)._m0[2].x, _2286);
    float _2302 = fma(_2100, (*spvDescriptorSet0.vp_c8)._m0[3].x, _2288);
    float _2304 = floor(_2292);
    float _2306 = -_2298;
    float _2308 = _2306 + 1.0;
    float _2310 = fma(_1603, (*spvDescriptorSet0.vp_c8)._m0[2].z, _2300);
    float _2312 = fma(_1603, (*spvDescriptorSet0.vp_c8)._m0[3].z, _2302);
    float _2314 = _2310 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _2316 = rsqrt(_2290);
    float _2318 = abs(_2308);
    float _2320 = log2(_2318);
    float _2322 = -_2304;
    float _2324 = _2292 + _2322;
    float _2326 = _2120 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2328 = fma(_2100, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2326);
    float _2330 = _2316 * _2258;
    float _2332 = _2316 * _2270;
    float _2334 = fma(_1603, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2328);
    float _2336 = _2330 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _2338 = _2316 * _2266;
    float _2340 = _2334 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2342 = -_2336;
    float _2344 = fma(_2332, (*spvDescriptorSet0.vp_c15)._m0[21].y, _2342);
    float _2346 = _2320 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _2348 = fma(_1611, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _2350 = -_2338;
    float _2352 = fma(_2350, (*spvDescriptorSet0.vp_c15)._m0[21].z, _2344);
    float _2354 = _2120 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2356 = _2314 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _2358 = floor(_2348);
    float _2360 = fma(_2352, -0.5, 0.5);
    float _2362 = fma(_2100, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2354);
    float _2364 = fma(_2352, 0.5, 0.5);
    float _2366 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _2368 = fma(_1603, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2362);
    float _2370 = fma(_2364, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _2372 = sqrt(_2360);
    float _2374 = -_2356;
    float _2376 = fma(_2374, _2366, 1.0);
    float _2378 = _2368 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _2380 = fma(_2364, _2370, -0.212114393711090087890625);
    float _2382 = fma(_2364, _2380, 1.570728778839111328125);
    float _2384 = exp2(_2346);
    float _2386 = _2378 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _2388 = _2312 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _2390 = -_2358;
    float _2392 = _2348 + _2390;
    float _2394 = _2378 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2396 = fma(_2340, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2386);
    float _2398 = log2(_2376);
    float _2400 = fma(_2314, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2396);
    float _2402 = _2332 + 1.0;
    float _2404 = fma(_2340, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2394);
    float _2406 = _2372 * 0.636619746685028076171875;
    float _2408 = fma(_2388, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2400);
    int _2410 = ~_1623;
    int _2412 = _2410 + 1;
    float _2414 = -_2332;
    float _2416 = fma(_2384, _2402, _2414);
    float _2418 = _2378 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2420 = 1.0 / _2408;
    float _2422 = fma(_2314, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2404);
    float _2424 = fma(_2340, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2418);
    float _2426 = -_2382;
    float _2428 = fma(_2406, _2426, 1.0);
    float _2430 = fma(_2388, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2422);
    float _2432 = _2398 * 0.693147182464599609375;
    float _2434 = fma(_2314, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2424);
    float _2436 = fma(_2416, 0.5, 0.5);
    float2 _7492 = float2(_2324, _2392);
    float _2438 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_7492, float2(0.0), isnan(_7492)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_7492, float2(0.0), isnan(_7492)), level(0.0)).x;
    float _2440 = _2432 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _2442 = fma(_2388, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2434);
    int _2444 = ~_1623;
    int _2446 = _2444 + 1;
    float _2448 = _2442 * _2420;
    float _2450 = _2430 * _2420;
    int _2452 = _2412 * _2110;
    int _2454 = _2452 + _2000;
    float _2456 = fma(_2448, 0.5, 0.5);
    float _2458 = fma(_2450, -0.5, 0.5);
    float3 _7530 = float3(_2456, _2458, _2440);
    float _2460 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_7530, float3(0.0), isnan(_7530)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_7530, float3(0.0), isnan(_7530)), level(0.0)).x;
    float3 _7541 = float3(_2456, _2458, _2440);
    float4 _2463 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_7541, float3(0.0), isnan(_7541)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_7541, float3(0.0), isnan(_7541)), level(0.0)).xyzw;
    float _2465 = _2463.x;
    float _2467 = _2463.y;
    float _2469 = _2463.z;
    float _2471 = _2463.w;
    float2 _7557 = float2(_2428, _2436);
    float3 _2475 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_7557, float2(0.0), isnan(_7557)), level(0.0)), spvDescriptorSet0.dm_border, 4u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_7557, float2(0.0), isnan(_7557)), level(0.0)).xyz;
    float _2477 = _2475.x;
    float _2479 = _2475.y;
    float _2481 = _2475.z;
    bool _2483 = !_1651;
    int _2485 = _2483 ? _2104 : (-1);
    float _2487 = fma(_1591, 100.0, _463);
    float _2489 = -_747;
    float _2491 = _2489 + 1.0;
    int _2493 = _2485 & 3;
    bool _2495 = _2493 != 0;
    float _2497 = -_1209;
    float _2499 = fma(_2497, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2487);
    int _2501 = _2485 & 3;
    bool _2503 = _2501 != 0;
    float _2505 = -_677;
    float _2507 = _2505 + 1.0;
    bool _2509 = uint(_2454) >= uint(_1623);
    float _2511 = _2499 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    bool _2513 = uint(_2090) >= uint(_1595);
    int _2515 = _2446 * int(_2018);
    int _2517 = _2515 + _1976;
    int _2519 = _2495 ? 0 : 1;
    float _2521 = _2320 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    bool _2523 = _2501 != 3;
    float _2525 = _2378 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    bool _2527 = !_2509;
    int _2529 = _2527 ? 0 : (-1);
    out.m_72.x = _2100;
    out.m_72.y = _2120;
    out.m_72.z = _1603;
    bool _2531 = !_2513;
    int _2533 = _2531 ? 0 : (-1);
    float _2535 = fma(_2340, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2525);
    bool _2537 = uint(_2501) >= 2u;
    float _2539 = exp2(_2521);
    bool _2541 = uint(_2501) > 1u;
    float _2543 = fma(_2314, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2535);
    int _2545 = ~_2110;
    int _2547 = _2545 + _2529;
    int _2549 = _2547 + 1;
    float _2551 = float(uint(_2517));
    int _2553 = _2537 ? 0 : 1;
    int _2555 = _1623 * _2549;
    int _2557 = _2555 + _2000;
    bool _2559 = _403 > 0.5;
    float _2561 = as_type<float>(_1671) * _2551;
    int _2563 = ~_2553;
    int _2565 = _2563 + 1;
    int _2567 = _2565 + 1;
    bool _2569 = !_2503;
    int _2571 = _2569 ? 0 : 1;
    float _2573 = trunc(_2561);
    float _2575 = precise::max(_2573, 0.0);
    uint _2577 = uint(_2575);
    int _2579 = _2567;
    float _2581 = _2408;
    float _2583 = _2430;
    if (_2523)
    {
        int _2585 = ~_2553;
        int _2587 = _2585 + 1;
        _2579 = _2587;
    }
    int _2589 = _2579;
    float _2591 = -_2539;
    float _2593 = _2591 + 1.0;
    bool _2595 = _397 > 0.5;
    int _2597 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _2599 = _2597 != 0;
    float _2601 = _2593 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _2603 = -_333;
    int _2605 = _2559 ? as_type<int>(_2603) : as_type<int>(_333);
    int _2607 = _2485 >> 31;
    bool _2609 = !_1884;
    int _2611 = _2609 ? _2557 : (-1);
    int _2613 = ~_2519;
    int _2615 = _2613 + 1;
    int _2617 = _2615 + 1;
    int _2619 = _2617;
    if (!_2541)
    {
        int _2621 = ~_2519;
        int _2623 = _2621 + 1;
        _2619 = _2623;
    }
    int _2625 = _2619;
    bool _2627 = !_2599;
    float _2629 = _2627 ? _333 : as_type<float>(_2605);
    int _2631 = _2607 & 3;
    int _2633 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _2635 = _2633 != 0;
    int _2637 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4194304;
    bool _2639 = _2637 != 0;
    int _2641 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _2643 = _2641 != 0;
    int _2645 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _2647 = _2645 != 0;
    int _2649 = _2611 >> 31;
    int _2651 = _2485 + _2631;
    int _2653 = ~_2082;
    int _2655 = _2653 + _2533;
    int _2657 = _2655 + 1;
    int _2659 = _2649 & 3;
    bool _2661 = !_2639;
    int _2663 = _2661 ? 0 : 1;
    int _2665 = _1595 * _2657;
    int _2667 = _2665 + _1888;
    int _2669 = _2611 & 3;
    bool _2671 = _2669 != 0;
    int _2673 = _2651 >> 2;
    int _2675 = _2611 + _2659;
    bool _2677 = !_2635;
    int _2679 = _2677 ? 0 : 1;
    int _2681 = _2671 ? 0 : 1;
    int _2683 = _2673 << 4;
    int _2685 = _2683 + 368;
    int _2687 = _2611 & 3;
    bool _2689 = _2687 != 0;
    bool _2691 = _2501 != 3;
    int _2693 = _2685 + 8;
    uint _2695 = uint(int(uint(_2693) >> uint(2)));
    uint _2697 = uint(int(uint(int(_2695)) >> uint(2)));
    int _2699 = int(_2695) & 3;
    float _2701 = (*spvDescriptorSet0.vp_c9)._m0[int(_2697)][_2699];
    int _2703 = int(_2695) + 1;
    uint _2705 = uint(int(uint(_2703) >> uint(2)));
    int _2707 = _2703 & 3;
    float _2709 = (*spvDescriptorSet0.vp_c9)._m0[int(_2705)][_2707];
    int _2711 = _2675 >> 2;
    int _2713 = int(_2018) + int(_2577);
    bool _2715 = !_1651;
    int _2717 = _2715 ? _2667 : (-1);
    bool _2719 = uint(_2687) > 1u;
    uint _2721 = uint(int(uint(_2685) >> uint(2)));
    uint _2723 = uint(int(uint(int(_2721)) >> uint(2)));
    int _2725 = int(_2721) & 3;
    float _2727 = (*spvDescriptorSet0.vp_c9)._m0[int(_2723)][_2725];
    int _2729 = int(_2721) + 1;
    uint _2731 = uint(int(uint(_2729) >> uint(2)));
    int _2733 = _2729 & 3;
    float _2735 = (*spvDescriptorSet0.vp_c9)._m0[int(_2731)][_2733];
    int _2737 = _2711 << 4;
    int _2739 = _2737 + 512;
    bool _2741 = !_2689;
    int _2743 = _2741 ? 0 : 1;
    bool _2745 = _2687 != 3;
    int _2747 = ~_2681;
    int _2749 = _2747 + 1;
    int _2751 = _2749 + 1;
    uint _2753 = uint(int(uint(_2739) >> uint(2)));
    uint _2755 = uint(int(uint(int(_2753)) >> uint(2)));
    int _2757 = int(_2753) & 3;
    float _2759 = (*spvDescriptorSet0.vp_c9)._m0[int(_2755)][_2757];
    int _2761 = int(_2753) + 1;
    uint _2763 = uint(int(uint(_2761) >> uint(2)));
    int _2765 = _2761 & 3;
    float _2767 = (*spvDescriptorSet0.vp_c9)._m0[int(_2763)][_2765];
    int _2769 = ~_1623;
    int _2771 = _2769 + 1;
    bool _2773 = !_2691;
    int _2775 = _2773 ? 0 : (-1);
    int _2777 = _2751;
    if (!_2719)
    {
        int _2779 = ~_2681;
        int _2781 = _2779 + 1;
        _2777 = _2781;
    }
    int _2783 = _2777;
    bool _2785 = uint(_2687) >= 2u;
    int _2787 = _2739 + 8;
    uint _2789 = uint(int(uint(_2787) >> uint(2)));
    uint _2791 = uint(int(uint(int(_2789)) >> uint(2)));
    int _2793 = int(_2789) & 3;
    float _2795 = (*spvDescriptorSet0.vp_c9)._m0[int(_2791)][_2793];
    int _2797 = int(_2789) + 1;
    uint _2799 = uint(int(uint(_2797) >> uint(2)));
    int _2801 = _2797 & 3;
    float _2803 = (*spvDescriptorSet0.vp_c9)._m0[int(_2799)][_2801];
    bool _2805 = _2687 != 3;
    int _2807 = _2771 * _2713;
    int _2809 = _2807 + _1976;
    int _2811 = _2785 ? 0 : 1;
    int _2813 = ~_2811;
    int _2815 = _2813 + 1;
    int _2817 = _2815 + 1;
    int _2819 = _2817;
    if (_2745)
    {
        int _2821 = ~_2811;
        int _2823 = _2821 + 1;
        _2819 = _2823;
    }
    int _2825 = _2819;
    bool _2827 = uint(_2809) >= uint(_1623);
    float _2829 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    int _2831 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y);
    bool _2833 = _2831 != 0;
    float _2835 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _2837 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    bool _2839 = !_2805;
    int _2841 = _2839 ? 0 : (-1);
    float _2843 = _2829 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    bool _2845 = _399 > 0.5;
    float _2847 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _2849 = _2835 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2851 = _2837 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2853 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    bool _2855 = !_2827;
    int _2857 = _2855 ? 0 : (-1);
    bool _2859 = _401 > 0.5;
    float _2861 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    int _2863 = abs(_2625);
    out.m_74.x = _2843;
    out.m_74.y = _2849;
    out.m_74.z = _2851;
    out.m_74.w = _2847;
    float _2865 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _2867 = _2853 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2869 = _2861 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    int _2871 = abs(_2783);
    float _2873 = _2865 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    int _2875 = abs(_2589);
    int _2877 = ~_2871;
    int _2879 = _2877 + 1;
    int _2881 = _2879 + 1;
    out.m_76.x = _2867;
    out.m_76.y = _2869;
    out.m_76.z = _2873;
    int _2883 = ~_2713;
    int _2885 = _2883 + _2857;
    int _2887 = _2885 + 1;
    int _2889 = _2881 * as_type<int>(_2767);
    float _2891 = trunc((*spvDescriptorSet0.vp_c9)._m0[80].z);
    int _2893 = int(_2891);
    int _2895 = ~_2863;
    int _2897 = _2895 + 1;
    int _2899 = _2897 + 1;
    int _2901 = _1623 * _2887;
    int _2903 = _2901 + _1976;
    int _2905 = abs(_2571);
    int _2907 = abs(_2679);
    int _2909 = _2899 * as_type<int>(_2735);
    int _2911 = abs(_2743);
    float _2913 = trunc((*spvDescriptorSet0.vp_c9)._m0[85].z);
    int _2915 = int(_2913);
    int _2917 = ~_2905;
    int _2919 = _2917 + 1;
    int _2921 = _2919 + 1;
    int _2923 = ~_2911;
    int _2925 = _2923 + 1;
    int _2927 = _2925 + 1;
    int _2929 = _2921 * as_type<int>(_2727);
    int _2931 = _2929 + _2909;
    int _2933 = ~_2875;
    int _2935 = _2933 + 1;
    int _2937 = _2935 + 1;
    int _2939 = abs(_2825);
    int _2941 = _2927 * as_type<int>(_2759);
    int _2943 = _2941 + _2889;
    float _2945 = float(uint(_2893));
    int _2947 = _2937 * as_type<int>(_2701);
    int _2949 = _2947 + _2931;
    int _2951 = abs(_2775);
    int _2953 = ~_2939;
    int _2955 = _2953 + 1;
    int _2957 = _2955 + 1;
    int _2959 = abs(_2841);
    float _2961 = 1.0 / _2945;
    float _2963 = float(uint(_2915));
    int _2965 = _2957 * as_type<int>(_2795);
    int _2967 = _2965 + _2943;
    int _2969 = ~_2951;
    int _2971 = _2969 + 1;
    int _2973 = _2971 + 1;
    int _2975 = abs(_2663);
    int _2977 = ~_2959;
    int _2979 = _2977 + 1;
    int _2981 = _2979 + 1;
    float _2983 = 1.0 / _2963;
    int _2985 = abs(_2893);
    int _2987 = _2973 * as_type<int>(_2709);
    int _2989 = _2987 + _2949;
    int _2991 = ~_2907;
    int _2993 = _2991 + 1;
    int _2995 = _2993 + 1;
    int _2997 = _2981 * as_type<int>(_2803);
    int _2999 = _2997 + _2967;
    int _3001 = ~_2975;
    int _3003 = _3001 + 1;
    int _3005 = _3003 + 1;
    float _3007 = _1375 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    int _3009 = _2989 * _2995;
    int _3011 = abs(_2915);
    int _3013 = _2999 * _3005;
    float _3015 = float(uint(_2985));
    int _3017 = _2717 * _2907;
    int _3019 = _3017 + _3009;
    bool _3021 = !_1884;
    int _3023 = _3021 ? _2903 : (-1);
    float _3025 = fma(_3007, _3007, 1.0);
    int _3027 = as_type<int>(_2961) + (-2);
    float _3029 = _1363 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _3031 = 1.0 / _3015;
    int _3033 = _3023 * _2975;
    int _3035 = _3033 + _3013;
    float _3037 = float(uint(_3019));
    float _3039 = fma(_1441, _3029, _1411);
    float _3041 = float(uint(_3011));
    int _3043 = as_type<int>(_2983) + (-2);
    float _3045 = as_type<float>(_3027) * _3037;
    float _3047 = float(uint(_3035));
    float _3049 = rsqrt(_3025);
    float _3051 = -_333;
    int _3053 = _2845 ? as_type<int>(_3051) : as_type<int>(_333);
    float _3055 = -_279;
    int _3057 = _2595 ? as_type<int>(_3055) : as_type<int>(_279);
    float _3059 = as_type<float>(_3043) * _3047;
    bool _3061 = !_2643;
    float _3063 = _3061 ? _333 : as_type<float>(_3053);
    int _3065 = abs(_3019);
    float _3067 = 1.0 / _3041;
    int _3069 = as_type<int>(_3031) + (-2);
    float _3071 = float(uint(_3065));
    float _3073 = -_279;
    int _3075 = _2859 ? as_type<int>(_3073) : as_type<int>(_279);
    bool _3077 = !_2833;
    float _3079 = _3077 ? _279 : as_type<float>(_3057);
    float _3081 = trunc(_3045);
    float _3083 = precise::max(_3081, 0.0);
    uint _3085 = uint(_3083);
    bool _3087 = !_2647;
    float _3089 = _3087 ? _279 : as_type<float>(_3075);
    float _3091 = as_type<float>(_3069) * _3071;
    int _3093 = ~_2893;
    int _3095 = _3093 + 1;
    float _3097 = _3007 * _3049;
    int _3099 = abs(_3035);
    float _3101 = -_3049;
    float _3103 = _1429 * _3101;
    int _3105 = ~_2915;
    int _3107 = _3105 + 1;
    float _3109 = trunc(_3059);
    float _3111 = precise::max(_3109, 0.0);
    uint _3113 = uint(_3111);
    int _3115 = as_type<int>(_3067) + (-2);
    float _3117 = -_1417;
    float _3119 = fma(_1427, _3029, _3117);
    float _3121 = float(uint(_3099));
    float _3123 = fma(_1417, _3097, _3103);
    int _3125 = ~_2985;
    int _3127 = _3125 + 1;
    float _3129 = -_3007;
    float _3131 = fma(_1429, _3129, _3119);
    float _3133 = trunc(_3091);
    float _3135 = precise::max(_3133, 0.0);
    uint _3137 = uint(_3135);
    int _3139 = _3095 * int(_3085);
    int _3141 = _3139 + _3019;
    float _3143 = as_type<float>(_3115) * _3121;
    float _3145 = float(uint(_3141));
    int _3147 = _3107 * int(_3113);
    int _3149 = _3147 + _3035;
    float _3151 = trunc(_3143);
    float _3153 = precise::max(_3151, 0.0);
    uint _3155 = uint(_3153);
    float _3157 = as_type<float>(_3027) * _3145;
    float _3159 = float(uint(_3149));
    int _3161 = ~_3011;
    int _3163 = _3161 + 1;
    int _3165 = _3127 * int(_3137);
    int _3167 = _3165 + _3065;
    float _3169 = trunc(_3157);
    float _3171 = precise::max(_3169, 0.0);
    uint _3173 = uint(_3171);
    float _3175 = as_type<float>(_3043) * _3159;
    float _3177 = fma(_1431, _3029, _1409);
    float _3179 = float(uint(_3167));
    float _3181 = -_3007;
    float _3183 = fma(_1437, _3181, _3177);
    float _3185 = -_3049;
    float _3187 = _1437 * _3185;
    float _3189 = -_3049;
    float _3191 = _1451 * _3189;
    int _3193 = _3163 * int(_3155);
    int _3195 = _3193 + _3099;
    float _3197 = -_3007;
    float _3199 = fma(_1451, _3197, _3039);
    float _3201 = -_3097;
    float _3203 = fma(_1409, _3201, _3187);
    float _3205 = -_3097;
    float _3207 = fma(_1411, _3205, _3191);
    float _3209 = as_type<float>(_3069) * _3179;
    float _3211 = float(uint(_3195));
    float _3213 = _1431 * _325;
    float _3215 = _1431 * _317;
    float _3217 = trunc(_3209);
    float _3219 = precise::max(_3217, 0.0);
    uint _3221 = uint(_3219);
    float _3223 = _1431 * _329;
    float _3225 = as_type<float>(_3115) * _3211;
    float _3227 = fma(_1427, _289, _3213);
    float _3229 = fma(_1427, _285, _3215);
    float _3231 = fma(_1427, _299, _3223);
    float _3233 = _3183 * _325;
    float _3235 = fma(_1441, _341, _3227);
    float _3237 = trunc(_3175);
    float _3239 = precise::max(_3237, 0.0);
    uint _3241 = uint(_3239);
    float _3243 = fma(_1441, _337, _3229);
    float _3245 = fma(_1441, _345, _3231);
    float _3247 = _3183 * _317;
    float _3249 = _3183 * _329;
    float _3251 = _3203 * _325;
    float _3253 = _3203 * _317;
    float _3255 = _3203 * _329;
    float _3257 = trunc(_3225);
    float _3259 = precise::max(_3257, 0.0);
    uint _3261 = uint(_3259);
    int _3263 = ~_2985;
    int _3265 = _3263 + 1;
    out.m_78.x = _3235;
    out.m_78.y = _3243;
    out.m_78.z = _3245;
    int _3267 = int(_3137) + int(_3221);
    float _3269 = fma(_3131, _299, _3249);
    int _3271 = int(_3085) + int(_3173);
    float _3273 = -_2438;
    float _3275 = _3273 + 1.0;
    int _3277 = ~_2893;
    int _3279 = _3277 + 1;
    int _3281 = _3265 * _3267;
    int _3283 = _3281 + _3065;
    int _3285 = ~_2915;
    int _3287 = _3285 + 1;
    int _3289 = ~_3011;
    int _3291 = _3289 + 1;
    int _3293 = _3279 * _3271;
    int _3295 = _3293 + _3019;
    int _3297 = int(_3113) + int(_3241);
    float _3299 = fma(_3123, _285, _3253);
    float _3301 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    int _3303 = int(_3155) + int(_3261);
    float _3305 = fma(_3207, _337, _3299);
    int _3307 = _3287 * _3297;
    int _3309 = _3307 + _3035;
    bool _3311 = uint(_3295) >= uint(_2893);
    float _3313 = fma(_3123, _289, _3251);
    float _3315 = fma(_3123, _299, _3255);
    int _3317 = _3291 * _3303;
    int _3319 = _3317 + _3099;
    bool _3321 = !_3311;
    int _3323 = _3321 ? 0 : (-1);
    float _3325 = fma(_3207, _341, _3313);
    bool _3327 = uint(_3309) >= uint(_2915);
    int _3329 = ~_3271;
    int _3331 = _3329 + _3323;
    int _3333 = _3331 + 1;
    bool _3335 = uint(_3319) >= uint(_3011);
    bool _3337 = uint(_3283) >= uint(_2985);
    int _3339 = _3019 ^ _2893;
    float _3341 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    bool _3343 = !_3327;
    int _3345 = _3343 ? 0 : (-1);
    bool _3347 = _2893 == 0;
    bool _3349 = _2893 == 0;
    int _3351 = _2893 * _3333;
    int _3353 = _3351 + _3019;
    int _3355 = _3035 ^ _2915;
    float _3357 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    bool _3359 = !_3337;
    int _3361 = _3359 ? 0 : (-1);
    uint _3363 = uint(int(uint(_3339) >> uint(31)));
    uint _3365 = uint(int(uint(_3355) >> uint(31)));
    bool _3367 = !_3335;
    int _3369 = _3367 ? 0 : (-1);
    int _3371 = ~_3361;
    int _3373 = _3267 + _3371;
    int _3375 = _3373 + 1;
    int _3377 = ~int(_3363);
    int _3379 = _3377 + 1;
    int _3381 = ~_3369;
    int _3383 = _3303 + _3381;
    int _3385 = _3383 + 1;
    int _3387 = ~int(_3365);
    int _3389 = _3387 + 1;
    float _3391 = _3357 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    int _3393 = ~_3297;
    int _3395 = _3393 + _3345;
    int _3397 = _3395 + 1;
    float _3399 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    int _3401 = _3375 ^ _3379;
    int _3403 = _3385 ^ _3389;
    int _3405 = _2915 * _3397;
    int _3407 = _3405 + _3035;
    int _3409 = ~_3379;
    int _3411 = _3409 + _3401;
    int _3413 = _3411 + 1;
    float _3415 = _3341 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    bool _3417 = _2915 == 0;
    bool _3419 = _2915 == 0;
    float _3421 = _3301 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    int _3423 = ~_3389;
    int _3425 = _3423 + _3403;
    int _3427 = _3425 + 1;
    bool _3429 = !_3347;
    int _3431 = _3429 ? _3353 : (-1);
    bool _3433 = !_3349;
    int _3435 = _3433 ? _3413 : (-1);
    float _3437 = _3399 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    bool _3439 = !_3417;
    int _3441 = _3439 ? _3407 : (-1);
    bool _3443 = !_3419;
    int _3445 = _3443 ? _3427 : (-1);
    float _3447 = float(_3435);
    float _3449 = float(_3431);
    float _3451 = float(_3441);
    float _3453 = -_575;
    float _3455 = fma(_3415, _3447, _3453);
    float _3457 = float(_3445);
    float _3459 = fma(_3421, _3449, _569);
    float _3461 = _3079 + 0.5;
    float _3463 = fma(_3391, _3451, _751);
    float _3465 = _3063 + (-0.5);
    float _3467 = -_761;
    float _3469 = fma(_3437, _3457, _3467);
    float _3471 = _2629 + (-0.5);
    float _3473 = fma(_3421, _3461, _3459);
    float _3475 = -_755;
    float _3477 = _3475 + 1.0;
    float _3479 = -_3415;
    float _3481 = fma(_3479, _3465, _3455);
    float _3483 = -_3437;
    float _3485 = fma(_3483, _3471, _3469);
    float _3487 = fma(_3207, _345, _3315);
    float _3489 = -_3477;
    float _3491 = fma(_3079, _3489, _3473);
    float _3493 = fma(_3063, _2491, _3481);
    float _3495 = fma(_2629, _2507, _3485);
    float _3497 = fma(_1617, (*spvDescriptorSet0.vp_c8)._m0[11].x, _2511);
    float _3499 = _2499 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _3501 = fma(_3199, _345, _3269);
    out.m_80.x = _3325;
    out.m_80.y = _3305;
    out.m_80.z = _3487;
    float _3503 = fma(_1611, (*spvDescriptorSet0.vp_c8)._m0[11].z, _3497);
    float _3505 = fma(_1617, (*spvDescriptorSet0.vp_c8)._m0[10].x, _3499);
    float _3507 = _3089 + 0.5;
    float _3509 = -_633;
    float _3511 = _3509 + 1.0;
    float _3513 = _3503 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _3515 = fma(_1611, (*spvDescriptorSet0.vp_c8)._m0[10].z, _3505);
    float _3517 = fma(_3391, _3507, _3463);
    float _3519 = fma(_3131, _289, _3233);
    float _3521 = 1.0 / _3513;
    float _3523 = _3515 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _3525 = -_3511;
    float _3527 = fma(_3089, _3525, _3517);
    float _3529 = fma(_3131, _285, _3247);
    float _3531 = _3523 + _3513;
    out.m_82.x = _3491;
    out.m_82.y = _3493;
    out.m_82.z = _3527;
    out.m_82.w = _3495;
    float _3533 = fma(_3199, _341, _3519);
    float _3535 = fma(_3199, _337, _3529);
    float _3537 = in.m_66.x;
    bool _3539 = _2134 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _3541 = isnan(_2134);
    bool _3543 = _3539 || _3541;
    bool _3545 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _3547 = _3543 || _3545;
    out.m_84.x = _3533;
    out.m_84.y = _3535;
    out.m_84.z = _3501;
    float _3549 = _3531 * _3521;
    float _3551 = _3549 * 0.5;
    float _3553 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _3555 = fma(_3551, (*spvDescriptorSet0.vp_c8)._m0[30].w, _3553);
    float _3557 = _2601 * _2460;
    float _3559 = -_2601;
    float _3561 = _3559 + 1.0;
    float _3563 = 1.0 / _3555;
    float _3565 = _2481 * _3557;
    float _3567 = _2471 * _3561;
    float _3569 = fma(_2471, _3565, _2469);
    float _3571 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _3573 = _3563 * _3571;
    float _3575 = abs(_3573);
    float _3577 = log2(_3575);
    bool _3579 = _3573 <= 8000.0;
    bool _3581 = isnan(_3573);
    bool _3583 = _3579 || _3581;
    bool _3585 = isnan(8000.0);
    bool _3587 = _3583 || _3585;
    float _3589 = float(_3587);
    float _3591 = _3577 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _3593 = exp2(_3591);
    float _3595 = fma(_3593, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _3597 = precise::clamp(_3595, 0.0, 1.0);
    float _3599 = fma(_3597, -2.0, 3.0);
    float _3601 = _3597 * _3597;
    float _3603 = _3601 * _3599;
    float _3605 = fma(_2388, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2543);
    float _3607 = -_3603;
    float _3609 = _3607 + 1.0;
    float _3611 = _3605 + _2408;
    out.gl_Position.x = _2442;
    out.gl_Position.y = _2430;
    out.gl_Position.z = _3605;
    out.gl_Position.w = _2408;
    float _3613 = fma(_3609, (*spvDescriptorSet0.vp_c15)._m0[654].w, _3603);
    float _3615 = _3611 * 0.5;
    float _3617 = _3589 * _3613;
    out.m_86.z = _3615;
    out.m_86.w = _2408;
    float _3619 = _3617 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _3621 = _3275 * _3619;
    float _3623 = precise::clamp(_3621, 0.0, 1.0);
    float _3625 = _3605;
    float _3627 = _3615;
    float _3629 = _2442;
    if (!_3547)
    {
        _2581 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _3631 = _2581;
    float _3633 = _3631;
    float _3635 = _3631;
    if (!_3547)
    {
        _3625 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _3637 = _3625;
    float _3639 = -_3623;
    float _3641 = fma(_3639, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _3643 = _2471 * _3557;
    float _3645 = _3637;
    float _3647 = _3637;
    if (!_3547)
    {
        _3627 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _3649 = _3627;
    float _3651 = _3641 * _3537;
    float _3653 = fma(_2477, _3643, _2465);
    float _3655 = fma(_2479, _3643, _2467);
    float _3657 = _3651;
    float _3659 = _3649;
    float _3661 = _3649;
    if (!_3547)
    {
        _2583 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _3663 = _2583;
    float _3665 = _3651 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _3667 = _3663;
    float _3669 = _3663;
    if (!_3547)
    {
        _3629 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _3671 = _3629;
    out.m_88.x = _3653;
    out.m_88.y = _3655;
    out.m_88.z = _3569;
    out.m_88.w = _3567;
    float _3673 = _3671;
    float _3675 = _3671;
    if (!_3547)
    {
        _3657 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _3677 = _3657;
    out.m_90.x = _3665;
    bool _3679 = !_3547;
    float _3681 = _3677;
    float _3683 = _3677;
    if (!_3679)
    {
        bool _3685 = _2134 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _3687 = isnan(_2134);
        bool _3689 = _3685 || _3687;
        bool _3691 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _3693 = _3689 || _3691;
        if (!_3693)
        {
            float _3695 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _3697 = _2134 + _3695;
            float _3699 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _3701 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _3699;
            float _3703 = 1.0 / _3701;
            float _3705 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _3707 = _3705 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _3709 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _3711 = _3709 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _3713 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _3715 = _3713 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _3717 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _3719 = _3717 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _3721 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _3723 = _3721 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _3725 = _3697 * _3703;
            float _3727 = precise::clamp(_3725, 0.0, 1.0);
            float _3729 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _3731 = _3729 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _3733 = fma(_3727, _3707, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _3735 = fma(_3727, _3731, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _3737 = fma(_3727, _3711, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _3739 = fma(_3727, _3715, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _3741 = fma(_3727, _3719, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _3743 = fma(_3727, _3723, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _3635 = _3735;
            _3675 = _3741;
            _3661 = _3733;
            _3669 = _3739;
            _3647 = _3737;
            _3683 = _3743;
            _3745 = true;
        }
        else
        {
            bool _3747 = _2134 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _3749 = isnan(_2134);
            bool _3751 = _3747 || _3749;
            bool _3753 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _3755 = _3751 || _3753;
            if (!_3755)
            {
                _3659 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _3757 = _3659;
            _3661 = _3757;
            if (!_3755)
            {
                _3633 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _3759 = _3633;
            _3635 = _3759;
            if (!_3755)
            {
                _3645 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _3761 = _3645;
            _3647 = _3761;
            if (!_3755)
            {
                _3667 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _3763 = _3667;
            _3669 = _3763;
            if (!_3755)
            {
                _3673 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _3765 = _3673;
            _3675 = _3765;
            if (!_3755)
            {
                _3681 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _3767 = _3681;
            bool _3769 = !_3755;
            _3683 = _3767;
            if (!_3769)
            {
                bool _3771 = _2134 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _3773 = isnan(_2134);
                bool _3775 = _3771 || _3773;
                bool _3777 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _3779 = _3775 || _3777;
                if (!_3779)
                {
                    float _3781 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _3783 = _2134 + _3781;
                    float _3785 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _3787 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _3785;
                    float _3789 = 1.0 / _3787;
                    float _3791 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _3793 = _3791 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _3795 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _3797 = _3795 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _3799 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _3801 = _3799 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _3803 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _3805 = _3803 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _3807 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _3809 = _3807 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _3811 = _3783 * _3789;
                    float _3813 = precise::clamp(_3811, 0.0, 1.0);
                    float _3815 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _3817 = _3815 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _3819 = fma(_3813, _3793, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _3821 = fma(_3813, _3817, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _3823 = fma(_3813, _3797, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _3825 = fma(_3813, _3801, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _3827 = fma(_3813, _3805, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _3829 = fma(_3813, _3809, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _3635 = _3821;
                    _3675 = _3827;
                    _3661 = _3819;
                    _3669 = _3825;
                    _3647 = _3823;
                    _3683 = _3829;
                    _3745 = true;
                }
                else
                {
                    _3635 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _3675 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _3661 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _3669 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _3647 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _3683 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _3745 = false;
    float _3831 = _3635;
    float _3833 = _3675;
    float _3835 = _3661;
    float _3837 = _3669;
    float _3839 = _3647;
    float _3841 = _3683;
    float _3843 = fma(_3535, -0.5, 0.5);
    float _3845 = precise::clamp(_3843, 0.0, 1.0);
    float _3847 = -_3831;
    float _3849 = _3847 + _3833;
    float _3851 = -_3835;
    float _3853 = _3851 + _3837;
    float _3855 = -_3839;
    float _3857 = _3855 + _3841;
    bool _3859 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _3861 = fma(_3845, _3849, _3831);
    float _3863 = fma(_3845, _3853, _3835);
    float _3865 = fma(_3845, _3857, _3839);
    float _3867 = _3861 * 0.586610972881317138671875;
    out.m_92.x = 0.0;
    float _3869 = fma(_3863, 0.298911988735198974609375, _3867);
    float _3871 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _3873 = fma(_3865, 0.114477999508380889892578125, _3869);
    out.m_51.x = _3871;
    float _3875 = -_3873;
    float _3877 = _3863 + _3875;
    float _3879 = -_3873;
    float _3881 = _3861 + _3879;
    float _3883 = -_3873;
    float _3885 = _3865 + _3883;
    float _3887 = fma(_3877, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3873);
    float _3889 = fma(_3881, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3873);
    float _3891 = fma(_3885, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3873);
    out.m_94.x = _3887;
    out.m_94.y = _3889;
    out.m_94.z = _3891;
    if (!_3859)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _3893 = -_2120;
    float _3895 = _3893 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
    float _3897 = -_2100;
    float _3899 = _3897 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
    float _3901 = -_1603;
    float _3903 = _3901 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
    float _3905 = _3895 * _3895;
    float _3907 = fma(_3899, _3899, _3905);
    float _3909 = fma(_3903, _3903, _3907);
    float _3911 = sqrt(_3909);
    float _3913 = rsqrt(_3909);
    float _3915 = -_3911;
    float _3917 = _3915 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _3919 = _3917 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
    float _3921 = precise::clamp(_3919, 0.0, 1.0);
    float _3923 = _3899 * _3913;
    float _3925 = _3895 * _3913;
    float _3927 = abs(_3921);
    float _3929 = log2(_3927);
    float _3931 = _3903 * _3913;
    float _3933 = _3923 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
    float _3935 = _3535 * _3925;
    float _3937 = -_3925;
    float _3939 = -_3933;
    float _3941 = fma(_3937, (*spvDescriptorSet0.vp_c15)._m0[656].y, _3939);
    float _3943 = fma(_3533, _3923, _3935);
    float _3945 = -_3931;
    float _3947 = fma(_3945, (*spvDescriptorSet0.vp_c15)._m0[656].z, _3941);
    float _3949 = fma(_3501, _3931, _3943);
    float _3951 = precise::clamp(_3949, 0.0, 1.0);
    float _3953 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
    float _3955 = _3947 + _3953;
    float _3957 = _3929 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
    float _3959 = _3955 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
    float _3961 = precise::clamp(_3959, 0.0, 1.0);
    float _3963 = exp2(_3957);
    float _3965 = _3963 * _3961;
    float _3967 = _3951 * _3965;
    float _3969 = _3967 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
    float _3971 = _3967 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
    float _3973 = _3967 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
    out.m_92.x = _3969;
    out.m_92.y = _3971;
    out.m_92.z = _3973;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_74 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_76 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_82 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_86 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_94 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_51 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_80 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_84 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_72 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_78 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_92 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_90 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_88 = float4(0.0, 0.0, 0.0, 1.0);
    bool _3745 = false;
    bool _367 = false;
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
        float _4030 = as_type<float>(_129);
        out.gl_Position.z = _4030;
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
        float _4099 = as_type<float>(_167);
        out.gl_Position.z = _4099;
    }
    if (_161)
    {
        return out;
    }
    float _169 = in.m_55.x;
    float _171 = in.m_55.y;
    float _173 = in.m_55.z;
    float _175 = in.m_57.x;
    float _177 = in.m_57.y;
    float _179 = in.m_57.z;
    float _181 = in.m_59.x;
    float _183 = in.m_59.y;
    float _185 = in.m_59.z;
    float _187 = as_type<float>(int(gl_VertexIndex));
    float _189 = _169 * _169;
    float _191 = _171 * _171;
    float _193 = _173 * _173;
    float _195 = fma(_175, _175, _189);
    float _197 = fma(_177, _177, _191);
    float _199 = fma(_179, _179, _193);
    float _201 = fma(_181, _181, _195);
    float _203 = fma(_183, _183, _197);
    float _205 = fma(_185, _185, _199);
    float _207 = sqrt(_201);
    float _209 = sqrt(_203);
    bool _211 = _207 > 0.0;
    float _213 = sqrt(_205);
    bool _215 = _209 > 0.0;
    float _217 = _201;
    float _219 = _203;
    int _221 = as_type<int>(_185);
    if (_211)
    {
        float _223 = rsqrt(_201);
        _217 = _223;
    }
    float _225 = _217;
    float _227 = 0.0;
    float _229 = 0.0;
    if (!_211)
    {
        _227 = 0.0;
        _229 = 0.0;
    }
    float _231 = _227;
    float _233 = _229;
    float _235 = 0.0;
    float _237 = _233;
    float _239 = _231;
    if (!_211)
    {
        _235 = 0.0;
    }
    float _241 = _235;
    bool _243 = _213 > 0.0;
    float _245 = 0.0;
    float _247 = _241;
    if (_215)
    {
        float _249 = rsqrt(_203);
        _245 = _249;
    }
    float _251 = _245;
    int _253 = as_type<int>(_187) & 1;
    bool _255 = _253 != 0;
    int _257 = as_type<int>(_187) & 2;
    bool _259 = _257 != 0;
    float _261 = 0.0;
    float _263 = 0.0;
    if (!_215)
    {
        _261 = 0.0;
        _263 = 0.0;
    }
    float _265 = _261;
    float _267 = _263;
    float _269 = 0.0;
    float _271 = _267;
    float _273 = _265;
    if (!_215)
    {
        _269 = 0.0;
    }
    float _275 = _269;
    bool _277 = !_255;
    float _279 = _277 ? (-0.5) : 0.5;
    float _281 = _275;
    if (_211)
    {
        float _283 = _225 * _169;
        _237 = _283;
    }
    float _285 = _237;
    if (_211)
    {
        float _287 = _225 * _175;
        _239 = _287;
    }
    float _289 = _239;
    float _291 = _209;
    if (_243)
    {
        float _293 = rsqrt(_205);
        _291 = _293;
    }
    float _295 = _291;
    if (_211)
    {
        float _297 = _225 * _181;
        _247 = _297;
    }
    float _299 = _247;
    bool _301 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _303 = 0.0;
    if (!_243)
    {
        _303 = 0.0;
    }
    float _305 = _303;
    float _307 = 0.0;
    float _309 = _305;
    if (!_243)
    {
        _307 = 0.0;
    }
    float _311 = _307;
    float _313 = _311;
    if (_215)
    {
        float _315 = _251 * _171;
        _271 = _315;
    }
    float _317 = _271;
    if (!_243)
    {
        _219 = 0.0;
    }
    float _319 = _219;
    float _321 = _319;
    if (_215)
    {
        float _323 = _251 * _177;
        _273 = _323;
    }
    float _325 = _273;
    if (_215)
    {
        float _327 = _251 * _183;
        _281 = _327;
    }
    float _329 = _281;
    bool _331 = !_259;
    float _333 = _331 ? (-0.5) : 0.5;
    if (_243)
    {
        float _335 = _295 * _173;
        _309 = _335;
    }
    float _337 = _309;
    if (_243)
    {
        float _339 = _295 * _179;
        _313 = _339;
    }
    float _341 = _313;
    if (_243)
    {
        float _343 = _295 * _185;
        _321 = _343;
    }
    float _345 = _321;
    bool _347 = !_301;
    float _365;
    if (!_347)
    {
        float _349 = in.m_64.x;
        float _351 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _353 = _349 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _355 = fma(_353, (*spvDescriptorSet0.vp_c9)._m0[12].x, _147);
        float _357 = _355 * _351;
        float _359 = floor(_357);
        float _361 = -_359;
        float _363 = _357 + _361;
        _365 = _363;
        _367 = true;
    }
    else
    {
        float _369 = float(_113);
        float _371 = 1.0 / _369;
        float _373 = _147 * _371;
        _365 = _373;
    }
    _367 = false;
    float _375 = _365;
    float _377 = in.m_48.x;
    float _379 = in.m_48.y;
    float _381 = in.m_48.z;
    float _383 = -(*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _385 = _375 + _383;
    float _387 = in.m_66.y;
    float _389 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _391 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _389;
    float _393 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _395 = _393 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _397 = in.m_64.x;
    float _399 = in.m_64.y;
    float _401 = in.m_64.z;
    float _403 = in.m_64.w;
    float _405 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _407 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _405;
    float _409 = 1.0 / _391;
    float _411 = -(*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _413 = (*spvDescriptorSet0.vp_c9)._m0[148].w + _411;
    float _415 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _417 = _415 + (*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _419 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _421 = _375 + _419;
    float _423 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _425 = _375 + _423;
    float _427 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _429 = _375 + _427;
    float _431 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _433 = _375 + _431;
    float _435 = 1.0 / _407;
    float _437 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _439 = in.m_57.w;
    bool _441 = _375 >= (*spvDescriptorSet0.vp_c9)._m0[147].w;
    bool _443 = isnan(_375);
    bool _445 = _441 || _443;
    bool _447 = isnan((*spvDescriptorSet0.vp_c9)._m0[147].w);
    bool _449 = _445 || _447;
    float _451 = float(_449);
    float _453 = _183 * _379;
    float _455 = _177 * _379;
    float _457 = 1.0 / _413;
    float _459 = -(*spvDescriptorSet0.vp_c9)._m0[149].w;
    float _461 = (*spvDescriptorSet0.vp_c9)._m0[150].w + _459;
    float _463 = _379 + _387;
    float _465 = fma(_175, _377, _455);
    float _467 = _397 * 2.0;
    int _469 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _471 = _469 != 0;
    float _473 = 1.0 / _395;
    float _475 = fma(_181, _377, _453);
    float _477 = _397 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _479 = fma(_179, _381, _465);
    float _481 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _483 = fma(_185, _381, _475);
    float _485 = float(_113);
    float _487 = -(*spvDescriptorSet0.vp_c9)._m0[149].w;
    float _489 = _375 + _487;
    float _491 = floor(_467);
    float _493 = -(*spvDescriptorSet0.vp_c9)._m0[148].w;
    float _495 = _493 + (*spvDescriptorSet0.vp_c9)._m0[149].w;
    float _497 = _399 * 2.0;
    float _499 = _385 * _457;
    if (_471)
    {
        _221 = 0;
    }
    int _501 = _221;
    float _503 = _425 * _435;
    int _505 = _501;
    if (!_471)
    {
        _505 = 1;
    }
    int _507 = _505;
    float _509 = _433 * _409;
    float _511 = 1.0 / _417;
    float _513 = _421 * _473;
    bool _515 = _507 != 1;
    float _517 = _479 + _439;
    bool _519 = _375 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _521 = isnan(_375);
    bool _523 = _519 || _521;
    bool _525 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _527 = _523 || _525;
    float _529 = float(_527);
    float _531 = floor(_497);
    float _533 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    bool _535 = _491 > 0.0;
    float _537 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _539 = _399 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _541 = 1.0 / _495;
    float _543 = as_type<float>(_507);
    if (!_515)
    {
        _543 = _399;
    }
    float _545 = _543;
    float _547 = -_537;
    float _549 = fma(_477, 2.0, _547);
    float _551 = fma(_539, -2.0, _437);
    float _553 = -(*spvDescriptorSet0.vp_c9)._m0[148].w;
    float _555 = _375 + _553;
    bool _557 = _491 >= 0.0;
    bool _559 = isnan(_491);
    bool _561 = _557 || _559;
    bool _563 = isnan(0.0);
    bool _565 = _561 || _563;
    float _567 = -_147;
    float _569 = fma(_567, (*spvDescriptorSet0.vp_c9)._m0[76].x, _549);
    float _571 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].y);
    int _573 = int(_571);
    float _575 = fma(_147, (*spvDescriptorSet0.vp_c9)._m0[76].y, _551);
    bool _577 = _531 > 0.0;
    float _579 = _429 * _511;
    bool _581 = _531 >= 0.0;
    bool _583 = isnan(_531);
    bool _585 = _581 || _583;
    bool _587 = isnan(0.0);
    bool _589 = _585 || _587;
    float _591 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    int _593 = _565 ? 0 : 1;
    float _595 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _597 = int(_595);
    float _599 = _545;
    if (_515)
    {
        _599 = _397;
    }
    float _601 = _599;
    float _603 = _555 * _541;
    int _605 = ~_593;
    int _607 = _605 + 1;
    int _609 = _607 + 1;
    float _611 = _397 + _399;
    int _613 = _609;
    float _615 = _601;
    if (!_535)
    {
        int _617 = ~_593;
        int _619 = _617 + 1;
        _613 = _619;
    }
    int _621 = _613;
    float _623 = fma(_601, (*spvDescriptorSet0.vp_c9)._m0[83].z, _591);
    if (!_515)
    {
        _615 = _401;
    }
    float _625 = _615;
    float _627 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _629 = log2(_627);
    float _631 = float(_573);
    float _633 = fma(_147, (*spvDescriptorSet0.vp_c9)._m0[82].z, _623);
    float _635 = as_type<float>(_573);
    float _637 = _625;
    if (!_515)
    {
        _635 = _399;
    }
    float _639 = _635;
    float _641 = _611 + (-1.0);
    float _643 = _639;
    if (_515)
    {
        _643 = _397;
    }
    float _645 = _643;
    if (_515)
    {
        _637 = _399;
    }
    float _647 = _637;
    float _649 = 1.0 / _461;
    float _651 = float(_597);
    float _653 = as_type<float>(_597);
    if (!_515)
    {
        _653 = _401;
    }
    float _655 = _653;
    float _657 = fma(_647, (*spvDescriptorSet0.vp_c9)._m0[83].w, _533);
    float _659 = _655;
    if (_515)
    {
        _659 = _399;
    }
    float _661 = _659;
    int _663 = _589 ? 0 : 1;
    float _665 = _629 * _147;
    float _667 = 1.0 / _651;
    float _669 = _401 * 2.0;
    int _671 = ~_663;
    int _673 = _671 + 1;
    int _675 = _673 + 1;
    float _677 = fma(_147, (*spvDescriptorSet0.vp_c9)._m0[82].w, _657);
    int _679 = _675;
    if (!_577)
    {
        int _681 = ~_663;
        int _683 = _681 + 1;
        _679 = _683;
    }
    int _685 = _679;
    float _687 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _689 = _489 * _649;
    float _691 = exp2(_665);
    float _693 = _645 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _695 = _661 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _697 = fma(_399, (*spvDescriptorSet0.vp_c9)._m0[78].w, _687);
    float _699 = fma(_695, -2.0, _481);
    float _701 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _703 = 1.0 + _701;
    float _705 = 1.0 / _485;
    bool _707 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _709 = isnan(1.0);
    bool _711 = _707 || _709;
    bool _713 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _715 = _711 || _713;
    float _717 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    bool _719 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _721 = isnan(0.0);
    bool _723 = _719 || _721;
    bool _725 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _727 = _723 || _725;
    float _729 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _731 = _401 + _397;
    float _733 = -_717;
    float _735 = fma(_693, 2.0, _733);
    float _737 = 1.0 / _631;
    float _739 = -_691;
    float _741 = _739 + 1.0;
    float _743 = fma(_397, (*spvDescriptorSet0.vp_c9)._m0[78].z, _729);
    float _745 = _667 * _147;
    float _747 = fma(_147, (*spvDescriptorSet0.vp_c9)._m0[77].w, _697);
    float _749 = -_147;
    float _751 = fma(_749, (*spvDescriptorSet0.vp_c9)._m0[81].x, _735);
    float _753 = _727 ? _741 : 0.0;
    float _755 = fma(_147, (*spvDescriptorSet0.vp_c9)._m0[77].z, _743);
    float _757 = 1.0 / _703;
    float _759 = _705 * _147;
    float _761 = fma(_147, (*spvDescriptorSet0.vp_c9)._m0[81].y, _699);
    float _763 = _731 + (-1.0);
    float _765 = fma(_763, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _767 = _737 * _147;
    float _769 = floor(_669);
    float _771 = _401 + _399;
    float _773 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _775 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _773;
    bool _777 = _375 >= (*spvDescriptorSet0.vp_c9)._m0[150].w;
    bool _779 = isnan(_375);
    bool _781 = _777 || _779;
    bool _783 = isnan((*spvDescriptorSet0.vp_c9)._m0[150].w);
    bool _785 = _781 || _783;
    float _787 = float(_785);
    float _789 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _791 = _789 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _793 = _771 + (-1.0);
    if (_715)
    {
        float _795 = _753 * _757;
        _151 = _795;
    }
    float _797 = _151;
    float _799 = fma(_793, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _801 = -_787;
    float _803 = _801 + 1.0;
    float _805 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[201].y;
    float _807 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _809 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _807;
    float _811 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _813 = _811 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _815 = -(*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _817 = (*spvDescriptorSet0.vp_c9)._m0[148].y + _815;
    bool _819 = _769 >= 0.0;
    bool _821 = isnan(_769);
    bool _823 = _819 || _821;
    bool _825 = isnan(0.0);
    bool _827 = _823 || _825;
    float _829 = fma(_809, _509, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _831 = fma(_775, _509, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _833 = fma(_813, _513, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _835 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _837 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _835;
    bool _839 = _375 >= (*spvDescriptorSet0.vp_c9)._m0[149].w;
    bool _841 = isnan(_375);
    bool _843 = _839 || _841;
    bool _845 = isnan((*spvDescriptorSet0.vp_c9)._m0[149].w);
    bool _847 = _843 || _845;
    float _849 = float(_847);
    float _851 = fma(_791, _513, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _853 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _855 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _853;
    bool _857 = _375 >= (*spvDescriptorSet0.vp_c9)._m0[148].w;
    bool _859 = isnan(_375);
    bool _861 = _857 || _859;
    bool _863 = isnan((*spvDescriptorSet0.vp_c9)._m0[148].w);
    bool _865 = _861 || _863;
    float _867 = float(_865);
    float _869 = -(*spvDescriptorSet0.vp_c9)._m0[146].x;
    float _871 = _869 + (*spvDescriptorSet0.vp_c9)._m0[147].x;
    int _873 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _875 = _873 != 0;
    int _877 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _879 = _877 != 0;
    int _881 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _883 = _881 != 0;
    float _885 = fma(_855, _503, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _887 = fma(_837, _503, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _889 = _849 * _803;
    float _891 = -_849;
    float _893 = _891 + 1.0;
    float _895 = -_867;
    float _897 = _895 + 1.0;
    bool _899 = !_879;
    int _901 = _899 ? 0 : 1;
    float _903 = -(*spvDescriptorSet0.vp_c9)._m0[146].y;
    float _905 = _903 + (*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _907 = _867 * _893;
    float _909 = _451 * _897;
    bool _911 = _769 > 0.0;
    float _913 = -_451;
    float _915 = _913 + 1.0;
    float _917 = fma(_871, _579, (*spvDescriptorSet0.vp_c9)._m0[146].x);
    float _919 = fma(_905, _579, (*spvDescriptorSet0.vp_c9)._m0[146].y);
    bool _921 = _375 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _923 = isnan(_375);
    bool _925 = _921 || _923;
    bool _927 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _929 = _925 || _927;
    float _931 = float(_929);
    float _933 = _529 * _915;
    bool _935 = _375 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _937 = isnan(_375);
    bool _939 = _935 || _937;
    bool _941 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _943 = _939 || _941;
    float _945 = float(_943);
    float _947 = -_529;
    float _949 = _947 + 1.0;
    bool _951 = _375 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _953 = isnan(_375);
    bool _955 = _951 || _953;
    bool _957 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _959 = _955 || _957;
    float _961 = float(_959);
    float _963 = in.m_59.w;
    int _965 = _827 ? 0 : 1;
    float _967 = -_945;
    float _969 = _967 + 1.0;
    int _971 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 256;
    bool _973 = _971 != 0;
    int _975 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 512;
    bool _977 = _975 != 0;
    int _979 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1024;
    bool _981 = _979 != 0;
    int _983 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2048;
    bool _985 = _983 != 0;
    float _987 = _961 * _949;
    float _989 = -_961;
    float _991 = _989 + 1.0;
    float _993 = -(*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _995 = (*spvDescriptorSet0.vp_c9)._m0[148].x + _993;
    int _997 = ~_965;
    int _999 = _997 + 1;
    int _1001 = _999 + 1;
    bool _1003 = !_875;
    int _1005 = _1003 ? 0 : 1;
    float _1007 = _945 * _991;
    int _1009 = _1001;
    if (!_911)
    {
        int _1011 = ~_965;
        int _1013 = _1011 + 1;
        _1009 = _1013;
    }
    int _1015 = _1009;
    float _1017 = fma(_995, _499, (*spvDescriptorSet0.vp_c9)._m0[147].x);
    bool _1019 = !_883;
    int _1021 = _1019 ? 0 : 1;
    float _1023 = -(*spvDescriptorSet0.vp_c9)._m0[148].x;
    float _1025 = _1023 + (*spvDescriptorSet0.vp_c9)._m0[149].x;
    int _1027 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _1029 = _1027 != 0;
    int _1031 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _1033 = _1031 != 0;
    int _1035 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _1037 = _1035 != 0;
    float _1039 = _931 * _969;
    float _1041 = fma(_817, _499, (*spvDescriptorSet0.vp_c9)._m0[147].y);
    float _1043 = -(*spvDescriptorSet0.vp_c9)._m0[148].y;
    float _1045 = _1043 + (*spvDescriptorSet0.vp_c9)._m0[149].y;
    float _1047 = -_931;
    float _1049 = _1047 + 1.0;
    bool _1051 = !_1029;
    int _1053 = _1051 ? 0 : 1;
    float _1055 = _829 * _1039;
    float _1057 = fma(_1025, _603, (*spvDescriptorSet0.vp_c9)._m0[148].x);
    float _1059 = fma(_1045, _603, (*spvDescriptorSet0.vp_c9)._m0[148].y);
    int _1061 = abs(_1053);
    float _1063 = _797 + (*spvDescriptorSet0.vp_c9)._m0[202].y;
    float _1065 = fma(_1049, (*spvDescriptorSet0.vp_c9)._m0[143].x, _1055);
    float _1067 = float(_1015);
    float _1069 = _831 * _1039;
    float _1071 = float(_1061);
    float _1073 = _1063 * _805;
    float _1075 = fma(_833, _1007, _1065);
    float _1077 = fma(_1049, (*spvDescriptorSet0.vp_c9)._m0[143].y, _1069);
    bool _1079 = !_1033;
    int _1081 = _1079 ? 0 : 1;
    float _1083 = _1071 * _1067;
    float _1085 = fma(_885, _987, _1075);
    float _1087 = fma(_397, (*spvDescriptorSet0.vp_c9)._m0[203].y, _1073);
    float _1089 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1091 = _463 + _1089;
    float _1093 = in.m_68.x;
    float _1095 = in.m_68.y;
    float _1097 = in.m_68.z;
    float _1099 = _483 + _963;
    float _1101 = fma(_851, _1007, _1077);
    bool _1103 = !_1037;
    int _1105 = _1103 ? 0 : 1;
    float _1107 = _1091 * _1091;
    float _1109 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1111 = _517 + _1109;
    int _1113 = abs(_1081);
    float _1115 = floor(_1087);
    int _1117 = abs(_1105);
    float _1119 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1121 = _1099 + _1119;
    float _1123 = fma(_1111, _1111, _1107);
    float _1125 = _1087 + 0.25;
    float _1127 = _1083 * (-2.0);
    float _1129 = fma(_1121, _1121, _1123);
    float _1131 = floor(_1125);
    float _1133 = fma(_887, _987, _1101);
    float _1135 = float(_621);
    float _1137 = fma(_917, _933, _1085);
    float _1139 = float(_1113);
    float _1141 = fma(_641, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _1143 = float(_685);
    float _1145 = rsqrt(_1129);
    float _1147 = float(_1117);
    float _1149 = _1139 * _1135;
    int _1151 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 32768;
    bool _1153 = _1151 != 0;
    float _1155 = _397 + (-0.5);
    bool _1157 = !_977;
    int _1159 = _1157 ? 0 : 1;
    float _1161 = _1147 * _1143;
    bool _1163 = !_973;
    int _1165 = _1163 ? 0 : 1;
    float _1167 = fma(_1127, _1093, _1093);
    int _1169 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 65536;
    bool _1171 = _1169 != 0;
    int _1173 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 131072;
    bool _1175 = _1173 != 0;
    float _1177 = -_1115;
    float _1179 = _1087 + _1177;
    float _1181 = _1087 * 6.283185482025146484375;
    float _1183 = fma(_1155, (*spvDescriptorSet0.vp_c9)._m0[196].x, _1167);
    float _1185 = -_1131;
    float _1187 = _1125 + _1185;
    bool _1189 = !_1171;
    int _1191 = _1189 ? 0 : 1;
    float _1193 = _1181 * 0.15915493667125701904296875;
    bool _1195 = _1179 >= 0.5;
    bool _1197 = isnan(_1179);
    bool _1199 = _1195 || _1197;
    bool _1201 = isnan(0.5);
    bool _1203 = _1199 || _1201;
    float _1205 = fma(_1141, _1127, _1141);
    int _1207 = abs(_1191);
    float _1209 = _1091 * _1145;
    bool _1211 = _1187 > 0.5;
    float _1213 = _1193 * 6.283185482025146484375;
    float _1215 = sin(_1213);
    bool _1217 = !_1153;
    int _1219 = _1217 ? 0 : 1;
    float _1221 = -_1209;
    float _1223 = fma(_1221, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1091);
    bool _1225 = !_1203;
    float _1227 = _1225 ? 0.5 : (-0.5);
    float _1229 = _1111 * _1145;
    int _1231 = abs(_1219);
    float _1233 = _1223 * _1223;
    float _1235 = float(_1207);
    float _1237 = _1227 * (*spvDescriptorSet0.vp_c9)._m0[200].y;
    float _1239 = _1237 * 2.0;
    float _1241 = -_1229;
    float _1243 = fma(_1241, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1111);
    bool _1245 = !_1175;
    int _1247 = _1245 ? 0 : 1;
    float _1249 = _1235 * _1239;
    float _1251 = _1187;
    float _1253 = _1229;
    if (_1211)
    {
        float _1255 = -_1187;
        float _1257 = _1255 + 1.0;
        _1251 = _1257;
    }
    float _1259 = _1251;
    float _1261 = _1121 * _1145;
    float _1263 = float(_1231);
    float _1265 = _1215 * (*spvDescriptorSet0.vp_c9)._m0[200].y;
    int _1267 = abs(_1247);
    float _1269 = fma(_1259, 4.0, -1.0);
    float _1271 = fma(_1243, _1243, _1233);
    float _1273 = -_1261;
    float _1275 = fma(_1273, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1121);
    float _1277 = float(_1267);
    float _1279 = fma(_1263, _1265, _1249);
    float _1281 = _1269 * (*spvDescriptorSet0.vp_c9)._m0[200].y;
    float _1283 = fma(_1275, _1275, _1271);
    float _1285 = _1161 * (-2.0);
    float _1287 = fma(_1205, _797, _1183);
    float _1289 = fma(_1277, _1281, _1279);
    float _1291 = _401 + (-0.5);
    float _1293 = fma(_765, _1285, _765);
    float _1295 = fma(_1285, _1097, _1097);
    float _1297 = fma(_1289, 3.1415927410125732421875, _1095);
    float _1299 = _1149 * (-2.0);
    float _1301 = fma(_919, _933, _1133);
    float _1303 = fma(_1291, (*spvDescriptorSet0.vp_c9)._m0[196].z, _1295);
    float _1305 = _399 + (-0.5);
    float _1307 = fma(_1297, _1299, _1297);
    float _1309 = fma(_799, _1299, _799);
    float _1311 = fma(_1017, _909, _1137);
    float _1313 = fma(_1305, (*spvDescriptorSet0.vp_c9)._m0[196].y, _1307);
    float _1315 = in.m_70.x;
    float _1317 = in.m_70.y;
    float _1319 = fma(_1041, _909, _1301);
    float _1321 = fma(_1309, _797, _1313);
    float _1323 = -(*spvDescriptorSet0.vp_c9)._m0[149].x;
    float _1325 = (*spvDescriptorSet0.vp_c9)._m0[150].x + _1323;
    float _1327 = -(*spvDescriptorSet0.vp_c9)._m0[149].y;
    float _1329 = (*spvDescriptorSet0.vp_c9)._m0[150].y + _1327;
    float _1331 = fma(_1293, _797, _1303);
    float _1333 = fma(_1059, _907, _1319);
    float _1335 = fma(_1325, _689, (*spvDescriptorSet0.vp_c9)._m0[149].x);
    float _1337 = fma(_1329, _689, (*spvDescriptorSet0.vp_c9)._m0[149].y);
    float _1339 = sqrt(_1283);
    float _1341 = fma(_1057, _907, _1311);
    float _1343 = _1287 * 0.15915493667125701904296875;
    float _1345 = fma(_1337, _889, _1333);
    float _1347 = _1331 * 0.15915493667125701904296875;
    float _1349 = fma(_1335, _889, _1341);
    float _1351 = _1321 * 0.15915493667125701904296875;
    float _1353 = fma(_787, (*spvDescriptorSet0.vp_c9)._m0[150].y, _1345);
    float _1355 = _1343 * 6.283185482025146484375;
    float _1357 = sin(_1355);
    float _1359 = fma(_787, (*spvDescriptorSet0.vp_c9)._m0[150].x, _1349);
    float _1361 = _467 + (-1.0);
    float _1363 = fma(_1361, (*spvDescriptorSet0.vp_c9)._m0[191].x, _279);
    float _1365 = _1353 * _1317;
    float _1367 = _1343 * 6.283185482025146484375;
    float _1369 = cos(_1367);
    float _1371 = _1359 * _1315;
    float _1373 = _1145 * _1339;
    float _1375 = fma(_1361, (*spvDescriptorSet0.vp_c9)._m0[191].x, _333);
    float _1377 = _1365 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1379 = _1371 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1381 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _1363);
    float _1383 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _1375);
    float _1385 = _1347 * 6.283185482025146484375;
    float _1387 = cos(_1385);
    float _1389 = _1379 * _1373;
    float _1391 = _1377 * _1373;
    float _1393 = _1373 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _1395 = _1393 * 0.5;
    float _1397 = _1389 * _1381;
    float _1399 = _1391 * _1383;
    float _1401 = _1351 * 6.283185482025146484375;
    float _1403 = sin(_1401);
    float _1405 = _1351 * 6.283185482025146484375;
    float _1407 = cos(_1405);
    float _1409 = _1369 * _1387;
    float _1411 = _1357 * _1387;
    float _1413 = _1409 * _1395;
    float _1415 = _1347 * 6.283185482025146484375;
    float _1417 = sin(_1415);
    float _1419 = _1357 * _1403;
    float _1421 = _1369 * _1407;
    float _1423 = _1357 * _1407;
    float _1425 = _1369 * _1403;
    float _1427 = _1407 * _1387;
    float _1429 = _1403 * _1387;
    float _1431 = fma(_1417, _1421, _1419);
    float _1433 = _1417 * _1395;
    float _1435 = -_1423;
    float _1437 = fma(_1417, _1425, _1435);
    float _1439 = -_1425;
    float _1441 = fma(_1417, _1423, _1439);
    float _1443 = fma(_1431, _1397, _1413);
    float _1445 = _1411 * _1395;
    float _1447 = -_1433;
    float _1449 = fma(_1427, _1397, _1447);
    float _1451 = fma(_1417, _1419, _1421);
    float _1453 = -_1399;
    float _1455 = fma(_1437, _1453, _1443);
    float _1457 = fma(_1441, _1397, _1445);
    float _1459 = -_1399;
    float _1461 = fma(_1429, _1459, _1449);
    bool _1463 = !_981;
    int _1465 = _1463 ? 0 : 1;
    float _1467 = _1455 * _329;
    float _1469 = -_1399;
    float _1471 = fma(_1451, _1469, _1457);
    float _1473 = _1455 * _325;
    float _1475 = _1455 * _317;
    float _1477 = fma(_1461, _299, _1467);
    float _1479 = fma(_1461, _289, _1473);
    float _1481 = fma(_1461, _285, _1475);
    float _1483 = fma(_1471, _345, _1477);
    float _1485 = fma(_1471, _341, _1479);
    float _1487 = fma(_1471, _337, _1481);
    float _1489 = _1099 + _1483;
    float _1491 = _517 + _1485;
    float _1493 = _463 + _1487;
    float _1495 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1497 = _1489 + _1495;
    float _1499 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1501 = _1491 + _1499;
    float _1503 = _1497 * _1497;
    float _1505 = fma(_1501, _1501, _1503);
    bool _1507 = !_985;
    int _1509 = _1507 ? 0 : 1;
    float _1511 = sqrt(_1505);
    bool _1513 = _1511 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1515 = _1471;
    float _1517 = _1487;
    float _1519 = _1491;
    float _1521 = _1501;
    if (!_1513)
    {
        _1515 = _1491;
    }
    float _1523 = _1515;
    float _1525 = _1523;
    if (!_1513)
    {
        _1517 = _1489;
    }
    float _1527 = _1517;
    float _1529 = _1527;
    if (!_1513)
    {
        _1519 = _1493;
    }
    float _1531 = _1519;
    bool _1533 = !_1513;
    float _1535 = _1531;
    if (!_1533)
    {
        float _1537 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1539 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1541 = _1511 + _1539;
        float _1543 = _1493 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1545 = rsqrt(_1505);
        float _1547 = _1541 * _1537;
        float _1549 = _1547 * 0.15915493667125701904296875;
        float _1551 = _1549 * 6.283185482025146484375;
        float _1553 = sin(_1551);
        float _1555 = _1549 * 6.283185482025146484375;
        float _1557 = cos(_1555);
        float _1559 = fma(_1553, _1543, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1561 = _1545 * _1559;
        float _1563 = _1557 + (-1.0);
        float _1565 = fma(_1501, _1561, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1567 = fma(_1497, _1561, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _1569 = _1563 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1571 = fma(_1493, _1557, _1569);
        _1529 = _1567;
        _1525 = _1565;
        _1535 = _1571;
    }
    float _1573 = _1529;
    float _1575 = _1525;
    float _1577 = _1535;
    float _1579 = -(*spvDescriptorSet0.vp_c15)._m0[630].y;
    float _1581 = _1573 + _1579;
    float _1583 = -(*spvDescriptorSet0.vp_c15)._m0[630].x;
    float _1585 = _1575 + _1583;
    float _1587 = fma(_1581, (*spvDescriptorSet0.vp_c15)._m0[630].z, 0.5);
    float _1589 = fma(_1585, (*spvDescriptorSet0.vp_c15)._m0[630].z, 0.5);
    float2 _6243 = float2(_1589, _1587);
    float _1591 = dm_bs(spvDescriptorSet0.vp_t_tcb_28.sample(spvDescriptorSet0.vp_t_tcb_28Smplr, select(_6243, float2(0.0), isnan(_6243)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_28, spvDescriptorSet0.vp_t_tcb_28Smplr_w, select(_6243, float2(0.0), isnan(_6243)), level(0.0)).x;
    float _1593 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _1595 = int(_1593);
    int _1597 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _1599 = _1597 != 0;
    float _1601 = -_1261;
    float _1603 = fma(_1601, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1573);
    int _1605 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _1607 = _1605 != 0;
    float _1609 = -_1261;
    float _1611 = fma(_1609, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1099);
    int _1613 = abs(_1159);
    float _1615 = -_1229;
    float _1617 = fma(_1615, (*spvDescriptorSet0.vp_c9)._m0[18].w, _517);
    int _1619 = abs(_1465);
    float _1621 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].x);
    int _1623 = int(_1621);
    if (_1599)
    {
        float _1625 = in.m_64.x;
        _1521 = _1625;
    }
    float _1627 = _1521;
    float _1629 = float(uint(_1595));
    float _1631 = trunc(_745);
    int _1633 = int(_1631);
    float _1635 = trunc(_767);
    int _1637 = int(_1635);
    float _1639 = float(uint(_1623));
    float _1641 = _1627;
    if (!_1599)
    {
        float _1643 = in.m_64.y;
        _1641 = _1643;
    }
    float _1645 = _1641;
    int _1647 = ~_1595;
    int _1649 = _1647 + 1;
    bool _1651 = _1595 == 0;
    float _1653 = float(_1623);
    float _1655 = 1.0 / _1629;
    float _1657 = float(uint(_1633));
    int _1659 = ~_1595;
    int _1661 = _1659 + 1;
    float _1663 = 1.0 / _1639;
    float _1665 = float(uint(_1637));
    int _1667 = as_type<int>(_1655) + (-2);
    float _1669 = as_type<float>(_1667) * _1657;
    int _1671 = as_type<int>(_1663) + (-2);
    float _1673 = trunc(_1669);
    float _1675 = precise::max(_1673, 0.0);
    uint _1678 = uint(_1675);
    float _1680 = as_type<float>(_1671) * _1665;
    float _1682 = trunc(_1680);
    float _1684 = precise::max(_1682, 0.0);
    uint _1686 = uint(_1684);
    int _1688 = ~_1623;
    int _1690 = _1688 + 1;
    int _1692 = _1649 * int(_1678);
    int _1694 = _1692 + _1633;
    float _1696 = as_type<float>(_1649);
    float _1698 = as_type<float>(_1694);
    if (_1599)
    {
        _1696 = 1.0;
    }
    float _1700 = _1696;
    float _1702 = _1700;
    if (!_1599)
    {
        _1702 = 7.345489978790283203125;
    }
    float _1704 = _1702;
    float _1706 = float(uint(_1694));
    if (_1599)
    {
        _1698 = 1.0;
    }
    float _1708 = _1698;
    int _1710 = _1690 * int(_1686);
    int _1712 = _1710 + _1637;
    float _1714 = _1708;
    if (!_1599)
    {
        _1714 = 1.2345600128173828125;
    }
    float _1716 = _1714;
    float _1718 = as_type<float>(_1667) * _1706;
    float _1720 = _1704 * _397;
    float _1722 = float(uint(_1712));
    float _1724 = _1645 * _1716;
    int _1726 = ~_1595;
    int _1728 = _1726 + 1;
    float _1730 = trunc(_1718);
    float _1732 = precise::max(_1730, 0.0);
    uint _1734 = uint(_1732);
    float _1736 = as_type<float>(_1671) * _1722;
    float _1738 = floor(_1720);
    int _1740 = int(_1678) + int(_1734);
    float _1742 = floor(_1724);
    float _1744 = float(_1595);
    float _1746 = float(_1633);
    int _1748 = _1728 * _1740;
    int _1750 = _1748 + _1633;
    float _1752 = -_1738;
    float _1754 = _1720 + _1752;
    float _1756 = trunc(_1736);
    float _1758 = precise::max(_1756, 0.0);
    uint _1760 = uint(_1758);
    bool _1762 = _1746 >= _1744;
    bool _1764 = isnan(_1746);
    bool _1766 = _1762 || _1764;
    bool _1768 = isnan(_1744);
    bool _1770 = _1766 || _1768;
    float _1772 = float(_1770);
    bool _1774 = uint(_1750) >= uint(_1595);
    int _1776 = ~_1623;
    int _1778 = _1776 + 1;
    bool _1780 = !_1774;
    int _1782 = _1780 ? 0 : (-1);
    float _1784 = trunc(_1772);
    int _1786 = int(_1784);
    float _1788 = -_1742;
    float _1790 = _1724 + _1788;
    int _1792 = ~_1740;
    int _1794 = _1792 + _1782;
    int _1796 = _1794 + 1;
    float _1798 = _1790 * _1653;
    float _1800 = _1754 * _1744;
    int _1802 = int(_1686) + int(_1760);
    int _1804 = _1595 * _1796;
    int _1806 = _1804 + _1633;
    float _1808 = float(_1637);
    float _1810 = _1744 * _759;
    int _1812 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _1814 = _1812 != 0;
    int _1816 = _1778 * _1802;
    int _1818 = _1816 + _1637;
    float _1820 = trunc(_1800);
    int _1822 = int(_1820);
    bool _1824 = !_1651;
    int _1826 = _1824 ? _1806 : (-1);
    int _1828 = ~_1786;
    int _1830 = _1828 + 1;
    int _1832 = _1830 + 1;
    bool _1834 = _1808 >= _1653;
    bool _1836 = isnan(_1808);
    bool _1838 = _1834 || _1836;
    bool _1840 = isnan(_1653);
    bool _1842 = _1838 || _1840;
    float _1844 = float(_1842);
    bool _1846 = !_1814;
    int _1848 = _1846 ? 0 : 1;
    int _1850 = _1826 * _1832;
    bool _1852 = uint(_1818) >= uint(_1623);
    float _1854 = trunc(_1810);
    int _1856 = int(_1854);
    int _1858 = _1595 + (-1);
    int _1860 = abs(_1848);
    int _1862 = abs(_901);
    int _1864 = _1786 * _1858;
    int _1866 = _1864 + _1850;
    bool _1868 = !_1852;
    int _1870 = _1868 ? 0 : (-1);
    float _1872 = trunc(_1844);
    int _1874 = int(_1872);
    float _1876 = _1653 * _759;
    int _1878 = ~_1802;
    int _1880 = _1878 + _1870;
    int _1882 = _1880 + 1;
    bool _1884 = _1623 == 0;
    int _1886 = _1822 * _1860;
    int _1888 = _1886 + _1633;
    int _1890 = abs(_1005);
    int _1892 = _1866 * _1862;
    int _1894 = abs(_1021);
    int _1896 = _1623 * _1882;
    int _1898 = _1896 + _1637;
    bool _1900 = !_1607;
    int _1902 = _1900 ? 0 : 1;
    int _1904 = _1856 * _1890;
    int _1906 = _1904 + _1892;
    float _1908 = trunc(_1876);
    int _1910 = int(_1908);
    int _1912 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8192;
    bool _1914 = _1912 != 0;
    int _1916 = abs(_1902);
    int _1918 = _1888 * _1894;
    int _1920 = _1918 + _1906;
    int _1922 = ~_1874;
    int _1924 = _1922 + 1;
    int _1926 = _1924 + 1;
    bool _1928 = !_1884;
    int _1930 = _1928 ? _1898 : (-1);
    float _1932 = trunc(_1798);
    int _1934 = int(_1932);
    int _1936 = _1623 + (-1);
    int _1938 = _1930 * _1926;
    bool _1940 = !_1914;
    int _1942 = _1940 ? 0 : 1;
    int _1944 = _1822 * _1916;
    int _1946 = _1944 + _1920;
    int _1948 = abs(_1165);
    int _1950 = _1874 * _1936;
    int _1952 = _1950 + _1938;
    int _1954 = abs(_1942);
    float _1956 = float(uint(_1946));
    int _1958 = _1952 * _1613;
    int _1960 = ~_1595;
    int _1962 = _1960 + 1;
    float _1964 = as_type<float>(_1667) * _1956;
    float _1966 = float(uint(_1888));
    int _1968 = _1910 * _1948;
    int _1970 = _1968 + _1958;
    int _1972 = abs(_1509);
    int _1974 = _1934 * _1954;
    int _1976 = _1974 + _1637;
    float _1978 = trunc(_1964);
    float _1980 = precise::max(_1978, 0.0);
    uint _1982 = uint(_1980);
    float _1984 = as_type<float>(_1667) * _1966;
    float _1986 = float(uint(_1976));
    int _1988 = _1976 * _1619;
    int _1990 = _1988 + _1970;
    float _1992 = trunc(_1984);
    float _1994 = precise::max(_1992, 0.0);
    uint _1996 = uint(_1994);
    int _1998 = _1934 * _1972;
    int _2000 = _1998 + _1990;
    float _2002 = as_type<float>(_1671) * _1986;
    int _2004 = ~_1623;
    int _2006 = _2004 + 1;
    float _2008 = float(uint(_2000));
    int _2010 = _1962 * int(_1982);
    int _2012 = _2010 + _1946;
    float _2014 = trunc(_2002);
    float _2016 = precise::max(_2014, 0.0);
    uint _2018 = uint(_2016);
    float _2020 = as_type<float>(_1671) * _2008;
    float _2022 = float(uint(_2012));
    int _2024 = ~_1595;
    int _2026 = _2024 + 1;
    float _2028 = as_type<float>(_1667) * _2022;
    float _2030 = trunc(_2020);
    float _2032 = precise::max(_2030, 0.0);
    uint _2034 = uint(_2032);
    int _2036 = _2026 * int(_1996);
    int _2038 = _2036 + _1888;
    float _2040 = float(uint(_2038));
    float _2042 = trunc(_2028);
    float _2044 = precise::max(_2042, 0.0);
    uint _2046 = uint(_2044);
    float _2048 = as_type<float>(_1667) * _2040;
    int _2050 = _2006 * int(_2034);
    int _2052 = _2050 + _2000;
    int _2054 = ~_1595;
    int _2056 = _2054 + 1;
    float _2058 = trunc(_2048);
    float _2060 = precise::max(_2058, 0.0);
    uint _2062 = uint(_2060);
    float _2064 = float(uint(_2052));
    int _2066 = int(_1982) + int(_2046);
    float _2068 = as_type<float>(_1671) * _2064;
    int _2070 = _2056 * _2066;
    int _2072 = _2070 + _1946;
    float _2074 = trunc(_2068);
    float _2076 = precise::max(_2074, 0.0);
    uint _2078 = uint(_2076);
    bool _2080 = uint(_2072) >= uint(_1595);
    int _2082 = int(_1996) + int(_2062);
    bool _2084 = !_2080;
    int _2086 = _2084 ? 0 : (-1);
    int _2088 = _1661 * _2082;
    int _2090 = _2088 + _1888;
    int _2092 = ~_2066;
    int _2094 = _2092 + _2086;
    int _2096 = _2094 + 1;
    float _2098 = -_1229;
    float _2100 = fma(_2098, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1575);
    int _2102 = _1595 * _2096;
    int _2104 = _2102 + _1946;
    float _2106 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2108 = _2100 + _2106;
    int _2110 = int(_2034) + int(_2078);
    float _2112 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2114 = _1603 + _2112;
    float _2116 = fma(_1591, 100.0, _1577);
    float _2118 = -_1209;
    float _2120 = fma(_2118, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2116);
    float _2122 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2124 = _2120 + _2122;
    float _2126 = _2124 * _2124;
    float _2128 = fma(_2108, _2108, _2126);
    float _2130 = fma(_2114, _2114, _2128);
    float _2132 = rsqrt(_2130);
    float _2134 = sqrt(_2130);
    float _2136 = _2132 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _2138 = _2108 * _2136;
    float _2140 = _2114 * _2136;
    float _2142 = _2138 * _2138;
    float _2144 = _2140 * _2140;
    float _2146 = _2142 + _2144;
    float _2148 = sqrt(_2146);
    bool _2150 = _2148 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2152 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2154 = _2148 + _2152;
    float _2156 = _2114;
    float _2158 = _2146;
    float _2160 = _2154;
    float _2162 = _2124;
    float _2164 = as_type<float>(_1916);
    if (_2150)
    {
        float _2166 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2156 = _2166;
    }
    float _2168 = _2156;
    if (_2150)
    {
        float _2170 = rsqrt(_2146);
        _2158 = _2170;
    }
    float _2172 = _2158;
    if (_2150)
    {
        float _2174 = _2154 * _2168;
        _2160 = _2174;
    }
    float _2176 = _2160;
    if (_2150)
    {
        float _2178 = _2176 * 0.15915493667125701904296875;
        _1253 = _2178;
    }
    float _2180 = _1253;
    float _2182 = _2126;
    float _2184 = _2180;
    if (_2150)
    {
        float _2186 = _2180 * 6.283185482025146484375;
        float _2188 = sin(_2186);
        _2182 = _2188;
    }
    float _2190 = _2182;
    float _2192 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _2194 = precise::max(0.0, _2192);
    float _2196 = _2132;
    float _2198 = _2194;
    float _2200 = _2192;
    if (_2150)
    {
        float _2202 = _2180 * 6.283185482025146484375;
        float _2204 = cos(_2202);
        _2196 = _2204;
    }
    float _2206 = _2196;
    float _2208 = -_2136;
    float _2210 = -_2194;
    float _2212 = fma(_2124, _2208, _2210);
    if (!_2150)
    {
        _2198 = _2138;
    }
    float _2214 = _2198;
    float _2216 = _2214;
    if (_2150)
    {
        float _2218 = _2212 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2200 = _2218;
    }
    float _2220 = _2200;
    float _2222 = _2190;
    float _2224 = _2220;
    if (_2150)
    {
        float _2226 = fma(_2190, _2220, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _2222 = _2226;
    }
    float _2228 = _2222;
    float _2230 = _2228;
    if (!_2150)
    {
        _2224 = _2212;
    }
    float _2232 = _2224;
    float _2234 = _2232;
    float _2236 = _2206;
    if (_2150)
    {
        float _2238 = _2206 + (-1.0);
        _2162 = _2238;
    }
    float _2240 = _2162;
    float _2242 = _2240;
    if (_2150)
    {
        float _2244 = _2172 * _2228;
        _2164 = _2244;
    }
    float _2246 = _2164;
    if (!_2150)
    {
        _2230 = _2142;
    }
    float _2248 = _2230;
    float _2250 = _2248;
    if (_2150)
    {
        float _2252 = _2240 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2184 = _2252;
    }
    float _2254 = _2184;
    if (_2150)
    {
        float _2256 = _2138 * _2246;
        _2216 = _2256;
    }
    float _2258 = _2216;
    if (!_2150)
    {
        _2242 = _2140;
    }
    float _2260 = _2242;
    float _2262 = _2260;
    if (_2150)
    {
        float _2264 = _2140 * _2246;
        _2262 = _2264;
    }
    float _2266 = _2262;
    if (_2150)
    {
        float _2268 = fma(_2212, _2206, _2254);
        _2234 = _2268;
    }
    float _2270 = _2234;
    if (_2150)
    {
        float _2272 = _2258 * _2258;
        _2250 = _2272;
    }
    float _2274 = _2250;
    if (!_2150)
    {
        _2236 = _2144;
    }
    float _2276 = _2236;
    float _2278 = _2276;
    if (_2150)
    {
        float _2280 = _2266 * _2266;
        _2278 = _2280;
    }
    float _2282 = _2278;
    float _2284 = fma(_2270, _2270, _2274);
    float _2286 = _2120 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _2288 = _2120 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _2290 = _2284 + _2282;
    float _2292 = fma(_1617, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _2294 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _2296 = fma(_2134, (*spvDescriptorSet0.vp_c15)._m0[23].w, _2294);
    float _2298 = precise::clamp(_2296, 0.0, 1.0);
    float _2300 = fma(_2100, (*spvDescriptorSet0.vp_c8)._m0[2].x, _2286);
    float _2302 = fma(_2100, (*spvDescriptorSet0.vp_c8)._m0[3].x, _2288);
    float _2304 = floor(_2292);
    float _2306 = -_2298;
    float _2308 = _2306 + 1.0;
    float _2310 = fma(_1603, (*spvDescriptorSet0.vp_c8)._m0[2].z, _2300);
    float _2312 = fma(_1603, (*spvDescriptorSet0.vp_c8)._m0[3].z, _2302);
    float _2314 = _2310 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _2316 = rsqrt(_2290);
    float _2318 = abs(_2308);
    float _2320 = log2(_2318);
    float _2322 = -_2304;
    float _2324 = _2292 + _2322;
    float _2326 = _2120 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2328 = fma(_2100, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2326);
    float _2330 = _2316 * _2258;
    float _2332 = _2316 * _2270;
    float _2334 = fma(_1603, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2328);
    float _2336 = _2330 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _2338 = _2316 * _2266;
    float _2340 = _2334 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2342 = -_2336;
    float _2344 = fma(_2332, (*spvDescriptorSet0.vp_c15)._m0[21].y, _2342);
    float _2346 = _2320 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _2348 = fma(_1611, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _2350 = -_2338;
    float _2352 = fma(_2350, (*spvDescriptorSet0.vp_c15)._m0[21].z, _2344);
    float _2354 = _2120 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2356 = _2314 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _2358 = floor(_2348);
    float _2360 = fma(_2352, -0.5, 0.5);
    float _2362 = fma(_2100, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2354);
    float _2364 = fma(_2352, 0.5, 0.5);
    float _2366 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _2368 = fma(_1603, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2362);
    float _2370 = fma(_2364, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _2372 = sqrt(_2360);
    float _2374 = -_2356;
    float _2376 = fma(_2374, _2366, 1.0);
    float _2378 = _2368 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _2380 = fma(_2364, _2370, -0.212114393711090087890625);
    float _2382 = fma(_2364, _2380, 1.570728778839111328125);
    float _2384 = exp2(_2346);
    float _2386 = _2378 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _2388 = _2312 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _2390 = -_2358;
    float _2392 = _2348 + _2390;
    float _2394 = _2378 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2396 = fma(_2340, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2386);
    float _2398 = log2(_2376);
    float _2400 = fma(_2314, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2396);
    float _2402 = _2332 + 1.0;
    float _2404 = fma(_2340, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2394);
    float _2406 = _2372 * 0.636619746685028076171875;
    float _2408 = fma(_2388, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2400);
    int _2410 = ~_1623;
    int _2412 = _2410 + 1;
    float _2414 = -_2332;
    float _2416 = fma(_2384, _2402, _2414);
    float _2418 = _2378 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2420 = 1.0 / _2408;
    float _2422 = fma(_2314, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2404);
    float _2424 = fma(_2340, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2418);
    float _2426 = -_2382;
    float _2428 = fma(_2406, _2426, 1.0);
    float _2430 = fma(_2388, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2422);
    float _2432 = _2398 * 0.693147182464599609375;
    float _2434 = fma(_2314, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2424);
    float _2436 = fma(_2416, 0.5, 0.5);
    float2 _7492 = float2(_2324, _2392);
    float _2438 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_7492, float2(0.0), isnan(_7492)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_7492, float2(0.0), isnan(_7492)), level(0.0)).x;
    float _2440 = _2432 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _2442 = fma(_2388, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2434);
    int _2444 = ~_1623;
    int _2446 = _2444 + 1;
    float _2448 = _2442 * _2420;
    float _2450 = _2430 * _2420;
    int _2452 = _2412 * _2110;
    int _2454 = _2452 + _2000;
    float _2456 = fma(_2448, 0.5, 0.5);
    float _2458 = fma(_2450, -0.5, 0.5);
    float3 _7530 = float3(_2456, _2458, _2440);
    float _2460 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_7530, float3(0.0), isnan(_7530)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_7530, float3(0.0), isnan(_7530)), level(0.0)).x;
    float3 _7541 = float3(_2456, _2458, _2440);
    float4 _2463 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_7541, float3(0.0), isnan(_7541)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_7541, float3(0.0), isnan(_7541)), level(0.0)).xyzw;
    float _2465 = _2463.x;
    float _2467 = _2463.y;
    float _2469 = _2463.z;
    float _2471 = _2463.w;
    float2 _7557 = float2(_2428, _2436);
    float3 _2475 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_7557, float2(0.0), isnan(_7557)), level(0.0)), spvDescriptorSet0.dm_border, 4u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_7557, float2(0.0), isnan(_7557)), level(0.0)).xyz;
    float _2477 = _2475.x;
    float _2479 = _2475.y;
    float _2481 = _2475.z;
    bool _2483 = !_1651;
    int _2485 = _2483 ? _2104 : (-1);
    float _2487 = fma(_1591, 100.0, _463);
    float _2489 = -_747;
    float _2491 = _2489 + 1.0;
    int _2493 = _2485 & 3;
    bool _2495 = _2493 != 0;
    float _2497 = -_1209;
    float _2499 = fma(_2497, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2487);
    int _2501 = _2485 & 3;
    bool _2503 = _2501 != 0;
    float _2505 = -_677;
    float _2507 = _2505 + 1.0;
    bool _2509 = uint(_2454) >= uint(_1623);
    float _2511 = _2499 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    bool _2513 = uint(_2090) >= uint(_1595);
    int _2515 = _2446 * int(_2018);
    int _2517 = _2515 + _1976;
    int _2519 = _2495 ? 0 : 1;
    float _2521 = _2320 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    bool _2523 = _2501 != 3;
    float _2525 = _2378 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    bool _2527 = !_2509;
    int _2529 = _2527 ? 0 : (-1);
    out.m_72.x = _2100;
    out.m_72.y = _2120;
    out.m_72.z = _1603;
    bool _2531 = !_2513;
    int _2533 = _2531 ? 0 : (-1);
    float _2535 = fma(_2340, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2525);
    bool _2537 = uint(_2501) >= 2u;
    float _2539 = exp2(_2521);
    bool _2541 = uint(_2501) > 1u;
    float _2543 = fma(_2314, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2535);
    int _2545 = ~_2110;
    int _2547 = _2545 + _2529;
    int _2549 = _2547 + 1;
    float _2551 = float(uint(_2517));
    int _2553 = _2537 ? 0 : 1;
    int _2555 = _1623 * _2549;
    int _2557 = _2555 + _2000;
    bool _2559 = _403 > 0.5;
    float _2561 = as_type<float>(_1671) * _2551;
    int _2563 = ~_2553;
    int _2565 = _2563 + 1;
    int _2567 = _2565 + 1;
    bool _2569 = !_2503;
    int _2571 = _2569 ? 0 : 1;
    float _2573 = trunc(_2561);
    float _2575 = precise::max(_2573, 0.0);
    uint _2577 = uint(_2575);
    int _2579 = _2567;
    float _2581 = _2408;
    float _2583 = _2430;
    if (_2523)
    {
        int _2585 = ~_2553;
        int _2587 = _2585 + 1;
        _2579 = _2587;
    }
    int _2589 = _2579;
    float _2591 = -_2539;
    float _2593 = _2591 + 1.0;
    bool _2595 = _397 > 0.5;
    int _2597 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _2599 = _2597 != 0;
    float _2601 = _2593 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _2603 = -_333;
    int _2605 = _2559 ? as_type<int>(_2603) : as_type<int>(_333);
    int _2607 = _2485 >> 31;
    bool _2609 = !_1884;
    int _2611 = _2609 ? _2557 : (-1);
    int _2613 = ~_2519;
    int _2615 = _2613 + 1;
    int _2617 = _2615 + 1;
    int _2619 = _2617;
    if (!_2541)
    {
        int _2621 = ~_2519;
        int _2623 = _2621 + 1;
        _2619 = _2623;
    }
    int _2625 = _2619;
    bool _2627 = !_2599;
    float _2629 = _2627 ? _333 : as_type<float>(_2605);
    int _2631 = _2607 & 3;
    int _2633 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _2635 = _2633 != 0;
    int _2637 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4194304;
    bool _2639 = _2637 != 0;
    int _2641 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _2643 = _2641 != 0;
    int _2645 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _2647 = _2645 != 0;
    int _2649 = _2611 >> 31;
    int _2651 = _2485 + _2631;
    int _2653 = ~_2082;
    int _2655 = _2653 + _2533;
    int _2657 = _2655 + 1;
    int _2659 = _2649 & 3;
    bool _2661 = !_2639;
    int _2663 = _2661 ? 0 : 1;
    int _2665 = _1595 * _2657;
    int _2667 = _2665 + _1888;
    int _2669 = _2611 & 3;
    bool _2671 = _2669 != 0;
    int _2673 = _2651 >> 2;
    int _2675 = _2611 + _2659;
    bool _2677 = !_2635;
    int _2679 = _2677 ? 0 : 1;
    int _2681 = _2671 ? 0 : 1;
    int _2683 = _2673 << 4;
    int _2685 = _2683 + 368;
    int _2687 = _2611 & 3;
    bool _2689 = _2687 != 0;
    bool _2691 = _2501 != 3;
    int _2693 = _2685 + 8;
    uint _2695 = uint(int(uint(_2693) >> uint(2)));
    uint _2697 = uint(int(uint(int(_2695)) >> uint(2)));
    int _2699 = int(_2695) & 3;
    float _2701 = (*spvDescriptorSet0.vp_c9)._m0[int(_2697)][_2699];
    int _2703 = int(_2695) + 1;
    uint _2705 = uint(int(uint(_2703) >> uint(2)));
    int _2707 = _2703 & 3;
    float _2709 = (*spvDescriptorSet0.vp_c9)._m0[int(_2705)][_2707];
    int _2711 = _2675 >> 2;
    int _2713 = int(_2018) + int(_2577);
    bool _2715 = !_1651;
    int _2717 = _2715 ? _2667 : (-1);
    bool _2719 = uint(_2687) > 1u;
    uint _2721 = uint(int(uint(_2685) >> uint(2)));
    uint _2723 = uint(int(uint(int(_2721)) >> uint(2)));
    int _2725 = int(_2721) & 3;
    float _2727 = (*spvDescriptorSet0.vp_c9)._m0[int(_2723)][_2725];
    int _2729 = int(_2721) + 1;
    uint _2731 = uint(int(uint(_2729) >> uint(2)));
    int _2733 = _2729 & 3;
    float _2735 = (*spvDescriptorSet0.vp_c9)._m0[int(_2731)][_2733];
    int _2737 = _2711 << 4;
    int _2739 = _2737 + 512;
    bool _2741 = !_2689;
    int _2743 = _2741 ? 0 : 1;
    bool _2745 = _2687 != 3;
    int _2747 = ~_2681;
    int _2749 = _2747 + 1;
    int _2751 = _2749 + 1;
    uint _2753 = uint(int(uint(_2739) >> uint(2)));
    uint _2755 = uint(int(uint(int(_2753)) >> uint(2)));
    int _2757 = int(_2753) & 3;
    float _2759 = (*spvDescriptorSet0.vp_c9)._m0[int(_2755)][_2757];
    int _2761 = int(_2753) + 1;
    uint _2763 = uint(int(uint(_2761) >> uint(2)));
    int _2765 = _2761 & 3;
    float _2767 = (*spvDescriptorSet0.vp_c9)._m0[int(_2763)][_2765];
    int _2769 = ~_1623;
    int _2771 = _2769 + 1;
    bool _2773 = !_2691;
    int _2775 = _2773 ? 0 : (-1);
    int _2777 = _2751;
    if (!_2719)
    {
        int _2779 = ~_2681;
        int _2781 = _2779 + 1;
        _2777 = _2781;
    }
    int _2783 = _2777;
    bool _2785 = uint(_2687) >= 2u;
    int _2787 = _2739 + 8;
    uint _2789 = uint(int(uint(_2787) >> uint(2)));
    uint _2791 = uint(int(uint(int(_2789)) >> uint(2)));
    int _2793 = int(_2789) & 3;
    float _2795 = (*spvDescriptorSet0.vp_c9)._m0[int(_2791)][_2793];
    int _2797 = int(_2789) + 1;
    uint _2799 = uint(int(uint(_2797) >> uint(2)));
    int _2801 = _2797 & 3;
    float _2803 = (*spvDescriptorSet0.vp_c9)._m0[int(_2799)][_2801];
    bool _2805 = _2687 != 3;
    int _2807 = _2771 * _2713;
    int _2809 = _2807 + _1976;
    int _2811 = _2785 ? 0 : 1;
    int _2813 = ~_2811;
    int _2815 = _2813 + 1;
    int _2817 = _2815 + 1;
    int _2819 = _2817;
    if (_2745)
    {
        int _2821 = ~_2811;
        int _2823 = _2821 + 1;
        _2819 = _2823;
    }
    int _2825 = _2819;
    bool _2827 = uint(_2809) >= uint(_1623);
    float _2829 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    int _2831 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y);
    bool _2833 = _2831 != 0;
    float _2835 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _2837 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    bool _2839 = !_2805;
    int _2841 = _2839 ? 0 : (-1);
    float _2843 = _2829 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    bool _2845 = _399 > 0.5;
    float _2847 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _2849 = _2835 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2851 = _2837 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2853 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    bool _2855 = !_2827;
    int _2857 = _2855 ? 0 : (-1);
    bool _2859 = _401 > 0.5;
    float _2861 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    int _2863 = abs(_2625);
    out.m_74.x = _2843;
    out.m_74.y = _2849;
    out.m_74.z = _2851;
    out.m_74.w = _2847;
    float _2865 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _2867 = _2853 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2869 = _2861 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    int _2871 = abs(_2783);
    float _2873 = _2865 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    int _2875 = abs(_2589);
    int _2877 = ~_2871;
    int _2879 = _2877 + 1;
    int _2881 = _2879 + 1;
    out.m_76.x = _2867;
    out.m_76.y = _2869;
    out.m_76.z = _2873;
    int _2883 = ~_2713;
    int _2885 = _2883 + _2857;
    int _2887 = _2885 + 1;
    int _2889 = _2881 * as_type<int>(_2767);
    float _2891 = trunc((*spvDescriptorSet0.vp_c9)._m0[80].z);
    int _2893 = int(_2891);
    int _2895 = ~_2863;
    int _2897 = _2895 + 1;
    int _2899 = _2897 + 1;
    int _2901 = _1623 * _2887;
    int _2903 = _2901 + _1976;
    int _2905 = abs(_2571);
    int _2907 = abs(_2679);
    int _2909 = _2899 * as_type<int>(_2735);
    int _2911 = abs(_2743);
    float _2913 = trunc((*spvDescriptorSet0.vp_c9)._m0[85].z);
    int _2915 = int(_2913);
    int _2917 = ~_2905;
    int _2919 = _2917 + 1;
    int _2921 = _2919 + 1;
    int _2923 = ~_2911;
    int _2925 = _2923 + 1;
    int _2927 = _2925 + 1;
    int _2929 = _2921 * as_type<int>(_2727);
    int _2931 = _2929 + _2909;
    int _2933 = ~_2875;
    int _2935 = _2933 + 1;
    int _2937 = _2935 + 1;
    int _2939 = abs(_2825);
    int _2941 = _2927 * as_type<int>(_2759);
    int _2943 = _2941 + _2889;
    float _2945 = float(uint(_2893));
    int _2947 = _2937 * as_type<int>(_2701);
    int _2949 = _2947 + _2931;
    int _2951 = abs(_2775);
    int _2953 = ~_2939;
    int _2955 = _2953 + 1;
    int _2957 = _2955 + 1;
    int _2959 = abs(_2841);
    float _2961 = 1.0 / _2945;
    float _2963 = float(uint(_2915));
    int _2965 = _2957 * as_type<int>(_2795);
    int _2967 = _2965 + _2943;
    int _2969 = ~_2951;
    int _2971 = _2969 + 1;
    int _2973 = _2971 + 1;
    int _2975 = abs(_2663);
    int _2977 = ~_2959;
    int _2979 = _2977 + 1;
    int _2981 = _2979 + 1;
    float _2983 = 1.0 / _2963;
    int _2985 = abs(_2893);
    int _2987 = _2973 * as_type<int>(_2709);
    int _2989 = _2987 + _2949;
    int _2991 = ~_2907;
    int _2993 = _2991 + 1;
    int _2995 = _2993 + 1;
    int _2997 = _2981 * as_type<int>(_2803);
    int _2999 = _2997 + _2967;
    int _3001 = ~_2975;
    int _3003 = _3001 + 1;
    int _3005 = _3003 + 1;
    float _3007 = _1375 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    int _3009 = _2989 * _2995;
    int _3011 = abs(_2915);
    int _3013 = _2999 * _3005;
    float _3015 = float(uint(_2985));
    int _3017 = _2717 * _2907;
    int _3019 = _3017 + _3009;
    bool _3021 = !_1884;
    int _3023 = _3021 ? _2903 : (-1);
    float _3025 = fma(_3007, _3007, 1.0);
    int _3027 = as_type<int>(_2961) + (-2);
    float _3029 = _1363 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _3031 = 1.0 / _3015;
    int _3033 = _3023 * _2975;
    int _3035 = _3033 + _3013;
    float _3037 = float(uint(_3019));
    float _3039 = fma(_1441, _3029, _1411);
    float _3041 = float(uint(_3011));
    int _3043 = as_type<int>(_2983) + (-2);
    float _3045 = as_type<float>(_3027) * _3037;
    float _3047 = float(uint(_3035));
    float _3049 = rsqrt(_3025);
    float _3051 = -_333;
    int _3053 = _2845 ? as_type<int>(_3051) : as_type<int>(_333);
    float _3055 = -_279;
    int _3057 = _2595 ? as_type<int>(_3055) : as_type<int>(_279);
    float _3059 = as_type<float>(_3043) * _3047;
    bool _3061 = !_2643;
    float _3063 = _3061 ? _333 : as_type<float>(_3053);
    int _3065 = abs(_3019);
    float _3067 = 1.0 / _3041;
    int _3069 = as_type<int>(_3031) + (-2);
    float _3071 = float(uint(_3065));
    float _3073 = -_279;
    int _3075 = _2859 ? as_type<int>(_3073) : as_type<int>(_279);
    bool _3077 = !_2833;
    float _3079 = _3077 ? _279 : as_type<float>(_3057);
    float _3081 = trunc(_3045);
    float _3083 = precise::max(_3081, 0.0);
    uint _3085 = uint(_3083);
    bool _3087 = !_2647;
    float _3089 = _3087 ? _279 : as_type<float>(_3075);
    float _3091 = as_type<float>(_3069) * _3071;
    int _3093 = ~_2893;
    int _3095 = _3093 + 1;
    float _3097 = _3007 * _3049;
    int _3099 = abs(_3035);
    float _3101 = -_3049;
    float _3103 = _1429 * _3101;
    int _3105 = ~_2915;
    int _3107 = _3105 + 1;
    float _3109 = trunc(_3059);
    float _3111 = precise::max(_3109, 0.0);
    uint _3113 = uint(_3111);
    int _3115 = as_type<int>(_3067) + (-2);
    float _3117 = -_1417;
    float _3119 = fma(_1427, _3029, _3117);
    float _3121 = float(uint(_3099));
    float _3123 = fma(_1417, _3097, _3103);
    int _3125 = ~_2985;
    int _3127 = _3125 + 1;
    float _3129 = -_3007;
    float _3131 = fma(_1429, _3129, _3119);
    float _3133 = trunc(_3091);
    float _3135 = precise::max(_3133, 0.0);
    uint _3137 = uint(_3135);
    int _3139 = _3095 * int(_3085);
    int _3141 = _3139 + _3019;
    float _3143 = as_type<float>(_3115) * _3121;
    float _3145 = float(uint(_3141));
    int _3147 = _3107 * int(_3113);
    int _3149 = _3147 + _3035;
    float _3151 = trunc(_3143);
    float _3153 = precise::max(_3151, 0.0);
    uint _3155 = uint(_3153);
    float _3157 = as_type<float>(_3027) * _3145;
    float _3159 = float(uint(_3149));
    int _3161 = ~_3011;
    int _3163 = _3161 + 1;
    int _3165 = _3127 * int(_3137);
    int _3167 = _3165 + _3065;
    float _3169 = trunc(_3157);
    float _3171 = precise::max(_3169, 0.0);
    uint _3173 = uint(_3171);
    float _3175 = as_type<float>(_3043) * _3159;
    float _3177 = fma(_1431, _3029, _1409);
    float _3179 = float(uint(_3167));
    float _3181 = -_3007;
    float _3183 = fma(_1437, _3181, _3177);
    float _3185 = -_3049;
    float _3187 = _1437 * _3185;
    float _3189 = -_3049;
    float _3191 = _1451 * _3189;
    int _3193 = _3163 * int(_3155);
    int _3195 = _3193 + _3099;
    float _3197 = -_3007;
    float _3199 = fma(_1451, _3197, _3039);
    float _3201 = -_3097;
    float _3203 = fma(_1409, _3201, _3187);
    float _3205 = -_3097;
    float _3207 = fma(_1411, _3205, _3191);
    float _3209 = as_type<float>(_3069) * _3179;
    float _3211 = float(uint(_3195));
    float _3213 = _1431 * _325;
    float _3215 = _1431 * _317;
    float _3217 = trunc(_3209);
    float _3219 = precise::max(_3217, 0.0);
    uint _3221 = uint(_3219);
    float _3223 = _1431 * _329;
    float _3225 = as_type<float>(_3115) * _3211;
    float _3227 = fma(_1427, _289, _3213);
    float _3229 = fma(_1427, _285, _3215);
    float _3231 = fma(_1427, _299, _3223);
    float _3233 = _3183 * _325;
    float _3235 = fma(_1441, _341, _3227);
    float _3237 = trunc(_3175);
    float _3239 = precise::max(_3237, 0.0);
    uint _3241 = uint(_3239);
    float _3243 = fma(_1441, _337, _3229);
    float _3245 = fma(_1441, _345, _3231);
    float _3247 = _3183 * _317;
    float _3249 = _3183 * _329;
    float _3251 = _3203 * _325;
    float _3253 = _3203 * _317;
    float _3255 = _3203 * _329;
    float _3257 = trunc(_3225);
    float _3259 = precise::max(_3257, 0.0);
    uint _3261 = uint(_3259);
    int _3263 = ~_2985;
    int _3265 = _3263 + 1;
    out.m_78.x = _3235;
    out.m_78.y = _3243;
    out.m_78.z = _3245;
    int _3267 = int(_3137) + int(_3221);
    float _3269 = fma(_3131, _299, _3249);
    int _3271 = int(_3085) + int(_3173);
    float _3273 = -_2438;
    float _3275 = _3273 + 1.0;
    int _3277 = ~_2893;
    int _3279 = _3277 + 1;
    int _3281 = _3265 * _3267;
    int _3283 = _3281 + _3065;
    int _3285 = ~_2915;
    int _3287 = _3285 + 1;
    int _3289 = ~_3011;
    int _3291 = _3289 + 1;
    int _3293 = _3279 * _3271;
    int _3295 = _3293 + _3019;
    int _3297 = int(_3113) + int(_3241);
    float _3299 = fma(_3123, _285, _3253);
    float _3301 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    int _3303 = int(_3155) + int(_3261);
    float _3305 = fma(_3207, _337, _3299);
    int _3307 = _3287 * _3297;
    int _3309 = _3307 + _3035;
    bool _3311 = uint(_3295) >= uint(_2893);
    float _3313 = fma(_3123, _289, _3251);
    float _3315 = fma(_3123, _299, _3255);
    int _3317 = _3291 * _3303;
    int _3319 = _3317 + _3099;
    bool _3321 = !_3311;
    int _3323 = _3321 ? 0 : (-1);
    float _3325 = fma(_3207, _341, _3313);
    bool _3327 = uint(_3309) >= uint(_2915);
    int _3329 = ~_3271;
    int _3331 = _3329 + _3323;
    int _3333 = _3331 + 1;
    bool _3335 = uint(_3319) >= uint(_3011);
    bool _3337 = uint(_3283) >= uint(_2985);
    int _3339 = _3019 ^ _2893;
    float _3341 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    bool _3343 = !_3327;
    int _3345 = _3343 ? 0 : (-1);
    bool _3347 = _2893 == 0;
    bool _3349 = _2893 == 0;
    int _3351 = _2893 * _3333;
    int _3353 = _3351 + _3019;
    int _3355 = _3035 ^ _2915;
    float _3357 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    bool _3359 = !_3337;
    int _3361 = _3359 ? 0 : (-1);
    uint _3363 = uint(int(uint(_3339) >> uint(31)));
    uint _3365 = uint(int(uint(_3355) >> uint(31)));
    bool _3367 = !_3335;
    int _3369 = _3367 ? 0 : (-1);
    int _3371 = ~_3361;
    int _3373 = _3267 + _3371;
    int _3375 = _3373 + 1;
    int _3377 = ~int(_3363);
    int _3379 = _3377 + 1;
    int _3381 = ~_3369;
    int _3383 = _3303 + _3381;
    int _3385 = _3383 + 1;
    int _3387 = ~int(_3365);
    int _3389 = _3387 + 1;
    float _3391 = _3357 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    int _3393 = ~_3297;
    int _3395 = _3393 + _3345;
    int _3397 = _3395 + 1;
    float _3399 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    int _3401 = _3375 ^ _3379;
    int _3403 = _3385 ^ _3389;
    int _3405 = _2915 * _3397;
    int _3407 = _3405 + _3035;
    int _3409 = ~_3379;
    int _3411 = _3409 + _3401;
    int _3413 = _3411 + 1;
    float _3415 = _3341 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    bool _3417 = _2915 == 0;
    bool _3419 = _2915 == 0;
    float _3421 = _3301 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    int _3423 = ~_3389;
    int _3425 = _3423 + _3403;
    int _3427 = _3425 + 1;
    bool _3429 = !_3347;
    int _3431 = _3429 ? _3353 : (-1);
    bool _3433 = !_3349;
    int _3435 = _3433 ? _3413 : (-1);
    float _3437 = _3399 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    bool _3439 = !_3417;
    int _3441 = _3439 ? _3407 : (-1);
    bool _3443 = !_3419;
    int _3445 = _3443 ? _3427 : (-1);
    float _3447 = float(_3435);
    float _3449 = float(_3431);
    float _3451 = float(_3441);
    float _3453 = -_575;
    float _3455 = fma(_3415, _3447, _3453);
    float _3457 = float(_3445);
    float _3459 = fma(_3421, _3449, _569);
    float _3461 = _3079 + 0.5;
    float _3463 = fma(_3391, _3451, _751);
    float _3465 = _3063 + (-0.5);
    float _3467 = -_761;
    float _3469 = fma(_3437, _3457, _3467);
    float _3471 = _2629 + (-0.5);
    float _3473 = fma(_3421, _3461, _3459);
    float _3475 = -_755;
    float _3477 = _3475 + 1.0;
    float _3479 = -_3415;
    float _3481 = fma(_3479, _3465, _3455);
    float _3483 = -_3437;
    float _3485 = fma(_3483, _3471, _3469);
    float _3487 = fma(_3207, _345, _3315);
    float _3489 = -_3477;
    float _3491 = fma(_3079, _3489, _3473);
    float _3493 = fma(_3063, _2491, _3481);
    float _3495 = fma(_2629, _2507, _3485);
    float _3497 = fma(_1617, (*spvDescriptorSet0.vp_c8)._m0[11].x, _2511);
    float _3499 = _2499 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _3501 = fma(_3199, _345, _3269);
    out.m_80.x = _3325;
    out.m_80.y = _3305;
    out.m_80.z = _3487;
    float _3503 = fma(_1611, (*spvDescriptorSet0.vp_c8)._m0[11].z, _3497);
    float _3505 = fma(_1617, (*spvDescriptorSet0.vp_c8)._m0[10].x, _3499);
    float _3507 = _3089 + 0.5;
    float _3509 = -_633;
    float _3511 = _3509 + 1.0;
    float _3513 = _3503 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _3515 = fma(_1611, (*spvDescriptorSet0.vp_c8)._m0[10].z, _3505);
    float _3517 = fma(_3391, _3507, _3463);
    float _3519 = fma(_3131, _289, _3233);
    float _3521 = 1.0 / _3513;
    float _3523 = _3515 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _3525 = -_3511;
    float _3527 = fma(_3089, _3525, _3517);
    float _3529 = fma(_3131, _285, _3247);
    float _3531 = _3523 + _3513;
    out.m_82.x = _3491;
    out.m_82.y = _3493;
    out.m_82.z = _3527;
    out.m_82.w = _3495;
    float _3533 = fma(_3199, _341, _3519);
    float _3535 = fma(_3199, _337, _3529);
    float _3537 = in.m_66.x;
    bool _3539 = _2134 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _3541 = isnan(_2134);
    bool _3543 = _3539 || _3541;
    bool _3545 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _3547 = _3543 || _3545;
    out.m_84.x = _3533;
    out.m_84.y = _3535;
    out.m_84.z = _3501;
    float _3549 = _3531 * _3521;
    float _3551 = _3549 * 0.5;
    float _3553 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _3555 = fma(_3551, (*spvDescriptorSet0.vp_c8)._m0[30].w, _3553);
    float _3557 = _2601 * _2460;
    float _3559 = -_2601;
    float _3561 = _3559 + 1.0;
    float _3563 = 1.0 / _3555;
    float _3565 = _2481 * _3557;
    float _3567 = _2471 * _3561;
    float _3569 = fma(_2471, _3565, _2469);
    float _3571 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _3573 = _3563 * _3571;
    float _3575 = abs(_3573);
    float _3577 = log2(_3575);
    bool _3579 = _3573 <= 8000.0;
    bool _3581 = isnan(_3573);
    bool _3583 = _3579 || _3581;
    bool _3585 = isnan(8000.0);
    bool _3587 = _3583 || _3585;
    float _3589 = float(_3587);
    float _3591 = _3577 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _3593 = exp2(_3591);
    float _3595 = fma(_3593, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _3597 = precise::clamp(_3595, 0.0, 1.0);
    float _3599 = fma(_3597, -2.0, 3.0);
    float _3601 = _3597 * _3597;
    float _3603 = _3601 * _3599;
    float _3605 = fma(_2388, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2543);
    float _3607 = -_3603;
    float _3609 = _3607 + 1.0;
    float _3611 = _3605 + _2408;
    out.gl_Position.x = _2442;
    out.gl_Position.y = _2430;
    out.gl_Position.z = _3605;
    out.gl_Position.w = _2408;
    float _3613 = fma(_3609, (*spvDescriptorSet0.vp_c15)._m0[654].w, _3603);
    float _3615 = _3611 * 0.5;
    float _3617 = _3589 * _3613;
    out.m_86.z = _3615;
    out.m_86.w = _2408;
    float _3619 = _3617 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _3621 = _3275 * _3619;
    float _3623 = precise::clamp(_3621, 0.0, 1.0);
    float _3625 = _3605;
    float _3627 = _3615;
    float _3629 = _2442;
    if (!_3547)
    {
        _2581 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _3631 = _2581;
    float _3633 = _3631;
    float _3635 = _3631;
    if (!_3547)
    {
        _3625 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _3637 = _3625;
    float _3639 = -_3623;
    float _3641 = fma(_3639, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _3643 = _2471 * _3557;
    float _3645 = _3637;
    float _3647 = _3637;
    if (!_3547)
    {
        _3627 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _3649 = _3627;
    float _3651 = _3641 * _3537;
    float _3653 = fma(_2477, _3643, _2465);
    float _3655 = fma(_2479, _3643, _2467);
    float _3657 = _3651;
    float _3659 = _3649;
    float _3661 = _3649;
    if (!_3547)
    {
        _2583 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _3663 = _2583;
    float _3665 = _3651 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _3667 = _3663;
    float _3669 = _3663;
    if (!_3547)
    {
        _3629 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _3671 = _3629;
    out.m_88.x = _3653;
    out.m_88.y = _3655;
    out.m_88.z = _3569;
    out.m_88.w = _3567;
    float _3673 = _3671;
    float _3675 = _3671;
    if (!_3547)
    {
        _3657 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _3677 = _3657;
    out.m_90.x = _3665;
    bool _3679 = !_3547;
    float _3681 = _3677;
    float _3683 = _3677;
    if (!_3679)
    {
        bool _3685 = _2134 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _3687 = isnan(_2134);
        bool _3689 = _3685 || _3687;
        bool _3691 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _3693 = _3689 || _3691;
        if (!_3693)
        {
            float _3695 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _3697 = _2134 + _3695;
            float _3699 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _3701 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _3699;
            float _3703 = 1.0 / _3701;
            float _3705 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _3707 = _3705 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _3709 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _3711 = _3709 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _3713 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _3715 = _3713 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _3717 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _3719 = _3717 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _3721 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _3723 = _3721 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _3725 = _3697 * _3703;
            float _3727 = precise::clamp(_3725, 0.0, 1.0);
            float _3729 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _3731 = _3729 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _3733 = fma(_3727, _3707, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _3735 = fma(_3727, _3731, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _3737 = fma(_3727, _3711, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _3739 = fma(_3727, _3715, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _3741 = fma(_3727, _3719, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _3743 = fma(_3727, _3723, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _3635 = _3735;
            _3675 = _3741;
            _3661 = _3733;
            _3669 = _3739;
            _3647 = _3737;
            _3683 = _3743;
            _3745 = true;
        }
        else
        {
            bool _3747 = _2134 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _3749 = isnan(_2134);
            bool _3751 = _3747 || _3749;
            bool _3753 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _3755 = _3751 || _3753;
            if (!_3755)
            {
                _3659 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _3757 = _3659;
            _3661 = _3757;
            if (!_3755)
            {
                _3633 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _3759 = _3633;
            _3635 = _3759;
            if (!_3755)
            {
                _3645 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _3761 = _3645;
            _3647 = _3761;
            if (!_3755)
            {
                _3667 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _3763 = _3667;
            _3669 = _3763;
            if (!_3755)
            {
                _3673 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _3765 = _3673;
            _3675 = _3765;
            if (!_3755)
            {
                _3681 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _3767 = _3681;
            bool _3769 = !_3755;
            _3683 = _3767;
            if (!_3769)
            {
                bool _3771 = _2134 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _3773 = isnan(_2134);
                bool _3775 = _3771 || _3773;
                bool _3777 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _3779 = _3775 || _3777;
                if (!_3779)
                {
                    float _3781 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _3783 = _2134 + _3781;
                    float _3785 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _3787 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _3785;
                    float _3789 = 1.0 / _3787;
                    float _3791 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _3793 = _3791 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _3795 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _3797 = _3795 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _3799 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _3801 = _3799 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _3803 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _3805 = _3803 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _3807 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _3809 = _3807 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _3811 = _3783 * _3789;
                    float _3813 = precise::clamp(_3811, 0.0, 1.0);
                    float _3815 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _3817 = _3815 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _3819 = fma(_3813, _3793, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _3821 = fma(_3813, _3817, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _3823 = fma(_3813, _3797, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _3825 = fma(_3813, _3801, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _3827 = fma(_3813, _3805, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _3829 = fma(_3813, _3809, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _3635 = _3821;
                    _3675 = _3827;
                    _3661 = _3819;
                    _3669 = _3825;
                    _3647 = _3823;
                    _3683 = _3829;
                    _3745 = true;
                }
                else
                {
                    _3635 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _3675 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _3661 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _3669 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _3647 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _3683 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _3745 = false;
    float _3831 = _3635;
    float _3833 = _3675;
    float _3835 = _3661;
    float _3837 = _3669;
    float _3839 = _3647;
    float _3841 = _3683;
    float _3843 = fma(_3535, -0.5, 0.5);
    float _3845 = precise::clamp(_3843, 0.0, 1.0);
    float _3847 = -_3831;
    float _3849 = _3847 + _3833;
    float _3851 = -_3835;
    float _3853 = _3851 + _3837;
    float _3855 = -_3839;
    float _3857 = _3855 + _3841;
    bool _3859 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _3861 = fma(_3845, _3849, _3831);
    float _3863 = fma(_3845, _3853, _3835);
    float _3865 = fma(_3845, _3857, _3839);
    float _3867 = _3861 * 0.586610972881317138671875;
    out.m_92.x = 0.0;
    float _3869 = fma(_3863, 0.298911988735198974609375, _3867);
    float _3871 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _3873 = fma(_3865, 0.114477999508380889892578125, _3869);
    out.m_51.x = _3871;
    float _3875 = -_3873;
    float _3877 = _3863 + _3875;
    float _3879 = -_3873;
    float _3881 = _3861 + _3879;
    float _3883 = -_3873;
    float _3885 = _3865 + _3883;
    float _3887 = fma(_3877, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3873);
    float _3889 = fma(_3881, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3873);
    float _3891 = fma(_3885, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3873);
    out.m_94.x = _3887;
    out.m_94.y = _3889;
    out.m_94.z = _3891;
    if (!_3859)
    {
        return out;
    }
    float _3893 = -_2120;
    float _3895 = _3893 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
    float _3897 = -_2100;
    float _3899 = _3897 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
    float _3901 = -_1603;
    float _3903 = _3901 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
    float _3905 = _3895 * _3895;
    float _3907 = fma(_3899, _3899, _3905);
    float _3909 = fma(_3903, _3903, _3907);
    float _3911 = sqrt(_3909);
    float _3913 = rsqrt(_3909);
    float _3915 = -_3911;
    float _3917 = _3915 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _3919 = _3917 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
    float _3921 = precise::clamp(_3919, 0.0, 1.0);
    float _3923 = _3899 * _3913;
    float _3925 = _3895 * _3913;
    float _3927 = abs(_3921);
    float _3929 = log2(_3927);
    float _3931 = _3903 * _3913;
    float _3933 = _3923 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
    float _3935 = _3535 * _3925;
    float _3937 = -_3925;
    float _3939 = -_3933;
    float _3941 = fma(_3937, (*spvDescriptorSet0.vp_c15)._m0[656].y, _3939);
    float _3943 = fma(_3533, _3923, _3935);
    float _3945 = -_3931;
    float _3947 = fma(_3945, (*spvDescriptorSet0.vp_c15)._m0[656].z, _3941);
    float _3949 = fma(_3501, _3931, _3943);
    float _3951 = precise::clamp(_3949, 0.0, 1.0);
    float _3953 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
    float _3955 = _3947 + _3953;
    float _3957 = _3929 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
    float _3959 = _3955 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
    float _3961 = precise::clamp(_3959, 0.0, 1.0);
    float _3963 = exp2(_3957);
    float _3965 = _3963 * _3961;
    float _3967 = _3951 * _3965;
    float _3969 = _3967 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
    float _3971 = _3967 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
    float _3973 = _3967 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
    out.m_92.x = _3969;
    out.m_92.y = _3971;
    out.m_92.z = _3973;
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
    out.m_82 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_86 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_94 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_51 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_80 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_84 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_72 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_78 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_92 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_90 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_88 = float4(0.0, 0.0, 0.0, 1.0);
    bool _3745 = false;
    bool _367 = false;
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
        float _4030 = as_type<float>(_129);
        out.gl_Position.z = _4030;
    }
    if (!_117)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_94.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_94.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_94.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_94.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_92.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_92.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_92.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_92.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_90.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_90.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_90.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_90.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_88.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_88.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_88.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_88.w)); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
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
        float _4099 = as_type<float>(_167);
        out.gl_Position.z = _4099;
    }
    if (_161)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_94.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_94.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_94.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_94.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_92.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_92.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_92.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_92.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_90.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_90.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_90.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_90.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_88.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_88.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_88.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_88.w)); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _169 = in.m_55.x;
    float _171 = in.m_55.y;
    float _173 = in.m_55.z;
    float _175 = in.m_57.x;
    float _177 = in.m_57.y;
    float _179 = in.m_57.z;
    float _181 = in.m_59.x;
    float _183 = in.m_59.y;
    float _185 = in.m_59.z;
    float _187 = as_type<float>(int(gl_VertexIndex));
    float _189 = _169 * _169;
    float _191 = _171 * _171;
    float _193 = _173 * _173;
    float _195 = fma(_175, _175, _189);
    float _197 = fma(_177, _177, _191);
    float _199 = fma(_179, _179, _193);
    float _201 = fma(_181, _181, _195);
    float _203 = fma(_183, _183, _197);
    float _205 = fma(_185, _185, _199);
    float _207 = sqrt(_201);
    float _209 = sqrt(_203);
    bool _211 = _207 > 0.0;
    float _213 = sqrt(_205);
    bool _215 = _209 > 0.0;
    float _217 = _201;
    float _219 = _203;
    int _221 = as_type<int>(_185);
    if (_211)
    {
        float _223 = rsqrt(_201);
        _217 = _223;
    }
    float _225 = _217;
    float _227 = 0.0;
    float _229 = 0.0;
    if (!_211)
    {
        _227 = 0.0;
        _229 = 0.0;
    }
    float _231 = _227;
    float _233 = _229;
    float _235 = 0.0;
    float _237 = _233;
    float _239 = _231;
    if (!_211)
    {
        _235 = 0.0;
    }
    float _241 = _235;
    bool _243 = _213 > 0.0;
    float _245 = 0.0;
    float _247 = _241;
    if (_215)
    {
        float _249 = rsqrt(_203);
        _245 = _249;
    }
    float _251 = _245;
    int _253 = as_type<int>(_187) & 1;
    bool _255 = _253 != 0;
    int _257 = as_type<int>(_187) & 2;
    bool _259 = _257 != 0;
    float _261 = 0.0;
    float _263 = 0.0;
    if (!_215)
    {
        _261 = 0.0;
        _263 = 0.0;
    }
    float _265 = _261;
    float _267 = _263;
    float _269 = 0.0;
    float _271 = _267;
    float _273 = _265;
    if (!_215)
    {
        _269 = 0.0;
    }
    float _275 = _269;
    bool _277 = !_255;
    float _279 = _277 ? (-0.5) : 0.5;
    float _281 = _275;
    if (_211)
    {
        float _283 = _225 * _169;
        _237 = _283;
    }
    float _285 = _237;
    if (_211)
    {
        float _287 = _225 * _175;
        _239 = _287;
    }
    float _289 = _239;
    float _291 = _209;
    if (_243)
    {
        float _293 = rsqrt(_205);
        _291 = _293;
    }
    float _295 = _291;
    if (_211)
    {
        float _297 = _225 * _181;
        _247 = _297;
    }
    float _299 = _247;
    bool _301 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _303 = 0.0;
    if (!_243)
    {
        _303 = 0.0;
    }
    float _305 = _303;
    float _307 = 0.0;
    float _309 = _305;
    if (!_243)
    {
        _307 = 0.0;
    }
    float _311 = _307;
    float _313 = _311;
    if (_215)
    {
        float _315 = _251 * _171;
        _271 = _315;
    }
    float _317 = _271;
    if (!_243)
    {
        _219 = 0.0;
    }
    float _319 = _219;
    float _321 = _319;
    if (_215)
    {
        float _323 = _251 * _177;
        _273 = _323;
    }
    float _325 = _273;
    if (_215)
    {
        float _327 = _251 * _183;
        _281 = _327;
    }
    float _329 = _281;
    bool _331 = !_259;
    float _333 = _331 ? (-0.5) : 0.5;
    if (_243)
    {
        float _335 = _295 * _173;
        _309 = _335;
    }
    float _337 = _309;
    if (_243)
    {
        float _339 = _295 * _179;
        _313 = _339;
    }
    float _341 = _313;
    if (_243)
    {
        float _343 = _295 * _185;
        _321 = _343;
    }
    float _345 = _321;
    bool _347 = !_301;
    float _365;
    if (!_347)
    {
        float _349 = in.m_64.x;
        float _351 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _353 = _349 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _355 = fma(_353, (*spvDescriptorSet0.vp_c9)._m0[12].x, _147);
        float _357 = _355 * _351;
        float _359 = floor(_357);
        float _361 = -_359;
        float _363 = _357 + _361;
        _365 = _363;
        _367 = true;
    }
    else
    {
        float _369 = float(_113);
        float _371 = 1.0 / _369;
        float _373 = _147 * _371;
        _365 = _373;
    }
    _367 = false;
    float _375 = _365;
    float _377 = in.m_48.x;
    float _379 = in.m_48.y;
    float _381 = in.m_48.z;
    float _383 = -(*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _385 = _375 + _383;
    float _387 = in.m_66.y;
    float _389 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _391 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _389;
    float _393 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _395 = _393 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _397 = in.m_64.x;
    float _399 = in.m_64.y;
    float _401 = in.m_64.z;
    float _403 = in.m_64.w;
    float _405 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _407 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _405;
    float _409 = 1.0 / _391;
    float _411 = -(*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _413 = (*spvDescriptorSet0.vp_c9)._m0[148].w + _411;
    float _415 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _417 = _415 + (*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _419 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _421 = _375 + _419;
    float _423 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _425 = _375 + _423;
    float _427 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _429 = _375 + _427;
    float _431 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _433 = _375 + _431;
    float _435 = 1.0 / _407;
    float _437 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _439 = in.m_57.w;
    bool _441 = _375 >= (*spvDescriptorSet0.vp_c9)._m0[147].w;
    bool _443 = isnan(_375);
    bool _445 = _441 || _443;
    bool _447 = isnan((*spvDescriptorSet0.vp_c9)._m0[147].w);
    bool _449 = _445 || _447;
    float _451 = float(_449);
    float _453 = _183 * _379;
    float _455 = _177 * _379;
    float _457 = 1.0 / _413;
    float _459 = -(*spvDescriptorSet0.vp_c9)._m0[149].w;
    float _461 = (*spvDescriptorSet0.vp_c9)._m0[150].w + _459;
    float _463 = _379 + _387;
    float _465 = fma(_175, _377, _455);
    float _467 = _397 * 2.0;
    int _469 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _471 = _469 != 0;
    float _473 = 1.0 / _395;
    float _475 = fma(_181, _377, _453);
    float _477 = _397 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _479 = fma(_179, _381, _465);
    float _481 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _483 = fma(_185, _381, _475);
    float _485 = float(_113);
    float _487 = -(*spvDescriptorSet0.vp_c9)._m0[149].w;
    float _489 = _375 + _487;
    float _491 = floor(_467);
    float _493 = -(*spvDescriptorSet0.vp_c9)._m0[148].w;
    float _495 = _493 + (*spvDescriptorSet0.vp_c9)._m0[149].w;
    float _497 = _399 * 2.0;
    float _499 = _385 * _457;
    if (_471)
    {
        _221 = 0;
    }
    int _501 = _221;
    float _503 = _425 * _435;
    int _505 = _501;
    if (!_471)
    {
        _505 = 1;
    }
    int _507 = _505;
    float _509 = _433 * _409;
    float _511 = 1.0 / _417;
    float _513 = _421 * _473;
    bool _515 = _507 != 1;
    float _517 = _479 + _439;
    bool _519 = _375 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _521 = isnan(_375);
    bool _523 = _519 || _521;
    bool _525 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _527 = _523 || _525;
    float _529 = float(_527);
    float _531 = floor(_497);
    float _533 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    bool _535 = _491 > 0.0;
    float _537 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _539 = _399 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _541 = 1.0 / _495;
    float _543 = as_type<float>(_507);
    if (!_515)
    {
        _543 = _399;
    }
    float _545 = _543;
    float _547 = -_537;
    float _549 = fma(_477, 2.0, _547);
    float _551 = fma(_539, -2.0, _437);
    float _553 = -(*spvDescriptorSet0.vp_c9)._m0[148].w;
    float _555 = _375 + _553;
    bool _557 = _491 >= 0.0;
    bool _559 = isnan(_491);
    bool _561 = _557 || _559;
    bool _563 = isnan(0.0);
    bool _565 = _561 || _563;
    float _567 = -_147;
    float _569 = fma(_567, (*spvDescriptorSet0.vp_c9)._m0[76].x, _549);
    float _571 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].y);
    int _573 = int(_571);
    float _575 = fma(_147, (*spvDescriptorSet0.vp_c9)._m0[76].y, _551);
    bool _577 = _531 > 0.0;
    float _579 = _429 * _511;
    bool _581 = _531 >= 0.0;
    bool _583 = isnan(_531);
    bool _585 = _581 || _583;
    bool _587 = isnan(0.0);
    bool _589 = _585 || _587;
    float _591 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    int _593 = _565 ? 0 : 1;
    float _595 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _597 = int(_595);
    float _599 = _545;
    if (_515)
    {
        _599 = _397;
    }
    float _601 = _599;
    float _603 = _555 * _541;
    int _605 = ~_593;
    int _607 = _605 + 1;
    int _609 = _607 + 1;
    float _611 = _397 + _399;
    int _613 = _609;
    float _615 = _601;
    if (!_535)
    {
        int _617 = ~_593;
        int _619 = _617 + 1;
        _613 = _619;
    }
    int _621 = _613;
    float _623 = fma(_601, (*spvDescriptorSet0.vp_c9)._m0[83].z, _591);
    if (!_515)
    {
        _615 = _401;
    }
    float _625 = _615;
    float _627 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _629 = log2(_627);
    float _631 = float(_573);
    float _633 = fma(_147, (*spvDescriptorSet0.vp_c9)._m0[82].z, _623);
    float _635 = as_type<float>(_573);
    float _637 = _625;
    if (!_515)
    {
        _635 = _399;
    }
    float _639 = _635;
    float _641 = _611 + (-1.0);
    float _643 = _639;
    if (_515)
    {
        _643 = _397;
    }
    float _645 = _643;
    if (_515)
    {
        _637 = _399;
    }
    float _647 = _637;
    float _649 = 1.0 / _461;
    float _651 = float(_597);
    float _653 = as_type<float>(_597);
    if (!_515)
    {
        _653 = _401;
    }
    float _655 = _653;
    float _657 = fma(_647, (*spvDescriptorSet0.vp_c9)._m0[83].w, _533);
    float _659 = _655;
    if (_515)
    {
        _659 = _399;
    }
    float _661 = _659;
    int _663 = _589 ? 0 : 1;
    float _665 = _629 * _147;
    float _667 = 1.0 / _651;
    float _669 = _401 * 2.0;
    int _671 = ~_663;
    int _673 = _671 + 1;
    int _675 = _673 + 1;
    float _677 = fma(_147, (*spvDescriptorSet0.vp_c9)._m0[82].w, _657);
    int _679 = _675;
    if (!_577)
    {
        int _681 = ~_663;
        int _683 = _681 + 1;
        _679 = _683;
    }
    int _685 = _679;
    float _687 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _689 = _489 * _649;
    float _691 = exp2(_665);
    float _693 = _645 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _695 = _661 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _697 = fma(_399, (*spvDescriptorSet0.vp_c9)._m0[78].w, _687);
    float _699 = fma(_695, -2.0, _481);
    float _701 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _703 = 1.0 + _701;
    float _705 = 1.0 / _485;
    bool _707 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _709 = isnan(1.0);
    bool _711 = _707 || _709;
    bool _713 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _715 = _711 || _713;
    float _717 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    bool _719 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _721 = isnan(0.0);
    bool _723 = _719 || _721;
    bool _725 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _727 = _723 || _725;
    float _729 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _731 = _401 + _397;
    float _733 = -_717;
    float _735 = fma(_693, 2.0, _733);
    float _737 = 1.0 / _631;
    float _739 = -_691;
    float _741 = _739 + 1.0;
    float _743 = fma(_397, (*spvDescriptorSet0.vp_c9)._m0[78].z, _729);
    float _745 = _667 * _147;
    float _747 = fma(_147, (*spvDescriptorSet0.vp_c9)._m0[77].w, _697);
    float _749 = -_147;
    float _751 = fma(_749, (*spvDescriptorSet0.vp_c9)._m0[81].x, _735);
    float _753 = _727 ? _741 : 0.0;
    float _755 = fma(_147, (*spvDescriptorSet0.vp_c9)._m0[77].z, _743);
    float _757 = 1.0 / _703;
    float _759 = _705 * _147;
    float _761 = fma(_147, (*spvDescriptorSet0.vp_c9)._m0[81].y, _699);
    float _763 = _731 + (-1.0);
    float _765 = fma(_763, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _767 = _737 * _147;
    float _769 = floor(_669);
    float _771 = _401 + _399;
    float _773 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _775 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _773;
    bool _777 = _375 >= (*spvDescriptorSet0.vp_c9)._m0[150].w;
    bool _779 = isnan(_375);
    bool _781 = _777 || _779;
    bool _783 = isnan((*spvDescriptorSet0.vp_c9)._m0[150].w);
    bool _785 = _781 || _783;
    float _787 = float(_785);
    float _789 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _791 = _789 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _793 = _771 + (-1.0);
    if (_715)
    {
        float _795 = _753 * _757;
        _151 = _795;
    }
    float _797 = _151;
    float _799 = fma(_793, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _801 = -_787;
    float _803 = _801 + 1.0;
    float _805 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[201].y;
    float _807 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _809 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _807;
    float _811 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _813 = _811 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _815 = -(*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _817 = (*spvDescriptorSet0.vp_c9)._m0[148].y + _815;
    bool _819 = _769 >= 0.0;
    bool _821 = isnan(_769);
    bool _823 = _819 || _821;
    bool _825 = isnan(0.0);
    bool _827 = _823 || _825;
    float _829 = fma(_809, _509, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _831 = fma(_775, _509, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _833 = fma(_813, _513, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _835 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _837 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _835;
    bool _839 = _375 >= (*spvDescriptorSet0.vp_c9)._m0[149].w;
    bool _841 = isnan(_375);
    bool _843 = _839 || _841;
    bool _845 = isnan((*spvDescriptorSet0.vp_c9)._m0[149].w);
    bool _847 = _843 || _845;
    float _849 = float(_847);
    float _851 = fma(_791, _513, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _853 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _855 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _853;
    bool _857 = _375 >= (*spvDescriptorSet0.vp_c9)._m0[148].w;
    bool _859 = isnan(_375);
    bool _861 = _857 || _859;
    bool _863 = isnan((*spvDescriptorSet0.vp_c9)._m0[148].w);
    bool _865 = _861 || _863;
    float _867 = float(_865);
    float _869 = -(*spvDescriptorSet0.vp_c9)._m0[146].x;
    float _871 = _869 + (*spvDescriptorSet0.vp_c9)._m0[147].x;
    int _873 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _875 = _873 != 0;
    int _877 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _879 = _877 != 0;
    int _881 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _883 = _881 != 0;
    float _885 = fma(_855, _503, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _887 = fma(_837, _503, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _889 = _849 * _803;
    float _891 = -_849;
    float _893 = _891 + 1.0;
    float _895 = -_867;
    float _897 = _895 + 1.0;
    bool _899 = !_879;
    int _901 = _899 ? 0 : 1;
    float _903 = -(*spvDescriptorSet0.vp_c9)._m0[146].y;
    float _905 = _903 + (*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _907 = _867 * _893;
    float _909 = _451 * _897;
    bool _911 = _769 > 0.0;
    float _913 = -_451;
    float _915 = _913 + 1.0;
    float _917 = fma(_871, _579, (*spvDescriptorSet0.vp_c9)._m0[146].x);
    float _919 = fma(_905, _579, (*spvDescriptorSet0.vp_c9)._m0[146].y);
    bool _921 = _375 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _923 = isnan(_375);
    bool _925 = _921 || _923;
    bool _927 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _929 = _925 || _927;
    float _931 = float(_929);
    float _933 = _529 * _915;
    bool _935 = _375 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _937 = isnan(_375);
    bool _939 = _935 || _937;
    bool _941 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _943 = _939 || _941;
    float _945 = float(_943);
    float _947 = -_529;
    float _949 = _947 + 1.0;
    bool _951 = _375 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _953 = isnan(_375);
    bool _955 = _951 || _953;
    bool _957 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _959 = _955 || _957;
    float _961 = float(_959);
    float _963 = in.m_59.w;
    int _965 = _827 ? 0 : 1;
    float _967 = -_945;
    float _969 = _967 + 1.0;
    int _971 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 256;
    bool _973 = _971 != 0;
    int _975 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 512;
    bool _977 = _975 != 0;
    int _979 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1024;
    bool _981 = _979 != 0;
    int _983 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2048;
    bool _985 = _983 != 0;
    float _987 = _961 * _949;
    float _989 = -_961;
    float _991 = _989 + 1.0;
    float _993 = -(*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _995 = (*spvDescriptorSet0.vp_c9)._m0[148].x + _993;
    int _997 = ~_965;
    int _999 = _997 + 1;
    int _1001 = _999 + 1;
    bool _1003 = !_875;
    int _1005 = _1003 ? 0 : 1;
    float _1007 = _945 * _991;
    int _1009 = _1001;
    if (!_911)
    {
        int _1011 = ~_965;
        int _1013 = _1011 + 1;
        _1009 = _1013;
    }
    int _1015 = _1009;
    float _1017 = fma(_995, _499, (*spvDescriptorSet0.vp_c9)._m0[147].x);
    bool _1019 = !_883;
    int _1021 = _1019 ? 0 : 1;
    float _1023 = -(*spvDescriptorSet0.vp_c9)._m0[148].x;
    float _1025 = _1023 + (*spvDescriptorSet0.vp_c9)._m0[149].x;
    int _1027 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _1029 = _1027 != 0;
    int _1031 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _1033 = _1031 != 0;
    int _1035 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _1037 = _1035 != 0;
    float _1039 = _931 * _969;
    float _1041 = fma(_817, _499, (*spvDescriptorSet0.vp_c9)._m0[147].y);
    float _1043 = -(*spvDescriptorSet0.vp_c9)._m0[148].y;
    float _1045 = _1043 + (*spvDescriptorSet0.vp_c9)._m0[149].y;
    float _1047 = -_931;
    float _1049 = _1047 + 1.0;
    bool _1051 = !_1029;
    int _1053 = _1051 ? 0 : 1;
    float _1055 = _829 * _1039;
    float _1057 = fma(_1025, _603, (*spvDescriptorSet0.vp_c9)._m0[148].x);
    float _1059 = fma(_1045, _603, (*spvDescriptorSet0.vp_c9)._m0[148].y);
    int _1061 = abs(_1053);
    float _1063 = _797 + (*spvDescriptorSet0.vp_c9)._m0[202].y;
    float _1065 = fma(_1049, (*spvDescriptorSet0.vp_c9)._m0[143].x, _1055);
    float _1067 = float(_1015);
    float _1069 = _831 * _1039;
    float _1071 = float(_1061);
    float _1073 = _1063 * _805;
    float _1075 = fma(_833, _1007, _1065);
    float _1077 = fma(_1049, (*spvDescriptorSet0.vp_c9)._m0[143].y, _1069);
    bool _1079 = !_1033;
    int _1081 = _1079 ? 0 : 1;
    float _1083 = _1071 * _1067;
    float _1085 = fma(_885, _987, _1075);
    float _1087 = fma(_397, (*spvDescriptorSet0.vp_c9)._m0[203].y, _1073);
    float _1089 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1091 = _463 + _1089;
    float _1093 = in.m_68.x;
    float _1095 = in.m_68.y;
    float _1097 = in.m_68.z;
    float _1099 = _483 + _963;
    float _1101 = fma(_851, _1007, _1077);
    bool _1103 = !_1037;
    int _1105 = _1103 ? 0 : 1;
    float _1107 = _1091 * _1091;
    float _1109 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1111 = _517 + _1109;
    int _1113 = abs(_1081);
    float _1115 = floor(_1087);
    int _1117 = abs(_1105);
    float _1119 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1121 = _1099 + _1119;
    float _1123 = fma(_1111, _1111, _1107);
    float _1125 = _1087 + 0.25;
    float _1127 = _1083 * (-2.0);
    float _1129 = fma(_1121, _1121, _1123);
    float _1131 = floor(_1125);
    float _1133 = fma(_887, _987, _1101);
    float _1135 = float(_621);
    float _1137 = fma(_917, _933, _1085);
    float _1139 = float(_1113);
    float _1141 = fma(_641, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _1143 = float(_685);
    float _1145 = rsqrt(_1129);
    float _1147 = float(_1117);
    float _1149 = _1139 * _1135;
    int _1151 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 32768;
    bool _1153 = _1151 != 0;
    float _1155 = _397 + (-0.5);
    bool _1157 = !_977;
    int _1159 = _1157 ? 0 : 1;
    float _1161 = _1147 * _1143;
    bool _1163 = !_973;
    int _1165 = _1163 ? 0 : 1;
    float _1167 = fma(_1127, _1093, _1093);
    int _1169 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 65536;
    bool _1171 = _1169 != 0;
    int _1173 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 131072;
    bool _1175 = _1173 != 0;
    float _1177 = -_1115;
    float _1179 = _1087 + _1177;
    float _1181 = _1087 * 6.283185482025146484375;
    float _1183 = fma(_1155, (*spvDescriptorSet0.vp_c9)._m0[196].x, _1167);
    float _1185 = -_1131;
    float _1187 = _1125 + _1185;
    bool _1189 = !_1171;
    int _1191 = _1189 ? 0 : 1;
    float _1193 = _1181 * 0.15915493667125701904296875;
    bool _1195 = _1179 >= 0.5;
    bool _1197 = isnan(_1179);
    bool _1199 = _1195 || _1197;
    bool _1201 = isnan(0.5);
    bool _1203 = _1199 || _1201;
    float _1205 = fma(_1141, _1127, _1141);
    int _1207 = abs(_1191);
    float _1209 = _1091 * _1145;
    bool _1211 = _1187 > 0.5;
    float _1213 = _1193 * 6.283185482025146484375;
    float _1215 = sin(_1213);
    bool _1217 = !_1153;
    int _1219 = _1217 ? 0 : 1;
    float _1221 = -_1209;
    float _1223 = fma(_1221, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1091);
    bool _1225 = !_1203;
    float _1227 = _1225 ? 0.5 : (-0.5);
    float _1229 = _1111 * _1145;
    int _1231 = abs(_1219);
    float _1233 = _1223 * _1223;
    float _1235 = float(_1207);
    float _1237 = _1227 * (*spvDescriptorSet0.vp_c9)._m0[200].y;
    float _1239 = _1237 * 2.0;
    float _1241 = -_1229;
    float _1243 = fma(_1241, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1111);
    bool _1245 = !_1175;
    int _1247 = _1245 ? 0 : 1;
    float _1249 = _1235 * _1239;
    float _1251 = _1187;
    float _1253 = _1229;
    if (_1211)
    {
        float _1255 = -_1187;
        float _1257 = _1255 + 1.0;
        _1251 = _1257;
    }
    float _1259 = _1251;
    float _1261 = _1121 * _1145;
    float _1263 = float(_1231);
    float _1265 = _1215 * (*spvDescriptorSet0.vp_c9)._m0[200].y;
    int _1267 = abs(_1247);
    float _1269 = fma(_1259, 4.0, -1.0);
    float _1271 = fma(_1243, _1243, _1233);
    float _1273 = -_1261;
    float _1275 = fma(_1273, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1121);
    float _1277 = float(_1267);
    float _1279 = fma(_1263, _1265, _1249);
    float _1281 = _1269 * (*spvDescriptorSet0.vp_c9)._m0[200].y;
    float _1283 = fma(_1275, _1275, _1271);
    float _1285 = _1161 * (-2.0);
    float _1287 = fma(_1205, _797, _1183);
    float _1289 = fma(_1277, _1281, _1279);
    float _1291 = _401 + (-0.5);
    float _1293 = fma(_765, _1285, _765);
    float _1295 = fma(_1285, _1097, _1097);
    float _1297 = fma(_1289, 3.1415927410125732421875, _1095);
    float _1299 = _1149 * (-2.0);
    float _1301 = fma(_919, _933, _1133);
    float _1303 = fma(_1291, (*spvDescriptorSet0.vp_c9)._m0[196].z, _1295);
    float _1305 = _399 + (-0.5);
    float _1307 = fma(_1297, _1299, _1297);
    float _1309 = fma(_799, _1299, _799);
    float _1311 = fma(_1017, _909, _1137);
    float _1313 = fma(_1305, (*spvDescriptorSet0.vp_c9)._m0[196].y, _1307);
    float _1315 = in.m_70.x;
    float _1317 = in.m_70.y;
    float _1319 = fma(_1041, _909, _1301);
    float _1321 = fma(_1309, _797, _1313);
    float _1323 = -(*spvDescriptorSet0.vp_c9)._m0[149].x;
    float _1325 = (*spvDescriptorSet0.vp_c9)._m0[150].x + _1323;
    float _1327 = -(*spvDescriptorSet0.vp_c9)._m0[149].y;
    float _1329 = (*spvDescriptorSet0.vp_c9)._m0[150].y + _1327;
    float _1331 = fma(_1293, _797, _1303);
    float _1333 = fma(_1059, _907, _1319);
    float _1335 = fma(_1325, _689, (*spvDescriptorSet0.vp_c9)._m0[149].x);
    float _1337 = fma(_1329, _689, (*spvDescriptorSet0.vp_c9)._m0[149].y);
    float _1339 = sqrt(_1283);
    float _1341 = fma(_1057, _907, _1311);
    float _1343 = _1287 * 0.15915493667125701904296875;
    float _1345 = fma(_1337, _889, _1333);
    float _1347 = _1331 * 0.15915493667125701904296875;
    float _1349 = fma(_1335, _889, _1341);
    float _1351 = _1321 * 0.15915493667125701904296875;
    float _1353 = fma(_787, (*spvDescriptorSet0.vp_c9)._m0[150].y, _1345);
    float _1355 = _1343 * 6.283185482025146484375;
    float _1357 = sin(_1355);
    float _1359 = fma(_787, (*spvDescriptorSet0.vp_c9)._m0[150].x, _1349);
    float _1361 = _467 + (-1.0);
    float _1363 = fma(_1361, (*spvDescriptorSet0.vp_c9)._m0[191].x, _279);
    float _1365 = _1353 * _1317;
    float _1367 = _1343 * 6.283185482025146484375;
    float _1369 = cos(_1367);
    float _1371 = _1359 * _1315;
    float _1373 = _1145 * _1339;
    float _1375 = fma(_1361, (*spvDescriptorSet0.vp_c9)._m0[191].x, _333);
    float _1377 = _1365 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1379 = _1371 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1381 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _1363);
    float _1383 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _1375);
    float _1385 = _1347 * 6.283185482025146484375;
    float _1387 = cos(_1385);
    float _1389 = _1379 * _1373;
    float _1391 = _1377 * _1373;
    float _1393 = _1373 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _1395 = _1393 * 0.5;
    float _1397 = _1389 * _1381;
    float _1399 = _1391 * _1383;
    float _1401 = _1351 * 6.283185482025146484375;
    float _1403 = sin(_1401);
    float _1405 = _1351 * 6.283185482025146484375;
    float _1407 = cos(_1405);
    float _1409 = _1369 * _1387;
    float _1411 = _1357 * _1387;
    float _1413 = _1409 * _1395;
    float _1415 = _1347 * 6.283185482025146484375;
    float _1417 = sin(_1415);
    float _1419 = _1357 * _1403;
    float _1421 = _1369 * _1407;
    float _1423 = _1357 * _1407;
    float _1425 = _1369 * _1403;
    float _1427 = _1407 * _1387;
    float _1429 = _1403 * _1387;
    float _1431 = fma(_1417, _1421, _1419);
    float _1433 = _1417 * _1395;
    float _1435 = -_1423;
    float _1437 = fma(_1417, _1425, _1435);
    float _1439 = -_1425;
    float _1441 = fma(_1417, _1423, _1439);
    float _1443 = fma(_1431, _1397, _1413);
    float _1445 = _1411 * _1395;
    float _1447 = -_1433;
    float _1449 = fma(_1427, _1397, _1447);
    float _1451 = fma(_1417, _1419, _1421);
    float _1453 = -_1399;
    float _1455 = fma(_1437, _1453, _1443);
    float _1457 = fma(_1441, _1397, _1445);
    float _1459 = -_1399;
    float _1461 = fma(_1429, _1459, _1449);
    bool _1463 = !_981;
    int _1465 = _1463 ? 0 : 1;
    float _1467 = _1455 * _329;
    float _1469 = -_1399;
    float _1471 = fma(_1451, _1469, _1457);
    float _1473 = _1455 * _325;
    float _1475 = _1455 * _317;
    float _1477 = fma(_1461, _299, _1467);
    float _1479 = fma(_1461, _289, _1473);
    float _1481 = fma(_1461, _285, _1475);
    float _1483 = fma(_1471, _345, _1477);
    float _1485 = fma(_1471, _341, _1479);
    float _1487 = fma(_1471, _337, _1481);
    float _1489 = _1099 + _1483;
    float _1491 = _517 + _1485;
    float _1493 = _463 + _1487;
    float _1495 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1497 = _1489 + _1495;
    float _1499 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1501 = _1491 + _1499;
    float _1503 = _1497 * _1497;
    float _1505 = fma(_1501, _1501, _1503);
    bool _1507 = !_985;
    int _1509 = _1507 ? 0 : 1;
    float _1511 = sqrt(_1505);
    bool _1513 = _1511 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1515 = _1471;
    float _1517 = _1487;
    float _1519 = _1491;
    float _1521 = _1501;
    if (!_1513)
    {
        _1515 = _1491;
    }
    float _1523 = _1515;
    float _1525 = _1523;
    if (!_1513)
    {
        _1517 = _1489;
    }
    float _1527 = _1517;
    float _1529 = _1527;
    if (!_1513)
    {
        _1519 = _1493;
    }
    float _1531 = _1519;
    bool _1533 = !_1513;
    float _1535 = _1531;
    if (!_1533)
    {
        float _1537 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1539 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1541 = _1511 + _1539;
        float _1543 = _1493 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1545 = rsqrt(_1505);
        float _1547 = _1541 * _1537;
        float _1549 = _1547 * 0.15915493667125701904296875;
        float _1551 = _1549 * 6.283185482025146484375;
        float _1553 = sin(_1551);
        float _1555 = _1549 * 6.283185482025146484375;
        float _1557 = cos(_1555);
        float _1559 = fma(_1553, _1543, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1561 = _1545 * _1559;
        float _1563 = _1557 + (-1.0);
        float _1565 = fma(_1501, _1561, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1567 = fma(_1497, _1561, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _1569 = _1563 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1571 = fma(_1493, _1557, _1569);
        _1529 = _1567;
        _1525 = _1565;
        _1535 = _1571;
    }
    float _1573 = _1529;
    float _1575 = _1525;
    float _1577 = _1535;
    float _1579 = -(*spvDescriptorSet0.vp_c15)._m0[630].y;
    float _1581 = _1573 + _1579;
    float _1583 = -(*spvDescriptorSet0.vp_c15)._m0[630].x;
    float _1585 = _1575 + _1583;
    float _1587 = fma(_1581, (*spvDescriptorSet0.vp_c15)._m0[630].z, 0.5);
    float _1589 = fma(_1585, (*spvDescriptorSet0.vp_c15)._m0[630].z, 0.5);
    float2 _6243 = float2(_1589, _1587);
    float _1591 = dm_bs(spvDescriptorSet0.vp_t_tcb_28.sample(spvDescriptorSet0.vp_t_tcb_28Smplr, select(_6243, float2(0.0), isnan(_6243)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_28, spvDescriptorSet0.vp_t_tcb_28Smplr_w, select(_6243, float2(0.0), isnan(_6243)), level(0.0)).x;
    float _1593 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _1595 = int(_1593);
    int _1597 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _1599 = _1597 != 0;
    float _1601 = -_1261;
    float _1603 = fma(_1601, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1573);
    int _1605 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _1607 = _1605 != 0;
    float _1609 = -_1261;
    float _1611 = fma(_1609, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1099);
    int _1613 = abs(_1159);
    float _1615 = -_1229;
    float _1617 = fma(_1615, (*spvDescriptorSet0.vp_c9)._m0[18].w, _517);
    int _1619 = abs(_1465);
    float _1621 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].x);
    int _1623 = int(_1621);
    if (_1599)
    {
        float _1625 = in.m_64.x;
        _1521 = _1625;
    }
    float _1627 = _1521;
    float _1629 = float(uint(_1595));
    float _1631 = trunc(_745);
    int _1633 = int(_1631);
    float _1635 = trunc(_767);
    int _1637 = int(_1635);
    float _1639 = float(uint(_1623));
    float _1641 = _1627;
    if (!_1599)
    {
        float _1643 = in.m_64.y;
        _1641 = _1643;
    }
    float _1645 = _1641;
    int _1647 = ~_1595;
    int _1649 = _1647 + 1;
    bool _1651 = _1595 == 0;
    float _1653 = float(_1623);
    float _1655 = 1.0 / _1629;
    float _1657 = float(uint(_1633));
    int _1659 = ~_1595;
    int _1661 = _1659 + 1;
    float _1663 = 1.0 / _1639;
    float _1665 = float(uint(_1637));
    int _1667 = as_type<int>(_1655) + (-2);
    float _1669 = as_type<float>(_1667) * _1657;
    int _1671 = as_type<int>(_1663) + (-2);
    float _1673 = trunc(_1669);
    float _1675 = precise::max(_1673, 0.0);
    uint _1678 = uint(_1675);
    float _1680 = as_type<float>(_1671) * _1665;
    float _1682 = trunc(_1680);
    float _1684 = precise::max(_1682, 0.0);
    uint _1686 = uint(_1684);
    int _1688 = ~_1623;
    int _1690 = _1688 + 1;
    int _1692 = _1649 * int(_1678);
    int _1694 = _1692 + _1633;
    float _1696 = as_type<float>(_1649);
    float _1698 = as_type<float>(_1694);
    if (_1599)
    {
        _1696 = 1.0;
    }
    float _1700 = _1696;
    float _1702 = _1700;
    if (!_1599)
    {
        _1702 = 7.345489978790283203125;
    }
    float _1704 = _1702;
    float _1706 = float(uint(_1694));
    if (_1599)
    {
        _1698 = 1.0;
    }
    float _1708 = _1698;
    int _1710 = _1690 * int(_1686);
    int _1712 = _1710 + _1637;
    float _1714 = _1708;
    if (!_1599)
    {
        _1714 = 1.2345600128173828125;
    }
    float _1716 = _1714;
    float _1718 = as_type<float>(_1667) * _1706;
    float _1720 = _1704 * _397;
    float _1722 = float(uint(_1712));
    float _1724 = _1645 * _1716;
    int _1726 = ~_1595;
    int _1728 = _1726 + 1;
    float _1730 = trunc(_1718);
    float _1732 = precise::max(_1730, 0.0);
    uint _1734 = uint(_1732);
    float _1736 = as_type<float>(_1671) * _1722;
    float _1738 = floor(_1720);
    int _1740 = int(_1678) + int(_1734);
    float _1742 = floor(_1724);
    float _1744 = float(_1595);
    float _1746 = float(_1633);
    int _1748 = _1728 * _1740;
    int _1750 = _1748 + _1633;
    float _1752 = -_1738;
    float _1754 = _1720 + _1752;
    float _1756 = trunc(_1736);
    float _1758 = precise::max(_1756, 0.0);
    uint _1760 = uint(_1758);
    bool _1762 = _1746 >= _1744;
    bool _1764 = isnan(_1746);
    bool _1766 = _1762 || _1764;
    bool _1768 = isnan(_1744);
    bool _1770 = _1766 || _1768;
    float _1772 = float(_1770);
    bool _1774 = uint(_1750) >= uint(_1595);
    int _1776 = ~_1623;
    int _1778 = _1776 + 1;
    bool _1780 = !_1774;
    int _1782 = _1780 ? 0 : (-1);
    float _1784 = trunc(_1772);
    int _1786 = int(_1784);
    float _1788 = -_1742;
    float _1790 = _1724 + _1788;
    int _1792 = ~_1740;
    int _1794 = _1792 + _1782;
    int _1796 = _1794 + 1;
    float _1798 = _1790 * _1653;
    float _1800 = _1754 * _1744;
    int _1802 = int(_1686) + int(_1760);
    int _1804 = _1595 * _1796;
    int _1806 = _1804 + _1633;
    float _1808 = float(_1637);
    float _1810 = _1744 * _759;
    int _1812 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _1814 = _1812 != 0;
    int _1816 = _1778 * _1802;
    int _1818 = _1816 + _1637;
    float _1820 = trunc(_1800);
    int _1822 = int(_1820);
    bool _1824 = !_1651;
    int _1826 = _1824 ? _1806 : (-1);
    int _1828 = ~_1786;
    int _1830 = _1828 + 1;
    int _1832 = _1830 + 1;
    bool _1834 = _1808 >= _1653;
    bool _1836 = isnan(_1808);
    bool _1838 = _1834 || _1836;
    bool _1840 = isnan(_1653);
    bool _1842 = _1838 || _1840;
    float _1844 = float(_1842);
    bool _1846 = !_1814;
    int _1848 = _1846 ? 0 : 1;
    int _1850 = _1826 * _1832;
    bool _1852 = uint(_1818) >= uint(_1623);
    float _1854 = trunc(_1810);
    int _1856 = int(_1854);
    int _1858 = _1595 + (-1);
    int _1860 = abs(_1848);
    int _1862 = abs(_901);
    int _1864 = _1786 * _1858;
    int _1866 = _1864 + _1850;
    bool _1868 = !_1852;
    int _1870 = _1868 ? 0 : (-1);
    float _1872 = trunc(_1844);
    int _1874 = int(_1872);
    float _1876 = _1653 * _759;
    int _1878 = ~_1802;
    int _1880 = _1878 + _1870;
    int _1882 = _1880 + 1;
    bool _1884 = _1623 == 0;
    int _1886 = _1822 * _1860;
    int _1888 = _1886 + _1633;
    int _1890 = abs(_1005);
    int _1892 = _1866 * _1862;
    int _1894 = abs(_1021);
    int _1896 = _1623 * _1882;
    int _1898 = _1896 + _1637;
    bool _1900 = !_1607;
    int _1902 = _1900 ? 0 : 1;
    int _1904 = _1856 * _1890;
    int _1906 = _1904 + _1892;
    float _1908 = trunc(_1876);
    int _1910 = int(_1908);
    int _1912 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8192;
    bool _1914 = _1912 != 0;
    int _1916 = abs(_1902);
    int _1918 = _1888 * _1894;
    int _1920 = _1918 + _1906;
    int _1922 = ~_1874;
    int _1924 = _1922 + 1;
    int _1926 = _1924 + 1;
    bool _1928 = !_1884;
    int _1930 = _1928 ? _1898 : (-1);
    float _1932 = trunc(_1798);
    int _1934 = int(_1932);
    int _1936 = _1623 + (-1);
    int _1938 = _1930 * _1926;
    bool _1940 = !_1914;
    int _1942 = _1940 ? 0 : 1;
    int _1944 = _1822 * _1916;
    int _1946 = _1944 + _1920;
    int _1948 = abs(_1165);
    int _1950 = _1874 * _1936;
    int _1952 = _1950 + _1938;
    int _1954 = abs(_1942);
    float _1956 = float(uint(_1946));
    int _1958 = _1952 * _1613;
    int _1960 = ~_1595;
    int _1962 = _1960 + 1;
    float _1964 = as_type<float>(_1667) * _1956;
    float _1966 = float(uint(_1888));
    int _1968 = _1910 * _1948;
    int _1970 = _1968 + _1958;
    int _1972 = abs(_1509);
    int _1974 = _1934 * _1954;
    int _1976 = _1974 + _1637;
    float _1978 = trunc(_1964);
    float _1980 = precise::max(_1978, 0.0);
    uint _1982 = uint(_1980);
    float _1984 = as_type<float>(_1667) * _1966;
    float _1986 = float(uint(_1976));
    int _1988 = _1976 * _1619;
    int _1990 = _1988 + _1970;
    float _1992 = trunc(_1984);
    float _1994 = precise::max(_1992, 0.0);
    uint _1996 = uint(_1994);
    int _1998 = _1934 * _1972;
    int _2000 = _1998 + _1990;
    float _2002 = as_type<float>(_1671) * _1986;
    int _2004 = ~_1623;
    int _2006 = _2004 + 1;
    float _2008 = float(uint(_2000));
    int _2010 = _1962 * int(_1982);
    int _2012 = _2010 + _1946;
    float _2014 = trunc(_2002);
    float _2016 = precise::max(_2014, 0.0);
    uint _2018 = uint(_2016);
    float _2020 = as_type<float>(_1671) * _2008;
    float _2022 = float(uint(_2012));
    int _2024 = ~_1595;
    int _2026 = _2024 + 1;
    float _2028 = as_type<float>(_1667) * _2022;
    float _2030 = trunc(_2020);
    float _2032 = precise::max(_2030, 0.0);
    uint _2034 = uint(_2032);
    int _2036 = _2026 * int(_1996);
    int _2038 = _2036 + _1888;
    float _2040 = float(uint(_2038));
    float _2042 = trunc(_2028);
    float _2044 = precise::max(_2042, 0.0);
    uint _2046 = uint(_2044);
    float _2048 = as_type<float>(_1667) * _2040;
    int _2050 = _2006 * int(_2034);
    int _2052 = _2050 + _2000;
    int _2054 = ~_1595;
    int _2056 = _2054 + 1;
    float _2058 = trunc(_2048);
    float _2060 = precise::max(_2058, 0.0);
    uint _2062 = uint(_2060);
    float _2064 = float(uint(_2052));
    int _2066 = int(_1982) + int(_2046);
    float _2068 = as_type<float>(_1671) * _2064;
    int _2070 = _2056 * _2066;
    int _2072 = _2070 + _1946;
    float _2074 = trunc(_2068);
    float _2076 = precise::max(_2074, 0.0);
    uint _2078 = uint(_2076);
    bool _2080 = uint(_2072) >= uint(_1595);
    int _2082 = int(_1996) + int(_2062);
    bool _2084 = !_2080;
    int _2086 = _2084 ? 0 : (-1);
    int _2088 = _1661 * _2082;
    int _2090 = _2088 + _1888;
    int _2092 = ~_2066;
    int _2094 = _2092 + _2086;
    int _2096 = _2094 + 1;
    float _2098 = -_1229;
    float _2100 = fma(_2098, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1575);
    int _2102 = _1595 * _2096;
    int _2104 = _2102 + _1946;
    float _2106 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2108 = _2100 + _2106;
    int _2110 = int(_2034) + int(_2078);
    float _2112 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2114 = _1603 + _2112;
    float _2116 = fma(_1591, 100.0, _1577);
    float _2118 = -_1209;
    float _2120 = fma(_2118, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2116);
    float _2122 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2124 = _2120 + _2122;
    float _2126 = _2124 * _2124;
    float _2128 = fma(_2108, _2108, _2126);
    float _2130 = fma(_2114, _2114, _2128);
    float _2132 = rsqrt(_2130);
    float _2134 = sqrt(_2130);
    float _2136 = _2132 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _2138 = _2108 * _2136;
    float _2140 = _2114 * _2136;
    float _2142 = _2138 * _2138;
    float _2144 = _2140 * _2140;
    float _2146 = _2142 + _2144;
    float _2148 = sqrt(_2146);
    bool _2150 = _2148 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2152 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2154 = _2148 + _2152;
    float _2156 = _2114;
    float _2158 = _2146;
    float _2160 = _2154;
    float _2162 = _2124;
    float _2164 = as_type<float>(_1916);
    if (_2150)
    {
        float _2166 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2156 = _2166;
    }
    float _2168 = _2156;
    if (_2150)
    {
        float _2170 = rsqrt(_2146);
        _2158 = _2170;
    }
    float _2172 = _2158;
    if (_2150)
    {
        float _2174 = _2154 * _2168;
        _2160 = _2174;
    }
    float _2176 = _2160;
    if (_2150)
    {
        float _2178 = _2176 * 0.15915493667125701904296875;
        _1253 = _2178;
    }
    float _2180 = _1253;
    float _2182 = _2126;
    float _2184 = _2180;
    if (_2150)
    {
        float _2186 = _2180 * 6.283185482025146484375;
        float _2188 = sin(_2186);
        _2182 = _2188;
    }
    float _2190 = _2182;
    float _2192 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _2194 = precise::max(0.0, _2192);
    float _2196 = _2132;
    float _2198 = _2194;
    float _2200 = _2192;
    if (_2150)
    {
        float _2202 = _2180 * 6.283185482025146484375;
        float _2204 = cos(_2202);
        _2196 = _2204;
    }
    float _2206 = _2196;
    float _2208 = -_2136;
    float _2210 = -_2194;
    float _2212 = fma(_2124, _2208, _2210);
    if (!_2150)
    {
        _2198 = _2138;
    }
    float _2214 = _2198;
    float _2216 = _2214;
    if (_2150)
    {
        float _2218 = _2212 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2200 = _2218;
    }
    float _2220 = _2200;
    float _2222 = _2190;
    float _2224 = _2220;
    if (_2150)
    {
        float _2226 = fma(_2190, _2220, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _2222 = _2226;
    }
    float _2228 = _2222;
    float _2230 = _2228;
    if (!_2150)
    {
        _2224 = _2212;
    }
    float _2232 = _2224;
    float _2234 = _2232;
    float _2236 = _2206;
    if (_2150)
    {
        float _2238 = _2206 + (-1.0);
        _2162 = _2238;
    }
    float _2240 = _2162;
    float _2242 = _2240;
    if (_2150)
    {
        float _2244 = _2172 * _2228;
        _2164 = _2244;
    }
    float _2246 = _2164;
    if (!_2150)
    {
        _2230 = _2142;
    }
    float _2248 = _2230;
    float _2250 = _2248;
    if (_2150)
    {
        float _2252 = _2240 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2184 = _2252;
    }
    float _2254 = _2184;
    if (_2150)
    {
        float _2256 = _2138 * _2246;
        _2216 = _2256;
    }
    float _2258 = _2216;
    if (!_2150)
    {
        _2242 = _2140;
    }
    float _2260 = _2242;
    float _2262 = _2260;
    if (_2150)
    {
        float _2264 = _2140 * _2246;
        _2262 = _2264;
    }
    float _2266 = _2262;
    if (_2150)
    {
        float _2268 = fma(_2212, _2206, _2254);
        _2234 = _2268;
    }
    float _2270 = _2234;
    if (_2150)
    {
        float _2272 = _2258 * _2258;
        _2250 = _2272;
    }
    float _2274 = _2250;
    if (!_2150)
    {
        _2236 = _2144;
    }
    float _2276 = _2236;
    float _2278 = _2276;
    if (_2150)
    {
        float _2280 = _2266 * _2266;
        _2278 = _2280;
    }
    float _2282 = _2278;
    float _2284 = fma(_2270, _2270, _2274);
    float _2286 = _2120 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _2288 = _2120 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _2290 = _2284 + _2282;
    float _2292 = fma(_1617, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _2294 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _2296 = fma(_2134, (*spvDescriptorSet0.vp_c15)._m0[23].w, _2294);
    float _2298 = precise::clamp(_2296, 0.0, 1.0);
    float _2300 = fma(_2100, (*spvDescriptorSet0.vp_c8)._m0[2].x, _2286);
    float _2302 = fma(_2100, (*spvDescriptorSet0.vp_c8)._m0[3].x, _2288);
    float _2304 = floor(_2292);
    float _2306 = -_2298;
    float _2308 = _2306 + 1.0;
    float _2310 = fma(_1603, (*spvDescriptorSet0.vp_c8)._m0[2].z, _2300);
    float _2312 = fma(_1603, (*spvDescriptorSet0.vp_c8)._m0[3].z, _2302);
    float _2314 = _2310 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _2316 = rsqrt(_2290);
    float _2318 = abs(_2308);
    float _2320 = log2(_2318);
    float _2322 = -_2304;
    float _2324 = _2292 + _2322;
    float _2326 = _2120 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2328 = fma(_2100, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2326);
    float _2330 = _2316 * _2258;
    float _2332 = _2316 * _2270;
    float _2334 = fma(_1603, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2328);
    float _2336 = _2330 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _2338 = _2316 * _2266;
    float _2340 = _2334 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2342 = -_2336;
    float _2344 = fma(_2332, (*spvDescriptorSet0.vp_c15)._m0[21].y, _2342);
    float _2346 = _2320 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _2348 = fma(_1611, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _2350 = -_2338;
    float _2352 = fma(_2350, (*spvDescriptorSet0.vp_c15)._m0[21].z, _2344);
    float _2354 = _2120 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2356 = _2314 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _2358 = floor(_2348);
    float _2360 = fma(_2352, -0.5, 0.5);
    float _2362 = fma(_2100, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2354);
    float _2364 = fma(_2352, 0.5, 0.5);
    float _2366 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _2368 = fma(_1603, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2362);
    float _2370 = fma(_2364, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _2372 = sqrt(_2360);
    float _2374 = -_2356;
    float _2376 = fma(_2374, _2366, 1.0);
    float _2378 = _2368 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _2380 = fma(_2364, _2370, -0.212114393711090087890625);
    float _2382 = fma(_2364, _2380, 1.570728778839111328125);
    float _2384 = exp2(_2346);
    float _2386 = _2378 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _2388 = _2312 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _2390 = -_2358;
    float _2392 = _2348 + _2390;
    float _2394 = _2378 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2396 = fma(_2340, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2386);
    float _2398 = log2(_2376);
    float _2400 = fma(_2314, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2396);
    float _2402 = _2332 + 1.0;
    float _2404 = fma(_2340, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2394);
    float _2406 = _2372 * 0.636619746685028076171875;
    float _2408 = fma(_2388, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2400);
    int _2410 = ~_1623;
    int _2412 = _2410 + 1;
    float _2414 = -_2332;
    float _2416 = fma(_2384, _2402, _2414);
    float _2418 = _2378 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2420 = 1.0 / _2408;
    float _2422 = fma(_2314, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2404);
    float _2424 = fma(_2340, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2418);
    float _2426 = -_2382;
    float _2428 = fma(_2406, _2426, 1.0);
    float _2430 = fma(_2388, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2422);
    float _2432 = _2398 * 0.693147182464599609375;
    float _2434 = fma(_2314, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2424);
    float _2436 = fma(_2416, 0.5, 0.5);
    float2 _7492 = float2(_2324, _2392);
    float _2438 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_7492, float2(0.0), isnan(_7492)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_7492, float2(0.0), isnan(_7492)), level(0.0)).x;
    float _2440 = _2432 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _2442 = fma(_2388, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2434);
    int _2444 = ~_1623;
    int _2446 = _2444 + 1;
    float _2448 = _2442 * _2420;
    float _2450 = _2430 * _2420;
    int _2452 = _2412 * _2110;
    int _2454 = _2452 + _2000;
    float _2456 = fma(_2448, 0.5, 0.5);
    float _2458 = fma(_2450, -0.5, 0.5);
    float3 _7530 = float3(_2456, _2458, _2440);
    float _2460 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_7530, float3(0.0), isnan(_7530)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_7530, float3(0.0), isnan(_7530)), level(0.0)).x;
    float3 _7541 = float3(_2456, _2458, _2440);
    float4 _2463 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_7541, float3(0.0), isnan(_7541)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_7541, float3(0.0), isnan(_7541)), level(0.0)).xyzw;
    float _2465 = _2463.x;
    float _2467 = _2463.y;
    float _2469 = _2463.z;
    float _2471 = _2463.w;
    float2 _7557 = float2(_2428, _2436);
    float3 _2475 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_7557, float2(0.0), isnan(_7557)), level(0.0)), spvDescriptorSet0.dm_border, 4u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_7557, float2(0.0), isnan(_7557)), level(0.0)).xyz;
    float _2477 = _2475.x;
    float _2479 = _2475.y;
    float _2481 = _2475.z;
    bool _2483 = !_1651;
    int _2485 = _2483 ? _2104 : (-1);
    float _2487 = fma(_1591, 100.0, _463);
    float _2489 = -_747;
    float _2491 = _2489 + 1.0;
    int _2493 = _2485 & 3;
    bool _2495 = _2493 != 0;
    float _2497 = -_1209;
    float _2499 = fma(_2497, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2487);
    int _2501 = _2485 & 3;
    bool _2503 = _2501 != 0;
    float _2505 = -_677;
    float _2507 = _2505 + 1.0;
    bool _2509 = uint(_2454) >= uint(_1623);
    float _2511 = _2499 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    bool _2513 = uint(_2090) >= uint(_1595);
    int _2515 = _2446 * int(_2018);
    int _2517 = _2515 + _1976;
    int _2519 = _2495 ? 0 : 1;
    float _2521 = _2320 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    bool _2523 = _2501 != 3;
    float _2525 = _2378 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    bool _2527 = !_2509;
    int _2529 = _2527 ? 0 : (-1);
    out.m_72.x = _2100;
    out.m_72.y = _2120;
    out.m_72.z = _1603;
    bool _2531 = !_2513;
    int _2533 = _2531 ? 0 : (-1);
    float _2535 = fma(_2340, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2525);
    bool _2537 = uint(_2501) >= 2u;
    float _2539 = exp2(_2521);
    bool _2541 = uint(_2501) > 1u;
    float _2543 = fma(_2314, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2535);
    int _2545 = ~_2110;
    int _2547 = _2545 + _2529;
    int _2549 = _2547 + 1;
    float _2551 = float(uint(_2517));
    int _2553 = _2537 ? 0 : 1;
    int _2555 = _1623 * _2549;
    int _2557 = _2555 + _2000;
    bool _2559 = _403 > 0.5;
    float _2561 = as_type<float>(_1671) * _2551;
    int _2563 = ~_2553;
    int _2565 = _2563 + 1;
    int _2567 = _2565 + 1;
    bool _2569 = !_2503;
    int _2571 = _2569 ? 0 : 1;
    float _2573 = trunc(_2561);
    float _2575 = precise::max(_2573, 0.0);
    uint _2577 = uint(_2575);
    int _2579 = _2567;
    float _2581 = _2408;
    float _2583 = _2430;
    if (_2523)
    {
        int _2585 = ~_2553;
        int _2587 = _2585 + 1;
        _2579 = _2587;
    }
    int _2589 = _2579;
    float _2591 = -_2539;
    float _2593 = _2591 + 1.0;
    bool _2595 = _397 > 0.5;
    int _2597 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _2599 = _2597 != 0;
    float _2601 = _2593 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _2603 = -_333;
    int _2605 = _2559 ? as_type<int>(_2603) : as_type<int>(_333);
    int _2607 = _2485 >> 31;
    bool _2609 = !_1884;
    int _2611 = _2609 ? _2557 : (-1);
    int _2613 = ~_2519;
    int _2615 = _2613 + 1;
    int _2617 = _2615 + 1;
    int _2619 = _2617;
    if (!_2541)
    {
        int _2621 = ~_2519;
        int _2623 = _2621 + 1;
        _2619 = _2623;
    }
    int _2625 = _2619;
    bool _2627 = !_2599;
    float _2629 = _2627 ? _333 : as_type<float>(_2605);
    int _2631 = _2607 & 3;
    int _2633 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _2635 = _2633 != 0;
    int _2637 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4194304;
    bool _2639 = _2637 != 0;
    int _2641 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _2643 = _2641 != 0;
    int _2645 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _2647 = _2645 != 0;
    int _2649 = _2611 >> 31;
    int _2651 = _2485 + _2631;
    int _2653 = ~_2082;
    int _2655 = _2653 + _2533;
    int _2657 = _2655 + 1;
    int _2659 = _2649 & 3;
    bool _2661 = !_2639;
    int _2663 = _2661 ? 0 : 1;
    int _2665 = _1595 * _2657;
    int _2667 = _2665 + _1888;
    int _2669 = _2611 & 3;
    bool _2671 = _2669 != 0;
    int _2673 = _2651 >> 2;
    int _2675 = _2611 + _2659;
    bool _2677 = !_2635;
    int _2679 = _2677 ? 0 : 1;
    int _2681 = _2671 ? 0 : 1;
    int _2683 = _2673 << 4;
    int _2685 = _2683 + 368;
    int _2687 = _2611 & 3;
    bool _2689 = _2687 != 0;
    bool _2691 = _2501 != 3;
    int _2693 = _2685 + 8;
    uint _2695 = uint(int(uint(_2693) >> uint(2)));
    uint _2697 = uint(int(uint(int(_2695)) >> uint(2)));
    int _2699 = int(_2695) & 3;
    float _2701 = (*spvDescriptorSet0.vp_c9)._m0[int(_2697)][_2699];
    int _2703 = int(_2695) + 1;
    uint _2705 = uint(int(uint(_2703) >> uint(2)));
    int _2707 = _2703 & 3;
    float _2709 = (*spvDescriptorSet0.vp_c9)._m0[int(_2705)][_2707];
    int _2711 = _2675 >> 2;
    int _2713 = int(_2018) + int(_2577);
    bool _2715 = !_1651;
    int _2717 = _2715 ? _2667 : (-1);
    bool _2719 = uint(_2687) > 1u;
    uint _2721 = uint(int(uint(_2685) >> uint(2)));
    uint _2723 = uint(int(uint(int(_2721)) >> uint(2)));
    int _2725 = int(_2721) & 3;
    float _2727 = (*spvDescriptorSet0.vp_c9)._m0[int(_2723)][_2725];
    int _2729 = int(_2721) + 1;
    uint _2731 = uint(int(uint(_2729) >> uint(2)));
    int _2733 = _2729 & 3;
    float _2735 = (*spvDescriptorSet0.vp_c9)._m0[int(_2731)][_2733];
    int _2737 = _2711 << 4;
    int _2739 = _2737 + 512;
    bool _2741 = !_2689;
    int _2743 = _2741 ? 0 : 1;
    bool _2745 = _2687 != 3;
    int _2747 = ~_2681;
    int _2749 = _2747 + 1;
    int _2751 = _2749 + 1;
    uint _2753 = uint(int(uint(_2739) >> uint(2)));
    uint _2755 = uint(int(uint(int(_2753)) >> uint(2)));
    int _2757 = int(_2753) & 3;
    float _2759 = (*spvDescriptorSet0.vp_c9)._m0[int(_2755)][_2757];
    int _2761 = int(_2753) + 1;
    uint _2763 = uint(int(uint(_2761) >> uint(2)));
    int _2765 = _2761 & 3;
    float _2767 = (*spvDescriptorSet0.vp_c9)._m0[int(_2763)][_2765];
    int _2769 = ~_1623;
    int _2771 = _2769 + 1;
    bool _2773 = !_2691;
    int _2775 = _2773 ? 0 : (-1);
    int _2777 = _2751;
    if (!_2719)
    {
        int _2779 = ~_2681;
        int _2781 = _2779 + 1;
        _2777 = _2781;
    }
    int _2783 = _2777;
    bool _2785 = uint(_2687) >= 2u;
    int _2787 = _2739 + 8;
    uint _2789 = uint(int(uint(_2787) >> uint(2)));
    uint _2791 = uint(int(uint(int(_2789)) >> uint(2)));
    int _2793 = int(_2789) & 3;
    float _2795 = (*spvDescriptorSet0.vp_c9)._m0[int(_2791)][_2793];
    int _2797 = int(_2789) + 1;
    uint _2799 = uint(int(uint(_2797) >> uint(2)));
    int _2801 = _2797 & 3;
    float _2803 = (*spvDescriptorSet0.vp_c9)._m0[int(_2799)][_2801];
    bool _2805 = _2687 != 3;
    int _2807 = _2771 * _2713;
    int _2809 = _2807 + _1976;
    int _2811 = _2785 ? 0 : 1;
    int _2813 = ~_2811;
    int _2815 = _2813 + 1;
    int _2817 = _2815 + 1;
    int _2819 = _2817;
    if (_2745)
    {
        int _2821 = ~_2811;
        int _2823 = _2821 + 1;
        _2819 = _2823;
    }
    int _2825 = _2819;
    bool _2827 = uint(_2809) >= uint(_1623);
    float _2829 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    int _2831 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y);
    bool _2833 = _2831 != 0;
    float _2835 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _2837 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    bool _2839 = !_2805;
    int _2841 = _2839 ? 0 : (-1);
    float _2843 = _2829 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    bool _2845 = _399 > 0.5;
    float _2847 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _2849 = _2835 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2851 = _2837 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2853 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    bool _2855 = !_2827;
    int _2857 = _2855 ? 0 : (-1);
    bool _2859 = _401 > 0.5;
    float _2861 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    int _2863 = abs(_2625);
    out.m_74.x = _2843;
    out.m_74.y = _2849;
    out.m_74.z = _2851;
    out.m_74.w = _2847;
    float _2865 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _2867 = _2853 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2869 = _2861 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    int _2871 = abs(_2783);
    float _2873 = _2865 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    int _2875 = abs(_2589);
    int _2877 = ~_2871;
    int _2879 = _2877 + 1;
    int _2881 = _2879 + 1;
    out.m_76.x = _2867;
    out.m_76.y = _2869;
    out.m_76.z = _2873;
    int _2883 = ~_2713;
    int _2885 = _2883 + _2857;
    int _2887 = _2885 + 1;
    int _2889 = _2881 * as_type<int>(_2767);
    float _2891 = trunc((*spvDescriptorSet0.vp_c9)._m0[80].z);
    int _2893 = int(_2891);
    int _2895 = ~_2863;
    int _2897 = _2895 + 1;
    int _2899 = _2897 + 1;
    int _2901 = _1623 * _2887;
    int _2903 = _2901 + _1976;
    int _2905 = abs(_2571);
    int _2907 = abs(_2679);
    int _2909 = _2899 * as_type<int>(_2735);
    int _2911 = abs(_2743);
    float _2913 = trunc((*spvDescriptorSet0.vp_c9)._m0[85].z);
    int _2915 = int(_2913);
    int _2917 = ~_2905;
    int _2919 = _2917 + 1;
    int _2921 = _2919 + 1;
    int _2923 = ~_2911;
    int _2925 = _2923 + 1;
    int _2927 = _2925 + 1;
    int _2929 = _2921 * as_type<int>(_2727);
    int _2931 = _2929 + _2909;
    int _2933 = ~_2875;
    int _2935 = _2933 + 1;
    int _2937 = _2935 + 1;
    int _2939 = abs(_2825);
    int _2941 = _2927 * as_type<int>(_2759);
    int _2943 = _2941 + _2889;
    float _2945 = float(uint(_2893));
    int _2947 = _2937 * as_type<int>(_2701);
    int _2949 = _2947 + _2931;
    int _2951 = abs(_2775);
    int _2953 = ~_2939;
    int _2955 = _2953 + 1;
    int _2957 = _2955 + 1;
    int _2959 = abs(_2841);
    float _2961 = 1.0 / _2945;
    float _2963 = float(uint(_2915));
    int _2965 = _2957 * as_type<int>(_2795);
    int _2967 = _2965 + _2943;
    int _2969 = ~_2951;
    int _2971 = _2969 + 1;
    int _2973 = _2971 + 1;
    int _2975 = abs(_2663);
    int _2977 = ~_2959;
    int _2979 = _2977 + 1;
    int _2981 = _2979 + 1;
    float _2983 = 1.0 / _2963;
    int _2985 = abs(_2893);
    int _2987 = _2973 * as_type<int>(_2709);
    int _2989 = _2987 + _2949;
    int _2991 = ~_2907;
    int _2993 = _2991 + 1;
    int _2995 = _2993 + 1;
    int _2997 = _2981 * as_type<int>(_2803);
    int _2999 = _2997 + _2967;
    int _3001 = ~_2975;
    int _3003 = _3001 + 1;
    int _3005 = _3003 + 1;
    float _3007 = _1375 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    int _3009 = _2989 * _2995;
    int _3011 = abs(_2915);
    int _3013 = _2999 * _3005;
    float _3015 = float(uint(_2985));
    int _3017 = _2717 * _2907;
    int _3019 = _3017 + _3009;
    bool _3021 = !_1884;
    int _3023 = _3021 ? _2903 : (-1);
    float _3025 = fma(_3007, _3007, 1.0);
    int _3027 = as_type<int>(_2961) + (-2);
    float _3029 = _1363 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _3031 = 1.0 / _3015;
    int _3033 = _3023 * _2975;
    int _3035 = _3033 + _3013;
    float _3037 = float(uint(_3019));
    float _3039 = fma(_1441, _3029, _1411);
    float _3041 = float(uint(_3011));
    int _3043 = as_type<int>(_2983) + (-2);
    float _3045 = as_type<float>(_3027) * _3037;
    float _3047 = float(uint(_3035));
    float _3049 = rsqrt(_3025);
    float _3051 = -_333;
    int _3053 = _2845 ? as_type<int>(_3051) : as_type<int>(_333);
    float _3055 = -_279;
    int _3057 = _2595 ? as_type<int>(_3055) : as_type<int>(_279);
    float _3059 = as_type<float>(_3043) * _3047;
    bool _3061 = !_2643;
    float _3063 = _3061 ? _333 : as_type<float>(_3053);
    int _3065 = abs(_3019);
    float _3067 = 1.0 / _3041;
    int _3069 = as_type<int>(_3031) + (-2);
    float _3071 = float(uint(_3065));
    float _3073 = -_279;
    int _3075 = _2859 ? as_type<int>(_3073) : as_type<int>(_279);
    bool _3077 = !_2833;
    float _3079 = _3077 ? _279 : as_type<float>(_3057);
    float _3081 = trunc(_3045);
    float _3083 = precise::max(_3081, 0.0);
    uint _3085 = uint(_3083);
    bool _3087 = !_2647;
    float _3089 = _3087 ? _279 : as_type<float>(_3075);
    float _3091 = as_type<float>(_3069) * _3071;
    int _3093 = ~_2893;
    int _3095 = _3093 + 1;
    float _3097 = _3007 * _3049;
    int _3099 = abs(_3035);
    float _3101 = -_3049;
    float _3103 = _1429 * _3101;
    int _3105 = ~_2915;
    int _3107 = _3105 + 1;
    float _3109 = trunc(_3059);
    float _3111 = precise::max(_3109, 0.0);
    uint _3113 = uint(_3111);
    int _3115 = as_type<int>(_3067) + (-2);
    float _3117 = -_1417;
    float _3119 = fma(_1427, _3029, _3117);
    float _3121 = float(uint(_3099));
    float _3123 = fma(_1417, _3097, _3103);
    int _3125 = ~_2985;
    int _3127 = _3125 + 1;
    float _3129 = -_3007;
    float _3131 = fma(_1429, _3129, _3119);
    float _3133 = trunc(_3091);
    float _3135 = precise::max(_3133, 0.0);
    uint _3137 = uint(_3135);
    int _3139 = _3095 * int(_3085);
    int _3141 = _3139 + _3019;
    float _3143 = as_type<float>(_3115) * _3121;
    float _3145 = float(uint(_3141));
    int _3147 = _3107 * int(_3113);
    int _3149 = _3147 + _3035;
    float _3151 = trunc(_3143);
    float _3153 = precise::max(_3151, 0.0);
    uint _3155 = uint(_3153);
    float _3157 = as_type<float>(_3027) * _3145;
    float _3159 = float(uint(_3149));
    int _3161 = ~_3011;
    int _3163 = _3161 + 1;
    int _3165 = _3127 * int(_3137);
    int _3167 = _3165 + _3065;
    float _3169 = trunc(_3157);
    float _3171 = precise::max(_3169, 0.0);
    uint _3173 = uint(_3171);
    float _3175 = as_type<float>(_3043) * _3159;
    float _3177 = fma(_1431, _3029, _1409);
    float _3179 = float(uint(_3167));
    float _3181 = -_3007;
    float _3183 = fma(_1437, _3181, _3177);
    float _3185 = -_3049;
    float _3187 = _1437 * _3185;
    float _3189 = -_3049;
    float _3191 = _1451 * _3189;
    int _3193 = _3163 * int(_3155);
    int _3195 = _3193 + _3099;
    float _3197 = -_3007;
    float _3199 = fma(_1451, _3197, _3039);
    float _3201 = -_3097;
    float _3203 = fma(_1409, _3201, _3187);
    float _3205 = -_3097;
    float _3207 = fma(_1411, _3205, _3191);
    float _3209 = as_type<float>(_3069) * _3179;
    float _3211 = float(uint(_3195));
    float _3213 = _1431 * _325;
    float _3215 = _1431 * _317;
    float _3217 = trunc(_3209);
    float _3219 = precise::max(_3217, 0.0);
    uint _3221 = uint(_3219);
    float _3223 = _1431 * _329;
    float _3225 = as_type<float>(_3115) * _3211;
    float _3227 = fma(_1427, _289, _3213);
    float _3229 = fma(_1427, _285, _3215);
    float _3231 = fma(_1427, _299, _3223);
    float _3233 = _3183 * _325;
    float _3235 = fma(_1441, _341, _3227);
    float _3237 = trunc(_3175);
    float _3239 = precise::max(_3237, 0.0);
    uint _3241 = uint(_3239);
    float _3243 = fma(_1441, _337, _3229);
    float _3245 = fma(_1441, _345, _3231);
    float _3247 = _3183 * _317;
    float _3249 = _3183 * _329;
    float _3251 = _3203 * _325;
    float _3253 = _3203 * _317;
    float _3255 = _3203 * _329;
    float _3257 = trunc(_3225);
    float _3259 = precise::max(_3257, 0.0);
    uint _3261 = uint(_3259);
    int _3263 = ~_2985;
    int _3265 = _3263 + 1;
    out.m_78.x = _3235;
    out.m_78.y = _3243;
    out.m_78.z = _3245;
    int _3267 = int(_3137) + int(_3221);
    float _3269 = fma(_3131, _299, _3249);
    int _3271 = int(_3085) + int(_3173);
    float _3273 = -_2438;
    float _3275 = _3273 + 1.0;
    int _3277 = ~_2893;
    int _3279 = _3277 + 1;
    int _3281 = _3265 * _3267;
    int _3283 = _3281 + _3065;
    int _3285 = ~_2915;
    int _3287 = _3285 + 1;
    int _3289 = ~_3011;
    int _3291 = _3289 + 1;
    int _3293 = _3279 * _3271;
    int _3295 = _3293 + _3019;
    int _3297 = int(_3113) + int(_3241);
    float _3299 = fma(_3123, _285, _3253);
    float _3301 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    int _3303 = int(_3155) + int(_3261);
    float _3305 = fma(_3207, _337, _3299);
    int _3307 = _3287 * _3297;
    int _3309 = _3307 + _3035;
    bool _3311 = uint(_3295) >= uint(_2893);
    float _3313 = fma(_3123, _289, _3251);
    float _3315 = fma(_3123, _299, _3255);
    int _3317 = _3291 * _3303;
    int _3319 = _3317 + _3099;
    bool _3321 = !_3311;
    int _3323 = _3321 ? 0 : (-1);
    float _3325 = fma(_3207, _341, _3313);
    bool _3327 = uint(_3309) >= uint(_2915);
    int _3329 = ~_3271;
    int _3331 = _3329 + _3323;
    int _3333 = _3331 + 1;
    bool _3335 = uint(_3319) >= uint(_3011);
    bool _3337 = uint(_3283) >= uint(_2985);
    int _3339 = _3019 ^ _2893;
    float _3341 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    bool _3343 = !_3327;
    int _3345 = _3343 ? 0 : (-1);
    bool _3347 = _2893 == 0;
    bool _3349 = _2893 == 0;
    int _3351 = _2893 * _3333;
    int _3353 = _3351 + _3019;
    int _3355 = _3035 ^ _2915;
    float _3357 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    bool _3359 = !_3337;
    int _3361 = _3359 ? 0 : (-1);
    uint _3363 = uint(int(uint(_3339) >> uint(31)));
    uint _3365 = uint(int(uint(_3355) >> uint(31)));
    bool _3367 = !_3335;
    int _3369 = _3367 ? 0 : (-1);
    int _3371 = ~_3361;
    int _3373 = _3267 + _3371;
    int _3375 = _3373 + 1;
    int _3377 = ~int(_3363);
    int _3379 = _3377 + 1;
    int _3381 = ~_3369;
    int _3383 = _3303 + _3381;
    int _3385 = _3383 + 1;
    int _3387 = ~int(_3365);
    int _3389 = _3387 + 1;
    float _3391 = _3357 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    int _3393 = ~_3297;
    int _3395 = _3393 + _3345;
    int _3397 = _3395 + 1;
    float _3399 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    int _3401 = _3375 ^ _3379;
    int _3403 = _3385 ^ _3389;
    int _3405 = _2915 * _3397;
    int _3407 = _3405 + _3035;
    int _3409 = ~_3379;
    int _3411 = _3409 + _3401;
    int _3413 = _3411 + 1;
    float _3415 = _3341 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    bool _3417 = _2915 == 0;
    bool _3419 = _2915 == 0;
    float _3421 = _3301 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    int _3423 = ~_3389;
    int _3425 = _3423 + _3403;
    int _3427 = _3425 + 1;
    bool _3429 = !_3347;
    int _3431 = _3429 ? _3353 : (-1);
    bool _3433 = !_3349;
    int _3435 = _3433 ? _3413 : (-1);
    float _3437 = _3399 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    bool _3439 = !_3417;
    int _3441 = _3439 ? _3407 : (-1);
    bool _3443 = !_3419;
    int _3445 = _3443 ? _3427 : (-1);
    float _3447 = float(_3435);
    float _3449 = float(_3431);
    float _3451 = float(_3441);
    float _3453 = -_575;
    float _3455 = fma(_3415, _3447, _3453);
    float _3457 = float(_3445);
    float _3459 = fma(_3421, _3449, _569);
    float _3461 = _3079 + 0.5;
    float _3463 = fma(_3391, _3451, _751);
    float _3465 = _3063 + (-0.5);
    float _3467 = -_761;
    float _3469 = fma(_3437, _3457, _3467);
    float _3471 = _2629 + (-0.5);
    float _3473 = fma(_3421, _3461, _3459);
    float _3475 = -_755;
    float _3477 = _3475 + 1.0;
    float _3479 = -_3415;
    float _3481 = fma(_3479, _3465, _3455);
    float _3483 = -_3437;
    float _3485 = fma(_3483, _3471, _3469);
    float _3487 = fma(_3207, _345, _3315);
    float _3489 = -_3477;
    float _3491 = fma(_3079, _3489, _3473);
    float _3493 = fma(_3063, _2491, _3481);
    float _3495 = fma(_2629, _2507, _3485);
    float _3497 = fma(_1617, (*spvDescriptorSet0.vp_c8)._m0[11].x, _2511);
    float _3499 = _2499 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _3501 = fma(_3199, _345, _3269);
    out.m_80.x = _3325;
    out.m_80.y = _3305;
    out.m_80.z = _3487;
    float _3503 = fma(_1611, (*spvDescriptorSet0.vp_c8)._m0[11].z, _3497);
    float _3505 = fma(_1617, (*spvDescriptorSet0.vp_c8)._m0[10].x, _3499);
    float _3507 = _3089 + 0.5;
    float _3509 = -_633;
    float _3511 = _3509 + 1.0;
    float _3513 = _3503 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _3515 = fma(_1611, (*spvDescriptorSet0.vp_c8)._m0[10].z, _3505);
    float _3517 = fma(_3391, _3507, _3463);
    float _3519 = fma(_3131, _289, _3233);
    float _3521 = 1.0 / _3513;
    float _3523 = _3515 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _3525 = -_3511;
    float _3527 = fma(_3089, _3525, _3517);
    float _3529 = fma(_3131, _285, _3247);
    float _3531 = _3523 + _3513;
    out.m_82.x = _3491;
    out.m_82.y = _3493;
    out.m_82.z = _3527;
    out.m_82.w = _3495;
    float _3533 = fma(_3199, _341, _3519);
    float _3535 = fma(_3199, _337, _3529);
    float _3537 = in.m_66.x;
    bool _3539 = _2134 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _3541 = isnan(_2134);
    bool _3543 = _3539 || _3541;
    bool _3545 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _3547 = _3543 || _3545;
    out.m_84.x = _3533;
    out.m_84.y = _3535;
    out.m_84.z = _3501;
    float _3549 = _3531 * _3521;
    float _3551 = _3549 * 0.5;
    float _3553 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _3555 = fma(_3551, (*spvDescriptorSet0.vp_c8)._m0[30].w, _3553);
    float _3557 = _2601 * _2460;
    float _3559 = -_2601;
    float _3561 = _3559 + 1.0;
    float _3563 = 1.0 / _3555;
    float _3565 = _2481 * _3557;
    float _3567 = _2471 * _3561;
    float _3569 = fma(_2471, _3565, _2469);
    float _3571 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _3573 = _3563 * _3571;
    float _3575 = abs(_3573);
    float _3577 = log2(_3575);
    bool _3579 = _3573 <= 8000.0;
    bool _3581 = isnan(_3573);
    bool _3583 = _3579 || _3581;
    bool _3585 = isnan(8000.0);
    bool _3587 = _3583 || _3585;
    float _3589 = float(_3587);
    float _3591 = _3577 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _3593 = exp2(_3591);
    float _3595 = fma(_3593, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _3597 = precise::clamp(_3595, 0.0, 1.0);
    float _3599 = fma(_3597, -2.0, 3.0);
    float _3601 = _3597 * _3597;
    float _3603 = _3601 * _3599;
    float _3605 = fma(_2388, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2543);
    float _3607 = -_3603;
    float _3609 = _3607 + 1.0;
    float _3611 = _3605 + _2408;
    out.gl_Position.x = _2442;
    out.gl_Position.y = _2430;
    out.gl_Position.z = _3605;
    out.gl_Position.w = _2408;
    float _3613 = fma(_3609, (*spvDescriptorSet0.vp_c15)._m0[654].w, _3603);
    float _3615 = _3611 * 0.5;
    float _3617 = _3589 * _3613;
    out.m_86.z = _3615;
    out.m_86.w = _2408;
    float _3619 = _3617 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _3621 = _3275 * _3619;
    float _3623 = precise::clamp(_3621, 0.0, 1.0);
    float _3625 = _3605;
    float _3627 = _3615;
    float _3629 = _2442;
    if (!_3547)
    {
        _2581 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _3631 = _2581;
    float _3633 = _3631;
    float _3635 = _3631;
    if (!_3547)
    {
        _3625 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _3637 = _3625;
    float _3639 = -_3623;
    float _3641 = fma(_3639, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _3643 = _2471 * _3557;
    float _3645 = _3637;
    float _3647 = _3637;
    if (!_3547)
    {
        _3627 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _3649 = _3627;
    float _3651 = _3641 * _3537;
    float _3653 = fma(_2477, _3643, _2465);
    float _3655 = fma(_2479, _3643, _2467);
    float _3657 = _3651;
    float _3659 = _3649;
    float _3661 = _3649;
    if (!_3547)
    {
        _2583 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _3663 = _2583;
    float _3665 = _3651 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _3667 = _3663;
    float _3669 = _3663;
    if (!_3547)
    {
        _3629 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _3671 = _3629;
    out.m_88.x = _3653;
    out.m_88.y = _3655;
    out.m_88.z = _3569;
    out.m_88.w = _3567;
    float _3673 = _3671;
    float _3675 = _3671;
    if (!_3547)
    {
        _3657 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _3677 = _3657;
    out.m_90.x = _3665;
    bool _3679 = !_3547;
    float _3681 = _3677;
    float _3683 = _3677;
    if (!_3679)
    {
        bool _3685 = _2134 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _3687 = isnan(_2134);
        bool _3689 = _3685 || _3687;
        bool _3691 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _3693 = _3689 || _3691;
        if (!_3693)
        {
            float _3695 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _3697 = _2134 + _3695;
            float _3699 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _3701 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _3699;
            float _3703 = 1.0 / _3701;
            float _3705 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _3707 = _3705 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _3709 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _3711 = _3709 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _3713 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _3715 = _3713 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _3717 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _3719 = _3717 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _3721 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _3723 = _3721 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _3725 = _3697 * _3703;
            float _3727 = precise::clamp(_3725, 0.0, 1.0);
            float _3729 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _3731 = _3729 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _3733 = fma(_3727, _3707, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _3735 = fma(_3727, _3731, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _3737 = fma(_3727, _3711, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _3739 = fma(_3727, _3715, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _3741 = fma(_3727, _3719, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _3743 = fma(_3727, _3723, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _3635 = _3735;
            _3675 = _3741;
            _3661 = _3733;
            _3669 = _3739;
            _3647 = _3737;
            _3683 = _3743;
            _3745 = true;
        }
        else
        {
            bool _3747 = _2134 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _3749 = isnan(_2134);
            bool _3751 = _3747 || _3749;
            bool _3753 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _3755 = _3751 || _3753;
            if (!_3755)
            {
                _3659 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _3757 = _3659;
            _3661 = _3757;
            if (!_3755)
            {
                _3633 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _3759 = _3633;
            _3635 = _3759;
            if (!_3755)
            {
                _3645 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _3761 = _3645;
            _3647 = _3761;
            if (!_3755)
            {
                _3667 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _3763 = _3667;
            _3669 = _3763;
            if (!_3755)
            {
                _3673 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _3765 = _3673;
            _3675 = _3765;
            if (!_3755)
            {
                _3681 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _3767 = _3681;
            bool _3769 = !_3755;
            _3683 = _3767;
            if (!_3769)
            {
                bool _3771 = _2134 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _3773 = isnan(_2134);
                bool _3775 = _3771 || _3773;
                bool _3777 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _3779 = _3775 || _3777;
                if (!_3779)
                {
                    float _3781 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _3783 = _2134 + _3781;
                    float _3785 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _3787 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _3785;
                    float _3789 = 1.0 / _3787;
                    float _3791 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _3793 = _3791 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _3795 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _3797 = _3795 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _3799 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _3801 = _3799 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _3803 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _3805 = _3803 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _3807 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _3809 = _3807 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _3811 = _3783 * _3789;
                    float _3813 = precise::clamp(_3811, 0.0, 1.0);
                    float _3815 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _3817 = _3815 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _3819 = fma(_3813, _3793, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _3821 = fma(_3813, _3817, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _3823 = fma(_3813, _3797, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _3825 = fma(_3813, _3801, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _3827 = fma(_3813, _3805, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _3829 = fma(_3813, _3809, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _3635 = _3821;
                    _3675 = _3827;
                    _3661 = _3819;
                    _3669 = _3825;
                    _3647 = _3823;
                    _3683 = _3829;
                    _3745 = true;
                }
                else
                {
                    _3635 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _3675 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _3661 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _3669 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _3647 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _3683 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _3745 = false;
    float _3831 = _3635;
    float _3833 = _3675;
    float _3835 = _3661;
    float _3837 = _3669;
    float _3839 = _3647;
    float _3841 = _3683;
    float _3843 = fma(_3535, -0.5, 0.5);
    float _3845 = precise::clamp(_3843, 0.0, 1.0);
    float _3847 = -_3831;
    float _3849 = _3847 + _3833;
    float _3851 = -_3835;
    float _3853 = _3851 + _3837;
    float _3855 = -_3839;
    float _3857 = _3855 + _3841;
    bool _3859 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _3861 = fma(_3845, _3849, _3831);
    float _3863 = fma(_3845, _3853, _3835);
    float _3865 = fma(_3845, _3857, _3839);
    float _3867 = _3861 * 0.586610972881317138671875;
    out.m_92.x = 0.0;
    float _3869 = fma(_3863, 0.298911988735198974609375, _3867);
    float _3871 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _3873 = fma(_3865, 0.114477999508380889892578125, _3869);
    out.m_51.x = _3871;
    float _3875 = -_3873;
    float _3877 = _3863 + _3875;
    float _3879 = -_3873;
    float _3881 = _3861 + _3879;
    float _3883 = -_3873;
    float _3885 = _3865 + _3883;
    float _3887 = fma(_3877, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3873);
    float _3889 = fma(_3881, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3873);
    float _3891 = fma(_3885, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3873);
    out.m_94.x = _3887;
    out.m_94.y = _3889;
    out.m_94.z = _3891;
    if (!_3859)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_94.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_94.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_94.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_94.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_92.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_92.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_92.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_92.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_90.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_90.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_90.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_90.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_88.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_88.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_88.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_88.w)); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _3893 = -_2120;
    float _3895 = _3893 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
    float _3897 = -_2100;
    float _3899 = _3897 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
    float _3901 = -_1603;
    float _3903 = _3901 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
    float _3905 = _3895 * _3895;
    float _3907 = fma(_3899, _3899, _3905);
    float _3909 = fma(_3903, _3903, _3907);
    float _3911 = sqrt(_3909);
    float _3913 = rsqrt(_3909);
    float _3915 = -_3911;
    float _3917 = _3915 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _3919 = _3917 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
    float _3921 = precise::clamp(_3919, 0.0, 1.0);
    float _3923 = _3899 * _3913;
    float _3925 = _3895 * _3913;
    float _3927 = abs(_3921);
    float _3929 = log2(_3927);
    float _3931 = _3903 * _3913;
    float _3933 = _3923 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
    float _3935 = _3535 * _3925;
    float _3937 = -_3925;
    float _3939 = -_3933;
    float _3941 = fma(_3937, (*spvDescriptorSet0.vp_c15)._m0[656].y, _3939);
    float _3943 = fma(_3533, _3923, _3935);
    float _3945 = -_3931;
    float _3947 = fma(_3945, (*spvDescriptorSet0.vp_c15)._m0[656].z, _3941);
    float _3949 = fma(_3501, _3931, _3943);
    float _3951 = precise::clamp(_3949, 0.0, 1.0);
    float _3953 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
    float _3955 = _3947 + _3953;
    float _3957 = _3929 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
    float _3959 = _3955 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
    float _3961 = precise::clamp(_3959, 0.0, 1.0);
    float _3963 = exp2(_3957);
    float _3965 = _3963 * _3961;
    float _3967 = _3951 * _3965;
    float _3969 = _3967 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
    float _3971 = _3967 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
    float _3973 = _3967 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
    out.m_92.x = _3969;
    out.m_92.y = _3971;
    out.m_92.z = _3973;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_94.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_94.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_94.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_94.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_92.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_92.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_92.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_92.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_90.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_90.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_90.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_90.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_88.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_88.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_88.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_88.w)); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

