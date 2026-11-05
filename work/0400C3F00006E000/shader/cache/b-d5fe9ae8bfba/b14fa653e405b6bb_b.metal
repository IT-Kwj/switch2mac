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
    float4 m_54 [[user(locn0)]];
    float4 m_60 [[user(locn1)]];
    float4 m_58 [[user(locn2)]];
    float4 m_64 [[user(locn3)]];
    float4 m_45 [[user(locn5)]];
    float4 m_66 [[user(locn8)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_56 [[attribute(1)]];
    float4 m_42 [[attribute(2)]];
    float4 m_47 [[attribute(3)]];
    float4 m_49 [[attribute(4)]];
    float4 m_62 [[attribute(5)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_54 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_60 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_58 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_64 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_45 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_66 = float4(0.0, 0.0, 0.0, 1.0);
    bool _663 = false;
    bool _269 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _80 = in.m_42.w;
    float _82 = trunc(_80);
    int _85 = int(_82);
    bool _89 = _85 >= 1;
    float _91 = 0.0;
    if (!_89)
    {
        _91 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _93 = _91;
    float _95 = _93;
    if (!_89)
    {
        out.m_45.x = 0.0;
    }
    int _97 = 0;
    if (!_89)
    {
        float _99 = _93 * 5.0;
        _97 = as_type<int>(_99);
    }
    int _101 = _97;
    int _103 = _101;
    if (!_89)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2998 = as_type<float>(_101);
        out.gl_Position.z = _2998;
    }
    if (!_89)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _105 = in.m_47.w;
    bool _107 = _105 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _109 = isnan(_105);
    bool _111 = _107 || _109;
    bool _113 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _115 = _111 || _113;
    float _117 = -_105;
    float _119 = _117 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _121 = 0.0;
    float _123 = _119;
    if (_115)
    {
        float _125 = float(_85);
        _121 = _125;
    }
    float _127 = _121;
    bool _129 = _119 >= _127;
    bool _131 = !_115;
    bool _133 = _129 || _131;
    if (_133)
    {
        _95 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _135 = _95;
    if (_133)
    {
        out.m_45.x = 0.0;
    }
    if (_133)
    {
        float _137 = _135 * 5.0;
        _103 = as_type<int>(_137);
    }
    int _139 = _103;
    if (_133)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3067 = as_type<float>(_139);
        out.gl_Position.z = _3067;
    }
    if (_133)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _141 = in.m_49.x;
    float _143 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[19].z;
    float _145 = _119 + (*spvDescriptorSet0.vp_c9)._m0[20].z;
    float _147 = as_type<float>(int(gl_VertexIndex));
    float _149 = _145 * _143;
    float _151 = fma(_141, (*spvDescriptorSet0.vp_c9)._m0[20].x, _149);
    int _153 = as_type<int>(_147) & 1;
    bool _155 = _153 != 0;
    int _157 = as_type<int>(_147) & 2;
    bool _159 = _157 != 0;
    float _161 = _151 * 6.283185482025146484375;
    float _163 = floor(_151);
    float _165 = _161 * 0.15915493667125701904296875;
    bool _167 = !_159;
    float _169 = _167 ? (-0.5) : 0.5;
    int _171 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2;
    bool _173 = _171 != 0;
    int _175 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 4;
    bool _177 = _175 != 0;
    int _179 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x);
    bool _181 = _179 != 0;
    float _183 = _165 * 6.283185482025146484375;
    float _185 = cos(_183);
    bool _187 = !_155;
    float _189 = _187 ? (-0.5) : 0.5;
    bool _191 = !_173;
    int _193 = _191 ? 0 : 1;
    bool _195 = !_181;
    int _197 = _195 ? 0 : 1;
    int _199 = abs(_193);
    float _201 = -_163;
    float _203 = _151 + _201;
    int _205 = abs(_197);
    float _207 = -_203;
    float _209 = fma(_207, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    bool _211 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _213 = float(_199);
    float _215 = fma(_185, 0.5, 0.5);
    bool _217 = !_177;
    int _219 = _217 ? 0 : 1;
    bool _221 = _203 < 0.5;
    float _223 = float(_221);
    float _225 = abs(_209);
    float _227 = _213 * _225;
    int _229 = abs(_219);
    float _231 = -_215;
    float _233 = fma(_231, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _235 = float(_205);
    float _237 = -_223;
    float _239 = fma(_237, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _241 = float(_229);
    float _243 = fma(_235, _233, _227);
    float _245 = abs(_239);
    float _247 = fma(_241, _245, _243);
    bool _249 = !_211;
    float _251 = 0.5;
    float _267;
    if (!_249)
    {
        float _253 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _255 = _141 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _257 = fma(_255, (*spvDescriptorSet0.vp_c9)._m0[12].x, _119);
        float _259 = _257 * _253;
        float _261 = floor(_259);
        float _263 = -_261;
        float _265 = _259 + _263;
        _267 = _265;
        _269 = true;
    }
    else
    {
        float _271 = float(_85);
        float _273 = 1.0 / _271;
        float _275 = _119 * _273;
        _267 = _275;
    }
    _269 = false;
    float _277 = _267;
    float _279 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _281 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _279;
    float _283 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _285 = _283 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _287 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _289 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _287;
    float _291 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _293 = _291 + (*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _295 = 1.0 / _281;
    float _297 = -(*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _299 = (*spvDescriptorSet0.vp_c9)._m0[148].w + _297;
    float _301 = 1.0 / _285;
    float _303 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _305 = _277 + _303;
    float _307 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _309 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _311 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _313 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _315 = 1.0 / _289;
    float _317 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _319 = _277 + _317;
    float _321 = _305 * _295;
    float _323 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _325 = _277 + _323;
    float _327 = _307 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _329 = _309 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _331 = _311 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _333 = -(*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _335 = _277 + _333;
    float _337 = 1.0 / _293;
    float _339 = _319 * _301;
    float _341 = -(*spvDescriptorSet0.vp_c9)._m0[148].w;
    float _343 = _341 + (*spvDescriptorSet0.vp_c9)._m0[149].w;
    bool _345 = _277 >= (*spvDescriptorSet0.vp_c9)._m0[149].w;
    bool _347 = isnan(_277);
    bool _349 = _345 || _347;
    bool _351 = isnan((*spvDescriptorSet0.vp_c9)._m0[149].w);
    bool _353 = _349 || _351;
    float _355 = float(_353);
    out.m_54.x = _327;
    out.m_54.y = _329;
    out.m_54.z = _331;
    out.m_54.w = _313;
    float _357 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _359 = _277 + _357;
    float _361 = 1.0 / _343;
    float _363 = -(*spvDescriptorSet0.vp_c9)._m0[149].w;
    float _365 = (*spvDescriptorSet0.vp_c9)._m0[150].w + _363;
    bool _367 = _277 >= (*spvDescriptorSet0.vp_c9)._m0[150].w;
    bool _369 = isnan(_277);
    bool _371 = _367 || _369;
    bool _373 = isnan((*spvDescriptorSet0.vp_c9)._m0[150].w);
    bool _375 = _371 || _373;
    float _377 = float(_375);
    float _379 = _325 * _315;
    bool _381 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].z;
    float _383 = -_377;
    float _385 = _383 + 1.0;
    float _387 = 1.0 / _365;
    float _389 = -(*spvDescriptorSet0.vp_c9)._m0[149].w;
    float _391 = _277 + _389;
    bool _393 = _277 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _395 = isnan(_277);
    bool _397 = _393 || _395;
    bool _399 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _401 = _397 || _399;
    float _403 = float(_401);
    float _405 = _355 * _385;
    float _407 = -_355;
    float _409 = _407 + 1.0;
    float _411 = _359 * _337;
    bool _413 = _277 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _415 = isnan(_277);
    bool _417 = _413 || _415;
    bool _419 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _421 = _417 || _419;
    float _423 = float(_421);
    float _425 = -_403;
    float _427 = _425 + 1.0;
    float _429 = 1.0 / _299;
    bool _431 = _277 >= (*spvDescriptorSet0.vp_c9)._m0[148].w;
    bool _433 = isnan(_277);
    bool _435 = _431 || _433;
    bool _437 = isnan((*spvDescriptorSet0.vp_c9)._m0[148].w);
    bool _439 = _435 || _437;
    float _441 = float(_439);
    float _443 = _423 * _427;
    bool _445 = _277 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _447 = isnan(_277);
    bool _449 = _445 || _447;
    bool _451 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _453 = _449 || _451;
    float _455 = float(_453);
    float _457 = -_441;
    float _459 = _457 + 1.0;
    float _461 = _441 * _409;
    float _463 = _391 * _387;
    bool _465 = _277 >= (*spvDescriptorSet0.vp_c9)._m0[147].w;
    bool _467 = isnan(_277);
    bool _469 = _465 || _467;
    bool _471 = isnan((*spvDescriptorSet0.vp_c9)._m0[147].w);
    bool _473 = _469 || _471;
    float _475 = float(_473);
    float _477 = -(*spvDescriptorSet0.vp_c9)._m0[148].w;
    float _479 = _277 + _477;
    float _481 = -_423;
    float _483 = _481 + 1.0;
    float _485 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _487 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _485;
    float _489 = _475 * _459;
    float _491 = -_475;
    float _493 = _491 + 1.0;
    float _495 = _479 * _361;
    float _497 = _335 * _429;
    float _499 = _403 * _493;
    bool _501 = _277 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _503 = isnan(_277);
    bool _505 = _501 || _503;
    bool _507 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _509 = _505 || _507;
    float _511 = float(_509);
    float _513 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _515 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _513;
    float _517 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _519 = _517 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _521 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _523 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _521;
    float _525 = fma(_487, _379, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _527 = -_511;
    float _529 = _527 + 1.0;
    float _531 = _511 * _483;
    float _533 = fma(_515, _321, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _535 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _537 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _535;
    float _539 = _455 * _529;
    float _541 = fma(_523, _321, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _543 = -_455;
    float _545 = _543 + 1.0;
    float _547 = fma(_537, _379, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _549 = _533 * _539;
    float _551 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _553 = _551 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _555 = _541 * _539;
    float _557 = fma(_519, _339, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _559 = fma(_545, (*spvDescriptorSet0.vp_c9)._m0[143].x, _549);
    float _561 = fma(_553, _339, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _563 = fma(_545, (*spvDescriptorSet0.vp_c9)._m0[143].y, _555);
    float _565 = -(*spvDescriptorSet0.vp_c9)._m0[146].x;
    float _567 = _565 + (*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _569 = -(*spvDescriptorSet0.vp_c9)._m0[146].y;
    float _571 = _569 + (*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _573 = fma(_557, _531, _559);
    float _575 = fma(_561, _531, _563);
    float _577 = fma(_567, _411, (*spvDescriptorSet0.vp_c9)._m0[146].x);
    float _579 = fma(_571, _411, (*spvDescriptorSet0.vp_c9)._m0[146].y);
    float _581 = -(*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _583 = (*spvDescriptorSet0.vp_c9)._m0[148].x + _581;
    float _585 = -(*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _587 = (*spvDescriptorSet0.vp_c9)._m0[148].y + _585;
    float _589 = fma(_547, _443, _573);
    float _591 = fma(_525, _443, _575);
    float _593 = fma(_583, _497, (*spvDescriptorSet0.vp_c9)._m0[147].x);
    float _595 = fma(_587, _497, (*spvDescriptorSet0.vp_c9)._m0[147].y);
    float _597 = -(*spvDescriptorSet0.vp_c9)._m0[148].x;
    float _599 = _597 + (*spvDescriptorSet0.vp_c9)._m0[149].x;
    float _601 = fma(_577, _499, _589);
    float _603 = -(*spvDescriptorSet0.vp_c9)._m0[148].y;
    float _605 = _603 + (*spvDescriptorSet0.vp_c9)._m0[149].y;
    float _607 = fma(_579, _499, _591);
    float _609 = fma(_599, _495, (*spvDescriptorSet0.vp_c9)._m0[148].x);
    float _611 = -(*spvDescriptorSet0.vp_c9)._m0[149].x;
    float _613 = (*spvDescriptorSet0.vp_c9)._m0[150].x + _611;
    float _615 = fma(_593, _489, _601);
    float _617 = fma(_605, _495, (*spvDescriptorSet0.vp_c9)._m0[148].y);
    float _619 = -(*spvDescriptorSet0.vp_c9)._m0[149].y;
    float _621 = (*spvDescriptorSet0.vp_c9)._m0[150].y + _619;
    float _623 = fma(_595, _489, _607);
    float _625 = fma(_613, _463, (*spvDescriptorSet0.vp_c9)._m0[149].x);
    float _627 = fma(_609, _461, _615);
    float _629 = fma(_621, _463, (*spvDescriptorSet0.vp_c9)._m0[149].y);
    float _631 = fma(_617, _461, _623);
    float _633 = fma(_625, _405, _627);
    float _635 = fma(_629, _405, _631);
    float _637 = fma(_377, (*spvDescriptorSet0.vp_c9)._m0[150].x, _633);
    float _639 = fma(_377, (*spvDescriptorSet0.vp_c9)._m0[150].y, _635);
    bool _641 = !_381;
    float _659;
    float _661;
    if (!_641)
    {
        float _643 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].z;
        float _645 = _141 * (*spvDescriptorSet0.vp_c9)._m0[12].w;
        float _647 = fma(_645, (*spvDescriptorSet0.vp_c9)._m0[11].z, _119);
        float _649 = _647 * _643;
        float _651 = float(_85);
        float _653 = floor(_649);
        float _655 = -_653;
        float _657 = _649 + _655;
        _659 = _657;
        _661 = _651;
        _663 = true;
    }
    else
    {
        float _665 = float(_85);
        float _667 = 1.0 / _665;
        float _669 = _119 * _667;
        _659 = _669;
        _661 = _665;
    }
    _663 = false;
    float _671 = _659;
    float _673 = _661;
    float _675 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _677 = int(_675);
    float _679 = -(*spvDescriptorSet0.vp_c9)._m0[124].w;
    float _681 = _671 + _679;
    float _683 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _685 = _671 + _683;
    float _687 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _689 = int(_687);
    float _691 = float(_677);
    float _693 = 1.0 / _673;
    float _695 = float(uint(_689));
    float _697 = 1.0 / _691;
    int _699 = ~_689;
    int _701 = _699 + 1;
    float _703 = 1.0 / _695;
    float _705 = _697 * _119;
    float _707 = trunc(_705);
    int _709 = int(_707);
    int _711 = as_type<int>(_703) + (-2);
    int _713 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _715 = _713 != 0;
    bool _717 = !_715;
    float _719 = _717 ? 7.345489978790283203125 : 1.0;
    int _721 = ~_689;
    int _723 = _721 + 1;
    float _725 = float(uint(_709));
    float _727 = _719 * _141;
    float _729 = as_type<float>(_711) * _725;
    float _731 = trunc(_729);
    float _733 = precise::max(_731, 0.0);
    uint _736 = uint(_733);
    float _738 = float(_709);
    int _740 = _701 * int(_736);
    int _742 = _740 + _709;
    float _744 = float(uint(_742));
    float _746 = as_type<float>(_711) * _744;
    float _748 = trunc(_746);
    float _750 = precise::max(_748, 0.0);
    uint _752 = uint(_750);
    int _754 = int(_736) + int(_752);
    float _756 = float(_689);
    float _758 = floor(_727);
    int _760 = _723 * _754;
    int _762 = _760 + _709;
    bool _764 = _738 >= _756;
    bool _766 = isnan(_738);
    bool _768 = _764 || _766;
    bool _770 = isnan(_756);
    bool _772 = _768 || _770;
    float _774 = float(_772);
    bool _776 = uint(_762) >= uint(_689);
    float _778 = trunc(_774);
    int _780 = int(_778);
    bool _782 = !_776;
    int _784 = _782 ? 0 : (-1);
    bool _786 = _689 == 0;
    int _788 = ~_754;
    int _790 = _788 + _784;
    int _792 = _790 + 1;
    float _794 = -_758;
    float _796 = _727 + _794;
    int _798 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _800 = _798 != 0;
    int _802 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _804 = _802 != 0;
    int _806 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _808 = _806 != 0;
    int _810 = _689 * _792;
    int _812 = _810 + _709;
    bool _814 = !_800;
    int _816 = _814 ? 0 : 1;
    bool _818 = !_786;
    int _820 = _818 ? _812 : (-1);
    float _822 = _796 * _756;
    int _824 = ~_780;
    int _826 = _824 + 1;
    int _828 = _826 + 1;
    float _830 = _756 * _119;
    int _832 = _820 * _828;
    float _834 = _830 * _693;
    int _836 = _689 + (-1);
    float _838 = trunc(_822);
    int _840 = int(_838);
    int _842 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _844 = _842 != 0;
    int _846 = abs(_816);
    int _848 = _780 * _836;
    int _850 = _848 + _832;
    bool _852 = !_804;
    int _854 = _852 ? 0 : 1;
    bool _856 = !_844;
    int _858 = _856 ? 0 : 1;
    float _860 = trunc(_834);
    int _862 = int(_860);
    int _864 = abs(_854);
    bool _866 = !_808;
    int _868 = _866 ? 0 : 1;
    int _870 = abs(_858);
    int _872 = _850 * _864;
    int _874 = abs(_868);
    int _876 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _878 = _876 != 0;
    int _880 = _840 * _870;
    int _882 = _880 + _709;
    bool _884 = !_878;
    int _886 = _884 ? 0 : 1;
    int _888 = _862 * _846;
    int _890 = _888 + _872;
    int _892 = abs(_886);
    int _894 = ~_689;
    int _896 = _894 + 1;
    int _898 = _882 * _874;
    int _900 = _898 + _890;
    float _902 = float(uint(_882));
    int _904 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _906 = _904 != 0;
    int _908 = _840 * _892;
    int _910 = _908 + _900;
    int _912 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _914 = _912 != 0;
    float _916 = as_type<float>(_711) * _902;
    bool _918 = !_906;
    int _920 = _918 ? 0 : 1;
    float _922 = float(uint(_910));
    float _924 = trunc(_916);
    float _926 = precise::max(_924, 0.0);
    uint _928 = uint(_926);
    float _930 = as_type<float>(_711) * _922;
    float _932 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _934 = trunc(_930);
    float _936 = precise::max(_934, 0.0);
    uint _938 = uint(_936);
    int _940 = _896 * int(_938);
    int _942 = _940 + _910;
    float _944 = float(uint(_942));
    int _946 = ~_689;
    int _948 = _946 + 1;
    float _950 = as_type<float>(_711) * _944;
    float _952 = trunc(_950);
    float _954 = precise::max(_952, 0.0);
    uint _956 = uint(_954);
    int _958 = int(_938) + int(_956);
    float _960 = in.m_49.y;
    int _962 = _948 * _958;
    int _964 = _962 + _910;
    int _966 = _948 * int(_928);
    int _968 = _966 + _882;
    bool _970 = uint(_964) >= uint(_689);
    bool _972 = !_970;
    int _974 = _972 ? 0 : (-1);
    int _976 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _978 = _976 != 0;
    int _980 = ~_958;
    int _982 = _980 + _974;
    int _984 = _982 + 1;
    float _986 = _141 * 2.0;
    int _988 = _689 * _984;
    int _990 = _988 + _910;
    float _992 = float(uint(_968));
    float _994 = floor(_986);
    bool _996 = !_786;
    int _998 = _996 ? _990 : (-1);
    float _1000 = as_type<float>(_711) * _992;
    float _1002 = _960 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _1004 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    int _1006 = _998 & 3;
    bool _1008 = _1006 != 0;
    float _1010 = trunc(_1000);
    float _1012 = precise::max(_1010, 0.0);
    uint _1014 = uint(_1012);
    int _1016 = _998 & 3;
    bool _1018 = _1016 != 0;
    float _1020 = fma(_1002, -2.0, _1004);
    bool _1022 = uint(_1006) > 1u;
    float _1024 = _141 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    int _1026 = _1018 ? 0 : 1;
    int _1028 = ~_689;
    int _1030 = _1028 + 1;
    float _1032 = -_932;
    float _1034 = fma(_1024, 2.0, _1032);
    int _1036 = ~_1026;
    int _1038 = _1036 + 1;
    int _1040 = _1038 + 1;
    float _1042 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _1044 = (*spvDescriptorSet0.vp_c9)._m0[124].w + _1042;
    bool _1046 = _994 > 0.0;
    float _1048 = -(*spvDescriptorSet0.vp_c9)._m0[124].w;
    float _1050 = _1048 + (*spvDescriptorSet0.vp_c9)._m0[125].w;
    bool _1052 = _994 >= 0.0;
    bool _1054 = isnan(_994);
    bool _1056 = _1052 || _1054;
    bool _1058 = isnan(0.0);
    bool _1060 = _1056 || _1058;
    float _1062 = 1.0 / _1044;
    bool _1064 = !_1008;
    int _1066 = _1064 ? 0 : 1;
    float _1068 = -_119;
    float _1070 = fma(_1068, (*spvDescriptorSet0.vp_c9)._m0[76].x, _1034);
    int _1072 = _1040;
    if (!_1022)
    {
        int _1074 = ~_1026;
        int _1076 = _1074 + 1;
        _1072 = _1076;
    }
    int _1078 = _1072;
    int _1080 = _998 >> 31;
    bool _1082 = uint(_1006) >= 2u;
    float _1084 = 1.0 / _1050;
    int _1086 = _1080 & 3;
    float _1088 = -(*spvDescriptorSet0.vp_c9)._m0[125].w;
    float _1090 = (*spvDescriptorSet0.vp_c9)._m0[126].w + _1088;
    int _1092 = _1082 ? 0 : 1;
    bool _1094 = _1006 != 3;
    int _1096 = _998 + _1086;
    float _1098 = _685 * _1062;
    int _1100 = int(_928) + int(_1014);
    float _1102 = in.m_42.x;
    float _1104 = in.m_42.y;
    float _1106 = in.m_42.z;
    int _1108 = _1096 >> 2;
    float _1110 = 1.0 / _1090;
    int _1112 = ~_1092;
    int _1114 = _1112 + 1;
    int _1116 = _1114 + 1;
    int _1118 = _1030 * _1100;
    int _1120 = _1118 + _882;
    int _1122 = _1108 << 4;
    int _1124 = _1122 + 368;
    float _1126 = _681 * _1084;
    int _1128 = _1060 ? 0 : 1;
    int _1130 = _1116;
    if (_1094)
    {
        int _1132 = ~_1092;
        int _1134 = _1132 + 1;
        _1130 = _1134;
    }
    int _1136 = _1130;
    int _1138 = _1124 + 8;
    uint _1140 = uint(int(uint(_1138) >> uint(2)));
    uint _1142 = uint(int(uint(int(_1140)) >> uint(2)));
    int _1144 = int(_1140) & 3;
    float _1146 = (*spvDescriptorSet0.vp_c9)._m0[int(_1142)][_1144];
    int _1148 = int(_1140) + 1;
    uint _1150 = uint(int(uint(_1148) >> uint(2)));
    int _1152 = _1148 & 3;
    float _1154 = (*spvDescriptorSet0.vp_c9)._m0[int(_1150)][_1152];
    bool _1156 = uint(_1120) >= uint(_689);
    float _1158 = in.m_49.z;
    int _1160 = abs(_1078);
    float _1162 = -(*spvDescriptorSet0.vp_c9)._m0[126].w;
    float _1164 = _671 + _1162;
    bool _1166 = !_1156;
    int _1168 = _1166 ? 0 : (-1);
    bool _1170 = _1006 != 3;
    uint _1172 = uint(int(uint(_1124) >> uint(2)));
    uint _1174 = uint(int(uint(int(_1172)) >> uint(2)));
    int _1176 = int(_1172) & 3;
    float _1178 = (*spvDescriptorSet0.vp_c9)._m0[int(_1174)][_1176];
    int _1180 = int(_1172) + 1;
    uint _1182 = uint(int(uint(_1180) >> uint(2)));
    int _1184 = _1180 & 3;
    float _1186 = (*spvDescriptorSet0.vp_c9)._m0[int(_1182)][_1184];
    int _1188 = ~_1100;
    int _1190 = _1188 + _1168;
    int _1192 = _1190 + 1;
    float _1194 = -(*spvDescriptorSet0.vp_c9)._m0[125].w;
    float _1196 = _671 + _1194;
    bool _1198 = !_1170;
    int _1200 = _1198 ? 0 : (-1);
    int _1202 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _1204 = _1202 != 0;
    int _1206 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _1208 = _1206 != 0;
    int _1210 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _1212 = _1210 != 0;
    float _1214 = -(*spvDescriptorSet0.vp_c9)._m0[126].w;
    float _1216 = _1214 + (*spvDescriptorSet0.vp_c9)._m0[127].w;
    float _1218 = _1104 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _1220 = _1104 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _1222 = _1104 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _1224 = 1.0 / _1216;
    float _1226 = fma(_1102, (*spvDescriptorSet0.vp_c10)._m0[4].x, _1218);
    float _1228 = fma(_1102, (*spvDescriptorSet0.vp_c10)._m0[5].x, _1220);
    float _1230 = fma(_1102, (*spvDescriptorSet0.vp_c10)._m0[6].x, _1222);
    float _1232 = _141 + _960;
    int _1234 = abs(_1066);
    int _1236 = _689 * _1192;
    int _1238 = _1236 + _882;
    int _1240 = abs(_1136);
    float _1242 = _1232 + (-1.0);
    float _1244 = _960 + _1158;
    float _1246 = _1158 * 2.0;
    int _1248 = ~_1160;
    int _1250 = _1248 + 1;
    int _1252 = _1250 + 1;
    float _1254 = _1196 * _1110;
    float _1256 = fma(_1242, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _1258 = _1244 + (-1.0);
    float _1260 = trunc((*spvDescriptorSet0.vp_c9)._m0[80].z);
    int _1262 = int(_1260);
    int _1264 = ~_1128;
    int _1266 = _1264 + 1;
    int _1268 = _1266 + 1;
    float _1270 = _1164 * _1224;
    int _1272 = _1268;
    if (!_1046)
    {
        int _1274 = ~_1128;
        int _1276 = _1274 + 1;
        _1272 = _1276;
    }
    int _1278 = _1272;
    int _1280 = abs(_1200);
    int _1282 = ~_1234;
    int _1284 = _1282 + 1;
    int _1286 = _1284 + 1;
    float _1288 = floor(_1246);
    bool _1290 = !_786;
    int _1292 = _1290 ? _1238 : (-1);
    float _1294 = float(uint(_1262));
    int _1296 = _1252 * as_type<int>(_1186);
    int _1298 = ~_1240;
    int _1300 = _1298 + 1;
    int _1302 = _1300 + 1;
    float _1304 = fma(_1258, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    bool _1306 = _1288 > 0.0;
    int _1308 = _1286 * as_type<int>(_1178);
    int _1310 = _1308 + _1296;
    int _1312 = ~_1280;
    int _1314 = _1312 + 1;
    int _1316 = _1314 + 1;
    int _1318 = abs(_920);
    int _1320 = _1302 * as_type<int>(_1146);
    int _1322 = _1320 + _1310;
    int _1324 = abs(_1262);
    float _1326 = 1.0 / _1294;
    bool _1328 = _1288 >= 0.0;
    bool _1330 = isnan(_1288);
    bool _1332 = _1328 || _1330;
    bool _1334 = isnan(0.0);
    bool _1336 = _1332 || _1334;
    int _1338 = _1316 * as_type<int>(_1154);
    int _1340 = _1338 + _1322;
    float _1342 = fma(_1106, (*spvDescriptorSet0.vp_c10)._m0[4].z, _1226);
    int _1344 = ~_1318;
    int _1346 = _1344 + 1;
    int _1348 = _1346 + 1;
    float _1350 = float(uint(_1324));
    float _1352 = _1342 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    int _1354 = _1340 * _1348;
    float _1356 = fma(_1106, (*spvDescriptorSet0.vp_c10)._m0[5].z, _1228);
    float _1358 = fma(_1106, (*spvDescriptorSet0.vp_c10)._m0[6].z, _1230);
    float _1360 = 1.0 / _1350;
    int _1362 = _1292 * _1318;
    int _1364 = _1362 + _1354;
    float _1366 = -(*spvDescriptorSet0.vp_c9)._m0[123].x;
    float _1368 = (*spvDescriptorSet0.vp_c9)._m0[124].x + _1366;
    int _1370 = as_type<int>(_1326) + (-2);
    float _1372 = -(*spvDescriptorSet0.vp_c9)._m0[123].z;
    float _1374 = (*spvDescriptorSet0.vp_c9)._m0[124].z + _1372;
    float _1376 = fma(_1368, _1098, (*spvDescriptorSet0.vp_c9)._m0[123].x);
    int _1378 = abs(_1364);
    float _1380 = _1356 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _1382 = float(uint(_1364));
    float _1384 = -(*spvDescriptorSet0.vp_c9)._m0[123].y;
    float _1386 = (*spvDescriptorSet0.vp_c9)._m0[124].y + _1384;
    float _1388 = _1358 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    int _1390 = ~_1324;
    int _1392 = _1390 + 1;
    float _1394 = as_type<float>(_1370) * _1382;
    float _1396 = float(uint(_1378));
    float _1398 = fma(_1386, _1098, (*spvDescriptorSet0.vp_c9)._m0[123].y);
    int _1400 = as_type<int>(_1360) + (-2);
    float _1402 = -(*spvDescriptorSet0.vp_c9)._m0[124].y;
    float _1404 = _1402 + (*spvDescriptorSet0.vp_c9)._m0[125].y;
    float _1406 = fma(_1374, _1098, (*spvDescriptorSet0.vp_c9)._m0[123].z);
    float _1408 = trunc(_1394);
    float _1410 = precise::max(_1408, 0.0);
    uint _1412 = uint(_1410);
    float _1414 = -(*spvDescriptorSet0.vp_c9)._m0[124].x;
    float _1416 = _1414 + (*spvDescriptorSet0.vp_c9)._m0[125].x;
    float _1418 = as_type<float>(_1400) * _1396;
    float _1420 = fma(_1404, _1126, (*spvDescriptorSet0.vp_c9)._m0[124].y);
    float _1422 = -(*spvDescriptorSet0.vp_c9)._m0[124].z;
    float _1424 = _1422 + (*spvDescriptorSet0.vp_c9)._m0[125].z;
    int _1426 = ~_1262;
    int _1428 = _1426 + 1;
    float _1430 = fma(_1416, _1126, (*spvDescriptorSet0.vp_c9)._m0[124].x);
    float _1432 = trunc(_1418);
    float _1434 = precise::max(_1432, 0.0);
    uint _1436 = uint(_1434);
    float _1438 = fma(_1424, _1126, (*spvDescriptorSet0.vp_c9)._m0[124].z);
    float _1440 = -(*spvDescriptorSet0.vp_c9)._m0[125].x;
    float _1442 = (*spvDescriptorSet0.vp_c9)._m0[126].x + _1440;
    float _1444 = -(*spvDescriptorSet0.vp_c9)._m0[125].y;
    float _1446 = (*spvDescriptorSet0.vp_c9)._m0[126].y + _1444;
    bool _1448 = _671 >= (*spvDescriptorSet0.vp_c9)._m0[127].w;
    bool _1450 = isnan(_671);
    bool _1452 = _1448 || _1450;
    bool _1454 = isnan((*spvDescriptorSet0.vp_c9)._m0[127].w);
    bool _1456 = _1452 || _1454;
    float _1458 = float(_1456);
    float _1460 = -(*spvDescriptorSet0.vp_c9)._m0[125].z;
    float _1462 = (*spvDescriptorSet0.vp_c9)._m0[126].z + _1460;
    float _1464 = fma(_1442, _1254, (*spvDescriptorSet0.vp_c9)._m0[125].x);
    float _1466 = fma(_1446, _1254, (*spvDescriptorSet0.vp_c9)._m0[125].y);
    int _1468 = _1428 * int(_1412);
    int _1470 = _1468 + _1364;
    float _1472 = -_1458;
    float _1474 = _1472 + 1.0;
    int _1476 = _1336 ? 0 : 1;
    float _1478 = float(uint(_1470));
    float _1480 = fma(_1462, _1254, (*spvDescriptorSet0.vp_c9)._m0[125].z);
    int _1482 = _1392 * int(_1436);
    int _1484 = _1482 + _1378;
    bool _1486 = _671 >= (*spvDescriptorSet0.vp_c9)._m0[126].w;
    bool _1488 = isnan(_671);
    bool _1490 = _1486 || _1488;
    bool _1492 = isnan((*spvDescriptorSet0.vp_c9)._m0[126].w);
    bool _1494 = _1490 || _1492;
    float _1496 = float(_1494);
    bool _1498 = _671 >= (*spvDescriptorSet0.vp_c9)._m0[125].w;
    bool _1500 = isnan(_671);
    bool _1502 = _1498 || _1500;
    bool _1504 = isnan((*spvDescriptorSet0.vp_c9)._m0[125].w);
    bool _1506 = _1502 || _1504;
    float _1508 = float(_1506);
    float _1510 = as_type<float>(_1370) * _1478;
    float _1512 = float(uint(_1484));
    float _1514 = _1496 * _1474;
    float _1516 = -_1496;
    float _1518 = _1516 + 1.0;
    float _1520 = -_1508;
    float _1522 = _1520 + 1.0;
    bool _1524 = _671 >= (*spvDescriptorSet0.vp_c9)._m0[123].w;
    bool _1526 = isnan(_671);
    bool _1528 = _1524 || _1526;
    bool _1530 = isnan((*spvDescriptorSet0.vp_c9)._m0[123].w);
    bool _1532 = _1528 || _1530;
    float _1534 = float(_1532);
    float _1536 = as_type<float>(_1400) * _1512;
    bool _1538 = _671 >= (*spvDescriptorSet0.vp_c9)._m0[124].w;
    bool _1540 = isnan(_671);
    bool _1542 = _1538 || _1540;
    bool _1544 = isnan((*spvDescriptorSet0.vp_c9)._m0[124].w);
    bool _1546 = _1542 || _1544;
    float _1548 = float(_1546);
    float _1550 = -(*spvDescriptorSet0.vp_c9)._m0[126].x;
    float _1552 = _1550 + (*spvDescriptorSet0.vp_c9)._m0[127].x;
    float _1554 = -(*spvDescriptorSet0.vp_c9)._m0[126].y;
    float _1556 = _1554 + (*spvDescriptorSet0.vp_c9)._m0[127].y;
    float _1558 = _1508 * _1518;
    float _1560 = trunc(_1510);
    float _1562 = precise::max(_1560, 0.0);
    uint _1564 = uint(_1562);
    float _1566 = _1548 * _1522;
    float _1568 = -_1548;
    float _1570 = _1568 + 1.0;
    float _1572 = -(*spvDescriptorSet0.vp_c9)._m0[126].z;
    float _1574 = _1572 + (*spvDescriptorSet0.vp_c9)._m0[127].z;
    float _1576 = fma(_1552, _1270, (*spvDescriptorSet0.vp_c9)._m0[126].x);
    float _1578 = fma(_1556, _1270, (*spvDescriptorSet0.vp_c9)._m0[126].y);
    float _1580 = _1534 * _1570;
    float _1582 = fma(_1574, _1270, (*spvDescriptorSet0.vp_c9)._m0[126].z);
    float _1584 = trunc(_1536);
    float _1586 = precise::max(_1584, 0.0);
    uint _1588 = uint(_1586);
    float _1590 = -_1534;
    float _1592 = _1590 + 1.0;
    float _1594 = _1376 * _1580;
    float _1596 = _1398 * _1580;
    float _1598 = _1406 * _1580;
    int _1600 = ~_1476;
    int _1602 = _1600 + 1;
    int _1604 = _1602 + 1;
    float _1606 = fma(_1592, (*spvDescriptorSet0.vp_c9)._m0[123].x, _1594);
    float _1608 = fma(_1592, (*spvDescriptorSet0.vp_c9)._m0[123].y, _1596);
    float _1610 = fma(_1592, (*spvDescriptorSet0.vp_c9)._m0[123].z, _1598);
    bool _1612 = !_1208;
    int _1614 = _1612 ? 0 : 1;
    float _1616 = fma(_1430, _1566, _1606);
    int _1618 = int(_1412) + int(_1564);
    float _1620 = fma(_1420, _1566, _1608);
    int _1622 = abs(_1614);
    float _1624 = fma(_1438, _1566, _1610);
    int _1626 = ~_1262;
    int _1628 = _1626 + 1;
    float _1630 = fma(_1466, _1558, _1620);
    int _1632 = ~_1324;
    int _1634 = _1632 + 1;
    float _1636 = fma(_1480, _1558, _1624);
    int _1638 = int(_1436) + int(_1588);
    int _1640 = _1628 * _1618;
    int _1642 = _1640 + _1364;
    int _1644 = _1604;
    if (!_1306)
    {
        int _1646 = ~_1476;
        int _1648 = _1646 + 1;
        _1644 = _1648;
    }
    int _1650 = _1644;
    float _1652 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _1654 = float(_1278);
    int _1656 = _1634 * _1638;
    int _1658 = _1656 + _1378;
    bool _1660 = uint(_1642) >= uint(_1262);
    float _1662 = fma(_1464, _1558, _1616);
    float _1664 = float(_1622);
    float _1666 = fma(_1578, _1514, _1630);
    bool _1668 = uint(_1658) >= uint(_1324);
    float _1670 = fma(_1576, _1514, _1662);
    bool _1672 = !_1660;
    int _1674 = _1672 ? 0 : (-1);
    float _1676 = _1664 * _1654;
    bool _1678 = !_1668;
    int _1680 = _1678 ? 0 : (-1);
    float _1682 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    int _1684 = ~_1618;
    int _1686 = _1684 + _1674;
    int _1688 = _1686 + 1;
    float _1690 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1692 = _1352 + _1690;
    int _1694 = _1364 ^ _1262;
    float _1696 = fma(_1582, _1514, _1636);
    int _1698 = ~_1680;
    int _1700 = _1638 + _1698;
    int _1702 = _1700 + 1;
    float _1704 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1706 = _1380 + _1704;
    uint _1708 = uint(int(uint(_1694) >> uint(31)));
    float _1710 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1712 = _1388 + _1710;
    bool _1714 = _1262 == 0;
    float _1716 = _1706 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    int _1718 = ~int(_1708);
    int _1720 = _1718 + 1;
    float _1722 = fma(_119, (*spvDescriptorSet0.vp_c9)._m0[76].y, _1020);
    bool _1724 = _1262 == 0;
    float _1726 = fma(_1692, (*spvDescriptorSet0.vp_c8)._m0[28].x, _1716);
    int _1728 = _1262 * _1688;
    int _1730 = _1728 + _1364;
    int _1732 = _1702 ^ _1720;
    float _1734 = _1682 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    bool _1736 = _141 > 0.5;
    float _1738 = fma(_1712, (*spvDescriptorSet0.vp_c8)._m0[28].z, _1726);
    float _1740 = fma(_1458, (*spvDescriptorSet0.vp_c9)._m0[127].x, _1670);
    int _1742 = ~_1720;
    int _1744 = _1742 + _1732;
    int _1746 = _1744 + 1;
    float _1748 = fma(_1458, (*spvDescriptorSet0.vp_c9)._m0[127].y, _1666);
    bool _1750 = !_1714;
    int _1752 = _1750 ? _1730 : (-1);
    float _1754 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    bool _1756 = _960 > 0.5;
    float _1758 = fma(_1458, (*spvDescriptorSet0.vp_c9)._m0[127].z, _1696);
    float _1760 = -_189;
    int _1762 = _1736 ? as_type<int>(_1760) : as_type<int>(_189);
    float _1764 = fma(_141, (*spvDescriptorSet0.vp_c9)._m0[78].z, _1754);
    bool _1766 = _1738 >= 0.0;
    float _1768 = _1740 * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    bool _1770 = !_1724;
    int _1772 = _1770 ? _1746 : (-1);
    float _1774 = fma(_119, (*spvDescriptorSet0.vp_c9)._m0[77].z, _1764);
    float _1776 = -_169;
    int _1778 = _1756 ? as_type<int>(_1776) : as_type<int>(_169);
    float _1780 = _1758 * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1782 = float(_1752);
    float _1784 = _1652 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1786 = float(_1772);
    float _1788 = -_1774;
    float _1790 = _1788 + 1.0;
    bool _1792 = !_914;
    float _1794 = _1792 ? _169 : as_type<float>(_1778);
    float _1796 = fma(_1734, _1782, _1070);
    float _1798 = -_1722;
    float _1800 = fma(_1784, _1786, _1798);
    bool _1802 = !_978;
    float _1804 = _1802 ? _189 : as_type<float>(_1762);
    float _1806 = _1794 + (-0.5);
    float _1808 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _1810 = log2(_1808);
    float _1812 = _960 * 2.0;
    if (_1766)
    {
        out.m_45.x = 0.0;
    }
    float _1814 = -_1784;
    float _1816 = fma(_1814, _1806, _1800);
    float _1818 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _1820 = _1804 + 0.5;
    bool _1822 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1824 = isnan(0.0);
    bool _1826 = _1822 || _1824;
    bool _1828 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1830 = _1826 || _1828;
    float _1832 = fma(_960, (*spvDescriptorSet0.vp_c9)._m0[78].w, _1818);
    float _1834 = fma(_1734, _1820, _1796);
    float _1836 = _1706 * _1706;
    float _1838 = _1768 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1840 = fma(_119, (*spvDescriptorSet0.vp_c9)._m0[77].w, _1832);
    float _1842 = -_1790;
    float _1844 = fma(_1804, _1842, _1834);
    float _1846 = fma(_1692, _1692, _1836);
    float _1848 = _1748 * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1850 = -_1840;
    float _1852 = _1850 + 1.0;
    float _1854 = _1810 * _119;
    float _1856 = fma(_1712, _1712, _1846);
    float _1858 = _1780 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1860 = fma(_1794, _1852, _1816);
    float _1862 = in.m_56.x;
    float _1864 = in.m_56.y;
    float _1866 = in.m_56.z;
    float _1868 = _1846;
    if (_1766)
    {
        _1868 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _1870 = _1868;
    float _1872 = rsqrt(_1856);
    float _1874 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _1876 = 1.0 + _1874;
    float _1878 = _1848 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    int _1880 = as_type<int>(_1870);
    if (_1766)
    {
        float _1882 = _1870 * 5.0;
        _1880 = as_type<int>(_1882);
    }
    int _1884 = _1880;
    out.m_58.x = _1844;
    out.m_58.y = _1860;
    bool _1886 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1888 = isnan(1.0);
    bool _1890 = _1886 || _1888;
    bool _1892 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1894 = _1890 || _1892;
    float _1896 = floor(_1812);
    if (_1766)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _5722 = as_type<float>(_1884);
        out.gl_Position.z = _5722;
    }
    bool _1898 = !_1212;
    int _1900 = _1898 ? 0 : 1;
    bool _1902 = !_1204;
    int _1904 = _1902 ? 0 : 1;
    out.m_60.x = _1838;
    out.m_60.y = _1878;
    out.m_60.z = _1858;
    float _1906 = 1.0 / _1876;
    float _1908 = _1706 * _1872;
    float _1910 = exp2(_1854);
    float _1912 = _1692 * _1872;
    if (_1766)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _1914 = -_1908;
    float _1916 = fma(_1914, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1380);
    int _1918 = abs(_1904);
    float _1920 = _1712 * _1872;
    float _1922 = -_1912;
    float _1924 = fma(_1922, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1352);
    float _1926 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1928 = _1916 + _1926;
    float _1930 = -_1910;
    float _1932 = _1930 + 1.0;
    float _1934 = -_1920;
    float _1936 = fma(_1934, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1388);
    float _1938 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1940 = _1924 + _1938;
    float _1942 = _1928 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1944 = float(_1918);
    float _1946 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1948 = _1936 + _1946;
    float _1950 = float(_1650);
    float _1952 = fma(_1940, (*spvDescriptorSet0.vp_c8)._m0[28].x, _1942);
    float _1954 = _1830 ? _1932 : 0.0;
    float _1956 = _960 + (-0.5);
    bool _1958 = _1896 > 0.0;
    float _1960 = fma(_1948, (*spvDescriptorSet0.vp_c8)._m0[28].z, _1952);
    float _1962 = _1944 * _1950;
    float _1964 = _1936;
    if (_1894)
    {
        float _1966 = _1954 * _1906;
        _123 = _1966;
    }
    float _1968 = _123;
    float _1970 = _1676 * (-2.0);
    bool _1972 = _1896 >= 0.0;
    bool _1974 = isnan(_1896);
    bool _1976 = _1972 || _1974;
    bool _1978 = isnan(0.0);
    bool _1980 = _1976 || _1978;
    float _1982 = -_1908;
    float _1984 = fma(_1982, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1706);
    bool _1986 = _1960 >= 0.0;
    float _1988 = _1962 * (-2.0);
    float _1990 = fma(_1970, _1864, _1864);
    float _1992 = _141 + (-0.5);
    float _1994 = fma(_1304, _1970, _1304);
    float _1996 = fma(_1988, _1862, _1862);
    int _1998 = _1980 ? 0 : 1;
    float _2000 = fma(_1256, _1988, _1256);
    float _2002 = fma(_1956, (*spvDescriptorSet0.vp_c9)._m0[196].y, _1990);
    float _2004 = fma(_1992, (*spvDescriptorSet0.vp_c9)._m0[196].x, _1996);
    int _2006 = ~_1998;
    int _2008 = _2006 + 1;
    int _2010 = _2008 + 1;
    int _2012 = _2010;
    float _2014 = _2002;
    if (!_1958)
    {
        int _2016 = ~_1998;
        int _2018 = _2016 + 1;
        _2012 = _2018;
    }
    int _2020 = _2012;
    float _2022 = fma(_2000, _1968, _2004);
    float _2024 = fma(_1994, _1968, _2002);
    float _2026 = in.m_62.x;
    float _2028 = in.m_62.y;
    int _2030 = as_type<int>(_2024);
    if (_1986)
    {
        _2014 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _2032 = _2014;
    float _2034 = _2024 * 0.15915493667125701904296875;
    float _2036 = float(_2020);
    if (_1986)
    {
        out.m_45.x = 0.0;
    }
    if (_1986)
    {
        float _2038 = _2032 * 5.0;
        _2030 = as_type<int>(_2038);
    }
    int _2040 = _2030;
    float _2042 = _2034 * 6.283185482025146484375;
    float _2044 = cos(_2042);
    int _2046 = abs(_1900);
    if (_1986)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _5958 = as_type<float>(_2040);
        out.gl_Position.z = _5958;
    }
    float _2048 = float(_2046);
    float _2050 = _2034 * 6.283185482025146484375;
    float _2052 = sin(_2050);
    if (_1986)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _2054 = -_1380;
    float _2056 = _2054 + (*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2058 = _2022 * 0.15915493667125701904296875;
    float _2060 = -_1352;
    float _2062 = _2060 + (*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2064 = -_1388;
    float _2066 = _2064 + (*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2068 = _2056 * _2056;
    float _2070 = -_1912;
    float _2072 = fma(_2070, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1692);
    float _2074 = _1984 * _1984;
    float _2076 = _2048 * _2036;
    float _2078 = fma(_2062, _2062, _2068);
    float _2080 = _141 + _1158;
    float _2082 = fma(_2072, _2072, _2074);
    float _2084 = fma(_2066, _2066, _2078);
    float _2086 = -_1920;
    float _2088 = fma(_2086, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1712);
    float _2090 = _2080 + (-1.0);
    float _2092 = _2076 * (-2.0);
    float _2094 = _1158 + (-0.5);
    float _2096 = fma(_2088, _2088, _2082);
    float _2098 = rsqrt(_2084);
    float _2100 = fma(_2090, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _2102 = fma(_2092, _1866, _1866);
    float _2104 = _637 * _2026;
    float _2106 = _639 * _2028;
    float _2108 = fma(_2100, _2092, _2100);
    float _2110 = fma(_2094, (*spvDescriptorSet0.vp_c9)._m0[196].z, _2102);
    float _2112 = _247 * _2104;
    float _2114 = sqrt(_2096);
    float _2116 = _247 * _2106;
    float _2118 = fma(_2108, _1968, _2110);
    float _2120 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _169);
    float _2122 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _189);
    float _2124 = _2118 * 0.15915493667125701904296875;
    bool _2126 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _2128 = isnan(0.5);
    bool _2130 = _2126 || _2128;
    bool _2132 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _2134 = _2130 || _2132;
    float _2136 = _2062 * _2098;
    float _2138 = _2058 * 6.283185482025146484375;
    float _2140 = sin(_2138);
    float _2142 = _2066 * _2098;
    float _2144 = _2056 * _2098;
    float _2146 = -(*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _2148 = _2136 * _2146;
    float _2150 = -(*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2152 = _2142 * _2150;
    float _2154 = -(*spvDescriptorSet0.vp_c8)._m0[1].x;
    float _2156 = _2144 * _2154;
    float _2158 = -(*spvDescriptorSet0.vp_c8)._m0[1].x;
    float _2160 = -_2148;
    float _2162 = fma(_2142, _2158, _2160);
    float _2164 = _2058 * 6.283185482025146484375;
    float _2166 = cos(_2164);
    float _2168 = -(*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _2170 = -_2152;
    float _2172 = fma(_2144, _2168, _2170);
    float _2174 = -(*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2176 = -_2156;
    float _2178 = fma(_2136, _2174, _2176);
    float _2180 = _2162 * _2162;
    float _2182 = _1872 * _2114;
    float _2184 = fma(_2172, _2172, _2180);
    float _2186 = _2124 * 6.283185482025146484375;
    float _2188 = sin(_2186);
    float _2190 = _2116 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _2192 = _2140 * _2052;
    float _2194 = fma(_2178, _2178, _2184);
    float _2196 = _2182 * _2190;
    float _2198 = _2124 * 6.283185482025146484375;
    float _2200 = cos(_2198);
    float _2202 = _2166 * _2044;
    float _2204 = fma(_2188, _2202, _2192);
    float _2206 = rsqrt(_2194);
    float _2208 = fma(_2188, _2192, _2202);
    float _2210 = _2112 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _2212 = _2182 * _2210;
    float _2214 = _2120 * _2196;
    float _2216 = _2166 * _2052;
    float _2218 = _2140 * _2044;
    float _2220 = _2122 * _2212;
    float _2222 = _2200 * _2214;
    float _2224 = -_2214;
    float _2226 = _2188 * _2224;
    float _2228 = -_2216;
    float _2230 = fma(_2188, _2218, _2228);
    float _2232 = -_2218;
    float _2234 = fma(_2188, _2216, _2232);
    float _2236 = _2166 * _2222;
    float _2238 = _2172 * _2206;
    float _2240 = _2044 * _2200;
    float _2242 = _2052 * _2200;
    float _2244 = fma(_2204, _2220, _2236);
    float _2246 = _2182 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _2248 = _2246 * 0.5;
    float _2250 = _2162 * _2206;
    float _2252 = _2144 * _2238;
    float _2254 = fma(_2240, _2220, _2226);
    float _2256 = _2140 * _2222;
    float _2258 = fma(_2234, _2248, _2244);
    float _2260 = _2178 * _2206;
    float _2262 = _2142 * _2250;
    float _2264 = -_2252;
    float _2266 = fma(_2136, _2250, _2264);
    float _2268 = fma(_2230, _2220, _2256);
    float _2270 = fma(_2242, _2248, _2254);
    float _2272 = -_2262;
    float _2274 = fma(_2144, _2260, _2272);
    float _2276 = _2266 * _2258;
    float _2278 = fma(_2208, _2248, _2268);
    float _2280 = _2274 * _2258;
    float _2282 = fma(_2260, _2270, _2276);
    float _2284 = fma(_2238, _2270, _2280);
    float _2286 = fma(_2142, _2278, _2282);
    float _2288 = fma(_2136, _2278, _2284);
    float _2290 = _1388 + _2286;
    float _2292 = _2136 * _2260;
    float _2294 = _1352 + _2288;
    float _2296 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _2298 = _2290 + _2296;
    float _2300 = -_2292;
    float _2302 = fma(_2142, _2238, _2300);
    float _2304 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _2306 = _2294 + _2304;
    float _2308 = _2298 * _2298;
    float _2310 = _2302 * _2258;
    float _2312 = fma(_2306, _2306, _2308);
    float _2314 = fma(_2250, _2270, _2310);
    float _2316 = sqrt(_2312);
    float _2318 = fma(_2144, _2278, _2314);
    float _2320 = _1380 + _2318;
    bool _2322 = _2316 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2324 = _2258;
    float _2326 = _2318;
    float _2328 = _2314;
    float _2330 = _2250;
    float _2332 = _2220;
    if (!_2322)
    {
        _2324 = _2294;
    }
    float _2334 = _2324;
    float _2336 = _2334;
    if (!_2322)
    {
        _2326 = _2290;
    }
    float _2338 = _2326;
    float _2340 = _2338;
    if (!_2322)
    {
        _2328 = _2320;
    }
    float _2342 = _2328;
    bool _2344 = !_2322;
    float _2346 = _2342;
    if (!_2344)
    {
        float _2348 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2350 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _2352 = _2316 + _2350;
        float _2354 = _2320 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2356 = rsqrt(_2312);
        float _2358 = _2352 * _2348;
        float _2360 = _2358 * 0.15915493667125701904296875;
        float _2362 = _2360 * 6.283185482025146484375;
        float _2364 = cos(_2362);
        float _2366 = _2360 * 6.283185482025146484375;
        float _2368 = sin(_2366);
        float _2370 = _2364 + (-1.0);
        float _2372 = _2370 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2374 = fma(_2368, _2354, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _2376 = fma(_2320, _2364, _2372);
        float _2378 = _2356 * _2374;
        float _2380 = fma(_2306, _2378, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _2382 = fma(_2298, _2378, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _2336 = _2380;
        _2346 = _2376;
        _2340 = _2382;
    }
    float _2384 = _2336;
    float _2386 = _2346;
    float _2388 = _2340;
    float _2390 = -_1912;
    float _2392 = fma(_2390, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2384);
    float _2394 = -_1908;
    float _2396 = fma(_2394, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2386);
    float _2398 = -_1920;
    float _2400 = fma(_2398, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2388);
    float _2402 = _2396;
    float _2404 = _2392;
    float _2406 = _2400;
    if (!_2134)
    {
        float _2408 = _1928 * _1928;
        float _2410 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _2412 = -_1388;
        float _2414 = _2412 + _2388;
        float _2416 = fma(_1940, _1940, _2408);
        float _2418 = fma(_1948, _1948, _2416);
        float _2420 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _2422 = sqrt(_2418);
        float _2424 = 1.0 / _2182;
        float _2426 = _2420 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _2428 = precise::min(_2422, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _2430 = _2428 * _2410;
        float _2432 = _2430 * _2424;
        float _2434 = -_1380;
        float _2436 = _2434 + _2386;
        float _2438 = -_1352;
        float _2440 = _2438 + _2384;
        float _2442 = _2426 * _2432;
        float _2444 = _2414 * _2432;
        float _2446 = fma(_2436, _2442, _1916);
        float _2448 = fma(_2440, _2442, _1924);
        float _2450 = fma(_2426, _2444, _1936);
        _2402 = _2446;
        _2404 = _2448;
        _2406 = _2450;
        _2330 = _2426;
    }
    float _2452 = _2402;
    float _2454 = _2404;
    float _2456 = _2406;
    float _2458 = _2330;
    float _2460 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2462 = _2452 + _2460;
    float _2464 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2466 = _2454 + _2464;
    float _2468 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2470 = _2456 + _2468;
    float _2472 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _2474 = _2462 * _2462;
    float _2476 = fma(_2466, _2466, _2474);
    float _2478 = fma(_2470, _2470, _2476);
    float _2480 = rsqrt(_2478);
    float _2482 = sqrt(_2478);
    float _2484 = _2480 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _2486 = _2466 * _2484;
    float _2488 = _2470 * _2484;
    float _2490 = _2486 * _2486;
    float _2492 = _2488 * _2488;
    float _2494 = _2490 + _2492;
    float _2496 = sqrt(_2494);
    bool _2498 = _2496 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2500 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2502 = _2496 + _2500;
    float _2504 = _2470;
    float _2506 = _2474;
    float _2508 = _2502;
    float _2510 = _2458;
    float _2512 = _2484;
    if (_2498)
    {
        float _2514 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2504 = _2514;
    }
    float _2516 = _2504;
    if (_2498)
    {
        float _2518 = rsqrt(_2494);
        _2506 = _2518;
    }
    float _2520 = _2506;
    float _2522 = _2520;
    if (_2498)
    {
        float _2524 = _2502 * _2516;
        _2508 = _2524;
    }
    float _2526 = _2508;
    if (_2498)
    {
        float _2528 = _2526 * 0.15915493667125701904296875;
        _2510 = _2528;
    }
    float _2530 = _2510;
    float _2532 = _2480;
    float _2534 = _2530;
    if (_2498)
    {
        float _2536 = _2530 * 6.283185482025146484375;
        float _2538 = sin(_2536);
        _2532 = _2538;
    }
    float _2540 = _2532;
    float _2542 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _2544 = precise::max(0.0, _2542);
    float _2546 = _2320;
    float _2548 = _2544;
    float _2550 = _2542;
    if (_2498)
    {
        float _2552 = _2530 * 6.283185482025146484375;
        float _2554 = cos(_2552);
        _2546 = _2554;
    }
    float _2556 = _2546;
    float _2558 = -_2484;
    float _2560 = -_2544;
    float _2562 = fma(_2462, _2558, _2560);
    if (_2498)
    {
        float _2564 = _2562 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2548 = _2564;
    }
    float _2566 = _2548;
    float _2568 = _2566;
    if (!_2498)
    {
        _2534 = _2490;
    }
    float _2570 = _2534;
    float _2572 = _2540;
    float _2574 = _2570;
    if (_2498)
    {
        float _2576 = fma(_2540, _2566, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _2572 = _2576;
    }
    float _2578 = _2572;
    float _2580 = _2578;
    if (!_2498)
    {
        _2568 = _2488;
    }
    float _2582 = _2568;
    float _2584 = _2582;
    if (_2498)
    {
        float _2586 = _2556 + (-1.0);
        _2550 = _2586;
    }
    float _2588 = _2550;
    float _2590 = _2588;
    if (_2498)
    {
        float _2592 = _2520 * _2578;
        _2332 = _2592;
    }
    float _2594 = _2332;
    if (!_2498)
    {
        _2522 = _2486;
    }
    float _2596 = _2522;
    float _2598 = _2596;
    if (_2498)
    {
        float _2600 = _2588 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2512 = _2600;
    }
    float _2602 = _2512;
    if (_2498)
    {
        float _2604 = _2486 * _2594;
        _2598 = _2604;
    }
    float _2606 = _2598;
    if (!_2498)
    {
        _2580 = _2562;
    }
    float _2608 = _2580;
    float _2610 = _2608;
    if (_2498)
    {
        float _2612 = _2488 * _2594;
        _2584 = _2612;
    }
    float _2614 = _2584;
    if (_2498)
    {
        float _2616 = fma(_2562, _2556, _2602);
        _2610 = _2616;
    }
    float _2618 = _2610;
    if (_2498)
    {
        float _2620 = _2606 * _2606;
        _2574 = _2620;
    }
    float _2622 = _2574;
    if (!_2498)
    {
        _2590 = _2492;
    }
    float _2624 = _2590;
    float _2626 = _2624;
    if (_2498)
    {
        float _2628 = _2614 * _2614;
        _2626 = _2628;
    }
    float _2630 = _2626;
    float _2632 = _2452 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _2634 = fma(_2618, _2618, _2622);
    float _2636 = _2452 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2638 = fma(_2454, (*spvDescriptorSet0.vp_c8)._m0[2].x, _2632);
    float _2640 = _2634 + _2630;
    float _2642 = _2452 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2644 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _2646 = fma(_2482, (*spvDescriptorSet0.vp_c15)._m0[23].w, _2644);
    float _2648 = precise::clamp(_2646, 0.0, 1.0);
    float _2650 = fma(_2456, (*spvDescriptorSet0.vp_c8)._m0[2].z, _2638);
    float _2652 = rsqrt(_2640);
    float _2654 = _2452 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _2656 = -_2648;
    float _2658 = _2656 + 1.0;
    float _2660 = fma(_2454, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2642);
    float _2662 = _2650 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _2664 = fma(_2454, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2636);
    float _2666 = fma(_2454, (*spvDescriptorSet0.vp_c8)._m0[3].x, _2654);
    float _2668 = fma(_2456, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2660);
    float _2670 = abs(_2658);
    float _2672 = log2(_2670);
    float _2674 = fma(_2456, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2664);
    float _2676 = fma(_2456, (*spvDescriptorSet0.vp_c8)._m0[3].z, _2666);
    float _2678 = _2668 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _2680 = _2662 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _2682 = _2674 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2684 = _2678 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _2686 = _2652 * _2606;
    float _2688 = _2652 * _2618;
    float _2690 = _2652 * _2614;
    float _2692 = fma(_2682, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2684);
    float _2694 = _2686 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _2696 = _2676 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _2698 = -_2680;
    float _2700 = fma(_2698, _2472, 1.0);
    float _2702 = fma(_2662, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2692);
    float _2704 = _2672 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _2706 = -_2694;
    float _2708 = fma(_2688, (*spvDescriptorSet0.vp_c15)._m0[21].y, _2706);
    float _2710 = _2678 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2712 = fma(_2696, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2702);
    float _2714 = log2(_2700);
    float _2716 = -_2690;
    float _2718 = fma(_2716, (*spvDescriptorSet0.vp_c15)._m0[21].z, _2708);
    float _2720 = _2678 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2722 = fma(_2682, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2710);
    float _2724 = _2688 + 1.0;
    float _2726 = fma(_2718, -0.5, 0.5);
    float _2728 = fma(_2682, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2720);
    float _2730 = fma(_2718, 0.5, 0.5);
    float _2732 = exp2(_2704);
    float _2734 = fma(_2662, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2722);
    float _2736 = fma(_2662, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2728);
    float _2738 = fma(_2730, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _2740 = fma(_2696, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2736);
    float _2742 = fma(_2730, _2738, -0.212114393711090087890625);
    float _2744 = 1.0 / _2712;
    float _2746 = _2714 * 0.693147182464599609375;
    float _2748 = fma(_2730, _2742, 1.570728778839111328125);
    float _2750 = _2746 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _2752 = sqrt(_2726);
    float _2754 = -_2688;
    float _2756 = fma(_2732, _2724, _2754);
    float _2758 = fma(_2696, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2734);
    float _2760 = fma(_2756, 0.5, 0.5);
    float _2762 = _2758 * _2744;
    float _2764 = _2740 * _2744;
    float _2766 = fma(_2762, 0.5, 0.5);
    float _2768 = fma(_2764, -0.5, 0.5);
    float _2770 = _2752 * 0.636619746685028076171875;
    float3 _7110 = float3(_2766, _2768, _2750);
    float _2772 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_7110, float3(0.0), isnan(_7110)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_7110, float3(0.0), isnan(_7110)), level(0.0)).x;
    float3 _7121 = float3(_2766, _2768, _2750);
    float4 _2775 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_7121, float3(0.0), isnan(_7121)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_7121, float3(0.0), isnan(_7121)), level(0.0)).xyzw;
    float _2777 = _2775.x;
    float _2779 = _2775.y;
    float _2781 = _2775.z;
    float _2783 = _2775.w;
    float _2785 = -_2748;
    float _2787 = fma(_2770, _2785, 1.0);
    float2 _7143 = float2(_2787, _2760);
    float3 _2791 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_7143, float2(0.0), isnan(_7143)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_7143, float2(0.0), isnan(_7143)), level(0.0)).xyz;
    float _2793 = _2791.x;
    float _2795 = _2791.y;
    float _2797 = _2791.z;
    float _2799 = _1916 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _2801 = _1916 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    bool _2803 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _2805 = isnan(0.5);
    bool _2807 = _2803 || _2805;
    bool _2809 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _2811 = _2807 || _2809;
    float _2813 = fma(_1924, (*spvDescriptorSet0.vp_c8)._m0[11].x, _2799);
    float _2815 = fma(_1924, (*spvDescriptorSet0.vp_c8)._m0[10].x, _2801);
    float _2817 = fma(_1936, (*spvDescriptorSet0.vp_c8)._m0[11].z, _2813);
    float _2819 = fma(_1936, (*spvDescriptorSet0.vp_c8)._m0[10].z, _2815);
    float _2821 = _2817 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _2823 = _2819 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _2825 = _2817;
    float _2827 = _2766;
    if (!_2811)
    {
        _1964 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _2829 = _1964;
    float _2831 = 1.0 / _2821;
    float _2833 = _2823 + _2821;
    float _2835 = _2829;
    if (!_2811)
    {
        _251 = (*spvDescriptorSet0.vp_c9)._m0[140].x;
    }
    float _2837 = _251;
    float _2839 = _2837;
    if (!_2811)
    {
        float _2841 = -_2837;
        float _2843 = _2841 + (*spvDescriptorSet0.vp_c9)._m0[140].y;
        _2825 = _2843;
    }
    float _2845 = _2825;
    float _2847 = _2672 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _2849 = _2833 * _2831;
    float _2851 = _2849 * 0.5;
    float _2853 = exp2(_2847);
    float _2855 = _2831;
    if (!_2811)
    {
        float _2857 = -_2829;
        float _2859 = fma(_2851, (*spvDescriptorSet0.vp_c8)._m0[30].w, _2857);
        _2855 = _2859;
    }
    float _2861 = _2855;
    float _2863 = _2678 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    if (_2811)
    {
        _2835 = 1.0;
    }
    float _2865 = _2835;
    float _2867 = _2865;
    if (!_2811)
    {
        float _2869 = 1.0 / _2845;
        _2827 = _2869;
    }
    float _2871 = _2827;
    float _2873 = fma(_2682, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2863);
    float _2875 = fma(_2662, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2873);
    float _2877 = _2861;
    if (!_2811)
    {
        float _2879 = 1.0 / _2861;
        _2877 = _2879;
    }
    float _2881 = _2877;
    float _2883 = -_2853;
    float _2885 = _2883 + 1.0;
    float _2887 = fma(_2696, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2875);
    float _2889 = _2885 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _2891 = _2887 + _2712;
    out.gl_Position.x = _2758;
    out.gl_Position.y = _2740;
    out.gl_Position.z = _2887;
    out.gl_Position.w = _2712;
    if (!_2811)
    {
        float _2893 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _2895 = -_2837;
        float _2897 = fma(_2881, _2893, _2895);
        _2839 = _2897;
    }
    float _2899 = _2839;
    float _2901 = _2891 * 0.5;
    if (!_2811)
    {
        float _2903 = _2899 * _2871;
        float _2905 = precise::clamp(_2903, 0.0, 1.0);
        _2867 = _2905;
    }
    float _2907 = _2867;
    float _2909 = _2907 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    bool _2911 = _2907 > 0.0;
    bool _2913 = isnan(_2907);
    bool _2915 = _2911 || _2913;
    bool _2917 = isnan(0.0);
    bool _2919 = _2915 || _2917;
    out.m_64.z = _2901;
    out.m_64.w = _2712;
    float _2921 = _2909 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    out.m_45.x = _2921;
    float _2923 = _2889 * _2772;
    float _2925 = -_2889;
    float _2927 = _2925 + 1.0;
    float _2929 = _2783 * _2923;
    float _2931 = _2797 * _2923;
    float _2933 = fma(_2793, _2929, _2777);
    float _2935 = fma(_2795, _2929, _2779);
    float _2937 = _2783 * _2927;
    float _2939 = fma(_2783, _2931, _2781);
    out.m_66.x = _2933;
    out.m_66.y = _2935;
    out.m_66.z = _2939;
    out.m_66.w = _2937;
    if (_2919)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    out.m_45.x = 0.0;
    float _2941 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _2941;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_54 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_60 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_58 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_64 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_45 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_66 = float4(0.0, 0.0, 0.0, 1.0);
    bool _663 = false;
    bool _269 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _80 = in.m_42.w;
    float _82 = trunc(_80);
    int _85 = int(_82);
    bool _89 = _85 >= 1;
    float _91 = 0.0;
    if (!_89)
    {
        _91 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _93 = _91;
    float _95 = _93;
    if (!_89)
    {
        out.m_45.x = 0.0;
    }
    int _97 = 0;
    if (!_89)
    {
        float _99 = _93 * 5.0;
        _97 = as_type<int>(_99);
    }
    int _101 = _97;
    int _103 = _101;
    if (!_89)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2998 = as_type<float>(_101);
        out.gl_Position.z = _2998;
    }
    if (!_89)
    {
        return out;
    }
    float _105 = in.m_47.w;
    bool _107 = _105 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _109 = isnan(_105);
    bool _111 = _107 || _109;
    bool _113 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _115 = _111 || _113;
    float _117 = -_105;
    float _119 = _117 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _121 = 0.0;
    float _123 = _119;
    if (_115)
    {
        float _125 = float(_85);
        _121 = _125;
    }
    float _127 = _121;
    bool _129 = _119 >= _127;
    bool _131 = !_115;
    bool _133 = _129 || _131;
    if (_133)
    {
        _95 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _135 = _95;
    if (_133)
    {
        out.m_45.x = 0.0;
    }
    if (_133)
    {
        float _137 = _135 * 5.0;
        _103 = as_type<int>(_137);
    }
    int _139 = _103;
    if (_133)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3067 = as_type<float>(_139);
        out.gl_Position.z = _3067;
    }
    if (_133)
    {
        return out;
    }
    float _141 = in.m_49.x;
    float _143 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[19].z;
    float _145 = _119 + (*spvDescriptorSet0.vp_c9)._m0[20].z;
    float _147 = as_type<float>(int(gl_VertexIndex));
    float _149 = _145 * _143;
    float _151 = fma(_141, (*spvDescriptorSet0.vp_c9)._m0[20].x, _149);
    int _153 = as_type<int>(_147) & 1;
    bool _155 = _153 != 0;
    int _157 = as_type<int>(_147) & 2;
    bool _159 = _157 != 0;
    float _161 = _151 * 6.283185482025146484375;
    float _163 = floor(_151);
    float _165 = _161 * 0.15915493667125701904296875;
    bool _167 = !_159;
    float _169 = _167 ? (-0.5) : 0.5;
    int _171 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2;
    bool _173 = _171 != 0;
    int _175 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 4;
    bool _177 = _175 != 0;
    int _179 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x);
    bool _181 = _179 != 0;
    float _183 = _165 * 6.283185482025146484375;
    float _185 = cos(_183);
    bool _187 = !_155;
    float _189 = _187 ? (-0.5) : 0.5;
    bool _191 = !_173;
    int _193 = _191 ? 0 : 1;
    bool _195 = !_181;
    int _197 = _195 ? 0 : 1;
    int _199 = abs(_193);
    float _201 = -_163;
    float _203 = _151 + _201;
    int _205 = abs(_197);
    float _207 = -_203;
    float _209 = fma(_207, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    bool _211 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _213 = float(_199);
    float _215 = fma(_185, 0.5, 0.5);
    bool _217 = !_177;
    int _219 = _217 ? 0 : 1;
    bool _221 = _203 < 0.5;
    float _223 = float(_221);
    float _225 = abs(_209);
    float _227 = _213 * _225;
    int _229 = abs(_219);
    float _231 = -_215;
    float _233 = fma(_231, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _235 = float(_205);
    float _237 = -_223;
    float _239 = fma(_237, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _241 = float(_229);
    float _243 = fma(_235, _233, _227);
    float _245 = abs(_239);
    float _247 = fma(_241, _245, _243);
    bool _249 = !_211;
    float _251 = 0.5;
    float _267;
    if (!_249)
    {
        float _253 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _255 = _141 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _257 = fma(_255, (*spvDescriptorSet0.vp_c9)._m0[12].x, _119);
        float _259 = _257 * _253;
        float _261 = floor(_259);
        float _263 = -_261;
        float _265 = _259 + _263;
        _267 = _265;
        _269 = true;
    }
    else
    {
        float _271 = float(_85);
        float _273 = 1.0 / _271;
        float _275 = _119 * _273;
        _267 = _275;
    }
    _269 = false;
    float _277 = _267;
    float _279 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _281 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _279;
    float _283 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _285 = _283 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _287 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _289 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _287;
    float _291 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _293 = _291 + (*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _295 = 1.0 / _281;
    float _297 = -(*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _299 = (*spvDescriptorSet0.vp_c9)._m0[148].w + _297;
    float _301 = 1.0 / _285;
    float _303 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _305 = _277 + _303;
    float _307 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _309 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _311 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _313 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _315 = 1.0 / _289;
    float _317 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _319 = _277 + _317;
    float _321 = _305 * _295;
    float _323 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _325 = _277 + _323;
    float _327 = _307 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _329 = _309 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _331 = _311 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _333 = -(*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _335 = _277 + _333;
    float _337 = 1.0 / _293;
    float _339 = _319 * _301;
    float _341 = -(*spvDescriptorSet0.vp_c9)._m0[148].w;
    float _343 = _341 + (*spvDescriptorSet0.vp_c9)._m0[149].w;
    bool _345 = _277 >= (*spvDescriptorSet0.vp_c9)._m0[149].w;
    bool _347 = isnan(_277);
    bool _349 = _345 || _347;
    bool _351 = isnan((*spvDescriptorSet0.vp_c9)._m0[149].w);
    bool _353 = _349 || _351;
    float _355 = float(_353);
    out.m_54.x = _327;
    out.m_54.y = _329;
    out.m_54.z = _331;
    out.m_54.w = _313;
    float _357 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _359 = _277 + _357;
    float _361 = 1.0 / _343;
    float _363 = -(*spvDescriptorSet0.vp_c9)._m0[149].w;
    float _365 = (*spvDescriptorSet0.vp_c9)._m0[150].w + _363;
    bool _367 = _277 >= (*spvDescriptorSet0.vp_c9)._m0[150].w;
    bool _369 = isnan(_277);
    bool _371 = _367 || _369;
    bool _373 = isnan((*spvDescriptorSet0.vp_c9)._m0[150].w);
    bool _375 = _371 || _373;
    float _377 = float(_375);
    float _379 = _325 * _315;
    bool _381 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].z;
    float _383 = -_377;
    float _385 = _383 + 1.0;
    float _387 = 1.0 / _365;
    float _389 = -(*spvDescriptorSet0.vp_c9)._m0[149].w;
    float _391 = _277 + _389;
    bool _393 = _277 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _395 = isnan(_277);
    bool _397 = _393 || _395;
    bool _399 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _401 = _397 || _399;
    float _403 = float(_401);
    float _405 = _355 * _385;
    float _407 = -_355;
    float _409 = _407 + 1.0;
    float _411 = _359 * _337;
    bool _413 = _277 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _415 = isnan(_277);
    bool _417 = _413 || _415;
    bool _419 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _421 = _417 || _419;
    float _423 = float(_421);
    float _425 = -_403;
    float _427 = _425 + 1.0;
    float _429 = 1.0 / _299;
    bool _431 = _277 >= (*spvDescriptorSet0.vp_c9)._m0[148].w;
    bool _433 = isnan(_277);
    bool _435 = _431 || _433;
    bool _437 = isnan((*spvDescriptorSet0.vp_c9)._m0[148].w);
    bool _439 = _435 || _437;
    float _441 = float(_439);
    float _443 = _423 * _427;
    bool _445 = _277 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _447 = isnan(_277);
    bool _449 = _445 || _447;
    bool _451 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _453 = _449 || _451;
    float _455 = float(_453);
    float _457 = -_441;
    float _459 = _457 + 1.0;
    float _461 = _441 * _409;
    float _463 = _391 * _387;
    bool _465 = _277 >= (*spvDescriptorSet0.vp_c9)._m0[147].w;
    bool _467 = isnan(_277);
    bool _469 = _465 || _467;
    bool _471 = isnan((*spvDescriptorSet0.vp_c9)._m0[147].w);
    bool _473 = _469 || _471;
    float _475 = float(_473);
    float _477 = -(*spvDescriptorSet0.vp_c9)._m0[148].w;
    float _479 = _277 + _477;
    float _481 = -_423;
    float _483 = _481 + 1.0;
    float _485 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _487 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _485;
    float _489 = _475 * _459;
    float _491 = -_475;
    float _493 = _491 + 1.0;
    float _495 = _479 * _361;
    float _497 = _335 * _429;
    float _499 = _403 * _493;
    bool _501 = _277 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _503 = isnan(_277);
    bool _505 = _501 || _503;
    bool _507 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _509 = _505 || _507;
    float _511 = float(_509);
    float _513 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _515 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _513;
    float _517 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _519 = _517 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _521 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _523 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _521;
    float _525 = fma(_487, _379, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _527 = -_511;
    float _529 = _527 + 1.0;
    float _531 = _511 * _483;
    float _533 = fma(_515, _321, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _535 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _537 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _535;
    float _539 = _455 * _529;
    float _541 = fma(_523, _321, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _543 = -_455;
    float _545 = _543 + 1.0;
    float _547 = fma(_537, _379, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _549 = _533 * _539;
    float _551 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _553 = _551 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _555 = _541 * _539;
    float _557 = fma(_519, _339, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _559 = fma(_545, (*spvDescriptorSet0.vp_c9)._m0[143].x, _549);
    float _561 = fma(_553, _339, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _563 = fma(_545, (*spvDescriptorSet0.vp_c9)._m0[143].y, _555);
    float _565 = -(*spvDescriptorSet0.vp_c9)._m0[146].x;
    float _567 = _565 + (*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _569 = -(*spvDescriptorSet0.vp_c9)._m0[146].y;
    float _571 = _569 + (*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _573 = fma(_557, _531, _559);
    float _575 = fma(_561, _531, _563);
    float _577 = fma(_567, _411, (*spvDescriptorSet0.vp_c9)._m0[146].x);
    float _579 = fma(_571, _411, (*spvDescriptorSet0.vp_c9)._m0[146].y);
    float _581 = -(*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _583 = (*spvDescriptorSet0.vp_c9)._m0[148].x + _581;
    float _585 = -(*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _587 = (*spvDescriptorSet0.vp_c9)._m0[148].y + _585;
    float _589 = fma(_547, _443, _573);
    float _591 = fma(_525, _443, _575);
    float _593 = fma(_583, _497, (*spvDescriptorSet0.vp_c9)._m0[147].x);
    float _595 = fma(_587, _497, (*spvDescriptorSet0.vp_c9)._m0[147].y);
    float _597 = -(*spvDescriptorSet0.vp_c9)._m0[148].x;
    float _599 = _597 + (*spvDescriptorSet0.vp_c9)._m0[149].x;
    float _601 = fma(_577, _499, _589);
    float _603 = -(*spvDescriptorSet0.vp_c9)._m0[148].y;
    float _605 = _603 + (*spvDescriptorSet0.vp_c9)._m0[149].y;
    float _607 = fma(_579, _499, _591);
    float _609 = fma(_599, _495, (*spvDescriptorSet0.vp_c9)._m0[148].x);
    float _611 = -(*spvDescriptorSet0.vp_c9)._m0[149].x;
    float _613 = (*spvDescriptorSet0.vp_c9)._m0[150].x + _611;
    float _615 = fma(_593, _489, _601);
    float _617 = fma(_605, _495, (*spvDescriptorSet0.vp_c9)._m0[148].y);
    float _619 = -(*spvDescriptorSet0.vp_c9)._m0[149].y;
    float _621 = (*spvDescriptorSet0.vp_c9)._m0[150].y + _619;
    float _623 = fma(_595, _489, _607);
    float _625 = fma(_613, _463, (*spvDescriptorSet0.vp_c9)._m0[149].x);
    float _627 = fma(_609, _461, _615);
    float _629 = fma(_621, _463, (*spvDescriptorSet0.vp_c9)._m0[149].y);
    float _631 = fma(_617, _461, _623);
    float _633 = fma(_625, _405, _627);
    float _635 = fma(_629, _405, _631);
    float _637 = fma(_377, (*spvDescriptorSet0.vp_c9)._m0[150].x, _633);
    float _639 = fma(_377, (*spvDescriptorSet0.vp_c9)._m0[150].y, _635);
    bool _641 = !_381;
    float _659;
    float _661;
    if (!_641)
    {
        float _643 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].z;
        float _645 = _141 * (*spvDescriptorSet0.vp_c9)._m0[12].w;
        float _647 = fma(_645, (*spvDescriptorSet0.vp_c9)._m0[11].z, _119);
        float _649 = _647 * _643;
        float _651 = float(_85);
        float _653 = floor(_649);
        float _655 = -_653;
        float _657 = _649 + _655;
        _659 = _657;
        _661 = _651;
        _663 = true;
    }
    else
    {
        float _665 = float(_85);
        float _667 = 1.0 / _665;
        float _669 = _119 * _667;
        _659 = _669;
        _661 = _665;
    }
    _663 = false;
    float _671 = _659;
    float _673 = _661;
    float _675 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _677 = int(_675);
    float _679 = -(*spvDescriptorSet0.vp_c9)._m0[124].w;
    float _681 = _671 + _679;
    float _683 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _685 = _671 + _683;
    float _687 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _689 = int(_687);
    float _691 = float(_677);
    float _693 = 1.0 / _673;
    float _695 = float(uint(_689));
    float _697 = 1.0 / _691;
    int _699 = ~_689;
    int _701 = _699 + 1;
    float _703 = 1.0 / _695;
    float _705 = _697 * _119;
    float _707 = trunc(_705);
    int _709 = int(_707);
    int _711 = as_type<int>(_703) + (-2);
    int _713 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _715 = _713 != 0;
    bool _717 = !_715;
    float _719 = _717 ? 7.345489978790283203125 : 1.0;
    int _721 = ~_689;
    int _723 = _721 + 1;
    float _725 = float(uint(_709));
    float _727 = _719 * _141;
    float _729 = as_type<float>(_711) * _725;
    float _731 = trunc(_729);
    float _733 = precise::max(_731, 0.0);
    uint _736 = uint(_733);
    float _738 = float(_709);
    int _740 = _701 * int(_736);
    int _742 = _740 + _709;
    float _744 = float(uint(_742));
    float _746 = as_type<float>(_711) * _744;
    float _748 = trunc(_746);
    float _750 = precise::max(_748, 0.0);
    uint _752 = uint(_750);
    int _754 = int(_736) + int(_752);
    float _756 = float(_689);
    float _758 = floor(_727);
    int _760 = _723 * _754;
    int _762 = _760 + _709;
    bool _764 = _738 >= _756;
    bool _766 = isnan(_738);
    bool _768 = _764 || _766;
    bool _770 = isnan(_756);
    bool _772 = _768 || _770;
    float _774 = float(_772);
    bool _776 = uint(_762) >= uint(_689);
    float _778 = trunc(_774);
    int _780 = int(_778);
    bool _782 = !_776;
    int _784 = _782 ? 0 : (-1);
    bool _786 = _689 == 0;
    int _788 = ~_754;
    int _790 = _788 + _784;
    int _792 = _790 + 1;
    float _794 = -_758;
    float _796 = _727 + _794;
    int _798 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _800 = _798 != 0;
    int _802 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _804 = _802 != 0;
    int _806 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _808 = _806 != 0;
    int _810 = _689 * _792;
    int _812 = _810 + _709;
    bool _814 = !_800;
    int _816 = _814 ? 0 : 1;
    bool _818 = !_786;
    int _820 = _818 ? _812 : (-1);
    float _822 = _796 * _756;
    int _824 = ~_780;
    int _826 = _824 + 1;
    int _828 = _826 + 1;
    float _830 = _756 * _119;
    int _832 = _820 * _828;
    float _834 = _830 * _693;
    int _836 = _689 + (-1);
    float _838 = trunc(_822);
    int _840 = int(_838);
    int _842 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _844 = _842 != 0;
    int _846 = abs(_816);
    int _848 = _780 * _836;
    int _850 = _848 + _832;
    bool _852 = !_804;
    int _854 = _852 ? 0 : 1;
    bool _856 = !_844;
    int _858 = _856 ? 0 : 1;
    float _860 = trunc(_834);
    int _862 = int(_860);
    int _864 = abs(_854);
    bool _866 = !_808;
    int _868 = _866 ? 0 : 1;
    int _870 = abs(_858);
    int _872 = _850 * _864;
    int _874 = abs(_868);
    int _876 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _878 = _876 != 0;
    int _880 = _840 * _870;
    int _882 = _880 + _709;
    bool _884 = !_878;
    int _886 = _884 ? 0 : 1;
    int _888 = _862 * _846;
    int _890 = _888 + _872;
    int _892 = abs(_886);
    int _894 = ~_689;
    int _896 = _894 + 1;
    int _898 = _882 * _874;
    int _900 = _898 + _890;
    float _902 = float(uint(_882));
    int _904 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _906 = _904 != 0;
    int _908 = _840 * _892;
    int _910 = _908 + _900;
    int _912 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _914 = _912 != 0;
    float _916 = as_type<float>(_711) * _902;
    bool _918 = !_906;
    int _920 = _918 ? 0 : 1;
    float _922 = float(uint(_910));
    float _924 = trunc(_916);
    float _926 = precise::max(_924, 0.0);
    uint _928 = uint(_926);
    float _930 = as_type<float>(_711) * _922;
    float _932 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _934 = trunc(_930);
    float _936 = precise::max(_934, 0.0);
    uint _938 = uint(_936);
    int _940 = _896 * int(_938);
    int _942 = _940 + _910;
    float _944 = float(uint(_942));
    int _946 = ~_689;
    int _948 = _946 + 1;
    float _950 = as_type<float>(_711) * _944;
    float _952 = trunc(_950);
    float _954 = precise::max(_952, 0.0);
    uint _956 = uint(_954);
    int _958 = int(_938) + int(_956);
    float _960 = in.m_49.y;
    int _962 = _948 * _958;
    int _964 = _962 + _910;
    int _966 = _948 * int(_928);
    int _968 = _966 + _882;
    bool _970 = uint(_964) >= uint(_689);
    bool _972 = !_970;
    int _974 = _972 ? 0 : (-1);
    int _976 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _978 = _976 != 0;
    int _980 = ~_958;
    int _982 = _980 + _974;
    int _984 = _982 + 1;
    float _986 = _141 * 2.0;
    int _988 = _689 * _984;
    int _990 = _988 + _910;
    float _992 = float(uint(_968));
    float _994 = floor(_986);
    bool _996 = !_786;
    int _998 = _996 ? _990 : (-1);
    float _1000 = as_type<float>(_711) * _992;
    float _1002 = _960 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _1004 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    int _1006 = _998 & 3;
    bool _1008 = _1006 != 0;
    float _1010 = trunc(_1000);
    float _1012 = precise::max(_1010, 0.0);
    uint _1014 = uint(_1012);
    int _1016 = _998 & 3;
    bool _1018 = _1016 != 0;
    float _1020 = fma(_1002, -2.0, _1004);
    bool _1022 = uint(_1006) > 1u;
    float _1024 = _141 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    int _1026 = _1018 ? 0 : 1;
    int _1028 = ~_689;
    int _1030 = _1028 + 1;
    float _1032 = -_932;
    float _1034 = fma(_1024, 2.0, _1032);
    int _1036 = ~_1026;
    int _1038 = _1036 + 1;
    int _1040 = _1038 + 1;
    float _1042 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _1044 = (*spvDescriptorSet0.vp_c9)._m0[124].w + _1042;
    bool _1046 = _994 > 0.0;
    float _1048 = -(*spvDescriptorSet0.vp_c9)._m0[124].w;
    float _1050 = _1048 + (*spvDescriptorSet0.vp_c9)._m0[125].w;
    bool _1052 = _994 >= 0.0;
    bool _1054 = isnan(_994);
    bool _1056 = _1052 || _1054;
    bool _1058 = isnan(0.0);
    bool _1060 = _1056 || _1058;
    float _1062 = 1.0 / _1044;
    bool _1064 = !_1008;
    int _1066 = _1064 ? 0 : 1;
    float _1068 = -_119;
    float _1070 = fma(_1068, (*spvDescriptorSet0.vp_c9)._m0[76].x, _1034);
    int _1072 = _1040;
    if (!_1022)
    {
        int _1074 = ~_1026;
        int _1076 = _1074 + 1;
        _1072 = _1076;
    }
    int _1078 = _1072;
    int _1080 = _998 >> 31;
    bool _1082 = uint(_1006) >= 2u;
    float _1084 = 1.0 / _1050;
    int _1086 = _1080 & 3;
    float _1088 = -(*spvDescriptorSet0.vp_c9)._m0[125].w;
    float _1090 = (*spvDescriptorSet0.vp_c9)._m0[126].w + _1088;
    int _1092 = _1082 ? 0 : 1;
    bool _1094 = _1006 != 3;
    int _1096 = _998 + _1086;
    float _1098 = _685 * _1062;
    int _1100 = int(_928) + int(_1014);
    float _1102 = in.m_42.x;
    float _1104 = in.m_42.y;
    float _1106 = in.m_42.z;
    int _1108 = _1096 >> 2;
    float _1110 = 1.0 / _1090;
    int _1112 = ~_1092;
    int _1114 = _1112 + 1;
    int _1116 = _1114 + 1;
    int _1118 = _1030 * _1100;
    int _1120 = _1118 + _882;
    int _1122 = _1108 << 4;
    int _1124 = _1122 + 368;
    float _1126 = _681 * _1084;
    int _1128 = _1060 ? 0 : 1;
    int _1130 = _1116;
    if (_1094)
    {
        int _1132 = ~_1092;
        int _1134 = _1132 + 1;
        _1130 = _1134;
    }
    int _1136 = _1130;
    int _1138 = _1124 + 8;
    uint _1140 = uint(int(uint(_1138) >> uint(2)));
    uint _1142 = uint(int(uint(int(_1140)) >> uint(2)));
    int _1144 = int(_1140) & 3;
    float _1146 = (*spvDescriptorSet0.vp_c9)._m0[int(_1142)][_1144];
    int _1148 = int(_1140) + 1;
    uint _1150 = uint(int(uint(_1148) >> uint(2)));
    int _1152 = _1148 & 3;
    float _1154 = (*spvDescriptorSet0.vp_c9)._m0[int(_1150)][_1152];
    bool _1156 = uint(_1120) >= uint(_689);
    float _1158 = in.m_49.z;
    int _1160 = abs(_1078);
    float _1162 = -(*spvDescriptorSet0.vp_c9)._m0[126].w;
    float _1164 = _671 + _1162;
    bool _1166 = !_1156;
    int _1168 = _1166 ? 0 : (-1);
    bool _1170 = _1006 != 3;
    uint _1172 = uint(int(uint(_1124) >> uint(2)));
    uint _1174 = uint(int(uint(int(_1172)) >> uint(2)));
    int _1176 = int(_1172) & 3;
    float _1178 = (*spvDescriptorSet0.vp_c9)._m0[int(_1174)][_1176];
    int _1180 = int(_1172) + 1;
    uint _1182 = uint(int(uint(_1180) >> uint(2)));
    int _1184 = _1180 & 3;
    float _1186 = (*spvDescriptorSet0.vp_c9)._m0[int(_1182)][_1184];
    int _1188 = ~_1100;
    int _1190 = _1188 + _1168;
    int _1192 = _1190 + 1;
    float _1194 = -(*spvDescriptorSet0.vp_c9)._m0[125].w;
    float _1196 = _671 + _1194;
    bool _1198 = !_1170;
    int _1200 = _1198 ? 0 : (-1);
    int _1202 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _1204 = _1202 != 0;
    int _1206 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _1208 = _1206 != 0;
    int _1210 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _1212 = _1210 != 0;
    float _1214 = -(*spvDescriptorSet0.vp_c9)._m0[126].w;
    float _1216 = _1214 + (*spvDescriptorSet0.vp_c9)._m0[127].w;
    float _1218 = _1104 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _1220 = _1104 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _1222 = _1104 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _1224 = 1.0 / _1216;
    float _1226 = fma(_1102, (*spvDescriptorSet0.vp_c10)._m0[4].x, _1218);
    float _1228 = fma(_1102, (*spvDescriptorSet0.vp_c10)._m0[5].x, _1220);
    float _1230 = fma(_1102, (*spvDescriptorSet0.vp_c10)._m0[6].x, _1222);
    float _1232 = _141 + _960;
    int _1234 = abs(_1066);
    int _1236 = _689 * _1192;
    int _1238 = _1236 + _882;
    int _1240 = abs(_1136);
    float _1242 = _1232 + (-1.0);
    float _1244 = _960 + _1158;
    float _1246 = _1158 * 2.0;
    int _1248 = ~_1160;
    int _1250 = _1248 + 1;
    int _1252 = _1250 + 1;
    float _1254 = _1196 * _1110;
    float _1256 = fma(_1242, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _1258 = _1244 + (-1.0);
    float _1260 = trunc((*spvDescriptorSet0.vp_c9)._m0[80].z);
    int _1262 = int(_1260);
    int _1264 = ~_1128;
    int _1266 = _1264 + 1;
    int _1268 = _1266 + 1;
    float _1270 = _1164 * _1224;
    int _1272 = _1268;
    if (!_1046)
    {
        int _1274 = ~_1128;
        int _1276 = _1274 + 1;
        _1272 = _1276;
    }
    int _1278 = _1272;
    int _1280 = abs(_1200);
    int _1282 = ~_1234;
    int _1284 = _1282 + 1;
    int _1286 = _1284 + 1;
    float _1288 = floor(_1246);
    bool _1290 = !_786;
    int _1292 = _1290 ? _1238 : (-1);
    float _1294 = float(uint(_1262));
    int _1296 = _1252 * as_type<int>(_1186);
    int _1298 = ~_1240;
    int _1300 = _1298 + 1;
    int _1302 = _1300 + 1;
    float _1304 = fma(_1258, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    bool _1306 = _1288 > 0.0;
    int _1308 = _1286 * as_type<int>(_1178);
    int _1310 = _1308 + _1296;
    int _1312 = ~_1280;
    int _1314 = _1312 + 1;
    int _1316 = _1314 + 1;
    int _1318 = abs(_920);
    int _1320 = _1302 * as_type<int>(_1146);
    int _1322 = _1320 + _1310;
    int _1324 = abs(_1262);
    float _1326 = 1.0 / _1294;
    bool _1328 = _1288 >= 0.0;
    bool _1330 = isnan(_1288);
    bool _1332 = _1328 || _1330;
    bool _1334 = isnan(0.0);
    bool _1336 = _1332 || _1334;
    int _1338 = _1316 * as_type<int>(_1154);
    int _1340 = _1338 + _1322;
    float _1342 = fma(_1106, (*spvDescriptorSet0.vp_c10)._m0[4].z, _1226);
    int _1344 = ~_1318;
    int _1346 = _1344 + 1;
    int _1348 = _1346 + 1;
    float _1350 = float(uint(_1324));
    float _1352 = _1342 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    int _1354 = _1340 * _1348;
    float _1356 = fma(_1106, (*spvDescriptorSet0.vp_c10)._m0[5].z, _1228);
    float _1358 = fma(_1106, (*spvDescriptorSet0.vp_c10)._m0[6].z, _1230);
    float _1360 = 1.0 / _1350;
    int _1362 = _1292 * _1318;
    int _1364 = _1362 + _1354;
    float _1366 = -(*spvDescriptorSet0.vp_c9)._m0[123].x;
    float _1368 = (*spvDescriptorSet0.vp_c9)._m0[124].x + _1366;
    int _1370 = as_type<int>(_1326) + (-2);
    float _1372 = -(*spvDescriptorSet0.vp_c9)._m0[123].z;
    float _1374 = (*spvDescriptorSet0.vp_c9)._m0[124].z + _1372;
    float _1376 = fma(_1368, _1098, (*spvDescriptorSet0.vp_c9)._m0[123].x);
    int _1378 = abs(_1364);
    float _1380 = _1356 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _1382 = float(uint(_1364));
    float _1384 = -(*spvDescriptorSet0.vp_c9)._m0[123].y;
    float _1386 = (*spvDescriptorSet0.vp_c9)._m0[124].y + _1384;
    float _1388 = _1358 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    int _1390 = ~_1324;
    int _1392 = _1390 + 1;
    float _1394 = as_type<float>(_1370) * _1382;
    float _1396 = float(uint(_1378));
    float _1398 = fma(_1386, _1098, (*spvDescriptorSet0.vp_c9)._m0[123].y);
    int _1400 = as_type<int>(_1360) + (-2);
    float _1402 = -(*spvDescriptorSet0.vp_c9)._m0[124].y;
    float _1404 = _1402 + (*spvDescriptorSet0.vp_c9)._m0[125].y;
    float _1406 = fma(_1374, _1098, (*spvDescriptorSet0.vp_c9)._m0[123].z);
    float _1408 = trunc(_1394);
    float _1410 = precise::max(_1408, 0.0);
    uint _1412 = uint(_1410);
    float _1414 = -(*spvDescriptorSet0.vp_c9)._m0[124].x;
    float _1416 = _1414 + (*spvDescriptorSet0.vp_c9)._m0[125].x;
    float _1418 = as_type<float>(_1400) * _1396;
    float _1420 = fma(_1404, _1126, (*spvDescriptorSet0.vp_c9)._m0[124].y);
    float _1422 = -(*spvDescriptorSet0.vp_c9)._m0[124].z;
    float _1424 = _1422 + (*spvDescriptorSet0.vp_c9)._m0[125].z;
    int _1426 = ~_1262;
    int _1428 = _1426 + 1;
    float _1430 = fma(_1416, _1126, (*spvDescriptorSet0.vp_c9)._m0[124].x);
    float _1432 = trunc(_1418);
    float _1434 = precise::max(_1432, 0.0);
    uint _1436 = uint(_1434);
    float _1438 = fma(_1424, _1126, (*spvDescriptorSet0.vp_c9)._m0[124].z);
    float _1440 = -(*spvDescriptorSet0.vp_c9)._m0[125].x;
    float _1442 = (*spvDescriptorSet0.vp_c9)._m0[126].x + _1440;
    float _1444 = -(*spvDescriptorSet0.vp_c9)._m0[125].y;
    float _1446 = (*spvDescriptorSet0.vp_c9)._m0[126].y + _1444;
    bool _1448 = _671 >= (*spvDescriptorSet0.vp_c9)._m0[127].w;
    bool _1450 = isnan(_671);
    bool _1452 = _1448 || _1450;
    bool _1454 = isnan((*spvDescriptorSet0.vp_c9)._m0[127].w);
    bool _1456 = _1452 || _1454;
    float _1458 = float(_1456);
    float _1460 = -(*spvDescriptorSet0.vp_c9)._m0[125].z;
    float _1462 = (*spvDescriptorSet0.vp_c9)._m0[126].z + _1460;
    float _1464 = fma(_1442, _1254, (*spvDescriptorSet0.vp_c9)._m0[125].x);
    float _1466 = fma(_1446, _1254, (*spvDescriptorSet0.vp_c9)._m0[125].y);
    int _1468 = _1428 * int(_1412);
    int _1470 = _1468 + _1364;
    float _1472 = -_1458;
    float _1474 = _1472 + 1.0;
    int _1476 = _1336 ? 0 : 1;
    float _1478 = float(uint(_1470));
    float _1480 = fma(_1462, _1254, (*spvDescriptorSet0.vp_c9)._m0[125].z);
    int _1482 = _1392 * int(_1436);
    int _1484 = _1482 + _1378;
    bool _1486 = _671 >= (*spvDescriptorSet0.vp_c9)._m0[126].w;
    bool _1488 = isnan(_671);
    bool _1490 = _1486 || _1488;
    bool _1492 = isnan((*spvDescriptorSet0.vp_c9)._m0[126].w);
    bool _1494 = _1490 || _1492;
    float _1496 = float(_1494);
    bool _1498 = _671 >= (*spvDescriptorSet0.vp_c9)._m0[125].w;
    bool _1500 = isnan(_671);
    bool _1502 = _1498 || _1500;
    bool _1504 = isnan((*spvDescriptorSet0.vp_c9)._m0[125].w);
    bool _1506 = _1502 || _1504;
    float _1508 = float(_1506);
    float _1510 = as_type<float>(_1370) * _1478;
    float _1512 = float(uint(_1484));
    float _1514 = _1496 * _1474;
    float _1516 = -_1496;
    float _1518 = _1516 + 1.0;
    float _1520 = -_1508;
    float _1522 = _1520 + 1.0;
    bool _1524 = _671 >= (*spvDescriptorSet0.vp_c9)._m0[123].w;
    bool _1526 = isnan(_671);
    bool _1528 = _1524 || _1526;
    bool _1530 = isnan((*spvDescriptorSet0.vp_c9)._m0[123].w);
    bool _1532 = _1528 || _1530;
    float _1534 = float(_1532);
    float _1536 = as_type<float>(_1400) * _1512;
    bool _1538 = _671 >= (*spvDescriptorSet0.vp_c9)._m0[124].w;
    bool _1540 = isnan(_671);
    bool _1542 = _1538 || _1540;
    bool _1544 = isnan((*spvDescriptorSet0.vp_c9)._m0[124].w);
    bool _1546 = _1542 || _1544;
    float _1548 = float(_1546);
    float _1550 = -(*spvDescriptorSet0.vp_c9)._m0[126].x;
    float _1552 = _1550 + (*spvDescriptorSet0.vp_c9)._m0[127].x;
    float _1554 = -(*spvDescriptorSet0.vp_c9)._m0[126].y;
    float _1556 = _1554 + (*spvDescriptorSet0.vp_c9)._m0[127].y;
    float _1558 = _1508 * _1518;
    float _1560 = trunc(_1510);
    float _1562 = precise::max(_1560, 0.0);
    uint _1564 = uint(_1562);
    float _1566 = _1548 * _1522;
    float _1568 = -_1548;
    float _1570 = _1568 + 1.0;
    float _1572 = -(*spvDescriptorSet0.vp_c9)._m0[126].z;
    float _1574 = _1572 + (*spvDescriptorSet0.vp_c9)._m0[127].z;
    float _1576 = fma(_1552, _1270, (*spvDescriptorSet0.vp_c9)._m0[126].x);
    float _1578 = fma(_1556, _1270, (*spvDescriptorSet0.vp_c9)._m0[126].y);
    float _1580 = _1534 * _1570;
    float _1582 = fma(_1574, _1270, (*spvDescriptorSet0.vp_c9)._m0[126].z);
    float _1584 = trunc(_1536);
    float _1586 = precise::max(_1584, 0.0);
    uint _1588 = uint(_1586);
    float _1590 = -_1534;
    float _1592 = _1590 + 1.0;
    float _1594 = _1376 * _1580;
    float _1596 = _1398 * _1580;
    float _1598 = _1406 * _1580;
    int _1600 = ~_1476;
    int _1602 = _1600 + 1;
    int _1604 = _1602 + 1;
    float _1606 = fma(_1592, (*spvDescriptorSet0.vp_c9)._m0[123].x, _1594);
    float _1608 = fma(_1592, (*spvDescriptorSet0.vp_c9)._m0[123].y, _1596);
    float _1610 = fma(_1592, (*spvDescriptorSet0.vp_c9)._m0[123].z, _1598);
    bool _1612 = !_1208;
    int _1614 = _1612 ? 0 : 1;
    float _1616 = fma(_1430, _1566, _1606);
    int _1618 = int(_1412) + int(_1564);
    float _1620 = fma(_1420, _1566, _1608);
    int _1622 = abs(_1614);
    float _1624 = fma(_1438, _1566, _1610);
    int _1626 = ~_1262;
    int _1628 = _1626 + 1;
    float _1630 = fma(_1466, _1558, _1620);
    int _1632 = ~_1324;
    int _1634 = _1632 + 1;
    float _1636 = fma(_1480, _1558, _1624);
    int _1638 = int(_1436) + int(_1588);
    int _1640 = _1628 * _1618;
    int _1642 = _1640 + _1364;
    int _1644 = _1604;
    if (!_1306)
    {
        int _1646 = ~_1476;
        int _1648 = _1646 + 1;
        _1644 = _1648;
    }
    int _1650 = _1644;
    float _1652 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _1654 = float(_1278);
    int _1656 = _1634 * _1638;
    int _1658 = _1656 + _1378;
    bool _1660 = uint(_1642) >= uint(_1262);
    float _1662 = fma(_1464, _1558, _1616);
    float _1664 = float(_1622);
    float _1666 = fma(_1578, _1514, _1630);
    bool _1668 = uint(_1658) >= uint(_1324);
    float _1670 = fma(_1576, _1514, _1662);
    bool _1672 = !_1660;
    int _1674 = _1672 ? 0 : (-1);
    float _1676 = _1664 * _1654;
    bool _1678 = !_1668;
    int _1680 = _1678 ? 0 : (-1);
    float _1682 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    int _1684 = ~_1618;
    int _1686 = _1684 + _1674;
    int _1688 = _1686 + 1;
    float _1690 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1692 = _1352 + _1690;
    int _1694 = _1364 ^ _1262;
    float _1696 = fma(_1582, _1514, _1636);
    int _1698 = ~_1680;
    int _1700 = _1638 + _1698;
    int _1702 = _1700 + 1;
    float _1704 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1706 = _1380 + _1704;
    uint _1708 = uint(int(uint(_1694) >> uint(31)));
    float _1710 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1712 = _1388 + _1710;
    bool _1714 = _1262 == 0;
    float _1716 = _1706 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    int _1718 = ~int(_1708);
    int _1720 = _1718 + 1;
    float _1722 = fma(_119, (*spvDescriptorSet0.vp_c9)._m0[76].y, _1020);
    bool _1724 = _1262 == 0;
    float _1726 = fma(_1692, (*spvDescriptorSet0.vp_c8)._m0[28].x, _1716);
    int _1728 = _1262 * _1688;
    int _1730 = _1728 + _1364;
    int _1732 = _1702 ^ _1720;
    float _1734 = _1682 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    bool _1736 = _141 > 0.5;
    float _1738 = fma(_1712, (*spvDescriptorSet0.vp_c8)._m0[28].z, _1726);
    float _1740 = fma(_1458, (*spvDescriptorSet0.vp_c9)._m0[127].x, _1670);
    int _1742 = ~_1720;
    int _1744 = _1742 + _1732;
    int _1746 = _1744 + 1;
    float _1748 = fma(_1458, (*spvDescriptorSet0.vp_c9)._m0[127].y, _1666);
    bool _1750 = !_1714;
    int _1752 = _1750 ? _1730 : (-1);
    float _1754 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    bool _1756 = _960 > 0.5;
    float _1758 = fma(_1458, (*spvDescriptorSet0.vp_c9)._m0[127].z, _1696);
    float _1760 = -_189;
    int _1762 = _1736 ? as_type<int>(_1760) : as_type<int>(_189);
    float _1764 = fma(_141, (*spvDescriptorSet0.vp_c9)._m0[78].z, _1754);
    bool _1766 = _1738 >= 0.0;
    float _1768 = _1740 * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    bool _1770 = !_1724;
    int _1772 = _1770 ? _1746 : (-1);
    float _1774 = fma(_119, (*spvDescriptorSet0.vp_c9)._m0[77].z, _1764);
    float _1776 = -_169;
    int _1778 = _1756 ? as_type<int>(_1776) : as_type<int>(_169);
    float _1780 = _1758 * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1782 = float(_1752);
    float _1784 = _1652 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1786 = float(_1772);
    float _1788 = -_1774;
    float _1790 = _1788 + 1.0;
    bool _1792 = !_914;
    float _1794 = _1792 ? _169 : as_type<float>(_1778);
    float _1796 = fma(_1734, _1782, _1070);
    float _1798 = -_1722;
    float _1800 = fma(_1784, _1786, _1798);
    bool _1802 = !_978;
    float _1804 = _1802 ? _189 : as_type<float>(_1762);
    float _1806 = _1794 + (-0.5);
    float _1808 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _1810 = log2(_1808);
    float _1812 = _960 * 2.0;
    if (_1766)
    {
        out.m_45.x = 0.0;
    }
    float _1814 = -_1784;
    float _1816 = fma(_1814, _1806, _1800);
    float _1818 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _1820 = _1804 + 0.5;
    bool _1822 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1824 = isnan(0.0);
    bool _1826 = _1822 || _1824;
    bool _1828 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1830 = _1826 || _1828;
    float _1832 = fma(_960, (*spvDescriptorSet0.vp_c9)._m0[78].w, _1818);
    float _1834 = fma(_1734, _1820, _1796);
    float _1836 = _1706 * _1706;
    float _1838 = _1768 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1840 = fma(_119, (*spvDescriptorSet0.vp_c9)._m0[77].w, _1832);
    float _1842 = -_1790;
    float _1844 = fma(_1804, _1842, _1834);
    float _1846 = fma(_1692, _1692, _1836);
    float _1848 = _1748 * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1850 = -_1840;
    float _1852 = _1850 + 1.0;
    float _1854 = _1810 * _119;
    float _1856 = fma(_1712, _1712, _1846);
    float _1858 = _1780 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1860 = fma(_1794, _1852, _1816);
    float _1862 = in.m_56.x;
    float _1864 = in.m_56.y;
    float _1866 = in.m_56.z;
    float _1868 = _1846;
    if (_1766)
    {
        _1868 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _1870 = _1868;
    float _1872 = rsqrt(_1856);
    float _1874 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _1876 = 1.0 + _1874;
    float _1878 = _1848 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    int _1880 = as_type<int>(_1870);
    if (_1766)
    {
        float _1882 = _1870 * 5.0;
        _1880 = as_type<int>(_1882);
    }
    int _1884 = _1880;
    out.m_58.x = _1844;
    out.m_58.y = _1860;
    bool _1886 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1888 = isnan(1.0);
    bool _1890 = _1886 || _1888;
    bool _1892 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1894 = _1890 || _1892;
    float _1896 = floor(_1812);
    if (_1766)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _5722 = as_type<float>(_1884);
        out.gl_Position.z = _5722;
    }
    bool _1898 = !_1212;
    int _1900 = _1898 ? 0 : 1;
    bool _1902 = !_1204;
    int _1904 = _1902 ? 0 : 1;
    out.m_60.x = _1838;
    out.m_60.y = _1878;
    out.m_60.z = _1858;
    float _1906 = 1.0 / _1876;
    float _1908 = _1706 * _1872;
    float _1910 = exp2(_1854);
    float _1912 = _1692 * _1872;
    if (_1766)
    {
        return out;
    }
    float _1914 = -_1908;
    float _1916 = fma(_1914, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1380);
    int _1918 = abs(_1904);
    float _1920 = _1712 * _1872;
    float _1922 = -_1912;
    float _1924 = fma(_1922, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1352);
    float _1926 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1928 = _1916 + _1926;
    float _1930 = -_1910;
    float _1932 = _1930 + 1.0;
    float _1934 = -_1920;
    float _1936 = fma(_1934, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1388);
    float _1938 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1940 = _1924 + _1938;
    float _1942 = _1928 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1944 = float(_1918);
    float _1946 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1948 = _1936 + _1946;
    float _1950 = float(_1650);
    float _1952 = fma(_1940, (*spvDescriptorSet0.vp_c8)._m0[28].x, _1942);
    float _1954 = _1830 ? _1932 : 0.0;
    float _1956 = _960 + (-0.5);
    bool _1958 = _1896 > 0.0;
    float _1960 = fma(_1948, (*spvDescriptorSet0.vp_c8)._m0[28].z, _1952);
    float _1962 = _1944 * _1950;
    float _1964 = _1936;
    if (_1894)
    {
        float _1966 = _1954 * _1906;
        _123 = _1966;
    }
    float _1968 = _123;
    float _1970 = _1676 * (-2.0);
    bool _1972 = _1896 >= 0.0;
    bool _1974 = isnan(_1896);
    bool _1976 = _1972 || _1974;
    bool _1978 = isnan(0.0);
    bool _1980 = _1976 || _1978;
    float _1982 = -_1908;
    float _1984 = fma(_1982, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1706);
    bool _1986 = _1960 >= 0.0;
    float _1988 = _1962 * (-2.0);
    float _1990 = fma(_1970, _1864, _1864);
    float _1992 = _141 + (-0.5);
    float _1994 = fma(_1304, _1970, _1304);
    float _1996 = fma(_1988, _1862, _1862);
    int _1998 = _1980 ? 0 : 1;
    float _2000 = fma(_1256, _1988, _1256);
    float _2002 = fma(_1956, (*spvDescriptorSet0.vp_c9)._m0[196].y, _1990);
    float _2004 = fma(_1992, (*spvDescriptorSet0.vp_c9)._m0[196].x, _1996);
    int _2006 = ~_1998;
    int _2008 = _2006 + 1;
    int _2010 = _2008 + 1;
    int _2012 = _2010;
    float _2014 = _2002;
    if (!_1958)
    {
        int _2016 = ~_1998;
        int _2018 = _2016 + 1;
        _2012 = _2018;
    }
    int _2020 = _2012;
    float _2022 = fma(_2000, _1968, _2004);
    float _2024 = fma(_1994, _1968, _2002);
    float _2026 = in.m_62.x;
    float _2028 = in.m_62.y;
    int _2030 = as_type<int>(_2024);
    if (_1986)
    {
        _2014 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _2032 = _2014;
    float _2034 = _2024 * 0.15915493667125701904296875;
    float _2036 = float(_2020);
    if (_1986)
    {
        out.m_45.x = 0.0;
    }
    if (_1986)
    {
        float _2038 = _2032 * 5.0;
        _2030 = as_type<int>(_2038);
    }
    int _2040 = _2030;
    float _2042 = _2034 * 6.283185482025146484375;
    float _2044 = cos(_2042);
    int _2046 = abs(_1900);
    if (_1986)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _5958 = as_type<float>(_2040);
        out.gl_Position.z = _5958;
    }
    float _2048 = float(_2046);
    float _2050 = _2034 * 6.283185482025146484375;
    float _2052 = sin(_2050);
    if (_1986)
    {
        return out;
    }
    float _2054 = -_1380;
    float _2056 = _2054 + (*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2058 = _2022 * 0.15915493667125701904296875;
    float _2060 = -_1352;
    float _2062 = _2060 + (*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2064 = -_1388;
    float _2066 = _2064 + (*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2068 = _2056 * _2056;
    float _2070 = -_1912;
    float _2072 = fma(_2070, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1692);
    float _2074 = _1984 * _1984;
    float _2076 = _2048 * _2036;
    float _2078 = fma(_2062, _2062, _2068);
    float _2080 = _141 + _1158;
    float _2082 = fma(_2072, _2072, _2074);
    float _2084 = fma(_2066, _2066, _2078);
    float _2086 = -_1920;
    float _2088 = fma(_2086, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1712);
    float _2090 = _2080 + (-1.0);
    float _2092 = _2076 * (-2.0);
    float _2094 = _1158 + (-0.5);
    float _2096 = fma(_2088, _2088, _2082);
    float _2098 = rsqrt(_2084);
    float _2100 = fma(_2090, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _2102 = fma(_2092, _1866, _1866);
    float _2104 = _637 * _2026;
    float _2106 = _639 * _2028;
    float _2108 = fma(_2100, _2092, _2100);
    float _2110 = fma(_2094, (*spvDescriptorSet0.vp_c9)._m0[196].z, _2102);
    float _2112 = _247 * _2104;
    float _2114 = sqrt(_2096);
    float _2116 = _247 * _2106;
    float _2118 = fma(_2108, _1968, _2110);
    float _2120 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _169);
    float _2122 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _189);
    float _2124 = _2118 * 0.15915493667125701904296875;
    bool _2126 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _2128 = isnan(0.5);
    bool _2130 = _2126 || _2128;
    bool _2132 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _2134 = _2130 || _2132;
    float _2136 = _2062 * _2098;
    float _2138 = _2058 * 6.283185482025146484375;
    float _2140 = sin(_2138);
    float _2142 = _2066 * _2098;
    float _2144 = _2056 * _2098;
    float _2146 = -(*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _2148 = _2136 * _2146;
    float _2150 = -(*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2152 = _2142 * _2150;
    float _2154 = -(*spvDescriptorSet0.vp_c8)._m0[1].x;
    float _2156 = _2144 * _2154;
    float _2158 = -(*spvDescriptorSet0.vp_c8)._m0[1].x;
    float _2160 = -_2148;
    float _2162 = fma(_2142, _2158, _2160);
    float _2164 = _2058 * 6.283185482025146484375;
    float _2166 = cos(_2164);
    float _2168 = -(*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _2170 = -_2152;
    float _2172 = fma(_2144, _2168, _2170);
    float _2174 = -(*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2176 = -_2156;
    float _2178 = fma(_2136, _2174, _2176);
    float _2180 = _2162 * _2162;
    float _2182 = _1872 * _2114;
    float _2184 = fma(_2172, _2172, _2180);
    float _2186 = _2124 * 6.283185482025146484375;
    float _2188 = sin(_2186);
    float _2190 = _2116 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _2192 = _2140 * _2052;
    float _2194 = fma(_2178, _2178, _2184);
    float _2196 = _2182 * _2190;
    float _2198 = _2124 * 6.283185482025146484375;
    float _2200 = cos(_2198);
    float _2202 = _2166 * _2044;
    float _2204 = fma(_2188, _2202, _2192);
    float _2206 = rsqrt(_2194);
    float _2208 = fma(_2188, _2192, _2202);
    float _2210 = _2112 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _2212 = _2182 * _2210;
    float _2214 = _2120 * _2196;
    float _2216 = _2166 * _2052;
    float _2218 = _2140 * _2044;
    float _2220 = _2122 * _2212;
    float _2222 = _2200 * _2214;
    float _2224 = -_2214;
    float _2226 = _2188 * _2224;
    float _2228 = -_2216;
    float _2230 = fma(_2188, _2218, _2228);
    float _2232 = -_2218;
    float _2234 = fma(_2188, _2216, _2232);
    float _2236 = _2166 * _2222;
    float _2238 = _2172 * _2206;
    float _2240 = _2044 * _2200;
    float _2242 = _2052 * _2200;
    float _2244 = fma(_2204, _2220, _2236);
    float _2246 = _2182 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _2248 = _2246 * 0.5;
    float _2250 = _2162 * _2206;
    float _2252 = _2144 * _2238;
    float _2254 = fma(_2240, _2220, _2226);
    float _2256 = _2140 * _2222;
    float _2258 = fma(_2234, _2248, _2244);
    float _2260 = _2178 * _2206;
    float _2262 = _2142 * _2250;
    float _2264 = -_2252;
    float _2266 = fma(_2136, _2250, _2264);
    float _2268 = fma(_2230, _2220, _2256);
    float _2270 = fma(_2242, _2248, _2254);
    float _2272 = -_2262;
    float _2274 = fma(_2144, _2260, _2272);
    float _2276 = _2266 * _2258;
    float _2278 = fma(_2208, _2248, _2268);
    float _2280 = _2274 * _2258;
    float _2282 = fma(_2260, _2270, _2276);
    float _2284 = fma(_2238, _2270, _2280);
    float _2286 = fma(_2142, _2278, _2282);
    float _2288 = fma(_2136, _2278, _2284);
    float _2290 = _1388 + _2286;
    float _2292 = _2136 * _2260;
    float _2294 = _1352 + _2288;
    float _2296 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _2298 = _2290 + _2296;
    float _2300 = -_2292;
    float _2302 = fma(_2142, _2238, _2300);
    float _2304 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _2306 = _2294 + _2304;
    float _2308 = _2298 * _2298;
    float _2310 = _2302 * _2258;
    float _2312 = fma(_2306, _2306, _2308);
    float _2314 = fma(_2250, _2270, _2310);
    float _2316 = sqrt(_2312);
    float _2318 = fma(_2144, _2278, _2314);
    float _2320 = _1380 + _2318;
    bool _2322 = _2316 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2324 = _2258;
    float _2326 = _2318;
    float _2328 = _2314;
    float _2330 = _2250;
    float _2332 = _2220;
    if (!_2322)
    {
        _2324 = _2294;
    }
    float _2334 = _2324;
    float _2336 = _2334;
    if (!_2322)
    {
        _2326 = _2290;
    }
    float _2338 = _2326;
    float _2340 = _2338;
    if (!_2322)
    {
        _2328 = _2320;
    }
    float _2342 = _2328;
    bool _2344 = !_2322;
    float _2346 = _2342;
    if (!_2344)
    {
        float _2348 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2350 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _2352 = _2316 + _2350;
        float _2354 = _2320 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2356 = rsqrt(_2312);
        float _2358 = _2352 * _2348;
        float _2360 = _2358 * 0.15915493667125701904296875;
        float _2362 = _2360 * 6.283185482025146484375;
        float _2364 = cos(_2362);
        float _2366 = _2360 * 6.283185482025146484375;
        float _2368 = sin(_2366);
        float _2370 = _2364 + (-1.0);
        float _2372 = _2370 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2374 = fma(_2368, _2354, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _2376 = fma(_2320, _2364, _2372);
        float _2378 = _2356 * _2374;
        float _2380 = fma(_2306, _2378, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _2382 = fma(_2298, _2378, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _2336 = _2380;
        _2346 = _2376;
        _2340 = _2382;
    }
    float _2384 = _2336;
    float _2386 = _2346;
    float _2388 = _2340;
    float _2390 = -_1912;
    float _2392 = fma(_2390, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2384);
    float _2394 = -_1908;
    float _2396 = fma(_2394, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2386);
    float _2398 = -_1920;
    float _2400 = fma(_2398, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2388);
    float _2402 = _2396;
    float _2404 = _2392;
    float _2406 = _2400;
    if (!_2134)
    {
        float _2408 = _1928 * _1928;
        float _2410 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _2412 = -_1388;
        float _2414 = _2412 + _2388;
        float _2416 = fma(_1940, _1940, _2408);
        float _2418 = fma(_1948, _1948, _2416);
        float _2420 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _2422 = sqrt(_2418);
        float _2424 = 1.0 / _2182;
        float _2426 = _2420 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _2428 = precise::min(_2422, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _2430 = _2428 * _2410;
        float _2432 = _2430 * _2424;
        float _2434 = -_1380;
        float _2436 = _2434 + _2386;
        float _2438 = -_1352;
        float _2440 = _2438 + _2384;
        float _2442 = _2426 * _2432;
        float _2444 = _2414 * _2432;
        float _2446 = fma(_2436, _2442, _1916);
        float _2448 = fma(_2440, _2442, _1924);
        float _2450 = fma(_2426, _2444, _1936);
        _2402 = _2446;
        _2404 = _2448;
        _2406 = _2450;
        _2330 = _2426;
    }
    float _2452 = _2402;
    float _2454 = _2404;
    float _2456 = _2406;
    float _2458 = _2330;
    float _2460 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2462 = _2452 + _2460;
    float _2464 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2466 = _2454 + _2464;
    float _2468 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2470 = _2456 + _2468;
    float _2472 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _2474 = _2462 * _2462;
    float _2476 = fma(_2466, _2466, _2474);
    float _2478 = fma(_2470, _2470, _2476);
    float _2480 = rsqrt(_2478);
    float _2482 = sqrt(_2478);
    float _2484 = _2480 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _2486 = _2466 * _2484;
    float _2488 = _2470 * _2484;
    float _2490 = _2486 * _2486;
    float _2492 = _2488 * _2488;
    float _2494 = _2490 + _2492;
    float _2496 = sqrt(_2494);
    bool _2498 = _2496 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2500 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2502 = _2496 + _2500;
    float _2504 = _2470;
    float _2506 = _2474;
    float _2508 = _2502;
    float _2510 = _2458;
    float _2512 = _2484;
    if (_2498)
    {
        float _2514 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2504 = _2514;
    }
    float _2516 = _2504;
    if (_2498)
    {
        float _2518 = rsqrt(_2494);
        _2506 = _2518;
    }
    float _2520 = _2506;
    float _2522 = _2520;
    if (_2498)
    {
        float _2524 = _2502 * _2516;
        _2508 = _2524;
    }
    float _2526 = _2508;
    if (_2498)
    {
        float _2528 = _2526 * 0.15915493667125701904296875;
        _2510 = _2528;
    }
    float _2530 = _2510;
    float _2532 = _2480;
    float _2534 = _2530;
    if (_2498)
    {
        float _2536 = _2530 * 6.283185482025146484375;
        float _2538 = sin(_2536);
        _2532 = _2538;
    }
    float _2540 = _2532;
    float _2542 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _2544 = precise::max(0.0, _2542);
    float _2546 = _2320;
    float _2548 = _2544;
    float _2550 = _2542;
    if (_2498)
    {
        float _2552 = _2530 * 6.283185482025146484375;
        float _2554 = cos(_2552);
        _2546 = _2554;
    }
    float _2556 = _2546;
    float _2558 = -_2484;
    float _2560 = -_2544;
    float _2562 = fma(_2462, _2558, _2560);
    if (_2498)
    {
        float _2564 = _2562 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2548 = _2564;
    }
    float _2566 = _2548;
    float _2568 = _2566;
    if (!_2498)
    {
        _2534 = _2490;
    }
    float _2570 = _2534;
    float _2572 = _2540;
    float _2574 = _2570;
    if (_2498)
    {
        float _2576 = fma(_2540, _2566, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _2572 = _2576;
    }
    float _2578 = _2572;
    float _2580 = _2578;
    if (!_2498)
    {
        _2568 = _2488;
    }
    float _2582 = _2568;
    float _2584 = _2582;
    if (_2498)
    {
        float _2586 = _2556 + (-1.0);
        _2550 = _2586;
    }
    float _2588 = _2550;
    float _2590 = _2588;
    if (_2498)
    {
        float _2592 = _2520 * _2578;
        _2332 = _2592;
    }
    float _2594 = _2332;
    if (!_2498)
    {
        _2522 = _2486;
    }
    float _2596 = _2522;
    float _2598 = _2596;
    if (_2498)
    {
        float _2600 = _2588 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2512 = _2600;
    }
    float _2602 = _2512;
    if (_2498)
    {
        float _2604 = _2486 * _2594;
        _2598 = _2604;
    }
    float _2606 = _2598;
    if (!_2498)
    {
        _2580 = _2562;
    }
    float _2608 = _2580;
    float _2610 = _2608;
    if (_2498)
    {
        float _2612 = _2488 * _2594;
        _2584 = _2612;
    }
    float _2614 = _2584;
    if (_2498)
    {
        float _2616 = fma(_2562, _2556, _2602);
        _2610 = _2616;
    }
    float _2618 = _2610;
    if (_2498)
    {
        float _2620 = _2606 * _2606;
        _2574 = _2620;
    }
    float _2622 = _2574;
    if (!_2498)
    {
        _2590 = _2492;
    }
    float _2624 = _2590;
    float _2626 = _2624;
    if (_2498)
    {
        float _2628 = _2614 * _2614;
        _2626 = _2628;
    }
    float _2630 = _2626;
    float _2632 = _2452 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _2634 = fma(_2618, _2618, _2622);
    float _2636 = _2452 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2638 = fma(_2454, (*spvDescriptorSet0.vp_c8)._m0[2].x, _2632);
    float _2640 = _2634 + _2630;
    float _2642 = _2452 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2644 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _2646 = fma(_2482, (*spvDescriptorSet0.vp_c15)._m0[23].w, _2644);
    float _2648 = precise::clamp(_2646, 0.0, 1.0);
    float _2650 = fma(_2456, (*spvDescriptorSet0.vp_c8)._m0[2].z, _2638);
    float _2652 = rsqrt(_2640);
    float _2654 = _2452 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _2656 = -_2648;
    float _2658 = _2656 + 1.0;
    float _2660 = fma(_2454, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2642);
    float _2662 = _2650 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _2664 = fma(_2454, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2636);
    float _2666 = fma(_2454, (*spvDescriptorSet0.vp_c8)._m0[3].x, _2654);
    float _2668 = fma(_2456, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2660);
    float _2670 = abs(_2658);
    float _2672 = log2(_2670);
    float _2674 = fma(_2456, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2664);
    float _2676 = fma(_2456, (*spvDescriptorSet0.vp_c8)._m0[3].z, _2666);
    float _2678 = _2668 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _2680 = _2662 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _2682 = _2674 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2684 = _2678 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _2686 = _2652 * _2606;
    float _2688 = _2652 * _2618;
    float _2690 = _2652 * _2614;
    float _2692 = fma(_2682, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2684);
    float _2694 = _2686 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _2696 = _2676 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _2698 = -_2680;
    float _2700 = fma(_2698, _2472, 1.0);
    float _2702 = fma(_2662, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2692);
    float _2704 = _2672 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _2706 = -_2694;
    float _2708 = fma(_2688, (*spvDescriptorSet0.vp_c15)._m0[21].y, _2706);
    float _2710 = _2678 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2712 = fma(_2696, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2702);
    float _2714 = log2(_2700);
    float _2716 = -_2690;
    float _2718 = fma(_2716, (*spvDescriptorSet0.vp_c15)._m0[21].z, _2708);
    float _2720 = _2678 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2722 = fma(_2682, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2710);
    float _2724 = _2688 + 1.0;
    float _2726 = fma(_2718, -0.5, 0.5);
    float _2728 = fma(_2682, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2720);
    float _2730 = fma(_2718, 0.5, 0.5);
    float _2732 = exp2(_2704);
    float _2734 = fma(_2662, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2722);
    float _2736 = fma(_2662, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2728);
    float _2738 = fma(_2730, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _2740 = fma(_2696, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2736);
    float _2742 = fma(_2730, _2738, -0.212114393711090087890625);
    float _2744 = 1.0 / _2712;
    float _2746 = _2714 * 0.693147182464599609375;
    float _2748 = fma(_2730, _2742, 1.570728778839111328125);
    float _2750 = _2746 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _2752 = sqrt(_2726);
    float _2754 = -_2688;
    float _2756 = fma(_2732, _2724, _2754);
    float _2758 = fma(_2696, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2734);
    float _2760 = fma(_2756, 0.5, 0.5);
    float _2762 = _2758 * _2744;
    float _2764 = _2740 * _2744;
    float _2766 = fma(_2762, 0.5, 0.5);
    float _2768 = fma(_2764, -0.5, 0.5);
    float _2770 = _2752 * 0.636619746685028076171875;
    float3 _7110 = float3(_2766, _2768, _2750);
    float _2772 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_7110, float3(0.0), isnan(_7110)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_7110, float3(0.0), isnan(_7110)), level(0.0)).x;
    float3 _7121 = float3(_2766, _2768, _2750);
    float4 _2775 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_7121, float3(0.0), isnan(_7121)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_7121, float3(0.0), isnan(_7121)), level(0.0)).xyzw;
    float _2777 = _2775.x;
    float _2779 = _2775.y;
    float _2781 = _2775.z;
    float _2783 = _2775.w;
    float _2785 = -_2748;
    float _2787 = fma(_2770, _2785, 1.0);
    float2 _7143 = float2(_2787, _2760);
    float3 _2791 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_7143, float2(0.0), isnan(_7143)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_7143, float2(0.0), isnan(_7143)), level(0.0)).xyz;
    float _2793 = _2791.x;
    float _2795 = _2791.y;
    float _2797 = _2791.z;
    float _2799 = _1916 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _2801 = _1916 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    bool _2803 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _2805 = isnan(0.5);
    bool _2807 = _2803 || _2805;
    bool _2809 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _2811 = _2807 || _2809;
    float _2813 = fma(_1924, (*spvDescriptorSet0.vp_c8)._m0[11].x, _2799);
    float _2815 = fma(_1924, (*spvDescriptorSet0.vp_c8)._m0[10].x, _2801);
    float _2817 = fma(_1936, (*spvDescriptorSet0.vp_c8)._m0[11].z, _2813);
    float _2819 = fma(_1936, (*spvDescriptorSet0.vp_c8)._m0[10].z, _2815);
    float _2821 = _2817 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _2823 = _2819 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _2825 = _2817;
    float _2827 = _2766;
    if (!_2811)
    {
        _1964 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _2829 = _1964;
    float _2831 = 1.0 / _2821;
    float _2833 = _2823 + _2821;
    float _2835 = _2829;
    if (!_2811)
    {
        _251 = (*spvDescriptorSet0.vp_c9)._m0[140].x;
    }
    float _2837 = _251;
    float _2839 = _2837;
    if (!_2811)
    {
        float _2841 = -_2837;
        float _2843 = _2841 + (*spvDescriptorSet0.vp_c9)._m0[140].y;
        _2825 = _2843;
    }
    float _2845 = _2825;
    float _2847 = _2672 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _2849 = _2833 * _2831;
    float _2851 = _2849 * 0.5;
    float _2853 = exp2(_2847);
    float _2855 = _2831;
    if (!_2811)
    {
        float _2857 = -_2829;
        float _2859 = fma(_2851, (*spvDescriptorSet0.vp_c8)._m0[30].w, _2857);
        _2855 = _2859;
    }
    float _2861 = _2855;
    float _2863 = _2678 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    if (_2811)
    {
        _2835 = 1.0;
    }
    float _2865 = _2835;
    float _2867 = _2865;
    if (!_2811)
    {
        float _2869 = 1.0 / _2845;
        _2827 = _2869;
    }
    float _2871 = _2827;
    float _2873 = fma(_2682, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2863);
    float _2875 = fma(_2662, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2873);
    float _2877 = _2861;
    if (!_2811)
    {
        float _2879 = 1.0 / _2861;
        _2877 = _2879;
    }
    float _2881 = _2877;
    float _2883 = -_2853;
    float _2885 = _2883 + 1.0;
    float _2887 = fma(_2696, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2875);
    float _2889 = _2885 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _2891 = _2887 + _2712;
    out.gl_Position.x = _2758;
    out.gl_Position.y = _2740;
    out.gl_Position.z = _2887;
    out.gl_Position.w = _2712;
    if (!_2811)
    {
        float _2893 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _2895 = -_2837;
        float _2897 = fma(_2881, _2893, _2895);
        _2839 = _2897;
    }
    float _2899 = _2839;
    float _2901 = _2891 * 0.5;
    if (!_2811)
    {
        float _2903 = _2899 * _2871;
        float _2905 = precise::clamp(_2903, 0.0, 1.0);
        _2867 = _2905;
    }
    float _2907 = _2867;
    float _2909 = _2907 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    bool _2911 = _2907 > 0.0;
    bool _2913 = isnan(_2907);
    bool _2915 = _2911 || _2913;
    bool _2917 = isnan(0.0);
    bool _2919 = _2915 || _2917;
    out.m_64.z = _2901;
    out.m_64.w = _2712;
    float _2921 = _2909 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    out.m_45.x = _2921;
    float _2923 = _2889 * _2772;
    float _2925 = -_2889;
    float _2927 = _2925 + 1.0;
    float _2929 = _2783 * _2923;
    float _2931 = _2797 * _2923;
    float _2933 = fma(_2793, _2929, _2777);
    float _2935 = fma(_2795, _2929, _2779);
    float _2937 = _2783 * _2927;
    float _2939 = fma(_2783, _2931, _2781);
    out.m_66.x = _2933;
    out.m_66.y = _2935;
    out.m_66.z = _2939;
    out.m_66.w = _2937;
    if (_2919)
    {
        return out;
    }
    out.m_45.x = 0.0;
    float _2941 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _2941;
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
    out.m_54 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_60 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_58 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_64 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_45 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_66 = float4(0.0, 0.0, 0.0, 1.0);
    bool _663 = false;
    bool _269 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _80 = in.m_42.w;
    float _82 = trunc(_80);
    int _85 = int(_82);
    bool _89 = _85 >= 1;
    float _91 = 0.0;
    if (!_89)
    {
        _91 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _93 = _91;
    float _95 = _93;
    if (!_89)
    {
        out.m_45.x = 0.0;
    }
    int _97 = 0;
    if (!_89)
    {
        float _99 = _93 * 5.0;
        _97 = as_type<int>(_99);
    }
    int _101 = _97;
    int _103 = _101;
    if (!_89)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2998 = as_type<float>(_101);
        out.gl_Position.z = _2998;
    }
    if (!_89)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_54.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_54.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_54.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_54.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_60.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_60.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_60.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_60.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_58.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_58.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_58.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_58.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 32, 0u); dm_cw(dm_gs, dm_p, 33, 0u); dm_cw(dm_gs, dm_p, 34, 0u); dm_cw(dm_gs, dm_p, 35, 0x3f800000u); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _105 = in.m_47.w;
    bool _107 = _105 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _109 = isnan(_105);
    bool _111 = _107 || _109;
    bool _113 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _115 = _111 || _113;
    float _117 = -_105;
    float _119 = _117 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _121 = 0.0;
    float _123 = _119;
    if (_115)
    {
        float _125 = float(_85);
        _121 = _125;
    }
    float _127 = _121;
    bool _129 = _119 >= _127;
    bool _131 = !_115;
    bool _133 = _129 || _131;
    if (_133)
    {
        _95 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _135 = _95;
    if (_133)
    {
        out.m_45.x = 0.0;
    }
    if (_133)
    {
        float _137 = _135 * 5.0;
        _103 = as_type<int>(_137);
    }
    int _139 = _103;
    if (_133)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3067 = as_type<float>(_139);
        out.gl_Position.z = _3067;
    }
    if (_133)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_54.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_54.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_54.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_54.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_60.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_60.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_60.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_60.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_58.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_58.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_58.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_58.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 32, 0u); dm_cw(dm_gs, dm_p, 33, 0u); dm_cw(dm_gs, dm_p, 34, 0u); dm_cw(dm_gs, dm_p, 35, 0x3f800000u); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _141 = in.m_49.x;
    float _143 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[19].z;
    float _145 = _119 + (*spvDescriptorSet0.vp_c9)._m0[20].z;
    float _147 = as_type<float>(int(gl_VertexIndex));
    float _149 = _145 * _143;
    float _151 = fma(_141, (*spvDescriptorSet0.vp_c9)._m0[20].x, _149);
    int _153 = as_type<int>(_147) & 1;
    bool _155 = _153 != 0;
    int _157 = as_type<int>(_147) & 2;
    bool _159 = _157 != 0;
    float _161 = _151 * 6.283185482025146484375;
    float _163 = floor(_151);
    float _165 = _161 * 0.15915493667125701904296875;
    bool _167 = !_159;
    float _169 = _167 ? (-0.5) : 0.5;
    int _171 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2;
    bool _173 = _171 != 0;
    int _175 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 4;
    bool _177 = _175 != 0;
    int _179 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x);
    bool _181 = _179 != 0;
    float _183 = _165 * 6.283185482025146484375;
    float _185 = cos(_183);
    bool _187 = !_155;
    float _189 = _187 ? (-0.5) : 0.5;
    bool _191 = !_173;
    int _193 = _191 ? 0 : 1;
    bool _195 = !_181;
    int _197 = _195 ? 0 : 1;
    int _199 = abs(_193);
    float _201 = -_163;
    float _203 = _151 + _201;
    int _205 = abs(_197);
    float _207 = -_203;
    float _209 = fma(_207, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    bool _211 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _213 = float(_199);
    float _215 = fma(_185, 0.5, 0.5);
    bool _217 = !_177;
    int _219 = _217 ? 0 : 1;
    bool _221 = _203 < 0.5;
    float _223 = float(_221);
    float _225 = abs(_209);
    float _227 = _213 * _225;
    int _229 = abs(_219);
    float _231 = -_215;
    float _233 = fma(_231, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _235 = float(_205);
    float _237 = -_223;
    float _239 = fma(_237, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _241 = float(_229);
    float _243 = fma(_235, _233, _227);
    float _245 = abs(_239);
    float _247 = fma(_241, _245, _243);
    bool _249 = !_211;
    float _251 = 0.5;
    float _267;
    if (!_249)
    {
        float _253 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _255 = _141 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _257 = fma(_255, (*spvDescriptorSet0.vp_c9)._m0[12].x, _119);
        float _259 = _257 * _253;
        float _261 = floor(_259);
        float _263 = -_261;
        float _265 = _259 + _263;
        _267 = _265;
        _269 = true;
    }
    else
    {
        float _271 = float(_85);
        float _273 = 1.0 / _271;
        float _275 = _119 * _273;
        _267 = _275;
    }
    _269 = false;
    float _277 = _267;
    float _279 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _281 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _279;
    float _283 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _285 = _283 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _287 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _289 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _287;
    float _291 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _293 = _291 + (*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _295 = 1.0 / _281;
    float _297 = -(*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _299 = (*spvDescriptorSet0.vp_c9)._m0[148].w + _297;
    float _301 = 1.0 / _285;
    float _303 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _305 = _277 + _303;
    float _307 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _309 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _311 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _313 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _315 = 1.0 / _289;
    float _317 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _319 = _277 + _317;
    float _321 = _305 * _295;
    float _323 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _325 = _277 + _323;
    float _327 = _307 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _329 = _309 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _331 = _311 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _333 = -(*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _335 = _277 + _333;
    float _337 = 1.0 / _293;
    float _339 = _319 * _301;
    float _341 = -(*spvDescriptorSet0.vp_c9)._m0[148].w;
    float _343 = _341 + (*spvDescriptorSet0.vp_c9)._m0[149].w;
    bool _345 = _277 >= (*spvDescriptorSet0.vp_c9)._m0[149].w;
    bool _347 = isnan(_277);
    bool _349 = _345 || _347;
    bool _351 = isnan((*spvDescriptorSet0.vp_c9)._m0[149].w);
    bool _353 = _349 || _351;
    float _355 = float(_353);
    out.m_54.x = _327;
    out.m_54.y = _329;
    out.m_54.z = _331;
    out.m_54.w = _313;
    float _357 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _359 = _277 + _357;
    float _361 = 1.0 / _343;
    float _363 = -(*spvDescriptorSet0.vp_c9)._m0[149].w;
    float _365 = (*spvDescriptorSet0.vp_c9)._m0[150].w + _363;
    bool _367 = _277 >= (*spvDescriptorSet0.vp_c9)._m0[150].w;
    bool _369 = isnan(_277);
    bool _371 = _367 || _369;
    bool _373 = isnan((*spvDescriptorSet0.vp_c9)._m0[150].w);
    bool _375 = _371 || _373;
    float _377 = float(_375);
    float _379 = _325 * _315;
    bool _381 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].z;
    float _383 = -_377;
    float _385 = _383 + 1.0;
    float _387 = 1.0 / _365;
    float _389 = -(*spvDescriptorSet0.vp_c9)._m0[149].w;
    float _391 = _277 + _389;
    bool _393 = _277 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _395 = isnan(_277);
    bool _397 = _393 || _395;
    bool _399 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _401 = _397 || _399;
    float _403 = float(_401);
    float _405 = _355 * _385;
    float _407 = -_355;
    float _409 = _407 + 1.0;
    float _411 = _359 * _337;
    bool _413 = _277 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _415 = isnan(_277);
    bool _417 = _413 || _415;
    bool _419 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _421 = _417 || _419;
    float _423 = float(_421);
    float _425 = -_403;
    float _427 = _425 + 1.0;
    float _429 = 1.0 / _299;
    bool _431 = _277 >= (*spvDescriptorSet0.vp_c9)._m0[148].w;
    bool _433 = isnan(_277);
    bool _435 = _431 || _433;
    bool _437 = isnan((*spvDescriptorSet0.vp_c9)._m0[148].w);
    bool _439 = _435 || _437;
    float _441 = float(_439);
    float _443 = _423 * _427;
    bool _445 = _277 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _447 = isnan(_277);
    bool _449 = _445 || _447;
    bool _451 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _453 = _449 || _451;
    float _455 = float(_453);
    float _457 = -_441;
    float _459 = _457 + 1.0;
    float _461 = _441 * _409;
    float _463 = _391 * _387;
    bool _465 = _277 >= (*spvDescriptorSet0.vp_c9)._m0[147].w;
    bool _467 = isnan(_277);
    bool _469 = _465 || _467;
    bool _471 = isnan((*spvDescriptorSet0.vp_c9)._m0[147].w);
    bool _473 = _469 || _471;
    float _475 = float(_473);
    float _477 = -(*spvDescriptorSet0.vp_c9)._m0[148].w;
    float _479 = _277 + _477;
    float _481 = -_423;
    float _483 = _481 + 1.0;
    float _485 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _487 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _485;
    float _489 = _475 * _459;
    float _491 = -_475;
    float _493 = _491 + 1.0;
    float _495 = _479 * _361;
    float _497 = _335 * _429;
    float _499 = _403 * _493;
    bool _501 = _277 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _503 = isnan(_277);
    bool _505 = _501 || _503;
    bool _507 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _509 = _505 || _507;
    float _511 = float(_509);
    float _513 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _515 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _513;
    float _517 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _519 = _517 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _521 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _523 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _521;
    float _525 = fma(_487, _379, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _527 = -_511;
    float _529 = _527 + 1.0;
    float _531 = _511 * _483;
    float _533 = fma(_515, _321, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _535 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _537 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _535;
    float _539 = _455 * _529;
    float _541 = fma(_523, _321, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _543 = -_455;
    float _545 = _543 + 1.0;
    float _547 = fma(_537, _379, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _549 = _533 * _539;
    float _551 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _553 = _551 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _555 = _541 * _539;
    float _557 = fma(_519, _339, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _559 = fma(_545, (*spvDescriptorSet0.vp_c9)._m0[143].x, _549);
    float _561 = fma(_553, _339, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _563 = fma(_545, (*spvDescriptorSet0.vp_c9)._m0[143].y, _555);
    float _565 = -(*spvDescriptorSet0.vp_c9)._m0[146].x;
    float _567 = _565 + (*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _569 = -(*spvDescriptorSet0.vp_c9)._m0[146].y;
    float _571 = _569 + (*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _573 = fma(_557, _531, _559);
    float _575 = fma(_561, _531, _563);
    float _577 = fma(_567, _411, (*spvDescriptorSet0.vp_c9)._m0[146].x);
    float _579 = fma(_571, _411, (*spvDescriptorSet0.vp_c9)._m0[146].y);
    float _581 = -(*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _583 = (*spvDescriptorSet0.vp_c9)._m0[148].x + _581;
    float _585 = -(*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _587 = (*spvDescriptorSet0.vp_c9)._m0[148].y + _585;
    float _589 = fma(_547, _443, _573);
    float _591 = fma(_525, _443, _575);
    float _593 = fma(_583, _497, (*spvDescriptorSet0.vp_c9)._m0[147].x);
    float _595 = fma(_587, _497, (*spvDescriptorSet0.vp_c9)._m0[147].y);
    float _597 = -(*spvDescriptorSet0.vp_c9)._m0[148].x;
    float _599 = _597 + (*spvDescriptorSet0.vp_c9)._m0[149].x;
    float _601 = fma(_577, _499, _589);
    float _603 = -(*spvDescriptorSet0.vp_c9)._m0[148].y;
    float _605 = _603 + (*spvDescriptorSet0.vp_c9)._m0[149].y;
    float _607 = fma(_579, _499, _591);
    float _609 = fma(_599, _495, (*spvDescriptorSet0.vp_c9)._m0[148].x);
    float _611 = -(*spvDescriptorSet0.vp_c9)._m0[149].x;
    float _613 = (*spvDescriptorSet0.vp_c9)._m0[150].x + _611;
    float _615 = fma(_593, _489, _601);
    float _617 = fma(_605, _495, (*spvDescriptorSet0.vp_c9)._m0[148].y);
    float _619 = -(*spvDescriptorSet0.vp_c9)._m0[149].y;
    float _621 = (*spvDescriptorSet0.vp_c9)._m0[150].y + _619;
    float _623 = fma(_595, _489, _607);
    float _625 = fma(_613, _463, (*spvDescriptorSet0.vp_c9)._m0[149].x);
    float _627 = fma(_609, _461, _615);
    float _629 = fma(_621, _463, (*spvDescriptorSet0.vp_c9)._m0[149].y);
    float _631 = fma(_617, _461, _623);
    float _633 = fma(_625, _405, _627);
    float _635 = fma(_629, _405, _631);
    float _637 = fma(_377, (*spvDescriptorSet0.vp_c9)._m0[150].x, _633);
    float _639 = fma(_377, (*spvDescriptorSet0.vp_c9)._m0[150].y, _635);
    bool _641 = !_381;
    float _659;
    float _661;
    if (!_641)
    {
        float _643 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].z;
        float _645 = _141 * (*spvDescriptorSet0.vp_c9)._m0[12].w;
        float _647 = fma(_645, (*spvDescriptorSet0.vp_c9)._m0[11].z, _119);
        float _649 = _647 * _643;
        float _651 = float(_85);
        float _653 = floor(_649);
        float _655 = -_653;
        float _657 = _649 + _655;
        _659 = _657;
        _661 = _651;
        _663 = true;
    }
    else
    {
        float _665 = float(_85);
        float _667 = 1.0 / _665;
        float _669 = _119 * _667;
        _659 = _669;
        _661 = _665;
    }
    _663 = false;
    float _671 = _659;
    float _673 = _661;
    float _675 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _677 = int(_675);
    float _679 = -(*spvDescriptorSet0.vp_c9)._m0[124].w;
    float _681 = _671 + _679;
    float _683 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _685 = _671 + _683;
    float _687 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _689 = int(_687);
    float _691 = float(_677);
    float _693 = 1.0 / _673;
    float _695 = float(uint(_689));
    float _697 = 1.0 / _691;
    int _699 = ~_689;
    int _701 = _699 + 1;
    float _703 = 1.0 / _695;
    float _705 = _697 * _119;
    float _707 = trunc(_705);
    int _709 = int(_707);
    int _711 = as_type<int>(_703) + (-2);
    int _713 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _715 = _713 != 0;
    bool _717 = !_715;
    float _719 = _717 ? 7.345489978790283203125 : 1.0;
    int _721 = ~_689;
    int _723 = _721 + 1;
    float _725 = float(uint(_709));
    float _727 = _719 * _141;
    float _729 = as_type<float>(_711) * _725;
    float _731 = trunc(_729);
    float _733 = precise::max(_731, 0.0);
    uint _736 = uint(_733);
    float _738 = float(_709);
    int _740 = _701 * int(_736);
    int _742 = _740 + _709;
    float _744 = float(uint(_742));
    float _746 = as_type<float>(_711) * _744;
    float _748 = trunc(_746);
    float _750 = precise::max(_748, 0.0);
    uint _752 = uint(_750);
    int _754 = int(_736) + int(_752);
    float _756 = float(_689);
    float _758 = floor(_727);
    int _760 = _723 * _754;
    int _762 = _760 + _709;
    bool _764 = _738 >= _756;
    bool _766 = isnan(_738);
    bool _768 = _764 || _766;
    bool _770 = isnan(_756);
    bool _772 = _768 || _770;
    float _774 = float(_772);
    bool _776 = uint(_762) >= uint(_689);
    float _778 = trunc(_774);
    int _780 = int(_778);
    bool _782 = !_776;
    int _784 = _782 ? 0 : (-1);
    bool _786 = _689 == 0;
    int _788 = ~_754;
    int _790 = _788 + _784;
    int _792 = _790 + 1;
    float _794 = -_758;
    float _796 = _727 + _794;
    int _798 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _800 = _798 != 0;
    int _802 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _804 = _802 != 0;
    int _806 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _808 = _806 != 0;
    int _810 = _689 * _792;
    int _812 = _810 + _709;
    bool _814 = !_800;
    int _816 = _814 ? 0 : 1;
    bool _818 = !_786;
    int _820 = _818 ? _812 : (-1);
    float _822 = _796 * _756;
    int _824 = ~_780;
    int _826 = _824 + 1;
    int _828 = _826 + 1;
    float _830 = _756 * _119;
    int _832 = _820 * _828;
    float _834 = _830 * _693;
    int _836 = _689 + (-1);
    float _838 = trunc(_822);
    int _840 = int(_838);
    int _842 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _844 = _842 != 0;
    int _846 = abs(_816);
    int _848 = _780 * _836;
    int _850 = _848 + _832;
    bool _852 = !_804;
    int _854 = _852 ? 0 : 1;
    bool _856 = !_844;
    int _858 = _856 ? 0 : 1;
    float _860 = trunc(_834);
    int _862 = int(_860);
    int _864 = abs(_854);
    bool _866 = !_808;
    int _868 = _866 ? 0 : 1;
    int _870 = abs(_858);
    int _872 = _850 * _864;
    int _874 = abs(_868);
    int _876 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _878 = _876 != 0;
    int _880 = _840 * _870;
    int _882 = _880 + _709;
    bool _884 = !_878;
    int _886 = _884 ? 0 : 1;
    int _888 = _862 * _846;
    int _890 = _888 + _872;
    int _892 = abs(_886);
    int _894 = ~_689;
    int _896 = _894 + 1;
    int _898 = _882 * _874;
    int _900 = _898 + _890;
    float _902 = float(uint(_882));
    int _904 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _906 = _904 != 0;
    int _908 = _840 * _892;
    int _910 = _908 + _900;
    int _912 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _914 = _912 != 0;
    float _916 = as_type<float>(_711) * _902;
    bool _918 = !_906;
    int _920 = _918 ? 0 : 1;
    float _922 = float(uint(_910));
    float _924 = trunc(_916);
    float _926 = precise::max(_924, 0.0);
    uint _928 = uint(_926);
    float _930 = as_type<float>(_711) * _922;
    float _932 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _934 = trunc(_930);
    float _936 = precise::max(_934, 0.0);
    uint _938 = uint(_936);
    int _940 = _896 * int(_938);
    int _942 = _940 + _910;
    float _944 = float(uint(_942));
    int _946 = ~_689;
    int _948 = _946 + 1;
    float _950 = as_type<float>(_711) * _944;
    float _952 = trunc(_950);
    float _954 = precise::max(_952, 0.0);
    uint _956 = uint(_954);
    int _958 = int(_938) + int(_956);
    float _960 = in.m_49.y;
    int _962 = _948 * _958;
    int _964 = _962 + _910;
    int _966 = _948 * int(_928);
    int _968 = _966 + _882;
    bool _970 = uint(_964) >= uint(_689);
    bool _972 = !_970;
    int _974 = _972 ? 0 : (-1);
    int _976 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _978 = _976 != 0;
    int _980 = ~_958;
    int _982 = _980 + _974;
    int _984 = _982 + 1;
    float _986 = _141 * 2.0;
    int _988 = _689 * _984;
    int _990 = _988 + _910;
    float _992 = float(uint(_968));
    float _994 = floor(_986);
    bool _996 = !_786;
    int _998 = _996 ? _990 : (-1);
    float _1000 = as_type<float>(_711) * _992;
    float _1002 = _960 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _1004 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    int _1006 = _998 & 3;
    bool _1008 = _1006 != 0;
    float _1010 = trunc(_1000);
    float _1012 = precise::max(_1010, 0.0);
    uint _1014 = uint(_1012);
    int _1016 = _998 & 3;
    bool _1018 = _1016 != 0;
    float _1020 = fma(_1002, -2.0, _1004);
    bool _1022 = uint(_1006) > 1u;
    float _1024 = _141 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    int _1026 = _1018 ? 0 : 1;
    int _1028 = ~_689;
    int _1030 = _1028 + 1;
    float _1032 = -_932;
    float _1034 = fma(_1024, 2.0, _1032);
    int _1036 = ~_1026;
    int _1038 = _1036 + 1;
    int _1040 = _1038 + 1;
    float _1042 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _1044 = (*spvDescriptorSet0.vp_c9)._m0[124].w + _1042;
    bool _1046 = _994 > 0.0;
    float _1048 = -(*spvDescriptorSet0.vp_c9)._m0[124].w;
    float _1050 = _1048 + (*spvDescriptorSet0.vp_c9)._m0[125].w;
    bool _1052 = _994 >= 0.0;
    bool _1054 = isnan(_994);
    bool _1056 = _1052 || _1054;
    bool _1058 = isnan(0.0);
    bool _1060 = _1056 || _1058;
    float _1062 = 1.0 / _1044;
    bool _1064 = !_1008;
    int _1066 = _1064 ? 0 : 1;
    float _1068 = -_119;
    float _1070 = fma(_1068, (*spvDescriptorSet0.vp_c9)._m0[76].x, _1034);
    int _1072 = _1040;
    if (!_1022)
    {
        int _1074 = ~_1026;
        int _1076 = _1074 + 1;
        _1072 = _1076;
    }
    int _1078 = _1072;
    int _1080 = _998 >> 31;
    bool _1082 = uint(_1006) >= 2u;
    float _1084 = 1.0 / _1050;
    int _1086 = _1080 & 3;
    float _1088 = -(*spvDescriptorSet0.vp_c9)._m0[125].w;
    float _1090 = (*spvDescriptorSet0.vp_c9)._m0[126].w + _1088;
    int _1092 = _1082 ? 0 : 1;
    bool _1094 = _1006 != 3;
    int _1096 = _998 + _1086;
    float _1098 = _685 * _1062;
    int _1100 = int(_928) + int(_1014);
    float _1102 = in.m_42.x;
    float _1104 = in.m_42.y;
    float _1106 = in.m_42.z;
    int _1108 = _1096 >> 2;
    float _1110 = 1.0 / _1090;
    int _1112 = ~_1092;
    int _1114 = _1112 + 1;
    int _1116 = _1114 + 1;
    int _1118 = _1030 * _1100;
    int _1120 = _1118 + _882;
    int _1122 = _1108 << 4;
    int _1124 = _1122 + 368;
    float _1126 = _681 * _1084;
    int _1128 = _1060 ? 0 : 1;
    int _1130 = _1116;
    if (_1094)
    {
        int _1132 = ~_1092;
        int _1134 = _1132 + 1;
        _1130 = _1134;
    }
    int _1136 = _1130;
    int _1138 = _1124 + 8;
    uint _1140 = uint(int(uint(_1138) >> uint(2)));
    uint _1142 = uint(int(uint(int(_1140)) >> uint(2)));
    int _1144 = int(_1140) & 3;
    float _1146 = (*spvDescriptorSet0.vp_c9)._m0[int(_1142)][_1144];
    int _1148 = int(_1140) + 1;
    uint _1150 = uint(int(uint(_1148) >> uint(2)));
    int _1152 = _1148 & 3;
    float _1154 = (*spvDescriptorSet0.vp_c9)._m0[int(_1150)][_1152];
    bool _1156 = uint(_1120) >= uint(_689);
    float _1158 = in.m_49.z;
    int _1160 = abs(_1078);
    float _1162 = -(*spvDescriptorSet0.vp_c9)._m0[126].w;
    float _1164 = _671 + _1162;
    bool _1166 = !_1156;
    int _1168 = _1166 ? 0 : (-1);
    bool _1170 = _1006 != 3;
    uint _1172 = uint(int(uint(_1124) >> uint(2)));
    uint _1174 = uint(int(uint(int(_1172)) >> uint(2)));
    int _1176 = int(_1172) & 3;
    float _1178 = (*spvDescriptorSet0.vp_c9)._m0[int(_1174)][_1176];
    int _1180 = int(_1172) + 1;
    uint _1182 = uint(int(uint(_1180) >> uint(2)));
    int _1184 = _1180 & 3;
    float _1186 = (*spvDescriptorSet0.vp_c9)._m0[int(_1182)][_1184];
    int _1188 = ~_1100;
    int _1190 = _1188 + _1168;
    int _1192 = _1190 + 1;
    float _1194 = -(*spvDescriptorSet0.vp_c9)._m0[125].w;
    float _1196 = _671 + _1194;
    bool _1198 = !_1170;
    int _1200 = _1198 ? 0 : (-1);
    int _1202 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _1204 = _1202 != 0;
    int _1206 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _1208 = _1206 != 0;
    int _1210 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _1212 = _1210 != 0;
    float _1214 = -(*spvDescriptorSet0.vp_c9)._m0[126].w;
    float _1216 = _1214 + (*spvDescriptorSet0.vp_c9)._m0[127].w;
    float _1218 = _1104 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _1220 = _1104 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _1222 = _1104 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _1224 = 1.0 / _1216;
    float _1226 = fma(_1102, (*spvDescriptorSet0.vp_c10)._m0[4].x, _1218);
    float _1228 = fma(_1102, (*spvDescriptorSet0.vp_c10)._m0[5].x, _1220);
    float _1230 = fma(_1102, (*spvDescriptorSet0.vp_c10)._m0[6].x, _1222);
    float _1232 = _141 + _960;
    int _1234 = abs(_1066);
    int _1236 = _689 * _1192;
    int _1238 = _1236 + _882;
    int _1240 = abs(_1136);
    float _1242 = _1232 + (-1.0);
    float _1244 = _960 + _1158;
    float _1246 = _1158 * 2.0;
    int _1248 = ~_1160;
    int _1250 = _1248 + 1;
    int _1252 = _1250 + 1;
    float _1254 = _1196 * _1110;
    float _1256 = fma(_1242, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _1258 = _1244 + (-1.0);
    float _1260 = trunc((*spvDescriptorSet0.vp_c9)._m0[80].z);
    int _1262 = int(_1260);
    int _1264 = ~_1128;
    int _1266 = _1264 + 1;
    int _1268 = _1266 + 1;
    float _1270 = _1164 * _1224;
    int _1272 = _1268;
    if (!_1046)
    {
        int _1274 = ~_1128;
        int _1276 = _1274 + 1;
        _1272 = _1276;
    }
    int _1278 = _1272;
    int _1280 = abs(_1200);
    int _1282 = ~_1234;
    int _1284 = _1282 + 1;
    int _1286 = _1284 + 1;
    float _1288 = floor(_1246);
    bool _1290 = !_786;
    int _1292 = _1290 ? _1238 : (-1);
    float _1294 = float(uint(_1262));
    int _1296 = _1252 * as_type<int>(_1186);
    int _1298 = ~_1240;
    int _1300 = _1298 + 1;
    int _1302 = _1300 + 1;
    float _1304 = fma(_1258, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    bool _1306 = _1288 > 0.0;
    int _1308 = _1286 * as_type<int>(_1178);
    int _1310 = _1308 + _1296;
    int _1312 = ~_1280;
    int _1314 = _1312 + 1;
    int _1316 = _1314 + 1;
    int _1318 = abs(_920);
    int _1320 = _1302 * as_type<int>(_1146);
    int _1322 = _1320 + _1310;
    int _1324 = abs(_1262);
    float _1326 = 1.0 / _1294;
    bool _1328 = _1288 >= 0.0;
    bool _1330 = isnan(_1288);
    bool _1332 = _1328 || _1330;
    bool _1334 = isnan(0.0);
    bool _1336 = _1332 || _1334;
    int _1338 = _1316 * as_type<int>(_1154);
    int _1340 = _1338 + _1322;
    float _1342 = fma(_1106, (*spvDescriptorSet0.vp_c10)._m0[4].z, _1226);
    int _1344 = ~_1318;
    int _1346 = _1344 + 1;
    int _1348 = _1346 + 1;
    float _1350 = float(uint(_1324));
    float _1352 = _1342 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    int _1354 = _1340 * _1348;
    float _1356 = fma(_1106, (*spvDescriptorSet0.vp_c10)._m0[5].z, _1228);
    float _1358 = fma(_1106, (*spvDescriptorSet0.vp_c10)._m0[6].z, _1230);
    float _1360 = 1.0 / _1350;
    int _1362 = _1292 * _1318;
    int _1364 = _1362 + _1354;
    float _1366 = -(*spvDescriptorSet0.vp_c9)._m0[123].x;
    float _1368 = (*spvDescriptorSet0.vp_c9)._m0[124].x + _1366;
    int _1370 = as_type<int>(_1326) + (-2);
    float _1372 = -(*spvDescriptorSet0.vp_c9)._m0[123].z;
    float _1374 = (*spvDescriptorSet0.vp_c9)._m0[124].z + _1372;
    float _1376 = fma(_1368, _1098, (*spvDescriptorSet0.vp_c9)._m0[123].x);
    int _1378 = abs(_1364);
    float _1380 = _1356 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _1382 = float(uint(_1364));
    float _1384 = -(*spvDescriptorSet0.vp_c9)._m0[123].y;
    float _1386 = (*spvDescriptorSet0.vp_c9)._m0[124].y + _1384;
    float _1388 = _1358 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    int _1390 = ~_1324;
    int _1392 = _1390 + 1;
    float _1394 = as_type<float>(_1370) * _1382;
    float _1396 = float(uint(_1378));
    float _1398 = fma(_1386, _1098, (*spvDescriptorSet0.vp_c9)._m0[123].y);
    int _1400 = as_type<int>(_1360) + (-2);
    float _1402 = -(*spvDescriptorSet0.vp_c9)._m0[124].y;
    float _1404 = _1402 + (*spvDescriptorSet0.vp_c9)._m0[125].y;
    float _1406 = fma(_1374, _1098, (*spvDescriptorSet0.vp_c9)._m0[123].z);
    float _1408 = trunc(_1394);
    float _1410 = precise::max(_1408, 0.0);
    uint _1412 = uint(_1410);
    float _1414 = -(*spvDescriptorSet0.vp_c9)._m0[124].x;
    float _1416 = _1414 + (*spvDescriptorSet0.vp_c9)._m0[125].x;
    float _1418 = as_type<float>(_1400) * _1396;
    float _1420 = fma(_1404, _1126, (*spvDescriptorSet0.vp_c9)._m0[124].y);
    float _1422 = -(*spvDescriptorSet0.vp_c9)._m0[124].z;
    float _1424 = _1422 + (*spvDescriptorSet0.vp_c9)._m0[125].z;
    int _1426 = ~_1262;
    int _1428 = _1426 + 1;
    float _1430 = fma(_1416, _1126, (*spvDescriptorSet0.vp_c9)._m0[124].x);
    float _1432 = trunc(_1418);
    float _1434 = precise::max(_1432, 0.0);
    uint _1436 = uint(_1434);
    float _1438 = fma(_1424, _1126, (*spvDescriptorSet0.vp_c9)._m0[124].z);
    float _1440 = -(*spvDescriptorSet0.vp_c9)._m0[125].x;
    float _1442 = (*spvDescriptorSet0.vp_c9)._m0[126].x + _1440;
    float _1444 = -(*spvDescriptorSet0.vp_c9)._m0[125].y;
    float _1446 = (*spvDescriptorSet0.vp_c9)._m0[126].y + _1444;
    bool _1448 = _671 >= (*spvDescriptorSet0.vp_c9)._m0[127].w;
    bool _1450 = isnan(_671);
    bool _1452 = _1448 || _1450;
    bool _1454 = isnan((*spvDescriptorSet0.vp_c9)._m0[127].w);
    bool _1456 = _1452 || _1454;
    float _1458 = float(_1456);
    float _1460 = -(*spvDescriptorSet0.vp_c9)._m0[125].z;
    float _1462 = (*spvDescriptorSet0.vp_c9)._m0[126].z + _1460;
    float _1464 = fma(_1442, _1254, (*spvDescriptorSet0.vp_c9)._m0[125].x);
    float _1466 = fma(_1446, _1254, (*spvDescriptorSet0.vp_c9)._m0[125].y);
    int _1468 = _1428 * int(_1412);
    int _1470 = _1468 + _1364;
    float _1472 = -_1458;
    float _1474 = _1472 + 1.0;
    int _1476 = _1336 ? 0 : 1;
    float _1478 = float(uint(_1470));
    float _1480 = fma(_1462, _1254, (*spvDescriptorSet0.vp_c9)._m0[125].z);
    int _1482 = _1392 * int(_1436);
    int _1484 = _1482 + _1378;
    bool _1486 = _671 >= (*spvDescriptorSet0.vp_c9)._m0[126].w;
    bool _1488 = isnan(_671);
    bool _1490 = _1486 || _1488;
    bool _1492 = isnan((*spvDescriptorSet0.vp_c9)._m0[126].w);
    bool _1494 = _1490 || _1492;
    float _1496 = float(_1494);
    bool _1498 = _671 >= (*spvDescriptorSet0.vp_c9)._m0[125].w;
    bool _1500 = isnan(_671);
    bool _1502 = _1498 || _1500;
    bool _1504 = isnan((*spvDescriptorSet0.vp_c9)._m0[125].w);
    bool _1506 = _1502 || _1504;
    float _1508 = float(_1506);
    float _1510 = as_type<float>(_1370) * _1478;
    float _1512 = float(uint(_1484));
    float _1514 = _1496 * _1474;
    float _1516 = -_1496;
    float _1518 = _1516 + 1.0;
    float _1520 = -_1508;
    float _1522 = _1520 + 1.0;
    bool _1524 = _671 >= (*spvDescriptorSet0.vp_c9)._m0[123].w;
    bool _1526 = isnan(_671);
    bool _1528 = _1524 || _1526;
    bool _1530 = isnan((*spvDescriptorSet0.vp_c9)._m0[123].w);
    bool _1532 = _1528 || _1530;
    float _1534 = float(_1532);
    float _1536 = as_type<float>(_1400) * _1512;
    bool _1538 = _671 >= (*spvDescriptorSet0.vp_c9)._m0[124].w;
    bool _1540 = isnan(_671);
    bool _1542 = _1538 || _1540;
    bool _1544 = isnan((*spvDescriptorSet0.vp_c9)._m0[124].w);
    bool _1546 = _1542 || _1544;
    float _1548 = float(_1546);
    float _1550 = -(*spvDescriptorSet0.vp_c9)._m0[126].x;
    float _1552 = _1550 + (*spvDescriptorSet0.vp_c9)._m0[127].x;
    float _1554 = -(*spvDescriptorSet0.vp_c9)._m0[126].y;
    float _1556 = _1554 + (*spvDescriptorSet0.vp_c9)._m0[127].y;
    float _1558 = _1508 * _1518;
    float _1560 = trunc(_1510);
    float _1562 = precise::max(_1560, 0.0);
    uint _1564 = uint(_1562);
    float _1566 = _1548 * _1522;
    float _1568 = -_1548;
    float _1570 = _1568 + 1.0;
    float _1572 = -(*spvDescriptorSet0.vp_c9)._m0[126].z;
    float _1574 = _1572 + (*spvDescriptorSet0.vp_c9)._m0[127].z;
    float _1576 = fma(_1552, _1270, (*spvDescriptorSet0.vp_c9)._m0[126].x);
    float _1578 = fma(_1556, _1270, (*spvDescriptorSet0.vp_c9)._m0[126].y);
    float _1580 = _1534 * _1570;
    float _1582 = fma(_1574, _1270, (*spvDescriptorSet0.vp_c9)._m0[126].z);
    float _1584 = trunc(_1536);
    float _1586 = precise::max(_1584, 0.0);
    uint _1588 = uint(_1586);
    float _1590 = -_1534;
    float _1592 = _1590 + 1.0;
    float _1594 = _1376 * _1580;
    float _1596 = _1398 * _1580;
    float _1598 = _1406 * _1580;
    int _1600 = ~_1476;
    int _1602 = _1600 + 1;
    int _1604 = _1602 + 1;
    float _1606 = fma(_1592, (*spvDescriptorSet0.vp_c9)._m0[123].x, _1594);
    float _1608 = fma(_1592, (*spvDescriptorSet0.vp_c9)._m0[123].y, _1596);
    float _1610 = fma(_1592, (*spvDescriptorSet0.vp_c9)._m0[123].z, _1598);
    bool _1612 = !_1208;
    int _1614 = _1612 ? 0 : 1;
    float _1616 = fma(_1430, _1566, _1606);
    int _1618 = int(_1412) + int(_1564);
    float _1620 = fma(_1420, _1566, _1608);
    int _1622 = abs(_1614);
    float _1624 = fma(_1438, _1566, _1610);
    int _1626 = ~_1262;
    int _1628 = _1626 + 1;
    float _1630 = fma(_1466, _1558, _1620);
    int _1632 = ~_1324;
    int _1634 = _1632 + 1;
    float _1636 = fma(_1480, _1558, _1624);
    int _1638 = int(_1436) + int(_1588);
    int _1640 = _1628 * _1618;
    int _1642 = _1640 + _1364;
    int _1644 = _1604;
    if (!_1306)
    {
        int _1646 = ~_1476;
        int _1648 = _1646 + 1;
        _1644 = _1648;
    }
    int _1650 = _1644;
    float _1652 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _1654 = float(_1278);
    int _1656 = _1634 * _1638;
    int _1658 = _1656 + _1378;
    bool _1660 = uint(_1642) >= uint(_1262);
    float _1662 = fma(_1464, _1558, _1616);
    float _1664 = float(_1622);
    float _1666 = fma(_1578, _1514, _1630);
    bool _1668 = uint(_1658) >= uint(_1324);
    float _1670 = fma(_1576, _1514, _1662);
    bool _1672 = !_1660;
    int _1674 = _1672 ? 0 : (-1);
    float _1676 = _1664 * _1654;
    bool _1678 = !_1668;
    int _1680 = _1678 ? 0 : (-1);
    float _1682 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    int _1684 = ~_1618;
    int _1686 = _1684 + _1674;
    int _1688 = _1686 + 1;
    float _1690 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1692 = _1352 + _1690;
    int _1694 = _1364 ^ _1262;
    float _1696 = fma(_1582, _1514, _1636);
    int _1698 = ~_1680;
    int _1700 = _1638 + _1698;
    int _1702 = _1700 + 1;
    float _1704 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1706 = _1380 + _1704;
    uint _1708 = uint(int(uint(_1694) >> uint(31)));
    float _1710 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1712 = _1388 + _1710;
    bool _1714 = _1262 == 0;
    float _1716 = _1706 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    int _1718 = ~int(_1708);
    int _1720 = _1718 + 1;
    float _1722 = fma(_119, (*spvDescriptorSet0.vp_c9)._m0[76].y, _1020);
    bool _1724 = _1262 == 0;
    float _1726 = fma(_1692, (*spvDescriptorSet0.vp_c8)._m0[28].x, _1716);
    int _1728 = _1262 * _1688;
    int _1730 = _1728 + _1364;
    int _1732 = _1702 ^ _1720;
    float _1734 = _1682 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    bool _1736 = _141 > 0.5;
    float _1738 = fma(_1712, (*spvDescriptorSet0.vp_c8)._m0[28].z, _1726);
    float _1740 = fma(_1458, (*spvDescriptorSet0.vp_c9)._m0[127].x, _1670);
    int _1742 = ~_1720;
    int _1744 = _1742 + _1732;
    int _1746 = _1744 + 1;
    float _1748 = fma(_1458, (*spvDescriptorSet0.vp_c9)._m0[127].y, _1666);
    bool _1750 = !_1714;
    int _1752 = _1750 ? _1730 : (-1);
    float _1754 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    bool _1756 = _960 > 0.5;
    float _1758 = fma(_1458, (*spvDescriptorSet0.vp_c9)._m0[127].z, _1696);
    float _1760 = -_189;
    int _1762 = _1736 ? as_type<int>(_1760) : as_type<int>(_189);
    float _1764 = fma(_141, (*spvDescriptorSet0.vp_c9)._m0[78].z, _1754);
    bool _1766 = _1738 >= 0.0;
    float _1768 = _1740 * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    bool _1770 = !_1724;
    int _1772 = _1770 ? _1746 : (-1);
    float _1774 = fma(_119, (*spvDescriptorSet0.vp_c9)._m0[77].z, _1764);
    float _1776 = -_169;
    int _1778 = _1756 ? as_type<int>(_1776) : as_type<int>(_169);
    float _1780 = _1758 * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1782 = float(_1752);
    float _1784 = _1652 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1786 = float(_1772);
    float _1788 = -_1774;
    float _1790 = _1788 + 1.0;
    bool _1792 = !_914;
    float _1794 = _1792 ? _169 : as_type<float>(_1778);
    float _1796 = fma(_1734, _1782, _1070);
    float _1798 = -_1722;
    float _1800 = fma(_1784, _1786, _1798);
    bool _1802 = !_978;
    float _1804 = _1802 ? _189 : as_type<float>(_1762);
    float _1806 = _1794 + (-0.5);
    float _1808 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _1810 = log2(_1808);
    float _1812 = _960 * 2.0;
    if (_1766)
    {
        out.m_45.x = 0.0;
    }
    float _1814 = -_1784;
    float _1816 = fma(_1814, _1806, _1800);
    float _1818 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _1820 = _1804 + 0.5;
    bool _1822 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1824 = isnan(0.0);
    bool _1826 = _1822 || _1824;
    bool _1828 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1830 = _1826 || _1828;
    float _1832 = fma(_960, (*spvDescriptorSet0.vp_c9)._m0[78].w, _1818);
    float _1834 = fma(_1734, _1820, _1796);
    float _1836 = _1706 * _1706;
    float _1838 = _1768 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1840 = fma(_119, (*spvDescriptorSet0.vp_c9)._m0[77].w, _1832);
    float _1842 = -_1790;
    float _1844 = fma(_1804, _1842, _1834);
    float _1846 = fma(_1692, _1692, _1836);
    float _1848 = _1748 * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1850 = -_1840;
    float _1852 = _1850 + 1.0;
    float _1854 = _1810 * _119;
    float _1856 = fma(_1712, _1712, _1846);
    float _1858 = _1780 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1860 = fma(_1794, _1852, _1816);
    float _1862 = in.m_56.x;
    float _1864 = in.m_56.y;
    float _1866 = in.m_56.z;
    float _1868 = _1846;
    if (_1766)
    {
        _1868 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _1870 = _1868;
    float _1872 = rsqrt(_1856);
    float _1874 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _1876 = 1.0 + _1874;
    float _1878 = _1848 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    int _1880 = as_type<int>(_1870);
    if (_1766)
    {
        float _1882 = _1870 * 5.0;
        _1880 = as_type<int>(_1882);
    }
    int _1884 = _1880;
    out.m_58.x = _1844;
    out.m_58.y = _1860;
    bool _1886 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1888 = isnan(1.0);
    bool _1890 = _1886 || _1888;
    bool _1892 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1894 = _1890 || _1892;
    float _1896 = floor(_1812);
    if (_1766)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _5722 = as_type<float>(_1884);
        out.gl_Position.z = _5722;
    }
    bool _1898 = !_1212;
    int _1900 = _1898 ? 0 : 1;
    bool _1902 = !_1204;
    int _1904 = _1902 ? 0 : 1;
    out.m_60.x = _1838;
    out.m_60.y = _1878;
    out.m_60.z = _1858;
    float _1906 = 1.0 / _1876;
    float _1908 = _1706 * _1872;
    float _1910 = exp2(_1854);
    float _1912 = _1692 * _1872;
    if (_1766)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_54.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_54.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_54.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_54.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_60.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_60.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_60.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_60.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_58.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_58.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_58.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_58.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 32, 0u); dm_cw(dm_gs, dm_p, 33, 0u); dm_cw(dm_gs, dm_p, 34, 0u); dm_cw(dm_gs, dm_p, 35, 0x3f800000u); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _1914 = -_1908;
    float _1916 = fma(_1914, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1380);
    int _1918 = abs(_1904);
    float _1920 = _1712 * _1872;
    float _1922 = -_1912;
    float _1924 = fma(_1922, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1352);
    float _1926 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1928 = _1916 + _1926;
    float _1930 = -_1910;
    float _1932 = _1930 + 1.0;
    float _1934 = -_1920;
    float _1936 = fma(_1934, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1388);
    float _1938 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1940 = _1924 + _1938;
    float _1942 = _1928 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1944 = float(_1918);
    float _1946 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1948 = _1936 + _1946;
    float _1950 = float(_1650);
    float _1952 = fma(_1940, (*spvDescriptorSet0.vp_c8)._m0[28].x, _1942);
    float _1954 = _1830 ? _1932 : 0.0;
    float _1956 = _960 + (-0.5);
    bool _1958 = _1896 > 0.0;
    float _1960 = fma(_1948, (*spvDescriptorSet0.vp_c8)._m0[28].z, _1952);
    float _1962 = _1944 * _1950;
    float _1964 = _1936;
    if (_1894)
    {
        float _1966 = _1954 * _1906;
        _123 = _1966;
    }
    float _1968 = _123;
    float _1970 = _1676 * (-2.0);
    bool _1972 = _1896 >= 0.0;
    bool _1974 = isnan(_1896);
    bool _1976 = _1972 || _1974;
    bool _1978 = isnan(0.0);
    bool _1980 = _1976 || _1978;
    float _1982 = -_1908;
    float _1984 = fma(_1982, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1706);
    bool _1986 = _1960 >= 0.0;
    float _1988 = _1962 * (-2.0);
    float _1990 = fma(_1970, _1864, _1864);
    float _1992 = _141 + (-0.5);
    float _1994 = fma(_1304, _1970, _1304);
    float _1996 = fma(_1988, _1862, _1862);
    int _1998 = _1980 ? 0 : 1;
    float _2000 = fma(_1256, _1988, _1256);
    float _2002 = fma(_1956, (*spvDescriptorSet0.vp_c9)._m0[196].y, _1990);
    float _2004 = fma(_1992, (*spvDescriptorSet0.vp_c9)._m0[196].x, _1996);
    int _2006 = ~_1998;
    int _2008 = _2006 + 1;
    int _2010 = _2008 + 1;
    int _2012 = _2010;
    float _2014 = _2002;
    if (!_1958)
    {
        int _2016 = ~_1998;
        int _2018 = _2016 + 1;
        _2012 = _2018;
    }
    int _2020 = _2012;
    float _2022 = fma(_2000, _1968, _2004);
    float _2024 = fma(_1994, _1968, _2002);
    float _2026 = in.m_62.x;
    float _2028 = in.m_62.y;
    int _2030 = as_type<int>(_2024);
    if (_1986)
    {
        _2014 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _2032 = _2014;
    float _2034 = _2024 * 0.15915493667125701904296875;
    float _2036 = float(_2020);
    if (_1986)
    {
        out.m_45.x = 0.0;
    }
    if (_1986)
    {
        float _2038 = _2032 * 5.0;
        _2030 = as_type<int>(_2038);
    }
    int _2040 = _2030;
    float _2042 = _2034 * 6.283185482025146484375;
    float _2044 = cos(_2042);
    int _2046 = abs(_1900);
    if (_1986)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _5958 = as_type<float>(_2040);
        out.gl_Position.z = _5958;
    }
    float _2048 = float(_2046);
    float _2050 = _2034 * 6.283185482025146484375;
    float _2052 = sin(_2050);
    if (_1986)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_54.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_54.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_54.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_54.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_60.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_60.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_60.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_60.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_58.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_58.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_58.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_58.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 32, 0u); dm_cw(dm_gs, dm_p, 33, 0u); dm_cw(dm_gs, dm_p, 34, 0u); dm_cw(dm_gs, dm_p, 35, 0x3f800000u); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _2054 = -_1380;
    float _2056 = _2054 + (*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2058 = _2022 * 0.15915493667125701904296875;
    float _2060 = -_1352;
    float _2062 = _2060 + (*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2064 = -_1388;
    float _2066 = _2064 + (*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2068 = _2056 * _2056;
    float _2070 = -_1912;
    float _2072 = fma(_2070, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1692);
    float _2074 = _1984 * _1984;
    float _2076 = _2048 * _2036;
    float _2078 = fma(_2062, _2062, _2068);
    float _2080 = _141 + _1158;
    float _2082 = fma(_2072, _2072, _2074);
    float _2084 = fma(_2066, _2066, _2078);
    float _2086 = -_1920;
    float _2088 = fma(_2086, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1712);
    float _2090 = _2080 + (-1.0);
    float _2092 = _2076 * (-2.0);
    float _2094 = _1158 + (-0.5);
    float _2096 = fma(_2088, _2088, _2082);
    float _2098 = rsqrt(_2084);
    float _2100 = fma(_2090, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _2102 = fma(_2092, _1866, _1866);
    float _2104 = _637 * _2026;
    float _2106 = _639 * _2028;
    float _2108 = fma(_2100, _2092, _2100);
    float _2110 = fma(_2094, (*spvDescriptorSet0.vp_c9)._m0[196].z, _2102);
    float _2112 = _247 * _2104;
    float _2114 = sqrt(_2096);
    float _2116 = _247 * _2106;
    float _2118 = fma(_2108, _1968, _2110);
    float _2120 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _169);
    float _2122 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _189);
    float _2124 = _2118 * 0.15915493667125701904296875;
    bool _2126 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _2128 = isnan(0.5);
    bool _2130 = _2126 || _2128;
    bool _2132 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _2134 = _2130 || _2132;
    float _2136 = _2062 * _2098;
    float _2138 = _2058 * 6.283185482025146484375;
    float _2140 = sin(_2138);
    float _2142 = _2066 * _2098;
    float _2144 = _2056 * _2098;
    float _2146 = -(*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _2148 = _2136 * _2146;
    float _2150 = -(*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2152 = _2142 * _2150;
    float _2154 = -(*spvDescriptorSet0.vp_c8)._m0[1].x;
    float _2156 = _2144 * _2154;
    float _2158 = -(*spvDescriptorSet0.vp_c8)._m0[1].x;
    float _2160 = -_2148;
    float _2162 = fma(_2142, _2158, _2160);
    float _2164 = _2058 * 6.283185482025146484375;
    float _2166 = cos(_2164);
    float _2168 = -(*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _2170 = -_2152;
    float _2172 = fma(_2144, _2168, _2170);
    float _2174 = -(*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2176 = -_2156;
    float _2178 = fma(_2136, _2174, _2176);
    float _2180 = _2162 * _2162;
    float _2182 = _1872 * _2114;
    float _2184 = fma(_2172, _2172, _2180);
    float _2186 = _2124 * 6.283185482025146484375;
    float _2188 = sin(_2186);
    float _2190 = _2116 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _2192 = _2140 * _2052;
    float _2194 = fma(_2178, _2178, _2184);
    float _2196 = _2182 * _2190;
    float _2198 = _2124 * 6.283185482025146484375;
    float _2200 = cos(_2198);
    float _2202 = _2166 * _2044;
    float _2204 = fma(_2188, _2202, _2192);
    float _2206 = rsqrt(_2194);
    float _2208 = fma(_2188, _2192, _2202);
    float _2210 = _2112 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _2212 = _2182 * _2210;
    float _2214 = _2120 * _2196;
    float _2216 = _2166 * _2052;
    float _2218 = _2140 * _2044;
    float _2220 = _2122 * _2212;
    float _2222 = _2200 * _2214;
    float _2224 = -_2214;
    float _2226 = _2188 * _2224;
    float _2228 = -_2216;
    float _2230 = fma(_2188, _2218, _2228);
    float _2232 = -_2218;
    float _2234 = fma(_2188, _2216, _2232);
    float _2236 = _2166 * _2222;
    float _2238 = _2172 * _2206;
    float _2240 = _2044 * _2200;
    float _2242 = _2052 * _2200;
    float _2244 = fma(_2204, _2220, _2236);
    float _2246 = _2182 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _2248 = _2246 * 0.5;
    float _2250 = _2162 * _2206;
    float _2252 = _2144 * _2238;
    float _2254 = fma(_2240, _2220, _2226);
    float _2256 = _2140 * _2222;
    float _2258 = fma(_2234, _2248, _2244);
    float _2260 = _2178 * _2206;
    float _2262 = _2142 * _2250;
    float _2264 = -_2252;
    float _2266 = fma(_2136, _2250, _2264);
    float _2268 = fma(_2230, _2220, _2256);
    float _2270 = fma(_2242, _2248, _2254);
    float _2272 = -_2262;
    float _2274 = fma(_2144, _2260, _2272);
    float _2276 = _2266 * _2258;
    float _2278 = fma(_2208, _2248, _2268);
    float _2280 = _2274 * _2258;
    float _2282 = fma(_2260, _2270, _2276);
    float _2284 = fma(_2238, _2270, _2280);
    float _2286 = fma(_2142, _2278, _2282);
    float _2288 = fma(_2136, _2278, _2284);
    float _2290 = _1388 + _2286;
    float _2292 = _2136 * _2260;
    float _2294 = _1352 + _2288;
    float _2296 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _2298 = _2290 + _2296;
    float _2300 = -_2292;
    float _2302 = fma(_2142, _2238, _2300);
    float _2304 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _2306 = _2294 + _2304;
    float _2308 = _2298 * _2298;
    float _2310 = _2302 * _2258;
    float _2312 = fma(_2306, _2306, _2308);
    float _2314 = fma(_2250, _2270, _2310);
    float _2316 = sqrt(_2312);
    float _2318 = fma(_2144, _2278, _2314);
    float _2320 = _1380 + _2318;
    bool _2322 = _2316 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2324 = _2258;
    float _2326 = _2318;
    float _2328 = _2314;
    float _2330 = _2250;
    float _2332 = _2220;
    if (!_2322)
    {
        _2324 = _2294;
    }
    float _2334 = _2324;
    float _2336 = _2334;
    if (!_2322)
    {
        _2326 = _2290;
    }
    float _2338 = _2326;
    float _2340 = _2338;
    if (!_2322)
    {
        _2328 = _2320;
    }
    float _2342 = _2328;
    bool _2344 = !_2322;
    float _2346 = _2342;
    if (!_2344)
    {
        float _2348 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2350 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _2352 = _2316 + _2350;
        float _2354 = _2320 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2356 = rsqrt(_2312);
        float _2358 = _2352 * _2348;
        float _2360 = _2358 * 0.15915493667125701904296875;
        float _2362 = _2360 * 6.283185482025146484375;
        float _2364 = cos(_2362);
        float _2366 = _2360 * 6.283185482025146484375;
        float _2368 = sin(_2366);
        float _2370 = _2364 + (-1.0);
        float _2372 = _2370 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2374 = fma(_2368, _2354, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _2376 = fma(_2320, _2364, _2372);
        float _2378 = _2356 * _2374;
        float _2380 = fma(_2306, _2378, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _2382 = fma(_2298, _2378, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _2336 = _2380;
        _2346 = _2376;
        _2340 = _2382;
    }
    float _2384 = _2336;
    float _2386 = _2346;
    float _2388 = _2340;
    float _2390 = -_1912;
    float _2392 = fma(_2390, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2384);
    float _2394 = -_1908;
    float _2396 = fma(_2394, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2386);
    float _2398 = -_1920;
    float _2400 = fma(_2398, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2388);
    float _2402 = _2396;
    float _2404 = _2392;
    float _2406 = _2400;
    if (!_2134)
    {
        float _2408 = _1928 * _1928;
        float _2410 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _2412 = -_1388;
        float _2414 = _2412 + _2388;
        float _2416 = fma(_1940, _1940, _2408);
        float _2418 = fma(_1948, _1948, _2416);
        float _2420 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _2422 = sqrt(_2418);
        float _2424 = 1.0 / _2182;
        float _2426 = _2420 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _2428 = precise::min(_2422, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _2430 = _2428 * _2410;
        float _2432 = _2430 * _2424;
        float _2434 = -_1380;
        float _2436 = _2434 + _2386;
        float _2438 = -_1352;
        float _2440 = _2438 + _2384;
        float _2442 = _2426 * _2432;
        float _2444 = _2414 * _2432;
        float _2446 = fma(_2436, _2442, _1916);
        float _2448 = fma(_2440, _2442, _1924);
        float _2450 = fma(_2426, _2444, _1936);
        _2402 = _2446;
        _2404 = _2448;
        _2406 = _2450;
        _2330 = _2426;
    }
    float _2452 = _2402;
    float _2454 = _2404;
    float _2456 = _2406;
    float _2458 = _2330;
    float _2460 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2462 = _2452 + _2460;
    float _2464 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2466 = _2454 + _2464;
    float _2468 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2470 = _2456 + _2468;
    float _2472 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _2474 = _2462 * _2462;
    float _2476 = fma(_2466, _2466, _2474);
    float _2478 = fma(_2470, _2470, _2476);
    float _2480 = rsqrt(_2478);
    float _2482 = sqrt(_2478);
    float _2484 = _2480 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _2486 = _2466 * _2484;
    float _2488 = _2470 * _2484;
    float _2490 = _2486 * _2486;
    float _2492 = _2488 * _2488;
    float _2494 = _2490 + _2492;
    float _2496 = sqrt(_2494);
    bool _2498 = _2496 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2500 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2502 = _2496 + _2500;
    float _2504 = _2470;
    float _2506 = _2474;
    float _2508 = _2502;
    float _2510 = _2458;
    float _2512 = _2484;
    if (_2498)
    {
        float _2514 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2504 = _2514;
    }
    float _2516 = _2504;
    if (_2498)
    {
        float _2518 = rsqrt(_2494);
        _2506 = _2518;
    }
    float _2520 = _2506;
    float _2522 = _2520;
    if (_2498)
    {
        float _2524 = _2502 * _2516;
        _2508 = _2524;
    }
    float _2526 = _2508;
    if (_2498)
    {
        float _2528 = _2526 * 0.15915493667125701904296875;
        _2510 = _2528;
    }
    float _2530 = _2510;
    float _2532 = _2480;
    float _2534 = _2530;
    if (_2498)
    {
        float _2536 = _2530 * 6.283185482025146484375;
        float _2538 = sin(_2536);
        _2532 = _2538;
    }
    float _2540 = _2532;
    float _2542 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _2544 = precise::max(0.0, _2542);
    float _2546 = _2320;
    float _2548 = _2544;
    float _2550 = _2542;
    if (_2498)
    {
        float _2552 = _2530 * 6.283185482025146484375;
        float _2554 = cos(_2552);
        _2546 = _2554;
    }
    float _2556 = _2546;
    float _2558 = -_2484;
    float _2560 = -_2544;
    float _2562 = fma(_2462, _2558, _2560);
    if (_2498)
    {
        float _2564 = _2562 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2548 = _2564;
    }
    float _2566 = _2548;
    float _2568 = _2566;
    if (!_2498)
    {
        _2534 = _2490;
    }
    float _2570 = _2534;
    float _2572 = _2540;
    float _2574 = _2570;
    if (_2498)
    {
        float _2576 = fma(_2540, _2566, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _2572 = _2576;
    }
    float _2578 = _2572;
    float _2580 = _2578;
    if (!_2498)
    {
        _2568 = _2488;
    }
    float _2582 = _2568;
    float _2584 = _2582;
    if (_2498)
    {
        float _2586 = _2556 + (-1.0);
        _2550 = _2586;
    }
    float _2588 = _2550;
    float _2590 = _2588;
    if (_2498)
    {
        float _2592 = _2520 * _2578;
        _2332 = _2592;
    }
    float _2594 = _2332;
    if (!_2498)
    {
        _2522 = _2486;
    }
    float _2596 = _2522;
    float _2598 = _2596;
    if (_2498)
    {
        float _2600 = _2588 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2512 = _2600;
    }
    float _2602 = _2512;
    if (_2498)
    {
        float _2604 = _2486 * _2594;
        _2598 = _2604;
    }
    float _2606 = _2598;
    if (!_2498)
    {
        _2580 = _2562;
    }
    float _2608 = _2580;
    float _2610 = _2608;
    if (_2498)
    {
        float _2612 = _2488 * _2594;
        _2584 = _2612;
    }
    float _2614 = _2584;
    if (_2498)
    {
        float _2616 = fma(_2562, _2556, _2602);
        _2610 = _2616;
    }
    float _2618 = _2610;
    if (_2498)
    {
        float _2620 = _2606 * _2606;
        _2574 = _2620;
    }
    float _2622 = _2574;
    if (!_2498)
    {
        _2590 = _2492;
    }
    float _2624 = _2590;
    float _2626 = _2624;
    if (_2498)
    {
        float _2628 = _2614 * _2614;
        _2626 = _2628;
    }
    float _2630 = _2626;
    float _2632 = _2452 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _2634 = fma(_2618, _2618, _2622);
    float _2636 = _2452 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2638 = fma(_2454, (*spvDescriptorSet0.vp_c8)._m0[2].x, _2632);
    float _2640 = _2634 + _2630;
    float _2642 = _2452 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2644 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _2646 = fma(_2482, (*spvDescriptorSet0.vp_c15)._m0[23].w, _2644);
    float _2648 = precise::clamp(_2646, 0.0, 1.0);
    float _2650 = fma(_2456, (*spvDescriptorSet0.vp_c8)._m0[2].z, _2638);
    float _2652 = rsqrt(_2640);
    float _2654 = _2452 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _2656 = -_2648;
    float _2658 = _2656 + 1.0;
    float _2660 = fma(_2454, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2642);
    float _2662 = _2650 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _2664 = fma(_2454, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2636);
    float _2666 = fma(_2454, (*spvDescriptorSet0.vp_c8)._m0[3].x, _2654);
    float _2668 = fma(_2456, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2660);
    float _2670 = abs(_2658);
    float _2672 = log2(_2670);
    float _2674 = fma(_2456, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2664);
    float _2676 = fma(_2456, (*spvDescriptorSet0.vp_c8)._m0[3].z, _2666);
    float _2678 = _2668 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _2680 = _2662 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _2682 = _2674 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2684 = _2678 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _2686 = _2652 * _2606;
    float _2688 = _2652 * _2618;
    float _2690 = _2652 * _2614;
    float _2692 = fma(_2682, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2684);
    float _2694 = _2686 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _2696 = _2676 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _2698 = -_2680;
    float _2700 = fma(_2698, _2472, 1.0);
    float _2702 = fma(_2662, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2692);
    float _2704 = _2672 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _2706 = -_2694;
    float _2708 = fma(_2688, (*spvDescriptorSet0.vp_c15)._m0[21].y, _2706);
    float _2710 = _2678 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2712 = fma(_2696, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2702);
    float _2714 = log2(_2700);
    float _2716 = -_2690;
    float _2718 = fma(_2716, (*spvDescriptorSet0.vp_c15)._m0[21].z, _2708);
    float _2720 = _2678 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2722 = fma(_2682, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2710);
    float _2724 = _2688 + 1.0;
    float _2726 = fma(_2718, -0.5, 0.5);
    float _2728 = fma(_2682, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2720);
    float _2730 = fma(_2718, 0.5, 0.5);
    float _2732 = exp2(_2704);
    float _2734 = fma(_2662, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2722);
    float _2736 = fma(_2662, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2728);
    float _2738 = fma(_2730, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _2740 = fma(_2696, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2736);
    float _2742 = fma(_2730, _2738, -0.212114393711090087890625);
    float _2744 = 1.0 / _2712;
    float _2746 = _2714 * 0.693147182464599609375;
    float _2748 = fma(_2730, _2742, 1.570728778839111328125);
    float _2750 = _2746 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _2752 = sqrt(_2726);
    float _2754 = -_2688;
    float _2756 = fma(_2732, _2724, _2754);
    float _2758 = fma(_2696, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2734);
    float _2760 = fma(_2756, 0.5, 0.5);
    float _2762 = _2758 * _2744;
    float _2764 = _2740 * _2744;
    float _2766 = fma(_2762, 0.5, 0.5);
    float _2768 = fma(_2764, -0.5, 0.5);
    float _2770 = _2752 * 0.636619746685028076171875;
    float3 _7110 = float3(_2766, _2768, _2750);
    float _2772 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_7110, float3(0.0), isnan(_7110)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_7110, float3(0.0), isnan(_7110)), level(0.0)).x;
    float3 _7121 = float3(_2766, _2768, _2750);
    float4 _2775 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_7121, float3(0.0), isnan(_7121)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_7121, float3(0.0), isnan(_7121)), level(0.0)).xyzw;
    float _2777 = _2775.x;
    float _2779 = _2775.y;
    float _2781 = _2775.z;
    float _2783 = _2775.w;
    float _2785 = -_2748;
    float _2787 = fma(_2770, _2785, 1.0);
    float2 _7143 = float2(_2787, _2760);
    float3 _2791 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_7143, float2(0.0), isnan(_7143)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_7143, float2(0.0), isnan(_7143)), level(0.0)).xyz;
    float _2793 = _2791.x;
    float _2795 = _2791.y;
    float _2797 = _2791.z;
    float _2799 = _1916 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _2801 = _1916 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    bool _2803 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _2805 = isnan(0.5);
    bool _2807 = _2803 || _2805;
    bool _2809 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _2811 = _2807 || _2809;
    float _2813 = fma(_1924, (*spvDescriptorSet0.vp_c8)._m0[11].x, _2799);
    float _2815 = fma(_1924, (*spvDescriptorSet0.vp_c8)._m0[10].x, _2801);
    float _2817 = fma(_1936, (*spvDescriptorSet0.vp_c8)._m0[11].z, _2813);
    float _2819 = fma(_1936, (*spvDescriptorSet0.vp_c8)._m0[10].z, _2815);
    float _2821 = _2817 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _2823 = _2819 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _2825 = _2817;
    float _2827 = _2766;
    if (!_2811)
    {
        _1964 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _2829 = _1964;
    float _2831 = 1.0 / _2821;
    float _2833 = _2823 + _2821;
    float _2835 = _2829;
    if (!_2811)
    {
        _251 = (*spvDescriptorSet0.vp_c9)._m0[140].x;
    }
    float _2837 = _251;
    float _2839 = _2837;
    if (!_2811)
    {
        float _2841 = -_2837;
        float _2843 = _2841 + (*spvDescriptorSet0.vp_c9)._m0[140].y;
        _2825 = _2843;
    }
    float _2845 = _2825;
    float _2847 = _2672 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _2849 = _2833 * _2831;
    float _2851 = _2849 * 0.5;
    float _2853 = exp2(_2847);
    float _2855 = _2831;
    if (!_2811)
    {
        float _2857 = -_2829;
        float _2859 = fma(_2851, (*spvDescriptorSet0.vp_c8)._m0[30].w, _2857);
        _2855 = _2859;
    }
    float _2861 = _2855;
    float _2863 = _2678 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    if (_2811)
    {
        _2835 = 1.0;
    }
    float _2865 = _2835;
    float _2867 = _2865;
    if (!_2811)
    {
        float _2869 = 1.0 / _2845;
        _2827 = _2869;
    }
    float _2871 = _2827;
    float _2873 = fma(_2682, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2863);
    float _2875 = fma(_2662, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2873);
    float _2877 = _2861;
    if (!_2811)
    {
        float _2879 = 1.0 / _2861;
        _2877 = _2879;
    }
    float _2881 = _2877;
    float _2883 = -_2853;
    float _2885 = _2883 + 1.0;
    float _2887 = fma(_2696, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2875);
    float _2889 = _2885 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _2891 = _2887 + _2712;
    out.gl_Position.x = _2758;
    out.gl_Position.y = _2740;
    out.gl_Position.z = _2887;
    out.gl_Position.w = _2712;
    if (!_2811)
    {
        float _2893 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _2895 = -_2837;
        float _2897 = fma(_2881, _2893, _2895);
        _2839 = _2897;
    }
    float _2899 = _2839;
    float _2901 = _2891 * 0.5;
    if (!_2811)
    {
        float _2903 = _2899 * _2871;
        float _2905 = precise::clamp(_2903, 0.0, 1.0);
        _2867 = _2905;
    }
    float _2907 = _2867;
    float _2909 = _2907 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    bool _2911 = _2907 > 0.0;
    bool _2913 = isnan(_2907);
    bool _2915 = _2911 || _2913;
    bool _2917 = isnan(0.0);
    bool _2919 = _2915 || _2917;
    out.m_64.z = _2901;
    out.m_64.w = _2712;
    float _2921 = _2909 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    out.m_45.x = _2921;
    float _2923 = _2889 * _2772;
    float _2925 = -_2889;
    float _2927 = _2925 + 1.0;
    float _2929 = _2783 * _2923;
    float _2931 = _2797 * _2923;
    float _2933 = fma(_2793, _2929, _2777);
    float _2935 = fma(_2795, _2929, _2779);
    float _2937 = _2783 * _2927;
    float _2939 = fma(_2783, _2931, _2781);
    out.m_66.x = _2933;
    out.m_66.y = _2935;
    out.m_66.z = _2939;
    out.m_66.w = _2937;
    if (_2919)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_54.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_54.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_54.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_54.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_60.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_60.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_60.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_60.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_58.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_58.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_58.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_58.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 32, 0u); dm_cw(dm_gs, dm_p, 33, 0u); dm_cw(dm_gs, dm_p, 34, 0u); dm_cw(dm_gs, dm_p, 35, 0x3f800000u); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    out.m_45.x = 0.0;
    float _2941 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _2941;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_54.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_54.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_54.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_54.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_60.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_60.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_60.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_60.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_58.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_58.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_58.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_58.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 32, 0u); dm_cw(dm_gs, dm_p, 33, 0u); dm_cw(dm_gs, dm_p, 34, 0u); dm_cw(dm_gs, dm_p, 35, 0x3f800000u); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

