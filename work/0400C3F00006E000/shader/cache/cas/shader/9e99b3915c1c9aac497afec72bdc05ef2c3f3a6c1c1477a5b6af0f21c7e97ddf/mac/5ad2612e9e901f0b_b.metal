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
    bool _3741 = false;
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
        float _4026 = as_type<float>(_129);
        out.gl_Position.z = _4026;
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
        float _4095 = as_type<float>(_167);
        out.gl_Position.z = _4095;
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
    int _219 = as_type<int>(_185);
    if (_211)
    {
        float _221 = rsqrt(_201);
        _217 = _221;
    }
    float _223 = _217;
    float _225 = 0.0;
    float _227 = 0.0;
    if (!_211)
    {
        _225 = 0.0;
        _227 = 0.0;
    }
    float _229 = _225;
    float _231 = _227;
    float _233 = 0.0;
    float _235 = _231;
    float _237 = _229;
    if (!_211)
    {
        _233 = 0.0;
    }
    float _239 = _233;
    bool _241 = _213 > 0.0;
    float _243 = _213;
    float _245 = _239;
    if (_215)
    {
        float _247 = rsqrt(_203);
        _243 = _247;
    }
    float _249 = _243;
    int _251 = as_type<int>(_187) & 1;
    bool _253 = _251 != 0;
    int _255 = as_type<int>(_187) & 2;
    bool _257 = _255 != 0;
    float _259 = 0.0;
    float _261 = 0.0;
    if (!_215)
    {
        _259 = 0.0;
        _261 = 0.0;
    }
    float _263 = _259;
    float _265 = _261;
    float _267 = 0.0;
    float _269 = _265;
    float _271 = _263;
    if (!_215)
    {
        _267 = 0.0;
    }
    float _273 = _267;
    bool _275 = !_253;
    float _277 = _275 ? (-0.5) : 0.5;
    float _279 = _273;
    if (_211)
    {
        float _281 = _223 * _169;
        _235 = _281;
    }
    float _283 = _235;
    if (_211)
    {
        float _285 = _223 * _175;
        _237 = _285;
    }
    float _287 = _237;
    float _289 = _209;
    if (_241)
    {
        float _291 = rsqrt(_205);
        _289 = _291;
    }
    float _293 = _289;
    if (_211)
    {
        float _295 = _223 * _181;
        _245 = _295;
    }
    float _297 = _245;
    bool _299 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _301 = 0.0;
    if (!_241)
    {
        _301 = 0.0;
    }
    float _303 = _301;
    float _305 = 0.0;
    float _307 = _303;
    if (!_241)
    {
        _305 = 0.0;
    }
    float _309 = _305;
    float _311 = _309;
    if (_215)
    {
        float _313 = _249 * _171;
        _269 = _313;
    }
    float _315 = _269;
    float _317 = 0.0;
    if (!_241)
    {
        _317 = 0.0;
    }
    float _319 = _317;
    float _321 = _319;
    if (_215)
    {
        float _323 = _249 * _177;
        _271 = _323;
    }
    float _325 = _271;
    if (_215)
    {
        float _327 = _249 * _183;
        _279 = _327;
    }
    float _329 = _279;
    bool _331 = !_257;
    float _333 = _331 ? (-0.5) : 0.5;
    if (_241)
    {
        float _335 = _293 * _173;
        _307 = _335;
    }
    float _337 = _307;
    if (_241)
    {
        float _339 = _293 * _179;
        _311 = _339;
    }
    float _341 = _311;
    if (_241)
    {
        float _343 = _293 * _185;
        _321 = _343;
    }
    float _345 = _321;
    bool _347 = !_299;
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
    float _383 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
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
    float _411 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _413 = _411 + (*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _415 = -(*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _417 = (*spvDescriptorSet0.vp_c9)._m0[148].w + _415;
    float _419 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _421 = _375 + _419;
    float _423 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _425 = _375 + _423;
    float _427 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _429 = _375 + _427;
    float _431 = 1.0 / _407;
    float _433 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    bool _435 = _375 >= (*spvDescriptorSet0.vp_c9)._m0[148].w;
    bool _437 = isnan(_375);
    bool _439 = _435 || _437;
    bool _441 = isnan((*spvDescriptorSet0.vp_c9)._m0[148].w);
    bool _443 = _439 || _441;
    float _445 = float(_443);
    float _447 = in.m_59.w;
    bool _449 = _375 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _451 = isnan(_375);
    bool _453 = _449 || _451;
    bool _455 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _457 = _453 || _455;
    float _459 = float(_457);
    float _461 = _183 * _379;
    float _463 = _177 * _379;
    float _465 = 1.0 / _395;
    float _467 = -(*spvDescriptorSet0.vp_c9)._m0[149].w;
    float _469 = (*spvDescriptorSet0.vp_c9)._m0[150].w + _467;
    float _471 = _379 + _387;
    float _473 = fma(_181, _377, _461);
    float _475 = fma(_175, _377, _463);
    float _477 = _397 * 2.0;
    int _479 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _481 = _479 != 0;
    float _483 = 1.0 / _413;
    float _485 = -(*spvDescriptorSet0.vp_c9)._m0[148].w;
    float _487 = _485 + (*spvDescriptorSet0.vp_c9)._m0[149].w;
    float _489 = fma(_185, _381, _473);
    float _491 = _397 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _493 = fma(_179, _381, _475);
    float _495 = float(_113);
    float _497 = _385 * _431;
    float _499 = -_433;
    float _501 = fma(_491, 2.0, _499);
    float _503 = 1.0 / _417;
    float _505 = -(*spvDescriptorSet0.vp_c9)._m0[149].w;
    float _507 = _375 + _505;
    float _509 = -(*spvDescriptorSet0.vp_c9)._m0[148].w;
    float _511 = _375 + _509;
    if (_481)
    {
        _219 = 0;
    }
    int _513 = _219;
    float _515 = _421 * _409;
    int _517 = _513;
    if (!_481)
    {
        _517 = 1;
    }
    int _519 = _517;
    float _521 = 1.0 / _469;
    float _523 = _399 * 2.0;
    float _525 = _425 * _465;
    bool _527 = _519 != 1;
    float _529 = -(*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _531 = _375 + _529;
    float _533 = _429 * _483;
    float _535 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _537 = 1.0 / _487;
    float _539 = _399 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _541 = _531 * _503;
    float _543 = -_147;
    float _545 = fma(_543, (*spvDescriptorSet0.vp_c9)._m0[76].x, _501);
    float _547 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _549 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _547;
    float _551 = floor(_523);
    float _553 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _555 = _401 * 2.0;
    float _557 = as_type<float>(_519);
    if (!_527)
    {
        _557 = _399;
    }
    float _559 = _557;
    float _561 = _507 * _521;
    float _563 = fma(_539, -2.0, _553);
    float _565 = _559;
    if (_527)
    {
        _565 = _397;
    }
    float _567 = _565;
    float _569 = fma(_549, _515, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _571 = floor(_477);
    float _573 = _511 * _537;
    float _575 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _577 = _575 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _579 = fma(_147, (*spvDescriptorSet0.vp_c9)._m0[76].y, _563);
    float _581 = _401 + _397;
    float _583 = fma(_577, _525, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _585 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _587 = int(_585);
    bool _589 = _551 > 0.0;
    float _591 = in.m_57.w;
    bool _593 = _551 >= 0.0;
    bool _595 = isnan(_551);
    bool _597 = _593 || _595;
    bool _599 = isnan(0.0);
    bool _601 = _597 || _599;
    float _603 = -(*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _605 = (*spvDescriptorSet0.vp_c9)._m0[148].y + _603;
    float _607 = _489 + _447;
    int _609 = _601 ? 0 : 1;
    float _611 = floor(_555);
    bool _613 = _571 > 0.0;
    float _615 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    bool _617 = _571 >= 0.0;
    bool _619 = isnan(_571);
    bool _621 = _617 || _619;
    bool _623 = isnan(0.0);
    bool _625 = _621 || _623;
    float _627 = _477 + (-1.0);
    int _629 = ~_609;
    int _631 = _629 + 1;
    int _633 = _631 + 1;
    float _635 = fma(_567, (*spvDescriptorSet0.vp_c9)._m0[83].z, _615);
    int _637 = _625 ? 0 : 1;
    float _639 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _641 = log2(_639);
    float _643 = float(_587);
    float _645 = fma(_147, (*spvDescriptorSet0.vp_c9)._m0[82].z, _635);
    float _647 = as_type<float>(_587);
    int _649 = _633;
    float _651 = _615;
    float _653 = _567;
    if (!_527)
    {
        _647 = _399;
    }
    float _655 = _647;
    float _657 = _655;
    if (!_589)
    {
        int _659 = ~_609;
        int _661 = _659 + 1;
        _649 = _661;
    }
    int _663 = _649;
    if (!_527)
    {
        _651 = _401;
    }
    float _665 = _651;
    float _667 = 1.0 / _643;
    float _669 = _665;
    if (_527)
    {
        _657 = _397;
    }
    float _671 = _657;
    float _673 = _493 + _591;
    if (_527)
    {
        _669 = _399;
    }
    float _675 = _669;
    int _677 = ~_637;
    int _679 = _677 + 1;
    int _681 = _679 + 1;
    float _683 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    int _685 = _681;
    if (!_613)
    {
        int _687 = ~_637;
        int _689 = _687 + 1;
        _685 = _689;
    }
    int _691 = _685;
    float _693 = _671 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _695 = _675 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _697 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].y);
    int _699 = int(_697);
    if (!_527)
    {
        _653 = _401;
    }
    float _701 = _653;
    float _703 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _705 = _701;
    if (_527)
    {
        _705 = _399;
    }
    float _707 = _705;
    float _709 = fma(_695, -2.0, _683);
    bool _711 = _611 >= 0.0;
    bool _713 = isnan(_611);
    bool _715 = _711 || _713;
    bool _717 = isnan(0.0);
    bool _719 = _715 || _717;
    float _721 = -_703;
    float _723 = fma(_693, 2.0, _721);
    bool _725 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _727 = isnan(0.0);
    bool _729 = _725 || _727;
    bool _731 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _733 = _729 || _731;
    float _735 = fma(_707, (*spvDescriptorSet0.vp_c9)._m0[83].w, _535);
    float _737 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _739 = 1.0 + _737;
    bool _741 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _743 = isnan(1.0);
    bool _745 = _741 || _743;
    bool _747 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _749 = _745 || _747;
    float _751 = _641 * _147;
    float _753 = 1.0 / _739;
    int _755 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _757 = _755 != 0;
    int _759 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _761 = _759 != 0;
    int _763 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _765 = _763 != 0;
    float _767 = _667 * _147;
    float _769 = float(_699);
    float _771 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _773 = fma(_147, (*spvDescriptorSet0.vp_c9)._m0[81].y, _709);
    float _775 = fma(_147, (*spvDescriptorSet0.vp_c9)._m0[82].w, _735);
    float _777 = exp2(_751);
    bool _779 = !_761;
    int _781 = _779 ? 0 : 1;
    float _783 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    bool _785 = _611 > 0.0;
    float _787 = -_147;
    float _789 = fma(_787, (*spvDescriptorSet0.vp_c9)._m0[81].x, _723);
    bool _791 = !_765;
    int _793 = _791 ? 0 : 1;
    float _795 = fma(_397, (*spvDescriptorSet0.vp_c9)._m0[78].z, _783);
    float _797 = float(_663);
    float _799 = 1.0 / _495;
    float _801 = fma(_399, (*spvDescriptorSet0.vp_c9)._m0[78].w, _771);
    float _803 = _397 + _399;
    float _805 = fma(_147, (*spvDescriptorSet0.vp_c9)._m0[77].z, _795);
    float _807 = fma(_147, (*spvDescriptorSet0.vp_c9)._m0[77].w, _801);
    int _809 = _719 ? 0 : 1;
    float _811 = _803 + (-1.0);
    float _813 = 1.0 / _769;
    float _815 = -_777;
    float _817 = _815 + 1.0;
    int _819 = ~_809;
    int _821 = _819 + 1;
    int _823 = _821 + 1;
    float _825 = fma(_811, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    int _827 = _823;
    if (!_785)
    {
        int _829 = ~_809;
        int _831 = _829 + 1;
        _827 = _831;
    }
    int _833 = _827;
    float _835 = _401 + _399;
    float _837 = _733 ? _817 : 0.0;
    float _839 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[201].y;
    float _841 = _835 + (-1.0);
    float _843 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _845 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _843;
    float _847 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _849 = _847 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _851 = _799 * _147;
    float _853 = fma(_841, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _855 = fma(_845, _515, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _857 = fma(_849, _525, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    bool _859 = _375 >= (*spvDescriptorSet0.vp_c9)._m0[150].w;
    bool _861 = isnan(_375);
    bool _863 = _859 || _861;
    bool _865 = isnan((*spvDescriptorSet0.vp_c9)._m0[150].w);
    bool _867 = _863 || _865;
    float _869 = float(_867);
    float _871 = _813 * _147;
    bool _873 = _375 >= (*spvDescriptorSet0.vp_c9)._m0[149].w;
    bool _875 = isnan(_375);
    bool _877 = _873 || _875;
    bool _879 = isnan((*spvDescriptorSet0.vp_c9)._m0[149].w);
    bool _881 = _877 || _879;
    float _883 = float(_881);
    float _885 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _887 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _885;
    if (_749)
    {
        float _889 = _837 * _753;
        _151 = _889;
    }
    float _891 = _151;
    float _893 = -_869;
    float _895 = _893 + 1.0;
    float _897 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _899 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _897;
    float _901 = fma(_887, _497, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _903 = -_883;
    float _905 = _903 + 1.0;
    float _907 = _883 * _895;
    float _909 = -(*spvDescriptorSet0.vp_c9)._m0[146].x;
    float _911 = _909 + (*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _913 = fma(_899, _497, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _915 = -(*spvDescriptorSet0.vp_c9)._m0[146].y;
    float _917 = _915 + (*spvDescriptorSet0.vp_c9)._m0[147].y;
    bool _919 = _375 >= (*spvDescriptorSet0.vp_c9)._m0[147].w;
    bool _921 = isnan(_375);
    bool _923 = _919 || _921;
    bool _925 = isnan((*spvDescriptorSet0.vp_c9)._m0[147].w);
    bool _927 = _923 || _925;
    float _929 = float(_927);
    float _931 = _445 * _905;
    float _933 = fma(_911, _533, (*spvDescriptorSet0.vp_c9)._m0[146].x);
    float _935 = -_445;
    float _937 = _935 + 1.0;
    float _939 = fma(_917, _533, (*spvDescriptorSet0.vp_c9)._m0[146].y);
    bool _941 = _375 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _943 = isnan(_375);
    bool _945 = _941 || _943;
    bool _947 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _949 = _945 || _947;
    float _951 = float(_949);
    float _953 = -_929;
    float _955 = _953 + 1.0;
    float _957 = _929 * _937;
    bool _959 = _375 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _961 = isnan(_375);
    bool _963 = _959 || _961;
    bool _965 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _967 = _963 || _965;
    float _969 = float(_967);
    float _971 = _581 + (-1.0);
    bool _973 = _375 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _975 = isnan(_375);
    bool _977 = _973 || _975;
    bool _979 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _981 = _977 || _979;
    float _983 = float(_981);
    float _985 = _951 * _955;
    float _987 = -_951;
    float _989 = _987 + 1.0;
    int _991 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 256;
    bool _993 = _991 != 0;
    int _995 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 512;
    bool _997 = _995 != 0;
    int _999 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1024;
    bool _1001 = _999 != 0;
    int _1003 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2048;
    bool _1005 = _1003 != 0;
    float _1007 = -_969;
    float _1009 = _1007 + 1.0;
    float _1011 = -_983;
    float _1013 = _1011 + 1.0;
    float _1015 = _983 * _989;
    bool _1017 = !_757;
    int _1019 = _1017 ? 0 : 1;
    float _1021 = -(*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _1023 = (*spvDescriptorSet0.vp_c9)._m0[148].x + _1021;
    int _1025 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _1027 = _1025 != 0;
    int _1029 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _1031 = _1029 != 0;
    int _1033 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _1035 = _1033 != 0;
    float _1037 = _969 * _1013;
    float _1039 = fma(_605, _541, (*spvDescriptorSet0.vp_c9)._m0[147].y);
    float _1041 = fma(_1023, _541, (*spvDescriptorSet0.vp_c9)._m0[147].x);
    float _1043 = -(*spvDescriptorSet0.vp_c9)._m0[148].x;
    float _1045 = _1043 + (*spvDescriptorSet0.vp_c9)._m0[149].x;
    float _1047 = _459 * _1009;
    bool _1049 = !_1027;
    int _1051 = _1049 ? 0 : 1;
    float _1053 = -_459;
    float _1055 = _1053 + 1.0;
    float _1057 = -(*spvDescriptorSet0.vp_c9)._m0[148].y;
    float _1059 = _1057 + (*spvDescriptorSet0.vp_c9)._m0[149].y;
    float _1061 = _569 * _1047;
    int _1063 = abs(_1051);
    float _1065 = fma(_1045, _573, (*spvDescriptorSet0.vp_c9)._m0[148].x);
    float _1067 = fma(_1059, _573, (*spvDescriptorSet0.vp_c9)._m0[148].y);
    float _1069 = _891 + (*spvDescriptorSet0.vp_c9)._m0[202].y;
    float _1071 = _855 * _1047;
    float _1073 = fma(_1055, (*spvDescriptorSet0.vp_c9)._m0[143].x, _1061);
    float _1075 = float(_1063);
    float _1077 = _1069 * _839;
    float _1079 = float(_833);
    float _1081 = fma(_1055, (*spvDescriptorSet0.vp_c9)._m0[143].y, _1071);
    float _1083 = fma(_583, _1037, _1073);
    float _1085 = fma(_397, (*spvDescriptorSet0.vp_c9)._m0[203].y, _1077);
    bool _1087 = !_1031;
    int _1089 = _1087 ? 0 : 1;
    float _1091 = fma(_857, _1037, _1081);
    float _1093 = _1075 * _1079;
    float _1095 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1097 = _471 + _1095;
    float _1099 = in.m_68.x;
    float _1101 = in.m_68.y;
    float _1103 = in.m_68.z;
    float _1105 = fma(_901, _1015, _1083);
    bool _1107 = !_1035;
    int _1109 = _1107 ? 0 : 1;
    float _1111 = _1097 * _1097;
    float _1113 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1115 = _673 + _1113;
    float _1117 = floor(_1085);
    int _1119 = abs(_1109);
    float _1121 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1123 = _607 + _1121;
    float _1125 = fma(_1115, _1115, _1111);
    float _1127 = _1085 + 0.25;
    int _1129 = abs(_1089);
    float _1131 = fma(_913, _1015, _1091);
    float _1133 = fma(_1123, _1123, _1125);
    float _1135 = floor(_1127);
    float _1137 = _1093 * (-2.0);
    float _1139 = float(_691);
    float _1141 = fma(_933, _985, _1105);
    float _1143 = float(_1119);
    float _1145 = fma(_971, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    int _1147 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 32768;
    bool _1149 = _1147 != 0;
    float _1151 = rsqrt(_1133);
    bool _1153 = !_997;
    int _1155 = _1153 ? 0 : 1;
    float _1157 = _1143 * _797;
    bool _1159 = !_993;
    int _1161 = _1159 ? 0 : 1;
    float _1163 = _397 + (-0.5);
    int _1165 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 65536;
    bool _1167 = _1165 != 0;
    int _1169 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 131072;
    bool _1171 = _1169 != 0;
    float _1173 = fma(_1137, _1099, _1099);
    float _1175 = -_1117;
    float _1177 = _1085 + _1175;
    float _1179 = _1085 * 6.283185482025146484375;
    float _1181 = -_1135;
    float _1183 = _1127 + _1181;
    float _1185 = fma(_1163, (*spvDescriptorSet0.vp_c9)._m0[196].x, _1173);
    bool _1187 = !_1167;
    int _1189 = _1187 ? 0 : 1;
    float _1191 = _1179 * 0.15915493667125701904296875;
    bool _1193 = _1177 >= 0.5;
    bool _1195 = isnan(_1177);
    bool _1197 = _1193 || _1195;
    bool _1199 = isnan(0.5);
    bool _1201 = _1197 || _1199;
    float _1203 = fma(_825, _1137, _825);
    int _1205 = abs(_1189);
    float _1207 = _1097 * _1151;
    bool _1209 = _1183 > 0.5;
    float _1211 = _1191 * 6.283185482025146484375;
    float _1213 = sin(_1211);
    bool _1215 = !_1149;
    int _1217 = _1215 ? 0 : 1;
    float _1219 = -_1207;
    float _1221 = fma(_1219, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1097);
    float _1223 = _1115 * _1151;
    bool _1225 = !_1201;
    float _1227 = _1225 ? 0.5 : (-0.5);
    float _1229 = _1157 * (-2.0);
    int _1231 = abs(_1217);
    float _1233 = _1221 * _1221;
    float _1235 = float(_1205);
    float _1237 = -_1223;
    float _1239 = fma(_1237, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1115);
    float _1241 = _1227 * (*spvDescriptorSet0.vp_c9)._m0[200].y;
    float _1243 = _1241 * 2.0;
    float _1245 = _1183;
    if (_1209)
    {
        float _1247 = -_1183;
        float _1249 = _1247 + 1.0;
        _1245 = _1249;
    }
    float _1251 = _1245;
    bool _1253 = !_1171;
    int _1255 = _1253 ? 0 : 1;
    float _1257 = fma(_1239, _1239, _1233);
    float _1259 = _1235 * _1243;
    float _1261 = float(_1231);
    float _1263 = _1123 * _1151;
    int _1265 = abs(_1255);
    float _1267 = _1213 * (*spvDescriptorSet0.vp_c9)._m0[200].y;
    float _1269 = fma(_1251, 4.0, -1.0);
    float _1271 = -_1263;
    float _1273 = fma(_1271, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1123);
    float _1275 = float(_1265);
    float _1277 = fma(_1261, _1267, _1259);
    float _1279 = float(_1129);
    float _1281 = _1269 * (*spvDescriptorSet0.vp_c9)._m0[200].y;
    float _1283 = fma(_1203, _891, _1185);
    float _1285 = fma(_1145, _1229, _1145);
    float _1287 = fma(_1229, _1103, _1103);
    float _1289 = fma(_1275, _1281, _1277);
    float _1291 = _1279 * _1139;
    float _1293 = _401 + (-0.5);
    float _1295 = fma(_939, _985, _1131);
    float _1297 = fma(_1289, 3.1415927410125732421875, _1101);
    float _1299 = _1291 * (-2.0);
    float _1301 = fma(_1293, (*spvDescriptorSet0.vp_c9)._m0[196].z, _1287);
    float _1303 = _399 + (-0.5);
    float _1305 = fma(_1297, _1299, _1297);
    float _1307 = fma(_853, _1299, _853);
    float _1309 = fma(_1273, _1273, _1257);
    float _1311 = fma(_1303, (*spvDescriptorSet0.vp_c9)._m0[196].y, _1305);
    float _1313 = fma(_1041, _957, _1141);
    float _1315 = in.m_70.x;
    float _1317 = in.m_70.y;
    float _1319 = -(*spvDescriptorSet0.vp_c9)._m0[149].y;
    float _1321 = (*spvDescriptorSet0.vp_c9)._m0[150].y + _1319;
    float _1323 = fma(_1307, _891, _1311);
    float _1325 = fma(_1039, _957, _1295);
    float _1327 = -(*spvDescriptorSet0.vp_c9)._m0[149].x;
    float _1329 = (*spvDescriptorSet0.vp_c9)._m0[150].x + _1327;
    float _1331 = fma(_1321, _561, (*spvDescriptorSet0.vp_c9)._m0[149].y);
    float _1333 = sqrt(_1309);
    float _1335 = fma(_1067, _931, _1325);
    float _1337 = fma(_1329, _561, (*spvDescriptorSet0.vp_c9)._m0[149].x);
    float _1339 = fma(_1065, _931, _1313);
    float _1341 = fma(_1285, _891, _1301);
    float _1343 = fma(_1331, _907, _1335);
    float _1345 = _1283 * 0.15915493667125701904296875;
    float _1347 = fma(_1337, _907, _1339);
    float _1349 = _1341 * 0.15915493667125701904296875;
    float _1351 = _1323 * 0.15915493667125701904296875;
    float _1353 = fma(_869, (*spvDescriptorSet0.vp_c9)._m0[150].y, _1343);
    float _1355 = fma(_869, (*spvDescriptorSet0.vp_c9)._m0[150].x, _1347);
    float _1357 = _1345 * 6.283185482025146484375;
    float _1359 = sin(_1357);
    float _1361 = fma(_627, (*spvDescriptorSet0.vp_c9)._m0[191].x, _333);
    float _1363 = _1151 * _1333;
    float _1365 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _1361);
    float _1367 = _1355 * _1315;
    float _1369 = _1353 * _1317;
    float _1371 = _1345 * 6.283185482025146484375;
    float _1373 = cos(_1371);
    float _1375 = _1367 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1377 = _1369 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1379 = _1375 * _1363;
    float _1381 = _1377 * _1363;
    float _1383 = _1349 * 6.283185482025146484375;
    float _1385 = cos(_1383);
    float _1387 = fma(_627, (*spvDescriptorSet0.vp_c9)._m0[191].x, _277);
    float _1389 = _1363 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _1391 = _1389 * 0.5;
    float _1393 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _1387);
    float _1395 = _1351 * 6.283185482025146484375;
    float _1397 = sin(_1395);
    float _1399 = _1379 * _1393;
    float _1401 = _1381 * _1365;
    float _1403 = _1351 * 6.283185482025146484375;
    float _1405 = cos(_1403);
    float _1407 = _1373 * _1385;
    float _1409 = _1359 * _1385;
    float _1411 = _1407 * _1391;
    float _1413 = _1349 * 6.283185482025146484375;
    float _1415 = sin(_1413);
    float _1417 = _1359 * _1397;
    float _1419 = _1373 * _1405;
    float _1421 = _1359 * _1405;
    float _1423 = _1373 * _1397;
    float _1425 = _1405 * _1385;
    float _1427 = _1397 * _1385;
    float _1429 = fma(_1415, _1419, _1417);
    float _1431 = _1415 * _1391;
    float _1433 = -_1421;
    float _1435 = fma(_1415, _1423, _1433);
    float _1437 = -_1423;
    float _1439 = fma(_1415, _1421, _1437);
    float _1441 = fma(_1429, _1399, _1411);
    float _1443 = _1409 * _1391;
    float _1445 = -_1431;
    float _1447 = fma(_1425, _1399, _1445);
    float _1449 = fma(_1415, _1417, _1419);
    float _1451 = -_1401;
    float _1453 = fma(_1435, _1451, _1441);
    float _1455 = fma(_1439, _1399, _1443);
    float _1457 = -_1401;
    float _1459 = fma(_1427, _1457, _1447);
    bool _1461 = !_1001;
    int _1463 = _1461 ? 0 : 1;
    float _1465 = _1453 * _329;
    float _1467 = -_1401;
    float _1469 = fma(_1449, _1467, _1455);
    float _1471 = _1453 * _325;
    float _1473 = _1453 * _315;
    float _1475 = fma(_1459, _297, _1465);
    float _1477 = fma(_1459, _287, _1471);
    float _1479 = fma(_1459, _283, _1473);
    float _1481 = fma(_1469, _345, _1475);
    float _1483 = fma(_1469, _341, _1477);
    float _1485 = fma(_1469, _337, _1479);
    float _1487 = _607 + _1481;
    float _1489 = _673 + _1483;
    float _1491 = _471 + _1485;
    float _1493 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1495 = _1487 + _1493;
    float _1497 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1499 = _1489 + _1497;
    float _1501 = _1495 * _1495;
    float _1503 = fma(_1499, _1499, _1501);
    bool _1505 = !_1005;
    int _1507 = _1505 ? 0 : 1;
    float _1509 = sqrt(_1503);
    bool _1511 = _1509 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1513 = _1479;
    float _1515 = _1485;
    float _1517 = _1489;
    float _1519 = _1495;
    float _1521 = _1263;
    if (!_1511)
    {
        _1513 = _1489;
    }
    float _1523 = _1513;
    float _1525 = _1523;
    if (!_1511)
    {
        _1515 = _1487;
    }
    float _1527 = _1515;
    float _1529 = _1527;
    if (!_1511)
    {
        _1517 = _1491;
    }
    float _1531 = _1517;
    bool _1533 = !_1511;
    float _1535 = _1531;
    if (!_1533)
    {
        float _1537 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1539 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1541 = _1509 + _1539;
        float _1543 = rsqrt(_1503);
        float _1545 = _1541 * _1537;
        float _1547 = _1491 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1549 = _1545 * 0.15915493667125701904296875;
        float _1551 = _1549 * 6.283185482025146484375;
        float _1553 = cos(_1551);
        float _1555 = _1549 * 6.283185482025146484375;
        float _1557 = sin(_1555);
        float _1559 = _1553 + (-1.0);
        float _1561 = fma(_1557, _1547, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1563 = _1559 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1565 = _1543 * _1561;
        float _1567 = fma(_1491, _1553, _1563);
        float _1569 = fma(_1499, _1565, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1571 = fma(_1495, _1565, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1525 = _1569;
        _1529 = _1571;
        _1535 = _1567;
    }
    float _1573 = _1525;
    float _1575 = _1529;
    float _1577 = _1535;
    float _1579 = -(*spvDescriptorSet0.vp_c15)._m0[630].x;
    float _1581 = _1573 + _1579;
    float _1583 = -(*spvDescriptorSet0.vp_c15)._m0[630].y;
    float _1585 = _1575 + _1583;
    float _1587 = fma(_1581, (*spvDescriptorSet0.vp_c15)._m0[630].z, 0.5);
    float _1589 = fma(_1585, (*spvDescriptorSet0.vp_c15)._m0[630].z, 0.5);
    float2 _6238 = float2(_1587, _1589);
    float _1591 = dm_bs(spvDescriptorSet0.vp_t_tcb_28.sample(spvDescriptorSet0.vp_t_tcb_28Smplr, select(_6238, float2(0.0), isnan(_6238)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_28, spvDescriptorSet0.vp_t_tcb_28Smplr_w, select(_6238, float2(0.0), isnan(_6238)), level(0.0)).x;
    float _1593 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _1595 = int(_1593);
    int _1597 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _1599 = _1597 != 0;
    float _1601 = -_1223;
    float _1603 = fma(_1601, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1573);
    int _1605 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _1607 = _1605 != 0;
    float _1609 = -_1223;
    float _1611 = fma(_1609, (*spvDescriptorSet0.vp_c9)._m0[18].w, _673);
    int _1613 = abs(_781);
    float _1615 = -_1263;
    float _1617 = fma(_1615, (*spvDescriptorSet0.vp_c9)._m0[18].w, _607);
    int _1619 = abs(_1155);
    float _1621 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].x);
    int _1623 = int(_1621);
    int _1625 = abs(_1463);
    if (_1599)
    {
        float _1627 = in.m_64.x;
        _1519 = _1627;
    }
    float _1629 = _1519;
    float _1631 = float(uint(_1595));
    float _1633 = trunc(_767);
    int _1635 = int(_1633);
    float _1637 = trunc(_871);
    int _1639 = int(_1637);
    float _1641 = float(uint(_1623));
    float _1643 = _1629;
    if (!_1599)
    {
        float _1645 = in.m_64.y;
        _1643 = _1645;
    }
    float _1647 = _1643;
    int _1649 = ~_1595;
    int _1651 = _1649 + 1;
    float _1653 = float(_1623);
    bool _1655 = _1595 == 0;
    float _1657 = 1.0 / _1631;
    float _1659 = float(uint(_1635));
    int _1661 = ~_1623;
    int _1663 = _1661 + 1;
    float _1665 = 1.0 / _1641;
    float _1667 = float(uint(_1639));
    int _1669 = as_type<int>(_1657) + (-2);
    float _1671 = as_type<float>(_1669) * _1659;
    int _1673 = as_type<int>(_1665) + (-2);
    float _1675 = trunc(_1671);
    float _1677 = precise::max(_1675, 0.0);
    uint _1680 = uint(_1677);
    float _1682 = as_type<float>(_1673) * _1667;
    float _1684 = trunc(_1682);
    float _1686 = precise::max(_1684, 0.0);
    uint _1688 = uint(_1686);
    int _1690 = ~_1623;
    int _1692 = _1690 + 1;
    int _1694 = _1651 * int(_1680);
    int _1696 = _1694 + _1635;
    float _1698 = as_type<float>(_1651);
    float _1700 = as_type<float>(_1696);
    if (_1599)
    {
        _1698 = 1.0;
    }
    float _1702 = _1698;
    float _1704 = _1702;
    if (!_1599)
    {
        _1704 = 7.345489978790283203125;
    }
    float _1706 = _1704;
    float _1708 = float(uint(_1696));
    if (_1599)
    {
        _1700 = 1.0;
    }
    float _1710 = _1700;
    int _1712 = _1692 * int(_1688);
    int _1714 = _1712 + _1639;
    float _1716 = _1710;
    if (!_1599)
    {
        _1716 = 1.2345600128173828125;
    }
    float _1718 = _1716;
    float _1720 = as_type<float>(_1669) * _1708;
    float _1722 = _1706 * _397;
    float _1724 = float(uint(_1714));
    float _1726 = _1647 * _1718;
    float _1728 = floor(_1722);
    int _1730 = ~_1595;
    int _1732 = _1730 + 1;
    float _1734 = as_type<float>(_1673) * _1724;
    float _1736 = trunc(_1720);
    float _1738 = precise::max(_1736, 0.0);
    uint _1740 = uint(_1738);
    float _1742 = floor(_1726);
    float _1744 = -_1728;
    float _1746 = _1722 + _1744;
    int _1748 = int(_1680) + int(_1740);
    float _1750 = trunc(_1734);
    float _1752 = precise::max(_1750, 0.0);
    uint _1754 = uint(_1752);
    float _1756 = float(_1595);
    float _1758 = float(_1635);
    int _1760 = _1732 * _1748;
    int _1762 = _1760 + _1635;
    float _1764 = -_1742;
    float _1766 = _1726 + _1764;
    float _1768 = _1746 * _1756;
    bool _1770 = _1758 >= _1756;
    bool _1772 = isnan(_1758);
    bool _1774 = _1770 || _1772;
    bool _1776 = isnan(_1756);
    bool _1778 = _1774 || _1776;
    float _1780 = float(_1778);
    float _1782 = _1756 * _851;
    bool _1784 = uint(_1762) >= uint(_1595);
    float _1786 = _1766 * _1653;
    int _1788 = ~_1623;
    int _1790 = _1788 + 1;
    float _1792 = trunc(_1768);
    int _1794 = int(_1792);
    bool _1796 = !_1784;
    int _1798 = _1796 ? 0 : (-1);
    int _1800 = int(_1688) + int(_1754);
    int _1802 = ~_1748;
    int _1804 = _1802 + _1798;
    int _1806 = _1804 + 1;
    int _1808 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _1810 = _1808 != 0;
    float _1812 = trunc(_1780);
    int _1814 = int(_1812);
    int _1816 = _1790 * _1800;
    int _1818 = _1816 + _1639;
    int _1820 = _1595 + (-1);
    int _1822 = _1595 * _1806;
    int _1824 = _1822 + _1635;
    float _1826 = float(_1639);
    bool _1828 = uint(_1818) >= uint(_1623);
    bool _1830 = _1826 >= _1653;
    bool _1832 = isnan(_1826);
    bool _1834 = _1830 || _1832;
    bool _1836 = isnan(_1653);
    bool _1838 = _1834 || _1836;
    float _1840 = float(_1838);
    float _1842 = trunc(_1782);
    int _1844 = int(_1842);
    bool _1846 = !_1810;
    int _1848 = _1846 ? 0 : 1;
    bool _1850 = !_1655;
    int _1852 = _1850 ? _1824 : (-1);
    int _1854 = abs(_1848);
    int _1856 = ~_1814;
    int _1858 = _1856 + 1;
    int _1860 = _1858 + 1;
    float _1862 = trunc(_1786);
    int _1864 = int(_1862);
    bool _1866 = !_1828;
    int _1868 = _1866 ? 0 : (-1);
    bool _1870 = _1623 == 0;
    int _1872 = _1852 * _1860;
    int _1874 = ~_1800;
    int _1876 = _1874 + _1868;
    int _1878 = _1876 + 1;
    int _1880 = abs(_1019);
    float _1882 = trunc(_1840);
    int _1884 = int(_1882);
    int _1886 = _1814 * _1820;
    int _1888 = _1886 + _1872;
    float _1890 = _1653 * _851;
    int _1892 = _1623 * _1878;
    int _1894 = _1892 + _1639;
    bool _1896 = !_1607;
    int _1898 = _1896 ? 0 : 1;
    int _1900 = _1794 * _1854;
    int _1902 = _1900 + _1635;
    int _1904 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8192;
    bool _1906 = _1904 != 0;
    int _1908 = _1888 * _1613;
    float _1910 = trunc(_1890);
    int _1912 = int(_1910);
    int _1914 = abs(_793);
    bool _1916 = !_1870;
    int _1918 = _1916 ? _1894 : (-1);
    int _1920 = _1844 * _1880;
    int _1922 = _1920 + _1908;
    int _1924 = abs(_1898);
    bool _1926 = !_1906;
    int _1928 = _1926 ? 0 : 1;
    int _1930 = _1902 * _1914;
    int _1932 = _1930 + _1922;
    int _1934 = ~_1884;
    int _1936 = _1934 + 1;
    int _1938 = _1936 + 1;
    int _1940 = abs(_1928);
    int _1942 = _1794 * _1924;
    int _1944 = _1942 + _1932;
    int _1946 = _1623 + (-1);
    int _1948 = _1918 * _1938;
    int _1950 = abs(_1161);
    int _1952 = _1884 * _1946;
    int _1954 = _1952 + _1948;
    float _1956 = float(uint(_1944));
    int _1958 = _1954 * _1619;
    int _1960 = abs(_1507);
    float _1962 = as_type<float>(_1669) * _1956;
    int _1964 = _1864 * _1940;
    int _1966 = _1964 + _1639;
    float _1968 = float(uint(_1902));
    int _1970 = _1912 * _1950;
    int _1972 = _1970 + _1958;
    float _1974 = trunc(_1962);
    float _1976 = precise::max(_1974, 0.0);
    uint _1978 = uint(_1976);
    int _1980 = ~_1595;
    int _1982 = _1980 + 1;
    int _1984 = _1966 * _1625;
    int _1986 = _1984 + _1972;
    int _1988 = ~_1595;
    int _1990 = _1988 + 1;
    int _1992 = _1864 * _1960;
    int _1994 = _1992 + _1986;
    float _1996 = as_type<float>(_1669) * _1968;
    float _1998 = float(uint(_1994));
    int _2000 = _1982 * int(_1978);
    int _2002 = _2000 + _1944;
    float _2004 = trunc(_1996);
    float _2006 = precise::max(_2004, 0.0);
    uint _2008 = uint(_2006);
    float _2010 = as_type<float>(_1673) * _1998;
    float _2012 = float(uint(_2002));
    float _2014 = trunc(_2010);
    float _2016 = precise::max(_2014, 0.0);
    uint _2018 = uint(_2016);
    float _2020 = as_type<float>(_1669) * _2012;
    int _2022 = ~_1623;
    int _2024 = _2022 + 1;
    int _2026 = _1990 * int(_2008);
    int _2028 = _2026 + _1902;
    float _2030 = trunc(_2020);
    float _2032 = precise::max(_2030, 0.0);
    uint _2034 = uint(_2032);
    float _2036 = float(uint(_2028));
    int _2038 = _2024 * int(_2018);
    int _2040 = _2038 + _1994;
    float _2042 = as_type<float>(_1669) * _2036;
    float _2044 = float(uint(_2040));
    float _2046 = trunc(_2042);
    float _2048 = precise::max(_2046, 0.0);
    uint _2050 = uint(_2048);
    int _2052 = int(_1978) + int(_2034);
    float _2054 = as_type<float>(_1673) * _2044;
    int _2056 = _1982 * _2052;
    int _2058 = _2056 + _1944;
    float _2060 = trunc(_2054);
    float _2062 = precise::max(_2060, 0.0);
    uint _2064 = uint(_2062);
    bool _2066 = uint(_2058) >= uint(_1595);
    bool _2068 = !_2066;
    int _2070 = _2068 ? 0 : (-1);
    int _2072 = int(_2008) + int(_2050);
    float _2074 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2076 = _1603 + _2074;
    int _2078 = ~_2052;
    int _2080 = _2078 + _2070;
    int _2082 = _2080 + 1;
    int _2084 = _1595 * _2082;
    int _2086 = _2084 + _1944;
    int _2088 = int(_2018) + int(_2064);
    int _2090 = _1663 * _2088;
    int _2092 = _2090 + _1994;
    float _2094 = fma(_1591, 100.0, _1577);
    float _2096 = -_1263;
    float _2098 = fma(_2096, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1575);
    float _2100 = -_1207;
    float _2102 = fma(_2100, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2094);
    float _2104 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2106 = _2098 + _2104;
    float _2108 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2110 = _2102 + _2108;
    float _2112 = _2110 * _2110;
    float _2114 = fma(_2076, _2076, _2112);
    float _2116 = fma(_2106, _2106, _2114);
    float _2118 = rsqrt(_2116);
    float _2120 = sqrt(_2116);
    float _2122 = _2118 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _2124 = _2076 * _2122;
    float _2126 = _2106 * _2122;
    float _2128 = _2124 * _2124;
    float _2130 = _2126 * _2126;
    float _2132 = _2128 + _2130;
    float _2134 = sqrt(_2132);
    bool _2136 = _2134 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2138 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2140 = _2134 + _2138;
    float _2142 = _2106;
    float _2144 = _2132;
    float _2146 = _2140;
    float _2148 = _2110;
    float _2150 = as_type<float>(_1914);
    if (_2136)
    {
        float _2152 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2142 = _2152;
    }
    float _2154 = _2142;
    if (_2136)
    {
        float _2156 = rsqrt(_2132);
        _2144 = _2156;
    }
    float _2158 = _2144;
    if (_2136)
    {
        float _2160 = _2140 * _2154;
        _2146 = _2160;
    }
    float _2162 = _2146;
    if (_2136)
    {
        float _2164 = _2162 * 0.15915493667125701904296875;
        _1521 = _2164;
    }
    float _2166 = _1521;
    float _2168 = _2112;
    float _2170 = _2166;
    if (_2136)
    {
        float _2172 = _2166 * 6.283185482025146484375;
        float _2174 = sin(_2172);
        _2168 = _2174;
    }
    float _2176 = _2168;
    float _2178 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _2180 = precise::max(0.0, _2178);
    float _2182 = _2118;
    float _2184 = _2180;
    float _2186 = _2178;
    if (_2136)
    {
        float _2188 = _2166 * 6.283185482025146484375;
        float _2190 = cos(_2188);
        _2182 = _2190;
    }
    float _2192 = _2182;
    float _2194 = -_2122;
    float _2196 = -_2180;
    float _2198 = fma(_2110, _2194, _2196);
    if (!_2136)
    {
        _2184 = _2124;
    }
    float _2200 = _2184;
    float _2202 = _2200;
    if (_2136)
    {
        float _2204 = _2198 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2186 = _2204;
    }
    float _2206 = _2186;
    float _2208 = _2176;
    float _2210 = _2206;
    if (_2136)
    {
        float _2212 = fma(_2176, _2206, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _2208 = _2212;
    }
    float _2214 = _2208;
    float _2216 = _2214;
    if (!_2136)
    {
        _2210 = _2198;
    }
    float _2218 = _2210;
    float _2220 = _2218;
    float _2222 = _2192;
    if (_2136)
    {
        float _2224 = _2192 + (-1.0);
        _2148 = _2224;
    }
    float _2226 = _2148;
    float _2228 = _2226;
    if (_2136)
    {
        float _2230 = _2158 * _2214;
        _2150 = _2230;
    }
    float _2232 = _2150;
    if (!_2136)
    {
        _2216 = _2128;
    }
    float _2234 = _2216;
    float _2236 = _2234;
    if (_2136)
    {
        float _2238 = _2226 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2170 = _2238;
    }
    float _2240 = _2170;
    if (_2136)
    {
        float _2242 = _2124 * _2232;
        _2202 = _2242;
    }
    float _2244 = _2202;
    if (!_2136)
    {
        _2228 = _2126;
    }
    float _2246 = _2228;
    float _2248 = _2246;
    if (_2136)
    {
        float _2250 = _2126 * _2232;
        _2248 = _2250;
    }
    float _2252 = _2248;
    if (_2136)
    {
        float _2254 = fma(_2198, _2192, _2240);
        _2220 = _2254;
    }
    float _2256 = _2220;
    if (_2136)
    {
        float _2258 = _2244 * _2244;
        _2236 = _2258;
    }
    float _2260 = _2236;
    if (!_2136)
    {
        _2222 = _2130;
    }
    float _2262 = _2222;
    float _2264 = _2262;
    if (_2136)
    {
        float _2266 = _2252 * _2252;
        _2264 = _2266;
    }
    float _2268 = _2264;
    float _2270 = fma(_2256, _2256, _2260);
    float _2272 = _2102 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _2274 = _2102 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _2276 = _2270 + _2268;
    float _2278 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _2280 = fma(_2120, (*spvDescriptorSet0.vp_c15)._m0[23].w, _2278);
    float _2282 = precise::clamp(_2280, 0.0, 1.0);
    float _2284 = fma(_1611, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _2286 = rsqrt(_2276);
    float _2288 = -_2282;
    float _2290 = _2288 + 1.0;
    float _2292 = _2102 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2294 = fma(_1603, (*spvDescriptorSet0.vp_c8)._m0[2].x, _2272);
    float _2296 = fma(_1603, (*spvDescriptorSet0.vp_c8)._m0[3].x, _2274);
    float _2298 = fma(_1603, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2292);
    float _2300 = fma(_2098, (*spvDescriptorSet0.vp_c8)._m0[2].z, _2294);
    float _2302 = abs(_2290);
    float _2304 = log2(_2302);
    float _2306 = fma(_2098, (*spvDescriptorSet0.vp_c8)._m0[3].z, _2296);
    float _2308 = fma(_2098, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2298);
    float _2310 = _2300 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _2312 = _2306 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _2314 = _2308 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _2316 = _2310 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _2318 = _2286 * _2244;
    float _2320 = floor(_2284);
    float _2322 = _2286 * _2256;
    float _2324 = _2286 * _2252;
    float _2326 = _2318 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _2328 = fma(_1617, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _2330 = -_2326;
    float _2332 = fma(_2322, (*spvDescriptorSet0.vp_c15)._m0[21].y, _2330);
    float _2334 = _2304 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _2336 = -_2324;
    float _2338 = fma(_2336, (*spvDescriptorSet0.vp_c15)._m0[21].z, _2332);
    float _2340 = _2102 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2342 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _2344 = floor(_2328);
    float _2346 = fma(_1603, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2340);
    float _2348 = -_2320;
    float _2350 = _2284 + _2348;
    float _2352 = fma(_2338, -0.5, 0.5);
    float _2354 = -_2316;
    float _2356 = fma(_2354, _2342, 1.0);
    float _2358 = fma(_2098, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2346);
    float _2360 = fma(_2338, 0.5, 0.5);
    float _2362 = _2314 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2364 = sqrt(_2352);
    float _2366 = _2358 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2368 = fma(_2360, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _2370 = fma(_2360, _2368, -0.212114393711090087890625);
    float _2372 = exp2(_2334);
    float _2374 = _2314 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _2376 = -_2344;
    float _2378 = _2328 + _2376;
    float _2380 = _2314 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2382 = fma(_2360, _2370, 1.570728778839111328125);
    float _2384 = fma(_2366, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2374);
    float _2386 = _2322 + 1.0;
    float _2388 = float(uint(_1966));
    float _2390 = log2(_2356);
    float _2392 = fma(_2310, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2384);
    float _2394 = _2364 * 0.636619746685028076171875;
    float _2396 = as_type<float>(_1673) * _2388;
    float _2398 = fma(_2312, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2392);
    float _2400 = fma(_2366, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2362);
    float _2402 = -_2322;
    float _2404 = fma(_2372, _2386, _2402);
    float _2406 = fma(_2366, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2380);
    float _2408 = 1.0 / _2398;
    float _2410 = fma(_2310, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2400);
    float _2412 = -_2382;
    float _2414 = fma(_2394, _2412, 1.0);
    float _2416 = fma(_2310, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2406);
    int _2418 = ~_1595;
    int _2420 = _2418 + 1;
    float _2422 = _2390 * 0.693147182464599609375;
    float _2424 = fma(_2312, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2416);
    float _2426 = fma(_2312, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2410);
    float _2428 = trunc(_2396);
    float _2430 = precise::max(_2428, 0.0);
    uint _2432 = uint(_2430);
    float _2434 = _2422 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float2 _7490 = float2(_2350, _2378);
    float _2436 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_7490, float2(0.0), isnan(_7490)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_7490, float2(0.0), isnan(_7490)), level(0.0)).x;
    int _2438 = _2420 * _2072;
    int _2440 = _2438 + _1902;
    int _2442 = ~_1623;
    int _2444 = _2442 + 1;
    float _2446 = _2424 * _2408;
    float _2448 = _2426 * _2408;
    float _2450 = fma(_2446, 0.5, 0.5);
    float _2452 = fma(_2448, -0.5, 0.5);
    float _2454 = fma(_2404, 0.5, 0.5);
    float3 _7521 = float3(_2450, _2452, _2434);
    float _2456 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_7521, float3(0.0), isnan(_7521)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_7521, float3(0.0), isnan(_7521)), level(0.0)).x;
    float3 _7532 = float3(_2450, _2452, _2434);
    float4 _2459 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_7532, float3(0.0), isnan(_7532)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_7532, float3(0.0), isnan(_7532)), level(0.0)).xyzw;
    float _2461 = _2459.x;
    float _2463 = _2459.y;
    float _2465 = _2459.z;
    float _2467 = _2459.w;
    float2 _7548 = float2(_2414, _2454);
    float3 _2471 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_7548, float2(0.0), isnan(_7548)), level(0.0)), spvDescriptorSet0.dm_border, 4u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_7548, float2(0.0), isnan(_7548)), level(0.0)).xyz;
    float _2473 = _2471.x;
    float _2475 = _2471.y;
    float _2477 = _2471.z;
    bool _2479 = !_1655;
    int _2481 = _2479 ? _2086 : (-1);
    float _2483 = _1361 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _2485 = fma(_1591, 100.0, _471);
    bool _2487 = uint(_2440) >= uint(_1595);
    float _2489 = _2304 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    int _2491 = _2481 & 3;
    bool _2493 = _2491 != 0;
    float _2495 = -_1207;
    float _2497 = fma(_2495, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2485);
    int _2499 = _2481 & 3;
    bool _2501 = _2499 != 0;
    out.m_72.x = _1603;
    out.m_72.y = _2102;
    out.m_72.z = _2098;
    bool _2503 = uint(_2092) >= uint(_1623);
    int _2505 = _2444 * int(_2432);
    int _2507 = _2505 + _1966;
    bool _2509 = !_2487;
    int _2511 = _2509 ? 0 : (-1);
    float _2513 = exp2(_2489);
    int _2515 = _2493 ? 0 : 1;
    bool _2517 = uint(_2499) > 1u;
    bool _2519 = _2499 != 3;
    bool _2521 = !_2503;
    int _2523 = _2521 ? 0 : (-1);
    bool _2525 = uint(_2499) >= 2u;
    float _2527 = float(uint(_2507));
    int _2529 = ~_2088;
    int _2531 = _2529 + _2523;
    int _2533 = _2531 + 1;
    int _2535 = _2525 ? 0 : 1;
    float _2537 = as_type<float>(_1673) * _2527;
    bool _2539 = _403 > 0.5;
    int _2541 = _1623 * _2533;
    int _2543 = _2541 + _1994;
    int _2545 = ~_2515;
    int _2547 = _2545 + 1;
    int _2549 = _2547 + 1;
    float _2551 = -_2513;
    float _2553 = _2551 + 1.0;
    int _2555 = ~_2535;
    int _2557 = _2555 + 1;
    int _2559 = _2557 + 1;
    float _2561 = trunc(_2537);
    float _2563 = precise::max(_2561, 0.0);
    uint _2565 = uint(_2563);
    bool _2567 = !_2501;
    int _2569 = _2567 ? 0 : 1;
    int _2571 = _2549;
    int _2573 = _2559;
    float _2575 = _2398;
    float _2577 = _2426;
    if (!_2517)
    {
        int _2579 = ~_2515;
        int _2581 = _2579 + 1;
        _2571 = _2581;
    }
    int _2583 = _2571;
    if (_2519)
    {
        int _2585 = ~_2535;
        int _2587 = _2585 + 1;
        _2573 = _2587;
    }
    int _2589 = _2573;
    bool _2591 = _397 > 0.5;
    int _2593 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _2595 = _2593 != 0;
    float _2597 = -_333;
    int _2599 = _2539 ? as_type<int>(_2597) : as_type<int>(_333);
    int _2601 = _2481 >> 31;
    bool _2603 = !_1870;
    int _2605 = _2603 ? _2543 : (-1);
    bool _2607 = !_2595;
    float _2609 = _2607 ? _333 : as_type<float>(_2599);
    int _2611 = _2601 & 3;
    int _2613 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _2615 = _2613 != 0;
    int _2617 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4194304;
    bool _2619 = _2617 != 0;
    int _2621 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _2623 = _2621 != 0;
    int _2625 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _2627 = _2625 != 0;
    int _2629 = _2605 >> 31;
    int _2631 = _2481 + _2611;
    int _2633 = ~_2072;
    int _2635 = _2633 + _2511;
    int _2637 = _2635 + 1;
    int _2639 = _2629 & 3;
    bool _2641 = !_2619;
    int _2643 = _2641 ? 0 : 1;
    int _2645 = _1595 * _2637;
    int _2647 = _2645 + _1902;
    int _2649 = _2605 & 3;
    bool _2651 = _2649 != 0;
    int _2653 = _2631 >> 2;
    int _2655 = _2605 + _2639;
    bool _2657 = !_2615;
    int _2659 = _2657 ? 0 : 1;
    int _2661 = _2651 ? 0 : 1;
    int _2663 = _2653 << 4;
    int _2665 = _2663 + 368;
    int _2667 = _2605 & 3;
    bool _2669 = _2667 != 0;
    bool _2671 = _2499 != 3;
    uint _2673 = uint(int(uint(_2665) >> uint(2)));
    uint _2675 = uint(int(uint(int(_2673)) >> uint(2)));
    int _2677 = int(_2673) & 3;
    float _2679 = (*spvDescriptorSet0.vp_c9)._m0[int(_2675)][_2677];
    int _2681 = int(_2673) + 1;
    uint _2683 = uint(int(uint(_2681) >> uint(2)));
    int _2685 = _2681 & 3;
    float _2687 = (*spvDescriptorSet0.vp_c9)._m0[int(_2683)][_2685];
    int _2689 = _2655 >> 2;
    bool _2691 = !_1655;
    int _2693 = _2691 ? _2647 : (-1);
    bool _2695 = uint(_2667) > 1u;
    int _2697 = _2689 << 4;
    int _2699 = _2697 + 512;
    bool _2701 = !_2669;
    int _2703 = _2701 ? 0 : 1;
    uint _2705 = uint(int(uint(_2699) >> uint(2)));
    uint _2707 = uint(int(uint(int(_2705)) >> uint(2)));
    int _2709 = int(_2705) & 3;
    float _2711 = (*spvDescriptorSet0.vp_c9)._m0[int(_2707)][_2709];
    int _2713 = int(_2705) + 1;
    uint _2715 = uint(int(uint(_2713) >> uint(2)));
    int _2717 = _2713 & 3;
    float _2719 = (*spvDescriptorSet0.vp_c9)._m0[int(_2715)][_2717];
    bool _2721 = _2667 != 3;
    int _2723 = int(_2432) + int(_2565);
    int _2725 = ~_2661;
    int _2727 = _2725 + 1;
    int _2729 = _2727 + 1;
    int _2731 = _2729;
    if (!_2695)
    {
        int _2733 = ~_2661;
        int _2735 = _2733 + 1;
        _2731 = _2735;
    }
    int _2737 = _2731;
    int _2739 = _2665 + 8;
    uint _2741 = uint(int(uint(_2739) >> uint(2)));
    uint _2743 = uint(int(uint(int(_2741)) >> uint(2)));
    int _2745 = int(_2741) & 3;
    float _2747 = (*spvDescriptorSet0.vp_c9)._m0[int(_2743)][_2745];
    int _2749 = int(_2741) + 1;
    uint _2751 = uint(int(uint(_2749) >> uint(2)));
    int _2753 = _2749 & 3;
    float _2755 = (*spvDescriptorSet0.vp_c9)._m0[int(_2751)][_2753];
    int _2757 = ~_1623;
    int _2759 = _2757 + 1;
    bool _2761 = uint(_2667) >= 2u;
    bool _2763 = !_2671;
    int _2765 = _2763 ? 0 : (-1);
    int _2767 = _2759 * _2723;
    int _2769 = _2767 + _1966;
    int _2771 = _2761 ? 0 : 1;
    int _2773 = _2699 + 8;
    uint _2775 = uint(int(uint(_2773) >> uint(2)));
    uint _2777 = uint(int(uint(int(_2775)) >> uint(2)));
    int _2779 = int(_2775) & 3;
    float _2781 = (*spvDescriptorSet0.vp_c9)._m0[int(_2777)][_2779];
    int _2783 = int(_2775) + 1;
    uint _2785 = uint(int(uint(_2783) >> uint(2)));
    int _2787 = _2783 & 3;
    float _2789 = (*spvDescriptorSet0.vp_c9)._m0[int(_2785)][_2787];
    int _2791 = ~_2771;
    int _2793 = _2791 + 1;
    int _2795 = _2793 + 1;
    int _2797 = _2795;
    if (_2721)
    {
        int _2799 = ~_2771;
        int _2801 = _2799 + 1;
        _2797 = _2801;
    }
    int _2803 = _2797;
    bool _2805 = _2667 != 3;
    bool _2807 = uint(_2769) >= uint(_1623);
    float _2809 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    int _2811 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y);
    bool _2813 = _2811 != 0;
    float _2815 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _2817 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    bool _2819 = !_2805;
    int _2821 = _2819 ? 0 : (-1);
    float _2823 = _2809 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    bool _2825 = _399 > 0.5;
    float _2827 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _2829 = _2815 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2831 = _2817 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    out.m_74.x = _2823;
    out.m_74.y = _2829;
    out.m_74.z = _2831;
    out.m_74.w = _2827;
    int _2833 = abs(_2583);
    float _2835 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    bool _2837 = !_2807;
    int _2839 = _2837 ? 0 : (-1);
    float _2841 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    bool _2843 = _401 > 0.5;
    float _2845 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _2847 = _2835 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    int _2849 = abs(_2737);
    float _2851 = _2845 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2853 = _2841 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    int _2855 = abs(_2589);
    float _2857 = trunc((*spvDescriptorSet0.vp_c9)._m0[80].z);
    int _2859 = int(_2857);
    int _2861 = ~_2833;
    int _2863 = _2861 + 1;
    int _2865 = _2863 + 1;
    out.m_76.x = _2847;
    out.m_76.y = _2851;
    out.m_76.z = _2853;
    int _2867 = abs(_2569);
    int _2869 = ~_2849;
    int _2871 = _2869 + 1;
    int _2873 = _2871 + 1;
    int _2875 = _2865 * as_type<int>(_2687);
    int _2877 = abs(_2703);
    float _2879 = trunc((*spvDescriptorSet0.vp_c9)._m0[85].z);
    int _2881 = int(_2879);
    int _2883 = ~_2867;
    int _2885 = _2883 + 1;
    int _2887 = _2885 + 1;
    int _2889 = _2873 * as_type<int>(_2719);
    int _2891 = ~_2877;
    int _2893 = _2891 + 1;
    int _2895 = _2893 + 1;
    int _2897 = ~_2723;
    int _2899 = _2897 + _2839;
    int _2901 = _2899 + 1;
    int _2903 = _2887 * as_type<int>(_2679);
    int _2905 = _2903 + _2875;
    int _2907 = abs(_2803);
    int _2909 = _2895 * as_type<int>(_2711);
    int _2911 = _2909 + _2889;
    int _2913 = _1623 * _2901;
    int _2915 = _2913 + _1966;
    float _2917 = float(uint(_2859));
    int _2919 = ~_2855;
    int _2921 = _2919 + 1;
    int _2923 = _2921 + 1;
    int _2925 = ~_2907;
    int _2927 = _2925 + 1;
    int _2929 = _2927 + 1;
    int _2931 = abs(_2765);
    int _2933 = _2923 * as_type<int>(_2747);
    int _2935 = _2933 + _2905;
    int _2937 = abs(_2659);
    int _2939 = _2929 * as_type<int>(_2781);
    int _2941 = _2939 + _2911;
    int _2943 = ~_2931;
    int _2945 = _2943 + 1;
    int _2947 = _2945 + 1;
    float _2949 = 1.0 / _2917;
    float _2951 = float(uint(_2881));
    float _2953 = _1387 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    int _2955 = abs(_2821);
    int _2957 = _2947 * as_type<int>(_2755);
    int _2959 = _2957 + _2935;
    int _2961 = ~_2937;
    int _2963 = _2961 + 1;
    int _2965 = _2963 + 1;
    int _2967 = abs(_2643);
    float _2969 = 1.0 / _2951;
    int _2971 = ~_2955;
    int _2973 = _2971 + 1;
    int _2975 = _2973 + 1;
    int _2977 = _2959 * _2965;
    int _2979 = abs(_2859);
    int _2981 = ~_2967;
    int _2983 = _2981 + 1;
    int _2985 = _2983 + 1;
    int _2987 = _2975 * as_type<int>(_2789);
    int _2989 = _2987 + _2941;
    int _2991 = _2693 * _2937;
    int _2993 = _2991 + _2977;
    int _2995 = abs(_2881);
    int _2997 = _2989 * _2985;
    bool _2999 = !_1870;
    int _3001 = _2999 ? _2915 : (-1);
    float _3003 = fma(_2483, _2483, 1.0);
    float _3005 = float(uint(_2979));
    float _3007 = float(uint(_2995));
    int _3009 = _3001 * _2967;
    int _3011 = _3009 + _2997;
    int _3013 = as_type<int>(_2949) + (-2);
    float _3015 = float(uint(_2993));
    float _3017 = 1.0 / _3005;
    float _3019 = -_333;
    int _3021 = _2825 ? as_type<int>(_3019) : as_type<int>(_333);
    float _3023 = -_277;
    int _3025 = _2591 ? as_type<int>(_3023) : as_type<int>(_277);
    float _3027 = -_277;
    int _3029 = _2843 ? as_type<int>(_3027) : as_type<int>(_277);
    float _3031 = float(uint(_3011));
    float _3033 = 1.0 / _3007;
    bool _3035 = !_2623;
    float _3037 = _3035 ? _333 : as_type<float>(_3021);
    bool _3039 = !_2813;
    float _3041 = _3039 ? _277 : as_type<float>(_3025);
    bool _3043 = !_2627;
    float _3045 = _3043 ? _277 : as_type<float>(_3029);
    int _3047 = abs(_2993);
    float _3049 = rsqrt(_3003);
    float _3051 = as_type<float>(_3013) * _3015;
    int _3053 = as_type<int>(_2969) + (-2);
    int _3055 = as_type<int>(_3017) + (-2);
    int _3057 = ~_2859;
    int _3059 = _3057 + 1;
    float _3061 = as_type<float>(_3053) * _3031;
    float _3063 = trunc(_3051);
    float _3065 = precise::max(_3063, 0.0);
    uint _3067 = uint(_3065);
    int _3069 = abs(_3011);
    int _3071 = as_type<int>(_3033) + (-2);
    float _3073 = float(uint(_3047));
    float _3075 = trunc(_3061);
    float _3077 = precise::max(_3075, 0.0);
    uint _3079 = uint(_3077);
    int _3081 = ~_2881;
    int _3083 = _3081 + 1;
    float _3085 = as_type<float>(_3055) * _3073;
    float _3087 = float(uint(_3069));
    float _3089 = -_1415;
    float _3091 = fma(_1425, _2953, _3089);
    float _3093 = -_3049;
    float _3095 = _1427 * _3093;
    float _3097 = _2483 * _3049;
    int _3099 = ~_2995;
    int _3101 = _3099 + 1;
    int _3103 = _3059 * int(_3067);
    int _3105 = _3103 + _2993;
    float _3107 = as_type<float>(_3071) * _3087;
    float _3109 = trunc(_3085);
    float _3111 = precise::max(_3109, 0.0);
    uint _3113 = uint(_3111);
    float _3115 = -_2483;
    float _3117 = fma(_1427, _3115, _3091);
    float _3119 = fma(_1415, _3097, _3095);
    float _3121 = float(uint(_3105));
    int _3123 = ~_2979;
    int _3125 = _3123 + 1;
    int _3127 = _3083 * int(_3079);
    int _3129 = _3127 + _3011;
    float _3131 = trunc(_3107);
    float _3133 = precise::max(_3131, 0.0);
    uint _3135 = uint(_3133);
    float _3137 = as_type<float>(_3013) * _3121;
    float _3139 = fma(_1439, _2953, _1409);
    float _3141 = float(uint(_3129));
    float _3143 = as_type<float>(_3053) * _3141;
    float _3145 = fma(_1429, _2953, _1407);
    float _3147 = -_3049;
    float _3149 = _1449 * _3147;
    float _3151 = -_2483;
    float _3153 = fma(_1449, _3151, _3139);
    float _3155 = trunc(_3137);
    float _3157 = precise::max(_3155, 0.0);
    uint _3159 = uint(_3157);
    int _3161 = _3125 * int(_3113);
    int _3163 = _3161 + _3047;
    float _3165 = -_2483;
    float _3167 = fma(_1435, _3165, _3145);
    float _3169 = -_3049;
    float _3171 = _1435 * _3169;
    int _3173 = _3101 * int(_3135);
    int _3175 = _3173 + _3069;
    float _3177 = _1429 * _325;
    float _3179 = float(uint(_3163));
    float _3181 = -_3097;
    float _3183 = fma(_1407, _3181, _3171);
    float _3185 = trunc(_3143);
    float _3187 = precise::max(_3185, 0.0);
    uint _3189 = uint(_3187);
    float _3191 = float(uint(_3175));
    float _3193 = _1429 * _329;
    float _3195 = as_type<float>(_3055) * _3179;
    float _3197 = _1429 * _315;
    float _3199 = fma(_1425, _287, _3177);
    float _3201 = as_type<float>(_3071) * _3191;
    float _3203 = -_3097;
    float _3205 = fma(_1409, _3203, _3149);
    float _3207 = fma(_1425, _283, _3197);
    float _3209 = fma(_1425, _297, _3193);
    float _3211 = trunc(_3201);
    float _3213 = precise::max(_3211, 0.0);
    uint _3215 = uint(_3213);
    float _3217 = fma(_1439, _341, _3199);
    float _3219 = fma(_1439, _337, _3207);
    float _3221 = fma(_1439, _345, _3209);
    float _3223 = _3167 * _325;
    float _3225 = _3167 * _329;
    float _3227 = _3183 * _325;
    float _3229 = _3183 * _315;
    float _3231 = trunc(_3195);
    float _3233 = precise::max(_3231, 0.0);
    uint _3235 = uint(_3233);
    float _3237 = _3183 * _329;
    int _3239 = int(_3079) + int(_3189);
    float _3241 = _3167 * _315;
    int _3243 = int(_3067) + int(_3159);
    out.m_78.x = _3217;
    out.m_78.y = _3219;
    out.m_78.z = _3221;
    int _3245 = ~_2859;
    int _3247 = _3245 + 1;
    float _3249 = -_2436;
    float _3251 = _3249 + 1.0;
    int _3253 = ~_2881;
    int _3255 = _3253 + 1;
    int _3257 = int(_3135) + int(_3215);
    int _3259 = _3247 * _3243;
    int _3261 = _3259 + _2993;
    int _3263 = ~_2995;
    int _3265 = _3263 + 1;
    int _3267 = _3255 * _3239;
    int _3269 = _3267 + _3011;
    int _3271 = ~_2979;
    int _3273 = _3271 + 1;
    bool _3275 = uint(_3261) >= uint(_2859);
    int _3277 = _3265 * _3257;
    int _3279 = _3277 + _3069;
    int _3281 = int(_3113) + int(_3235);
    float _3283 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    bool _3285 = !_3275;
    int _3287 = _3285 ? 0 : (-1);
    float _3289 = fma(_3119, _287, _3227);
    bool _3291 = uint(_3269) >= uint(_2881);
    int _3293 = _3273 * _3281;
    int _3295 = _3293 + _3047;
    int _3297 = ~_3243;
    int _3299 = _3297 + _3287;
    int _3301 = _3299 + 1;
    float _3303 = fma(_3119, _297, _3237);
    bool _3305 = uint(_3279) >= uint(_2995);
    float _3307 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    bool _3309 = uint(_3295) >= uint(_2979);
    int _3311 = _2859 * _3301;
    int _3313 = _3311 + _2993;
    bool _3315 = !_3291;
    int _3317 = _3315 ? 0 : (-1);
    float _3319 = fma(_3119, _283, _3229);
    bool _3321 = _2859 == 0;
    float _3323 = fma(_3205, _341, _3289);
    bool _3325 = _2859 == 0;
    float _3327 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    int _3329 = _2993 ^ _2859;
    float _3331 = fma(_3205, _337, _3319);
    int _3333 = _3011 ^ _2881;
    float _3335 = fma(_3117, _297, _3225);
    int _3337 = ~_3239;
    int _3339 = _3337 + _3317;
    int _3341 = _3339 + 1;
    bool _3343 = !_3309;
    int _3345 = _3343 ? 0 : (-1);
    float _3347 = _3307 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    bool _3349 = !_3305;
    int _3351 = _3349 ? 0 : (-1);
    int _3353 = _2881 * _3341;
    int _3355 = _3353 + _3011;
    uint _3357 = uint(int(uint(_3333) >> uint(31)));
    int _3359 = ~_3345;
    int _3361 = _3281 + _3359;
    int _3363 = _3361 + 1;
    int _3365 = ~_3351;
    int _3367 = _3257 + _3365;
    int _3369 = _3367 + 1;
    float _3371 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    int _3373 = ~int(_3357);
    int _3375 = _3373 + 1;
    uint _3377 = uint(int(uint(_3329) >> uint(31)));
    int _3379 = _3369 ^ _3375;
    int _3381 = ~int(_3377);
    int _3383 = _3381 + 1;
    bool _3385 = _2881 == 0;
    bool _3387 = _2881 == 0;
    float _3389 = _3327 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    int _3391 = ~_3375;
    int _3393 = _3391 + _3379;
    int _3395 = _3393 + 1;
    int _3397 = _3363 ^ _3383;
    bool _3399 = !_3385;
    int _3401 = _3399 ? _3355 : (-1);
    float _3403 = _2609 + (-0.5);
    bool _3405 = !_3387;
    int _3407 = _3405 ? _3395 : (-1);
    int _3409 = ~_3383;
    int _3411 = _3409 + _3397;
    int _3413 = _3411 + 1;
    float _3415 = _3283 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    bool _3417 = !_3321;
    int _3419 = _3417 ? _3313 : (-1);
    float _3421 = float(_3401);
    float _3423 = _3371 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _3425 = float(_3407);
    float _3427 = float(_3419);
    float _3429 = fma(_3347, _3421, _789);
    bool _3431 = !_3325;
    int _3433 = _3431 ? _3413 : (-1);
    float _3435 = -_773;
    float _3437 = fma(_3423, _3425, _3435);
    float _3439 = _3045 + 0.5;
    float _3441 = fma(_3415, _3427, _545);
    float _3443 = _3041 + 0.5;
    float _3445 = -_3423;
    float _3447 = fma(_3445, _3403, _3437);
    float _3449 = -_775;
    float _3451 = _3449 + 1.0;
    float _3453 = float(_3433);
    float _3455 = fma(_3415, _3443, _3441);
    float _3457 = fma(_3205, _345, _3303);
    float _3459 = fma(_2609, _3451, _3447);
    float _3461 = _2497 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _3463 = _2497 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _3465 = -_579;
    float _3467 = fma(_3389, _3453, _3465);
    out.m_80.x = _3323;
    out.m_80.y = _3331;
    out.m_80.z = _3457;
    float _3469 = fma(_1611, (*spvDescriptorSet0.vp_c8)._m0[11].x, _3461);
    float _3471 = _3037 + (-0.5);
    float _3473 = fma(_1611, (*spvDescriptorSet0.vp_c8)._m0[10].x, _3463);
    float _3475 = fma(_3347, _3439, _3429);
    float _3477 = fma(_1617, (*spvDescriptorSet0.vp_c8)._m0[11].z, _3469);
    float _3479 = -_3389;
    float _3481 = fma(_3479, _3471, _3467);
    float _3483 = fma(_1617, (*spvDescriptorSet0.vp_c8)._m0[10].z, _3473);
    float _3485 = -_805;
    float _3487 = _3485 + 1.0;
    float _3489 = -_645;
    float _3491 = _3489 + 1.0;
    float _3493 = -_807;
    float _3495 = _3493 + 1.0;
    float _3497 = _3483 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _3499 = _3477 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _3501 = -_3487;
    float _3503 = fma(_3041, _3501, _3455);
    float _3505 = -_3491;
    float _3507 = fma(_3045, _3505, _3475);
    float _3509 = fma(_3037, _3495, _3481);
    float _3511 = 1.0 / _3499;
    float _3513 = _3497 + _3499;
    float _3515 = fma(_3117, _287, _3223);
    float _3517 = fma(_3117, _283, _3241);
    out.m_82.x = _3503;
    out.m_82.y = _3509;
    out.m_82.z = _3507;
    out.m_82.w = _3459;
    float _3519 = fma(_3153, _345, _3335);
    float _3521 = fma(_3153, _341, _3515);
    float _3523 = fma(_3153, _337, _3517);
    bool _3525 = _2120 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _3527 = isnan(_2120);
    bool _3529 = _3525 || _3527;
    bool _3531 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _3533 = _3529 || _3531;
    out.m_84.x = _3521;
    out.m_84.y = _3523;
    out.m_84.z = _3519;
    float _3535 = _3513 * _3511;
    float _3537 = _3535 * 0.5;
    float _3539 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _3541 = fma(_3537, (*spvDescriptorSet0.vp_c8)._m0[30].w, _3539);
    float _3543 = in.m_66.x;
    float _3545 = 1.0 / _3541;
    float _3547 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _3549 = _3545 * _3547;
    float _3551 = abs(_3549);
    float _3553 = log2(_3551);
    bool _3555 = _3549 <= 8000.0;
    bool _3557 = isnan(_3549);
    bool _3559 = _3555 || _3557;
    bool _3561 = isnan(8000.0);
    bool _3563 = _3559 || _3561;
    float _3565 = float(_3563);
    float _3567 = _3553 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _3569 = _2314 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _3571 = fma(_2366, (*spvDescriptorSet0.vp_c8)._m0[6].x, _3569);
    float _3573 = exp2(_3567);
    float _3575 = fma(_2310, (*spvDescriptorSet0.vp_c8)._m0[6].z, _3571);
    float _3577 = fma(_3573, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _3579 = precise::clamp(_3577, 0.0, 1.0);
    float _3581 = fma(_2312, (*spvDescriptorSet0.vp_c8)._m0[6].w, _3575);
    float _3583 = fma(_3579, -2.0, 3.0);
    float _3585 = _3579 * _3579;
    out.gl_Position.x = _2424;
    out.gl_Position.y = _2426;
    out.gl_Position.z = _3581;
    out.gl_Position.w = _2398;
    float _3587 = _3585 * _3583;
    float _3589 = -_3587;
    float _3591 = _3589 + 1.0;
    float _3593 = fma(_3591, (*spvDescriptorSet0.vp_c15)._m0[654].w, _3587);
    float _3595 = _3581 + _2398;
    float _3597 = _3565 * _3593;
    float _3599 = _2553 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _3601 = _3595 * 0.5;
    float _3603 = _2398;
    float _3605 = _3601;
    float _3607 = _3581;
    if (!_3533)
    {
        _2575 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _3609 = _2575;
    float _3611 = _3597 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _3613 = _3599 * _2456;
    float _3615 = -_3599;
    float _3617 = _3615 + 1.0;
    out.m_86.z = _3601;
    out.m_86.w = _2398;
    float _3619 = _3251 * _3611;
    float _3621 = precise::clamp(_3619, 0.0, 1.0);
    float _3623 = _2467 * _3613;
    float _3625 = _2477 * _3613;
    float _3627 = _2467 * _3617;
    float _3629 = -_3621;
    float _3631 = fma(_3629, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _3633 = fma(_2473, _3623, _2461);
    float _3635 = fma(_2475, _3623, _2463);
    float _3637 = fma(_2467, _3625, _2465);
    float _3639 = _3631 * _3543;
    float _3641 = _3617;
    float _3643 = _3609;
    float _3645 = _3609;
    if (!_3533)
    {
        _3603 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _3647 = _3603;
    float _3649 = _3647;
    float _3651 = _3647;
    if (!_3533)
    {
        _3605 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _3653 = _3605;
    float _3655 = _3639 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    out.m_88.x = _3633;
    out.m_88.y = _3635;
    out.m_88.z = _3637;
    out.m_88.w = _3627;
    float _3657 = _3653;
    float _3659 = _3653;
    if (!_3533)
    {
        _3607 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _3661 = _3607;
    float _3663 = _3661;
    float _3665 = _3661;
    if (!_3533)
    {
        _2577 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _3667 = _2577;
    out.m_90.x = _3655;
    float _3669 = _3667;
    float _3671 = _3667;
    if (!_3533)
    {
        _3641 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _3673 = _3641;
    bool _3675 = !_3533;
    float _3677 = _3673;
    float _3679 = _3673;
    if (!_3675)
    {
        bool _3681 = _2120 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _3683 = isnan(_2120);
        bool _3685 = _3681 || _3683;
        bool _3687 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _3689 = _3685 || _3687;
        if (!_3689)
        {
            float _3691 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _3693 = _2120 + _3691;
            float _3695 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _3697 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _3695;
            float _3699 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _3701 = _3699 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _3703 = 1.0 / _3697;
            float _3705 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _3707 = _3705 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _3709 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _3711 = _3709 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _3713 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _3715 = _3713 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _3717 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _3719 = _3717 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _3721 = _3693 * _3703;
            float _3723 = precise::clamp(_3721, 0.0, 1.0);
            float _3725 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _3727 = _3725 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _3729 = fma(_3723, _3701, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _3731 = fma(_3723, _3727, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _3733 = fma(_3723, _3707, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _3735 = fma(_3723, _3711, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _3737 = fma(_3723, _3715, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _3739 = fma(_3723, _3719, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _3659 = _3733;
            _3671 = _3737;
            _3651 = _3729;
            _3665 = _3735;
            _3645 = _3731;
            _3679 = _3739;
            _3741 = true;
        }
        else
        {
            bool _3743 = _2120 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _3745 = isnan(_2120);
            bool _3747 = _3743 || _3745;
            bool _3749 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _3751 = _3747 || _3749;
            if (!_3751)
            {
                _3649 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _3753 = _3649;
            _3651 = _3753;
            if (!_3751)
            {
                _3657 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _3755 = _3657;
            _3659 = _3755;
            if (!_3751)
            {
                _3643 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _3757 = _3643;
            _3645 = _3757;
            if (!_3751)
            {
                _3663 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _3759 = _3663;
            _3665 = _3759;
            if (!_3751)
            {
                _3669 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _3761 = _3669;
            _3671 = _3761;
            if (!_3751)
            {
                _3677 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _3763 = _3677;
            bool _3765 = !_3751;
            _3679 = _3763;
            if (!_3765)
            {
                bool _3767 = _2120 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _3769 = isnan(_2120);
                bool _3771 = _3767 || _3769;
                bool _3773 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _3775 = _3771 || _3773;
                if (!_3775)
                {
                    float _3777 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _3779 = _2120 + _3777;
                    float _3781 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _3783 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _3781;
                    float _3785 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _3787 = _3785 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _3789 = 1.0 / _3783;
                    float _3791 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _3793 = _3791 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _3795 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _3797 = _3795 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _3799 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _3801 = _3799 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _3803 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _3805 = _3803 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _3807 = _3779 * _3789;
                    float _3809 = precise::clamp(_3807, 0.0, 1.0);
                    float _3811 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _3813 = _3811 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _3815 = fma(_3809, _3787, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _3817 = fma(_3809, _3813, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _3819 = fma(_3809, _3793, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _3821 = fma(_3809, _3797, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _3823 = fma(_3809, _3801, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _3825 = fma(_3809, _3805, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _3659 = _3819;
                    _3671 = _3823;
                    _3651 = _3815;
                    _3665 = _3821;
                    _3645 = _3817;
                    _3679 = _3825;
                    _3741 = true;
                }
                else
                {
                    _3659 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _3671 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _3651 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _3665 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _3645 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _3679 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _3741 = false;
    float _3827 = _3659;
    float _3829 = _3671;
    float _3831 = _3651;
    float _3833 = _3665;
    float _3835 = _3645;
    float _3837 = _3679;
    float _3839 = fma(_3523, -0.5, 0.5);
    float _3841 = precise::clamp(_3839, 0.0, 1.0);
    float _3843 = -_3827;
    float _3845 = _3843 + _3829;
    float _3847 = -_3831;
    float _3849 = _3847 + _3833;
    float _3851 = -_3835;
    float _3853 = _3851 + _3837;
    bool _3855 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _3857 = fma(_3841, _3845, _3827);
    float _3859 = fma(_3841, _3849, _3831);
    float _3861 = fma(_3841, _3853, _3835);
    float _3863 = _3857 * 0.586610972881317138671875;
    out.m_51.x = 1.0;
    float _3865 = fma(_3859, 0.298911988735198974609375, _3863);
    float _3867 = fma(_3861, 0.114477999508380889892578125, _3865);
    out.m_92.x = 0.0;
    float _3869 = -_3867;
    float _3871 = _3859 + _3869;
    float _3873 = -_3867;
    float _3875 = _3857 + _3873;
    float _3877 = -_3867;
    float _3879 = _3861 + _3877;
    float _3881 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _3883 = fma(_3871, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3867);
    float _3885 = fma(_3875, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3867);
    float _3887 = fma(_3879, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3867);
    out.m_90.w = _3881;
    out.m_94.x = _3883;
    out.m_94.y = _3885;
    out.m_94.z = _3887;
    if (!_3855)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _3889 = -_2102;
    float _3891 = _3889 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
    float _3893 = -_1603;
    float _3895 = _3893 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
    float _3897 = -_2098;
    float _3899 = _3897 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
    float _3901 = _3891 * _3891;
    float _3903 = fma(_3895, _3895, _3901);
    float _3905 = fma(_3899, _3899, _3903);
    float _3907 = sqrt(_3905);
    float _3909 = rsqrt(_3905);
    float _3911 = -_3907;
    float _3913 = _3911 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _3915 = _3913 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
    float _3917 = precise::clamp(_3915, 0.0, 1.0);
    float _3919 = _3895 * _3909;
    float _3921 = _3891 * _3909;
    float _3923 = abs(_3917);
    float _3925 = log2(_3923);
    float _3927 = _3899 * _3909;
    float _3929 = _3919 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
    float _3931 = _3523 * _3921;
    float _3933 = -_3921;
    float _3935 = -_3929;
    float _3937 = fma(_3933, (*spvDescriptorSet0.vp_c15)._m0[656].y, _3935);
    float _3939 = fma(_3521, _3919, _3931);
    float _3941 = -_3927;
    float _3943 = fma(_3941, (*spvDescriptorSet0.vp_c15)._m0[656].z, _3937);
    float _3945 = fma(_3519, _3927, _3939);
    float _3947 = precise::clamp(_3945, 0.0, 1.0);
    float _3949 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
    float _3951 = _3943 + _3949;
    float _3953 = _3925 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
    float _3955 = _3951 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
    float _3957 = precise::clamp(_3955, 0.0, 1.0);
    float _3959 = exp2(_3953);
    float _3961 = _3959 * _3957;
    float _3963 = _3947 * _3961;
    float _3965 = _3963 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
    float _3967 = _3963 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
    float _3969 = _3963 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
    out.m_92.x = _3965;
    out.m_92.y = _3967;
    out.m_92.z = _3969;
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
    bool _3741 = false;
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
        float _4026 = as_type<float>(_129);
        out.gl_Position.z = _4026;
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
        float _4095 = as_type<float>(_167);
        out.gl_Position.z = _4095;
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
    int _219 = as_type<int>(_185);
    if (_211)
    {
        float _221 = rsqrt(_201);
        _217 = _221;
    }
    float _223 = _217;
    float _225 = 0.0;
    float _227 = 0.0;
    if (!_211)
    {
        _225 = 0.0;
        _227 = 0.0;
    }
    float _229 = _225;
    float _231 = _227;
    float _233 = 0.0;
    float _235 = _231;
    float _237 = _229;
    if (!_211)
    {
        _233 = 0.0;
    }
    float _239 = _233;
    bool _241 = _213 > 0.0;
    float _243 = _213;
    float _245 = _239;
    if (_215)
    {
        float _247 = rsqrt(_203);
        _243 = _247;
    }
    float _249 = _243;
    int _251 = as_type<int>(_187) & 1;
    bool _253 = _251 != 0;
    int _255 = as_type<int>(_187) & 2;
    bool _257 = _255 != 0;
    float _259 = 0.0;
    float _261 = 0.0;
    if (!_215)
    {
        _259 = 0.0;
        _261 = 0.0;
    }
    float _263 = _259;
    float _265 = _261;
    float _267 = 0.0;
    float _269 = _265;
    float _271 = _263;
    if (!_215)
    {
        _267 = 0.0;
    }
    float _273 = _267;
    bool _275 = !_253;
    float _277 = _275 ? (-0.5) : 0.5;
    float _279 = _273;
    if (_211)
    {
        float _281 = _223 * _169;
        _235 = _281;
    }
    float _283 = _235;
    if (_211)
    {
        float _285 = _223 * _175;
        _237 = _285;
    }
    float _287 = _237;
    float _289 = _209;
    if (_241)
    {
        float _291 = rsqrt(_205);
        _289 = _291;
    }
    float _293 = _289;
    if (_211)
    {
        float _295 = _223 * _181;
        _245 = _295;
    }
    float _297 = _245;
    bool _299 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _301 = 0.0;
    if (!_241)
    {
        _301 = 0.0;
    }
    float _303 = _301;
    float _305 = 0.0;
    float _307 = _303;
    if (!_241)
    {
        _305 = 0.0;
    }
    float _309 = _305;
    float _311 = _309;
    if (_215)
    {
        float _313 = _249 * _171;
        _269 = _313;
    }
    float _315 = _269;
    float _317 = 0.0;
    if (!_241)
    {
        _317 = 0.0;
    }
    float _319 = _317;
    float _321 = _319;
    if (_215)
    {
        float _323 = _249 * _177;
        _271 = _323;
    }
    float _325 = _271;
    if (_215)
    {
        float _327 = _249 * _183;
        _279 = _327;
    }
    float _329 = _279;
    bool _331 = !_257;
    float _333 = _331 ? (-0.5) : 0.5;
    if (_241)
    {
        float _335 = _293 * _173;
        _307 = _335;
    }
    float _337 = _307;
    if (_241)
    {
        float _339 = _293 * _179;
        _311 = _339;
    }
    float _341 = _311;
    if (_241)
    {
        float _343 = _293 * _185;
        _321 = _343;
    }
    float _345 = _321;
    bool _347 = !_299;
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
    float _383 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
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
    float _411 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _413 = _411 + (*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _415 = -(*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _417 = (*spvDescriptorSet0.vp_c9)._m0[148].w + _415;
    float _419 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _421 = _375 + _419;
    float _423 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _425 = _375 + _423;
    float _427 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _429 = _375 + _427;
    float _431 = 1.0 / _407;
    float _433 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    bool _435 = _375 >= (*spvDescriptorSet0.vp_c9)._m0[148].w;
    bool _437 = isnan(_375);
    bool _439 = _435 || _437;
    bool _441 = isnan((*spvDescriptorSet0.vp_c9)._m0[148].w);
    bool _443 = _439 || _441;
    float _445 = float(_443);
    float _447 = in.m_59.w;
    bool _449 = _375 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _451 = isnan(_375);
    bool _453 = _449 || _451;
    bool _455 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _457 = _453 || _455;
    float _459 = float(_457);
    float _461 = _183 * _379;
    float _463 = _177 * _379;
    float _465 = 1.0 / _395;
    float _467 = -(*spvDescriptorSet0.vp_c9)._m0[149].w;
    float _469 = (*spvDescriptorSet0.vp_c9)._m0[150].w + _467;
    float _471 = _379 + _387;
    float _473 = fma(_181, _377, _461);
    float _475 = fma(_175, _377, _463);
    float _477 = _397 * 2.0;
    int _479 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _481 = _479 != 0;
    float _483 = 1.0 / _413;
    float _485 = -(*spvDescriptorSet0.vp_c9)._m0[148].w;
    float _487 = _485 + (*spvDescriptorSet0.vp_c9)._m0[149].w;
    float _489 = fma(_185, _381, _473);
    float _491 = _397 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _493 = fma(_179, _381, _475);
    float _495 = float(_113);
    float _497 = _385 * _431;
    float _499 = -_433;
    float _501 = fma(_491, 2.0, _499);
    float _503 = 1.0 / _417;
    float _505 = -(*spvDescriptorSet0.vp_c9)._m0[149].w;
    float _507 = _375 + _505;
    float _509 = -(*spvDescriptorSet0.vp_c9)._m0[148].w;
    float _511 = _375 + _509;
    if (_481)
    {
        _219 = 0;
    }
    int _513 = _219;
    float _515 = _421 * _409;
    int _517 = _513;
    if (!_481)
    {
        _517 = 1;
    }
    int _519 = _517;
    float _521 = 1.0 / _469;
    float _523 = _399 * 2.0;
    float _525 = _425 * _465;
    bool _527 = _519 != 1;
    float _529 = -(*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _531 = _375 + _529;
    float _533 = _429 * _483;
    float _535 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _537 = 1.0 / _487;
    float _539 = _399 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _541 = _531 * _503;
    float _543 = -_147;
    float _545 = fma(_543, (*spvDescriptorSet0.vp_c9)._m0[76].x, _501);
    float _547 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _549 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _547;
    float _551 = floor(_523);
    float _553 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _555 = _401 * 2.0;
    float _557 = as_type<float>(_519);
    if (!_527)
    {
        _557 = _399;
    }
    float _559 = _557;
    float _561 = _507 * _521;
    float _563 = fma(_539, -2.0, _553);
    float _565 = _559;
    if (_527)
    {
        _565 = _397;
    }
    float _567 = _565;
    float _569 = fma(_549, _515, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _571 = floor(_477);
    float _573 = _511 * _537;
    float _575 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _577 = _575 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _579 = fma(_147, (*spvDescriptorSet0.vp_c9)._m0[76].y, _563);
    float _581 = _401 + _397;
    float _583 = fma(_577, _525, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _585 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _587 = int(_585);
    bool _589 = _551 > 0.0;
    float _591 = in.m_57.w;
    bool _593 = _551 >= 0.0;
    bool _595 = isnan(_551);
    bool _597 = _593 || _595;
    bool _599 = isnan(0.0);
    bool _601 = _597 || _599;
    float _603 = -(*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _605 = (*spvDescriptorSet0.vp_c9)._m0[148].y + _603;
    float _607 = _489 + _447;
    int _609 = _601 ? 0 : 1;
    float _611 = floor(_555);
    bool _613 = _571 > 0.0;
    float _615 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    bool _617 = _571 >= 0.0;
    bool _619 = isnan(_571);
    bool _621 = _617 || _619;
    bool _623 = isnan(0.0);
    bool _625 = _621 || _623;
    float _627 = _477 + (-1.0);
    int _629 = ~_609;
    int _631 = _629 + 1;
    int _633 = _631 + 1;
    float _635 = fma(_567, (*spvDescriptorSet0.vp_c9)._m0[83].z, _615);
    int _637 = _625 ? 0 : 1;
    float _639 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _641 = log2(_639);
    float _643 = float(_587);
    float _645 = fma(_147, (*spvDescriptorSet0.vp_c9)._m0[82].z, _635);
    float _647 = as_type<float>(_587);
    int _649 = _633;
    float _651 = _615;
    float _653 = _567;
    if (!_527)
    {
        _647 = _399;
    }
    float _655 = _647;
    float _657 = _655;
    if (!_589)
    {
        int _659 = ~_609;
        int _661 = _659 + 1;
        _649 = _661;
    }
    int _663 = _649;
    if (!_527)
    {
        _651 = _401;
    }
    float _665 = _651;
    float _667 = 1.0 / _643;
    float _669 = _665;
    if (_527)
    {
        _657 = _397;
    }
    float _671 = _657;
    float _673 = _493 + _591;
    if (_527)
    {
        _669 = _399;
    }
    float _675 = _669;
    int _677 = ~_637;
    int _679 = _677 + 1;
    int _681 = _679 + 1;
    float _683 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    int _685 = _681;
    if (!_613)
    {
        int _687 = ~_637;
        int _689 = _687 + 1;
        _685 = _689;
    }
    int _691 = _685;
    float _693 = _671 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _695 = _675 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _697 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].y);
    int _699 = int(_697);
    if (!_527)
    {
        _653 = _401;
    }
    float _701 = _653;
    float _703 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _705 = _701;
    if (_527)
    {
        _705 = _399;
    }
    float _707 = _705;
    float _709 = fma(_695, -2.0, _683);
    bool _711 = _611 >= 0.0;
    bool _713 = isnan(_611);
    bool _715 = _711 || _713;
    bool _717 = isnan(0.0);
    bool _719 = _715 || _717;
    float _721 = -_703;
    float _723 = fma(_693, 2.0, _721);
    bool _725 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _727 = isnan(0.0);
    bool _729 = _725 || _727;
    bool _731 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _733 = _729 || _731;
    float _735 = fma(_707, (*spvDescriptorSet0.vp_c9)._m0[83].w, _535);
    float _737 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _739 = 1.0 + _737;
    bool _741 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _743 = isnan(1.0);
    bool _745 = _741 || _743;
    bool _747 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _749 = _745 || _747;
    float _751 = _641 * _147;
    float _753 = 1.0 / _739;
    int _755 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _757 = _755 != 0;
    int _759 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _761 = _759 != 0;
    int _763 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _765 = _763 != 0;
    float _767 = _667 * _147;
    float _769 = float(_699);
    float _771 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _773 = fma(_147, (*spvDescriptorSet0.vp_c9)._m0[81].y, _709);
    float _775 = fma(_147, (*spvDescriptorSet0.vp_c9)._m0[82].w, _735);
    float _777 = exp2(_751);
    bool _779 = !_761;
    int _781 = _779 ? 0 : 1;
    float _783 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    bool _785 = _611 > 0.0;
    float _787 = -_147;
    float _789 = fma(_787, (*spvDescriptorSet0.vp_c9)._m0[81].x, _723);
    bool _791 = !_765;
    int _793 = _791 ? 0 : 1;
    float _795 = fma(_397, (*spvDescriptorSet0.vp_c9)._m0[78].z, _783);
    float _797 = float(_663);
    float _799 = 1.0 / _495;
    float _801 = fma(_399, (*spvDescriptorSet0.vp_c9)._m0[78].w, _771);
    float _803 = _397 + _399;
    float _805 = fma(_147, (*spvDescriptorSet0.vp_c9)._m0[77].z, _795);
    float _807 = fma(_147, (*spvDescriptorSet0.vp_c9)._m0[77].w, _801);
    int _809 = _719 ? 0 : 1;
    float _811 = _803 + (-1.0);
    float _813 = 1.0 / _769;
    float _815 = -_777;
    float _817 = _815 + 1.0;
    int _819 = ~_809;
    int _821 = _819 + 1;
    int _823 = _821 + 1;
    float _825 = fma(_811, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    int _827 = _823;
    if (!_785)
    {
        int _829 = ~_809;
        int _831 = _829 + 1;
        _827 = _831;
    }
    int _833 = _827;
    float _835 = _401 + _399;
    float _837 = _733 ? _817 : 0.0;
    float _839 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[201].y;
    float _841 = _835 + (-1.0);
    float _843 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _845 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _843;
    float _847 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _849 = _847 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _851 = _799 * _147;
    float _853 = fma(_841, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _855 = fma(_845, _515, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _857 = fma(_849, _525, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    bool _859 = _375 >= (*spvDescriptorSet0.vp_c9)._m0[150].w;
    bool _861 = isnan(_375);
    bool _863 = _859 || _861;
    bool _865 = isnan((*spvDescriptorSet0.vp_c9)._m0[150].w);
    bool _867 = _863 || _865;
    float _869 = float(_867);
    float _871 = _813 * _147;
    bool _873 = _375 >= (*spvDescriptorSet0.vp_c9)._m0[149].w;
    bool _875 = isnan(_375);
    bool _877 = _873 || _875;
    bool _879 = isnan((*spvDescriptorSet0.vp_c9)._m0[149].w);
    bool _881 = _877 || _879;
    float _883 = float(_881);
    float _885 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _887 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _885;
    if (_749)
    {
        float _889 = _837 * _753;
        _151 = _889;
    }
    float _891 = _151;
    float _893 = -_869;
    float _895 = _893 + 1.0;
    float _897 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _899 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _897;
    float _901 = fma(_887, _497, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _903 = -_883;
    float _905 = _903 + 1.0;
    float _907 = _883 * _895;
    float _909 = -(*spvDescriptorSet0.vp_c9)._m0[146].x;
    float _911 = _909 + (*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _913 = fma(_899, _497, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _915 = -(*spvDescriptorSet0.vp_c9)._m0[146].y;
    float _917 = _915 + (*spvDescriptorSet0.vp_c9)._m0[147].y;
    bool _919 = _375 >= (*spvDescriptorSet0.vp_c9)._m0[147].w;
    bool _921 = isnan(_375);
    bool _923 = _919 || _921;
    bool _925 = isnan((*spvDescriptorSet0.vp_c9)._m0[147].w);
    bool _927 = _923 || _925;
    float _929 = float(_927);
    float _931 = _445 * _905;
    float _933 = fma(_911, _533, (*spvDescriptorSet0.vp_c9)._m0[146].x);
    float _935 = -_445;
    float _937 = _935 + 1.0;
    float _939 = fma(_917, _533, (*spvDescriptorSet0.vp_c9)._m0[146].y);
    bool _941 = _375 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _943 = isnan(_375);
    bool _945 = _941 || _943;
    bool _947 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _949 = _945 || _947;
    float _951 = float(_949);
    float _953 = -_929;
    float _955 = _953 + 1.0;
    float _957 = _929 * _937;
    bool _959 = _375 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _961 = isnan(_375);
    bool _963 = _959 || _961;
    bool _965 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _967 = _963 || _965;
    float _969 = float(_967);
    float _971 = _581 + (-1.0);
    bool _973 = _375 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _975 = isnan(_375);
    bool _977 = _973 || _975;
    bool _979 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _981 = _977 || _979;
    float _983 = float(_981);
    float _985 = _951 * _955;
    float _987 = -_951;
    float _989 = _987 + 1.0;
    int _991 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 256;
    bool _993 = _991 != 0;
    int _995 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 512;
    bool _997 = _995 != 0;
    int _999 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1024;
    bool _1001 = _999 != 0;
    int _1003 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2048;
    bool _1005 = _1003 != 0;
    float _1007 = -_969;
    float _1009 = _1007 + 1.0;
    float _1011 = -_983;
    float _1013 = _1011 + 1.0;
    float _1015 = _983 * _989;
    bool _1017 = !_757;
    int _1019 = _1017 ? 0 : 1;
    float _1021 = -(*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _1023 = (*spvDescriptorSet0.vp_c9)._m0[148].x + _1021;
    int _1025 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _1027 = _1025 != 0;
    int _1029 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _1031 = _1029 != 0;
    int _1033 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _1035 = _1033 != 0;
    float _1037 = _969 * _1013;
    float _1039 = fma(_605, _541, (*spvDescriptorSet0.vp_c9)._m0[147].y);
    float _1041 = fma(_1023, _541, (*spvDescriptorSet0.vp_c9)._m0[147].x);
    float _1043 = -(*spvDescriptorSet0.vp_c9)._m0[148].x;
    float _1045 = _1043 + (*spvDescriptorSet0.vp_c9)._m0[149].x;
    float _1047 = _459 * _1009;
    bool _1049 = !_1027;
    int _1051 = _1049 ? 0 : 1;
    float _1053 = -_459;
    float _1055 = _1053 + 1.0;
    float _1057 = -(*spvDescriptorSet0.vp_c9)._m0[148].y;
    float _1059 = _1057 + (*spvDescriptorSet0.vp_c9)._m0[149].y;
    float _1061 = _569 * _1047;
    int _1063 = abs(_1051);
    float _1065 = fma(_1045, _573, (*spvDescriptorSet0.vp_c9)._m0[148].x);
    float _1067 = fma(_1059, _573, (*spvDescriptorSet0.vp_c9)._m0[148].y);
    float _1069 = _891 + (*spvDescriptorSet0.vp_c9)._m0[202].y;
    float _1071 = _855 * _1047;
    float _1073 = fma(_1055, (*spvDescriptorSet0.vp_c9)._m0[143].x, _1061);
    float _1075 = float(_1063);
    float _1077 = _1069 * _839;
    float _1079 = float(_833);
    float _1081 = fma(_1055, (*spvDescriptorSet0.vp_c9)._m0[143].y, _1071);
    float _1083 = fma(_583, _1037, _1073);
    float _1085 = fma(_397, (*spvDescriptorSet0.vp_c9)._m0[203].y, _1077);
    bool _1087 = !_1031;
    int _1089 = _1087 ? 0 : 1;
    float _1091 = fma(_857, _1037, _1081);
    float _1093 = _1075 * _1079;
    float _1095 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1097 = _471 + _1095;
    float _1099 = in.m_68.x;
    float _1101 = in.m_68.y;
    float _1103 = in.m_68.z;
    float _1105 = fma(_901, _1015, _1083);
    bool _1107 = !_1035;
    int _1109 = _1107 ? 0 : 1;
    float _1111 = _1097 * _1097;
    float _1113 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1115 = _673 + _1113;
    float _1117 = floor(_1085);
    int _1119 = abs(_1109);
    float _1121 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1123 = _607 + _1121;
    float _1125 = fma(_1115, _1115, _1111);
    float _1127 = _1085 + 0.25;
    int _1129 = abs(_1089);
    float _1131 = fma(_913, _1015, _1091);
    float _1133 = fma(_1123, _1123, _1125);
    float _1135 = floor(_1127);
    float _1137 = _1093 * (-2.0);
    float _1139 = float(_691);
    float _1141 = fma(_933, _985, _1105);
    float _1143 = float(_1119);
    float _1145 = fma(_971, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    int _1147 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 32768;
    bool _1149 = _1147 != 0;
    float _1151 = rsqrt(_1133);
    bool _1153 = !_997;
    int _1155 = _1153 ? 0 : 1;
    float _1157 = _1143 * _797;
    bool _1159 = !_993;
    int _1161 = _1159 ? 0 : 1;
    float _1163 = _397 + (-0.5);
    int _1165 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 65536;
    bool _1167 = _1165 != 0;
    int _1169 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 131072;
    bool _1171 = _1169 != 0;
    float _1173 = fma(_1137, _1099, _1099);
    float _1175 = -_1117;
    float _1177 = _1085 + _1175;
    float _1179 = _1085 * 6.283185482025146484375;
    float _1181 = -_1135;
    float _1183 = _1127 + _1181;
    float _1185 = fma(_1163, (*spvDescriptorSet0.vp_c9)._m0[196].x, _1173);
    bool _1187 = !_1167;
    int _1189 = _1187 ? 0 : 1;
    float _1191 = _1179 * 0.15915493667125701904296875;
    bool _1193 = _1177 >= 0.5;
    bool _1195 = isnan(_1177);
    bool _1197 = _1193 || _1195;
    bool _1199 = isnan(0.5);
    bool _1201 = _1197 || _1199;
    float _1203 = fma(_825, _1137, _825);
    int _1205 = abs(_1189);
    float _1207 = _1097 * _1151;
    bool _1209 = _1183 > 0.5;
    float _1211 = _1191 * 6.283185482025146484375;
    float _1213 = sin(_1211);
    bool _1215 = !_1149;
    int _1217 = _1215 ? 0 : 1;
    float _1219 = -_1207;
    float _1221 = fma(_1219, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1097);
    float _1223 = _1115 * _1151;
    bool _1225 = !_1201;
    float _1227 = _1225 ? 0.5 : (-0.5);
    float _1229 = _1157 * (-2.0);
    int _1231 = abs(_1217);
    float _1233 = _1221 * _1221;
    float _1235 = float(_1205);
    float _1237 = -_1223;
    float _1239 = fma(_1237, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1115);
    float _1241 = _1227 * (*spvDescriptorSet0.vp_c9)._m0[200].y;
    float _1243 = _1241 * 2.0;
    float _1245 = _1183;
    if (_1209)
    {
        float _1247 = -_1183;
        float _1249 = _1247 + 1.0;
        _1245 = _1249;
    }
    float _1251 = _1245;
    bool _1253 = !_1171;
    int _1255 = _1253 ? 0 : 1;
    float _1257 = fma(_1239, _1239, _1233);
    float _1259 = _1235 * _1243;
    float _1261 = float(_1231);
    float _1263 = _1123 * _1151;
    int _1265 = abs(_1255);
    float _1267 = _1213 * (*spvDescriptorSet0.vp_c9)._m0[200].y;
    float _1269 = fma(_1251, 4.0, -1.0);
    float _1271 = -_1263;
    float _1273 = fma(_1271, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1123);
    float _1275 = float(_1265);
    float _1277 = fma(_1261, _1267, _1259);
    float _1279 = float(_1129);
    float _1281 = _1269 * (*spvDescriptorSet0.vp_c9)._m0[200].y;
    float _1283 = fma(_1203, _891, _1185);
    float _1285 = fma(_1145, _1229, _1145);
    float _1287 = fma(_1229, _1103, _1103);
    float _1289 = fma(_1275, _1281, _1277);
    float _1291 = _1279 * _1139;
    float _1293 = _401 + (-0.5);
    float _1295 = fma(_939, _985, _1131);
    float _1297 = fma(_1289, 3.1415927410125732421875, _1101);
    float _1299 = _1291 * (-2.0);
    float _1301 = fma(_1293, (*spvDescriptorSet0.vp_c9)._m0[196].z, _1287);
    float _1303 = _399 + (-0.5);
    float _1305 = fma(_1297, _1299, _1297);
    float _1307 = fma(_853, _1299, _853);
    float _1309 = fma(_1273, _1273, _1257);
    float _1311 = fma(_1303, (*spvDescriptorSet0.vp_c9)._m0[196].y, _1305);
    float _1313 = fma(_1041, _957, _1141);
    float _1315 = in.m_70.x;
    float _1317 = in.m_70.y;
    float _1319 = -(*spvDescriptorSet0.vp_c9)._m0[149].y;
    float _1321 = (*spvDescriptorSet0.vp_c9)._m0[150].y + _1319;
    float _1323 = fma(_1307, _891, _1311);
    float _1325 = fma(_1039, _957, _1295);
    float _1327 = -(*spvDescriptorSet0.vp_c9)._m0[149].x;
    float _1329 = (*spvDescriptorSet0.vp_c9)._m0[150].x + _1327;
    float _1331 = fma(_1321, _561, (*spvDescriptorSet0.vp_c9)._m0[149].y);
    float _1333 = sqrt(_1309);
    float _1335 = fma(_1067, _931, _1325);
    float _1337 = fma(_1329, _561, (*spvDescriptorSet0.vp_c9)._m0[149].x);
    float _1339 = fma(_1065, _931, _1313);
    float _1341 = fma(_1285, _891, _1301);
    float _1343 = fma(_1331, _907, _1335);
    float _1345 = _1283 * 0.15915493667125701904296875;
    float _1347 = fma(_1337, _907, _1339);
    float _1349 = _1341 * 0.15915493667125701904296875;
    float _1351 = _1323 * 0.15915493667125701904296875;
    float _1353 = fma(_869, (*spvDescriptorSet0.vp_c9)._m0[150].y, _1343);
    float _1355 = fma(_869, (*spvDescriptorSet0.vp_c9)._m0[150].x, _1347);
    float _1357 = _1345 * 6.283185482025146484375;
    float _1359 = sin(_1357);
    float _1361 = fma(_627, (*spvDescriptorSet0.vp_c9)._m0[191].x, _333);
    float _1363 = _1151 * _1333;
    float _1365 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _1361);
    float _1367 = _1355 * _1315;
    float _1369 = _1353 * _1317;
    float _1371 = _1345 * 6.283185482025146484375;
    float _1373 = cos(_1371);
    float _1375 = _1367 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1377 = _1369 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1379 = _1375 * _1363;
    float _1381 = _1377 * _1363;
    float _1383 = _1349 * 6.283185482025146484375;
    float _1385 = cos(_1383);
    float _1387 = fma(_627, (*spvDescriptorSet0.vp_c9)._m0[191].x, _277);
    float _1389 = _1363 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _1391 = _1389 * 0.5;
    float _1393 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _1387);
    float _1395 = _1351 * 6.283185482025146484375;
    float _1397 = sin(_1395);
    float _1399 = _1379 * _1393;
    float _1401 = _1381 * _1365;
    float _1403 = _1351 * 6.283185482025146484375;
    float _1405 = cos(_1403);
    float _1407 = _1373 * _1385;
    float _1409 = _1359 * _1385;
    float _1411 = _1407 * _1391;
    float _1413 = _1349 * 6.283185482025146484375;
    float _1415 = sin(_1413);
    float _1417 = _1359 * _1397;
    float _1419 = _1373 * _1405;
    float _1421 = _1359 * _1405;
    float _1423 = _1373 * _1397;
    float _1425 = _1405 * _1385;
    float _1427 = _1397 * _1385;
    float _1429 = fma(_1415, _1419, _1417);
    float _1431 = _1415 * _1391;
    float _1433 = -_1421;
    float _1435 = fma(_1415, _1423, _1433);
    float _1437 = -_1423;
    float _1439 = fma(_1415, _1421, _1437);
    float _1441 = fma(_1429, _1399, _1411);
    float _1443 = _1409 * _1391;
    float _1445 = -_1431;
    float _1447 = fma(_1425, _1399, _1445);
    float _1449 = fma(_1415, _1417, _1419);
    float _1451 = -_1401;
    float _1453 = fma(_1435, _1451, _1441);
    float _1455 = fma(_1439, _1399, _1443);
    float _1457 = -_1401;
    float _1459 = fma(_1427, _1457, _1447);
    bool _1461 = !_1001;
    int _1463 = _1461 ? 0 : 1;
    float _1465 = _1453 * _329;
    float _1467 = -_1401;
    float _1469 = fma(_1449, _1467, _1455);
    float _1471 = _1453 * _325;
    float _1473 = _1453 * _315;
    float _1475 = fma(_1459, _297, _1465);
    float _1477 = fma(_1459, _287, _1471);
    float _1479 = fma(_1459, _283, _1473);
    float _1481 = fma(_1469, _345, _1475);
    float _1483 = fma(_1469, _341, _1477);
    float _1485 = fma(_1469, _337, _1479);
    float _1487 = _607 + _1481;
    float _1489 = _673 + _1483;
    float _1491 = _471 + _1485;
    float _1493 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1495 = _1487 + _1493;
    float _1497 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1499 = _1489 + _1497;
    float _1501 = _1495 * _1495;
    float _1503 = fma(_1499, _1499, _1501);
    bool _1505 = !_1005;
    int _1507 = _1505 ? 0 : 1;
    float _1509 = sqrt(_1503);
    bool _1511 = _1509 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1513 = _1479;
    float _1515 = _1485;
    float _1517 = _1489;
    float _1519 = _1495;
    float _1521 = _1263;
    if (!_1511)
    {
        _1513 = _1489;
    }
    float _1523 = _1513;
    float _1525 = _1523;
    if (!_1511)
    {
        _1515 = _1487;
    }
    float _1527 = _1515;
    float _1529 = _1527;
    if (!_1511)
    {
        _1517 = _1491;
    }
    float _1531 = _1517;
    bool _1533 = !_1511;
    float _1535 = _1531;
    if (!_1533)
    {
        float _1537 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1539 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1541 = _1509 + _1539;
        float _1543 = rsqrt(_1503);
        float _1545 = _1541 * _1537;
        float _1547 = _1491 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1549 = _1545 * 0.15915493667125701904296875;
        float _1551 = _1549 * 6.283185482025146484375;
        float _1553 = cos(_1551);
        float _1555 = _1549 * 6.283185482025146484375;
        float _1557 = sin(_1555);
        float _1559 = _1553 + (-1.0);
        float _1561 = fma(_1557, _1547, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1563 = _1559 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1565 = _1543 * _1561;
        float _1567 = fma(_1491, _1553, _1563);
        float _1569 = fma(_1499, _1565, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1571 = fma(_1495, _1565, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1525 = _1569;
        _1529 = _1571;
        _1535 = _1567;
    }
    float _1573 = _1525;
    float _1575 = _1529;
    float _1577 = _1535;
    float _1579 = -(*spvDescriptorSet0.vp_c15)._m0[630].x;
    float _1581 = _1573 + _1579;
    float _1583 = -(*spvDescriptorSet0.vp_c15)._m0[630].y;
    float _1585 = _1575 + _1583;
    float _1587 = fma(_1581, (*spvDescriptorSet0.vp_c15)._m0[630].z, 0.5);
    float _1589 = fma(_1585, (*spvDescriptorSet0.vp_c15)._m0[630].z, 0.5);
    float2 _6238 = float2(_1587, _1589);
    float _1591 = dm_bs(spvDescriptorSet0.vp_t_tcb_28.sample(spvDescriptorSet0.vp_t_tcb_28Smplr, select(_6238, float2(0.0), isnan(_6238)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_28, spvDescriptorSet0.vp_t_tcb_28Smplr_w, select(_6238, float2(0.0), isnan(_6238)), level(0.0)).x;
    float _1593 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _1595 = int(_1593);
    int _1597 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _1599 = _1597 != 0;
    float _1601 = -_1223;
    float _1603 = fma(_1601, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1573);
    int _1605 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _1607 = _1605 != 0;
    float _1609 = -_1223;
    float _1611 = fma(_1609, (*spvDescriptorSet0.vp_c9)._m0[18].w, _673);
    int _1613 = abs(_781);
    float _1615 = -_1263;
    float _1617 = fma(_1615, (*spvDescriptorSet0.vp_c9)._m0[18].w, _607);
    int _1619 = abs(_1155);
    float _1621 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].x);
    int _1623 = int(_1621);
    int _1625 = abs(_1463);
    if (_1599)
    {
        float _1627 = in.m_64.x;
        _1519 = _1627;
    }
    float _1629 = _1519;
    float _1631 = float(uint(_1595));
    float _1633 = trunc(_767);
    int _1635 = int(_1633);
    float _1637 = trunc(_871);
    int _1639 = int(_1637);
    float _1641 = float(uint(_1623));
    float _1643 = _1629;
    if (!_1599)
    {
        float _1645 = in.m_64.y;
        _1643 = _1645;
    }
    float _1647 = _1643;
    int _1649 = ~_1595;
    int _1651 = _1649 + 1;
    float _1653 = float(_1623);
    bool _1655 = _1595 == 0;
    float _1657 = 1.0 / _1631;
    float _1659 = float(uint(_1635));
    int _1661 = ~_1623;
    int _1663 = _1661 + 1;
    float _1665 = 1.0 / _1641;
    float _1667 = float(uint(_1639));
    int _1669 = as_type<int>(_1657) + (-2);
    float _1671 = as_type<float>(_1669) * _1659;
    int _1673 = as_type<int>(_1665) + (-2);
    float _1675 = trunc(_1671);
    float _1677 = precise::max(_1675, 0.0);
    uint _1680 = uint(_1677);
    float _1682 = as_type<float>(_1673) * _1667;
    float _1684 = trunc(_1682);
    float _1686 = precise::max(_1684, 0.0);
    uint _1688 = uint(_1686);
    int _1690 = ~_1623;
    int _1692 = _1690 + 1;
    int _1694 = _1651 * int(_1680);
    int _1696 = _1694 + _1635;
    float _1698 = as_type<float>(_1651);
    float _1700 = as_type<float>(_1696);
    if (_1599)
    {
        _1698 = 1.0;
    }
    float _1702 = _1698;
    float _1704 = _1702;
    if (!_1599)
    {
        _1704 = 7.345489978790283203125;
    }
    float _1706 = _1704;
    float _1708 = float(uint(_1696));
    if (_1599)
    {
        _1700 = 1.0;
    }
    float _1710 = _1700;
    int _1712 = _1692 * int(_1688);
    int _1714 = _1712 + _1639;
    float _1716 = _1710;
    if (!_1599)
    {
        _1716 = 1.2345600128173828125;
    }
    float _1718 = _1716;
    float _1720 = as_type<float>(_1669) * _1708;
    float _1722 = _1706 * _397;
    float _1724 = float(uint(_1714));
    float _1726 = _1647 * _1718;
    float _1728 = floor(_1722);
    int _1730 = ~_1595;
    int _1732 = _1730 + 1;
    float _1734 = as_type<float>(_1673) * _1724;
    float _1736 = trunc(_1720);
    float _1738 = precise::max(_1736, 0.0);
    uint _1740 = uint(_1738);
    float _1742 = floor(_1726);
    float _1744 = -_1728;
    float _1746 = _1722 + _1744;
    int _1748 = int(_1680) + int(_1740);
    float _1750 = trunc(_1734);
    float _1752 = precise::max(_1750, 0.0);
    uint _1754 = uint(_1752);
    float _1756 = float(_1595);
    float _1758 = float(_1635);
    int _1760 = _1732 * _1748;
    int _1762 = _1760 + _1635;
    float _1764 = -_1742;
    float _1766 = _1726 + _1764;
    float _1768 = _1746 * _1756;
    bool _1770 = _1758 >= _1756;
    bool _1772 = isnan(_1758);
    bool _1774 = _1770 || _1772;
    bool _1776 = isnan(_1756);
    bool _1778 = _1774 || _1776;
    float _1780 = float(_1778);
    float _1782 = _1756 * _851;
    bool _1784 = uint(_1762) >= uint(_1595);
    float _1786 = _1766 * _1653;
    int _1788 = ~_1623;
    int _1790 = _1788 + 1;
    float _1792 = trunc(_1768);
    int _1794 = int(_1792);
    bool _1796 = !_1784;
    int _1798 = _1796 ? 0 : (-1);
    int _1800 = int(_1688) + int(_1754);
    int _1802 = ~_1748;
    int _1804 = _1802 + _1798;
    int _1806 = _1804 + 1;
    int _1808 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _1810 = _1808 != 0;
    float _1812 = trunc(_1780);
    int _1814 = int(_1812);
    int _1816 = _1790 * _1800;
    int _1818 = _1816 + _1639;
    int _1820 = _1595 + (-1);
    int _1822 = _1595 * _1806;
    int _1824 = _1822 + _1635;
    float _1826 = float(_1639);
    bool _1828 = uint(_1818) >= uint(_1623);
    bool _1830 = _1826 >= _1653;
    bool _1832 = isnan(_1826);
    bool _1834 = _1830 || _1832;
    bool _1836 = isnan(_1653);
    bool _1838 = _1834 || _1836;
    float _1840 = float(_1838);
    float _1842 = trunc(_1782);
    int _1844 = int(_1842);
    bool _1846 = !_1810;
    int _1848 = _1846 ? 0 : 1;
    bool _1850 = !_1655;
    int _1852 = _1850 ? _1824 : (-1);
    int _1854 = abs(_1848);
    int _1856 = ~_1814;
    int _1858 = _1856 + 1;
    int _1860 = _1858 + 1;
    float _1862 = trunc(_1786);
    int _1864 = int(_1862);
    bool _1866 = !_1828;
    int _1868 = _1866 ? 0 : (-1);
    bool _1870 = _1623 == 0;
    int _1872 = _1852 * _1860;
    int _1874 = ~_1800;
    int _1876 = _1874 + _1868;
    int _1878 = _1876 + 1;
    int _1880 = abs(_1019);
    float _1882 = trunc(_1840);
    int _1884 = int(_1882);
    int _1886 = _1814 * _1820;
    int _1888 = _1886 + _1872;
    float _1890 = _1653 * _851;
    int _1892 = _1623 * _1878;
    int _1894 = _1892 + _1639;
    bool _1896 = !_1607;
    int _1898 = _1896 ? 0 : 1;
    int _1900 = _1794 * _1854;
    int _1902 = _1900 + _1635;
    int _1904 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8192;
    bool _1906 = _1904 != 0;
    int _1908 = _1888 * _1613;
    float _1910 = trunc(_1890);
    int _1912 = int(_1910);
    int _1914 = abs(_793);
    bool _1916 = !_1870;
    int _1918 = _1916 ? _1894 : (-1);
    int _1920 = _1844 * _1880;
    int _1922 = _1920 + _1908;
    int _1924 = abs(_1898);
    bool _1926 = !_1906;
    int _1928 = _1926 ? 0 : 1;
    int _1930 = _1902 * _1914;
    int _1932 = _1930 + _1922;
    int _1934 = ~_1884;
    int _1936 = _1934 + 1;
    int _1938 = _1936 + 1;
    int _1940 = abs(_1928);
    int _1942 = _1794 * _1924;
    int _1944 = _1942 + _1932;
    int _1946 = _1623 + (-1);
    int _1948 = _1918 * _1938;
    int _1950 = abs(_1161);
    int _1952 = _1884 * _1946;
    int _1954 = _1952 + _1948;
    float _1956 = float(uint(_1944));
    int _1958 = _1954 * _1619;
    int _1960 = abs(_1507);
    float _1962 = as_type<float>(_1669) * _1956;
    int _1964 = _1864 * _1940;
    int _1966 = _1964 + _1639;
    float _1968 = float(uint(_1902));
    int _1970 = _1912 * _1950;
    int _1972 = _1970 + _1958;
    float _1974 = trunc(_1962);
    float _1976 = precise::max(_1974, 0.0);
    uint _1978 = uint(_1976);
    int _1980 = ~_1595;
    int _1982 = _1980 + 1;
    int _1984 = _1966 * _1625;
    int _1986 = _1984 + _1972;
    int _1988 = ~_1595;
    int _1990 = _1988 + 1;
    int _1992 = _1864 * _1960;
    int _1994 = _1992 + _1986;
    float _1996 = as_type<float>(_1669) * _1968;
    float _1998 = float(uint(_1994));
    int _2000 = _1982 * int(_1978);
    int _2002 = _2000 + _1944;
    float _2004 = trunc(_1996);
    float _2006 = precise::max(_2004, 0.0);
    uint _2008 = uint(_2006);
    float _2010 = as_type<float>(_1673) * _1998;
    float _2012 = float(uint(_2002));
    float _2014 = trunc(_2010);
    float _2016 = precise::max(_2014, 0.0);
    uint _2018 = uint(_2016);
    float _2020 = as_type<float>(_1669) * _2012;
    int _2022 = ~_1623;
    int _2024 = _2022 + 1;
    int _2026 = _1990 * int(_2008);
    int _2028 = _2026 + _1902;
    float _2030 = trunc(_2020);
    float _2032 = precise::max(_2030, 0.0);
    uint _2034 = uint(_2032);
    float _2036 = float(uint(_2028));
    int _2038 = _2024 * int(_2018);
    int _2040 = _2038 + _1994;
    float _2042 = as_type<float>(_1669) * _2036;
    float _2044 = float(uint(_2040));
    float _2046 = trunc(_2042);
    float _2048 = precise::max(_2046, 0.0);
    uint _2050 = uint(_2048);
    int _2052 = int(_1978) + int(_2034);
    float _2054 = as_type<float>(_1673) * _2044;
    int _2056 = _1982 * _2052;
    int _2058 = _2056 + _1944;
    float _2060 = trunc(_2054);
    float _2062 = precise::max(_2060, 0.0);
    uint _2064 = uint(_2062);
    bool _2066 = uint(_2058) >= uint(_1595);
    bool _2068 = !_2066;
    int _2070 = _2068 ? 0 : (-1);
    int _2072 = int(_2008) + int(_2050);
    float _2074 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2076 = _1603 + _2074;
    int _2078 = ~_2052;
    int _2080 = _2078 + _2070;
    int _2082 = _2080 + 1;
    int _2084 = _1595 * _2082;
    int _2086 = _2084 + _1944;
    int _2088 = int(_2018) + int(_2064);
    int _2090 = _1663 * _2088;
    int _2092 = _2090 + _1994;
    float _2094 = fma(_1591, 100.0, _1577);
    float _2096 = -_1263;
    float _2098 = fma(_2096, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1575);
    float _2100 = -_1207;
    float _2102 = fma(_2100, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2094);
    float _2104 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2106 = _2098 + _2104;
    float _2108 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2110 = _2102 + _2108;
    float _2112 = _2110 * _2110;
    float _2114 = fma(_2076, _2076, _2112);
    float _2116 = fma(_2106, _2106, _2114);
    float _2118 = rsqrt(_2116);
    float _2120 = sqrt(_2116);
    float _2122 = _2118 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _2124 = _2076 * _2122;
    float _2126 = _2106 * _2122;
    float _2128 = _2124 * _2124;
    float _2130 = _2126 * _2126;
    float _2132 = _2128 + _2130;
    float _2134 = sqrt(_2132);
    bool _2136 = _2134 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2138 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2140 = _2134 + _2138;
    float _2142 = _2106;
    float _2144 = _2132;
    float _2146 = _2140;
    float _2148 = _2110;
    float _2150 = as_type<float>(_1914);
    if (_2136)
    {
        float _2152 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2142 = _2152;
    }
    float _2154 = _2142;
    if (_2136)
    {
        float _2156 = rsqrt(_2132);
        _2144 = _2156;
    }
    float _2158 = _2144;
    if (_2136)
    {
        float _2160 = _2140 * _2154;
        _2146 = _2160;
    }
    float _2162 = _2146;
    if (_2136)
    {
        float _2164 = _2162 * 0.15915493667125701904296875;
        _1521 = _2164;
    }
    float _2166 = _1521;
    float _2168 = _2112;
    float _2170 = _2166;
    if (_2136)
    {
        float _2172 = _2166 * 6.283185482025146484375;
        float _2174 = sin(_2172);
        _2168 = _2174;
    }
    float _2176 = _2168;
    float _2178 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _2180 = precise::max(0.0, _2178);
    float _2182 = _2118;
    float _2184 = _2180;
    float _2186 = _2178;
    if (_2136)
    {
        float _2188 = _2166 * 6.283185482025146484375;
        float _2190 = cos(_2188);
        _2182 = _2190;
    }
    float _2192 = _2182;
    float _2194 = -_2122;
    float _2196 = -_2180;
    float _2198 = fma(_2110, _2194, _2196);
    if (!_2136)
    {
        _2184 = _2124;
    }
    float _2200 = _2184;
    float _2202 = _2200;
    if (_2136)
    {
        float _2204 = _2198 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2186 = _2204;
    }
    float _2206 = _2186;
    float _2208 = _2176;
    float _2210 = _2206;
    if (_2136)
    {
        float _2212 = fma(_2176, _2206, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _2208 = _2212;
    }
    float _2214 = _2208;
    float _2216 = _2214;
    if (!_2136)
    {
        _2210 = _2198;
    }
    float _2218 = _2210;
    float _2220 = _2218;
    float _2222 = _2192;
    if (_2136)
    {
        float _2224 = _2192 + (-1.0);
        _2148 = _2224;
    }
    float _2226 = _2148;
    float _2228 = _2226;
    if (_2136)
    {
        float _2230 = _2158 * _2214;
        _2150 = _2230;
    }
    float _2232 = _2150;
    if (!_2136)
    {
        _2216 = _2128;
    }
    float _2234 = _2216;
    float _2236 = _2234;
    if (_2136)
    {
        float _2238 = _2226 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2170 = _2238;
    }
    float _2240 = _2170;
    if (_2136)
    {
        float _2242 = _2124 * _2232;
        _2202 = _2242;
    }
    float _2244 = _2202;
    if (!_2136)
    {
        _2228 = _2126;
    }
    float _2246 = _2228;
    float _2248 = _2246;
    if (_2136)
    {
        float _2250 = _2126 * _2232;
        _2248 = _2250;
    }
    float _2252 = _2248;
    if (_2136)
    {
        float _2254 = fma(_2198, _2192, _2240);
        _2220 = _2254;
    }
    float _2256 = _2220;
    if (_2136)
    {
        float _2258 = _2244 * _2244;
        _2236 = _2258;
    }
    float _2260 = _2236;
    if (!_2136)
    {
        _2222 = _2130;
    }
    float _2262 = _2222;
    float _2264 = _2262;
    if (_2136)
    {
        float _2266 = _2252 * _2252;
        _2264 = _2266;
    }
    float _2268 = _2264;
    float _2270 = fma(_2256, _2256, _2260);
    float _2272 = _2102 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _2274 = _2102 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _2276 = _2270 + _2268;
    float _2278 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _2280 = fma(_2120, (*spvDescriptorSet0.vp_c15)._m0[23].w, _2278);
    float _2282 = precise::clamp(_2280, 0.0, 1.0);
    float _2284 = fma(_1611, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _2286 = rsqrt(_2276);
    float _2288 = -_2282;
    float _2290 = _2288 + 1.0;
    float _2292 = _2102 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2294 = fma(_1603, (*spvDescriptorSet0.vp_c8)._m0[2].x, _2272);
    float _2296 = fma(_1603, (*spvDescriptorSet0.vp_c8)._m0[3].x, _2274);
    float _2298 = fma(_1603, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2292);
    float _2300 = fma(_2098, (*spvDescriptorSet0.vp_c8)._m0[2].z, _2294);
    float _2302 = abs(_2290);
    float _2304 = log2(_2302);
    float _2306 = fma(_2098, (*spvDescriptorSet0.vp_c8)._m0[3].z, _2296);
    float _2308 = fma(_2098, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2298);
    float _2310 = _2300 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _2312 = _2306 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _2314 = _2308 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _2316 = _2310 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _2318 = _2286 * _2244;
    float _2320 = floor(_2284);
    float _2322 = _2286 * _2256;
    float _2324 = _2286 * _2252;
    float _2326 = _2318 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _2328 = fma(_1617, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _2330 = -_2326;
    float _2332 = fma(_2322, (*spvDescriptorSet0.vp_c15)._m0[21].y, _2330);
    float _2334 = _2304 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _2336 = -_2324;
    float _2338 = fma(_2336, (*spvDescriptorSet0.vp_c15)._m0[21].z, _2332);
    float _2340 = _2102 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2342 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _2344 = floor(_2328);
    float _2346 = fma(_1603, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2340);
    float _2348 = -_2320;
    float _2350 = _2284 + _2348;
    float _2352 = fma(_2338, -0.5, 0.5);
    float _2354 = -_2316;
    float _2356 = fma(_2354, _2342, 1.0);
    float _2358 = fma(_2098, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2346);
    float _2360 = fma(_2338, 0.5, 0.5);
    float _2362 = _2314 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2364 = sqrt(_2352);
    float _2366 = _2358 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2368 = fma(_2360, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _2370 = fma(_2360, _2368, -0.212114393711090087890625);
    float _2372 = exp2(_2334);
    float _2374 = _2314 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _2376 = -_2344;
    float _2378 = _2328 + _2376;
    float _2380 = _2314 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2382 = fma(_2360, _2370, 1.570728778839111328125);
    float _2384 = fma(_2366, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2374);
    float _2386 = _2322 + 1.0;
    float _2388 = float(uint(_1966));
    float _2390 = log2(_2356);
    float _2392 = fma(_2310, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2384);
    float _2394 = _2364 * 0.636619746685028076171875;
    float _2396 = as_type<float>(_1673) * _2388;
    float _2398 = fma(_2312, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2392);
    float _2400 = fma(_2366, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2362);
    float _2402 = -_2322;
    float _2404 = fma(_2372, _2386, _2402);
    float _2406 = fma(_2366, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2380);
    float _2408 = 1.0 / _2398;
    float _2410 = fma(_2310, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2400);
    float _2412 = -_2382;
    float _2414 = fma(_2394, _2412, 1.0);
    float _2416 = fma(_2310, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2406);
    int _2418 = ~_1595;
    int _2420 = _2418 + 1;
    float _2422 = _2390 * 0.693147182464599609375;
    float _2424 = fma(_2312, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2416);
    float _2426 = fma(_2312, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2410);
    float _2428 = trunc(_2396);
    float _2430 = precise::max(_2428, 0.0);
    uint _2432 = uint(_2430);
    float _2434 = _2422 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float2 _7490 = float2(_2350, _2378);
    float _2436 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_7490, float2(0.0), isnan(_7490)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_7490, float2(0.0), isnan(_7490)), level(0.0)).x;
    int _2438 = _2420 * _2072;
    int _2440 = _2438 + _1902;
    int _2442 = ~_1623;
    int _2444 = _2442 + 1;
    float _2446 = _2424 * _2408;
    float _2448 = _2426 * _2408;
    float _2450 = fma(_2446, 0.5, 0.5);
    float _2452 = fma(_2448, -0.5, 0.5);
    float _2454 = fma(_2404, 0.5, 0.5);
    float3 _7521 = float3(_2450, _2452, _2434);
    float _2456 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_7521, float3(0.0), isnan(_7521)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_7521, float3(0.0), isnan(_7521)), level(0.0)).x;
    float3 _7532 = float3(_2450, _2452, _2434);
    float4 _2459 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_7532, float3(0.0), isnan(_7532)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_7532, float3(0.0), isnan(_7532)), level(0.0)).xyzw;
    float _2461 = _2459.x;
    float _2463 = _2459.y;
    float _2465 = _2459.z;
    float _2467 = _2459.w;
    float2 _7548 = float2(_2414, _2454);
    float3 _2471 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_7548, float2(0.0), isnan(_7548)), level(0.0)), spvDescriptorSet0.dm_border, 4u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_7548, float2(0.0), isnan(_7548)), level(0.0)).xyz;
    float _2473 = _2471.x;
    float _2475 = _2471.y;
    float _2477 = _2471.z;
    bool _2479 = !_1655;
    int _2481 = _2479 ? _2086 : (-1);
    float _2483 = _1361 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _2485 = fma(_1591, 100.0, _471);
    bool _2487 = uint(_2440) >= uint(_1595);
    float _2489 = _2304 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    int _2491 = _2481 & 3;
    bool _2493 = _2491 != 0;
    float _2495 = -_1207;
    float _2497 = fma(_2495, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2485);
    int _2499 = _2481 & 3;
    bool _2501 = _2499 != 0;
    out.m_72.x = _1603;
    out.m_72.y = _2102;
    out.m_72.z = _2098;
    bool _2503 = uint(_2092) >= uint(_1623);
    int _2505 = _2444 * int(_2432);
    int _2507 = _2505 + _1966;
    bool _2509 = !_2487;
    int _2511 = _2509 ? 0 : (-1);
    float _2513 = exp2(_2489);
    int _2515 = _2493 ? 0 : 1;
    bool _2517 = uint(_2499) > 1u;
    bool _2519 = _2499 != 3;
    bool _2521 = !_2503;
    int _2523 = _2521 ? 0 : (-1);
    bool _2525 = uint(_2499) >= 2u;
    float _2527 = float(uint(_2507));
    int _2529 = ~_2088;
    int _2531 = _2529 + _2523;
    int _2533 = _2531 + 1;
    int _2535 = _2525 ? 0 : 1;
    float _2537 = as_type<float>(_1673) * _2527;
    bool _2539 = _403 > 0.5;
    int _2541 = _1623 * _2533;
    int _2543 = _2541 + _1994;
    int _2545 = ~_2515;
    int _2547 = _2545 + 1;
    int _2549 = _2547 + 1;
    float _2551 = -_2513;
    float _2553 = _2551 + 1.0;
    int _2555 = ~_2535;
    int _2557 = _2555 + 1;
    int _2559 = _2557 + 1;
    float _2561 = trunc(_2537);
    float _2563 = precise::max(_2561, 0.0);
    uint _2565 = uint(_2563);
    bool _2567 = !_2501;
    int _2569 = _2567 ? 0 : 1;
    int _2571 = _2549;
    int _2573 = _2559;
    float _2575 = _2398;
    float _2577 = _2426;
    if (!_2517)
    {
        int _2579 = ~_2515;
        int _2581 = _2579 + 1;
        _2571 = _2581;
    }
    int _2583 = _2571;
    if (_2519)
    {
        int _2585 = ~_2535;
        int _2587 = _2585 + 1;
        _2573 = _2587;
    }
    int _2589 = _2573;
    bool _2591 = _397 > 0.5;
    int _2593 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _2595 = _2593 != 0;
    float _2597 = -_333;
    int _2599 = _2539 ? as_type<int>(_2597) : as_type<int>(_333);
    int _2601 = _2481 >> 31;
    bool _2603 = !_1870;
    int _2605 = _2603 ? _2543 : (-1);
    bool _2607 = !_2595;
    float _2609 = _2607 ? _333 : as_type<float>(_2599);
    int _2611 = _2601 & 3;
    int _2613 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _2615 = _2613 != 0;
    int _2617 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4194304;
    bool _2619 = _2617 != 0;
    int _2621 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _2623 = _2621 != 0;
    int _2625 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _2627 = _2625 != 0;
    int _2629 = _2605 >> 31;
    int _2631 = _2481 + _2611;
    int _2633 = ~_2072;
    int _2635 = _2633 + _2511;
    int _2637 = _2635 + 1;
    int _2639 = _2629 & 3;
    bool _2641 = !_2619;
    int _2643 = _2641 ? 0 : 1;
    int _2645 = _1595 * _2637;
    int _2647 = _2645 + _1902;
    int _2649 = _2605 & 3;
    bool _2651 = _2649 != 0;
    int _2653 = _2631 >> 2;
    int _2655 = _2605 + _2639;
    bool _2657 = !_2615;
    int _2659 = _2657 ? 0 : 1;
    int _2661 = _2651 ? 0 : 1;
    int _2663 = _2653 << 4;
    int _2665 = _2663 + 368;
    int _2667 = _2605 & 3;
    bool _2669 = _2667 != 0;
    bool _2671 = _2499 != 3;
    uint _2673 = uint(int(uint(_2665) >> uint(2)));
    uint _2675 = uint(int(uint(int(_2673)) >> uint(2)));
    int _2677 = int(_2673) & 3;
    float _2679 = (*spvDescriptorSet0.vp_c9)._m0[int(_2675)][_2677];
    int _2681 = int(_2673) + 1;
    uint _2683 = uint(int(uint(_2681) >> uint(2)));
    int _2685 = _2681 & 3;
    float _2687 = (*spvDescriptorSet0.vp_c9)._m0[int(_2683)][_2685];
    int _2689 = _2655 >> 2;
    bool _2691 = !_1655;
    int _2693 = _2691 ? _2647 : (-1);
    bool _2695 = uint(_2667) > 1u;
    int _2697 = _2689 << 4;
    int _2699 = _2697 + 512;
    bool _2701 = !_2669;
    int _2703 = _2701 ? 0 : 1;
    uint _2705 = uint(int(uint(_2699) >> uint(2)));
    uint _2707 = uint(int(uint(int(_2705)) >> uint(2)));
    int _2709 = int(_2705) & 3;
    float _2711 = (*spvDescriptorSet0.vp_c9)._m0[int(_2707)][_2709];
    int _2713 = int(_2705) + 1;
    uint _2715 = uint(int(uint(_2713) >> uint(2)));
    int _2717 = _2713 & 3;
    float _2719 = (*spvDescriptorSet0.vp_c9)._m0[int(_2715)][_2717];
    bool _2721 = _2667 != 3;
    int _2723 = int(_2432) + int(_2565);
    int _2725 = ~_2661;
    int _2727 = _2725 + 1;
    int _2729 = _2727 + 1;
    int _2731 = _2729;
    if (!_2695)
    {
        int _2733 = ~_2661;
        int _2735 = _2733 + 1;
        _2731 = _2735;
    }
    int _2737 = _2731;
    int _2739 = _2665 + 8;
    uint _2741 = uint(int(uint(_2739) >> uint(2)));
    uint _2743 = uint(int(uint(int(_2741)) >> uint(2)));
    int _2745 = int(_2741) & 3;
    float _2747 = (*spvDescriptorSet0.vp_c9)._m0[int(_2743)][_2745];
    int _2749 = int(_2741) + 1;
    uint _2751 = uint(int(uint(_2749) >> uint(2)));
    int _2753 = _2749 & 3;
    float _2755 = (*spvDescriptorSet0.vp_c9)._m0[int(_2751)][_2753];
    int _2757 = ~_1623;
    int _2759 = _2757 + 1;
    bool _2761 = uint(_2667) >= 2u;
    bool _2763 = !_2671;
    int _2765 = _2763 ? 0 : (-1);
    int _2767 = _2759 * _2723;
    int _2769 = _2767 + _1966;
    int _2771 = _2761 ? 0 : 1;
    int _2773 = _2699 + 8;
    uint _2775 = uint(int(uint(_2773) >> uint(2)));
    uint _2777 = uint(int(uint(int(_2775)) >> uint(2)));
    int _2779 = int(_2775) & 3;
    float _2781 = (*spvDescriptorSet0.vp_c9)._m0[int(_2777)][_2779];
    int _2783 = int(_2775) + 1;
    uint _2785 = uint(int(uint(_2783) >> uint(2)));
    int _2787 = _2783 & 3;
    float _2789 = (*spvDescriptorSet0.vp_c9)._m0[int(_2785)][_2787];
    int _2791 = ~_2771;
    int _2793 = _2791 + 1;
    int _2795 = _2793 + 1;
    int _2797 = _2795;
    if (_2721)
    {
        int _2799 = ~_2771;
        int _2801 = _2799 + 1;
        _2797 = _2801;
    }
    int _2803 = _2797;
    bool _2805 = _2667 != 3;
    bool _2807 = uint(_2769) >= uint(_1623);
    float _2809 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    int _2811 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y);
    bool _2813 = _2811 != 0;
    float _2815 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _2817 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    bool _2819 = !_2805;
    int _2821 = _2819 ? 0 : (-1);
    float _2823 = _2809 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    bool _2825 = _399 > 0.5;
    float _2827 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _2829 = _2815 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2831 = _2817 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    out.m_74.x = _2823;
    out.m_74.y = _2829;
    out.m_74.z = _2831;
    out.m_74.w = _2827;
    int _2833 = abs(_2583);
    float _2835 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    bool _2837 = !_2807;
    int _2839 = _2837 ? 0 : (-1);
    float _2841 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    bool _2843 = _401 > 0.5;
    float _2845 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _2847 = _2835 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    int _2849 = abs(_2737);
    float _2851 = _2845 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2853 = _2841 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    int _2855 = abs(_2589);
    float _2857 = trunc((*spvDescriptorSet0.vp_c9)._m0[80].z);
    int _2859 = int(_2857);
    int _2861 = ~_2833;
    int _2863 = _2861 + 1;
    int _2865 = _2863 + 1;
    out.m_76.x = _2847;
    out.m_76.y = _2851;
    out.m_76.z = _2853;
    int _2867 = abs(_2569);
    int _2869 = ~_2849;
    int _2871 = _2869 + 1;
    int _2873 = _2871 + 1;
    int _2875 = _2865 * as_type<int>(_2687);
    int _2877 = abs(_2703);
    float _2879 = trunc((*spvDescriptorSet0.vp_c9)._m0[85].z);
    int _2881 = int(_2879);
    int _2883 = ~_2867;
    int _2885 = _2883 + 1;
    int _2887 = _2885 + 1;
    int _2889 = _2873 * as_type<int>(_2719);
    int _2891 = ~_2877;
    int _2893 = _2891 + 1;
    int _2895 = _2893 + 1;
    int _2897 = ~_2723;
    int _2899 = _2897 + _2839;
    int _2901 = _2899 + 1;
    int _2903 = _2887 * as_type<int>(_2679);
    int _2905 = _2903 + _2875;
    int _2907 = abs(_2803);
    int _2909 = _2895 * as_type<int>(_2711);
    int _2911 = _2909 + _2889;
    int _2913 = _1623 * _2901;
    int _2915 = _2913 + _1966;
    float _2917 = float(uint(_2859));
    int _2919 = ~_2855;
    int _2921 = _2919 + 1;
    int _2923 = _2921 + 1;
    int _2925 = ~_2907;
    int _2927 = _2925 + 1;
    int _2929 = _2927 + 1;
    int _2931 = abs(_2765);
    int _2933 = _2923 * as_type<int>(_2747);
    int _2935 = _2933 + _2905;
    int _2937 = abs(_2659);
    int _2939 = _2929 * as_type<int>(_2781);
    int _2941 = _2939 + _2911;
    int _2943 = ~_2931;
    int _2945 = _2943 + 1;
    int _2947 = _2945 + 1;
    float _2949 = 1.0 / _2917;
    float _2951 = float(uint(_2881));
    float _2953 = _1387 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    int _2955 = abs(_2821);
    int _2957 = _2947 * as_type<int>(_2755);
    int _2959 = _2957 + _2935;
    int _2961 = ~_2937;
    int _2963 = _2961 + 1;
    int _2965 = _2963 + 1;
    int _2967 = abs(_2643);
    float _2969 = 1.0 / _2951;
    int _2971 = ~_2955;
    int _2973 = _2971 + 1;
    int _2975 = _2973 + 1;
    int _2977 = _2959 * _2965;
    int _2979 = abs(_2859);
    int _2981 = ~_2967;
    int _2983 = _2981 + 1;
    int _2985 = _2983 + 1;
    int _2987 = _2975 * as_type<int>(_2789);
    int _2989 = _2987 + _2941;
    int _2991 = _2693 * _2937;
    int _2993 = _2991 + _2977;
    int _2995 = abs(_2881);
    int _2997 = _2989 * _2985;
    bool _2999 = !_1870;
    int _3001 = _2999 ? _2915 : (-1);
    float _3003 = fma(_2483, _2483, 1.0);
    float _3005 = float(uint(_2979));
    float _3007 = float(uint(_2995));
    int _3009 = _3001 * _2967;
    int _3011 = _3009 + _2997;
    int _3013 = as_type<int>(_2949) + (-2);
    float _3015 = float(uint(_2993));
    float _3017 = 1.0 / _3005;
    float _3019 = -_333;
    int _3021 = _2825 ? as_type<int>(_3019) : as_type<int>(_333);
    float _3023 = -_277;
    int _3025 = _2591 ? as_type<int>(_3023) : as_type<int>(_277);
    float _3027 = -_277;
    int _3029 = _2843 ? as_type<int>(_3027) : as_type<int>(_277);
    float _3031 = float(uint(_3011));
    float _3033 = 1.0 / _3007;
    bool _3035 = !_2623;
    float _3037 = _3035 ? _333 : as_type<float>(_3021);
    bool _3039 = !_2813;
    float _3041 = _3039 ? _277 : as_type<float>(_3025);
    bool _3043 = !_2627;
    float _3045 = _3043 ? _277 : as_type<float>(_3029);
    int _3047 = abs(_2993);
    float _3049 = rsqrt(_3003);
    float _3051 = as_type<float>(_3013) * _3015;
    int _3053 = as_type<int>(_2969) + (-2);
    int _3055 = as_type<int>(_3017) + (-2);
    int _3057 = ~_2859;
    int _3059 = _3057 + 1;
    float _3061 = as_type<float>(_3053) * _3031;
    float _3063 = trunc(_3051);
    float _3065 = precise::max(_3063, 0.0);
    uint _3067 = uint(_3065);
    int _3069 = abs(_3011);
    int _3071 = as_type<int>(_3033) + (-2);
    float _3073 = float(uint(_3047));
    float _3075 = trunc(_3061);
    float _3077 = precise::max(_3075, 0.0);
    uint _3079 = uint(_3077);
    int _3081 = ~_2881;
    int _3083 = _3081 + 1;
    float _3085 = as_type<float>(_3055) * _3073;
    float _3087 = float(uint(_3069));
    float _3089 = -_1415;
    float _3091 = fma(_1425, _2953, _3089);
    float _3093 = -_3049;
    float _3095 = _1427 * _3093;
    float _3097 = _2483 * _3049;
    int _3099 = ~_2995;
    int _3101 = _3099 + 1;
    int _3103 = _3059 * int(_3067);
    int _3105 = _3103 + _2993;
    float _3107 = as_type<float>(_3071) * _3087;
    float _3109 = trunc(_3085);
    float _3111 = precise::max(_3109, 0.0);
    uint _3113 = uint(_3111);
    float _3115 = -_2483;
    float _3117 = fma(_1427, _3115, _3091);
    float _3119 = fma(_1415, _3097, _3095);
    float _3121 = float(uint(_3105));
    int _3123 = ~_2979;
    int _3125 = _3123 + 1;
    int _3127 = _3083 * int(_3079);
    int _3129 = _3127 + _3011;
    float _3131 = trunc(_3107);
    float _3133 = precise::max(_3131, 0.0);
    uint _3135 = uint(_3133);
    float _3137 = as_type<float>(_3013) * _3121;
    float _3139 = fma(_1439, _2953, _1409);
    float _3141 = float(uint(_3129));
    float _3143 = as_type<float>(_3053) * _3141;
    float _3145 = fma(_1429, _2953, _1407);
    float _3147 = -_3049;
    float _3149 = _1449 * _3147;
    float _3151 = -_2483;
    float _3153 = fma(_1449, _3151, _3139);
    float _3155 = trunc(_3137);
    float _3157 = precise::max(_3155, 0.0);
    uint _3159 = uint(_3157);
    int _3161 = _3125 * int(_3113);
    int _3163 = _3161 + _3047;
    float _3165 = -_2483;
    float _3167 = fma(_1435, _3165, _3145);
    float _3169 = -_3049;
    float _3171 = _1435 * _3169;
    int _3173 = _3101 * int(_3135);
    int _3175 = _3173 + _3069;
    float _3177 = _1429 * _325;
    float _3179 = float(uint(_3163));
    float _3181 = -_3097;
    float _3183 = fma(_1407, _3181, _3171);
    float _3185 = trunc(_3143);
    float _3187 = precise::max(_3185, 0.0);
    uint _3189 = uint(_3187);
    float _3191 = float(uint(_3175));
    float _3193 = _1429 * _329;
    float _3195 = as_type<float>(_3055) * _3179;
    float _3197 = _1429 * _315;
    float _3199 = fma(_1425, _287, _3177);
    float _3201 = as_type<float>(_3071) * _3191;
    float _3203 = -_3097;
    float _3205 = fma(_1409, _3203, _3149);
    float _3207 = fma(_1425, _283, _3197);
    float _3209 = fma(_1425, _297, _3193);
    float _3211 = trunc(_3201);
    float _3213 = precise::max(_3211, 0.0);
    uint _3215 = uint(_3213);
    float _3217 = fma(_1439, _341, _3199);
    float _3219 = fma(_1439, _337, _3207);
    float _3221 = fma(_1439, _345, _3209);
    float _3223 = _3167 * _325;
    float _3225 = _3167 * _329;
    float _3227 = _3183 * _325;
    float _3229 = _3183 * _315;
    float _3231 = trunc(_3195);
    float _3233 = precise::max(_3231, 0.0);
    uint _3235 = uint(_3233);
    float _3237 = _3183 * _329;
    int _3239 = int(_3079) + int(_3189);
    float _3241 = _3167 * _315;
    int _3243 = int(_3067) + int(_3159);
    out.m_78.x = _3217;
    out.m_78.y = _3219;
    out.m_78.z = _3221;
    int _3245 = ~_2859;
    int _3247 = _3245 + 1;
    float _3249 = -_2436;
    float _3251 = _3249 + 1.0;
    int _3253 = ~_2881;
    int _3255 = _3253 + 1;
    int _3257 = int(_3135) + int(_3215);
    int _3259 = _3247 * _3243;
    int _3261 = _3259 + _2993;
    int _3263 = ~_2995;
    int _3265 = _3263 + 1;
    int _3267 = _3255 * _3239;
    int _3269 = _3267 + _3011;
    int _3271 = ~_2979;
    int _3273 = _3271 + 1;
    bool _3275 = uint(_3261) >= uint(_2859);
    int _3277 = _3265 * _3257;
    int _3279 = _3277 + _3069;
    int _3281 = int(_3113) + int(_3235);
    float _3283 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    bool _3285 = !_3275;
    int _3287 = _3285 ? 0 : (-1);
    float _3289 = fma(_3119, _287, _3227);
    bool _3291 = uint(_3269) >= uint(_2881);
    int _3293 = _3273 * _3281;
    int _3295 = _3293 + _3047;
    int _3297 = ~_3243;
    int _3299 = _3297 + _3287;
    int _3301 = _3299 + 1;
    float _3303 = fma(_3119, _297, _3237);
    bool _3305 = uint(_3279) >= uint(_2995);
    float _3307 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    bool _3309 = uint(_3295) >= uint(_2979);
    int _3311 = _2859 * _3301;
    int _3313 = _3311 + _2993;
    bool _3315 = !_3291;
    int _3317 = _3315 ? 0 : (-1);
    float _3319 = fma(_3119, _283, _3229);
    bool _3321 = _2859 == 0;
    float _3323 = fma(_3205, _341, _3289);
    bool _3325 = _2859 == 0;
    float _3327 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    int _3329 = _2993 ^ _2859;
    float _3331 = fma(_3205, _337, _3319);
    int _3333 = _3011 ^ _2881;
    float _3335 = fma(_3117, _297, _3225);
    int _3337 = ~_3239;
    int _3339 = _3337 + _3317;
    int _3341 = _3339 + 1;
    bool _3343 = !_3309;
    int _3345 = _3343 ? 0 : (-1);
    float _3347 = _3307 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    bool _3349 = !_3305;
    int _3351 = _3349 ? 0 : (-1);
    int _3353 = _2881 * _3341;
    int _3355 = _3353 + _3011;
    uint _3357 = uint(int(uint(_3333) >> uint(31)));
    int _3359 = ~_3345;
    int _3361 = _3281 + _3359;
    int _3363 = _3361 + 1;
    int _3365 = ~_3351;
    int _3367 = _3257 + _3365;
    int _3369 = _3367 + 1;
    float _3371 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    int _3373 = ~int(_3357);
    int _3375 = _3373 + 1;
    uint _3377 = uint(int(uint(_3329) >> uint(31)));
    int _3379 = _3369 ^ _3375;
    int _3381 = ~int(_3377);
    int _3383 = _3381 + 1;
    bool _3385 = _2881 == 0;
    bool _3387 = _2881 == 0;
    float _3389 = _3327 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    int _3391 = ~_3375;
    int _3393 = _3391 + _3379;
    int _3395 = _3393 + 1;
    int _3397 = _3363 ^ _3383;
    bool _3399 = !_3385;
    int _3401 = _3399 ? _3355 : (-1);
    float _3403 = _2609 + (-0.5);
    bool _3405 = !_3387;
    int _3407 = _3405 ? _3395 : (-1);
    int _3409 = ~_3383;
    int _3411 = _3409 + _3397;
    int _3413 = _3411 + 1;
    float _3415 = _3283 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    bool _3417 = !_3321;
    int _3419 = _3417 ? _3313 : (-1);
    float _3421 = float(_3401);
    float _3423 = _3371 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _3425 = float(_3407);
    float _3427 = float(_3419);
    float _3429 = fma(_3347, _3421, _789);
    bool _3431 = !_3325;
    int _3433 = _3431 ? _3413 : (-1);
    float _3435 = -_773;
    float _3437 = fma(_3423, _3425, _3435);
    float _3439 = _3045 + 0.5;
    float _3441 = fma(_3415, _3427, _545);
    float _3443 = _3041 + 0.5;
    float _3445 = -_3423;
    float _3447 = fma(_3445, _3403, _3437);
    float _3449 = -_775;
    float _3451 = _3449 + 1.0;
    float _3453 = float(_3433);
    float _3455 = fma(_3415, _3443, _3441);
    float _3457 = fma(_3205, _345, _3303);
    float _3459 = fma(_2609, _3451, _3447);
    float _3461 = _2497 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _3463 = _2497 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _3465 = -_579;
    float _3467 = fma(_3389, _3453, _3465);
    out.m_80.x = _3323;
    out.m_80.y = _3331;
    out.m_80.z = _3457;
    float _3469 = fma(_1611, (*spvDescriptorSet0.vp_c8)._m0[11].x, _3461);
    float _3471 = _3037 + (-0.5);
    float _3473 = fma(_1611, (*spvDescriptorSet0.vp_c8)._m0[10].x, _3463);
    float _3475 = fma(_3347, _3439, _3429);
    float _3477 = fma(_1617, (*spvDescriptorSet0.vp_c8)._m0[11].z, _3469);
    float _3479 = -_3389;
    float _3481 = fma(_3479, _3471, _3467);
    float _3483 = fma(_1617, (*spvDescriptorSet0.vp_c8)._m0[10].z, _3473);
    float _3485 = -_805;
    float _3487 = _3485 + 1.0;
    float _3489 = -_645;
    float _3491 = _3489 + 1.0;
    float _3493 = -_807;
    float _3495 = _3493 + 1.0;
    float _3497 = _3483 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _3499 = _3477 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _3501 = -_3487;
    float _3503 = fma(_3041, _3501, _3455);
    float _3505 = -_3491;
    float _3507 = fma(_3045, _3505, _3475);
    float _3509 = fma(_3037, _3495, _3481);
    float _3511 = 1.0 / _3499;
    float _3513 = _3497 + _3499;
    float _3515 = fma(_3117, _287, _3223);
    float _3517 = fma(_3117, _283, _3241);
    out.m_82.x = _3503;
    out.m_82.y = _3509;
    out.m_82.z = _3507;
    out.m_82.w = _3459;
    float _3519 = fma(_3153, _345, _3335);
    float _3521 = fma(_3153, _341, _3515);
    float _3523 = fma(_3153, _337, _3517);
    bool _3525 = _2120 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _3527 = isnan(_2120);
    bool _3529 = _3525 || _3527;
    bool _3531 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _3533 = _3529 || _3531;
    out.m_84.x = _3521;
    out.m_84.y = _3523;
    out.m_84.z = _3519;
    float _3535 = _3513 * _3511;
    float _3537 = _3535 * 0.5;
    float _3539 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _3541 = fma(_3537, (*spvDescriptorSet0.vp_c8)._m0[30].w, _3539);
    float _3543 = in.m_66.x;
    float _3545 = 1.0 / _3541;
    float _3547 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _3549 = _3545 * _3547;
    float _3551 = abs(_3549);
    float _3553 = log2(_3551);
    bool _3555 = _3549 <= 8000.0;
    bool _3557 = isnan(_3549);
    bool _3559 = _3555 || _3557;
    bool _3561 = isnan(8000.0);
    bool _3563 = _3559 || _3561;
    float _3565 = float(_3563);
    float _3567 = _3553 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _3569 = _2314 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _3571 = fma(_2366, (*spvDescriptorSet0.vp_c8)._m0[6].x, _3569);
    float _3573 = exp2(_3567);
    float _3575 = fma(_2310, (*spvDescriptorSet0.vp_c8)._m0[6].z, _3571);
    float _3577 = fma(_3573, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _3579 = precise::clamp(_3577, 0.0, 1.0);
    float _3581 = fma(_2312, (*spvDescriptorSet0.vp_c8)._m0[6].w, _3575);
    float _3583 = fma(_3579, -2.0, 3.0);
    float _3585 = _3579 * _3579;
    out.gl_Position.x = _2424;
    out.gl_Position.y = _2426;
    out.gl_Position.z = _3581;
    out.gl_Position.w = _2398;
    float _3587 = _3585 * _3583;
    float _3589 = -_3587;
    float _3591 = _3589 + 1.0;
    float _3593 = fma(_3591, (*spvDescriptorSet0.vp_c15)._m0[654].w, _3587);
    float _3595 = _3581 + _2398;
    float _3597 = _3565 * _3593;
    float _3599 = _2553 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _3601 = _3595 * 0.5;
    float _3603 = _2398;
    float _3605 = _3601;
    float _3607 = _3581;
    if (!_3533)
    {
        _2575 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _3609 = _2575;
    float _3611 = _3597 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _3613 = _3599 * _2456;
    float _3615 = -_3599;
    float _3617 = _3615 + 1.0;
    out.m_86.z = _3601;
    out.m_86.w = _2398;
    float _3619 = _3251 * _3611;
    float _3621 = precise::clamp(_3619, 0.0, 1.0);
    float _3623 = _2467 * _3613;
    float _3625 = _2477 * _3613;
    float _3627 = _2467 * _3617;
    float _3629 = -_3621;
    float _3631 = fma(_3629, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _3633 = fma(_2473, _3623, _2461);
    float _3635 = fma(_2475, _3623, _2463);
    float _3637 = fma(_2467, _3625, _2465);
    float _3639 = _3631 * _3543;
    float _3641 = _3617;
    float _3643 = _3609;
    float _3645 = _3609;
    if (!_3533)
    {
        _3603 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _3647 = _3603;
    float _3649 = _3647;
    float _3651 = _3647;
    if (!_3533)
    {
        _3605 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _3653 = _3605;
    float _3655 = _3639 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    out.m_88.x = _3633;
    out.m_88.y = _3635;
    out.m_88.z = _3637;
    out.m_88.w = _3627;
    float _3657 = _3653;
    float _3659 = _3653;
    if (!_3533)
    {
        _3607 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _3661 = _3607;
    float _3663 = _3661;
    float _3665 = _3661;
    if (!_3533)
    {
        _2577 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _3667 = _2577;
    out.m_90.x = _3655;
    float _3669 = _3667;
    float _3671 = _3667;
    if (!_3533)
    {
        _3641 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _3673 = _3641;
    bool _3675 = !_3533;
    float _3677 = _3673;
    float _3679 = _3673;
    if (!_3675)
    {
        bool _3681 = _2120 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _3683 = isnan(_2120);
        bool _3685 = _3681 || _3683;
        bool _3687 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _3689 = _3685 || _3687;
        if (!_3689)
        {
            float _3691 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _3693 = _2120 + _3691;
            float _3695 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _3697 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _3695;
            float _3699 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _3701 = _3699 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _3703 = 1.0 / _3697;
            float _3705 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _3707 = _3705 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _3709 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _3711 = _3709 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _3713 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _3715 = _3713 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _3717 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _3719 = _3717 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _3721 = _3693 * _3703;
            float _3723 = precise::clamp(_3721, 0.0, 1.0);
            float _3725 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _3727 = _3725 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _3729 = fma(_3723, _3701, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _3731 = fma(_3723, _3727, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _3733 = fma(_3723, _3707, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _3735 = fma(_3723, _3711, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _3737 = fma(_3723, _3715, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _3739 = fma(_3723, _3719, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _3659 = _3733;
            _3671 = _3737;
            _3651 = _3729;
            _3665 = _3735;
            _3645 = _3731;
            _3679 = _3739;
            _3741 = true;
        }
        else
        {
            bool _3743 = _2120 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _3745 = isnan(_2120);
            bool _3747 = _3743 || _3745;
            bool _3749 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _3751 = _3747 || _3749;
            if (!_3751)
            {
                _3649 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _3753 = _3649;
            _3651 = _3753;
            if (!_3751)
            {
                _3657 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _3755 = _3657;
            _3659 = _3755;
            if (!_3751)
            {
                _3643 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _3757 = _3643;
            _3645 = _3757;
            if (!_3751)
            {
                _3663 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _3759 = _3663;
            _3665 = _3759;
            if (!_3751)
            {
                _3669 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _3761 = _3669;
            _3671 = _3761;
            if (!_3751)
            {
                _3677 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _3763 = _3677;
            bool _3765 = !_3751;
            _3679 = _3763;
            if (!_3765)
            {
                bool _3767 = _2120 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _3769 = isnan(_2120);
                bool _3771 = _3767 || _3769;
                bool _3773 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _3775 = _3771 || _3773;
                if (!_3775)
                {
                    float _3777 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _3779 = _2120 + _3777;
                    float _3781 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _3783 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _3781;
                    float _3785 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _3787 = _3785 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _3789 = 1.0 / _3783;
                    float _3791 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _3793 = _3791 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _3795 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _3797 = _3795 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _3799 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _3801 = _3799 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _3803 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _3805 = _3803 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _3807 = _3779 * _3789;
                    float _3809 = precise::clamp(_3807, 0.0, 1.0);
                    float _3811 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _3813 = _3811 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _3815 = fma(_3809, _3787, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _3817 = fma(_3809, _3813, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _3819 = fma(_3809, _3793, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _3821 = fma(_3809, _3797, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _3823 = fma(_3809, _3801, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _3825 = fma(_3809, _3805, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _3659 = _3819;
                    _3671 = _3823;
                    _3651 = _3815;
                    _3665 = _3821;
                    _3645 = _3817;
                    _3679 = _3825;
                    _3741 = true;
                }
                else
                {
                    _3659 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _3671 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _3651 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _3665 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _3645 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _3679 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _3741 = false;
    float _3827 = _3659;
    float _3829 = _3671;
    float _3831 = _3651;
    float _3833 = _3665;
    float _3835 = _3645;
    float _3837 = _3679;
    float _3839 = fma(_3523, -0.5, 0.5);
    float _3841 = precise::clamp(_3839, 0.0, 1.0);
    float _3843 = -_3827;
    float _3845 = _3843 + _3829;
    float _3847 = -_3831;
    float _3849 = _3847 + _3833;
    float _3851 = -_3835;
    float _3853 = _3851 + _3837;
    bool _3855 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _3857 = fma(_3841, _3845, _3827);
    float _3859 = fma(_3841, _3849, _3831);
    float _3861 = fma(_3841, _3853, _3835);
    float _3863 = _3857 * 0.586610972881317138671875;
    out.m_51.x = 1.0;
    float _3865 = fma(_3859, 0.298911988735198974609375, _3863);
    float _3867 = fma(_3861, 0.114477999508380889892578125, _3865);
    out.m_92.x = 0.0;
    float _3869 = -_3867;
    float _3871 = _3859 + _3869;
    float _3873 = -_3867;
    float _3875 = _3857 + _3873;
    float _3877 = -_3867;
    float _3879 = _3861 + _3877;
    float _3881 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _3883 = fma(_3871, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3867);
    float _3885 = fma(_3875, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3867);
    float _3887 = fma(_3879, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3867);
    out.m_90.w = _3881;
    out.m_94.x = _3883;
    out.m_94.y = _3885;
    out.m_94.z = _3887;
    if (!_3855)
    {
        return out;
    }
    float _3889 = -_2102;
    float _3891 = _3889 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
    float _3893 = -_1603;
    float _3895 = _3893 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
    float _3897 = -_2098;
    float _3899 = _3897 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
    float _3901 = _3891 * _3891;
    float _3903 = fma(_3895, _3895, _3901);
    float _3905 = fma(_3899, _3899, _3903);
    float _3907 = sqrt(_3905);
    float _3909 = rsqrt(_3905);
    float _3911 = -_3907;
    float _3913 = _3911 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _3915 = _3913 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
    float _3917 = precise::clamp(_3915, 0.0, 1.0);
    float _3919 = _3895 * _3909;
    float _3921 = _3891 * _3909;
    float _3923 = abs(_3917);
    float _3925 = log2(_3923);
    float _3927 = _3899 * _3909;
    float _3929 = _3919 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
    float _3931 = _3523 * _3921;
    float _3933 = -_3921;
    float _3935 = -_3929;
    float _3937 = fma(_3933, (*spvDescriptorSet0.vp_c15)._m0[656].y, _3935);
    float _3939 = fma(_3521, _3919, _3931);
    float _3941 = -_3927;
    float _3943 = fma(_3941, (*spvDescriptorSet0.vp_c15)._m0[656].z, _3937);
    float _3945 = fma(_3519, _3927, _3939);
    float _3947 = precise::clamp(_3945, 0.0, 1.0);
    float _3949 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
    float _3951 = _3943 + _3949;
    float _3953 = _3925 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
    float _3955 = _3951 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
    float _3957 = precise::clamp(_3955, 0.0, 1.0);
    float _3959 = exp2(_3953);
    float _3961 = _3959 * _3957;
    float _3963 = _3947 * _3961;
    float _3965 = _3963 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
    float _3967 = _3963 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
    float _3969 = _3963 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
    out.m_92.x = _3965;
    out.m_92.y = _3967;
    out.m_92.z = _3969;
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
    bool _3741 = false;
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
        float _4026 = as_type<float>(_129);
        out.gl_Position.z = _4026;
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
        float _4095 = as_type<float>(_167);
        out.gl_Position.z = _4095;
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
    int _219 = as_type<int>(_185);
    if (_211)
    {
        float _221 = rsqrt(_201);
        _217 = _221;
    }
    float _223 = _217;
    float _225 = 0.0;
    float _227 = 0.0;
    if (!_211)
    {
        _225 = 0.0;
        _227 = 0.0;
    }
    float _229 = _225;
    float _231 = _227;
    float _233 = 0.0;
    float _235 = _231;
    float _237 = _229;
    if (!_211)
    {
        _233 = 0.0;
    }
    float _239 = _233;
    bool _241 = _213 > 0.0;
    float _243 = _213;
    float _245 = _239;
    if (_215)
    {
        float _247 = rsqrt(_203);
        _243 = _247;
    }
    float _249 = _243;
    int _251 = as_type<int>(_187) & 1;
    bool _253 = _251 != 0;
    int _255 = as_type<int>(_187) & 2;
    bool _257 = _255 != 0;
    float _259 = 0.0;
    float _261 = 0.0;
    if (!_215)
    {
        _259 = 0.0;
        _261 = 0.0;
    }
    float _263 = _259;
    float _265 = _261;
    float _267 = 0.0;
    float _269 = _265;
    float _271 = _263;
    if (!_215)
    {
        _267 = 0.0;
    }
    float _273 = _267;
    bool _275 = !_253;
    float _277 = _275 ? (-0.5) : 0.5;
    float _279 = _273;
    if (_211)
    {
        float _281 = _223 * _169;
        _235 = _281;
    }
    float _283 = _235;
    if (_211)
    {
        float _285 = _223 * _175;
        _237 = _285;
    }
    float _287 = _237;
    float _289 = _209;
    if (_241)
    {
        float _291 = rsqrt(_205);
        _289 = _291;
    }
    float _293 = _289;
    if (_211)
    {
        float _295 = _223 * _181;
        _245 = _295;
    }
    float _297 = _245;
    bool _299 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _301 = 0.0;
    if (!_241)
    {
        _301 = 0.0;
    }
    float _303 = _301;
    float _305 = 0.0;
    float _307 = _303;
    if (!_241)
    {
        _305 = 0.0;
    }
    float _309 = _305;
    float _311 = _309;
    if (_215)
    {
        float _313 = _249 * _171;
        _269 = _313;
    }
    float _315 = _269;
    float _317 = 0.0;
    if (!_241)
    {
        _317 = 0.0;
    }
    float _319 = _317;
    float _321 = _319;
    if (_215)
    {
        float _323 = _249 * _177;
        _271 = _323;
    }
    float _325 = _271;
    if (_215)
    {
        float _327 = _249 * _183;
        _279 = _327;
    }
    float _329 = _279;
    bool _331 = !_257;
    float _333 = _331 ? (-0.5) : 0.5;
    if (_241)
    {
        float _335 = _293 * _173;
        _307 = _335;
    }
    float _337 = _307;
    if (_241)
    {
        float _339 = _293 * _179;
        _311 = _339;
    }
    float _341 = _311;
    if (_241)
    {
        float _343 = _293 * _185;
        _321 = _343;
    }
    float _345 = _321;
    bool _347 = !_299;
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
    float _383 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
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
    float _411 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _413 = _411 + (*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _415 = -(*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _417 = (*spvDescriptorSet0.vp_c9)._m0[148].w + _415;
    float _419 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _421 = _375 + _419;
    float _423 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _425 = _375 + _423;
    float _427 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _429 = _375 + _427;
    float _431 = 1.0 / _407;
    float _433 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    bool _435 = _375 >= (*spvDescriptorSet0.vp_c9)._m0[148].w;
    bool _437 = isnan(_375);
    bool _439 = _435 || _437;
    bool _441 = isnan((*spvDescriptorSet0.vp_c9)._m0[148].w);
    bool _443 = _439 || _441;
    float _445 = float(_443);
    float _447 = in.m_59.w;
    bool _449 = _375 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _451 = isnan(_375);
    bool _453 = _449 || _451;
    bool _455 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _457 = _453 || _455;
    float _459 = float(_457);
    float _461 = _183 * _379;
    float _463 = _177 * _379;
    float _465 = 1.0 / _395;
    float _467 = -(*spvDescriptorSet0.vp_c9)._m0[149].w;
    float _469 = (*spvDescriptorSet0.vp_c9)._m0[150].w + _467;
    float _471 = _379 + _387;
    float _473 = fma(_181, _377, _461);
    float _475 = fma(_175, _377, _463);
    float _477 = _397 * 2.0;
    int _479 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _481 = _479 != 0;
    float _483 = 1.0 / _413;
    float _485 = -(*spvDescriptorSet0.vp_c9)._m0[148].w;
    float _487 = _485 + (*spvDescriptorSet0.vp_c9)._m0[149].w;
    float _489 = fma(_185, _381, _473);
    float _491 = _397 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _493 = fma(_179, _381, _475);
    float _495 = float(_113);
    float _497 = _385 * _431;
    float _499 = -_433;
    float _501 = fma(_491, 2.0, _499);
    float _503 = 1.0 / _417;
    float _505 = -(*spvDescriptorSet0.vp_c9)._m0[149].w;
    float _507 = _375 + _505;
    float _509 = -(*spvDescriptorSet0.vp_c9)._m0[148].w;
    float _511 = _375 + _509;
    if (_481)
    {
        _219 = 0;
    }
    int _513 = _219;
    float _515 = _421 * _409;
    int _517 = _513;
    if (!_481)
    {
        _517 = 1;
    }
    int _519 = _517;
    float _521 = 1.0 / _469;
    float _523 = _399 * 2.0;
    float _525 = _425 * _465;
    bool _527 = _519 != 1;
    float _529 = -(*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _531 = _375 + _529;
    float _533 = _429 * _483;
    float _535 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _537 = 1.0 / _487;
    float _539 = _399 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _541 = _531 * _503;
    float _543 = -_147;
    float _545 = fma(_543, (*spvDescriptorSet0.vp_c9)._m0[76].x, _501);
    float _547 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _549 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _547;
    float _551 = floor(_523);
    float _553 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _555 = _401 * 2.0;
    float _557 = as_type<float>(_519);
    if (!_527)
    {
        _557 = _399;
    }
    float _559 = _557;
    float _561 = _507 * _521;
    float _563 = fma(_539, -2.0, _553);
    float _565 = _559;
    if (_527)
    {
        _565 = _397;
    }
    float _567 = _565;
    float _569 = fma(_549, _515, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _571 = floor(_477);
    float _573 = _511 * _537;
    float _575 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _577 = _575 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _579 = fma(_147, (*spvDescriptorSet0.vp_c9)._m0[76].y, _563);
    float _581 = _401 + _397;
    float _583 = fma(_577, _525, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _585 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _587 = int(_585);
    bool _589 = _551 > 0.0;
    float _591 = in.m_57.w;
    bool _593 = _551 >= 0.0;
    bool _595 = isnan(_551);
    bool _597 = _593 || _595;
    bool _599 = isnan(0.0);
    bool _601 = _597 || _599;
    float _603 = -(*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _605 = (*spvDescriptorSet0.vp_c9)._m0[148].y + _603;
    float _607 = _489 + _447;
    int _609 = _601 ? 0 : 1;
    float _611 = floor(_555);
    bool _613 = _571 > 0.0;
    float _615 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    bool _617 = _571 >= 0.0;
    bool _619 = isnan(_571);
    bool _621 = _617 || _619;
    bool _623 = isnan(0.0);
    bool _625 = _621 || _623;
    float _627 = _477 + (-1.0);
    int _629 = ~_609;
    int _631 = _629 + 1;
    int _633 = _631 + 1;
    float _635 = fma(_567, (*spvDescriptorSet0.vp_c9)._m0[83].z, _615);
    int _637 = _625 ? 0 : 1;
    float _639 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _641 = log2(_639);
    float _643 = float(_587);
    float _645 = fma(_147, (*spvDescriptorSet0.vp_c9)._m0[82].z, _635);
    float _647 = as_type<float>(_587);
    int _649 = _633;
    float _651 = _615;
    float _653 = _567;
    if (!_527)
    {
        _647 = _399;
    }
    float _655 = _647;
    float _657 = _655;
    if (!_589)
    {
        int _659 = ~_609;
        int _661 = _659 + 1;
        _649 = _661;
    }
    int _663 = _649;
    if (!_527)
    {
        _651 = _401;
    }
    float _665 = _651;
    float _667 = 1.0 / _643;
    float _669 = _665;
    if (_527)
    {
        _657 = _397;
    }
    float _671 = _657;
    float _673 = _493 + _591;
    if (_527)
    {
        _669 = _399;
    }
    float _675 = _669;
    int _677 = ~_637;
    int _679 = _677 + 1;
    int _681 = _679 + 1;
    float _683 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    int _685 = _681;
    if (!_613)
    {
        int _687 = ~_637;
        int _689 = _687 + 1;
        _685 = _689;
    }
    int _691 = _685;
    float _693 = _671 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _695 = _675 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _697 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].y);
    int _699 = int(_697);
    if (!_527)
    {
        _653 = _401;
    }
    float _701 = _653;
    float _703 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _705 = _701;
    if (_527)
    {
        _705 = _399;
    }
    float _707 = _705;
    float _709 = fma(_695, -2.0, _683);
    bool _711 = _611 >= 0.0;
    bool _713 = isnan(_611);
    bool _715 = _711 || _713;
    bool _717 = isnan(0.0);
    bool _719 = _715 || _717;
    float _721 = -_703;
    float _723 = fma(_693, 2.0, _721);
    bool _725 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _727 = isnan(0.0);
    bool _729 = _725 || _727;
    bool _731 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _733 = _729 || _731;
    float _735 = fma(_707, (*spvDescriptorSet0.vp_c9)._m0[83].w, _535);
    float _737 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _739 = 1.0 + _737;
    bool _741 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _743 = isnan(1.0);
    bool _745 = _741 || _743;
    bool _747 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _749 = _745 || _747;
    float _751 = _641 * _147;
    float _753 = 1.0 / _739;
    int _755 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _757 = _755 != 0;
    int _759 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _761 = _759 != 0;
    int _763 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _765 = _763 != 0;
    float _767 = _667 * _147;
    float _769 = float(_699);
    float _771 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _773 = fma(_147, (*spvDescriptorSet0.vp_c9)._m0[81].y, _709);
    float _775 = fma(_147, (*spvDescriptorSet0.vp_c9)._m0[82].w, _735);
    float _777 = exp2(_751);
    bool _779 = !_761;
    int _781 = _779 ? 0 : 1;
    float _783 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    bool _785 = _611 > 0.0;
    float _787 = -_147;
    float _789 = fma(_787, (*spvDescriptorSet0.vp_c9)._m0[81].x, _723);
    bool _791 = !_765;
    int _793 = _791 ? 0 : 1;
    float _795 = fma(_397, (*spvDescriptorSet0.vp_c9)._m0[78].z, _783);
    float _797 = float(_663);
    float _799 = 1.0 / _495;
    float _801 = fma(_399, (*spvDescriptorSet0.vp_c9)._m0[78].w, _771);
    float _803 = _397 + _399;
    float _805 = fma(_147, (*spvDescriptorSet0.vp_c9)._m0[77].z, _795);
    float _807 = fma(_147, (*spvDescriptorSet0.vp_c9)._m0[77].w, _801);
    int _809 = _719 ? 0 : 1;
    float _811 = _803 + (-1.0);
    float _813 = 1.0 / _769;
    float _815 = -_777;
    float _817 = _815 + 1.0;
    int _819 = ~_809;
    int _821 = _819 + 1;
    int _823 = _821 + 1;
    float _825 = fma(_811, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    int _827 = _823;
    if (!_785)
    {
        int _829 = ~_809;
        int _831 = _829 + 1;
        _827 = _831;
    }
    int _833 = _827;
    float _835 = _401 + _399;
    float _837 = _733 ? _817 : 0.0;
    float _839 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[201].y;
    float _841 = _835 + (-1.0);
    float _843 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _845 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _843;
    float _847 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _849 = _847 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _851 = _799 * _147;
    float _853 = fma(_841, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _855 = fma(_845, _515, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _857 = fma(_849, _525, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    bool _859 = _375 >= (*spvDescriptorSet0.vp_c9)._m0[150].w;
    bool _861 = isnan(_375);
    bool _863 = _859 || _861;
    bool _865 = isnan((*spvDescriptorSet0.vp_c9)._m0[150].w);
    bool _867 = _863 || _865;
    float _869 = float(_867);
    float _871 = _813 * _147;
    bool _873 = _375 >= (*spvDescriptorSet0.vp_c9)._m0[149].w;
    bool _875 = isnan(_375);
    bool _877 = _873 || _875;
    bool _879 = isnan((*spvDescriptorSet0.vp_c9)._m0[149].w);
    bool _881 = _877 || _879;
    float _883 = float(_881);
    float _885 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _887 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _885;
    if (_749)
    {
        float _889 = _837 * _753;
        _151 = _889;
    }
    float _891 = _151;
    float _893 = -_869;
    float _895 = _893 + 1.0;
    float _897 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _899 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _897;
    float _901 = fma(_887, _497, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _903 = -_883;
    float _905 = _903 + 1.0;
    float _907 = _883 * _895;
    float _909 = -(*spvDescriptorSet0.vp_c9)._m0[146].x;
    float _911 = _909 + (*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _913 = fma(_899, _497, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _915 = -(*spvDescriptorSet0.vp_c9)._m0[146].y;
    float _917 = _915 + (*spvDescriptorSet0.vp_c9)._m0[147].y;
    bool _919 = _375 >= (*spvDescriptorSet0.vp_c9)._m0[147].w;
    bool _921 = isnan(_375);
    bool _923 = _919 || _921;
    bool _925 = isnan((*spvDescriptorSet0.vp_c9)._m0[147].w);
    bool _927 = _923 || _925;
    float _929 = float(_927);
    float _931 = _445 * _905;
    float _933 = fma(_911, _533, (*spvDescriptorSet0.vp_c9)._m0[146].x);
    float _935 = -_445;
    float _937 = _935 + 1.0;
    float _939 = fma(_917, _533, (*spvDescriptorSet0.vp_c9)._m0[146].y);
    bool _941 = _375 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _943 = isnan(_375);
    bool _945 = _941 || _943;
    bool _947 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _949 = _945 || _947;
    float _951 = float(_949);
    float _953 = -_929;
    float _955 = _953 + 1.0;
    float _957 = _929 * _937;
    bool _959 = _375 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _961 = isnan(_375);
    bool _963 = _959 || _961;
    bool _965 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _967 = _963 || _965;
    float _969 = float(_967);
    float _971 = _581 + (-1.0);
    bool _973 = _375 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _975 = isnan(_375);
    bool _977 = _973 || _975;
    bool _979 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _981 = _977 || _979;
    float _983 = float(_981);
    float _985 = _951 * _955;
    float _987 = -_951;
    float _989 = _987 + 1.0;
    int _991 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 256;
    bool _993 = _991 != 0;
    int _995 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 512;
    bool _997 = _995 != 0;
    int _999 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1024;
    bool _1001 = _999 != 0;
    int _1003 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2048;
    bool _1005 = _1003 != 0;
    float _1007 = -_969;
    float _1009 = _1007 + 1.0;
    float _1011 = -_983;
    float _1013 = _1011 + 1.0;
    float _1015 = _983 * _989;
    bool _1017 = !_757;
    int _1019 = _1017 ? 0 : 1;
    float _1021 = -(*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _1023 = (*spvDescriptorSet0.vp_c9)._m0[148].x + _1021;
    int _1025 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _1027 = _1025 != 0;
    int _1029 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _1031 = _1029 != 0;
    int _1033 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _1035 = _1033 != 0;
    float _1037 = _969 * _1013;
    float _1039 = fma(_605, _541, (*spvDescriptorSet0.vp_c9)._m0[147].y);
    float _1041 = fma(_1023, _541, (*spvDescriptorSet0.vp_c9)._m0[147].x);
    float _1043 = -(*spvDescriptorSet0.vp_c9)._m0[148].x;
    float _1045 = _1043 + (*spvDescriptorSet0.vp_c9)._m0[149].x;
    float _1047 = _459 * _1009;
    bool _1049 = !_1027;
    int _1051 = _1049 ? 0 : 1;
    float _1053 = -_459;
    float _1055 = _1053 + 1.0;
    float _1057 = -(*spvDescriptorSet0.vp_c9)._m0[148].y;
    float _1059 = _1057 + (*spvDescriptorSet0.vp_c9)._m0[149].y;
    float _1061 = _569 * _1047;
    int _1063 = abs(_1051);
    float _1065 = fma(_1045, _573, (*spvDescriptorSet0.vp_c9)._m0[148].x);
    float _1067 = fma(_1059, _573, (*spvDescriptorSet0.vp_c9)._m0[148].y);
    float _1069 = _891 + (*spvDescriptorSet0.vp_c9)._m0[202].y;
    float _1071 = _855 * _1047;
    float _1073 = fma(_1055, (*spvDescriptorSet0.vp_c9)._m0[143].x, _1061);
    float _1075 = float(_1063);
    float _1077 = _1069 * _839;
    float _1079 = float(_833);
    float _1081 = fma(_1055, (*spvDescriptorSet0.vp_c9)._m0[143].y, _1071);
    float _1083 = fma(_583, _1037, _1073);
    float _1085 = fma(_397, (*spvDescriptorSet0.vp_c9)._m0[203].y, _1077);
    bool _1087 = !_1031;
    int _1089 = _1087 ? 0 : 1;
    float _1091 = fma(_857, _1037, _1081);
    float _1093 = _1075 * _1079;
    float _1095 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1097 = _471 + _1095;
    float _1099 = in.m_68.x;
    float _1101 = in.m_68.y;
    float _1103 = in.m_68.z;
    float _1105 = fma(_901, _1015, _1083);
    bool _1107 = !_1035;
    int _1109 = _1107 ? 0 : 1;
    float _1111 = _1097 * _1097;
    float _1113 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1115 = _673 + _1113;
    float _1117 = floor(_1085);
    int _1119 = abs(_1109);
    float _1121 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1123 = _607 + _1121;
    float _1125 = fma(_1115, _1115, _1111);
    float _1127 = _1085 + 0.25;
    int _1129 = abs(_1089);
    float _1131 = fma(_913, _1015, _1091);
    float _1133 = fma(_1123, _1123, _1125);
    float _1135 = floor(_1127);
    float _1137 = _1093 * (-2.0);
    float _1139 = float(_691);
    float _1141 = fma(_933, _985, _1105);
    float _1143 = float(_1119);
    float _1145 = fma(_971, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    int _1147 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 32768;
    bool _1149 = _1147 != 0;
    float _1151 = rsqrt(_1133);
    bool _1153 = !_997;
    int _1155 = _1153 ? 0 : 1;
    float _1157 = _1143 * _797;
    bool _1159 = !_993;
    int _1161 = _1159 ? 0 : 1;
    float _1163 = _397 + (-0.5);
    int _1165 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 65536;
    bool _1167 = _1165 != 0;
    int _1169 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 131072;
    bool _1171 = _1169 != 0;
    float _1173 = fma(_1137, _1099, _1099);
    float _1175 = -_1117;
    float _1177 = _1085 + _1175;
    float _1179 = _1085 * 6.283185482025146484375;
    float _1181 = -_1135;
    float _1183 = _1127 + _1181;
    float _1185 = fma(_1163, (*spvDescriptorSet0.vp_c9)._m0[196].x, _1173);
    bool _1187 = !_1167;
    int _1189 = _1187 ? 0 : 1;
    float _1191 = _1179 * 0.15915493667125701904296875;
    bool _1193 = _1177 >= 0.5;
    bool _1195 = isnan(_1177);
    bool _1197 = _1193 || _1195;
    bool _1199 = isnan(0.5);
    bool _1201 = _1197 || _1199;
    float _1203 = fma(_825, _1137, _825);
    int _1205 = abs(_1189);
    float _1207 = _1097 * _1151;
    bool _1209 = _1183 > 0.5;
    float _1211 = _1191 * 6.283185482025146484375;
    float _1213 = sin(_1211);
    bool _1215 = !_1149;
    int _1217 = _1215 ? 0 : 1;
    float _1219 = -_1207;
    float _1221 = fma(_1219, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1097);
    float _1223 = _1115 * _1151;
    bool _1225 = !_1201;
    float _1227 = _1225 ? 0.5 : (-0.5);
    float _1229 = _1157 * (-2.0);
    int _1231 = abs(_1217);
    float _1233 = _1221 * _1221;
    float _1235 = float(_1205);
    float _1237 = -_1223;
    float _1239 = fma(_1237, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1115);
    float _1241 = _1227 * (*spvDescriptorSet0.vp_c9)._m0[200].y;
    float _1243 = _1241 * 2.0;
    float _1245 = _1183;
    if (_1209)
    {
        float _1247 = -_1183;
        float _1249 = _1247 + 1.0;
        _1245 = _1249;
    }
    float _1251 = _1245;
    bool _1253 = !_1171;
    int _1255 = _1253 ? 0 : 1;
    float _1257 = fma(_1239, _1239, _1233);
    float _1259 = _1235 * _1243;
    float _1261 = float(_1231);
    float _1263 = _1123 * _1151;
    int _1265 = abs(_1255);
    float _1267 = _1213 * (*spvDescriptorSet0.vp_c9)._m0[200].y;
    float _1269 = fma(_1251, 4.0, -1.0);
    float _1271 = -_1263;
    float _1273 = fma(_1271, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1123);
    float _1275 = float(_1265);
    float _1277 = fma(_1261, _1267, _1259);
    float _1279 = float(_1129);
    float _1281 = _1269 * (*spvDescriptorSet0.vp_c9)._m0[200].y;
    float _1283 = fma(_1203, _891, _1185);
    float _1285 = fma(_1145, _1229, _1145);
    float _1287 = fma(_1229, _1103, _1103);
    float _1289 = fma(_1275, _1281, _1277);
    float _1291 = _1279 * _1139;
    float _1293 = _401 + (-0.5);
    float _1295 = fma(_939, _985, _1131);
    float _1297 = fma(_1289, 3.1415927410125732421875, _1101);
    float _1299 = _1291 * (-2.0);
    float _1301 = fma(_1293, (*spvDescriptorSet0.vp_c9)._m0[196].z, _1287);
    float _1303 = _399 + (-0.5);
    float _1305 = fma(_1297, _1299, _1297);
    float _1307 = fma(_853, _1299, _853);
    float _1309 = fma(_1273, _1273, _1257);
    float _1311 = fma(_1303, (*spvDescriptorSet0.vp_c9)._m0[196].y, _1305);
    float _1313 = fma(_1041, _957, _1141);
    float _1315 = in.m_70.x;
    float _1317 = in.m_70.y;
    float _1319 = -(*spvDescriptorSet0.vp_c9)._m0[149].y;
    float _1321 = (*spvDescriptorSet0.vp_c9)._m0[150].y + _1319;
    float _1323 = fma(_1307, _891, _1311);
    float _1325 = fma(_1039, _957, _1295);
    float _1327 = -(*spvDescriptorSet0.vp_c9)._m0[149].x;
    float _1329 = (*spvDescriptorSet0.vp_c9)._m0[150].x + _1327;
    float _1331 = fma(_1321, _561, (*spvDescriptorSet0.vp_c9)._m0[149].y);
    float _1333 = sqrt(_1309);
    float _1335 = fma(_1067, _931, _1325);
    float _1337 = fma(_1329, _561, (*spvDescriptorSet0.vp_c9)._m0[149].x);
    float _1339 = fma(_1065, _931, _1313);
    float _1341 = fma(_1285, _891, _1301);
    float _1343 = fma(_1331, _907, _1335);
    float _1345 = _1283 * 0.15915493667125701904296875;
    float _1347 = fma(_1337, _907, _1339);
    float _1349 = _1341 * 0.15915493667125701904296875;
    float _1351 = _1323 * 0.15915493667125701904296875;
    float _1353 = fma(_869, (*spvDescriptorSet0.vp_c9)._m0[150].y, _1343);
    float _1355 = fma(_869, (*spvDescriptorSet0.vp_c9)._m0[150].x, _1347);
    float _1357 = _1345 * 6.283185482025146484375;
    float _1359 = sin(_1357);
    float _1361 = fma(_627, (*spvDescriptorSet0.vp_c9)._m0[191].x, _333);
    float _1363 = _1151 * _1333;
    float _1365 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _1361);
    float _1367 = _1355 * _1315;
    float _1369 = _1353 * _1317;
    float _1371 = _1345 * 6.283185482025146484375;
    float _1373 = cos(_1371);
    float _1375 = _1367 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1377 = _1369 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1379 = _1375 * _1363;
    float _1381 = _1377 * _1363;
    float _1383 = _1349 * 6.283185482025146484375;
    float _1385 = cos(_1383);
    float _1387 = fma(_627, (*spvDescriptorSet0.vp_c9)._m0[191].x, _277);
    float _1389 = _1363 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _1391 = _1389 * 0.5;
    float _1393 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _1387);
    float _1395 = _1351 * 6.283185482025146484375;
    float _1397 = sin(_1395);
    float _1399 = _1379 * _1393;
    float _1401 = _1381 * _1365;
    float _1403 = _1351 * 6.283185482025146484375;
    float _1405 = cos(_1403);
    float _1407 = _1373 * _1385;
    float _1409 = _1359 * _1385;
    float _1411 = _1407 * _1391;
    float _1413 = _1349 * 6.283185482025146484375;
    float _1415 = sin(_1413);
    float _1417 = _1359 * _1397;
    float _1419 = _1373 * _1405;
    float _1421 = _1359 * _1405;
    float _1423 = _1373 * _1397;
    float _1425 = _1405 * _1385;
    float _1427 = _1397 * _1385;
    float _1429 = fma(_1415, _1419, _1417);
    float _1431 = _1415 * _1391;
    float _1433 = -_1421;
    float _1435 = fma(_1415, _1423, _1433);
    float _1437 = -_1423;
    float _1439 = fma(_1415, _1421, _1437);
    float _1441 = fma(_1429, _1399, _1411);
    float _1443 = _1409 * _1391;
    float _1445 = -_1431;
    float _1447 = fma(_1425, _1399, _1445);
    float _1449 = fma(_1415, _1417, _1419);
    float _1451 = -_1401;
    float _1453 = fma(_1435, _1451, _1441);
    float _1455 = fma(_1439, _1399, _1443);
    float _1457 = -_1401;
    float _1459 = fma(_1427, _1457, _1447);
    bool _1461 = !_1001;
    int _1463 = _1461 ? 0 : 1;
    float _1465 = _1453 * _329;
    float _1467 = -_1401;
    float _1469 = fma(_1449, _1467, _1455);
    float _1471 = _1453 * _325;
    float _1473 = _1453 * _315;
    float _1475 = fma(_1459, _297, _1465);
    float _1477 = fma(_1459, _287, _1471);
    float _1479 = fma(_1459, _283, _1473);
    float _1481 = fma(_1469, _345, _1475);
    float _1483 = fma(_1469, _341, _1477);
    float _1485 = fma(_1469, _337, _1479);
    float _1487 = _607 + _1481;
    float _1489 = _673 + _1483;
    float _1491 = _471 + _1485;
    float _1493 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1495 = _1487 + _1493;
    float _1497 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1499 = _1489 + _1497;
    float _1501 = _1495 * _1495;
    float _1503 = fma(_1499, _1499, _1501);
    bool _1505 = !_1005;
    int _1507 = _1505 ? 0 : 1;
    float _1509 = sqrt(_1503);
    bool _1511 = _1509 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1513 = _1479;
    float _1515 = _1485;
    float _1517 = _1489;
    float _1519 = _1495;
    float _1521 = _1263;
    if (!_1511)
    {
        _1513 = _1489;
    }
    float _1523 = _1513;
    float _1525 = _1523;
    if (!_1511)
    {
        _1515 = _1487;
    }
    float _1527 = _1515;
    float _1529 = _1527;
    if (!_1511)
    {
        _1517 = _1491;
    }
    float _1531 = _1517;
    bool _1533 = !_1511;
    float _1535 = _1531;
    if (!_1533)
    {
        float _1537 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1539 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1541 = _1509 + _1539;
        float _1543 = rsqrt(_1503);
        float _1545 = _1541 * _1537;
        float _1547 = _1491 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1549 = _1545 * 0.15915493667125701904296875;
        float _1551 = _1549 * 6.283185482025146484375;
        float _1553 = cos(_1551);
        float _1555 = _1549 * 6.283185482025146484375;
        float _1557 = sin(_1555);
        float _1559 = _1553 + (-1.0);
        float _1561 = fma(_1557, _1547, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1563 = _1559 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1565 = _1543 * _1561;
        float _1567 = fma(_1491, _1553, _1563);
        float _1569 = fma(_1499, _1565, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1571 = fma(_1495, _1565, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1525 = _1569;
        _1529 = _1571;
        _1535 = _1567;
    }
    float _1573 = _1525;
    float _1575 = _1529;
    float _1577 = _1535;
    float _1579 = -(*spvDescriptorSet0.vp_c15)._m0[630].x;
    float _1581 = _1573 + _1579;
    float _1583 = -(*spvDescriptorSet0.vp_c15)._m0[630].y;
    float _1585 = _1575 + _1583;
    float _1587 = fma(_1581, (*spvDescriptorSet0.vp_c15)._m0[630].z, 0.5);
    float _1589 = fma(_1585, (*spvDescriptorSet0.vp_c15)._m0[630].z, 0.5);
    float2 _6238 = float2(_1587, _1589);
    float _1591 = dm_bs(spvDescriptorSet0.vp_t_tcb_28.sample(spvDescriptorSet0.vp_t_tcb_28Smplr, select(_6238, float2(0.0), isnan(_6238)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_28, spvDescriptorSet0.vp_t_tcb_28Smplr_w, select(_6238, float2(0.0), isnan(_6238)), level(0.0)).x;
    float _1593 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _1595 = int(_1593);
    int _1597 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _1599 = _1597 != 0;
    float _1601 = -_1223;
    float _1603 = fma(_1601, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1573);
    int _1605 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _1607 = _1605 != 0;
    float _1609 = -_1223;
    float _1611 = fma(_1609, (*spvDescriptorSet0.vp_c9)._m0[18].w, _673);
    int _1613 = abs(_781);
    float _1615 = -_1263;
    float _1617 = fma(_1615, (*spvDescriptorSet0.vp_c9)._m0[18].w, _607);
    int _1619 = abs(_1155);
    float _1621 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].x);
    int _1623 = int(_1621);
    int _1625 = abs(_1463);
    if (_1599)
    {
        float _1627 = in.m_64.x;
        _1519 = _1627;
    }
    float _1629 = _1519;
    float _1631 = float(uint(_1595));
    float _1633 = trunc(_767);
    int _1635 = int(_1633);
    float _1637 = trunc(_871);
    int _1639 = int(_1637);
    float _1641 = float(uint(_1623));
    float _1643 = _1629;
    if (!_1599)
    {
        float _1645 = in.m_64.y;
        _1643 = _1645;
    }
    float _1647 = _1643;
    int _1649 = ~_1595;
    int _1651 = _1649 + 1;
    float _1653 = float(_1623);
    bool _1655 = _1595 == 0;
    float _1657 = 1.0 / _1631;
    float _1659 = float(uint(_1635));
    int _1661 = ~_1623;
    int _1663 = _1661 + 1;
    float _1665 = 1.0 / _1641;
    float _1667 = float(uint(_1639));
    int _1669 = as_type<int>(_1657) + (-2);
    float _1671 = as_type<float>(_1669) * _1659;
    int _1673 = as_type<int>(_1665) + (-2);
    float _1675 = trunc(_1671);
    float _1677 = precise::max(_1675, 0.0);
    uint _1680 = uint(_1677);
    float _1682 = as_type<float>(_1673) * _1667;
    float _1684 = trunc(_1682);
    float _1686 = precise::max(_1684, 0.0);
    uint _1688 = uint(_1686);
    int _1690 = ~_1623;
    int _1692 = _1690 + 1;
    int _1694 = _1651 * int(_1680);
    int _1696 = _1694 + _1635;
    float _1698 = as_type<float>(_1651);
    float _1700 = as_type<float>(_1696);
    if (_1599)
    {
        _1698 = 1.0;
    }
    float _1702 = _1698;
    float _1704 = _1702;
    if (!_1599)
    {
        _1704 = 7.345489978790283203125;
    }
    float _1706 = _1704;
    float _1708 = float(uint(_1696));
    if (_1599)
    {
        _1700 = 1.0;
    }
    float _1710 = _1700;
    int _1712 = _1692 * int(_1688);
    int _1714 = _1712 + _1639;
    float _1716 = _1710;
    if (!_1599)
    {
        _1716 = 1.2345600128173828125;
    }
    float _1718 = _1716;
    float _1720 = as_type<float>(_1669) * _1708;
    float _1722 = _1706 * _397;
    float _1724 = float(uint(_1714));
    float _1726 = _1647 * _1718;
    float _1728 = floor(_1722);
    int _1730 = ~_1595;
    int _1732 = _1730 + 1;
    float _1734 = as_type<float>(_1673) * _1724;
    float _1736 = trunc(_1720);
    float _1738 = precise::max(_1736, 0.0);
    uint _1740 = uint(_1738);
    float _1742 = floor(_1726);
    float _1744 = -_1728;
    float _1746 = _1722 + _1744;
    int _1748 = int(_1680) + int(_1740);
    float _1750 = trunc(_1734);
    float _1752 = precise::max(_1750, 0.0);
    uint _1754 = uint(_1752);
    float _1756 = float(_1595);
    float _1758 = float(_1635);
    int _1760 = _1732 * _1748;
    int _1762 = _1760 + _1635;
    float _1764 = -_1742;
    float _1766 = _1726 + _1764;
    float _1768 = _1746 * _1756;
    bool _1770 = _1758 >= _1756;
    bool _1772 = isnan(_1758);
    bool _1774 = _1770 || _1772;
    bool _1776 = isnan(_1756);
    bool _1778 = _1774 || _1776;
    float _1780 = float(_1778);
    float _1782 = _1756 * _851;
    bool _1784 = uint(_1762) >= uint(_1595);
    float _1786 = _1766 * _1653;
    int _1788 = ~_1623;
    int _1790 = _1788 + 1;
    float _1792 = trunc(_1768);
    int _1794 = int(_1792);
    bool _1796 = !_1784;
    int _1798 = _1796 ? 0 : (-1);
    int _1800 = int(_1688) + int(_1754);
    int _1802 = ~_1748;
    int _1804 = _1802 + _1798;
    int _1806 = _1804 + 1;
    int _1808 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _1810 = _1808 != 0;
    float _1812 = trunc(_1780);
    int _1814 = int(_1812);
    int _1816 = _1790 * _1800;
    int _1818 = _1816 + _1639;
    int _1820 = _1595 + (-1);
    int _1822 = _1595 * _1806;
    int _1824 = _1822 + _1635;
    float _1826 = float(_1639);
    bool _1828 = uint(_1818) >= uint(_1623);
    bool _1830 = _1826 >= _1653;
    bool _1832 = isnan(_1826);
    bool _1834 = _1830 || _1832;
    bool _1836 = isnan(_1653);
    bool _1838 = _1834 || _1836;
    float _1840 = float(_1838);
    float _1842 = trunc(_1782);
    int _1844 = int(_1842);
    bool _1846 = !_1810;
    int _1848 = _1846 ? 0 : 1;
    bool _1850 = !_1655;
    int _1852 = _1850 ? _1824 : (-1);
    int _1854 = abs(_1848);
    int _1856 = ~_1814;
    int _1858 = _1856 + 1;
    int _1860 = _1858 + 1;
    float _1862 = trunc(_1786);
    int _1864 = int(_1862);
    bool _1866 = !_1828;
    int _1868 = _1866 ? 0 : (-1);
    bool _1870 = _1623 == 0;
    int _1872 = _1852 * _1860;
    int _1874 = ~_1800;
    int _1876 = _1874 + _1868;
    int _1878 = _1876 + 1;
    int _1880 = abs(_1019);
    float _1882 = trunc(_1840);
    int _1884 = int(_1882);
    int _1886 = _1814 * _1820;
    int _1888 = _1886 + _1872;
    float _1890 = _1653 * _851;
    int _1892 = _1623 * _1878;
    int _1894 = _1892 + _1639;
    bool _1896 = !_1607;
    int _1898 = _1896 ? 0 : 1;
    int _1900 = _1794 * _1854;
    int _1902 = _1900 + _1635;
    int _1904 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8192;
    bool _1906 = _1904 != 0;
    int _1908 = _1888 * _1613;
    float _1910 = trunc(_1890);
    int _1912 = int(_1910);
    int _1914 = abs(_793);
    bool _1916 = !_1870;
    int _1918 = _1916 ? _1894 : (-1);
    int _1920 = _1844 * _1880;
    int _1922 = _1920 + _1908;
    int _1924 = abs(_1898);
    bool _1926 = !_1906;
    int _1928 = _1926 ? 0 : 1;
    int _1930 = _1902 * _1914;
    int _1932 = _1930 + _1922;
    int _1934 = ~_1884;
    int _1936 = _1934 + 1;
    int _1938 = _1936 + 1;
    int _1940 = abs(_1928);
    int _1942 = _1794 * _1924;
    int _1944 = _1942 + _1932;
    int _1946 = _1623 + (-1);
    int _1948 = _1918 * _1938;
    int _1950 = abs(_1161);
    int _1952 = _1884 * _1946;
    int _1954 = _1952 + _1948;
    float _1956 = float(uint(_1944));
    int _1958 = _1954 * _1619;
    int _1960 = abs(_1507);
    float _1962 = as_type<float>(_1669) * _1956;
    int _1964 = _1864 * _1940;
    int _1966 = _1964 + _1639;
    float _1968 = float(uint(_1902));
    int _1970 = _1912 * _1950;
    int _1972 = _1970 + _1958;
    float _1974 = trunc(_1962);
    float _1976 = precise::max(_1974, 0.0);
    uint _1978 = uint(_1976);
    int _1980 = ~_1595;
    int _1982 = _1980 + 1;
    int _1984 = _1966 * _1625;
    int _1986 = _1984 + _1972;
    int _1988 = ~_1595;
    int _1990 = _1988 + 1;
    int _1992 = _1864 * _1960;
    int _1994 = _1992 + _1986;
    float _1996 = as_type<float>(_1669) * _1968;
    float _1998 = float(uint(_1994));
    int _2000 = _1982 * int(_1978);
    int _2002 = _2000 + _1944;
    float _2004 = trunc(_1996);
    float _2006 = precise::max(_2004, 0.0);
    uint _2008 = uint(_2006);
    float _2010 = as_type<float>(_1673) * _1998;
    float _2012 = float(uint(_2002));
    float _2014 = trunc(_2010);
    float _2016 = precise::max(_2014, 0.0);
    uint _2018 = uint(_2016);
    float _2020 = as_type<float>(_1669) * _2012;
    int _2022 = ~_1623;
    int _2024 = _2022 + 1;
    int _2026 = _1990 * int(_2008);
    int _2028 = _2026 + _1902;
    float _2030 = trunc(_2020);
    float _2032 = precise::max(_2030, 0.0);
    uint _2034 = uint(_2032);
    float _2036 = float(uint(_2028));
    int _2038 = _2024 * int(_2018);
    int _2040 = _2038 + _1994;
    float _2042 = as_type<float>(_1669) * _2036;
    float _2044 = float(uint(_2040));
    float _2046 = trunc(_2042);
    float _2048 = precise::max(_2046, 0.0);
    uint _2050 = uint(_2048);
    int _2052 = int(_1978) + int(_2034);
    float _2054 = as_type<float>(_1673) * _2044;
    int _2056 = _1982 * _2052;
    int _2058 = _2056 + _1944;
    float _2060 = trunc(_2054);
    float _2062 = precise::max(_2060, 0.0);
    uint _2064 = uint(_2062);
    bool _2066 = uint(_2058) >= uint(_1595);
    bool _2068 = !_2066;
    int _2070 = _2068 ? 0 : (-1);
    int _2072 = int(_2008) + int(_2050);
    float _2074 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2076 = _1603 + _2074;
    int _2078 = ~_2052;
    int _2080 = _2078 + _2070;
    int _2082 = _2080 + 1;
    int _2084 = _1595 * _2082;
    int _2086 = _2084 + _1944;
    int _2088 = int(_2018) + int(_2064);
    int _2090 = _1663 * _2088;
    int _2092 = _2090 + _1994;
    float _2094 = fma(_1591, 100.0, _1577);
    float _2096 = -_1263;
    float _2098 = fma(_2096, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1575);
    float _2100 = -_1207;
    float _2102 = fma(_2100, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2094);
    float _2104 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2106 = _2098 + _2104;
    float _2108 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2110 = _2102 + _2108;
    float _2112 = _2110 * _2110;
    float _2114 = fma(_2076, _2076, _2112);
    float _2116 = fma(_2106, _2106, _2114);
    float _2118 = rsqrt(_2116);
    float _2120 = sqrt(_2116);
    float _2122 = _2118 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _2124 = _2076 * _2122;
    float _2126 = _2106 * _2122;
    float _2128 = _2124 * _2124;
    float _2130 = _2126 * _2126;
    float _2132 = _2128 + _2130;
    float _2134 = sqrt(_2132);
    bool _2136 = _2134 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2138 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2140 = _2134 + _2138;
    float _2142 = _2106;
    float _2144 = _2132;
    float _2146 = _2140;
    float _2148 = _2110;
    float _2150 = as_type<float>(_1914);
    if (_2136)
    {
        float _2152 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2142 = _2152;
    }
    float _2154 = _2142;
    if (_2136)
    {
        float _2156 = rsqrt(_2132);
        _2144 = _2156;
    }
    float _2158 = _2144;
    if (_2136)
    {
        float _2160 = _2140 * _2154;
        _2146 = _2160;
    }
    float _2162 = _2146;
    if (_2136)
    {
        float _2164 = _2162 * 0.15915493667125701904296875;
        _1521 = _2164;
    }
    float _2166 = _1521;
    float _2168 = _2112;
    float _2170 = _2166;
    if (_2136)
    {
        float _2172 = _2166 * 6.283185482025146484375;
        float _2174 = sin(_2172);
        _2168 = _2174;
    }
    float _2176 = _2168;
    float _2178 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _2180 = precise::max(0.0, _2178);
    float _2182 = _2118;
    float _2184 = _2180;
    float _2186 = _2178;
    if (_2136)
    {
        float _2188 = _2166 * 6.283185482025146484375;
        float _2190 = cos(_2188);
        _2182 = _2190;
    }
    float _2192 = _2182;
    float _2194 = -_2122;
    float _2196 = -_2180;
    float _2198 = fma(_2110, _2194, _2196);
    if (!_2136)
    {
        _2184 = _2124;
    }
    float _2200 = _2184;
    float _2202 = _2200;
    if (_2136)
    {
        float _2204 = _2198 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2186 = _2204;
    }
    float _2206 = _2186;
    float _2208 = _2176;
    float _2210 = _2206;
    if (_2136)
    {
        float _2212 = fma(_2176, _2206, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _2208 = _2212;
    }
    float _2214 = _2208;
    float _2216 = _2214;
    if (!_2136)
    {
        _2210 = _2198;
    }
    float _2218 = _2210;
    float _2220 = _2218;
    float _2222 = _2192;
    if (_2136)
    {
        float _2224 = _2192 + (-1.0);
        _2148 = _2224;
    }
    float _2226 = _2148;
    float _2228 = _2226;
    if (_2136)
    {
        float _2230 = _2158 * _2214;
        _2150 = _2230;
    }
    float _2232 = _2150;
    if (!_2136)
    {
        _2216 = _2128;
    }
    float _2234 = _2216;
    float _2236 = _2234;
    if (_2136)
    {
        float _2238 = _2226 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2170 = _2238;
    }
    float _2240 = _2170;
    if (_2136)
    {
        float _2242 = _2124 * _2232;
        _2202 = _2242;
    }
    float _2244 = _2202;
    if (!_2136)
    {
        _2228 = _2126;
    }
    float _2246 = _2228;
    float _2248 = _2246;
    if (_2136)
    {
        float _2250 = _2126 * _2232;
        _2248 = _2250;
    }
    float _2252 = _2248;
    if (_2136)
    {
        float _2254 = fma(_2198, _2192, _2240);
        _2220 = _2254;
    }
    float _2256 = _2220;
    if (_2136)
    {
        float _2258 = _2244 * _2244;
        _2236 = _2258;
    }
    float _2260 = _2236;
    if (!_2136)
    {
        _2222 = _2130;
    }
    float _2262 = _2222;
    float _2264 = _2262;
    if (_2136)
    {
        float _2266 = _2252 * _2252;
        _2264 = _2266;
    }
    float _2268 = _2264;
    float _2270 = fma(_2256, _2256, _2260);
    float _2272 = _2102 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _2274 = _2102 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _2276 = _2270 + _2268;
    float _2278 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _2280 = fma(_2120, (*spvDescriptorSet0.vp_c15)._m0[23].w, _2278);
    float _2282 = precise::clamp(_2280, 0.0, 1.0);
    float _2284 = fma(_1611, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _2286 = rsqrt(_2276);
    float _2288 = -_2282;
    float _2290 = _2288 + 1.0;
    float _2292 = _2102 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2294 = fma(_1603, (*spvDescriptorSet0.vp_c8)._m0[2].x, _2272);
    float _2296 = fma(_1603, (*spvDescriptorSet0.vp_c8)._m0[3].x, _2274);
    float _2298 = fma(_1603, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2292);
    float _2300 = fma(_2098, (*spvDescriptorSet0.vp_c8)._m0[2].z, _2294);
    float _2302 = abs(_2290);
    float _2304 = log2(_2302);
    float _2306 = fma(_2098, (*spvDescriptorSet0.vp_c8)._m0[3].z, _2296);
    float _2308 = fma(_2098, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2298);
    float _2310 = _2300 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _2312 = _2306 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _2314 = _2308 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _2316 = _2310 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _2318 = _2286 * _2244;
    float _2320 = floor(_2284);
    float _2322 = _2286 * _2256;
    float _2324 = _2286 * _2252;
    float _2326 = _2318 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _2328 = fma(_1617, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _2330 = -_2326;
    float _2332 = fma(_2322, (*spvDescriptorSet0.vp_c15)._m0[21].y, _2330);
    float _2334 = _2304 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _2336 = -_2324;
    float _2338 = fma(_2336, (*spvDescriptorSet0.vp_c15)._m0[21].z, _2332);
    float _2340 = _2102 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2342 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _2344 = floor(_2328);
    float _2346 = fma(_1603, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2340);
    float _2348 = -_2320;
    float _2350 = _2284 + _2348;
    float _2352 = fma(_2338, -0.5, 0.5);
    float _2354 = -_2316;
    float _2356 = fma(_2354, _2342, 1.0);
    float _2358 = fma(_2098, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2346);
    float _2360 = fma(_2338, 0.5, 0.5);
    float _2362 = _2314 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2364 = sqrt(_2352);
    float _2366 = _2358 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2368 = fma(_2360, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _2370 = fma(_2360, _2368, -0.212114393711090087890625);
    float _2372 = exp2(_2334);
    float _2374 = _2314 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _2376 = -_2344;
    float _2378 = _2328 + _2376;
    float _2380 = _2314 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2382 = fma(_2360, _2370, 1.570728778839111328125);
    float _2384 = fma(_2366, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2374);
    float _2386 = _2322 + 1.0;
    float _2388 = float(uint(_1966));
    float _2390 = log2(_2356);
    float _2392 = fma(_2310, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2384);
    float _2394 = _2364 * 0.636619746685028076171875;
    float _2396 = as_type<float>(_1673) * _2388;
    float _2398 = fma(_2312, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2392);
    float _2400 = fma(_2366, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2362);
    float _2402 = -_2322;
    float _2404 = fma(_2372, _2386, _2402);
    float _2406 = fma(_2366, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2380);
    float _2408 = 1.0 / _2398;
    float _2410 = fma(_2310, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2400);
    float _2412 = -_2382;
    float _2414 = fma(_2394, _2412, 1.0);
    float _2416 = fma(_2310, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2406);
    int _2418 = ~_1595;
    int _2420 = _2418 + 1;
    float _2422 = _2390 * 0.693147182464599609375;
    float _2424 = fma(_2312, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2416);
    float _2426 = fma(_2312, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2410);
    float _2428 = trunc(_2396);
    float _2430 = precise::max(_2428, 0.0);
    uint _2432 = uint(_2430);
    float _2434 = _2422 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float2 _7490 = float2(_2350, _2378);
    float _2436 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_7490, float2(0.0), isnan(_7490)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_7490, float2(0.0), isnan(_7490)), level(0.0)).x;
    int _2438 = _2420 * _2072;
    int _2440 = _2438 + _1902;
    int _2442 = ~_1623;
    int _2444 = _2442 + 1;
    float _2446 = _2424 * _2408;
    float _2448 = _2426 * _2408;
    float _2450 = fma(_2446, 0.5, 0.5);
    float _2452 = fma(_2448, -0.5, 0.5);
    float _2454 = fma(_2404, 0.5, 0.5);
    float3 _7521 = float3(_2450, _2452, _2434);
    float _2456 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_7521, float3(0.0), isnan(_7521)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_7521, float3(0.0), isnan(_7521)), level(0.0)).x;
    float3 _7532 = float3(_2450, _2452, _2434);
    float4 _2459 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_7532, float3(0.0), isnan(_7532)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_7532, float3(0.0), isnan(_7532)), level(0.0)).xyzw;
    float _2461 = _2459.x;
    float _2463 = _2459.y;
    float _2465 = _2459.z;
    float _2467 = _2459.w;
    float2 _7548 = float2(_2414, _2454);
    float3 _2471 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_7548, float2(0.0), isnan(_7548)), level(0.0)), spvDescriptorSet0.dm_border, 4u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_7548, float2(0.0), isnan(_7548)), level(0.0)).xyz;
    float _2473 = _2471.x;
    float _2475 = _2471.y;
    float _2477 = _2471.z;
    bool _2479 = !_1655;
    int _2481 = _2479 ? _2086 : (-1);
    float _2483 = _1361 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _2485 = fma(_1591, 100.0, _471);
    bool _2487 = uint(_2440) >= uint(_1595);
    float _2489 = _2304 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    int _2491 = _2481 & 3;
    bool _2493 = _2491 != 0;
    float _2495 = -_1207;
    float _2497 = fma(_2495, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2485);
    int _2499 = _2481 & 3;
    bool _2501 = _2499 != 0;
    out.m_72.x = _1603;
    out.m_72.y = _2102;
    out.m_72.z = _2098;
    bool _2503 = uint(_2092) >= uint(_1623);
    int _2505 = _2444 * int(_2432);
    int _2507 = _2505 + _1966;
    bool _2509 = !_2487;
    int _2511 = _2509 ? 0 : (-1);
    float _2513 = exp2(_2489);
    int _2515 = _2493 ? 0 : 1;
    bool _2517 = uint(_2499) > 1u;
    bool _2519 = _2499 != 3;
    bool _2521 = !_2503;
    int _2523 = _2521 ? 0 : (-1);
    bool _2525 = uint(_2499) >= 2u;
    float _2527 = float(uint(_2507));
    int _2529 = ~_2088;
    int _2531 = _2529 + _2523;
    int _2533 = _2531 + 1;
    int _2535 = _2525 ? 0 : 1;
    float _2537 = as_type<float>(_1673) * _2527;
    bool _2539 = _403 > 0.5;
    int _2541 = _1623 * _2533;
    int _2543 = _2541 + _1994;
    int _2545 = ~_2515;
    int _2547 = _2545 + 1;
    int _2549 = _2547 + 1;
    float _2551 = -_2513;
    float _2553 = _2551 + 1.0;
    int _2555 = ~_2535;
    int _2557 = _2555 + 1;
    int _2559 = _2557 + 1;
    float _2561 = trunc(_2537);
    float _2563 = precise::max(_2561, 0.0);
    uint _2565 = uint(_2563);
    bool _2567 = !_2501;
    int _2569 = _2567 ? 0 : 1;
    int _2571 = _2549;
    int _2573 = _2559;
    float _2575 = _2398;
    float _2577 = _2426;
    if (!_2517)
    {
        int _2579 = ~_2515;
        int _2581 = _2579 + 1;
        _2571 = _2581;
    }
    int _2583 = _2571;
    if (_2519)
    {
        int _2585 = ~_2535;
        int _2587 = _2585 + 1;
        _2573 = _2587;
    }
    int _2589 = _2573;
    bool _2591 = _397 > 0.5;
    int _2593 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _2595 = _2593 != 0;
    float _2597 = -_333;
    int _2599 = _2539 ? as_type<int>(_2597) : as_type<int>(_333);
    int _2601 = _2481 >> 31;
    bool _2603 = !_1870;
    int _2605 = _2603 ? _2543 : (-1);
    bool _2607 = !_2595;
    float _2609 = _2607 ? _333 : as_type<float>(_2599);
    int _2611 = _2601 & 3;
    int _2613 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _2615 = _2613 != 0;
    int _2617 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4194304;
    bool _2619 = _2617 != 0;
    int _2621 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _2623 = _2621 != 0;
    int _2625 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _2627 = _2625 != 0;
    int _2629 = _2605 >> 31;
    int _2631 = _2481 + _2611;
    int _2633 = ~_2072;
    int _2635 = _2633 + _2511;
    int _2637 = _2635 + 1;
    int _2639 = _2629 & 3;
    bool _2641 = !_2619;
    int _2643 = _2641 ? 0 : 1;
    int _2645 = _1595 * _2637;
    int _2647 = _2645 + _1902;
    int _2649 = _2605 & 3;
    bool _2651 = _2649 != 0;
    int _2653 = _2631 >> 2;
    int _2655 = _2605 + _2639;
    bool _2657 = !_2615;
    int _2659 = _2657 ? 0 : 1;
    int _2661 = _2651 ? 0 : 1;
    int _2663 = _2653 << 4;
    int _2665 = _2663 + 368;
    int _2667 = _2605 & 3;
    bool _2669 = _2667 != 0;
    bool _2671 = _2499 != 3;
    uint _2673 = uint(int(uint(_2665) >> uint(2)));
    uint _2675 = uint(int(uint(int(_2673)) >> uint(2)));
    int _2677 = int(_2673) & 3;
    float _2679 = (*spvDescriptorSet0.vp_c9)._m0[int(_2675)][_2677];
    int _2681 = int(_2673) + 1;
    uint _2683 = uint(int(uint(_2681) >> uint(2)));
    int _2685 = _2681 & 3;
    float _2687 = (*spvDescriptorSet0.vp_c9)._m0[int(_2683)][_2685];
    int _2689 = _2655 >> 2;
    bool _2691 = !_1655;
    int _2693 = _2691 ? _2647 : (-1);
    bool _2695 = uint(_2667) > 1u;
    int _2697 = _2689 << 4;
    int _2699 = _2697 + 512;
    bool _2701 = !_2669;
    int _2703 = _2701 ? 0 : 1;
    uint _2705 = uint(int(uint(_2699) >> uint(2)));
    uint _2707 = uint(int(uint(int(_2705)) >> uint(2)));
    int _2709 = int(_2705) & 3;
    float _2711 = (*spvDescriptorSet0.vp_c9)._m0[int(_2707)][_2709];
    int _2713 = int(_2705) + 1;
    uint _2715 = uint(int(uint(_2713) >> uint(2)));
    int _2717 = _2713 & 3;
    float _2719 = (*spvDescriptorSet0.vp_c9)._m0[int(_2715)][_2717];
    bool _2721 = _2667 != 3;
    int _2723 = int(_2432) + int(_2565);
    int _2725 = ~_2661;
    int _2727 = _2725 + 1;
    int _2729 = _2727 + 1;
    int _2731 = _2729;
    if (!_2695)
    {
        int _2733 = ~_2661;
        int _2735 = _2733 + 1;
        _2731 = _2735;
    }
    int _2737 = _2731;
    int _2739 = _2665 + 8;
    uint _2741 = uint(int(uint(_2739) >> uint(2)));
    uint _2743 = uint(int(uint(int(_2741)) >> uint(2)));
    int _2745 = int(_2741) & 3;
    float _2747 = (*spvDescriptorSet0.vp_c9)._m0[int(_2743)][_2745];
    int _2749 = int(_2741) + 1;
    uint _2751 = uint(int(uint(_2749) >> uint(2)));
    int _2753 = _2749 & 3;
    float _2755 = (*spvDescriptorSet0.vp_c9)._m0[int(_2751)][_2753];
    int _2757 = ~_1623;
    int _2759 = _2757 + 1;
    bool _2761 = uint(_2667) >= 2u;
    bool _2763 = !_2671;
    int _2765 = _2763 ? 0 : (-1);
    int _2767 = _2759 * _2723;
    int _2769 = _2767 + _1966;
    int _2771 = _2761 ? 0 : 1;
    int _2773 = _2699 + 8;
    uint _2775 = uint(int(uint(_2773) >> uint(2)));
    uint _2777 = uint(int(uint(int(_2775)) >> uint(2)));
    int _2779 = int(_2775) & 3;
    float _2781 = (*spvDescriptorSet0.vp_c9)._m0[int(_2777)][_2779];
    int _2783 = int(_2775) + 1;
    uint _2785 = uint(int(uint(_2783) >> uint(2)));
    int _2787 = _2783 & 3;
    float _2789 = (*spvDescriptorSet0.vp_c9)._m0[int(_2785)][_2787];
    int _2791 = ~_2771;
    int _2793 = _2791 + 1;
    int _2795 = _2793 + 1;
    int _2797 = _2795;
    if (_2721)
    {
        int _2799 = ~_2771;
        int _2801 = _2799 + 1;
        _2797 = _2801;
    }
    int _2803 = _2797;
    bool _2805 = _2667 != 3;
    bool _2807 = uint(_2769) >= uint(_1623);
    float _2809 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    int _2811 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y);
    bool _2813 = _2811 != 0;
    float _2815 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _2817 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    bool _2819 = !_2805;
    int _2821 = _2819 ? 0 : (-1);
    float _2823 = _2809 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    bool _2825 = _399 > 0.5;
    float _2827 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _2829 = _2815 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2831 = _2817 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    out.m_74.x = _2823;
    out.m_74.y = _2829;
    out.m_74.z = _2831;
    out.m_74.w = _2827;
    int _2833 = abs(_2583);
    float _2835 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    bool _2837 = !_2807;
    int _2839 = _2837 ? 0 : (-1);
    float _2841 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    bool _2843 = _401 > 0.5;
    float _2845 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _2847 = _2835 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    int _2849 = abs(_2737);
    float _2851 = _2845 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2853 = _2841 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    int _2855 = abs(_2589);
    float _2857 = trunc((*spvDescriptorSet0.vp_c9)._m0[80].z);
    int _2859 = int(_2857);
    int _2861 = ~_2833;
    int _2863 = _2861 + 1;
    int _2865 = _2863 + 1;
    out.m_76.x = _2847;
    out.m_76.y = _2851;
    out.m_76.z = _2853;
    int _2867 = abs(_2569);
    int _2869 = ~_2849;
    int _2871 = _2869 + 1;
    int _2873 = _2871 + 1;
    int _2875 = _2865 * as_type<int>(_2687);
    int _2877 = abs(_2703);
    float _2879 = trunc((*spvDescriptorSet0.vp_c9)._m0[85].z);
    int _2881 = int(_2879);
    int _2883 = ~_2867;
    int _2885 = _2883 + 1;
    int _2887 = _2885 + 1;
    int _2889 = _2873 * as_type<int>(_2719);
    int _2891 = ~_2877;
    int _2893 = _2891 + 1;
    int _2895 = _2893 + 1;
    int _2897 = ~_2723;
    int _2899 = _2897 + _2839;
    int _2901 = _2899 + 1;
    int _2903 = _2887 * as_type<int>(_2679);
    int _2905 = _2903 + _2875;
    int _2907 = abs(_2803);
    int _2909 = _2895 * as_type<int>(_2711);
    int _2911 = _2909 + _2889;
    int _2913 = _1623 * _2901;
    int _2915 = _2913 + _1966;
    float _2917 = float(uint(_2859));
    int _2919 = ~_2855;
    int _2921 = _2919 + 1;
    int _2923 = _2921 + 1;
    int _2925 = ~_2907;
    int _2927 = _2925 + 1;
    int _2929 = _2927 + 1;
    int _2931 = abs(_2765);
    int _2933 = _2923 * as_type<int>(_2747);
    int _2935 = _2933 + _2905;
    int _2937 = abs(_2659);
    int _2939 = _2929 * as_type<int>(_2781);
    int _2941 = _2939 + _2911;
    int _2943 = ~_2931;
    int _2945 = _2943 + 1;
    int _2947 = _2945 + 1;
    float _2949 = 1.0 / _2917;
    float _2951 = float(uint(_2881));
    float _2953 = _1387 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    int _2955 = abs(_2821);
    int _2957 = _2947 * as_type<int>(_2755);
    int _2959 = _2957 + _2935;
    int _2961 = ~_2937;
    int _2963 = _2961 + 1;
    int _2965 = _2963 + 1;
    int _2967 = abs(_2643);
    float _2969 = 1.0 / _2951;
    int _2971 = ~_2955;
    int _2973 = _2971 + 1;
    int _2975 = _2973 + 1;
    int _2977 = _2959 * _2965;
    int _2979 = abs(_2859);
    int _2981 = ~_2967;
    int _2983 = _2981 + 1;
    int _2985 = _2983 + 1;
    int _2987 = _2975 * as_type<int>(_2789);
    int _2989 = _2987 + _2941;
    int _2991 = _2693 * _2937;
    int _2993 = _2991 + _2977;
    int _2995 = abs(_2881);
    int _2997 = _2989 * _2985;
    bool _2999 = !_1870;
    int _3001 = _2999 ? _2915 : (-1);
    float _3003 = fma(_2483, _2483, 1.0);
    float _3005 = float(uint(_2979));
    float _3007 = float(uint(_2995));
    int _3009 = _3001 * _2967;
    int _3011 = _3009 + _2997;
    int _3013 = as_type<int>(_2949) + (-2);
    float _3015 = float(uint(_2993));
    float _3017 = 1.0 / _3005;
    float _3019 = -_333;
    int _3021 = _2825 ? as_type<int>(_3019) : as_type<int>(_333);
    float _3023 = -_277;
    int _3025 = _2591 ? as_type<int>(_3023) : as_type<int>(_277);
    float _3027 = -_277;
    int _3029 = _2843 ? as_type<int>(_3027) : as_type<int>(_277);
    float _3031 = float(uint(_3011));
    float _3033 = 1.0 / _3007;
    bool _3035 = !_2623;
    float _3037 = _3035 ? _333 : as_type<float>(_3021);
    bool _3039 = !_2813;
    float _3041 = _3039 ? _277 : as_type<float>(_3025);
    bool _3043 = !_2627;
    float _3045 = _3043 ? _277 : as_type<float>(_3029);
    int _3047 = abs(_2993);
    float _3049 = rsqrt(_3003);
    float _3051 = as_type<float>(_3013) * _3015;
    int _3053 = as_type<int>(_2969) + (-2);
    int _3055 = as_type<int>(_3017) + (-2);
    int _3057 = ~_2859;
    int _3059 = _3057 + 1;
    float _3061 = as_type<float>(_3053) * _3031;
    float _3063 = trunc(_3051);
    float _3065 = precise::max(_3063, 0.0);
    uint _3067 = uint(_3065);
    int _3069 = abs(_3011);
    int _3071 = as_type<int>(_3033) + (-2);
    float _3073 = float(uint(_3047));
    float _3075 = trunc(_3061);
    float _3077 = precise::max(_3075, 0.0);
    uint _3079 = uint(_3077);
    int _3081 = ~_2881;
    int _3083 = _3081 + 1;
    float _3085 = as_type<float>(_3055) * _3073;
    float _3087 = float(uint(_3069));
    float _3089 = -_1415;
    float _3091 = fma(_1425, _2953, _3089);
    float _3093 = -_3049;
    float _3095 = _1427 * _3093;
    float _3097 = _2483 * _3049;
    int _3099 = ~_2995;
    int _3101 = _3099 + 1;
    int _3103 = _3059 * int(_3067);
    int _3105 = _3103 + _2993;
    float _3107 = as_type<float>(_3071) * _3087;
    float _3109 = trunc(_3085);
    float _3111 = precise::max(_3109, 0.0);
    uint _3113 = uint(_3111);
    float _3115 = -_2483;
    float _3117 = fma(_1427, _3115, _3091);
    float _3119 = fma(_1415, _3097, _3095);
    float _3121 = float(uint(_3105));
    int _3123 = ~_2979;
    int _3125 = _3123 + 1;
    int _3127 = _3083 * int(_3079);
    int _3129 = _3127 + _3011;
    float _3131 = trunc(_3107);
    float _3133 = precise::max(_3131, 0.0);
    uint _3135 = uint(_3133);
    float _3137 = as_type<float>(_3013) * _3121;
    float _3139 = fma(_1439, _2953, _1409);
    float _3141 = float(uint(_3129));
    float _3143 = as_type<float>(_3053) * _3141;
    float _3145 = fma(_1429, _2953, _1407);
    float _3147 = -_3049;
    float _3149 = _1449 * _3147;
    float _3151 = -_2483;
    float _3153 = fma(_1449, _3151, _3139);
    float _3155 = trunc(_3137);
    float _3157 = precise::max(_3155, 0.0);
    uint _3159 = uint(_3157);
    int _3161 = _3125 * int(_3113);
    int _3163 = _3161 + _3047;
    float _3165 = -_2483;
    float _3167 = fma(_1435, _3165, _3145);
    float _3169 = -_3049;
    float _3171 = _1435 * _3169;
    int _3173 = _3101 * int(_3135);
    int _3175 = _3173 + _3069;
    float _3177 = _1429 * _325;
    float _3179 = float(uint(_3163));
    float _3181 = -_3097;
    float _3183 = fma(_1407, _3181, _3171);
    float _3185 = trunc(_3143);
    float _3187 = precise::max(_3185, 0.0);
    uint _3189 = uint(_3187);
    float _3191 = float(uint(_3175));
    float _3193 = _1429 * _329;
    float _3195 = as_type<float>(_3055) * _3179;
    float _3197 = _1429 * _315;
    float _3199 = fma(_1425, _287, _3177);
    float _3201 = as_type<float>(_3071) * _3191;
    float _3203 = -_3097;
    float _3205 = fma(_1409, _3203, _3149);
    float _3207 = fma(_1425, _283, _3197);
    float _3209 = fma(_1425, _297, _3193);
    float _3211 = trunc(_3201);
    float _3213 = precise::max(_3211, 0.0);
    uint _3215 = uint(_3213);
    float _3217 = fma(_1439, _341, _3199);
    float _3219 = fma(_1439, _337, _3207);
    float _3221 = fma(_1439, _345, _3209);
    float _3223 = _3167 * _325;
    float _3225 = _3167 * _329;
    float _3227 = _3183 * _325;
    float _3229 = _3183 * _315;
    float _3231 = trunc(_3195);
    float _3233 = precise::max(_3231, 0.0);
    uint _3235 = uint(_3233);
    float _3237 = _3183 * _329;
    int _3239 = int(_3079) + int(_3189);
    float _3241 = _3167 * _315;
    int _3243 = int(_3067) + int(_3159);
    out.m_78.x = _3217;
    out.m_78.y = _3219;
    out.m_78.z = _3221;
    int _3245 = ~_2859;
    int _3247 = _3245 + 1;
    float _3249 = -_2436;
    float _3251 = _3249 + 1.0;
    int _3253 = ~_2881;
    int _3255 = _3253 + 1;
    int _3257 = int(_3135) + int(_3215);
    int _3259 = _3247 * _3243;
    int _3261 = _3259 + _2993;
    int _3263 = ~_2995;
    int _3265 = _3263 + 1;
    int _3267 = _3255 * _3239;
    int _3269 = _3267 + _3011;
    int _3271 = ~_2979;
    int _3273 = _3271 + 1;
    bool _3275 = uint(_3261) >= uint(_2859);
    int _3277 = _3265 * _3257;
    int _3279 = _3277 + _3069;
    int _3281 = int(_3113) + int(_3235);
    float _3283 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    bool _3285 = !_3275;
    int _3287 = _3285 ? 0 : (-1);
    float _3289 = fma(_3119, _287, _3227);
    bool _3291 = uint(_3269) >= uint(_2881);
    int _3293 = _3273 * _3281;
    int _3295 = _3293 + _3047;
    int _3297 = ~_3243;
    int _3299 = _3297 + _3287;
    int _3301 = _3299 + 1;
    float _3303 = fma(_3119, _297, _3237);
    bool _3305 = uint(_3279) >= uint(_2995);
    float _3307 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    bool _3309 = uint(_3295) >= uint(_2979);
    int _3311 = _2859 * _3301;
    int _3313 = _3311 + _2993;
    bool _3315 = !_3291;
    int _3317 = _3315 ? 0 : (-1);
    float _3319 = fma(_3119, _283, _3229);
    bool _3321 = _2859 == 0;
    float _3323 = fma(_3205, _341, _3289);
    bool _3325 = _2859 == 0;
    float _3327 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    int _3329 = _2993 ^ _2859;
    float _3331 = fma(_3205, _337, _3319);
    int _3333 = _3011 ^ _2881;
    float _3335 = fma(_3117, _297, _3225);
    int _3337 = ~_3239;
    int _3339 = _3337 + _3317;
    int _3341 = _3339 + 1;
    bool _3343 = !_3309;
    int _3345 = _3343 ? 0 : (-1);
    float _3347 = _3307 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    bool _3349 = !_3305;
    int _3351 = _3349 ? 0 : (-1);
    int _3353 = _2881 * _3341;
    int _3355 = _3353 + _3011;
    uint _3357 = uint(int(uint(_3333) >> uint(31)));
    int _3359 = ~_3345;
    int _3361 = _3281 + _3359;
    int _3363 = _3361 + 1;
    int _3365 = ~_3351;
    int _3367 = _3257 + _3365;
    int _3369 = _3367 + 1;
    float _3371 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    int _3373 = ~int(_3357);
    int _3375 = _3373 + 1;
    uint _3377 = uint(int(uint(_3329) >> uint(31)));
    int _3379 = _3369 ^ _3375;
    int _3381 = ~int(_3377);
    int _3383 = _3381 + 1;
    bool _3385 = _2881 == 0;
    bool _3387 = _2881 == 0;
    float _3389 = _3327 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    int _3391 = ~_3375;
    int _3393 = _3391 + _3379;
    int _3395 = _3393 + 1;
    int _3397 = _3363 ^ _3383;
    bool _3399 = !_3385;
    int _3401 = _3399 ? _3355 : (-1);
    float _3403 = _2609 + (-0.5);
    bool _3405 = !_3387;
    int _3407 = _3405 ? _3395 : (-1);
    int _3409 = ~_3383;
    int _3411 = _3409 + _3397;
    int _3413 = _3411 + 1;
    float _3415 = _3283 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    bool _3417 = !_3321;
    int _3419 = _3417 ? _3313 : (-1);
    float _3421 = float(_3401);
    float _3423 = _3371 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _3425 = float(_3407);
    float _3427 = float(_3419);
    float _3429 = fma(_3347, _3421, _789);
    bool _3431 = !_3325;
    int _3433 = _3431 ? _3413 : (-1);
    float _3435 = -_773;
    float _3437 = fma(_3423, _3425, _3435);
    float _3439 = _3045 + 0.5;
    float _3441 = fma(_3415, _3427, _545);
    float _3443 = _3041 + 0.5;
    float _3445 = -_3423;
    float _3447 = fma(_3445, _3403, _3437);
    float _3449 = -_775;
    float _3451 = _3449 + 1.0;
    float _3453 = float(_3433);
    float _3455 = fma(_3415, _3443, _3441);
    float _3457 = fma(_3205, _345, _3303);
    float _3459 = fma(_2609, _3451, _3447);
    float _3461 = _2497 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _3463 = _2497 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _3465 = -_579;
    float _3467 = fma(_3389, _3453, _3465);
    out.m_80.x = _3323;
    out.m_80.y = _3331;
    out.m_80.z = _3457;
    float _3469 = fma(_1611, (*spvDescriptorSet0.vp_c8)._m0[11].x, _3461);
    float _3471 = _3037 + (-0.5);
    float _3473 = fma(_1611, (*spvDescriptorSet0.vp_c8)._m0[10].x, _3463);
    float _3475 = fma(_3347, _3439, _3429);
    float _3477 = fma(_1617, (*spvDescriptorSet0.vp_c8)._m0[11].z, _3469);
    float _3479 = -_3389;
    float _3481 = fma(_3479, _3471, _3467);
    float _3483 = fma(_1617, (*spvDescriptorSet0.vp_c8)._m0[10].z, _3473);
    float _3485 = -_805;
    float _3487 = _3485 + 1.0;
    float _3489 = -_645;
    float _3491 = _3489 + 1.0;
    float _3493 = -_807;
    float _3495 = _3493 + 1.0;
    float _3497 = _3483 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _3499 = _3477 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _3501 = -_3487;
    float _3503 = fma(_3041, _3501, _3455);
    float _3505 = -_3491;
    float _3507 = fma(_3045, _3505, _3475);
    float _3509 = fma(_3037, _3495, _3481);
    float _3511 = 1.0 / _3499;
    float _3513 = _3497 + _3499;
    float _3515 = fma(_3117, _287, _3223);
    float _3517 = fma(_3117, _283, _3241);
    out.m_82.x = _3503;
    out.m_82.y = _3509;
    out.m_82.z = _3507;
    out.m_82.w = _3459;
    float _3519 = fma(_3153, _345, _3335);
    float _3521 = fma(_3153, _341, _3515);
    float _3523 = fma(_3153, _337, _3517);
    bool _3525 = _2120 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _3527 = isnan(_2120);
    bool _3529 = _3525 || _3527;
    bool _3531 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _3533 = _3529 || _3531;
    out.m_84.x = _3521;
    out.m_84.y = _3523;
    out.m_84.z = _3519;
    float _3535 = _3513 * _3511;
    float _3537 = _3535 * 0.5;
    float _3539 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _3541 = fma(_3537, (*spvDescriptorSet0.vp_c8)._m0[30].w, _3539);
    float _3543 = in.m_66.x;
    float _3545 = 1.0 / _3541;
    float _3547 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _3549 = _3545 * _3547;
    float _3551 = abs(_3549);
    float _3553 = log2(_3551);
    bool _3555 = _3549 <= 8000.0;
    bool _3557 = isnan(_3549);
    bool _3559 = _3555 || _3557;
    bool _3561 = isnan(8000.0);
    bool _3563 = _3559 || _3561;
    float _3565 = float(_3563);
    float _3567 = _3553 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _3569 = _2314 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _3571 = fma(_2366, (*spvDescriptorSet0.vp_c8)._m0[6].x, _3569);
    float _3573 = exp2(_3567);
    float _3575 = fma(_2310, (*spvDescriptorSet0.vp_c8)._m0[6].z, _3571);
    float _3577 = fma(_3573, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _3579 = precise::clamp(_3577, 0.0, 1.0);
    float _3581 = fma(_2312, (*spvDescriptorSet0.vp_c8)._m0[6].w, _3575);
    float _3583 = fma(_3579, -2.0, 3.0);
    float _3585 = _3579 * _3579;
    out.gl_Position.x = _2424;
    out.gl_Position.y = _2426;
    out.gl_Position.z = _3581;
    out.gl_Position.w = _2398;
    float _3587 = _3585 * _3583;
    float _3589 = -_3587;
    float _3591 = _3589 + 1.0;
    float _3593 = fma(_3591, (*spvDescriptorSet0.vp_c15)._m0[654].w, _3587);
    float _3595 = _3581 + _2398;
    float _3597 = _3565 * _3593;
    float _3599 = _2553 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _3601 = _3595 * 0.5;
    float _3603 = _2398;
    float _3605 = _3601;
    float _3607 = _3581;
    if (!_3533)
    {
        _2575 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _3609 = _2575;
    float _3611 = _3597 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _3613 = _3599 * _2456;
    float _3615 = -_3599;
    float _3617 = _3615 + 1.0;
    out.m_86.z = _3601;
    out.m_86.w = _2398;
    float _3619 = _3251 * _3611;
    float _3621 = precise::clamp(_3619, 0.0, 1.0);
    float _3623 = _2467 * _3613;
    float _3625 = _2477 * _3613;
    float _3627 = _2467 * _3617;
    float _3629 = -_3621;
    float _3631 = fma(_3629, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _3633 = fma(_2473, _3623, _2461);
    float _3635 = fma(_2475, _3623, _2463);
    float _3637 = fma(_2467, _3625, _2465);
    float _3639 = _3631 * _3543;
    float _3641 = _3617;
    float _3643 = _3609;
    float _3645 = _3609;
    if (!_3533)
    {
        _3603 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _3647 = _3603;
    float _3649 = _3647;
    float _3651 = _3647;
    if (!_3533)
    {
        _3605 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _3653 = _3605;
    float _3655 = _3639 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    out.m_88.x = _3633;
    out.m_88.y = _3635;
    out.m_88.z = _3637;
    out.m_88.w = _3627;
    float _3657 = _3653;
    float _3659 = _3653;
    if (!_3533)
    {
        _3607 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _3661 = _3607;
    float _3663 = _3661;
    float _3665 = _3661;
    if (!_3533)
    {
        _2577 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _3667 = _2577;
    out.m_90.x = _3655;
    float _3669 = _3667;
    float _3671 = _3667;
    if (!_3533)
    {
        _3641 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _3673 = _3641;
    bool _3675 = !_3533;
    float _3677 = _3673;
    float _3679 = _3673;
    if (!_3675)
    {
        bool _3681 = _2120 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _3683 = isnan(_2120);
        bool _3685 = _3681 || _3683;
        bool _3687 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _3689 = _3685 || _3687;
        if (!_3689)
        {
            float _3691 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _3693 = _2120 + _3691;
            float _3695 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _3697 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _3695;
            float _3699 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _3701 = _3699 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _3703 = 1.0 / _3697;
            float _3705 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _3707 = _3705 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _3709 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _3711 = _3709 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _3713 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _3715 = _3713 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _3717 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _3719 = _3717 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _3721 = _3693 * _3703;
            float _3723 = precise::clamp(_3721, 0.0, 1.0);
            float _3725 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _3727 = _3725 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _3729 = fma(_3723, _3701, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _3731 = fma(_3723, _3727, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _3733 = fma(_3723, _3707, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _3735 = fma(_3723, _3711, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _3737 = fma(_3723, _3715, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _3739 = fma(_3723, _3719, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _3659 = _3733;
            _3671 = _3737;
            _3651 = _3729;
            _3665 = _3735;
            _3645 = _3731;
            _3679 = _3739;
            _3741 = true;
        }
        else
        {
            bool _3743 = _2120 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _3745 = isnan(_2120);
            bool _3747 = _3743 || _3745;
            bool _3749 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _3751 = _3747 || _3749;
            if (!_3751)
            {
                _3649 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _3753 = _3649;
            _3651 = _3753;
            if (!_3751)
            {
                _3657 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _3755 = _3657;
            _3659 = _3755;
            if (!_3751)
            {
                _3643 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _3757 = _3643;
            _3645 = _3757;
            if (!_3751)
            {
                _3663 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _3759 = _3663;
            _3665 = _3759;
            if (!_3751)
            {
                _3669 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _3761 = _3669;
            _3671 = _3761;
            if (!_3751)
            {
                _3677 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _3763 = _3677;
            bool _3765 = !_3751;
            _3679 = _3763;
            if (!_3765)
            {
                bool _3767 = _2120 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _3769 = isnan(_2120);
                bool _3771 = _3767 || _3769;
                bool _3773 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _3775 = _3771 || _3773;
                if (!_3775)
                {
                    float _3777 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _3779 = _2120 + _3777;
                    float _3781 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _3783 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _3781;
                    float _3785 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _3787 = _3785 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _3789 = 1.0 / _3783;
                    float _3791 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _3793 = _3791 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _3795 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _3797 = _3795 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _3799 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _3801 = _3799 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _3803 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _3805 = _3803 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _3807 = _3779 * _3789;
                    float _3809 = precise::clamp(_3807, 0.0, 1.0);
                    float _3811 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _3813 = _3811 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _3815 = fma(_3809, _3787, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _3817 = fma(_3809, _3813, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _3819 = fma(_3809, _3793, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _3821 = fma(_3809, _3797, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _3823 = fma(_3809, _3801, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _3825 = fma(_3809, _3805, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _3659 = _3819;
                    _3671 = _3823;
                    _3651 = _3815;
                    _3665 = _3821;
                    _3645 = _3817;
                    _3679 = _3825;
                    _3741 = true;
                }
                else
                {
                    _3659 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _3671 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _3651 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _3665 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _3645 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _3679 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _3741 = false;
    float _3827 = _3659;
    float _3829 = _3671;
    float _3831 = _3651;
    float _3833 = _3665;
    float _3835 = _3645;
    float _3837 = _3679;
    float _3839 = fma(_3523, -0.5, 0.5);
    float _3841 = precise::clamp(_3839, 0.0, 1.0);
    float _3843 = -_3827;
    float _3845 = _3843 + _3829;
    float _3847 = -_3831;
    float _3849 = _3847 + _3833;
    float _3851 = -_3835;
    float _3853 = _3851 + _3837;
    bool _3855 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _3857 = fma(_3841, _3845, _3827);
    float _3859 = fma(_3841, _3849, _3831);
    float _3861 = fma(_3841, _3853, _3835);
    float _3863 = _3857 * 0.586610972881317138671875;
    out.m_51.x = 1.0;
    float _3865 = fma(_3859, 0.298911988735198974609375, _3863);
    float _3867 = fma(_3861, 0.114477999508380889892578125, _3865);
    out.m_92.x = 0.0;
    float _3869 = -_3867;
    float _3871 = _3859 + _3869;
    float _3873 = -_3867;
    float _3875 = _3857 + _3873;
    float _3877 = -_3867;
    float _3879 = _3861 + _3877;
    float _3881 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _3883 = fma(_3871, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3867);
    float _3885 = fma(_3875, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3867);
    float _3887 = fma(_3879, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3867);
    out.m_90.w = _3881;
    out.m_94.x = _3883;
    out.m_94.y = _3885;
    out.m_94.z = _3887;
    if (!_3855)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_94.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_94.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_94.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_94.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_92.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_92.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_92.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_92.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_90.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_90.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_90.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_90.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_88.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_88.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_88.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_88.w)); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _3889 = -_2102;
    float _3891 = _3889 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
    float _3893 = -_1603;
    float _3895 = _3893 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
    float _3897 = -_2098;
    float _3899 = _3897 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
    float _3901 = _3891 * _3891;
    float _3903 = fma(_3895, _3895, _3901);
    float _3905 = fma(_3899, _3899, _3903);
    float _3907 = sqrt(_3905);
    float _3909 = rsqrt(_3905);
    float _3911 = -_3907;
    float _3913 = _3911 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _3915 = _3913 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
    float _3917 = precise::clamp(_3915, 0.0, 1.0);
    float _3919 = _3895 * _3909;
    float _3921 = _3891 * _3909;
    float _3923 = abs(_3917);
    float _3925 = log2(_3923);
    float _3927 = _3899 * _3909;
    float _3929 = _3919 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
    float _3931 = _3523 * _3921;
    float _3933 = -_3921;
    float _3935 = -_3929;
    float _3937 = fma(_3933, (*spvDescriptorSet0.vp_c15)._m0[656].y, _3935);
    float _3939 = fma(_3521, _3919, _3931);
    float _3941 = -_3927;
    float _3943 = fma(_3941, (*spvDescriptorSet0.vp_c15)._m0[656].z, _3937);
    float _3945 = fma(_3519, _3927, _3939);
    float _3947 = precise::clamp(_3945, 0.0, 1.0);
    float _3949 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
    float _3951 = _3943 + _3949;
    float _3953 = _3925 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
    float _3955 = _3951 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
    float _3957 = precise::clamp(_3955, 0.0, 1.0);
    float _3959 = exp2(_3953);
    float _3961 = _3959 * _3957;
    float _3963 = _3947 * _3961;
    float _3965 = _3963 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
    float _3967 = _3963 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
    float _3969 = _3963 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
    out.m_92.x = _3965;
    out.m_92.y = _3967;
    out.m_92.z = _3969;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_94.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_94.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_94.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_94.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_92.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_92.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_92.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_92.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_90.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_90.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_90.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_90.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_88.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_88.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_88.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_88.w)); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

